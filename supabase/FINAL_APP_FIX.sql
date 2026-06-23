-- ============================================================================
-- MISSING PREREQUISITES
-- ============================================================================

CREATE TABLE IF NOT EXISTS public.interests (
  id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
  sender_id UUID REFERENCES public.profiles(id) ON DELETE CASCADE,
  receiver_id UUID REFERENCES public.profiles(id) ON DELETE CASCADE,
  status TEXT DEFAULT 'pending' CHECK (status IN ('pending','accepted','declined','withdrawn','passed')),
  message TEXT,
  created_at TIMESTAMPTZ DEFAULT NOW(),
  updated_at TIMESTAMPTZ DEFAULT NOW(),
  UNIQUE(sender_id, receiver_id)
);

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

CREATE TABLE IF NOT EXISTS public.blocked_users (
  id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
  blocker_id UUID REFERENCES public.profiles(id) ON DELETE CASCADE,
  blocked_id UUID REFERENCES public.profiles(id) ON DELETE CASCADE,
  reason TEXT,
  created_at TIMESTAMPTZ DEFAULT NOW(),
  UNIQUE(blocker_id, blocked_id)
);

CREATE TABLE IF NOT EXISTS public.user_profile_views (
  user_id UUID REFERENCES public.profiles(id) ON DELETE CASCADE,
  section TEXT CHECK (section IN ('recommended','nearby','daily')),
  profile_ids UUID[] DEFAULT ARRAY[]::UUID[],
  todays_ids UUID[] DEFAULT ARRAY[]::UUID[],
  todays_date DATE,
  last_updated DATE DEFAULT CURRENT_DATE,
  PRIMARY KEY (user_id, section)
);

CREATE OR REPLACE FUNCTION public._feed_excluded(p_viewer UUID, p_candidate UUID)
RETURNS BOOLEAN
SECURITY DEFINER SET search_path = public AS $$
  SELECT
    EXISTS (SELECT 1 FROM blocked_users b
            WHERE (b.blocker_id = p_viewer AND b.blocked_id = p_candidate)
               OR (b.blocker_id = p_candidate AND b.blocked_id = p_viewer))
    OR EXISTS (SELECT 1 FROM interests i
            WHERE (i.sender_id = p_viewer AND i.receiver_id = p_candidate)
               OR (i.sender_id = p_candidate AND i.receiver_id = p_viewer))
    OR EXISTS (SELECT 1 FROM reports r
            WHERE (r.reporter_id = p_viewer AND r.reported_user_id = p_candidate)
               OR (r.reporter_id = p_candidate AND r.reported_user_id = p_viewer));
$$ LANGUAGE sql STABLE;

CREATE OR REPLACE FUNCTION public.feed_allocation(
  p_user_id UUID, p_section TEXT, p_limit INTEGER, p_ranked UUID[]
) RETURNS TABLE(pid UUID, is_new_today BOOLEAN)
SECURITY DEFINER SET search_path = public AS $$
DECLARE
  v_existing UUID[];
  v_today    UUID[];
  v_date     DATE;
  v_kept     UUID[];
  v_append   UUID[];
  v_final    UUID[];
  v_newtoday UUID[];
BEGIN
  p_limit  := GREATEST(0, COALESCE(p_limit, 0));
  p_ranked := COALESCE(p_ranked, ARRAY[]::UUID[]);

  SELECT profile_ids, todays_ids, todays_date
    INTO v_existing, v_today, v_date
    FROM user_profile_views
   WHERE user_id = p_user_id AND section = p_section;
  v_existing := COALESCE(v_existing, ARRAY[]::UUID[]);

  v_kept := ARRAY(
    SELECT e FROM unnest(v_existing) WITH ORDINALITY AS x(e, ord)
    WHERE e = ANY(p_ranked)
    ORDER BY x.ord
  );

  IF COALESCE(array_length(v_kept, 1), 0) > p_limit THEN
    v_kept := ARRAY(
      SELECT e FROM unnest(v_kept) WITH ORDINALITY AS x(e, ord)
      WHERE x.ord <= p_limit ORDER BY x.ord
    );
  END IF;

  v_append := ARRAY(
    SELECT r FROM unnest(p_ranked) WITH ORDINALITY AS y(r, ord)
    WHERE r <> ALL(v_kept)
    ORDER BY y.ord
    LIMIT GREATEST(0, p_limit - COALESCE(array_length(v_kept, 1), 0))
  );
  v_append := COALESCE(v_append, ARRAY[]::UUID[]);

  v_final := v_kept || v_append;

  IF v_date = CURRENT_DATE THEN
    v_newtoday := COALESCE(v_today, ARRAY[]::UUID[]) || v_append;
  ELSE
    v_newtoday := v_append;
  END IF;

  INSERT INTO user_profile_views (user_id, section, profile_ids, todays_ids, todays_date, last_updated)
  VALUES (p_user_id, p_section, v_final, v_newtoday, CURRENT_DATE, CURRENT_DATE)
  ON CONFLICT (user_id, section) DO UPDATE SET
    profile_ids  = EXCLUDED.profile_ids,
    todays_ids   = EXCLUDED.todays_ids,
    todays_date  = EXCLUDED.todays_date,
    last_updated = EXCLUDED.last_updated;

  RETURN QUERY
    SELECT f, (f = ANY(v_newtoday))
    FROM unnest(v_final) WITH ORDINALITY AS z(f, ord)
    ORDER BY z.ord;
END;
$$ LANGUAGE plpgsql;

-- ============================================================================
-- WEDRING — CONSOLIDATED DISTRIBUTION FIX  (single source of truth)
-- ----------------------------------------------------------------------------
-- Run this ONE file, top to bottom, in the Supabase SQL editor.
-- Idempotent and self-verifying — safe to re-run on the existing database.
--
-- WHY THIS FILE EXISTS
-- --------------------
-- The upgrade-distribution bug (Free -> Gold activates, tier flips, but the
-- configured initial profiles never appear in Matches) is caused by SCHEMA
-- FRAGMENTATION across many older patch files:
--
--   * TWO per-user state tables:
--       - user_distribution_state   (cols: *_profiles_shown)   <-- CANONICAL
--       - user_profile_distribution (cols: total_*_unlocked)   <-- mirror only
--   * TWO subscription_plans column schemas:
--       - price / contact_credits / interest_credits
--       - price_inr / contacts_limit / interests_limit         <-- CANONICAL
--   * ~12 competing purchase_subscription definitions.
--
-- Depending on which old file was deployed LAST, the function that GRANTS the
-- initial pool and the feed RPCs that READ the pool could point at different
-- tables/columns, so the per-user cap the feeds read never grew on upgrade.
--
-- THIS FILE collapses everything to ONE schema:
--   subscription_plans (price_inr/contacts_limit/...) -> user_distribution_state
--   (*_profiles_shown) is the SINGLE source of truth for all three feeds.
--
-- It SUPERSEDES the distribution/purchase portions of:
--   03_premium_profile_distribution.sql, migration_distribution_v3.sql,
--   update_premium_plans_schema.sql, hotfix_subscription_queue.sql,
--   hotfix_tier_patch.sql, hotfix_daily_feed.sql, deploy_all.sql (parts 2-3).
-- After running this, deploy ONLY this file for distribution changes.
--
-- PREREQUISITES already live in your DB (used by the existing feeds):
--   public.feed_allocation(UUID, TEXT, INTEGER, UUID[])
--   public._feed_excluded(UUID, UUID)
-- The verify block at the end RAISES if they are missing.
-- ============================================================================

