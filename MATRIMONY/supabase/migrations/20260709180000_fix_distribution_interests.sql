-- Fix fn_distribute_profiles to exclude profiles that already have an interest interaction
-- (sent, received, or accepted) to prevent them from re-appearing in the distributed pool.

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
      and not exists (
        select 1 from interests i
        where (i.sender_id = p_user_id and i.receiver_id = p.id)
           or (i.receiver_id = p_user_id and i.sender_id = p.id)
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
