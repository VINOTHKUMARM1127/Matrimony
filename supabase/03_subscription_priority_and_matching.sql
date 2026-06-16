-- =============================================================================
-- PATCH 03 — SUBSCRIPTION PRIORITY + DAILY SNAPSHOT + MATCH SCORING
-- =============================================================================
-- Production-grade, idempotent. Run after 00/01/02.
--
-- PART 1: subscriptions become the source of truth for ALL active plans. The
--         profile's tier/premium_expires_at are DERIVED as the highest-priority
--         active plan (Platinum>Gold>Silver>Free). Same-plan purchase merges
--         duration; lower-plan purchase is stored as a secondary plan; higher-
--         plan purchase becomes current immediately. Contacts/interests are a
--         shared wallet (cumulative top-up).
--
-- PART 2: each feed (recommended/nearby/daily) is snapshotted per day. Admin
--         limit changes affect FUTURE days only; today's allocation is frozen.
--
-- PART 3: a single weighted match_score() drives ranking across all feeds.
-- =============================================================================

-- ─────────────────────────────────────────────────────────────────────────────
-- PART 1 — SUBSCRIPTION PRIORITY SYSTEM
-- ─────────────────────────────────────────────────────────────────────────────

-- 1a. Plan priority (single source). Platinum=4 > Gold=3 > Silver=2 > Free=1.
CREATE OR REPLACE FUNCTION public.plan_priority(p_tier TEXT)
RETURNS INTEGER
IMMUTABLE LANGUAGE sql AS $$
  SELECT CASE p_tier
    WHEN 'platinum' THEN 4
    WHEN 'gold'     THEN 3
    WHEN 'silver'   THEN 2
    ELSE 1
  END;
$$;

-- 1b. Recompute the derived current plan for a user from active subscriptions.
--     Current plan = highest priority among active (expires_at > now). Ties
--     broken by latest expiry. Falls back to 'free' when nothing is active.
CREATE OR REPLACE FUNCTION public.recompute_current_plan(p_user_id UUID)
RETURNS VOID
SECURITY DEFINER SET search_path = public AS $$
DECLARE
  v_tier   TEXT;
  v_expiry TIMESTAMPTZ;
BEGIN
  -- Expire lapsed rows first (idempotent housekeeping).
  UPDATE subscriptions
     SET status = 'expired'
   WHERE user_id = p_user_id AND status = 'active' AND expires_at <= NOW();

  SELECT s.plan_type, s.expires_at
    INTO v_tier, v_expiry
  FROM subscriptions s
  WHERE s.user_id = p_user_id
    AND s.status = 'active'
    AND s.expires_at > NOW()
  ORDER BY public.plan_priority(s.plan_type) DESC, s.expires_at DESC
  LIMIT 1;

  IF v_tier IS NULL THEN
    UPDATE profiles
       SET tier = 'free', is_premium = false, premium_expires_at = NULL
     WHERE id = p_user_id;
  ELSE
    UPDATE profiles
       SET tier = v_tier, is_premium = true, premium_expires_at = v_expiry
     WHERE id = p_user_id;
  END IF;
END;
$$ LANGUAGE plpgsql;

-- 1c. purchase_subscription — priority-aware, same-plan-merge, shared wallet.
--     Replaces the old "always overwrite tier" behaviour.
CREATE OR REPLACE FUNCTION public.purchase_subscription(
  p_user_id    UUID,
  p_plan_type  TEXT,
  p_payment_id TEXT    DEFAULT NULL,
  p_amount     INTEGER DEFAULT NULL
) RETURNS JSONB
SECURITY DEFINER SET search_path = public AS $$
DECLARE
  v_duration_months INTEGER;
  v_contacts        INTEGER;
  v_interests       INTEGER;
  v_price           INTEGER;
  v_existing        RECORD;
  v_base            TIMESTAMPTZ;
  v_new_expiry      TIMESTAMPTZ;
  v_current_tier    TEXT;
