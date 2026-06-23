-- ============================================================================
-- WEDRING MATRIMONY — AUTHORITATIVE DATABASE SCHEMA
-- ============================================================================
-- THE SINGLE SOURCE OF TRUTH. Run this ONCE, top to bottom, in the Supabase
-- SQL Editor on a fresh / cleared project. Idempotent and safe to re-run.
--
-- This file is generated to EXACTLY match what the shipped code calls:
--   * mobile app  (app/src/api/*, app/src/screens/*, app/src/hooks/*)
--   * admin panel (admin/src/api/*, admin/src/pages/admin/*)
--
-- Distribution model (canonical, "pure"):
--   subscription_plans  -> user_distribution_state (*_profiles_shown)
--   -> feed_allocation() -> the three feed RPCs.
--   user_wallet holds consumable credits. NO tier_settings / admin_settings /
--   user_profile_distribution legacy tables — they were removed.
--
-- File storage: Cloudflare R2 only. NO Supabase Storage buckets are created.
-- photos.storage_path holds the public R2 URL.
--
-- Sections:
--   1. Extensions
--   2. Core profile tables
--   3. Interaction tables (interests, contact_views, chat, blocks, reports …)
--   4. Plans / wallet / distribution-state / queue
--   5. Payments + distribution history
--   6. Admin tables
--   7. Auth trigger (auto-create profile + distribution rows)
--   8. Helper functions (tier_rank, _feed_excluded, feed_allocation, _grant…)
--   9. Quota / purchase / interest / contact RPCs
--  10. Feed RPCs (recommended / nearby / daily)
--  11. Admin + distribution-management RPCs
--  12. check_user_exists / calculate_compatibility
--  13. Indexes
--  14. Row Level Security
--  15. Realtime + grants
-- ============================================================================

-- ============================================================================
-- 1. EXTENSIONS
-- ============================================================================
CREATE EXTENSION IF NOT EXISTS "uuid-ossp";
CREATE EXTENSION IF NOT EXISTS pgcrypto;

-- ============================================================================
-- 2. CORE PROFILE TABLES
-- ============================================================================

-- 2a. profiles — combines auth user + full matrimony profile + quota wallet
CREATE TABLE IF NOT EXISTS public.profiles (
  id UUID REFERENCES auth.users ON DELETE CASCADE PRIMARY KEY,
  profile_id TEXT UNIQUE NOT NULL DEFAULT ('TM' || LPAD(FLOOR(RANDOM() * 999999)::TEXT, 6, '0')),

  -- Identity
  display_name TEXT NOT NULL,
  phone TEXT,
  gender TEXT NOT NULL CHECK (gender IN ('male','female')),
  profile_created_for TEXT,

  -- Subscription + consumable quota (mirrored into user_wallet by RPCs)
  tier TEXT DEFAULT 'free' CHECK (tier IN ('free','silver','gold','platinum')),
  premium_expires_at TIMESTAMPTZ,
  contacts_remaining INTEGER DEFAULT 0,
  interests_remaining INTEGER DEFAULT 0,
  is_verified BOOLEAN DEFAULT false,
  is_premium BOOLEAN DEFAULT false,

  -- Personal
  date_of_birth DATE NOT NULL,
  height_cm INTEGER,
  marital_status TEXT CHECK (marital_status IN ('never_married','divorced','widowed','awaiting_divorce')),
  religion TEXT NOT NULL DEFAULT 'Hindu',
  caste TEXT,
  subcaste TEXT,
  mother_tongue TEXT DEFAULT 'Tamil',

  -- Education & career
  education TEXT,
  education_detail TEXT,
  occupation TEXT,
  occupation_detail TEXT,
  company_name TEXT,
  annual_income TEXT,

  -- Location
  city TEXT,
  district TEXT,
  state TEXT DEFAULT 'Tamil Nadu',
  country TEXT DEFAULT 'India',
  pincode TEXT,

  -- Embedded horoscope quick-fields (full detail lives in horoscope_details)
  star TEXT,
  raasi TEXT,
  lagnam TEXT,
  dasa_balance TEXT,
  gothram TEXT,
  dosham TEXT CHECK (dosham IN ('yes','no','not_sure')),

  -- Family / lifestyle
  about_me TEXT,
  family_type TEXT CHECK (family_type IN ('joint','nuclear')),
  family_status TEXT CHECK (family_status IN ('middle_class','upper_middle_class','rich','affluent')),
  father_occupation TEXT,
  mother_occupation TEXT,
  brothers_count INTEGER DEFAULT 0,
  sisters_count INTEGER DEFAULT 0,
  brothers_married INTEGER DEFAULT 0,
  sisters_married INTEGER DEFAULT 0,
  food_habit TEXT CHECK (food_habit IN ('vegetarian','non_vegetarian','eggetarian')),
  smoking TEXT CHECK (smoking IN ('no','yes','occasionally')),
  drinking TEXT CHECK (drinking IN ('no','yes','occasionally')),
  languages_known TEXT[] DEFAULT ARRAY['Tamil'],
  interests TEXT[],
  hobbies TEXT[],

  -- System flags
  is_active BOOLEAN DEFAULT true,
  is_profile_complete BOOLEAN DEFAULT false,
  profile_completion_percent INTEGER DEFAULT 0,
  push_token TEXT,
  last_active_at TIMESTAMPTZ DEFAULT NOW(),
  created_at TIMESTAMPTZ DEFAULT NOW(),
  updated_at TIMESTAMPTZ DEFAULT NOW()
);

-- 2b. horoscope_details (1:1 with profile)
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

-- 2c. partner_preferences (1:1 with profile) — full filter surface used by feeds
CREATE TABLE IF NOT EXISTS public.partner_preferences (
  id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
  user_id UUID REFERENCES public.profiles(id) ON DELETE CASCADE UNIQUE,
  age_min INTEGER DEFAULT 18,
  age_max INTEGER DEFAULT 60,
  height_min INTEGER,
  height_max INTEGER,
  marital_status TEXT[],
  religion TEXT[],
  caste TEXT[],
  education TEXT[],
  occupation TEXT[],
  income_min TEXT,
  income_max TEXT,
  city TEXT[],
  districts TEXT[],
  states TEXT[],
  country TEXT[] DEFAULT ARRAY['India'],
  food_habit TEXT[],
  star TEXT[],
  dosham TEXT,
  with_photo_only BOOLEAN DEFAULT false,
  created_at TIMESTAMPTZ DEFAULT NOW(),
  updated_at TIMESTAMPTZ DEFAULT NOW()
);

-- 2d. photos (max-5 enforced in app; bytes live in Cloudflare R2)
CREATE TABLE IF NOT EXISTS public.photos (
  id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
  user_id UUID REFERENCES public.profiles(id) ON DELETE CASCADE,
  storage_path TEXT NOT NULL,
  thumbnail_path TEXT,
  is_primary BOOLEAN DEFAULT false,
  is_private BOOLEAN DEFAULT false,
  display_order INTEGER DEFAULT 0,
  is_approved BOOLEAN DEFAULT true,
  created_at TIMESTAMPTZ DEFAULT NOW()
);

-- ============================================================================
-- 3. INTERACTION TABLES
-- ============================================================================

-- 3a. subscriptions — purchase/audit history (one row per purchase)
CREATE TABLE IF NOT EXISTS public.subscriptions (
  id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
  user_id UUID REFERENCES public.profiles(id) ON DELETE CASCADE,
  plan_type TEXT NOT NULL CHECK (plan_type IN ('silver','gold','platinum')),
  status TEXT DEFAULT 'active' CHECK (status IN ('active','expired','cancelled','queued','pending')),
  amount INTEGER NOT NULL DEFAULT 0,
  currency TEXT DEFAULT 'INR',
  razorpay_subscription_id TEXT,
  razorpay_payment_id TEXT,
  contacts_added INTEGER DEFAULT 0,
  interests_added INTEGER DEFAULT 0,
  starts_at TIMESTAMPTZ DEFAULT NOW(),
  expires_at TIMESTAMPTZ,
  auto_renew BOOLEAN DEFAULT false,
  created_at TIMESTAMPTZ DEFAULT NOW(),
  updated_at TIMESTAMPTZ DEFAULT NOW()
);

-- 3b. interests — sent/received/passed (status 'passed' = Not Interested)
CREATE TABLE IF NOT EXISTS public.interests (
  id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
  sender_id UUID REFERENCES public.profiles(id) ON DELETE CASCADE,
  receiver_id UUID REFERENCES public.profiles(id) ON DELETE CASCADE,
  status TEXT DEFAULT 'pending' CHECK (status IN ('pending','accepted','declined','withdrawn','passed')),
  message TEXT,
  created_at TIMESTAMPTZ DEFAULT NOW(),
  updated_at TIMESTAMPTZ DEFAULT NOW(),
  UNIQUE(sender_id, receiver_id)
);

-- 3c. contact_views — unlocked contact numbers (1 contact credit each)
CREATE TABLE IF NOT EXISTS public.contact_views (
  id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
  viewer_id UUID REFERENCES public.profiles(id) ON DELETE CASCADE,
  viewed_id UUID REFERENCES public.profiles(id) ON DELETE CASCADE,
  created_at TIMESTAMPTZ DEFAULT NOW(),
  UNIQUE(viewer_id, viewed_id)
);

-- 3d. chats + messages
CREATE TABLE IF NOT EXISTS public.chats (
  id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
  participant_1 UUID REFERENCES public.profiles(id) ON DELETE CASCADE,
  participant_2 UUID REFERENCES public.profiles(id) ON DELETE CASCADE,
  last_message_text TEXT,
  last_message_at TIMESTAMPTZ,
  is_approved BOOLEAN DEFAULT false,
  created_at TIMESTAMPTZ DEFAULT NOW(),
  UNIQUE(participant_1, participant_2)
);

CREATE TABLE IF NOT EXISTS public.messages (
  id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
  chat_id UUID REFERENCES public.chats(id) ON DELETE CASCADE,
  sender_id UUID REFERENCES public.profiles(id) ON DELETE CASCADE,
  content TEXT NOT NULL,
  message_type TEXT DEFAULT 'text' CHECK (message_type IN ('text','image','system')),
  is_read BOOLEAN DEFAULT false,
  created_at TIMESTAMPTZ DEFAULT NOW()
);

-- 3e. notifications
CREATE TABLE IF NOT EXISTS public.notifications (
  id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
  user_id UUID REFERENCES public.profiles(id) ON DELETE CASCADE,
  title TEXT NOT NULL,
  body TEXT NOT NULL,
  type TEXT NOT NULL,
  data JSONB,
  is_read BOOLEAN DEFAULT false,
  created_at TIMESTAMPTZ DEFAULT NOW()
);

-- 3f. reports (admin ReportManagement + feed "exclude reported" rule)
CREATE TABLE IF NOT EXISTS public.reports (
  id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
  reporter_id UUID REFERENCES public.profiles(id) ON DELETE CASCADE,
  reported_user_id UUID REFERENCES public.profiles(id) ON DELETE CASCADE,
  reason TEXT NOT NULL,
  description TEXT,
  status TEXT DEFAULT 'pending' CHECK (status IN ('pending','reviewed','resolved','dismissed')),
  admin_notes TEXT,
  created_at TIMESTAMPTZ DEFAULT NOW(),
  resolved_at TIMESTAMPTZ
);

-- 3g. blocked_users
CREATE TABLE IF NOT EXISTS public.blocked_users (
  id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
  blocker_id UUID REFERENCES public.profiles(id) ON DELETE CASCADE,
  blocked_id UUID REFERENCES public.profiles(id) ON DELETE CASCADE,
  reason TEXT,
  created_at TIMESTAMPTZ DEFAULT NOW(),
  UNIQUE(blocker_id, blocked_id)
);

-- 3h. user_activity (profile views etc.)
CREATE TABLE IF NOT EXISTS public.user_activity (
  id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
  user_id UUID REFERENCES public.profiles(id) ON DELETE CASCADE,
  activity_type TEXT NOT NULL,
  target_user_id UUID,
  metadata JSONB,
  created_at TIMESTAMPTZ DEFAULT NOW()
);

-- 3i. user_profile_views — per-(user,section) stable feed allocation window
CREATE TABLE IF NOT EXISTS public.user_profile_views (
  user_id UUID REFERENCES public.profiles(id) ON DELETE CASCADE,
  section TEXT CHECK (section IN ('recommended','nearby','daily')),
  profile_ids UUID[] DEFAULT ARRAY[]::UUID[],
  todays_ids UUID[] DEFAULT ARRAY[]::UUID[],
  todays_date DATE,
  last_updated DATE DEFAULT CURRENT_DATE,
  PRIMARY KEY (user_id, section)
);

-- 3j. district_adjacency — drives the Nearby cascade (same -> adjacent -> state)
CREATE TABLE IF NOT EXISTS public.district_adjacency (
  district TEXT NOT NULL,
  neighbor TEXT NOT NULL,
  PRIMARY KEY (district, neighbor)
);

-- ============================================================================
-- 4. PLANS / WALLET / DISTRIBUTION STATE / QUEUE  (canonical distribution model)
-- ============================================================================

-- 4a. subscription_plans — the SINGLE editable source of truth for plans.
CREATE TABLE IF NOT EXISTS public.subscription_plans (
  id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
  tier TEXT UNIQUE NOT NULL CHECK (tier IN ('free','silver','gold','platinum')),
  plan_name TEXT,
  price_inr INTEGER NOT NULL DEFAULT 0,
  duration_months INTEGER NOT NULL DEFAULT 0,
  -- consumable credits granted on EVERY purchase
  contacts_limit INTEGER NOT NULL DEFAULT 0,
  interests_limit INTEGER NOT NULL DEFAULT 0,
  -- one-time profile pool granted the first time a tier is reached
  initial_recommended_profiles INTEGER NOT NULL DEFAULT 5,
  initial_nearby_profiles INTEGER NOT NULL DEFAULT 5,
  initial_daily_profiles INTEGER NOT NULL DEFAULT 5,
  -- daily cron increments
  daily_recommended_increment INTEGER NOT NULL DEFAULT 0,
  daily_nearby_increment INTEGER NOT NULL DEFAULT 0,
  daily_profiles_increment INTEGER NOT NULL DEFAULT 0,
  -- display
  features JSONB DEFAULT '[]'::jsonb,
  color_code TEXT DEFAULT '#AAAAAA',
  is_popular BOOLEAN DEFAULT false,
  created_at TIMESTAMPTZ DEFAULT NOW(),
  updated_at TIMESTAMPTZ DEFAULT NOW()
);

INSERT INTO public.subscription_plans
  (tier, plan_name, price_inr, duration_months, contacts_limit, interests_limit,
   initial_recommended_profiles, initial_nearby_profiles, initial_daily_profiles,
   daily_recommended_increment, daily_nearby_increment, daily_profiles_increment,
   features, color_code, is_popular)
VALUES
  ('free',     'Free',     0,    0,  0,   0,   5,   5,   5,   0,  0,  0,  '[]'::jsonb, '#AAAAAA', false),
  ('silver',   'Silver',   499,  1,  30,  50,  50,  50,  50,  5,  5,  3,  '["View 30 contact numbers","Send up to 50 interests"]'::jsonb,  '#8A8A8A', false),
  ('gold',     'Gold',     999,  1,  50,  100, 100, 100, 100, 10, 10, 5,  '["View 50 contact numbers","Send up to 100 interests"]'::jsonb, '#D4AF37', true),
  ('platinum', 'Platinum', 2499, 3,  100, 300, 200, 200, 200, 15, 15, 10, '["View 100 contact numbers","Send up to 300 interests"]'::jsonb,'#E5E4E2', false)
ON CONFLICT (tier) DO NOTHING;

-- 4b. user_wallet — consumable credits the app reads/decrements.
CREATE TABLE IF NOT EXISTS public.user_wallet (
  user_id UUID PRIMARY KEY REFERENCES auth.users(id) ON DELETE CASCADE,
  contact_credits INTEGER DEFAULT 0,
  interest_credits INTEGER DEFAULT 0,
  updated_at TIMESTAMPTZ DEFAULT NOW()
);

-- 4c. user_distribution_state — per-user growing profile caps (never shrink).
CREATE TABLE IF NOT EXISTS public.user_distribution_state (
  user_id UUID PRIMARY KEY REFERENCES auth.users(id) ON DELETE CASCADE,
  highest_tier_ever_reached TEXT DEFAULT 'free',
  initial_distribution_granted_tiers TEXT[] DEFAULT '{}',
  recommended_profiles_shown INTEGER DEFAULT 0,
  nearby_profiles_shown INTEGER DEFAULT 0,
  daily_profiles_shown INTEGER DEFAULT 0,
  last_distribution_date DATE,
  created_at TIMESTAMPTZ DEFAULT NOW(),
  updated_at TIMESTAMPTZ DEFAULT NOW()
);

-- 4d. subscription_queue — paused/pending plans for tier stacking.
CREATE TABLE IF NOT EXISTS public.subscription_queue (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  user_id UUID NOT NULL REFERENCES auth.users(id) ON DELETE CASCADE,
  plan_tier TEXT NOT NULL,
  remaining_days INTEGER,
  duration_months INTEGER,
  contact_credits INTEGER DEFAULT 0,
  interest_credits INTEGER DEFAULT 0,
  status TEXT NOT NULL DEFAULT 'pending' CHECK (status IN ('paused','pending')),
  amount INTEGER,
  payment_id TEXT,
  created_at TIMESTAMPTZ DEFAULT NOW(),
  updated_at TIMESTAMPTZ DEFAULT NOW()
);

-- ============================================================================
-- 5. PAYMENTS + DISTRIBUTION HISTORY
-- ============================================================================

CREATE TABLE IF NOT EXISTS public.payments (
  id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
  user_id UUID REFERENCES public.profiles(id) ON DELETE SET NULL,
  subscription_id UUID REFERENCES public.subscriptions(id) ON DELETE SET NULL,
  plan_type TEXT NOT NULL,
  amount INTEGER NOT NULL DEFAULT 0,
  tax INTEGER NOT NULL DEFAULT 0,
  final_amount INTEGER NOT NULL DEFAULT 0,
  currency TEXT NOT NULL DEFAULT 'INR',
  payment_gateway TEXT NOT NULL DEFAULT 'razorpay' CHECK (payment_gateway IN ('razorpay','mock','manual','admin')),
  gateway_transaction_id TEXT,
  gateway_order_id TEXT,
  status TEXT NOT NULL DEFAULT 'pending' CHECK (status IN ('pending','success','failed','refunded','cancelled')),
  metadata JSONB DEFAULT '{}',
  created_at TIMESTAMPTZ DEFAULT NOW(),
  updated_at TIMESTAMPTZ DEFAULT NOW()
);

CREATE TABLE IF NOT EXISTS public.distribution_settings_history (
  id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
  tier TEXT NOT NULL CHECK (tier IN ('free','silver','gold','platinum')),
  recommended_limit INTEGER NOT NULL,
  nearby_limit INTEGER NOT NULL,
  daily_limit INTEGER NOT NULL,
  previous_recommended INTEGER,
  previous_nearby INTEGER,
  previous_daily INTEGER,
  push_mode TEXT NOT NULL CHECK (push_mode IN ('tomorrow','now_tier','now_all')),
  effective_date DATE NOT NULL DEFAULT CURRENT_DATE,
  created_by TEXT NOT NULL,
  created_at TIMESTAMPTZ DEFAULT NOW()
);

-- ============================================================================
-- 6. ADMIN TABLES
-- ============================================================================
CREATE TABLE IF NOT EXISTS public.admin_users (
  id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  email TEXT UNIQUE NOT NULL,
  role TEXT DEFAULT 'admin' CHECK (role IN ('admin','superadmin')),
  created_at TIMESTAMPTZ DEFAULT timezone('utc'::text, now()) NOT NULL
);

INSERT INTO public.admin_users (email, role)
VALUES ('vinomaddy2711@gmail.com', 'superadmin')
ON CONFLICT (email) DO NOTHING;

-- ============================================================================
-- 7. AUTH TRIGGER — auto-create profile + wallet + distribution-state on signup
-- ============================================================================
CREATE OR REPLACE FUNCTION public.handle_new_user()
RETURNS TRIGGER
SECURITY DEFINER SET search_path = public AS $$
DECLARE
  v_rec INT; v_near INT; v_daily INT;
BEGIN
  INSERT INTO public.profiles (id, display_name, phone, gender, date_of_birth, tier)
  VALUES (
    NEW.id,
    COALESCE(NEW.raw_user_meta_data->>'display_name', 'New User'),
    NEW.phone,
    COALESCE(NEW.raw_user_meta_data->>'gender', 'male'),
    COALESCE((NEW.raw_user_meta_data->>'date_of_birth')::DATE, '2000-01-01'::DATE),
    'free'
  )
  ON CONFLICT (id) DO NOTHING;

  SELECT initial_recommended_profiles, initial_nearby_profiles, initial_daily_profiles
    INTO v_rec, v_near, v_daily
  FROM public.subscription_plans WHERE tier = 'free';

  INSERT INTO public.user_distribution_state
    (user_id, highest_tier_ever_reached, initial_distribution_granted_tiers,
     recommended_profiles_shown, nearby_profiles_shown, daily_profiles_shown)
  VALUES (NEW.id, 'free', ARRAY['free'],
          COALESCE(v_rec,5), COALESCE(v_near,5), COALESCE(v_daily,5))
  ON CONFLICT (user_id) DO NOTHING;

  INSERT INTO public.user_wallet (user_id) VALUES (NEW.id)
  ON CONFLICT (user_id) DO NOTHING;

  RETURN NEW;
END;
$$ LANGUAGE plpgsql;

DROP TRIGGER IF EXISTS on_auth_user_created ON auth.users;
CREATE TRIGGER on_auth_user_created
  AFTER INSERT ON auth.users
  FOR EACH ROW EXECUTE FUNCTION public.handle_new_user();
CREATE OR REPLACE FUNCTION public.update_updated_at()
RETURNS TRIGGER AS $$
BEGIN NEW.updated_at = NOW(); RETURN NEW; END;
$$ LANGUAGE plpgsql;

DROP TRIGGER IF EXISTS profiles_updated_at ON public.profiles;
CREATE TRIGGER profiles_updated_at BEFORE UPDATE ON public.profiles
  FOR EACH ROW EXECUTE FUNCTION public.update_updated_at();
DROP TRIGGER IF EXISTS horoscope_updated_at ON public.horoscope_details;
CREATE TRIGGER horoscope_updated_at BEFORE UPDATE ON public.horoscope_details
  FOR EACH ROW EXECUTE FUNCTION public.update_updated_at();
DROP TRIGGER IF EXISTS preferences_updated_at ON public.partner_preferences;
CREATE TRIGGER preferences_updated_at BEFORE UPDATE ON public.partner_preferences
  FOR EACH ROW EXECUTE FUNCTION public.update_updated_at();
DROP TRIGGER IF EXISTS subscriptions_updated_at ON public.subscriptions;
CREATE TRIGGER subscriptions_updated_at BEFORE UPDATE ON public.subscriptions
  FOR EACH ROW EXECUTE FUNCTION public.update_updated_at();
DROP TRIGGER IF EXISTS interests_updated_at ON public.interests;
CREATE TRIGGER interests_updated_at BEFORE UPDATE ON public.interests
  FOR EACH ROW EXECUTE FUNCTION public.update_updated_at();

-- ============================================================================
-- 8. HELPER FUNCTIONS
-- ============================================================================

-- 8a. tier_rank: free=0 < silver=1 < gold=2 < platinum=3
CREATE OR REPLACE FUNCTION public.tier_rank(p_tier TEXT) RETURNS INTEGER
LANGUAGE sql IMMUTABLE AS $$
  SELECT CASE COALESCE(p_tier,'free')
    WHEN 'platinum' THEN 3 WHEN 'gold' THEN 2 WHEN 'silver' THEN 1 ELSE 0 END;
$$;

-- 8b. _feed_excluded: TRUE if a candidate must be hidden from the viewer's feed
--     (blocked either way, any interest interaction, or reported either way).
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
-- 8c. feed_allocation: stable, append-only per-(user,section) allocation list.
--     Kept ids hold their slot; fresh ranked ids append up to p_limit and are
--     flagged is_new_today. Persists into user_profile_views.
CREATE OR REPLACE FUNCTION public.feed_allocation(
  p_user_id UUID, p_section TEXT, p_limit INTEGER, p_ranked UUID[]
) RETURNS TABLE(pid UUID, is_new_today BOOLEAN)
SECURITY DEFINER SET search_path = public AS $$
DECLARE
  v_existing UUID[]; v_today UUID[]; v_date DATE;
  v_kept UUID[]; v_append UUID[]; v_final UUID[]; v_newtoday UUID[];
BEGIN
  p_limit  := GREATEST(0, COALESCE(p_limit, 0));
  p_ranked := COALESCE(p_ranked, ARRAY[]::UUID[]);

  SELECT profile_ids, todays_ids, todays_date
    INTO v_existing, v_today, v_date
    FROM user_profile_views WHERE user_id = p_user_id AND section = p_section;
  v_existing := COALESCE(v_existing, ARRAY[]::UUID[]);

  v_kept := ARRAY(
    SELECT e FROM unnest(v_existing) WITH ORDINALITY AS x(e, ord)
    WHERE e = ANY(p_ranked) ORDER BY x.ord
  );

  IF COALESCE(array_length(v_kept, 1), 0) > p_limit THEN
    v_kept := ARRAY(
      SELECT e FROM unnest(v_kept) WITH ORDINALITY AS x(e, ord)
      WHERE x.ord <= p_limit ORDER BY x.ord
    );
  END IF;

  v_append := ARRAY(
    SELECT r FROM unnest(p_ranked) WITH ORDINALITY AS y(r, ord)
    WHERE r <> ALL(v_kept) ORDER BY y.ord
    LIMIT GREATEST(0, p_limit - COALESCE(array_length(v_kept, 1), 0))
  );
  v_append := COALESCE(v_append, ARRAY[]::UUID[]);
  v_final  := v_kept || v_append;

  IF v_date = CURRENT_DATE THEN
    v_newtoday := COALESCE(v_today, ARRAY[]::UUID[]) || v_append;
  ELSE
    v_newtoday := v_append;
  END IF;

  INSERT INTO user_profile_views (user_id, section, profile_ids, todays_ids, todays_date, last_updated)
  VALUES (p_user_id, p_section, v_final, v_newtoday, CURRENT_DATE, CURRENT_DATE)
  ON CONFLICT (user_id, section) DO UPDATE SET
    profile_ids  = EXCLUDED.profile_ids,
    todays_ids   = EXCLUDED.todays_ids,
    todays_date  = EXCLUDED.todays_date,
    last_updated = EXCLUDED.last_updated;

  RETURN QUERY
    SELECT f, (f = ANY(v_newtoday))
    FROM unnest(v_final) WITH ORDINALITY AS z(f, ord)
    ORDER BY z.ord;
END;
$$ LANGUAGE plpgsql;
-- 8d. _grant_plan_benefits: credits ALWAYS; initial pool ONCE per tier.
--     Pool is SET to GREATEST(current, configured) so reaching a tier yields
--     exactly the configured count and an already-grown pool is never shrunk.
CREATE OR REPLACE FUNCTION public._grant_plan_benefits(
  p_user_id UUID, p_tier TEXT
) RETURNS VOID
SECURITY DEFINER SET search_path = public AS $$
DECLARE
  v_plan RECORD; v_state RECORD;
  v_rec INT := 0; v_near INT := 0; v_daily INT := 0;
BEGIN
  SELECT * INTO v_plan FROM subscription_plans WHERE tier = p_tier;
  IF v_plan IS NULL THEN RETURN; END IF;

  INSERT INTO user_wallet (user_id, contact_credits, interest_credits)
  VALUES (p_user_id, 0, 0) ON CONFLICT (user_id) DO NOTHING;
  INSERT INTO user_distribution_state
    (user_id, highest_tier_ever_reached, initial_distribution_granted_tiers,
     recommended_profiles_shown, nearby_profiles_shown, daily_profiles_shown)
  VALUES (p_user_id, 'free', ARRAY['free'],
          COALESCE((SELECT initial_recommended_profiles FROM subscription_plans WHERE tier='free'),5),
          COALESCE((SELECT initial_nearby_profiles      FROM subscription_plans WHERE tier='free'),5),
          COALESCE((SELECT initial_daily_profiles       FROM subscription_plans WHERE tier='free'),5))
  ON CONFLICT (user_id) DO NOTHING;

  UPDATE user_wallet SET
    contact_credits  = contact_credits  + COALESCE(v_plan.contacts_limit, 0),
    interest_credits = interest_credits + COALESCE(v_plan.interests_limit, 0),
    updated_at = NOW()
  WHERE user_id = p_user_id;
  UPDATE profiles SET
    contacts_remaining  = GREATEST(0, COALESCE(contacts_remaining,0))  + COALESCE(v_plan.contacts_limit, 0),
    interests_remaining = GREATEST(0, COALESCE(interests_remaining,0)) + COALESCE(v_plan.interests_limit, 0)
  WHERE id = p_user_id;

  SELECT * INTO v_state FROM user_distribution_state WHERE user_id = p_user_id;
  IF NOT (p_tier = ANY(v_state.initial_distribution_granted_tiers)) THEN
    v_rec   := GREATEST(COALESCE(v_state.recommended_profiles_shown,0), COALESCE(v_plan.initial_recommended_profiles,0));
    v_near  := GREATEST(COALESCE(v_state.nearby_profiles_shown,0),      COALESCE(v_plan.initial_nearby_profiles,0));
    v_daily := GREATEST(COALESCE(v_state.daily_profiles_shown,0),       COALESCE(v_plan.initial_daily_profiles,0));
    UPDATE user_distribution_state SET
      recommended_profiles_shown = v_rec,
      nearby_profiles_shown      = v_near,
      daily_profiles_shown       = v_daily,
      initial_distribution_granted_tiers = array_append(initial_distribution_granted_tiers, p_tier),
      highest_tier_ever_reached = CASE
        WHEN public.tier_rank(p_tier) > public.tier_rank(COALESCE(highest_tier_ever_reached,'free'))
        THEN p_tier ELSE highest_tier_ever_reached END,
      updated_at = NOW()
    WHERE user_id = p_user_id;
  ELSE
    UPDATE user_distribution_state SET
      highest_tier_ever_reached = CASE
        WHEN public.tier_rank(p_tier) > public.tier_rank(COALESCE(highest_tier_ever_reached,'free'))
        THEN p_tier ELSE highest_tier_ever_reached END,
      updated_at = NOW()
    WHERE user_id = p_user_id;
  END IF;
END;
$$ LANGUAGE plpgsql;
-- ============================================================================
-- 9. QUOTA / PURCHASE / INTEREST / CONTACT RPCs
-- ============================================================================

-- 9a. purchase_subscription — tier-aware activation + queue stacking.
CREATE OR REPLACE FUNCTION public.purchase_subscription(
  p_user_id UUID, p_plan_type TEXT, p_payment_id TEXT DEFAULT NULL, p_amount INTEGER DEFAULT NULL
) RETURNS JSONB
SECURITY DEFINER SET search_path = public AS $$
DECLARE
  v_plan RECORD; v_prof RECORD; v_new_expiry TIMESTAMPTZ; v_sub_id UUID;
  v_cur_active BOOLEAN; v_cur_rank INTEGER; v_new_rank INTEGER; v_remaining INTEGER;
  v_queued BOOLEAN := false; v_activated BOOLEAN := true;
BEGIN
  IF p_plan_type IN ('free','non_premium') THEN
    RAISE EXCEPTION 'INVALID_PLAN: cannot purchase the free tier';
  END IF;
  SELECT * INTO v_plan FROM subscription_plans WHERE tier = p_plan_type;
  IF v_plan IS NULL THEN RAISE EXCEPTION 'INVALID_PLAN_TYPE: %', p_plan_type; END IF;

  SELECT tier, is_premium, premium_expires_at INTO v_prof FROM profiles WHERE id = p_user_id;
  v_cur_active := (v_prof.premium_expires_at IS NOT NULL AND v_prof.premium_expires_at > NOW());
  v_cur_rank   := public.tier_rank(COALESCE(v_prof.tier,'free'));
  v_new_rank   := public.tier_rank(p_plan_type);

  PERFORM public._grant_plan_benefits(p_user_id, p_plan_type);

  INSERT INTO subscriptions
    (user_id, plan_type, status, amount, razorpay_payment_id, contacts_added, interests_added, starts_at, expires_at)
  VALUES
    (p_user_id, p_plan_type, 'active', COALESCE(p_amount, v_plan.price_inr), p_payment_id,
     v_plan.contacts_limit, v_plan.interests_limit, NOW(),
     NOW() + (v_plan.duration_months || ' months')::INTERVAL)
  RETURNING id INTO v_sub_id;

  IF p_payment_id IS NOT NULL THEN
    INSERT INTO payments (user_id, subscription_id, plan_type, amount, tax, final_amount,
      payment_gateway, gateway_transaction_id, status)
    VALUES (p_user_id, v_sub_id, p_plan_type,
      COALESCE(p_amount, v_plan.price_inr), 0, COALESCE(p_amount, v_plan.price_inr),
      CASE WHEN p_payment_id LIKE 'pay_mock_%' THEN 'mock' ELSE 'razorpay' END,
      p_payment_id, 'success');
  END IF;

  IF NOT v_cur_active OR v_new_rank > v_cur_rank THEN
    IF v_cur_active AND v_new_rank > v_cur_rank AND v_prof.tier IS NOT NULL AND v_prof.tier <> 'free' THEN
      v_remaining := GREATEST(0, CEIL(EXTRACT(EPOCH FROM (v_prof.premium_expires_at - NOW())) / 86400)::INT);
      IF v_remaining > 0 THEN
        INSERT INTO subscription_queue (user_id, plan_tier, remaining_days, duration_months, status)
        VALUES (p_user_id, v_prof.tier, v_remaining, NULL, 'paused');
      END IF;
    END IF;
    v_new_expiry := NOW() + (v_plan.duration_months || ' months')::INTERVAL;
    UPDATE profiles SET tier = p_plan_type, is_premium = true, is_verified = true,
      premium_expires_at = v_new_expiry WHERE id = p_user_id;
    v_activated := true;
  ELSE
    UPDATE subscriptions SET status = 'queued' WHERE id = v_sub_id;
    INSERT INTO subscription_queue (user_id, plan_tier, remaining_days, duration_months, status)
    VALUES (p_user_id, p_plan_type, NULL, v_plan.duration_months, 'pending');
    v_new_expiry := v_prof.premium_expires_at; v_activated := false; v_queued := true;
  END IF;

  RETURN jsonb_build_object('success', true, 'tier', p_plan_type, 'activated', v_activated,
    'queued', v_queued, 'expires_at', v_new_expiry,
    'contacts_added', v_plan.contacts_limit, 'interests_added', v_plan.interests_limit);
END;
$$ LANGUAGE plpgsql;
-- 9b. activate_next_queued — resume the highest-priority paused/pending plan.
CREATE OR REPLACE FUNCTION public.activate_next_queued(p_user_id UUID) RETURNS BOOLEAN
SECURITY DEFINER SET search_path = public AS $$
DECLARE
  v_next RECORD; v_plan RECORD; v_months INTEGER; v_expiry TIMESTAMPTZ;
BEGIN
  IF EXISTS (SELECT 1 FROM profiles WHERE id = p_user_id
             AND premium_expires_at IS NOT NULL AND premium_expires_at > NOW()
             AND tier <> 'free') THEN
    RETURN false;
  END IF;

  SELECT * INTO v_next FROM subscription_queue
  WHERE user_id = p_user_id AND status IN ('paused','pending')
  ORDER BY public.tier_rank(plan_tier) DESC, created_at ASC
  LIMIT 1;
  IF v_next IS NULL THEN RETURN false; END IF;

  SELECT * INTO v_plan FROM subscription_plans WHERE tier = v_next.plan_tier;
  IF v_plan IS NULL THEN DELETE FROM subscription_queue WHERE id = v_next.id; RETURN false; END IF;

  IF v_next.status = 'paused' AND v_next.remaining_days IS NOT NULL THEN
    v_expiry := NOW() + (v_next.remaining_days || ' days')::INTERVAL;
  ELSE
    v_months := COALESCE(v_next.duration_months, v_plan.duration_months);
    v_expiry := NOW() + (v_months || ' months')::INTERVAL;
    PERFORM public._grant_plan_benefits(p_user_id, v_next.plan_tier);
  END IF;

  UPDATE profiles SET tier = v_next.plan_tier, is_premium = true, is_verified = true,
    premium_expires_at = v_expiry WHERE id = p_user_id;
  UPDATE subscriptions SET status = 'active', expires_at = v_expiry
  WHERE user_id = p_user_id AND plan_type = v_next.plan_tier AND status = 'queued';
  DELETE FROM subscription_queue WHERE id = v_next.id;
  RETURN true;
END;
$$ LANGUAGE plpgsql;

-- 9c. send_interest_with_quota — deduct 1 interest credit (re-send reopens free).
CREATE OR REPLACE FUNCTION public.send_interest_with_quota(
  p_sender_id UUID, p_receiver_id UUID, p_message TEXT DEFAULT NULL
) RETURNS JSONB
SECURITY DEFINER SET search_path = public AS $$
DECLARE
  v_credits INTEGER; v_existing RECORD;
BEGIN
  IF p_sender_id = p_receiver_id THEN
    RAISE EXCEPTION 'SELF_INTEREST: cannot send interest to yourself';
  END IF;

  SELECT * INTO v_existing FROM interests
   WHERE sender_id = p_sender_id AND receiver_id = p_receiver_id;
  IF v_existing IS NOT NULL THEN
    UPDATE interests SET status = 'pending', message = COALESCE(p_message, message), updated_at = NOW()
     WHERE id = v_existing.id;
    RETURN jsonb_build_object('success', true, 'reopened', true);
  END IF;

  INSERT INTO user_wallet (user_id) VALUES (p_sender_id) ON CONFLICT DO NOTHING;
  SELECT interest_credits INTO v_credits FROM user_wallet WHERE user_id = p_sender_id;
  IF COALESCE(v_credits,0) <= 0 THEN
    RAISE EXCEPTION 'QUOTA_EXCEEDED: No interests remaining';
  END IF;

  UPDATE user_wallet SET interest_credits = interest_credits - 1, updated_at = NOW()
  WHERE user_id = p_sender_id;
  UPDATE profiles SET interests_remaining = GREATEST(0, interests_remaining - 1) WHERE id = p_sender_id;

  INSERT INTO interests (sender_id, receiver_id, status, message)
  VALUES (p_sender_id, p_receiver_id, 'pending', p_message)
  ON CONFLICT (sender_id, receiver_id) DO UPDATE SET status = 'pending';

  RETURN jsonb_build_object('success', true, 'reopened', false);
END;
$$ LANGUAGE plpgsql;
-- 9d. pass_profile — record "not interested" (no quota burn).
CREATE OR REPLACE FUNCTION public.pass_profile(
  p_sender_id UUID, p_receiver_id UUID
) RETURNS JSONB
SECURITY DEFINER SET search_path = public AS $$
BEGIN
  INSERT INTO interests (sender_id, receiver_id, status)
  VALUES (p_sender_id, p_receiver_id, 'passed')
  ON CONFLICT (sender_id, receiver_id) DO UPDATE SET status = 'passed', updated_at = NOW();
  RETURN jsonb_build_object('success', true);
END;
$$ LANGUAGE plpgsql;

-- 9e. unlock_contact — deduct 1 contact credit (idempotent per viewed user).
CREATE OR REPLACE FUNCTION public.unlock_contact(
  p_viewer_id UUID, p_viewed_id UUID
) RETURNS JSONB
SECURITY DEFINER SET search_path = public AS $$
DECLARE
  v_credits INTEGER; v_already BOOLEAN;
BEGIN
  IF p_viewer_id = p_viewed_id THEN
    RETURN jsonb_build_object('success', true, 'self', true);
  END IF;

  SELECT EXISTS(SELECT 1 FROM contact_views WHERE viewer_id = p_viewer_id AND viewed_id = p_viewed_id)
    INTO v_already;
  IF v_already THEN RETURN jsonb_build_object('success', true, 'already_unlocked', true); END IF;

  INSERT INTO user_wallet (user_id) VALUES (p_viewer_id) ON CONFLICT DO NOTHING;
  SELECT contact_credits INTO v_credits FROM user_wallet WHERE user_id = p_viewer_id;
  IF COALESCE(v_credits,0) <= 0 THEN
    RAISE EXCEPTION 'QUOTA_EXCEEDED: No contacts remaining';
  END IF;

  UPDATE user_wallet SET contact_credits = contact_credits - 1, updated_at = NOW()
  WHERE user_id = p_viewer_id;
  UPDATE profiles SET contacts_remaining = GREATEST(0, contacts_remaining - 1) WHERE id = p_viewer_id;

  INSERT INTO contact_views (viewer_id, viewed_id) VALUES (p_viewer_id, p_viewed_id)
  ON CONFLICT (viewer_id, viewed_id) DO NOTHING;

  RETURN jsonb_build_object('success', true, 'already_unlocked', false);
END;
$$ LANGUAGE plpgsql;

-- 9f. get_user_quota — wallet + per-user pool; self-heals lapsed premium then
--     resumes the next queued/paused plan.
CREATE OR REPLACE FUNCTION public.get_user_quota(p_user_id UUID)
RETURNS JSONB
SECURITY DEFINER SET search_path = public AS $$
DECLARE
  v_prof RECORD; v_wallet RECORD; v_dist RECORD; v_plan RECORD; v_tier TEXT;
BEGIN
  SELECT tier, is_premium, premium_expires_at INTO v_prof FROM profiles WHERE id = p_user_id;
  IF v_prof IS NULL THEN
    RETURN jsonb_build_object('tier','FREE','contact_credits',0,'interest_credits',0,
      'recommended_limit',5,'nearby_limit',5,'daily_limit',5,
      'contacts_remaining',0,'interests_remaining',0,'dynamic_daily_enabled',true);
  END IF;

  IF v_prof.is_premium AND v_prof.premium_expires_at IS NOT NULL AND v_prof.premium_expires_at < NOW() THEN
    UPDATE profiles SET is_premium = false, tier = 'free' WHERE id = p_user_id;
    PERFORM public.activate_next_queued(p_user_id);
    SELECT tier, is_premium, premium_expires_at INTO v_prof FROM profiles WHERE id = p_user_id;
  END IF;
  v_tier := COALESCE(v_prof.tier, 'free');

  SELECT * INTO v_wallet FROM user_wallet WHERE user_id = p_user_id;
  SELECT * INTO v_dist FROM user_distribution_state WHERE user_id = p_user_id;
  SELECT * INTO v_plan FROM subscription_plans WHERE tier = v_tier;

  RETURN jsonb_build_object(
    'tier', UPPER(v_tier),
    'is_premium', (v_tier <> 'free'),
    'expires_at', v_prof.premium_expires_at,
    'contact_credits',  COALESCE(v_wallet.contact_credits, 0),
    'interest_credits', COALESCE(v_wallet.interest_credits, 0),
    'recommended_limit', COALESCE(v_dist.recommended_profiles_shown, COALESCE(v_plan.initial_recommended_profiles, 5)),
    'nearby_limit',      COALESCE(v_dist.nearby_profiles_shown,      COALESCE(v_plan.initial_nearby_profiles, 5)),
    'daily_limit',       COALESCE(v_dist.daily_profiles_shown,       COALESCE(v_plan.initial_daily_profiles, 5)),
    'dynamic_daily_enabled', true,
    'contacts_remaining',  COALESCE(v_wallet.contact_credits, 0),
    'interests_remaining', COALESCE(v_wallet.interest_credits, 0)
  );
END;
$$ LANGUAGE plpgsql;

-- 9g. get_user_quotas (plural) — base quota + queued/previous packs for Settings.
CREATE OR REPLACE FUNCTION public.get_user_quotas(p_user_id UUID)
RETURNS JSONB
SECURITY DEFINER SET search_path = public AS $$
DECLARE v_base JSONB; v_queue JSONB;
BEGIN
  v_base := public.get_user_quota(p_user_id);
  SELECT COALESCE(jsonb_agg(jsonb_build_object(
            'plan', q.plan_tier, 'label', INITCAP(q.plan_tier),
            'status', q.status, 'remaining_days', q.remaining_days,
            'duration_months', q.duration_months
          ) ORDER BY public.tier_rank(q.plan_tier) DESC, q.created_at ASC), '[]'::jsonb)
    INTO v_queue
  FROM subscription_queue q
  WHERE q.user_id = p_user_id AND q.status IN ('paused','pending');
  RETURN v_base || jsonb_build_object('other_plans', v_queue);
END;
$$ LANGUAGE plpgsql;
-- ============================================================================
-- NEXT: run the remaining files in order:
--   02_feeds.sql        (feed RPCs: recommended / nearby / daily)
--   03_admin_rpcs.sql   (admin + distribution-management RPCs, helpers)
--   04_rls_grants.sql   (indexes, RLS policies, realtime, grants)
-- ============================================================================
NOTIFY pgrst, 'reload schema';
