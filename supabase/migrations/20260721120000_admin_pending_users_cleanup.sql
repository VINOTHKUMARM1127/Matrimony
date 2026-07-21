-- =====================================================================================
-- ADMIN: PENDING VERIFICATION USERS + SAFE CLEANUP
-- Provides functions to list and clean up auth.users who never completed
-- profile setup (no row in profiles table). These are "ghost" accounts
-- that block re-registration but are invisible in the normal admin user list.
--
-- Safe to run as-is: every statement uses CREATE OR REPLACE.
-- =====================================================================================

-- 1. List pending/stuck auth users who have NO profile row.
--    Returns: id, email, phone, created_at, email_confirmed_at, age_minutes, status
--    Status: 'in_progress' if < 15 min old, 'abandoned' if older.
--    Gated by is_admin().
create or replace function public.fn_admin_list_pending_users(
  p_page int default 1,
  p_per_page int default 20,
  p_search text default null
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

  with pending as (
    select
      au.id,
      au.email,
      au.phone,
      au.created_at,
      au.confirmation_sent_at,
      au.email_confirmed_at,
      extract(epoch from (now() - au.created_at)) / 60.0 as age_minutes,
      case
        when extract(epoch from (now() - au.created_at)) / 60.0 < 15 then 'in_progress'
        else 'abandoned'
      end as status,
      count(*) over() as total_count
    from auth.users au
    left join profiles p on p.id = au.id
    where
      -- Only users with NO profile row
      p.id is null
      -- Exclude admin users
      and not exists (select 1 from admin_users adm where adm.id = au.id)
      -- Search filter (email or phone)
      and (p_search is null or p_search = '' or
           au.email ilike '%' || p_search || '%' or
           au.phone ilike '%' || p_search || '%')
    order by au.created_at desc
    limit p_per_page
    offset v_offset
  )
  select
    coalesce(json_agg(
      json_build_object(
        'id', id,
        'email', email,
        'phone', phone,
        'created_at', created_at,
        'confirmation_sent_at', confirmation_sent_at,
        'email_confirmed_at', email_confirmed_at,
        'age_minutes', round(age_minutes::numeric, 1),
        'status', status
      )
    ), '[]'::json),
    coalesce(max(total_count), 0)
  into v_rows, v_total
  from pending;

  return json_build_object(
    'users', v_rows,
    'total', v_total
  );
end;
$$;


-- 2. Get IDs of abandoned auth users (no profile, older than threshold).
--    Used by the admin "Clean Up Abandoned" action.
--    Default threshold: 15 minutes.
create or replace function public.fn_admin_get_abandoned_user_ids(
  p_min_age_minutes int default 15
)
returns json
language plpgsql
security definer
stable
set search_path = public
as $$
declare
  v_ids json;
  v_count bigint;
begin
  -- Gate: only admins can call this
  if not is_admin() then
    raise exception 'Forbidden';
  end if;

  select
    coalesce(json_agg(au.id), '[]'::json),
    count(*)
  into v_ids, v_count
  from auth.users au
  left join profiles p on p.id = au.id
  where
    p.id is null
    and not exists (select 1 from admin_users adm where adm.id = au.id)
    and extract(epoch from (now() - au.created_at)) / 60.0 >= p_min_age_minutes;

  return json_build_object(
    'ids', v_ids,
    'count', v_count
  );
end;
$$;


-- 3. Auto-cleanup function for pg_cron: deletes unconfirmed auth users
--    older than 48 hours who have no profile row.
--    This uses auth.admin API indirectly — since pg_cron runs as postgres
--    superuser, we can delete directly from auth.users.
create or replace function public.fn_cleanup_abandoned_signups()
returns int
language plpgsql
security definer
set search_path = public
as $$
declare
  v_deleted int := 0;
  v_user_id uuid;
begin
  for v_user_id in
    select au.id
    from auth.users au
    left join profiles p on p.id = au.id
    where
      p.id is null
      and not exists (select 1 from admin_users adm where adm.id = au.id)
      and au.created_at < now() - interval '48 hours'
  loop
    begin
      delete from auth.users where id = v_user_id;
      v_deleted := v_deleted + 1;
    exception when others then
      -- Log but continue — don't let one stuck row block the whole job
      raise warning 'Failed to delete abandoned user %: %', v_user_id, sqlerrm;
    end;
  end loop;

  return v_deleted;
end;
$$;

-- 4. Schedule nightly cleanup at 2:30 AM IST (21:00 UTC previous day)
-- Remove existing schedule if present, then add fresh
select cron.unschedule('cleanup-abandoned-signups')
  where exists (
    select 1 from cron.job where jobname = 'cleanup-abandoned-signups'
  );

select cron.schedule(
  'cleanup-abandoned-signups',
  '0 21 * * *',  -- 2:30 AM IST = 21:00 UTC
  $$select public.fn_cleanup_abandoned_signups()$$
);