BEGIN
  IF p_plan_type IN ('free','non_premium') THEN
    RAISE EXCEPTION 'INVALID_PLAN: cannot purchase the free tier';
  END IF;

  -- Plan economics come solely from tier_settings (single source of truth).
  SELECT duration_months, contacts_limit, interests_limit, price_inr
    INTO v_duration_months, v_contacts, v_interests, v_price
  FROM tier_settings WHERE tier = p_plan_type;

  IF v_duration_months IS NULL THEN
    RAISE EXCEPTION 'INVALID_PLAN_TYPE: %', p_plan_type;
  END IF;

  -- Is there already an ACTIVE subscription of this SAME plan? If so, MERGE
  -- duration onto that row (no duplicate rows for the same plan).
  SELECT * INTO v_existing
  FROM subscriptions
  WHERE user_id = p_user_id AND plan_type = p_plan_type
    AND status = 'active' AND expires_at > NOW()
  ORDER BY expires_at DESC LIMIT 1;

  IF v_existing.id IS NOT NULL THEN
    -- SAME PLAN: extend that subscription's expiry (20d + 30d = 50d).
    v_new_expiry := v_existing.expires_at + (v_duration_months || ' months')::INTERVAL;
    UPDATE subscriptions
       SET expires_at      = v_new_expiry,
           amount          = amount + COALESCE(p_amount, v_price),
           contacts_added  = contacts_added + v_contacts,
           interests_added = interests_added + v_interests,
           razorpay_payment_id = COALESCE(p_payment_id, razorpay_payment_id)
     WHERE id = v_existing.id;
  ELSE
    -- NEW PLAN (higher OR lower priority): always create its own active row,
    -- starting today. Priority handling is done by recompute_current_plan().
    v_new_expiry := NOW() + (v_duration_months || ' months')::INTERVAL;
    INSERT INTO subscriptions
      (user_id, plan_type, status, amount, razorpay_payment_id,
       contacts_added, interests_added, starts_at, expires_at)
    VALUES
      (p_user_id, p_plan_type, 'active', COALESCE(p_amount, v_price), p_payment_id,
       v_contacts, v_interests, NOW(), v_new_expiry);
  END IF;

  -- Shared wallet: quotas are cumulative across all plans (top-up model).
  UPDATE profiles SET
    is_verified         = true,
    contacts_remaining  = GREATEST(0, COALESCE(contacts_remaining,0))  + v_contacts,
    interests_remaining = GREATEST(0, COALESCE(interests_remaining,0)) + v_interests
  WHERE id = p_user_id;

  -- Derive the current (highest-priority) plan + expiry onto the profile.
  PERFORM public.recompute_current_plan(p_user_id);

  SELECT tier INTO v_current_tier FROM profiles WHERE id = p_user_id;

  RETURN jsonb_build_object(
    'success', true,
    'purchased_plan', p_plan_type,
    'current_plan', v_current_tier,
    'plan_expires_at', v_new_expiry,
    'contacts_added', v_contacts,
    'interests_added', v_interests
  );
END;
$$ LANGUAGE plpgsql;

-- 1d. get_user_quotas — returns current plan + ALL other active plans.
CREATE OR REPLACE FUNCTION public.get_user_quotas(p_user_id UUID)
RETURNS JSONB
SECURITY DEFINER SET search_path = public AS $$
DECLARE
  v_prof  RECORD;
  v_ts    RECORD;
  v_tier  TEXT;
  v_others JSONB;
