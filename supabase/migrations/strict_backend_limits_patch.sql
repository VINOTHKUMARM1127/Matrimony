-- ==============================================================================
-- STRICT BACKEND LIMITS PATCH v2 (DAILY ROTATION + OFFSET CLAMPING)
-- 
-- HOW DAILY ROTATION WORKS:
-- ─────────────────────────
-- Even if 1000 profiles exist, admin limits each tier to see only N per day.
-- 
-- For PREMIUM users (dynamic_daily_updates = true):
--   Each day, profiles are shuffled using a daily seed (md5 of user_id + date).
--   This means every day the user opens the app, they see DIFFERENT profiles
--   from the pool, keeping the experience fresh and encouraging daily visits.
--   Example: Day 1 shows profiles A,B,C. Day 2 shows D,E,F. Day 3 shows G,H,I...
--
-- For FREE users (dynamic_daily_updates = false):
--   Profiles are always sorted by the same static order (compatibility score).
--   The user sees the SAME profiles every time they open the app.
--   This is intentional — to encourage upgrading to premium for fresh matches.
-- ==============================================================================

-- 0. Patch get_user_limits to handle 'free' plan mapping correctly
CREATE OR REPLACE FUNCTION get_user_limits(p_user_id UUID)
RETURNS JSONB AS $$
DECLARE
  v_tier TEXT;
  v_limits JSONB;
BEGIN
  -- Determine user tier from active subscription
  SELECT plan_type INTO v_tier
  FROM subscriptions
  WHERE user_id = p_user_id AND status = 'active' AND expires_at >= NOW()
  ORDER BY expires_at DESC LIMIT 1;
  
  -- Map both NULL and 'free' to the 'non_premium' key expected by admin_settings
  IF v_tier IS NULL OR v_tier = 'free' THEN
    v_tier := 'non_premium';
  END IF;

  -- Get limits for tier from admin_settings
  SELECT setting_value->v_tier INTO v_limits
  FROM admin_settings
  WHERE setting_key = 'matches_limits';

  -- Fallback if admin_settings is missing
  IF v_limits IS NULL THEN
    IF v_tier = 'non_premium' THEN
      v_limits := '{"recommended": 3, "nearby": 3, "daily": 3, "dynamic_daily_updates": false}'::JSONB;
    ELSE
      v_limits := '{"recommended": 50, "nearby": 50, "daily": 50, "dynamic_daily_updates": true}'::JSONB;
    END IF;
  END IF;

  -- 2. Premium Cumulative Limits: Multiply by days active
  IF (v_limits->>'dynamic_daily_updates')::BOOLEAN THEN
    DECLARE
      v_days_active INTEGER;
    BEGIN
      SELECT GREATEST(1, CEIL(EXTRACT(EPOCH FROM (NOW() - created_at)) / 86400))
      INTO v_days_active
      FROM subscriptions
      WHERE user_id = p_user_id AND status = 'active'
      ORDER BY created_at DESC LIMIT 1;

      v_days_active := COALESCE(v_days_active, 1);

      v_limits := jsonb_set(v_limits, '{recommended}', to_jsonb(COALESCE((v_limits->>'recommended')::INTEGER, 50) * v_days_active));
      v_limits := jsonb_set(v_limits, '{nearby}', to_jsonb(COALESCE((v_limits->>'nearby')::INTEGER, 50) * v_days_active));
      v_limits := jsonb_set(v_limits, '{daily}', to_jsonb(COALESCE((v_limits->>'daily')::INTEGER, 50) * v_days_active));
    END;
  END IF;

  RETURN v_limits;
END;
$$ LANGUAGE plpgsql SECURITY DEFINER;


-- 1. get_recommended_profiles with daily rotation for premium users
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
  
  v_limits JSONB;
  v_allowed_limit INTEGER;
  v_is_dynamic BOOLEAN;
  v_daily_seed TEXT;
