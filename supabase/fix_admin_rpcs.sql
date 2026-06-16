-- ============================================================
-- FIX ADMIN RPCs (Missing Functions)
-- Run this in your Supabase SQL Editor
-- ============================================================

-- 1. get_all_user_emails: Fetches emails from auth.users securely for the admin panel
CREATE OR REPLACE FUNCTION get_all_user_emails()
RETURNS TABLE (id uuid, email varchar)
SECURITY DEFINER
SET search_path = public
AS $$
BEGIN
  RETURN QUERY SELECT au.id, au.email::varchar FROM auth.users au;
END;
$$ LANGUAGE plpgsql;

-- 2. delete_auth_user: Safely deletes a user from auth.users (which cascades to public.profiles)
CREATE OR REPLACE FUNCTION delete_auth_user(target_user_id uuid)
RETURNS void
SECURITY DEFINER
SET search_path = public
AS $$
BEGIN
  DELETE FROM auth.users WHERE id = target_user_id;
END;
$$ LANGUAGE plpgsql;

-- 3. update_tier_settings: Safely updates tier settings, bypassing RLS issues
CREATE OR REPLACE FUNCTION update_tier_settings(
  p_tier text,
  p_rec int,
  p_near int,
  p_daily int,
  p_dyn boolean
)
RETURNS void
SECURITY DEFINER
SET search_path = public
AS $$
BEGIN
  UPDATE public.tier_settings 
  SET 
    recommended_limit = p_rec,
    nearby_limit = p_near,
    daily_limit = p_daily,
    dynamic_daily_enabled = p_dyn,
    updated_at = NOW()
  WHERE tier = p_tier;
END;
$$ LANGUAGE plpgsql;
