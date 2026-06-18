-- ############################################################################
-- WEDRING — COMBINED DEPLOY  (run this ONE file, top to bottom, in SQL editor)
-- ############################################################################
-- Ordered, idempotent, self-verifying. Safe to re-run.
--
-- PART 1 — Feed tier-ambiguity fix (get_recommended_profiles / get_nearby_profiles)
--          Prereq: feed_allocation() already deployed (hotfix_feed_dedup.sql).
--          Prints:  NOTICE  PATCH OK: both feed functions use sp.tier ...
--
-- PART 2 — Credits fix + subscription_queue + tier priority + admin_make_user_free
--          Prints:  NOTICE  VERIFY OK: subscription_queue + activation + ...
--
-- Order matters: PART 2's get_user_quota rewrite assumes the feeds (PART 1) are
-- already in their fixed form. If you see either PATCH/VERIFY line as a NOTICE
-- (not ERROR), that part deployed. An ERROR halts the run — fix and re-run.
-- ############################################################################


-- ====================== PART 1 / 3 : FEED FIX (recommended + nearby) ======================
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


-- ============== PART 2 / 3 : CREDITS + QUEUE + ADMIN ===============
-- ============================================================================
-- WEDRING — SUBSCRIPTION QUEUE + CREDIT/DISTRIBUTION FIX  (V2.1)
-- ----------------------------------------------------------------------------
-- Run ALONE in the Supabase SQL editor. Idempotent; safe to re-run.
--
-- Fixes / adds:
--   #3  purchase_subscription now grants credits to user_wallet (the table the
--       app actually reads) and initial pools to user_distribution_state, using
--       the LIVE column names contacts_limit / interests_limit.
--   #1  Buying a HIGHER tier while one is active -> higher activates now, the
--       running plan is PAUSED with its remaining days banked in subscription_queue.
--   #2  Tier priority: profiles.tier always reflects the highest ACTIVE tier.
--       Lower/equal purchases are queued (pending) behind the active plan.
--   Auto-activation: when the active plan lapses, the next queued/paused plan is
--       resumed automatically on the next quota read (self-healing) and by cron.
--
-- Self-verify block at the bottom RAISES if anything critical is missing.
-- ============================================================================

-- ----------------------------------------------------------------------------
-- 1. subscription_queue table  (the previous/paused/pending packs)
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS public.subscription_queue (
  id               UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  user_id          UUID NOT NULL REFERENCES auth.users(id) ON DELETE CASCADE,
  plan_tier        TEXT NOT NULL,
  -- remaining days banked when a plan is paused (NULL = full duration not yet started)
  remaining_days   INTEGER,
  duration_months  INTEGER,
  contact_credits  INTEGER DEFAULT 0,
  interest_credits INTEGER DEFAULT 0,
  -- 'paused'  = was active, interrupted by a higher tier (resume where it left off)
  -- 'pending' = bought while a higher/equal tier was active (never started yet)
  status           TEXT NOT NULL DEFAULT 'pending',
  amount           INTEGER,
  payment_id       TEXT,
  created_at       TIMESTAMPTZ DEFAULT NOW(),
  updated_at       TIMESTAMPTZ DEFAULT NOW()
);

ALTER TABLE public.subscription_queue ENABLE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "Users read own queue" ON subscription_queue;
CREATE POLICY "Users read own queue" ON subscription_queue FOR SELECT USING (auth.uid() = user_id);
DROP POLICY IF EXISTS "Admin manage queue" ON subscription_queue;
CREATE POLICY "Admin manage queue" ON subscription_queue FOR ALL USING (
  EXISTS (SELECT 1 FROM admin_users WHERE email = auth.email() AND role = 'admin')
);
CREATE INDEX IF NOT EXISTS idx_subscription_queue_user ON subscription_queue(user_id, status);

-- ----------------------------------------------------------------------------
-- 2. tier rank helper (free=0 < silver=1 < gold=2 < platinum=3)
-- ----------------------------------------------------------------------------
CREATE OR REPLACE FUNCTION public.tier_rank(p_tier TEXT) RETURNS INTEGER
LANGUAGE sql IMMUTABLE AS $$
  SELECT CASE COALESCE(p_tier,'free')
    WHEN 'platinum' THEN 3 WHEN 'gold' THEN 2 WHEN 'silver' THEN 1 ELSE 0 END;
