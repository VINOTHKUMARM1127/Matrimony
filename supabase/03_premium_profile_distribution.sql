-- =============================================================================
-- PATCH 03 — Premium Profile Distribution System
-- Implements controlled profile distribution logic.
-- =============================================================================

-- 1. Reconcile or Create subscription_plans table
CREATE TABLE IF NOT EXISTS public.subscription_plans (
  tier TEXT PRIMARY KEY CHECK (tier IN ('free','silver','gold','platinum'))
);

DO $$
BEGIN
  IF EXISTS (SELECT 1 FROM information_schema.columns WHERE table_name = 'subscription_plans' AND column_name = 'price') THEN
    ALTER TABLE public.subscription_plans RENAME COLUMN price TO price_inr;
  END IF;
  IF EXISTS (SELECT 1 FROM information_schema.columns WHERE table_name = 'subscription_plans' AND column_name = 'contact_credits') THEN
    ALTER TABLE public.subscription_plans RENAME COLUMN contact_credits TO contacts_limit;
  END IF;
  IF EXISTS (SELECT 1 FROM information_schema.columns WHERE table_name = 'subscription_plans' AND column_name = 'interest_credits') THEN
    ALTER TABLE public.subscription_plans RENAME COLUMN interest_credits TO interests_limit;
  END IF;
END $$;

ALTER TABLE public.subscription_plans
  ADD COLUMN IF NOT EXISTS plan_name TEXT,
  ADD COLUMN IF NOT EXISTS price_inr INTEGER DEFAULT 0,
  ADD COLUMN IF NOT EXISTS duration_months INTEGER DEFAULT 0,
  ADD COLUMN IF NOT EXISTS contacts_limit INTEGER DEFAULT 0,
  ADD COLUMN IF NOT EXISTS interests_limit INTEGER DEFAULT 0,
  ADD COLUMN IF NOT EXISTS initial_recommended_profiles INTEGER DEFAULT 5,
  ADD COLUMN IF NOT EXISTS initial_nearby_profiles INTEGER DEFAULT 5,
  ADD COLUMN IF NOT EXISTS initial_daily_profiles INTEGER DEFAULT 5,
  ADD COLUMN IF NOT EXISTS daily_recommended_increment INTEGER DEFAULT 0,
  ADD COLUMN IF NOT EXISTS daily_nearby_increment INTEGER DEFAULT 0,
  ADD COLUMN IF NOT EXISTS daily_profiles_increment INTEGER DEFAULT 0,
  ADD COLUMN IF NOT EXISTS features JSONB DEFAULT '[]'::jsonb,
  ADD COLUMN IF NOT EXISTS color_code TEXT DEFAULT '#AAAAAA',
  ADD COLUMN IF NOT EXISTS is_popular BOOLEAN DEFAULT false,
  ADD COLUMN IF NOT EXISTS updated_at TIMESTAMPTZ DEFAULT NOW();

-- Migrate data from tier_settings if any exists
INSERT INTO public.subscription_plans 
(tier, plan_name, price_inr, duration_months, contacts_limit, interests_limit, features, color_code, is_popular,
 initial_recommended_profiles, initial_nearby_profiles, initial_daily_profiles, 
 daily_recommended_increment, daily_nearby_increment, daily_profiles_increment)
SELECT 
  tier, 
  COALESCE(plan_name, initcap(tier)), 
  COALESCE(price_inr, 0), 
  COALESCE(duration_months, 0), 
  COALESCE(contacts_limit, 0), 
  COALESCE(interests_limit, 0), 
  COALESCE(features, '[]'::jsonb), 
  COALESCE(color_code, '#AAAAAA'), 
  COALESCE(is_popular, false),
  COALESCE(recommended_limit, 5), -- Use the old limit as initial
  COALESCE(nearby_limit, 5),
  COALESCE(daily_limit, 5),
  -- Setup defaults for increments based on tier
  CASE WHEN tier='free' THEN 0 WHEN tier='silver' THEN 5 WHEN tier='gold' THEN 10 WHEN tier='platinum' THEN 20 ELSE 0 END,
  CASE WHEN tier='free' THEN 0 WHEN tier='silver' THEN 5 WHEN tier='gold' THEN 10 WHEN tier='platinum' THEN 20 ELSE 0 END,
  CASE WHEN tier='free' THEN 0 WHEN tier='silver' THEN 2 WHEN tier='gold' THEN 5 WHEN tier='platinum' THEN 10 ELSE 0 END
