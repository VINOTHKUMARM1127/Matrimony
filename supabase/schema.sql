-- ============================================================
-- Wedring Matrimony — Complete PostgreSQL Schema
-- Supabase Database Migration
-- ============================================================

-- Enable required extensions
CREATE EXTENSION IF NOT EXISTS "uuid-ossp";

-- ============================================================
-- 1. PROFILES TABLE
-- ============================================================
CREATE TABLE IF NOT EXISTS public.profiles (
  id UUID REFERENCES auth.users ON DELETE CASCADE PRIMARY KEY,
  profile_id TEXT UNIQUE NOT NULL DEFAULT ('TM' || LPAD(FLOOR(RANDOM() * 999999)::TEXT, 6, '0')),
  display_name TEXT NOT NULL,
  gender TEXT NOT NULL CHECK (gender IN ('male', 'female')),
  date_of_birth DATE NOT NULL,
  height_cm INTEGER,
  marital_status TEXT CHECK (marital_status IN ('never_married','divorced','widowed','awaiting_divorce')),
  religion TEXT NOT NULL DEFAULT 'Hindu',
  caste TEXT,
  subcaste TEXT,
  dosham TEXT CHECK (dosham IN ('yes','no','not_sure')),
  mother_tongue TEXT DEFAULT 'Tamil',
  education TEXT,
  education_detail TEXT,
  occupation TEXT,
  occupation_detail TEXT,
  annual_income TEXT,
  company_name TEXT,
  city TEXT,
  district TEXT,
  state TEXT DEFAULT 'Tamil Nadu',
  country TEXT DEFAULT 'India',
  pincode TEXT,
  about_me TEXT,
  family_type TEXT CHECK (family_type IN ('joint','nuclear')),
  family_status TEXT CHECK (family_status IN ('middle_class','upper_middle_class','rich','affluent')),
  father_occupation TEXT,
  mother_occupation TEXT,
  brothers_count INTEGER DEFAULT 0,
  sisters_count INTEGER DEFAULT 0,
  brothers_married INTEGER DEFAULT 0,
  sisters_married INTEGER DEFAULT 0,
  food_habit TEXT CHECK (food_habit IN ('vegetarian','non_vegetarian','eggetarian')),
  smoking TEXT CHECK (smoking IN ('no','yes','occasionally')),
  drinking TEXT CHECK (drinking IN ('no','yes','occasionally')),
  languages_known TEXT[] DEFAULT ARRAY['Tamil'],
  interests TEXT[],
  hobbies TEXT[],
  is_verified BOOLEAN DEFAULT false,
  is_premium BOOLEAN DEFAULT false,
  is_active BOOLEAN DEFAULT true,
  is_profile_complete BOOLEAN DEFAULT false,
  profile_completion_percent INTEGER DEFAULT 0,
  push_token TEXT,
  last_active_at TIMESTAMPTZ DEFAULT NOW(),
  created_at TIMESTAMPTZ DEFAULT NOW(),
  updated_at TIMESTAMPTZ DEFAULT NOW()
);

-- ============================================================
-- 2. HOROSCOPE DETAILS
-- ============================================================
CREATE TABLE IF NOT EXISTS public.horoscope_details (
  id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
  user_id UUID REFERENCES public.profiles(id) ON DELETE CASCADE UNIQUE,
  star TEXT,
  raasi TEXT,
  lagnam TEXT,
  dasa_balance TEXT,
  gothram TEXT,
  horoscope_chart JSONB,
  manglik TEXT CHECK (manglik IN ('yes','no','not_applicable')),
  created_at TIMESTAMPTZ DEFAULT NOW(),
  updated_at TIMESTAMPTZ DEFAULT NOW()
);

