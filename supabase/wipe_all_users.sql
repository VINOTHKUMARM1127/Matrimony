-- ============================================================
-- DANGER: WIPE ALL USERS
-- Run this in the Supabase SQL Editor to completely erase
-- every user and all their related profile data, photos, etc.
-- ============================================================

-- If you want to keep your admin account, uncomment the WHERE clause below
-- and change it to your email address:
DELETE FROM auth.users;
-- WHERE email != 'vinomaddy2711@gmail.com';