BEGIN
  -- Get admin-configured limits for user's tier
  v_limits := get_user_limits(p_user_id);
  v_allowed_limit := COALESCE((v_limits->>'recommended')::INTEGER, 20);
  v_is_dynamic := COALESCE((v_limits->>'dynamic_daily_updates')::BOOLEAN, false);

  -- CLAMP limit across pagination (total profiles across all pages cannot exceed admin limit)
  p_limit := LEAST(p_limit, GREATEST(0, v_allowed_limit - p_offset));

  IF p_limit <= 0 THEN
    RETURN; -- User has exceeded their allowed quota
  END IF;

  -- Daily rotation seed: changes every day, unique per user
  v_daily_seed := p_user_id::text || CURRENT_DATE::text;

  -- Get user's own profile for matching
  SELECT p.gender, p.religion, p.caste, p.state
  INTO v_gender, v_religion, v_caste, v_state
  FROM profiles p WHERE p.id = p_user_id;

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
    -- Exclude blocked users
    AND NOT EXISTS (
      SELECT 1 FROM blocked_users b
      WHERE (b.blocker_id = p_user_id AND b.blocked_id = p.id)
         OR (b.blocker_id = p.id AND b.blocked_id = p_user_id)
    )
    -- Exclude already interacted profiles (sent/received interest, passed)
    AND NOT EXISTS (
      SELECT 1 FROM interests i
      WHERE (i.sender_id = p_user_id AND i.receiver_id = p.id)
         OR (i.sender_id = p.id AND i.receiver_id = p_user_id)
    )
  ORDER BY
    CASE 
      WHEN v_is_dynamic THEN md5(v_daily_seed || p.id::text)
      ELSE lpad((1000 - (
        CASE WHEN p.religion = v_religion THEN 20 ELSE 0 END +
        CASE WHEN p.caste = v_caste THEN 15 ELSE 0 END +
        CASE WHEN p.state = v_state THEN 10 ELSE 0 END +
        CASE WHEN p.is_verified THEN 10 ELSE 0 END +
        CASE WHEN p.is_premium THEN 5 ELSE 0 END +
        COALESCE(p.profile_completion_percent / 5, 0) +
        CASE WHEN p.last_active_at > NOW() - INTERVAL '7 days' THEN 10 ELSE 0 END
      ))::text, 4, '0') || p.id::text
    END ASC
  LIMIT p_limit
  OFFSET p_offset;
END;
$$ LANGUAGE plpgsql SECURITY DEFINER;


-- 2. get_nearby_profiles with daily rotation for premium users
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
  
  v_limits JSONB;
  v_allowed_limit INTEGER;
  v_is_dynamic BOOLEAN;
  v_daily_seed TEXT;
BEGIN
  -- Get admin-configured limits for user's tier
  v_limits := get_user_limits(p_user_id);
  v_allowed_limit := COALESCE((v_limits->>'nearby')::INTEGER, 20);
  v_is_dynamic := COALESCE((v_limits->>'dynamic_daily_updates')::BOOLEAN, false);

  -- CLAMP limit across pagination
  p_limit := LEAST(p_limit, GREATEST(0, v_allowed_limit - p_offset));

  IF p_limit <= 0 THEN
    RETURN;
  END IF;

  -- Daily rotation seed
  v_daily_seed := p_user_id::text || CURRENT_DATE::text;

  -- Get user's own profile
  SELECT p.gender, p.religion, p.caste, p.state, p.city, p.district
  INTO v_gender, v_religion, v_caste, v_state, v_city, v_district
  FROM profiles p WHERE p.id = p_user_id;

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
    -- Exclude blocked users
    AND NOT EXISTS (
      SELECT 1 FROM blocked_users b
      WHERE (b.blocker_id = p_user_id AND b.blocked_id = p.id)
         OR (b.blocker_id = p.id AND b.blocked_id = p_user_id)
    )
    -- Exclude already interacted profiles (sent/received interest, passed)
    AND NOT EXISTS (
      SELECT 1 FROM interests i
      WHERE (i.sender_id = p_user_id AND i.receiver_id = p.id)
         OR (i.sender_id = p.id AND i.receiver_id = p_user_id)
    )
  ORDER BY
    CASE 
      WHEN v_is_dynamic THEN md5(v_daily_seed || p.id::text)
      ELSE lpad(
        (100 - (
          CASE WHEN p.city = v_city THEN 30 ELSE 0 END +
          CASE WHEN p.district = v_district THEN 20 ELSE 0 END +
          CASE WHEN p.state = v_state THEN 10 ELSE 0 END
        ))::text, 4, '0') || p.id::text
    END ASC
  LIMIT p_limit
  OFFSET p_offset;