-- ============================================================
-- 3. PARTNER PREFERENCES
-- ============================================================
CREATE TABLE IF NOT EXISTS public.partner_preferences (
  id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
  user_id UUID REFERENCES public.profiles(id) ON DELETE CASCADE UNIQUE,
  age_min INTEGER DEFAULT 18,
  age_max INTEGER DEFAULT 60,
  height_min INTEGER,
  height_max INTEGER,
  marital_status TEXT[],
  religion TEXT[],
  caste TEXT[],
  education TEXT[],
  occupation TEXT[],
  income_min TEXT,
  income_max TEXT,
  city TEXT[],
  state TEXT[],
  country TEXT[] DEFAULT ARRAY['India'],
  food_habit TEXT[],
  star TEXT[],
  dosham TEXT,
  with_photo_only BOOLEAN DEFAULT false,
  created_at TIMESTAMPTZ DEFAULT NOW(),
  updated_at TIMESTAMPTZ DEFAULT NOW()
);

-- ============================================================
-- 4. PHOTOS
-- ============================================================
CREATE TABLE IF NOT EXISTS public.photos (
  id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
  user_id UUID REFERENCES public.profiles(id) ON DELETE CASCADE,
  storage_path TEXT NOT NULL,
  thumbnail_path TEXT,
  is_primary BOOLEAN DEFAULT false,
  is_private BOOLEAN DEFAULT false,
  display_order INTEGER DEFAULT 0,
  is_approved BOOLEAN DEFAULT false,
  created_at TIMESTAMPTZ DEFAULT NOW()
);

-- ============================================================
-- 5. SUBSCRIPTIONS
-- ============================================================
CREATE TABLE IF NOT EXISTS public.subscriptions (
  id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
  user_id UUID REFERENCES public.profiles(id) ON DELETE CASCADE,
  plan_type TEXT NOT NULL CHECK (plan_type IN ('gold','prime_gold','till_u_marry')),
  razorpay_subscription_id TEXT,
  razorpay_payment_id TEXT,
  status TEXT DEFAULT 'active' CHECK (status IN ('active','expired','cancelled','pending')),
  amount INTEGER NOT NULL,
  currency TEXT DEFAULT 'INR',
  starts_at TIMESTAMPTZ DEFAULT NOW(),
  expires_at TIMESTAMPTZ,
  auto_renew BOOLEAN DEFAULT false,
  created_at TIMESTAMPTZ DEFAULT NOW(),
  updated_at TIMESTAMPTZ DEFAULT NOW()
);

-- ============================================================
-- 6. INTERESTS (Profile Interest Requests)
-- ============================================================
CREATE TABLE IF NOT EXISTS public.interests (
  id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
  sender_id UUID REFERENCES public.profiles(id) ON DELETE CASCADE,
  receiver_id UUID REFERENCES public.profiles(id) ON DELETE CASCADE,
  status TEXT DEFAULT 'pending' CHECK (status IN ('pending','accepted','declined','withdrawn')),
  message TEXT,
  created_at TIMESTAMPTZ DEFAULT NOW(),
  updated_at TIMESTAMPTZ DEFAULT NOW(),
  UNIQUE(sender_id, receiver_id)
);

-- ============================================================
-- 7. CHATS
-- ============================================================
CREATE TABLE IF NOT EXISTS public.chats (
  id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
  participant_1 UUID REFERENCES public.profiles(id) ON DELETE CASCADE,
  participant_2 UUID REFERENCES public.profiles(id) ON DELETE CASCADE,
  last_message_text TEXT,
  last_message_at TIMESTAMPTZ,
  is_approved BOOLEAN DEFAULT false,
  created_at TIMESTAMPTZ DEFAULT NOW(),
  UNIQUE(participant_1, participant_2)
);

-- ============================================================
-- 8. MESSAGES
-- ============================================================
CREATE TABLE IF NOT EXISTS public.messages (
  id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
  chat_id UUID REFERENCES public.chats(id) ON DELETE CASCADE,
  sender_id UUID REFERENCES public.profiles(id) ON DELETE CASCADE,
  content TEXT NOT NULL,
  message_type TEXT DEFAULT 'text' CHECK (message_type IN ('text','image','system')),
  is_read BOOLEAN DEFAULT false,
  created_at TIMESTAMPTZ DEFAULT NOW()
);

-- ============================================================
-- 9. USER ACTIVITY
-- ============================================================
CREATE TABLE IF NOT EXISTS public.user_activity (
  id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
  user_id UUID REFERENCES public.profiles(id) ON DELETE CASCADE,
  activity_type TEXT NOT NULL,
  target_user_id UUID,
  metadata JSONB,
  created_at TIMESTAMPTZ DEFAULT NOW()
);

