-- Fix admin inserts by adding is_admin() check to insert policies

-- registration_meta
drop policy if exists registration_meta_insert on registration_meta;
create policy registration_meta_insert on registration_meta for insert with check (auth.uid() = user_id or is_admin());

-- user_family
drop policy if exists user_family_insert on user_family;
create policy user_family_insert on user_family for insert with check (auth.uid() = user_id or is_admin());

-- user_lifestyle
drop policy if exists user_lifestyle_insert on user_lifestyle;
create policy user_lifestyle_insert on user_lifestyle for insert with check (auth.uid() = user_id or is_admin());

-- profile_contact
drop policy if exists profile_contact_insert on profile_contact;
create policy profile_contact_insert on profile_contact for insert with check (auth.uid() = user_id or is_admin());

-- user_horoscope
drop policy if exists user_horoscope_insert on user_horoscope;
create policy user_horoscope_insert on user_horoscope for insert with check (auth.uid() = user_id or is_admin());

-- partner_preferences
drop policy if exists prefs_insert on partner_preferences;
create policy prefs_insert on partner_preferences for insert with check (auth.uid() = user_id or is_admin());

-- not_interested
drop policy if exists ni_insert on not_interested;
create policy ni_insert on not_interested for insert with check (auth.uid() = user_id or is_admin());

-- profiles
drop policy if exists profiles_insert on profiles;
create policy profiles_insert on profiles for insert with check (auth.uid() = id or is_admin());