FROM public.tier_settings
ON CONFLICT (tier) DO NOTHING;

-- 2. Create user_profile_distribution table
CREATE TABLE IF NOT EXISTS public.user_profile_distribution (
  id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
  user_id UUID REFERENCES public.profiles(id) ON DELETE CASCADE UNIQUE,
  tier TEXT DEFAULT 'free',
  total_recommended_unlocked INTEGER DEFAULT 5,
  total_nearby_unlocked INTEGER DEFAULT 5,
  total_daily_unlocked INTEGER DEFAULT 5,
  last_distribution_date DATE DEFAULT CURRENT_DATE,
  created_at TIMESTAMPTZ DEFAULT NOW(),
  updated_at TIMESTAMPTZ DEFAULT NOW()
);

-- Backfill existing users with their current tier initial counts
INSERT INTO public.user_profile_distribution (user_id, tier, total_recommended_unlocked, total_nearby_unlocked, total_daily_unlocked)
SELECT 
  p.id,
  COALESCE(p.tier, 'free'),
  sp.initial_recommended_profiles,
  sp.initial_nearby_profiles,
  sp.initial_daily_profiles
FROM public.profiles p
LEFT JOIN public.subscription_plans sp ON COALESCE(p.tier, 'free') = sp.tier
ON CONFLICT (user_id) DO NOTHING;

-- Trigger to auto-create user_profile_distribution for new users
CREATE OR REPLACE FUNCTION public.handle_new_user_distribution() 
RETURNS TRIGGER AS $$
DECLARE
  v_rec INT; v_near INT; v_daily INT;
BEGIN
  SELECT initial_recommended_profiles, initial_nearby_profiles, initial_daily_profiles
  INTO v_rec, v_near, v_daily
  FROM public.subscription_plans WHERE tier = 'free';
  
  INSERT INTO public.user_profile_distribution (user_id, tier, total_recommended_unlocked, total_nearby_unlocked, total_daily_unlocked)
  VALUES (NEW.id, 'free', COALESCE(v_rec, 5), COALESCE(v_near, 5), COALESCE(v_daily, 5))
  ON CONFLICT DO NOTHING;
  
  RETURN NEW;
END;
$$ LANGUAGE plpgsql SECURITY DEFINER;

DROP TRIGGER IF EXISTS on_profile_created_distribution ON public.profiles;
CREATE TRIGGER on_profile_created_distribution
  AFTER INSERT ON public.profiles
  FOR EACH ROW EXECUTE FUNCTION public.handle_new_user_distribution();

-- 3. Run daily distribution RPC
CREATE OR REPLACE FUNCTION public.run_daily_distribution()
RETURNS JSONB
SECURITY DEFINER SET search_path = public AS $$
DECLARE
  updated_count INTEGER := 0;
BEGIN
  WITH updated AS (
    UPDATE public.user_profile_distribution upd
    SET
      total_recommended_unlocked = upd.total_recommended_unlocked + sp.daily_recommended_increment,
      total_nearby_unlocked = upd.total_nearby_unlocked + sp.daily_nearby_increment,
      total_daily_unlocked = upd.total_daily_unlocked + sp.daily_profiles_increment,
      last_distribution_date = CURRENT_DATE,
      updated_at = NOW()
    FROM public.subscription_plans sp
    JOIN public.profiles p ON p.id = upd.user_id
    WHERE p.is_premium = true
      AND p.tier = sp.tier
      AND (upd.last_distribution_date < CURRENT_DATE OR upd.last_distribution_date IS NULL)
    RETURNING upd.id
  )
  SELECT count(*) INTO updated_count FROM updated;
  
  RETURN jsonb_build_object('success', true, 'profiles_updated', updated_count);
END;
$$ LANGUAGE plpgsql;

