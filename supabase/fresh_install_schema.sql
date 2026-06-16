-- ============================================================
-- TAMIL MATRIMONY — FRESH INSTALL SCHEMA v2
-- Comprehensive PostgreSQL Schema for new Supabase Project
-- ============================================================

-- Enable required extensions
CREATE EXTENSION IF NOT EXISTS "uuid-ossp";

-- ============================================================
-- 1. TIER SETTINGS (Admin Controls)
-- ============================================================
CREATE TABLE IF NOT EXISTS public.tier_settings (
  tier TEXT PRIMARY KEY CHECK (tier IN ('free','silver','gold','platinum')),
  recommended_limit INT NOT NULL DEFAULT 0,
  nearby_limit INT NOT NULL DEFAULT 0,
  daily_limit INT NOT NULL DEFAULT 0,
  dynamic_daily_enabled BOOLEAN NOT NULL DEFAULT false,
  updated_at TIMESTAMPTZ DEFAULT NOW()
);

-- Seed defaults
INSERT INTO public.tier_settings (tier, recommended_limit, nearby_limit, daily_limit, dynamic_daily_enabled)
VALUES 
  ('free', 5, 5, 5, false),
  ('silver', 50, 50, 20, true),
  ('gold', 100, 100, 30, true),
  ('platinum', 200, 200, 50, true)
ON CONFLICT (tier) DO NOTHING;

-- ============================================================
-- 2. PROFILES (Combines 'users' and 'profiles' to maintain frontend compatibility)
-- ============================================================
CREATE TABLE IF NOT EXISTS public.profiles (
  id UUID REFERENCES auth.users ON DELETE CASCADE PRIMARY KEY,
  profile_id TEXT UNIQUE NOT NULL DEFAULT ('TM' || LPAD(FLOOR(RANDOM() * 999999)::TEXT, 6, '0')),
  
  -- Basic Details
  display_name TEXT NOT NULL,
  phone TEXT,
  gender TEXT NOT NULL CHECK (gender IN ('male', 'female')),
  profile_created_for TEXT,
  
  -- Subscription & Quotas
  tier TEXT DEFAULT 'free' CHECK (tier IN ('free','silver','gold','platinum')),
  premium_expires_at TIMESTAMPTZ,
  contacts_remaining INTEGER DEFAULT 0,
  interests_remaining INTEGER DEFAULT 0,
  is_verified BOOLEAN DEFAULT false,
  is_premium BOOLEAN DEFAULT false,
  
  -- Detailed Profile Data
  date_of_birth DATE NOT NULL,
  height_cm INTEGER,
  marital_status TEXT CHECK (marital_status IN ('never_married','divorced','widowed','awaiting_divorce')),
  religion TEXT NOT NULL DEFAULT 'Hindu',
  caste TEXT,
  subcaste TEXT,
  mother_tongue TEXT DEFAULT 'Tamil',
  
  -- Education & Career
  education TEXT,
  education_detail TEXT,
  occupation TEXT,
  occupation_detail TEXT,
  company_name TEXT,
  annual_income TEXT,
  
  -- Location
  city TEXT,
  district TEXT,
  state TEXT DEFAULT 'Tamil Nadu',
  country TEXT DEFAULT 'India',
  pincode TEXT,
  
  -- Horoscope Details (Embedded to match frontend expectations)
  star TEXT,
  raasi TEXT,
  lagnam TEXT,
  dasa_balance TEXT,
  gothram TEXT,
  dosham TEXT CHECK (dosham IN ('yes','no','not_sure')),
  
  -- Extra Data
  about_me TEXT,
  family_type TEXT CHECK (family_type IN ('joint','nuclear')),
  family_status TEXT CHECK (family_status IN ('middle_class','upper_middle_class','rich','affluent')),
  food_habit TEXT CHECK (food_habit IN ('vegetarian','non_vegetarian','eggetarian')),
  smoking TEXT CHECK (smoking IN ('no','yes','occasionally')),
  drinking TEXT CHECK (drinking IN ('no','yes','occasionally')),
  
  -- System Flags
  is_active BOOLEAN DEFAULT true,
  is_profile_complete BOOLEAN DEFAULT false,
  profile_completion_percent INTEGER DEFAULT 0,
  last_active_at TIMESTAMPTZ DEFAULT NOW(),
  created_at TIMESTAMPTZ DEFAULT NOW(),
  updated_at TIMESTAMPTZ DEFAULT NOW()
);