-- ============================================================================
-- 0. PREREQUISITE CHECK — fail early with a clear message.
-- ============================================================================
DO $pre$
BEGIN
  IF NOT EXISTS (SELECT 1 FROM pg_proc p JOIN pg_namespace n ON n.oid=p.pronamespace
                 WHERE n.nspname='public' AND p.proname='feed_allocation') THEN
    RAISE EXCEPTION 'PREREQ MISSING: public.feed_allocation() — deploy hotfix_feed_dedup.sql first.';
  END IF;
  IF NOT EXISTS (SELECT 1 FROM pg_proc p JOIN pg_namespace n ON n.oid=p.pronamespace
                 WHERE n.nspname='public' AND p.proname='_feed_excluded') THEN
    RAISE EXCEPTION 'PREREQ MISSING: public._feed_excluded() — deploy the feed dedup helpers first.';
  END IF;
END $pre$;

-- ============================================================================
-- 1. RECONCILE subscription_plans COLUMNS (canonical: price_inr/contacts_limit/...)
-- ============================================================================
CREATE TABLE IF NOT EXISTS public.subscription_plans (
  tier TEXT PRIMARY KEY CHECK (tier IN ('free','silver','gold','platinum'))
);

DO $cols$
BEGIN
  -- Rename the v3 column names to the canonical ones if they are present.
  IF EXISTS (SELECT 1 FROM information_schema.columns
             WHERE table_schema='public' AND table_name='subscription_plans' AND column_name='price') THEN
    ALTER TABLE public.subscription_plans RENAME COLUMN price TO price_inr;
  END IF;
  IF EXISTS (SELECT 1 FROM information_schema.columns
             WHERE table_schema='public' AND table_name='subscription_plans' AND column_name='contact_credits') THEN
    ALTER TABLE public.subscription_plans RENAME COLUMN contact_credits TO contacts_limit;
  END IF;
  IF EXISTS (SELECT 1 FROM information_schema.columns
             WHERE table_schema='public' AND table_name='subscription_plans' AND column_name='interest_credits') THEN
    ALTER TABLE public.subscription_plans RENAME COLUMN interest_credits TO interests_limit;
  END IF;
END $cols$;

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

-- Seed the four tiers if missing (admin can edit all values afterwards).
INSERT INTO public.subscription_plans
  (tier, plan_name, price_inr, duration_months, contacts_limit, interests_limit,
   initial_recommended_profiles, initial_nearby_profiles, initial_daily_profiles,
   daily_recommended_increment, daily_nearby_increment, daily_profiles_increment,
   features, color_code, is_popular)
VALUES
  ('free',     'Free',     0,    0,  0,   0,   5,  5,  5,  0,  0,  0, '[]'::jsonb, '#AAAAAA', false),
  ('silver',   'Silver',   499,  1,  30,  50,  50, 50, 50, 5,  5,  3, '[]'::jsonb, '#8A8A8A', false),
  ('gold',     'Gold',     999,  1,  50,  100, 100,100,100,10, 10, 5, '[]'::jsonb, '#D4AF37', true),
  ('platinum', 'Platinum', 2499, 3,  100, 300, 200,200,200,15, 15, 10,'[]'::jsonb, '#E5E4E2', false)
ON CONFLICT (tier) DO NOTHING;

ALTER TABLE public.subscription_plans ENABLE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "read subscription_plans" ON public.subscription_plans;
CREATE POLICY "read subscription_plans" ON public.subscription_plans FOR SELECT USING (true);
DROP POLICY IF EXISTS "Admins manage subscription_plans" ON public.subscription_plans;
CREATE POLICY "Admins manage subscription_plans" ON public.subscription_plans FOR ALL USING (
  EXISTS (SELECT 1 FROM admin_users WHERE email = auth.email() AND role = 'admin')
);

-- ============================================================================
-- 2. CANONICAL per-user state table: user_distribution_state (*_profiles_shown)
-- ============================================================================
CREATE TABLE IF NOT EXISTS public.user_distribution_state (
  user_id UUID PRIMARY KEY REFERENCES auth.users(id) ON DELETE CASCADE,
  highest_tier_ever_reached TEXT DEFAULT 'free',
  initial_distribution_granted_tiers TEXT[] DEFAULT '{}',
  recommended_profiles_shown INTEGER DEFAULT 0,
  nearby_profiles_shown INTEGER DEFAULT 0,
  daily_profiles_shown INTEGER DEFAULT 0,
  last_distribution_date DATE,
  created_at TIMESTAMPTZ DEFAULT NOW(),
  updated_at TIMESTAMPTZ DEFAULT NOW()
);

ALTER TABLE public.user_distribution_state ENABLE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "Users read own distribution state" ON public.user_distribution_state;
CREATE POLICY "Users read own distribution state" ON public.user_distribution_state
  FOR SELECT USING (auth.uid() = user_id);
DROP POLICY IF EXISTS "Admin full access distribution state" ON public.user_distribution_state;
CREATE POLICY "Admin full access distribution state" ON public.user_distribution_state FOR ALL USING (
  EXISTS (SELECT 1 FROM admin_users WHERE email = auth.email() AND role = 'admin')
);

-- Wallet (consumable credits) — canonical credit store the app reads.
CREATE TABLE IF NOT EXISTS public.user_wallet (
  user_id UUID PRIMARY KEY REFERENCES auth.users(id) ON DELETE CASCADE,
  contact_credits INTEGER DEFAULT 0,
  interest_credits INTEGER DEFAULT 0,
  updated_at TIMESTAMPTZ DEFAULT NOW()
);
ALTER TABLE public.user_wallet ENABLE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "Users read own wallet" ON public.user_wallet;
CREATE POLICY "Users read own wallet" ON public.user_wallet FOR SELECT USING (auth.uid() = user_id);
DROP POLICY IF EXISTS "Admin full access wallet" ON public.user_wallet;
CREATE POLICY "Admin full access wallet" ON public.user_wallet FOR ALL USING (
  EXISTS (SELECT 1 FROM admin_users WHERE email = auth.email() AND role = 'admin')
);

-- Legacy mirror table kept only so the older admin views don't 404. NOT read by
-- any feed. Ensure it exists so the mirror UPDATE in _grant_plan_benefits is safe.
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

-- ----------------------------------------------------------------------------
-- 2b. BACKFILL: every profile gets a wallet + distribution-state row whose pools
--     match its CURRENT tier, and a granted-tiers array consistent with it.
-- ----------------------------------------------------------------------------
INSERT INTO public.user_wallet (user_id, contact_credits, interest_credits)
SELECT p.id, GREATEST(0, COALESCE(p.contacts_remaining,0)), GREATEST(0, COALESCE(p.interests_remaining,0))
FROM public.profiles p
ON CONFLICT (user_id) DO NOTHING;

