-- =====================================================================================
-- CHAT TABLES, MISSING HELPER RPCs, AND AUTO-CHAT TRIGGER
-- Runs after the main schema (20260701120000) and subscription lifecycle (20260701120150).
-- =====================================================================================

-- =====================================================================================
-- SECTION 1 — CHAT TABLES
-- =====================================================================================

create table if not exists chats (
  id uuid primary key default gen_random_uuid(),
  participant_1 uuid not null references auth.users(id) on delete cascade,
  participant_2 uuid not null references auth.users(id) on delete cascade,
  is_active boolean not null default true,
  last_message_text text,
  last_message_at timestamptz,
  created_at timestamptz not null default now(),
  -- Canonical ordering: always store the smaller UUID as participant_1
  -- so that the unique constraint catches both directions.
  check (participant_1 < participant_2),
  unique (participant_1, participant_2)
);

create table if not exists messages (
  id uuid primary key default gen_random_uuid(),
  chat_id uuid not null references chats(id) on delete cascade,
  sender_id uuid not null references auth.users(id) on delete cascade,
  content text not null,
  message_type text not null default 'text', -- 'text', 'image', 'system'
  is_read boolean not null default false,
  created_at timestamptz not null default now()
);

-- Indexes
create index if not exists idx_chats_participant_1 on chats(participant_1);
create index if not exists idx_chats_participant_2 on chats(participant_2);
create index if not exists idx_chats_last_message on chats(last_message_at desc nulls last);
create index if not exists idx_messages_chat on messages(chat_id, created_at desc);
create index if not exists idx_messages_unread on messages(chat_id, is_read) where is_read = false;

-- =====================================================================================
-- SECTION 2 — CHAT RLS
-- =====================================================================================

alter table chats enable row level security;

drop policy if exists chats_select on chats;
create policy chats_select on chats for select using (
  auth.uid() = participant_1 or auth.uid() = participant_2 or is_admin()
);

drop policy if exists chats_insert on chats;
create policy chats_insert on chats for insert with check (
  auth.uid() = participant_1 or auth.uid() = participant_2
);

drop policy if exists chats_update on chats;
create policy chats_update on chats for update using (
  auth.uid() = participant_1 or auth.uid() = participant_2 or is_admin()
);

drop policy if exists chats_delete on chats;
create policy chats_delete on chats for delete using (is_admin());

alter table messages enable row level security;

drop policy if exists messages_select on messages;
create policy messages_select on messages for select using (
  exists (
    select 1 from chats c
    where c.id = messages.chat_id
      and (c.participant_1 = auth.uid() or c.participant_2 = auth.uid())
  )
  or is_admin()
);

drop policy if exists messages_insert on messages;
create policy messages_insert on messages for insert with check (
  auth.uid() = sender_id
  and exists (
    select 1 from chats c
    where c.id = chat_id
      and (c.participant_1 = auth.uid() or c.participant_2 = auth.uid())
  )
);

drop policy if exists messages_update on messages;
create policy messages_update on messages for update using (
  -- Only allow marking messages as read (receiver can update is_read)
  exists (
    select 1 from chats c
    where c.id = messages.chat_id
      and (c.participant_1 = auth.uid() or c.participant_2 = auth.uid())
  )
  or is_admin()
);

drop policy if exists messages_delete on messages;
create policy messages_delete on messages for delete using (is_admin());

-- Enable Realtime on messages so the app gets live updates
alter publication supabase_realtime add table messages;

-- =====================================================================================
-- SECTION 3 — CHAT HELPER: CREATE OR GET CHAT
-- =====================================================================================

-- Creates a chat between two users (or returns the existing one).
-- Enforces the canonical participant_1 < participant_2 ordering.
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
  select id into v_chat_id from chats
  where participant_1 = v_p1 and participant_2 = v_p2;

  if v_chat_id is not null then
    return v_chat_id;
  end if;

  -- Create new
  insert into chats (participant_1, participant_2)
  values (v_p1, v_p2)
  returning id into v_chat_id;

  return v_chat_id;
