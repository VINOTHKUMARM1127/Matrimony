-- ============================================================================
-- WEDRING — MINIMAL TIER-AMBIGUITY PATCH (standalone, self-verifying)
-- ----------------------------------------------------------------------------
-- Run this ALONE in the Supabase SQL editor. Nothing precedes the two function
-- replacements, so no earlier statement can abort the batch before they apply.
--
-- No DROP: the live functions already return is_new_today, so the return type
-- is identical and CREATE OR REPLACE swaps the body in place.
--
-- Only change vs. what is live: the plan-fallback lookup is qualified with the
-- `sp` alias (sp.tier) so `tier` can no longer bind to the RETURNS TABLE output
-- column. All ranking, filters, feed_allocation, is_new_today, pagination and
-- return columns are preserved verbatim.
--
-- The DO block at the very bottom RAISES if the ambiguous text still exists,
-- so a silent "no-op re-run" becomes a visible failure.
-- ============================================================================

CREATE OR REPLACE FUNCTION public.get_recommended_profiles(
  p_user_id UUID, p_limit INTEGER DEFAULT 20, p_offset INTEGER DEFAULT 0
)
RETURNS TABLE(
  id UUID, profile_id TEXT, display_name TEXT, gender TEXT, date_of_birth DATE,
  height_cm INTEGER, marital_status TEXT, religion TEXT, caste TEXT,
  city TEXT, district TEXT, state TEXT, education TEXT, occupation TEXT,
  annual_income TEXT, food_habit TEXT, about_me TEXT, is_verified BOOLEAN,
  is_premium BOOLEAN, tier TEXT, last_active_at TIMESTAMPTZ,
  profile_completion_percent INTEGER, compatibility_score INTEGER,
  is_new_today BOOLEAN
)
SECURITY DEFINER SET search_path = public AS $$
DECLARE
  v RECORD; p RECORD; v_tier TEXT; v_limit INTEGER; v_ranked UUID[];
BEGIN
  SELECT me.gender, me.religion, me.caste, me.state, me.district, me.tier, me.date_of_birth
    INTO v FROM profiles me WHERE me.id = p_user_id;
  v_tier := COALESCE(v.tier, 'free');

  -- Per-user growing cap (v3 source of truth) with plan fallback.
  SELECT recommended_profiles_shown INTO v_limit
    FROM user_distribution_state WHERE user_id = p_user_id;
  IF v_limit IS NULL THEN
    SELECT sp.initial_recommended_profiles INTO v_limit FROM subscription_plans sp WHERE sp.tier = v_tier;
  END IF;
  v_limit := COALESCE(v_limit, 5);

  SELECT * INTO p FROM partner_preferences WHERE user_id = p_user_id;

  -- Full ranked candidate id list (v3 filters + scoring, unchanged).
  v_ranked := ARRAY(
    SELECT pr.id FROM profiles pr
    WHERE pr.is_active = true
      AND pr.id <> p_user_id
      AND pr.gender <> v.gender
      AND NOT public._feed_excluded(p_user_id, pr.id)
      AND (p.age_min IS NULL OR pr.date_of_birth <= (CURRENT_DATE - (p.age_min || ' years')::INTERVAL))
      AND (p.age_max IS NULL OR pr.date_of_birth >= (CURRENT_DATE - ((p.age_max + 1) || ' years')::INTERVAL))
      AND (p.religion       IS NULL OR array_length(p.religion,1)       IS NULL OR pr.religion       = ANY(p.religion))
      AND (p.caste          IS NULL OR array_length(p.caste,1)          IS NULL OR pr.caste          = ANY(p.caste) OR 'Caste No Bar' = ANY(p.caste))
      AND (p.education      IS NULL OR array_length(p.education,1)      IS NULL OR pr.education      = ANY(p.education))
      AND (p.occupation     IS NULL OR array_length(p.occupation,1)     IS NULL OR pr.occupation     = ANY(p.occupation))
      AND (p.marital_status IS NULL OR array_length(p.marital_status,1) IS NULL OR pr.marital_status = ANY(p.marital_status))
      AND (p.districts      IS NULL OR array_length(p.districts,1)      IS NULL OR pr.district       = ANY(p.districts))
      AND (p.states         IS NULL OR array_length(p.states,1)         IS NULL OR pr.state          = ANY(p.states))
    ORDER BY (
      (CASE WHEN pr.religion = v.religion THEN 20 ELSE 0 END) +
      (CASE WHEN pr.caste    = v.caste    THEN 15 ELSE 0 END) +
      (CASE WHEN pr.district = v.district THEN 15 ELSE 0 END) +
      (CASE WHEN pr.state    = v.state    THEN 10 ELSE 0 END) +
      (CASE WHEN pr.is_verified THEN 10 ELSE 0 END) +
      (CASE WHEN pr.is_premium  THEN 5  ELSE 0 END) +
      COALESCE(pr.profile_completion_percent / 5, 0) +
      (CASE WHEN pr.last_active_at > NOW() - INTERVAL '7 days' THEN 10 ELSE 0 END)
    ) DESC, pr.last_active_at DESC NULLS LAST
  );

  -- Stable allocation: kept ids hold their slot, new ranked ids append at the end.
  RETURN QUERY
  WITH alloc AS (
    SELECT a.pid, a.is_new_today, a.ord
    FROM public.feed_allocation(p_user_id, 'recommended', v_limit, v_ranked)
         WITH ORDINALITY AS a(pid, is_new_today, ord)
  )
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
         )::INTEGER AS compatibility_score,
         alloc.is_new_today
  FROM alloc
  JOIN profiles pr ON pr.id = alloc.pid
  ORDER BY alloc.ord
  LIMIT p_limit OFFSET p_offset;
