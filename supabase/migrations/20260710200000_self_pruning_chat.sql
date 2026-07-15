-- =====================================================================================
-- SELF-PRUNING CHAT SYSTEM (PHASE 1) — FINAL, VERIFIED AGAINST LIVE SCHEMA
-- Includes: rolling 25-message cap, 7-day expiry, interest-gated RLS (mutual
-- accept required to message), orphan-chat hardening, and text-only enforcement
-- (no images/video/gif/files, DB-level).
-- Safe to run as-is: every statement is idempotent (IF NOT EXISTS / OR REPLACE /
-- DROP POLICY IF EXISTS / ON CONFLICT / guarded DO blocks), so re-running this
-- file is harmless even if it was already partially or fully applied.
-- =====================================================================================

-- Guard: pg_cron is already enabled on this project (used by
-- wedring-daily-distribution / wedring-subscription-expiry), so this is a no-op
-- safety net, not a first-time enable.
create extension if not exists pg_cron;

begin;

-- =====================================================================================
-- 1. SCHEMA ADDITIONS
-- =====================================================================================

-- Belt-and-braces checks — these columns already exist on `chats` in your schema
-- (last_message_text/at from 20260701120200), so these are no-ops that just
-- guarantee the migration is self-contained if ever run against a fresh DB.
alter table public.chats add column if not exists message_count int not null default 0;
alter table public.chats add column if not exists interest_id uuid references public.interests(id) on delete set null;
alter table public.chats add column if not exists last_message_text text;
alter table public.chats add column if not exists last_message_at timestamptz;

-- Admin-tunable chat constants
create table if not exists public.chat_config (
  key text primary key,
  value int not null,
  updated_at timestamptz not null default now()
);

insert into public.chat_config (key, value) values
  ('message_cap', 25),
  ('retention_days', 7)
on conflict (key) do nothing;

-- RLS for config
alter table public.chat_config enable row level security;

drop policy if exists chat_config_read on public.chat_config;
create policy chat_config_read on public.chat_config for select using (true);

drop policy if exists chat_config_admin on public.chat_config;
create policy chat_config_admin on public.chat_config for all using (is_admin()) with check (is_admin());

-- Enable full row data in DELETE replication payloads (needed for Realtime UI updates)
alter table public.messages replica identity full;

-- =====================================================================================
-- 1B. TEXT-ONLY MESSAGE ENFORCEMENT
-- =====================================================================================
-- Product rule: users can only send plain text messages — no images, video, gifs,
-- or files of any kind. The app UI already only offers a text input, but nothing
-- in the database currently stops a modified/malicious client from inserting
-- message_type='image' (or similar) directly via the API. This closes that gap
-- at the source of truth so it can never be bypassed client-side.

-- Pre-cleanup: normalize any pre-existing rows first, so the new CHECK
-- constraints below don't fail validation against old/seed data.
update public.messages set message_type = 'text' where message_type is distinct from 'text';
delete from public.messages where content is null or char_length(trim(content)) = 0;
update public.messages set content = left(content, 2000) where char_length(content) > 2000;

-- Add constraints idempotently (Postgres has no "ADD CONSTRAINT IF NOT EXISTS").
do $$
begin
  if not exists (
    select 1 from pg_constraint where conname = 'messages_type_text_only'
  ) then
    alter table public.messages
      add constraint messages_type_text_only check (message_type = 'text');
  end if;

  if not exists (
    select 1 from pg_constraint where conname = 'messages_content_not_blank'
  ) then
    alter table public.messages
      add constraint messages_content_not_blank
      check (char_length(trim(content)) > 0 and char_length(content) <= 2000);
  end if;
end $$;

-- =====================================================================================
-- 2. DETERMINISTIC BACKFILL
-- =====================================================================================

-- Backfill interest_id for existing chats, picking the most recently accepted
-- interest for each participant pair (handles multiple accept/revoke cycles).
update public.chats c
set interest_id = sub.interest_id
from (
  select distinct on (
    least(i.sender_id, i.receiver_id),
    greatest(i.sender_id, i.receiver_id)
  )
    least(i.sender_id, i.receiver_id) as p1,
    greatest(i.sender_id, i.receiver_id) as p2,
    i.id as interest_id
  from public.interests i
  where i.status = 'accepted'
  order by
    least(i.sender_id, i.receiver_id),
    greatest(i.sender_id, i.receiver_id),
    i.updated_at desc
) sub
where c.participant_1 = sub.p1
  and c.participant_2 = sub.p2
  and c.interest_id is null;

-- Backfill message_count from actual rows
update public.chats c
set message_count = (select count(*) from public.messages m where m.chat_id = c.id);

-- =====================================================================================
-- 3. UPDATED AUTO-CHAT TRIGGER (function body only — trigger binding is unchanged,
--    Postgres re-resolves CREATE OR REPLACE FUNCTION automatically)
-- =====================================================================================

create or replace function public.trg_fn_after_interest_accepted()
returns trigger
language plpgsql
security definer
set search_path = public
as $$
declare
  v_p1 uuid;
  v_p2 uuid;