INSERT INTO public.user_distribution_state
  (user_id, highest_tier_ever_reached, initial_distribution_granted_tiers,
   recommended_profiles_shown, nearby_profiles_shown, daily_profiles_shown)
SELECT
  p.id,
  COALESCE(p.tier,'free'),
  CASE COALESCE(p.tier,'free')
    WHEN 'free'     THEN ARRAY['free']
    WHEN 'silver'   THEN ARRAY['free','silver']
    WHEN 'gold'     THEN ARRAY['free','silver','gold']
    WHEN 'platinum' THEN ARRAY['free','silver','gold','platinum']
  END,
  COALESCE((SELECT initial_recommended_profiles FROM subscription_plans WHERE tier = COALESCE(p.tier,'free')), 5),
  COALESCE((SELECT initial_nearby_profiles      FROM subscription_plans WHERE tier = COALESCE(p.tier,'free')), 5),
  COALESCE((SELECT initial_daily_profiles       FROM subscription_plans WHERE tier = COALESCE(p.tier,'free')), 5)
FROM public.profiles p
ON CONFLICT (user_id) DO NOTHING;

-- ----------------------------------------------------------------------------
-- 2c. ONE-TIME CORRECTION for the old additive-initial bug.
--     Earlier code ADDED each tier's initial onto the existing pool, so e.g. a
--     Silver user ended up with free(3/4/5) + silver(8/10/8) = 11/14/13 instead
--     of the configured 8/10/8. Reset each affected user's pool to EXACTLY their
--     current tier's configured initial.
--     Guard: only rows where the daily cron has NOT run (last_distribution_date
--     IS NULL) are touched, so legitimately-grown pools are never shrunk.
-- ----------------------------------------------------------------------------
UPDATE public.user_distribution_state s
SET recommended_profiles_shown = COALESCE(sp.initial_recommended_profiles, s.recommended_profiles_shown),
    nearby_profiles_shown      = COALESCE(sp.initial_nearby_profiles,      s.nearby_profiles_shown),
    daily_profiles_shown       = COALESCE(sp.initial_daily_profiles,       s.daily_profiles_shown),
    updated_at = NOW()
FROM public.profiles p
JOIN public.subscription_plans sp ON sp.tier = COALESCE(p.tier, 'free')
WHERE s.user_id = p.id
  AND s.last_distribution_date IS NULL
  AND (
        s.recommended_profiles_shown <> COALESCE(sp.initial_recommended_profiles, s.recommended_profiles_shown)
     OR s.nearby_profiles_shown      <> COALESCE(sp.initial_nearby_profiles,      s.nearby_profiles_shown)
     OR s.daily_profiles_shown       <> COALESCE(sp.initial_daily_profiles,       s.daily_profiles_shown)
  );

INSERT INTO public.user_profile_distribution
  (user_id, tier, total_recommended_unlocked, total_nearby_unlocked, total_daily_unlocked)
SELECT s.user_id, s.highest_tier_ever_reached,
       s.recommended_profiles_shown, s.nearby_profiles_shown, s.daily_profiles_shown
FROM public.user_distribution_state s
ON CONFLICT (user_id) DO NOTHING;

-- New users: auto-create a free distribution-state row.
CREATE OR REPLACE FUNCTION public.handle_new_user_distribution()
RETURNS TRIGGER SECURITY DEFINER SET search_path = public AS $$
DECLARE v_rec INT; v_near INT; v_daily INT;
BEGIN
  SELECT initial_recommended_profiles, initial_nearby_profiles, initial_daily_profiles
    INTO v_rec, v_near, v_daily FROM public.subscription_plans WHERE tier = 'free';
  INSERT INTO public.user_distribution_state
    (user_id, highest_tier_ever_reached, initial_distribution_granted_tiers,
     recommended_profiles_shown, nearby_profiles_shown, daily_profiles_shown)
  VALUES (NEW.id, 'free', ARRAY['free'],
          COALESCE(v_rec,5), COALESCE(v_near,5), COALESCE(v_daily,5))
  ON CONFLICT (user_id) DO NOTHING;

  INSERT INTO public.user_wallet (user_id) VALUES (NEW.id) ON CONFLICT (user_id) DO NOTHING;

  INSERT INTO public.user_profile_distribution
    (user_id, tier, total_recommended_unlocked, total_nearby_unlocked, total_daily_unlocked)
  VALUES (NEW.id, 'free', COALESCE(v_rec,5), COALESCE(v_near,5), COALESCE(v_daily,5))
  ON CONFLICT (user_id) DO NOTHING;
  RETURN NEW;
END;
$$ LANGUAGE plpgsql;

DROP TRIGGER IF EXISTS on_profile_created_distribution ON public.profiles;
CREATE TRIGGER on_profile_created_distribution
  AFTER INSERT ON public.profiles
  FOR EACH ROW EXECUTE FUNCTION public.handle_new_user_distribution();

-- ============================================================================
-- 3. tier_rank helper (free=0 < silver=1 < gold=2 < platinum=3)
-- ============================================================================
CREATE OR REPLACE FUNCTION public.tier_rank(p_tier TEXT) RETURNS INTEGER
LANGUAGE sql IMMUTABLE AS $$
  SELECT CASE COALESCE(p_tier,'free')
    WHEN 'platinum' THEN 3 WHEN 'gold' THEN 2 WHEN 'silver' THEN 1 ELSE 0 END;
$$;

-- ============================================================================
-- 4. _grant_plan_benefits — credits ALWAYS; initial pool ONCE per tier.
--    Writes the CANONICAL tables (user_wallet + user_distribution_state) and
--    mirrors to user_profile_distribution for legacy admin display.
-- ============================================================================
CREATE OR REPLACE FUNCTION public._grant_plan_benefits(
  p_user_id UUID, p_tier TEXT
) RETURNS VOID
SECURITY DEFINER SET search_path = public AS $$
DECLARE
  v_plan  RECORD;
  v_state RECORD;
  v_rec INT := 0; v_near INT := 0; v_daily INT := 0;
