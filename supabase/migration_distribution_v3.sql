-- ============================================================
-- WEDRING MATRIMONY — Distribution System V3 Migration
-- Separates Contact Credits from Profile Distribution
-- All distribution values admin-configurable, never hardcoded
-- ============================================================

-- ============================================================
-- 1. SUBSCRIPTION PLANS TABLE (replaces tier_settings as source of truth)
-- ============================================================
CREATE TABLE IF NOT EXISTS public.subscription_plans (
  id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
  tier TEXT UNIQUE NOT NULL CHECK (tier IN ('free','silver','gold','platinum')),

  -- Plan pricing
  price NUMERIC NOT NULL DEFAULT 0,
  duration_months INTEGER NOT NULL DEFAULT 0,

  -- Contact credits (granted on EVERY purchase)
  contact_credits INTEGER NOT NULL DEFAULT 0,
  interest_credits INTEGER NOT NULL DEFAULT 0,

  -- Initial distribution (one-time when reaching a tier for first time)
  initial_recommended_profiles INTEGER NOT NULL DEFAULT 0,
  initial_nearby_profiles INTEGER NOT NULL DEFAULT 0,
  initial_daily_profiles INTEGER NOT NULL DEFAULT 0,

  -- Daily distribution (added by cron every day for active subscribers)
  daily_recommended_increment INTEGER NOT NULL DEFAULT 0,
  daily_nearby_increment INTEGER NOT NULL DEFAULT 0,
  daily_profiles_increment INTEGER NOT NULL DEFAULT 0,

  -- Display metadata
  plan_name TEXT,
  color_code TEXT DEFAULT '#AAAAAA',
  is_popular BOOLEAN DEFAULT false,
  features JSONB DEFAULT '[]'::jsonb,

  created_at TIMESTAMPTZ DEFAULT NOW(),
  updated_at TIMESTAMPTZ DEFAULT NOW()
);

ALTER TABLE public.subscription_plans ENABLE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "Anyone can read subscription_plans" ON subscription_plans;
CREATE POLICY "Anyone can read subscription_plans" ON subscription_plans FOR SELECT USING (true);

DROP POLICY IF EXISTS "Admins manage subscription_plans" ON subscription_plans;
CREATE POLICY "Admins manage subscription_plans" ON subscription_plans FOR ALL USING (
  EXISTS (SELECT 1 FROM admin_users WHERE email = auth.email() AND role = 'admin')
);

-- Seed from existing tier_settings data
INSERT INTO subscription_plans (
  tier, price, duration_months, contact_credits, interest_credits,
  initial_recommended_profiles, initial_nearby_profiles, initial_daily_profiles,
  daily_recommended_increment, daily_nearby_increment, daily_profiles_increment,
  plan_name, color_code, is_popular, features
)
SELECT
  ts.tier,
  COALESCE(ts.price_inr, 0),
  COALESCE(ts.duration_months, 0),
  COALESCE(ts.contacts_limit, 0),
  COALESCE(ts.interests_limit, 0),
  -- Map existing limits as initial distribution
  COALESCE(ts.recommended_limit, 0),
  COALESCE(ts.nearby_limit, 0),
  COALESCE(ts.daily_limit, 0),
  -- Daily increments: start with sensible defaults based on tier
  CASE ts.tier
    WHEN 'free' THEN 0
    WHEN 'silver' THEN 5
    WHEN 'gold' THEN 10
    WHEN 'platinum' THEN 15
  END,
  CASE ts.tier
    WHEN 'free' THEN 0
    WHEN 'silver' THEN 5
    WHEN 'gold' THEN 10
    WHEN 'platinum' THEN 15
  END,
  CASE ts.tier
    WHEN 'free' THEN 0
    WHEN 'silver' THEN 3
    WHEN 'gold' THEN 5
    WHEN 'platinum' THEN 10
  END,
  ts.plan_name,
  COALESCE(ts.color_code, '#AAAAAA'),
  COALESCE(ts.is_popular, false),
  COALESCE(ts.features, '[]'::jsonb)
FROM tier_settings ts
ON CONFLICT (tier) DO NOTHING;

-- Ensure free tier always exists
INSERT INTO subscription_plans (tier, price, duration_months, contact_credits, interest_credits,
  initial_recommended_profiles, initial_nearby_profiles, initial_daily_profiles,
  daily_recommended_increment, daily_nearby_increment, daily_profiles_increment,
  plan_name)