-- ============================================================
-- 10. REPORTS
-- ============================================================
CREATE TABLE IF NOT EXISTS public.reports (
  id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
  reporter_id UUID REFERENCES public.profiles(id) ON DELETE CASCADE,
  reported_user_id UUID REFERENCES public.profiles(id) ON DELETE CASCADE,
  reason TEXT NOT NULL,
  description TEXT,
  status TEXT DEFAULT 'pending' CHECK (status IN ('pending','reviewed','resolved','dismissed')),
  admin_notes TEXT,
  created_at TIMESTAMPTZ DEFAULT NOW(),
  resolved_at TIMESTAMPTZ
);

-- ============================================================
-- 11. NOTIFICATIONS
-- ============================================================
CREATE TABLE IF NOT EXISTS public.notifications (
  id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
  user_id UUID REFERENCES public.profiles(id) ON DELETE CASCADE,
  title TEXT NOT NULL,
  body TEXT NOT NULL,
  type TEXT NOT NULL,
  data JSONB,
  is_read BOOLEAN DEFAULT false,
  created_at TIMESTAMPTZ DEFAULT NOW()
);

-- ============================================================
-- 12. BLOCKED USERS
-- ============================================================
CREATE TABLE IF NOT EXISTS public.blocked_users (
  id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
  blocker_id UUID REFERENCES public.profiles(id) ON DELETE CASCADE,
  blocked_id UUID REFERENCES public.profiles(id) ON DELETE CASCADE,
  reason TEXT,
  created_at TIMESTAMPTZ DEFAULT NOW(),
  UNIQUE(blocker_id, blocked_id)
);


-- ============================================================
-- PERFORMANCE INDEXES
-- ============================================================

-- Profile search indexes
CREATE INDEX IF NOT EXISTS idx_profiles_gender ON profiles(gender);
CREATE INDEX IF NOT EXISTS idx_profiles_religion ON profiles(religion);
CREATE INDEX IF NOT EXISTS idx_profiles_caste ON profiles(caste);
CREATE INDEX IF NOT EXISTS idx_profiles_city ON profiles(city);
CREATE INDEX IF NOT EXISTS idx_profiles_district ON profiles(district);
CREATE INDEX IF NOT EXISTS idx_profiles_state ON profiles(state);
CREATE INDEX IF NOT EXISTS idx_profiles_education ON profiles(education);
CREATE INDEX IF NOT EXISTS idx_profiles_occupation ON profiles(occupation);
CREATE INDEX IF NOT EXISTS idx_profiles_dob ON profiles(date_of_birth);
CREATE INDEX IF NOT EXISTS idx_profiles_income ON profiles(annual_income);
CREATE INDEX IF NOT EXISTS idx_profiles_height ON profiles(height_cm);
CREATE INDEX IF NOT EXISTS idx_profiles_active ON profiles(is_active, last_active_at DESC);
CREATE INDEX IF NOT EXISTS idx_profiles_verified ON profiles(is_verified);
CREATE INDEX IF NOT EXISTS idx_profiles_premium ON profiles(is_premium);
CREATE INDEX IF NOT EXISTS idx_profiles_marital ON profiles(marital_status);
CREATE INDEX IF NOT EXISTS idx_profiles_food ON profiles(food_habit);

-- Composite indexes for common filter combos
CREATE INDEX IF NOT EXISTS idx_profiles_gender_religion ON profiles(gender, religion);
CREATE INDEX IF NOT EXISTS idx_profiles_gender_religion_caste ON profiles(gender, religion, caste);
CREATE INDEX IF NOT EXISTS idx_profiles_gender_city ON profiles(gender, city);
CREATE INDEX IF NOT EXISTS idx_profiles_gender_education ON profiles(gender, education);

-- Chat & messaging indexes
CREATE INDEX IF NOT EXISTS idx_messages_chat_id ON messages(chat_id, created_at DESC);
CREATE INDEX IF NOT EXISTS idx_chats_participant_1 ON chats(participant_1);
CREATE INDEX IF NOT EXISTS idx_chats_participant_2 ON chats(participant_2);
CREATE INDEX IF NOT EXISTS idx_interests_receiver ON interests(receiver_id, status);
CREATE INDEX IF NOT EXISTS idx_interests_sender ON interests(sender_id, status);