BEGIN
  SELECT * INTO v_plan FROM subscription_plans WHERE tier = p_tier;
  IF v_plan IS NULL THEN RETURN; END IF;

  -- Ensure rows exist.
  INSERT INTO user_wallet (user_id, contact_credits, interest_credits)
  VALUES (p_user_id, 0, 0) ON CONFLICT (user_id) DO NOTHING;
  INSERT INTO user_distribution_state
    (user_id, highest_tier_ever_reached, initial_distribution_granted_tiers,
     recommended_profiles_shown, nearby_profiles_shown, daily_profiles_shown)
  VALUES (p_user_id, 'free', ARRAY['free'],
          COALESCE((SELECT initial_recommended_profiles FROM subscription_plans WHERE tier='free'),5),
          COALESCE((SELECT initial_nearby_profiles      FROM subscription_plans WHERE tier='free'),5),
          COALESCE((SELECT initial_daily_profiles       FROM subscription_plans WHERE tier='free'),5))
  ON CONFLICT (user_id) DO NOTHING;
  INSERT INTO user_profile_distribution (user_id, tier) VALUES (p_user_id, 'free')
  ON CONFLICT (user_id) DO NOTHING;

  -- (a) ALWAYS grant credits (every purchase).
  UPDATE user_wallet SET
    contact_credits  = contact_credits  + COALESCE(v_plan.contacts_limit, 0),
    interest_credits = interest_credits + COALESCE(v_plan.interests_limit, 0),
    updated_at = NOW()
  WHERE user_id = p_user_id;
  UPDATE profiles SET
    contacts_remaining  = GREATEST(0, COALESCE(contacts_remaining,0))  + COALESCE(v_plan.contacts_limit, 0),
    interests_remaining = GREATEST(0, COALESCE(interests_remaining,0)) + COALESCE(v_plan.interests_limit, 0)
  WHERE id = p_user_id;

  -- (b) Initial distribution — only if this tier was never granted before.
  --     The pool is SET to the tier's configured initial value (NOT added to the
  --     existing pool). GREATEST(current, configured) guarantees:
  --       * a user reaching the tier gets EXACTLY the admin-configured count
  --         (free baseline is lower, so it is replaced — e.g. silver -> 8/10/8,
  --         not free 3/4/5 + silver 8/10/8 = 11/14/13), and
  --       * a pool that already grew (daily cron, or a higher previous tier) is
  --         never shrunk.
  SELECT * INTO v_state FROM user_distribution_state WHERE user_id = p_user_id;
  IF NOT (p_tier = ANY(v_state.initial_distribution_granted_tiers)) THEN
    v_rec   := GREATEST(COALESCE(v_state.recommended_profiles_shown,0), COALESCE(v_plan.initial_recommended_profiles,0));
    v_near  := GREATEST(COALESCE(v_state.nearby_profiles_shown,0),      COALESCE(v_plan.initial_nearby_profiles,0));
    v_daily := GREATEST(COALESCE(v_state.daily_profiles_shown,0),       COALESCE(v_plan.initial_daily_profiles,0));

    UPDATE user_distribution_state SET
      recommended_profiles_shown = v_rec,
      nearby_profiles_shown      = v_near,
      daily_profiles_shown       = v_daily,
      initial_distribution_granted_tiers = array_append(initial_distribution_granted_tiers, p_tier),
      highest_tier_ever_reached = CASE
        WHEN public.tier_rank(p_tier) > public.tier_rank(COALESCE(highest_tier_ever_reached,'free'))
        THEN p_tier ELSE highest_tier_ever_reached END,
      updated_at = NOW()
    WHERE user_id = p_user_id;
  ELSE
    -- Re-purchase of an already-granted tier: bump highest_tier only, NO profiles.
    UPDATE user_distribution_state SET
      highest_tier_ever_reached = CASE
        WHEN public.tier_rank(p_tier) > public.tier_rank(COALESCE(highest_tier_ever_reached,'free'))
        THEN p_tier ELSE highest_tier_ever_reached END,
      updated_at = NOW()
    WHERE user_id = p_user_id;
  END IF;

  -- Mirror to the legacy display table (best-effort; never read by feeds).
  UPDATE user_profile_distribution SET
    tier = p_tier,
    total_recommended_unlocked = (SELECT recommended_profiles_shown FROM user_distribution_state WHERE user_id = p_user_id),
    total_nearby_unlocked      = (SELECT nearby_profiles_shown      FROM user_distribution_state WHERE user_id = p_user_id),
    total_daily_unlocked       = (SELECT daily_profiles_shown       FROM user_distribution_state WHERE user_id = p_user_id),
    updated_at = NOW()
  WHERE user_id = p_user_id;
END;
$$ LANGUAGE plpgsql;

-- ============================================================================
-- 5. subscription_queue (paused/pending packs) — needed by purchase + activation
-- ============================================================================
CREATE TABLE IF NOT EXISTS public.subscription_queue (
  id               UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  user_id          UUID NOT NULL REFERENCES auth.users(id) ON DELETE CASCADE,
  plan_tier        TEXT NOT NULL,
  remaining_days   INTEGER,
  duration_months  INTEGER,
  contact_credits  INTEGER DEFAULT 0,
  interest_credits INTEGER DEFAULT 0,
  status           TEXT NOT NULL DEFAULT 'pending',
  amount           INTEGER,
  payment_id       TEXT,
  created_at       TIMESTAMPTZ DEFAULT NOW(),
  updated_at       TIMESTAMPTZ DEFAULT NOW()
);
ALTER TABLE public.subscription_queue ENABLE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "Users read own queue" ON public.subscription_queue;
CREATE POLICY "Users read own queue" ON public.subscription_queue FOR SELECT USING (auth.uid() = user_id);
DROP POLICY IF EXISTS "Admin manage queue" ON public.subscription_queue;
CREATE POLICY "Admin manage queue" ON public.subscription_queue FOR ALL USING (
  EXISTS (SELECT 1 FROM admin_users WHERE email = auth.email() AND role = 'admin')
);
CREATE INDEX IF NOT EXISTS idx_subscription_queue_user ON public.subscription_queue(user_id, status);

-- ============================================================================
-- 6. ONE canonical purchase_subscription — drop EVERY known overload first.
-- ============================================================================
DROP FUNCTION IF EXISTS public.purchase_subscription(UUID, TEXT);
DROP FUNCTION IF EXISTS public.purchase_subscription(UUID, TEXT, TEXT);
DROP FUNCTION IF EXISTS public.purchase_subscription(UUID, TEXT, INTEGER);
DROP FUNCTION IF EXISTS public.purchase_subscription(UUID, TEXT, TEXT, INTEGER);
DROP FUNCTION IF EXISTS public.purchase_subscription(UUID, TEXT, INTEGER, INTEGER);
DROP FUNCTION IF EXISTS public.purchase_subscription(UUID, TEXT, INTEGER, INTEGER, INTEGER);
DROP FUNCTION IF EXISTS public.purchase_subscription(UUID, TEXT, INTEGER, INTEGER, INTEGER, TEXT, INTEGER);

CREATE FUNCTION public.purchase_subscription(
  p_user_id    UUID,
  p_plan_type  TEXT,
  p_payment_id TEXT    DEFAULT NULL,
  p_amount     INTEGER DEFAULT NULL
) RETURNS JSONB
SECURITY DEFINER SET search_path = public AS $$
DECLARE
  v_plan        RECORD;
  v_prof        RECORD;
  v_new_expiry  TIMESTAMPTZ;
  v_sub_id      UUID;
  v_cur_active  BOOLEAN;
  v_cur_rank    INTEGER;
  v_new_rank    INTEGER;
  v_remaining   INTEGER;
  v_queued      BOOLEAN := false;
  v_activated   BOOLEAN := true;