-- ============================================================
-- 3. PHOTOS
-- ============================================================
CREATE TABLE IF NOT EXISTS public.photos (
  id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
  user_id UUID REFERENCES public.profiles(id) ON DELETE CASCADE,
  storage_path TEXT NOT NULL,
  thumbnail_path TEXT,
  is_primary BOOLEAN DEFAULT false,
  display_order INTEGER DEFAULT 0,
  is_approved BOOLEAN DEFAULT true,
  created_at TIMESTAMPTZ DEFAULT NOW()
);

-- ============================================================
-- 4. SUBSCRIPTIONS (Premium Transactions)
-- ============================================================
CREATE TABLE IF NOT EXISTS public.subscriptions (
  id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
  user_id UUID REFERENCES public.profiles(id) ON DELETE CASCADE,
  plan_type TEXT NOT NULL CHECK (plan_type IN ('silver','gold','platinum')),
  status TEXT DEFAULT 'active' CHECK (status IN ('active','expired','cancelled')),
  amount INTEGER NOT NULL DEFAULT 0,
  contacts_added INTEGER DEFAULT 0,
  interests_added INTEGER DEFAULT 0,
  starts_at TIMESTAMPTZ DEFAULT NOW(),
  expires_at TIMESTAMPTZ,
  created_at TIMESTAMPTZ DEFAULT NOW()
);

-- ============================================================
-- 5. INTERESTS
-- ============================================================
CREATE TABLE IF NOT EXISTS public.interests (
  id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
  sender_id UUID REFERENCES public.profiles(id) ON DELETE CASCADE,
  receiver_id UUID REFERENCES public.profiles(id) ON DELETE CASCADE,
  status TEXT DEFAULT 'pending' CHECK (status IN ('pending','accepted','declined','withdrawn', 'passed')),
  created_at TIMESTAMPTZ DEFAULT NOW(),
  updated_at TIMESTAMPTZ DEFAULT NOW(),
  UNIQUE(sender_id, receiver_id)
);

-- ============================================================
-- 6. CONTACT VIEWS
-- ============================================================
CREATE TABLE IF NOT EXISTS public.contact_views (
  id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
  viewer_id UUID REFERENCES public.profiles(id) ON DELETE CASCADE,
  viewed_id UUID REFERENCES public.profiles(id) ON DELETE CASCADE,
  created_at TIMESTAMPTZ DEFAULT NOW(),
  UNIQUE(viewer_id, viewed_id)
);

-- ============================================================
-- 7. USER PROFILE VIEWS (Daily Tracking)
-- ============================================================
CREATE TABLE IF NOT EXISTS public.user_profile_views (
  user_id UUID REFERENCES public.profiles(id) ON DELETE CASCADE,
  section TEXT CHECK (section IN ('recommended','nearby','daily')),
  profile_ids UUID[] DEFAULT ARRAY[]::UUID[],
  last_updated DATE DEFAULT CURRENT_DATE,
  PRIMARY KEY (user_id, section)
);

-- ============================================================
-- 8. UTILITY TABLES (Chats, Messages, Blocks, Reports)
-- ============================================================
CREATE TABLE IF NOT EXISTS public.blocked_users (
  id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
  blocker_id UUID REFERENCES public.profiles(id) ON DELETE CASCADE,
  blocked_id UUID REFERENCES public.profiles(id) ON DELETE CASCADE,
  created_at TIMESTAMPTZ DEFAULT NOW(),
  UNIQUE(blocker_id, blocked_id)
);

CREATE TABLE IF NOT EXISTS public.partner_preferences (
  id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
  user_id UUID REFERENCES public.profiles(id) ON DELETE CASCADE UNIQUE,
  age_min INTEGER DEFAULT 18,
  age_max INTEGER DEFAULT 60,
  religion TEXT[],
  caste TEXT[],
  created_at TIMESTAMPTZ DEFAULT NOW()
);

-- ============================================================
-- TRIGGERS & FUNCTIONS
-- ============================================================

-- A) Auto-create profile on signup
CREATE OR REPLACE FUNCTION handle_new_user()
RETURNS TRIGGER AS $$
BEGIN
  INSERT INTO public.profiles (id, display_name, gender, date_of_birth, tier, contacts_remaining, interests_remaining)
  VALUES (
    NEW.id,
    COALESCE(NEW.raw_user_meta_data->>'display_name', 'New User'),
    COALESCE(NEW.raw_user_meta_data->>'gender', 'male'),
    COALESCE((NEW.raw_user_meta_data->>'date_of_birth')::DATE, '2000-01-01'::DATE),
    'free', 0, 0
  );
  RETURN NEW;
