-- ============================================================================
-- WEDRING — DAILY FEED SOURCE-OF-TRUTH FIX  (run ALONE in SQL editor)
-- ----------------------------------------------------------------------------
-- THE BUG: get_recommended_profiles + get_nearby_profiles were upgraded to read
-- the per-user cap from user_distribution_state (seeded from subscription_plans),
-- but get_daily_matches was left on the OLD body that reads tier_settings — a
-- DIFFERENT, conflicting config table. After a free->premium upgrade the daily
-- feed therefore showed the wrong (often free) count while recommended/nearby
-- showed the correct premium counts.
--
-- THE FIX: replace get_daily_matches with the SAME stable-allocation pattern the
-- other two feeds use — read daily_profiles_shown from user_distribution_state,
-- allocate via feed_allocation(), expose is_new_today. tier_settings is no longer
-- in any feed's read path: subscription_plans -> user_distribution_state is the
-- single source of truth for all three feeds.
--
-- Idempotent. Prereq: feed_allocation() already deployed (it is — recommended/
-- nearby use it live). Self-verify block at the bottom RAISES on failure.
-- ============================================================================

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
  profile_completion_percent INTEGER, compatibility_score INTEGER,
  is_new_today BOOLEAN
)
SECURITY DEFINER SET search_path = public AS $$
DECLARE
  v RECORD; v_tier TEXT; v_limit INTEGER; v_ranked UUID[];
BEGIN
  SELECT me.gender, me.tier INTO v FROM profiles me WHERE me.id = p_user_id;
  v_tier := COALESCE(v.tier, 'free');

  -- Single source of truth: per-user cap from user_distribution_state, with a
  -- subscription_plans fallback. (No tier_settings — that competing table is
  -- intentionally NOT read here anymore.)
  SELECT daily_profiles_shown INTO v_limit
    FROM user_distribution_state WHERE user_id = p_user_id;
  IF v_limit IS NULL THEN
    SELECT sp.initial_daily_profiles INTO v_limit FROM subscription_plans sp WHERE sp.tier = v_tier;
  END IF;
  v_limit := COALESCE(v_limit, 5);

  -- Ranked daily candidates: freshest + most-compatible first.
  v_ranked := ARRAY(
    SELECT pr.id FROM profiles pr
    WHERE pr.is_active = true
      AND pr.id <> p_user_id
      AND pr.gender <> v.gender
      AND NOT public._feed_excluded(p_user_id, pr.id)
    ORDER BY (
      (CASE WHEN pr.is_verified THEN 20 ELSE 0 END) +
      (CASE WHEN pr.is_premium THEN 10 ELSE 0 END) +
      COALESCE(pr.profile_completion_percent / 5, 0) +
      (CASE WHEN pr.last_active_at > NOW() - INTERVAL '3 days' THEN 25 ELSE 0 END)
    ) DESC, pr.created_at DESC NULLS LAST, pr.last_active_at DESC NULLS LAST
  );

  -- Stable allocation (kept ids hold their slot; newly distributed append + flag).
  RETURN QUERY
  WITH alloc AS (
    SELECT a.pid, a.is_new_today, a.ord
    FROM public.feed_allocation(p_user_id, 'daily', v_limit, v_ranked)
         WITH ORDINALITY AS a(pid, is_new_today, ord)
  )
  SELECT pr.id, pr.profile_id, pr.display_name, pr.gender, pr.date_of_birth,
         pr.height_cm, pr.marital_status, pr.religion, pr.caste,
         pr.city, pr.district, pr.state, pr.education, pr.occupation,
         pr.annual_income, pr.food_habit, pr.about_me, pr.is_verified,
         pr.is_premium, pr.tier, pr.last_active_at, pr.profile_completion_percent,
         (
           (CASE WHEN pr.is_verified THEN 20 ELSE 0 END) +
           (CASE WHEN pr.is_premium THEN 10 ELSE 0 END) +
           COALESCE(pr.profile_completion_percent / 5, 0) +
           (CASE WHEN pr.last_active_at > NOW() - INTERVAL '3 days' THEN 25 ELSE 0 END)
         )::INTEGER AS compatibility_score,
         alloc.is_new_today
  FROM alloc
  JOIN profiles pr ON pr.id = alloc.pid
  ORDER BY alloc.ord
  LIMIT p_limit OFFSET p_offset;
END;
$$ LANGUAGE plpgsql;

GRANT EXECUTE ON FUNCTION public.get_daily_matches(UUID, INTEGER, INTEGER) TO authenticated, anon, service_role;
NOTIFY pgrst, 'reload schema';

-- ----------------------------------------------------------------------------
-- SELF-VERIFY: daily must now expose is_new_today (proves the new body is live).
-- ----------------------------------------------------------------------------
DO $verify$
BEGIN
  IF NOT EXISTS (
    SELECT 1 FROM pg_proc p JOIN pg_namespace n ON n.oid = p.pronamespace
    WHERE n.nspname='public' AND p.proname='get_daily_matches'
      AND pg_get_function_result(p.oid) LIKE '%is_new_today%'
  ) THEN
    RAISE EXCEPTION 'PATCH FAILED: get_daily_matches did not update (no is_new_today column).';
  END IF;
  IF EXISTS (
    SELECT 1 FROM pg_proc p JOIN pg_namespace n ON n.oid = p.pronamespace
    WHERE n.nspname='public' AND p.proname='get_daily_matches'
      AND pg_get_functiondef(p.oid) ~* 'tier_settings'
  ) THEN
    RAISE EXCEPTION 'PATCH FAILED: get_daily_matches still references tier_settings.';
  END IF;
  RAISE NOTICE 'PATCH OK: get_daily_matches reads user_distribution_state; tier_settings removed from daily path.';
END
$verify$;
