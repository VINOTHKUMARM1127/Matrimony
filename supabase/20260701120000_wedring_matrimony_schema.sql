-- =====================================================================================
-- WEDRING MATRIMONY — Supabase schema
-- MERN + Expo (mobile) + Admin panel, Supabase Postgres/Auth/Storage, Razorpay, Cloudflare R2
-- =====================================================================================

-- =====================================================================================
-- SECTION 1 — EXTENSIONS
-- =====================================================================================
create extension if not exists pgcrypto;   -- gen_random_uuid()
create extension if not exists pg_cron;    -- nightly distribution job (Section: cron)

-- =====================================================================================
-- SECTION 2 — ENUMS
-- =====================================================================================
do $$ begin
  create type membership_tier_enum as enum ('free','silver','gold','platinum');
exception when duplicate_object then null; end $$;

do $$ begin
  create type gender_enum as enum ('male','female');
exception when duplicate_object then null; end $$;

do $$ begin
  create type marital_status_enum as enum ('never_married','divorced','widowed','awaiting_divorce');
exception when duplicate_object then null; end $$;

do $$ begin
  create type physical_status_enum as enum ('normal','physically_challenged');
exception when duplicate_object then null; end $$;

do $$ begin
  create type creating_for_enum as enum ('self','son','daughter','brother','sister','relative','friend');
exception when duplicate_object then null; end $$;

do $$ begin
  create type family_status_enum as enum ('middle_class','upper_middle_class','rich','affluent');
exception when duplicate_object then null; end $$;

do $$ begin
  create type family_type_enum as enum ('nuclear','joint');
exception when duplicate_object then null; end $$;

do $$ begin
  create type family_values_enum as enum ('traditional','moderate','liberal');
exception when duplicate_object then null; end $$;

do $$ begin
  create type dosham_enum as enum ('none','manglik','chevvai','other');
exception when duplicate_object then null; end $$;

do $$ begin
  create type food_habit_enum as enum ('vegetarian','non_vegetarian','eggetarian','vegan');
exception when duplicate_object then null; end $$;

do $$ begin
  create type habit_enum as enum ('no','occasionally','yes');
exception when duplicate_object then null; end $$;

do $$ begin
  create type payment_status_enum as enum ('pending','success','failed','refunded');
exception when duplicate_object then null; end $$;

do $$ begin
  create type credit_type_enum as enum ('phone','horoscope');
exception when duplicate_object then null; end $$;

do $$ begin
  create type distribution_section_enum as enum ('all_matches','daily_updates');
exception when duplicate_object then null; end $$;

do $$ begin
  create type distribution_type_enum as enum ('initial','daily','manual');
exception when duplicate_object then null; end $$;

do $$ begin
  create type interest_status_enum as enum ('sent','accepted','rejected');
exception when duplicate_object then null; end $$;

-- =====================================================================================
-- SECTION 2B — MASTER / LOOKUP TABLES
-- (public, read-only-to-users reference data used across registration + search)
-- =====================================================================================

create table if not exists religions (
  id bigserial primary key,
  name text not null unique
);

create table if not exists castes (
  id bigserial primary key,
  religion_id bigint not null references religions(id) on delete cascade,
  name text not null,
  unique (religion_id, name)
);

create table if not exists sub_castes (
  id bigserial primary key,
  caste_id bigint not null references castes(id) on delete cascade,
  name text not null,
  unique (caste_id, name)
);

create table if not exists countries (
  id bigserial primary key,
  name text not null unique,
  iso_code text
);

create table if not exists states (
  id bigserial primary key,
  country_id bigint not null references countries(id) on delete cascade,
  name text not null,
  unique (country_id, name)
);

create table if not exists districts (
  id bigserial primary key,
  state_id bigint not null references states(id) on delete cascade,
  name text not null,
  unique (state_id, name)
);

create table if not exists cities (
  id bigserial primary key,
  district_id bigint not null references districts(id) on delete cascade,
  name text not null,
  unique (district_id, name)
);

create table if not exists occupations (
  id bigserial primary key,
  name text not null unique
);

create table if not exists education_levels (
  id bigserial primary key,
  name text not null unique,
  sort_order int not null default 0
);

create table if not exists rasi (
  id bigserial primary key,
  name text not null unique
);

create table if not exists nakshatra (
  id bigserial primary key,
  name text not null unique
);

create table if not exists lagnam (
  id bigserial primary key,
  name text not null unique
);

create table if not exists gothram (
  id bigserial primary key,
  name text not null unique
);

create table if not exists mother_tongues (
  id bigserial primary key,
  name text not null unique
);

-- =====================================================================================
-- SECTION 3 — ADMIN, CORE USER TABLES
-- =====================================================================================

create table if not exists admin_users (
  id uuid primary key references auth.users(id) on delete cascade,
  full_name text not null,
  role text not null default 'admin' check (role in ('super_admin','admin','support')),
  is_active boolean not null default true,
  created_at timestamptz not null default now()
);

create table if not exists membership_plans (
  id uuid primary key default gen_random_uuid(),
  tier membership_tier_enum not null,
  name text not null,
  price numeric(10,2) not null default 0,
  duration_days int,                     -- NULL = unlimited (used by Free tier)
  contact_credits int not null default 0,
  interest_credits int not null default 0,
  is_active boolean not null default true,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now()
);

-- only one active plan per tier at a time (admin can deactivate + create a new one to "edit")
create unique index if not exists idx_one_active_plan_per_tier
  on membership_plans (tier) where (is_active = true);

create table if not exists profiles (
  id uuid primary key references auth.users(id) on delete cascade,
  full_name text not null,
  gender gender_enum not null,
  dob date not null check (dob <= (current_date - interval '18 years')::date),
  height_cm int not null check (height_cm between 100 and 250),
  weight_kg numeric(5,2),
  marital_status marital_status_enum not null default 'never_married',
  physical_status physical_status_enum not null default 'normal',
  about_me text,

  religion_id bigint not null references religions(id),
  caste_id bigint references castes(id),
  sub_caste_id bigint references sub_castes(id),
  sub_caste_text text,

  education_level_id bigint not null references education_levels(id),
  degree text not null,
  college_name text,
  occupation_id bigint not null references occupations(id),
  is_working boolean not null default true,
  annual_income numeric(12,2),
  check (is_working = false or annual_income is not null),

  country_id bigint not null references countries(id),
  state_id bigint not null references states(id),
  district_id bigint not null references districts(id),
  city_id bigint not null references cities(id),

  is_active boolean not null default true,
  is_suspended boolean not null default false,
  profile_completion_percent int not null default 0,

  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now()
);

-- Step 1 onboarding data (collected before the auth user / profile even exists)
create table if not exists registration_meta (
  user_id uuid primary key references auth.users(id) on delete cascade,
  creating_for creating_for_enum not null,
  mother_tongue_id bigint references mother_tongues(id),
  created_at timestamptz not null default now()
);

-- Phone number lives separately so it can be RLS-gated behind a contact credit
create table if not exists profile_contact (
  user_id uuid primary key references auth.users(id) on delete cascade,
  mobile_number text not null unique,
  updated_at timestamptz not null default now()
);

create table if not exists user_family (
  user_id uuid primary key references auth.users(id) on delete cascade,
  father_name text,
  mother_name text,
  family_status family_status_enum,
  family_type family_type_enum,
  family_values family_values_enum,
  brothers_count int not null default 0,
  sisters_count int not null default 0,
  updated_at timestamptz not null default now()
);

-- Horoscope: RLS-gated behind a contact credit (type='horoscope'), same pattern as phone
create table if not exists user_horoscope (
  user_id uuid primary key references auth.users(id) on delete cascade,
  rasi_id bigint references rasi(id),
  rasi_text text,
  nakshatra_id bigint references nakshatra(id),
  nakshatra_text text,
  lagnam_id bigint references lagnam(id),
  lagnam_text text,
  gothram_id bigint references gothram(id),
  gothram_text text,
  dosham dosham_enum not null default 'none',
  notes text,
  updated_at timestamptz not null default now()
);