BEGIN
  IF p_plan_type IN ('free','non_premium') THEN
    RAISE EXCEPTION 'INVALID_PLAN: cannot purchase the free tier';
  END IF;

  SELECT * INTO v_plan FROM subscription_plans WHERE tier = p_plan_type;
  IF v_plan IS NULL THEN
    RAISE EXCEPTION 'INVALID_PLAN_TYPE: %', p_plan_type;
  END IF;

  SELECT tier, is_premium, premium_expires_at INTO v_prof FROM profiles WHERE id = p_user_id;
  v_cur_active := (v_prof.premium_expires_at IS NOT NULL AND v_prof.premium_expires_at > NOW());
  v_cur_rank   := public.tier_rank(COALESCE(v_prof.tier,'free'));
  v_new_rank   := public.tier_rank(p_plan_type);

  -- Credits + initial distribution are ALWAYS granted at purchase time.
  PERFORM public._grant_plan_benefits(p_user_id, p_plan_type);

  -- Record the purchase (audit/history).
  INSERT INTO subscriptions
    (user_id, plan_type, status, amount, razorpay_payment_id, contacts_added, interests_added, starts_at, expires_at)
  VALUES
    (p_user_id, p_plan_type, 'active', COALESCE(p_amount, v_plan.price_inr), p_payment_id,
     v_plan.contacts_limit, v_plan.interests_limit, NOW(),
     NOW() + (v_plan.duration_months || ' months')::INTERVAL)
  RETURNING id INTO v_sub_id;

  IF p_payment_id IS NOT NULL THEN
    INSERT INTO payments (user_id, subscription_id, plan_type, amount, tax, final_amount,
      payment_gateway, gateway_transaction_id, status)
    VALUES (p_user_id, v_sub_id, p_plan_type,
      COALESCE(p_amount, v_plan.price_inr), 0, COALESCE(p_amount, v_plan.price_inr),
      CASE WHEN p_payment_id LIKE 'pay_mock_%' THEN 'mock' ELSE 'razorpay' END,
      p_payment_id, 'success');
  END IF;

  IF NOT v_cur_active OR v_new_rank > v_cur_rank THEN
    -- ACTIVATE NOW. If a lower tier was running, PAUSE it (bank remaining days).
    IF v_cur_active AND v_new_rank > v_cur_rank AND v_prof.tier IS NOT NULL AND v_prof.tier <> 'free' THEN
      v_remaining := GREATEST(0, CEIL(EXTRACT(EPOCH FROM (v_prof.premium_expires_at - NOW())) / 86400)::INT);
      IF v_remaining > 0 THEN
        INSERT INTO subscription_queue (user_id, plan_tier, remaining_days, duration_months, status)
        VALUES (p_user_id, v_prof.tier, v_remaining, NULL, 'paused');
      END IF;
    END IF;

    v_new_expiry := NOW() + (v_plan.duration_months || ' months')::INTERVAL;
    UPDATE profiles SET
      tier = p_plan_type, is_premium = true, is_verified = true,
      premium_expires_at = v_new_expiry
    WHERE id = p_user_id;
    v_activated := true;
  ELSE
    -- QUEUE (pending): lower/equal tier bought while a higher one is active.
    UPDATE subscriptions SET status = 'queued' WHERE id = v_sub_id;
    INSERT INTO subscription_queue (user_id, plan_tier, remaining_days, duration_months, status)
    VALUES (p_user_id, p_plan_type, NULL, v_plan.duration_months, 'pending');
    v_new_expiry := v_prof.premium_expires_at;
    v_activated  := false;
    v_queued     := true;
  END IF;

  RETURN jsonb_build_object(
    'success', true, 'tier', p_plan_type, 'activated', v_activated, 'queued', v_queued,
    'expires_at', v_new_expiry,
    'contacts_added', v_plan.contacts_limit, 'interests_added', v_plan.interests_limit
  );
END;
$$ LANGUAGE plpgsql;

-- ============================================================================
-- 7. activate_next_queued — resume highest-priority paused/pending plan.
-- ============================================================================
CREATE OR REPLACE FUNCTION public.activate_next_queued(p_user_id UUID) RETURNS BOOLEAN
SECURITY DEFINER SET search_path = public AS $$
DECLARE
  v_next   RECORD;
  v_plan   RECORD;
  v_months INTEGER;
  v_expiry TIMESTAMPTZ;
BEGIN
  IF EXISTS (SELECT 1 FROM profiles WHERE id = p_user_id
             AND premium_expires_at IS NOT NULL AND premium_expires_at > NOW()
             AND tier <> 'free') THEN
    RETURN false;
  END IF;

  SELECT * INTO v_next FROM subscription_queue
  WHERE user_id = p_user_id AND status IN ('paused','pending')
  ORDER BY public.tier_rank(plan_tier) DESC, created_at ASC
  LIMIT 1;
  IF v_next IS NULL THEN RETURN false; END IF;

  SELECT * INTO v_plan FROM subscription_plans WHERE tier = v_next.plan_tier;
  IF v_plan IS NULL THEN
    DELETE FROM subscription_queue WHERE id = v_next.id;
    RETURN false;
  END IF;

  IF v_next.status = 'paused' AND v_next.remaining_days IS NOT NULL THEN
    -- Resume banked days. No new credits (granted when first purchased).
    v_expiry := NOW() + (v_next.remaining_days || ' days')::INTERVAL;
  ELSE
    -- Pending plan starting fresh: grant benefits now (first activation).
    v_months := COALESCE(v_next.duration_months, v_plan.duration_months);
    v_expiry := NOW() + (v_months || ' months')::INTERVAL;
    PERFORM public._grant_plan_benefits(p_user_id, v_next.plan_tier);
  END IF;

  UPDATE profiles SET
    tier = v_next.plan_tier, is_premium = true, is_verified = true,
    premium_expires_at = v_expiry
  WHERE id = p_user_id;

  UPDATE subscriptions SET status = 'active', expires_at = v_expiry
  WHERE user_id = p_user_id AND plan_type = v_next.plan_tier AND status = 'queued';

  DELETE FROM subscription_queue WHERE id = v_next.id;
  RETURN true;
END;
$$ LANGUAGE plpgsql;

-- ============================================================================
-- 8. FEED RPCs — all three read *_profiles_shown from user_distribution_state,
--    fallback subscription_plans. NO tier_settings, NO user_profile_distribution
--    in any read path. Stable allocation via feed_allocation(), is_new_today.
-- ============================================================================

-- 8a. Recommended
CREATE OR REPLACE FUNCTION public.get_recommended_profiles(
  p_user_id UUID, p_limit INTEGER DEFAULT 20, p_offset INTEGER DEFAULT 0
)
RETURNS TABLE(
  id UUID, profile_id TEXT, display_name TEXT, gender TEXT, date_of_birth DATE,
  height_cm INTEGER, marital_status TEXT, religion TEXT, caste TEXT,
  city TEXT, district TEXT, state TEXT, education TEXT, occupation TEXT,
  annual_income TEXT, food_habit TEXT, about_me TEXT, is_verified BOOLEAN,
  is_premium BOOLEAN, tier TEXT, last_active_at TIMESTAMPTZ,
  profile_completion_percent INTEGER, compatibility_score INTEGER,
  is_new_today BOOLEAN
)
SECURITY DEFINER SET search_path = public AS $$
DECLARE
  v RECORD; p RECORD; v_tier TEXT; v_limit INTEGER; v_ranked UUID[];
