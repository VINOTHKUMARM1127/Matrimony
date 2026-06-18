-- ============================================================================
-- WEDRING — FEED DEDUP HOTFIX (Recommended + Nearby behave like Daily)
-- ----------------------------------------------------------------------------
-- Scope:  REPLACES the bodies of get_recommended_profiles + get_nearby_profiles.
--         Adds ONE helper (feed_allocation). Reuses the EXISTING
--         user_profile_views table. Creates NO new tables and NO new columns.
--
-- What it changes (and ONLY this):
--   * Already-shown Recommended/Nearby profiles keep a STABLE slot and never
--     reshuffle or reappear day-to-day.
--   * When the per-user cap grows (daily cron / purchase / admin boost), the
--     NEW profiles are appended at the end and flagged is_new_today = true.
--   * v3 ranking, scoring, filtering and the 23 existing output columns are
--     preserved verbatim; one extra column (is_new_today BOOLEAN) is appended.
--
-- Idempotent: safe to run more than once. Rollback section at the bottom.
-- Apply in the Supabase SQL editor. Verify with verify_feed_dedup.mjs after.
-- ============================================================================

-- ----------------------------------------------------------------------------
-- HELPER: feed_allocation
-- Maintains a per-(user,section) STABLE ORDERED allocation list in
-- user_profile_views.profile_ids, topped up to p_limit from the supplied ranked
-- candidate array. Returns the ordered list + which ids were added today.
-- ----------------------------------------------------------------------------
CREATE OR REPLACE FUNCTION public.feed_allocation(
  p_user_id UUID, p_section TEXT, p_limit INTEGER, p_ranked UUID[]
) RETURNS TABLE(pid UUID, is_new_today BOOLEAN)
SECURITY DEFINER SET search_path = public AS $$
DECLARE
  v_existing UUID[];
  v_today    UUID[];
  v_date     DATE;
  v_kept     UUID[];
  v_append   UUID[];
  v_final    UUID[];
  v_newtoday UUID[];
BEGIN
  p_limit  := GREATEST(0, COALESCE(p_limit, 0));
  p_ranked := COALESCE(p_ranked, ARRAY[]::UUID[]);

  SELECT profile_ids, todays_ids, todays_date
    INTO v_existing, v_today, v_date
    FROM user_profile_views
   WHERE user_id = p_user_id AND section = p_section;
  v_existing := COALESCE(v_existing, ARRAY[]::UUID[]);

  -- Keep previously-allocated ids in their stable order, but only those that are
  -- still valid candidates (drops profiles now blocked / inactive / excluded).
  v_kept := ARRAY(
    SELECT e FROM unnest(v_existing) WITH ORDINALITY AS x(e, ord)
    WHERE e = ANY(p_ranked)
    ORDER BY x.ord
  );

  -- Cap only grows in normal operation; clamp defensively if it ever shrinks.
  IF COALESCE(array_length(v_kept, 1), 0) > p_limit THEN
    v_kept := ARRAY(
      SELECT e FROM unnest(v_kept) WITH ORDINALITY AS x(e, ord)
      WHERE x.ord <= p_limit ORDER BY x.ord
    );
  END IF;

  -- Append fresh ranked candidates (not already kept) until we reach the cap,
  -- preserving the ranked order in which they arrived.
  v_append := ARRAY(
    SELECT r FROM unnest(p_ranked) WITH ORDINALITY AS y(r, ord)
    WHERE r <> ALL(v_kept)
    ORDER BY y.ord
    LIMIT GREATEST(0, p_limit - COALESCE(array_length(v_kept, 1), 0))
  );
  v_append := COALESCE(v_append, ARRAY[]::UUID[]);

  v_final := v_kept || v_append;

  -- "New today" accumulates within the same calendar day, resets on a new day.
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
-- ----------------------------------------------------------------------------
-- get_recommended_profiles — v3 scoring/filters preserved verbatim, wrapped with
-- feed_allocation for stable, dedup'd, append-only allocation. Adds is_new_today.
-- ----------------------------------------------------------------------------
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
  ORDER BY alloc.ord            -- stable allocation order, NOT live re-ranking
  LIMIT p_limit OFFSET p_offset;
END;
$$ LANGUAGE plpgsql;

-- ----------------------------------------------------------------------------
-- get_nearby_profiles — v3 scoring/filters preserved verbatim, wrapped with
-- feed_allocation for stable, dedup'd, append-only allocation. Adds is_new_today.
-- ----------------------------------------------------------------------------
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

GRANT EXECUTE ON FUNCTION public.feed_allocation(UUID, TEXT, INTEGER, UUID[]) TO authenticated, anon, service_role;
GRANT EXECUTE ON FUNCTION public.get_recommended_profiles(UUID, INTEGER, INTEGER) TO authenticated, anon, service_role;
GRANT EXECUTE ON FUNCTION public.get_nearby_profiles(UUID, INTEGER, INTEGER) TO authenticated, anon, service_role;
NOTIFY pgrst, 'reload schema';

-- ============================================================================
-- ROLLBACK (paste separately to revert to the pre-hotfix v3 feeds)
-- ----------------------------------------------------------------------------
-- This restores the original v3 bodies (live re-ranking, no freeze, no
-- is_new_today column). Run ONLY if you need to undo the hotfix.
-- ============================================================================
/*
DROP FUNCTION IF EXISTS public.get_recommended_profiles(UUID, INTEGER, INTEGER);
DROP FUNCTION IF EXISTS public.get_nearby_profiles(UUID, INTEGER, INTEGER);
DROP FUNCTION IF EXISTS public.feed_allocation(UUID, TEXT, INTEGER, UUID[]);
-- Then re-apply the get_recommended_profiles / get_nearby_profiles blocks from
-- supabase/migration_distribution_v3.sql (sections 8a and 8b).
*/