-- Notification indexes
CREATE INDEX IF NOT EXISTS idx_notifications_user ON notifications(user_id, is_read, created_at DESC);

-- Activity tracking
CREATE INDEX IF NOT EXISTS idx_activity_user ON user_activity(user_id, created_at DESC);

-- Photo indexes
CREATE INDEX IF NOT EXISTS idx_photos_user ON photos(user_id, display_order);

-- Subscription indexes
CREATE INDEX IF NOT EXISTS idx_subscriptions_user ON subscriptions(user_id, status);


-- ============================================================
-- ROW LEVEL SECURITY (RLS)
-- ============================================================

-- Enable RLS on all tables
ALTER TABLE profiles ENABLE ROW LEVEL SECURITY;
ALTER TABLE horoscope_details ENABLE ROW LEVEL SECURITY;
ALTER TABLE partner_preferences ENABLE ROW LEVEL SECURITY;
ALTER TABLE photos ENABLE ROW LEVEL SECURITY;
ALTER TABLE subscriptions ENABLE ROW LEVEL SECURITY;
ALTER TABLE interests ENABLE ROW LEVEL SECURITY;
ALTER TABLE chats ENABLE ROW LEVEL SECURITY;
ALTER TABLE messages ENABLE ROW LEVEL SECURITY;
ALTER TABLE user_activity ENABLE ROW LEVEL SECURITY;
ALTER TABLE reports ENABLE ROW LEVEL SECURITY;
ALTER TABLE notifications ENABLE ROW LEVEL SECURITY;
ALTER TABLE blocked_users ENABLE ROW LEVEL SECURITY;

-- Profiles: Users can read active profiles, update their own
CREATE POLICY "Anyone can view active profiles" ON profiles
  FOR SELECT USING (is_active = true);

CREATE POLICY "Users can update own profile" ON profiles
  FOR UPDATE USING (auth.uid() = id);

CREATE POLICY "Users can insert own profile" ON profiles
  FOR INSERT WITH CHECK (auth.uid() = id);

-- Horoscope: Users can manage their own
CREATE POLICY "Users can view all horoscopes" ON horoscope_details
  FOR SELECT USING (true);

CREATE POLICY "Users can manage own horoscope" ON horoscope_details
  FOR ALL USING (auth.uid() = user_id);

-- Partner Preferences: Users can manage their own
CREATE POLICY "Users can view own preferences" ON partner_preferences
  FOR SELECT USING (auth.uid() = user_id);

CREATE POLICY "Users can manage own preferences" ON partner_preferences
  FOR ALL USING (auth.uid() = user_id);

-- Photos: Approved photos visible to all, users manage their own
CREATE POLICY "View approved photos" ON photos
  FOR SELECT USING (true);

CREATE POLICY "Users manage own photos" ON photos
  FOR ALL USING (auth.uid() = user_id);

-- Subscriptions: Users can view their own
CREATE POLICY "View own subscriptions" ON subscriptions
  FOR SELECT USING (auth.uid() = user_id);

CREATE POLICY "Insert own subscriptions" ON subscriptions
  FOR INSERT WITH CHECK (auth.uid() = user_id);

-- Interests: Sender and receiver can view
CREATE POLICY "View own interests" ON interests
  FOR SELECT USING (auth.uid() = sender_id OR auth.uid() = receiver_id);

CREATE POLICY "Send interests" ON interests
  FOR INSERT WITH CHECK (auth.uid() = sender_id);

CREATE POLICY "Update received interests" ON interests
  FOR UPDATE USING (auth.uid() = receiver_id OR auth.uid() = sender_id);

-- Chats: Participants can view and create
CREATE POLICY "View own chats" ON chats
  FOR SELECT USING (auth.uid() = participant_1 OR auth.uid() = participant_2);

CREATE POLICY "Create chats" ON chats
  FOR INSERT WITH CHECK (auth.uid() = participant_1 OR auth.uid() = participant_2);

