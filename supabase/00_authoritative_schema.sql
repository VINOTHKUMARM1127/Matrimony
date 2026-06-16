-- =============================================================================
-- TAMIL MATRIMONY — CONSOLIDATED AUTHORITATIVE SCHEMA  (00_authoritative_schema.sql)
-- =============================================================================
-- THE SINGLE SOURCE OF TRUTH. Run this once in the Supabase SQL Editor.
--
-- Design principles (do not violate):
--   * tier_settings is the ONLY place limits/quotas/prices/plan-names live.
--   * No limit is ever stored permanently on a profile row.
--   * Every feed RPC reads tier_settings LIVE on each call -> admin edits are
--     instant (no logout / reinstall / cache-clear).
--   * Quota balances (contacts_remaining/interests_remaining) ARE stored on the
--     profile because they are a consumable wallet, not a limit.
--   * Idempotent: safe to re-run. Uses IF NOT EXISTS / CREATE OR REPLACE and
--     never drops the profiles table or user data.
--
-- This file SUPERSEDES and makes obsolete the following (do not run them):
--   strict_backend_limits.sql, strict_backend_limits_patch.sql,
--   premium_stacking_and_admin.sql, tier_quotas.sql, tier_settings_migration.sql,
--   purchase_subscription_fix.sql, enforce_strict_rls_limits.sql,
--   update_premium_plans_schema.sql, fix_admin_rpcs.sql, fix_missing_columns.sql
-- =============================================================================

CREATE EXTENSION IF NOT EXISTS "uuid-ossp";
CREATE EXTENSION IF NOT EXISTS pgcrypto;

-- =============================================================================
-- SECTION 1 — SCHEMA RECONCILIATION (additive, non-destructive)
-- =============================================================================

-- 1a. tier_settings: ensure all columns the admin panel + RPCs expect exist.
CREATE TABLE IF NOT EXISTS public.tier_settings (
  tier TEXT PRIMARY KEY CHECK (tier IN ('free','silver','gold','platinum'))
);
ALTER TABLE public.tier_settings
  ADD COLUMN IF NOT EXISTS recommended_limit      INT     NOT NULL DEFAULT 0,
  ADD COLUMN IF NOT EXISTS nearby_limit           INT     NOT NULL DEFAULT 0,
  ADD COLUMN IF NOT EXISTS daily_limit            INT     NOT NULL DEFAULT 0,
  ADD COLUMN IF NOT EXISTS dynamic_daily_enabled  BOOLEAN NOT NULL DEFAULT false,
  ADD COLUMN IF NOT EXISTS plan_name              TEXT,
  ADD COLUMN IF NOT EXISTS price_inr              INTEGER DEFAULT 0,
  ADD COLUMN IF NOT EXISTS duration_months        INTEGER DEFAULT 0,
  ADD COLUMN IF NOT EXISTS contacts_limit         INTEGER DEFAULT 0,
  ADD COLUMN IF NOT EXISTS interests_limit        INTEGER DEFAULT 0,
  ADD COLUMN IF NOT EXISTS features               JSONB   DEFAULT '[]'::jsonb,
  ADD COLUMN IF NOT EXISTS color_code             TEXT    DEFAULT '#AAAAAA',
  ADD COLUMN IF NOT EXISTS is_popular             BOOLEAN DEFAULT false,
  ADD COLUMN IF NOT EXISTS updated_at             TIMESTAMPTZ DEFAULT NOW();

-- Seed the four tiers ONLY if missing. Never overwrite admin-tuned values on re-run.
INSERT INTO public.tier_settings
  (tier, recommended_limit, nearby_limit, daily_limit, dynamic_daily_enabled,
   plan_name, price_inr, duration_months, contacts_limit, interests_limit, features, color_code, is_popular)
VALUES
  ('free',     5,  5,  5,  false, 'Free',     0,    0, 0,   0,   '[]'::jsonb, '#AAAAAA', false),
  ('silver',  50, 50, 20,  true,  'Silver',   499,  1, 30,  50,  '["View 30 contact numbers","Send up to 50 interests"]'::jsonb,  '#8A8A8A', false),
  ('gold',   100,100, 30,  true,  'Gold',     999,  1, 50,  100, '["View 50 contact numbers","Send up to 100 interests"]'::jsonb, '#D4AF37', true),
  ('platinum',200,200,50,  true,  'Platinum', 2499, 3, 100, 300, '["View 100 contact numbers","Send up to 300 interests"]'::jsonb,'#E5E4E2', false)
ON CONFLICT (tier) DO NOTHING;

-- 1b. profiles: ensure quota wallet + tier columns exist (no limits stored here).
ALTER TABLE public.profiles
  ADD COLUMN IF NOT EXISTS tier TEXT DEFAULT 'free',
  ADD COLUMN IF NOT EXISTS premium_expires_at   TIMESTAMPTZ,
  ADD COLUMN IF NOT EXISTS contacts_remaining   INTEGER DEFAULT 0,
  ADD COLUMN IF NOT EXISTS interests_remaining  INTEGER DEFAULT 0,
  ADD COLUMN IF NOT EXISTS is_premium           BOOLEAN DEFAULT false;

