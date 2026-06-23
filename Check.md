# WEDRING MATRIMONY — SINGLE BUILD PROMPT
# Paste this entire file into Claude Code. It contains everything needed to build
# BOTH the mobile app and the admin panel.
# Tech: React Native (Expo) + React + Tailwind CSS + Supabase (DB + Auth) + Cloudflare R2 (file storage) + Razorpay (payments)

---

## YOUR TASK

Build two applications from this single prompt:
1. **Mobile App** — React Native (Expo), Android first, for end users (matrimony seekers)
2. **Admin Panel** — React + Vite + Tailwind CSS, web dashboard for the business owner

Both connect to the same backend services:
- **Supabase** — database, authentication, and email OTP verification ONLY (not used for file storage)
- **Cloudflare R2** — all file/image storage (profile photos, any uploaded documents)
- **Razorpay** — payment processing for membership plan purchases

Read this entire file before writing any code. Build the Admin Panel first, then the Mobile App.

---

## STACK SUMMARY

- **Database + Auth + Email OTP**: Supabase
- **File/Image Storage**: Cloudflare R2 (NOT Supabase Storage — do not create or use Supabase Storage buckets anywhere in this project)
- **Payments**: Razorpay (live integration, not a placeholder — keys are already available)
- **Hosting Admin Panel**: Vercel or Netlify
- **Mobile App Testing**: Expo Go app — no Play Store fee needed until ready to publish
- **SMS OTP**: not implemented — only Email OTP via Supabase for now

---

## APP OVERVIEW — HOW IT LOOKS AND FLOWS

### Mobile App Flow
```
Splash (logo + app name)
   ↓
Login Screen (Email or Mobile + Password) ──→ if account exists → Home
   ↓ (no account)
Create Account →
   Step 1: Creating profile for (Myself/Son/Daughter/Brother/Sister/Friend/Relative) + Mother Tongue
   Step 2: Email + Mobile Number + Password (uniqueness checked before OTP sent)
   Step 3: Email OTP verification (6-digit, 5 min expiry, 1 min resend cooldown)
            → ONLY after verification: write user to database
   Step 4: Personal Info (Name, Gender, DOB, Height, Marital Status)
   Step 5: Religion + Caste (caste list loads based on religion, optional to skip)
   Step 6: Education + Occupation + Annual Income (hidden if "Not Working")
   Step 7: State → District → City (cascading dropdowns) + About Me
   Step 8: Horoscope (Rasi, Nakshatra, Lagnam, Gothram, Dosham — all optional, predefined + custom entry)
   Step 9: Languages, Hobbies, Interests, Lifestyle (all optional)
   Step 10: Partner Preferences (Age Range + Height Range MANDATORY, rest optional)
   ↓
Home Screen
```

### Home Screen Layout
- Top: User's profile card (photo, name, membership tier badge)
- Membership status: tier, expiry date, contact credits left, interest credits left
- Profile completion progress bar (with reminders if incomplete: "Add Photo", "Add Horoscope" etc.)
- Horizontally scrollable "Recommended Matches" row + "View All" link
- Upgrade banner if user is on Free tier
- Bottom Navigation: Home | Matches | Interests | Upgrade | Settings

### Matches Screen
- Two tabs: **All Matches** | **New Profiles**
- Vertically scrollable profile cards: photo, name, age, location, compatibility %
- Each card: "Send Interest" button + "Not Interested" button
- Free users: can browse but cannot send interest or view contact/horoscope (blurred + "Upgrade" prompt)

### Interests Screen
- Three tabs: Sent | Received | Not Interested (with Restore option)

### Upgrade Screen
- Three plan cards: Silver, Gold, Platinum — price, validity, contact credits, interest credits (all admin-configurable)
- "Buy Now" opens real Razorpay checkout (see RAZORPAY PAYMENT INTEGRATION section)

### Settings Screen
- Edit Profile, Edit Preferences, My Photos (max 5), Purchase History, Help, Rate Us, Logout

### Admin Panel Layout
- Sidebar: Dashboard | Manage Users | Membership Management | Distribution Management | Payment Management | Purchase History
- Dashboard: stat cards (total users, tier breakdown, revenue) + charts
- Manage Users: searchable/filterable table, edit/delete/upgrade/downgrade/reset, bulk JSON/CSV import, PDF/Excel export
- Membership Management: edit price/validity/credits per tier (Silver/Gold/Platinum)
- Distribution Management: set how many profiles each tier gets (initial + daily) + manual instant push
- Payment Management & Purchase History: filterable tables with export

---

## SUPABASE DATABASE SETUP

Run this SQL in Supabase SQL Editor (free project):