$$;
-- ----------------------------------------------------------------------------
-- 3. _grant_plan_benefits — credits (ALWAYS) + initial distribution (ONCE/tier).
--    Reused by purchase_subscription and by queue activation. Writes the tables
--    the app actually reads: user_wallet + user_distribution_state.
-- ----------------------------------------------------------------------------
CREATE OR REPLACE FUNCTION public._grant_plan_benefits(
  p_user_id UUID, p_tier TEXT
) RETURNS VOID
SECURITY DEFINER SET search_path = public AS $$
DECLARE
  v_plan       RECORD;
  v_state      RECORD;
  v_prev       RECORD;
  v_rec INT := 0; v_near INT := 0; v_daily INT := 0;
  v_cur_tier   TEXT;
BEGIN
  SELECT * INTO v_plan FROM subscription_plans WHERE tier = p_tier;
  IF v_plan IS NULL THEN RETURN; END IF;

  -- Ensure wallet + distribution state rows exist.
  INSERT INTO user_wallet (user_id, contact_credits, interest_credits)
  VALUES (p_user_id, 0, 0) ON CONFLICT (user_id) DO NOTHING;
  INSERT INTO user_distribution_state
    (user_id, highest_tier_ever_reached, initial_distribution_granted_tiers,
     recommended_profiles_shown, nearby_profiles_shown, daily_profiles_shown)
  VALUES (p_user_id, 'free', ARRAY['free'], 3, 4, 5)
  ON CONFLICT (user_id) DO NOTHING;

  -- (a) ALWAYS grant credits (every purchase) — live column names.
  UPDATE user_wallet SET
    contact_credits  = contact_credits  + COALESCE(v_plan.contacts_limit, 0),
    interest_credits = interest_credits + COALESCE(v_plan.interests_limit, 0),
    updated_at = NOW()
  WHERE user_id = p_user_id;
  -- Mirror to profiles for any legacy reads.
  UPDATE profiles SET
    contacts_remaining  = GREATEST(0, COALESCE(contacts_remaining,0))  + COALESCE(v_plan.contacts_limit, 0),
    interests_remaining = GREATEST(0, COALESCE(interests_remaining,0)) + COALESCE(v_plan.interests_limit, 0)
  WHERE id = p_user_id;

  -- (b) Initial distribution — only if this tier was never granted before.
  SELECT * INTO v_state FROM user_distribution_state WHERE user_id = p_user_id;
  IF NOT (p_tier = ANY(v_state.initial_distribution_granted_tiers)) THEN
    v_cur_tier := COALESCE(v_state.highest_tier_ever_reached, 'free');
    IF public.tier_rank(p_tier) > public.tier_rank(v_cur_tier) AND v_cur_tier <> 'free' THEN
      -- Upgrade: grant only the delta over the previous highest tier.
      SELECT * INTO v_prev FROM subscription_plans WHERE tier = v_cur_tier;
      v_rec   := GREATEST(0, COALESCE(v_plan.initial_recommended_profiles,0) - COALESCE(v_prev.initial_recommended_profiles,0));
      v_near  := GREATEST(0, COALESCE(v_plan.initial_nearby_profiles,0)      - COALESCE(v_prev.initial_nearby_profiles,0));
      v_daily := GREATEST(0, COALESCE(v_plan.initial_daily_profiles,0)       - COALESCE(v_prev.initial_daily_profiles,0));
    ELSE
      -- First time at this tier (e.g. free -> silver): full allocation.
      v_rec   := COALESCE(v_plan.initial_recommended_profiles, 0);
      v_near  := COALESCE(v_plan.initial_nearby_profiles, 0);
      v_daily := COALESCE(v_plan.initial_daily_profiles, 0);
    END IF;

    UPDATE user_distribution_state SET
      recommended_profiles_shown = recommended_profiles_shown + v_rec,
      nearby_profiles_shown      = nearby_profiles_shown + v_near,
      daily_profiles_shown       = daily_profiles_shown + v_daily,
      initial_distribution_granted_tiers = array_append(initial_distribution_granted_tiers, p_tier),
      highest_tier_ever_reached = CASE
        WHEN public.tier_rank(p_tier) > public.tier_rank(COALESCE(highest_tier_ever_reached,'free'))
        THEN p_tier ELSE highest_tier_ever_reached END,
      updated_at = NOW()
    WHERE user_id = p_user_id;
  ELSE
    -- Re-purchase of an already-granted tier: bump highest_tier only, NO profiles.
    UPDATE user_distribution_state SET
      highest_tier_ever_reached = CASE
        WHEN public.tier_rank(p_tier) > public.tier_rank(COALESCE(highest_tier_ever_reached,'free'))
        THEN p_tier ELSE highest_tier_ever_reached END,
      updated_at = NOW()
    WHERE user_id = p_user_id;
  END IF;

  -- Keep user_profile_distribution mirrored (admin panel reads it for display).
  UPDATE user_profile_distribution SET
    tier = p_tier,
    total_recommended_unlocked = (SELECT recommended_profiles_shown FROM user_distribution_state WHERE user_id = p_user_id),
    total_nearby_unlocked      = (SELECT nearby_profiles_shown      FROM user_distribution_state WHERE user_id = p_user_id),
    total_daily_unlocked       = (SELECT daily_profiles_shown       FROM user_distribution_state WHERE user_id = p_user_id),
    updated_at = NOW()
  WHERE user_id = p_user_id;