VALUES ('free', 0, 0, 0, 0, 5, 5, 5, 0, 0, 0, 'Free')
ON CONFLICT (tier) DO NOTHING;

-- ============================================================
-- 2. USER DISTRIBUTION STATE (tracks profile distribution history)
-- ============================================================
CREATE TABLE IF NOT EXISTS public.user_distribution_state (
  user_id UUID PRIMARY KEY REFERENCES auth.users(id) ON DELETE CASCADE,
  highest_tier_ever_reached TEXT DEFAULT 'free',
  initial_distribution_granted_tiers TEXT[] DEFAULT '{}',

  -- Cumulative profile limits (these grow and NEVER decrease)
  recommended_profiles_shown INTEGER DEFAULT 0,
  nearby_profiles_shown INTEGER DEFAULT 0,
  daily_profiles_shown INTEGER DEFAULT 0,

  last_distribution_date DATE,
  created_at TIMESTAMPTZ DEFAULT NOW(),
  updated_at TIMESTAMPTZ DEFAULT NOW()
);

ALTER TABLE public.user_distribution_state ENABLE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "Users read own distribution state" ON user_distribution_state;
CREATE POLICY "Users read own distribution state" ON user_distribution_state FOR SELECT USING (auth.uid() = user_id);

DROP POLICY IF EXISTS "Admin full access distribution state" ON user_distribution_state;
CREATE POLICY "Admin full access distribution state" ON user_distribution_state FOR ALL USING (
  EXISTS (SELECT 1 FROM admin_users WHERE email = auth.email() AND role = 'admin')
);

-- ============================================================
-- 3. USER WALLET (consumable credits)
-- ============================================================
CREATE TABLE IF NOT EXISTS public.user_wallet (
  user_id UUID PRIMARY KEY REFERENCES auth.users(id) ON DELETE CASCADE,
  contact_credits INTEGER DEFAULT 0,
  interest_credits INTEGER DEFAULT 0,
  updated_at TIMESTAMPTZ DEFAULT NOW()
);

ALTER TABLE public.user_wallet ENABLE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "Users read own wallet" ON user_wallet;
CREATE POLICY "Users read own wallet" ON user_wallet FOR SELECT USING (auth.uid() = user_id);

DROP POLICY IF EXISTS "Admin full access wallet" ON user_wallet;
CREATE POLICY "Admin full access wallet" ON user_wallet FOR ALL USING (
  EXISTS (SELECT 1 FROM admin_users WHERE email = auth.email() AND role = 'admin')
);

-- ============================================================
-- 4. MIGRATE EXISTING USER DATA
-- ============================================================

-- Populate user_wallet from profiles.contacts_remaining / interests_remaining
INSERT INTO user_wallet (user_id, contact_credits, interest_credits)
SELECT
  p.id,
  GREATEST(0, COALESCE(p.contacts_remaining, 0)),
  GREATEST(0, COALESCE(p.interests_remaining, 0))
FROM profiles p
WHERE p.id IS NOT NULL
ON CONFLICT (user_id) DO NOTHING;

-- Populate user_distribution_state for existing users
INSERT INTO user_distribution_state (
  user_id, highest_tier_ever_reached, initial_distribution_granted_tiers,
  recommended_profiles_shown, nearby_profiles_shown, daily_profiles_shown
)
SELECT
  p.id,
  COALESCE(p.tier, 'free'),
  -- Assume existing users already received their tier's initial distribution
  CASE
    WHEN COALESCE(p.tier, 'free') = 'free' THEN ARRAY['free']
    WHEN p.tier = 'silver' THEN ARRAY['free','silver']
    WHEN p.tier = 'gold' THEN ARRAY['free','silver','gold']
    WHEN p.tier = 'platinum' THEN ARRAY['free','silver','gold','platinum']
  END,
  -- Set current limits from tier_settings (existing users keep their current pool)
  COALESCE((SELECT recommended_limit FROM tier_settings WHERE tier = COALESCE(p.tier, 'free')), 5),
  COALESCE((SELECT nearby_limit FROM tier_settings WHERE tier = COALESCE(p.tier, 'free')), 5),
  COALESCE((SELECT daily_limit FROM tier_settings WHERE tier = COALESCE(p.tier, 'free')), 5)
