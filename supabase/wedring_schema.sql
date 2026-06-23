-- ====================================================================
-- WEDRING MATRIMONY UNIFIED SCHEMA
-- Run this script on a clean Supabase database
-- ====================================================================

CREATE EXTENSION IF NOT EXISTS "uuid-ossp";

-- ==========================================
-- MASTER DATA TABLES
-- ==========================================

CREATE TABLE public.master_religions (
  id integer PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
  name text UNIQUE NOT NULL
);

CREATE TABLE public.master_castes (
  id integer PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
  religion_id integer REFERENCES public.master_religions(id) ON DELETE CASCADE,
  name text NOT NULL,
  UNIQUE(religion_id, name)
);

CREATE TABLE public.master_countries (
  id integer PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
  name text UNIQUE NOT NULL
);

CREATE TABLE public.master_states (
  id integer PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
  country_id integer REFERENCES public.master_countries(id) ON DELETE CASCADE,
  name text NOT NULL,
  UNIQUE(country_id, name)
);

CREATE TABLE public.master_districts (
  id integer PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
  state_id integer REFERENCES public.master_states(id) ON DELETE CASCADE,
  name text NOT NULL,
  UNIQUE(state_id, name)
);

CREATE TABLE public.master_cities (
  id integer PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
  district_id integer REFERENCES public.master_districts(id) ON DELETE CASCADE,
  name text NOT NULL,
  UNIQUE(district_id, name)
);

-- ==========================================
-- CORE USER TABLES
-- ==========================================

CREATE TABLE public.users (
  id uuid PRIMARY KEY REFERENCES auth.users(id) ON DELETE CASCADE,
  email text UNIQUE,
  phone text UNIQUE,
  creating_for text NOT NULL,
  mother_tongue text NOT NULL,
  is_verified boolean DEFAULT false,
  created_at timestamptz DEFAULT now()
);

CREATE TABLE public.profiles (
  id uuid PRIMARY KEY REFERENCES public.users(id) ON DELETE CASCADE,
  name text,
  gender text,
  date_of_birth date,
  height_cm integer,
  weight_kg integer,
  physical_status text,
  marital_status text,
  religion text,
  caste text,
  about_me text,
  country text,
  state text,
  district text,
  city text,
  highest_qualification text,
  occupation text,
  annual_income text,
  languages_known text[],
  hobbies text[],
  interests text[],
  food_habit text,
  drinking_habit text,
  smoking_habit text,
  profile_completion integer DEFAULT 0,
  is_active boolean DEFAULT true,
  last_active_at timestamptz DEFAULT now(),
  updated_at timestamptz DEFAULT now()
);

CREATE TABLE public.family_details (
  user_id uuid PRIMARY KEY REFERENCES public.users(id) ON DELETE CASCADE,
  father_name text,
  mother_name text,
  family_status text,
  family_type text,
  family_values text,
  number_of_brothers integer DEFAULT 0,
  number_of_sisters integer DEFAULT 0,
  updated_at timestamptz DEFAULT now()
);

CREATE TABLE public.horoscope_details (
  user_id uuid PRIMARY KEY REFERENCES public.users(id) ON DELETE CASCADE,
  rasi text,
  nakshatra text,
  lagnam text,
  gothram text,
  dosham text,
  horoscope_notes text,
  updated_at timestamptz DEFAULT now()
);

CREATE TABLE public.partner_preferences (
  user_id uuid PRIMARY KEY REFERENCES public.users(id) ON DELETE CASCADE,
  pref_age_min integer DEFAULT 18,
  pref_age_max integer DEFAULT 50,
  pref_height_min integer DEFAULT 140,
  pref_height_max integer DEFAULT 200,
  pref_marital_status text[],
  pref_religion text[],
  pref_caste text[],
  pref_education text[],
  pref_occupation text[],
  pref_location text[],
  pref_food_habit text,
  updated_at timestamptz DEFAULT now()
);

CREATE TABLE public.profile_photos (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  user_id uuid REFERENCES public.users(id) ON DELETE CASCADE,
  photo_url text NOT NULL,
  is_primary boolean DEFAULT false,
  display_order integer DEFAULT 0,
  created_at timestamptz DEFAULT now()
);

-- ==========================================
-- ADMIN AND SYSTEM TABLES
-- ==========================================

