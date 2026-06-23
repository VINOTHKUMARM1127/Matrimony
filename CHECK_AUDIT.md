# WEDRING MATRIMONY — CHECK AUDIT

**Date:** 2026-06-19
**Method:** Codebase audit (mobile `app/`, admin `admin/`, backend `supabase/`) compared against `Check.md` (the build spec / source of truth).
**DB status:** Supabase database is empty → treat as a **fresh deployment**. The 5-band distribution algorithm in `Check.md` is the **final source of truth**.

Legend: ✅ Implemented · ⚠ Partially Implemented · ❌ Missing/Broken

---

## 1. AUTHENTICATION

| Feature | Status | Notes |
|---|---|---|
| Email/phone + password login | ✅ | `LoginScreen.js` → `signInWithPassword` |
| Register (create account) | ✅ | `CreateAccountScreen.js`, captures creating-for + mother tongue |
| Forgot password | ✅ | `ForgotPasswordScreen.js` → `resetPasswordForEmail` |
| Reset password screen | ✅ | `ResetPasswordScreen.js` wired into AuthStack |
| Email OTP | ⚠ | Email OTP works via Supabase. **Two OTP screens exist** — `OTPVerifyScreen.jsx` (8-digit, live) and `OTPScreen.js` (6-digit, **orphaned/dead**). Spec calls for **6-digit**. Live screen uses 8 digits — mismatch. |
| OTP expiry (5 min) | ⚠ | Live screen has 300s countdown (matches spec). But phone OTP via Fast2SMS is `Math.random()` in client memory, lost on restart. |
| OTP resend cooldown (1 min) | ⚠ | Live `OTPVerifyScreen.jsx` cooldown does not match spec's 1-min; dead `OTPScreen.js` uses 30s. Needs reconciliation. |
| Write user to DB **only after** OTP verify | ⚠ | Signup path creates the `profiles` row during signup; spec requires DB write **only after** verification. Needs verification gating. |
| SMS OTP | ❌ (by design) | Spec says **email OTP only** for now. Fast2SMS code (`api/fast2sms.js`) is out-of-scope and insecure (client-side secret) — should be removed. |

**Verdict:** Core auth ✅, but OTP layer ⚠ — duplicate screens, digit-count mismatch, client-side phone OTP, and DB-write-before-verify all need cleanup.

---

## 2. PROFILE CREATION FLOW (10 steps)

| Spec Step | Screen | Status |
|---|---|---|
| 1. Creating for + Mother Tongue | `CreateAccountScreen.js` | ✅ |
| 2. Email + Phone + Password (uniqueness) | `CreateAccountScreen.js` + `check_user_exists` RPC | ✅ |
| 3. Email OTP verify (6-digit) | `OTPVerifyScreen.jsx` | ⚠ (8-digit, see Auth) |
| 4. Personal (name/gender/DOB/height/marital) | `BasicInfoScreen.js` | ✅ |
| 5. Religion + Caste | `ReligionCasteScreen.js` | ✅ |
| 6. Education + Occupation + Income | `EducationScreen.js` | ✅ |
| 7. State → District → City + About | (in registration set) | ✅ |
| 8. Horoscope (Rasi/Nakshatra/Lagnam/Gothram/Dosham) | `HoroscopeScreen.js` | ✅ |
| 9. Languages/Hobbies/Interests/Lifestyle | `LifestyleScreen.js` | ✅ |
| 10. Partner Preferences (Age+Height mandatory) | `PartnerPreferenceScreen.js` | ✅ |
| Family details | `FamilyScreen.js` | ✅ (extra step, fine) |
| Photo upload (max 5) | `PhotoUploadScreen.js` | ⚠ R2 upload works but credentials are bundled in client (`EXPO_PUBLIC_R2_*`); spec requires presigned URL via Edge Function. Max-5 enforced only by spec trigger, not current backend. |

**Verdict:** Flow ✅ end-to-end and gated by `isProfileComplete`. Photo upload security ⚠.

---

## 3. MEMBERSHIP SYSTEM

| Feature | Status | Notes |
|---|---|---|
| Tiers Free/Silver/Gold/Platinum | ✅ | Present across code + plans table |
| Admin edits price/validity/contact credits/interest credits | ⚠ | Admin `PremiumSettings.jsx` edits plans, but backend has **two competing plan tables** — `tier_settings` (00_authoritative) vs `subscription_plans` (01_schema). Spec wants a single `membership_plans` table. |
| View Contact = 1 credit | ⚠ | `unlock_contact()` RPC exists but redefined in 2 files with conflicting return types; credit model split between `user_wallet` and `profiles.contacts_remaining`. |
| View Horoscope = 1 credit | ❌ | No horoscope-credit deduction exists anywhere. Spec requires it. |
| Send Interest = 1 credit | ⚠ | `send_interest_with_quota()` exists, redefined 2x with conflicting signatures. |
| Free users cannot view contacts/horoscope/send interest | ⚠ | Enforced loosely in RPCs; no RLS guard on direct `interests` INSERT (policy was dropped). Bypassable. |

**Verdict:** ⚠ Conceptually present but architecturally fragmented (two plan tables, two credit stores) and **horoscope credit is Missing**.

---

## 4. DISTRIBUTION ENGINE — 5 BANDS (CRITICAL)

