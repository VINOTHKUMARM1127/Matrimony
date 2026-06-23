-- 8a. Recommended
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
  profile_completion INTEGER, compatibility_score INTEGER,
  is_new_today BOOLEAN
)
SECURITY DEFINER SET search_path = public AS $$
DECLARE
  v RECORD; p RECORD; v_tier TEXT; v_limit INTEGER; v_ranked UUID[];
BEGIN
  SELECT me.gender, me.religion, me.caste, me.state, me.district, me.tier, me.date_of_birth
    INTO v FROM profiles me WHERE me.id = p_user_id;
  v_tier := COALESCE(v.tier, 'free');

  SELECT pd.initial_all_matches INTO v_limit
    FROM profile_distribution pd WHERE pd.tier = v_tier;
  v_limit := COALESCE(v_limit, 5);

  SELECT * INTO p FROM partner_preferences WHERE user_id = p_user_id;

  v_ranked := ARRAY(
    SELECT pr.id FROM profiles pr
    JOIN users u ON u.id = pr.id
    WHERE pr.is_active = true
      AND pr.id <> p_user_id
      AND pr.gender <> v.gender
      AND NOT public._feed_excluded(p_user_id, pr.id)
      AND (p.pref_age_min IS NULL OR pr.date_of_birth <= (CURRENT_DATE - (p.pref_age_min || ' years')::INTERVAL))
      AND (p.pref_age_max IS NULL OR pr.date_of_birth >= (CURRENT_DATE - ((p.pref_age_max + 1) || ' years')::INTERVAL))
      AND (p.pref_religion       IS NULL OR array_length(p.pref_religion,1)       IS NULL OR pr.religion       = ANY(p.pref_religion))
      AND (p.pref_caste          IS NULL OR array_length(p.pref_caste,1)          IS NULL OR pr.caste          = ANY(p.pref_caste) OR 'Caste No Bar' = ANY(p.pref_caste))
      AND (p.pref_education      IS NULL OR array_length(p.pref_education,1)      IS NULL OR pr.education      = ANY(p.pref_education))
      AND (p.pref_occupation     IS NULL OR array_length(p.pref_occupation,1)     IS NULL OR pr.occupation     = ANY(p.pref_occupation))
      AND (p.pref_marital_status IS NULL OR array_length(p.pref_marital_status,1) IS NULL OR pr.marital_status = ANY(p.pref_marital_status))
      AND (p.pref_location       IS NULL OR array_length(p.pref_location,1)       IS NULL OR pr.district       = ANY(p.pref_location) OR pr.state = ANY(p.pref_location))
    ORDER BY (
      (CASE WHEN pr.religion = v.religion THEN 20 ELSE 0 END) +
      (CASE WHEN pr.caste    = v.caste    THEN 15 ELSE 0 END) +
      (CASE WHEN pr.district = v.district THEN 15 ELSE 0 END) +
      (CASE WHEN pr.state    = v.state    THEN 10 ELSE 0 END) +
      (CASE WHEN u.is_verified THEN 10 ELSE 0 END) +
      (CASE WHEN pr.is_premium  THEN 5  ELSE 0 END) +
      COALESCE(pr.profile_completion / 5, 0) +
      (CASE WHEN pr.last_active_at > NOW() - INTERVAL '7 days' THEN 10 ELSE 0 END)
    ) DESC, pr.last_active_at DESC NULLS LAST
  );

  RETURN QUERY
  WITH alloc AS (
    SELECT a.pid, a.is_new_today, a.ord
    FROM public.feed_allocation(p_user_id, 'recommended', v_limit, v_ranked)
         WITH ORDINALITY AS a(pid, is_new_today, ord)
  )
  SELECT pr.id, pr.id::TEXT AS profile_id, pr.name AS display_name, pr.gender, pr.date_of_birth,
         pr.height_cm, pr.marital_status, pr.religion, pr.caste,
         pr.city, pr.district, pr.state, pr.education, pr.occupation,
         pr.annual_income, pr.food_habit, pr.about_me, u.is_verified,
         pr.is_premium, pr.tier, pr.last_active_at, pr.profile_completion,
         (
           (CASE WHEN pr.religion = v.religion THEN 20 ELSE 0 END) +
           (CASE WHEN pr.caste    = v.caste    THEN 15 ELSE 0 END) +
           (CASE WHEN pr.district = v.district THEN 15 ELSE 0 END) +
           (CASE WHEN pr.state    = v.state    THEN 10 ELSE 0 END) +
           (CASE WHEN u.is_verified THEN 10 ELSE 0 END) +
           (CASE WHEN pr.is_premium  THEN 5  ELSE 0 END) +
           COALESCE(pr.profile_completion / 5, 0) +
           (CASE WHEN pr.last_active_at > NOW() - INTERVAL '7 days' THEN 10 ELSE 0 END)
         )::INTEGER AS compatibility_score,
         alloc.is_new_today
  FROM alloc
  JOIN profiles pr ON pr.id = alloc.pid
  JOIN users u ON u.id = pr.id
  ORDER BY alloc.ord
  LIMIT p_limit OFFSET p_offset;