CREATE TABLE public.admin_users (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  email text UNIQUE NOT NULL,
  role text DEFAULT 'admin',
  created_at timestamptz DEFAULT now()
);

CREATE TABLE public.membership_plans (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  name text NOT NULL UNIQUE,
  price_inr integer DEFAULT 0,
  validity_days integer DEFAULT 30,
  contact_credits integer DEFAULT 0,
  interest_credits integer DEFAULT 0,
  is_active boolean DEFAULT true,
  updated_at timestamptz DEFAULT now()
);

CREATE TABLE public.user_memberships (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  user_id uuid REFERENCES public.users(id) ON DELETE CASCADE,
  plan_id uuid REFERENCES public.membership_plans(id),
  tier text NOT NULL,
  start_date timestamptz DEFAULT now(),
  expiry_date timestamptz,
  contact_credits_remaining integer DEFAULT 0,
  interest_credits_remaining integer DEFAULT 0,
  status text DEFAULT 'active', -- 'active', 'queued', 'expired'
  queue_order integer DEFAULT 0,
  created_at timestamptz DEFAULT now()
);

CREATE TABLE public.purchase_history (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  user_id uuid REFERENCES public.users(id) ON DELETE CASCADE,
  plan_id uuid REFERENCES public.membership_plans(id),
  tier text NOT NULL,
  amount_paid integer NOT NULL,
  payment_status text DEFAULT 'pending',
  payment_gateway text,
  gateway_reference text,
  purchased_at timestamptz DEFAULT now()
);

CREATE TABLE public.credit_transactions (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  user_id uuid REFERENCES public.users(id) ON DELETE CASCADE,
  type text NOT NULL, -- 'contact_view', 'interest_sent'
  credits_used integer DEFAULT 1,
  reference_id uuid, -- Profile ID interacted with
  created_at timestamptz DEFAULT now()
);

CREATE TABLE public.profile_distribution (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  tier text NOT NULL UNIQUE,
  initial_all_matches integer DEFAULT 5,
  initial_new_profiles integer DEFAULT 0,
  daily_all_matches integer DEFAULT 0,
  daily_new_profiles integer DEFAULT 0,
  updated_at timestamptz DEFAULT now()
);

CREATE TABLE public.distribution_settings_history (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  tier text NOT NULL,
  settings jsonb NOT NULL,
  changed_by text,
  push_mode text,
  created_at timestamptz DEFAULT now()
);

CREATE TABLE public.user_profile_pool (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  user_id uuid REFERENCES public.users(id) ON DELETE CASCADE,
  profile_id uuid REFERENCES public.users(id) ON DELETE CASCADE,
  section text NOT NULL, -- 'all_matches' or 'daily_updates'
  compatibility_band text, -- '70-60', '60-50', '50-40', '40-30', '30-10'
  compatibility_score integer,
  added_at timestamptz DEFAULT now(),
  is_seen boolean DEFAULT false,
  UNIQUE(user_id, profile_id, section)
);

-- ==========================================
-- INTERACTION TABLES
-- ==========================================

CREATE TABLE public.interests (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  sender_id uuid REFERENCES public.users(id) ON DELETE CASCADE,
  receiver_id uuid REFERENCES public.users(id) ON DELETE CASCADE,
  status text DEFAULT 'pending', -- 'pending', 'accepted', 'declined'
  created_at timestamptz DEFAULT now(),
  updated_at timestamptz DEFAULT now(),
  UNIQUE(sender_id, receiver_id)
);

CREATE TABLE public.not_interested (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  user_id uuid REFERENCES public.users(id) ON DELETE CASCADE,
  target_user_id uuid REFERENCES public.users(id) ON DELETE CASCADE,
  created_at timestamptz DEFAULT now(),
  restored_at timestamptz,
  is_restored boolean DEFAULT false,
  UNIQUE(user_id, target_user_id)
);

CREATE TABLE public.user_activity (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  user_id uuid REFERENCES public.users(id) ON DELETE CASCADE,
  activity_type text NOT NULL,
  target_user_id uuid REFERENCES public.users(id) ON DELETE CASCADE,
  created_at timestamptz DEFAULT now()
);

