-- ============================================================
-- WEDRING MATRIMONY — Admin V2 Migration
-- Distribution History, Payments Table, Force Push RPCs
-- ============================================================

-- ============================================================
-- 1. DISTRIBUTION SETTINGS HISTORY (Audit Trail)
-- ============================================================
CREATE TABLE IF NOT EXISTS public.distribution_settings_history (
  id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
  tier TEXT NOT NULL CHECK (tier IN ('free','silver','gold','platinum')),
  recommended_limit INTEGER NOT NULL,
  nearby_limit INTEGER NOT NULL,
  daily_limit INTEGER NOT NULL,
  previous_recommended INTEGER,
  previous_nearby INTEGER,
  previous_daily INTEGER,
  push_mode TEXT NOT NULL CHECK (push_mode IN ('tomorrow','now_tier','now_all')),
  effective_date DATE NOT NULL DEFAULT CURRENT_DATE,
  created_by TEXT NOT NULL,
  created_at TIMESTAMPTZ DEFAULT NOW()
);

ALTER TABLE public.distribution_settings_history ENABLE ROW LEVEL SECURITY;
CREATE POLICY "Admins can read distribution history" ON distribution_settings_history FOR SELECT USING (true);

-- ============================================================
-- 2. PAYMENTS TABLE (Enterprise Payment Tracking)
-- ============================================================
CREATE TABLE IF NOT EXISTS public.payments (
  id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
  user_id UUID REFERENCES public.profiles(id) ON DELETE SET NULL,
  subscription_id UUID REFERENCES public.subscriptions(id) ON DELETE SET NULL,
  plan_type TEXT NOT NULL,
  amount INTEGER NOT NULL DEFAULT 0,
  tax INTEGER NOT NULL DEFAULT 0,
  final_amount INTEGER NOT NULL DEFAULT 0,
  currency TEXT NOT NULL DEFAULT 'INR',
  payment_gateway TEXT NOT NULL DEFAULT 'razorpay' CHECK (payment_gateway IN ('razorpay','mock','manual','admin')),
  gateway_transaction_id TEXT,
  gateway_order_id TEXT,
  status TEXT NOT NULL DEFAULT 'pending' CHECK (status IN ('pending','success','failed','refunded','cancelled')),
  metadata JSONB DEFAULT '{}',
  created_at TIMESTAMPTZ DEFAULT NOW(),
  updated_at TIMESTAMPTZ DEFAULT NOW()
);

CREATE INDEX IF NOT EXISTS idx_payments_user_id ON payments(user_id);
CREATE INDEX IF NOT EXISTS idx_payments_status ON payments(status);
CREATE INDEX IF NOT EXISTS idx_payments_created_at ON payments(created_at DESC);
CREATE INDEX IF NOT EXISTS idx_payments_plan_type ON payments(plan_type);

ALTER TABLE public.payments ENABLE ROW LEVEL SECURITY;
CREATE POLICY "Users view own payments" ON payments FOR SELECT USING (auth.uid() = user_id);
CREATE POLICY "Admin full access payments" ON payments FOR ALL USING (true);

-- ============================================================
-- 3. FORCE PUSH DISTRIBUTION RPC
-- Clears user_profile_views for affected tier users so they
-- get fresh allocations on next app load.
-- ============================================================
CREATE OR REPLACE FUNCTION force_push_distribution(
  p_tier TEXT,
  p_admin_email TEXT
) RETURNS INTEGER AS $$
DECLARE
  v_affected INTEGER;
  v_rec INTEGER;
  v_near INTEGER;
  v_daily INTEGER;
BEGIN
  -- Get current settings for audit
  SELECT recommended_limit, nearby_limit, daily_limit
  INTO v_rec, v_near, v_daily
  FROM tier_settings WHERE tier = p_tier;

  -- Clear today's cached profile views for all users on this tier
  DELETE FROM user_profile_views
  WHERE user_id IN (
    SELECT id FROM profiles WHERE tier = p_tier
  )
  AND last_updated = CURRENT_DATE;

  GET DIAGNOSTICS v_affected = ROW_COUNT;

  -- Log the action
  INSERT INTO distribution_settings_history (
    tier, recommended_limit, nearby_limit, daily_limit,
    push_mode, effective_date, created_by
  ) VALUES (
    p_tier, v_rec, v_near, v_daily,
    'now_tier', CURRENT_DATE, p_admin_email
  );

  RETURN v_affected;
