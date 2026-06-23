# WEDRING MATRIMONY — ARCHITECTURE

**Date:** 2026-06-19 · **Source of truth:** `Check.md`

---

## 1. SYSTEM OVERVIEW

Three deployables, one backend.

```
┌──────────────────┐      ┌──────────────────┐
│   Mobile App     │      │   Admin Panel    │
│ React Native     │      │ React + Vite     │
│ (Expo, Android)  │      │ (Tailwind)       │
└────────┬─────────┘      └────────┬─────────┘
         │ anon key (RLS)          │ anon key (RLS) + server-only service key
         ▼                         ▼
        ┌──────────────────────────────────┐
        │           SUPABASE               │
        │  Postgres + Auth + Email OTP     │
        │  RLS · RPCs · Triggers · pg_cron │
        │  Edge Functions (Deno)           │
        └───────┬───────────────┬──────────┘
                │               │
        ┌───────▼──────┐ ┌──────▼────────┐
        │ Cloudflare R2│ │   Razorpay    │
        │ photo store  │ │  payments     │
        │ (presigned)  │ │ (server verify)│
        └──────────────┘ └───────────────┘
```

**Principle:** All secrets (R2 secret, Razorpay secret, service-role key) live **server-side only** — in Edge Functions. Clients hold only the anon key and public Razorpay key id.

---

## 2. MOBILE APP (`app/`)

- **Stack:** Expo SDK 54, React Native 0.81, React 19, React Navigation 7 (stack + bottom-tabs), Zustand 5, TanStack Query 5, Supabase JS 2, lucide-react-native, i18next (en/ta). Styling: custom theme (`src/theme/`), no NativeWind.
- **Navigation (`src/navigation/AppNavigator.js`):** three-way root switch —
  - not authenticated → `AuthStack` (Login, OTP, CreateAccount, ForgotPassword, ResetPassword)
  - authenticated + `!isProfileComplete` → `RegistrationStack` (10-step flow)
  - authenticated + complete → `MainTabs` (**Home · Matches · Interests · Upgrade · Settings** per spec) + detail/settings stack screens
- **State:** `useAuthStore` (session, OTP), `useProfileStore` (profile, prefs, horoscope, photos). Server lists via React Query.
- **API layer (`src/api/`):** thin Supabase wrappers — `auth`, `profiles`, `matches`, `interests`, `subscriptions`, `settingsApi`. Calls RPCs for matching/credits/distribution.
- **Removed from scope:** chat (`chat.js`, ChatScreen, ChatListScreen, useChat), SMS OTP (`fast2sms.js`), in-app admin screens, search hook.

## 3. ADMIN PANEL (`admin/`)

- **Stack:** React 19, Vite, Tailwind 4, react-router-dom 7, Zustand 5, Supabase JS 2, AWS SDK S3 (R2).
- **Routing (`src/App.jsx`):** `/login` public; `/` protected `AdminLayout` shell → `/dashboard`, `/users`, `/bulk-upload`, `/settings`, `/distribution`, `/payments`. Admin role re-checked on layout mount against `admin_users`.
- **Pages:** Dashboard, UsersManager (+UserModal), BulkUploader, PremiumSettings, DistributionManager, PaymentHistory.
- **Security fix required:** service-role key must move out of the browser bundle into an Edge Function; admin write ops call SECURITY DEFINER RPCs instead.

## 4. SUPABASE BACKEND (target, post-rebuild)

- **Single schema:** `supabase/schema.sql` — 13 tables per spec.
- **Single membership system:** `membership_plans` + `user_memberships` (queued/stacked).
- **Single credit system:** `user_memberships.contact_credits_remaining` / `interest_credits_remaining` + `credit_transactions` ledger.
- **Single distribution engine:** `distribute_profiles_for_user()` (5-band) writing to `user_profile_pool`; shared by initial grant, daily cron, and admin manual push.
- **Folders:** `schema.sql`, `seed.sql`, `functions/` (Edge Functions: presigned-upload, razorpay-order, razorpay-verify, daily-distribution), `cron/` (pg_cron schedule), `policies/` (RLS).

## 5. KEY DATA FLOWS

- **Signup:** create account → email OTP → **on verify** create `users`+`profiles` → 10-step profile → initial band distribution (free tier).
- **Upgrade:** Razorpay order (server) → checkout → verify signature (server) → `purchase_subscription` RPC → grant credits + initial band distribution for tier → `purchase_history`.
- **Daily 12:00 AM IST:** pg_cron → `daily-distribution` Edge Function → `distribute_profiles_for_user()` for each active user (band split) → append to `user_profile_pool`.
- **Spend credit:** view contact / view horoscope / send interest → RPC checks `user_memberships` remaining → decrement + write `credit_transactions`.

## 6. SECURITY MODEL

| Secret | Location |
|---|---|
| Supabase anon key | client (RLS enforced) |
| Supabase service-role key | Edge Function env only |
| R2 access/secret | Edge Function (presigned URLs) |
| Razorpay key id | client |
| Razorpay key secret | Edge Function (order + verify) |

RLS on every table; credit/distribution mutations only through SECURITY DEFINER RPCs so clients cannot bypass quotas.
