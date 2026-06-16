-- =============================================================================
-- PATCH 01 — Fix ambiguous column references (gender + tier) in feed RPCs.
-- Cause: bare column names in the feed functions collided with the identically
-- named RETURNS TABLE OUT columns. Fix: alias the source tables in every
-- SELECT ... INTO and tier_settings lookup (me. for profiles, ts. for
-- tier_settings). Covers get_recommended_profiles, get_nearby_profiles,
-- get_daily_matches. Idempotent; safe to run after 00_authoritative_schema.sql.
-- =============================================================================


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


NOTIFY pgrst, 'reload schema';
