-- ==============================================================================
-- PREMIUM STACKING, WALLET BALANCES, AND ADMIN LIMITS
-- ==============================================================================

-- 1. Add Wallet Balances to Profiles
ALTER TABLE public.profiles ADD COLUMN IF NOT EXISTS contacts_balance INTEGER DEFAULT 0;
ALTER TABLE public.profiles ADD COLUMN IF NOT EXISTS interests_balance INTEGER DEFAULT 0;

-- 2. Add Admin Settings for Daily Global Limits and Quotas
UPDATE public.admin_settings
SET setting_value = '{
  "non_premium": { "contacts": 0, "interests": 0, "validity_days": 0, "recommended": 25, "nearby": 25 },
  "silver": { "contacts": 30, "interests": 50, "validity_days": 30, "recommended": 50, "nearby": 50 },
  "gold": { "contacts": 50, "interests": 250, "validity_days": 30, "recommended": 100, "nearby": 100 },
  "platinum": { "contacts": 100, "interests": -1, "validity_days": 90, "recommended": 200, "nearby": 200 }
}'::jsonb
WHERE setting_key = 'matches_limits';


-- 3. Core RPC to Purchase/Stack Subscription
CREATE OR REPLACE FUNCTION purchase_subscription(p_user_id UUID, p_plan_type TEXT)
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

  -- C) Create the Subscription Record
  INSERT INTO public.subscriptions (user_id, plan_type, status, starts_at, expires_at)
  VALUES (p_user_id, p_plan_type, 'active', NOW(), v_new_expires_at);

  -- D) Mark profile as premium and STACK balances
  UPDATE public.profiles
  SET 
    is_premium = true,
    contacts_balance = CASE 
      WHEN contacts_balance = -1 OR v_contacts_add = -1 THEN -1 -- Keep unlimited if acquired
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


-- 4. Rewrite get_user_quotas to read the actual STACKED balances
CREATE OR REPLACE FUNCTION get_user_quotas(p_user_id UUID)
RETURNS JSONB AS $$
DECLARE
  v_sub RECORD;
  v_tier TEXT := 'non_premium';
  v_prof RECORD;
BEGIN
  -- Find active tier and expiration
  SELECT * INTO v_sub
  FROM subscriptions
  WHERE user_id = p_user_id
    AND status = 'active'
    AND expires_at > NOW()
  ORDER BY expires_at DESC LIMIT 1;
  
  IF v_sub IS NOT NULL THEN
    v_tier := v_sub.plan_type;
  END IF;

  -- Read balances directly from profile
  SELECT contacts_balance, interests_balance INTO v_prof
  FROM public.profiles WHERE id = p_user_id;
  
  RETURN jsonb_build_object(
    'tier', UPPER(v_tier),
    'contacts_allowed', v_prof.contacts_balance,
    'contacts_used', 0, -- Deprecated, front-end will just display "Contacts Remaining"
    'interests_allowed', v_prof.interests_balance,
    'interests_used', 0, -- Deprecated
    'contacts_remaining', v_prof.contacts_balance,
    'interests_remaining', v_prof.interests_balance,
    'expires_at', v_sub.expires_at
  );
END;
$$ LANGUAGE plpgsql SECURITY DEFINER;


-- 5. Rewrite unlock_contact to strictly DECREMENT balance
CREATE OR REPLACE FUNCTION unlock_contact(p_viewer_id UUID, p_viewed_id UUID)
RETURNS BOOLEAN AS $$
DECLARE
  v_balance INTEGER;
  v_already_unlocked BOOLEAN;
BEGIN
  IF p_viewer_id = p_viewed_id THEN
    RETURN true;
  END IF;

  SELECT EXISTS(
    SELECT 1 FROM contact_views
    WHERE viewer_id = p_viewer_id AND viewed_id = p_viewed_id
  ) INTO v_already_unlocked;
  
  IF v_already_unlocked THEN
    RETURN true;
  END IF;
  
  -- Check Balance
  SELECT contacts_balance INTO v_balance FROM public.profiles WHERE id = p_viewer_id;
  
  IF v_balance = 0 THEN
    RAISE EXCEPTION 'QUOTA_EXCEEDED';
  END IF;
  
  -- Deduct Balance if not unlimited (-1)
  IF v_balance > 0 THEN
    UPDATE public.profiles SET contacts_balance = contacts_balance - 1 WHERE id = p_viewer_id;
  END IF;

  INSERT INTO contact_views (viewer_id, viewed_id) VALUES (p_viewer_id, p_viewed_id);
  
  RETURN true;
END;
$$ LANGUAGE plpgsql SECURITY DEFINER;


-- 6. Rewrite send_interest_with_quota to strictly DECREMENT balance
CREATE OR REPLACE FUNCTION send_interest_with_quota(p_sender_id UUID, p_receiver_id UUID, p_message TEXT DEFAULT NULL)
RETURNS BOOLEAN AS $$
DECLARE
  v_balance INTEGER;
  v_existing_interest RECORD;
BEGIN
  SELECT * INTO v_existing_interest FROM interests
  WHERE sender_id = p_sender_id AND receiver_id = p_receiver_id;
  
  IF v_existing_interest IS NOT NULL THEN
    UPDATE interests SET status = 'pending', message = COALESCE(p_message, message), updated_at = NOW()
    WHERE id = v_existing_interest.id;
    RETURN true;
  END IF;
  
  -- Check Balance
  SELECT interests_balance INTO v_balance FROM public.profiles WHERE id = p_sender_id;
  
  IF v_balance = 0 THEN
    RAISE EXCEPTION 'QUOTA_EXCEEDED';
  END IF;
  
  -- Deduct Balance if not unlimited (-1)
  IF v_balance > 0 THEN
    UPDATE public.profiles SET interests_balance = interests_balance - 1 WHERE id = p_sender_id;
  END IF;

  INSERT INTO interests (sender_id, receiver_id, message, status)
  VALUES (p_sender_id, p_receiver_id, p_message, 'pending');
  
  RETURN true;
END;
$$ LANGUAGE plpgsql SECURITY DEFINER;