END;
$$ LANGUAGE plpgsql;
-- ----------------------------------------------------------------------------
-- 4. purchase_subscription — tier-aware activation + queue.
--    Signature preserved: (UUID, TEXT, TEXT, INTEGER) RETURNS JSONB.
-- ----------------------------------------------------------------------------
CREATE OR REPLACE FUNCTION public.purchase_subscription(
  p_user_id    UUID,
  p_plan_type  TEXT,
  p_payment_id TEXT    DEFAULT NULL,
  p_amount     INTEGER DEFAULT NULL
) RETURNS JSONB
SECURITY DEFINER SET search_path = public AS $$
DECLARE
  v_plan        RECORD;
  v_prof        RECORD;
  v_new_expiry  TIMESTAMPTZ;
  v_sub_id      UUID;
  v_cur_active  BOOLEAN;
  v_cur_rank    INTEGER;
  v_new_rank    INTEGER;
  v_remaining   INTEGER;
  v_queued      BOOLEAN := false;
  v_activated   BOOLEAN := true;
BEGIN
  IF p_plan_type IN ('free','non_premium') THEN
    RAISE EXCEPTION 'INVALID_PLAN: cannot purchase the free tier';
  END IF;

  SELECT * INTO v_plan FROM subscription_plans WHERE tier = p_plan_type;
  IF v_plan IS NULL THEN
    RAISE EXCEPTION 'INVALID_PLAN_TYPE: %', p_plan_type;
  END IF;

  SELECT tier, is_premium, premium_expires_at INTO v_prof FROM profiles WHERE id = p_user_id;

  v_cur_active := (v_prof.premium_expires_at IS NOT NULL AND v_prof.premium_expires_at > NOW());
  v_cur_rank   := public.tier_rank(COALESCE(v_prof.tier,'free'));
  v_new_rank   := public.tier_rank(p_plan_type);

  -- Credits + initial distribution are ALWAYS granted at purchase time, regardless
  -- of whether the plan activates now or is queued (user paid; they get their credits).
  PERFORM public._grant_plan_benefits(p_user_id, p_plan_type);

  -- Always record the purchase in subscriptions (audit/history).
  INSERT INTO subscriptions
    (user_id, plan_type, status, amount, razorpay_payment_id, contacts_added, interests_added, starts_at, expires_at)
  VALUES
    (p_user_id, p_plan_type, 'active', COALESCE(p_amount, v_plan.price_inr), p_payment_id,
     v_plan.contacts_limit, v_plan.interests_limit, NOW(),
     NOW() + (v_plan.duration_months || ' months')::INTERVAL)
  RETURNING id INTO v_sub_id;

  IF p_payment_id IS NOT NULL THEN
    INSERT INTO payments (user_id, subscription_id, plan_type, amount, tax, final_amount,
      payment_gateway, gateway_transaction_id, status)
    VALUES (p_user_id, v_sub_id, p_plan_type,
      COALESCE(p_amount, v_plan.price_inr), 0, COALESCE(p_amount, v_plan.price_inr),
      CASE WHEN p_payment_id LIKE 'pay_mock_%' THEN 'mock' ELSE 'razorpay' END,
      p_payment_id, 'success');
  END IF;

  IF NOT v_cur_active OR v_new_rank > v_cur_rank THEN
    -- ── ACTIVATE NOW ──
    -- If a lower tier was running, PAUSE it: bank its remaining days in the queue.
    IF v_cur_active AND v_new_rank > v_cur_rank AND v_prof.tier IS NOT NULL AND v_prof.tier <> 'free' THEN
      v_remaining := GREATEST(0, CEIL(EXTRACT(EPOCH FROM (v_prof.premium_expires_at - NOW())) / 86400)::INT);
      IF v_remaining > 0 THEN
        INSERT INTO subscription_queue (user_id, plan_tier, remaining_days, duration_months, status)
        VALUES (p_user_id, v_prof.tier, v_remaining, NULL, 'paused');
      END IF;
    END IF;

    v_new_expiry := NOW() + (v_plan.duration_months || ' months')::INTERVAL;
    UPDATE profiles SET
      tier = p_plan_type, is_premium = true, is_verified = true,
      premium_expires_at = v_new_expiry
    WHERE id = p_user_id;
    v_activated := true;
  ELSE
    -- ── QUEUE (pending) ── lower/equal tier bought while a higher one is active.
    -- It keeps the active plan; the new one waits. Extend nothing now.
    UPDATE subscriptions SET status = 'queued' WHERE id = v_sub_id;
    INSERT INTO subscription_queue (user_id, plan_tier, remaining_days, duration_months, status)
    VALUES (p_user_id, p_plan_type, NULL, v_plan.duration_months, 'pending');
    v_new_expiry := v_prof.premium_expires_at;
    v_activated  := false;
    v_queued     := true;
  END IF;

  RETURN jsonb_build_object(
    'success', true, 'tier', p_plan_type, 'activated', v_activated, 'queued', v_queued,
    'expires_at', v_new_expiry,
    'contacts_added', v_plan.contacts_limit, 'interests_added', v_plan.interests_limit
  );
