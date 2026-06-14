-- ==============================================================================
-- PREMIUM TIERS QUOTA AND VALIDITY ENFORCEMENT
-- ==============================================================================

-- 1. Create Contact Views Table for tracking
CREATE TABLE IF NOT EXISTS public.contact_views (
  id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
  viewer_id UUID REFERENCES public.profiles(id) ON DELETE CASCADE,
  viewed_id UUID REFERENCES public.profiles(id) ON DELETE CASCADE,
  created_at TIMESTAMPTZ DEFAULT NOW(),
  UNIQUE(viewer_id, viewed_id)
);

ALTER TABLE public.contact_views ENABLE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "View own contact views" ON public.contact_views;
CREATE POLICY "View own contact views" ON public.contact_views 
  FOR SELECT USING (auth.uid() = viewer_id OR auth.uid() = viewed_id);


-- 2. Update Admin Settings with new Limits & Validities
UPDATE public.admin_settings
SET setting_value = setting_value || '{
  "silver": { "recommended": 30, "nearby": 30, "daily": 30, "dynamic_daily_updates": true, "contacts": 30, "interests": 100, "validity_days": 30 },
  "gold": { "recommended": 50, "nearby": 50, "daily": 50, "dynamic_daily_updates": true, "contacts": 50, "interests": 300, "validity_days": 30 },
  "platinum": { "recommended": 100, "nearby": 100, "daily": 100, "dynamic_daily_updates": true, "contacts": 100, "interests": -1, "validity_days": 90 }
}'::jsonb
WHERE setting_key = 'matches_limits';


-- 3. Core Quota Calculation RPC
CREATE OR REPLACE FUNCTION get_user_quotas(p_user_id UUID)
RETURNS JSONB AS $$
DECLARE
  v_sub RECORD;
  v_tier TEXT := 'non_premium';
  v_limits JSONB;
  v_contacts_allowed INTEGER := 0;
  v_interests_allowed INTEGER := 5; -- Non-premium default
  v_contacts_used INTEGER := 0;
  v_interests_used INTEGER := 0;
  v_start_date TIMESTAMPTZ := '1970-01-01 00:00:00'::TIMESTAMPTZ;
  v_expires_at TIMESTAMPTZ;
BEGIN
  -- A) Find the most recent active subscription
  SELECT * INTO v_sub
  FROM subscriptions
  WHERE user_id = p_user_id
    AND status = 'active'
    AND expires_at > NOW()
  ORDER BY starts_at DESC LIMIT 1;
  
  IF v_sub IS NOT NULL THEN
    v_tier := v_sub.plan_type;
    v_start_date := v_sub.starts_at;
    v_expires_at := v_sub.expires_at;
  END IF;

  -- B) Fetch the limits from admin settings
  SELECT setting_value->v_tier INTO v_limits
  FROM admin_settings WHERE setting_key = 'matches_limits';
  
  IF v_limits IS NOT NULL THEN
    v_contacts_allowed := COALESCE((v_limits->>'contacts')::INTEGER, 0);
    v_interests_allowed := COALESCE((v_limits->>'interests')::INTEGER, 5);
  END IF;

  -- C) Calculate usage strictly SINCE the active subscription started
  -- This ensures quotas are reset when a user recharges early!
  SELECT COUNT(*) INTO v_contacts_used
  FROM contact_views
  WHERE viewer_id = p_user_id AND created_at >= v_start_date;
  
  SELECT COUNT(*) INTO v_interests_used
  FROM interests
  WHERE sender_id = p_user_id AND created_at >= v_start_date;
  
  RETURN jsonb_build_object(
    'tier', UPPER(v_tier),
    'contacts_allowed', v_contacts_allowed,
    'contacts_used', v_contacts_used,
    'interests_allowed', v_interests_allowed,
    'interests_used', v_interests_used,
    'expires_at', v_expires_at
  );
END;
$$ LANGUAGE plpgsql SECURITY DEFINER;