-- ==========================================
-- INDEXES
-- ==========================================
CREATE INDEX idx_users_email ON public.users(email);
CREATE INDEX idx_users_phone ON public.users(phone);
CREATE INDEX idx_profiles_gender ON public.profiles(gender);
CREATE INDEX idx_profiles_is_active ON public.profiles(is_active);
CREATE INDEX idx_user_profile_pool_user_id ON public.user_profile_pool(user_id);
CREATE INDEX idx_user_profile_pool_section ON public.user_profile_pool(section);
CREATE INDEX idx_user_memberships_user_id ON public.user_memberships(user_id);
CREATE INDEX idx_user_memberships_status ON public.user_memberships(status);
CREATE INDEX idx_interests_receiver_id ON public.interests(receiver_id);
CREATE INDEX idx_interests_sender_id ON public.interests(sender_id);

-- ==========================================
-- TRIGGERS & FUNCTIONS
-- ==========================================

-- Trigger to enforce maximum 5 photos per user
CREATE OR REPLACE FUNCTION check_max_photos()
RETURNS TRIGGER AS $$
BEGIN
  IF (SELECT COUNT(*) FROM public.profile_photos WHERE user_id = NEW.user_id) >= 5 THEN
    RAISE EXCEPTION 'Maximum 5 photos allowed per user';
  END IF;
  RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER enforce_max_photos
  BEFORE INSERT ON public.profile_photos
  FOR EACH ROW EXECUTE FUNCTION check_max_photos();


-- Pre-registration uniqueness check
CREATE OR REPLACE FUNCTION check_user_exists(p_email text, p_phone text)
RETURNS boolean AS $$
DECLARE
  exists_flag boolean;
BEGIN
  SELECT EXISTS (
    SELECT 1 FROM public.users 
    WHERE (p_email != '' AND email = p_email) 
       OR (p_phone != '' AND phone = p_phone)
  ) INTO exists_flag;
  RETURN exists_flag;
END;
$$ LANGUAGE plpgsql SECURITY DEFINER;


-- Compatibility scoring engine
CREATE OR REPLACE FUNCTION calculate_compatibility(p_user_id_1 uuid, p_user_id_2 uuid)
RETURNS integer AS $$
DECLARE
  my_profile record;
  their_profile record;
  my_prefs record;
  score integer := 0;
  their_age integer;
BEGIN
  SELECT * INTO my_profile FROM public.profiles WHERE id = p_user_id_1;
  SELECT * INTO their_profile FROM public.profiles WHERE id = p_user_id_2;
  SELECT * INTO my_prefs FROM public.partner_preferences WHERE user_id = p_user_id_1;
  
  IF NOT FOUND THEN RETURN 0; END IF;
  
  -- Age
  IF their_profile.date_of_birth IS NOT NULL THEN
    their_age := EXTRACT(YEAR FROM age(their_profile.date_of_birth));
    IF my_prefs.pref_age_min IS NULL OR (their_age >= my_prefs.pref_age_min AND their_age <= my_prefs.pref_age_max) THEN
      score := score + 15;
    END IF;
  END IF;
  
  -- Height
  IF their_profile.height_cm IS NOT NULL AND my_prefs.pref_height_min IS NOT NULL THEN
    IF their_profile.height_cm >= my_prefs.pref_height_min AND their_profile.height_cm <= my_prefs.pref_height_max THEN
      score := score + 10;
    END IF;
  END IF;
  
  -- Religion
  IF my_profile.religion IS NOT NULL AND their_profile.religion IS NOT NULL THEN
    IF my_profile.religion = their_profile.religion THEN score := score + 20; END IF;
  END IF;
  
  -- Caste
  IF my_profile.caste IS NOT NULL AND their_profile.caste IS NOT NULL AND my_profile.caste != 'No Caste Preference' THEN
    IF my_profile.caste = their_profile.caste THEN score := score + 15; END IF;
  END IF;
  
  -- Location (State & District)
  IF my_profile.state IS NOT NULL AND my_profile.state = their_profile.state THEN score := score + 5; END IF;
  IF my_profile.district IS NOT NULL AND my_profile.district = their_profile.district THEN score := score + 5; END IF;
  
  -- Education & Occupation
  IF my_profile.highest_qualification IS NOT NULL AND my_profile.highest_qualification = their_profile.highest_qualification THEN score := score + 10; END IF;
  IF my_profile.occupation IS NOT NULL AND my_profile.occupation = their_profile.occupation THEN score := score + 5; END IF;
  
  -- Marital Status
  IF my_profile.marital_status IS NOT NULL AND my_profile.marital_status = their_profile.marital_status THEN score := score + 10; END IF;
  
  RETURN LEAST(score, 100);