```sql
CREATE EXTENSION IF NOT EXISTS "uuid-ossp";

-- Users
CREATE TABLE public.users (
  id uuid PRIMARY KEY REFERENCES auth.users(id) ON DELETE CASCADE,
  email text UNIQUE NOT NULL,
  phone text UNIQUE,
  creating_for text NOT NULL,
  mother_tongue text NOT NULL,
  is_verified boolean DEFAULT false,
  created_at timestamptz DEFAULT now()
);

-- Profiles
CREATE TABLE public.profiles (
  id uuid PRIMARY KEY REFERENCES public.users(id) ON DELETE CASCADE,
  name text,
  gender text,
  date_of_birth date,
  height_cm integer,
  marital_status text,
  religion text,
  caste text,
  about_me text,
  state text,
  district text,
  city text,
  highest_qualification text,
  occupation text,
  annual_income text,
  rasi text,
  nakshatra text,
  lagnam text,
  gothram text,
  dosham text,
  pref_age_min integer DEFAULT 18,
  pref_age_max integer DEFAULT 50,
  pref_height_min integer DEFAULT 140,
  pref_height_max integer DEFAULT 200,
  pref_marital_status text[],
  pref_religion text[],
  pref_caste text[],
  pref_education text[],
  pref_occupation text[],
  pref_food_habit text,
  languages_known text[],
  hobbies text[],
  interests text[],
  lifestyle text[],
  profile_completion integer DEFAULT 0,
  updated_at timestamptz DEFAULT now()
);

-- Profile Photos (max 5 per user)
CREATE TABLE public.profile_photos (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  user_id uuid REFERENCES public.users(id) ON DELETE CASCADE,
  photo_url text NOT NULL,
  is_primary boolean DEFAULT false,
  display_order integer DEFAULT 0,
  created_at timestamptz DEFAULT now()
);

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

-- Membership Plans (admin configurable)
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

INSERT INTO public.membership_plans (name, price_inr, validity_days, contact_credits, interest_credits) VALUES
('free', 0, 0, 0, 0),
('silver', 499, 30, 30, 50),
('gold', 999, 30, 50, 100),
('platinum', 1999, 90, 100, 200);

-- User Memberships (supports stacked/queued plans)
CREATE TABLE public.user_memberships (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  user_id uuid REFERENCES public.users(id) ON DELETE CASCADE,
  plan_id uuid REFERENCES public.membership_plans(id),
  tier text NOT NULL,
  start_date timestamptz DEFAULT now(),
  expiry_date timestamptz,
  contact_credits_remaining integer DEFAULT 0,
  interest_credits_remaining integer DEFAULT 0,
  status text DEFAULT 'active',
  queue_order integer DEFAULT 0,
  created_at timestamptz DEFAULT now()
);

-- Distribution settings (admin sets ONE total number per tier — bands auto-calculated, see ALGORITHM section below)
CREATE TABLE public.profile_distribution (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  tier text NOT NULL UNIQUE,
  initial_all_matches integer DEFAULT 5,
  initial_new_profiles integer DEFAULT 0,
  daily_all_matches integer DEFAULT 0,
  daily_new_profiles integer DEFAULT 0,
  updated_at timestamptz DEFAULT now()
);

INSERT INTO public.profile_distribution (tier, initial_all_matches, initial_new_profiles, daily_all_matches, daily_new_profiles) VALUES
('free', 5, 0, 0, 0),
('silver', 100, 100, 10, 10),
('gold', 150, 150, 15, 15),
('platinum', 200, 200, 20, 20);

-- User Profile Pool — tracks WHICH profiles each user can see, AND which compatibility band they came from
CREATE TABLE public.user_profile_pool (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  user_id uuid REFERENCES public.users(id) ON DELETE CASCADE,
  profile_id uuid REFERENCES public.users(id) ON DELETE CASCADE,
  section text NOT NULL,              -- 'all_matches' or 'new_profiles'
  compatibility_band text,            -- '70-60', '60-50', '50-40', '40-30', '30-10'
  compatibility_score integer,
  added_at timestamptz DEFAULT now(),
  is_seen boolean DEFAULT false,
  UNIQUE(user_id, profile_id, section)
);

-- Interests
CREATE TABLE public.interests (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  sender_id uuid REFERENCES public.users(id) ON DELETE CASCADE,
  receiver_id uuid REFERENCES public.users(id) ON DELETE CASCADE,
  status text DEFAULT 'sent',
  created_at timestamptz DEFAULT now(),
  UNIQUE(sender_id, receiver_id)
);

-- Not Interested
CREATE TABLE public.not_interested (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  user_id uuid REFERENCES public.users(id) ON DELETE CASCADE,
  target_user_id uuid REFERENCES public.users(id) ON DELETE CASCADE,
  created_at timestamptz DEFAULT now(),
  restored_at timestamptz,
  is_restored boolean DEFAULT false
);

-- Credit Transactions
CREATE TABLE public.credit_transactions (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  user_id uuid REFERENCES public.users(id) ON DELETE CASCADE,
  type text NOT NULL,
  credits_used integer DEFAULT 1,
  reference_id uuid,
  created_at timestamptz DEFAULT now()
);

-- Purchase History
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

-- Row Level Security
ALTER TABLE public.users ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.profiles ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.profile_photos ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.user_memberships ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.user_profile_pool ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.interests ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.not_interested ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.credit_transactions ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.purchase_history ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.membership_plans ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.profile_distribution ENABLE ROW LEVEL SECURITY;

CREATE POLICY "users_own" ON public.users FOR ALL USING (auth.uid() = id);
CREATE POLICY "profiles_own" ON public.profiles FOR ALL USING (auth.uid() = id);
CREATE POLICY "profiles_read_authenticated" ON public.profiles FOR SELECT USING (auth.role() = 'authenticated');
CREATE POLICY "photos_own_write" ON public.profile_photos FOR ALL USING (auth.uid() = user_id);
CREATE POLICY "photos_public_read" ON public.profile_photos FOR SELECT USING (true);
CREATE POLICY "memberships_own" ON public.user_memberships FOR ALL USING (auth.uid() = user_id);
CREATE POLICY "pool_own" ON public.user_profile_pool FOR ALL USING (auth.uid() = user_id);
CREATE POLICY "interests_own" ON public.interests FOR ALL USING (auth.uid() = sender_id OR auth.uid() = receiver_id);
CREATE POLICY "not_interested_own" ON public.not_interested FOR ALL USING (auth.uid() = user_id);
CREATE POLICY "credits_own" ON public.credit_transactions FOR SELECT USING (auth.uid() = user_id);
CREATE POLICY "purchase_own" ON public.purchase_history FOR SELECT USING (auth.uid() = user_id);
CREATE POLICY "plans_public_read" ON public.membership_plans FOR SELECT USING (true);
CREATE POLICY "distribution_public_read" ON public.profile_distribution FOR SELECT USING (true);
```

