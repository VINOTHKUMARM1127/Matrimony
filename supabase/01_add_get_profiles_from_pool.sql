CREATE OR REPLACE FUNCTION public.get_profiles_from_pool(
  p_user_id uuid,
  p_section  text DEFAULT 'all_matches',
  p_limit    integer DEFAULT 20,
  p_offset   integer DEFAULT 0
)
RETURNS TABLE(
  id uuid, display_name text, gender text,
  date_of_birth date, height_cm integer,
  marital_status text, religion text, caste text,
  city text, district text, state text,
  education text, occupation text,
  annual_income text, food_habit text,
  about_me text, is_verified boolean,
  is_premium boolean, tier text,
  last_active_at timestamptz,
  profile_completion integer,
  compatibility_score integer,
  priority_score float8,
  is_new_today boolean, is_seen boolean
)
LANGUAGE plpgsql SECURITY DEFINER
SET search_path TO 'public' AS $$
BEGIN
  RETURN QUERY
  SELECT pr.id, pr.name, pr.gender, pr.date_of_birth,
         pr.height_cm, pr.marital_status, pr.religion,
         pr.caste, pr.city, pr.district, pr.state,
         pr.education, pr.occupation, pr.annual_income,
         pr.food_habit, pr.about_me, u.is_verified,
         pr.is_premium, pr.tier, pr.last_active_at,
         pr.profile_completion,
         pool.compatibility_score,
         pool.priority_score,
         -- is_new_today = profile was created/updated in last 24h
         (pool.priority_score > EXTRACT(EPOCH FROM NOW() - INTERVAL '24h'))
           AS is_new_today,
         pool.is_seen
  FROM user_profile_pool pool
  JOIN profiles pr ON pr.id = pool.profile_id
  JOIN users u ON u.id = pr.id
  WHERE pool.user_id = p_user_id
    AND pool.section = p_section
    AND pr.is_active = true
  ORDER BY pool.priority_score DESC,  -- newest profiles first
           pool.compatibility_score DESC
  LIMIT p_limit OFFSET p_offset;
END; $$;