FROM profiles p
WHERE p.id IS NOT NULL
ON CONFLICT (user_id) DO NOTHING;

-- ============================================================
-- 5. PURCHASE SUBSCRIPTION V2
-- Implements all 6 cases from the spec
-- ============================================================
DROP FUNCTION IF EXISTS public.purchase_subscription(UUID, TEXT, TEXT, INTEGER);
DROP FUNCTION IF EXISTS public.purchase_subscription(UUID, TEXT, INTEGER, INTEGER, INTEGER);
DROP FUNCTION IF EXISTS public.purchase_subscription(UUID, TEXT, INTEGER, INTEGER, INTEGER, TEXT, INTEGER);
DROP FUNCTION IF EXISTS public.purchase_subscription(UUID, TEXT);

CREATE OR REPLACE FUNCTION public.purchase_subscription(
  p_user_id UUID,
  p_plan_type TEXT,
  p_payment_id TEXT DEFAULT NULL,
  p_amount INTEGER DEFAULT NULL
) RETURNS JSONB
SECURITY DEFINER SET search_path = public AS $$
DECLARE
  v_plan RECORD;
  v_state RECORD;
  v_current_tier TEXT;
  v_current_expiry TIMESTAMPTZ;
  v_new_expiry TIMESTAMPTZ;
  v_subscription_id UUID;
  v_initial_rec INTEGER := 0;
  v_initial_near INTEGER := 0;
  v_initial_daily INTEGER := 0;
  v_prev_plan RECORD;
  v_tier_order JSONB := '{"free":0,"silver":1,"gold":2,"platinum":3}'::JSONB;