-- 1c. subscriptions: add the payment-id column the app expects (4-arg purchase).
ALTER TABLE public.subscriptions
  ADD COLUMN IF NOT EXISTS razorpay_payment_id TEXT,
  ADD COLUMN IF NOT EXISTS amount              INTEGER DEFAULT 0,
  ADD COLUMN IF NOT EXISTS contacts_added      INTEGER DEFAULT 0,
  ADD COLUMN IF NOT EXISTS interests_added     INTEGER DEFAULT 0,
  ADD COLUMN IF NOT EXISTS status              TEXT    DEFAULT 'active';

-- 1d. interests: add optional message column (app sends a message).
ALTER TABLE public.interests
  ADD COLUMN IF NOT EXISTS message TEXT;

-- 1e. partner_preferences: full preference surface used by Recommended filtering.
ALTER TABLE public.partner_preferences
  ADD COLUMN IF NOT EXISTS age_min         INTEGER DEFAULT 18,
  ADD COLUMN IF NOT EXISTS age_max         INTEGER DEFAULT 60,
  ADD COLUMN IF NOT EXISTS religion        TEXT[],
  ADD COLUMN IF NOT EXISTS caste           TEXT[],
  ADD COLUMN IF NOT EXISTS education       TEXT[],
  ADD COLUMN IF NOT EXISTS occupation      TEXT[],
  ADD COLUMN IF NOT EXISTS marital_status  TEXT[],
  ADD COLUMN IF NOT EXISTS districts       TEXT[],
  ADD COLUMN IF NOT EXISTS states          TEXT[];

-- 1f. user_profile_views: per-day rotation window state.
CREATE TABLE IF NOT EXISTS public.user_profile_views (
  user_id UUID REFERENCES public.profiles(id) ON DELETE CASCADE,
  section TEXT CHECK (section IN ('recommended','nearby','daily')),
  profile_ids UUID[] DEFAULT ARRAY[]::UUID[],
  last_updated DATE DEFAULT CURRENT_DATE,
  PRIMARY KEY (user_id, section)
);
ALTER TABLE public.user_profile_views
  ADD COLUMN IF NOT EXISTS todays_ids  UUID[] DEFAULT ARRAY[]::UUID[],
  ADD COLUMN IF NOT EXISTS todays_date DATE;

-- 1g. reports: used by admin ReportManagement + "exclude reported" feed rule.
CREATE TABLE IF NOT EXISTS public.reports (
  id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
  reporter_id      UUID REFERENCES public.profiles(id) ON DELETE CASCADE,
  reported_user_id UUID REFERENCES public.profiles(id) ON DELETE CASCADE,
  reason TEXT,
  status TEXT DEFAULT 'pending' CHECK (status IN ('pending','resolved','dismissed')),
  admin_notes TEXT,
  created_at TIMESTAMPTZ DEFAULT NOW(),
  resolved_at TIMESTAMPTZ
);

-- 1h. district_adjacency: drives the Nearby cascade (Priority 2 = adjacent).
CREATE TABLE IF NOT EXISTS public.district_adjacency (
  district  TEXT NOT NULL,
  neighbor  TEXT NOT NULL,
  PRIMARY KEY (district, neighbor)
);

-- =============================================================================
-- SECTION 2 — TAMIL NADU DISTRICT ADJACENCY MAP (admin-extensible data)
-- =============================================================================
-- One-directional rows; we insert both directions explicitly so the Nearby
-- cascade can rank adjacent districts above state-level regardless of which
-- side the viewer is on. Safe to re-run (ON CONFLICT DO NOTHING).
INSERT INTO public.district_adjacency (district, neighbor) VALUES
  -- Coimbatore cluster
  ('Coimbatore','Tiruppur'),('Coimbatore','Erode'),('Coimbatore','Nilgiris'),('Coimbatore','Salem'),('Coimbatore','Dindigul'),
  ('Tiruppur','Coimbatore'),('Tiruppur','Erode'),('Tiruppur','Dindigul'),('Tiruppur','Karur'),
  -- Erode cluster
  ('Erode','Coimbatore'),('Erode','Tiruppur'),('Erode','Salem'),('Erode','Namakkal'),('Erode','Karur'),('Erode','Nilgiris'),
  -- Salem cluster
  ('Salem','Erode'),('Salem','Namakkal'),('Salem','Dharmapuri'),('Salem','Krishnagiri'),('Salem','Coimbatore'),
  -- Namakkal / Karur / Trichy cluster
  ('Namakkal','Salem'),('Namakkal','Erode'),('Namakkal','Karur'),('Namakkal','Tiruchirappalli'),
  ('Karur','Erode'),('Karur','Namakkal'),('Karur','Tiruchirappalli'),('Karur','Dindigul'),('Karur','Tiruppur'),
  ('Tiruchirappalli','Karur'),('Tiruchirappalli','Namakkal'),('Tiruchirappalli','Perambalur'),('Tiruchirappalli','Pudukkottai'),
  -- Madurai / Dindigul cluster
  ('Madurai','Dindigul'),('Madurai','Theni'),('Madurai','Sivaganga'),('Madurai','Virudhunagar'),
  ('Dindigul','Madurai'),('Dindigul','Karur'),('Dindigul','Tiruppur'),('Dindigul','Theni'),
  -- Tirunelveli cluster
  ('Tirunelveli','Thoothukudi'),('Tirunelveli','Virudhunagar'),('Tirunelveli','Tenkasi'),('Tirunelveli','Kanyakumari'),
  -- Vellore cluster
  ('Vellore','Tiruvannamalai'),('Vellore','Krishnagiri'),('Vellore','Ranipet'),('Vellore','Tirupathur'),
  -- Chennai metro cluster
  ('Chennai','Tiruvallur'),('Chennai','Kancheepuram'),('Chennai','Chengalpattu')