create table if not exists user_lifestyle (
  user_id uuid primary key references auth.users(id) on delete cascade,
  languages text[] not null default '{}',
  hobbies text[] not null default '{}',
  interests text[] not null default '{}',
  food_habit food_habit_enum,
  drinking_habit habit_enum not null default 'no',
  smoking_habit habit_enum not null default 'no',
  updated_at timestamptz not null default now()
);

create table if not exists partner_preferences (
  user_id uuid primary key references auth.users(id) on delete cascade,
  min_age int not null,
  max_age int not null,
  min_height_cm int not null,
  max_height_cm int not null,
  religion_id bigint references religions(id),
  caste_id bigint references castes(id),
  education_level_id bigint references education_levels(id),
  occupation_id bigint references occupations(id),
  location_city_id bigint references cities(id),
  food_habit food_habit_enum,
  marital_status marital_status_enum,
  updated_at timestamptz not null default now(),
  check (min_age <= max_age),
  check (min_height_cm <= max_height_cm)
);

create table if not exists profile_photos (
  id uuid primary key default gen_random_uuid(),
  user_id uuid not null references auth.users(id) on delete cascade,
  r2_key text not null,
  thumbnail_key text,
  is_primary boolean not null default false,
  order_index int not null default 0,
  created_at timestamptz not null default now()
);

-- =====================================================================================
-- SECTION 4 — MEMBERSHIP & PAYMENT TABLES
-- =====================================================================================

create table if not exists user_subscriptions (
  id uuid primary key default gen_random_uuid(),
  user_id uuid not null unique references auth.users(id) on delete cascade,
  plan_id uuid not null references membership_plans(id),
  contact_credits_remaining int not null default 0,
  interest_credits_remaining int not null default 0,
  starts_at timestamptz not null default now(),
  expires_at timestamptz,               -- NULL = unlimited (Free tier)
  is_active boolean not null default true,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now()
);

create table if not exists subscription_queue (
  id uuid primary key default gen_random_uuid(),
  user_id uuid not null references auth.users(id) on delete cascade,
  plan_id uuid not null references membership_plans(id),
  payment_id uuid,
  position int not null default 1,
  amount_paid numeric(10,2),
  created_at timestamptz not null default now()
);

create table if not exists subscription_history (
  id uuid primary key default gen_random_uuid(),
  user_id uuid not null references auth.users(id) on delete cascade,
  plan_id uuid references membership_plans(id),
  amount_paid numeric(10,2),
  started_at timestamptz not null default now(),
  expired_at timestamptz,
  reason text,
  created_at timestamptz not null default now()
);

create table if not exists payments (
  id uuid primary key default gen_random_uuid(),
  user_id uuid not null references auth.users(id) on delete cascade,
  plan_id uuid not null references membership_plans(id),
  razorpay_order_id text not null unique,
  razorpay_payment_id text,
  razorpay_signature text,
  amount_paise bigint not null,
  currency text not null default 'INR',
  status payment_status_enum not null default 'pending',
  created_at timestamptz not null default now(),
  confirmed_at timestamptz
);

create table if not exists failed_payments (
  id uuid primary key default gen_random_uuid(),
  user_id uuid references auth.users(id) on delete set null,
  plan_id uuid references membership_plans(id),
  razorpay_order_id text,
  error_code text,
  error_description text,
  created_at timestamptz not null default now()
);

create table if not exists contact_credit_transactions (
  id uuid primary key default gen_random_uuid(),
  user_id uuid not null references auth.users(id) on delete cascade,
  viewed_user_id uuid not null references auth.users(id) on delete cascade,
  type credit_type_enum not null,
  credits_used int not null default 1,
  created_at timestamptz not null default now()
);

create table if not exists interest_credit_transactions (
  id uuid primary key default gen_random_uuid(),
  user_id uuid not null references auth.users(id) on delete cascade,
  target_user_id uuid not null references auth.users(id) on delete cascade,
  credits_used int not null default 1,
  created_at timestamptz not null default now()
);

-- =====================================================================================
-- SECTION 5 — DISTRIBUTION & MATCH TABLES
-- =====================================================================================

-- Single source of truth for per-tier distribution counts (Admin -> Distribution Management)
create table if not exists distribution_config (
  tier membership_tier_enum primary key,
  all_matches_initial int not null default 0,
  all_matches_daily int not null default 0,
  daily_updates_initial int not null default 0,
  daily_updates_daily int not null default 0,
  updated_at timestamptz not null default now()
);

create sequence if not exists distributed_profiles_order_seq;

create table if not exists distributed_profiles (
  id bigserial primary key,
  user_id uuid not null references auth.users(id) on delete cascade,
  profile_id uuid not null references auth.users(id) on delete cascade,
  section distribution_section_enum not null,
  order_index bigint not null default nextval('distributed_profiles_order_seq'),
  distributed_at timestamptz not null default now(),
  unique (user_id, profile_id, section)
);

create table if not exists distribution_logs (
  id uuid primary key default gen_random_uuid(),
  user_id uuid not null references auth.users(id) on delete cascade,
  distribution_type distribution_type_enum not null,
  section distribution_section_enum not null,
  profiles_count int not null,
  tier_at_time membership_tier_enum,
  triggered_by text not null default 'system',
  created_at timestamptz not null default now()
);

create table if not exists interests (
  id uuid primary key default gen_random_uuid(),
  sender_id uuid not null references auth.users(id) on delete cascade,
  receiver_id uuid not null references auth.users(id) on delete cascade,
  status interest_status_enum not null default 'sent',
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now(),
  unique (sender_id, receiver_id),
  check (sender_id <> receiver_id)
);

create table if not exists not_interested (
  id uuid primary key default gen_random_uuid(),
  user_id uuid not null references auth.users(id) on delete cascade,
  target_user_id uuid not null references auth.users(id) on delete cascade,
  created_at timestamptz not null default now(),
  unique (user_id, target_user_id)
);

create table if not exists compatibility_scores (
  id uuid primary key default gen_random_uuid(),
  user_id uuid not null references auth.users(id) on delete cascade,
  target_user_id uuid not null references auth.users(id) on delete cascade,
  score numeric(5,2) not null default 0,
  calculated_at timestamptz not null default now(),
  unique (user_id, target_user_id)
);

-- =====================================================================================
-- SECTION 6 — INDEXES
-- =====================================================================================
create index if not exists idx_castes_religion on castes(religion_id);
create index if not exists idx_sub_castes_caste on sub_castes(caste_id);
create index if not exists idx_states_country on states(country_id);
create index if not exists idx_districts_state on districts(state_id);
create index if not exists idx_cities_district on cities(district_id);

create index if not exists idx_profiles_gender on profiles(gender);
create index if not exists idx_profiles_religion on profiles(religion_id);
create index if not exists idx_profiles_caste on profiles(caste_id);
create index if not exists idx_profiles_city on profiles(city_id);
create index if not exists idx_profiles_active on profiles(is_active) where is_active = true;
create index if not exists idx_profiles_created_at on profiles(created_at desc);

create index if not exists idx_profile_photos_user on profile_photos(user_id);

create index if not exists idx_user_subscriptions_user on user_subscriptions(user_id);
create index if not exists idx_user_subscriptions_plan on user_subscriptions(plan_id);
create index if not exists idx_subscription_queue_user on subscription_queue(user_id, position);
create index if not exists idx_subscription_history_user on subscription_history(user_id);

create index if not exists idx_payments_user on payments(user_id);
create index if not exists idx_payments_status on payments(status);
create index if not exists idx_payments_created_at on payments(created_at desc);
create index if not exists idx_failed_payments_user on failed_payments(user_id);

