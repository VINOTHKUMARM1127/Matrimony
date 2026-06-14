-- ==============================================================================
-- SCHEMA MIGRATION: TIER SETTINGS & DAILY ACCUMULATION
-- ==============================================================================

-- 1. Add `tier` to profiles (Default 'free')
ALTER TABLE public.profiles ADD COLUMN IF NOT EXISTS tier TEXT DEFAULT 'free';

-- Ensure existing premium users get correctly mapped to their active tier
UPDATE public.profiles p
SET tier = COALESCE(
  (
    SELECT plan_type 
    FROM public.subscriptions s 
    WHERE s.user_id = p.id AND s.status = 'active' AND s.expires_at >= NOW() 
    ORDER BY s.expires_at DESC LIMIT 1
  ), 
  'free'
);

-- Ensure we have contacts_remaining and interests_remaining (Alias them to existing if needed)
-- We will rename the columns added in `tier_quotas.sql` to match the exact spec
ALTER TABLE public.profiles RENAME COLUMN contacts_balance TO contacts_remaining;
ALTER TABLE public.profiles RENAME COLUMN interests_balance TO interests_remaining;

-- 2. Create `tier_settings` table
CREATE TABLE IF NOT EXISTS public.tier_settings (
  tier TEXT PRIMARY KEY CHECK (tier IN ('free','silver','gold','platinum')),
  recommended_limit INT NOT NULL DEFAULT 0,
  nearby_limit INT NOT NULL DEFAULT 0,
  daily_limit INT NOT NULL DEFAULT 0,
  dynamic_daily_enabled BOOLEAN NOT NULL DEFAULT false,
  updated_at TIMESTAMPTZ DEFAULT NOW()
);

-- Enable RLS
ALTER TABLE public.tier_settings ENABLE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "Anyone can read tier_settings" ON public.tier_settings;
CREATE POLICY "Anyone can read tier_settings" ON public.tier_settings FOR SELECT USING (true);
DROP POLICY IF EXISTS "Only Admins can update tier_settings" ON public.tier_settings;
CREATE POLICY "Only Admins can update tier_settings" ON public.tier_settings FOR ALL USING (
  EXISTS (SELECT 1 FROM admin_users WHERE email = auth.email() AND role = 'admin')
);

-- Seed defaults
INSERT INTO public.tier_settings (tier, recommended_limit, nearby_limit, daily_limit, dynamic_daily_enabled)
VALUES 
  ('free', 5, 5, 5, false),
  ('silver', 50, 50, 20, true),
  ('gold', 100, 100, 30, true),
  ('platinum', 200, 200, 50, true)
ON CONFLICT (tier) DO UPDATE SET
  recommended_limit = EXCLUDED.recommended_limit,
  nearby_limit = EXCLUDED.nearby_limit,
  daily_limit = EXCLUDED.daily_limit,
  dynamic_daily_enabled = EXCLUDED.dynamic_daily_enabled,
  updated_at = NOW();


-- 3. Create `user_profile_views` table (for daily accumulation)
CREATE TABLE IF NOT EXISTS public.user_profile_views (
  user_id UUID REFERENCES public.profiles(id) ON DELETE CASCADE,
  section TEXT CHECK (section IN ('recommended','nearby','daily')),
  profile_ids UUID[] DEFAULT ARRAY[]::UUID[],
  last_updated DATE DEFAULT CURRENT_DATE,
  PRIMARY KEY (user_id, section)
);

-- RLS
ALTER TABLE public.user_profile_views ENABLE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "Users manage own profile views" ON public.user_profile_views;
CREATE POLICY "Users manage own profile views" ON public.user_profile_views FOR ALL USING (auth.uid() = user_id);

-- ==============================================================================
-- UPDATE RPCS TO USE tier_settings
-- ==============================================================================

-- Recommended Profiles
CREATE OR REPLACE FUNCTION get_recommended_profiles(
  p_user_id UUID,
  p_limit INTEGER DEFAULT 20,
  p_offset INTEGER DEFAULT 0
)
RETURNS TABLE(
  id UUID, profile_id TEXT, display_name TEXT, gender TEXT,
  date_of_birth DATE, height_cm INTEGER, marital_status TEXT,
  religion TEXT, caste TEXT, city TEXT, district TEXT, state TEXT,
  education TEXT, occupation TEXT, annual_income TEXT,
  food_habit TEXT, is_verified BOOLEAN, is_premium BOOLEAN,
  last_active_at TIMESTAMPTZ, profile_completion_percent INTEGER,
  compatibility_score INTEGER
) AS $$
DECLARE
  v_gender TEXT;
  v_religion TEXT;
  v_caste TEXT;
  v_state TEXT;
  v_user_tier TEXT;
  v_allowed_limit INTEGER;