END;
$$ LANGUAGE plpgsql STABLE;

-- Calculate profile completion percentage
CREATE OR REPLACE FUNCTION update_profile_completion()
RETURNS TRIGGER AS $$
DECLARE
  completion integer := 0;
  has_photo boolean;
  has_horo boolean;
  has_pref boolean;
BEGIN
  -- Basic Info (20%)
  IF NEW.name IS NOT NULL AND NEW.gender IS NOT NULL AND NEW.date_of_birth IS NOT NULL THEN
    completion := completion + 20;
  END IF;
  
  -- Religion/Caste (10%)
  IF NEW.religion IS NOT NULL THEN completion := completion + 10; END IF;
  
  -- Education/Occupation (15%)
  IF NEW.highest_qualification IS NOT NULL AND NEW.occupation IS NOT NULL THEN
    completion := completion + 15;
  END IF;
  
  -- Location + About Me (15%)
  IF NEW.city IS NOT NULL AND NEW.about_me IS NOT NULL THEN
    completion := completion + 15;
  END IF;
  
  -- Photos (15%)
  SELECT EXISTS(SELECT 1 FROM public.profile_photos WHERE user_id = NEW.id) INTO has_photo;
  IF has_photo THEN completion := completion + 15; END IF;
  
  -- Horoscope (10%)
  SELECT EXISTS(SELECT 1 FROM public.horoscope_details WHERE user_id = NEW.id) INTO has_horo;
  IF has_horo THEN completion := completion + 10; END IF;
  
  -- Preferences (15%)
  SELECT EXISTS(SELECT 1 FROM public.partner_preferences WHERE user_id = NEW.id) INTO has_pref;
  IF has_pref THEN completion := completion + 15; END IF;
  
  NEW.profile_completion := completion;
  NEW.updated_at := now();
  RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER update_profile_completion_trigger
  BEFORE UPDATE ON public.profiles
  FOR EACH ROW EXECUTE FUNCTION update_profile_completion();


-- Send Interest with Quota Check
CREATE OR REPLACE FUNCTION send_interest_with_quota(p_sender_id uuid, p_receiver_id uuid, p_message text)
RETURNS json AS $$
DECLARE
  active_sub record;
BEGIN
  -- Check active subscription
  SELECT * INTO active_sub FROM public.user_memberships 
  WHERE user_id = p_sender_id AND status = 'active' AND tier != 'free' LIMIT 1;
  
  IF NOT FOUND THEN
    RAISE EXCEPTION 'Premium membership required to send interests';
  END IF;
  
  IF active_sub.interest_credits_remaining <= 0 THEN
    RAISE EXCEPTION 'Not enough interest credits';
  END IF;
  
  -- Deduct credit
  UPDATE public.user_memberships 
  SET interest_credits_remaining = interest_credits_remaining - 1
  WHERE id = active_sub.id;
  
  -- Log transaction
  INSERT INTO public.credit_transactions (user_id, type, credits_used, reference_id)
  VALUES (p_sender_id, 'interest_sent', 1, p_receiver_id);
  
  -- Insert interest
  INSERT INTO public.interests (sender_id, receiver_id, status)
  VALUES (p_sender_id, p_receiver_id, 'pending');
  
  RETURN json_build_object('success', true);
END;
$$ LANGUAGE plpgsql SECURITY DEFINER;


-- View Contact with Quota Check
CREATE OR REPLACE FUNCTION view_contact_with_quota(p_viewer_id uuid, p_target_id uuid)
RETURNS json AS $$
DECLARE
  active_sub record;
  target_phone text;
BEGIN
  -- Check active subscription
  SELECT * INTO active_sub FROM public.user_memberships 
  WHERE user_id = p_viewer_id AND status = 'active' AND tier != 'free' LIMIT 1;
  
  IF NOT FOUND THEN
    RAISE EXCEPTION 'Premium membership required to view contacts';
  END IF;
  
  IF active_sub.contact_credits_remaining <= 0 THEN
    RAISE EXCEPTION 'Not enough contact credits';
  END IF;
  
  -- Target phone
  SELECT phone INTO target_phone FROM public.users WHERE id = p_target_id;
  
  -- Deduct credit
  UPDATE public.user_memberships 
  SET contact_credits_remaining = contact_credits_remaining - 1
  WHERE id = active_sub.id;
  
  -- Log transaction
  INSERT INTO public.credit_transactions (user_id, type, credits_used, reference_id)
  VALUES (p_viewer_id, 'contact_view', 1, p_target_id);
  
  RETURN json_build_object('success', true, 'phone', target_phone);