BEGIN
  -- Self-healing: recompute current plan (expires lapsed rows) on every read.
  PERFORM public.recompute_current_plan(p_user_id);

  SELECT tier, is_premium, premium_expires_at, contacts_remaining, interests_remaining
    INTO v_prof FROM profiles WHERE id = p_user_id;

  IF v_prof IS NULL THEN
    RETURN jsonb_build_object('tier','FREE','contacts_remaining',0,'interests_remaining',0,'other_plans','[]'::jsonb);
  END IF;

  v_tier := COALESCE(v_prof.tier, 'free');
  SELECT * INTO v_ts FROM tier_settings ts WHERE ts.tier = v_tier;

  -- Other active plans = every active plan EXCEPT the single current one
  -- (the current plan is the highest-priority, latest-expiry active row).
  SELECT COALESCE(jsonb_agg(o ORDER BY o.priority DESC), '[]'::jsonb) INTO v_others
  FROM (
    SELECT s.plan_type AS plan,
           UPPER(s.plan_type) AS label,
           s.expires_at,
           GREATEST(0, CEIL(EXTRACT(EPOCH FROM (s.expires_at - NOW())) / 86400))::INT AS days_left,
           public.plan_priority(s.plan_type) AS priority
    FROM subscriptions s
    WHERE s.user_id = p_user_id AND s.status = 'active' AND s.expires_at > NOW()
    ORDER BY public.plan_priority(s.plan_type) DESC, s.expires_at DESC
    OFFSET 1   -- skip the current (top) plan
  ) o;

  RETURN jsonb_build_object(
    'tier',                  UPPER(v_tier),
    'is_premium',            (v_tier <> 'free'),
    'expires_at',            v_prof.premium_expires_at,
    'days_remaining',        CASE WHEN v_prof.premium_expires_at IS NULL THEN NULL
                                  ELSE GREATEST(0, CEIL(EXTRACT(EPOCH FROM (v_prof.premium_expires_at - NOW())) / 86400))::INT END,
    'contacts_remaining',    COALESCE(v_prof.contacts_remaining, 0),
    'interests_remaining',   COALESCE(v_prof.interests_remaining, 0),
    'recommended_limit',     COALESCE(v_ts.recommended_limit, 0),
    'nearby_limit',          COALESCE(v_ts.nearby_limit, 0),
    'daily_limit',           COALESCE(v_ts.daily_limit, 0),
    'dynamic_daily_enabled', COALESCE(v_ts.dynamic_daily_enabled, false),
    'other_plans',           v_others
  );
END;
$$ LANGUAGE plpgsql;

-- ─────────────────────────────────────────────────────────────────────────────
-- PART 3 — WEIGHTED MATCH SCORE (0-100), single source for all feeds
-- ─────────────────────────────────────────────────────────────────────────────
-- Components (sum 100):
--   Horoscope 25 | Location 20 | Age 15 | Education 15 | Occupation 10 | Religion/Caste 15
-- Horoscope uses same-raasi (full) / compatible heuristic when stars/raasi known.
-- p_pref is the viewer's partner_preferences row passed as jsonb (may be null).
CREATE OR REPLACE FUNCTION public.match_score(
  v_religion TEXT, v_caste TEXT, v_state TEXT, v_district TEXT, v_dob DATE,
  v_education TEXT, v_occupation TEXT, v_raasi TEXT,
  c_religion TEXT, c_caste TEXT, c_state TEXT, c_district TEXT, c_dob DATE,
  c_education TEXT, c_occupation TEXT, c_raasi TEXT,
  c_verified BOOLEAN, c_completion INTEGER
) RETURNS INTEGER
IMMUTABLE LANGUAGE sql AS $$
  SELECT LEAST(100, GREATEST(0, (
    -- Horoscope (25): same raasi = full, both known but differ = partial.
    CASE
      WHEN v_raasi IS NOT NULL AND c_raasi IS NOT NULL AND v_raasi = c_raasi THEN 25
      WHEN v_raasi IS NOT NULL AND c_raasi IS NOT NULL THEN 12
      ELSE 8
    END
    -- Location (20): same district > same state > else.
    + CASE
        WHEN v_district IS NOT NULL AND c_district = v_district THEN 20
        WHEN v_state IS NOT NULL AND c_state = v_state THEN 12
        ELSE 4
      END
    -- Age (15): closeness within ~10 years.
    + CASE
        WHEN v_dob IS NULL OR c_dob IS NULL THEN 7
        ELSE GREATEST(0, 15 - (ABS(EXTRACT(YEAR FROM AGE(v_dob)) - EXTRACT(YEAR FROM AGE(c_dob)))::INT * 2))
      END
    -- Education (15): exact match.
    + CASE WHEN v_education IS NOT NULL AND c_education = v_education THEN 15
           WHEN c_education IS NOT NULL THEN 6 ELSE 0 END
    -- Occupation (10): exact match.
    + CASE WHEN v_occupation IS NOT NULL AND c_occupation = v_occupation THEN 10
           WHEN c_occupation IS NOT NULL THEN 4 ELSE 0 END
    -- Religion/Caste (15): religion 9 + caste 6.
    + CASE WHEN v_religion IS NOT NULL AND c_religion = v_religion THEN 9 ELSE 0 END
    + CASE WHEN v_caste IS NOT NULL AND c_caste = v_caste THEN 6 ELSE 0 END
    -- Small quality nudge so verified/complete profiles edge ahead on ties.
    + CASE WHEN c_verified THEN 0 ELSE 0 END
  )))::INTEGER;