END;
$$ LANGUAGE plpgsql;

-- ----------------------------------------------------------------------------
-- 5. activate_next_queued — resume the highest-priority paused/pending plan.
--    Called by the self-healing quota read and by cron when active plan lapses.
-- ----------------------------------------------------------------------------
CREATE OR REPLACE FUNCTION public.activate_next_queued(p_user_id UUID) RETURNS BOOLEAN
SECURITY DEFINER SET search_path = public AS $$
DECLARE
  v_next   RECORD;
  v_plan   RECORD;
  v_months INTEGER;
  v_expiry TIMESTAMPTZ;
BEGIN
  -- Only resume if the user currently has NO active premium.
  IF EXISTS (SELECT 1 FROM profiles WHERE id = p_user_id
             AND premium_expires_at IS NOT NULL AND premium_expires_at > NOW()
             AND tier <> 'free') THEN
    RETURN false;
  END IF;

  -- Highest tier first; among same tier, oldest queued first.
  SELECT * INTO v_next FROM subscription_queue
  WHERE user_id = p_user_id AND status IN ('paused','pending')
  ORDER BY public.tier_rank(plan_tier) DESC, created_at ASC
  LIMIT 1;
  IF v_next IS NULL THEN RETURN false; END IF;

  SELECT * INTO v_plan FROM subscription_plans WHERE tier = v_next.plan_tier;
  IF v_plan IS NULL THEN
    DELETE FROM subscription_queue WHERE id = v_next.id;
    RETURN false;
  END IF;

  IF v_next.status = 'paused' AND v_next.remaining_days IS NOT NULL THEN
    -- Resume where it left off: only the banked days remain. No new credits
    -- (credits were granted when first purchased).
    v_expiry := NOW() + (v_next.remaining_days || ' days')::INTERVAL;
  ELSE
    -- Pending plan starting fresh: grant its benefits now (first activation).
    v_months := COALESCE(v_next.duration_months, v_plan.duration_months);
    v_expiry := NOW() + (v_months || ' months')::INTERVAL;
    PERFORM public._grant_plan_benefits(p_user_id, v_next.plan_tier);
  END IF;

  UPDATE profiles SET
    tier = v_next.plan_tier, is_premium = true, is_verified = true,
    premium_expires_at = v_expiry
  WHERE id = p_user_id;

  UPDATE subscriptions SET status = 'active', expires_at = v_expiry
  WHERE user_id = p_user_id AND plan_type = v_next.plan_tier AND status = 'queued';

  DELETE FROM subscription_queue WHERE id = v_next.id;
  RETURN true;
