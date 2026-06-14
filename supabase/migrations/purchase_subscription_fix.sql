-- Update purchase_subscription to accept payment tracking details
CREATE OR REPLACE FUNCTION purchase_subscription(
  p_user_id UUID, 
  p_plan_type TEXT,
  p_payment_id TEXT DEFAULT NULL,
  p_amount NUMERIC DEFAULT 0
)
RETURNS BOOLEAN AS $$
DECLARE
  v_limits JSONB;
  v_contacts_add INTEGER;
  v_interests_add INTEGER;
  v_validity_days INTEGER;
  v_existing_expires_at TIMESTAMPTZ;
  v_new_expires_at TIMESTAMPTZ;
BEGIN
  -- A) Fetch the limits/rewards for this plan from admin settings
  SELECT setting_value->p_plan_type INTO v_limits
  FROM admin_settings WHERE setting_key = 'matches_limits';
  
  IF v_limits IS NULL THEN
    RAISE EXCEPTION 'INVALID_PLAN_TYPE';
  END IF;

  v_contacts_add := COALESCE((v_limits->>'contacts')::INTEGER, 0);
  v_interests_add := COALESCE((v_limits->>'interests')::INTEGER, 0);
  v_validity_days := COALESCE((v_limits->>'validity_days')::INTEGER, 30);

  -- B) Find existing active subscription expiration to STACK validity
  SELECT expires_at INTO v_existing_expires_at
  FROM public.subscriptions
  WHERE user_id = p_user_id AND status = 'active' AND expires_at > NOW()
  ORDER BY expires_at DESC LIMIT 1;

  IF v_existing_expires_at IS NOT NULL THEN
    -- Stack validity on top of current remaining days
    v_new_expires_at := v_existing_expires_at + (v_validity_days || ' days')::INTERVAL;
  ELSE
    -- Start from today
    v_new_expires_at := NOW() + (v_validity_days || ' days')::INTERVAL;
  END IF;

  -- C) Create the Subscription Record with payment tracking
  INSERT INTO public.subscriptions (user_id, plan_type, status, starts_at, expires_at, payment_id, amount)
  VALUES (p_user_id, p_plan_type, 'active', NOW(), v_new_expires_at, p_payment_id, p_amount);

  -- D) Mark profile as premium and STACK balances
  UPDATE public.profiles
  SET 
    is_premium = true,
    contacts_balance = CASE 
      WHEN contacts_balance = -1 OR v_contacts_add = -1 THEN -1 
      ELSE GREATEST(0, contacts_balance) + v_contacts_add 
    END,
    interests_balance = CASE 
      WHEN interests_balance = -1 OR v_interests_add = -1 THEN -1 
      ELSE GREATEST(0, interests_balance) + v_interests_add 
    END
  WHERE id = p_user_id;

  RETURN true;
END;
$$ LANGUAGE plpgsql SECURITY DEFINER;