create index if not exists idx_contact_credit_tx_user on contact_credit_transactions(user_id);
create index if not exists idx_interest_credit_tx_user on interest_credit_transactions(user_id);

create index if not exists idx_distributed_profiles_user_section
  on distributed_profiles(user_id, section, order_index desc);
create index if not exists idx_distribution_logs_user on distribution_logs(user_id, created_at desc);

create index if not exists idx_interests_sender on interests(sender_id, status);
create index if not exists idx_interests_receiver on interests(receiver_id, status);
create index if not exists idx_not_interested_user on not_interested(user_id);
create index if not exists idx_compat_scores_user on compatibility_scores(user_id, score desc);

-- =====================================================================================
-- SECTION 7 — HELPER FUNCTIONS
-- =====================================================================================

-- generic updated_at stamper
create or replace function public.set_updated_at()
returns trigger
language plpgsql
as $$
begin
  new.updated_at = now();
  return new;
end;
$$;

-- true if the calling JWT belongs to an active admin
create or replace function public.is_admin()
returns boolean
language sql
security definer
stable
set search_path = public
as $$
  select exists (
    select 1 from admin_users au
    where au.id = auth.uid() and au.is_active = true
  );
$$;

create or replace function public.calculate_age(p_dob date)
returns int
language sql
stable
as $$
  select date_part('year', age(current_date, p_dob))::int;
$$;

-- =====================================================================================
-- SECTION 8 — BUSINESS LOGIC FUNCTIONS
-- =====================================================================================

-- ---- photo limit (max 5) + single primary photo -------------------------------------
create or replace function public.enforce_photo_count()
returns trigger
language plpgsql
as $$
declare
  v_count int;
begin
  select count(*) into v_count from profile_photos where user_id = new.user_id;
  if v_count >= 5 then
    raise exception 'Maximum 5 photos allowed per user';
  end if;
  return new;
end;
$$;

create or replace function public.enforce_single_primary_photo()
returns trigger
language plpgsql
as $$
begin
  if new.is_primary then
    update profile_photos set is_primary = false
    where user_id = new.user_id and id <> new.id and is_primary = true;
  end if;
  return new;
end;
$$;

-- ---- core distribution primitive -----------------------------------------------------
-- Inserts up to p_count NEW (not-yet-seen) opposite-gender profiles into
-- distributed_profiles for p_user_id/p_section, and logs the result.
create or replace function public.fn_distribute_profiles(
  p_user_id uuid,
  p_section distribution_section_enum,
  p_count int,
  p_dist_type distribution_type_enum,
  p_triggered_by text default 'system'
) returns int
language plpgsql
security definer
set search_path = public
as $$
declare
  v_gender gender_enum;
  v_inserted int := 0;
  v_tier membership_tier_enum;
begin
  if p_count is null or p_count <= 0 then
    return 0;
  end if;

  select gender into v_gender from profiles where id = p_user_id;
  if v_gender is null then
    return 0;
  end if;

  select mp.tier into v_tier
  from user_subscriptions us
  join membership_plans mp on mp.id = us.plan_id
  where us.user_id = p_user_id and us.is_active = true
  limit 1;
  v_tier := coalesce(v_tier, 'free');

  with candidates as (
    select p.id
    from profiles p
    where p.gender <> v_gender
      and p.is_active = true
      and p.is_suspended = false
      and p.id <> p_user_id
      and not exists (
        select 1 from distributed_profiles dp
        where dp.user_id = p_user_id and dp.profile_id = p.id and dp.section = p_section
      )
      and not exists (
        select 1 from not_interested ni
        where ni.user_id = p_user_id and ni.target_user_id = p.id
      )
    order by p.created_at desc
    limit p_count
  ),
  ins as (
    insert into distributed_profiles (user_id, profile_id, section)
    select p_user_id, id, p_section from candidates
    returning 1
  )
  select count(*) into v_inserted from ins;

  if v_inserted > 0 then
    insert into distribution_logs (user_id, distribution_type, section, profiles_count, tier_at_time, triggered_by)
    values (p_user_id, p_dist_type, p_section, v_inserted, v_tier, p_triggered_by);
  end if;

  return v_inserted;
end;
$$;

-- ---- initial distribution for a given tier (signup OR tier upgrade) ------------------
-- Idempotent: will not re-run for a tier the user has already received an "initial"
-- distribution for (checked via distribution_logs).
create or replace function public.fn_run_initial_distribution_for_tier(
  p_user_id uuid,
  p_tier membership_tier_enum,
  p_triggered_by text default 'system'
) returns void
language plpgsql
security definer
set search_path = public
as $$
declare
  v_already boolean;
  v_am int;
  v_du int;
begin
  select exists (
    select 1 from distribution_logs
    where user_id = p_user_id and distribution_type = 'initial' and tier_at_time = p_tier
  ) into v_already;

  if v_already then
    return;
  end if;

  select all_matches_initial, daily_updates_initial into v_am, v_du
  from distribution_config where tier = p_tier;

  perform fn_distribute_profiles(p_user_id, 'all_matches', coalesce(v_am, 0), 'initial', p_triggered_by);
  perform fn_distribute_profiles(p_user_id, 'daily_updates', coalesce(v_du, 0), 'initial', p_triggered_by);
end;
$$;

-- ---- nightly CRON distribution (Type 3) -- call from pg_cron or the daily-distribution-cron edge function
create or replace function public.fn_run_daily_distribution()
returns void
language plpgsql
security definer
set search_path = public
as $$
declare
  r record;
begin
  for r in
    select p.id as user_id, coalesce(mp.tier, 'free') as tier
    from profiles p
    left join user_subscriptions us on us.user_id = p.id and us.is_active = true
    left join membership_plans mp on mp.id = us.plan_id
    where p.is_active = true and p.is_suspended = false
  loop
    perform fn_distribute_profiles(
      r.user_id, 'all_matches',
      coalesce((select all_matches_daily from distribution_config where tier = r.tier), 0),
      'daily', 'cron'
    );
    perform fn_distribute_profiles(
      r.user_id, 'daily_updates',
      coalesce((select daily_updates_daily from distribution_config where tier = r.tier), 0),
      'daily', 'cron'
    );
  end loop;
end;
$$;

-- ---- admin manual push (Type 4) -------------------------------------------------------
create or replace function public.fn_admin_manual_push(
  p_target_type text,                          -- 'all' | 'tier' | 'user'
  p_target_tier membership_tier_enum default null,
  p_target_user_id uuid default null,
  p_section text default 'both',                -- 'all_matches' | 'daily_updates' | 'both'
  p_count int default 0
) returns int
language plpgsql
security definer
set search_path = public
as $$
declare
  r record;
  v_total int := 0;
  v_admin_id uuid := auth.uid();
begin
  if not is_admin() then
    raise exception 'Only admins can trigger manual distribution';
  end if;

  for r in
    select p.id
    from profiles p
    left join user_subscriptions us on us.user_id = p.id and us.is_active = true
    left join membership_plans mp on mp.id = us.plan_id
    where p.is_active = true
      and (
        p_target_type = 'all'
        or (p_target_type = 'tier' and coalesce(mp.tier, 'free') = p_target_tier)
        or (p_target_type = 'user' and p.id = p_target_user_id)
      )
  loop
    if p_section in ('all_matches', 'both') then
      v_total := v_total + fn_distribute_profiles(r.id, 'all_matches', p_count, 'manual', 'admin:' || v_admin_id::text);
    end if;
    if p_section in ('daily_updates', 'both') then
      v_total := v_total + fn_distribute_profiles(r.id, 'daily_updates', p_count, 'manual', 'admin:' || v_admin_id::text);
    end if;
  end loop;

  return v_total;