-- 4. Update purchase_subscription to add initial distributions
DROP FUNCTION IF EXISTS public.purchase_subscription(UUID, TEXT, TEXT, INTEGER);
CREATE OR REPLACE FUNCTION public.purchase_subscription(
  p_user_id    UUID,
  p_plan_type  TEXT,
  p_payment_id TEXT    DEFAULT NULL,
  p_amount     INTEGER DEFAULT NULL
) RETURNS JSONB
SECURITY DEFINER SET search_path = public AS $$
DECLARE
  v_plan            RECORD;
  v_current_expiry  TIMESTAMPTZ;
  v_new_expiry      TIMESTAMPTZ;
  v_prof            RECORD;
BEGIN
  IF p_plan_type IN ('free','non_premium') THEN
    RAISE EXCEPTION 'INVALID_PLAN: cannot purchase the free tier';
  END IF;

  SELECT * INTO v_plan FROM subscription_plans WHERE tier = p_plan_type;

  IF v_plan IS NULL THEN
    RAISE EXCEPTION 'INVALID_PLAN_TYPE: %', p_plan_type;
  END IF;

  SELECT tier, is_premium, premium_expires_at INTO v_prof FROM profiles WHERE id = p_user_id;

  -- Stacking logic
  IF v_prof.premium_expires_at IS NOT NULL AND v_prof.premium_expires_at > NOW() THEN
    v_new_expiry := v_prof.premium_expires_at + (v_plan.duration_months || ' months')::INTERVAL;
  ELSE
    v_new_expiry := NOW() + (v_plan.duration_months || ' months')::INTERVAL;
  END IF;

  UPDATE profiles SET
    tier                = p_plan_type,
    is_premium          = true,
    is_verified         = true,
    premium_expires_at  = v_new_expiry,
    contacts_remaining  = GREATEST(0, COALESCE(contacts_remaining,0))  + v_plan.contacts_limit,
    interests_remaining = GREATEST(0, COALESCE(interests_remaining,0)) + v_plan.interests_limit
  WHERE id = p_user_id;

  INSERT INTO subscriptions
    (user_id, plan_type, status, amount, razorpay_payment_id, contacts_added, interests_added, starts_at, expires_at)
  VALUES
    (p_user_id, p_plan_type, 'active', COALESCE(p_amount, v_plan.price_inr), p_payment_id, v_plan.contacts_limit, v_plan.interests_limit, NOW(), v_new_expiry);

  -- Handle Profile Distribution logic
  -- If upgrading from free or switching to a new tier, add initial distributions
  IF v_prof.tier IS DISTINCT FROM p_plan_type THEN
    UPDATE user_profile_distribution SET
      tier = p_plan_type,
      total_recommended_unlocked = total_recommended_unlocked + v_plan.initial_recommended_profiles,
      total_nearby_unlocked = total_nearby_unlocked + v_plan.initial_nearby_profiles,
      total_daily_unlocked = total_daily_unlocked + v_plan.initial_daily_profiles,
      updated_at = NOW()
    WHERE user_id = p_user_id;
  END IF;

  RETURN jsonb_build_object(
    'success', true, 'tier', p_plan_type, 'expires_at', v_new_expiry,
    'contacts_added', v_plan.contacts_limit, 'interests_added', v_plan.interests_limit
  );
END;
$$ LANGUAGE plpgsql;

-- 5. Modify Feed RPCs to use user_profile_distribution limits
-- Recommended
CREATE OR REPLACE FUNCTION public.get_recommended_profiles(
  p_user_id UUID, p_limit INTEGER DEFAULT 20, p_offset INTEGER DEFAULT 0
)
RETURNS TABLE(
  id UUID, profile_id TEXT, display_name TEXT, gender TEXT, date_of_birth DATE,
  height_cm INTEGER, marital_status TEXT, religion TEXT, caste TEXT,
  city TEXT, district TEXT, state TEXT, education TEXT, occupation TEXT,
  annual_income TEXT, food_habit TEXT, about_me TEXT, is_verified BOOLEAN,
  is_premium BOOLEAN, tier TEXT, last_active_at TIMESTAMPTZ,
  profile_completion_percent INTEGER, compatibility_score INTEGER
)
SECURITY DEFINER SET search_path = public AS $$
DECLARE
  v RECORD; v_tier TEXT; v_limit INTEGER; p RECORD;
