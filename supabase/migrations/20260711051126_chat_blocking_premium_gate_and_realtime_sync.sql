-- ============================================================
-- Wedring Matrimony — Chat Blocking, Premium-Gated Messaging,
-- and Realtime Sync for Interests/Chats/Blocks
--
-- Applied live to Supabase project "matrimony" (ref: pcdtgwelrwyvtqixqufc)
-- via Supabase MCP as migration version 20260711051126.
-- This file exists so the migration is tracked in source control and can
-- be re-applied to another environment (staging, a fresh branch, etc).
-- DO NOT re-run this manually against the same project — it is already live.
-- ============================================================

-- 1. BLOCKED USERS TABLE
create table if not exists public.blocked_users (
  id uuid primary key default gen_random_uuid(),
  blocker_id uuid not null references auth.users(id) on delete cascade,
  blocked_id uuid not null references auth.users(id) on delete cascade,
  created_at timestamptz not null default now(),
  constraint blocked_users_no_self_block check (blocker_id <> blocked_id),
  constraint blocked_users_unique_pair unique (blocker_id, blocked_id)
);

create index if not exists idx_blocked_users_blocker on public.blocked_users(blocker_id);
create index if not exists idx_blocked_users_blocked on public.blocked_users(blocked_id);

alter table public.blocked_users enable row level security;

drop policy if exists blocked_users_select on public.blocked_users;
create policy blocked_users_select on public.blocked_users
  for select using (auth.uid() = blocker_id or auth.uid() = blocked_id or is_admin());

drop policy if exists blocked_users_insert on public.blocked_users;
create policy blocked_users_insert on public.blocked_users
  for insert with check (auth.uid() = blocker_id);

drop policy if exists blocked_users_delete on public.blocked_users;
create policy blocked_users_delete on public.blocked_users
  for delete using (auth.uid() = blocker_id or is_admin());

-- 2. HELPER: bidirectional block check
create or replace function public.fn_is_blocked(p_user_a uuid, p_user_b uuid)
returns boolean
language sql
stable
security definer
set search_path to 'public'
as $$
  select exists (
    select 1 from public.blocked_users
    where (blocker_id = p_user_a and blocked_id = p_user_b)
       or (blocker_id = p_user_b and blocked_id = p_user_a)
  );
$$;

-- 3. RPCs: block / unblock (mirrors fn_send_interest / fn_respond_interest pattern)
create or replace function public.fn_block_user(p_target_user_id uuid)
returns void
language plpgsql
security definer
set search_path to 'public'
as $$
declare
  v_user uuid := auth.uid();
begin
  if v_user is null then
    raise exception 'Not authenticated';
  end if;
  if v_user = p_target_user_id then
    raise exception 'Cannot block yourself';
  end if;

  insert into public.blocked_users (blocker_id, blocked_id)
  values (v_user, p_target_user_id)
  on conflict (blocker_id, blocked_id) do nothing;
end;
$$;

create or replace function public.fn_unblock_user(p_target_user_id uuid)
returns void
language plpgsql
security definer
set search_path to 'public'
as $$
declare
  v_user uuid := auth.uid();
begin
  if v_user is null then
    raise exception 'Not authenticated';
  end if;

  delete from public.blocked_users
  where blocker_id = v_user and blocked_id = p_target_user_id;
end;
$$;

grant execute on function public.fn_is_blocked(uuid, uuid) to authenticated;
grant execute on function public.fn_block_user(uuid) to authenticated;
grant execute on function public.fn_unblock_user(uuid) to authenticated;

-- 4. Guard fn_send_interest so blocked users can't re-initiate contact
create or replace function public.fn_send_interest(p_receiver_id uuid)
returns uuid
language plpgsql
security definer
set search_path to 'public'
as $function$
declare
  v_user uuid := auth.uid();
  v_remaining int;
  v_interest_id uuid;
  v_existing_status text;
begin
  if v_user is null then
    raise exception 'Not authenticated';
  end if;
  if v_user = p_receiver_id then
    raise exception 'Cannot send interest to yourself';
  end if;

  if public.fn_is_blocked(v_user, p_receiver_id) then
    raise exception 'Cannot send interest: user is blocked';
  end if;

  select status into v_existing_status from interests where sender_id = v_user and receiver_id = p_receiver_id;
  if v_existing_status is not null then
    raise exception 'Interest already %', v_existing_status;
  end if;

  select interest_credits_remaining into v_remaining
  from user_subscriptions where user_id = v_user and is_active = true
  for update;

  if v_remaining is null or v_remaining < 1 then
    raise exception 'Insufficient interest credits or no active premium plan';
  end if;

  update user_subscriptions
  set interest_credits_remaining = interest_credits_remaining - 1, updated_at = now()
  where user_id = v_user and is_active = true;

  insert into interest_credit_transactions (user_id, target_user_id, credits_used)
  values (v_user, p_receiver_id, 1);

  insert into interests (sender_id, receiver_id, status)
  values (v_user, p_receiver_id, 'sent')
  returning id into v_interest_id;

  delete from distributed_profiles where user_id = v_user and profile_id = p_receiver_id;

  return v_interest_id;
end;
$function$;

-- 5. messages_insert RLS: require (a) mutual-accepted interest [existing],
--    (b) sender has an active non-free premium plan, (c) neither side has blocked the other
drop policy if exists messages_insert on public.messages;

create policy messages_insert on public.messages
for insert
with check (
  auth.uid() = sender_id
  and exists (
    select 1
    from public.chats c
    join public.interests i on i.id = c.interest_id
    where c.id = messages.chat_id
      and (c.participant_1 = auth.uid() or c.participant_2 = auth.uid())
      and c.is_active = true
      and i.status = 'accepted'
  )
  and exists (
    select 1
    from public.user_subscriptions us
    join public.membership_plans mp on mp.id = us.plan_id
    where us.user_id = auth.uid()
      and us.is_active = true
      and mp.tier <> 'free'
      and (us.expires_at is null or us.expires_at > now())
  )
  and not exists (
    select 1
    from public.chats c
    join public.blocked_users b
      on (b.blocker_id = c.participant_1 and b.blocked_id = c.participant_2)
      or (b.blocker_id = c.participant_2 and b.blocked_id = c.participant_1)
    where c.id = messages.chat_id
  )
);

-- 6. Realtime: add interests + chats + blocked_users for instant client sync
alter publication supabase_realtime add table public.interests;
alter publication supabase_realtime add table public.chats;
alter publication supabase_realtime add table public.blocked_users;