BEGIN
  -- Get user profile and tier
  SELECT p.gender, p.religion, p.caste, p.state, p.tier
  INTO v_gender, v_religion, v_caste, v_state, v_user_tier
  FROM profiles p WHERE p.id = p_user_id;

  -- LIVE FETCH from tier_settings
  SELECT recommended_limit INTO v_allowed_limit
  FROM tier_settings WHERE tier = v_user_tier;

  v_allowed_limit := COALESCE(v_allowed_limit, 5);

  -- CLAMP limit across pagination
  p_limit := LEAST(p_limit, GREATEST(0, v_allowed_limit - p_offset));
  IF p_limit <= 0 THEN RETURN; END IF;

  RETURN QUERY
  SELECT
    p.id, p.profile_id, p.display_name, p.gender,
    p.date_of_birth, p.height_cm, p.marital_status,
    p.religion, p.caste, p.city, p.district, p.state,
    p.education, p.occupation, p.annual_income,
    p.food_habit, p.is_verified, p.is_premium,
    p.last_active_at, p.profile_completion_percent,
    (
      CASE WHEN p.religion = v_religion THEN 20 ELSE 0 END +
      CASE WHEN p.caste = v_caste THEN 15 ELSE 0 END +
      CASE WHEN p.state = v_state THEN 10 ELSE 0 END +
      CASE WHEN p.is_verified THEN 10 ELSE 0 END +
      CASE WHEN p.is_premium THEN 5 ELSE 0 END +
      COALESCE(p.profile_completion_percent / 5, 0) +
      CASE WHEN p.last_active_at > NOW() - INTERVAL '7 days' THEN 10 ELSE 0 END
    )::INTEGER AS compatibility_score
  FROM profiles p
  WHERE p.is_active = true
    AND p.id != p_user_id
    AND p.gender != v_gender
    AND NOT EXISTS (
      SELECT 1 FROM blocked_users b
      WHERE (b.blocker_id = p_user_id AND b.blocked_id = p.id)
         OR (b.blocker_id = p.id AND b.blocked_id = p_user_id)
    )
    AND NOT EXISTS (
      SELECT 1 FROM interests i
      WHERE (i.sender_id = p_user_id AND i.receiver_id = p.id)
         OR (i.sender_id = p.id AND i.receiver_id = p_user_id)
    )
  ORDER BY compatibility_score DESC, p.last_active_at DESC
  LIMIT p_limit OFFSET p_offset;
END;
$$ LANGUAGE plpgsql SECURITY DEFINER;


-- Nearby Profiles
CREATE OR REPLACE FUNCTION get_nearby_profiles(
  p_user_id UUID,
  p_limit INTEGER DEFAULT 20,
  p_offset INTEGER DEFAULT 0
)
RETURNS TABLE(
  id UUID, profile_id TEXT, display_name TEXT, gender TEXT,
  date_of_birth DATE, height_cm INTEGER, marital_status TEXT,
  religion TEXT, caste TEXT, city TEXT, district TEXT, state TEXT,
  education TEXT, occupation TEXT, annual_income TEXT,
  food_habit TEXT, is_verified BOOLEAN, is_premium BOOLEAN,
  last_active_at TIMESTAMPTZ, profile_completion_percent INTEGER,
  compatibility_score INTEGER
) AS $$
DECLARE
  v_gender TEXT;
  v_religion TEXT;
  v_caste TEXT;
  v_state TEXT;
  v_city TEXT;
  v_district TEXT;
  v_user_tier TEXT;
  v_allowed_limit INTEGER;