**File Storage**: Do NOT create a Supabase Storage bucket. All profile photos and any other uploaded files are stored in Cloudflare R2 instead — see the "CLOUDFLARE R2 SETUP" section below. The `profile_photos.photo_url` column stores the public R2 URL (or R2 object key, resolved to a URL at render time) instead of a Supabase Storage URL.

## CLOUDFLARE R2 SETUP (FILE STORAGE — REPLACES SUPABASE STORAGE)

All images (profile photos) and any other uploaded files go to Cloudflare R2, not Supabase. Keys are already available — store them as environment variables, never hardcode them.

### Required Environment Variables

**Admin Panel** (`admin/.env`):
```
VITE_R2_ACCOUNT_ID=your_cloudflare_account_id
VITE_R2_ACCESS_KEY_ID=your_r2_access_key_id
VITE_R2_SECRET_ACCESS_KEY=your_r2_secret_access_key
VITE_R2_BUCKET_NAME=wedring-uploads
VITE_R2_PUBLIC_URL=https://your-r2-public-domain.com
```

**Mobile App** (`mobile/.env`):
Mobile app should NEVER hold R2 secret keys directly (same rule as not exposing service role keys client-side). Instead, the mobile app uploads through a small serverless signing endpoint (Supabase Edge Function) that generates a short-lived presigned upload URL using the R2 secret keys server-side. The mobile app only needs:
```
EXPO_PUBLIC_R2_PUBLIC_URL=https://your-r2-public-domain.com
```

### Architecture: How Uploads Work

1. Mobile app requests a presigned upload URL from a Supabase Edge Function (`get-r2-upload-url`), passing `userId` and `fileName`.
2. The Edge Function (which holds the R2 secret keys server-side) generates a presigned PUT URL using the S3-compatible R2 API and returns it.
3. Mobile app uploads the image file directly to that presigned URL via `fetch(presignedUrl, { method: 'PUT', body: fileBlob })`.
4. On success, mobile app saves the resulting public URL (`R2_PUBLIC_URL/userId/fileName`) into the `profile_photos.photo_url` column in Supabase.
5. Admin Panel uploads (e.g. bulk import with photos) can use the R2 secret keys directly since it's a trusted environment — no presigned URL needed there.

### Supabase Edge Function — Generate Presigned R2 Upload URL

`supabase/functions/get-r2-upload-url/index.js`:
```js
import { AwsClient } from 'https://esm.sh/aws4fetch@1.0.17'

const r2 = new AwsClient({
  accessKeyId: Deno.env.get('R2_ACCESS_KEY_ID'),
  secretAccessKey: Deno.env.get('R2_SECRET_ACCESS_KEY'),
  service: 's3',
  region: 'auto',
})

Deno.serve(async (req) => {
  const { userId, fileName, contentType } = await req.json()

  const accountId = Deno.env.get('R2_ACCOUNT_ID')
  const bucket = Deno.env.get('R2_BUCKET_NAME')
  const objectKey = `profile-photos/${userId}/${Date.now()}-${fileName}`
  const endpoint = `https://${accountId}.r2.cloudflarestorage.com/${bucket}/${objectKey}`

  const signedRequest = await r2.sign(endpoint, {
    method: 'PUT',
    headers: { 'Content-Type': contentType },
    aws: { signQuery: true },
  })

  return new Response(JSON.stringify({
    uploadUrl: signedRequest.url,
    publicUrl: `${Deno.env.get('R2_PUBLIC_URL')}/${objectKey}`,
    objectKey,
  }), { headers: { 'Content-Type': 'application/json' } })
})
```

Set the Edge Function's environment secrets via Supabase Dashboard → Edge Functions → Secrets:
`R2_ACCOUNT_ID`, `R2_ACCESS_KEY_ID`, `R2_SECRET_ACCESS_KEY`, `R2_BUCKET_NAME`, `R2_PUBLIC_URL`

### Mobile App — Upload Helper

`mobile/lib/uploadToR2.js`:
```js
import { supabase } from './supabase'

export async function uploadPhotoToR2(userId, fileUri, fileName, contentType = 'image/jpeg') {
  // 1. Get presigned URL from Edge Function
  const { data, error } = await supabase.functions.invoke('get-r2-upload-url', {
    body: { userId, fileName, contentType }
  })
  if (error) throw error

  const { uploadUrl, publicUrl } = data

  // 2. Upload the file directly to R2
  const response = await fetch(fileUri)
  const blob = await response.blob()

  const uploadResponse = await fetch(uploadUrl, {
    method: 'PUT',
    headers: { 'Content-Type': contentType },
    body: blob,
  })

  if (!uploadResponse.ok) throw new Error('R2 upload failed')

  return publicUrl // save this into profile_photos.photo_url
}
```

### Admin Panel — Direct Upload Helper (trusted environment, no presigned URL needed)

`admin/src/utils/uploadToR2.js`:
```js
import { S3Client, PutObjectCommand } from '@aws-sdk/client-s3'

const r2Client = new S3Client({
  region: 'auto',
  endpoint: `https://${import.meta.env.VITE_R2_ACCOUNT_ID}.r2.cloudflarestorage.com`,
  credentials: {
    accessKeyId: import.meta.env.VITE_R2_ACCESS_KEY_ID,
    secretAccessKey: import.meta.env.VITE_R2_SECRET_ACCESS_KEY,
  },
})