BEGIN
  -- Validate plan
  IF p_plan_type IN ('free', 'non_premium') THEN
    RAISE EXCEPTION 'INVALID_PLAN: cannot purchase the free tier';
  END IF;

  -- Get plan config from subscription_plans
  SELECT * INTO v_plan FROM subscription_plans WHERE tier = p_plan_type;
  IF v_plan IS NULL THEN
    RAISE EXCEPTION 'INVALID_PLAN_TYPE: %', p_plan_type;
  END IF;

  -- Get user's current tier and distribution state
  SELECT tier, premium_expires_at INTO v_current_tier, v_current_expiry
  FROM profiles WHERE id = p_user_id;
  v_current_tier := COALESCE(v_current_tier, 'free');

  -- Ensure user_distribution_state exists
  INSERT INTO user_distribution_state (user_id, highest_tier_ever_reached, initial_distribution_granted_tiers,
    recommended_profiles_shown, nearby_profiles_shown, daily_profiles_shown)
  VALUES (p_user_id, 'free', ARRAY['free'], 5, 5, 5)
  ON CONFLICT (user_id) DO NOTHING;

  SELECT * INTO v_state FROM user_distribution_state WHERE user_id = p_user_id;

  -- Ensure user_wallet exists
  INSERT INTO user_wallet (user_id, contact_credits, interest_credits)
  VALUES (p_user_id, 0, 0)
  ON CONFLICT (user_id) DO NOTHING;

  -- ═══════════════════════════════════════════════════════════
  -- STEP 1: ALWAYS grant contact + interest credits (every purchase)
  -- ═══════════════════════════════════════════════════════════
  UPDATE user_wallet SET
    contact_credits = contact_credits + v_plan.contact_credits,
    interest_credits = interest_credits + v_plan.interest_credits,
    updated_at = NOW()
  WHERE user_id = p_user_id;

  -- Also update profiles for backwards compat (existing RPCs still read from here during transition)
  UPDATE profiles SET
    contacts_remaining = GREATEST(0, COALESCE(contacts_remaining, 0)) + v_plan.contact_credits,
    interests_remaining = GREATEST(0, COALESCE(interests_remaining, 0)) + v_plan.interest_credits
  WHERE id = p_user_id;

  -- ═══════════════════════════════════════════════════════════
  -- STEP 2: INITIAL DISTRIBUTION (only if tier not previously granted)
  -- ═══════════════════════════════════════════════════════════
  IF NOT (p_plan_type = ANY(v_state.initial_distribution_granted_tiers)) THEN
    -- This tier's initial profiles haven't been granted yet

    -- Check if this is an upgrade (need to grant only the delta)
    IF (v_tier_order->>v_current_tier)::INT < (v_tier_order->>p_plan_type)::INT
       AND v_current_tier != 'free'
       AND v_current_tier = ANY(v_state.initial_distribution_granted_tiers) THEN
      -- UPGRADE: grant difference between new tier and previous highest granted tier
      SELECT * INTO v_prev_plan FROM subscription_plans WHERE tier = v_state.highest_tier_ever_reached;

      v_initial_rec := GREATEST(0, v_plan.initial_recommended_profiles - COALESCE(v_prev_plan.initial_recommended_profiles, 0));
      v_initial_near := GREATEST(0, v_plan.initial_nearby_profiles - COALESCE(v_prev_plan.initial_nearby_profiles, 0));
      v_initial_daily := GREATEST(0, v_plan.initial_daily_profiles - COALESCE(v_prev_plan.initial_daily_profiles, 0));
    ELSE
      -- FIRST TIME (e.g. free → silver): grant full initial allocation
      v_initial_rec := v_plan.initial_recommended_profiles;
      v_initial_near := v_plan.initial_nearby_profiles;
      v_initial_daily := v_plan.initial_daily_profiles;
    END IF;

    -- Apply initial distribution
    UPDATE user_distribution_state SET
      recommended_profiles_shown = recommended_profiles_shown + v_initial_rec,
      nearby_profiles_shown = nearby_profiles_shown + v_initial_near,
      daily_profiles_shown = daily_profiles_shown + v_initial_daily,
      initial_distribution_granted_tiers = array_append(initial_distribution_granted_tiers, p_plan_type),
      highest_tier_ever_reached = CASE
        WHEN (v_tier_order->>p_plan_type)::INT > (v_tier_order->>COALESCE(highest_tier_ever_reached, 'free'))::INT
        THEN p_plan_type ELSE highest_tier_ever_reached
      END,
      updated_at = NOW()
    WHERE user_id = p_user_id;
  ELSE
    -- RENEWAL: tier already granted before, update highest_tier only if needed
    UPDATE user_distribution_state SET
      highest_tier_ever_reached = CASE
        WHEN (v_tier_order->>p_plan_type)::INT > (v_tier_order->>COALESCE(highest_tier_ever_reached, 'free'))::INT
        THEN p_plan_type ELSE highest_tier_ever_reached
      END,
      updated_at = NOW()
    WHERE user_id = p_user_id;
  END IF;

  -- ═══════════════════════════════════════════════════════════
  -- STEP 3: Update profile tier and expiry
  -- ═══════════════════════════════════════════════════════════
  IF v_current_expiry IS NOT NULL AND v_current_expiry > NOW() THEN
    v_new_expiry := v_current_expiry + (v_plan.duration_months || ' months')::INTERVAL;
  ELSE
    v_new_expiry := NOW() + (v_plan.duration_months || ' months')::INTERVAL;
  END IF;

  UPDATE profiles SET
    tier = p_plan_type,
    is_premium = true,
    is_verified = true,
    premium_expires_at = v_new_expiry
  WHERE id = p_user_id;

  -- ═══════════════════════════════════════════════════════════
  -- STEP 4: Create subscription record
  -- ═══════════════════════════════════════════════════════════
  INSERT INTO subscriptions (user_id, plan_type, status, amount, razorpay_payment_id,
    contacts_added, interests_added, starts_at, expires_at)
  VALUES (p_user_id, p_plan_type, 'active', COALESCE(p_amount, v_plan.price::INTEGER),
    p_payment_id, v_plan.contact_credits, v_plan.interest_credits, NOW(), v_new_expiry)
  RETURNING id INTO v_subscription_id;

  -- ═══════════════════════════════════════════════════════════
  -- STEP 5: Create payment record (if payment ID provided)
  -- ═══════════════════════════════════════════════════════════
  IF p_payment_id IS NOT NULL THEN
    INSERT INTO payments (
      user_id, subscription_id, plan_type, amount, tax, final_amount,
      payment_gateway, gateway_transaction_id, status
    ) VALUES (
      p_user_id, v_subscription_id, p_plan_type,
      COALESCE(p_amount, v_plan.price::INTEGER), 0, COALESCE(p_amount, v_plan.price::INTEGER),
      CASE WHEN p_payment_id LIKE 'pay_mock_%' THEN 'mock' ELSE 'razorpay' END,
      p_payment_id, 'success'
    );
  END IF;

  RETURN jsonb_build_object(
    'success', true,
    'tier', p_plan_type,
    'expires_at', v_new_expiry,
    'contacts_added', v_plan.contact_credits,
    'interests_added', v_plan.interest_credits,
    'initial_profiles_granted', v_initial_rec + v_initial_near + v_initial_daily
  );