END;
$$ LANGUAGE plpgsql SECURITY DEFINER;


-- Pass Profile
CREATE OR REPLACE FUNCTION pass_profile(p_sender_id uuid, p_receiver_id uuid)
RETURNS json AS $$
BEGIN
  INSERT INTO public.not_interested (user_id, target_user_id)
  VALUES (p_sender_id, p_receiver_id)
  ON CONFLICT (user_id, target_user_id) DO UPDATE SET is_restored = false, restored_at = null;
  RETURN json_build_object('success', true);
END;
$$ LANGUAGE plpgsql SECURITY DEFINER;

-- Feed functions reading from user_profile_pool
CREATE OR REPLACE FUNCTION get_recommended_profiles(p_user_id uuid, p_limit integer, p_offset integer)
RETURNS SETOF public.profiles AS $$
BEGIN
  RETURN QUERY
  SELECT p.* FROM public.profiles p
  JOIN public.user_profile_pool pool ON p.id = pool.profile_id
  WHERE pool.user_id = p_user_id AND pool.section = 'all_matches' AND p.is_active = true
  ORDER BY pool.compatibility_score DESC, pool.added_at DESC
  LIMIT p_limit OFFSET p_offset;
END;
$$ LANGUAGE plpgsql STABLE SECURITY DEFINER;

CREATE OR REPLACE FUNCTION get_daily_matches(p_user_id uuid, p_limit integer, p_offset integer)
RETURNS SETOF public.profiles AS $$
BEGIN
  RETURN QUERY
  SELECT p.* FROM public.profiles p
  JOIN public.user_profile_pool pool ON p.id = pool.profile_id
  WHERE pool.user_id = p_user_id AND pool.section = 'daily_updates' AND p.is_active = true
  ORDER BY pool.compatibility_score DESC, pool.added_at DESC
  LIMIT p_limit OFFSET p_offset;
END;
$$ LANGUAGE plpgsql STABLE SECURITY DEFINER;

-- Revenue Stats
CREATE OR REPLACE FUNCTION get_revenue_stats()
RETURNS json AS $$
DECLARE
  total_revenue integer;
  active_users integer;
  premium_users integer;
  tier_breakdown json;
BEGIN
  SELECT COALESCE(SUM(amount_paid), 0) INTO total_revenue FROM public.purchase_history WHERE payment_status = 'completed';
  SELECT COUNT(*) INTO active_users FROM public.profiles WHERE is_active = true;
  SELECT COUNT(DISTINCT user_id) INTO premium_users FROM public.user_memberships WHERE status = 'active' AND tier != 'free';
  
  SELECT json_object_agg(tier, count) INTO tier_breakdown
  FROM (
    SELECT tier, COUNT(*) as count 
    FROM public.user_memberships 
    WHERE status = 'active'
    GROUP BY tier
  ) t;
  
  RETURN json_build_object(
    'total_revenue', total_revenue,
    'active_users', active_users,
    'premium_users', premium_users,
    'tier_breakdown', COALESCE(tier_breakdown, '{}'::json)
  );
END;
$$ LANGUAGE plpgsql SECURITY DEFINER;

-- ==========================================
-- ROW LEVEL SECURITY
-- ==========================================

ALTER TABLE public.users ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.profiles ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.family_details ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.horoscope_details ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.partner_preferences ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.profile_photos ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.membership_plans ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.user_memberships ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.profile_distribution ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.user_profile_pool ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.interests ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.not_interested ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.credit_transactions ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.purchase_history ENABLE ROW LEVEL SECURITY;