BEGIN
  SELECT me.gender, me.religion, me.caste, me.state, me.district, me.tier, me.date_of_birth
    INTO v FROM profiles me WHERE me.id = p_user_id;
  v_tier := COALESCE(v.tier, 'free');

  -- READ FROM USER PROFILE DISTRIBUTION
  SELECT total_recommended_unlocked INTO v_limit
    FROM user_profile_distribution upd WHERE upd.user_id = p_user_id;
  v_limit := COALESCE(v_limit, 5);

  p_limit := LEAST(p_limit, GREATEST(0, v_limit - p_offset));
  IF p_limit <= 0 THEN RETURN; END IF;

  SELECT * INTO p FROM partner_preferences WHERE user_id = p_user_id;

  RETURN QUERY
  SELECT pr.id, pr.profile_id, pr.display_name, pr.gender, pr.date_of_birth,
         pr.height_cm, pr.marital_status, pr.religion, pr.caste,
         pr.city, pr.district, pr.state, pr.education, pr.occupation,
         pr.annual_income, pr.food_habit, pr.about_me, pr.is_verified,
         pr.is_premium, pr.tier, pr.last_active_at, pr.profile_completion_percent,
         (
           (CASE WHEN pr.religion = v.religion THEN 20 ELSE 0 END) +
           (CASE WHEN pr.caste    = v.caste    THEN 15 ELSE 0 END) +
           (CASE WHEN pr.district = v.district THEN 15 ELSE 0 END) +
           (CASE WHEN pr.state    = v.state    THEN 10 ELSE 0 END) +
           (CASE WHEN pr.is_verified THEN 10 ELSE 0 END) +
           (CASE WHEN pr.is_premium  THEN 5  ELSE 0 END) +
           COALESCE(pr.profile_completion_percent / 5, 0) +
           (CASE WHEN pr.last_active_at > NOW() - INTERVAL '7 days' THEN 10 ELSE 0 END)
         )::INTEGER AS compatibility_score
  FROM profiles pr
  WHERE pr.is_active = true
    AND pr.id <> p_user_id
    AND pr.gender <> v.gender
    AND NOT public._feed_excluded(p_user_id, pr.id)
    AND (p.age_min IS NULL OR pr.date_of_birth <= (CURRENT_DATE - (p.age_min || ' years')::INTERVAL))
    AND (p.age_max IS NULL OR pr.date_of_birth >= (CURRENT_DATE - ((p.age_max + 1) || ' years')::INTERVAL))
    AND (p.religion       IS NULL OR array_length(p.religion,1)       IS NULL OR pr.religion       = ANY(p.religion))
    AND (p.caste          IS NULL OR array_length(p.caste,1)          IS NULL OR pr.caste          = ANY(p.caste) OR 'Caste No Bar' = ANY(p.caste))
    AND (p.education      IS NULL OR array_length(p.education,1)      IS NULL OR pr.education      = ANY(p.education))
    AND (p.occupation     IS NULL OR array_length(p.occupation,1)     IS NULL OR pr.occupation     = ANY(p.occupation))
    AND (p.marital_status IS NULL OR array_length(p.marital_status,1) IS NULL OR pr.marital_status = ANY(p.marital_status))
    AND (p.districts      IS NULL OR array_length(p.districts,1)      IS NULL OR pr.district       = ANY(p.districts))
    AND (p.states         IS NULL OR array_length(p.states,1)         IS NULL OR pr.state          = ANY(p.states))
  ORDER BY
    compatibility_score DESC, pr.last_active_at DESC
  LIMIT p_limit OFFSET p_offset;
END;
$$ LANGUAGE plpgsql;

