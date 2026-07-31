-- Admin Notifications Migration

create or replace function public.fn_admin_send_notification(
  p_target_type text,
  p_target_tier membership_tier_enum default null,
  p_target_user_id uuid default null,
  p_title text default '',
  p_body text default '',
  p_type notification_type_enum default 'system',   -- fixed: was 'system_alert'
  p_screen text default null
) returns int
language plpgsql
security definer
set search_path = public
as $$
declare
  v_count int := 0;
  v_admin_id uuid := auth.uid();
  v_data jsonb;
begin
  if not is_admin() then
    raise exception 'Only admins can send manual notifications';
  end if;

  v_data := jsonb_build_object('source', 'admin', 'sent_by', v_admin_id);

  if p_screen is not null and p_screen != '' then
    v_data := v_data || jsonb_build_object('screen', p_screen);
  end if;

  with target_users as (
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
  ),
  inserted as (
    insert into public.notifications (user_id, type, title, body, data)
    select id, p_type, p_title, p_body, v_data
    from target_users
    returning id
  )
  select count(*) into v_count from inserted;

  return v_count;
end;
$$;

grant execute on function
  public.fn_admin_send_notification(text, membership_tier_enum, uuid, text, text, notification_type_enum, text)
to authenticated;

-- Allow admins to view and manage notifications in the admin portal
create policy notifications_admin_select on public.notifications
  for select using (public.is_admin());

create policy notifications_admin_delete on public.notifications
  for delete using (public.is_admin());
