-- ============================================================================
-- UNRESTRICT VISIBILITY: Feed Rewrites
-- Removes user_profile_pool and user_distribution_state limits from feed visibility.
-- All users (Free & Premium) get unrestricted access to browse the full feed.
-- Contact restrictions (Mobile Number) are preserved via unlock_contact quota.
-- ============================================================================

-- 1. get_all_matches
DROP FUNCTION IF EXISTS public.get_all_matches(UUID, INTEGER, INTEGER) CASCADE;
CREATE OR REPLACE FUNCTION public.get_all_matches(
  p_user_id UUID, p_limit INTEGER DEFAULT 20, p_offset INTEGER DEFAULT 0
)
RETURNS TABLE(
  id UUID, profile_id TEXT, display_name TEXT, gender TEXT, date_of_birth DATE,
  height_cm INTEGER, marital_status TEXT, religion TEXT, caste TEXT,
  city TEXT, district TEXT, state TEXT, education TEXT, occupation TEXT,
  annual_income TEXT, food_habit TEXT, about_me TEXT, is_verified BOOLEAN,
  is_premium BOOLEAN, tier TEXT, last_active_at TIMESTAMPTZ,
  profile_completion INTEGER, compatibility_score INTEGER,
  is_new_today BOOLEAN
)
SECURITY DEFINER SET search_path = public AS $$
DECLARE
  v_my_gender TEXT;
BEGIN
  SELECT me.gender INTO v_my_gender FROM profiles me WHERE me.id = p_user_id;

  RETURN QUERY
  SELECT pr.id, pr.id::TEXT AS profile_id, pr.name AS display_name, pr.gender, pr.date_of_birth,
         pr.height_cm, pr.marital_status, pr.religion, pr.caste,
         pr.city, pr.district, pr.state, pr.education, pr.occupation,
         pr.annual_income, pr.food_habit, pr.about_me, u.is_verified,
         pr.is_premium, pr.tier, pr.last_active_at, pr.profile_completion,
         80 AS compatibility_score, -- Calculated accurately in app
         (u.created_at > NOW() - INTERVAL '24 hours') AS is_new_today
  FROM profiles pr
  JOIN users u ON u.id = pr.id
  WHERE pr.is_active = true
    AND pr.id <> p_user_id
    AND pr.gender <> v_my_gender
  ORDER BY u.created_at DESC
  LIMIT p_limit OFFSET p_offset;
END;
$$ LANGUAGE plpgsql;

-- 2. get_daily_updates
DROP FUNCTION IF EXISTS public.get_daily_updates(UUID, INTEGER, INTEGER) CASCADE;
CREATE OR REPLACE FUNCTION public.get_daily_updates(
  p_user_id UUID, p_limit INTEGER DEFAULT 20, p_offset INTEGER DEFAULT 0
)
RETURNS TABLE(
  id UUID, profile_id TEXT, display_name TEXT, gender TEXT, date_of_birth DATE,
  height_cm INTEGER, marital_status TEXT, religion TEXT, caste TEXT,
  city TEXT, district TEXT, state TEXT, education TEXT, occupation TEXT,
  annual_income TEXT, food_habit TEXT, about_me TEXT, is_verified BOOLEAN,
  is_premium BOOLEAN, tier TEXT, last_active_at TIMESTAMPTZ,
  profile_completion INTEGER, compatibility_score INTEGER,
  is_new_today BOOLEAN
)
SECURITY DEFINER SET search_path = public AS $$
DECLARE
  v_my_gender TEXT;
BEGIN
  SELECT me.gender INTO v_my_gender FROM profiles me WHERE me.id = p_user_id;

  RETURN QUERY
  SELECT pr.id, pr.id::TEXT AS profile_id, pr.name AS display_name, pr.gender, pr.date_of_birth,
         pr.height_cm, pr.marital_status, pr.religion, pr.caste,
         pr.city, pr.district, pr.state, pr.education, pr.occupation,
         pr.annual_income, pr.food_habit, pr.about_me, u.is_verified,
         pr.is_premium, pr.tier, pr.last_active_at, pr.profile_completion,
         80 AS compatibility_score,
         true AS is_new_today
  FROM profiles pr
  JOIN users u ON u.id = pr.id
  WHERE pr.is_active = true
    AND pr.id <> p_user_id
    AND pr.gender <> v_my_gender
    AND u.created_at > NOW() - INTERVAL '24 hours'
  ORDER BY u.created_at DESC
  LIMIT p_limit OFFSET p_offset;
END;
$$ LANGUAGE plpgsql;