END;
$$ LANGUAGE plpgsql SECURITY DEFINER;

DROP TRIGGER IF EXISTS on_auth_user_created ON auth.users;
CREATE TRIGGER on_auth_user_created
  AFTER INSERT ON auth.users
  FOR EACH ROW EXECUTE FUNCTION handle_new_user();

-- B) Update timestamps
CREATE OR REPLACE FUNCTION update_updated_at() RETURNS TRIGGER AS $$
BEGIN
  NEW.updated_at = NOW();
  RETURN NEW;
END;
$$ LANGUAGE plpgsql;

DROP TRIGGER IF EXISTS profiles_updated_at ON profiles;
CREATE TRIGGER profiles_updated_at BEFORE UPDATE ON profiles FOR EACH ROW EXECUTE FUNCTION update_updated_at();


-- ============================================================
-- CORE BUSINESS LOGIC RPCS (SECURITY DEFINER)
-- ============================================================

-- 1. Purchase Subscription & Plan Stacking Logic
CREATE OR REPLACE FUNCTION purchase_subscription(
  p_user_id UUID,
  p_plan_type TEXT,
  p_duration_days INTEGER,
  p_contacts INTEGER,
  p_interests INTEGER
) RETURNS VOID AS $$
DECLARE
  v_current_expiry TIMESTAMPTZ;
  v_new_expiry TIMESTAMPTZ;
BEGIN
  -- Get current expiry if they are already on a premium plan
  SELECT premium_expires_at INTO v_current_expiry
  FROM profiles WHERE id = p_user_id;

  -- Stacking logic
  IF v_current_expiry IS NOT NULL AND v_current_expiry > NOW() THEN
    v_new_expiry := v_current_expiry + (p_duration_days || ' days')::INTERVAL;
  ELSE
    v_new_expiry := NOW() + (p_duration_days || ' days')::INTERVAL;
  END IF;

  -- Update Profile
  UPDATE profiles
  SET 
    tier = p_plan_type,
    is_premium = true,
    is_verified = true,
    premium_expires_at = v_new_expiry,
    contacts_remaining = contacts_remaining + p_contacts,
    interests_remaining = interests_remaining + p_interests
  WHERE id = p_user_id;

  -- Log Transaction
  INSERT INTO subscriptions (user_id, plan_type, contacts_added, interests_added, expires_at)
  VALUES (p_user_id, p_plan_type, p_contacts, p_interests, v_new_expiry);
END;
$$ LANGUAGE plpgsql SECURITY DEFINER;

-- 2. Send Interest with Quota Deduction
CREATE OR REPLACE FUNCTION send_interest_with_quota(
  p_sender_id UUID,
  p_receiver_id UUID
) RETURNS VOID AS $$
DECLARE
  v_interests_remaining INTEGER;
BEGIN
  SELECT interests_remaining INTO v_interests_remaining
  FROM profiles WHERE id = p_sender_id;

  IF v_interests_remaining <= 0 THEN
    RAISE EXCEPTION 'QUOTA_EXCEEDED: No interests remaining';
  END IF;

  -- Deduct quota
  UPDATE profiles SET interests_remaining = interests_remaining - 1 WHERE id = p_sender_id;

  -- Insert interest
  INSERT INTO interests (sender_id, receiver_id, status)
  VALUES (p_sender_id, p_receiver_id, 'pending')
  ON CONFLICT (sender_id, receiver_id) DO UPDATE SET status = 'pending';
END;
$$ LANGUAGE plpgsql SECURITY DEFINER;

-- 3. Pass Profile (No quota deduction)
CREATE OR REPLACE FUNCTION pass_profile(
  p_sender_id UUID,
  p_receiver_id UUID
) RETURNS VOID AS $$
BEGIN
  INSERT INTO interests (sender_id, receiver_id, status)
  VALUES (p_sender_id, p_receiver_id, 'passed')
  ON CONFLICT (sender_id, receiver_id) DO UPDATE SET status = 'passed';
END;
$$ LANGUAGE plpgsql SECURITY DEFINER;