export async function uploadFileToR2(file, userId) {
  const objectKey = `profile-photos/${userId}/${Date.now()}-${file.name}`
  await r2Client.send(new PutObjectCommand({
    Bucket: import.meta.env.VITE_R2_BUCKET_NAME,
    Key: objectKey,
    Body: file,
    ContentType: file.type,
  }))
  return `${import.meta.env.VITE_R2_PUBLIC_URL}/${objectKey}`
}
```

Install in admin panel: `npm install @aws-sdk/client-s3`

### Max 5 Photos Rule
Still enforced the same way — the `check_max_photos` trigger in Supabase counts rows in `profile_photos` regardless of where the actual file bytes live. R2 only stores the file; Supabase still stores the metadata row and URL reference.

---



This is the most important business logic in the entire app. The client specifically required this — read carefully.

### The Problem
If we simply show users their TOP compatibility matches first (e.g., everyone above 60%), two issues happen:
1. Good matches run out fast — daily updates afterward only have low-quality matches left, making the app feel worse over time
2. The user never sees variety — just a narrow slice of "best" matches that may not even be realistic

### The Solution — Fixed Compatibility Bands
Every profile distribution (initial signup/upgrade, daily updates, AND admin manual push) must spread profiles across **5 FIXED bands** instead of just taking the top N by score:

| Band | Compatibility Range |
|------|---------------------|
| Band 1 | 70% – 60% |
| Band 2 | 60% – 50% |
| Band 3 | 50% – 40% |
| Band 4 | 40% – 30% |
| Band 5 | 30% – 10% |

Profiles below 10% are never shown. These 5 bands are fixed — they are NOT configurable by the admin.

### How the Split Works
Admin only sets ONE total number per tier (the existing `initial_all_matches`, `initial_new_profiles`, `daily_all_matches`, `daily_new_profiles` values). The system automatically divides that number evenly across the 5 bands.

**Example: Silver tier, initial_all_matches = 100**
```
100 ÷ 5 bands = 20 profiles per band
Band 1 (70-60%): 20
Band 2 (60-50%): 20
Band 3 (50-40%): 20
Band 4 (40-30%): 20
Band 5 (30-10%): 20
Total: 100 ✓
```

**Example: Silver tier, daily_all_matches = 10**
```
10 ÷ 5 bands = 2 profiles per band
Band 1: 2, Band 2: 2, Band 3: 2, Band 4: 2, Band 5: 2
Total: 10 ✓
```

If the total doesn't divide evenly, give the remainder to the HIGHEST bands first.
Example: total = 23 → Band 1 = 5, Band 2 = 5, Band 3 = 5, Band 4 = 4, Band 5 = 4

### Shortfall Handling
If a band doesn't have enough eligible profiles to fill its quota, automatically pull the shortfall from the NEAREST adjacent band (try the higher-compatibility neighbor first, then the lower one, expanding outward until quota is filled or all candidates are exhausted).

Example: Band 2 (60-50%) needs 20 but only 12 exist → pull 8 more from Band 1 first; if Band 1 also can't cover it, pull from Band 3 next.

### Where This Applies (ALL THREE must use the same function)
1. **Initial distribution** — when a free user upgrades to any premium tier for the first time
2. **Daily cron** — runs every day at 12:00 AM IST, adds new profiles using the same band split
3. **Admin manual push** — admin enters a total count in the admin panel, gets band-split the same way

Build ONE shared function used by all three — do not write three separate implementations.

### Implementation (JavaScript — use this exact logic)

```js
const BANDS = [
  { name: '70-60', min: 60, max: 100 },
  { name: '60-50', min: 50, max: 60 },
  { name: '50-40', min: 40, max: 50 },
  { name: '40-30', min: 30, max: 40 },
  { name: '30-10', min: 10, max: 30 },
]

function getBandQuotas(totalCount) {
  const base = Math.floor(totalCount / BANDS.length)
  const remainder = totalCount % BANDS.length
  return BANDS.map((band, i) => ({
    ...band,
    quota: base + (i < remainder ? 1 : 0)
  }))
}