end;
$$;

-- ---- match engine: 0-100% compatibility score -----------------------------------------
create or replace function public.fn_calculate_compatibility(p_user_id uuid, p_target_id uuid)
returns numeric
language plpgsql
stable
security definer
set search_path = public
as $$
declare
  pref partner_preferences%rowtype;
  target profiles%rowtype;
  target_age int;
  target_food food_habit_enum;
  uh user_horoscope%rowtype;
  th user_horoscope%rowtype;
  total_weight numeric := 0;
  earned_weight numeric := 0;
begin
  select * into pref from partner_preferences where user_id = p_user_id;
  select * into target from profiles where id = p_target_id;
  if pref is null or target is null then
    return 0;
  end if;

  target_age := calculate_age(target.dob);

  -- Age (mandatory)
  total_weight := total_weight + 15;
  if target_age between pref.min_age and pref.max_age then
    earned_weight := earned_weight + 15;
  elsif target_age between pref.min_age - 2 and pref.max_age + 2 then
    earned_weight := earned_weight + 7.5;
  end if;

  -- Height (mandatory)
  total_weight := total_weight + 15;
  if target.height_cm between pref.min_height_cm and pref.max_height_cm then
    earned_weight := earned_weight + 15;
  elsif target.height_cm between pref.min_height_cm - 5 and pref.max_height_cm + 5 then
    earned_weight := earned_weight + 7.5;
  end if;

  -- Religion (optional)
  if pref.religion_id is not null then
    total_weight := total_weight + 10;
    if target.religion_id = pref.religion_id then
      earned_weight := earned_weight + 10;
    end if;
  end if;

  -- Caste (optional)
  if pref.caste_id is not null then
    total_weight := total_weight + 10;
    if target.caste_id = pref.caste_id then
      earned_weight := earned_weight + 10;
    end if;
  end if;

  -- Education (optional)
  if pref.education_level_id is not null then
    total_weight := total_weight + 10;
    if target.education_level_id = pref.education_level_id then
      earned_weight := earned_weight + 10;
    end if;
  end if;

  -- Occupation (optional)
  if pref.occupation_id is not null then
    total_weight := total_weight + 10;
    if target.occupation_id = pref.occupation_id then
      earned_weight := earned_weight + 10;
    end if;
  end if;

  -- Location (optional)
  if pref.location_city_id is not null then
    total_weight := total_weight + 10;
    if target.city_id = pref.location_city_id then
      earned_weight := earned_weight + 10;
    elsif target.district_id = (select district_id from cities where id = pref.location_city_id) then
      earned_weight := earned_weight + 5;
    end if;
  end if;

  -- Food habit (optional)
  if pref.food_habit is not null then
    total_weight := total_weight + 5;
    select food_habit into target_food from user_lifestyle where user_id = p_target_id;
    if target_food = pref.food_habit then
      earned_weight := earned_weight + 5;
    end if;
  end if;

  -- Marital status (optional)
  if pref.marital_status is not null then
    total_weight := total_weight + 5;
    if target.marital_status = pref.marital_status then
      earned_weight := earned_weight + 5;
    end if;
  end if;

  -- Horoscope bonus (only scored if both sides filled it in)
  select * into uh from user_horoscope where user_id = p_user_id;
  select * into th from user_horoscope where user_id = p_target_id;
  if uh.rasi_id is not null and th.rasi_id is not null then
    total_weight := total_weight + 10;
    if uh.rasi_id = th.rasi_id or uh.nakshatra_id = th.nakshatra_id then
      earned_weight := earned_weight + 10;
    end if;
  end if;

  if total_weight = 0 then
    return 100;
  end if;

  return round((earned_weight / total_weight) * 100, 2);
end;
$$;

create or replace function public.fn_recalculate_compatibility_for_user(p_user_id uuid)
returns int
language plpgsql
security definer
set search_path = public
as $$
declare
  v_gender gender_enum;
  r record;
  v_score numeric;
  v_count int := 0;
begin
  select gender into v_gender from profiles where id = p_user_id;
  if v_gender is null then
    return 0;
  end if;

  for r in
    select id from profiles
    where gender <> v_gender and is_active = true and id <> p_user_id
  loop
    v_score := fn_calculate_compatibility(p_user_id, r.id);
    insert into compatibility_scores (user_id, target_user_id, score, calculated_at)
    values (p_user_id, r.id, v_score, now())
    on conflict (user_id, target_user_id)
    do update set score = excluded.score, calculated_at = now();
    v_count := v_count + 1;
  end loop;

  return v_count;
end;
$$;

-- ---- credit spend: view phone number or horoscope --------------------------------------
create or replace function public.fn_view_contact_credit(p_viewed_user_id uuid, p_type credit_type_enum)
returns boolean
language plpgsql
security definer
set search_path = public
as $$
declare
  v_user uuid := auth.uid();
  v_remaining int;
begin
  if v_user is null then
    raise exception 'Not authenticated';
  end if;

  if exists (
    select 1 from contact_credit_transactions
    where user_id = v_user and viewed_user_id = p_viewed_user_id and type = p_type
  ) then
    return true; -- already unlocked, don't charge twice
  end if;

  select contact_credits_remaining into v_remaining
  from user_subscriptions where user_id = v_user and is_active = true
  for update;

  if v_remaining is null or v_remaining < 1 then
    raise exception 'Insufficient contact credits';
  end if;

  update user_subscriptions
  set contact_credits_remaining = contact_credits_remaining - 1, updated_at = now()
  where user_id = v_user and is_active = true;

  insert into contact_credit_transactions (user_id, viewed_user_id, type, credits_used)
  values (v_user, p_viewed_user_id, p_type, 1);

  return true;
end;
$$;

-- ---- send / respond to interest ----------------------------------------------------------
create or replace function public.fn_send_interest(p_receiver_id uuid)
returns uuid
language plpgsql
security definer
set search_path = public
as $$
declare
  v_user uuid := auth.uid();
  v_remaining int;
  v_interest_id uuid;
begin
  if v_user is null then
    raise exception 'Not authenticated';
  end if;
  if v_user = p_receiver_id then
    raise exception 'Cannot send interest to yourself';
  end if;

  select interest_credits_remaining into v_remaining
  from user_subscriptions where user_id = v_user and is_active = true
  for update;

  if v_remaining is null or v_remaining < 1 then
    raise exception 'Insufficient interest credits or no active premium plan';
  end if;

  insert into interests (sender_id, receiver_id, status)
  values (v_user, p_receiver_id, 'sent')
  on conflict (sender_id, receiver_id) do update set status = 'sent', updated_at = now()
  returning id into v_interest_id;

  update user_subscriptions
  set interest_credits_remaining = interest_credits_remaining - 1, updated_at = now()
  where user_id = v_user and is_active = true;

  insert into interest_credit_transactions (user_id, target_user_id, credits_used)
  values (v_user, p_receiver_id, 1);

  return v_interest_id;
end;
$$;

create or replace function public.fn_respond_interest(p_interest_id uuid, p_response interest_status_enum)
returns void
language plpgsql
security definer
set search_path = public
as $$
declare
  v_user uuid := auth.uid();
begin
  if p_response not in ('accepted', 'rejected') then
    raise exception 'Invalid response';
  end if;

  update interests
  set status = p_response, updated_at = now()
  where id = p_interest_id and receiver_id = v_user and status = 'sent';

  if not found then
    raise exception 'Interest not found or not authorized';
  end if;
end;
$$;

create or replace function public.fn_mark_not_interested(p_target_user_id uuid)
returns void
language plpgsql
security definer
set search_path = public
as $$
begin
  insert into not_interested (user_id, target_user_id)
  values (auth.uid(), p_target_user_id)
  on conflict (user_id, target_user_id) do nothing;
end;
$$;