-- Nearby
CREATE OR REPLACE FUNCTION public.get_nearby_profiles(
  p_user_id UUID, p_limit INTEGER DEFAULT 20, p_offset INTEGER DEFAULT 0
)
RETURNS TABLE(
  id UUID, profile_id TEXT, display_name TEXT, gender TEXT, date_of_birth DATE,
  height_cm INTEGER, marital_status TEXT, religion TEXT, caste TEXT,
  city TEXT, district TEXT, state TEXT, education TEXT, occupation TEXT,
  annual_income TEXT, food_habit TEXT, about_me TEXT, is_verified BOOLEAN,
  is_premium BOOLEAN, tier TEXT, last_active_at TIMESTAMPTZ,
  profile_completion_percent INTEGER, compatibility_score INTEGER
)
SECURITY DEFINER SET search_path = public AS $$
DECLARE
  v RECORD; v_tier TEXT; v_limit INTEGER;
BEGIN
  SELECT me.gender, me.district, me.state, me.tier INTO v FROM profiles me WHERE me.id = p_user_id;
  v_tier := COALESCE(v.tier, 'free');

  SELECT total_nearby_unlocked INTO v_limit
    FROM user_profile_distribution upd WHERE upd.user_id = p_user_id;
  v_limit := COALESCE(v_limit, 5);

  p_limit := LEAST(p_limit, GREATEST(0, v_limit - p_offset));
  IF p_limit <= 0 THEN RETURN; END IF;

  RETURN QUERY
  SELECT pr.id, pr.profile_id, pr.display_name, pr.gender, pr.date_of_birth,
         pr.height_cm, pr.marital_status, pr.religion, pr.caste,
         pr.city, pr.district, pr.state, pr.education, pr.occupation,
         pr.annual_income, pr.food_habit, pr.about_me, pr.is_verified,
         pr.is_premium, pr.tier, pr.last_active_at, pr.profile_completion_percent,
         (
           CASE
             WHEN pr.district = v.district THEN 1000
             WHEN EXISTS (SELECT 1 FROM district_adjacency da
                          WHERE da.district = v.district AND da.neighbor = pr.district) THEN 800
             WHEN pr.state = v.state THEN 500
             ELSE 100
           END
           + (CASE WHEN pr.is_verified THEN 10 ELSE 0 END)
           + (CASE WHEN pr.is_premium  THEN 5  ELSE 0 END)
           + COALESCE(pr.profile_completion_percent / 10, 0)
         )::INTEGER AS compatibility_score
  FROM profiles pr
  WHERE pr.is_active = true
    AND pr.id <> p_user_id
    AND pr.gender <> v.gender
    AND NOT public._feed_excluded(p_user_id, pr.id)
  ORDER BY
    compatibility_score DESC,
    pr.last_active_at DESC
  LIMIT p_limit OFFSET p_offset;
END;
$$ LANGUAGE plpgsql;

-- Daily
CREATE OR REPLACE FUNCTION public.get_daily_matches(
  p_user_id UUID, p_limit INTEGER DEFAULT 10, p_offset INTEGER DEFAULT 0
)
RETURNS TABLE(
  id UUID, profile_id TEXT, display_name TEXT, gender TEXT, date_of_birth DATE,
  height_cm INTEGER, marital_status TEXT, religion TEXT, caste TEXT,
  city TEXT, district TEXT, state TEXT, education TEXT, occupation TEXT,
  annual_income TEXT, food_habit TEXT, about_me TEXT, is_verified BOOLEAN,
  is_premium BOOLEAN, tier TEXT, last_active_at TIMESTAMPTZ,
  profile_completion_percent INTEGER, compatibility_score INTEGER
)
SECURITY DEFINER SET search_path = public AS $$
DECLARE
  v RECORD; v_tier TEXT; v_limit INTEGER;
  v_seen UUID[]; v_today UUID[]; v_today_date DATE; v_window UUID[];