END;
$$ LANGUAGE plpgsql;

-- ============================================================
-- 6. RUN DAILY DISTRIBUTION (called by Edge Function cron)
-- Adds daily increment for all users with active subscriptions
-- ============================================================
CREATE OR REPLACE FUNCTION public.run_daily_distribution()
RETURNS JSONB
SECURITY DEFINER SET search_path = public AS $$
DECLARE
  v_count INTEGER := 0;
  v_plan RECORD;
  v_today DATE := CURRENT_DATE;
BEGIN
  -- For each active premium user, add their tier's daily increment
  FOR v_plan IN
    SELECT p.id AS user_id, p.tier, sp.daily_recommended_increment, sp.daily_nearby_increment, sp.daily_profiles_increment
    FROM profiles p
    JOIN subscription_plans sp ON sp.tier = p.tier
    WHERE p.is_premium = true
      AND p.premium_expires_at > NOW()
      AND p.tier != 'free'
      AND sp.daily_recommended_increment + sp.daily_nearby_increment + sp.daily_profiles_increment > 0
  LOOP
    -- Ensure state row exists
    INSERT INTO user_distribution_state (user_id, highest_tier_ever_reached,
      initial_distribution_granted_tiers, recommended_profiles_shown, nearby_profiles_shown, daily_profiles_shown)
    VALUES (v_plan.user_id, v_plan.tier, ARRAY[v_plan.tier], 0, 0, 0)
    ON CONFLICT (user_id) DO NOTHING;

    -- Only add daily increment if not already distributed today
    UPDATE user_distribution_state SET
      recommended_profiles_shown = recommended_profiles_shown + v_plan.daily_recommended_increment,
      nearby_profiles_shown = nearby_profiles_shown + v_plan.daily_nearby_increment,
      daily_profiles_shown = daily_profiles_shown + v_plan.daily_profiles_increment,
      last_distribution_date = v_today,
      updated_at = NOW()
    WHERE user_id = v_plan.user_id
      AND (last_distribution_date IS NULL OR last_distribution_date < v_today);

    IF FOUND THEN
      v_count := v_count + 1;
    END IF;
  END LOOP;

  RETURN jsonb_build_object(
    'success', true,
    'users_updated', v_count,
    'run_date', v_today
  );
END;
$$ LANGUAGE plpgsql;

-- ============================================================
-- 7. UPDATED GET_USER_QUOTA (reads from new tables)
-- ============================================================
DROP FUNCTION IF EXISTS public.get_user_quota(UUID);

CREATE OR REPLACE FUNCTION public.get_user_quota(p_user_id UUID)
RETURNS JSONB
SECURITY DEFINER SET search_path = public AS $$
DECLARE
  v_prof RECORD;
  v_wallet RECORD;
  v_dist RECORD;
  v_plan RECORD;
  v_tier TEXT;