end;
$$;

grant execute on function public.fn_create_or_get_chat(uuid) to authenticated;

-- =====================================================================================
-- SECTION 4 — AUTO-CREATE CHAT ON INTEREST ACCEPTANCE
-- =====================================================================================

-- When an interest is accepted, automatically create a chat between the two users.
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
    -- Canonical ordering
    if new.sender_id < new.receiver_id then
      v_p1 := new.sender_id;
      v_p2 := new.receiver_id;
    else
      v_p1 := new.receiver_id;
      v_p2 := new.sender_id;
    end if;

    insert into chats (participant_1, participant_2)
    values (v_p1, v_p2)
    on conflict (participant_1, participant_2) do nothing;
  end if;

  return new;
end;
$$;

drop trigger if exists trg_after_interest_accepted on interests;
create trigger trg_after_interest_accepted
  after update of status on interests
  for each row
  when (new.status = 'accepted')
  execute function trg_fn_after_interest_accepted();

-- =====================================================================================
-- SECTION 5 — MISSING HELPER RPCs
-- =====================================================================================

-- ---- get_profiles_from_pool: the RPC the app expects for fetching distributed profiles
-- Returns full profile data for profiles distributed to the calling user in a given section.
create or replace function public.get_profiles_from_pool(
  p_user_id uuid,
  p_section distribution_section_enum,
  p_limit int default 20,
  p_offset int default 0
)
returns table (
  id uuid,
  full_name text,
  gender gender_enum,
  dob date,
  height_cm int,
  weight_kg numeric,
  marital_status marital_status_enum,
  physical_status physical_status_enum,
  about_me text,
  religion_id bigint,
  caste_id bigint,
  sub_caste_id bigint,
  sub_caste_text text,
  education_level_id bigint,
  degree text,
  college_name text,
  occupation_id bigint,
  is_working boolean,
  annual_income numeric,
  country_id bigint,
  state_id bigint,
  district_id bigint,
  city_id bigint,
  profile_completion_percent int,
  created_at timestamptz,
  updated_at timestamptz,
  distributed_at timestamptz,
  compatibility_score numeric
)
language plpgsql
security definer
set search_path = public
as $$
begin
  return query
  select
    p.id,
    p.full_name,
    p.gender,
    p.dob,
    p.height_cm,
    p.weight_kg,
    p.marital_status,
    p.physical_status,
    p.about_me,
    p.religion_id,
    p.caste_id,
    p.sub_caste_id,
    p.sub_caste_text,
    p.education_level_id,
    p.degree,
    p.college_name,
    p.occupation_id,
    p.is_working,
    p.annual_income,
    p.country_id,
    p.state_id,
    p.district_id,
    p.city_id,
    p.profile_completion_percent,
    p.created_at,
    p.updated_at,
    dp.distributed_at,
    coalesce(cs.score, 0) as compatibility_score
  from distributed_profiles dp
  join profiles p on p.id = dp.profile_id
  left join compatibility_scores cs
    on cs.user_id = p_user_id and cs.target_user_id = dp.profile_id
  where dp.user_id = p_user_id
    and dp.section = p_section
    and p.is_active = true
    and p.is_suspended = false
  order by dp.order_index desc
  limit p_limit
  offset p_offset;
end;
$$;

grant execute on function public.get_profiles_from_pool(uuid, distribution_section_enum, int, int) to authenticated;

-- ---- check_user_exists: checks if an email or phone already exists in auth.users
create or replace function public.check_user_exists(p_email text, p_phone text)
returns boolean
language plpgsql
security definer
set search_path = public
as $$
begin
  return exists (
    select 1 from auth.users
    where (p_email <> '' and email = p_email)
       or (p_phone <> '' and phone = p_phone)
  );
end;
$$;

grant execute on function public.check_user_exists(text, text) to anon, authenticated;

-- =====================================================================================
-- DONE
-- =====================================================================================