BEGIN
  SELECT me.gender, me.tier INTO v FROM profiles me WHERE me.id = p_user_id;
  v_tier := COALESCE(v.tier, 'free');

  SELECT total_daily_unlocked INTO v_limit
    FROM user_profile_distribution upd WHERE upd.user_id = p_user_id;
  v_limit := COALESCE(v_limit, 5);

  SELECT profile_ids, todays_ids, todays_date
    INTO v_seen, v_today, v_today_date
    FROM user_profile_views WHERE user_id = p_user_id AND section = 'daily';
  v_seen := COALESCE(v_seen, ARRAY[]::UUID[]);

  -- Always dynamic for daily: compute (or reuse) TODAY'S window of fresh, unseen profiles.
  IF v_today_date IS DISTINCT FROM CURRENT_DATE OR v_today IS NULL OR array_length(v_today,1) IS NULL THEN
    SELECT ARRAY(
      SELECT pr.id FROM profiles pr
      WHERE pr.is_active = true AND pr.id <> p_user_id AND pr.gender <> v.gender
        AND pr.id <> ALL(v_seen)
        AND NOT public._feed_excluded(p_user_id, pr.id)
      ORDER BY md5(p_user_id::text || CURRENT_DATE::text || pr.id::text)
      LIMIT v_limit
    ) INTO v_window;

    IF v_window IS NULL OR array_length(v_window,1) IS NULL THEN
      v_seen := ARRAY[]::UUID[];
      SELECT ARRAY(
        SELECT pr.id FROM profiles pr
        WHERE pr.is_active = true AND pr.id <> p_user_id AND pr.gender <> v.gender
          AND NOT public._feed_excluded(p_user_id, pr.id)
        ORDER BY md5(p_user_id::text || CURRENT_DATE::text || pr.id::text)
        LIMIT v_limit
      ) INTO v_window;
    END IF;
    v_window := COALESCE(v_window, ARRAY[]::UUID[]);

    INSERT INTO user_profile_views (user_id, section, profile_ids, todays_ids, todays_date, last_updated)
    VALUES (p_user_id, 'daily',
            ARRAY(SELECT DISTINCT unnest(v_seen || v_window)),
            v_window, CURRENT_DATE, CURRENT_DATE)
    ON CONFLICT (user_id, section) DO UPDATE SET
      profile_ids  = ARRAY(SELECT DISTINCT unnest(user_profile_views.profile_ids || EXCLUDED.todays_ids)),
      todays_ids   = EXCLUDED.todays_ids,
      todays_date  = CURRENT_DATE,
      last_updated = CURRENT_DATE;
  ELSE
    v_window := v_today;
  END IF;

  p_limit := LEAST(p_limit, GREATEST(0, COALESCE(array_length(v_window,1),0) - p_offset));
  IF p_limit <= 0 THEN RETURN; END IF;

  RETURN QUERY
  SELECT pr.id, pr.profile_id, pr.display_name, pr.gender, pr.date_of_birth,
         pr.height_cm, pr.marital_status, pr.religion, pr.caste,
         pr.city, pr.district, pr.state, pr.education, pr.occupation,
         pr.annual_income, pr.food_habit, pr.about_me, pr.is_verified,
         pr.is_premium, pr.tier, pr.last_active_at, pr.profile_completion_percent,
         60::INTEGER
  FROM profiles pr
  JOIN unnest(v_window) WITH ORDINALITY AS w(wid, ord) ON w.wid = pr.id
  ORDER BY w.ord
  LIMIT p_limit OFFSET p_offset;
END;
$$ LANGUAGE plpgsql;

-- 6. Modify get_user_quotas
DROP FUNCTION IF EXISTS public.get_user_quotas(UUID);
CREATE OR REPLACE FUNCTION public.get_user_quotas(p_user_id UUID)
RETURNS JSONB
SECURITY DEFINER SET search_path = public AS $$
DECLARE
  v_prof RECORD;
  v_ts   RECORD;
  v_upd  RECORD;
  v_tier TEXT;