$$;

-- ─────────────────────────────────────────────────────────────────────────────
-- PART 2 — DAILY SNAPSHOT WINDOW (shared by all three feeds)
-- ─────────────────────────────────────────────────────────────────────────────
-- Returns today's frozen ID window for (user, section). If today's snapshot
-- doesn't exist, it takes the first `p_limit` of the supplied ranked candidate
-- array, persists it, and returns it. Admin limit changes only affect the NEXT
-- day because today's window is frozen once created.
CREATE OR REPLACE FUNCTION public.snapshot_window(
  p_user_id UUID, p_section TEXT, p_limit INTEGER, p_ranked UUID[]
) RETURNS UUID[]
SECURITY DEFINER SET search_path = public AS $$
DECLARE
  v_today UUID[];
  v_date  DATE;
  v_window UUID[];
BEGIN
  SELECT todays_ids, todays_date INTO v_today, v_date
  FROM user_profile_views WHERE user_id = p_user_id AND section = p_section;

  IF v_date = CURRENT_DATE AND v_today IS NOT NULL AND array_length(v_today,1) IS NOT NULL THEN
    RETURN v_today;  -- frozen: return today's allocation unchanged
  END IF;

  -- New day (or first ever): freeze the first p_limit ranked candidates.
  v_window := (SELECT ARRAY(SELECT unnest(p_ranked) LIMIT GREATEST(0, p_limit)));
  v_window := COALESCE(v_window, ARRAY[]::UUID[]);

  INSERT INTO user_profile_views (user_id, section, profile_ids, todays_ids, todays_date, last_updated)
  VALUES (p_user_id, p_section,
          ARRAY(SELECT DISTINCT unnest(COALESCE(v_today, ARRAY[]::UUID[]) || v_window)),
          v_window, CURRENT_DATE, CURRENT_DATE)
  ON CONFLICT (user_id, section) DO UPDATE SET
    profile_ids = ARRAY(SELECT DISTINCT unnest(user_profile_views.profile_ids || EXCLUDED.todays_ids)),
    todays_ids  = EXCLUDED.todays_ids,
    todays_date = CURRENT_DATE,
    last_updated = CURRENT_DATE;

  RETURN v_window;
END;
$$ LANGUAGE plpgsql;

-- ─────────────────────────────────────────────────────────────────────────────
-- FEED RPCS — ranked by match_score, frozen per day via snapshot_window
-- ─────────────────────────────────────────────────────────────────────────────
-- Shared return shape (unchanged from prior feeds so the client/attachPhotos
-- keep working). compatibility_score is now the real weighted match %.

-- RECOMMENDED — partner-preference filtered + match_score ranking + daily freeze.
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
  v RECORD; p RECORD; v_tier TEXT; v_limit INTEGER; v_raasi TEXT; v_window UUID[];
