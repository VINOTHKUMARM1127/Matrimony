-- ============================================================
-- DYNAMIC PREMIUM PLANS SCHEMA UPDATE
-- Run this in your Supabase SQL Editor
-- ============================================================

-- 1. Add new columns to tier_settings
ALTER TABLE public.tier_settings 
ADD COLUMN IF NOT EXISTS plan_name TEXT,
ADD COLUMN IF NOT EXISTS price_inr INTEGER,
ADD COLUMN IF NOT EXISTS duration_months INTEGER,
ADD COLUMN IF NOT EXISTS contacts_limit INTEGER,
ADD COLUMN IF NOT EXISTS interests_limit INTEGER,
ADD COLUMN IF NOT EXISTS features JSONB,
ADD COLUMN IF NOT EXISTS color_code TEXT,
ADD COLUMN IF NOT EXISTS is_popular BOOLEAN DEFAULT false;

-- 2. Update default data for existing tiers
UPDATE public.tier_settings SET 
  plan_name = 'Free', 
  price_inr = 0, 
  duration_months = 0, 
  contacts_limit = 0, 
  interests_limit = 0, 
  features = '[]'::jsonb, 
  color_code = '#AAAAAA', 
  is_popular = false
WHERE tier = 'free';

UPDATE public.tier_settings SET 
  plan_name = 'Silver', 
  price_inr = 499, 
  duration_months = 1, 
  contacts_limit = 30, 
  interests_limit = 50, 
  features = '["View 30 contact numbers", "Send up to 50 interests", "Premium verified badge", "Priority customer support"]'::jsonb, 
  color_code = '#8A8A8A', 
  is_popular = false
WHERE tier = 'silver';

UPDATE public.tier_settings SET 
  plan_name = 'Gold', 
  price_inr = 999, 
  duration_months = 1, 
  contacts_limit = 50, 
  interests_limit = 100, 
  features = '["View 50 contact numbers", "Send up to 100 interests", "Premium verified badge", "Priority customer support"]'::jsonb, 
  color_code = '#D4AF37', 
  is_popular = true
WHERE tier = 'gold';

UPDATE public.tier_settings SET 
  plan_name = 'Platinum', 
  price_inr = 2499, 
  duration_months = 3, 
  contacts_limit = 100, 
  interests_limit = 300, 
  features = '["View 100 contact numbers", "Send up to 300 interests", "Premium verified badge", "Priority customer support"]'::jsonb, 
  color_code = '#E5E4E2', 
  is_popular = false
WHERE tier = 'platinum';

-- 3. Replace the purchase_subscription RPC to look up dynamic limits
CREATE OR REPLACE FUNCTION purchase_subscription(
  p_user_id UUID,
  p_plan_type TEXT,
  p_payment_id TEXT,
  p_amount INTEGER
) RETURNS VOID AS $$
DECLARE
  v_current_expiry TIMESTAMPTZ;
  v_new_expiry TIMESTAMPTZ;
  v_duration_months INTEGER;
  v_contacts INTEGER;
  v_interests INTEGER;
BEGIN
  -- Look up plan details from dynamic tier settings
  SELECT duration_months, contacts_limit, interests_limit 
  INTO v_duration_months, v_contacts, v_interests
  FROM tier_settings WHERE tier = p_plan_type;

  IF v_duration_months IS NULL THEN
    RAISE EXCEPTION 'Invalid plan type provided';
  END IF;

  -- Get current expiry if they are already on a premium plan
  SELECT premium_expires_at INTO v_current_expiry
  FROM profiles WHERE id = p_user_id;

  -- Stacking logic
  IF v_current_expiry IS NOT NULL AND v_current_expiry > NOW() THEN
    v_new_expiry := v_current_expiry + (v_duration_months || ' months')::INTERVAL;
  ELSE
    v_new_expiry := NOW() + (v_duration_months || ' months')::INTERVAL;
  END IF;

  -- Update Profile
  UPDATE profiles
  SET 
    tier = p_plan_type,
    is_premium = true,
    is_verified = true,
    premium_expires_at = v_new_expiry,
    contacts_remaining = contacts_remaining + v_contacts,
    interests_remaining = interests_remaining + v_interests
  WHERE id = p_user_id;

  -- Log Transaction
  INSERT INTO subscriptions (user_id, plan_type, razorpay_payment_id, amount, contacts_added, interests_added, expires_at)
  VALUES (p_user_id, p_plan_type, p_payment_id, p_amount, v_contacts, v_interests, v_new_expiry);
END;
$$ LANGUAGE plpgsql SECURITY DEFINER;

-- 4. Replace update_tier_settings RPC to support new dynamic fields
CREATE OR REPLACE FUNCTION update_tier_settings(
  p_tier TEXT,
  p_rec INT,
  p_near INT,
  p_daily INT,
  p_dyn BOOLEAN,
  p_plan_name TEXT DEFAULT NULL,
  p_price_inr INT DEFAULT NULL,
  p_duration_months INT DEFAULT NULL,
  p_contacts_limit INT DEFAULT NULL,
  p_interests_limit INT DEFAULT NULL,
  p_features JSONB DEFAULT NULL,
  p_color_code TEXT DEFAULT NULL,
  p_is_popular BOOLEAN DEFAULT NULL
)
RETURNS VOID
SECURITY DEFINER
SET search_path = public
AS $$
BEGIN
  UPDATE public.tier_settings 
  SET 
    recommended_limit = COALESCE(p_rec, recommended_limit),
    nearby_limit = COALESCE(p_near, nearby_limit),
    daily_limit = COALESCE(p_daily, daily_limit),
    dynamic_daily_enabled = COALESCE(p_dyn, dynamic_daily_enabled),
    plan_name = COALESCE(p_plan_name, plan_name),
    price_inr = COALESCE(p_price_inr, price_inr),
    duration_months = COALESCE(p_duration_months, duration_months),
    contacts_limit = COALESCE(p_contacts_limit, contacts_limit),
    interests_limit = COALESCE(p_interests_limit, interests_limit),
    features = COALESCE(p_features, features),
    color_code = COALESCE(p_color_code, color_code),
    is_popular = COALESCE(p_is_popular, is_popular),
    updated_at = NOW()
  WHERE tier = p_tier;
END;
$$ LANGUAGE plpgsql;
