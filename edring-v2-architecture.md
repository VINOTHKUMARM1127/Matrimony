# Wedring Matrimony V2 - Final Premium Distribution, Credits & Subscription Architecture

## Goal

Create a completely dynamic matrimony platform template that can be reused for:

- Tamil Matrimony
- Telugu Matrimony
- Muslim Matrimony
- Christian Matrimony
- Community Matrimony
- White-label Client Matrimony Apps

Everything must be configurable from Admin Panel.

No hardcoded limits.

All values must come from Supabase.

---

# ISSUE 1 - Contact Unlock Credits Bug

Current Bug:

User has credits.

Clicks:

View Contact

System shows:

"You don't have enough credits."

Fix:

Before showing error:

Check user_wallet.contact_credits

```sql
SELECT contact_credits
FROM user_wallet
WHERE user_id = auth.uid();
```

If credits > 0:

Allow unlock.

Deduct 1 credit.

Store unlock history.

Return contact details.

Only show error if credits = 0.

---

# ISSUE 2 - Dynamic Profile Distribution

Admin controls profile visibility.

User never receives all profiles at once.

---

# Home Page Sections

1. Recommended Matches
2. Nearby Matches
3. Daily Picks

All three sections use tier distribution settings.

---

# Free Tier Example

Admin Configuration:

```text
Recommended = 3
Nearby = 3
Daily = 3
```

Application only receives:

3 Recommended
3 Nearby
3 Daily

Nothing more.

No hidden loading.

No extra profiles.

---

# Premium Upgrade Flow

Free User

Sees:

3 Profiles

Upgrades to Silver.

Admin Config:

```text
Initial Distribution

Recommended = 50
Nearby = 50
Daily Pool = 50
```

Immediately after payment:

Show:

50 Recommended
50 Nearby
50 Daily

These profiles appear at top.

Previously shown free profiles move below.

Premium user immediately feels value.

---

# Re-Upgrade Rule

Example:

Silver → Expired → Free

User already received Silver Initial Distribution.

Later:

Free → Silver Again

DO NOT grant Silver Initial Distribution again.

Reason:

Already granted before.

Only:

Grant Credits.

Grant Daily Distribution.

No duplicate profile allocation.

---

# Upgrade Rule

Silver → Gold

Check:

initial_distribution_granted_tiers

If Gold never granted:

Grant:

Gold Initial Distribution

Only once.

Store:

Gold granted.

---

# Profile Distribution Tables

## subscription_plans

Admin controls:

```sql
tier

contact_credits
interest_credits

free_recommended_limit
free_nearby_limit
free_daily_limit

initial_recommended_profiles
initial_nearby_profiles
initial_daily_profiles

daily_recommended_increment
daily_nearby_increment
daily_profiles_increment
```

---

# User Distribution State

```sql
CREATE TABLE user_distribution_state (
  user_id uuid primary key,

  initial_distribution_granted_tiers text[],

  recommended_pool integer default 0,

  nearby_pool integer default 0,

  daily_pool integer default 0,

  last_distribution_date date,

  created_at timestamptz default now()
);
```

---

# New Profiles System

Every profile must contain:

```sql
created_at
```

When new members register:

They enter profile queue.

Daily distribution pulls newest profiles first.

Users always see fresh profiles.

---

# UI Enhancement

Inside profile list:

Show divider:

```text
──────────────

✨ New Profiles Added Today

──────────────
```

Below divider:

Newly distributed profiles.

Older profiles remain below.

Users feel profiles are refreshed daily.

---

# Daily Distribution Cron

Runs:

12:00 AM

For active subscriptions.

Load values from:

subscription_plans

Example:

Silver:

```text
Recommended +10
Nearby +10
Daily +10
```

Update user pools.

Insert newest profiles.

---

# Admin Emergency Distribution

New Admin Feature

Page:

Premium Distribution Control

Section:

Manual Boost

---

Admin selects:

```text
Tier

Silver
Gold
Platinum
```

Enter:

```text
Recommended +20

Nearby +20

Daily +20
```

Click:

Apply Distribution

---

System immediately grants additional profiles.

No need to wait for midnight cron.

Useful when:

- Too few profiles
- Festival promotions
- VIP support
- Premium customer complaints

---

# Remove Upgrade Message

Current:

"Upgrade to see more profiles"

Remove card.

Instead:

After final profile:

Show:

```text
No New Profiles Available Right Now

New matches will be added automatically.
```

Cleaner UI.

---

# Credits System

Separate from Profile Distribution.

---

# Contact Credits

Admin Config:

Silver = 30

Gold = 50

Platinum = 100

---

# Interest Credits

Admin Config:

Silver = 50

Gold = 100

Platinum = 300

---

# Homepage Wallet Widget

Show:

```text
Contact Credits Left: 24

Interest Credits Left: 72
```

Real-time values.

---

# Sending Interest

When user clicks:

Send Interest

Logic:

```sql
interest_credits = interest_credits - 1
```

Update homepage immediately.

---

# Unlock Contact

When user clicks:

View Mobile Number

Logic:

```sql
contact_credits = contact_credits - 1
```

Update homepage immediately.

---

# Subscription Queue System

Very Important.

Users may buy multiple plans.

Example:

Current Active

Gold

Expires:

30 July

User purchases:

Silver

Then:

Silver should NOT activate immediately.

Store in queue.

---

# New Table

subscription_queue

```sql
CREATE TABLE subscription_queue (
  id uuid primary key default gen_random_uuid(),

  user_id uuid not null,

  plan_tier text not null,

  duration_months integer,

  contact_credits integer,

  interest_credits integer,

  status text default 'pending',

  created_at timestamptz default now()
);
```

---

# Activation Logic

Current Plan Expires.

System automatically activates:

Next queued plan.

Example:

Gold Active

Silver Pending

Gold expires

Silver activates automatically.

---

# Admin User Management

Inside:

Manage Users

Add section:

Subscription History

Show:

```text
Current Plan

Gold

Expiry

30 Jul 2026

Queued Plans

1. Silver
2. Silver
3. Platinum
```

---

Admin Actions

Buttons:

```text
Activate Now

Remove Plan

Move Up

Move Down

Cancel Plan
```

Admin fully controls queue.

---

# Final Requirement

Build complete Supabase migration.

Build Admin Panel.

Build APIs.

Build Cron Jobs.

Build Profile Distribution Engine.

Build Wallet System.

Build Subscription Queue.

All values controlled from Admin Panel.

No hardcoded values.

Reusable for unlimited matrimony brands.

Fresh Supabase installation must work immediately after migration.
