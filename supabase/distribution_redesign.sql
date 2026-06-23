-- 1. DROP OBSOLETE FUNCTIONS
DROP FUNCTION IF EXISTS public.get_recommended_profiles(UUID, INTEGER, INTEGER) CASCADE;
DROP FUNCTION IF EXISTS public.get_nearby_profiles(UUID, INTEGER, INTEGER) CASCADE;
DROP FUNCTION IF EXISTS public.get_daily_matches(UUID, INTEGER, INTEGER) CASCADE;
DROP FUNCTION IF EXISTS public.feed_allocation(UUID, TEXT, INTEGER, UUID[]) CASCADE;
DROP FUNCTION IF EXISTS public.run_daily_distribution() CASCADE;

-- 2. CREATE NEW FEED READ FUNCTIONS
-- Reads directly from the user_profile_pool table.

CREATE OR REPLACE FUNCTION public.get_all_matches(
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
BEGIN
  RETURN QUERY
  SELECT pr.id, pr.id::TEXT AS profile_id, pr.name AS display_name, pr.gender, pr.date_of_birth,
         pr.height_cm, pr.marital_status, pr.religion, pr.caste,
         pr.city, pr.district, pr.state, pr.education, pr.occupation,
         pr.annual_income, pr.food_habit, pr.about_me, u.is_verified,
         pr.is_premium, pr.tier, pr.last_active_at, pr.profile_completion,
         pool.compatibility_score,
         (pool.added_at > NOW() - INTERVAL '24 hours') AS is_new_today
  FROM user_profile_pool pool
  JOIN profiles pr ON pr.id = pool.profile_id
  JOIN users u ON u.id = pr.id
  WHERE pool.user_id = p_user_id AND pool.section = 'all_matches' AND pr.is_active = true
  ORDER BY pool.compatibility_score DESC, pool.added_at DESC
  LIMIT p_limit OFFSET p_offset;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION public.get_daily_updates(
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
BEGIN
  RETURN QUERY
  SELECT pr.id, pr.id::TEXT AS profile_id, pr.name AS display_name, pr.gender, pr.date_of_birth,
         pr.height_cm, pr.marital_status, pr.religion, pr.caste,
         pr.city, pr.district, pr.state, pr.education, pr.occupation,
         pr.annual_income, pr.food_habit, pr.about_me, u.is_verified,
         pr.is_premium, pr.tier, pr.last_active_at, pr.profile_completion,
         pool.compatibility_score,
         (pool.added_at > NOW() - INTERVAL '24 hours') AS is_new_today
  FROM user_profile_pool pool
  JOIN profiles pr ON pr.id = pool.profile_id
  JOIN users u ON u.id = pr.id
  WHERE pool.user_id = p_user_id AND pool.section = 'daily_updates' AND pr.is_active = true
  ORDER BY pool.added_at DESC, pool.compatibility_score DESC
  LIMIT p_limit OFFSET p_offset;
END;
$$ LANGUAGE plpgsql;


-- 3. INITIAL DISTRIBUTION FUNCTION (Runs when upgrading free->premium)
CREATE OR REPLACE FUNCTION public.distribute_initial_profiles(p_user_id UUID)
RETURNS void
SECURITY DEFINER SET search_path = public AS $$
DECLARE
  v_tier TEXT;
  v_initial_all_matches INTEGER;
  v_initial_daily_updates INTEGER;
BEGIN
  -- Get user tier
  SELECT tier INTO v_tier FROM profiles WHERE id = p_user_id;
  v_tier := COALESCE(v_tier, 'free');

  -- Get limits from subscription_plans
  SELECT initial_recommended_profiles, initial_daily_profiles INTO v_initial_all_matches, v_initial_daily_updates
  FROM subscription_plans WHERE tier = v_tier;

  -- Only distribute if limit > 0
  IF COALESCE(v_initial_all_matches, 0) > 0 THEN
    PERFORM distribute_profiles_for_user(p_user_id, v_initial_all_matches, 'all_matches');
  END IF;

  IF COALESCE(v_initial_daily_updates, 0) > 0 THEN
    PERFORM distribute_profiles_for_user(p_user_id, v_initial_daily_updates, 'daily_updates');
  END IF;
END;
$$ LANGUAGE plpgsql;

-- 4. UPDATE DAILY DISTRIBUTION CRON
CREATE OR REPLACE FUNCTION public.run_daily_distribution()
RETURNS json
SECURITY DEFINER SET search_path = public AS $$
DECLARE
  usr RECORD;
  active_sub RECORD;
  dist_settings RECORD;
  users_updated int := 0;
BEGIN
  -- For each premium user with an active subscription
  FOR usr IN 
    SELECT p.id, p.tier 
    FROM public.profiles p
    WHERE p.is_premium = true AND p.is_active = true
  LOOP
    -- Get daily limits for their tier
    SELECT daily_recommended_increment, daily_profiles_increment INTO dist_settings
    FROM public.subscription_plans WHERE tier = usr.tier;
    
    IF FOUND THEN
      IF COALESCE(dist_settings.daily_recommended_increment, 0) > 0 THEN
        PERFORM distribute_profiles_for_user(usr.id, dist_settings.daily_recommended_increment, 'all_matches');
      END IF;
      
      IF COALESCE(dist_settings.daily_profiles_increment, 0) > 0 THEN
        PERFORM distribute_profiles_for_user(usr.id, dist_settings.daily_profiles_increment, 'daily_updates');
      END IF;
      
      users_updated := users_updated + 1;
    END IF;
  END LOOP;
  
  RETURN json_build_object('success', true, 'users_updated', users_updated, 'run_date', CURRENT_DATE);
END;
$$ LANGUAGE plpgsql;

-- 5. MANUAL PUSH FUNCTION
CREATE OR REPLACE FUNCTION public.manual_push_to_users(
  p_target_type text,   -- 'all', 'tier', 'user'
  p_target_val text,    -- null, 'silver'/'gold'/'platinum', or user_id UUID string
  p_all_matches_count int,
  p_daily_count int
)
RETURNS json
SECURITY DEFINER SET search_path = public AS $$
DECLARE
  usr RECORD;
  users_processed int := 0;
BEGIN
  -- Prevent negative limits
  IF p_all_matches_count < 0 OR p_daily_count < 0 THEN
    RETURN json_build_object('success', false, 'error', 'Counts cannot be negative');
  END IF;

  IF p_target_type = 'all' THEN
    FOR usr IN SELECT id FROM profiles WHERE is_active = true LOOP
      IF p_all_matches_count > 0 THEN PERFORM distribute_profiles_for_user(usr.id, p_all_matches_count, 'all_matches'); END IF;
      IF p_daily_count > 0 THEN PERFORM distribute_profiles_for_user(usr.id, p_daily_count, 'daily_updates'); END IF;
      users_processed := users_processed + 1;
    END LOOP;
  ELSIF p_target_type = 'tier' THEN
    FOR usr IN SELECT id FROM profiles WHERE tier = p_target_val AND is_active = true LOOP
      IF p_all_matches_count > 0 THEN PERFORM distribute_profiles_for_user(usr.id, p_all_matches_count, 'all_matches'); END IF;
      IF p_daily_count > 0 THEN PERFORM distribute_profiles_for_user(usr.id, p_daily_count, 'daily_updates'); END IF;
      users_processed := users_processed + 1;
    END LOOP;
  ELSIF p_target_type = 'user' THEN
    FOR usr IN SELECT id FROM profiles WHERE id = p_target_val::uuid LOOP
      IF p_all_matches_count > 0 THEN PERFORM distribute_profiles_for_user(usr.id, p_all_matches_count, 'all_matches'); END IF;
      IF p_daily_count > 0 THEN PERFORM distribute_profiles_for_user(usr.id, p_daily_count, 'daily_updates'); END IF;
      users_processed := users_processed + 1;
    END LOOP;
  ELSE
    RETURN json_build_object('success', false, 'error', 'Invalid target_type');
  END IF;

  RETURN json_build_object('success', true, 'users_processed', users_processed);
END;
$$ LANGUAGE plpgsql;

-- Make sure user_profile_pool section only allows correct values if there's a check constraint
-- ALTER TABLE public.user_profile_pool DROP CONSTRAINT IF EXISTS user_profile_pool_section_check;
-- ALTER TABLE public.user_profile_pool ADD CONSTRAINT user_profile_pool_section_check CHECK (section IN ('all_matches', 'daily_updates'));

-- Re-assign permissions
GRANT EXECUTE ON FUNCTION public.get_all_matches(UUID, INTEGER, INTEGER) TO authenticated, anon, service_role;
GRANT EXECUTE ON FUNCTION public.get_daily_updates(UUID, INTEGER, INTEGER) TO authenticated, anon, service_role;
GRANT EXECUTE ON FUNCTION public.distribute_initial_profiles(UUID) TO authenticated, service_role;
GRANT EXECUTE ON FUNCTION public.run_daily_distribution() TO authenticated, service_role;
GRANT EXECUTE ON FUNCTION public.manual_push_to_users(text, text, int, int) TO authenticated, service_role;

NOTIFY pgrst, 'reload schema';


-- 5. UPDATE SUBSCRIPTION PLAN RPC TO ALSO UPDATE profile_distribution TABLE
CREATE OR REPLACE FUNCTION public.update_subscription_plan(
    p_tier TEXT,
    p_plan_name TEXT DEFAULT NULL,
    p_price_inr INTEGER DEFAULT NULL,
    p_duration_months INTEGER DEFAULT NULL,
    p_contacts_limit INTEGER DEFAULT NULL,
    p_interests_limit INTEGER DEFAULT NULL,
    p_initial_recommended_profiles INTEGER DEFAULT NULL,
    p_initial_nearby_profiles INTEGER DEFAULT NULL,
    p_initial_daily_profiles INTEGER DEFAULT NULL,
    p_daily_recommended_increment INTEGER DEFAULT NULL,
    p_daily_nearby_increment INTEGER DEFAULT NULL,
    p_daily_profiles_increment INTEGER DEFAULT NULL,
    p_features JSONB DEFAULT NULL,
    p_color_code TEXT DEFAULT NULL,
    p_is_popular BOOLEAN DEFAULT NULL
  ) RETURNS VOID
  SECURITY DEFINER SET search_path = public AS $$
  BEGIN
    UPDATE public.subscription_plans SET
      plan_name = COALESCE(p_plan_name, plan_name),
      price_inr = COALESCE(p_price_inr, price_inr),
      duration_months = COALESCE(p_duration_months, duration_months),
      contacts_limit = COALESCE(p_contacts_limit, contacts_limit),
      interests_limit = COALESCE(p_interests_limit, interests_limit),
      initial_recommended_profiles = COALESCE(p_initial_recommended_profiles, initial_recommended_profiles),
      initial_nearby_profiles = COALESCE(p_initial_nearby_profiles, initial_nearby_profiles),
      initial_daily_profiles = COALESCE(p_initial_daily_profiles, initial_daily_profiles),
      daily_recommended_increment = COALESCE(p_daily_recommended_increment, daily_recommended_increment),
      daily_nearby_increment = COALESCE(p_daily_nearby_increment, daily_nearby_increment),
      daily_profiles_increment = COALESCE(p_daily_profiles_increment, daily_profiles_increment),
      features = COALESCE(p_features, features),
      color_code = COALESCE(p_color_code, color_code),
      is_popular = COALESCE(p_is_popular, is_popular),
      updated_at = NOW()
    WHERE tier = p_tier;

    -- Also update profile_distribution so the old references sync properly
    UPDATE public.profile_distribution SET
      initial_all_matches = COALESCE(p_initial_recommended_profiles, initial_all_matches),
      initial_new_profiles = COALESCE(p_initial_daily_profiles, initial_new_profiles),
      daily_all_matches = COALESCE(p_daily_recommended_increment, daily_all_matches),
      daily_new_profiles = COALESCE(p_daily_profiles_increment, daily_new_profiles),
      updated_at = NOW()
    WHERE tier = p_tier;
  END;
  $$ LANGUAGE plpgsql;




-- 6. BACKFILL EXISTING USERS
-- This ensures all current users (especially Free users) receive their initial profile distribution
-- in the new user_profile_pool table so their matches page isn't empty.
DO $$
DECLARE
  usr RECORD;
BEGIN
  FOR usr IN
    SELECT p.id 
    FROM public.profiles p
    WHERE p.is_active = true 
      AND NOT EXISTS (
        SELECT 1 FROM public.user_profile_pool up WHERE up.user_id = p.id LIMIT 1
      )
  LOOP
    PERFORM public.distribute_initial_profiles(usr.id);
  END LOOP;
END;
$$ LANGUAGE plpgsql;

-- Force schema reload again just in case
NOTIFY pgrst, 'reload schema';



-- 7. CREATE MISSING SUBSCRIPTIONS AND PAYMENTS TABLES
-- The purchase_subscription function relies on these tables which were missing.
CREATE TABLE IF NOT EXISTS public.subscriptions (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    user_id UUID REFERENCES public.users(id) ON DELETE CASCADE,
    plan_type TEXT NOT NULL,
    status TEXT DEFAULT 'active',
    amount INTEGER DEFAULT 0,
    razorpay_payment_id TEXT,
    contacts_added INTEGER DEFAULT 0,
    interests_added INTEGER DEFAULT 0,
    starts_at TIMESTAMPTZ DEFAULT now(),
    expires_at TIMESTAMPTZ,
    created_at TIMESTAMPTZ DEFAULT now(),
    updated_at TIMESTAMPTZ DEFAULT now()
);

CREATE TABLE IF NOT EXISTS public.payments (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    user_id UUID REFERENCES public.users(id) ON DELETE CASCADE,
    subscription_id UUID REFERENCES public.subscriptions(id) ON DELETE CASCADE,
    plan_type TEXT NOT NULL,
    amount INTEGER DEFAULT 0,
    tax INTEGER DEFAULT 0,
    final_amount INTEGER DEFAULT 0,
    payment_gateway TEXT,
    gateway_transaction_id TEXT,
    status TEXT DEFAULT 'success',
    created_at TIMESTAMPTZ DEFAULT now()
);

-- Ensure permissions for the tables
GRANT ALL ON TABLE public.subscriptions TO authenticated, service_role;
GRANT ALL ON TABLE public.payments TO authenticated, service_role;



-- 8. OVERRIDE PURCHASE_SUBSCRIPTION TO SUPPORT ADMIN UPGRADES
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

  -- Credits + initial distribution are ALWAYS granted at purchase time.
  PERFORM public._grant_plan_benefits(p_user_id, p_plan_type);

  -- Record the purchase (audit/history).
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
      CASE 
        WHEN p_payment_id LIKE 'pay_mock_%' THEN 'mock' 
        WHEN p_payment_id = 'Admin_Upgrade' THEN 'admin'
        ELSE 'razorpay' 
      END,
      p_payment_id, 'success');
  END IF;

  IF NOT v_cur_active OR v_new_rank > v_cur_rank THEN
    -- ACTIVATE NOW. If a lower tier was running, PAUSE it (bank remaining days).
    IF v_cur_active AND v_new_rank > v_cur_rank AND v_prof.tier IS NOT NULL AND v_prof.tier <> 'free' THEN
      v_remaining := GREATEST(0, CEIL(EXTRACT(EPOCH FROM (v_prof.premium_expires_at - NOW())) / 86400)::INT);
      IF v_remaining > 0 THEN
        INSERT INTO subscription_queue (user_id, plan_tier, remaining_days, duration_months, status)
        VALUES (p_user_id, v_prof.tier, v_remaining, NULL, 'paused');
      END IF;
    END IF;

    v_new_expiry := NOW() + (v_plan.duration_months || ' months')::INTERVAL;
    UPDATE profiles SET
      tier = p_plan_type, is_premium = true,
      premium_expires_at = v_new_expiry
    WHERE id = p_user_id;
    v_activated := true;
  ELSE
    -- Queue it if extending same or lower tier
    UPDATE subscriptions SET status = 'queued' WHERE id = v_sub_id;
    INSERT INTO subscription_queue (user_id, plan_tier, remaining_days, duration_months, status)
    VALUES (p_user_id, p_plan_type, NULL, v_plan.duration_months, 'pending');
    v_new_expiry := v_prof.premium_expires_at;
    v_activated  := false;
    v_queued     := true;
  END IF;

  RETURN json_build_object(
    'success', true,
    'activated', v_activated,
    'queued', v_queued,
    'new_tier', CASE WHEN v_activated THEN p_plan_type ELSE v_prof.tier END,
    'new_expiry', v_new_expiry
  );
END;
$$ LANGUAGE plpgsql;

-- Reset API schema again
NOTIFY pgrst, 'reload schema';



-- 9. ADD distribute_initial_profiles TO purchase_subscription
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

  -- Credits + initial distribution are ALWAYS granted at purchase time.
  PERFORM public._grant_plan_benefits(p_user_id, p_plan_type);
  PERFORM public.distribute_initial_profiles(p_user_id);

  -- Record the purchase (audit/history).
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
      CASE 
        WHEN p_payment_id LIKE 'pay_mock_%' THEN 'mock' 
        WHEN p_payment_id = 'Admin_Upgrade' THEN 'admin'
        ELSE 'razorpay' 
      END,
      p_payment_id, 'success');
  END IF;

  IF NOT v_cur_active OR v_new_rank > v_cur_rank THEN
    -- ACTIVATE NOW. If a lower tier was running, PAUSE it (bank remaining days).
    IF v_cur_active AND v_new_rank > v_cur_rank AND v_prof.tier IS NOT NULL AND v_prof.tier <> 'free' THEN
      v_remaining := GREATEST(0, CEIL(EXTRACT(EPOCH FROM (v_prof.premium_expires_at - NOW())) / 86400)::INT);
      IF v_remaining > 0 THEN
        INSERT INTO subscription_queue (user_id, plan_tier, remaining_days, duration_months, status)
        VALUES (p_user_id, v_prof.tier, v_remaining, NULL, 'paused');
      END IF;
    END IF;

    v_new_expiry := NOW() + (v_plan.duration_months || ' months')::INTERVAL;
    UPDATE profiles SET
      tier = p_plan_type, is_premium = true,
      premium_expires_at = v_new_expiry
    WHERE id = p_user_id;
    v_activated := true;
  ELSE
    -- Queue it if extending same or lower tier
    UPDATE subscriptions SET status = 'queued' WHERE id = v_sub_id;
    INSERT INTO subscription_queue (user_id, plan_tier, remaining_days, duration_months, status)
    VALUES (p_user_id, p_plan_type, NULL, v_plan.duration_months, 'pending');
    v_new_expiry := v_prof.premium_expires_at;
    v_activated  := false;
    v_queued     := true;
  END IF;

  RETURN json_build_object(
    'success', true,
    'activated', v_activated,
    'queued', v_queued,
    'new_tier', CASE WHEN v_activated THEN p_plan_type ELSE v_prof.tier END,
    'new_expiry', v_new_expiry
  );
END;
$$ LANGUAGE plpgsql;

-- Reset API schema again
NOTIFY pgrst, 'reload schema';