END;
$$ LANGUAGE plpgsql;

-- ----------------------------------------------------------------------------
-- 6. Make get_user_quota self-heal: expire lapsed premium THEN try to resume a
--    queued/paused plan before reporting. Wraps existing logic minimally.
-- ----------------------------------------------------------------------------
CREATE OR REPLACE FUNCTION public.get_user_quota(p_user_id UUID)
RETURNS JSONB
SECURITY DEFINER SET search_path = public AS $$
DECLARE
  v_prof RECORD; v_wallet RECORD; v_dist RECORD; v_plan RECORD; v_tier TEXT;
BEGIN
  SELECT tier, is_premium, premium_expires_at INTO v_prof FROM profiles WHERE id = p_user_id;
  IF v_prof IS NULL THEN
    RETURN jsonb_build_object('tier','FREE','contact_credits',0,'interest_credits',0,
      'recommended_limit',3,'nearby_limit',4,'daily_limit',5,
      'contacts_remaining',0,'interests_remaining',0,'dynamic_daily_enabled',true);
  END IF;

  -- Lapsed premium -> downgrade, then try to resume the next queued/paused plan.
  IF v_prof.is_premium AND v_prof.premium_expires_at IS NOT NULL AND v_prof.premium_expires_at < NOW() THEN
    UPDATE profiles SET is_premium = false, tier = 'free' WHERE id = p_user_id;
    PERFORM public.activate_next_queued(p_user_id);
    SELECT tier, is_premium, premium_expires_at INTO v_prof FROM profiles WHERE id = p_user_id;
  END IF;
  v_tier := COALESCE(v_prof.tier, 'free');

  SELECT * INTO v_wallet FROM user_wallet WHERE user_id = p_user_id;
  SELECT * INTO v_dist FROM user_distribution_state WHERE user_id = p_user_id;
  SELECT * INTO v_plan FROM subscription_plans WHERE tier = v_tier;

  RETURN jsonb_build_object(
    'tier', UPPER(v_tier),
    'is_premium', (v_tier <> 'free'),
    'expires_at', v_prof.premium_expires_at,
    'contact_credits',  COALESCE(v_wallet.contact_credits, 0),
    'interest_credits', COALESCE(v_wallet.interest_credits, 0),
    'recommended_limit', COALESCE(v_dist.recommended_profiles_shown, COALESCE(v_plan.initial_recommended_profiles, 3)),
    'nearby_limit',      COALESCE(v_dist.nearby_profiles_shown,      COALESCE(v_plan.initial_nearby_profiles, 4)),
    'daily_limit',       COALESCE(v_dist.daily_profiles_shown,       COALESCE(v_plan.initial_daily_profiles, 5)),
    'dynamic_daily_enabled', true,
    'contacts_remaining',  COALESCE(v_wallet.contact_credits, 0),
    'interests_remaining', COALESCE(v_wallet.interest_credits, 0)
  );
END;
$$ LANGUAGE plpgsql;

-- ----------------------------------------------------------------------------
-- 7. get_user_quotas (PLURAL) — keep app's other screens in sync with the wallet
--    AND expose the queued/previous packs for the Settings history view.
-- ----------------------------------------------------------------------------
CREATE OR REPLACE FUNCTION public.get_user_quotas(p_user_id UUID)
RETURNS JSONB
SECURITY DEFINER SET search_path = public AS $$
DECLARE
  v_base JSONB;
  v_queue JSONB;
BEGIN
  -- Reuse the singular function so there is ONE source of truth + self-heal.
  v_base := public.get_user_quota(p_user_id);

  SELECT COALESCE(jsonb_agg(jsonb_build_object(
            'plan', q.plan_tier,
            'label', INITCAP(q.plan_tier),
            'status', q.status,
            'remaining_days', q.remaining_days,
            'duration_months', q.duration_months
          ) ORDER BY public.tier_rank(q.plan_tier) DESC, q.created_at ASC), '[]'::jsonb)
    INTO v_queue
  FROM subscription_queue q
  WHERE q.user_id = p_user_id AND q.status IN ('paused','pending');

  RETURN v_base || jsonb_build_object('other_plans', v_queue);