END;
$$ LANGUAGE plpgsql SECURITY DEFINER;

-- ============================================================
-- 4. FORCE PUSH ALL DISTRIBUTION RPC
-- ============================================================
CREATE OR REPLACE FUNCTION force_push_all_distribution(
  p_admin_email TEXT
) RETURNS INTEGER AS $$
DECLARE
  v_affected INTEGER;
  v_tier RECORD;
BEGIN
  -- Clear today's cached profile views for ALL users
  DELETE FROM user_profile_views
  WHERE last_updated = CURRENT_DATE;

  GET DIAGNOSTICS v_affected = ROW_COUNT;

  -- Log action for each tier
  FOR v_tier IN SELECT tier, recommended_limit, nearby_limit, daily_limit FROM tier_settings
  LOOP
    INSERT INTO distribution_settings_history (
      tier, recommended_limit, nearby_limit, daily_limit,
      push_mode, effective_date, created_by
    ) VALUES (
      v_tier.tier, v_tier.recommended_limit, v_tier.nearby_limit, v_tier.daily_limit,
      'now_all', CURRENT_DATE, p_admin_email
    );
  END LOOP;

  RETURN v_affected;
END;
$$ LANGUAGE plpgsql SECURITY DEFINER;

-- ============================================================
-- 5. SAVE DISTRIBUTION CHANGE (with history tracking)
-- ============================================================
CREATE OR REPLACE FUNCTION save_distribution_settings(
  p_tier TEXT,
  p_recommended INTEGER,
  p_nearby INTEGER,
  p_daily INTEGER,
  p_push_mode TEXT,
  p_admin_email TEXT
) RETURNS VOID AS $$
DECLARE
  v_prev_rec INTEGER;
  v_prev_near INTEGER;
  v_prev_daily INTEGER;
  v_effective DATE;
BEGIN
  -- Get previous values
  SELECT recommended_limit, nearby_limit, daily_limit
  INTO v_prev_rec, v_prev_near, v_prev_daily
  FROM tier_settings WHERE tier = p_tier;

  -- Determine effective date
  IF p_push_mode = 'tomorrow' THEN
    v_effective := CURRENT_DATE + 1;
  ELSE
    v_effective := CURRENT_DATE;
  END IF;

  -- Update tier_settings immediately (the limits table is always current)
  UPDATE tier_settings SET
    recommended_limit = p_recommended,
    nearby_limit = p_nearby,
    daily_limit = p_daily,
    updated_at = NOW()
  WHERE tier = p_tier;

  -- Record history
  INSERT INTO distribution_settings_history (
    tier, recommended_limit, nearby_limit, daily_limit,
    previous_recommended, previous_nearby, previous_daily,
    push_mode, effective_date, created_by
  ) VALUES (
    p_tier, p_recommended, p_nearby, p_daily,
    v_prev_rec, v_prev_near, v_prev_daily,
    p_push_mode, v_effective, p_admin_email
  );

  -- If pushing now for this tier, clear cached views
  IF p_push_mode = 'now_tier' THEN
    DELETE FROM user_profile_views
    WHERE user_id IN (SELECT id FROM profiles WHERE tier = p_tier)
    AND last_updated = CURRENT_DATE;
  ELSIF p_push_mode = 'now_all' THEN
    DELETE FROM user_profile_views
    WHERE last_updated = CURRENT_DATE;
  END IF;
END;
$$ LANGUAGE plpgsql SECURITY DEFINER;

-- ============================================================
-- 6. REVENUE STATS RPC
-- ============================================================
CREATE OR REPLACE FUNCTION get_revenue_stats()
RETURNS JSON AS $$
DECLARE
  v_total BIGINT;
  v_today BIGINT;
  v_month BIGINT;
  v_success_count INTEGER;
  v_failed_count INTEGER;
  v_refund_count INTEGER;
  v_plan_revenue JSON;