create or replace function public.fn_undo_not_interested(p_target_user_id uuid)
returns void
language plpgsql
security definer
set search_path = public
as $$
begin
  delete from not_interested where user_id = auth.uid() and target_user_id = p_target_user_id;
end;
$$;

-- ---- admin: clear purchase history / reset to Free (testing feature, section 9.2) -------
create or replace function public.fn_admin_reset_user_to_free(p_user_id uuid)
returns void
language plpgsql
security definer
set search_path = public
as $$
declare
  v_free_plan_id uuid;
begin
  if not is_admin() then
    raise exception 'Only admins can perform this action';
  end if;

  select id into v_free_plan_id from membership_plans where tier = 'free' and is_active = true limit 1;

  delete from subscription_queue where user_id = p_user_id;
  update user_subscriptions set is_active = false where user_id = p_user_id;
  delete from user_subscriptions where user_id = p_user_id;

  if v_free_plan_id is not null then
    insert into user_subscriptions (user_id, plan_id, contact_credits_remaining, interest_credits_remaining, starts_at, expires_at, is_active)
    values (p_user_id, v_free_plan_id, 0, 0, now(), null, true);
  end if;

  insert into subscription_history (user_id, plan_id, amount_paid, started_at, expired_at, reason)
  values (p_user_id, v_free_plan_id, 0, now(), null, 'admin_reset_to_free');
end;
$$;

-- ---- admin: suspend / activate a user account --------------------------------------------
create or replace function public.fn_admin_set_user_active(p_user_id uuid, p_is_active boolean)
returns void
language plpgsql
security definer
set search_path = public
as $$
begin
  if not is_admin() then
    raise exception 'Only admins can perform this action';
  end if;

  update profiles set is_suspended = not p_is_active, is_active = p_is_active, updated_at = now()
  where id = p_user_id;
end;
$$;

-- ---- admin: reset credits for a user ------------------------------------------------------
create or replace function public.fn_admin_reset_credits(
  p_user_id uuid,
  p_contact_credits int default null,
  p_interest_credits int default null
) returns void
language plpgsql
security definer
set search_path = public
as $$
begin
  if not is_admin() then
    raise exception 'Only admins can perform this action';
  end if;

  update user_subscriptions
  set contact_credits_remaining = coalesce(p_contact_credits, contact_credits_remaining),
      interest_credits_remaining = coalesce(p_interest_credits, interest_credits_remaining),
      updated_at = now()
  where user_id = p_user_id and is_active = true;
end;
$$;

-- =====================================================================================
-- SECTION 9 — TRIGGERS
-- =====================================================================================

-- updated_at auto-stamping
drop trigger if exists trg_profiles_updated_at on profiles;
create trigger trg_profiles_updated_at before update on profiles
  for each row execute function set_updated_at();

drop trigger if exists trg_user_family_updated_at on user_family;
create trigger trg_user_family_updated_at before update on user_family
  for each row execute function set_updated_at();

drop trigger if exists trg_user_horoscope_updated_at on user_horoscope;
create trigger trg_user_horoscope_updated_at before update on user_horoscope
  for each row execute function set_updated_at();

drop trigger if exists trg_user_lifestyle_updated_at on user_lifestyle;
create trigger trg_user_lifestyle_updated_at before update on user_lifestyle
  for each row execute function set_updated_at();

drop trigger if exists trg_partner_preferences_updated_at on partner_preferences;
create trigger trg_partner_preferences_updated_at before update on partner_preferences
  for each row execute function set_updated_at();

drop trigger if exists trg_membership_plans_updated_at on membership_plans;
create trigger trg_membership_plans_updated_at before update on membership_plans
  for each row execute function set_updated_at();

drop trigger if exists trg_user_subscriptions_updated_at on user_subscriptions;
create trigger trg_user_subscriptions_updated_at before update on user_subscriptions
  for each row execute function set_updated_at();

drop trigger if exists trg_interests_updated_at on interests;
create trigger trg_interests_updated_at before update on interests
  for each row execute function set_updated_at();

drop trigger if exists trg_profile_contact_updated_at on profile_contact;
create trigger trg_profile_contact_updated_at before update on profile_contact
  for each row execute function set_updated_at();

-- photo limit + single primary
drop trigger if exists trg_photo_count on profile_photos;
create trigger trg_photo_count before insert on profile_photos
  for each row execute function enforce_photo_count();

drop trigger if exists trg_photo_primary on profile_photos;
create trigger trg_photo_primary after insert or update of is_primary on profile_photos
  for each row execute function enforce_single_primary_photo();

-- profile created (Step 3 OTP verified) -> assign Free plan if none exists yet.
-- The user_subscriptions insert below cascades into the distribution trigger.
create or replace function public.trg_fn_after_profile_insert()
returns trigger
language plpgsql
security definer
set search_path = public
as $$
declare
  v_free_plan_id uuid;
begin
  select id into v_free_plan_id from membership_plans where tier = 'free' and is_active = true limit 1;

  if v_free_plan_id is not null and not exists (select 1 from user_subscriptions where user_id = new.id) then
    insert into user_subscriptions (user_id, plan_id, contact_credits_remaining, interest_credits_remaining, starts_at, expires_at, is_active)
    values (new.id, v_free_plan_id, 0, 0, now(), null, true);
  else
    -- fallback: no Free plan configured yet, distribute directly off distribution_config
    perform fn_run_initial_distribution_for_tier(new.id, 'free', 'signup');
  end if;

  return new;
end;
$$;

drop trigger if exists trg_after_profile_insert on profiles;
create trigger trg_after_profile_insert after insert on profiles
  for each row execute function trg_fn_after_profile_insert();

-- subscription becomes active (signup's Free plan OR a paid upgrade) -> run initial distribution
create or replace function public.trg_fn_after_subscription_active()
returns trigger
language plpgsql
security definer
set search_path = public
as $$
declare
  v_tier membership_tier_enum;
begin
  if new.is_active then
    select tier into v_tier from membership_plans where id = new.plan_id;
    if v_tier is not null then
      perform fn_run_initial_distribution_for_tier(
        new.user_id, v_tier,
        case when v_tier = 'free' then 'signup' else 'tier_upgrade' end
      );
    end if;
  end if;
  return new;
end;
$$;

drop trigger if exists trg_after_subscription_insert on user_subscriptions;
create trigger trg_after_subscription_insert after insert on user_subscriptions
  for each row execute function trg_fn_after_subscription_active();

drop trigger if exists trg_after_subscription_activate on user_subscriptions;
create trigger trg_after_subscription_activate after update of plan_id, is_active on user_subscriptions
  for each row when (new.is_active = true) execute function trg_fn_after_subscription_active();

-- =====================================================================================
-- SECTION 10 — ROW LEVEL SECURITY
-- =====================================================================================

-- ---- master/lookup tables: readable by everyone (needed pre-login during registration
--      Step 1), writable only by admins ---------------------------------------------------
do $$
declare
  t text;
begin
  foreach t in array array[
    'religions','castes','sub_castes','countries','states','districts','cities',
    'occupations','education_levels','rasi','nakshatra','lagnam','gothram','mother_tongues'
  ] loop
    execute format('alter table %I enable row level security;', t);
    execute format('drop policy if exists %I on %I;', t || '_select', t);
    execute format('create policy %I on %I for select using (true);', t || '_select', t);
    execute format('drop policy if exists %I on %I;', t || '_admin_insert', t);
    execute format('create policy %I on %I for insert with check (is_admin());', t || '_admin_insert', t);
    execute format('drop policy if exists %I on %I;', t || '_admin_update', t);
    execute format('create policy %I on %I for update using (is_admin());', t || '_admin_update', t);
    execute format('drop policy if exists %I on %I;', t || '_admin_delete', t);
    execute format('create policy %I on %I for delete using (is_admin());', t || '_admin_delete', t);
  end loop;
end $$;

-- ---- admin_users ---------------------------------------------------------------------
alter table admin_users enable row level security;
drop policy if exists admin_users_select on admin_users;
create policy admin_users_select on admin_users for select using (is_admin());
drop policy if exists admin_users_write on admin_users;
create policy admin_users_write on admin_users for all using (is_admin()) with check (is_admin());

-- ---- profiles: own row, admin, OR anyone it has been distributed to ------------------
alter table profiles enable row level security;
drop policy if exists profiles_select on profiles;
create policy profiles_select on profiles for select using (
  auth.uid() = id
  or is_admin()
  or exists (select 1 from distributed_profiles dp where dp.user_id = auth.uid() and dp.profile_id = profiles.id)
);
drop policy if exists profiles_insert on profiles;
create policy profiles_insert on profiles for insert with check (auth.uid() = id);
drop policy if exists profiles_update on profiles;
create policy profiles_update on profiles for update using (auth.uid() = id or is_admin());
drop policy if exists profiles_delete on profiles;
create policy profiles_delete on profiles for delete using (is_admin());

-- ---- registration_meta / user_family / user_lifestyle: own + admin + distributed-visible
do $$
declare
  t text;
begin
  foreach t in array array['registration_meta','user_family','user_lifestyle'] loop
    execute format('alter table %I enable row level security;', t);
    execute format('drop policy if exists %I on %I;', t || '_select', t);
    execute format(
      'create policy %I on %I for select using (
         auth.uid() = user_id or is_admin()
         or exists (select 1 from distributed_profiles dp where dp.user_id = auth.uid() and dp.profile_id = %I.user_id)
       );', t || '_select', t, t
    );
    execute format('drop policy if exists %I on %I;', t || '_insert', t);
    execute format('create policy %I on %I for insert with check (auth.uid() = user_id);', t || '_insert', t);
    execute format('drop policy if exists %I on %I;', t || '_update', t);
    execute format('create policy %I on %I for update using (auth.uid() = user_id or is_admin());', t || '_update', t);
    execute format('drop policy if exists %I on %I;', t || '_delete', t);
    execute format('create policy %I on %I for delete using (is_admin());', t || '_delete', t);
  end loop;
