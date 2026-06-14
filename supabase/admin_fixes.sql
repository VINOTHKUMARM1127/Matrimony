-- ============================================================
-- ADMIN SECURE RPC FIXES 
-- Run this in your Supabase SQL Editor
-- ============================================================

-- Fix 1: Fetch all user emails for the Admin Table safely
CREATE OR REPLACE FUNCTION get_all_user_emails()
RETURNS TABLE (id UUID, email VARCHAR) AS $$
BEGIN
  -- Security Check: Join against auth.users so we don't rely on JWT email
  IF NOT EXISTS (
    SELECT 1 FROM public.admin_users a
    JOIN auth.users u ON u.email = a.email
    WHERE u.id = auth.uid() AND a.role IN ('admin', 'superadmin')
  ) THEN
    RAISE EXCEPTION 'Unauthorized: Only admins can read all emails';
  END IF;

  RETURN QUERY SELECT u.id, u.email::VARCHAR FROM auth.users u;
END;
$$ LANGUAGE plpgsql SECURITY DEFINER;


-- Fix 2: Securely Delete User
CREATE OR REPLACE FUNCTION delete_auth_user(target_user_id UUID)
RETURNS VOID AS $$
BEGIN
  IF NOT EXISTS (
    SELECT 1 FROM public.admin_users a
    JOIN auth.users u ON u.email = a.email
    WHERE u.id = auth.uid() AND a.role IN ('admin', 'superadmin')
  ) THEN
    RAISE EXCEPTION 'Unauthorized: Only admins can delete users';
  END IF;

  DELETE FROM auth.users WHERE id = target_user_id;
END;
$$ LANGUAGE plpgsql SECURITY DEFINER;


-- Fix 3: Securely Update Tier Settings (Bypasses Service Key completely)
CREATE OR REPLACE FUNCTION update_tier_settings(
  p_tier TEXT, 
  p_rec INTEGER, 
  p_near INTEGER, 
  p_daily INTEGER, 
  p_dyn BOOLEAN
)
RETURNS VOID AS $$
BEGIN
  -- Security Check
  IF NOT EXISTS (
    SELECT 1 FROM public.admin_users a
    JOIN auth.users u ON u.email = a.email
    WHERE u.id = auth.uid() AND a.role IN ('admin', 'superadmin')
  ) THEN
    RAISE EXCEPTION 'Unauthorized: Only admins can update tiers';
  END IF;

  -- Upsert
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

-- Force schema cache reload
NOTIFY pgrst, 'reload schema';
