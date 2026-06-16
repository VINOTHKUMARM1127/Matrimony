-- ============================================================
-- FIX MISSING COLUMNS AND PERMISSIONS
-- Run this script in your Supabase SQL Editor
-- ============================================================

-- 1. Add missing columns to profiles table
ALTER TABLE public.profiles 
  ADD COLUMN IF NOT EXISTS brothers_count INTEGER DEFAULT 0,
  ADD COLUMN IF NOT EXISTS sisters_count INTEGER DEFAULT 0,
  ADD COLUMN IF NOT EXISTS brothers_married INTEGER DEFAULT 0,
  ADD COLUMN IF NOT EXISTS sisters_married INTEGER DEFAULT 0;

-- 2. Create horoscope_details table if missing
CREATE TABLE IF NOT EXISTS public.horoscope_details (
  id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
  user_id UUID REFERENCES public.profiles(id) ON DELETE CASCADE UNIQUE,
  star TEXT,
  raasi TEXT,
  lagnam TEXT,
  dasa_balance TEXT,
  gothram TEXT,
  horoscope_chart JSONB,
  manglik TEXT CHECK (manglik IN ('yes','no','not_applicable')),
  created_at TIMESTAMPTZ DEFAULT NOW(),
  updated_at TIMESTAMPTZ DEFAULT NOW()
);

-- 3. Add missing columns to partner_preferences
ALTER TABLE public.partner_preferences 
  ADD COLUMN IF NOT EXISTS education TEXT[];

-- 4. Fix RLS policies to allow UPSERT for profiles
-- Drop existing policies if they exist
DROP POLICY IF EXISTS "Anyone can view active profiles" ON profiles;
DROP POLICY IF EXISTS "Users can view own profile" ON profiles;
DROP POLICY IF EXISTS "Users can update own profile" ON profiles;
DROP POLICY IF EXISTS "Users can insert own profile" ON profiles;
DROP POLICY IF EXISTS "Users can manage own profile" ON profiles;

-- Recreate policies with full access for own profile
CREATE POLICY "Anyone can view active profiles" ON profiles
  FOR SELECT USING (is_active = true);

CREATE POLICY "Users can manage own profile" ON profiles
  FOR ALL USING (auth.uid() = id) WITH CHECK (auth.uid() = id);

-- 5. Fix RLS for horoscope_details
ALTER TABLE public.horoscope_details ENABLE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "Users can view all horoscopes" ON horoscope_details;
DROP POLICY IF EXISTS "Users can manage own horoscope" ON horoscope_details;

CREATE POLICY "Users can view all horoscopes" ON horoscope_details
  FOR SELECT USING (true);

CREATE POLICY "Users can manage own horoscope" ON horoscope_details
  FOR ALL USING (auth.uid() = user_id) WITH CHECK (auth.uid() = user_id);

-- 6. Fix RLS for partner_preferences
ALTER TABLE public.partner_preferences ENABLE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "Users can view own preferences" ON partner_preferences;
DROP POLICY IF EXISTS "Users can manage own preferences" ON partner_preferences;

CREATE POLICY "Users can view own preferences" ON partner_preferences
  FOR SELECT USING (auth.uid() = user_id);

CREATE POLICY "Users can manage own preferences" ON partner_preferences
  FOR ALL USING (auth.uid() = user_id) WITH CHECK (auth.uid() = user_id);

-- 7. Force schema cache reload so the API picks up the changes immediately
NOTIFY pgrst, 'reload schema';