-- 4. Secure RPC to Unlock Contact
CREATE OR REPLACE FUNCTION unlock_contact(p_viewer_id UUID, p_viewed_id UUID)
RETURNS BOOLEAN AS $$
DECLARE
  v_quotas JSONB;
  v_contacts_allowed INTEGER;
  v_contacts_used INTEGER;
  v_already_unlocked BOOLEAN;
BEGIN
  IF p_viewer_id = p_viewed_id THEN
    RETURN true; -- Free to view self
  END IF;

  -- Check if already unlocked ever
  SELECT EXISTS(
    SELECT 1 FROM contact_views
    WHERE viewer_id = p_viewer_id AND viewed_id = p_viewed_id
  ) INTO v_already_unlocked;
  
  IF v_already_unlocked THEN
    RETURN true;
  END IF;
  
  -- Verify Quotas
  v_quotas := get_user_quotas(p_viewer_id);
  v_contacts_allowed := (v_quotas->>'contacts_allowed')::INTEGER;
  v_contacts_used := (v_quotas->>'contacts_used')::INTEGER;
  
  IF v_contacts_allowed != -1 AND v_contacts_used >= v_contacts_allowed THEN
    RAISE EXCEPTION 'QUOTA_EXCEEDED';
  END IF;
  
  -- Deduct Quota by logging the view
  INSERT INTO contact_views (viewer_id, viewed_id)
  VALUES (p_viewer_id, p_viewed_id);
  
  RETURN true;
END;
$$ LANGUAGE plpgsql SECURITY DEFINER;


-- 5. Secure RPC to Send Interest
CREATE OR REPLACE FUNCTION send_interest_with_quota(p_sender_id UUID, p_receiver_id UUID, p_message TEXT DEFAULT NULL)
RETURNS BOOLEAN AS $$
DECLARE
  v_quotas JSONB;
  v_interests_allowed INTEGER;
  v_interests_used INTEGER;
  v_existing_interest RECORD;
BEGIN
  -- Check if interest already exists
  SELECT * INTO v_existing_interest FROM interests
  WHERE sender_id = p_sender_id AND receiver_id = p_receiver_id;
  
  IF v_existing_interest IS NOT NULL THEN
    UPDATE interests SET status = 'pending', message = COALESCE(p_message, message), updated_at = NOW()
    WHERE id = v_existing_interest.id;
    RETURN true;
  END IF;
  
  -- Verify Quotas
  v_quotas := get_user_quotas(p_sender_id);
  v_interests_allowed := (v_quotas->>'interests_allowed')::INTEGER;
  v_interests_used := (v_quotas->>'interests_used')::INTEGER;
  
  IF v_interests_allowed != -1 AND v_interests_used >= v_interests_allowed THEN
    RAISE EXCEPTION 'QUOTA_EXCEEDED';
  END IF;
  
  -- Deduct Quota by inserting
  INSERT INTO interests (sender_id, receiver_id, message, status)
  VALUES (p_sender_id, p_receiver_id, p_message, 'pending');
  
  RETURN true;
END;
$$ LANGUAGE plpgsql SECURITY DEFINER;


-- 6. Setup automated expiration of Premium Badge (Requires pg_cron extension)
CREATE EXTENSION IF NOT EXISTS pg_cron;

-- Remove any existing job safely
DO $$
BEGIN
  PERFORM cron.unschedule('expire_premium_users');
EXCEPTION WHEN OTHERS THEN
  -- Ignore if the job does not exist yet
END $$;

-- Run every hour to strip premium badges from expired users
SELECT cron.schedule('expire_premium_users', '0 * * * *', $$
  UPDATE public.profiles p
  SET is_premium = false
  WHERE is_premium = true
    AND NOT EXISTS (
      SELECT 1 FROM public.subscriptions s
      WHERE s.user_id = p.id
        AND s.status = 'active'
        AND s.expires_at > NOW()
    );
$$);