ON CONFLICT DO NOTHING;

-- =============================================================================
-- SECTION 3 — QUOTA / PURCHASE / INTEREST / CONTACT RPCS
-- =============================================================================

-- 3a. purchase_subscription — ONE canonical 4-arg signature.
--     Derives duration/contacts/interests FROM tier_settings (no hardcoding).
--     Used by BOTH the mobile app and the admin panel.
DROP FUNCTION IF EXISTS public.purchase_subscription(UUID, TEXT, INTEGER, INTEGER, INTEGER);
DROP FUNCTION IF EXISTS public.purchase_subscription(UUID, TEXT, TEXT, INTEGER);
DROP FUNCTION IF EXISTS public.purchase_subscription(UUID, TEXT);

CREATE OR REPLACE FUNCTION public.purchase_subscription(
  p_user_id    UUID,
  p_plan_type  TEXT,
  p_payment_id TEXT    DEFAULT NULL,
  p_amount     INTEGER DEFAULT NULL
) RETURNS JSONB
SECURITY DEFINER SET search_path = public AS $$
DECLARE
  v_duration_months INTEGER;
  v_contacts        INTEGER;
  v_interests       INTEGER;
  v_price           INTEGER;
  v_current_expiry  TIMESTAMPTZ;
  v_new_expiry      TIMESTAMPTZ;
BEGIN
  IF p_plan_type IN ('free','non_premium') THEN
    RAISE EXCEPTION 'INVALID_PLAN: cannot purchase the free tier';
  END IF;

  -- Single source of truth: tier_settings
  SELECT duration_months, contacts_limit, interests_limit, price_inr
    INTO v_duration_months, v_contacts, v_interests, v_price
  FROM tier_settings WHERE tier = p_plan_type;

  IF v_duration_months IS NULL THEN
    RAISE EXCEPTION 'INVALID_PLAN_TYPE: %', p_plan_type;
  END IF;

  -- Stacking: extend from existing expiry if still active.
  SELECT premium_expires_at INTO v_current_expiry FROM profiles WHERE id = p_user_id;
  IF v_current_expiry IS NOT NULL AND v_current_expiry > NOW() THEN
    v_new_expiry := v_current_expiry + (v_duration_months || ' months')::INTERVAL;
  ELSE
    v_new_expiry := NOW() + (v_duration_months || ' months')::INTERVAL;
  END IF;

  UPDATE profiles SET
    tier                = p_plan_type,
    is_premium          = true,
    is_verified         = true,
    premium_expires_at  = v_new_expiry,
    contacts_remaining  = GREATEST(0, COALESCE(contacts_remaining,0))  + v_contacts,
    interests_remaining = GREATEST(0, COALESCE(interests_remaining,0)) + v_interests
  WHERE id = p_user_id;

  INSERT INTO subscriptions
    (user_id, plan_type, status, amount, razorpay_payment_id, contacts_added, interests_added, starts_at, expires_at)
  VALUES
    (p_user_id, p_plan_type, 'active', COALESCE(p_amount, v_price), p_payment_id, v_contacts, v_interests, NOW(), v_new_expiry);

  RETURN jsonb_build_object(
    'success', true, 'tier', p_plan_type, 'expires_at', v_new_expiry,
    'contacts_added', v_contacts, 'interests_added', v_interests
  );
END;
$$ LANGUAGE plpgsql;

-- 3b. send_interest_with_quota — canonical 3-arg (optional message).
DROP FUNCTION IF EXISTS public.send_interest_with_quota(UUID, UUID);
DROP FUNCTION IF EXISTS public.send_interest_with_quota(UUID, UUID, TEXT);

CREATE OR REPLACE FUNCTION public.send_interest_with_quota(
  p_sender_id   UUID,
  p_receiver_id UUID,
  p_message     TEXT DEFAULT NULL
) RETURNS JSONB
SECURITY DEFINER SET search_path = public AS $$
DECLARE
  v_remaining INTEGER;
  v_existing  RECORD;
BEGIN
  -- Re-sending to someone you already messaged just re-opens it (no quota burn).
  SELECT * INTO v_existing FROM interests
   WHERE sender_id = p_sender_id AND receiver_id = p_receiver_id;
  IF v_existing IS NOT NULL THEN
    UPDATE interests
       SET status = 'pending', message = COALESCE(p_message, message), updated_at = NOW()
     WHERE id = v_existing.id;
    RETURN jsonb_build_object('success', true, 'reopened', true);
  END IF;

  SELECT interests_remaining INTO v_remaining FROM profiles WHERE id = p_sender_id;

  IF COALESCE(v_remaining,0) <= 0 THEN
    RAISE EXCEPTION 'QUOTA_EXCEEDED: No interests remaining';
  END IF;

  -- Deduct (never below zero) unless unlimited (-1).
  IF v_remaining > 0 THEN
    UPDATE profiles SET interests_remaining = interests_remaining - 1 WHERE id = p_sender_id;
  END IF;

  INSERT INTO interests (sender_id, receiver_id, status, message)
  VALUES (p_sender_id, p_receiver_id, 'pending', p_message)
  ON CONFLICT (sender_id, receiver_id) DO UPDATE SET status = 'pending';

  RETURN jsonb_build_object('success', true, 'reopened', false);