begin
  if new.status = 'accepted' and (old.status is null or old.status <> 'accepted') then
    if new.sender_id < new.receiver_id then
      v_p1 := new.sender_id;
      v_p2 := new.receiver_id;
    else
      v_p1 := new.receiver_id;
      v_p2 := new.sender_id;
    end if;

    insert into public.chats (participant_1, participant_2, interest_id)
    values (v_p1, v_p2, new.id)
    on conflict (participant_1, participant_2)
    do update set interest_id = new.id, is_active = true;
  end if;
  return new;
end;
$$;

-- =====================================================================================
-- 3B. HARDEN fn_create_or_get_chat — close the orphan-chat gap
-- =====================================================================================
-- Previously this RPC created chats without linking interest_id. In the current
-- app flow the trigger above always creates the chat first (interest accept
-- happens before the "Chat" button appears), so this RPC normally just finds
-- the already-linked chat. This hardening makes it safe even if that ever
-- changes: if it must create a new chat, it now looks up the latest accepted
-- interest between the two users and links it — so a chat can never be created
-- in an unwritable (readable-but-no-interest_id) state via this path.

create or replace function public.fn_create_or_get_chat(p_other_user_id uuid)
returns uuid
language plpgsql
security definer
set search_path = public
as $$
declare
  v_user uuid := auth.uid();
  v_p1 uuid;
  v_p2 uuid;
  v_chat_id uuid;
  v_interest_id uuid;
begin
  if v_user is null then
    raise exception 'Not authenticated';
  end if;
  if v_user = p_other_user_id then
    raise exception 'Cannot chat with yourself';
  end if;

  -- Canonical ordering
  if v_user < p_other_user_id then
    v_p1 := v_user;
    v_p2 := p_other_user_id;
  else
    v_p1 := p_other_user_id;
    v_p2 := v_user;
  end if;

  -- Try to find existing
  select id into v_chat_id from public.chats
  where participant_1 = v_p1 and participant_2 = v_p2;

  if v_chat_id is not null then
    return v_chat_id;
  end if;

  -- Look up the latest accepted interest between these two users, if any,
  -- so a freshly created chat is never orphaned/unwritable.
  select id into v_interest_id
  from public.interests
  where status = 'accepted'
    and ((sender_id = v_user and receiver_id = p_other_user_id)
      or (sender_id = p_other_user_id and receiver_id = v_user))
  order by updated_at desc
  limit 1;

  -- Create new
  insert into public.chats (participant_1, participant_2, interest_id)
  values (v_p1, v_p2, v_interest_id)
  returning id into v_chat_id;

  return v_chat_id;
end;
$$;

-- =====================================================================================
-- 4. HARDENED RLS (SELECT + INSERT)
-- =====================================================================================

drop policy if exists messages_select on public.messages;
create policy messages_select on public.messages for select using (
  exists (
    select 1 from public.chats c
    left join public.interests i on i.id = c.interest_id
    where c.id = messages.chat_id
      and (c.participant_1 = auth.uid() or c.participant_2 = auth.uid())
      and c.is_active = true
      and (c.interest_id is null or i.status = 'accepted')
  )
  or is_admin()
);

drop policy if exists messages_insert on public.messages;
create policy messages_insert on public.messages for insert with check (
  auth.uid() = sender_id
  and exists (
    select 1 from public.chats c
    join public.interests i on i.id = c.interest_id
    where c.id = chat_id
      and (c.participant_1 = auth.uid() or c.participant_2 = auth.uid())
      and c.is_active = true
      and i.status = 'accepted'
  )
);

-- =====================================================================================
-- 5. ROLLING MESSAGE-CAP TRIGGER
-- =====================================================================================

create or replace function public.trg_fn_after_message_insert()
returns trigger
language plpgsql
security definer
set search_path = public
as $$
declare
  v_cap int;
  v_count int;
begin
  select value into v_cap from public.chat_config where key = 'message_cap';
  if v_cap is null then v_cap := 25; end if;

  -- Increment count + update last message preview
  update public.chats
  set message_count = message_count + 1,
      last_message_text = NEW.content,
      last_message_at = NEW.created_at
  where id = NEW.chat_id
  returning message_count into v_count;

  -- Bulk-prune if over cap (handles admin lowering the cap after chats already
  -- exceed the new lower value, not just the +1 steady-state case)
  if v_count > v_cap then
    delete from public.messages
    where id in (
      select id from public.messages
      where chat_id = NEW.chat_id
      order by created_at asc
      limit (v_count - v_cap)
    );
    update public.chats set message_count = v_cap where id = NEW.chat_id;
  end if;

  return NEW;
end;
$$;

drop trigger if exists trg_after_message_insert on public.messages;
create trigger trg_after_message_insert
  after insert on public.messages
  for each row
  execute function trg_fn_after_message_insert();

-- =====================================================================================
-- 6. 7-DAY EXPIRY CRON JOB
-- =====================================================================================

create or replace function public.fn_prune_expired_messages()
returns void
language plpgsql
security definer
set search_path = public
as $$
declare
  v_days int;
begin
  select value into v_days from public.chat_config where key = 'retention_days';
  if v_days is null then v_days := 7; end if;

  delete from public.messages
  where created_at < now() - make_interval(days => v_days);

  -- Resync all affected conversation counts to reality
  update public.chats c
  set message_count = (select count(*) from public.messages m where m.chat_id = c.id);
end;
$$;

select cron.schedule(
  'wedring-chat-message-prune',
  '0 2 * * *',
  $$ select public.fn_prune_expired_messages(); $$
);

commit;