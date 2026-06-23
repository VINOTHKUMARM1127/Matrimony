-- ====================================================================
-- SCHEMA FIXES FOR APP REGISTRATION
-- Run this script in the Supabase SQL Editor
-- ====================================================================

-- 1. Add missing subcaste column to profiles
ALTER TABLE public.profiles ADD COLUMN IF NOT EXISTS subcaste text;

-- 2. Add missing dasa_balance column to horoscope_details
ALTER TABLE public.horoscope_details ADD COLUMN IF NOT EXISTS dasa_balance text;

-- 3. Fix Foreign Keys so Supabase PostgREST can join them automatically from profiles
-- Drop existing constraints that point to public.users
ALTER TABLE public.family_details DROP CONSTRAINT IF EXISTS family_details_user_id_fkey;
ALTER TABLE public.horoscope_details DROP CONSTRAINT IF EXISTS horoscope_details_user_id_fkey;
ALTER TABLE public.partner_preferences DROP CONSTRAINT IF EXISTS partner_preferences_user_id_fkey;
ALTER TABLE public.profile_photos DROP CONSTRAINT IF EXISTS profile_photos_user_id_fkey;
ALTER TABLE public.user_memberships DROP CONSTRAINT IF EXISTS user_memberships_user_id_fkey;

-- Add constraints pointing directly to public.profiles
ALTER TABLE public.family_details 
  ADD CONSTRAINT family_details_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.profiles(id) ON DELETE CASCADE;

ALTER TABLE public.horoscope_details 
  ADD CONSTRAINT horoscope_details_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.profiles(id) ON DELETE CASCADE;

ALTER TABLE public.partner_preferences 
  ADD CONSTRAINT partner_preferences_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.profiles(id) ON DELETE CASCADE;

ALTER TABLE public.profile_photos 
  ADD CONSTRAINT profile_photos_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.profiles(id) ON DELETE CASCADE;

ALTER TABLE public.user_memberships 
  ADD CONSTRAINT user_memberships_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.profiles(id) ON DELETE CASCADE;

-- Refresh PostgREST schema cache so the changes take effect immediately
NOTIFY pgrst, 'reload schema';