BEGIN
  SELECT COALESCE(SUM(final_amount), 0) INTO v_total
  FROM payments WHERE status = 'success';

  SELECT COALESCE(SUM(final_amount), 0) INTO v_today
  FROM payments WHERE status = 'success' AND created_at::DATE = CURRENT_DATE;

  SELECT COALESCE(SUM(final_amount), 0) INTO v_month
  FROM payments WHERE status = 'success'
  AND date_trunc('month', created_at) = date_trunc('month', CURRENT_DATE);

  SELECT COUNT(*) INTO v_success_count FROM payments WHERE status = 'success';
  SELECT COUNT(*) INTO v_failed_count FROM payments WHERE status = 'failed';
  SELECT COUNT(*) INTO v_refund_count FROM payments WHERE status = 'refunded';

  SELECT json_agg(row_to_json(t)) INTO v_plan_revenue FROM (
    SELECT plan_type, SUM(final_amount) as revenue, COUNT(*) as count
    FROM payments WHERE status = 'success'
    GROUP BY plan_type ORDER BY revenue DESC
  ) t;

  RETURN json_build_object(
    'total_revenue', v_total,
    'today_revenue', v_today,
    'monthly_revenue', v_month,
    'success_count', v_success_count,
    'failed_count', v_failed_count,
    'refund_count', v_refund_count,
    'plan_revenue', COALESCE(v_plan_revenue, '[]'::JSON)
  );
END;
$$ LANGUAGE plpgsql SECURITY DEFINER;

-- ============================================================
-- 7. ENHANCED PURCHASE SUBSCRIPTION (records payment)
-- Drop old version and recreate with payment tracking
-- ============================================================
DROP FUNCTION IF EXISTS purchase_subscription(UUID, TEXT, TEXT, INTEGER);
DROP FUNCTION IF EXISTS purchase_subscription(UUID, TEXT, INTEGER, INTEGER, INTEGER);
DROP FUNCTION IF EXISTS purchase_subscription(UUID, TEXT, INTEGER, INTEGER, INTEGER, TEXT, INTEGER);

CREATE OR REPLACE FUNCTION purchase_subscription(
  p_user_id UUID,
  p_plan_type TEXT,
  p_payment_id TEXT DEFAULT NULL,
  p_amount INTEGER DEFAULT NULL
) RETURNS UUID AS $$
DECLARE
  v_current_expiry TIMESTAMPTZ;
  v_new_expiry TIMESTAMPTZ;
  v_duration INTEGER;
  v_contacts INTEGER;
  v_interests INTEGER;
  v_subscription_id UUID;
  v_price INTEGER;
BEGIN
  -- Derive duration/contacts/interests from tier_settings (single source of truth)
  SELECT
    COALESCE(duration_months, 1) * 30,
    COALESCE(contacts_limit, 0),
    COALESCE(interests_limit, 0),
    COALESCE(price_inr, 0)
  INTO v_duration, v_contacts, v_interests, v_price
  FROM tier_settings WHERE tier = p_plan_type;

  IF v_duration IS NULL THEN
    RAISE EXCEPTION 'Invalid plan type: %', p_plan_type;
  END IF;

  -- Get current expiry for stacking
  SELECT premium_expires_at INTO v_current_expiry
  FROM profiles WHERE id = p_user_id;

  IF v_current_expiry IS NOT NULL AND v_current_expiry > NOW() THEN
    v_new_expiry := v_current_expiry + (v_duration || ' days')::INTERVAL;
  ELSE
    v_new_expiry := NOW() + (v_duration || ' days')::INTERVAL;
  END IF;

  -- Update Profile
  UPDATE profiles SET
    tier = p_plan_type,
    is_premium = true,
    is_verified = true,
    premium_expires_at = v_new_expiry,
    contacts_remaining = contacts_remaining + v_contacts,
    interests_remaining = interests_remaining + v_interests
  WHERE id = p_user_id;

  -- Create Subscription Record
  INSERT INTO subscriptions (user_id, plan_type, amount, contacts_added, interests_added, expires_at, status)
  VALUES (p_user_id, p_plan_type, COALESCE(p_amount, v_price), v_contacts, v_interests, v_new_expiry, 'active')
  RETURNING id INTO v_subscription_id;

  -- Create Payment Record (if payment ID provided)
  IF p_payment_id IS NOT NULL THEN
    INSERT INTO payments (
      user_id, subscription_id, plan_type, amount, tax, final_amount,
      payment_gateway, gateway_transaction_id, status
    ) VALUES (
      p_user_id, v_subscription_id, p_plan_type,
      COALESCE(p_amount, v_price), 0, COALESCE(p_amount, v_price),
      CASE WHEN p_payment_id LIKE 'pay_mock_%' THEN 'mock' ELSE 'razorpay' END,
      p_payment_id, 'success'
    );
  END IF;

  RETURN v_subscription_id;
END;
$$ LANGUAGE plpgsql SECURITY DEFINER;