-- 3. get_recommended_profiles
DROP FUNCTION IF EXISTS public.get_recommended_profiles(UUID, INTEGER, INTEGER) CASCADE;
CREATE OR REPLACE FUNCTION public.get_recommended_profiles(
  p_user_id UUID, p_limit INTEGER DEFAULT 20, p_offset INTEGER DEFAULT 0
)
RETURNS TABLE(
  id UUID, profile_id TEXT, display_name TEXT, gender TEXT, date_of_birth DATE,
  height_cm INTEGER, marital_status TEXT, religion TEXT, caste TEXT,
  city TEXT, district TEXT, state TEXT, education TEXT, occupation TEXT,
  annual_income TEXT, food_habit TEXT, about_me TEXT, is_verified BOOLEAN,
  is_premium BOOLEAN, tier TEXT, last_active_at TIMESTAMPTZ,
  profile_completion INTEGER, compatibility_score INTEGER,
  is_new_today BOOLEAN
)
SECURITY DEFINER SET search_path = public AS $$
DECLARE
  v_my_gender TEXT;
  v_my_religion TEXT;
  v_my_caste TEXT;
BEGIN
  SELECT gender, religion, caste INTO v_my_gender, v_my_religion, v_my_caste FROM profiles WHERE id = p_user_id;

  RETURN QUERY
  SELECT pr.id, pr.id::TEXT AS profile_id, pr.name AS display_name, pr.gender, pr.date_of_birth,
         pr.height_cm, pr.marital_status, pr.religion, pr.caste,
         pr.city, pr.district, pr.state, pr.education, pr.occupation,
         pr.annual_income, pr.food_habit, pr.about_me, u.is_verified,
         pr.is_premium, pr.tier, pr.last_active_at, pr.profile_completion,
         90 AS compatibility_score,
         (u.created_at > NOW() - INTERVAL '24 hours') AS is_new_today
  FROM profiles pr
  JOIN users u ON u.id = pr.id
  WHERE pr.is_active = true
    AND pr.id <> p_user_id
    AND pr.gender <> v_my_gender
    AND (pr.religion = v_my_religion OR pr.caste = v_my_caste OR pr.is_premium = true)
  ORDER BY pr.is_premium DESC, pr.profile_completion DESC, u.created_at DESC
  LIMIT p_limit OFFSET p_offset;
END;
$$ LANGUAGE plpgsql;

-- 4. get_nearby_profiles
DROP FUNCTION IF EXISTS public.get_nearby_profiles(UUID, INTEGER, INTEGER) CASCADE;
CREATE OR REPLACE FUNCTION public.get_nearby_profiles(
  p_user_id UUID, p_limit INTEGER DEFAULT 20, p_offset INTEGER DEFAULT 0
)
RETURNS TABLE(
  id UUID, profile_id TEXT, display_name TEXT, gender TEXT, date_of_birth DATE,
  height_cm INTEGER, marital_status TEXT, religion TEXT, caste TEXT,
  city TEXT, district TEXT, state TEXT, education TEXT, occupation TEXT,
  annual_income TEXT, food_habit TEXT, about_me TEXT, is_verified BOOLEAN,
  is_premium BOOLEAN, tier TEXT, last_active_at TIMESTAMPTZ,
  profile_completion INTEGER, compatibility_score INTEGER,
  is_new_today BOOLEAN
)
SECURITY DEFINER SET search_path = public AS $$
DECLARE
  v_my_gender TEXT;
  v_my_district TEXT;
  v_my_state TEXT;
BEGIN
  SELECT gender, district, state INTO v_my_gender, v_my_district, v_my_state FROM profiles WHERE id = p_user_id;

  RETURN QUERY
  SELECT pr.id, pr.id::TEXT AS profile_id, pr.name AS display_name, pr.gender, pr.date_of_birth,
         pr.height_cm, pr.marital_status, pr.religion, pr.caste,
         pr.city, pr.district, pr.state, pr.education, pr.occupation,
         pr.annual_income, pr.food_habit, pr.about_me, u.is_verified,
         pr.is_premium, pr.tier, pr.last_active_at, pr.profile_completion,
         85 AS compatibility_score,
         (u.created_at > NOW() - INTERVAL '24 hours') AS is_new_today
  FROM profiles pr
  JOIN users u ON u.id = pr.id
  WHERE pr.is_active = true
    AND pr.id <> p_user_id
    AND pr.gender <> v_my_gender
    AND (pr.district = v_my_district OR pr.state = v_my_state)
  ORDER BY u.created_at DESC
  LIMIT p_limit OFFSET p_offset;
END;
$$ LANGUAGE plpgsql;

-- Grant permissions
GRANT EXECUTE ON FUNCTION public.get_all_matches(UUID, INTEGER, INTEGER) TO authenticated, anon, service_role;
GRANT EXECUTE ON FUNCTION public.get_daily_updates(UUID, INTEGER, INTEGER) TO authenticated, anon, service_role;
GRANT EXECUTE ON FUNCTION public.get_recommended_profiles(UUID, INTEGER, INTEGER) TO authenticated, anon, service_role;
GRANT EXECUTE ON FUNCTION public.get_nearby_profiles(UUID, INTEGER, INTEGER) TO authenticated, anon, service_role;

-- Reload Schema
NOTIFY pgrst, 'reload schema';