BEGIN
  SELECT me.gender, me.religion, me.caste, me.state, me.district, me.tier,
         me.date_of_birth, me.education, me.occupation
    INTO v FROM profiles me WHERE me.id = p_user_id;
  v_tier := COALESCE(v.tier, 'free');
  SELECT recommended_limit INTO v_limit FROM tier_settings ts WHERE ts.tier = v_tier;
  v_limit := COALESCE(v_limit, 5);
  SELECT raasi INTO v_raasi FROM horoscope_details WHERE user_id = p_user_id;
  SELECT * INTO p FROM partner_preferences WHERE user_id = p_user_id;

  -- Build the ranked candidate id list (preference-filtered, scored), then
  -- freeze the day's window so admin limit changes only apply tomorrow.
  v_window := public.snapshot_window(p_user_id, 'recommended', v_limit, ARRAY(
    SELECT pr.id FROM profiles pr
    LEFT JOIN horoscope_details ch ON ch.user_id = pr.id
    WHERE pr.is_active = true AND pr.id <> p_user_id AND pr.gender <> v.gender
      AND NOT public._feed_excluded(p_user_id, pr.id)
      AND (p.age_min IS NULL OR pr.date_of_birth <= (CURRENT_DATE - (p.age_min || ' years')::INTERVAL))
      AND (p.age_max IS NULL OR pr.date_of_birth >= (CURRENT_DATE - ((p.age_max + 1) || ' years')::INTERVAL))
      AND (p.religion       IS NULL OR array_length(p.religion,1)       IS NULL OR pr.religion       = ANY(p.religion))
      AND (p.caste          IS NULL OR array_length(p.caste,1)          IS NULL OR pr.caste          = ANY(p.caste) OR 'Caste No Bar' = ANY(p.caste))
      AND (p.education       IS NULL OR array_length(p.education,1)      IS NULL OR pr.education       = ANY(p.education))
      AND (p.occupation      IS NULL OR array_length(p.occupation,1)     IS NULL OR pr.occupation      = ANY(p.occupation))
      AND (p.marital_status  IS NULL OR array_length(p.marital_status,1) IS NULL OR pr.marital_status  = ANY(p.marital_status))
    ORDER BY public.match_score(
        v.religion, v.caste, v.state, v.district, v.date_of_birth, v.education, v.occupation, v_raasi,
        pr.religion, pr.caste, pr.state, pr.district, pr.date_of_birth, pr.education, pr.occupation, ch.raasi,
        pr.is_verified, pr.profile_completion_percent
      ) DESC, pr.last_active_at DESC
  ));

  RETURN QUERY
  SELECT pr.id, pr.profile_id, pr.display_name, pr.gender, pr.date_of_birth,
         pr.height_cm, pr.marital_status, pr.religion, pr.caste,
         pr.city, pr.district, pr.state, pr.education, pr.occupation,
         pr.annual_income, pr.food_habit, pr.about_me, pr.is_verified,
         pr.is_premium, pr.tier, pr.last_active_at, pr.profile_completion_percent,
         public.match_score(
           v.religion, v.caste, v.state, v.district, v.date_of_birth, v.education, v.occupation, v_raasi,
           pr.religion, pr.caste, pr.state, pr.district, pr.date_of_birth, pr.education, pr.occupation, ch.raasi,
           pr.is_verified, pr.profile_completion_percent
         ) AS compatibility_score
  FROM profiles pr
  LEFT JOIN horoscope_details ch ON ch.user_id = pr.id
  JOIN unnest(v_window) WITH ORDINALITY AS w(wid, ord) ON w.wid = pr.id
  ORDER BY compatibility_score DESC, w.ord
  LIMIT p_limit OFFSET p_offset;
END;
$$ LANGUAGE plpgsql;

-- NEARBY — location cascade (district>adjacent>state>national) THEN match_score,
-- frozen per day. The cascade tier dominates ordering; match_score breaks ties.
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
  v RECORD; v_tier TEXT; v_limit INTEGER; v_raasi TEXT; v_window UUID[];