// allCandidates = [{ profile_id, compatibility_score }], already excludes
// own profile, already-in-pool profiles, and not_interested profiles
async function distributeProfilesForUser(userId, totalCount, section, allCandidates) {
  const quotas = getBandQuotas(totalCount)
  const selected = []

  const bandedCandidates = {}
  quotas.forEach(b => { bandedCandidates[b.name] = [] })
  allCandidates.forEach(c => {
    const band = quotas.find(b => c.compatibility_score >= b.min && c.compatibility_score < b.max + (b.name === '70-60' ? 1 : 0))
    if (band) bandedCandidates[band.name].push(c)
  })

  const shortfalls = []
  for (const band of quotas) {
    const available = bandedCandidates[band.name]
    const take = available.slice(0, band.quota)
    take.forEach(c => selected.push({ ...c, band: band.name, borrowed: false }))
    bandedCandidates[band.name] = available.slice(band.quota)
    if (take.length < band.quota) {
      shortfalls.push({ band: band.name, missing: band.quota - take.length, bandIndex: quotas.indexOf(band) })
    }
  }

  for (const shortfall of shortfalls) {
    let needed = shortfall.missing
    let offset = 1
    while (needed > 0 && offset < quotas.length) {
      const lowerIdx = shortfall.bandIndex - offset
      const higherIdx = shortfall.bandIndex + offset
      if (lowerIdx >= 0 && bandedCandidates[quotas[lowerIdx].name].length > 0) {
        const pool = bandedCandidates[quotas[lowerIdx].name]
        const take = pool.splice(0, needed)
        take.forEach(c => selected.push({ ...c, band: shortfall.band, borrowed: true }))
        needed -= take.length
      }
      if (needed > 0 && higherIdx < quotas.length && bandedCandidates[quotas[higherIdx].name].length > 0) {
        const pool = bandedCandidates[quotas[higherIdx].name]
        const take = pool.splice(0, needed)
        take.forEach(c => selected.push({ ...c, band: shortfall.band, borrowed: true }))
        needed -= take.length
      }
      offset++
    }
  }

  return selected.map(c => ({
    user_id: userId,
    profile_id: c.profile_id,
    section,
    compatibility_band: c.band,
    compatibility_score: c.compatibility_score
  }))
  // caller does: supabase.from('user_profile_pool').upsert(inserts, { onConflict: 'user_id,profile_id,section', ignoreDuplicates: true })
}
```

### Compatibility Score Calculation (used to generate `compatibility_score` before banding)
```js
function calculateCompatibility(myProfile, theirProfile) {
  let score = 0
  const getAge = (dob) => Math.floor((new Date() - new Date(dob)) / (365.25 * 24 * 60 * 60 * 1000))
  if (myProfile.religion === theirProfile.religion) score += 20
  if (myProfile.caste === theirProfile.caste && myProfile.caste !== 'No Caste Preference') score += 15
  const theirAge = getAge(theirProfile.date_of_birth)
  if (theirAge >= myProfile.pref_age_min && theirAge <= myProfile.pref_age_max) score += 15
  if (theirProfile.height_cm >= myProfile.pref_height_min && theirProfile.height_cm <= myProfile.pref_height_max) score += 10
  if (myProfile.state === theirProfile.state) score += 5
  if (myProfile.district === theirProfile.district) score += 5
  if (myProfile.highest_qualification === theirProfile.highest_qualification) score += 10
  if (myProfile.occupation === theirProfile.occupation) score += 5
  if (myProfile.marital_status === theirProfile.marital_status) score += 10
  if (myProfile.rasi === theirProfile.rasi) score += 5
  return Math.min(score, 100)
}
```

**Note**: Banding only controls which profiles get SELECTED into the pool. Once in the pool, the Matches screen still displays them sorted by `compatibility_score` descending — so a user will see a mix (e.g. a 65% match next to a 35% match), which is intentional.

---

## OTHER BUSINESS RULES

### OTP Verification
- 6-digit OTP, 5-minute expiry, 1-minute resend cooldown
- Do NOT write to database until OTP is verified
- After verify: insert into `users`, `profiles`, and assign free tier `user_memberships`

### Uniqueness Check
- Before sending OTP, check email AND phone against `users` table
- Show specific error: "Email already registered" or "Phone number already registered"

### Membership Stacking
1. Buy same tier again → credits add to existing + validity extends by new plan's days
2. Buy higher tier → new plan activates immediately, old plan goes to `status='queued'` with remaining days preserved
3. Buy lower tier while on higher tier → goes to queue, activates only when current plan expires

### Credits
- Viewing contact number = 1 contact credit
- Viewing horoscope = 1 contact credit
- Sending interest = 1 interest credit
- Free users: cannot send interest, cannot view contact/horoscope (blurred + upgrade prompt)

### Profile Completion %
Basic info 20%, Religion/caste 10%, Education/occupation 15%, Location+About Me 15%, Photos 15%, Horoscope 10%, Partner preferences 15%

---

## RAZORPAY PAYMENT INTEGRATION (LIVE — KEYS ALREADY AVAILABLE)

Membership plan purchases (Silver/Gold/Platinum) use real Razorpay checkout — this is NOT a placeholder. Keys are already available; store them as environment variables, never hardcode them.

### Required Environment Variables

**Mobile App** (`mobile/.env`):
```
EXPO_PUBLIC_RAZORPAY_KEY_ID=your_razorpay_key_id
```
(Only the public Key ID goes in the mobile app — never the secret key.)

**Supabase Edge Function secrets** (set via Dashboard → Edge Functions → Secrets):
```
RAZORPAY_KEY_ID=your_razorpay_key_id
RAZORPAY_KEY_SECRET=your_razorpay_secret_key
```

### Install (Mobile)
```bash
npm install react-native-razorpay
```
For Expo: this requires a custom dev client or EAS build (`react-native-razorpay` uses native modules and will NOT work in plain Expo Go). Run:
```bash
npx expo install expo-dev-client
eas build --profile development --platform android
```

### Payment Flow

```
User taps "Buy Now" on a plan (Silver/Gold/Platinum)
   ↓
Mobile app calls Edge Function `create-razorpay-order` with plan_id + user_id
   ↓
Edge Function creates a Razorpay Order (server-side, using secret key) → returns order_id
   ↓
Mobile app opens Razorpay Checkout UI with order_id (react-native-razorpay)
   ↓
User completes payment in Razorpay's UI (card/UPI/netbanking)
   ↓
Razorpay returns payment_id + signature to the mobile app
   ↓
Mobile app calls Edge Function `verify-razorpay-payment` with payment_id + order_id + signature
   ↓
Edge Function verifies the signature server-side (using secret key) → if valid:
   - Insert into purchase_history (payment_status = 'completed')
   - Apply membership stacking logic (same tier / higher tier / lower tier rules)
   - Trigger initial band-based distribution if this is first upgrade from free
   ↓
Mobile app shows success screen → navigates to Home
```

### Edge Function — Create Razorpay Order

`supabase/functions/create-razorpay-order/index.js`:
```js
import { createClient } from 'https://esm.sh/@supabase/supabase-js@2'

const supabase = createClient(Deno.env.get('SUPABASE_URL'), Deno.env.get('SUPABASE_SERVICE_ROLE_KEY'))