BEGIN
  SELECT tier, is_premium, premium_expires_at INTO v_prof FROM profiles WHERE id = p_user_id;

  IF v_prof IS NULL THEN
    RETURN jsonb_build_object('tier','FREE','contact_credits',0,'interest_credits',0,
      'recommended_limit',5,'nearby_limit',5,'daily_limit',5);
  END IF;

  -- Expire lapsed premium (self-healing)
  v_tier := COALESCE(v_prof.tier, 'free');
  IF v_prof.is_premium AND v_prof.premium_expires_at IS NOT NULL AND v_prof.premium_expires_at < NOW() THEN
    UPDATE profiles SET is_premium = false, tier = 'free' WHERE id = p_user_id;
    v_tier := 'free';
  END IF;

  -- Get wallet
  SELECT * INTO v_wallet FROM user_wallet WHERE user_id = p_user_id;

  -- Get distribution state
  SELECT * INTO v_dist FROM user_distribution_state WHERE user_id = p_user_id;

  -- Get plan config
  SELECT * INTO v_plan FROM subscription_plans WHERE tier = v_tier;

  RETURN jsonb_build_object(
    'tier', UPPER(v_tier),
    'is_premium', (v_tier <> 'free'),
    'expires_at', v_prof.premium_expires_at,
    'contact_credits', COALESCE(v_wallet.contact_credits, 0),
    'interest_credits', COALESCE(v_wallet.interest_credits, 0),
    -- Per-user distribution limits (these grow over time)
    'recommended_limit', COALESCE(v_dist.recommended_profiles_shown, COALESCE(v_plan.initial_recommended_profiles, 5)),
    'nearby_limit', COALESCE(v_dist.nearby_profiles_shown, COALESCE(v_plan.initial_nearby_profiles, 5)),
    'daily_limit', COALESCE(v_dist.daily_profiles_shown, COALESCE(v_plan.initial_daily_profiles, 5)),
    'dynamic_daily_enabled', true,
    -- Legacy compat fields
    'contacts_remaining', COALESCE(v_wallet.contact_credits, 0),
    'interests_remaining', COALESCE(v_wallet.interest_credits, 0)
  );
END;
$$ LANGUAGE plpgsql;

-- ============================================================
-- 8. UPDATE FEED RPCs TO USE user_distribution_state
-- ============================================================

-- 8a. get_recommended_profiles — reads per-user limit from user_distribution_state
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
  v RECORD; v_tier TEXT; v_limit INTEGER; p RECORD;
BEGIN
  SELECT me.gender, me.religion, me.caste, me.state, me.district, me.tier, me.date_of_birth
    INTO v FROM profiles me WHERE me.id = p_user_id;
  v_tier := COALESCE(v.tier, 'free');

  -- Read per-user limit from distribution state
  SELECT recommended_profiles_shown INTO v_limit
    FROM user_distribution_state WHERE user_id = p_user_id;

  -- Fallback to plan defaults if no state exists
  IF v_limit IS NULL THEN
    SELECT initial_recommended_profiles INTO v_limit FROM subscription_plans WHERE tier = v_tier;
  END IF;
  v_limit := COALESCE(v_limit, 5);

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
  ORDER BY compatibility_score DESC, pr.last_active_at DESC NULLS LAST
  LIMIT p_limit OFFSET p_offset;
END;
$$ LANGUAGE plpgsql;

-- 8b. get_nearby_profiles — reads per-user limit from user_distribution_state
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
  v RECORD; v_tier TEXT; v_limit INTEGER;
BEGIN
  SELECT me.gender, me.district, me.state, me.tier INTO v FROM profiles me WHERE me.id = p_user_id;
  v_tier := COALESCE(v.tier, 'free');

  -- Read per-user limit from distribution state
  SELECT nearby_profiles_shown INTO v_limit
    FROM user_distribution_state WHERE user_id = p_user_id;

  IF v_limit IS NULL THEN
    SELECT initial_nearby_profiles INTO v_limit FROM subscription_plans WHERE tier = v_tier;
  END IF;
  v_limit := COALESCE(v_limit, 5);

  p_limit := LEAST(p_limit, GREATEST(0, v_limit - p_offset));
  IF p_limit <= 0 THEN RETURN; END IF;

  RETURN QUERY
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
         )::INTEGER AS compatibility_score
  FROM profiles pr
  WHERE pr.is_active = true
    AND pr.id <> p_user_id
    AND pr.gender <> v.gender
    AND NOT public._feed_excluded(p_user_id, pr.id)
    AND (pr.district = v.district OR pr.state = v.state)
  ORDER BY compatibility_score DESC, pr.last_active_at DESC NULLS LAST
  LIMIT p_limit OFFSET p_offset;
END;
$$ LANGUAGE plpgsql;

-- 8c. get_daily_matches — reads per-user limit from user_distribution_state
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
  v RECORD; v_tier TEXT; v_limit INTEGER;
  v_seen UUID[]; v_today UUID[]; v_today_date DATE;
