-- Allow admins to view and manage notifications in the admin portal
create policy notifications_admin_select on public.notifications
  for select using (public.is_admin());

create policy notifications_admin_delete on public.notifications
  for delete using (public.is_admin());