END;
$$ LANGUAGE plpgsql;

-- 3c. unlock_contact — canonical, decrements wallet, never negative.
DROP FUNCTION IF EXISTS public.unlock_contact(UUID, UUID);
CREATE OR REPLACE FUNCTION public.unlock_contact(
  p_viewer_id UUID,
  p_viewed_id UUID
) RETURNS JSONB
SECURITY DEFINER SET search_path = public AS $$
DECLARE
  v_remaining INTEGER;
  v_seen      BOOLEAN;
BEGIN
  IF p_viewer_id = p_viewed_id THEN
    RETURN jsonb_build_object('success', true, 'self', true);
  END IF;

  SELECT EXISTS(SELECT 1 FROM contact_views WHERE viewer_id = p_viewer_id AND viewed_id = p_viewed_id) INTO v_seen;
  IF v_seen THEN RETURN jsonb_build_object('success', true, 'already_unlocked', true); END IF;

  SELECT contacts_remaining INTO v_remaining FROM profiles WHERE id = p_viewer_id;
  IF COALESCE(v_remaining,0) <= 0 THEN
    RAISE EXCEPTION 'QUOTA_EXCEEDED: No contacts remaining';
  END IF;

  IF v_remaining > 0 THEN
    UPDATE profiles SET contacts_remaining = contacts_remaining - 1 WHERE id = p_viewer_id;
  END IF;

  INSERT INTO contact_views (viewer_id, viewed_id) VALUES (p_viewer_id, p_viewed_id)
  ON CONFLICT (viewer_id, viewed_id) DO NOTHING;

  RETURN jsonb_build_object('success', true, 'already_unlocked', false);
END;
$$ LANGUAGE plpgsql;

-- 3d. pass_profile — record "not interested" (no quota burn).
DROP FUNCTION IF EXISTS public.pass_profile(UUID, UUID);
CREATE OR REPLACE FUNCTION public.pass_profile(
  p_sender_id   UUID,
  p_receiver_id UUID
) RETURNS JSONB
SECURITY DEFINER SET search_path = public AS $$
BEGIN
  INSERT INTO interests (sender_id, receiver_id, status)
  VALUES (p_sender_id, p_receiver_id, 'passed')
  ON CONFLICT (sender_id, receiver_id) DO UPDATE SET status = 'passed', updated_at = NOW();
  RETURN jsonb_build_object('success', true);
END;
$$ LANGUAGE plpgsql;

-- 3e. get_user_quotas — the SINGLE dashboard quota source.
--     Returns plan, expiry, wallet balances, AND live distribution limits.
DROP FUNCTION IF EXISTS public.get_user_quotas(UUID);
CREATE OR REPLACE FUNCTION public.get_user_quotas(p_user_id UUID)
RETURNS JSONB
SECURITY DEFINER SET search_path = public AS $$
DECLARE
  v_prof RECORD;
  v_ts   RECORD;
  v_tier TEXT;
BEGIN
  SELECT tier, is_premium, premium_expires_at, contacts_remaining, interests_remaining
    INTO v_prof FROM profiles WHERE id = p_user_id;

  IF v_prof IS NULL THEN
    RETURN jsonb_build_object('tier','FREE','contacts_remaining',0,'interests_remaining',0);
  END IF;

  -- Expire lapsed premium on read (self-healing, no cron needed).
  v_tier := COALESCE(v_prof.tier, 'free');
  IF v_prof.is_premium AND v_prof.premium_expires_at IS NOT NULL AND v_prof.premium_expires_at < NOW() THEN
    UPDATE profiles SET is_premium = false, tier = 'free' WHERE id = p_user_id;
    v_tier := 'free';
  END IF;

  SELECT * INTO v_ts FROM tier_settings WHERE tier = v_tier;

  RETURN jsonb_build_object(
    'tier',                UPPER(v_tier),
    'is_premium',          (v_tier <> 'free'),
    'expires_at',          v_prof.premium_expires_at,
    'contacts_remaining',  COALESCE(v_prof.contacts_remaining, 0),
    'interests_remaining', COALESCE(v_prof.interests_remaining, 0),
    'recommended_limit',   COALESCE(v_ts.recommended_limit, 0),
    'nearby_limit',        COALESCE(v_ts.nearby_limit, 0),
    'daily_limit',         COALESCE(v_ts.daily_limit, 0),
    'dynamic_daily_enabled', COALESCE(v_ts.dynamic_daily_enabled, false)
  );
END;
$$ LANGUAGE plpgsql;

-- =============================================================================
-- SECTION 4 — ADMIN RPCS
-- =============================================================================