end $$;

-- ---- profile_contact (phone): gated behind a 'phone' contact-credit purchase ----------
alter table profile_contact enable row level security;
drop policy if exists profile_contact_select on profile_contact;
create policy profile_contact_select on profile_contact for select using (
  auth.uid() = user_id
  or is_admin()
  or exists (
    select 1 from contact_credit_transactions cct
    where cct.user_id = auth.uid() and cct.viewed_user_id = profile_contact.user_id and cct.type = 'phone'
  )
);
drop policy if exists profile_contact_insert on profile_contact;
create policy profile_contact_insert on profile_contact for insert with check (auth.uid() = user_id);
drop policy if exists profile_contact_update on profile_contact;
create policy profile_contact_update on profile_contact for update using (auth.uid() = user_id or is_admin());
drop policy if exists profile_contact_delete on profile_contact;
create policy profile_contact_delete on profile_contact for delete using (is_admin());

-- ---- user_horoscope: gated behind a 'horoscope' contact-credit purchase ---------------
alter table user_horoscope enable row level security;
drop policy if exists user_horoscope_select on user_horoscope;
create policy user_horoscope_select on user_horoscope for select using (
  auth.uid() = user_id
  or is_admin()
  or exists (
    select 1 from contact_credit_transactions cct
    where cct.user_id = auth.uid() and cct.viewed_user_id = user_horoscope.user_id and cct.type = 'horoscope'
  )
);
drop policy if exists user_horoscope_insert on user_horoscope;
create policy user_horoscope_insert on user_horoscope for insert with check (auth.uid() = user_id);
drop policy if exists user_horoscope_update on user_horoscope;
create policy user_horoscope_update on user_horoscope for update using (auth.uid() = user_id or is_admin());
drop policy if exists user_horoscope_delete on user_horoscope;
create policy user_horoscope_delete on user_horoscope for delete using (is_admin());

-- ---- partner_preferences: owner + admin only (not shown to other users) --------------
alter table partner_preferences enable row level security;
drop policy if exists prefs_select on partner_preferences;
create policy prefs_select on partner_preferences for select using (auth.uid() = user_id or is_admin());
drop policy if exists prefs_insert on partner_preferences;
create policy prefs_insert on partner_preferences for insert with check (auth.uid() = user_id);
drop policy if exists prefs_update on partner_preferences;
create policy prefs_update on partner_preferences for update using (auth.uid() = user_id or is_admin());
drop policy if exists prefs_delete on partner_preferences;
create policy prefs_delete on partner_preferences for delete using (is_admin());

-- ---- profile_photos: own + admin manage; anyone it's distributed to can view ----------
alter table profile_photos enable row level security;
drop policy if exists photos_select on profile_photos;
create policy photos_select on profile_photos for select using (
  auth.uid() = user_id
  or is_admin()
  or exists (select 1 from distributed_profiles dp where dp.user_id = auth.uid() and dp.profile_id = profile_photos.user_id)
);
drop policy if exists photos_insert on profile_photos;
create policy photos_insert on profile_photos for insert with check (auth.uid() = user_id or is_admin());
drop policy if exists photos_update on profile_photos;
create policy photos_update on profile_photos for update using (auth.uid() = user_id or is_admin());
drop policy if exists photos_delete on profile_photos;
create policy photos_delete on profile_photos for delete using (auth.uid() = user_id or is_admin());

-- ---- membership_plans: readable by everyone (pricing page), admin writes -------------
alter table membership_plans enable row level security;
drop policy if exists plans_select on membership_plans;
create policy plans_select on membership_plans for select using (true);
drop policy if exists plans_admin_insert on membership_plans;
create policy plans_admin_insert on membership_plans for insert with check (is_admin());
drop policy if exists plans_admin_update on membership_plans;
create policy plans_admin_update on membership_plans for update using (is_admin());
drop policy if exists plans_admin_delete on membership_plans;
create policy plans_admin_delete on membership_plans for delete using (is_admin());

-- ---- distribution_config: admin only (internal config) -------------------------------
alter table distribution_config enable row level security;
drop policy if exists dist_config_admin_all on distribution_config;
create policy dist_config_admin_all on distribution_config for all using (is_admin()) with check (is_admin());

-- ---- distributed_profiles / distribution_logs: own (read-only) + admin ---------------
alter table distributed_profiles enable row level security;
drop policy if exists dp_select on distributed_profiles;
create policy dp_select on distributed_profiles for select using (auth.uid() = user_id or is_admin());
drop policy if exists dp_admin_write on distributed_profiles;
create policy dp_admin_write on distributed_profiles for all using (is_admin()) with check (is_admin());

alter table distribution_logs enable row level security;
drop policy if exists dl_select on distribution_logs;
create policy dl_select on distribution_logs for select using (auth.uid() = user_id or is_admin());
drop policy if exists dl_admin_write on distribution_logs;
create policy dl_admin_write on distribution_logs for all using (is_admin()) with check (is_admin());

-- ---- interests: sender/receiver visibility, writes via RPC functions -----------------
alter table interests enable row level security;
drop policy if exists interests_select on interests;
create policy interests_select on interests for select using (
  auth.uid() = sender_id or auth.uid() = receiver_id or is_admin()
);
drop policy if exists interests_admin_write on interests;
create policy interests_admin_write on interests for all using (is_admin()) with check (is_admin());

-- ---- not_interested: own + admin -----------------------------------------------------
alter table not_interested enable row level security;
drop policy if exists ni_select on not_interested;
create policy ni_select on not_interested for select using (auth.uid() = user_id or is_admin());
drop policy if exists ni_insert on not_interested;
create policy ni_insert on not_interested for insert with check (auth.uid() = user_id);
drop policy if exists ni_delete on not_interested;
create policy ni_delete on not_interested for delete using (auth.uid() = user_id or is_admin());