END;
$$ LANGUAGE plpgsql;

-- 8b. Nearby
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
  profile_completion INTEGER, compatibility_score INTEGER,
  is_new_today BOOLEAN
)
SECURITY DEFINER SET search_path = public AS $$
DECLARE
  v RECORD; v_tier TEXT; v_limit INTEGER; v_ranked UUID[];
BEGIN
  SELECT me.gender, me.district, me.state, me.tier INTO v FROM profiles me WHERE me.id = p_user_id;
  v_tier := COALESCE(v.tier, 'free');

  SELECT pd.initial_new_profiles INTO v_limit
    FROM profile_distribution pd WHERE pd.tier = v_tier;
  v_limit := COALESCE(v_limit, 5);

  v_ranked := ARRAY(
    SELECT pr.id FROM profiles pr
    JOIN users u ON u.id = pr.id
    WHERE pr.is_active = true
      AND pr.id <> p_user_id
      AND pr.gender <> v.gender
      AND NOT public._feed_excluded(p_user_id, pr.id)
      AND (pr.district = v.district OR pr.state = v.state)
    ORDER BY (
      (CASE WHEN pr.district = v.district THEN 40 ELSE 0 END) +
      (CASE WHEN pr.state = v.state THEN 20 ELSE 0 END) +
      (CASE WHEN u.is_verified THEN 10 ELSE 0 END) +
      (CASE WHEN pr.is_premium THEN 5 ELSE 0 END) +
      COALESCE(pr.profile_completion / 5, 0) +
      (CASE WHEN pr.last_active_at > NOW() - INTERVAL '7 days' THEN 10 ELSE 0 END)
    ) DESC, pr.last_active_at DESC NULLS LAST
  );

  RETURN QUERY
  WITH alloc AS (
    SELECT a.pid, a.is_new_today, a.ord
    FROM public.feed_allocation(p_user_id, 'nearby', v_limit, v_ranked)
         WITH ORDINALITY AS a(pid, is_new_today, ord)
  )
  SELECT pr.id, pr.id::TEXT AS profile_id, pr.name AS display_name, pr.gender, pr.date_of_birth,
         pr.height_cm, pr.marital_status, pr.religion, pr.caste,
         pr.city, pr.district, pr.state, pr.education, pr.occupation,
         pr.annual_income, pr.food_habit, pr.about_me, u.is_verified,
         pr.is_premium, pr.tier, pr.last_active_at, pr.profile_completion,
         (
           (CASE WHEN pr.district = v.district THEN 40 ELSE 0 END) +
           (CASE WHEN pr.state = v.state THEN 20 ELSE 0 END) +
           (CASE WHEN u.is_verified THEN 10 ELSE 0 END) +
           (CASE WHEN pr.is_premium THEN 5 ELSE 0 END) +
           COALESCE(pr.profile_completion / 5, 0) +
           (CASE WHEN pr.last_active_at > NOW() - INTERVAL '7 days' THEN 10 ELSE 0 END)
         )::INTEGER AS compatibility_score,
         alloc.is_new_today
  FROM alloc
  JOIN profiles pr ON pr.id = alloc.pid
  JOIN users u ON u.id = pr.id
  ORDER BY alloc.ord
  LIMIT p_limit OFFSET p_offset;
END;
$$ LANGUAGE plpgsql;