-- 4a. update_tier_settings — full 13-arg, COALESCE-merge (admin panel).
DROP FUNCTION IF EXISTS public.update_tier_settings(TEXT,INT,INT,INT,BOOLEAN);
CREATE OR REPLACE FUNCTION public.update_tier_settings(
  p_tier TEXT, p_rec INT, p_near INT, p_daily INT, p_dyn BOOLEAN,
  p_plan_name TEXT DEFAULT NULL, p_price_inr INT DEFAULT NULL, p_duration_months INT DEFAULT NULL,
  p_contacts_limit INT DEFAULT NULL, p_interests_limit INT DEFAULT NULL, p_features JSONB DEFAULT NULL,
  p_color_code TEXT DEFAULT NULL, p_is_popular BOOLEAN DEFAULT NULL
) RETURNS VOID
SECURITY DEFINER SET search_path = public AS $$
BEGIN
  UPDATE public.tier_settings SET
    recommended_limit     = COALESCE(p_rec, recommended_limit),
    nearby_limit          = COALESCE(p_near, nearby_limit),
    daily_limit           = COALESCE(p_daily, daily_limit),
    dynamic_daily_enabled = COALESCE(p_dyn, dynamic_daily_enabled),
    plan_name             = COALESCE(p_plan_name, plan_name),
    price_inr             = COALESCE(p_price_inr, price_inr),
    duration_months       = COALESCE(p_duration_months, duration_months),
    contacts_limit        = COALESCE(p_contacts_limit, contacts_limit),
    interests_limit       = COALESCE(p_interests_limit, interests_limit),
    features              = COALESCE(p_features, features),
    color_code            = COALESCE(p_color_code, color_code),
    is_popular            = COALESCE(p_is_popular, is_popular),
    updated_at            = NOW()
  WHERE tier = p_tier;
END;
$$ LANGUAGE plpgsql;

-- 4b. get_all_user_emails / delete_auth_user (admin panel helpers).
CREATE OR REPLACE FUNCTION public.get_all_user_emails()
RETURNS TABLE (id uuid, email varchar)
SECURITY DEFINER SET search_path = public AS $$
BEGIN RETURN QUERY SELECT au.id, au.email::varchar FROM auth.users au; END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION public.delete_auth_user(target_user_id uuid)
RETURNS void
SECURITY DEFINER SET search_path = public AS $$
BEGIN DELETE FROM auth.users WHERE id = target_user_id; END;
$$ LANGUAGE plpgsql;

-- =============================================================================
-- SECTION 5 — INTERNAL: shared candidate-exclusion predicate helper
-- =============================================================================
-- Returns TRUE if candidate p should be EXCLUDED for viewer u.
-- Centralises: blocked (either direction), any interest interaction
-- (sent/received/passed/accepted/declined = rejected/not-interested/matched),
-- and reported (either direction).
CREATE OR REPLACE FUNCTION public._feed_excluded(p_viewer UUID, p_candidate UUID)
RETURNS BOOLEAN
SECURITY DEFINER SET search_path = public AS $$
  SELECT
    EXISTS (SELECT 1 FROM blocked_users b
            WHERE (b.blocker_id = p_viewer AND b.blocked_id = p_candidate)
               OR (b.blocker_id = p_candidate AND b.blocked_id = p_viewer))
    OR EXISTS (SELECT 1 FROM interests i
            WHERE (i.sender_id = p_viewer AND i.receiver_id = p_candidate)
               OR (i.sender_id = p_candidate AND i.receiver_id = p_viewer))
    OR EXISTS (SELECT 1 FROM reports r
            WHERE (r.reporter_id = p_viewer AND r.reported_user_id = p_candidate)
               OR (r.reporter_id = p_candidate AND r.reported_user_id = p_viewer));
$$ LANGUAGE sql STABLE;

-- =============================================================================
-- SECTION 6 — FEED RPCS (full columns, preferences, cascade, daily rotation)
-- =============================================================================
-- Shared return shape used by all three feeds + attachPhotos on the client.
-- Columns chosen to fully populate ProfileCard / MatchesScreen with NO placeholders.

-- 6a. RECOMMENDED — partner-preference filtered, preference-weighted ranking.
DROP FUNCTION IF EXISTS public.get_recommended_profiles(UUID, INTEGER, INTEGER);
CREATE OR REPLACE FUNCTION public.get_recommended_profiles(
  p_user_id UUID, p_limit INTEGER DEFAULT 20, p_offset INTEGER DEFAULT 0
)
RETURNS TABLE(
  id UUID, profile_id TEXT, display_name TEXT, gender TEXT, date_of_birth DATE,
  height_cm INTEGER, marital_status TEXT, religion TEXT, caste TEXT,
  city TEXT, district TEXT, state TEXT, education TEXT, occupation TEXT,
  annual_income TEXT, food_habit TEXT, about_me TEXT, is_verified BOOLEAN,
  is_premium BOOLEAN, tier TEXT, last_active_at TIMESTAMPTZ,
  profile_completion_percent INTEGER, compatibility_score INTEGER
)
SECURITY DEFINER SET search_path = public AS $$
DECLARE
  v RECORD; v_tier TEXT; v_limit INTEGER; v_dyn BOOLEAN; p RECORD;