-- ---- compatibility_scores: own (read-only) + admin -----------------------------------
alter table compatibility_scores enable row level security;
drop policy if exists cs_select on compatibility_scores;
create policy cs_select on compatibility_scores for select using (auth.uid() = user_id or is_admin());
drop policy if exists cs_admin_write on compatibility_scores;
create policy cs_admin_write on compatibility_scores for all using (is_admin()) with check (is_admin());

-- ---- user_subscriptions: own (read-only) + admin write -------------------------------
alter table user_subscriptions enable row level security;
drop policy if exists us_select on user_subscriptions;
create policy us_select on user_subscriptions for select using (auth.uid() = user_id or is_admin());
drop policy if exists us_admin_insert on user_subscriptions;
create policy us_admin_insert on user_subscriptions for insert with check (is_admin());
drop policy if exists us_admin_update on user_subscriptions;
create policy us_admin_update on user_subscriptions for update using (is_admin());
drop policy if exists us_admin_delete on user_subscriptions;
create policy us_admin_delete on user_subscriptions for delete using (is_admin());

-- ---- subscription_queue / subscription_history: own (read-only) + admin -------------
alter table subscription_queue enable row level security;
drop policy if exists sq_select on subscription_queue;
create policy sq_select on subscription_queue for select using (auth.uid() = user_id or is_admin());
drop policy if exists sq_admin_write on subscription_queue;
create policy sq_admin_write on subscription_queue for all using (is_admin()) with check (is_admin());

alter table subscription_history enable row level security;
drop policy if exists sh_select on subscription_history;
create policy sh_select on subscription_history for select using (auth.uid() = user_id or is_admin());
drop policy if exists sh_admin_write on subscription_history;
create policy sh_admin_write on subscription_history for all using (is_admin()) with check (is_admin());

-- ---- payments / failed_payments: own (read-only) + admin -----------------------------
-- Creation happens through the razorpay-create-order Edge Function (service role), never
-- directly from the client.
alter table payments enable row level security;
drop policy if exists payments_select on payments;
create policy payments_select on payments for select using (auth.uid() = user_id or is_admin());
drop policy if exists payments_admin_write on payments;
create policy payments_admin_write on payments for all using (is_admin()) with check (is_admin());

alter table failed_payments enable row level security;
drop policy if exists failed_payments_select on failed_payments;
create policy failed_payments_select on failed_payments for select using (auth.uid() = user_id or is_admin());
drop policy if exists failed_payments_admin_write on failed_payments;
create policy failed_payments_admin_write on failed_payments for all using (is_admin()) with check (is_admin());

-- ---- credit transaction logs: own (read-only) + admin --------------------------------
alter table contact_credit_transactions enable row level security;
drop policy if exists cct_select on contact_credit_transactions;
create policy cct_select on contact_credit_transactions for select using (auth.uid() = user_id or is_admin());
drop policy if exists cct_admin_write on contact_credit_transactions;
create policy cct_admin_write on contact_credit_transactions for all using (is_admin()) with check (is_admin());

alter table interest_credit_transactions enable row level security;
drop policy if exists ict_select on interest_credit_transactions;
create policy ict_select on interest_credit_transactions for select using (auth.uid() = user_id or is_admin());
drop policy if exists ict_admin_write on interest_credit_transactions;
create policy ict_admin_write on interest_credit_transactions for all using (is_admin()) with check (is_admin());

-- =====================================================================================
-- SECTION 11 — VIEWS
-- =====================================================================================

-- Home-screen summary for the currently logged-in user
create or replace view public.user_dashboard_summary
with (security_invoker = true) as
select
  p.id as user_id,
  p.full_name,
  p.gender,
  coalesce(mp.tier, 'free') as tier,
  mp.name as plan_name,
  us.contact_credits_remaining,
  us.interest_credits_remaining,
  us.expires_at as plan_expires_at,
  (select count(*) from distributed_profiles dp where dp.user_id = p.id and dp.section = 'all_matches') as all_matches_count,
  (select count(*) from distributed_profiles dp where dp.user_id = p.id and dp.section = 'daily_updates') as daily_updates_count,
  (select count(*) from interests i where i.receiver_id = p.id and i.status = 'sent') as pending_received_interests,
  (select count(*) from interests i where i.sender_id = p.id and i.status = 'sent') as sent_interests_count,
  p.profile_completion_percent
from profiles p
left join user_subscriptions us on us.user_id = p.id and us.is_active = true
left join membership_plans mp on mp.id = us.plan_id;

-- Admin dashboard stats (returns 0 rows for non-admins)
create or replace view public.admin_stats_view
with (security_invoker = true) as
select * from (
  select
    (select count(*) from profiles) as total_users,
    (select count(*) from profiles where created_at > now() - interval '30 days') as active_users_30d,
    (select count(*) from profiles p join user_subscriptions us on us.user_id = p.id and us.is_active = true
       join membership_plans mp on mp.id = us.plan_id where mp.tier = 'free') as free_users,
    (select count(*) from profiles p join user_subscriptions us on us.user_id = p.id and us.is_active = true
       join membership_plans mp on mp.id = us.plan_id where mp.tier = 'silver') as silver_users,
    (select count(*) from profiles p join user_subscriptions us on us.user_id = p.id and us.is_active = true
       join membership_plans mp on mp.id = us.plan_id where mp.tier = 'gold') as gold_users,
    (select count(*) from profiles p join user_subscriptions us on us.user_id = p.id and us.is_active = true
       join membership_plans mp on mp.id = us.plan_id where mp.tier = 'platinum') as platinum_users,
    (select coalesce(sum(amount_paise), 0) from payments where status = 'success') as total_revenue_paise,
    (select coalesce(sum(amount_paise), 0) from payments
       where status = 'success' and confirmed_at > date_trunc('month', now())) as revenue_this_month_paise
) s
where is_admin();

-- Daily revenue breakdown for admin charts (returns 0 rows for non-admins)
create or replace view public.revenue_summary
with (security_invoker = true) as
select date_trunc('day', confirmed_at) as day, count(*) as payments_count, sum(amount_paise) as revenue_paise
from payments
where status = 'success' and is_admin()
group by 1
order by 1 desc;

-- =====================================================================================
-- SECTION 12 — GRANTS
-- =====================================================================================
-- Belt-and-braces: make sure anon/authenticated can call the RPC functions the app
-- and admin panel rely on. (RLS/is_admin() checks still gate what each function does.)
grant execute on function
  public.calculate_age(date),
  public.is_admin(),
  public.fn_view_contact_credit(uuid, credit_type_enum),
  public.fn_send_interest(uuid),
  public.fn_respond_interest(uuid, interest_status_enum),
  public.fn_mark_not_interested(uuid),
  public.fn_undo_not_interested(uuid),
  public.fn_recalculate_compatibility_for_user(uuid),
  public.fn_calculate_compatibility(uuid, uuid)
to authenticated;

grant execute on function
  public.fn_admin_manual_push(text, membership_tier_enum, uuid, text, int),
  public.fn_admin_reset_user_to_free(uuid),
  public.fn_admin_set_user_active(uuid, boolean),
  public.fn_admin_reset_credits(uuid, int, int),
  public.fn_run_daily_distribution()
to authenticated;

grant select on public.user_dashboard_summary, public.admin_stats_view, public.revenue_summary to authenticated;

