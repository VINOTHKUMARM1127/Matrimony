-- =============================================================================
-- PATCH 02 — REGISTRATION / PROFILE-COMPLETION UNBLOCK
-- =============================================================================
-- Fixes three root causes that made profile completion silently fail:
--   A) Missing columns the registration UI writes to (schema gaps).
--   B) Missing table-level GRANTs for the `authenticated` role -> every direct
--      write returned "permission denied for table ..." (the trigger and the
--      admin panel worked only because they run as definer/service_role).
--   C) Ensures own-row RLS policies exist for INSERT/UPDATE/DELETE so the grants
--      are safe (a user can only write their OWN rows).
--
-- Idempotent. Safe to run after 00_authoritative_schema.sql. No data destroyed.
-- =============================================================================

-- ─────────────────────────────────────────────────────────────────────────────
-- SECTION A — SCHEMA GAPS (columns the 8-step registration writes but were absent)
-- ─────────────────────────────────────────────────────────────────────────────

-- profiles: family occupations, languages, interests/hobbies
ALTER TABLE public.profiles
  ADD COLUMN IF NOT EXISTS father_occupation TEXT,
  ADD COLUMN IF NOT EXISTS mother_occupation TEXT,
  ADD COLUMN IF NOT EXISTS languages_known   TEXT[] DEFAULT ARRAY[]::TEXT[],
  ADD COLUMN IF NOT EXISTS interests         TEXT[] DEFAULT ARRAY[]::TEXT[],
  ADD COLUMN IF NOT EXISTS hobbies           TEXT[] DEFAULT ARRAY[]::TEXT[];

-- partner_preferences: height range, food habit, preferred stars (all arrays
-- except the numeric height bounds), matching the registration payload shapes.
ALTER TABLE public.partner_preferences
  ADD COLUMN IF NOT EXISTS height_min INTEGER,
  ADD COLUMN IF NOT EXISTS height_max INTEGER,
  ADD COLUMN IF NOT EXISTS food_habit TEXT[],
  ADD COLUMN IF NOT EXISTS star       TEXT[];

-- ─────────────────────────────────────────────────────────────────────────────
-- SECTION B — TABLE GRANTS (root cause of "permission denied for table")
-- ─────────────────────────────────────────────────────────────────────────────
-- The authenticated role had SELECT but no write privileges. RLS still applies
-- on top of these grants, so users can only affect their OWN rows (Section C).
GRANT USAGE ON SCHEMA public TO authenticated, anon;

GRANT SELECT, INSERT, UPDATE, DELETE ON public.profiles            TO authenticated;
GRANT SELECT, INSERT, UPDATE, DELETE ON public.partner_preferences TO authenticated;
GRANT SELECT, INSERT, UPDATE, DELETE ON public.horoscope_details   TO authenticated;
GRANT SELECT, INSERT, UPDATE, DELETE ON public.photos              TO authenticated;

-- Read-only surfaces the app reads anonymously / as authenticated.
GRANT SELECT ON public.tier_settings      TO authenticated, anon;
GRANT SELECT ON public.profiles           TO anon;
GRANT SELECT ON public.photos             TO anon;

-- Make future Supabase auto-grants consistent for these roles.
ALTER DEFAULT PRIVILEGES IN SCHEMA public
  GRANT SELECT, INSERT, UPDATE, DELETE ON TABLES TO authenticated;

-- ─────────────────────────────────────────────────────────────────────────────
-- SECTION C — OWN-ROW RLS POLICIES (so the grants above stay safe)
-- ─────────────────────────────────────────────────────────────────────────────

-- profiles ---------------------------------------------------------------------
ALTER TABLE public.profiles ENABLE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "profiles_select_active" ON public.profiles;
CREATE POLICY "profiles_select_active" ON public.profiles
  FOR SELECT USING (is_active = true OR auth.uid() = id);
DROP POLICY IF EXISTS "profiles_insert_own" ON public.profiles;
CREATE POLICY "profiles_insert_own" ON public.profiles
  FOR INSERT WITH CHECK (auth.uid() = id);
DROP POLICY IF EXISTS "profiles_update_own" ON public.profiles;
CREATE POLICY "profiles_update_own" ON public.profiles
  FOR UPDATE USING (auth.uid() = id) WITH CHECK (auth.uid() = id);

-- partner_preferences ----------------------------------------------------------
ALTER TABLE public.partner_preferences ENABLE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "pp_all_own" ON public.partner_preferences;
CREATE POLICY "pp_all_own" ON public.partner_preferences
  FOR ALL USING (auth.uid() = user_id) WITH CHECK (auth.uid() = user_id);

-- horoscope_details ------------------------------------------------------------
ALTER TABLE public.horoscope_details ENABLE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "horo_select_all" ON public.horoscope_details;
CREATE POLICY "horo_select_all" ON public.horoscope_details
  FOR SELECT USING (true);
DROP POLICY IF EXISTS "horo_write_own" ON public.horoscope_details;
CREATE POLICY "horo_write_own" ON public.horoscope_details
  FOR ALL USING (auth.uid() = user_id) WITH CHECK (auth.uid() = user_id);

-- photos -----------------------------------------------------------------------
ALTER TABLE public.photos ENABLE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "photos_select_all" ON public.photos;
CREATE POLICY "photos_select_all" ON public.photos
  FOR SELECT USING (true);
DROP POLICY IF EXISTS "photos_write_own" ON public.photos;
CREATE POLICY "photos_write_own" ON public.photos
  FOR ALL USING (auth.uid() = user_id) WITH CHECK (auth.uid() = user_id);

NOTIFY pgrst, 'reload schema';
-- =============================================================================
-- END PATCH 02
-- =============================================================================