-- 4. Unlock Contact View with Quota Deduction
CREATE OR REPLACE FUNCTION unlock_contact(
  p_viewer_id UUID,
  p_viewed_id UUID
) RETURNS VOID AS $$
DECLARE
  v_contacts_remaining INTEGER;
  v_already_viewed BOOLEAN;
BEGIN
  -- Prevent duplicate deduction
  SELECT EXISTS(SELECT 1 FROM contact_views WHERE viewer_id = p_viewer_id AND viewed_id = p_viewed_id) INTO v_already_viewed;
  IF v_already_viewed THEN RETURN; END IF;

  SELECT contacts_remaining INTO v_contacts_remaining
  FROM profiles WHERE id = p_viewer_id;

  IF v_contacts_remaining <= 0 THEN
    RAISE EXCEPTION 'QUOTA_EXCEEDED: No contacts remaining';
  END IF;

  -- Deduct quota
  UPDATE profiles SET contacts_remaining = contacts_remaining - 1 WHERE id = p_viewer_id;

  -- Log view
  INSERT INTO contact_views (viewer_id, viewed_id) VALUES (p_viewer_id, p_viewed_id);
END;
$$ LANGUAGE plpgsql SECURITY DEFINER;


-- ============================================================
-- PROFILE FETCHING RPCS (Respecting Limits & Accumulation)
-- ============================================================

CREATE OR REPLACE FUNCTION get_recommended_profiles(p_user_id UUID, p_limit INTEGER DEFAULT 20, p_offset INTEGER DEFAULT 0)
RETURNS TABLE(id UUID, display_name TEXT, gender TEXT, date_of_birth DATE, religion TEXT, caste TEXT, district TEXT, is_verified BOOLEAN, is_premium BOOLEAN, compatibility_score INTEGER) AS $$
DECLARE
  v_gender TEXT; v_religion TEXT; v_caste TEXT; v_user_tier TEXT; v_allowed_limit INTEGER;
BEGIN
  SELECT p.gender, p.religion, p.caste, p.tier INTO v_gender, v_religion, v_caste, v_user_tier FROM profiles p WHERE p.id = p_user_id;
  SELECT recommended_limit INTO v_allowed_limit FROM tier_settings WHERE tier = v_user_tier;
  v_allowed_limit := COALESCE(v_allowed_limit, 5);
  p_limit := LEAST(p_limit, GREATEST(0, v_allowed_limit - p_offset));
  IF p_limit <= 0 THEN RETURN; END IF;

  RETURN QUERY
  SELECT p.id, p.display_name, p.gender, p.date_of_birth, p.religion, p.caste, p.district, p.is_verified, p.is_premium,
    (CASE WHEN p.religion = v_religion THEN 30 ELSE 0 END + CASE WHEN p.caste = v_caste THEN 30 ELSE 0 END + 40)::INTEGER AS compatibility_score
  FROM profiles p
  WHERE p.is_active = true AND p.id != p_user_id AND p.gender != v_gender
    AND NOT EXISTS (SELECT 1 FROM blocked_users b WHERE (b.blocker_id = p_user_id AND b.blocked_id = p.id) OR (b.blocker_id = p.id AND b.blocked_id = p_user_id))
    AND NOT EXISTS (SELECT 1 FROM interests i WHERE (i.sender_id = p_user_id AND i.receiver_id = p.id) OR (i.sender_id = p.id AND i.receiver_id = p_user_id))
  ORDER BY compatibility_score DESC LIMIT p_limit OFFSET p_offset;
END;
$$ LANGUAGE plpgsql SECURITY DEFINER;


CREATE OR REPLACE FUNCTION get_nearby_profiles(p_user_id UUID, p_limit INTEGER DEFAULT 20, p_offset INTEGER DEFAULT 0)
RETURNS TABLE(id UUID, display_name TEXT, gender TEXT, date_of_birth DATE, religion TEXT, caste TEXT, district TEXT, is_verified BOOLEAN, is_premium BOOLEAN, compatibility_score INTEGER) AS $$
DECLARE
  v_gender TEXT; v_district TEXT; v_user_tier TEXT; v_allowed_limit INTEGER;