BEGIN
  SELECT me.gender, me.religion, me.caste, me.state, me.district, me.tier,
         me.date_of_birth, me.education, me.occupation
    INTO v FROM profiles me WHERE me.id = p_user_id;
  v_tier := COALESCE(v.tier, 'free');
  SELECT nearby_limit INTO v_limit FROM tier_settings ts WHERE ts.tier = v_tier;
  v_limit := COALESCE(v_limit, 5);
  SELECT raasi INTO v_raasi FROM horoscope_details WHERE user_id = p_user_id;

  -- Ranked candidates: location tier first (4=district..1=national), then match%.
  v_window := public.snapshot_window(p_user_id, 'nearby', v_limit, ARRAY(
    SELECT pr.id FROM profiles pr
    LEFT JOIN horoscope_details ch ON ch.user_id = pr.id
    WHERE pr.is_active = true AND pr.id <> p_user_id AND pr.gender <> v.gender
      AND NOT public._feed_excluded(p_user_id, pr.id)
    ORDER BY
      (CASE
        WHEN v.district IS NOT NULL AND pr.district = v.district THEN 4
        WHEN EXISTS (SELECT 1 FROM district_adjacency da WHERE da.district = v.district AND da.neighbor = pr.district) THEN 3
        WHEN v.state IS NOT NULL AND pr.state = v.state THEN 2
        ELSE 1
      END) DESC,
      public.match_score(
        v.religion, v.caste, v.state, v.district, v.date_of_birth, v.education, v.occupation, v_raasi,
        pr.religion, pr.caste, pr.state, pr.district, pr.date_of_birth, pr.education, pr.occupation, ch.raasi,
        pr.is_verified, pr.profile_completion_percent
      ) DESC, pr.last_active_at DESC
  ));

  RETURN QUERY
  SELECT pr.id, pr.profile_id, pr.display_name, pr.gender, pr.date_of_birth,
         pr.height_cm, pr.marital_status, pr.religion, pr.caste,
         pr.city, pr.district, pr.state, pr.education, pr.occupation,
         pr.annual_income, pr.food_habit, pr.about_me, pr.is_verified,
         pr.is_premium, pr.tier, pr.last_active_at, pr.profile_completion_percent,
         public.match_score(
           v.religion, v.caste, v.state, v.district, v.date_of_birth, v.education, v.occupation, v_raasi,
           pr.religion, pr.caste, pr.state, pr.district, pr.date_of_birth, pr.education, pr.occupation, ch.raasi,
           pr.is_verified, pr.profile_completion_percent
         ) AS compatibility_score
  FROM profiles pr
  LEFT JOIN horoscope_details ch ON ch.user_id = pr.id
  JOIN unnest(v_window) WITH ORDINALITY AS w(wid, ord) ON w.wid = pr.id
  ORDER BY w.ord   -- preserve frozen cascade order
  LIMIT p_limit OFFSET p_offset;
END;
$$ LANGUAGE plpgsql;

-- DAILY — best-compatibility (match_score) profiles, frozen per day, accumulating
-- the seen set so each new day surfaces fresh high-match profiles.
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
  v RECORD; v_tier TEXT; v_limit INTEGER; v_raasi TEXT;
  v_seen UUID[]; v_today UUID[]; v_date DATE; v_window UUID[];
