# MISSING & PARTIAL FEATURES — WEDRING MATRIMONY

**Date:** 2026-06-19. Compared against `Check.md`. Treat DB as fresh deployment.

Legend: ❌ Missing · ⚠ Partial (needs rework)

---

## ❌ MISSING (must be built)

### Distribution (CRITICAL — core product)
1. **5-band distribution algorithm** (70-60 / 60-50 / 50-40 / 40-30 / 30-10). No backend reference exists.
2. **Even-split across bands** with `floor(total/5)` per band.
3. **Remainder rule** — extra profiles go to highest bands first.
4. **Shortfall borrowing** — pull from nearest adjacent band (higher neighbor first, then lower, expanding outward).
5. **`user_profile_pool` table** with `compatibility_band` + `compatibility_score` + `section`.
6. **Single shared `distributeProfilesForUser()`** used by initial grant, daily cron, and admin manual push.
7. **Admin manual push** that band-splits an admin-entered total (UI currently read-only).

### Membership / Credits
8. **Horoscope view = 1 credit** deduction. Not implemented anywhere.
9. **Single `membership_plans` table** (spec) — currently fragmented into `tier_settings` + `subscription_plans`.
10. **`credit_transactions` ledger** per spec (type, credits_used, reference_id).

### Interests
11. **`not_interested` table + Restore** flow (currently `interests.status='passed'`, no restore).

### Payments
12. **Server-side Razorpay order creation** (Edge Function) — currently client-side.
13. **Server-side signature verification** — currently mocked.
14. **`purchase_history` table** per spec (vs current `payments`).

### Admin
15. **Bulk CSV import** (only JSON exists).
16. **Export PDF** (none).
17. **Export Excel/XLSX** (only CSV).
18. **Dedicated Purchase History page** (only per-user modal tab).
19. **Wire Distribution Management manual-push** to shared engine.

### Security (must-fix before production)
20. Move **Supabase service-role key** out of the admin client bundle (server-only).
21. Move **R2 secret** to an Edge Function presigned-URL flow.
22. Move **Razorpay secret** server-side.

---

## ⚠ PARTIAL (rework needed)

| Feature | Gap |
|---|---|
| Email OTP | Live screen is 8-digit; spec wants 6-digit. Reconcile + delete dead `OTPScreen.js`. |
| OTP resend cooldown | Not aligned to spec's 1-min. |
| DB-write-after-verify | Profile row created before OTP verification. |
| Photo upload | Works but client-side R2 creds; enforce max-5 in backend. |
| Daily cron | Runs but uses non-band counter logic; confirm 12:00 AM IST schedule. |
| Send-interest / unlock-contact RPCs | Conflicting duplicate definitions; consolidate. |
| Free-user gating | RPC-only; add RLS so direct INSERT can't bypass. |
| Matching score → bands | Score exists but never drives band assignment. |
| Admin dashboard charts | Minimal; spec wants tier breakdown + revenue charts. |

---

## ✅ ALREADY GOOD (keep)
- Full registration flow (10 steps) and gating.
- Login / register / forgot / reset password.
- Client compatibility engine + 10-Porutham star matching.
- Admin user management (edit/delete/upgrade/downgrade/reset, JSON bulk import).
- Premium plan editor UI.
- Matches / Interests / Premium / Settings / Notifications screens.
