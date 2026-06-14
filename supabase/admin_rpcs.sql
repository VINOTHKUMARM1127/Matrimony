-- ============================================================
-- ADMIN SECURE RPC FUNCTIONS
-- Run this in your Supabase SQL Editor
-- ============================================================

-- 1. Securely delete a user from auth.users (cascades to profiles)
CREATE OR REPLACE FUNCTION delete_auth_user(target_user_id UUID)
RETURNS VOID AS $$
BEGIN
  -- Security Check: Only admins can delete
  IF NOT EXISTS (
    SELECT 1 FROM public.admin_users WHERE email = auth.jwt()->>'email' AND role IN ('admin', 'superadmin')
  ) THEN
    RAISE EXCEPTION 'Unauthorized: Only admins can delete users';
  END IF;

  -- Delete from auth.users (this automatically cascades to public.profiles)
  DELETE FROM auth.users WHERE id = target_user_id;
END;
$$ LANGUAGE plpgsql SECURITY DEFINER;

-- 2. Fetch all user emails for the Admin Table (Bypasses GoTrue Rate Limits)
CREATE OR REPLACE FUNCTION get_all_user_emails()
RETURNS TABLE (id UUID, email VARCHAR) AS $$
BEGIN
  -- Security Check: Only admins can fetch emails
  IF NOT EXISTS (
    SELECT 1 FROM public.admin_users WHERE email = auth.jwt()->>'email' AND role IN ('admin', 'superadmin')
  ) THEN
    RAISE EXCEPTION 'Unauthorized: Only admins can read all emails';
  END IF;

  RETURN QUERY SELECT u.id, u.email::VARCHAR FROM auth.users u;
END;
$$ LANGUAGE plpgsql SECURITY DEFINER;

-- Force schema cache reload so the new functions appear immediately
NOTIFY pgrst, 'reload schema';
