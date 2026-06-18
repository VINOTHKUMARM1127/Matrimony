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
