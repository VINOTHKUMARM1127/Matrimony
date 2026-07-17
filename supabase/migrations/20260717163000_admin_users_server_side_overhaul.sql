-- ===================================================================================
-- Migration: Admin Users Page — Server-Side Overhaul (v2)
--
-- WHAT THIS DOES:
--   1. Enables pg_trgm extension for fast ILIKE search
--   2. Adds GIN trigram indexes ONLY on tables we own (profiles.full_name,
--      profile_contact.mobile_number) — auth.users is Supabase-managed, so we
--      don't index it directly.
--   3. Creates fn_admin_list_users() RPC that reads email live from auth.users
--      and phone live from profile_contact at query time. No denormalized
--      columns on profiles, no sync trigger, no backfill needed — so new
--      signups can never show a blank email/phone.
--   4. Combines the count and the page fetch into a single scan using
--      count(*) over(), instead of running the same filter twice.
--
-- WHY NOT A TRIGGER / DENORMALIZED COLUMNS:
--   - profiles rows are created after OTP verification succeeds, not at the
--     moment auth.users gets its INSERT — a trigger on auth.users would leave
--     every new signup with a permanently null email.
--   - Mobile login isn't active yet, so auth.users.phone is always null in
--     this app anyway; the real phone number lives in profile_contact.
--   - Reading both live removes the staleness/sync risk entirely.
--
-- SAFETY NOTES:
--   - is_admin() gate reused as-is (security definer, search_path locked) —
--     matches the pattern already used by profiles_update / admin_users_select.
--   - No changes to auth.users, profiles schema, or any existing trigger.
--   - Safe to re-run (all objects use if not exists / or replace).
-- ===================================================================================

-- ─── 1. pg_trgm extension for fast ILIKE search ───────────────────────────────
create extension if not exists pg_trgm;

-- ─── 2. GIN trigram indexes — only on tables we own ────────────────────────────
create index if not exists idx_profiles_full_name_trgm
  on profiles using gin (full_name gin_trgm_ops);

create index if not exists idx_profile_contact_mobile_number_trgm
  on profile_contact using gin (mobile_number gin_trgm_ops);

-- Standard B-tree indexes for filter/sort columns (if not already present)
create index if not exists idx_profiles_gender on profiles (gender);
create index if not exists idx_profiles_completion on profiles (profile_completion_percent);
create index if not exists idx_profiles_created_at on profiles (created_at desc);

-- ─── 3. fn_admin_list_users RPC ────────────────────────────────────────────────
-- Single server-side query replacing the previous 5+ client-side round trips.
-- Reads email from auth.users and phone from profile_contact live (no
-- denormalization). Uses count(*) over() so the total and the page come out
-- of one scan.
create or replace function public.fn_admin_list_users(
  p_page int default 1,
  p_per_page int default 20,
  p_search text default null,
  p_gender text default null,
  p_tier text default null,
  p_status text default null
)
returns json
language plpgsql
security definer
stable
set search_path = public
as $$
declare
  v_offset int;
  v_total bigint;
  v_rows json;
begin
  -- Gate: only admins can call this
  if not is_admin() then
    raise exception 'Forbidden';
  end if;

  v_offset := (p_page - 1) * p_per_page;

  with paged as (
    select
      p.id,
      p.full_name,
      p.gender::text as gender,
      p.dob,
      au.email as email,
      pc.mobile_number as phone,
      p.is_active,
      p.profile_completion_percent,
      p.created_at,
      coalesce(mp.tier::text, 'free') as tier,
      mp.name as plan_name,
      (
        select photo.r2_key
        from profile_photos photo
        where photo.user_id = p.id and photo.is_primary = true
        limit 1
      ) as primary_photo_r2_key,
      count(*) over() as total_count
    from profiles p
    left join auth.users au on au.id = p.id
    left join profile_contact pc on pc.user_id = p.id
    left join user_subscriptions us on us.user_id = p.id and us.is_active = true
    left join membership_plans mp on mp.id = us.plan_id
    where
      -- Exclude admin users
      not exists (select 1 from admin_users adm where adm.id = p.id)
      -- Search filter (name, live email, live phone)
      and (p_search is null or p_search = '' or
           p.full_name ilike '%' || p_search || '%' or
           au.email ilike '%' || p_search || '%' or
           pc.mobile_number ilike '%' || p_search || '%')
      -- Gender filter
      and (p_gender is null or p_gender = '' or p.gender::text = p_gender)
      -- Tier filter
      and (p_tier is null or p_tier = '' or
           (p_tier = 'free' and (mp.tier is null or mp.tier::text = 'free')) or
           (p_tier <> 'free' and mp.tier::text = p_tier))
      -- Status filter
      and (p_status is null or p_status = '' or
           (p_status = 'complete' and p.profile_completion_percent > 50) or
           (p_status = 'incomplete' and (p.profile_completion_percent is null or p.profile_completion_percent <= 50)))
    order by p.created_at desc
    limit p_per_page
    offset v_offset
  )
  select
    coalesce(json_agg(json_build_object(
      'id', id,
      'full_name', full_name,
      'gender', gender,
      'dob', dob,
      'email', email,
      'phone', phone,
      'is_active', is_active,
      'profile_completion_percent', profile_completion_percent,
      'created_at', created_at,
      'tier', tier,
      'plan_name', plan_name,
      'primary_photo_r2_key', primary_photo_r2_key
    )), '[]'::json),
    coalesce(max(total_count), 0)
  into v_rows, v_total
  from paged;

  return json_build_object(
    'users', v_rows,
    'total', v_total
  );
end;
$$;

-- Grant execute to authenticated role (admin check happens inside the function)
grant execute on function public.fn_admin_list_users(int, int, text, text, text, text) to authenticated;
