-- Update fn_admin_list_users to return the FULL profile row, avoiding pop-in on the frontend
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
      p,
      au.email as email,
      pc.mobile_number as phone,
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
    coalesce(json_agg(
      to_jsonb(p) || jsonb_build_object(
        'email', email,
        'phone', phone,
        'tier', tier,
        'plan_name', plan_name,
        'primary_photo_r2_key', primary_photo_r2_key
      )
    ), '[]'::json),
    coalesce(max(total_count), 0)
  into v_rows, v_total
  from paged;

  return json_build_object(
    'users', v_rows,
    'total', v_total
  );
end;
$$;