BEGIN
  SELECT p.gender, p.district, p.tier INTO v_gender, v_district, v_user_tier FROM profiles p WHERE p.id = p_user_id;
  SELECT nearby_limit INTO v_allowed_limit FROM tier_settings WHERE tier = v_user_tier;
  v_allowed_limit := COALESCE(v_allowed_limit, 5);
  p_limit := LEAST(p_limit, GREATEST(0, v_allowed_limit - p_offset));
  IF p_limit <= 0 THEN RETURN; END IF;

  RETURN QUERY
  SELECT p.id, p.display_name, p.gender, p.date_of_birth, p.religion, p.caste, p.district, p.is_verified, p.is_premium,
    (CASE WHEN p.district = v_district THEN 50 ELSE 0 END + 50)::INTEGER AS compatibility_score
  FROM profiles p
  WHERE p.is_active = true AND p.id != p_user_id AND p.gender != v_gender AND p.district = v_district
    AND NOT EXISTS (SELECT 1 FROM blocked_users b WHERE (b.blocker_id = p_user_id AND b.blocked_id = p.id) OR (b.blocker_id = p.id AND b.blocked_id = p_user_id))
    AND NOT EXISTS (SELECT 1 FROM interests i WHERE (i.sender_id = p_user_id AND i.receiver_id = p.id) OR (i.sender_id = p.id AND i.receiver_id = p_user_id))
  ORDER BY p.last_active_at DESC LIMIT p_limit OFFSET p_offset;
END;
$$ LANGUAGE plpgsql SECURITY DEFINER;


CREATE OR REPLACE FUNCTION get_daily_matches(p_user_id UUID, p_limit INTEGER DEFAULT 10, p_offset INTEGER DEFAULT 0)
RETURNS TABLE(id UUID, display_name TEXT, gender TEXT, date_of_birth DATE, religion TEXT, caste TEXT, district TEXT, is_verified BOOLEAN, is_premium BOOLEAN, compatibility_score INTEGER) AS $$
DECLARE
  v_gender TEXT; v_user_tier TEXT; v_allowed_limit INTEGER; v_seen_ids UUID[];
BEGIN
  SELECT p.gender, p.tier INTO v_gender, v_user_tier FROM profiles p WHERE p.id = p_user_id;
  SELECT daily_limit INTO v_allowed_limit FROM tier_settings WHERE tier = v_user_tier;
  v_allowed_limit := COALESCE(v_allowed_limit, 5);
  
  SELECT profile_ids INTO v_seen_ids FROM user_profile_views WHERE user_id = p_user_id AND section = 'daily';
  IF v_seen_ids IS NULL THEN v_seen_ids := ARRAY[]::UUID[]; END IF;

  p_limit := LEAST(p_limit, GREATEST(0, v_allowed_limit - p_offset));
  IF p_limit <= 0 THEN RETURN; END IF;

  RETURN QUERY
  SELECT p.id, p.display_name, p.gender, p.date_of_birth, p.religion, p.caste, p.district, p.is_verified, p.is_premium, 50::INTEGER AS compatibility_score
  FROM profiles p
  WHERE p.is_active = true AND p.id != p_user_id AND p.gender != v_gender
    AND p.id != ALL(v_seen_ids)
    AND NOT EXISTS (SELECT 1 FROM blocked_users b WHERE (b.blocker_id = p_user_id AND b.blocked_id = p.id) OR (b.blocker_id = p.id AND b.blocked_id = p_user_id))
    AND NOT EXISTS (SELECT 1 FROM interests i WHERE (i.sender_id = p_user_id AND i.receiver_id = p.id) OR (i.sender_id = p.id AND i.receiver_id = p_user_id))
  ORDER BY p.last_active_at DESC LIMIT p_limit OFFSET p_offset;
END;
$$ LANGUAGE plpgsql SECURITY DEFINER;


CREATE OR REPLACE FUNCTION log_daily_views(p_user_id UUID, p_viewed_ids UUID[]) RETURNS VOID AS $$
BEGIN
  INSERT INTO user_profile_views (user_id, section, profile_ids, last_updated)
  VALUES (p_user_id, 'daily', p_viewed_ids, CURRENT_DATE)
  ON CONFLICT (user_id, section) DO UPDATE SET
    profile_ids = ARRAY(SELECT DISTINCT unnest(user_profile_views.profile_ids || EXCLUDED.profile_ids)),
    last_updated = CURRENT_DATE;
END;
$$ LANGUAGE plpgsql SECURITY DEFINER;