Deno.serve(async (req) => {
  const { plan_id, user_id } = await req.json()

  const { data: plan } = await supabase.from('membership_plans').select('*').eq('id', plan_id).single()
  if (!plan) return new Response(JSON.stringify({ error: 'Plan not found' }), { status: 404 })

  const keyId = Deno.env.get('RAZORPAY_KEY_ID')
  const keySecret = Deno.env.get('RAZORPAY_KEY_SECRET')
  const auth = btoa(`${keyId}:${keySecret}`)

  const orderResponse = await fetch('https://api.razorpay.com/v1/orders', {
    method: 'POST',
    headers: { 'Authorization': `Basic ${auth}`, 'Content-Type': 'application/json' },
    body: JSON.stringify({
      amount: plan.price_inr * 100, // Razorpay needs paise
      currency: 'INR',
      receipt: `wedring_${user_id}_${Date.now()}`,
      notes: { user_id, plan_id, tier: plan.name },
    }),
  })

  const order = await orderResponse.json()

  return new Response(JSON.stringify({
    order_id: order.id,
    amount: order.amount,
    currency: order.currency,
    key_id: keyId,
  }), { headers: { 'Content-Type': 'application/json' } })
})
```

### Edge Function — Verify Payment & Apply Membership

`supabase/functions/verify-razorpay-payment/index.js`:
```js
import { createClient } from 'https://esm.sh/@supabase/supabase-js@2'
import { createHmac } from 'https://deno.land/std/node/crypto.ts'

const supabase = createClient(Deno.env.get('SUPABASE_URL'), Deno.env.get('SUPABASE_SERVICE_ROLE_KEY'))

Deno.serve(async (req) => {
  const { order_id, payment_id, signature, user_id, plan_id } = await req.json()

  // 1. Verify signature
  const keySecret = Deno.env.get('RAZORPAY_KEY_SECRET')
  const expectedSignature = createHmac('sha256', keySecret)
    .update(`${order_id}|${payment_id}`)
    .digest('hex')

  if (expectedSignature !== signature) {
    return new Response(JSON.stringify({ error: 'Invalid signature' }), { status: 400 })
  }

  // 2. Fetch plan + current membership
  const { data: plan } = await supabase.from('membership_plans').select('*').eq('id', plan_id).single()
  const { data: currentMembership } = await supabase
    .from('user_memberships')
    .select('*')
    .eq('user_id', user_id)
    .eq('status', 'active')
    .order('created_at', { ascending: false })
    .limit(1)
    .single()

  const tierRank = { free: 0, silver: 1, gold: 2, platinum: 3 }
  const isHigherTier = !currentMembership || tierRank[plan.name] > tierRank[currentMembership.tier]
  const isSameTier = currentMembership && currentMembership.tier === plan.name

  if (isSameTier) {
    // Add credits + extend validity
    await supabase.from('user_memberships').update({
      contact_credits_remaining: currentMembership.contact_credits_remaining + plan.contact_credits,
      interest_credits_remaining: currentMembership.interest_credits_remaining + plan.interest_credits,
      expiry_date: new Date(new Date(currentMembership.expiry_date).getTime() + plan.validity_days * 86400000),
    }).eq('id', currentMembership.id)
  } else if (isHigherTier) {
    // Queue the old plan, activate new one immediately
    if (currentMembership) {
      await supabase.from('user_memberships').update({ status: 'queued', queue_order: 1 }).eq('id', currentMembership.id)
    }
    await supabase.from('user_memberships').insert({
      user_id, plan_id, tier: plan.name,
      expiry_date: new Date(Date.now() + plan.validity_days * 86400000),
      contact_credits_remaining: plan.contact_credits,
      interest_credits_remaining: plan.interest_credits,
      status: 'active',
    })
  } else {
    // Lower tier — queue it
    await supabase.from('user_memberships').insert({
      user_id, plan_id, tier: plan.name,
      contact_credits_remaining: plan.contact_credits,
      interest_credits_remaining: plan.interest_credits,
      status: 'queued', queue_order: 1,
    })
  }

  // 3. Record purchase
  await supabase.from('purchase_history').insert({
    user_id, plan_id, tier: plan.name, amount_paid: plan.price_inr,
    payment_status: 'completed', payment_gateway: 'razorpay', gateway_reference: payment_id,
  })

  // 4. If first upgrade from free, trigger initial band-based distribution
  // (call distributeProfilesForUser() here using profile_distribution settings for this tier)

  return new Response(JSON.stringify({ success: true }))
})
```

### Mobile App — Checkout Trigger

`mobile/lib/payments.js`:
```js
import RazorpayCheckout from 'react-native-razorpay'
import { supabase } from './supabase'