END;
$$ LANGUAGE plpgsql;
CREATE OR REPLACE FUNCTION public.get_nearby_profiles(
  p_user_id UUID, p_limit INTEGER DEFAULT 20, p_offset INTEGER DEFAULT 0
)
RETURNS TABLE(
  id UUID, profile_id TEXT, display_name TEXT, gender TEXT, date_of_birth DATE,
  height_cm INTEGER, marital_status TEXT, religion TEXT, caste TEXT,
  city TEXT, district TEXT, state TEXT, education TEXT, occupation TEXT,
  annual_income TEXT, food_habit TEXT, about_me TEXT, is_verified BOOLEAN,
  is_premium BOOLEAN, tier TEXT, last_active_at TIMESTAMPTZ,
  profile_completion_percent INTEGER, compatibility_score INTEGER,
  is_new_today BOOLEAN
)
SECURITY DEFINER SET search_path = public AS $$
DECLARE
  v RECORD; v_tier TEXT; v_limit INTEGER; v_ranked UUID[];
BEGIN
  SELECT me.gender, me.district, me.state, me.tier INTO v FROM profiles me WHERE me.id = p_user_id;
  v_tier := COALESCE(v.tier, 'free');

  SELECT nearby_profiles_shown INTO v_limit
    FROM user_distribution_state WHERE user_id = p_user_id;
  IF v_limit IS NULL THEN
    SELECT sp.initial_nearby_profiles INTO v_limit FROM subscription_plans sp WHERE sp.tier = v_tier;
  END IF;
  v_limit := COALESCE(v_limit, 5);

  -- Full ranked candidate id list (v3 nearby filters + scoring, unchanged).
  v_ranked := ARRAY(
    SELECT pr.id FROM profiles pr
    WHERE pr.is_active = true
      AND pr.id <> p_user_id
      AND pr.gender <> v.gender
      AND NOT public._feed_excluded(p_user_id, pr.id)
      AND (pr.district = v.district OR pr.state = v.state)
    ORDER BY (
      (CASE WHEN pr.district = v.district THEN 40 ELSE 0 END) +
      (CASE WHEN pr.state = v.state THEN 20 ELSE 0 END) +
      (CASE WHEN pr.is_verified THEN 10 ELSE 0 END) +
      (CASE WHEN pr.is_premium THEN 5 ELSE 0 END) +
      COALESCE(pr.profile_completion_percent / 5, 0) +
      (CASE WHEN pr.last_active_at > NOW() - INTERVAL '7 days' THEN 10 ELSE 0 END)
    ) DESC, pr.last_active_at DESC NULLS LAST
  );

  RETURN QUERY
  WITH alloc AS (
    SELECT a.pid, a.is_new_today, a.ord
    FROM public.feed_allocation(p_user_id, 'nearby', v_limit, v_ranked)
         WITH ORDINALITY AS a(pid, is_new_today, ord)
  )
  SELECT pr.id, pr.profile_id, pr.display_name, pr.gender, pr.date_of_birth,
         pr.height_cm, pr.marital_status, pr.religion, pr.caste,
         pr.city, pr.district, pr.state, pr.education, pr.occupation,
         pr.annual_income, pr.food_habit, pr.about_me, pr.is_verified,
         pr.is_premium, pr.tier, pr.last_active_at, pr.profile_completion_percent,
         (
           (CASE WHEN pr.district = v.district THEN 40 ELSE 0 END) +
           (CASE WHEN pr.state = v.state THEN 20 ELSE 0 END) +
           (CASE WHEN pr.is_verified THEN 10 ELSE 0 END) +
           (CASE WHEN pr.is_premium THEN 5 ELSE 0 END) +
           COALESCE(pr.profile_completion_percent / 5, 0) +
           (CASE WHEN pr.last_active_at > NOW() - INTERVAL '7 days' THEN 10 ELSE 0 END)
         )::INTEGER AS compatibility_score,
         alloc.is_new_today
  FROM alloc
  JOIN profiles pr ON pr.id = alloc.pid
  ORDER BY alloc.ord
  LIMIT p_limit OFFSET p_offset;
END;
$$ LANGUAGE plpgsql;

NOTIFY pgrst, 'reload schema';

-- ============================================================================
-- SELF-VERIFY: raises if the ambiguous bare-`tier` fallback survives in either
-- live body. If this block raises, the CREATE OR REPLACE above did NOT take —
-- check current_database()/search_path and that you ran THIS file alone.
-- ============================================================================
DO $verify$
DECLARE
  v_bad INTEGER;
BEGIN
  SELECT count(*) INTO v_bad
  FROM pg_proc p
  JOIN pg_namespace n ON n.oid = p.pronamespace
  WHERE n.nspname = 'public'
    AND p.proname IN ('get_recommended_profiles','get_nearby_profiles')
    AND pg_get_functiondef(p.oid) ~ 'subscription_plans\s+WHERE\s+tier\s*=';

  IF v_bad > 0 THEN
    RAISE EXCEPTION 'PATCH FAILED: % function(s) still contain unqualified "WHERE tier = v_tier". The replacement did not apply.', v_bad;
  END IF;

  RAISE NOTICE 'PATCH OK: both feed functions use sp.tier; no ambiguous reference remains.';
END
$verify$;