-- ============================================================
-- ROW LEVEL SECURITY (Strict Enforcement)
-- ============================================================
ALTER TABLE tier_settings ENABLE ROW LEVEL SECURITY;
ALTER TABLE profiles ENABLE ROW LEVEL SECURITY;
ALTER TABLE photos ENABLE ROW LEVEL SECURITY;
ALTER TABLE subscriptions ENABLE ROW LEVEL SECURITY;
ALTER TABLE interests ENABLE ROW LEVEL SECURITY;
ALTER TABLE contact_views ENABLE ROW LEVEL SECURITY;
ALTER TABLE user_profile_views ENABLE ROW LEVEL SECURITY;
ALTER TABLE blocked_users ENABLE ROW LEVEL SECURITY;
ALTER TABLE partner_preferences ENABLE ROW LEVEL SECURITY;

-- Tier Settings: Read by all, updated by admins (handled by DB roles or separate admin tool)
CREATE POLICY "Anyone can read tier_settings" ON tier_settings FOR SELECT USING (true);

-- Profiles
CREATE POLICY "Anyone can view active profiles" ON profiles FOR SELECT USING (is_active = true);
CREATE POLICY "Users insert own profile" ON profiles FOR INSERT WITH CHECK (auth.uid() = id);
CREATE POLICY "Users update own profile" ON profiles FOR UPDATE USING (auth.uid() = id);

-- Photos
CREATE POLICY "Anyone can view photos" ON photos FOR SELECT USING (true);
CREATE POLICY "Users manage own photos" ON photos FOR ALL USING (auth.uid() = user_id);

-- Subscriptions (Premium Transactions)
CREATE POLICY "Users view own subscriptions" ON subscriptions FOR SELECT USING (auth.uid() = user_id);

-- Interests are strictly backend-managed via RPCs
CREATE POLICY "Users view own interests" ON interests FOR SELECT USING (auth.uid() = sender_id OR auth.uid() = receiver_id);
-- NO INSERT POLICY FOR INTERESTS - MUST USE send_interest_with_quota() RPC

-- Contact views strictly backend-managed
CREATE POLICY "Users view own contacts" ON contact_views FOR SELECT USING (auth.uid() = viewer_id OR auth.uid() = viewed_id);
-- NO INSERT POLICY FOR CONTACTS - MUST USE unlock_contact() RPC

-- User Profile Views (Daily Accumulation)
CREATE POLICY "Users manage own profile views" ON user_profile_views FOR ALL USING (auth.uid() = user_id);

-- Blocked Users
CREATE POLICY "Users manage own blocked users" ON blocked_users FOR ALL USING (auth.uid() = blocker_id);

-- Partner Preferences
CREATE POLICY "Users manage own partner preferences" ON partner_preferences FOR ALL USING (auth.uid() = user_id);

-- ============================================================
-- 9. ADMIN SYSTEM & SEEDING
-- ============================================================

-- A) Admin Users Table
CREATE TABLE IF NOT EXISTS public.admin_users (
  id uuid PRIMARY KEY DEFAULT uuid_generate_v4(),
  email text UNIQUE NOT NULL,
  role text DEFAULT 'admin' CHECK (role IN ('admin', 'superadmin')),
  created_at timestamp with time zone DEFAULT timezone('utc'::text, now()) NOT NULL
);

ALTER TABLE public.admin_users ENABLE ROW LEVEL SECURITY;
CREATE POLICY "Enable read access for all users" ON public.admin_users FOR SELECT USING (true);

-- Create initial admin user
INSERT INTO public.admin_users (email, role)
VALUES ('vinomaddy2711@gmail.com', 'superadmin')
ON CONFLICT (email) DO NOTHING;

-- B) Create the SuperAdmin auth.users login
CREATE EXTENSION IF NOT EXISTS pgcrypto;

DO $$
DECLARE
  new_user_id uuid;
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'vinomaddy2711@gmail.com') THEN
    new_user_id := gen_random_uuid();
    
    INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, aud, role, raw_app_meta_data, raw_user_meta_data)
    VALUES (
      new_user_id, 
      'vinomaddy2711@gmail.com', 
      crypt('Nasuvi151127', gen_salt('bf')), 
      now(), 
      'authenticated', 
      'authenticated', 
      '{"provider": "email", "providers": ["email"]}', 
      '{}'
    );
    
    INSERT INTO auth.identities (id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at)
    VALUES (
      gen_random_uuid(), 
      new_user_id, 
      new_user_id::text, 
      format('{"sub":"%s","email":"%s"}', new_user_id::text, 'vinomaddy2711@gmail.com')::jsonb, 
      'email', 
      now(), 
      now(), 
      now()
    );
  END IF;
END $$;