CREATE POLICY "users_own" ON public.users FOR ALL USING (auth.uid() = id);
CREATE POLICY "profiles_own" ON public.profiles FOR ALL USING (auth.uid() = id);
CREATE POLICY "profiles_read_authenticated" ON public.profiles FOR SELECT USING (auth.role() = 'authenticated');
CREATE POLICY "family_own" ON public.family_details FOR ALL USING (auth.uid() = user_id);
CREATE POLICY "family_read_authenticated" ON public.family_details FOR SELECT USING (auth.role() = 'authenticated');
CREATE POLICY "horo_own" ON public.horoscope_details FOR ALL USING (auth.uid() = user_id);
CREATE POLICY "horo_read_authenticated" ON public.horoscope_details FOR SELECT USING (auth.role() = 'authenticated');
CREATE POLICY "pref_own" ON public.partner_preferences FOR ALL USING (auth.uid() = user_id);
CREATE POLICY "photos_own" ON public.profile_photos FOR ALL USING (auth.uid() = user_id);
CREATE POLICY "photos_read_public" ON public.profile_photos FOR SELECT USING (true);
CREATE POLICY "plans_read_public" ON public.membership_plans FOR SELECT USING (true);
CREATE POLICY "memberships_own" ON public.user_memberships FOR ALL USING (auth.uid() = user_id);
CREATE POLICY "distrib_read_public" ON public.profile_distribution FOR SELECT USING (true);
CREATE POLICY "pool_own" ON public.user_profile_pool FOR ALL USING (auth.uid() = user_id);
CREATE POLICY "interests_own" ON public.interests FOR ALL USING (auth.uid() = sender_id OR auth.uid() = receiver_id);
CREATE POLICY "not_int_own" ON public.not_interested FOR ALL USING (auth.uid() = user_id);
CREATE POLICY "credits_own" ON public.credit_transactions FOR SELECT USING (auth.uid() = user_id);
CREATE POLICY "purchase_own" ON public.purchase_history FOR SELECT USING (auth.uid() = user_id);

-- Admin override policy (bypass RLS if email in admin_users)
CREATE OR REPLACE FUNCTION is_admin() RETURNS boolean AS $$
  SELECT EXISTS (
    SELECT 1 FROM public.admin_users WHERE email = auth.jwt()->>'email'
  );
$$ LANGUAGE sql SECURITY DEFINER;

-- ==========================================
-- SEED DATA
-- ==========================================

INSERT INTO public.master_religions (name) VALUES 
('Hindu'), ('Muslim'), ('Christian'), ('Sikh'), ('Jain'), ('Buddhist'), ('Others');

INSERT INTO public.master_countries (name) VALUES ('India');

INSERT INTO public.membership_plans (name, price_inr, validity_days, contact_credits, interest_credits) VALUES
('free', 0, 0, 0, 0),
('silver', 499, 30, 30, 50),
('gold', 999, 30, 50, 100),
('platinum', 1999, 90, 100, 200)
ON CONFLICT (name) DO NOTHING;

INSERT INTO public.profile_distribution (tier, initial_all_matches, initial_new_profiles, daily_all_matches, daily_new_profiles) VALUES
('free', 5, 0, 0, 0),
('silver', 100, 100, 10, 10),
('gold', 150, 150, 15, 15),
('platinum', 200, 200, 20, 20)
ON CONFLICT (tier) DO NOTHING;

-- ==========================================
-- COMPLEX FUNCTIONS
-- ==========================================

-- Purchase Subscription with Stacking
CREATE OR REPLACE FUNCTION purchase_subscription(p_user_id uuid, p_plan_type text, p_payment_id text, p_amount integer)
RETURNS json AS $$
DECLARE
  plan record;
  current_sub record;
  is_higher_tier boolean;
  is_same_tier boolean;
  tier_rank jsonb := '{"free":0, "silver":1, "gold":2, "platinum":3}';
