-- ==============================================================================
-- STRICT BACKEND LIMITS AND VERIFICATION
-- This script replaces the existing matching functions to enforce admin limits
-- and static pool freezing directly inside PostgreSQL.
-- ==============================================================================

-- 1. Helper Function: Get User Tier Limits from admin_settings
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
  
  IF v_tier IS NULL THEN
    v_tier := 'non_premium';
  END IF;

  -- Get limits for tier
  SELECT setting_value->v_tier INTO v_limits
  FROM admin_settings
  WHERE setting_key = 'matches_limits';

  -- Fallback if missing
  IF v_limits IS NULL THEN
    v_limits := '{"recommended": 20, "nearby": 20, "daily": 5, "dynamic_daily_updates": false}'::JSONB;
  END IF;

  RETURN v_limits;
END;
$$ LANGUAGE plpgsql SECURITY DEFINER;


-- 2. Helper Function: Get Static Freeze Date
CREATE OR REPLACE FUNCTION get_static_date(p_user_id UUID, p_is_dynamic BOOLEAN)
RETURNS TIMESTAMPTZ AS $$
DECLARE
  v_static_date TIMESTAMPTZ;
  v_sub_expire TIMESTAMPTZ;
  v_created_at TIMESTAMPTZ;
BEGIN
  IF p_is_dynamic THEN
    RETURN NOW() + INTERVAL '100 years'; -- effectively infinity
  END IF;

  -- Find latest expired subscription or account creation
  SELECT expires_at INTO v_sub_expire
  FROM subscriptions
  WHERE user_id = p_user_id
  ORDER BY expires_at DESC LIMIT 1;

  SELECT created_at INTO v_created_at
  FROM profiles
  WHERE id = p_user_id;

  v_static_date := COALESCE(v_sub_expire, v_created_at, NOW());
  RETURN v_static_date;
END;
$$ LANGUAGE plpgsql SECURITY DEFINER;


-- 3. Replace get_recommended_profiles to strictly enforce limits
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
  
  -- Security Variables
  v_limits JSONB;
  v_allowed_limit INTEGER;
  v_is_dynamic BOOLEAN;
  v_static_date TIMESTAMPTZ;
BEGIN
  -- Backend Security Enforcement
  v_limits := get_user_limits(p_user_id);
  v_allowed_limit := COALESCE((v_limits->>'recommended')::INTEGER, 20);
  v_is_dynamic := COALESCE((v_limits->>'dynamic_daily_updates')::BOOLEAN, false);
  v_static_date := get_static_date(p_user_id, v_is_dynamic);

  -- CLAMP the limit securely!
  p_limit := LEAST(p_limit, v_allowed_limit);

  -- Get user's profile
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
    AND p.created_at <= v_static_date -- Enforced Server-Side Freeze!
    AND NOT EXISTS (
      SELECT 1 FROM blocked_users b
      WHERE (b.blocker_id = p_user_id AND b.blocked_id = p.id)
         OR (b.blocker_id = p.id AND b.blocked_id = p_user_id)
    )
  ORDER BY
    compatibility_score DESC,
    p.is_premium DESC,
    p.last_active_at DESC
  LIMIT p_limit
  OFFSET p_offset;
END;
$$ LANGUAGE plpgsql SECURITY DEFINER;


-- 4. Create get_nearby_profiles to securely fetch nearby limits
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
  
  -- Security Variables
  v_limits JSONB;
  v_allowed_limit INTEGER;
  v_is_dynamic BOOLEAN;
  v_static_date TIMESTAMPTZ;
BEGIN
  -- Backend Security Enforcement
  v_limits := get_user_limits(p_user_id);
  v_allowed_limit := COALESCE((v_limits->>'nearby')::INTEGER, 20);
  v_is_dynamic := COALESCE((v_limits->>'dynamic_daily_updates')::BOOLEAN, false);
  v_static_date := get_static_date(p_user_id, v_is_dynamic);

  p_limit := LEAST(p_limit, v_allowed_limit);

  -- Get user's profile
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
      COALESCE(p.profile_completion_percent / 5, 0)
    )::INTEGER AS compatibility_score
  FROM profiles p
  WHERE p.is_active = true
    AND p.id != p_user_id
    AND p.gender != v_gender
    AND p.created_at <= v_static_date
    AND (p.city = v_city OR p.district = v_district OR p.state = v_state)
    AND NOT EXISTS (
      SELECT 1 FROM blocked_users b
      WHERE (b.blocker_id = p_user_id AND b.blocked_id = p.id)
         OR (b.blocker_id = p.id AND b.blocked_id = p_user_id)
    )
  ORDER BY
    compatibility_score DESC,
    p.last_active_at DESC
  LIMIT p_limit
  OFFSET p_offset;
END;
$$ LANGUAGE plpgsql SECURITY DEFINER;


-- 5. Modify RLS Policy to prevent Free Users from manually scraping ALL profiles
-- Note: This requires active profiles to be visible generally, but if we drop the direct
-- 'SELECT * FROM profiles' usage in the app, we can restrict this policy!
-- For now, we will leave the base RLS as is, but instruct the frontend to use RPCs exclusively.