| Feature | Status | Notes |
|---|---|---|
| 5 fixed bands (70-60, 60-50, 50-40, 40-30, 30-10) | ❌ | **Bands do not exist anywhere in the backend.** Zero references in any SQL file. Feeds sort by a continuous score DESC. |
| Even split across 5 bands | ❌ | Not implemented. Backend does flat `+= increment` per section. |
| Remainder → highest bands first | ❌ | Not implemented. |
| Shortfall → borrow from nearest adjacent band | ❌ | Not implemented. |
| `user_profile_pool` with `compatibility_band` | ❌ | Table does not exist; backend uses `user_distribution_state` (counters) + `user_profile_views` (id arrays). |
| Single shared `distributeProfilesForUser()` for initial + daily + manual push | ❌ | Three different, conflicting `run_daily_distribution()` implementations exist; none band-aware. |

**Verdict:** ❌ **The single most important feature is entirely unbuilt.** Must be built fresh per `Check.md` lines ~447–600.

---

## 5. DAILY DISTRIBUTION CRON

| Feature | Status | Notes |
|---|---|---|
| Edge function exists | ✅ | `supabase/functions/daily-distribution/index.ts` |
| Runs 12:00 AM IST | ⚠ | Function exists; schedule (pg_cron / scheduled trigger) not confirmed in repo. |
| Generates daily matches + new profiles | ⚠ | Calls `run_daily_distribution()` which only increments counters — **does not band-split**. |
| Uses the shared distribution engine | ❌ | Engine doesn't exist; cron uses superseded counter logic. |

**Verdict:** ⚠ Shell present, ❌ correct logic absent.

---

## 6. INTEREST SYSTEM

| Feature | Status | Notes |
|---|---|---|
| Send interest (1 credit) | ⚠ | `send_interest_with_quota` (conflicting defs). |
| Sent / Received tabs | ✅ | `InterestsScreen.js` |
| Not Interested + Restore | ⚠ | App has "Passed" tab; spec wants **Not Interested with Restore**. No `not_interested` table (uses `interests.status='passed'`). Restore not implemented. |
| Accept interest | ⚠ | Calls `createChat()` → creates orphaned `chats` rows (chat is out of scope). |

**Verdict:** ⚠ Works but uses wrong data model and triggers dead chat records.

---

## 7. PAYMENT SYSTEM (Razorpay)

| Feature | Status | Notes |
|---|---|---|
| Razorpay checkout | ⚠ | `services/razorpay.js` creates orders client-side. |
| Key secret handling | ❌ | `EXPO_PUBLIC_RAZORPAY_KEY_SECRET` bundled in client — must move server-side. |
| Signature verification | ❌ | Mocked (`mock_verification: true`). No integrity check. |
| `purchase_subscription` on success | ⚠ | RPC exists, redefined 3x. |
| Purchase history recorded | ⚠ | `payments` table exists (01_schema only); spec wants `purchase_history`. |

**Verdict:** ⚠/❌ Functional happy-path but **production-unsafe**; needs server-side order + verify.

---

## 8. ADMIN PANEL

| Feature | Status | Notes |
|---|---|---|
| Dashboard (stats + charts) | ⚠ | `AdminDashboard.jsx` has stat cards; charts minimal. |
| Manage Users (search/filter/table) | ✅ | `UsersManager.jsx` + `UserModal.jsx` |
| Edit / Delete / Upgrade / Downgrade / Reset | ✅ | All present in `adminApi.js` |
| Membership Management | ✅ | `PremiumSettings.jsx` |
| Distribution Management (total + manual push) | ⚠ | `DistributionManager.jsx` is **read-only**; manual push stubs (`force_push_*`) defined but **never called**. Spec requires manual push using shared band engine. |
| Payment Management | ✅ | `PaymentHistory.jsx` |
| Purchase History | ⚠ | Per-user history in `UserModal`; no dedicated page. |
| Bulk JSON import | ✅ | `BulkUploader.jsx` |
| Bulk CSV import | ❌ | JSON only. |
| Export PDF | ❌ | None. |
| Export Excel | ❌ | CSV only, not XLSX. |
| Service-role key in client | ❌ (security) | `VITE_SUPABASE_SERVICE_ROLE_KEY` bundled in browser — critical leak. |

**Verdict:** ⚠ Strong user/plan management; distribution push, CSV import, PDF/Excel export Missing; service-key leak must be fixed.

---

## 9. MATCHING ALGORITHM (compatibility %)

| Feature | Status | Notes |
|---|---|---|
| Client-side `calculateCompatibility` | ✅ | `utils/matchingEngine.js`, weighted 0–100 |
| Factors: religion, caste, age, height, location, education, star | ✅ | Present |
| Occupation / marital / income factors | ⚠ | Income hardcoded 50%; occupation/marital partially in prefs. |
| Star/Porutham engine | ✅ | `utils/starCompatibility.js` (10-Porutham) |
| Score feeds the band selector | ❌ | Score exists but is never used to band-assign (bands don't exist). |
| Server-side scoring matches client | ⚠ | Backend feed RPCs have their own ~0–85 scoring; differs from client. |

**Verdict:** ✅ Score engine exists; ❌ not connected to banding; ⚠ client/server scoring divergence.

---

## SUMMARY SCORECARD

| Area | Status |
|---|---|
| Authentication | ⚠ |
| Profile Creation | ✅ |
| Membership System | ⚠ |
| **Distribution Engine (5 bands)** | ❌ |
| Daily Cron | ⚠ |
| Interest System | ⚠ |
| Payments | ❌ (unsafe) |
| Admin Panel | ⚠ |
| Matching % Engine | ✅/❌ (not banded) |

**Biggest gaps:** (1) 5-band distribution engine entirely missing, (2) payment security, (3) service-role key leak, (4) fragmented backend (3 distribution generations, 2 plan tables, 2 credit stores), (5) horoscope credit, CSV import, PDF/Excel export.

See `IMPLEMENTATION_GAP_REPORT.md` for the migration plan.