export async function purchasePlan(planId, userId, userEmail, userPhone) {
  const { data: orderData } = await supabase.functions.invoke('create-razorpay-order', {
    body: { plan_id: planId, user_id: userId }
  })

  const options = {
    description: 'Wedring Matrimony Membership',
    image: 'https://your-r2-public-domain.com/logo.png',
    currency: orderData.currency,
    key: orderData.key_id,
    amount: orderData.amount,
    order_id: orderData.order_id,
    name: 'Wedring Matrimony',
    prefill: { email: userEmail, contact: userPhone },
    theme: { color: '#C8102E' },
  }

  const paymentResult = await RazorpayCheckout.open(options)

  const { data: verifyData } = await supabase.functions.invoke('verify-razorpay-payment', {
    body: {
      order_id: orderData.order_id,
      payment_id: paymentResult.razorpay_payment_id,
      signature: paymentResult.razorpay_signature,
      user_id: userId,
      plan_id: planId,
    }
  })

  return verifyData
}
```

### Admin Panel — Payment Management
The existing Payment Management page reads directly from `purchase_history` (already populated by the verify function above). No changes needed there beyond what's already specified — Razorpay's `gateway_reference` (the payment_id) is stored and visible in the admin table for reconciliation against the Razorpay Dashboard if needed.

---



**Religions**: Hindu, Muslim, Christian, Sikh, Buddhist, Jain
**Hindu castes**: Brahmin, Kshatriya, Vaisya, Nadar, Thevar, Gounder, Mudaliar, Pillai, Chettiar, Vanniyar, Yadav, and others — plus "No Caste Preference" as default first option
**Occupations**: Software Engineer, Doctor, Lawyer, Teacher, Police Officer, Business Owner, Government Employee, Engineer, Nurse, Accountant, Professor, Army/Defence, Not Working, Other
**Rasi (12)**: Mesham, Rishabam, Mithunam, Kadagam, Simmam, Kanni, Thulam, Viruchigam, Dhanusu, Makaram, Kumbam, Meenam
**Nakshatra (27)**: Ashwini, Bharani, Krittika, Rohini, Mrigashira, Ardra, Punarvasu, Pushya, Ashlesha, Magha, Purva Phalguni, Uttara Phalguni, Hasta, Chitra, Swati, Vishakha, Anuradha, Jyeshtha, Mula, Purva Ashadha, Uttara Ashadha, Shravana, Dhanishta, Shatabhisha, Purva Bhadrapada, Uttara Bhadrapada, Revati
**Dosham**: No Dosham, Sevvai Dosham, Rahu Dosham, Ketu Dosham, Partial Dosham
**Mother Tongues**: Tamil, Telugu, Kannada, Malayalam, Hindi, English, Marathi, Bengali, Gujarati, Punjabi, Urdu, Other
**States → Districts → Cities**: preload all Indian states, default to Tamil Nadu with full district + city list

---

## MOBILE APP — TECHNICAL SETUP

```bash
npx create-expo-app@latest mobile --template blank
cd mobile
npx expo install expo-router expo-status-bar expo-image-picker
npx expo install @supabase/supabase-js @react-native-async-storage/async-storage
npx expo install react-native-url-polyfill
npm install zustand react-hook-form @hookform/resolvers zod
npm install @react-navigation/native @react-navigation/bottom-tabs @react-navigation/native-stack
npx expo install react-native-screens react-native-safe-area-context
npm install react-native-toast-message date-fns
npm install react-native-razorpay
npx expo install expo-dev-client
```

**Note**: `react-native-razorpay` requires a custom dev client (not plain Expo Go) since it uses native modules. After installing, run `eas build --profile development --platform android` to generate a dev client APK for testing payments. All other features (registration, matches, etc.) still work fine in plain Expo Go — only the Upgrade/Payment screen needs the dev client build.

`.env`:
```
EXPO_PUBLIC_SUPABASE_URL=your_supabase_url
EXPO_PUBLIC_SUPABASE_ANON_KEY=your_supabase_anon_key
EXPO_PUBLIC_R2_PUBLIC_URL=https://your-r2-public-domain.com
EXPO_PUBLIC_RAZORPAY_KEY_ID=your_razorpay_key_id
```

`lib/supabase.js`:
```js
import { createClient } from '@supabase/supabase-js'
import AsyncStorage from '@react-native-async-storage/async-storage'

export const supabase = createClient(
  process.env.EXPO_PUBLIC_SUPABASE_URL,
  process.env.EXPO_PUBLIC_SUPABASE_ANON_KEY,
  { auth: { storage: AsyncStorage, autoRefreshToken: true, persistSession: true, detectSessionInUrl: false } }
)
```

**Theme colors**:
```js
export const Colors = {
  primary: '#C8102E', secondary: '#FFD700', background: '#FFF8F0',
  card: '#FFFFFF', text: '#1A1A1A', subtext: '#666666', border: '#E8E8E8',
  success: '#22C55E', silver: '#A8A9AD', gold: '#FFD700', platinum: '#E5E4E2',
}
```

**Folder structure**:
```
mobile/
├── app/(auth)/index.jsx, login.jsx, register/step1-9.jsx, register/otp.jsx
├── app/(app)/home.jsx, matches.jsx, interests.jsx, upgrade.jsx, settings/
├── components/ProfileCard.jsx, MembershipBadge.jsx, ProgressBar.jsx, OTPInput.jsx
├── lib/supabase.js, compatibility.js, distribution.js, profileCompletion.js, uploadToR2.js, payments.js
├── store/authStore.js, profileStore.js
├── data/religions.js, locations.js, horoscope.js, occupations.js
└── constants/theme.js
```

Build every screen exactly as described in the "APP OVERVIEW" section above, applying all business rules, the band-based distribution algorithm, R2 photo uploads, and Razorpay payments.

---

## ADMIN PANEL — TECHNICAL SETUP

```bash
npm create vite@latest admin -- --template react
cd admin
npm install -D tailwindcss postcss autoprefixer
npx tailwindcss init -p
npm install @supabase/supabase-js react-router-dom @tanstack/react-table recharts
npm install react-hook-form @hookform/resolvers zod react-hot-toast
npm install xlsx jspdf jspdf-autotable lucide-react date-fns papaparse
npm install @aws-sdk/client-s3
```

`.env`:
```
VITE_SUPABASE_URL=your_supabase_url
VITE_SUPABASE_ANON_KEY=your_anon_key
VITE_SUPABASE_SERVICE_ROLE_KEY=your_service_role_key
VITE_R2_ACCOUNT_ID=your_cloudflare_account_id
VITE_R2_ACCESS_KEY_ID=your_r2_access_key_id
VITE_R2_SECRET_ACCESS_KEY=your_r2_secret_access_key
VITE_R2_BUCKET_NAME=wedring-uploads
VITE_R2_PUBLIC_URL=https://your-r2-public-domain.com
```

`src/lib/supabase.js` (uses SERVICE ROLE key to bypass RLS):
```js
import { createClient } from '@supabase/supabase-js'
export const supabase = createClient(
  import.meta.env.VITE_SUPABASE_URL,
  import.meta.env.VITE_SUPABASE_SERVICE_ROLE_KEY
)
```

**Tailwind colors**:
```js
module.exports = {
  content: ['./src/**/*.{js,jsx}'],
  theme: { extend: { colors: { primary: '#C8102E', gold: '#FFD700', silver: '#A8A9AD', platinum: '#6B7280' } } }
}
```

**Folder structure**:
```
admin/src/
├── lib/supabase.js
├── pages/Login.jsx, Dashboard.jsx, ManageUsers.jsx, UserDetail.jsx,
│         MembershipManagement.jsx, DistributionManagement.jsx,
│         PaymentManagement.jsx, PurchaseHistory.jsx
├── components/Layout.jsx, Sidebar.jsx, StatCard.jsx, DataTable.jsx,
│              UserEditModal.jsx, PlanEditModal.jsx, ConfirmModal.jsx
├── utils/exportPDF.js, exportExcel.js, bulkImport.js, distribution.js, uploadToR2.js
└── App.jsx
```

Build every page exactly as described in the "Admin Panel Layout" section above. Bulk import with photos should upload images to R2 first via `uploadToR2.js`, then store the resulting public URL in `profile_photos.photo_url`.

**Critical**: The Distribution Management page's Manual Push feature MUST call the same `distributeProfilesForUser()` function described in the algorithm section — admin enters a total count, the system band-splits it automatically. Do not let admin manually set band values.

---

## DAILY CRON (Supabase Edge Function)

`supabase/functions/daily-distribution/index.js`:
```js
import { createClient } from 'https://esm.sh/@supabase/supabase-js@2'