BEGIN
  -- Get user profile and tier
  SELECT p.gender, p.religion, p.caste, p.state, p.city, p.district, p.tier
  INTO v_gender, v_religion, v_caste, v_state, v_city, v_district, v_user_tier
  FROM profiles p WHERE p.id = p_user_id;

  -- LIVE FETCH from tier_settings
  SELECT nearby_limit INTO v_allowed_limit
  FROM tier_settings WHERE tier = v_user_tier;

  v_allowed_limit := COALESCE(v_allowed_limit, 5);

  -- CLAMP limit across pagination
  p_limit := LEAST(p_limit, GREATEST(0, v_allowed_limit - p_offset));
  IF p_limit <= 0 THEN RETURN; END IF;

  RETURN QUERY
  SELECT
    p.id, p.profile_id, p.display_name, p.gender,
    p.date_of_birth, p.height_cm, p.marital_status,
    p.religion, p.caste, p.city, p.district, p.state,
    p.education, p.occupation, p.annual_income,
    p.food_habit, p.is_verified, p.is_premium,
    p.last_active_at, p.profile_completion_percent,
    (
      CASE WHEN p.religion = v_religion THEN 20 ELSE 0 END +
      CASE WHEN p.caste = v_caste THEN 15 ELSE 0 END +
      CASE WHEN p.city = v_city THEN 30 ELSE 0 END +
      CASE WHEN p.district = v_district THEN 20 ELSE 0 END +
      CASE WHEN p.state = v_state THEN 10 ELSE 0 END +
      CASE WHEN p.is_verified THEN 10 ELSE 0 END +
      CASE WHEN p.is_premium THEN 5 ELSE 0 END +
      COALESCE(p.profile_completion_percent / 5, 0) +
      CASE WHEN p.last_active_at > NOW() - INTERVAL '7 days' THEN 10 ELSE 0 END
    )::INTEGER AS compatibility_score
  FROM profiles p
  WHERE p.is_active = true
    AND p.id != p_user_id
    AND p.gender != v_gender
    AND NOT EXISTS (
      SELECT 1 FROM blocked_users b
      WHERE (b.blocker_id = p_user_id AND b.blocked_id = p.id)
         OR (b.blocker_id = p.id AND b.blocked_id = p_user_id)
    )
    AND NOT EXISTS (
      SELECT 1 FROM interests i
      WHERE (i.sender_id = p_user_id AND i.receiver_id = p.id)
         OR (i.sender_id = p.id AND i.receiver_id = p_user_id)
    )
  ORDER BY compatibility_score DESC, p.last_active_at DESC
  LIMIT p_limit OFFSET p_offset;
END;
$$ LANGUAGE plpgsql SECURITY DEFINER;


-- Daily Matches (Accumulation Logic)
CREATE OR REPLACE FUNCTION get_daily_matches(
  p_user_id UUID,
  p_limit INTEGER DEFAULT 10,
  p_offset INTEGER DEFAULT 0
)
RETURNS TABLE(
  id UUID, profile_id TEXT, display_name TEXT, gender TEXT,
  date_of_birth DATE, height_cm INTEGER, marital_status TEXT,
  religion TEXT, caste TEXT, city TEXT, district TEXT, state TEXT,
  education TEXT, occupation TEXT, annual_income TEXT,
  food_habit TEXT, is_verified BOOLEAN, is_premium BOOLEAN,
  last_active_at TIMESTAMPTZ, profile_completion_percent INTEGER,
  compatibility_score INTEGER
) AS $$
DECLARE
  v_gender TEXT;
  v_religion TEXT;
  v_caste TEXT;
  v_state TEXT;
  v_user_tier TEXT;
  
  v_allowed_daily_limit INTEGER;
  v_dynamic_enabled BOOLEAN;
  v_seen_ids UUID[];
  v_last_updated DATE;
  v_new_profiles UUID[];