BEGIN
  SELECT me.gender, me.religion, me.caste, me.state, me.district, me.tier, me.date_of_birth
    INTO v FROM profiles me WHERE me.id = p_user_id;
  v_tier := COALESCE(v.tier, 'free');

  SELECT recommended_profiles_shown INTO v_limit
    FROM user_distribution_state WHERE user_id = p_user_id;
  IF v_limit IS NULL THEN
    SELECT sp.initial_recommended_profiles INTO v_limit FROM subscription_plans sp WHERE sp.tier = v_tier;
  END IF;
  v_limit := COALESCE(v_limit, 5);

  SELECT * INTO p FROM partner_preferences WHERE user_id = p_user_id;

  v_ranked := ARRAY(
    SELECT pr.id FROM profiles pr
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
    ORDER BY (
      (CASE WHEN pr.religion = v.religion THEN 20 ELSE 0 END) +
      (CASE WHEN pr.caste    = v.caste    THEN 15 ELSE 0 END) +
      (CASE WHEN pr.district = v.district THEN 15 ELSE 0 END) +
      (CASE WHEN pr.state    = v.state    THEN 10 ELSE 0 END) +
      (CASE WHEN pr.is_verified THEN 10 ELSE 0 END) +
      (CASE WHEN pr.is_premium  THEN 5  ELSE 0 END) +
      COALESCE(pr.profile_completion_percent / 5, 0) +
      (CASE WHEN pr.last_active_at > NOW() - INTERVAL '7 days' THEN 10 ELSE 0 END)
    ) DESC, pr.last_active_at DESC NULLS LAST
  );

  RETURN QUERY
  WITH alloc AS (
    SELECT a.pid, a.is_new_today, a.ord
    FROM public.feed_allocation(p_user_id, 'recommended', v_limit, v_ranked)
         WITH ORDINALITY AS a(pid, is_new_today, ord)
  )
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
         )::INTEGER AS compatibility_score,
         alloc.is_new_today
  FROM alloc
  JOIN profiles pr ON pr.id = alloc.pid
  ORDER BY alloc.ord
  LIMIT p_limit OFFSET p_offset;
END;
$$ LANGUAGE plpgsql;

-- 8b. Nearby
CREATE OR REPLACE FUNCTION public.get_nearby_profiles(
  p_user_id UUID, p_limit INTEGER DEFAULT 20, p_offset INTEGER DEFAULT 0
)
RETURNS TABLE(
  id UUID, profile_id TEXT, display_name TEXT, gender TEXT, date_of_birth DATE,
  height_cm INTEGER, marital_status TEXT, religion TEXT, caste TEXT,
  city TEXT, district TEXT, state TEXT, education TEXT, occupation TEXT,
  annual_income TEXT, food_habit TEXT, about_me TEXT, is_verified BOOLEAN,
  is_premium BOOLEAN, tier TEXT, last_active_at TIMESTAMPTZ,
  profile_completion_percent INTEGER, compatibility_score INTEGER,
  is_new_today BOOLEAN
)
SECURITY DEFINER SET search_path = public AS $$
DECLARE
  v RECORD; v_tier TEXT; v_limit INTEGER; v_ranked UUID[];
BEGIN
  SELECT me.gender, me.district, me.state, me.tier INTO v FROM profiles me WHERE me.id = p_user_id;
  v_tier := COALESCE(v.tier, 'free');

  SELECT nearby_profiles_shown INTO v_limit
    FROM user_distribution_state WHERE user_id = p_user_id;
  IF v_limit IS NULL THEN
    SELECT sp.initial_nearby_profiles INTO v_limit FROM subscription_plans sp WHERE sp.tier = v_tier;
  END IF;
  v_limit := COALESCE(v_limit, 5);

  v_ranked := ARRAY(
    SELECT pr.id FROM profiles pr
    WHERE pr.is_active = true
      AND pr.id <> p_user_id
      AND pr.gender <> v.gender
      AND NOT public._feed_excluded(p_user_id, pr.id)
      AND (pr.district = v.district OR pr.state = v.state)
    ORDER BY (
      (CASE WHEN pr.district = v.district THEN 40 ELSE 0 END) +
      (CASE WHEN pr.state = v.state THEN 20 ELSE 0 END) +
      (CASE WHEN pr.is_verified THEN 10 ELSE 0 END) +
      (CASE WHEN pr.is_premium THEN 5 ELSE 0 END) +
      COALESCE(pr.profile_completion_percent / 5, 0) +
      (CASE WHEN pr.last_active_at > NOW() - INTERVAL '7 days' THEN 10 ELSE 0 END)
    ) DESC, pr.last_active_at DESC NULLS LAST
  );

  RETURN QUERY
  WITH alloc AS (
    SELECT a.pid, a.is_new_today, a.ord
    FROM public.feed_allocation(p_user_id, 'nearby', v_limit, v_ranked)
         WITH ORDINALITY AS a(pid, is_new_today, ord)
  )
  SELECT pr.id, pr.profile_id, pr.display_name, pr.gender, pr.date_of_birth,
         pr.height_cm, pr.marital_status, pr.religion, pr.caste,
         pr.city, pr.district, pr.state, pr.education, pr.occupation,
         pr.annual_income, pr.food_habit, pr.about_me, pr.is_verified,
         pr.is_premium, pr.tier, pr.last_active_at, pr.profile_completion_percent,
         (
           (CASE WHEN pr.district = v.district THEN 40 ELSE 0 END) +
           (CASE WHEN pr.state = v.state THEN 20 ELSE 0 END) +
           (CASE WHEN pr.is_verified THEN 10 ELSE 0 END) +
           (CASE WHEN pr.is_premium THEN 5 ELSE 0 END) +
           COALESCE(pr.profile_completion_percent / 5, 0) +
           (CASE WHEN pr.last_active_at > NOW() - INTERVAL '7 days' THEN 10 ELSE 0 END)
         )::INTEGER AS compatibility_score,
         alloc.is_new_today
  FROM alloc
  JOIN profiles pr ON pr.id = alloc.pid
  ORDER BY alloc.ord
  LIMIT p_limit OFFSET p_offset;
END;
$$ LANGUAGE plpgsql;

-- 8c. Daily
DROP FUNCTION IF EXISTS public.get_daily_matches(UUID, INTEGER, INTEGER);
CREATE FUNCTION public.get_daily_matches(
  p_user_id UUID, p_limit INTEGER DEFAULT 10, p_offset INTEGER DEFAULT 0
)
RETURNS TABLE(
  id UUID, profile_id TEXT, display_name TEXT, gender TEXT, date_of_birth DATE,
  height_cm INTEGER, marital_status TEXT, religion TEXT, caste TEXT,
  city TEXT, district TEXT, state TEXT, education TEXT, occupation TEXT,
  annual_income TEXT, food_habit TEXT, about_me TEXT, is_verified BOOLEAN,
  is_premium BOOLEAN, tier TEXT, last_active_at TIMESTAMPTZ,
  profile_completion_percent INTEGER, compatibility_score INTEGER,
  is_new_today BOOLEAN
)
SECURITY DEFINER SET search_path = public AS $$
DECLARE
  v RECORD; v_tier TEXT; v_limit INTEGER; v_ranked UUID[];