BEGIN
  SELECT me.gender, me.religion, me.caste, me.state, me.district, me.tier, me.date_of_birth
    INTO v FROM profiles me WHERE me.id = p_user_id;
  v_tier := COALESCE(v.tier, 'free');

  SELECT recommended_limit, dynamic_daily_enabled INTO v_limit, v_dyn
    FROM tier_settings ts WHERE ts.tier = v_tier;
  v_limit := COALESCE(v_limit, 5); v_dyn := COALESCE(v_dyn, false);

  p_limit := LEAST(p_limit, GREATEST(0, v_limit - p_offset));
  IF p_limit <= 0 THEN RETURN; END IF;

  SELECT * INTO p FROM partner_preferences WHERE user_id = p_user_id;

  RETURN QUERY
  SELECT pr.id, pr.profile_id, pr.display_name, pr.gender, pr.date_of_birth,
         pr.height_cm, pr.marital_status, pr.religion, pr.caste,
         pr.city, pr.district, pr.state, pr.education, pr.occupation,
         pr.annual_income, pr.food_habit, pr.about_me, pr.is_verified,
         pr.is_premium, pr.tier, pr.last_active_at, pr.profile_completion_percent,
         (
           (CASE WHEN pr.religion = v.religion THEN 20 ELSE 0 END) +
           (CASE WHEN pr.caste    = v.caste    THEN 15 ELSE 0 END) +
           (CASE WHEN pr.district = v.district THEN 15 ELSE 0 END) +
           (CASE WHEN pr.state    = v.state    THEN 10 ELSE 0 END) +
           (CASE WHEN pr.is_verified THEN 10 ELSE 0 END) +
           (CASE WHEN pr.is_premium  THEN 5  ELSE 0 END) +
           COALESCE(pr.profile_completion_percent / 5, 0) +
           (CASE WHEN pr.last_active_at > NOW() - INTERVAL '7 days' THEN 10 ELSE 0 END)
         )::INTEGER AS compatibility_score
  FROM profiles pr
  WHERE pr.is_active = true
    AND pr.id <> p_user_id
    AND pr.gender <> v.gender                                   -- opposite gender
    AND NOT public._feed_excluded(p_user_id, pr.id)             -- blocked/interest/reported
    -- ── Partner preferences (applied only when set) ──
    AND (p.age_min IS NULL OR pr.date_of_birth <= (CURRENT_DATE - (p.age_min || ' years')::INTERVAL))
    AND (p.age_max IS NULL OR pr.date_of_birth >= (CURRENT_DATE - ((p.age_max + 1) || ' years')::INTERVAL))
    AND (p.religion       IS NULL OR array_length(p.religion,1)       IS NULL OR pr.religion       = ANY(p.religion))
    AND (p.caste          IS NULL OR array_length(p.caste,1)          IS NULL OR pr.caste          = ANY(p.caste) OR 'Caste No Bar' = ANY(p.caste))
    AND (p.education       IS NULL OR array_length(p.education,1)      IS NULL OR pr.education       = ANY(p.education))
    AND (p.occupation      IS NULL OR array_length(p.occupation,1)     IS NULL OR pr.occupation      = ANY(p.occupation))
    AND (p.marital_status  IS NULL OR array_length(p.marital_status,1) IS NULL OR pr.marital_status  = ANY(p.marital_status))
    AND (p.districts       IS NULL OR array_length(p.districts,1)      IS NULL OR pr.district        = ANY(p.districts))
    AND (p.states          IS NULL OR array_length(p.states,1)         IS NULL OR pr.state           = ANY(p.states))
  ORDER BY
    CASE WHEN v_dyn THEN md5(p_user_id::text || CURRENT_DATE::text || pr.id::text) END,
    compatibility_score DESC, pr.last_active_at DESC
  LIMIT p_limit OFFSET p_offset;
END;
$$ LANGUAGE plpgsql;

-- 6b. NEARBY — District -> Adjacent districts -> Same state -> Other states cascade.
DROP FUNCTION IF EXISTS public.get_nearby_profiles(UUID, INTEGER, INTEGER);
CREATE OR REPLACE FUNCTION public.get_nearby_profiles(
  p_user_id UUID, p_limit INTEGER DEFAULT 20, p_offset INTEGER DEFAULT 0
)
RETURNS TABLE(
  id UUID, profile_id TEXT, display_name TEXT, gender TEXT, date_of_birth DATE,
  height_cm INTEGER, marital_status TEXT, religion TEXT, caste TEXT,
  city TEXT, district TEXT, state TEXT, education TEXT, occupation TEXT,
  annual_income TEXT, food_habit TEXT, about_me TEXT, is_verified BOOLEAN,
  is_premium BOOLEAN, tier TEXT, last_active_at TIMESTAMPTZ,
  profile_completion_percent INTEGER, compatibility_score INTEGER
)
SECURITY DEFINER SET search_path = public AS $$
DECLARE
  v RECORD; v_tier TEXT; v_limit INTEGER; v_dyn BOOLEAN;
