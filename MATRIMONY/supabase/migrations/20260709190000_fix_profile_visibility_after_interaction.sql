-- =====================================================================================
-- Fix: profile visibility permanently lost after sending interest / passing on a profile
--
-- ROOT CAUSE
-- fn_send_interest / fn_mark_not_interested (see 20260709120000_fix_interests_and_
-- distribution.sql) delete the matching distributed_profiles row so the card stops
-- reappearing in Matches. That's correct for the Matches feed, but profiles_select,
-- profile_photos_select, registration_meta_select, user_family_select and
-- user_lifestyle_select ONLY grant visibility into another user's row via:
--   auth.uid() = id  OR  is_admin()  OR  exists(distributed_profiles row)
-- Deleting that row silently revokes read access to that person's data. The app
-- doesn't notice mid-session because Matches/Interests screens optimistically seed
-- the React Query cache with the profile object already on screen. On app restart
-- the cache is gone, a real query runs, RLS returns nothing for that profile, and the
-- Interests / Sent / Received / Not-Interested lists render empty (their render
-- functions drop any card with no resolved profile).
--
-- FIX
-- Add a helper, has_interacted_with(), that is true whenever an interests row or a
-- not_interested row exists between the two users (in either direction for interests).
-- Extend the 5 affected SELECT policies to also allow access when this is true. This
-- does NOT re-add the profile to distributed_profiles and does NOT undo the "hide
-- from Matches" fix -- fn_distribute_profiles already excludes anyone with an
-- interests/not_interested row from being re-distributed. This purely restores read
-- access to profile data for people you've already interacted with.
-- =====================================================================================

create or replace function public.has_interacted_with(p_viewer uuid, p_target uuid)
returns boolean
language sql
stable
security definer
set search_path = public
as $$
  select
    exists (
      select 1 from interests i
      where (i.sender_id = p_viewer and i.receiver_id = p_target)
         or (i.receiver_id = p_viewer and i.sender_id = p_target)
    )
    or exists (
      select 1 from not_interested ni
      where ni.user_id = p_viewer and ni.target_user_id = p_target
    );
$$;

comment on function public.has_interacted_with(uuid, uuid) is
  'True if p_viewer has sent/received an interest with p_target, or passed on p_target. Used to keep profile data visible in Interests/Not-Interested lists after the distributed_profiles row is removed from the Matches feed.';

-- ---- profiles --------------------------------------------------------------------
drop policy if exists profiles_select on profiles;
create policy profiles_select on profiles for select using (
  auth.uid() = id
  or is_admin()
  or exists (select 1 from distributed_profiles dp where dp.user_id = auth.uid() and dp.profile_id = profiles.id)
  or public.has_interacted_with(auth.uid(), profiles.id)
);

-- ---- profile_photos ----------------------------------------------------------------
drop policy if exists photos_select on profile_photos;
create policy photos_select on profile_photos for select using (
  auth.uid() = user_id
  or is_admin()
  or exists (select 1 from distributed_profiles dp where dp.user_id = auth.uid() and dp.profile_id = profile_photos.user_id)
  or public.has_interacted_with(auth.uid(), profile_photos.user_id)
);

-- ---- registration_meta / user_family / user_lifestyle -------------------------------
do $$
declare
  t text;
begin
  foreach t in array array['registration_meta','user_family','user_lifestyle'] loop
    execute format('drop policy if exists %I on %I;', t || '_select', t);
    execute format(
      'create policy %I on %I for select using (
         auth.uid() = user_id or is_admin()
         or exists (select 1 from distributed_profiles dp where dp.user_id = auth.uid() and dp.profile_id = %I.user_id)
         or public.has_interacted_with(auth.uid(), %I.user_id)
       );', t || '_select', t, t, t
    );
  end loop;
end $$;

grant execute on function public.has_interacted_with(uuid, uuid) to authenticated;