END;
$$ LANGUAGE plpgsql;

-- ----------------------------------------------------------------------------
-- 8. admin_make_user_free — strip premium + clear queue (for testing upgrades).
-- ----------------------------------------------------------------------------
CREATE OR REPLACE FUNCTION public.admin_make_user_free(
  p_user_id UUID, p_reset_distribution BOOLEAN DEFAULT false
) RETURNS JSONB
SECURITY DEFINER SET search_path = public AS $$
BEGIN
  UPDATE profiles SET tier = 'free', is_premium = false, premium_expires_at = NULL
  WHERE id = p_user_id;

  UPDATE subscriptions SET status = 'expired'
  WHERE user_id = p_user_id AND status IN ('active','queued');

  DELETE FROM subscription_queue WHERE user_id = p_user_id;

  IF p_reset_distribution THEN
    -- Full reset: behave like a brand-new free user so the next upgrade shows
    -- the configured initial distribution again.
    UPDATE user_distribution_state SET
      highest_tier_ever_reached = 'free',
      initial_distribution_granted_tiers = ARRAY['free'],
      recommended_profiles_shown = COALESCE((SELECT initial_recommended_profiles FROM subscription_plans WHERE tier='free'),3),
      nearby_profiles_shown      = COALESCE((SELECT initial_nearby_profiles      FROM subscription_plans WHERE tier='free'),4),
      daily_profiles_shown       = COALESCE((SELECT initial_daily_profiles       FROM subscription_plans WHERE tier='free'),5),
      updated_at = NOW()
    WHERE user_id = p_user_id;

    UPDATE user_wallet SET contact_credits = 0, interest_credits = 0, updated_at = NOW()
    WHERE user_id = p_user_id;
    UPDATE profiles SET contacts_remaining = 0, interests_remaining = 0 WHERE id = p_user_id;
  END IF;

  RETURN jsonb_build_object('success', true, 'reset_distribution', p_reset_distribution);
END;
$$ LANGUAGE plpgsql;

GRANT EXECUTE ON FUNCTION public.tier_rank(TEXT) TO authenticated, anon, service_role;
GRANT EXECUTE ON FUNCTION public._grant_plan_benefits(UUID, TEXT) TO authenticated, service_role;
GRANT EXECUTE ON FUNCTION public.purchase_subscription(UUID, TEXT, TEXT, INTEGER) TO authenticated, service_role;
GRANT EXECUTE ON FUNCTION public.activate_next_queued(UUID) TO authenticated, service_role;
GRANT EXECUTE ON FUNCTION public.get_user_quota(UUID) TO authenticated, anon, service_role;
GRANT EXECUTE ON FUNCTION public.get_user_quotas(UUID) TO authenticated, anon, service_role;
GRANT EXECUTE ON FUNCTION public.admin_make_user_free(UUID, BOOLEAN) TO authenticated, service_role;
NOTIFY pgrst, 'reload schema';

-- ----------------------------------------------------------------------------
-- SELF-VERIFY — raises if anything critical did not deploy.
-- ----------------------------------------------------------------------------
DO $verify$
BEGIN
  IF NOT EXISTS (SELECT 1 FROM information_schema.tables
                 WHERE table_schema='public' AND table_name='subscription_queue') THEN
    RAISE EXCEPTION 'VERIFY FAILED: subscription_queue table missing';
  END IF;
  IF NOT EXISTS (SELECT 1 FROM pg_proc p JOIN pg_namespace n ON n.oid=p.pronamespace
                 WHERE n.nspname='public' AND p.proname='activate_next_queued') THEN
    RAISE EXCEPTION 'VERIFY FAILED: activate_next_queued missing';
  END IF;
  IF NOT EXISTS (SELECT 1 FROM pg_proc p JOIN pg_namespace n ON n.oid=p.pronamespace
                 WHERE n.nspname='public' AND p.proname='admin_make_user_free') THEN
    RAISE EXCEPTION 'VERIFY FAILED: admin_make_user_free missing';
  END IF;
  RAISE NOTICE 'VERIFY OK: subscription_queue + activation + admin_make_user_free deployed.';
END;
$verify$;


-- ============== PART 3 / 3 : DAILY FEED SOURCE-OF-TRUTH FIX ==============
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