END;
$$ LANGUAGE plpgsql SECURITY DEFINER;


-- 3. get_daily_matches — strictly backend-enforced daily limit
-- This replaces the old frontend date-math logic entirely.
-- The limit is read LIVE from admin_settings every time this RPC is called.
CREATE OR REPLACE FUNCTION get_daily_matches(
  p_user_id UUID,
  p_limit INTEGER DEFAULT 5,
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

  v_limits JSONB;
  v_allowed_limit INTEGER;
  v_is_dynamic BOOLEAN;
  v_daily_seed TEXT;
BEGIN
  -- Get admin-configured limits for user's tier (reads LIVE from admin_settings)
  v_limits := get_user_limits(p_user_id);
  v_allowed_limit := COALESCE((v_limits->>'daily')::INTEGER, 5);
  v_is_dynamic := COALESCE((v_limits->>'dynamic_daily_updates')::BOOLEAN, false);

  -- CLAMP limit across pagination
  p_limit := LEAST(p_limit, GREATEST(0, v_allowed_limit - p_offset));

  IF p_limit <= 0 THEN
    RETURN; -- User has exceeded their allowed daily quota
  END IF;

  -- Daily rotation seed: changes every day, unique per user
  v_daily_seed := p_user_id::text || CURRENT_DATE::text;

  -- Get user's own profile for matching
  SELECT p.gender, p.religion, p.caste, p.state
  INTO v_gender, v_religion, v_caste, v_state
  FROM profiles p WHERE p.id = p_user_id;

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
    -- Exclude blocked users
    AND NOT EXISTS (
      SELECT 1 FROM blocked_users b
      WHERE (b.blocker_id = p_user_id AND b.blocked_id = p.id)
         OR (b.blocker_id = p.id AND b.blocked_id = p_user_id)
    )
    -- Exclude already interacted profiles (sent/received interest, passed)
    AND NOT EXISTS (
      SELECT 1 FROM interests i
      WHERE (i.sender_id = p_user_id AND i.receiver_id = p.id)
         OR (i.sender_id = p.id AND i.receiver_id = p_user_id)
    )
  ORDER BY
    CASE
      -- PREMIUM: shuffle daily (different profiles each day)
      WHEN v_is_dynamic THEN md5(v_daily_seed || p.id::text)
      -- FREE: static compatibility order (same profiles every time)
      ELSE lpad((1000 - (
        CASE WHEN p.religion = v_religion THEN 20 ELSE 0 END +
        CASE WHEN p.caste = v_caste THEN 15 ELSE 0 END +
        CASE WHEN p.state = v_state THEN 10 ELSE 0 END +
        CASE WHEN p.is_verified THEN 10 ELSE 0 END +
        CASE WHEN p.is_premium THEN 5 ELSE 0 END +
        COALESCE(p.profile_completion_percent / 5, 0) +
        CASE WHEN p.last_active_at > NOW() - INTERVAL '7 days' THEN 10 ELSE 0 END
      ))::text, 4, '0') || p.id::text
    END ASC
  LIMIT p_limit
  OFFSET p_offset;
END;
$$ LANGUAGE plpgsql SECURITY DEFINER;
