-- =====================================================================================
-- Change annual_income to text to support range strings (e.g., "1L_2L", "50L_1Cr")
-- =====================================================================================

-- First, we must drop the function that depends on the numeric return type
drop function if exists public.get_profiles_from_pool(uuid, distribution_section_enum, int, int);

-- Now we can safely alter the column type
alter table profiles 
  alter column annual_income type text using annual_income::text;

-- Recreate the RPC with the updated return type (annual_income text instead of numeric)
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
  annual_income text,
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