-- =====================================================================================
-- SECTION 13 — SEED DATA
-- Master lists that are stable/fixed are seeded in full (religions, rasi, nakshatra,
-- lagnam, Indian states). Castes / districts / cities are seeded with a small starter
-- set only -- load your full castes.json / districts.json / cities.json (as already
-- referenced in your repo's backend/src/data/) through a one-off script for complete
-- coverage; hand-writing thousands of rows here isn't practical or safe to guess at.
-- =====================================================================================

insert into religions (name) values
  ('Hindu'),('Muslim'),('Christian'),('Sikh'),('Jain'),('Buddhist'),('Others')
on conflict (name) do nothing;

-- Starter caste list per religion (optional field -- NULL caste_id already means
-- "No caste preference", so no magic row is needed for that).
insert into castes (religion_id, name)
select r.id, v.caste_name
from (values
  ('Hindu','Brahmin'), ('Hindu','Nadar'), ('Hindu','Vanniyar'), ('Hindu','Mudaliyar'),
  ('Hindu','Chettiar'), ('Hindu','Gounder'), ('Hindu','Pillai'), ('Hindu','Naidu'),
  ('Hindu','Reddy'), ('Hindu','Adi Dravidar'), ('Hindu','Other Hindu Caste'),
  ('Christian','Roman Catholic'), ('Christian','CSI'), ('Christian','Protestant'),
  ('Muslim','Sunni'), ('Muslim','Shia'),
  ('Sikh','Jat Sikh'), ('Sikh','Khatri Sikh'),
  ('Jain','Digambar'), ('Jain','Shwetambar')
) as v(religion_name, caste_name)
join religions r on r.name = v.religion_name
on conflict (religion_id, name) do nothing;

insert into countries (name, iso_code) values
  ('India','IN'),('United States','US'),('United Kingdom','GB'),('Canada','CA'),
  ('Australia','AU'),('United Arab Emirates','AE'),('Singapore','SG'),('Malaysia','MY')
on conflict (name) do nothing;

-- All 28 Indian states + 8 union territories
insert into states (country_id, name)
select c.id, v.state_name
from (values
  ('Andhra Pradesh'),('Arunachal Pradesh'),('Assam'),('Bihar'),('Chhattisgarh'),('Goa'),
  ('Gujarat'),('Haryana'),('Himachal Pradesh'),('Jharkhand'),('Karnataka'),('Kerala'),
  ('Madhya Pradesh'),('Maharashtra'),('Manipur'),('Meghalaya'),('Mizoram'),('Nagaland'),
  ('Odisha'),('Punjab'),('Rajasthan'),('Sikkim'),('Tamil Nadu'),('Telangana'),('Tripura'),
  ('Uttar Pradesh'),('Uttarakhand'),('West Bengal'),
  ('Andaman and Nicobar Islands'),('Chandigarh'),
  ('Dadra and Nagar Haveli and Daman and Diu'),('Delhi (NCT)'),
  ('Jammu and Kashmir'),('Ladakh'),('Lakshadweep'),('Puducherry')
) as v(state_name)
join countries c on c.name = 'India'
on conflict (country_id, name) do nothing;

-- Starter districts/cities (Tamil Nadu) -- replace/extend via your bulk JSON import
insert into districts (state_id, name)
select s.id, v.district_name
from (values
  ('Chennai'),('Coimbatore'),('Madurai'),('Tiruchirappalli'),('Salem'),('Tirunelveli'),
  ('Erode'),('Vellore'),('Thoothukudi'),('Dindigul'),('Thanjavur'),('Kanchipuram'),
  ('Cuddalore'),('Karur'),('Namakkal')
) as v(district_name)
join states s on s.name = 'Tamil Nadu'
on conflict (state_id, name) do nothing;

insert into cities (district_id, name)
select d.id, d.name
from districts d
join states s on s.id = d.state_id and s.name = 'Tamil Nadu'
on conflict (district_id, name) do nothing;

insert into occupations (name) values
  ('Software Engineer'),('Doctor'),('Lawyer'),('Teacher'),('Police'),
  ('Government Employee'),('Business'),('Farmer'),('Private Employee'),
  ('Self-employed'),('Others')
on conflict (name) do nothing;

insert into education_levels (name, sort_order) values
  ('High School',1),('Diploma',2),('Bachelor''s Degree',3),('Master''s Degree',4),
  ('Doctorate (PhD)',5),('Professional Degree (CA/CS/MBA etc.)',6),('Others',7)
on conflict (name) do nothing;

insert into rasi (name) values
  ('Mesha (Aries)'),('Vrishabha (Taurus)'),('Mithuna (Gemini)'),('Karka (Cancer)'),
  ('Simha (Leo)'),('Kanya (Virgo)'),('Tula (Libra)'),('Vrischika (Scorpio)'),
  ('Dhanu (Sagittarius)'),('Makara (Capricorn)'),('Kumbha (Aquarius)'),('Meena (Pisces)')
on conflict (name) do nothing;

insert into nakshatra (name) values
  ('Ashwini'),('Bharani'),('Krittika'),('Rohini'),('Mrigashira'),('Ardra'),
  ('Punarvasu'),('Pushya'),('Ashlesha'),('Magha'),('Purva Phalguni'),('Uttara Phalguni'),
  ('Hasta'),('Chitra'),('Swati'),('Vishakha'),('Anuradha'),('Jyeshtha'),
  ('Mula'),('Purva Ashadha'),('Uttara Ashadha'),('Shravana'),('Dhanishta'),('Shatabhisha'),
  ('Purva Bhadrapada'),('Uttara Bhadrapada'),('Revati')
on conflict (name) do nothing;

insert into lagnam (name) values
  ('Mesha Lagnam'),('Vrishabha Lagnam'),('Mithuna Lagnam'),('Karka Lagnam'),
  ('Simha Lagnam'),('Kanya Lagnam'),('Tula Lagnam'),('Vrischika Lagnam'),
  ('Dhanu Lagnam'),('Makara Lagnam'),('Kumbha Lagnam'),('Meena Lagnam')
on conflict (name) do nothing;

insert into gothram (name) values
  ('Bharadwaja'),('Kashyapa'),('Vashista'),('Vishwamitra'),('Atri'),('Agastya'),
  ('Gautama'),('Jamadagni'),('Kaundinya'),('Shandilya'),('Vatsa'),('Kutsa'),
  ('Harita'),('Mudgala'),('Parashara'),('Bhrigu'),('Angirasa'),('Others')
on conflict (name) do nothing;

insert into mother_tongues (name) values
  ('Tamil'),('Telugu'),('Kannada'),('Malayalam'),('Hindi'),('Marathi'),('Gujarati'),
  ('Bengali'),('Punjabi'),('Urdu'),('English'),('Odia'),('Assamese'),('Konkani'),
  ('Sindhi'),('Sanskrit'),('Others')
on conflict (name) do nothing;

-- Default membership plans (edit prices/credits any time in the admin panel)
insert into membership_plans (tier, name, price, duration_days, contact_credits, interest_credits, is_active) values
  ('free','Free',0,null,0,0,true),
  ('silver','Silver',999,30,10,10,true),
  ('gold','Gold',1999,60,25,25,true),
  ('platinum','Platinum',3999,90,50,50,true)
on conflict (tier) where (is_active = true) do nothing;

-- Default distribution counts (spec section 6.2)
insert into distribution_config (tier, all_matches_initial, all_matches_daily, daily_updates_initial, daily_updates_daily) values
  ('free',5,2,0,0),
  ('silver',50,5,50,10),
  ('gold',100,10,100,20),
  ('platinum',200,20,200,40)
on conflict (tier) do update set
  all_matches_initial = excluded.all_matches_initial,
  all_matches_daily = excluded.all_matches_daily,
  daily_updates_initial = excluded.daily_updates_initial,
  daily_updates_daily = excluded.daily_updates_daily,
  updated_at = now();

-- =====================================================================================
-- DONE. Next: run 20260701120100_cron_schedule.sql and deploy the Edge Functions in
-- supabase/functions/.
-- =====================================================================================
