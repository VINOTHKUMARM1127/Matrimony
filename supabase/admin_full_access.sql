-- ============================================================
-- TAMIL MATRIMONY: FULL ADMIN ACCESS & RPC SETUP SCRIPT
-- Copy all of this and Run it in your Supabase SQL Editor
-- ============================================================

-- 1. Ensure the admin_users table exists
CREATE TABLE IF NOT EXISTS public.admin_users (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    email VARCHAR(255) UNIQUE NOT NULL,
    role VARCHAR(50) DEFAULT 'admin',
    created_at TIMESTAMPTZ DEFAULT NOW()
);

-- 2. Insert your owner email with superadmin rights
INSERT INTO public.admin_users (email, role)
VALUES ('vinomaddy2711@gmail.com', 'superadmin')
ON CONFLICT (email) DO UPDATE SET role = 'superadmin';

-- ============================================================
-- ADMIN RPC FUNCTIONS (Bypassing restrictive checks)
-- ============================================================

-- Safely drop existing functions to avoid return type or signature conflicts
DROP FUNCTION IF EXISTS get_all_user_emails();
DROP FUNCTION IF EXISTS delete_auth_user(UUID);
DROP FUNCTION IF EXISTS update_tier_settings(TEXT, INTEGER, INTEGER, INTEGER, BOOLEAN);
DROP FUNCTION IF EXISTS purchase_subscription(UUID, TEXT, INTEGER, INTEGER, INTEGER);
DROP FUNCTION IF EXISTS purchase_subscription(UUID, TEXT, TEXT, NUMERIC);
DROP FUNCTION IF EXISTS purchase_subscription(UUID, TEXT);

-- A. Fetch all user emails for the Admin Table safely
CREATE OR REPLACE FUNCTION get_all_user_emails()
RETURNS TABLE (id UUID, email VARCHAR) AS $$
BEGIN
  -- Completely bypass security if called via Service Role or if caller is an admin
  IF auth.role() != 'service_role' THEN
    IF NOT EXISTS (SELECT 1 FROM public.admin_users WHERE email = auth.jwt()->>'email') THEN
      RAISE EXCEPTION 'Unauthorized: Only admins can read all emails';
    END IF;
  END IF;

  RETURN QUERY SELECT u.id, u.email::VARCHAR FROM auth.users u;
END;
$$ LANGUAGE plpgsql SECURITY DEFINER;


-- B. Securely Delete User
CREATE OR REPLACE FUNCTION delete_auth_user(target_user_id UUID)
RETURNS VOID AS $$
BEGIN
  IF auth.role() != 'service_role' THEN
    IF NOT EXISTS (SELECT 1 FROM public.admin_users WHERE email = auth.jwt()->>'email') THEN
      RAISE EXCEPTION 'Unauthorized: Only admins can delete users';
    END IF;
  END IF;

  DELETE FROM auth.users WHERE id = target_user_id;
END;
$$ LANGUAGE plpgsql SECURITY DEFINER;


-- C. Securely Update Tier Settings (Recommendations)
CREATE OR REPLACE FUNCTION update_tier_settings(
  p_tier TEXT, 
  p_rec INTEGER, 
  p_near INTEGER, 
  p_daily INTEGER, 
  p_dyn BOOLEAN
)
RETURNS VOID AS $$
BEGIN
  IF auth.role() != 'service_role' THEN
    IF NOT EXISTS (SELECT 1 FROM public.admin_users WHERE email = auth.jwt()->>'email') THEN
      RAISE EXCEPTION 'Unauthorized: Only admins can update tiers';
    END IF;
  END IF;

  INSERT INTO public.tier_settings (tier, recommended_limit, nearby_limit, daily_limit, dynamic_daily_enabled, updated_at)
  VALUES (p_tier, p_rec, p_near, p_daily, p_dyn, now())
  ON CONFLICT (tier) DO UPDATE SET
    recommended_limit = EXCLUDED.recommended_limit,
    nearby_limit = EXCLUDED.nearby_limit,
    daily_limit = EXCLUDED.daily_limit,
    dynamic_daily_enabled = EXCLUDED.dynamic_daily_enabled,
    updated_at = EXCLUDED.updated_at;
END;
$$ LANGUAGE plpgsql SECURITY DEFINER;


-- D. Purchase / Update User Subscriptions from Admin Panel
CREATE OR REPLACE FUNCTION purchase_subscription(
  p_user_id UUID, 
  p_plan_type TEXT,
  p_duration_days INTEGER,
  p_contacts INTEGER,
  p_interests INTEGER
)
RETURNS BOOLEAN AS $$
DECLARE
  v_new_expires_at TIMESTAMPTZ;
BEGIN
  IF auth.role() != 'service_role' THEN
    IF NOT EXISTS (SELECT 1 FROM public.admin_users WHERE email = auth.jwt()->>'email') THEN
      RAISE EXCEPTION 'Unauthorized: Only admins can modify subscriptions';
    END IF;
  END IF;

  -- 1. Expire old active subscriptions
  UPDATE public.subscriptions 
  SET status = 'expired' 
  WHERE user_id = p_user_id AND status = 'active';

  -- 2. Calculate new expiry
  v_new_expires_at := NOW() + (p_duration_days || ' days')::INTERVAL;

  -- 3. Insert new subscription
  INSERT INTO public.subscriptions (user_id, plan_type, status, starts_at, expires_at)
  VALUES (p_user_id, p_plan_type, 'active', NOW(), v_new_expires_at);

  -- 4. Update Profile limits
  UPDATE public.profiles
  SET 
    is_premium = true,
    tier = p_plan_type,
    contacts_remaining = p_contacts,
    interests_remaining = p_interests,
    premium_expires_at = v_new_expires_at
  WHERE id = p_user_id;

  RETURN true;
END;
$$ LANGUAGE plpgsql SECURITY DEFINER;


-- ============================================================
-- APP REGISTRATION RPC FUNCTIONS
-- ============================================================

-- Safely drop before replacing
DROP FUNCTION IF EXISTS check_user_exists(TEXT, TEXT);

-- E. Check if a user exists by email or phone during registration
CREATE OR REPLACE FUNCTION check_user_exists(p_email TEXT, p_phone TEXT)
RETURNS BOOLEAN AS $$
BEGIN
  RETURN EXISTS (
    SELECT 1 FROM auth.users 
    WHERE (email = p_email AND email IS NOT NULL AND email != '')
       OR (phone = p_phone AND phone IS NOT NULL AND phone != '')
  );
END;
$$ LANGUAGE plpgsql SECURITY DEFINER;

-- Force schema cache reload so the frontend can immediately see the new functions
NOTIFY pgrst, 'reload schema';