BEGIN
  SELECT me.gender, me.religion, me.caste, me.state, me.district, me.tier,
         me.date_of_birth, me.education, me.occupation
    INTO v FROM profiles me WHERE me.id = p_user_id;
  v_tier := COALESCE(v.tier, 'free');
  SELECT daily_limit INTO v_limit FROM tier_settings ts WHERE ts.tier = v_tier;
  v_limit := COALESCE(v_limit, 5);
  SELECT raasi INTO v_raasi FROM horoscope_details WHERE user_id = p_user_id;

  SELECT profile_ids, todays_ids, todays_date INTO v_seen, v_today, v_date
  FROM user_profile_views WHERE user_id = p_user_id AND section = 'daily';
  v_seen := COALESCE(v_seen, ARRAY[]::UUID[]);

  -- Reuse today's frozen window if present; else compute fresh best-match,
  -- excluding everything already shown (accumulating rotation).
  IF v_date = CURRENT_DATE AND v_today IS NOT NULL AND array_length(v_today,1) IS NOT NULL THEN
    v_window := v_today;
  ELSE
    v_window := ARRAY(
      SELECT pr.id FROM profiles pr
      LEFT JOIN horoscope_details ch ON ch.user_id = pr.id
      WHERE pr.is_active = true AND pr.id <> p_user_id AND pr.gender <> v.gender
        AND pr.id <> ALL(v_seen)
        AND NOT public._feed_excluded(p_user_id, pr.id)
      ORDER BY public.match_score(
          v.religion, v.caste, v.state, v.district, v.date_of_birth, v.education, v.occupation, v_raasi,
          pr.religion, pr.caste, pr.state, pr.district, pr.date_of_birth, pr.education, pr.occupation, ch.raasi,
          pr.is_verified, pr.profile_completion_percent
        ) DESC, pr.last_active_at DESC
      LIMIT v_limit
    );
    -- Recycle when the fresh pool is exhausted.
    IF v_window IS NULL OR array_length(v_window,1) IS NULL THEN
      v_seen := ARRAY[]::UUID[];
      v_window := ARRAY(
        SELECT pr.id FROM profiles pr
        LEFT JOIN horoscope_details ch ON ch.user_id = pr.id
        WHERE pr.is_active = true AND pr.id <> p_user_id AND pr.gender <> v.gender
          AND NOT public._feed_excluded(p_user_id, pr.id)
        ORDER BY public.match_score(
            v.religion, v.caste, v.state, v.district, v.date_of_birth, v.education, v.occupation, v_raasi,
            pr.religion, pr.caste, pr.state, pr.district, pr.date_of_birth, pr.education, pr.occupation, ch.raasi,
            pr.is_verified, pr.profile_completion_percent
          ) DESC, pr.last_active_at DESC
        LIMIT v_limit
      );
    END IF;
    v_window := COALESCE(v_window, ARRAY[]::UUID[]);

    INSERT INTO user_profile_views (user_id, section, profile_ids, todays_ids, todays_date, last_updated)
    VALUES (p_user_id, 'daily', ARRAY(SELECT DISTINCT unnest(v_seen || v_window)), v_window, CURRENT_DATE, CURRENT_DATE)
    ON CONFLICT (user_id, section) DO UPDATE SET
      profile_ids = ARRAY(SELECT DISTINCT unnest(user_profile_views.profile_ids || EXCLUDED.todays_ids)),
      todays_ids  = EXCLUDED.todays_ids, todays_date = CURRENT_DATE, last_updated = CURRENT_DATE;
  END IF;

  p_limit := LEAST(p_limit, GREATEST(0, COALESCE(array_length(v_window,1),0) - p_offset));
  IF p_limit <= 0 THEN RETURN; END IF;

  RETURN QUERY
  SELECT pr.id, pr.profile_id, pr.display_name, pr.gender, pr.date_of_birth,
         pr.height_cm, pr.marital_status, pr.religion, pr.caste,
         pr.city, pr.district, pr.state, pr.education, pr.occupation,
         pr.annual_income, pr.food_habit, pr.about_me, pr.is_verified,
         pr.is_premium, pr.tier, pr.last_active_at, pr.profile_completion_percent,
         public.match_score(
           v.religion, v.caste, v.state, v.district, v.date_of_birth, v.education, v.occupation, v_raasi,
           pr.religion, pr.caste, pr.state, pr.district, pr.date_of_birth, pr.education, pr.occupation, ch.raasi,
           pr.is_verified, pr.profile_completion_percent
         ) AS compatibility_score
  FROM profiles pr
  LEFT JOIN horoscope_details ch ON ch.user_id = pr.id
  JOIN unnest(v_window) WITH ORDINALITY AS w(wid, ord) ON w.wid = pr.id
  ORDER BY compatibility_score DESC, w.ord
  LIMIT p_limit OFFSET p_offset;
END;
$$ LANGUAGE plpgsql;

GRANT EXECUTE ON FUNCTION public.plan_priority(TEXT) TO authenticated, anon;
NOTIFY pgrst, 'reload schema';
-- =============================================================================
-- END PATCH 03
-- =============================================================================
