-- ==============================================================================
-- STRICT RLS LIMITS ENFORCEMENT PATCH
-- 
-- 1. Drops the permissive "Send interests" and "Insert own subscriptions" policies.
-- 2. Creates `pass_profile` RPC for safely declining/skipping profiles.
-- ==============================================================================

-- 1. DROP VULNERABLE RLS POLICIES
DROP POLICY IF EXISTS "Send interests" ON interests;
DROP POLICY IF EXISTS "Insert own subscriptions" ON subscriptions;

-- Note: 'contact_views' already has no INSERT policy, so it's already secure.

-- 2. CREATE pass_profile SECURE RPC
-- Allows a user to skip a profile (recording it as 'declined') without deducting quota.
CREATE OR REPLACE FUNCTION pass_profile(p_sender_id UUID, p_receiver_id UUID)
RETURNS BOOLEAN AS $$
DECLARE
  v_existing_interest RECORD;
BEGIN
  -- Check if an interaction already exists
  SELECT * INTO v_existing_interest FROM interests
  WHERE sender_id = p_sender_id AND receiver_id = p_receiver_id;
  
  IF v_existing_interest IS NOT NULL THEN
    -- If they already interacted, just update it to 'declined'
    UPDATE interests SET status = 'declined', updated_at = NOW()
    WHERE id = v_existing_interest.id;
    RETURN true;
  END IF;
  
  -- Insert a 'declined' record to prevent it from showing up in feeds again
  INSERT INTO interests (sender_id, receiver_id, status)
  VALUES (p_sender_id, p_receiver_id, 'declined');
  
  RETURN true;
END;
$$ LANGUAGE plpgsql SECURITY DEFINER;