BEGIN
  SELECT tier, is_premium, premium_expires_at, contacts_remaining, interests_remaining
    INTO v_prof FROM profiles WHERE id = p_user_id;

  IF v_prof IS NULL THEN
    RETURN jsonb_build_object('tier','FREE','contacts_remaining',0,'interests_remaining',0);
  END IF;

  v_tier := COALESCE(v_prof.tier, 'free');
  IF v_prof.is_premium AND v_prof.premium_expires_at IS NOT NULL AND v_prof.premium_expires_at < NOW() THEN
    UPDATE profiles SET is_premium = false, tier = 'free', contacts_remaining = 0, interests_remaining = 0 WHERE id = p_user_id;
    v_tier := 'free';
    v_prof.contacts_remaining := 0;
    v_prof.interests_remaining := 0;
    v_prof.is_premium := false;
  END IF;

  SELECT * INTO v_ts FROM subscription_plans WHERE tier = v_tier;
  SELECT * INTO v_upd FROM user_profile_distribution WHERE user_id = p_user_id;

  RETURN jsonb_build_object(
    'tier',                UPPER(v_tier),
    'is_premium',          v_prof.is_premium,
    'expires_at',          v_prof.premium_expires_at,
    'contacts_remaining',  COALESCE(v_prof.contacts_remaining, 0),
    'interests_remaining', COALESCE(v_prof.interests_remaining, 0),
    'recommended_limit',   COALESCE(v_upd.total_recommended_unlocked, v_ts.initial_recommended_profiles, 5),
    'nearby_limit',        COALESCE(v_upd.total_nearby_unlocked, v_ts.initial_nearby_profiles, 5),
    'daily_limit',         COALESCE(v_upd.total_daily_unlocked, v_ts.initial_daily_profiles, 5)
  );
END;
$$ LANGUAGE plpgsql;

-- 7. Add Update Admin Function for subscription_plans
CREATE OR REPLACE FUNCTION public.update_subscription_plan(
  p_tier TEXT,
  p_plan_name TEXT DEFAULT NULL,
  p_price_inr INTEGER DEFAULT NULL,
  p_duration_months INTEGER DEFAULT NULL,
  p_contacts_limit INTEGER DEFAULT NULL,
  p_interests_limit INTEGER DEFAULT NULL,
  p_initial_recommended_profiles INTEGER DEFAULT NULL,
  p_initial_nearby_profiles INTEGER DEFAULT NULL,
  p_initial_daily_profiles INTEGER DEFAULT NULL,
  p_daily_recommended_increment INTEGER DEFAULT NULL,
  p_daily_nearby_increment INTEGER DEFAULT NULL,
  p_daily_profiles_increment INTEGER DEFAULT NULL,
  p_features JSONB DEFAULT NULL,
  p_color_code TEXT DEFAULT NULL,
  p_is_popular BOOLEAN DEFAULT NULL
) RETURNS VOID
SECURITY DEFINER SET search_path = public AS $$
BEGIN
  UPDATE public.subscription_plans SET
    plan_name = COALESCE(p_plan_name, plan_name),
    price_inr = COALESCE(p_price_inr, price_inr),
    duration_months = COALESCE(p_duration_months, duration_months),
    contacts_limit = COALESCE(p_contacts_limit, contacts_limit),
    interests_limit = COALESCE(p_interests_limit, interests_limit),
    initial_recommended_profiles = COALESCE(p_initial_recommended_profiles, initial_recommended_profiles),
    initial_nearby_profiles = COALESCE(p_initial_nearby_profiles, initial_nearby_profiles),
    initial_daily_profiles = COALESCE(p_initial_daily_profiles, initial_daily_profiles),
    daily_recommended_increment = COALESCE(p_daily_recommended_increment, daily_recommended_increment),
    daily_nearby_increment = COALESCE(p_daily_nearby_increment, daily_nearby_increment),
    daily_profiles_increment = COALESCE(p_daily_profiles_increment, daily_profiles_increment),
    features = COALESCE(p_features, features),
    color_code = COALESCE(p_color_code, color_code),
    is_popular = COALESCE(p_is_popular, is_popular),
    updated_at = NOW()
  WHERE tier = p_tier;
END;
$$ LANGUAGE plpgsql;

-- RLS
ALTER TABLE public.subscription_plans ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.user_profile_distribution ENABLE ROW LEVEL SECURITY;

DROP POLICY IF EXISTS "read subscription_plans" ON public.subscription_plans;
CREATE POLICY "read subscription_plans" ON public.subscription_plans FOR SELECT USING (true);

DROP POLICY IF EXISTS "own profile dist" ON public.user_profile_distribution;
CREATE POLICY "own profile dist" ON public.user_profile_distribution FOR SELECT USING (auth.uid() = user_id);

NOTIFY pgrst, 'reload schema';