-- 8c. Daily
DROP FUNCTION IF EXISTS public.get_daily_matches(UUID, INTEGER, INTEGER);
CREATE FUNCTION public.get_daily_matches(
  p_user_id UUID, p_limit INTEGER DEFAULT 10, p_offset INTEGER DEFAULT 0
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
  v RECORD; v_tier TEXT; v_limit INTEGER; v_ranked UUID[];
BEGIN
  SELECT me.gender, me.tier INTO v FROM profiles me WHERE me.id = p_user_id;
  v_tier := COALESCE(v.tier, 'free');

  SELECT pd.daily_all_matches INTO v_limit
    FROM profile_distribution pd WHERE pd.tier = v_tier;
  v_limit := COALESCE(v_limit, 5);

  v_ranked := ARRAY(
    SELECT pr.id FROM profiles pr
    JOIN users u ON u.id = pr.id
    WHERE pr.is_active = true
      AND pr.id <> p_user_id
      AND pr.gender <> v.gender
      AND NOT public._feed_excluded(p_user_id, pr.id)
    ORDER BY (
      (CASE WHEN u.is_verified THEN 20 ELSE 0 END) +
      (CASE WHEN pr.is_premium THEN 10 ELSE 0 END) +
      COALESCE(pr.profile_completion / 5, 0) +
      (CASE WHEN pr.last_active_at > NOW() - INTERVAL '3 days' THEN 25 ELSE 0 END)
    ) DESC, pr.created_at DESC NULLS LAST, pr.last_active_at DESC NULLS LAST
  );

  RETURN QUERY
  WITH alloc AS (
    SELECT a.pid, a.is_new_today, a.ord
    FROM public.feed_allocation(p_user_id, 'daily', v_limit, v_ranked)
         WITH ORDINALITY AS a(pid, is_new_today, ord)
  )
  SELECT pr.id, pr.id::TEXT AS profile_id, pr.name AS display_name, pr.gender, pr.date_of_birth,
         pr.height_cm, pr.marital_status, pr.religion, pr.caste,
         pr.city, pr.district, pr.state, pr.education, pr.occupation,
         pr.annual_income, pr.food_habit, pr.about_me, u.is_verified,
         pr.is_premium, pr.tier, pr.last_active_at, pr.profile_completion,
         (
           (CASE WHEN u.is_verified THEN 20 ELSE 0 END) +
           (CASE WHEN pr.is_premium THEN 10 ELSE 0 END) +
           COALESCE(pr.profile_completion / 5, 0) +
           (CASE WHEN pr.last_active_at > NOW() - INTERVAL '3 days' THEN 25 ELSE 0 END)
         )::INTEGER AS compatibility_score,
         alloc.is_new_today
  FROM alloc
  JOIN profiles pr ON pr.id = alloc.pid
  JOIN users u ON u.id = pr.id
  ORDER BY alloc.ord
  LIMIT p_limit OFFSET p_offset;
END;
$$ LANGUAGE plpgsql;

GRANT EXECUTE ON FUNCTION public.get_recommended_profiles(UUID, INTEGER, INTEGER) TO authenticated, anon, service_role;
GRANT EXECUTE ON FUNCTION public.get_nearby_profiles(UUID, INTEGER, INTEGER) TO authenticated, anon, service_role;
GRANT EXECUTE ON FUNCTION public.get_daily_matches(UUID, INTEGER, INTEGER) TO authenticated, anon, service_role;

-- Fix subscriptions table not existing by restoring the proper unified purchase_subscription RPC
DROP FUNCTION IF EXISTS public.purchase_subscription(UUID, TEXT, TEXT, INTEGER);
CREATE OR REPLACE FUNCTION public.purchase_subscription(p_user_id uuid, p_plan_type text, p_payment_id text, p_amount integer)
RETURNS boolean
LANGUAGE plpgsql
SECURITY DEFINER
AS $$
DECLARE
  v_plan_id uuid;
  v_credits integer;
  v_days integer;
BEGIN
  SELECT id, contact_credits, validity_days INTO v_plan_id, v_credits, v_days
  FROM membership_plans WHERE name = p_plan_type;
  
  IF v_plan_id IS NULL THEN RETURN false; END IF;

  INSERT INTO user_memberships (user_id, plan_id, tier, expiry_date, contact_credits_remaining)
  VALUES (p_user_id, v_plan_id, p_plan_type, now() + (v_days || ' days')::interval, v_credits);

  UPDATE profiles SET tier = p_plan_type, is_premium = true,
         contacts_remaining = COALESCE(contacts_remaining, 0) + v_credits
  WHERE id = p_user_id;

  INSERT INTO purchase_history (user_id, plan_id, amount, razorpay_payment_id, payment_status, tier)
  VALUES (p_user_id, v_plan_id, p_amount, p_payment_id, 'completed', p_plan_type);

  RETURN true;
END;
$$;

GRANT EXECUTE ON FUNCTION public.purchase_subscription(UUID, TEXT, TEXT, INTEGER) TO authenticated, anon, service_role;

NOTIFY pgrst, 'reload schema';