-- Messages: Chat participants can view and send
CREATE POLICY "View chat messages" ON messages
  FOR SELECT USING (
    EXISTS (
      SELECT 1 FROM chats
      WHERE chats.id = messages.chat_id
      AND (chats.participant_1 = auth.uid() OR chats.participant_2 = auth.uid())
    )
  );

CREATE POLICY "Send messages" ON messages
  FOR INSERT WITH CHECK (auth.uid() = sender_id);

CREATE POLICY "Update message read status" ON messages
  FOR UPDATE USING (
    EXISTS (
      SELECT 1 FROM chats
      WHERE chats.id = messages.chat_id
      AND (chats.participant_1 = auth.uid() OR chats.participant_2 = auth.uid())
    )
  );

-- Notifications: Users see their own
CREATE POLICY "View own notifications" ON notifications
  FOR SELECT USING (auth.uid() = user_id);

CREATE POLICY "Update own notifications" ON notifications
  FOR UPDATE USING (auth.uid() = user_id);

-- Reports: Users can create reports
CREATE POLICY "Create reports" ON reports
  FOR INSERT WITH CHECK (auth.uid() = reporter_id);

-- User Activity: Users can insert their own
CREATE POLICY "Insert own activity" ON user_activity
  FOR INSERT WITH CHECK (auth.uid() = user_id);

CREATE POLICY "View own activity" ON user_activity
  FOR SELECT USING (auth.uid() = user_id);

-- Blocked Users: Users manage their own blocks
CREATE POLICY "Manage own blocks" ON blocked_users
  FOR ALL USING (auth.uid() = blocker_id);


-- ============================================================
-- TRIGGERS & FUNCTIONS
-- ============================================================

-- Auto-create profile on signup
CREATE OR REPLACE FUNCTION handle_new_user()
RETURNS TRIGGER AS $$
BEGIN
  INSERT INTO public.profiles (id, display_name, gender, date_of_birth)
  VALUES (
    NEW.id,
    COALESCE(NEW.raw_user_meta_data->>'display_name', 'New User'),
    COALESCE(NEW.raw_user_meta_data->>'gender', 'male'),
    COALESCE((NEW.raw_user_meta_data->>'date_of_birth')::DATE, '2000-01-01'::DATE)
  );
  RETURN NEW;
END;
$$ LANGUAGE plpgsql SECURITY DEFINER;

-- Drop trigger if exists, then create
DROP TRIGGER IF EXISTS on_auth_user_created ON auth.users;
CREATE TRIGGER on_auth_user_created
  AFTER INSERT ON auth.users
  FOR EACH ROW
  EXECUTE FUNCTION handle_new_user();

-- Update timestamp trigger
CREATE OR REPLACE FUNCTION update_updated_at()
RETURNS TRIGGER AS $$
BEGIN
  NEW.updated_at = NOW();
  RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER profiles_updated_at BEFORE UPDATE ON profiles
  FOR EACH ROW EXECUTE FUNCTION update_updated_at();

CREATE TRIGGER horoscope_updated_at BEFORE UPDATE ON horoscope_details
  FOR EACH ROW EXECUTE FUNCTION update_updated_at();

CREATE TRIGGER preferences_updated_at BEFORE UPDATE ON partner_preferences
  FOR EACH ROW EXECUTE FUNCTION update_updated_at();

CREATE TRIGGER subscriptions_updated_at BEFORE UPDATE ON subscriptions
  FOR EACH ROW EXECUTE FUNCTION update_updated_at();

CREATE TRIGGER interests_updated_at BEFORE UPDATE ON interests
  FOR EACH ROW EXECUTE FUNCTION update_updated_at();


-- ============================================================
-- MATCHING FUNCTION (Server-side)
-- ============================================================
CREATE OR REPLACE FUNCTION get_recommended_profiles(
  p_user_id UUID,
  p_limit INTEGER DEFAULT 20,
  p_offset INTEGER DEFAULT 0
)
RETURNS TABLE(
  id UUID, profile_id TEXT, display_name TEXT, gender TEXT,
  date_of_birth DATE, height_cm INTEGER, marital_status TEXT,
  religion TEXT, caste TEXT, city TEXT, district TEXT, state TEXT,
  education TEXT, occupation TEXT, annual_income TEXT,
  food_habit TEXT, is_verified BOOLEAN, is_premium BOOLEAN,
  last_active_at TIMESTAMPTZ, profile_completion_percent INTEGER,
  compatibility_score INTEGER
) AS $$
DECLARE
  v_gender TEXT;
  v_religion TEXT;
  v_caste TEXT;
  v_state TEXT;