BEGIN
  SELECT me.gender, me.tier INTO v FROM profiles me WHERE me.id = p_user_id;
  v_tier := COALESCE(v.tier, 'free');

  -- Read per-user daily limit from distribution state
  SELECT daily_profiles_shown INTO v_limit
    FROM user_distribution_state WHERE user_id = p_user_id;

  IF v_limit IS NULL THEN
    SELECT initial_daily_profiles INTO v_limit FROM subscription_plans WHERE tier = v_tier;
  END IF;
  v_limit := COALESCE(v_limit, 5);

  -- Daily rotation window from user_profile_views
  SELECT profile_ids, todays_ids, todays_date
    INTO v_seen, v_today, v_today_date
    FROM user_profile_views WHERE user_id = p_user_id AND section = 'daily';
  v_seen := COALESCE(v_seen, ARRAY[]::UUID[]);

  -- If today's window expired, rotate
  IF v_today_date IS NULL OR v_today_date < CURRENT_DATE THEN
    v_today := ARRAY[]::UUID[];
  ELSE
    v_today := COALESCE(v_today, ARRAY[]::UUID[]);
  END IF;

  p_limit := LEAST(p_limit, GREATEST(0, v_limit - COALESCE(array_length(v_today, 1), 0) - p_offset));
  IF p_limit <= 0 THEN RETURN; END IF;

  RETURN QUERY
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
         )::INTEGER AS compatibility_score
  FROM profiles pr
  WHERE pr.is_active = true
    AND pr.id <> p_user_id
    AND pr.gender <> v.gender
    AND NOT (pr.id = ANY(v_seen))
    AND NOT (pr.id = ANY(v_today))
    AND NOT public._feed_excluded(p_user_id, pr.id)
  ORDER BY compatibility_score DESC, RANDOM()
  LIMIT p_limit;
END;
$$ LANGUAGE plpgsql;

-- ============================================================
-- 9. UPDATE CREDIT RPCs TO USE user_wallet
-- ============================================================

-- 9a. send_interest_with_quota — reads from user_wallet
DROP FUNCTION IF EXISTS public.send_interest_with_quota(UUID, UUID, TEXT);
DROP FUNCTION IF EXISTS public.send_interest_with_quota(UUID, UUID);

CREATE OR REPLACE FUNCTION public.send_interest_with_quota(
  p_sender_id UUID,
  p_receiver_id UUID,
  p_message TEXT DEFAULT NULL
) RETURNS JSONB
SECURITY DEFINER SET search_path = public AS $$
DECLARE
  v_credits INTEGER;
BEGIN
  IF p_sender_id = p_receiver_id THEN
    RAISE EXCEPTION 'SELF_INTEREST: cannot send interest to yourself';
  END IF;

  -- Ensure wallet exists
  INSERT INTO user_wallet (user_id) VALUES (p_sender_id) ON CONFLICT DO NOTHING;

  SELECT interest_credits INTO v_credits FROM user_wallet WHERE user_id = p_sender_id;

  IF COALESCE(v_credits, 0) <= 0 THEN
    RAISE EXCEPTION 'QUOTA_EXCEEDED: No interests remaining';
  END IF;

  -- Deduct from wallet
  UPDATE user_wallet SET
    interest_credits = interest_credits - 1,
    updated_at = NOW()
  WHERE user_id = p_sender_id;

  -- Also keep profiles in sync for backwards compat
  UPDATE profiles SET interests_remaining = GREATEST(0, interests_remaining - 1) WHERE id = p_sender_id;

  INSERT INTO interests (sender_id, receiver_id, status, message)
  VALUES (p_sender_id, p_receiver_id, 'pending', p_message)
  ON CONFLICT (sender_id, receiver_id) DO UPDATE SET status = 'pending';

  RETURN jsonb_build_object('success', true, 'reopened', false);
END;
$$ LANGUAGE plpgsql;

-- 9b. unlock_contact — reads from user_wallet
DROP FUNCTION IF EXISTS public.unlock_contact(UUID, UUID);

CREATE OR REPLACE FUNCTION public.unlock_contact(
  p_viewer_id UUID,
  p_viewed_id UUID
) RETURNS JSONB
SECURITY DEFINER SET search_path = public AS $$
DECLARE
  v_credits INTEGER;
  v_already BOOLEAN;