BEGIN
  SELECT * INTO plan FROM public.membership_plans WHERE name = p_plan_type;
  IF NOT FOUND THEN RAISE EXCEPTION 'Plan not found'; END IF;

  SELECT * INTO current_sub FROM public.user_memberships 
  WHERE user_id = p_user_id AND status = 'active'
  ORDER BY created_at DESC LIMIT 1;

  IF current_sub IS NOT NULL THEN
    is_same_tier := (current_sub.tier = plan.name);
    is_higher_tier := ((tier_rank->>plan.name)::int > (tier_rank->>current_sub.tier)::int);
  ELSE
    is_higher_tier := true;
    is_same_tier := false;
  END IF;

  IF is_same_tier THEN
    UPDATE public.user_memberships SET
      contact_credits_remaining = contact_credits_remaining + plan.contact_credits,
      interest_credits_remaining = interest_credits_remaining + plan.interest_credits,
      expiry_date = expiry_date + (plan.validity_days || ' days')::interval
    WHERE id = current_sub.id;
  ELSIF is_higher_tier THEN
    IF current_sub IS NOT NULL THEN
      UPDATE public.user_memberships SET status = 'queued', queue_order = 1 WHERE id = current_sub.id;
    END IF;
    INSERT INTO public.user_memberships (user_id, plan_id, tier, expiry_date, contact_credits_remaining, interest_credits_remaining, status)
    VALUES (p_user_id, plan.id, plan.name, now() + (plan.validity_days || ' days')::interval, plan.contact_credits, plan.interest_credits, 'active');
  ELSE
    INSERT INTO public.user_memberships (user_id, plan_id, tier, contact_credits_remaining, interest_credits_remaining, status, queue_order)
    VALUES (p_user_id, plan.id, plan.name, plan.contact_credits, plan.interest_credits, 'queued', 1);
  END IF;

  IF p_payment_id IS NOT NULL THEN
    INSERT INTO public.purchase_history (user_id, plan_id, tier, amount_paid, payment_status, payment_gateway, gateway_reference)
    VALUES (p_user_id, plan.id, plan.name, p_amount, 'completed', 'razorpay', p_payment_id);
  END IF;

  RETURN json_build_object('success', true);
END;
$$ LANGUAGE plpgsql SECURITY DEFINER;


-- Admin Make User Free
CREATE OR REPLACE FUNCTION admin_make_user_free(p_user_id uuid, p_reset_distribution boolean)
RETURNS json AS $$
BEGIN
  UPDATE public.user_memberships SET status = 'expired' WHERE user_id = p_user_id;
  
  INSERT INTO public.user_memberships (user_id, tier, status)
  SELECT p_user_id, 'free', 'active'
  FROM public.membership_plans WHERE name = 'free';

  IF p_reset_distribution THEN
    DELETE FROM public.user_profile_pool WHERE user_id = p_user_id;
  END IF;

  RETURN json_build_object('success', true);
END;
$$ LANGUAGE plpgsql SECURITY DEFINER;


-- Get All User Emails (for Admin)
CREATE OR REPLACE FUNCTION get_all_user_emails()
RETURNS TABLE(id uuid, email varchar) AS $$
BEGIN
  -- Requires superuser or bypassing auth schema directly (usually works via postgres role)
  RETURN QUERY SELECT au.id, au.email::varchar FROM auth.users au;
END;
$$ LANGUAGE plpgsql SECURITY DEFINER;

-- Safe User Deletion
CREATE OR REPLACE FUNCTION delete_auth_user(target_user_id uuid)
RETURNS void AS $$
BEGIN
  DELETE FROM auth.users WHERE id = target_user_id;
END;
$$ LANGUAGE plpgsql SECURITY DEFINER;


-- ==========================================
-- DISTRIBUTION ALGORITHM
-- ==========================================

-- Banded Profile Distribution Engine
CREATE OR REPLACE FUNCTION distribute_profiles_for_user(p_user_id uuid, p_total_count integer, p_section text)
RETURNS json AS $$
DECLARE
  base_quota integer;
  remainder integer;
  candidate record;
  candidate_pool jsonb := '[]'::jsonb;
  bands jsonb := '[
    {"name": "70-60", "min": 60, "max": 100, "quota": 0},
    {"name": "60-50", "min": 50, "max": 60, "quota": 0},
    {"name": "50-40", "min": 40, "max": 50, "quota": 0},
    {"name": "40-30", "min": 30, "max": 40, "quota": 0},
    {"name": "30-10", "min": 10, "max": 30, "quota": 0}
  ]'::jsonb;
  i integer;
  b jsonb;
  band_name text;
  b_min integer;
  b_max integer;
  selected_count integer := 0;
  my_gender text;
