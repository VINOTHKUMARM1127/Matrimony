-- Restore matching logic that respects the Admin Panel distribution configurations
-- Run this in your Supabase SQL Editor to fix the Matches screen

-- 1. Restore get_all_matches
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
BEGIN
  RETURN QUERY
  SELECT pr.id, pr.id::TEXT AS profile_id, pr.name AS display_name, pr.gender, pr.date_of_birth,
         pr.height_cm, pr.marital_status, pr.religion, pr.caste,
         pr.city, pr.district, pr.state, pr.education, pr.occupation,
         pr.annual_income, pr.food_habit, pr.about_me, u.is_verified,
         pr.is_premium, pr.tier, pr.last_active_at, pr.profile_completion,
         pool.compatibility_score,
         (pool.added_at > NOW() - INTERVAL '24 hours') AS is_new_today
  FROM user_profile_pool pool
  JOIN profiles pr ON pr.id = pool.profile_id
  JOIN users u ON u.id = pr.id
  WHERE pool.user_id = p_user_id AND pool.section = 'all_matches' AND pr.is_active = true
  ORDER BY pool.compatibility_score DESC, pool.added_at DESC
  LIMIT p_limit OFFSET p_offset;
END;
$$ LANGUAGE plpgsql;

-- 2. Restore get_daily_updates
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
BEGIN
  RETURN QUERY
  SELECT pr.id, pr.id::TEXT AS profile_id, pr.name AS display_name, pr.gender, pr.date_of_birth,
         pr.height_cm, pr.marital_status, pr.religion, pr.caste,
         pr.city, pr.district, pr.state, pr.education, pr.occupation,
         pr.annual_income, pr.food_habit, pr.about_me, u.is_verified,
         pr.is_premium, pr.tier, pr.last_active_at, pr.profile_completion,
         pool.compatibility_score,
         (pool.added_at > NOW() - INTERVAL '24 hours') AS is_new_today
  FROM user_profile_pool pool
  JOIN profiles pr ON pr.id = pool.profile_id
  JOIN users u ON u.id = pr.id
  WHERE pool.user_id = p_user_id AND pool.section = 'daily_updates' AND pr.is_active = true
  ORDER BY pool.added_at DESC, pool.compatibility_score DESC
  LIMIT p_limit OFFSET p_offset;
END;
$$ LANGUAGE plpgsql;

-- Grant permissions and reload schema
GRANT EXECUTE ON FUNCTION public.get_all_matches(UUID, INTEGER, INTEGER) TO authenticated, anon, service_role;
GRANT EXECUTE ON FUNCTION public.get_daily_updates(UUID, INTEGER, INTEGER) TO authenticated, anon, service_role;
NOTIFY pgrst, 'reload schema';