BEGIN
  -- Get user's profile
  SELECT p.gender, p.religion, p.caste, p.state
  INTO v_gender, v_religion, v_caste, v_state
  FROM profiles p WHERE p.id = p_user_id;

  RETURN QUERY
  SELECT
    p.id, p.profile_id, p.display_name, p.gender,
    p.date_of_birth, p.height_cm, p.marital_status,
    p.religion, p.caste, p.city, p.district, p.state,
    p.education, p.occupation, p.annual_income,
    p.food_habit, p.is_verified, p.is_premium,
    p.last_active_at, p.profile_completion_percent,
    -- Simple compatibility scoring
    (
      CASE WHEN p.religion = v_religion THEN 20 ELSE 0 END +
      CASE WHEN p.caste = v_caste THEN 15 ELSE 0 END +
      CASE WHEN p.state = v_state THEN 10 ELSE 0 END +
      CASE WHEN p.is_verified THEN 10 ELSE 0 END +
      CASE WHEN p.is_premium THEN 5 ELSE 0 END +
      COALESCE(p.profile_completion_percent / 5, 0) +
      CASE WHEN p.last_active_at > NOW() - INTERVAL '7 days' THEN 10 ELSE 0 END
    )::INTEGER AS compatibility_score
  FROM profiles p
  WHERE p.is_active = true
    AND p.id != p_user_id
    AND p.gender != v_gender
    AND NOT EXISTS (
      SELECT 1 FROM blocked_users b
      WHERE (b.blocker_id = p_user_id AND b.blocked_id = p.id)
         OR (b.blocker_id = p.id AND b.blocked_id = p_user_id)
    )
  ORDER BY
    compatibility_score DESC,
    p.is_premium DESC,
    p.last_active_at DESC
  LIMIT p_limit
  OFFSET p_offset;
END;
$$ LANGUAGE plpgsql SECURITY DEFINER;


-- ============================================================
-- STORAGE BUCKETS
-- ============================================================
-- Run these in Supabase Dashboard > Storage:
-- 1. Create bucket: profile-photos (public)
-- 2. Create bucket: horoscope-images (private)
-- 3. Create bucket: chat-images (private)


-- ============================================================
-- REALTIME
-- ============================================================
-- Enable realtime for messages table
ALTER PUBLICATION supabase_realtime ADD TABLE messages;
ALTER PUBLICATION supabase_realtime ADD TABLE interests;
ALTER PUBLICATION supabase_realtime ADD TABLE notifications;

-- ============================================================
-- HIGH-PERFORMANCE INDEXES FOR MVPs (FlatList & Scroll optimizations)
-- ============================================================
CREATE INDEX IF NOT EXISTS idx_profiles_gender_is_active ON public.profiles(gender, is_active);
CREATE INDEX IF NOT EXISTS idx_profiles_search_composite ON public.profiles(religion, caste, district, is_active);
CREATE INDEX IF NOT EXISTS idx_interests_sender_receiver ON public.interests(sender_id, receiver_id);
CREATE INDEX IF NOT EXISTS idx_user_activity_lookup ON public.user_activity(user_id, activity_type);

-- Check if a user exists with given email or phone
CREATE OR REPLACE FUNCTION public.check_user_exists(p_email TEXT, p_phone TEXT)
RETURNS BOOLEAN AS $$
DECLARE
  v_exists BOOLEAN;
BEGIN
  SELECT EXISTS (
    SELECT 1 FROM auth.users
    WHERE (p_email IS NOT NULL AND p_email <> '' AND email = p_email)
       OR (p_phone IS NOT NULL AND p_phone <> '' AND phone = p_phone)
  ) INTO v_exists;
  
  RETURN v_exists;
END;
$$ LANGUAGE plpgsql SECURITY DEFINER;