BEGIN
  SELECT EXISTS(SELECT 1 FROM contact_views WHERE viewer_id = p_viewer_id AND viewed_id = p_viewed_id)
    INTO v_already;

  IF v_already THEN
    RETURN jsonb_build_object('success', true, 'already_unlocked', true);
  END IF;

  -- Ensure wallet exists
  INSERT INTO user_wallet (user_id) VALUES (p_viewer_id) ON CONFLICT DO NOTHING;

  SELECT contact_credits INTO v_credits FROM user_wallet WHERE user_id = p_viewer_id;

  IF COALESCE(v_credits, 0) <= 0 THEN
    RAISE EXCEPTION 'QUOTA_EXCEEDED: No contacts remaining';
  END IF;

  -- Deduct from wallet
  UPDATE user_wallet SET
    contact_credits = contact_credits - 1,
    updated_at = NOW()
  WHERE user_id = p_viewer_id;

  -- Also keep profiles in sync for backwards compat
  UPDATE profiles SET contacts_remaining = GREATEST(0, contacts_remaining - 1) WHERE id = p_viewer_id;

  INSERT INTO contact_views (viewer_id, viewed_id) VALUES (p_viewer_id, p_viewed_id)
  ON CONFLICT (viewer_id, viewed_id) DO NOTHING;

  RETURN jsonb_build_object('success', true, 'already_unlocked', false);
END;
$$ LANGUAGE plpgsql;

-- ============================================================
-- 10. UPDATE ADMIN RPC (update_tier_settings → now also updates subscription_plans)
-- ============================================================
CREATE OR REPLACE FUNCTION public.update_subscription_plan(
  p_tier TEXT,
  p_price NUMERIC DEFAULT NULL,
  p_duration_months INTEGER DEFAULT NULL,
  p_contact_credits INTEGER DEFAULT NULL,
  p_interest_credits INTEGER DEFAULT NULL,
  p_initial_recommended INTEGER DEFAULT NULL,
  p_initial_nearby INTEGER DEFAULT NULL,
  p_initial_daily INTEGER DEFAULT NULL,
  p_daily_recommended INTEGER DEFAULT NULL,
  p_daily_nearby INTEGER DEFAULT NULL,
  p_daily_profiles INTEGER DEFAULT NULL,
  p_plan_name TEXT DEFAULT NULL,
  p_color_code TEXT DEFAULT NULL,
  p_is_popular BOOLEAN DEFAULT NULL,
  p_features JSONB DEFAULT NULL
) RETURNS VOID
SECURITY DEFINER SET search_path = public AS $$
BEGIN
  UPDATE subscription_plans SET
    price = COALESCE(p_price, price),
    duration_months = COALESCE(p_duration_months, duration_months),
    contact_credits = COALESCE(p_contact_credits, contact_credits),
    interest_credits = COALESCE(p_interest_credits, interest_credits),
    initial_recommended_profiles = COALESCE(p_initial_recommended, initial_recommended_profiles),
    initial_nearby_profiles = COALESCE(p_initial_nearby, initial_nearby_profiles),
    initial_daily_profiles = COALESCE(p_initial_daily, initial_daily_profiles),
    daily_recommended_increment = COALESCE(p_daily_recommended, daily_recommended_increment),
    daily_nearby_increment = COALESCE(p_daily_nearby, daily_nearby_increment),
    daily_profiles_increment = COALESCE(p_daily_profiles, daily_profiles_increment),
    plan_name = COALESCE(p_plan_name, plan_name),
    color_code = COALESCE(p_color_code, color_code),
    is_popular = COALESCE(p_is_popular, is_popular),
    features = COALESCE(p_features, features),
    updated_at = NOW()
  WHERE tier = p_tier;

  -- Also keep tier_settings in sync for any legacy reads
  UPDATE tier_settings SET
    recommended_limit = COALESCE(p_initial_recommended, recommended_limit),
    nearby_limit = COALESCE(p_initial_nearby, nearby_limit),
    daily_limit = COALESCE(p_initial_daily, daily_limit),
    plan_name = COALESCE(p_plan_name, plan_name),
    price_inr = COALESCE(p_price::INTEGER, price_inr),
    duration_months = COALESCE(p_duration_months, duration_months),
    contacts_limit = COALESCE(p_contact_credits, contacts_limit),
    interests_limit = COALESCE(p_interest_credits, interests_limit),
    color_code = COALESCE(p_color_code, color_code),
    is_popular = COALESCE(p_is_popular, is_popular),
    features = COALESCE(p_features, features),
    updated_at = NOW()
  WHERE tier = p_tier;
END;
$$ LANGUAGE plpgsql;
