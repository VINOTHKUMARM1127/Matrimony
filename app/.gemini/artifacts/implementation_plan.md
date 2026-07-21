# Support for Viewing and Deleting Incomplete Profiles (No-Profile Users)

## Goal
Fix the issue where users who drop off during registration (creating an auth account but no profile) cannot sign up again ("account already exists") and do not appear in the admin panel to be managed or deleted.

## Root Cause
1. When a user creates an account, a row is inserted into `auth.users`.
2. The `profiles` row is created later in the flow (after Basic Details). If they drop off early, they exist in `auth` but not in `profiles`.
3. The admin panel's user list is powered by the `fn_admin_list_users` RPC, which currently uses `FROM profiles p LEFT JOIN auth.users au`. This inherently excludes anyone without a `profiles` row.
4. The "Clean Up Incomplete" button in `UsersManager.jsx` checks the `profiles` table for `profile_completion_percent === 0`, completely missing the "no-profile" users.

## Proposed Changes

### 1. Database Migration: Rewrite `fn_admin_list_users`
Create a new migration (e.g. `20260721120000_fix_admin_list_users_auth_base.sql`) to rewrite the RPC:
- Change the query base to `FROM auth.users au LEFT JOIN profiles p ON p.id = au.id`.
- For users without a profile, return a synthesized JSON object with just their `id` and defaults, so the frontend receives a valid user object.
- Update the `p_status = 'incomplete'` filter to specifically include rows where `p.id IS NULL` or `p.profile_completion_percent <= 50`.

### 2. Update `UsersManager.jsx` (Admin Frontend)
- Ensure the table renders gracefully for users with no profile row (fallback `full_name` to "Incomplete Setup", handle missing `profile_completion_percent`).
- We already have the "Status: Incomplete" filter dropdown, which will now automatically show these "ghost" users thanks to the RPC rewrite.

### 3. Update `deleteIncompleteUsers` in `adminApi.js`
- Currently, this fetches all `profiles` and checks completion. We will rewrite it to use a new Supabase RPC or use the edge function to find `auth.users` who either have no profile or have an incomplete profile, and delete them.
- Actually, a new RPC `fn_admin_get_incomplete_user_ids` is cleaner and more robust than fetching all users to the client. The client will call this RPC to get the IDs, then invoke the `admin-users` edge function to delete them (which deletes from `auth.users` and cascades).

## Open Questions for the User
- For the "Clean Up Incomplete" button, should it delete *everyone* who is incomplete instantly, or should there be a grace period (e.g., only delete incomplete accounts that are older than 24 hours so we don't delete people currently in the middle of signing up)?

> [!WARNING]
> Deleting accounts immediately could disrupt active users who are currently filling out their profile. I strongly recommend adding a 24-hour grace period for the automated cleanup. Let me know if you want to include this grace period!