BEGIN
  SELECT me.gender, me.tier INTO v FROM profiles me WHERE me.id = p_user_id;
  v_tier := COALESCE(v.tier, 'free');

  SELECT daily_profiles_shown INTO v_limit
    FROM user_distribution_state WHERE user_id = p_user_id;
  IF v_limit IS NULL THEN
    SELECT sp.initial_daily_profiles INTO v_limit FROM subscription_plans sp WHERE sp.tier = v_tier;
  END IF;
  v_limit := COALESCE(v_limit, 5);

  v_ranked := ARRAY(
    SELECT pr.id FROM profiles pr
    WHERE pr.is_active = true
      AND pr.id <> p_user_id
      AND pr.gender <> v.gender
      AND NOT public._feed_excluded(p_user_id, pr.id)
    ORDER BY (
      (CASE WHEN pr.is_verified THEN 20 ELSE 0 END) +
      (CASE WHEN pr.is_premium THEN 10 ELSE 0 END) +
      COALESCE(pr.profile_completion_percent / 5, 0) +
      (CASE WHEN pr.last_active_at > NOW() - INTERVAL '3 days' THEN 25 ELSE 0 END)
    ) DESC, pr.created_at DESC NULLS LAST, pr.last_active_at DESC NULLS LAST
  );

  RETURN QUERY
  WITH alloc AS (
    SELECT a.pid, a.is_new_today, a.ord
    FROM public.feed_allocation(p_user_id, 'daily', v_limit, v_ranked)
         WITH ORDINALITY AS a(pid, is_new_today, ord)
  )
  SELECT pr.id, pr.profile_id, pr.display_name, pr.gender, pr.date_of_birth,
         pr.height_cm, pr.marital_status, pr.religion, pr.caste,
         pr.city, pr.district, pr.state, pr.education, pr.occupation,
         pr.annual_income, pr.food_habit, pr.about_me, pr.is_verified,
         pr.is_premium, pr.tier, pr.last_active_at, pr.profile_completion_percent,
         (
           (CASE WHEN pr.is_verified THEN 20 ELSE 0 END) +
           (CASE WHEN pr.is_premium THEN 10 ELSE 0 END) +
           COALESCE(pr.profile_completion_percent / 5, 0) +
           (CASE WHEN pr.last_active_at > NOW() - INTERVAL '3 days' THEN 25 ELSE 0 END)
         )::INTEGER AS compatibility_score,
         alloc.is_new_today
  FROM alloc
  JOIN profiles pr ON pr.id = alloc.pid
  ORDER BY alloc.ord
  LIMIT p_limit OFFSET p_offset;
END;
$$ LANGUAGE plpgsql;

-- ============================================================================
-- 9. get_user_quota / get_user_quotas — wallet + user_distribution_state;
--    self-heal lapsed premium then resume next queued plan.
-- ============================================================================
CREATE OR REPLACE FUNCTION public.get_user_quota(p_user_id UUID)
RETURNS JSONB
SECURITY DEFINER SET search_path = public AS $$
DECLARE
  v_prof RECORD; v_wallet RECORD; v_dist RECORD; v_plan RECORD; v_tier TEXT;
BEGIN
  SELECT tier, is_premium, premium_expires_at INTO v_prof FROM profiles WHERE id = p_user_id;
  IF v_prof IS NULL THEN
    RETURN jsonb_build_object('tier','FREE','contact_credits',0,'interest_credits',0,
      'recommended_limit',5,'nearby_limit',5,'daily_limit',5,
      'contacts_remaining',0,'interests_remaining',0,'dynamic_daily_enabled',true);
  END IF;

  IF v_prof.is_premium AND v_prof.premium_expires_at IS NOT NULL AND v_prof.premium_expires_at < NOW() THEN
    UPDATE profiles SET is_premium = false, tier = 'free' WHERE id = p_user_id;
    PERFORM public.activate_next_queued(p_user_id);
    SELECT tier, is_premium, premium_expires_at INTO v_prof FROM profiles WHERE id = p_user_id;
  END IF;
  v_tier := COALESCE(v_prof.tier, 'free');

  SELECT * INTO v_wallet FROM user_wallet WHERE user_id = p_user_id;
  SELECT * INTO v_dist FROM user_distribution_state WHERE user_id = p_user_id;
  SELECT * INTO v_plan FROM subscription_plans WHERE tier = v_tier;

  RETURN jsonb_build_object(
    'tier', UPPER(v_tier),
    'is_premium', (v_tier <> 'free'),
    'expires_at', v_prof.premium_expires_at,
    'contact_credits',  COALESCE(v_wallet.contact_credits, 0),
    'interest_credits', COALESCE(v_wallet.interest_credits, 0),
    'recommended_limit', COALESCE(v_dist.recommended_profiles_shown, COALESCE(v_plan.initial_recommended_profiles, 5)),
    'nearby_limit',      COALESCE(v_dist.nearby_profiles_shown,      COALESCE(v_plan.initial_nearby_profiles, 5)),
    'daily_limit',       COALESCE(v_dist.daily_profiles_shown,       COALESCE(v_plan.initial_daily_profiles, 5)),
    'dynamic_daily_enabled', true,
    'contacts_remaining',  COALESCE(v_wallet.contact_credits, 0),
    'interests_remaining', COALESCE(v_wallet.interest_credits, 0)
  );
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION public.get_user_quotas(p_user_id UUID)
RETURNS JSONB
SECURITY DEFINER SET search_path = public AS $$
DECLARE v_base JSONB; v_queue JSONB;
BEGIN
  v_base := public.get_user_quota(p_user_id);
  SELECT COALESCE(jsonb_agg(jsonb_build_object(
            'plan', q.plan_tier, 'label', INITCAP(q.plan_tier),
            'status', q.status, 'remaining_days', q.remaining_days,
            'duration_months', q.duration_months
          ) ORDER BY public.tier_rank(q.plan_tier) DESC, q.created_at ASC), '[]'::jsonb)
    INTO v_queue
  FROM subscription_queue q
  WHERE q.user_id = p_user_id AND q.status IN ('paused','pending');
  RETURN v_base || jsonb_build_object('other_plans', v_queue);
END;
$$ LANGUAGE plpgsql;

-- ============================================================================
-- 10. run_daily_distribution — increment user_distribution_state from plans.
-- ============================================================================
CREATE OR REPLACE FUNCTION public.run_daily_distribution()
RETURNS JSONB
SECURITY DEFINER SET search_path = public AS $$
DECLARE v_count INTEGER := 0; v_row RECORD; v_today DATE := CURRENT_DATE;
BEGIN
  FOR v_row IN
    SELECT p.id AS user_id, p.tier,
           sp.daily_recommended_increment, sp.daily_nearby_increment, sp.daily_profiles_increment
    FROM profiles p
    JOIN subscription_plans sp ON sp.tier = p.tier
    WHERE p.is_premium = true
      AND p.premium_expires_at > NOW()
      AND p.tier <> 'free'
      AND sp.daily_recommended_increment + sp.daily_nearby_increment + sp.daily_profiles_increment > 0
  LOOP
    INSERT INTO user_distribution_state (user_id, highest_tier_ever_reached,
      initial_distribution_granted_tiers, recommended_profiles_shown, nearby_profiles_shown, daily_profiles_shown)
    VALUES (v_row.user_id, v_row.tier, ARRAY[v_row.tier], 0, 0, 0)
    ON CONFLICT (user_id) DO NOTHING;

    UPDATE user_distribution_state SET
      recommended_profiles_shown = recommended_profiles_shown + v_row.daily_recommended_increment,
      nearby_profiles_shown      = nearby_profiles_shown + v_row.daily_nearby_increment,
      daily_profiles_shown       = daily_profiles_shown + v_row.daily_profiles_increment,
      last_distribution_date = v_today,
      updated_at = NOW()
    WHERE user_id = v_row.user_id
      AND (last_distribution_date IS NULL OR last_distribution_date < v_today);

    IF FOUND THEN v_count := v_count + 1; END IF;
  END LOOP;

  RETURN jsonb_build_object('success', true, 'users_updated', v_count, 'run_date', v_today);