BEGIN
  -- Get user profile and tier
  SELECT p.gender, p.religion, p.caste, p.state, p.tier
  INTO v_gender, v_religion, v_caste, v_state, v_user_tier
  FROM profiles p WHERE p.id = p_user_id;

  -- LIVE FETCH from tier_settings
  SELECT daily_limit, dynamic_daily_enabled 
  INTO v_allowed_daily_limit, v_dynamic_enabled
  FROM tier_settings WHERE tier = v_user_tier;

  v_allowed_daily_limit := COALESCE(v_allowed_daily_limit, 5);
  v_dynamic_enabled := COALESCE(v_dynamic_enabled, false);

  -- Fetch seen profiles from user_profile_views
  SELECT profile_ids, last_updated INTO v_seen_ids, v_last_updated
  FROM user_profile_views WHERE user_id = p_user_id AND section = 'daily';

  -- If it's a new day, and dynamic daily is enabled (premium), we reset the accumulation pool,
  -- wait, the spec says "Daily profiles ACCUMULATE (not reset): Day 1: 30, Day 2: next 30".
  -- So we do NOT reset the array. We just keep adding. 
  
  IF v_seen_ids IS NULL THEN
    v_seen_ids := ARRAY[]::UUID[];
  END IF;

  -- We need to return the FIRST `v_allowed_daily_limit` profiles.
  -- But we need to make sure we always show the ones we already added.
  -- The easiest way to "accumulate" is to just query all profiles EXCEPT the ones the user explicitly interacted with.
  -- Wait, the spec says "already-seen profile IDs stored in user_profile_views — never show same profile twice in Daily section"
  -- Ah, so if they are seen, we DON'T show them? 
  -- But wait, "Day 1: show 30 profiles, Day 2: show next 30 profiles (total seen = 60)"
  -- This implies the daily section shows previously seen + new ones up to the new count?
  -- Or does it show 30 NEW profiles? "never show same profile twice in Daily section".
  -- That means the list ONLY contains NEW profiles.
  -- Day 1: 30 new profiles. Day 2: 30 new profiles. Total seen forever = 60.

  -- CLAMP limit across pagination for THIS request
  p_limit := LEAST(p_limit, GREATEST(0, v_allowed_daily_limit - p_offset));
  IF p_limit <= 0 THEN RETURN; END IF;

  -- We will select NEW profiles that are NOT in v_seen_ids.
  
  RETURN QUERY
  WITH new_matches AS (
    SELECT
      p.id, p.profile_id, p.display_name, p.gender,
      p.date_of_birth, p.height_cm, p.marital_status,
      p.religion, p.caste, p.city, p.district, p.state,
      p.education, p.occupation, p.annual_income,
      p.food_habit, p.is_verified, p.is_premium,
      p.last_active_at, p.profile_completion_percent,
      (
        CASE WHEN p.religion = v_religion THEN 20 ELSE 0 END +
        CASE WHEN p.caste = v_caste THEN 15 ELSE 0 END +
        CASE WHEN p.state = v_state THEN 10 ELSE 0 END
      )::INTEGER AS compatibility_score
    FROM profiles p
    WHERE p.is_active = true
      AND p.id != p_user_id
      AND p.gender != v_gender
      AND p.id != ALL(v_seen_ids) -- Ensure NEVER shown twice
      AND NOT EXISTS (
        SELECT 1 FROM blocked_users b
        WHERE (b.blocker_id = p_user_id AND b.blocked_id = p.id)
           OR (b.blocker_id = p.id AND b.blocked_id = p_user_id)
      )
      AND NOT EXISTS (
        SELECT 1 FROM interests i
        WHERE (i.sender_id = p_user_id AND i.receiver_id = p.id)
           OR (i.sender_id = p.id AND i.receiver_id = p_user_id)
      )
    ORDER BY compatibility_score DESC, p.last_active_at DESC
    LIMIT p_limit OFFSET p_offset
  )
  SELECT * FROM new_matches;
  
  -- The app calls this RPC. We cannot easily do an UPDATE returning.
  -- So we need to separately log views, OR update here.
  -- Since it's a SELECT function, we can't easily perform DML inside unless we do it dynamically or bypass STRICT purity.
  -- Wait, postgres allows DML in functions that are not STRICT or IMMUTABLE.
  -- We can update user_profile_views!
END;
$$ LANGUAGE plpgsql SECURITY DEFINER;

-- Because we can't easily fetch AND update in the same statement and return a TABLE cleanly 
-- without side-effects that might trigger on pagination, we create a separate RPC to explicitly log views.
CREATE OR REPLACE FUNCTION log_daily_views(p_user_id UUID, p_viewed_ids UUID[])
RETURNS VOID AS $$
BEGIN
  INSERT INTO user_profile_views (user_id, section, profile_ids, last_updated)
  VALUES (p_user_id, 'daily', p_viewed_ids, CURRENT_DATE)
  ON CONFLICT (user_id, section) DO UPDATE SET
    profile_ids = ARRAY(
      SELECT DISTINCT unnest(user_profile_views.profile_ids || EXCLUDED.profile_ids)
    ),
    last_updated = CURRENT_DATE;
END;
$$ LANGUAGE plpgsql SECURITY DEFINER;