const supabase = createClient(
  Deno.env.get('SUPABASE_URL'),
  Deno.env.get('SUPABASE_SERVICE_ROLE_KEY')
)

Deno.serve(async () => {
  const { data: activeMemberships } = await supabase
    .from('user_memberships')
    .select('user_id, tier')
    .eq('status', 'active')
    .in('tier', ['silver', 'gold', 'platinum'])

  if (!activeMemberships) return new Response('No active memberships')

  const { data: distributions } = await supabase.from('profile_distribution').select('*')
  const distMap = {}
  distributions?.forEach(d => { distMap[d.tier] = d })

  let updated = 0
  for (const membership of activeMemberships) {
    const dist = distMap[membership.tier]
    if (!dist) continue

    const { data: myProfile } = await supabase.from('profiles').select('*').eq('id', membership.user_id).single()
    const oppositeGender = myProfile?.gender === 'male' ? 'female' : 'male'

    const { data: existingPool } = await supabase.from('user_profile_pool').select('profile_id').eq('user_id', membership.user_id)
    const excludeIds = [membership.user_id, ...(existingPool?.map(p => p.profile_id) || [])]

    const { data: candidates } = await supabase
      .from('profiles')
      .select('*')
      .eq('gender', oppositeGender)
      .not('id', 'in', `(${excludeIds.join(',')})`)

    if (!candidates?.length) continue

    // Calculate compatibility score for every candidate
    const scored = candidates.map(c => ({ profile_id: c.id, compatibility_score: calculateCompatibility(myProfile, c) }))

    // Band-split for all_matches
    const allMatchesInserts = await distributeProfilesForUser(membership.user_id, dist.daily_all_matches, 'all_matches', scored)
    // Band-split for new_profiles
    const newProfilesInserts = await distributeProfilesForUser(membership.user_id, dist.daily_new_profiles, 'new_profiles', scored)

    await supabase.from('user_profile_pool').upsert([...allMatchesInserts, ...newProfilesInserts], {
      onConflict: 'user_id,profile_id,section', ignoreDuplicates: true
    })
    updated++
  }

  return new Response(JSON.stringify({ success: true, users_updated: updated }))

  // Paste calculateCompatibility() and distributeProfilesForUser() functions from the algorithm section above into this file
})
```

Schedule: Supabase Dashboard → Edge Functions → Schedule → Cron `0 18 * * *` (18:00 UTC = 12:00 AM IST)

---

## BUILD ORDER

1. Create Supabase project → run all SQL above (database + auth only, no storage bucket needed)
2. Set up Cloudflare R2 bucket + generate access keys (already available) → set as environment variables in both apps and as Supabase Edge Function secrets
3. Set up Razorpay account keys (already available) → set Key ID in mobile app, Key ID + Secret as Supabase Edge Function secrets
4. Build Admin Panel first (Vite + Tailwind) — easier to seed test data and verify distribution logic
5. Implement `distributeProfilesForUser()` and `calculateCompatibility()` as a SHARED module — used by mobile app's first-upgrade logic, the admin's manual push, and the daily cron
6. Deploy Supabase Edge Functions: `get-r2-upload-url`, `create-razorpay-order`, `verify-razorpay-payment`, `daily-distribution`
7. Build Mobile App (Expo) — all 10 registration steps, Home, Matches, Interests, Upgrade (with real Razorpay checkout), Settings (with R2 photo upload)
8. Build a dev client (`eas build --profile development`) to test Razorpay checkout, since plain Expo Go cannot run native payment SDKs
9. Schedule the daily distribution cron (12:00 AM IST)
10. Test end-to-end: registration → OTP → profile build → photo upload to R2 → browse matches → purchase plan via Razorpay → verify credits/membership update correctly

---

## SECURITY NOTES

1. Mobile app uses Supabase ANON KEY only — never the service role key
2. Admin panel uses Supabase SERVICE ROLE KEY — bypasses RLS, keep `.env` out of git
3. Mobile app NEVER holds the R2 secret access key or the Razorpay secret key — both stay server-side in Supabase Edge Function secrets. Mobile only has the R2 public URL and the Razorpay public Key ID.
4. Admin panel holds the R2 secret keys directly since it's a trusted internal tool — still keep `.env` out of version control
5. Razorpay payment verification MUST happen server-side (in the `verify-razorpay-payment` Edge Function) by checking the HMAC signature — never trust a "payment successful" flag sent directly from the mobile app without signature verification
6. OTP verification is the only gate before writing user data to Supabase — never bypass it
7. Always confirm destructive admin actions (delete, reset to free) with a modal
8. Add `.env`, `eas.json` secrets, and any R2/Razorpay key files to `.gitignore` in both projects