BEGIN
  SELECT me.gender, me.district, me.state, me.tier INTO v FROM profiles me WHERE me.id = p_user_id;
  v_tier := COALESCE(v.tier, 'free');

  SELECT nearby_limit, dynamic_daily_enabled INTO v_limit, v_dyn
    FROM tier_settings ts WHERE ts.tier = v_tier;
  v_limit := COALESCE(v_limit, 5); v_dyn := COALESCE(v_dyn, false);

  p_limit := LEAST(p_limit, GREATEST(0, v_limit - p_offset));
  IF p_limit <= 0 THEN RETURN; END IF;

  RETURN QUERY
  SELECT pr.id, pr.profile_id, pr.display_name, pr.gender, pr.date_of_birth,
         pr.height_cm, pr.marital_status, pr.religion, pr.caste,
         pr.city, pr.district, pr.state, pr.education, pr.occupation,
         pr.annual_income, pr.food_habit, pr.about_me, pr.is_verified,
         pr.is_premium, pr.tier, pr.last_active_at, pr.profile_completion_percent,
         -- Cascade priority encoded as the score (higher = closer).
         (
           CASE
             WHEN pr.district = v.district THEN 1000                                  -- P1 same district
             WHEN EXISTS (SELECT 1 FROM district_adjacency da
                          WHERE da.district = v.district AND da.neighbor = pr.district) THEN 800  -- P2 adjacent
             WHEN pr.state = v.state THEN 500                                         -- P3 same state
             ELSE 100                                                                -- P4 national
           END
           + (CASE WHEN pr.is_verified THEN 10 ELSE 0 END)
           + (CASE WHEN pr.is_premium  THEN 5  ELSE 0 END)
           + COALESCE(pr.profile_completion_percent / 10, 0)
         )::INTEGER AS compatibility_score
  FROM profiles pr
  WHERE pr.is_active = true
    AND pr.id <> p_user_id
    AND pr.gender <> v.gender
    AND NOT public._feed_excluded(p_user_id, pr.id)
  ORDER BY
    compatibility_score DESC,
    CASE WHEN v_dyn THEN md5(p_user_id::text || CURRENT_DATE::text || pr.id::text) END,
    pr.last_active_at DESC
  LIMIT p_limit OFFSET p_offset;
END;
$$ LANGUAGE plpgsql;

-- 6c. DAILY — per-day windowed rotation (Day1: 1..N, Day2: N+1..2N ...).
DROP FUNCTION IF EXISTS public.get_daily_matches(UUID, INTEGER, INTEGER);
CREATE OR REPLACE FUNCTION public.get_daily_matches(
  p_user_id UUID, p_limit INTEGER DEFAULT 10, p_offset INTEGER DEFAULT 0
)
RETURNS TABLE(
  id UUID, profile_id TEXT, display_name TEXT, gender TEXT, date_of_birth DATE,
  height_cm INTEGER, marital_status TEXT, religion TEXT, caste TEXT,
  city TEXT, district TEXT, state TEXT, education TEXT, occupation TEXT,
  annual_income TEXT, food_habit TEXT, about_me TEXT, is_verified BOOLEAN,
  is_premium BOOLEAN, tier TEXT, last_active_at TIMESTAMPTZ,
  profile_completion_percent INTEGER, compatibility_score INTEGER
)
SECURITY DEFINER SET search_path = public AS $$
DECLARE
  v RECORD; v_tier TEXT; v_limit INTEGER; v_dyn BOOLEAN;
  v_seen UUID[]; v_today UUID[]; v_today_date DATE; v_window UUID[];