BEGIN
  SELECT gender INTO my_gender FROM public.profiles WHERE id = p_user_id;
  
  -- Calculate quotas
  base_quota := floor(p_total_count / 5);
  remainder := p_total_count % 5;
  
  FOR i IN 0..4 LOOP
    b := bands->i;
    bands := jsonb_set(bands, ARRAY[i::text, 'quota'], to_jsonb(base_quota + CASE WHEN i < remainder THEN 1 ELSE 0 END));
  END LOOP;

  -- Build candidate pool (all eligible profiles not already in pool or not_interested)
  FOR candidate IN 
    SELECT p.id, calculate_compatibility(p_user_id, p.id) as score
    FROM public.profiles p
    WHERE p.id != p_user_id 
      AND p.is_active = true
      AND p.gender != my_gender
      AND NOT EXISTS (SELECT 1 FROM public.user_profile_pool up WHERE up.user_id = p_user_id AND up.profile_id = p.id AND up.section = p_section)
      AND NOT EXISTS (SELECT 1 FROM public.not_interested ni WHERE ni.user_id = p_user_id AND ni.target_user_id = p.id)
  LOOP
    IF candidate.score >= 10 THEN
      -- Determine band
      IF candidate.score >= 60 THEN band_name := '70-60';
      ELSIF candidate.score >= 50 THEN band_name := '60-50';
      ELSIF candidate.score >= 40 THEN band_name := '50-40';
      ELSIF candidate.score >= 30 THEN band_name := '40-30';
      ELSE band_name := '30-10'; END IF;
      
      candidate_pool := candidate_pool || jsonb_build_object('id', candidate.id, 'score', candidate.score, 'band', band_name);
    END IF;
  END LOOP;

  -- (In a real production environment with high volume, this would use Postgres arrays and complex plpgsql arrays to handle shortfalls between adjacent bands. For this migration, we insert directly up to the quotas available.)
  -- Simplified selection loop:
  FOR i IN 0..4 LOOP
    b := bands->i;
    band_name := b->>'name';
    
    INSERT INTO public.user_profile_pool (user_id, profile_id, section, compatibility_band, compatibility_score)
    SELECT p_user_id, (cp->>'id')::uuid, p_section, band_name, (cp->>'score')::integer
    FROM jsonb_array_elements(candidate_pool) cp
    WHERE cp->>'band' = band_name
    LIMIT (b->>'quota')::integer;
  END LOOP;

  RETURN json_build_object('success', true);
END;
$$ LANGUAGE plpgsql SECURITY DEFINER;


-- Run Daily Distribution (Cron Entry Point)
CREATE OR REPLACE FUNCTION run_daily_distribution()
RETURNS void AS $$
DECLARE
  usr record;
  active_sub record;
  dist_settings record;
BEGIN
  FOR usr IN SELECT id FROM public.profiles WHERE is_active = true LOOP
    -- Get user's active tier
    SELECT * INTO active_sub FROM public.user_memberships 
    WHERE user_id = usr.id AND status = 'active'
    ORDER BY created_at DESC LIMIT 1;
    
    IF active_sub IS NOT NULL THEN
      -- Get tier distribution settings
      SELECT * INTO dist_settings FROM public.profile_distribution WHERE tier = active_sub.tier;
      
      IF dist_settings IS NOT NULL AND dist_settings.daily_all_matches > 0 THEN
        PERFORM distribute_profiles_for_user(usr.id, dist_settings.daily_all_matches, 'daily_updates');
      END IF;
    END IF;
  END LOOP;
END;
$$ LANGUAGE plpgsql SECURITY DEFINER;

-- Update Subscription Plan Settings (Admin)
CREATE OR REPLACE FUNCTION update_subscription_plan(
    p_tier text,
    p_plan_name text,
    p_price_inr integer,
    p_duration_months integer,
    p_contacts_limit integer,
    p_interests_limit integer,
    p_initial_recommended_profiles integer,
    p_initial_nearby_profiles integer,
    p_daily_recommended_profiles integer,
    p_daily_nearby_profiles integer,
    p_features text[]
)
RETURNS void AS $$
BEGIN
  -- Update membership_plans
  UPDATE public.membership_plans SET
    price_inr = COALESCE(p_price_inr, price_inr),
    validity_days = COALESCE(p_duration_months * 30, validity_days),
    contact_credits = COALESCE(p_contacts_limit, contact_credits),
    interest_credits = COALESCE(p_interests_limit, interest_credits)
  WHERE name = p_tier;

  -- Update profile_distribution
  UPDATE public.profile_distribution SET
    initial_all_matches = COALESCE(p_initial_recommended_profiles, initial_all_matches),
    initial_new_profiles = COALESCE(p_initial_nearby_profiles, initial_new_profiles),
    daily_all_matches = COALESCE(p_daily_recommended_profiles, daily_all_matches),
    daily_new_profiles = COALESCE(p_daily_nearby_profiles, daily_new_profiles)
  WHERE tier = p_tier;
END;
$$ LANGUAGE plpgsql SECURITY DEFINER;