END;
$$ LANGUAGE plpgsql;

-- ============================================================================
-- 11. update_subscription_plan — canonical signature matching adminApi.
--     subscription_plans is the SINGLE editable source of truth.
-- ============================================================================
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

-- ============================================================================
-- 12. admin_make_user_free — test reset for the upgrade flow.
-- ============================================================================
CREATE OR REPLACE FUNCTION public.admin_make_user_free(
  p_user_id UUID, p_reset_distribution BOOLEAN DEFAULT false
) RETURNS JSONB
SECURITY DEFINER SET search_path = public AS $$
BEGIN
  UPDATE profiles SET tier = 'free', is_premium = false, premium_expires_at = NULL
  WHERE id = p_user_id;
  UPDATE subscriptions SET status = 'expired'
  WHERE user_id = p_user_id AND status IN ('active','queued');
  DELETE FROM subscription_queue WHERE user_id = p_user_id;

  IF p_reset_distribution THEN
    UPDATE user_distribution_state SET
      highest_tier_ever_reached = 'free',
      initial_distribution_granted_tiers = ARRAY['free'],
      recommended_profiles_shown = COALESCE((SELECT initial_recommended_profiles FROM subscription_plans WHERE tier='free'),5),
      nearby_profiles_shown      = COALESCE((SELECT initial_nearby_profiles      FROM subscription_plans WHERE tier='free'),5),
      daily_profiles_shown       = COALESCE((SELECT initial_daily_profiles       FROM subscription_plans WHERE tier='free'),5),
      updated_at = NOW()
    WHERE user_id = p_user_id;
    UPDATE user_wallet SET contact_credits = 0, interest_credits = 0, updated_at = NOW()
    WHERE user_id = p_user_id;
    UPDATE profiles SET contacts_remaining = 0, interests_remaining = 0 WHERE id = p_user_id;
  END IF;

  RETURN jsonb_build_object('success', true, 'reset_distribution', p_reset_distribution);
END;
$$ LANGUAGE plpgsql;

-- ============================================================================
-- 13. GRANTS + schema reload
-- ============================================================================
GRANT EXECUTE ON FUNCTION public.tier_rank(TEXT) TO authenticated, anon, service_role;
GRANT EXECUTE ON FUNCTION public._grant_plan_benefits(UUID, TEXT) TO authenticated, service_role;
GRANT EXECUTE ON FUNCTION public.purchase_subscription(UUID, TEXT, TEXT, INTEGER) TO authenticated, service_role;
GRANT EXECUTE ON FUNCTION public.activate_next_queued(UUID) TO authenticated, service_role;
GRANT EXECUTE ON FUNCTION public.get_recommended_profiles(UUID, INTEGER, INTEGER) TO authenticated, anon, service_role;
GRANT EXECUTE ON FUNCTION public.get_nearby_profiles(UUID, INTEGER, INTEGER) TO authenticated, anon, service_role;
GRANT EXECUTE ON FUNCTION public.get_daily_matches(UUID, INTEGER, INTEGER) TO authenticated, anon, service_role;
GRANT EXECUTE ON FUNCTION public.get_user_quota(UUID) TO authenticated, anon, service_role;
GRANT EXECUTE ON FUNCTION public.get_user_quotas(UUID) TO authenticated, anon, service_role;
GRANT EXECUTE ON FUNCTION public.run_daily_distribution() TO authenticated, service_role;
GRANT EXECUTE ON FUNCTION public.update_subscription_plan(TEXT, TEXT, INTEGER, INTEGER, INTEGER, INTEGER, INTEGER, INTEGER, INTEGER, INTEGER, INTEGER, INTEGER, JSONB, TEXT, BOOLEAN) TO authenticated, service_role;
GRANT EXECUTE ON FUNCTION public.admin_make_user_free(UUID, BOOLEAN) TO authenticated, service_role;
NOTIFY pgrst, 'reload schema';

-- ============================================================================
-- 14. SELF-VERIFY — RAISES if anything critical is wrong.
-- ============================================================================
DO $verify$
DECLARE
  v_n INTEGER;
  v_bad INTEGER;
BEGIN
  -- a) Exactly ONE purchase_subscription overload remains.
  SELECT count(*) INTO v_n FROM pg_proc p JOIN pg_namespace n ON n.oid=p.pronamespace
    WHERE n.nspname='public' AND p.proname='purchase_subscription';
  IF v_n <> 1 THEN
    RAISE EXCEPTION 'VERIFY FAILED: % purchase_subscription overloads exist (expected 1).', v_n;
  END IF;

  -- b) subscription_plans has the canonical credit column.
  IF NOT EXISTS (SELECT 1 FROM information_schema.columns
                 WHERE table_schema='public' AND table_name='subscription_plans' AND column_name='contacts_limit') THEN
    RAISE EXCEPTION 'VERIFY FAILED: subscription_plans.contacts_limit missing.';
  END IF;

  -- c) No feed RPC reads the legacy table or tier_settings in its body.
  SELECT count(*) INTO v_bad FROM pg_proc p JOIN pg_namespace n ON n.oid=p.pronamespace
    WHERE n.nspname='public'
      AND p.proname IN ('get_recommended_profiles','get_nearby_profiles','get_daily_matches')
      AND (pg_get_functiondef(p.oid) ~* 'user_profile_distribution'
        OR pg_get_functiondef(p.oid) ~* 'tier_settings');
  IF v_bad > 0 THEN
    RAISE EXCEPTION 'VERIFY FAILED: % feed function(s) still read user_profile_distribution/tier_settings.', v_bad;
  END IF;

  -- d) All three feeds read the canonical pool table.
  SELECT count(*) INTO v_n FROM pg_proc p JOIN pg_namespace n ON n.oid=p.pronamespace
    WHERE n.nspname='public'
      AND p.proname IN ('get_recommended_profiles','get_nearby_profiles','get_daily_matches')
      AND pg_get_functiondef(p.oid) ~* 'user_distribution_state';
  IF v_n <> 3 THEN
    RAISE EXCEPTION 'VERIFY FAILED: only % of 3 feeds read user_distribution_state.', v_n;
  END IF;

  RAISE NOTICE 'VERIFY OK: single purchase_subscription; canonical subscription_plans columns; all 3 feeds read user_distribution_state; no legacy table in feed read paths.';
END
$verify$;