BEGIN
  SELECT me.gender, me.tier INTO v FROM profiles me WHERE me.id = p_user_id;
  v_tier := COALESCE(v.tier, 'free');

  SELECT daily_limit, dynamic_daily_enabled INTO v_limit, v_dyn
    FROM tier_settings ts WHERE ts.tier = v_tier;
  v_limit := COALESCE(v_limit, 5); v_dyn := COALESCE(v_dyn, false);

  SELECT profile_ids, todays_ids, todays_date
    INTO v_seen, v_today, v_today_date
    FROM user_profile_views WHERE user_id = p_user_id AND section = 'daily';
  v_seen := COALESCE(v_seen, ARRAY[]::UUID[]);

  -- STATIC tiers (free): always the same top-N by score, no accumulation.
  IF NOT v_dyn THEN
    p_limit := LEAST(p_limit, GREATEST(0, v_limit - p_offset));
    IF p_limit <= 0 THEN RETURN; END IF;
    RETURN QUERY
      SELECT pr.id, pr.profile_id, pr.display_name, pr.gender, pr.date_of_birth,
             pr.height_cm, pr.marital_status, pr.religion, pr.caste,
             pr.city, pr.district, pr.state, pr.education, pr.occupation,
             pr.annual_income, pr.food_habit, pr.about_me, pr.is_verified,
             pr.is_premium, pr.tier, pr.last_active_at, pr.profile_completion_percent,
             50::INTEGER
      FROM profiles pr
      WHERE pr.is_active = true AND pr.id <> p_user_id AND pr.gender <> v.gender
        AND NOT public._feed_excluded(p_user_id, pr.id)
      ORDER BY pr.profile_completion_percent DESC NULLS LAST, pr.last_active_at DESC
      LIMIT p_limit OFFSET p_offset;
    RETURN;
  END IF;

  -- DYNAMIC tiers: compute (or reuse) TODAY'S window of fresh, unseen profiles.
  IF v_today_date IS DISTINCT FROM CURRENT_DATE OR v_today IS NULL OR array_length(v_today,1) IS NULL THEN
    SELECT ARRAY(
      SELECT pr.id FROM profiles pr
      WHERE pr.is_active = true AND pr.id <> p_user_id AND pr.gender <> v.gender
        AND pr.id <> ALL(v_seen)
        AND NOT public._feed_excluded(p_user_id, pr.id)
      ORDER BY md5(p_user_id::text || CURRENT_DATE::text || pr.id::text)
      LIMIT v_limit
    ) INTO v_window;

    -- Recycle: if the fresh pool is exhausted, start a new cycle from everyone.
    IF v_window IS NULL OR array_length(v_window,1) IS NULL THEN
      v_seen := ARRAY[]::UUID[];
      SELECT ARRAY(
        SELECT pr.id FROM profiles pr
        WHERE pr.is_active = true AND pr.id <> p_user_id AND pr.gender <> v.gender
          AND NOT public._feed_excluded(p_user_id, pr.id)
        ORDER BY md5(p_user_id::text || CURRENT_DATE::text || pr.id::text)
        LIMIT v_limit
      ) INTO v_window;
    END IF;
    v_window := COALESCE(v_window, ARRAY[]::UUID[]);

    -- Persist today's window + accumulate into the seen set.
    INSERT INTO user_profile_views (user_id, section, profile_ids, todays_ids, todays_date, last_updated)
    VALUES (p_user_id, 'daily',
            ARRAY(SELECT DISTINCT unnest(v_seen || v_window)),
            v_window, CURRENT_DATE, CURRENT_DATE)
    ON CONFLICT (user_id, section) DO UPDATE SET
      profile_ids  = ARRAY(SELECT DISTINCT unnest(user_profile_views.profile_ids || EXCLUDED.todays_ids)),
      todays_ids   = EXCLUDED.todays_ids,
      todays_date  = CURRENT_DATE,
      last_updated = CURRENT_DATE;
  ELSE
    v_window := v_today;
  END IF;

  -- Page within today's frozen window.
  p_limit := LEAST(p_limit, GREATEST(0, COALESCE(array_length(v_window,1),0) - p_offset));
  IF p_limit <= 0 THEN RETURN; END IF;

  RETURN QUERY
  SELECT pr.id, pr.profile_id, pr.display_name, pr.gender, pr.date_of_birth,
         pr.height_cm, pr.marital_status, pr.religion, pr.caste,
         pr.city, pr.district, pr.state, pr.education, pr.occupation,
         pr.annual_income, pr.food_habit, pr.about_me, pr.is_verified,
         pr.is_premium, pr.tier, pr.last_active_at, pr.profile_completion_percent,
         60::INTEGER
  FROM profiles pr
  JOIN unnest(v_window) WITH ORDINALITY AS w(wid, ord) ON w.wid = pr.id
  ORDER BY w.ord
  LIMIT p_limit OFFSET p_offset;
END;
$$ LANGUAGE plpgsql;

-- log_daily_views kept as a harmless no-op for backward compatibility
-- (rotation is now fully server-side; the client no longer needs to log).
CREATE OR REPLACE FUNCTION public.log_daily_views(p_user_id UUID, p_viewed_ids UUID[])
RETURNS VOID
SECURITY DEFINER SET search_path = public AS $$
BEGIN
  RETURN;
END;
$$ LANGUAGE plpgsql;

-- =============================================================================
-- SECTION 7 — ROW LEVEL SECURITY (enforcement lives in DB, not the client)
-- =============================================================================
ALTER TABLE public.tier_settings        ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.user_profile_views   ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.reports              ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.district_adjacency   ENABLE ROW LEVEL SECURITY;

DROP POLICY IF EXISTS "read tier_settings" ON public.tier_settings;
CREATE POLICY "read tier_settings" ON public.tier_settings FOR SELECT USING (true);

DROP POLICY IF EXISTS "read district_adjacency" ON public.district_adjacency;
CREATE POLICY "read district_adjacency" ON public.district_adjacency FOR SELECT USING (true);

DROP POLICY IF EXISTS "own profile views" ON public.user_profile_views;
CREATE POLICY "own profile views" ON public.user_profile_views FOR ALL USING (auth.uid() = user_id);

DROP POLICY IF EXISTS "insert own reports" ON public.reports;
CREATE POLICY "insert own reports" ON public.reports FOR INSERT WITH CHECK (auth.uid() = reporter_id);
DROP POLICY IF EXISTS "view own reports" ON public.reports;
CREATE POLICY "view own reports" ON public.reports FOR SELECT USING (auth.uid() = reporter_id OR auth.uid() = reported_user_id);

-- NOTE on profiles SELECT policy:
--   Feeds run through SECURITY DEFINER RPCs that already clamp to tier_settings,
--   so a permissive "view active profiles" policy does NOT let free users exceed
--   feed limits via the RPC path. The direct-table searchProfiles() path is
--   addressed in the app layer (Phase 8) by routing through the same RPCs.

NOTIFY pgrst, 'reload schema';
-- =============================================================================
-- END OF AUTHORITATIVE SCHEMA
-- =============================================================================
