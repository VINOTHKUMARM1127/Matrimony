-- ============================================================
-- Tamil Matrimony — Seeding Ecosystem (Part 1)
-- ============================================================

CREATE EXTENSION IF NOT EXISTS pgcrypto;

BEGIN;

-- CLEAN existing seed records to avoid conflicts
DELETE FROM public.user_activity WHERE activity_type = 'view_phone';
DELETE FROM public.interests WHERE message LIKE '%connect%';
DELETE FROM public.subscriptions WHERE razorpay_payment_id LIKE 'pay_mock_%';
DELETE FROM public.photos WHERE storage_path LIKE '%randomuser.me%';
DELETE FROM public.horoscope_details WHERE gothram IN ('Siva', 'Vishnu', 'Murugan', 'Bharadwaj', 'Kasyapa', 'Vashishta', 'Agastya', 'Viswamitra', 'Gautama', 'Atri', 'Angirasa', 'Harita');
DELETE FROM public.partner_preferences WHERE user_id IN (SELECT id FROM public.profiles WHERE display_name LIKE '%Kumar%' OR display_name LIKE '%Raj%' OR display_name LIKE '%Sundaram%' OR display_name LIKE '%Selvan%');
DELETE FROM public.profiles WHERE profile_id LIKE 'TM%';

-- 1. AUTH USERS INSERTIONS
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-000000000001', 'tamiluser1@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Elango Shankar"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-000000000002', 'tamiluser2@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Indhumathi Gopal"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-000000000003', 'tamiluser3@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Manikandan Nathan"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-000000000004', 'tamiluser4@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Pooja Sundaram"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-000000000005', 'tamiluser5@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Ramesh Raj"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-000000000006', 'tamiluser6@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Sneha Naicker"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-000000000007', 'tamiluser7@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Srinivasan Krishnan"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-000000000008', 'tamiluser8@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Malarvizhi Naicker"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-000000000009', 'tamiluser9@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Ramesh Gopal"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-00000000000a', 'tamiluser10@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Nivedha Velan"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-00000000000b', 'tamiluser11@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Vignesh Lingam"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-00000000000c', 'tamiluser12@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Janani Selvan"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-00000000000d', 'tamiluser13@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Viswanathan Samy"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-00000000000e', 'tamiluser14@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Archana Sundaram"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-00000000000f', 'tamiluser15@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Siddharth Raj"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-000000000010', 'tamiluser16@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Kokila Krishnan"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-000000000011', 'tamiluser17@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Hari Naicker"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-000000000012', 'tamiluser18@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Vijaya Lingam"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-000000000013', 'tamiluser19@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Ajith Pandian"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-000000000014', 'tamiluser20@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Ramani Murthy"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-000000000015', 'tamiluser21@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Rajesh Moorthy"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-000000000016', 'tamiluser22@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Malathi Kumar"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-000000000017', 'tamiluser23@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Dinesh Gopal"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-000000000018', 'tamiluser24@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Pooja Krishnan"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-000000000019', 'tamiluser25@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Sathish Shankar"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-00000000001a', 'tamiluser26@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Shalini Mani"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-00000000001b', 'tamiluser27@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Deepak Samy"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-00000000001c', 'tamiluser28@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Kokila Murthy"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-00000000001d', 'tamiluser29@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Murugan Gopal"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-00000000001e', 'tamiluser30@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Dharshini Velan"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-00000000001f', 'tamiluser31@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Prakash Pandian"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-000000000020', 'tamiluser32@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Preethi Selvan"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-000000000021', 'tamiluser33@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Siva Balan"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-000000000022', 'tamiluser34@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Ponmani Krishnan"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-000000000023', 'tamiluser35@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Viswanathan Pandian"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-000000000024', 'tamiluser36@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Archana Selvan"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-000000000025', 'tamiluser37@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Anand Moorthy"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-000000000026', 'tamiluser38@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Archana Lingam"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-000000000027', 'tamiluser39@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Suresh Pandian"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-000000000028', 'tamiluser40@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Archana Kumar"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-000000000029', 'tamiluser41@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Gautham Krishnan"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-00000000002a', 'tamiluser42@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Rajeshwari Lingam"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-00000000002b', 'tamiluser43@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Selvam Velan"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-00000000002c', 'tamiluser44@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Vidya Pandian"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-00000000002d', 'tamiluser45@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Ranjith Raman"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-00000000002e', 'tamiluser46@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Pooja Swamy"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-00000000002f', 'tamiluser47@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Praveen Sundaram"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-000000000030', 'tamiluser48@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Oviya Balan"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-000000000031', 'tamiluser49@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Ramakrishnan Nathan"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-000000000032', 'tamiluser50@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Sneha Kumar"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-000000000033', 'tamiluser51@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Rajesh Raman"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-000000000034', 'tamiluser52@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Vanitha Velan"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-000000000035', 'tamiluser53@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Saravanan Moorthy"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-000000000036', 'tamiluser54@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Ponmani Devan"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-000000000037', 'tamiluser55@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Mohan Mani"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-000000000038', 'tamiluser56@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Pooja Swamy"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-000000000039', 'tamiluser57@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Elango Selvan"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-00000000003a', 'tamiluser58@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Uma Sundaram"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-00000000003b', 'tamiluser59@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Siddharth Naicker"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-00000000003c', 'tamiluser60@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Ramya Naicker"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-00000000003d', 'tamiluser61@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Hari Devan"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-00000000003e', 'tamiluser62@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Ramya Murthy"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-00000000003f', 'tamiluser63@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Vignesh Sundaram"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-000000000040', 'tamiluser64@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Pooja Sundaram"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-000000000041', 'tamiluser65@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Selvam Krishnan"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-000000000042', 'tamiluser66@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Malarvizhi Mani"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-000000000043', 'tamiluser67@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Anbarasan Nathan"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-000000000044', 'tamiluser68@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Abirami Nathan"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-000000000045', 'tamiluser69@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Karthik Mani"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-000000000046', 'tamiluser70@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Gowri Raj"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-000000000047', 'tamiluser71@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Vijay Devan"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-000000000048', 'tamiluser72@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Keerthana Balan"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-000000000049', 'tamiluser73@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Karthik Balan"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-00000000004a', 'tamiluser74@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Malathi Gopal"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-00000000004b', 'tamiluser75@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Manikandan Raman"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-00000000004c', 'tamiluser76@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Kavitha Raj"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-00000000004d', 'tamiluser77@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Madhavan Gopal"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-00000000004e', 'tamiluser78@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Meenakshi Murthy"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-00000000004f', 'tamiluser79@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Sakthi Velan"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-000000000050', 'tamiluser80@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Rekha Gopal"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-000000000051', 'tamiluser81@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Thirumal Selvan"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-000000000052', 'tamiluser82@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Malarvizhi Swamy"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-000000000053', 'tamiluser83@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Chinnasamy Velan"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-000000000054', 'tamiluser84@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Keerthana Mani"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-000000000055', 'tamiluser85@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Thirumal Murthy"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-000000000056', 'tamiluser86@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Swetha Shankar"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-000000000057', 'tamiluser87@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Kabilan Selvan"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-000000000058', 'tamiluser88@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Preethi Balan"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-000000000059', 'tamiluser89@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Ranjith Raman"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-00000000005a', 'tamiluser90@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Archana Kumar"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-00000000005b', 'tamiluser91@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Thirumal Lingam"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-00000000005c', 'tamiluser92@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Harini Balan"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-00000000005d', 'tamiluser93@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Ranjith Raman"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-00000000005e', 'tamiluser94@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Nandhini Balan"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-00000000005f', 'tamiluser95@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Srinivasan Gopal"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-000000000060', 'tamiluser96@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Pavithra Devan"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-000000000061', 'tamiluser97@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Anbarasan Naicker"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-000000000062', 'tamiluser98@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Preethi Raj"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-000000000063', 'tamiluser99@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Anand Naicker"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-000000000064', 'tamiluser100@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Chitra Raman"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-000000000065', 'tamiluser101@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Thirumal Shankar"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-000000000066', 'tamiluser102@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Soundarya Kumar"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-000000000067', 'tamiluser103@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Saravanan Nathan"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-000000000068', 'tamiluser104@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Uma Balan"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-000000000069', 'tamiluser105@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Naveen Kumar"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-00000000006a', 'tamiluser106@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Abirami Murthy"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-00000000006b', 'tamiluser107@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Manikandan Velan"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-00000000006c', 'tamiluser108@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Sandhya Selvan"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-00000000006d', 'tamiluser109@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Ganesan Swamy"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-00000000006e', 'tamiluser110@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Vidya Raman"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-00000000006f', 'tamiluser111@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Vijay Mani"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-000000000070', 'tamiluser112@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Swetha Shankar"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-000000000071', 'tamiluser113@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Suresh Mani"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-000000000072', 'tamiluser114@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Sandhya Pandian"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-000000000073', 'tamiluser115@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Prakash Sundaram"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-000000000074', 'tamiluser116@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Vidya Shankar"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-000000000075', 'tamiluser117@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Velmurugan Naicker"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-000000000076', 'tamiluser118@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Kavitha Moorthy"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-000000000077', 'tamiluser119@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Siddharth Sundaram"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-000000000078', 'tamiluser120@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Abirami Devan"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-000000000079', 'tamiluser121@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Sathish Naicker"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-00000000007a', 'tamiluser122@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Divya Murthy"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-00000000007b', 'tamiluser123@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Velmurugan Samy"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-00000000007c', 'tamiluser124@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Nivedha Murthy"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-00000000007d', 'tamiluser125@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Srinivasan Gopal"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-00000000007e', 'tamiluser126@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Geetha Mani"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-00000000007f', 'tamiluser127@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Kannan Mani"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-000000000080', 'tamiluser128@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Saraswathi Samy"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-000000000081', 'tamiluser129@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Sathish Gopal"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-000000000082', 'tamiluser130@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Nivedha Kumar"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-000000000083', 'tamiluser131@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Chinnasamy Kumar"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-000000000084', 'tamiluser132@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Pooja Raj"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-000000000085', 'tamiluser133@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Arun Balan"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-000000000086', 'tamiluser134@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Gayathri Lingam"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-000000000087', 'tamiluser135@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Vetrivel Mani"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-000000000088', 'tamiluser136@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Megala Krishnan"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-000000000089', 'tamiluser137@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Deepak Selvan"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-00000000008a', 'tamiluser138@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Ramya Mani"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-00000000008b', 'tamiluser139@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Vetrivel Nathan"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-00000000008c', 'tamiluser140@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Priya Swamy"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-00000000008d', 'tamiluser141@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Viswanathan Selvan"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-00000000008e', 'tamiluser142@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Gayathri Selvan"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-00000000008f', 'tamiluser143@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Surya Velan"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-000000000090', 'tamiluser144@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Gowri Shankar"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-000000000091', 'tamiluser145@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Saravanan Nathan"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-000000000092', 'tamiluser146@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Banumathi Mani"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-000000000093', 'tamiluser147@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Vijay Pandian"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-000000000094', 'tamiluser148@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Harini Kumar"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-000000000095', 'tamiluser149@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Ramakrishnan Swamy"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-000000000096', 'tamiluser150@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Swetha Raj"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-000000000097', 'tamiluser151@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Vignesh Nathan"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-000000000098', 'tamiluser152@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Soundarya Raj"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-000000000099', 'tamiluser153@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Sakthi Selvan"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-00000000009a', 'tamiluser154@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Vidya Murthy"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-00000000009b', 'tamiluser155@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Sathish Swamy"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-00000000009c', 'tamiluser156@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Malathi Samy"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-00000000009d', 'tamiluser157@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Gautham Velan"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-00000000009e', 'tamiluser158@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Malathi Swamy"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-00000000009f', 'tamiluser159@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Dinesh Mani"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-0000000000a0', 'tamiluser160@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Vanitha Mani"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-0000000000a1', 'tamiluser161@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Siddharth Krishnan"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-0000000000a2', 'tamiluser162@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Chitra Naicker"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-0000000000a3', 'tamiluser163@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Shankar Krishnan"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-0000000000a4', 'tamiluser164@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Indhumathi Krishnan"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-0000000000a5', 'tamiluser165@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Prabhu Pandian"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-0000000000a6', 'tamiluser166@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Janani Murthy"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-0000000000a7', 'tamiluser167@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Kabilan Moorthy"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-0000000000a8', 'tamiluser168@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Sneha Selvan"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-0000000000a9', 'tamiluser169@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Muthu Krishnan"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-0000000000aa', 'tamiluser170@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Preethi Krishnan"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;

-- 2. PUBLIC PROFILES INSERTIONS
INSERT INTO public.profiles (id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, father_occupation, mother_occupation, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at)
VALUES ('00000000-0000-4000-a000-000000000001', 'TM000001', 'Elango Shankar', 'male', '1994-06-16', 179, 'never_married', 'Christian', 'Protestant Christian', NULL, 'no', 'M.Com', 'M.Com Graduate', 'Dentist', 'Dentist Details', '₹3 Lakhs - ₹5 Lakhs', 'Cognizant', 'Erode', 'Erode', 'Hi, I am Elango. I have completed my M.Com and am currently working as a Dentist at Cognizant in Erode. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'joint', 'middle_class', 'Retired Employee', 'Homemaker', true, false, true, 100, NOW() - INTERVAL '10 days')
ON CONFLICT (id) DO UPDATE SET
  profile_id = EXCLUDED.profile_id,
  display_name = EXCLUDED.display_name,
  gender = EXCLUDED.gender,
  date_of_birth = EXCLUDED.date_of_birth,
  height_cm = EXCLUDED.height_cm,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  subcaste = EXCLUDED.subcaste,
  dosham = EXCLUDED.dosham,
  education = EXCLUDED.education,
  education_detail = EXCLUDED.education_detail,
  occupation = EXCLUDED.occupation,
  occupation_detail = EXCLUDED.occupation_detail,
  annual_income = EXCLUDED.annual_income,
  company_name = EXCLUDED.company_name,
  city = EXCLUDED.city,
  district = EXCLUDED.district,
  about_me = EXCLUDED.about_me,
  family_type = EXCLUDED.family_type,
  family_status = EXCLUDED.family_status,
  father_occupation = EXCLUDED.father_occupation,
  mother_occupation = EXCLUDED.mother_occupation,
  is_verified = EXCLUDED.is_verified,
  is_premium = EXCLUDED.is_premium,
  is_profile_complete = EXCLUDED.is_profile_complete,
  profile_completion_percent = EXCLUDED.profile_completion_percent,
  last_active_at = EXCLUDED.last_active_at;
INSERT INTO public.profiles (id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, father_occupation, mother_occupation, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at)
VALUES ('00000000-0000-4000-a000-000000000002', 'TM000002', 'Indhumathi Gopal', 'female', '1989-04-17', 151, 'divorced', 'Hindu', 'Arunthathiyar', NULL, 'yes', 'B.Sc', 'B.Sc Graduate', 'Pharmacist', 'Pharmacist Details', '₹10 Lakhs - ₹15 Lakhs', 'Government Service', 'Chennai', 'Chennai', 'Hi, I am Indhumathi. I have completed my B.Sc and am currently working as a Pharmacist at Government Service in Chennai. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'rich', 'Retired Employee', 'Homemaker', true, false, true, 100, NOW() - INTERVAL '9 days')
ON CONFLICT (id) DO UPDATE SET
  profile_id = EXCLUDED.profile_id,
  display_name = EXCLUDED.display_name,
  gender = EXCLUDED.gender,
  date_of_birth = EXCLUDED.date_of_birth,
  height_cm = EXCLUDED.height_cm,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  subcaste = EXCLUDED.subcaste,
  dosham = EXCLUDED.dosham,
  education = EXCLUDED.education,
  education_detail = EXCLUDED.education_detail,
  occupation = EXCLUDED.occupation,
  occupation_detail = EXCLUDED.occupation_detail,
  annual_income = EXCLUDED.annual_income,
  company_name = EXCLUDED.company_name,
  city = EXCLUDED.city,
  district = EXCLUDED.district,
  about_me = EXCLUDED.about_me,
  family_type = EXCLUDED.family_type,
  family_status = EXCLUDED.family_status,
  father_occupation = EXCLUDED.father_occupation,
  mother_occupation = EXCLUDED.mother_occupation,
  is_verified = EXCLUDED.is_verified,
  is_premium = EXCLUDED.is_premium,
  is_profile_complete = EXCLUDED.is_profile_complete,
  profile_completion_percent = EXCLUDED.profile_completion_percent,
  last_active_at = EXCLUDED.last_active_at;
INSERT INTO public.profiles (id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, father_occupation, mother_occupation, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at)
VALUES ('00000000-0000-4000-a000-000000000003', 'TM000003', 'Manikandan Nathan', 'male', '1997-02-13', 172, 'never_married', 'Hindu', 'Brahmin - Iyengar', 'Brahmin - Iyengar subcaste', 'no', 'M.B.A', 'M.B.A Graduate', 'Business Owner', 'Business Owner Details', '₹20 Lakhs+', 'Private Practice', 'Coimbatore', 'Coimbatore', 'Hi, I am Manikandan. I have completed my M.B.A and am currently working as a Business Owner at Private Practice in Coimbatore. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'upper_middle_class', 'Retired Employee', 'Homemaker', true, false, true, 100, NOW() - INTERVAL '5 days')
ON CONFLICT (id) DO UPDATE SET
  profile_id = EXCLUDED.profile_id,
  display_name = EXCLUDED.display_name,
  gender = EXCLUDED.gender,
  date_of_birth = EXCLUDED.date_of_birth,
  height_cm = EXCLUDED.height_cm,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  subcaste = EXCLUDED.subcaste,
  dosham = EXCLUDED.dosham,
  education = EXCLUDED.education,
  education_detail = EXCLUDED.education_detail,
  occupation = EXCLUDED.occupation,
  occupation_detail = EXCLUDED.occupation_detail,
  annual_income = EXCLUDED.annual_income,
  company_name = EXCLUDED.company_name,
  city = EXCLUDED.city,
  district = EXCLUDED.district,
  about_me = EXCLUDED.about_me,
  family_type = EXCLUDED.family_type,
  family_status = EXCLUDED.family_status,
  father_occupation = EXCLUDED.father_occupation,
  mother_occupation = EXCLUDED.mother_occupation,
  is_verified = EXCLUDED.is_verified,
  is_premium = EXCLUDED.is_premium,
  is_profile_complete = EXCLUDED.is_profile_complete,
  profile_completion_percent = EXCLUDED.profile_completion_percent,
  last_active_at = EXCLUDED.last_active_at;
INSERT INTO public.profiles (id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, father_occupation, mother_occupation, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at)
VALUES ('00000000-0000-4000-a000-000000000004', 'TM000004', 'Pooja Sundaram', 'female', '1988-11-07', 159, 'never_married', 'Hindu', 'Agamudayar', 'Agamudayar subcaste', 'no', 'M.B.A', 'M.B.A Graduate', 'Doctor', 'Doctor Details', '₹10 Lakhs - ₹15 Lakhs', 'Accenture', 'Tiruppur', 'Tiruppur', 'Hi, I am Pooja. I have completed my M.B.A and am currently working as a Doctor at Accenture in Tiruppur. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'middle_class', 'Retired Employee', 'Homemaker', true, true, true, 100, NOW() - INTERVAL '1 days')
ON CONFLICT (id) DO UPDATE SET
  profile_id = EXCLUDED.profile_id,
  display_name = EXCLUDED.display_name,
  gender = EXCLUDED.gender,
  date_of_birth = EXCLUDED.date_of_birth,
  height_cm = EXCLUDED.height_cm,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  subcaste = EXCLUDED.subcaste,
  dosham = EXCLUDED.dosham,
  education = EXCLUDED.education,
  education_detail = EXCLUDED.education_detail,
  occupation = EXCLUDED.occupation,
  occupation_detail = EXCLUDED.occupation_detail,
  annual_income = EXCLUDED.annual_income,
  company_name = EXCLUDED.company_name,
  city = EXCLUDED.city,
  district = EXCLUDED.district,
  about_me = EXCLUDED.about_me,
  family_type = EXCLUDED.family_type,
  family_status = EXCLUDED.family_status,
  father_occupation = EXCLUDED.father_occupation,
  mother_occupation = EXCLUDED.mother_occupation,
  is_verified = EXCLUDED.is_verified,
  is_premium = EXCLUDED.is_premium,
  is_profile_complete = EXCLUDED.is_profile_complete,
  profile_completion_percent = EXCLUDED.profile_completion_percent,
  last_active_at = EXCLUDED.last_active_at;
INSERT INTO public.profiles (id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, father_occupation, mother_occupation, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at)
VALUES ('00000000-0000-4000-a000-000000000005', 'TM000005', 'Ramesh Raj', 'male', '1995-09-15', 173, 'never_married', 'Hindu', 'Pillai', 'Pillai subcaste', 'no', 'M.A', 'M.A Graduate', 'Police Officer', 'Police Officer Details', '₹15 Lakhs - ₹20 Lakhs', 'Wipro', 'Tiruchirappalli', 'Trichy', 'Hi, I am Ramesh. I have completed my M.A and am currently working as a Police Officer at Wipro in Tiruchirappalli. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'rich', 'Retired Employee', 'Homemaker', true, false, true, 100, NOW() - INTERVAL '10 days')
ON CONFLICT (id) DO UPDATE SET
  profile_id = EXCLUDED.profile_id,
  display_name = EXCLUDED.display_name,
  gender = EXCLUDED.gender,
  date_of_birth = EXCLUDED.date_of_birth,
  height_cm = EXCLUDED.height_cm,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  subcaste = EXCLUDED.subcaste,
  dosham = EXCLUDED.dosham,
  education = EXCLUDED.education,
  education_detail = EXCLUDED.education_detail,
  occupation = EXCLUDED.occupation,
  occupation_detail = EXCLUDED.occupation_detail,
  annual_income = EXCLUDED.annual_income,
  company_name = EXCLUDED.company_name,
  city = EXCLUDED.city,
  district = EXCLUDED.district,
  about_me = EXCLUDED.about_me,
  family_type = EXCLUDED.family_type,
  family_status = EXCLUDED.family_status,
  father_occupation = EXCLUDED.father_occupation,
  mother_occupation = EXCLUDED.mother_occupation,
  is_verified = EXCLUDED.is_verified,
  is_premium = EXCLUDED.is_premium,
  is_profile_complete = EXCLUDED.is_profile_complete,
  profile_completion_percent = EXCLUDED.profile_completion_percent,
  last_active_at = EXCLUDED.last_active_at;
INSERT INTO public.profiles (id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, father_occupation, mother_occupation, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at)
VALUES ('00000000-0000-4000-a000-000000000006', 'TM000006', 'Sneha Naicker', 'female', '1992-07-23', 157, 'never_married', 'Hindu', 'Maravar', 'Maravar subcaste', 'no', 'M.B.A', 'M.B.A Graduate', 'Mechanical Engineer', 'Mechanical Engineer Details', '₹3 Lakhs - ₹5 Lakhs', 'Cognizant', 'Vellore', 'Vellore', 'Hi, I am Sneha. I have completed my M.B.A and am currently working as a Mechanical Engineer at Cognizant in Vellore. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'upper_middle_class', 'Retired Employee', 'Homemaker', true, false, true, 100, NOW() - INTERVAL '9 days')
ON CONFLICT (id) DO UPDATE SET
  profile_id = EXCLUDED.profile_id,
  display_name = EXCLUDED.display_name,
  gender = EXCLUDED.gender,
  date_of_birth = EXCLUDED.date_of_birth,
  height_cm = EXCLUDED.height_cm,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  subcaste = EXCLUDED.subcaste,
  dosham = EXCLUDED.dosham,
  education = EXCLUDED.education,
  education_detail = EXCLUDED.education_detail,
  occupation = EXCLUDED.occupation,
  occupation_detail = EXCLUDED.occupation_detail,
  annual_income = EXCLUDED.annual_income,
  company_name = EXCLUDED.company_name,
  city = EXCLUDED.city,
  district = EXCLUDED.district,
  about_me = EXCLUDED.about_me,
  family_type = EXCLUDED.family_type,
  family_status = EXCLUDED.family_status,
  father_occupation = EXCLUDED.father_occupation,
  mother_occupation = EXCLUDED.mother_occupation,
  is_verified = EXCLUDED.is_verified,
  is_premium = EXCLUDED.is_premium,
  is_profile_complete = EXCLUDED.is_profile_complete,
  profile_completion_percent = EXCLUDED.profile_completion_percent,
  last_active_at = EXCLUDED.last_active_at;
INSERT INTO public.profiles (id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, father_occupation, mother_occupation, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at)
VALUES ('00000000-0000-4000-a000-000000000007', 'TM000007', 'Srinivasan Krishnan', 'male', '1996-06-06', 172, 'never_married', 'Hindu', 'Vanniyar', 'Vanniyar subcaste', 'no', 'M.B.B.S', 'M.B.B.S Graduate', 'College Professor', 'College Professor Details', '₹7 Lakhs - ₹10 Lakhs', 'TCS', 'Thanjavur', 'Thanjavur', 'Hi, I am Srinivasan. I have completed my M.B.B.S and am currently working as a College Professor at TCS in Thanjavur. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'middle_class', 'Retired Employee', 'Homemaker', false, true, true, 100, NOW() - INTERVAL '2 days')
ON CONFLICT (id) DO UPDATE SET
  profile_id = EXCLUDED.profile_id,
  display_name = EXCLUDED.display_name,
  gender = EXCLUDED.gender,
  date_of_birth = EXCLUDED.date_of_birth,
  height_cm = EXCLUDED.height_cm,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  subcaste = EXCLUDED.subcaste,
  dosham = EXCLUDED.dosham,
  education = EXCLUDED.education,
  education_detail = EXCLUDED.education_detail,
  occupation = EXCLUDED.occupation,
  occupation_detail = EXCLUDED.occupation_detail,
  annual_income = EXCLUDED.annual_income,
  company_name = EXCLUDED.company_name,
  city = EXCLUDED.city,
  district = EXCLUDED.district,
  about_me = EXCLUDED.about_me,
  family_type = EXCLUDED.family_type,
  family_status = EXCLUDED.family_status,
  father_occupation = EXCLUDED.father_occupation,
  mother_occupation = EXCLUDED.mother_occupation,
  is_verified = EXCLUDED.is_verified,
  is_premium = EXCLUDED.is_premium,
  is_profile_complete = EXCLUDED.is_profile_complete,
  profile_completion_percent = EXCLUDED.profile_completion_percent,
  last_active_at = EXCLUDED.last_active_at;
INSERT INTO public.profiles (id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, father_occupation, mother_occupation, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at)
VALUES ('00000000-0000-4000-a000-000000000008', 'TM000008', 'Malarvizhi Naicker', 'female', '1990-09-19', 169, 'never_married', 'Hindu', 'Mudaliar', 'Mudaliar subcaste', 'no', 'Ph.D', 'Ph.D Graduate', 'Business Owner', 'Business Owner Details', '₹5 Lakhs - ₹7 Lakhs', 'Infosys', 'Coimbatore', 'Coimbatore', 'Hi, I am Malarvizhi. I have completed my Ph.D and am currently working as a Business Owner at Infosys in Coimbatore. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'upper_middle_class', 'Retired Employee', 'Homemaker', true, false, true, 100, NOW() - INTERVAL '4 days')
ON CONFLICT (id) DO UPDATE SET
  profile_id = EXCLUDED.profile_id,
  display_name = EXCLUDED.display_name,
  gender = EXCLUDED.gender,
  date_of_birth = EXCLUDED.date_of_birth,
  height_cm = EXCLUDED.height_cm,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  subcaste = EXCLUDED.subcaste,
  dosham = EXCLUDED.dosham,
  education = EXCLUDED.education,
  education_detail = EXCLUDED.education_detail,
  occupation = EXCLUDED.occupation,
  occupation_detail = EXCLUDED.occupation_detail,
  annual_income = EXCLUDED.annual_income,
  company_name = EXCLUDED.company_name,
  city = EXCLUDED.city,
  district = EXCLUDED.district,
  about_me = EXCLUDED.about_me,
  family_type = EXCLUDED.family_type,
  family_status = EXCLUDED.family_status,
  father_occupation = EXCLUDED.father_occupation,
  mother_occupation = EXCLUDED.mother_occupation,
  is_verified = EXCLUDED.is_verified,
  is_premium = EXCLUDED.is_premium,
  is_profile_complete = EXCLUDED.is_profile_complete,
  profile_completion_percent = EXCLUDED.profile_completion_percent,
  last_active_at = EXCLUDED.last_active_at;
INSERT INTO public.profiles (id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, father_occupation, mother_occupation, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at)
VALUES ('00000000-0000-4000-a000-000000000009', 'TM000009', 'Ramesh Gopal', 'male', '2001-06-24', 185, 'never_married', 'Muslim', 'Sunni Muslim', NULL, 'no', 'B.Sc', 'B.Sc Graduate', 'Civil Engineer', 'Civil Engineer Details', '₹10 Lakhs - ₹15 Lakhs', 'Zoho', 'Thanjavur', 'Thanjavur', 'Hi, I am Ramesh. I have completed my B.Sc and am currently working as a Civil Engineer at Zoho in Thanjavur. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'rich', 'Retired Employee', 'Homemaker', false, false, true, 100, NOW() - INTERVAL '5 days')
ON CONFLICT (id) DO UPDATE SET
  profile_id = EXCLUDED.profile_id,
  display_name = EXCLUDED.display_name,
  gender = EXCLUDED.gender,
  date_of_birth = EXCLUDED.date_of_birth,
  height_cm = EXCLUDED.height_cm,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  subcaste = EXCLUDED.subcaste,
  dosham = EXCLUDED.dosham,
  education = EXCLUDED.education,
  education_detail = EXCLUDED.education_detail,
  occupation = EXCLUDED.occupation,
  occupation_detail = EXCLUDED.occupation_detail,
  annual_income = EXCLUDED.annual_income,
  company_name = EXCLUDED.company_name,
  city = EXCLUDED.city,
  district = EXCLUDED.district,
  about_me = EXCLUDED.about_me,
  family_type = EXCLUDED.family_type,
  family_status = EXCLUDED.family_status,
  father_occupation = EXCLUDED.father_occupation,
  mother_occupation = EXCLUDED.mother_occupation,
  is_verified = EXCLUDED.is_verified,
  is_premium = EXCLUDED.is_premium,
  is_profile_complete = EXCLUDED.is_profile_complete,
  profile_completion_percent = EXCLUDED.profile_completion_percent,
  last_active_at = EXCLUDED.last_active_at;
INSERT INTO public.profiles (id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, father_occupation, mother_occupation, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at)
VALUES ('00000000-0000-4000-a000-00000000000a', 'TM000010', 'Nivedha Velan', 'female', '1998-07-19', 151, 'never_married', 'Hindu', 'Maravar', 'Maravar subcaste', 'no', 'M.Com', 'M.Com Graduate', 'College Professor', 'College Professor Details', '₹7 Lakhs - ₹10 Lakhs', 'Wipro', 'Vellore', 'Vellore', 'Hi, I am Nivedha. I have completed my M.Com and am currently working as a College Professor at Wipro in Vellore. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'joint', 'upper_middle_class', 'Retired Employee', 'Homemaker', true, false, true, 100, NOW() - INTERVAL '10 days')
ON CONFLICT (id) DO UPDATE SET
  profile_id = EXCLUDED.profile_id,
  display_name = EXCLUDED.display_name,
  gender = EXCLUDED.gender,
  date_of_birth = EXCLUDED.date_of_birth,
  height_cm = EXCLUDED.height_cm,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  subcaste = EXCLUDED.subcaste,
  dosham = EXCLUDED.dosham,
  education = EXCLUDED.education,
  education_detail = EXCLUDED.education_detail,
  occupation = EXCLUDED.occupation,
  occupation_detail = EXCLUDED.occupation_detail,
  annual_income = EXCLUDED.annual_income,
  company_name = EXCLUDED.company_name,
  city = EXCLUDED.city,
  district = EXCLUDED.district,
  about_me = EXCLUDED.about_me,
  family_type = EXCLUDED.family_type,
  family_status = EXCLUDED.family_status,
  father_occupation = EXCLUDED.father_occupation,
  mother_occupation = EXCLUDED.mother_occupation,
  is_verified = EXCLUDED.is_verified,
  is_premium = EXCLUDED.is_premium,
  is_profile_complete = EXCLUDED.is_profile_complete,
  profile_completion_percent = EXCLUDED.profile_completion_percent,
  last_active_at = EXCLUDED.last_active_at;
INSERT INTO public.profiles (id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, father_occupation, mother_occupation, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at)
VALUES ('00000000-0000-4000-a000-00000000000b', 'TM000011', 'Vignesh Lingam', 'male', '1996-06-18', 168, 'never_married', 'Hindu', 'Agamudayar', 'Agamudayar subcaste', 'no', 'M.Sc', 'M.Sc Graduate', 'HR Specialist', 'HR Specialist Details', '₹5 Lakhs - ₹7 Lakhs', 'TCS', 'Coimbatore', 'Coimbatore', 'Hi, I am Vignesh. I have completed my M.Sc and am currently working as a HR Specialist at TCS in Coimbatore. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'joint', 'upper_middle_class', 'Retired Employee', 'Homemaker', false, false, true, 100, NOW() - INTERVAL '5 days')
ON CONFLICT (id) DO UPDATE SET
  profile_id = EXCLUDED.profile_id,
  display_name = EXCLUDED.display_name,
  gender = EXCLUDED.gender,
  date_of_birth = EXCLUDED.date_of_birth,
  height_cm = EXCLUDED.height_cm,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  subcaste = EXCLUDED.subcaste,
  dosham = EXCLUDED.dosham,
  education = EXCLUDED.education,
  education_detail = EXCLUDED.education_detail,
  occupation = EXCLUDED.occupation,
  occupation_detail = EXCLUDED.occupation_detail,
  annual_income = EXCLUDED.annual_income,
  company_name = EXCLUDED.company_name,
  city = EXCLUDED.city,
  district = EXCLUDED.district,
  about_me = EXCLUDED.about_me,
  family_type = EXCLUDED.family_type,
  family_status = EXCLUDED.family_status,
  father_occupation = EXCLUDED.father_occupation,
  mother_occupation = EXCLUDED.mother_occupation,
  is_verified = EXCLUDED.is_verified,
  is_premium = EXCLUDED.is_premium,
  is_profile_complete = EXCLUDED.is_profile_complete,
  profile_completion_percent = EXCLUDED.profile_completion_percent,
  last_active_at = EXCLUDED.last_active_at;
INSERT INTO public.profiles (id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, father_occupation, mother_occupation, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at)
VALUES ('00000000-0000-4000-a000-00000000000c', 'TM000012', 'Janani Selvan', 'female', '2001-02-24', 166, 'divorced', 'Hindu', 'Kallar', 'Kallar subcaste', 'no', 'M.C.A', 'M.C.A Graduate', 'Civil Engineer', 'Civil Engineer Details', '₹3 Lakhs - ₹5 Lakhs', 'Self Employed', 'Chennai', 'Chennai', 'Hi, I am Janani. I have completed my M.C.A and am currently working as a Civil Engineer at Self Employed in Chennai. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'joint', 'rich', 'Retired Employee', 'Homemaker', false, false, true, 100, NOW() - INTERVAL '8 days')
ON CONFLICT (id) DO UPDATE SET
  profile_id = EXCLUDED.profile_id,
  display_name = EXCLUDED.display_name,
  gender = EXCLUDED.gender,
  date_of_birth = EXCLUDED.date_of_birth,
  height_cm = EXCLUDED.height_cm,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  subcaste = EXCLUDED.subcaste,
  dosham = EXCLUDED.dosham,
  education = EXCLUDED.education,
  education_detail = EXCLUDED.education_detail,
  occupation = EXCLUDED.occupation,
  occupation_detail = EXCLUDED.occupation_detail,
  annual_income = EXCLUDED.annual_income,
  company_name = EXCLUDED.company_name,
  city = EXCLUDED.city,
  district = EXCLUDED.district,
  about_me = EXCLUDED.about_me,
  family_type = EXCLUDED.family_type,
  family_status = EXCLUDED.family_status,
  father_occupation = EXCLUDED.father_occupation,
  mother_occupation = EXCLUDED.mother_occupation,
  is_verified = EXCLUDED.is_verified,
  is_premium = EXCLUDED.is_premium,
  is_profile_complete = EXCLUDED.is_profile_complete,
  profile_completion_percent = EXCLUDED.profile_completion_percent,
  last_active_at = EXCLUDED.last_active_at;
INSERT INTO public.profiles (id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, father_occupation, mother_occupation, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at)
VALUES ('00000000-0000-4000-a000-00000000000d', 'TM000013', 'Viswanathan Samy', 'male', '1992-02-16', 164, 'never_married', 'Hindu', 'Pillai', NULL, 'no', 'M.C.A', 'M.C.A Graduate', 'Government Officer', 'Government Officer Details', '₹7 Lakhs - ₹10 Lakhs', 'Zoho', 'Coimbatore', 'Coimbatore', 'Hi, I am Viswanathan. I have completed my M.C.A and am currently working as a Government Officer at Zoho in Coimbatore. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'joint', 'rich', 'Retired Employee', 'Homemaker', false, false, true, 100, NOW() - INTERVAL '4 days')
ON CONFLICT (id) DO UPDATE SET
  profile_id = EXCLUDED.profile_id,
  display_name = EXCLUDED.display_name,
  gender = EXCLUDED.gender,
  date_of_birth = EXCLUDED.date_of_birth,
  height_cm = EXCLUDED.height_cm,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  subcaste = EXCLUDED.subcaste,
  dosham = EXCLUDED.dosham,
  education = EXCLUDED.education,
  education_detail = EXCLUDED.education_detail,
  occupation = EXCLUDED.occupation,
  occupation_detail = EXCLUDED.occupation_detail,
  annual_income = EXCLUDED.annual_income,
  company_name = EXCLUDED.company_name,
  city = EXCLUDED.city,
  district = EXCLUDED.district,
  about_me = EXCLUDED.about_me,
  family_type = EXCLUDED.family_type,
  family_status = EXCLUDED.family_status,
  father_occupation = EXCLUDED.father_occupation,
  mother_occupation = EXCLUDED.mother_occupation,
  is_verified = EXCLUDED.is_verified,
  is_premium = EXCLUDED.is_premium,
  is_profile_complete = EXCLUDED.is_profile_complete,
  profile_completion_percent = EXCLUDED.profile_completion_percent,
  last_active_at = EXCLUDED.last_active_at;
INSERT INTO public.profiles (id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, father_occupation, mother_occupation, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at)
VALUES ('00000000-0000-4000-a000-00000000000e', 'TM000014', 'Archana Sundaram', 'female', '2002-04-02', 156, 'never_married', 'Hindu', 'Devendra Kula Vellalar', 'Devendra Kula Vellalar subcaste', 'no', 'M.A', 'M.A Graduate', 'Bank Manager', 'Bank Manager Details', '₹5 Lakhs - ₹7 Lakhs', 'Cognizant', 'Vellore', 'Vellore', 'Hi, I am Archana. I have completed my M.A and am currently working as a Bank Manager at Cognizant in Vellore. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'rich', 'Retired Employee', 'Homemaker', true, false, true, 100, NOW() - INTERVAL '0 days')
ON CONFLICT (id) DO UPDATE SET
  profile_id = EXCLUDED.profile_id,
  display_name = EXCLUDED.display_name,
  gender = EXCLUDED.gender,
  date_of_birth = EXCLUDED.date_of_birth,
  height_cm = EXCLUDED.height_cm,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  subcaste = EXCLUDED.subcaste,
  dosham = EXCLUDED.dosham,
  education = EXCLUDED.education,
  education_detail = EXCLUDED.education_detail,
  occupation = EXCLUDED.occupation,
  occupation_detail = EXCLUDED.occupation_detail,
  annual_income = EXCLUDED.annual_income,
  company_name = EXCLUDED.company_name,
  city = EXCLUDED.city,
  district = EXCLUDED.district,
  about_me = EXCLUDED.about_me,
  family_type = EXCLUDED.family_type,
  family_status = EXCLUDED.family_status,
  father_occupation = EXCLUDED.father_occupation,
  mother_occupation = EXCLUDED.mother_occupation,
  is_verified = EXCLUDED.is_verified,
  is_premium = EXCLUDED.is_premium,
  is_profile_complete = EXCLUDED.is_profile_complete,
  profile_completion_percent = EXCLUDED.profile_completion_percent,
  last_active_at = EXCLUDED.last_active_at;
INSERT INTO public.profiles (id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, father_occupation, mother_occupation, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at)
VALUES ('00000000-0000-4000-a000-00000000000f', 'TM000015', 'Siddharth Raj', 'male', '2004-06-27', 167, 'never_married', 'Hindu', 'Vanniyar', NULL, 'no', 'M.Sc', 'M.Sc Graduate', 'Police Officer', 'Police Officer Details', '₹10 Lakhs - ₹15 Lakhs', 'Cognizant', 'Tirunelveli', 'Tirunelveli', 'Hi, I am Siddharth. I have completed my M.Sc and am currently working as a Police Officer at Cognizant in Tirunelveli. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'rich', 'Retired Employee', 'Homemaker', true, true, true, 100, NOW() - INTERVAL '0 days')
ON CONFLICT (id) DO UPDATE SET
  profile_id = EXCLUDED.profile_id,
  display_name = EXCLUDED.display_name,
  gender = EXCLUDED.gender,
  date_of_birth = EXCLUDED.date_of_birth,
  height_cm = EXCLUDED.height_cm,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  subcaste = EXCLUDED.subcaste,
  dosham = EXCLUDED.dosham,
  education = EXCLUDED.education,
  education_detail = EXCLUDED.education_detail,
  occupation = EXCLUDED.occupation,
  occupation_detail = EXCLUDED.occupation_detail,
  annual_income = EXCLUDED.annual_income,
  company_name = EXCLUDED.company_name,
  city = EXCLUDED.city,
  district = EXCLUDED.district,
  about_me = EXCLUDED.about_me,
  family_type = EXCLUDED.family_type,
  family_status = EXCLUDED.family_status,
  father_occupation = EXCLUDED.father_occupation,
  mother_occupation = EXCLUDED.mother_occupation,
  is_verified = EXCLUDED.is_verified,
  is_premium = EXCLUDED.is_premium,
  is_profile_complete = EXCLUDED.is_profile_complete,
  profile_completion_percent = EXCLUDED.profile_completion_percent,
  last_active_at = EXCLUDED.last_active_at;
INSERT INTO public.profiles (id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, father_occupation, mother_occupation, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at)
VALUES ('00000000-0000-4000-a000-000000000010', 'TM000016', 'Kokila Krishnan', 'female', '1999-11-06', 167, 'never_married', 'Muslim', 'Shia Muslim', 'Shia Muslim subcaste', 'no', 'M.Com', 'M.Com Graduate', 'Police Officer', 'Police Officer Details', '₹5 Lakhs - ₹7 Lakhs', 'Private Practice', 'Madurai', 'Madurai', 'Hi, I am Kokila. I have completed my M.Com and am currently working as a Police Officer at Private Practice in Madurai. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'rich', 'Retired Employee', 'Homemaker', false, false, true, 100, NOW() - INTERVAL '8 days')
ON CONFLICT (id) DO UPDATE SET
  profile_id = EXCLUDED.profile_id,
  display_name = EXCLUDED.display_name,
  gender = EXCLUDED.gender,
  date_of_birth = EXCLUDED.date_of_birth,
  height_cm = EXCLUDED.height_cm,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  subcaste = EXCLUDED.subcaste,
  dosham = EXCLUDED.dosham,
  education = EXCLUDED.education,
  education_detail = EXCLUDED.education_detail,
  occupation = EXCLUDED.occupation,
  occupation_detail = EXCLUDED.occupation_detail,
  annual_income = EXCLUDED.annual_income,
  company_name = EXCLUDED.company_name,
  city = EXCLUDED.city,
  district = EXCLUDED.district,
  about_me = EXCLUDED.about_me,
  family_type = EXCLUDED.family_type,
  family_status = EXCLUDED.family_status,
  father_occupation = EXCLUDED.father_occupation,
  mother_occupation = EXCLUDED.mother_occupation,
  is_verified = EXCLUDED.is_verified,
  is_premium = EXCLUDED.is_premium,
  is_profile_complete = EXCLUDED.is_profile_complete,
  profile_completion_percent = EXCLUDED.profile_completion_percent,
  last_active_at = EXCLUDED.last_active_at;
INSERT INTO public.profiles (id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, father_occupation, mother_occupation, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at)
VALUES ('00000000-0000-4000-a000-000000000011', 'TM000017', 'Hari Naicker', 'male', '1996-08-01', 181, 'never_married', 'Hindu', 'Vellalar', 'Vellalar subcaste', 'no', 'M.B.B.S', 'M.B.B.S Graduate', 'Police Officer', 'Police Officer Details', '₹10 Lakhs - ₹15 Lakhs', 'Zoho', 'Chennai', 'Chennai', 'Hi, I am Hari. I have completed my M.B.B.S and am currently working as a Police Officer at Zoho in Chennai. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'rich', 'Retired Employee', 'Homemaker', false, false, true, 100, NOW() - INTERVAL '7 days')
ON CONFLICT (id) DO UPDATE SET
  profile_id = EXCLUDED.profile_id,
  display_name = EXCLUDED.display_name,
  gender = EXCLUDED.gender,
  date_of_birth = EXCLUDED.date_of_birth,
  height_cm = EXCLUDED.height_cm,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  subcaste = EXCLUDED.subcaste,
  dosham = EXCLUDED.dosham,
  education = EXCLUDED.education,
  education_detail = EXCLUDED.education_detail,
  occupation = EXCLUDED.occupation,
  occupation_detail = EXCLUDED.occupation_detail,
  annual_income = EXCLUDED.annual_income,
  company_name = EXCLUDED.company_name,
  city = EXCLUDED.city,
  district = EXCLUDED.district,
  about_me = EXCLUDED.about_me,
  family_type = EXCLUDED.family_type,
  family_status = EXCLUDED.family_status,
  father_occupation = EXCLUDED.father_occupation,
  mother_occupation = EXCLUDED.mother_occupation,
  is_verified = EXCLUDED.is_verified,
  is_premium = EXCLUDED.is_premium,
  is_profile_complete = EXCLUDED.is_profile_complete,
  profile_completion_percent = EXCLUDED.profile_completion_percent,
  last_active_at = EXCLUDED.last_active_at;
INSERT INTO public.profiles (id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, father_occupation, mother_occupation, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at)
VALUES ('00000000-0000-4000-a000-000000000012', 'TM000018', 'Vijaya Lingam', 'female', '1992-12-22', 156, 'never_married', 'Hindu', 'Kallar', 'Kallar subcaste', 'no', 'M.B.A', 'M.B.A Graduate', 'HR Specialist', 'HR Specialist Details', '₹15 Lakhs - ₹20 Lakhs', 'Accenture', 'Kanchipuram', 'Kanchipuram', 'Hi, I am Vijaya. I have completed my M.B.A and am currently working as a HR Specialist at Accenture in Kanchipuram. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'rich', 'Retired Employee', 'Homemaker', false, false, true, 100, NOW() - INTERVAL '1 days')
ON CONFLICT (id) DO UPDATE SET
  profile_id = EXCLUDED.profile_id,
  display_name = EXCLUDED.display_name,
  gender = EXCLUDED.gender,
  date_of_birth = EXCLUDED.date_of_birth,
  height_cm = EXCLUDED.height_cm,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  subcaste = EXCLUDED.subcaste,
  dosham = EXCLUDED.dosham,
  education = EXCLUDED.education,
  education_detail = EXCLUDED.education_detail,
  occupation = EXCLUDED.occupation,
  occupation_detail = EXCLUDED.occupation_detail,
  annual_income = EXCLUDED.annual_income,
  company_name = EXCLUDED.company_name,
  city = EXCLUDED.city,
  district = EXCLUDED.district,
  about_me = EXCLUDED.about_me,
  family_type = EXCLUDED.family_type,
  family_status = EXCLUDED.family_status,
  father_occupation = EXCLUDED.father_occupation,
  mother_occupation = EXCLUDED.mother_occupation,
  is_verified = EXCLUDED.is_verified,
  is_premium = EXCLUDED.is_premium,
  is_profile_complete = EXCLUDED.is_profile_complete,
  profile_completion_percent = EXCLUDED.profile_completion_percent,
  last_active_at = EXCLUDED.last_active_at;
INSERT INTO public.profiles (id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, father_occupation, mother_occupation, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at)
VALUES ('00000000-0000-4000-a000-000000000013', 'TM000019', 'Ajith Pandian', 'male', '2003-01-24', 177, 'divorced', 'Christian', 'RC Christian', 'RC Christian subcaste', 'no', 'B.Com', 'B.Com Graduate', 'Architect', 'Architect Details', '₹15 Lakhs - ₹20 Lakhs', 'Wipro', 'Tirunelveli', 'Tirunelveli', 'Hi, I am Ajith. I have completed my B.Com and am currently working as a Architect at Wipro in Tirunelveli. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'joint', 'middle_class', 'Retired Employee', 'Homemaker', false, false, true, 100, NOW() - INTERVAL '3 days')
ON CONFLICT (id) DO UPDATE SET
  profile_id = EXCLUDED.profile_id,
  display_name = EXCLUDED.display_name,
  gender = EXCLUDED.gender,
  date_of_birth = EXCLUDED.date_of_birth,
  height_cm = EXCLUDED.height_cm,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  subcaste = EXCLUDED.subcaste,
  dosham = EXCLUDED.dosham,
  education = EXCLUDED.education,
  education_detail = EXCLUDED.education_detail,
  occupation = EXCLUDED.occupation,
  occupation_detail = EXCLUDED.occupation_detail,
  annual_income = EXCLUDED.annual_income,
  company_name = EXCLUDED.company_name,
  city = EXCLUDED.city,
  district = EXCLUDED.district,
  about_me = EXCLUDED.about_me,
  family_type = EXCLUDED.family_type,
  family_status = EXCLUDED.family_status,
  father_occupation = EXCLUDED.father_occupation,
  mother_occupation = EXCLUDED.mother_occupation,
  is_verified = EXCLUDED.is_verified,
  is_premium = EXCLUDED.is_premium,
  is_profile_complete = EXCLUDED.is_profile_complete,
  profile_completion_percent = EXCLUDED.profile_completion_percent,
  last_active_at = EXCLUDED.last_active_at;
INSERT INTO public.profiles (id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, father_occupation, mother_occupation, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at)
VALUES ('00000000-0000-4000-a000-000000000014', 'TM000020', 'Ramani Murthy', 'female', '1993-11-08', 170, 'divorced', 'Hindu', 'Agamudayar', 'Agamudayar subcaste', 'no', 'M.Sc', 'M.Sc Graduate', 'Advocate', 'Advocate Details', '₹7 Lakhs - ₹10 Lakhs', 'Accenture', 'Kanchipuram', 'Kanchipuram', 'Hi, I am Ramani. I have completed my M.Sc and am currently working as a Advocate at Accenture in Kanchipuram. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'joint', 'middle_class', 'Retired Employee', 'Homemaker', true, false, true, 100, NOW() - INTERVAL '5 days')
ON CONFLICT (id) DO UPDATE SET
  profile_id = EXCLUDED.profile_id,
  display_name = EXCLUDED.display_name,
  gender = EXCLUDED.gender,
  date_of_birth = EXCLUDED.date_of_birth,
  height_cm = EXCLUDED.height_cm,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  subcaste = EXCLUDED.subcaste,
  dosham = EXCLUDED.dosham,
  education = EXCLUDED.education,
  education_detail = EXCLUDED.education_detail,
  occupation = EXCLUDED.occupation,
  occupation_detail = EXCLUDED.occupation_detail,
  annual_income = EXCLUDED.annual_income,
  company_name = EXCLUDED.company_name,
  city = EXCLUDED.city,
  district = EXCLUDED.district,
  about_me = EXCLUDED.about_me,
  family_type = EXCLUDED.family_type,
  family_status = EXCLUDED.family_status,
  father_occupation = EXCLUDED.father_occupation,
  mother_occupation = EXCLUDED.mother_occupation,
  is_verified = EXCLUDED.is_verified,
  is_premium = EXCLUDED.is_premium,
  is_profile_complete = EXCLUDED.is_profile_complete,
  profile_completion_percent = EXCLUDED.profile_completion_percent,
  last_active_at = EXCLUDED.last_active_at;
INSERT INTO public.profiles (id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, father_occupation, mother_occupation, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at)
VALUES ('00000000-0000-4000-a000-000000000015', 'TM000021', 'Rajesh Moorthy', 'male', '1993-07-17', 176, 'never_married', 'Hindu', 'Brahmin - Iyengar', 'Brahmin - Iyengar subcaste', 'no', 'B.Sc', 'B.Sc Graduate', 'College Professor', 'College Professor Details', '₹5 Lakhs - ₹7 Lakhs', 'Cognizant', 'Tirunelveli', 'Tirunelveli', 'Hi, I am Rajesh. I have completed my B.Sc and am currently working as a College Professor at Cognizant in Tirunelveli. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'middle_class', 'Retired Employee', 'Homemaker', true, false, true, 100, NOW() - INTERVAL '0 days')
ON CONFLICT (id) DO UPDATE SET
  profile_id = EXCLUDED.profile_id,
  display_name = EXCLUDED.display_name,
  gender = EXCLUDED.gender,
  date_of_birth = EXCLUDED.date_of_birth,
  height_cm = EXCLUDED.height_cm,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  subcaste = EXCLUDED.subcaste,
  dosham = EXCLUDED.dosham,
  education = EXCLUDED.education,
  education_detail = EXCLUDED.education_detail,
  occupation = EXCLUDED.occupation,
  occupation_detail = EXCLUDED.occupation_detail,
  annual_income = EXCLUDED.annual_income,
  company_name = EXCLUDED.company_name,
  city = EXCLUDED.city,
  district = EXCLUDED.district,
  about_me = EXCLUDED.about_me,
  family_type = EXCLUDED.family_type,
  family_status = EXCLUDED.family_status,
  father_occupation = EXCLUDED.father_occupation,
  mother_occupation = EXCLUDED.mother_occupation,
  is_verified = EXCLUDED.is_verified,
  is_premium = EXCLUDED.is_premium,
  is_profile_complete = EXCLUDED.is_profile_complete,
  profile_completion_percent = EXCLUDED.profile_completion_percent,
  last_active_at = EXCLUDED.last_active_at;
INSERT INTO public.profiles (id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, father_occupation, mother_occupation, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at)
VALUES ('00000000-0000-4000-a000-000000000016', 'TM000022', 'Malathi Kumar', 'female', '1997-04-24', 150, 'never_married', 'Hindu', 'Naicker', 'Naicker subcaste', 'no', 'Ph.D', 'Ph.D Graduate', 'Civil Engineer', 'Civil Engineer Details', '₹5 Lakhs - ₹7 Lakhs', 'TCS', 'Tirunelveli', 'Tirunelveli', 'Hi, I am Malathi. I have completed my Ph.D and am currently working as a Civil Engineer at TCS in Tirunelveli. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'upper_middle_class', 'Retired Employee', 'Homemaker', true, false, true, 100, NOW() - INTERVAL '0 days')
ON CONFLICT (id) DO UPDATE SET
  profile_id = EXCLUDED.profile_id,
  display_name = EXCLUDED.display_name,
  gender = EXCLUDED.gender,
  date_of_birth = EXCLUDED.date_of_birth,
  height_cm = EXCLUDED.height_cm,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  subcaste = EXCLUDED.subcaste,
  dosham = EXCLUDED.dosham,
  education = EXCLUDED.education,
  education_detail = EXCLUDED.education_detail,
  occupation = EXCLUDED.occupation,
  occupation_detail = EXCLUDED.occupation_detail,
  annual_income = EXCLUDED.annual_income,
  company_name = EXCLUDED.company_name,
  city = EXCLUDED.city,
  district = EXCLUDED.district,
  about_me = EXCLUDED.about_me,
  family_type = EXCLUDED.family_type,
  family_status = EXCLUDED.family_status,
  father_occupation = EXCLUDED.father_occupation,
  mother_occupation = EXCLUDED.mother_occupation,
  is_verified = EXCLUDED.is_verified,
  is_premium = EXCLUDED.is_premium,
  is_profile_complete = EXCLUDED.is_profile_complete,
  profile_completion_percent = EXCLUDED.profile_completion_percent,
  last_active_at = EXCLUDED.last_active_at;
INSERT INTO public.profiles (id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, father_occupation, mother_occupation, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at)
VALUES ('00000000-0000-4000-a000-000000000017', 'TM000023', 'Dinesh Gopal', 'male', '1998-11-11', 168, 'never_married', 'Hindu', 'Arunthathiyar', 'Arunthathiyar subcaste', 'no', 'B.A', 'B.A Graduate', 'Doctor', 'Doctor Details', '₹10 Lakhs - ₹15 Lakhs', 'Zoho', 'Tiruppur', 'Tiruppur', 'Hi, I am Dinesh. I have completed my B.A and am currently working as a Doctor at Zoho in Tiruppur. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'upper_middle_class', 'Retired Employee', 'Homemaker', true, false, true, 100, NOW() - INTERVAL '2 days')
ON CONFLICT (id) DO UPDATE SET
  profile_id = EXCLUDED.profile_id,
  display_name = EXCLUDED.display_name,
  gender = EXCLUDED.gender,
  date_of_birth = EXCLUDED.date_of_birth,
  height_cm = EXCLUDED.height_cm,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  subcaste = EXCLUDED.subcaste,
  dosham = EXCLUDED.dosham,
  education = EXCLUDED.education,
  education_detail = EXCLUDED.education_detail,
  occupation = EXCLUDED.occupation,
  occupation_detail = EXCLUDED.occupation_detail,
  annual_income = EXCLUDED.annual_income,
  company_name = EXCLUDED.company_name,
  city = EXCLUDED.city,
  district = EXCLUDED.district,
  about_me = EXCLUDED.about_me,
  family_type = EXCLUDED.family_type,
  family_status = EXCLUDED.family_status,
  father_occupation = EXCLUDED.father_occupation,
  mother_occupation = EXCLUDED.mother_occupation,
  is_verified = EXCLUDED.is_verified,
  is_premium = EXCLUDED.is_premium,
  is_profile_complete = EXCLUDED.is_profile_complete,
  profile_completion_percent = EXCLUDED.profile_completion_percent,
  last_active_at = EXCLUDED.last_active_at;
INSERT INTO public.profiles (id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, father_occupation, mother_occupation, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at)
VALUES ('00000000-0000-4000-a000-000000000018', 'TM000024', 'Pooja Krishnan', 'female', '1998-09-04', 167, 'never_married', 'Hindu', 'Thevar', NULL, 'no', 'B.Ed', 'B.Ed Graduate', 'Pharmacist', 'Pharmacist Details', '₹3 Lakhs - ₹5 Lakhs', 'Zoho', 'Madurai', 'Madurai', 'Hi, I am Pooja. I have completed my B.Ed and am currently working as a Pharmacist at Zoho in Madurai. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'middle_class', 'Retired Employee', 'Homemaker', true, false, true, 100, NOW() - INTERVAL '4 days')
ON CONFLICT (id) DO UPDATE SET
  profile_id = EXCLUDED.profile_id,
  display_name = EXCLUDED.display_name,
  gender = EXCLUDED.gender,
  date_of_birth = EXCLUDED.date_of_birth,
  height_cm = EXCLUDED.height_cm,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  subcaste = EXCLUDED.subcaste,
  dosham = EXCLUDED.dosham,
  education = EXCLUDED.education,
  education_detail = EXCLUDED.education_detail,
  occupation = EXCLUDED.occupation,
  occupation_detail = EXCLUDED.occupation_detail,
  annual_income = EXCLUDED.annual_income,
  company_name = EXCLUDED.company_name,
  city = EXCLUDED.city,
  district = EXCLUDED.district,
  about_me = EXCLUDED.about_me,
  family_type = EXCLUDED.family_type,
  family_status = EXCLUDED.family_status,
  father_occupation = EXCLUDED.father_occupation,
  mother_occupation = EXCLUDED.mother_occupation,
  is_verified = EXCLUDED.is_verified,
  is_premium = EXCLUDED.is_premium,
  is_profile_complete = EXCLUDED.is_profile_complete,
  profile_completion_percent = EXCLUDED.profile_completion_percent,
  last_active_at = EXCLUDED.last_active_at;
INSERT INTO public.profiles (id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, father_occupation, mother_occupation, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at)
VALUES ('00000000-0000-4000-a000-000000000019', 'TM000025', 'Sathish Shankar', 'male', '1997-09-24', 180, 'never_married', 'Hindu', 'Thevar', 'Thevar subcaste', 'no', 'M.B.B.S', 'M.B.B.S Graduate', 'Doctor', 'Doctor Details', '₹20 Lakhs+', 'TCS', 'Coimbatore', 'Coimbatore', 'Hi, I am Sathish. I have completed my M.B.B.S and am currently working as a Doctor at TCS in Coimbatore. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'rich', 'Retired Employee', 'Homemaker', false, false, true, 100, NOW() - INTERVAL '7 days')
ON CONFLICT (id) DO UPDATE SET
  profile_id = EXCLUDED.profile_id,
  display_name = EXCLUDED.display_name,
  gender = EXCLUDED.gender,
  date_of_birth = EXCLUDED.date_of_birth,
  height_cm = EXCLUDED.height_cm,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  subcaste = EXCLUDED.subcaste,
  dosham = EXCLUDED.dosham,
  education = EXCLUDED.education,
  education_detail = EXCLUDED.education_detail,
  occupation = EXCLUDED.occupation,
  occupation_detail = EXCLUDED.occupation_detail,
  annual_income = EXCLUDED.annual_income,
  company_name = EXCLUDED.company_name,
  city = EXCLUDED.city,
  district = EXCLUDED.district,
  about_me = EXCLUDED.about_me,
  family_type = EXCLUDED.family_type,
  family_status = EXCLUDED.family_status,
  father_occupation = EXCLUDED.father_occupation,
  mother_occupation = EXCLUDED.mother_occupation,
  is_verified = EXCLUDED.is_verified,
  is_premium = EXCLUDED.is_premium,
  is_profile_complete = EXCLUDED.is_profile_complete,
  profile_completion_percent = EXCLUDED.profile_completion_percent,
  last_active_at = EXCLUDED.last_active_at;
INSERT INTO public.profiles (id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, father_occupation, mother_occupation, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at)
VALUES ('00000000-0000-4000-a000-00000000001a', 'TM000026', 'Shalini Mani', 'female', '1999-07-14', 165, 'never_married', 'Hindu', 'Naicker', 'Naicker subcaste', 'no', 'M.C.A', 'M.C.A Graduate', 'Business Owner', 'Business Owner Details', '₹20 Lakhs+', 'Wipro', 'Tirunelveli', 'Tirunelveli', 'Hi, I am Shalini. I have completed my M.C.A and am currently working as a Business Owner at Wipro in Tirunelveli. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'joint', 'middle_class', 'Retired Employee', 'Homemaker', false, false, true, 100, NOW() - INTERVAL '5 days')
ON CONFLICT (id) DO UPDATE SET
  profile_id = EXCLUDED.profile_id,
  display_name = EXCLUDED.display_name,
  gender = EXCLUDED.gender,
  date_of_birth = EXCLUDED.date_of_birth,
  height_cm = EXCLUDED.height_cm,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  subcaste = EXCLUDED.subcaste,
  dosham = EXCLUDED.dosham,
  education = EXCLUDED.education,
  education_detail = EXCLUDED.education_detail,
  occupation = EXCLUDED.occupation,
  occupation_detail = EXCLUDED.occupation_detail,
  annual_income = EXCLUDED.annual_income,
  company_name = EXCLUDED.company_name,
  city = EXCLUDED.city,
  district = EXCLUDED.district,
  about_me = EXCLUDED.about_me,
  family_type = EXCLUDED.family_type,
  family_status = EXCLUDED.family_status,
  father_occupation = EXCLUDED.father_occupation,
  mother_occupation = EXCLUDED.mother_occupation,
  is_verified = EXCLUDED.is_verified,
  is_premium = EXCLUDED.is_premium,
  is_profile_complete = EXCLUDED.is_profile_complete,
  profile_completion_percent = EXCLUDED.profile_completion_percent,
  last_active_at = EXCLUDED.last_active_at;
INSERT INTO public.profiles (id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, father_occupation, mother_occupation, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at)
VALUES ('00000000-0000-4000-a000-00000000001b', 'TM000027', 'Deepak Samy', 'male', '1999-11-19', 186, 'divorced', 'Hindu', 'Maravar', 'Maravar subcaste', 'no', 'B.E. / B.Tech', 'B.E. / B.Tech Graduate', 'Software Engineer', 'Software Engineer Details', '₹10 Lakhs - ₹15 Lakhs', 'Zoho', 'Coimbatore', 'Coimbatore', 'Hi, I am Deepak. I have completed my B.E. / B.Tech and am currently working as a Software Engineer at Zoho in Coimbatore. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'upper_middle_class', 'Retired Employee', 'Homemaker', true, false, true, 100, NOW() - INTERVAL '8 days')
ON CONFLICT (id) DO UPDATE SET
  profile_id = EXCLUDED.profile_id,
  display_name = EXCLUDED.display_name,
  gender = EXCLUDED.gender,
  date_of_birth = EXCLUDED.date_of_birth,
  height_cm = EXCLUDED.height_cm,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  subcaste = EXCLUDED.subcaste,
  dosham = EXCLUDED.dosham,
  education = EXCLUDED.education,
  education_detail = EXCLUDED.education_detail,
  occupation = EXCLUDED.occupation,
  occupation_detail = EXCLUDED.occupation_detail,
  annual_income = EXCLUDED.annual_income,
  company_name = EXCLUDED.company_name,
  city = EXCLUDED.city,
  district = EXCLUDED.district,
  about_me = EXCLUDED.about_me,
  family_type = EXCLUDED.family_type,
  family_status = EXCLUDED.family_status,
  father_occupation = EXCLUDED.father_occupation,
  mother_occupation = EXCLUDED.mother_occupation,
  is_verified = EXCLUDED.is_verified,
  is_premium = EXCLUDED.is_premium,
  is_profile_complete = EXCLUDED.is_profile_complete,
  profile_completion_percent = EXCLUDED.profile_completion_percent,
  last_active_at = EXCLUDED.last_active_at;
INSERT INTO public.profiles (id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, father_occupation, mother_occupation, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at)
VALUES ('00000000-0000-4000-a000-00000000001c', 'TM000028', 'Kokila Murthy', 'female', '1990-12-04', 172, 'never_married', 'Muslim', 'Labbai', 'Labbai subcaste', 'no', 'M.Sc', 'M.Sc Graduate', 'Mechanical Engineer', 'Mechanical Engineer Details', '₹10 Lakhs - ₹15 Lakhs', 'Zoho', 'Erode', 'Erode', 'Hi, I am Kokila. I have completed my M.Sc and am currently working as a Mechanical Engineer at Zoho in Erode. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'middle_class', 'Retired Employee', 'Homemaker', true, true, true, 100, NOW() - INTERVAL '7 days')
ON CONFLICT (id) DO UPDATE SET
  profile_id = EXCLUDED.profile_id,
  display_name = EXCLUDED.display_name,
  gender = EXCLUDED.gender,
  date_of_birth = EXCLUDED.date_of_birth,
  height_cm = EXCLUDED.height_cm,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  subcaste = EXCLUDED.subcaste,
  dosham = EXCLUDED.dosham,
  education = EXCLUDED.education,
  education_detail = EXCLUDED.education_detail,
  occupation = EXCLUDED.occupation,
  occupation_detail = EXCLUDED.occupation_detail,
  annual_income = EXCLUDED.annual_income,
  company_name = EXCLUDED.company_name,
  city = EXCLUDED.city,
  district = EXCLUDED.district,
  about_me = EXCLUDED.about_me,
  family_type = EXCLUDED.family_type,
  family_status = EXCLUDED.family_status,
  father_occupation = EXCLUDED.father_occupation,
  mother_occupation = EXCLUDED.mother_occupation,
  is_verified = EXCLUDED.is_verified,
  is_premium = EXCLUDED.is_premium,
  is_profile_complete = EXCLUDED.is_profile_complete,
  profile_completion_percent = EXCLUDED.profile_completion_percent,
  last_active_at = EXCLUDED.last_active_at;
INSERT INTO public.profiles (id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, father_occupation, mother_occupation, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at)
VALUES ('00000000-0000-4000-a000-00000000001d', 'TM000029', 'Murugan Gopal', 'male', '2005-08-21', 167, 'never_married', 'Muslim', 'Shia Muslim', 'Shia Muslim subcaste', 'no', 'B.Ed', 'B.Ed Graduate', 'Software Engineer', 'Software Engineer Details', '₹3 Lakhs - ₹5 Lakhs', 'Zoho', 'Thanjavur', 'Thanjavur', 'Hi, I am Murugan. I have completed my B.Ed and am currently working as a Software Engineer at Zoho in Thanjavur. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'joint', 'upper_middle_class', 'Retired Employee', 'Homemaker', true, true, true, 100, NOW() - INTERVAL '7 days')
ON CONFLICT (id) DO UPDATE SET
  profile_id = EXCLUDED.profile_id,
  display_name = EXCLUDED.display_name,
  gender = EXCLUDED.gender,
  date_of_birth = EXCLUDED.date_of_birth,
  height_cm = EXCLUDED.height_cm,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  subcaste = EXCLUDED.subcaste,
  dosham = EXCLUDED.dosham,
  education = EXCLUDED.education,
  education_detail = EXCLUDED.education_detail,
  occupation = EXCLUDED.occupation,
  occupation_detail = EXCLUDED.occupation_detail,
  annual_income = EXCLUDED.annual_income,
  company_name = EXCLUDED.company_name,
  city = EXCLUDED.city,
  district = EXCLUDED.district,
  about_me = EXCLUDED.about_me,
  family_type = EXCLUDED.family_type,
  family_status = EXCLUDED.family_status,
  father_occupation = EXCLUDED.father_occupation,
  mother_occupation = EXCLUDED.mother_occupation,
  is_verified = EXCLUDED.is_verified,
  is_premium = EXCLUDED.is_premium,
  is_profile_complete = EXCLUDED.is_profile_complete,
  profile_completion_percent = EXCLUDED.profile_completion_percent,
  last_active_at = EXCLUDED.last_active_at;
INSERT INTO public.profiles (id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, father_occupation, mother_occupation, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at)
VALUES ('00000000-0000-4000-a000-00000000001e', 'TM000030', 'Dharshini Velan', 'female', '2003-04-02', 162, 'divorced', 'Hindu', 'Pillai', NULL, 'no', 'M.A', 'M.A Graduate', 'Dentist', 'Dentist Details', '₹3 Lakhs - ₹5 Lakhs', 'Wipro', 'Salem', 'Salem', 'Hi, I am Dharshini. I have completed my M.A and am currently working as a Dentist at Wipro in Salem. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'rich', 'Retired Employee', 'Homemaker', false, false, true, 100, NOW() - INTERVAL '5 days')
ON CONFLICT (id) DO UPDATE SET
  profile_id = EXCLUDED.profile_id,
  display_name = EXCLUDED.display_name,
  gender = EXCLUDED.gender,
  date_of_birth = EXCLUDED.date_of_birth,
  height_cm = EXCLUDED.height_cm,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  subcaste = EXCLUDED.subcaste,
  dosham = EXCLUDED.dosham,
  education = EXCLUDED.education,
  education_detail = EXCLUDED.education_detail,
  occupation = EXCLUDED.occupation,
  occupation_detail = EXCLUDED.occupation_detail,
  annual_income = EXCLUDED.annual_income,
  company_name = EXCLUDED.company_name,
  city = EXCLUDED.city,
  district = EXCLUDED.district,
  about_me = EXCLUDED.about_me,
  family_type = EXCLUDED.family_type,
  family_status = EXCLUDED.family_status,
  father_occupation = EXCLUDED.father_occupation,
  mother_occupation = EXCLUDED.mother_occupation,
  is_verified = EXCLUDED.is_verified,
  is_premium = EXCLUDED.is_premium,
  is_profile_complete = EXCLUDED.is_profile_complete,
  profile_completion_percent = EXCLUDED.profile_completion_percent,
  last_active_at = EXCLUDED.last_active_at;
INSERT INTO public.profiles (id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, father_occupation, mother_occupation, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at)
VALUES ('00000000-0000-4000-a000-00000000001f', 'TM000031', 'Prakash Pandian', 'male', '1988-05-03', 185, 'never_married', 'Hindu', 'Brahmin - Iyengar', 'Brahmin - Iyengar subcaste', 'no', 'B.Sc', 'B.Sc Graduate', 'College Professor', 'College Professor Details', '₹10 Lakhs - ₹15 Lakhs', 'Cognizant', 'Thanjavur', 'Thanjavur', 'Hi, I am Prakash. I have completed my B.Sc and am currently working as a College Professor at Cognizant in Thanjavur. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'joint', 'upper_middle_class', 'Retired Employee', 'Homemaker', false, false, true, 100, NOW() - INTERVAL '1 days')
ON CONFLICT (id) DO UPDATE SET
  profile_id = EXCLUDED.profile_id,
  display_name = EXCLUDED.display_name,
  gender = EXCLUDED.gender,
  date_of_birth = EXCLUDED.date_of_birth,
  height_cm = EXCLUDED.height_cm,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  subcaste = EXCLUDED.subcaste,
  dosham = EXCLUDED.dosham,
  education = EXCLUDED.education,
  education_detail = EXCLUDED.education_detail,
  occupation = EXCLUDED.occupation,
  occupation_detail = EXCLUDED.occupation_detail,
  annual_income = EXCLUDED.annual_income,
  company_name = EXCLUDED.company_name,
  city = EXCLUDED.city,
  district = EXCLUDED.district,
  about_me = EXCLUDED.about_me,
  family_type = EXCLUDED.family_type,
  family_status = EXCLUDED.family_status,
  father_occupation = EXCLUDED.father_occupation,
  mother_occupation = EXCLUDED.mother_occupation,
  is_verified = EXCLUDED.is_verified,
  is_premium = EXCLUDED.is_premium,
  is_profile_complete = EXCLUDED.is_profile_complete,
  profile_completion_percent = EXCLUDED.profile_completion_percent,
  last_active_at = EXCLUDED.last_active_at;
INSERT INTO public.profiles (id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, father_occupation, mother_occupation, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at)
VALUES ('00000000-0000-4000-a000-000000000020', 'TM000032', 'Preethi Selvan', 'female', '1988-08-20', 165, 'divorced', 'Hindu', 'Sengunthar', 'Sengunthar subcaste', 'yes', 'M.A', 'M.A Graduate', 'Advocate', 'Advocate Details', '₹20 Lakhs+', 'Infosys', 'Salem', 'Salem', 'Hi, I am Preethi. I have completed my M.A and am currently working as a Advocate at Infosys in Salem. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'joint', 'middle_class', 'Retired Employee', 'Homemaker', true, false, true, 100, NOW() - INTERVAL '2 days')
ON CONFLICT (id) DO UPDATE SET
  profile_id = EXCLUDED.profile_id,
  display_name = EXCLUDED.display_name,
  gender = EXCLUDED.gender,
  date_of_birth = EXCLUDED.date_of_birth,
  height_cm = EXCLUDED.height_cm,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  subcaste = EXCLUDED.subcaste,
  dosham = EXCLUDED.dosham,
  education = EXCLUDED.education,
  education_detail = EXCLUDED.education_detail,
  occupation = EXCLUDED.occupation,
  occupation_detail = EXCLUDED.occupation_detail,
  annual_income = EXCLUDED.annual_income,
  company_name = EXCLUDED.company_name,
  city = EXCLUDED.city,
  district = EXCLUDED.district,
  about_me = EXCLUDED.about_me,
  family_type = EXCLUDED.family_type,
  family_status = EXCLUDED.family_status,
  father_occupation = EXCLUDED.father_occupation,
  mother_occupation = EXCLUDED.mother_occupation,
  is_verified = EXCLUDED.is_verified,
  is_premium = EXCLUDED.is_premium,
  is_profile_complete = EXCLUDED.is_profile_complete,
  profile_completion_percent = EXCLUDED.profile_completion_percent,
  last_active_at = EXCLUDED.last_active_at;
INSERT INTO public.profiles (id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, father_occupation, mother_occupation, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at)
VALUES ('00000000-0000-4000-a000-000000000021', 'TM000033', 'Siva Balan', 'male', '1998-07-19', 179, 'never_married', 'Hindu', 'Vanniyar', NULL, 'yes', 'M.Sc', 'M.Sc Graduate', 'School Teacher', 'School Teacher Details', '₹7 Lakhs - ₹10 Lakhs', 'Zoho', 'Coimbatore', 'Coimbatore', 'Hi, I am Siva. I have completed my M.Sc and am currently working as a School Teacher at Zoho in Coimbatore. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'upper_middle_class', 'Retired Employee', 'Homemaker', true, true, true, 100, NOW() - INTERVAL '3 days')
ON CONFLICT (id) DO UPDATE SET
  profile_id = EXCLUDED.profile_id,
  display_name = EXCLUDED.display_name,
  gender = EXCLUDED.gender,
  date_of_birth = EXCLUDED.date_of_birth,
  height_cm = EXCLUDED.height_cm,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  subcaste = EXCLUDED.subcaste,
  dosham = EXCLUDED.dosham,
  education = EXCLUDED.education,
  education_detail = EXCLUDED.education_detail,
  occupation = EXCLUDED.occupation,
  occupation_detail = EXCLUDED.occupation_detail,
  annual_income = EXCLUDED.annual_income,
  company_name = EXCLUDED.company_name,
  city = EXCLUDED.city,
  district = EXCLUDED.district,
  about_me = EXCLUDED.about_me,
  family_type = EXCLUDED.family_type,
  family_status = EXCLUDED.family_status,
  father_occupation = EXCLUDED.father_occupation,
  mother_occupation = EXCLUDED.mother_occupation,
  is_verified = EXCLUDED.is_verified,
  is_premium = EXCLUDED.is_premium,
  is_profile_complete = EXCLUDED.is_profile_complete,
  profile_completion_percent = EXCLUDED.profile_completion_percent,
  last_active_at = EXCLUDED.last_active_at;
INSERT INTO public.profiles (id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, father_occupation, mother_occupation, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at)
VALUES ('00000000-0000-4000-a000-000000000022', 'TM000034', 'Ponmani Krishnan', 'female', '2000-02-14', 162, 'never_married', 'Hindu', 'Yadav', 'Yadav subcaste', 'yes', 'M.B.B.S', 'M.B.B.S Graduate', 'Architect', 'Architect Details', '₹20 Lakhs+', 'HCL', 'Thanjavur', 'Thanjavur', 'Hi, I am Ponmani. I have completed my M.B.B.S and am currently working as a Architect at HCL in Thanjavur. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'joint', 'upper_middle_class', 'Retired Employee', 'Homemaker', true, true, true, 100, NOW() - INTERVAL '9 days')
ON CONFLICT (id) DO UPDATE SET
  profile_id = EXCLUDED.profile_id,
  display_name = EXCLUDED.display_name,
  gender = EXCLUDED.gender,
  date_of_birth = EXCLUDED.date_of_birth,
  height_cm = EXCLUDED.height_cm,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  subcaste = EXCLUDED.subcaste,
  dosham = EXCLUDED.dosham,
  education = EXCLUDED.education,
  education_detail = EXCLUDED.education_detail,
  occupation = EXCLUDED.occupation,
  occupation_detail = EXCLUDED.occupation_detail,
  annual_income = EXCLUDED.annual_income,
  company_name = EXCLUDED.company_name,
  city = EXCLUDED.city,
  district = EXCLUDED.district,
  about_me = EXCLUDED.about_me,
  family_type = EXCLUDED.family_type,
  family_status = EXCLUDED.family_status,
  father_occupation = EXCLUDED.father_occupation,
  mother_occupation = EXCLUDED.mother_occupation,
  is_verified = EXCLUDED.is_verified,
  is_premium = EXCLUDED.is_premium,
  is_profile_complete = EXCLUDED.is_profile_complete,
  profile_completion_percent = EXCLUDED.profile_completion_percent,
  last_active_at = EXCLUDED.last_active_at;
INSERT INTO public.profiles (id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, father_occupation, mother_occupation, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at)
VALUES ('00000000-0000-4000-a000-000000000023', 'TM000035', 'Viswanathan Pandian', 'male', '2002-02-15', 186, 'never_married', 'Hindu', 'Pillai', 'Pillai subcaste', 'no', 'M.B.A', 'M.B.A Graduate', 'Mechanical Engineer', 'Mechanical Engineer Details', '₹15 Lakhs - ₹20 Lakhs', 'Zoho', 'Vellore', 'Vellore', 'Hi, I am Viswanathan. I have completed my M.B.A and am currently working as a Mechanical Engineer at Zoho in Vellore. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'upper_middle_class', 'Retired Employee', 'Homemaker', true, false, true, 100, NOW() - INTERVAL '1 days')
ON CONFLICT (id) DO UPDATE SET
  profile_id = EXCLUDED.profile_id,
  display_name = EXCLUDED.display_name,
  gender = EXCLUDED.gender,
  date_of_birth = EXCLUDED.date_of_birth,
  height_cm = EXCLUDED.height_cm,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  subcaste = EXCLUDED.subcaste,
  dosham = EXCLUDED.dosham,
  education = EXCLUDED.education,
  education_detail = EXCLUDED.education_detail,
  occupation = EXCLUDED.occupation,
  occupation_detail = EXCLUDED.occupation_detail,
  annual_income = EXCLUDED.annual_income,
  company_name = EXCLUDED.company_name,
  city = EXCLUDED.city,
  district = EXCLUDED.district,
  about_me = EXCLUDED.about_me,
  family_type = EXCLUDED.family_type,
  family_status = EXCLUDED.family_status,
  father_occupation = EXCLUDED.father_occupation,
  mother_occupation = EXCLUDED.mother_occupation,
  is_verified = EXCLUDED.is_verified,
  is_premium = EXCLUDED.is_premium,
  is_profile_complete = EXCLUDED.is_profile_complete,
  profile_completion_percent = EXCLUDED.profile_completion_percent,
  last_active_at = EXCLUDED.last_active_at;
INSERT INTO public.profiles (id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, father_occupation, mother_occupation, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at)
VALUES ('00000000-0000-4000-a000-000000000024', 'TM000036', 'Archana Selvan', 'female', '2004-02-28', 154, 'divorced', 'Hindu', 'Naicker', NULL, 'no', 'Ph.D', 'Ph.D Graduate', 'Software Engineer', 'Software Engineer Details', '₹10 Lakhs - ₹15 Lakhs', 'Private Practice', 'Kanchipuram', 'Kanchipuram', 'Hi, I am Archana. I have completed my Ph.D and am currently working as a Software Engineer at Private Practice in Kanchipuram. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'upper_middle_class', 'Retired Employee', 'Homemaker', true, true, true, 100, NOW() - INTERVAL '3 days')
ON CONFLICT (id) DO UPDATE SET
  profile_id = EXCLUDED.profile_id,
  display_name = EXCLUDED.display_name,
  gender = EXCLUDED.gender,
  date_of_birth = EXCLUDED.date_of_birth,
  height_cm = EXCLUDED.height_cm,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  subcaste = EXCLUDED.subcaste,
  dosham = EXCLUDED.dosham,
  education = EXCLUDED.education,
  education_detail = EXCLUDED.education_detail,
  occupation = EXCLUDED.occupation,
  occupation_detail = EXCLUDED.occupation_detail,
  annual_income = EXCLUDED.annual_income,
  company_name = EXCLUDED.company_name,
  city = EXCLUDED.city,
  district = EXCLUDED.district,
  about_me = EXCLUDED.about_me,
  family_type = EXCLUDED.family_type,
  family_status = EXCLUDED.family_status,
  father_occupation = EXCLUDED.father_occupation,
  mother_occupation = EXCLUDED.mother_occupation,
  is_verified = EXCLUDED.is_verified,
  is_premium = EXCLUDED.is_premium,
  is_profile_complete = EXCLUDED.is_profile_complete,
  profile_completion_percent = EXCLUDED.profile_completion_percent,
  last_active_at = EXCLUDED.last_active_at;
INSERT INTO public.profiles (id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, father_occupation, mother_occupation, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at)
VALUES ('00000000-0000-4000-a000-000000000025', 'TM000037', 'Anand Moorthy', 'male', '2000-04-24', 182, 'never_married', 'Muslim', 'Rawther', 'Rawther subcaste', 'yes', 'M.C.A', 'M.C.A Graduate', 'Software Engineer', 'Software Engineer Details', '₹7 Lakhs - ₹10 Lakhs', 'Cognizant', 'Chennai', 'Chennai', 'Hi, I am Anand. I have completed my M.C.A and am currently working as a Software Engineer at Cognizant in Chennai. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'joint', 'rich', 'Retired Employee', 'Homemaker', false, false, true, 100, NOW() - INTERVAL '9 days')
ON CONFLICT (id) DO UPDATE SET
  profile_id = EXCLUDED.profile_id,
  display_name = EXCLUDED.display_name,
  gender = EXCLUDED.gender,
  date_of_birth = EXCLUDED.date_of_birth,
  height_cm = EXCLUDED.height_cm,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  subcaste = EXCLUDED.subcaste,
  dosham = EXCLUDED.dosham,
  education = EXCLUDED.education,
  education_detail = EXCLUDED.education_detail,
  occupation = EXCLUDED.occupation,
  occupation_detail = EXCLUDED.occupation_detail,
  annual_income = EXCLUDED.annual_income,
  company_name = EXCLUDED.company_name,
  city = EXCLUDED.city,
  district = EXCLUDED.district,
  about_me = EXCLUDED.about_me,
  family_type = EXCLUDED.family_type,
  family_status = EXCLUDED.family_status,
  father_occupation = EXCLUDED.father_occupation,
  mother_occupation = EXCLUDED.mother_occupation,
  is_verified = EXCLUDED.is_verified,
  is_premium = EXCLUDED.is_premium,
  is_profile_complete = EXCLUDED.is_profile_complete,
  profile_completion_percent = EXCLUDED.profile_completion_percent,
  last_active_at = EXCLUDED.last_active_at;
INSERT INTO public.profiles (id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, father_occupation, mother_occupation, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at)
VALUES ('00000000-0000-4000-a000-000000000026', 'TM000038', 'Archana Lingam', 'female', '1991-12-05', 160, 'divorced', 'Hindu', 'Thevar', 'Thevar subcaste', 'no', 'M.C.A', 'M.C.A Graduate', 'HR Specialist', 'HR Specialist Details', '₹5 Lakhs - ₹7 Lakhs', 'Government Service', 'Madurai', 'Madurai', 'Hi, I am Archana. I have completed my M.C.A and am currently working as a HR Specialist at Government Service in Madurai. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'rich', 'Retired Employee', 'Homemaker', true, false, true, 100, NOW() - INTERVAL '5 days')
ON CONFLICT (id) DO UPDATE SET
  profile_id = EXCLUDED.profile_id,
  display_name = EXCLUDED.display_name,
  gender = EXCLUDED.gender,
  date_of_birth = EXCLUDED.date_of_birth,
  height_cm = EXCLUDED.height_cm,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  subcaste = EXCLUDED.subcaste,
  dosham = EXCLUDED.dosham,
  education = EXCLUDED.education,
  education_detail = EXCLUDED.education_detail,
  occupation = EXCLUDED.occupation,
  occupation_detail = EXCLUDED.occupation_detail,
  annual_income = EXCLUDED.annual_income,
  company_name = EXCLUDED.company_name,
  city = EXCLUDED.city,
  district = EXCLUDED.district,
  about_me = EXCLUDED.about_me,
  family_type = EXCLUDED.family_type,
  family_status = EXCLUDED.family_status,
  father_occupation = EXCLUDED.father_occupation,
  mother_occupation = EXCLUDED.mother_occupation,
  is_verified = EXCLUDED.is_verified,
  is_premium = EXCLUDED.is_premium,
  is_profile_complete = EXCLUDED.is_profile_complete,
  profile_completion_percent = EXCLUDED.profile_completion_percent,
  last_active_at = EXCLUDED.last_active_at;
INSERT INTO public.profiles (id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, father_occupation, mother_occupation, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at)
VALUES ('00000000-0000-4000-a000-000000000027', 'TM000039', 'Suresh Pandian', 'male', '1990-08-27', 168, 'never_married', 'Hindu', 'Agamudayar', NULL, 'no', 'Ph.D', 'Ph.D Graduate', 'College Professor', 'College Professor Details', '₹10 Lakhs - ₹15 Lakhs', 'Wipro', 'Kanchipuram', 'Kanchipuram', 'Hi, I am Suresh. I have completed my Ph.D and am currently working as a College Professor at Wipro in Kanchipuram. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'rich', 'Retired Employee', 'Homemaker', true, false, true, 100, NOW() - INTERVAL '1 days')
ON CONFLICT (id) DO UPDATE SET
  profile_id = EXCLUDED.profile_id,
  display_name = EXCLUDED.display_name,
  gender = EXCLUDED.gender,
  date_of_birth = EXCLUDED.date_of_birth,
  height_cm = EXCLUDED.height_cm,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  subcaste = EXCLUDED.subcaste,
  dosham = EXCLUDED.dosham,
  education = EXCLUDED.education,
  education_detail = EXCLUDED.education_detail,
  occupation = EXCLUDED.occupation,
  occupation_detail = EXCLUDED.occupation_detail,
  annual_income = EXCLUDED.annual_income,
  company_name = EXCLUDED.company_name,
  city = EXCLUDED.city,
  district = EXCLUDED.district,
  about_me = EXCLUDED.about_me,
  family_type = EXCLUDED.family_type,
  family_status = EXCLUDED.family_status,
  father_occupation = EXCLUDED.father_occupation,
  mother_occupation = EXCLUDED.mother_occupation,
  is_verified = EXCLUDED.is_verified,
  is_premium = EXCLUDED.is_premium,
  is_profile_complete = EXCLUDED.is_profile_complete,
  profile_completion_percent = EXCLUDED.profile_completion_percent,
  last_active_at = EXCLUDED.last_active_at;
INSERT INTO public.profiles (id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, father_occupation, mother_occupation, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at)
VALUES ('00000000-0000-4000-a000-000000000028', 'TM000040', 'Archana Kumar', 'female', '2003-08-05', 156, 'never_married', 'Hindu', 'Kallar', NULL, 'no', 'B.Sc', 'B.Sc Graduate', 'Bank Manager', 'Bank Manager Details', '₹20 Lakhs+', 'Private Practice', 'Coimbatore', 'Coimbatore', 'Hi, I am Archana. I have completed my B.Sc and am currently working as a Bank Manager at Private Practice in Coimbatore. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'joint', 'rich', 'Retired Employee', 'Homemaker', false, false, true, 100, NOW() - INTERVAL '3 days')
ON CONFLICT (id) DO UPDATE SET
  profile_id = EXCLUDED.profile_id,
  display_name = EXCLUDED.display_name,
  gender = EXCLUDED.gender,
  date_of_birth = EXCLUDED.date_of_birth,
  height_cm = EXCLUDED.height_cm,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  subcaste = EXCLUDED.subcaste,
  dosham = EXCLUDED.dosham,
  education = EXCLUDED.education,
  education_detail = EXCLUDED.education_detail,
  occupation = EXCLUDED.occupation,
  occupation_detail = EXCLUDED.occupation_detail,
  annual_income = EXCLUDED.annual_income,
  company_name = EXCLUDED.company_name,
  city = EXCLUDED.city,
  district = EXCLUDED.district,
  about_me = EXCLUDED.about_me,
  family_type = EXCLUDED.family_type,
  family_status = EXCLUDED.family_status,
  father_occupation = EXCLUDED.father_occupation,
  mother_occupation = EXCLUDED.mother_occupation,
  is_verified = EXCLUDED.is_verified,
  is_premium = EXCLUDED.is_premium,
  is_profile_complete = EXCLUDED.is_profile_complete,
  profile_completion_percent = EXCLUDED.profile_completion_percent,
  last_active_at = EXCLUDED.last_active_at;
INSERT INTO public.profiles (id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, father_occupation, mother_occupation, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at)
VALUES ('00000000-0000-4000-a000-000000000029', 'TM000041', 'Gautham Krishnan', 'male', '1997-09-04', 180, 'never_married', 'Hindu', 'Vellalar', NULL, 'yes', 'M.B.B.S', 'M.B.B.S Graduate', 'Police Officer', 'Police Officer Details', '₹5 Lakhs - ₹7 Lakhs', 'Private Practice', 'Chennai', 'Chennai', 'Hi, I am Gautham. I have completed my M.B.B.S and am currently working as a Police Officer at Private Practice in Chennai. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'joint', 'middle_class', 'Retired Employee', 'Homemaker', true, false, true, 100, NOW() - INTERVAL '8 days')
ON CONFLICT (id) DO UPDATE SET
  profile_id = EXCLUDED.profile_id,
  display_name = EXCLUDED.display_name,
  gender = EXCLUDED.gender,
  date_of_birth = EXCLUDED.date_of_birth,
  height_cm = EXCLUDED.height_cm,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  subcaste = EXCLUDED.subcaste,
  dosham = EXCLUDED.dosham,
  education = EXCLUDED.education,
  education_detail = EXCLUDED.education_detail,
  occupation = EXCLUDED.occupation,
  occupation_detail = EXCLUDED.occupation_detail,
  annual_income = EXCLUDED.annual_income,
  company_name = EXCLUDED.company_name,
  city = EXCLUDED.city,
  district = EXCLUDED.district,
  about_me = EXCLUDED.about_me,
  family_type = EXCLUDED.family_type,
  family_status = EXCLUDED.family_status,
  father_occupation = EXCLUDED.father_occupation,
  mother_occupation = EXCLUDED.mother_occupation,
  is_verified = EXCLUDED.is_verified,
  is_premium = EXCLUDED.is_premium,
  is_profile_complete = EXCLUDED.is_profile_complete,
  profile_completion_percent = EXCLUDED.profile_completion_percent,
  last_active_at = EXCLUDED.last_active_at;
INSERT INTO public.profiles (id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, father_occupation, mother_occupation, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at)
VALUES ('00000000-0000-4000-a000-00000000002a', 'TM000042', 'Rajeshwari Lingam', 'female', '1988-12-14', 152, 'never_married', 'Hindu', 'Arunthathiyar', 'Arunthathiyar subcaste', 'no', 'M.A', 'M.A Graduate', 'Pharmacist', 'Pharmacist Details', '₹20 Lakhs+', 'Private Practice', 'Thoothukudi', 'Tuticorin', 'Hi, I am Rajeshwari. I have completed my M.A and am currently working as a Pharmacist at Private Practice in Thoothukudi. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'rich', 'Retired Employee', 'Homemaker', false, true, true, 100, NOW() - INTERVAL '10 days')
ON CONFLICT (id) DO UPDATE SET
  profile_id = EXCLUDED.profile_id,
  display_name = EXCLUDED.display_name,
  gender = EXCLUDED.gender,
  date_of_birth = EXCLUDED.date_of_birth,
  height_cm = EXCLUDED.height_cm,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  subcaste = EXCLUDED.subcaste,
  dosham = EXCLUDED.dosham,
  education = EXCLUDED.education,
  education_detail = EXCLUDED.education_detail,
  occupation = EXCLUDED.occupation,
  occupation_detail = EXCLUDED.occupation_detail,
  annual_income = EXCLUDED.annual_income,
  company_name = EXCLUDED.company_name,
  city = EXCLUDED.city,
  district = EXCLUDED.district,
  about_me = EXCLUDED.about_me,
  family_type = EXCLUDED.family_type,
  family_status = EXCLUDED.family_status,
  father_occupation = EXCLUDED.father_occupation,
  mother_occupation = EXCLUDED.mother_occupation,
  is_verified = EXCLUDED.is_verified,
  is_premium = EXCLUDED.is_premium,
  is_profile_complete = EXCLUDED.is_profile_complete,
  profile_completion_percent = EXCLUDED.profile_completion_percent,
  last_active_at = EXCLUDED.last_active_at;
INSERT INTO public.profiles (id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, father_occupation, mother_occupation, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at)
VALUES ('00000000-0000-4000-a000-00000000002b', 'TM000043', 'Selvam Velan', 'male', '1998-10-14', 185, 'never_married', 'Hindu', 'Adi Dravida', 'Adi Dravida subcaste', 'no', 'B.A', 'B.A Graduate', 'School Teacher', 'School Teacher Details', '₹3 Lakhs - ₹5 Lakhs', 'Self Employed', 'Kanchipuram', 'Kanchipuram', 'Hi, I am Selvam. I have completed my B.A and am currently working as a School Teacher at Self Employed in Kanchipuram. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'middle_class', 'Retired Employee', 'Homemaker', true, false, true, 100, NOW() - INTERVAL '6 days')
ON CONFLICT (id) DO UPDATE SET
  profile_id = EXCLUDED.profile_id,
  display_name = EXCLUDED.display_name,
  gender = EXCLUDED.gender,
  date_of_birth = EXCLUDED.date_of_birth,
  height_cm = EXCLUDED.height_cm,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  subcaste = EXCLUDED.subcaste,
  dosham = EXCLUDED.dosham,
  education = EXCLUDED.education,
  education_detail = EXCLUDED.education_detail,
  occupation = EXCLUDED.occupation,
  occupation_detail = EXCLUDED.occupation_detail,
  annual_income = EXCLUDED.annual_income,
  company_name = EXCLUDED.company_name,
  city = EXCLUDED.city,
  district = EXCLUDED.district,
  about_me = EXCLUDED.about_me,
  family_type = EXCLUDED.family_type,
  family_status = EXCLUDED.family_status,
  father_occupation = EXCLUDED.father_occupation,
  mother_occupation = EXCLUDED.mother_occupation,
  is_verified = EXCLUDED.is_verified,
  is_premium = EXCLUDED.is_premium,
  is_profile_complete = EXCLUDED.is_profile_complete,
  profile_completion_percent = EXCLUDED.profile_completion_percent,
  last_active_at = EXCLUDED.last_active_at;
INSERT INTO public.profiles (id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, father_occupation, mother_occupation, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at)
VALUES ('00000000-0000-4000-a000-00000000002c', 'TM000044', 'Vidya Pandian', 'female', '2002-06-12', 157, 'never_married', 'Hindu', 'Kallar', 'Kallar subcaste', 'no', 'M.A', 'M.A Graduate', 'College Professor', 'College Professor Details', '₹15 Lakhs - ₹20 Lakhs', 'Cognizant', 'Thoothukudi', 'Tuticorin', 'Hi, I am Vidya. I have completed my M.A and am currently working as a College Professor at Cognizant in Thoothukudi. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'middle_class', 'Retired Employee', 'Homemaker', true, true, true, 100, NOW() - INTERVAL '3 days')
ON CONFLICT (id) DO UPDATE SET
  profile_id = EXCLUDED.profile_id,
  display_name = EXCLUDED.display_name,
  gender = EXCLUDED.gender,
  date_of_birth = EXCLUDED.date_of_birth,
  height_cm = EXCLUDED.height_cm,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  subcaste = EXCLUDED.subcaste,
  dosham = EXCLUDED.dosham,
  education = EXCLUDED.education,
  education_detail = EXCLUDED.education_detail,
  occupation = EXCLUDED.occupation,
  occupation_detail = EXCLUDED.occupation_detail,
  annual_income = EXCLUDED.annual_income,
  company_name = EXCLUDED.company_name,
  city = EXCLUDED.city,
  district = EXCLUDED.district,
  about_me = EXCLUDED.about_me,
  family_type = EXCLUDED.family_type,
  family_status = EXCLUDED.family_status,
  father_occupation = EXCLUDED.father_occupation,
  mother_occupation = EXCLUDED.mother_occupation,
  is_verified = EXCLUDED.is_verified,
  is_premium = EXCLUDED.is_premium,
  is_profile_complete = EXCLUDED.is_profile_complete,
  profile_completion_percent = EXCLUDED.profile_completion_percent,
  last_active_at = EXCLUDED.last_active_at;
INSERT INTO public.profiles (id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, father_occupation, mother_occupation, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at)
VALUES ('00000000-0000-4000-a000-00000000002d', 'TM000045', 'Ranjith Raman', 'male', '1993-10-25', 175, 'never_married', 'Hindu', 'Naidu', NULL, 'no', 'B.Ed', 'B.Ed Graduate', 'Mechanical Engineer', 'Mechanical Engineer Details', '₹5 Lakhs - ₹7 Lakhs', 'Private Practice', 'Kanchipuram', 'Kanchipuram', 'Hi, I am Ranjith. I have completed my B.Ed and am currently working as a Mechanical Engineer at Private Practice in Kanchipuram. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'joint', 'rich', 'Retired Employee', 'Homemaker', false, true, true, 100, NOW() - INTERVAL '4 days')
ON CONFLICT (id) DO UPDATE SET
  profile_id = EXCLUDED.profile_id,
  display_name = EXCLUDED.display_name,
  gender = EXCLUDED.gender,
  date_of_birth = EXCLUDED.date_of_birth,
  height_cm = EXCLUDED.height_cm,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  subcaste = EXCLUDED.subcaste,
  dosham = EXCLUDED.dosham,
  education = EXCLUDED.education,
  education_detail = EXCLUDED.education_detail,
  occupation = EXCLUDED.occupation,
  occupation_detail = EXCLUDED.occupation_detail,
  annual_income = EXCLUDED.annual_income,
  company_name = EXCLUDED.company_name,
  city = EXCLUDED.city,
  district = EXCLUDED.district,
  about_me = EXCLUDED.about_me,
  family_type = EXCLUDED.family_type,
  family_status = EXCLUDED.family_status,
  father_occupation = EXCLUDED.father_occupation,
  mother_occupation = EXCLUDED.mother_occupation,
  is_verified = EXCLUDED.is_verified,
  is_premium = EXCLUDED.is_premium,
  is_profile_complete = EXCLUDED.is_profile_complete,
  profile_completion_percent = EXCLUDED.profile_completion_percent,
  last_active_at = EXCLUDED.last_active_at;
INSERT INTO public.profiles (id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, father_occupation, mother_occupation, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at)
VALUES ('00000000-0000-4000-a000-00000000002e', 'TM000046', 'Pooja Swamy', 'female', '2003-08-23', 150, 'never_married', 'Hindu', 'Devendra Kula Vellalar', 'Devendra Kula Vellalar subcaste', 'no', 'B.Sc', 'B.Sc Graduate', 'Auditor', 'Auditor Details', '₹15 Lakhs - ₹20 Lakhs', 'Wipro', 'Coimbatore', 'Coimbatore', 'Hi, I am Pooja. I have completed my B.Sc and am currently working as a Auditor at Wipro in Coimbatore. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'joint', 'rich', 'Retired Employee', 'Homemaker', true, true, true, 100, NOW() - INTERVAL '1 days')
ON CONFLICT (id) DO UPDATE SET
  profile_id = EXCLUDED.profile_id,
  display_name = EXCLUDED.display_name,
  gender = EXCLUDED.gender,
  date_of_birth = EXCLUDED.date_of_birth,
  height_cm = EXCLUDED.height_cm,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  subcaste = EXCLUDED.subcaste,
  dosham = EXCLUDED.dosham,
  education = EXCLUDED.education,
  education_detail = EXCLUDED.education_detail,
  occupation = EXCLUDED.occupation,
  occupation_detail = EXCLUDED.occupation_detail,
  annual_income = EXCLUDED.annual_income,
  company_name = EXCLUDED.company_name,
  city = EXCLUDED.city,
  district = EXCLUDED.district,
  about_me = EXCLUDED.about_me,
  family_type = EXCLUDED.family_type,
  family_status = EXCLUDED.family_status,
  father_occupation = EXCLUDED.father_occupation,
  mother_occupation = EXCLUDED.mother_occupation,
  is_verified = EXCLUDED.is_verified,
  is_premium = EXCLUDED.is_premium,
  is_profile_complete = EXCLUDED.is_profile_complete,
  profile_completion_percent = EXCLUDED.profile_completion_percent,
  last_active_at = EXCLUDED.last_active_at;
INSERT INTO public.profiles (id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, father_occupation, mother_occupation, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at)
VALUES ('00000000-0000-4000-a000-00000000002f', 'TM000047', 'Praveen Sundaram', 'male', '2002-09-21', 187, 'never_married', 'Hindu', 'Nadar', 'Nadar subcaste', 'no', 'M.Sc', 'M.Sc Graduate', 'Dentist', 'Dentist Details', '₹10 Lakhs - ₹15 Lakhs', 'HCL', 'Coimbatore', 'Coimbatore', 'Hi, I am Praveen. I have completed my M.Sc and am currently working as a Dentist at HCL in Coimbatore. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'joint', 'upper_middle_class', 'Retired Employee', 'Homemaker', true, true, true, 100, NOW() - INTERVAL '2 days')
ON CONFLICT (id) DO UPDATE SET
  profile_id = EXCLUDED.profile_id,
  display_name = EXCLUDED.display_name,
  gender = EXCLUDED.gender,
  date_of_birth = EXCLUDED.date_of_birth,
  height_cm = EXCLUDED.height_cm,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  subcaste = EXCLUDED.subcaste,
  dosham = EXCLUDED.dosham,
  education = EXCLUDED.education,
  education_detail = EXCLUDED.education_detail,
  occupation = EXCLUDED.occupation,
  occupation_detail = EXCLUDED.occupation_detail,
  annual_income = EXCLUDED.annual_income,
  company_name = EXCLUDED.company_name,
  city = EXCLUDED.city,
  district = EXCLUDED.district,
  about_me = EXCLUDED.about_me,
  family_type = EXCLUDED.family_type,
  family_status = EXCLUDED.family_status,
  father_occupation = EXCLUDED.father_occupation,
  mother_occupation = EXCLUDED.mother_occupation,
  is_verified = EXCLUDED.is_verified,
  is_premium = EXCLUDED.is_premium,
  is_profile_complete = EXCLUDED.is_profile_complete,
  profile_completion_percent = EXCLUDED.profile_completion_percent,
  last_active_at = EXCLUDED.last_active_at;
INSERT INTO public.profiles (id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, father_occupation, mother_occupation, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at)
VALUES ('00000000-0000-4000-a000-000000000030', 'TM000048', 'Oviya Balan', 'female', '1992-08-07', 165, 'divorced', 'Hindu', 'Arunthathiyar', NULL, 'no', 'M.C.A', 'M.C.A Graduate', 'Bank Manager', 'Bank Manager Details', '₹20 Lakhs+', 'Infosys', 'Tiruchirappalli', 'Trichy', 'Hi, I am Oviya. I have completed my M.C.A and am currently working as a Bank Manager at Infosys in Tiruchirappalli. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'joint', 'upper_middle_class', 'Retired Employee', 'Homemaker', true, true, true, 100, NOW() - INTERVAL '8 days')
ON CONFLICT (id) DO UPDATE SET
  profile_id = EXCLUDED.profile_id,
  display_name = EXCLUDED.display_name,
  gender = EXCLUDED.gender,
  date_of_birth = EXCLUDED.date_of_birth,
  height_cm = EXCLUDED.height_cm,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  subcaste = EXCLUDED.subcaste,
  dosham = EXCLUDED.dosham,
  education = EXCLUDED.education,
  education_detail = EXCLUDED.education_detail,
  occupation = EXCLUDED.occupation,
  occupation_detail = EXCLUDED.occupation_detail,
  annual_income = EXCLUDED.annual_income,
  company_name = EXCLUDED.company_name,
  city = EXCLUDED.city,
  district = EXCLUDED.district,
  about_me = EXCLUDED.about_me,
  family_type = EXCLUDED.family_type,
  family_status = EXCLUDED.family_status,
  father_occupation = EXCLUDED.father_occupation,
  mother_occupation = EXCLUDED.mother_occupation,
  is_verified = EXCLUDED.is_verified,
  is_premium = EXCLUDED.is_premium,
  is_profile_complete = EXCLUDED.is_profile_complete,
  profile_completion_percent = EXCLUDED.profile_completion_percent,
  last_active_at = EXCLUDED.last_active_at;
INSERT INTO public.profiles (id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, father_occupation, mother_occupation, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at)
VALUES ('00000000-0000-4000-a000-000000000031', 'TM000049', 'Ramakrishnan Nathan', 'male', '2001-10-10', 179, 'never_married', 'Muslim', 'Marakayar', 'Marakayar subcaste', 'no', 'B.A', 'B.A Graduate', 'Business Owner', 'Business Owner Details', '₹5 Lakhs - ₹7 Lakhs', 'Wipro', 'Erode', 'Erode', 'Hi, I am Ramakrishnan. I have completed my B.A and am currently working as a Business Owner at Wipro in Erode. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'joint', 'upper_middle_class', 'Retired Employee', 'Homemaker', true, true, true, 100, NOW() - INTERVAL '9 days')
ON CONFLICT (id) DO UPDATE SET
  profile_id = EXCLUDED.profile_id,
  display_name = EXCLUDED.display_name,
  gender = EXCLUDED.gender,
  date_of_birth = EXCLUDED.date_of_birth,
  height_cm = EXCLUDED.height_cm,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  subcaste = EXCLUDED.subcaste,
  dosham = EXCLUDED.dosham,
  education = EXCLUDED.education,
  education_detail = EXCLUDED.education_detail,
  occupation = EXCLUDED.occupation,
  occupation_detail = EXCLUDED.occupation_detail,
  annual_income = EXCLUDED.annual_income,
  company_name = EXCLUDED.company_name,
  city = EXCLUDED.city,
  district = EXCLUDED.district,
  about_me = EXCLUDED.about_me,
  family_type = EXCLUDED.family_type,
  family_status = EXCLUDED.family_status,
  father_occupation = EXCLUDED.father_occupation,
  mother_occupation = EXCLUDED.mother_occupation,
  is_verified = EXCLUDED.is_verified,
  is_premium = EXCLUDED.is_premium,
  is_profile_complete = EXCLUDED.is_profile_complete,
  profile_completion_percent = EXCLUDED.profile_completion_percent,
  last_active_at = EXCLUDED.last_active_at;
INSERT INTO public.profiles (id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, father_occupation, mother_occupation, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at)
VALUES ('00000000-0000-4000-a000-000000000032', 'TM000050', 'Sneha Kumar', 'female', '2000-01-06', 160, 'never_married', 'Muslim', 'Labbai', NULL, 'no', 'Ph.D', 'Ph.D Graduate', 'Bank Manager', 'Bank Manager Details', '₹5 Lakhs - ₹7 Lakhs', 'Accenture', 'Thoothukudi', 'Tuticorin', 'Hi, I am Sneha. I have completed my Ph.D and am currently working as a Bank Manager at Accenture in Thoothukudi. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'upper_middle_class', 'Retired Employee', 'Homemaker', true, false, true, 100, NOW() - INTERVAL '4 days')
ON CONFLICT (id) DO UPDATE SET
  profile_id = EXCLUDED.profile_id,
  display_name = EXCLUDED.display_name,
  gender = EXCLUDED.gender,
  date_of_birth = EXCLUDED.date_of_birth,
  height_cm = EXCLUDED.height_cm,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  subcaste = EXCLUDED.subcaste,
  dosham = EXCLUDED.dosham,
  education = EXCLUDED.education,
  education_detail = EXCLUDED.education_detail,
  occupation = EXCLUDED.occupation,
  occupation_detail = EXCLUDED.occupation_detail,
  annual_income = EXCLUDED.annual_income,
  company_name = EXCLUDED.company_name,
  city = EXCLUDED.city,
  district = EXCLUDED.district,
  about_me = EXCLUDED.about_me,
  family_type = EXCLUDED.family_type,
  family_status = EXCLUDED.family_status,
  father_occupation = EXCLUDED.father_occupation,
  mother_occupation = EXCLUDED.mother_occupation,
  is_verified = EXCLUDED.is_verified,
  is_premium = EXCLUDED.is_premium,
  is_profile_complete = EXCLUDED.is_profile_complete,
  profile_completion_percent = EXCLUDED.profile_completion_percent,
  last_active_at = EXCLUDED.last_active_at;
INSERT INTO public.profiles (id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, father_occupation, mother_occupation, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at)
VALUES ('00000000-0000-4000-a000-000000000033', 'TM000051', 'Rajesh Raman', 'male', '1989-06-21', 186, 'divorced', 'Muslim', 'Rawther', 'Rawther subcaste', 'no', 'B.E. / B.Tech', 'B.E. / B.Tech Graduate', 'Bank Manager', 'Bank Manager Details', '₹5 Lakhs - ₹7 Lakhs', 'Accenture', 'Salem', 'Salem', 'Hi, I am Rajesh. I have completed my B.E. / B.Tech and am currently working as a Bank Manager at Accenture in Salem. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'upper_middle_class', 'Retired Employee', 'Homemaker', true, false, true, 100, NOW() - INTERVAL '2 days')
ON CONFLICT (id) DO UPDATE SET
  profile_id = EXCLUDED.profile_id,
  display_name = EXCLUDED.display_name,
  gender = EXCLUDED.gender,
  date_of_birth = EXCLUDED.date_of_birth,
  height_cm = EXCLUDED.height_cm,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  subcaste = EXCLUDED.subcaste,
  dosham = EXCLUDED.dosham,
  education = EXCLUDED.education,
  education_detail = EXCLUDED.education_detail,
  occupation = EXCLUDED.occupation,
  occupation_detail = EXCLUDED.occupation_detail,
  annual_income = EXCLUDED.annual_income,
  company_name = EXCLUDED.company_name,
  city = EXCLUDED.city,
  district = EXCLUDED.district,
  about_me = EXCLUDED.about_me,
  family_type = EXCLUDED.family_type,
  family_status = EXCLUDED.family_status,
  father_occupation = EXCLUDED.father_occupation,
  mother_occupation = EXCLUDED.mother_occupation,
  is_verified = EXCLUDED.is_verified,
  is_premium = EXCLUDED.is_premium,
  is_profile_complete = EXCLUDED.is_profile_complete,
  profile_completion_percent = EXCLUDED.profile_completion_percent,
  last_active_at = EXCLUDED.last_active_at;
INSERT INTO public.profiles (id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, father_occupation, mother_occupation, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at)
VALUES ('00000000-0000-4000-a000-000000000034', 'TM000052', 'Vanitha Velan', 'female', '1996-12-06', 151, 'never_married', 'Hindu', 'Vanniyar', 'Vanniyar subcaste', 'no', 'Ph.D', 'Ph.D Graduate', 'Bank Manager', 'Bank Manager Details', '₹15 Lakhs - ₹20 Lakhs', 'Self Employed', 'Chennai', 'Chennai', 'Hi, I am Vanitha. I have completed my Ph.D and am currently working as a Bank Manager at Self Employed in Chennai. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'joint', 'upper_middle_class', 'Retired Employee', 'Homemaker', false, false, true, 100, NOW() - INTERVAL '7 days')
ON CONFLICT (id) DO UPDATE SET
  profile_id = EXCLUDED.profile_id,
  display_name = EXCLUDED.display_name,
  gender = EXCLUDED.gender,
  date_of_birth = EXCLUDED.date_of_birth,
  height_cm = EXCLUDED.height_cm,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  subcaste = EXCLUDED.subcaste,
  dosham = EXCLUDED.dosham,
  education = EXCLUDED.education,
  education_detail = EXCLUDED.education_detail,
  occupation = EXCLUDED.occupation,
  occupation_detail = EXCLUDED.occupation_detail,
  annual_income = EXCLUDED.annual_income,
  company_name = EXCLUDED.company_name,
  city = EXCLUDED.city,
  district = EXCLUDED.district,
  about_me = EXCLUDED.about_me,
  family_type = EXCLUDED.family_type,
  family_status = EXCLUDED.family_status,
  father_occupation = EXCLUDED.father_occupation,
  mother_occupation = EXCLUDED.mother_occupation,
  is_verified = EXCLUDED.is_verified,
  is_premium = EXCLUDED.is_premium,
  is_profile_complete = EXCLUDED.is_profile_complete,
  profile_completion_percent = EXCLUDED.profile_completion_percent,
  last_active_at = EXCLUDED.last_active_at;
INSERT INTO public.profiles (id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, father_occupation, mother_occupation, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at)
VALUES ('00000000-0000-4000-a000-000000000035', 'TM000053', 'Saravanan Moorthy', 'male', '1995-08-20', 181, 'never_married', 'Hindu', 'Adi Dravida', 'Adi Dravida subcaste', 'no', 'M.C.A', 'M.C.A Graduate', 'Mechanical Engineer', 'Mechanical Engineer Details', '₹10 Lakhs - ₹15 Lakhs', 'Self Employed', 'Coimbatore', 'Coimbatore', 'Hi, I am Saravanan. I have completed my M.C.A and am currently working as a Mechanical Engineer at Self Employed in Coimbatore. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'middle_class', 'Retired Employee', 'Homemaker', false, false, true, 100, NOW() - INTERVAL '4 days')
ON CONFLICT (id) DO UPDATE SET
  profile_id = EXCLUDED.profile_id,
  display_name = EXCLUDED.display_name,
  gender = EXCLUDED.gender,
  date_of_birth = EXCLUDED.date_of_birth,
  height_cm = EXCLUDED.height_cm,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  subcaste = EXCLUDED.subcaste,
  dosham = EXCLUDED.dosham,
  education = EXCLUDED.education,
  education_detail = EXCLUDED.education_detail,
  occupation = EXCLUDED.occupation,
  occupation_detail = EXCLUDED.occupation_detail,
  annual_income = EXCLUDED.annual_income,
  company_name = EXCLUDED.company_name,
  city = EXCLUDED.city,
  district = EXCLUDED.district,
  about_me = EXCLUDED.about_me,
  family_type = EXCLUDED.family_type,
  family_status = EXCLUDED.family_status,
  father_occupation = EXCLUDED.father_occupation,
  mother_occupation = EXCLUDED.mother_occupation,
  is_verified = EXCLUDED.is_verified,
  is_premium = EXCLUDED.is_premium,
  is_profile_complete = EXCLUDED.is_profile_complete,
  profile_completion_percent = EXCLUDED.profile_completion_percent,
  last_active_at = EXCLUDED.last_active_at;
INSERT INTO public.profiles (id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, father_occupation, mother_occupation, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at)
VALUES ('00000000-0000-4000-a000-000000000036', 'TM000054', 'Ponmani Devan', 'female', '2002-11-02', 159, 'never_married', 'Hindu', 'Chettiar', NULL, 'no', 'B.Ed', 'B.Ed Graduate', 'Advocate', 'Advocate Details', '₹10 Lakhs - ₹15 Lakhs', 'Self Employed', 'Chennai', 'Chennai', 'Hi, I am Ponmani. I have completed my B.Ed and am currently working as a Advocate at Self Employed in Chennai. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'middle_class', 'Retired Employee', 'Homemaker', true, true, true, 100, NOW() - INTERVAL '2 days')
ON CONFLICT (id) DO UPDATE SET
  profile_id = EXCLUDED.profile_id,
  display_name = EXCLUDED.display_name,
  gender = EXCLUDED.gender,
  date_of_birth = EXCLUDED.date_of_birth,
  height_cm = EXCLUDED.height_cm,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  subcaste = EXCLUDED.subcaste,
  dosham = EXCLUDED.dosham,
  education = EXCLUDED.education,
  education_detail = EXCLUDED.education_detail,
  occupation = EXCLUDED.occupation,
  occupation_detail = EXCLUDED.occupation_detail,
  annual_income = EXCLUDED.annual_income,
  company_name = EXCLUDED.company_name,
  city = EXCLUDED.city,
  district = EXCLUDED.district,
  about_me = EXCLUDED.about_me,
  family_type = EXCLUDED.family_type,
  family_status = EXCLUDED.family_status,
  father_occupation = EXCLUDED.father_occupation,
  mother_occupation = EXCLUDED.mother_occupation,
  is_verified = EXCLUDED.is_verified,
  is_premium = EXCLUDED.is_premium,
  is_profile_complete = EXCLUDED.is_profile_complete,
  profile_completion_percent = EXCLUDED.profile_completion_percent,
  last_active_at = EXCLUDED.last_active_at;
INSERT INTO public.profiles (id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, father_occupation, mother_occupation, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at)
VALUES ('00000000-0000-4000-a000-000000000037', 'TM000055', 'Mohan Mani', 'male', '2003-04-21', 169, 'never_married', 'Christian', 'RC Christian', NULL, 'no', 'M.B.A', 'M.B.A Graduate', 'School Teacher', 'School Teacher Details', '₹3 Lakhs - ₹5 Lakhs', 'Infosys', 'Tiruchirappalli', 'Trichy', 'Hi, I am Mohan. I have completed my M.B.A and am currently working as a School Teacher at Infosys in Tiruchirappalli. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'middle_class', 'Retired Employee', 'Homemaker', false, false, true, 100, NOW() - INTERVAL '6 days')
ON CONFLICT (id) DO UPDATE SET
  profile_id = EXCLUDED.profile_id,
  display_name = EXCLUDED.display_name,
  gender = EXCLUDED.gender,
  date_of_birth = EXCLUDED.date_of_birth,
  height_cm = EXCLUDED.height_cm,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  subcaste = EXCLUDED.subcaste,
  dosham = EXCLUDED.dosham,
  education = EXCLUDED.education,
  education_detail = EXCLUDED.education_detail,
  occupation = EXCLUDED.occupation,
  occupation_detail = EXCLUDED.occupation_detail,
  annual_income = EXCLUDED.annual_income,
  company_name = EXCLUDED.company_name,
  city = EXCLUDED.city,
  district = EXCLUDED.district,
  about_me = EXCLUDED.about_me,
  family_type = EXCLUDED.family_type,
  family_status = EXCLUDED.family_status,
  father_occupation = EXCLUDED.father_occupation,
  mother_occupation = EXCLUDED.mother_occupation,
  is_verified = EXCLUDED.is_verified,
  is_premium = EXCLUDED.is_premium,
  is_profile_complete = EXCLUDED.is_profile_complete,
  profile_completion_percent = EXCLUDED.profile_completion_percent,
  last_active_at = EXCLUDED.last_active_at;
INSERT INTO public.profiles (id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, father_occupation, mother_occupation, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at)
VALUES ('00000000-0000-4000-a000-000000000038', 'TM000056', 'Pooja Swamy', 'female', '1988-11-27', 165, 'never_married', 'Christian', 'RC Christian', NULL, 'yes', 'B.E. / B.Tech', 'B.E. / B.Tech Graduate', 'Business Owner', 'Business Owner Details', '₹20 Lakhs+', 'TCS', 'Tiruchirappalli', 'Trichy', 'Hi, I am Pooja. I have completed my B.E. / B.Tech and am currently working as a Business Owner at TCS in Tiruchirappalli. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'middle_class', 'Retired Employee', 'Homemaker', true, true, true, 100, NOW() - INTERVAL '0 days')
ON CONFLICT (id) DO UPDATE SET
  profile_id = EXCLUDED.profile_id,
  display_name = EXCLUDED.display_name,
  gender = EXCLUDED.gender,
  date_of_birth = EXCLUDED.date_of_birth,
  height_cm = EXCLUDED.height_cm,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  subcaste = EXCLUDED.subcaste,
  dosham = EXCLUDED.dosham,
  education = EXCLUDED.education,
  education_detail = EXCLUDED.education_detail,
  occupation = EXCLUDED.occupation,
  occupation_detail = EXCLUDED.occupation_detail,
  annual_income = EXCLUDED.annual_income,
  company_name = EXCLUDED.company_name,
  city = EXCLUDED.city,
  district = EXCLUDED.district,
  about_me = EXCLUDED.about_me,
  family_type = EXCLUDED.family_type,
  family_status = EXCLUDED.family_status,
  father_occupation = EXCLUDED.father_occupation,
  mother_occupation = EXCLUDED.mother_occupation,
  is_verified = EXCLUDED.is_verified,
  is_premium = EXCLUDED.is_premium,
  is_profile_complete = EXCLUDED.is_profile_complete,
  profile_completion_percent = EXCLUDED.profile_completion_percent,
  last_active_at = EXCLUDED.last_active_at;
INSERT INTO public.profiles (id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, father_occupation, mother_occupation, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at)
VALUES ('00000000-0000-4000-a000-000000000039', 'TM000057', 'Elango Selvan', 'male', '2005-03-23', 182, 'never_married', 'Hindu', 'Adi Dravida', NULL, 'no', 'M.B.B.S', 'M.B.B.S Graduate', 'School Teacher', 'School Teacher Details', '₹20 Lakhs+', 'Infosys', 'Tiruppur', 'Tiruppur', 'Hi, I am Elango. I have completed my M.B.B.S and am currently working as a School Teacher at Infosys in Tiruppur. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'upper_middle_class', 'Retired Employee', 'Homemaker', true, false, true, 100, NOW() - INTERVAL '3 days')
ON CONFLICT (id) DO UPDATE SET
  profile_id = EXCLUDED.profile_id,
  display_name = EXCLUDED.display_name,
  gender = EXCLUDED.gender,
  date_of_birth = EXCLUDED.date_of_birth,
  height_cm = EXCLUDED.height_cm,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  subcaste = EXCLUDED.subcaste,
  dosham = EXCLUDED.dosham,
  education = EXCLUDED.education,
  education_detail = EXCLUDED.education_detail,
  occupation = EXCLUDED.occupation,
  occupation_detail = EXCLUDED.occupation_detail,
  annual_income = EXCLUDED.annual_income,
  company_name = EXCLUDED.company_name,
  city = EXCLUDED.city,
  district = EXCLUDED.district,
  about_me = EXCLUDED.about_me,
  family_type = EXCLUDED.family_type,
  family_status = EXCLUDED.family_status,
  father_occupation = EXCLUDED.father_occupation,
  mother_occupation = EXCLUDED.mother_occupation,
  is_verified = EXCLUDED.is_verified,
  is_premium = EXCLUDED.is_premium,
  is_profile_complete = EXCLUDED.is_profile_complete,
  profile_completion_percent = EXCLUDED.profile_completion_percent,
  last_active_at = EXCLUDED.last_active_at;
INSERT INTO public.profiles (id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, father_occupation, mother_occupation, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at)
VALUES ('00000000-0000-4000-a000-00000000003a', 'TM000058', 'Uma Sundaram', 'female', '2003-09-21', 160, 'never_married', 'Hindu', 'Devendra Kula Vellalar', 'Devendra Kula Vellalar subcaste', 'yes', 'M.C.A', 'M.C.A Graduate', 'Architect', 'Architect Details', '₹5 Lakhs - ₹7 Lakhs', 'Accenture', 'Madurai', 'Madurai', 'Hi, I am Uma. I have completed my M.C.A and am currently working as a Architect at Accenture in Madurai. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'rich', 'Retired Employee', 'Homemaker', true, false, true, 100, NOW() - INTERVAL '9 days')
ON CONFLICT (id) DO UPDATE SET
  profile_id = EXCLUDED.profile_id,
  display_name = EXCLUDED.display_name,
  gender = EXCLUDED.gender,
  date_of_birth = EXCLUDED.date_of_birth,
  height_cm = EXCLUDED.height_cm,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  subcaste = EXCLUDED.subcaste,
  dosham = EXCLUDED.dosham,
  education = EXCLUDED.education,
  education_detail = EXCLUDED.education_detail,
  occupation = EXCLUDED.occupation,
  occupation_detail = EXCLUDED.occupation_detail,
  annual_income = EXCLUDED.annual_income,
  company_name = EXCLUDED.company_name,
  city = EXCLUDED.city,
  district = EXCLUDED.district,
  about_me = EXCLUDED.about_me,
  family_type = EXCLUDED.family_type,
  family_status = EXCLUDED.family_status,
  father_occupation = EXCLUDED.father_occupation,
  mother_occupation = EXCLUDED.mother_occupation,
  is_verified = EXCLUDED.is_verified,
  is_premium = EXCLUDED.is_premium,
  is_profile_complete = EXCLUDED.is_profile_complete,
  profile_completion_percent = EXCLUDED.profile_completion_percent,
  last_active_at = EXCLUDED.last_active_at;
INSERT INTO public.profiles (id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, father_occupation, mother_occupation, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at)
VALUES ('00000000-0000-4000-a000-00000000003b', 'TM000059', 'Siddharth Naicker', 'male', '2004-09-28', 179, 'never_married', 'Hindu', 'Naidu', NULL, 'no', 'B.Sc', 'B.Sc Graduate', 'Software Engineer', 'Software Engineer Details', '₹15 Lakhs - ₹20 Lakhs', 'Cognizant', 'Tirunelveli', 'Tirunelveli', 'Hi, I am Siddharth. I have completed my B.Sc and am currently working as a Software Engineer at Cognizant in Tirunelveli. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'middle_class', 'Retired Employee', 'Homemaker', true, false, true, 100, NOW() - INTERVAL '2 days')
ON CONFLICT (id) DO UPDATE SET
  profile_id = EXCLUDED.profile_id,
  display_name = EXCLUDED.display_name,
  gender = EXCLUDED.gender,
  date_of_birth = EXCLUDED.date_of_birth,
  height_cm = EXCLUDED.height_cm,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  subcaste = EXCLUDED.subcaste,
  dosham = EXCLUDED.dosham,
  education = EXCLUDED.education,
  education_detail = EXCLUDED.education_detail,
  occupation = EXCLUDED.occupation,
  occupation_detail = EXCLUDED.occupation_detail,
  annual_income = EXCLUDED.annual_income,
  company_name = EXCLUDED.company_name,
  city = EXCLUDED.city,
  district = EXCLUDED.district,
  about_me = EXCLUDED.about_me,
  family_type = EXCLUDED.family_type,
  family_status = EXCLUDED.family_status,
  father_occupation = EXCLUDED.father_occupation,
  mother_occupation = EXCLUDED.mother_occupation,
  is_verified = EXCLUDED.is_verified,
  is_premium = EXCLUDED.is_premium,
  is_profile_complete = EXCLUDED.is_profile_complete,
  profile_completion_percent = EXCLUDED.profile_completion_percent,
  last_active_at = EXCLUDED.last_active_at;
INSERT INTO public.profiles (id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, father_occupation, mother_occupation, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at)
VALUES ('00000000-0000-4000-a000-00000000003c', 'TM000060', 'Ramya Naicker', 'female', '1995-07-07', 154, 'divorced', 'Hindu', 'Vishwakarma', 'Vishwakarma subcaste', 'no', 'M.B.B.S', 'M.B.B.S Graduate', 'Auditor', 'Auditor Details', '₹7 Lakhs - ₹10 Lakhs', 'Accenture', 'Erode', 'Erode', 'Hi, I am Ramya. I have completed my M.B.B.S and am currently working as a Auditor at Accenture in Erode. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'joint', 'upper_middle_class', 'Retired Employee', 'Homemaker', true, false, true, 100, NOW() - INTERVAL '5 days')
ON CONFLICT (id) DO UPDATE SET
  profile_id = EXCLUDED.profile_id,
  display_name = EXCLUDED.display_name,
  gender = EXCLUDED.gender,
  date_of_birth = EXCLUDED.date_of_birth,
  height_cm = EXCLUDED.height_cm,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  subcaste = EXCLUDED.subcaste,
  dosham = EXCLUDED.dosham,
  education = EXCLUDED.education,
  education_detail = EXCLUDED.education_detail,
  occupation = EXCLUDED.occupation,
  occupation_detail = EXCLUDED.occupation_detail,
  annual_income = EXCLUDED.annual_income,
  company_name = EXCLUDED.company_name,
  city = EXCLUDED.city,
  district = EXCLUDED.district,
  about_me = EXCLUDED.about_me,
  family_type = EXCLUDED.family_type,
  family_status = EXCLUDED.family_status,
  father_occupation = EXCLUDED.father_occupation,
  mother_occupation = EXCLUDED.mother_occupation,
  is_verified = EXCLUDED.is_verified,
  is_premium = EXCLUDED.is_premium,
  is_profile_complete = EXCLUDED.is_profile_complete,
  profile_completion_percent = EXCLUDED.profile_completion_percent,
  last_active_at = EXCLUDED.last_active_at;
INSERT INTO public.profiles (id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, father_occupation, mother_occupation, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at)
VALUES ('00000000-0000-4000-a000-00000000003d', 'TM000061', 'Hari Devan', 'male', '1996-05-24', 182, 'never_married', 'Hindu', 'Yadav', NULL, 'no', 'M.Sc', 'M.Sc Graduate', 'Software Engineer', 'Software Engineer Details', '₹20 Lakhs+', 'Private Practice', 'Thanjavur', 'Thanjavur', 'Hi, I am Hari. I have completed my M.Sc and am currently working as a Software Engineer at Private Practice in Thanjavur. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'upper_middle_class', 'Retired Employee', 'Homemaker', true, false, true, 100, NOW() - INTERVAL '7 days')
ON CONFLICT (id) DO UPDATE SET
  profile_id = EXCLUDED.profile_id,
  display_name = EXCLUDED.display_name,
  gender = EXCLUDED.gender,
  date_of_birth = EXCLUDED.date_of_birth,
  height_cm = EXCLUDED.height_cm,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  subcaste = EXCLUDED.subcaste,
  dosham = EXCLUDED.dosham,
  education = EXCLUDED.education,
  education_detail = EXCLUDED.education_detail,
  occupation = EXCLUDED.occupation,
  occupation_detail = EXCLUDED.occupation_detail,
  annual_income = EXCLUDED.annual_income,
  company_name = EXCLUDED.company_name,
  city = EXCLUDED.city,
  district = EXCLUDED.district,
  about_me = EXCLUDED.about_me,
  family_type = EXCLUDED.family_type,
  family_status = EXCLUDED.family_status,
  father_occupation = EXCLUDED.father_occupation,
  mother_occupation = EXCLUDED.mother_occupation,
  is_verified = EXCLUDED.is_verified,
  is_premium = EXCLUDED.is_premium,
  is_profile_complete = EXCLUDED.is_profile_complete,
  profile_completion_percent = EXCLUDED.profile_completion_percent,
  last_active_at = EXCLUDED.last_active_at;
INSERT INTO public.profiles (id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, father_occupation, mother_occupation, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at)
VALUES ('00000000-0000-4000-a000-00000000003e', 'TM000062', 'Ramya Murthy', 'female', '2002-04-16', 168, 'never_married', 'Hindu', 'Kallar', NULL, 'yes', 'M.C.A', 'M.C.A Graduate', 'College Professor', 'College Professor Details', '₹15 Lakhs - ₹20 Lakhs', 'Zoho', 'Vellore', 'Vellore', 'Hi, I am Ramya. I have completed my M.C.A and am currently working as a College Professor at Zoho in Vellore. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'upper_middle_class', 'Retired Employee', 'Homemaker', true, false, true, 100, NOW() - INTERVAL '6 days')
ON CONFLICT (id) DO UPDATE SET
  profile_id = EXCLUDED.profile_id,
  display_name = EXCLUDED.display_name,
  gender = EXCLUDED.gender,
  date_of_birth = EXCLUDED.date_of_birth,
  height_cm = EXCLUDED.height_cm,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  subcaste = EXCLUDED.subcaste,
  dosham = EXCLUDED.dosham,
  education = EXCLUDED.education,
  education_detail = EXCLUDED.education_detail,
  occupation = EXCLUDED.occupation,
  occupation_detail = EXCLUDED.occupation_detail,
  annual_income = EXCLUDED.annual_income,
  company_name = EXCLUDED.company_name,
  city = EXCLUDED.city,
  district = EXCLUDED.district,
  about_me = EXCLUDED.about_me,
  family_type = EXCLUDED.family_type,
  family_status = EXCLUDED.family_status,
  father_occupation = EXCLUDED.father_occupation,
  mother_occupation = EXCLUDED.mother_occupation,
  is_verified = EXCLUDED.is_verified,
  is_premium = EXCLUDED.is_premium,
  is_profile_complete = EXCLUDED.is_profile_complete,
  profile_completion_percent = EXCLUDED.profile_completion_percent,
  last_active_at = EXCLUDED.last_active_at;
INSERT INTO public.profiles (id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, father_occupation, mother_occupation, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at)
VALUES ('00000000-0000-4000-a000-00000000003f', 'TM000063', 'Vignesh Sundaram', 'male', '2004-12-26', 166, 'never_married', 'Hindu', 'Devendra Kula Vellalar', 'Devendra Kula Vellalar subcaste', 'no', 'B.Com', 'B.Com Graduate', 'College Professor', 'College Professor Details', '₹5 Lakhs - ₹7 Lakhs', 'Wipro', 'Salem', 'Salem', 'Hi, I am Vignesh. I have completed my B.Com and am currently working as a College Professor at Wipro in Salem. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'rich', 'Retired Employee', 'Homemaker', true, false, true, 100, NOW() - INTERVAL '4 days')
ON CONFLICT (id) DO UPDATE SET
  profile_id = EXCLUDED.profile_id,
  display_name = EXCLUDED.display_name,
  gender = EXCLUDED.gender,
  date_of_birth = EXCLUDED.date_of_birth,
  height_cm = EXCLUDED.height_cm,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  subcaste = EXCLUDED.subcaste,
  dosham = EXCLUDED.dosham,
  education = EXCLUDED.education,
  education_detail = EXCLUDED.education_detail,
  occupation = EXCLUDED.occupation,
  occupation_detail = EXCLUDED.occupation_detail,
  annual_income = EXCLUDED.annual_income,
  company_name = EXCLUDED.company_name,
  city = EXCLUDED.city,
  district = EXCLUDED.district,
  about_me = EXCLUDED.about_me,
  family_type = EXCLUDED.family_type,
  family_status = EXCLUDED.family_status,
  father_occupation = EXCLUDED.father_occupation,
  mother_occupation = EXCLUDED.mother_occupation,
  is_verified = EXCLUDED.is_verified,
  is_premium = EXCLUDED.is_premium,
  is_profile_complete = EXCLUDED.is_profile_complete,
  profile_completion_percent = EXCLUDED.profile_completion_percent,
  last_active_at = EXCLUDED.last_active_at;
INSERT INTO public.profiles (id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, father_occupation, mother_occupation, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at)
VALUES ('00000000-0000-4000-a000-000000000040', 'TM000064', 'Pooja Sundaram', 'female', '1998-09-16', 161, 'divorced', 'Hindu', 'Kallar', 'Kallar subcaste', 'no', 'Ph.D', 'Ph.D Graduate', 'Mechanical Engineer', 'Mechanical Engineer Details', '₹10 Lakhs - ₹15 Lakhs', 'TCS', 'Tirunelveli', 'Tirunelveli', 'Hi, I am Pooja. I have completed my Ph.D and am currently working as a Mechanical Engineer at TCS in Tirunelveli. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'joint', 'rich', 'Retired Employee', 'Homemaker', true, false, true, 100, NOW() - INTERVAL '5 days')
ON CONFLICT (id) DO UPDATE SET
  profile_id = EXCLUDED.profile_id,
  display_name = EXCLUDED.display_name,
  gender = EXCLUDED.gender,
  date_of_birth = EXCLUDED.date_of_birth,
  height_cm = EXCLUDED.height_cm,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  subcaste = EXCLUDED.subcaste,
  dosham = EXCLUDED.dosham,
  education = EXCLUDED.education,
  education_detail = EXCLUDED.education_detail,
  occupation = EXCLUDED.occupation,
  occupation_detail = EXCLUDED.occupation_detail,
  annual_income = EXCLUDED.annual_income,
  company_name = EXCLUDED.company_name,
  city = EXCLUDED.city,
  district = EXCLUDED.district,
  about_me = EXCLUDED.about_me,
  family_type = EXCLUDED.family_type,
  family_status = EXCLUDED.family_status,
  father_occupation = EXCLUDED.father_occupation,
  mother_occupation = EXCLUDED.mother_occupation,
  is_verified = EXCLUDED.is_verified,
  is_premium = EXCLUDED.is_premium,
  is_profile_complete = EXCLUDED.is_profile_complete,
  profile_completion_percent = EXCLUDED.profile_completion_percent,
  last_active_at = EXCLUDED.last_active_at;
INSERT INTO public.profiles (id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, father_occupation, mother_occupation, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at)
VALUES ('00000000-0000-4000-a000-000000000041', 'TM000065', 'Selvam Krishnan', 'male', '1994-03-14', 171, 'never_married', 'Hindu', 'Nadar', 'Nadar subcaste', 'no', 'M.B.A', 'M.B.A Graduate', 'Civil Engineer', 'Civil Engineer Details', '₹15 Lakhs - ₹20 Lakhs', 'Cognizant', 'Tiruchirappalli', 'Trichy', 'Hi, I am Selvam. I have completed my M.B.A and am currently working as a Civil Engineer at Cognizant in Tiruchirappalli. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'upper_middle_class', 'Retired Employee', 'Homemaker', true, false, true, 100, NOW() - INTERVAL '9 days')
ON CONFLICT (id) DO UPDATE SET
  profile_id = EXCLUDED.profile_id,
  display_name = EXCLUDED.display_name,
  gender = EXCLUDED.gender,
  date_of_birth = EXCLUDED.date_of_birth,
  height_cm = EXCLUDED.height_cm,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  subcaste = EXCLUDED.subcaste,
  dosham = EXCLUDED.dosham,
  education = EXCLUDED.education,
  education_detail = EXCLUDED.education_detail,
  occupation = EXCLUDED.occupation,
  occupation_detail = EXCLUDED.occupation_detail,
  annual_income = EXCLUDED.annual_income,
  company_name = EXCLUDED.company_name,
  city = EXCLUDED.city,
  district = EXCLUDED.district,
  about_me = EXCLUDED.about_me,
  family_type = EXCLUDED.family_type,
  family_status = EXCLUDED.family_status,
  father_occupation = EXCLUDED.father_occupation,
  mother_occupation = EXCLUDED.mother_occupation,
  is_verified = EXCLUDED.is_verified,
  is_premium = EXCLUDED.is_premium,
  is_profile_complete = EXCLUDED.is_profile_complete,
  profile_completion_percent = EXCLUDED.profile_completion_percent,
  last_active_at = EXCLUDED.last_active_at;
INSERT INTO public.profiles (id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, father_occupation, mother_occupation, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at)
VALUES ('00000000-0000-4000-a000-000000000042', 'TM000066', 'Malarvizhi Mani', 'female', '1991-09-09', 158, 'never_married', 'Hindu', 'Vishwakarma', 'Vishwakarma subcaste', 'no', 'Ph.D', 'Ph.D Graduate', 'Government Officer', 'Government Officer Details', '₹5 Lakhs - ₹7 Lakhs', 'Infosys', 'Coimbatore', 'Coimbatore', 'Hi, I am Malarvizhi. I have completed my Ph.D and am currently working as a Government Officer at Infosys in Coimbatore. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'rich', 'Retired Employee', 'Homemaker', false, false, true, 100, NOW() - INTERVAL '3 days')
ON CONFLICT (id) DO UPDATE SET
  profile_id = EXCLUDED.profile_id,
  display_name = EXCLUDED.display_name,
  gender = EXCLUDED.gender,
  date_of_birth = EXCLUDED.date_of_birth,
  height_cm = EXCLUDED.height_cm,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  subcaste = EXCLUDED.subcaste,
  dosham = EXCLUDED.dosham,
  education = EXCLUDED.education,
  education_detail = EXCLUDED.education_detail,
  occupation = EXCLUDED.occupation,
  occupation_detail = EXCLUDED.occupation_detail,
  annual_income = EXCLUDED.annual_income,
  company_name = EXCLUDED.company_name,
  city = EXCLUDED.city,
  district = EXCLUDED.district,
  about_me = EXCLUDED.about_me,
  family_type = EXCLUDED.family_type,
  family_status = EXCLUDED.family_status,
  father_occupation = EXCLUDED.father_occupation,
  mother_occupation = EXCLUDED.mother_occupation,
  is_verified = EXCLUDED.is_verified,
  is_premium = EXCLUDED.is_premium,
  is_profile_complete = EXCLUDED.is_profile_complete,
  profile_completion_percent = EXCLUDED.profile_completion_percent,
  last_active_at = EXCLUDED.last_active_at;
INSERT INTO public.profiles (id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, father_occupation, mother_occupation, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at)
VALUES ('00000000-0000-4000-a000-000000000043', 'TM000067', 'Anbarasan Nathan', 'male', '1990-11-06', 173, 'never_married', 'Hindu', 'Nadar', NULL, 'yes', 'M.C.A', 'M.C.A Graduate', 'Mechanical Engineer', 'Mechanical Engineer Details', '₹20 Lakhs+', 'Infosys', 'Kanchipuram', 'Kanchipuram', 'Hi, I am Anbarasan. I have completed my M.C.A and am currently working as a Mechanical Engineer at Infosys in Kanchipuram. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'joint', 'rich', 'Retired Employee', 'Homemaker', true, false, true, 100, NOW() - INTERVAL '10 days')
ON CONFLICT (id) DO UPDATE SET
  profile_id = EXCLUDED.profile_id,
  display_name = EXCLUDED.display_name,
  gender = EXCLUDED.gender,
  date_of_birth = EXCLUDED.date_of_birth,
  height_cm = EXCLUDED.height_cm,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  subcaste = EXCLUDED.subcaste,
  dosham = EXCLUDED.dosham,
  education = EXCLUDED.education,
  education_detail = EXCLUDED.education_detail,
  occupation = EXCLUDED.occupation,
  occupation_detail = EXCLUDED.occupation_detail,
  annual_income = EXCLUDED.annual_income,
  company_name = EXCLUDED.company_name,
  city = EXCLUDED.city,
  district = EXCLUDED.district,
  about_me = EXCLUDED.about_me,
  family_type = EXCLUDED.family_type,
  family_status = EXCLUDED.family_status,
  father_occupation = EXCLUDED.father_occupation,
  mother_occupation = EXCLUDED.mother_occupation,
  is_verified = EXCLUDED.is_verified,
  is_premium = EXCLUDED.is_premium,
  is_profile_complete = EXCLUDED.is_profile_complete,
  profile_completion_percent = EXCLUDED.profile_completion_percent,
  last_active_at = EXCLUDED.last_active_at;
INSERT INTO public.profiles (id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, father_occupation, mother_occupation, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at)
VALUES ('00000000-0000-4000-a000-000000000044', 'TM000068', 'Abirami Nathan', 'female', '2003-09-18', 162, 'divorced', 'Hindu', 'Vellalar', 'Vellalar subcaste', 'yes', 'B.Com', 'B.Com Graduate', 'Business Owner', 'Business Owner Details', '₹3 Lakhs - ₹5 Lakhs', 'Self Employed', 'Chennai', 'Chennai', 'Hi, I am Abirami. I have completed my B.Com and am currently working as a Business Owner at Self Employed in Chennai. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'upper_middle_class', 'Retired Employee', 'Homemaker', true, false, true, 100, NOW() - INTERVAL '10 days')
ON CONFLICT (id) DO UPDATE SET
  profile_id = EXCLUDED.profile_id,
  display_name = EXCLUDED.display_name,
  gender = EXCLUDED.gender,
  date_of_birth = EXCLUDED.date_of_birth,
  height_cm = EXCLUDED.height_cm,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  subcaste = EXCLUDED.subcaste,
  dosham = EXCLUDED.dosham,
  education = EXCLUDED.education,
  education_detail = EXCLUDED.education_detail,
  occupation = EXCLUDED.occupation,
  occupation_detail = EXCLUDED.occupation_detail,
  annual_income = EXCLUDED.annual_income,
  company_name = EXCLUDED.company_name,
  city = EXCLUDED.city,
  district = EXCLUDED.district,
  about_me = EXCLUDED.about_me,
  family_type = EXCLUDED.family_type,
  family_status = EXCLUDED.family_status,
  father_occupation = EXCLUDED.father_occupation,
  mother_occupation = EXCLUDED.mother_occupation,
  is_verified = EXCLUDED.is_verified,
  is_premium = EXCLUDED.is_premium,
  is_profile_complete = EXCLUDED.is_profile_complete,
  profile_completion_percent = EXCLUDED.profile_completion_percent,
  last_active_at = EXCLUDED.last_active_at;
INSERT INTO public.profiles (id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, father_occupation, mother_occupation, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at)
VALUES ('00000000-0000-4000-a000-000000000045', 'TM000069', 'Karthik Mani', 'male', '1995-06-26', 167, 'never_married', 'Hindu', 'Naicker', 'Naicker subcaste', 'yes', 'M.Sc', 'M.Sc Graduate', 'Bank Manager', 'Bank Manager Details', '₹7 Lakhs - ₹10 Lakhs', 'HCL', 'Erode', 'Erode', 'Hi, I am Karthik. I have completed my M.Sc and am currently working as a Bank Manager at HCL in Erode. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'rich', 'Retired Employee', 'Homemaker', false, true, true, 100, NOW() - INTERVAL '5 days')
ON CONFLICT (id) DO UPDATE SET
  profile_id = EXCLUDED.profile_id,
  display_name = EXCLUDED.display_name,
  gender = EXCLUDED.gender,
  date_of_birth = EXCLUDED.date_of_birth,
  height_cm = EXCLUDED.height_cm,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  subcaste = EXCLUDED.subcaste,
  dosham = EXCLUDED.dosham,
  education = EXCLUDED.education,
  education_detail = EXCLUDED.education_detail,
  occupation = EXCLUDED.occupation,
  occupation_detail = EXCLUDED.occupation_detail,
  annual_income = EXCLUDED.annual_income,
  company_name = EXCLUDED.company_name,
  city = EXCLUDED.city,
  district = EXCLUDED.district,
  about_me = EXCLUDED.about_me,
  family_type = EXCLUDED.family_type,
  family_status = EXCLUDED.family_status,
  father_occupation = EXCLUDED.father_occupation,
  mother_occupation = EXCLUDED.mother_occupation,
  is_verified = EXCLUDED.is_verified,
  is_premium = EXCLUDED.is_premium,
  is_profile_complete = EXCLUDED.is_profile_complete,
  profile_completion_percent = EXCLUDED.profile_completion_percent,
  last_active_at = EXCLUDED.last_active_at;
INSERT INTO public.profiles (id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, father_occupation, mother_occupation, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at)
VALUES ('00000000-0000-4000-a000-000000000046', 'TM000070', 'Gowri Raj', 'female', '1988-07-07', 169, 'never_married', 'Hindu', 'Arunthathiyar', 'Arunthathiyar subcaste', 'no', 'B.Sc', 'B.Sc Graduate', 'Mechanical Engineer', 'Mechanical Engineer Details', '₹15 Lakhs - ₹20 Lakhs', 'Wipro', 'Tiruppur', 'Tiruppur', 'Hi, I am Gowri. I have completed my B.Sc and am currently working as a Mechanical Engineer at Wipro in Tiruppur. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'middle_class', 'Retired Employee', 'Homemaker', true, false, true, 100, NOW() - INTERVAL '2 days')
ON CONFLICT (id) DO UPDATE SET
  profile_id = EXCLUDED.profile_id,
  display_name = EXCLUDED.display_name,
  gender = EXCLUDED.gender,
  date_of_birth = EXCLUDED.date_of_birth,
  height_cm = EXCLUDED.height_cm,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  subcaste = EXCLUDED.subcaste,
  dosham = EXCLUDED.dosham,
  education = EXCLUDED.education,
  education_detail = EXCLUDED.education_detail,
  occupation = EXCLUDED.occupation,
  occupation_detail = EXCLUDED.occupation_detail,
  annual_income = EXCLUDED.annual_income,
  company_name = EXCLUDED.company_name,
  city = EXCLUDED.city,
  district = EXCLUDED.district,
  about_me = EXCLUDED.about_me,
  family_type = EXCLUDED.family_type,
  family_status = EXCLUDED.family_status,
  father_occupation = EXCLUDED.father_occupation,
  mother_occupation = EXCLUDED.mother_occupation,
  is_verified = EXCLUDED.is_verified,
  is_premium = EXCLUDED.is_premium,
  is_profile_complete = EXCLUDED.is_profile_complete,
  profile_completion_percent = EXCLUDED.profile_completion_percent,
  last_active_at = EXCLUDED.last_active_at;
INSERT INTO public.profiles (id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, father_occupation, mother_occupation, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at)
VALUES ('00000000-0000-4000-a000-000000000047', 'TM000071', 'Vijay Devan', 'male', '2001-09-17', 169, 'never_married', 'Hindu', 'Vishwakarma', 'Vishwakarma subcaste', 'no', 'B.E. / B.Tech', 'B.E. / B.Tech Graduate', 'Government Officer', 'Government Officer Details', '₹15 Lakhs - ₹20 Lakhs', 'Wipro', 'Thoothukudi', 'Tuticorin', 'Hi, I am Vijay. I have completed my B.E. / B.Tech and am currently working as a Government Officer at Wipro in Thoothukudi. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'upper_middle_class', 'Retired Employee', 'Homemaker', true, false, true, 100, NOW() - INTERVAL '0 days')
ON CONFLICT (id) DO UPDATE SET
  profile_id = EXCLUDED.profile_id,
  display_name = EXCLUDED.display_name,
  gender = EXCLUDED.gender,
  date_of_birth = EXCLUDED.date_of_birth,
  height_cm = EXCLUDED.height_cm,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  subcaste = EXCLUDED.subcaste,
  dosham = EXCLUDED.dosham,
  education = EXCLUDED.education,
  education_detail = EXCLUDED.education_detail,
  occupation = EXCLUDED.occupation,
  occupation_detail = EXCLUDED.occupation_detail,
  annual_income = EXCLUDED.annual_income,
  company_name = EXCLUDED.company_name,
  city = EXCLUDED.city,
  district = EXCLUDED.district,
  about_me = EXCLUDED.about_me,
  family_type = EXCLUDED.family_type,
  family_status = EXCLUDED.family_status,
  father_occupation = EXCLUDED.father_occupation,
  mother_occupation = EXCLUDED.mother_occupation,
  is_verified = EXCLUDED.is_verified,
  is_premium = EXCLUDED.is_premium,
  is_profile_complete = EXCLUDED.is_profile_complete,
  profile_completion_percent = EXCLUDED.profile_completion_percent,
  last_active_at = EXCLUDED.last_active_at;
INSERT INTO public.profiles (id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, father_occupation, mother_occupation, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at)
VALUES ('00000000-0000-4000-a000-000000000048', 'TM000072', 'Keerthana Balan', 'female', '1997-11-03', 152, 'never_married', 'Muslim', 'Marakayar', 'Marakayar subcaste', 'yes', 'M.B.B.S', 'M.B.B.S Graduate', 'HR Specialist', 'HR Specialist Details', '₹3 Lakhs - ₹5 Lakhs', 'Private Practice', 'Tiruppur', 'Tiruppur', 'Hi, I am Keerthana. I have completed my M.B.B.S and am currently working as a HR Specialist at Private Practice in Tiruppur. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'upper_middle_class', 'Retired Employee', 'Homemaker', false, false, true, 100, NOW() - INTERVAL '3 days')
ON CONFLICT (id) DO UPDATE SET
  profile_id = EXCLUDED.profile_id,
  display_name = EXCLUDED.display_name,
  gender = EXCLUDED.gender,
  date_of_birth = EXCLUDED.date_of_birth,
  height_cm = EXCLUDED.height_cm,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  subcaste = EXCLUDED.subcaste,
  dosham = EXCLUDED.dosham,
  education = EXCLUDED.education,
  education_detail = EXCLUDED.education_detail,
  occupation = EXCLUDED.occupation,
  occupation_detail = EXCLUDED.occupation_detail,
  annual_income = EXCLUDED.annual_income,
  company_name = EXCLUDED.company_name,
  city = EXCLUDED.city,
  district = EXCLUDED.district,
  about_me = EXCLUDED.about_me,
  family_type = EXCLUDED.family_type,
  family_status = EXCLUDED.family_status,
  father_occupation = EXCLUDED.father_occupation,
  mother_occupation = EXCLUDED.mother_occupation,
  is_verified = EXCLUDED.is_verified,
  is_premium = EXCLUDED.is_premium,
  is_profile_complete = EXCLUDED.is_profile_complete,
  profile_completion_percent = EXCLUDED.profile_completion_percent,
  last_active_at = EXCLUDED.last_active_at;
INSERT INTO public.profiles (id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, father_occupation, mother_occupation, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at)
VALUES ('00000000-0000-4000-a000-000000000049', 'TM000073', 'Karthik Balan', 'male', '1991-05-07', 188, 'never_married', 'Hindu', 'Agamudayar', 'Agamudayar subcaste', 'yes', 'B.Sc', 'B.Sc Graduate', 'Dentist', 'Dentist Details', '₹3 Lakhs - ₹5 Lakhs', 'Self Employed', 'Salem', 'Salem', 'Hi, I am Karthik. I have completed my B.Sc and am currently working as a Dentist at Self Employed in Salem. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'rich', 'Retired Employee', 'Homemaker', true, false, true, 100, NOW() - INTERVAL '10 days')
ON CONFLICT (id) DO UPDATE SET
  profile_id = EXCLUDED.profile_id,
  display_name = EXCLUDED.display_name,
  gender = EXCLUDED.gender,
  date_of_birth = EXCLUDED.date_of_birth,
  height_cm = EXCLUDED.height_cm,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  subcaste = EXCLUDED.subcaste,
  dosham = EXCLUDED.dosham,
  education = EXCLUDED.education,
  education_detail = EXCLUDED.education_detail,
  occupation = EXCLUDED.occupation,
  occupation_detail = EXCLUDED.occupation_detail,
  annual_income = EXCLUDED.annual_income,
  company_name = EXCLUDED.company_name,
  city = EXCLUDED.city,
  district = EXCLUDED.district,
  about_me = EXCLUDED.about_me,
  family_type = EXCLUDED.family_type,
  family_status = EXCLUDED.family_status,
  father_occupation = EXCLUDED.father_occupation,
  mother_occupation = EXCLUDED.mother_occupation,
  is_verified = EXCLUDED.is_verified,
  is_premium = EXCLUDED.is_premium,
  is_profile_complete = EXCLUDED.is_profile_complete,
  profile_completion_percent = EXCLUDED.profile_completion_percent,
  last_active_at = EXCLUDED.last_active_at;
INSERT INTO public.profiles (id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, father_occupation, mother_occupation, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at)
VALUES ('00000000-0000-4000-a000-00000000004a', 'TM000074', 'Malathi Gopal', 'female', '1989-12-27', 161, 'never_married', 'Hindu', 'Arunthathiyar', 'Arunthathiyar subcaste', 'no', 'M.B.B.S', 'M.B.B.S Graduate', 'Police Officer', 'Police Officer Details', '₹7 Lakhs - ₹10 Lakhs', 'TCS', 'Erode', 'Erode', 'Hi, I am Malathi. I have completed my M.B.B.S and am currently working as a Police Officer at TCS in Erode. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'rich', 'Retired Employee', 'Homemaker', true, false, true, 100, NOW() - INTERVAL '7 days')
ON CONFLICT (id) DO UPDATE SET
  profile_id = EXCLUDED.profile_id,
  display_name = EXCLUDED.display_name,
  gender = EXCLUDED.gender,
  date_of_birth = EXCLUDED.date_of_birth,
  height_cm = EXCLUDED.height_cm,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  subcaste = EXCLUDED.subcaste,
  dosham = EXCLUDED.dosham,
  education = EXCLUDED.education,
  education_detail = EXCLUDED.education_detail,
  occupation = EXCLUDED.occupation,
  occupation_detail = EXCLUDED.occupation_detail,
  annual_income = EXCLUDED.annual_income,
  company_name = EXCLUDED.company_name,
  city = EXCLUDED.city,
  district = EXCLUDED.district,
  about_me = EXCLUDED.about_me,
  family_type = EXCLUDED.family_type,
  family_status = EXCLUDED.family_status,
  father_occupation = EXCLUDED.father_occupation,
  mother_occupation = EXCLUDED.mother_occupation,
  is_verified = EXCLUDED.is_verified,
  is_premium = EXCLUDED.is_premium,
  is_profile_complete = EXCLUDED.is_profile_complete,
  profile_completion_percent = EXCLUDED.profile_completion_percent,
  last_active_at = EXCLUDED.last_active_at;
INSERT INTO public.profiles (id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, father_occupation, mother_occupation, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at)
VALUES ('00000000-0000-4000-a000-00000000004b', 'TM000075', 'Manikandan Raman', 'male', '2000-01-26', 170, 'never_married', 'Hindu', 'Naicker', NULL, 'no', 'M.C.A', 'M.C.A Graduate', 'Police Officer', 'Police Officer Details', '₹7 Lakhs - ₹10 Lakhs', 'TCS', 'Madurai', 'Madurai', 'Hi, I am Manikandan. I have completed my M.C.A and am currently working as a Police Officer at TCS in Madurai. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'middle_class', 'Retired Employee', 'Homemaker', true, false, true, 100, NOW() - INTERVAL '6 days')
ON CONFLICT (id) DO UPDATE SET
  profile_id = EXCLUDED.profile_id,
  display_name = EXCLUDED.display_name,
  gender = EXCLUDED.gender,
  date_of_birth = EXCLUDED.date_of_birth,
  height_cm = EXCLUDED.height_cm,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  subcaste = EXCLUDED.subcaste,
  dosham = EXCLUDED.dosham,
  education = EXCLUDED.education,
  education_detail = EXCLUDED.education_detail,
  occupation = EXCLUDED.occupation,
  occupation_detail = EXCLUDED.occupation_detail,
  annual_income = EXCLUDED.annual_income,
  company_name = EXCLUDED.company_name,
  city = EXCLUDED.city,
  district = EXCLUDED.district,
  about_me = EXCLUDED.about_me,
  family_type = EXCLUDED.family_type,
  family_status = EXCLUDED.family_status,
  father_occupation = EXCLUDED.father_occupation,
  mother_occupation = EXCLUDED.mother_occupation,
  is_verified = EXCLUDED.is_verified,
  is_premium = EXCLUDED.is_premium,
  is_profile_complete = EXCLUDED.is_profile_complete,
  profile_completion_percent = EXCLUDED.profile_completion_percent,
  last_active_at = EXCLUDED.last_active_at;
INSERT INTO public.profiles (id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, father_occupation, mother_occupation, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at)
VALUES ('00000000-0000-4000-a000-00000000004c', 'TM000076', 'Kavitha Raj', 'female', '2005-04-24', 175, 'never_married', 'Hindu', 'Pillai', 'Pillai subcaste', 'no', 'M.B.B.S', 'M.B.B.S Graduate', 'Business Owner', 'Business Owner Details', '₹10 Lakhs - ₹15 Lakhs', 'HCL', 'Madurai', 'Madurai', 'Hi, I am Kavitha. I have completed my M.B.B.S and am currently working as a Business Owner at HCL in Madurai. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'joint', 'middle_class', 'Retired Employee', 'Homemaker', false, true, true, 100, NOW() - INTERVAL '7 days')
ON CONFLICT (id) DO UPDATE SET
  profile_id = EXCLUDED.profile_id,
  display_name = EXCLUDED.display_name,
  gender = EXCLUDED.gender,
  date_of_birth = EXCLUDED.date_of_birth,
  height_cm = EXCLUDED.height_cm,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  subcaste = EXCLUDED.subcaste,
  dosham = EXCLUDED.dosham,
  education = EXCLUDED.education,
  education_detail = EXCLUDED.education_detail,
  occupation = EXCLUDED.occupation,
  occupation_detail = EXCLUDED.occupation_detail,
  annual_income = EXCLUDED.annual_income,
  company_name = EXCLUDED.company_name,
  city = EXCLUDED.city,
  district = EXCLUDED.district,
  about_me = EXCLUDED.about_me,
  family_type = EXCLUDED.family_type,
  family_status = EXCLUDED.family_status,
  father_occupation = EXCLUDED.father_occupation,
  mother_occupation = EXCLUDED.mother_occupation,
  is_verified = EXCLUDED.is_verified,
  is_premium = EXCLUDED.is_premium,
  is_profile_complete = EXCLUDED.is_profile_complete,
  profile_completion_percent = EXCLUDED.profile_completion_percent,
  last_active_at = EXCLUDED.last_active_at;
INSERT INTO public.profiles (id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, father_occupation, mother_occupation, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at)
VALUES ('00000000-0000-4000-a000-00000000004d', 'TM000077', 'Madhavan Gopal', 'male', '1996-02-16', 175, 'divorced', 'Hindu', 'Thevar', 'Thevar subcaste', 'no', 'M.Com', 'M.Com Graduate', 'Government Officer', 'Government Officer Details', '₹10 Lakhs - ₹15 Lakhs', 'Accenture', 'Tiruchirappalli', 'Trichy', 'Hi, I am Madhavan. I have completed my M.Com and am currently working as a Government Officer at Accenture in Tiruchirappalli. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'middle_class', 'Retired Employee', 'Homemaker', false, false, true, 100, NOW() - INTERVAL '3 days')
ON CONFLICT (id) DO UPDATE SET
  profile_id = EXCLUDED.profile_id,
  display_name = EXCLUDED.display_name,
  gender = EXCLUDED.gender,
  date_of_birth = EXCLUDED.date_of_birth,
  height_cm = EXCLUDED.height_cm,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  subcaste = EXCLUDED.subcaste,
  dosham = EXCLUDED.dosham,
  education = EXCLUDED.education,
  education_detail = EXCLUDED.education_detail,
  occupation = EXCLUDED.occupation,
  occupation_detail = EXCLUDED.occupation_detail,
  annual_income = EXCLUDED.annual_income,
  company_name = EXCLUDED.company_name,
  city = EXCLUDED.city,
  district = EXCLUDED.district,
  about_me = EXCLUDED.about_me,
  family_type = EXCLUDED.family_type,
  family_status = EXCLUDED.family_status,
  father_occupation = EXCLUDED.father_occupation,
  mother_occupation = EXCLUDED.mother_occupation,
  is_verified = EXCLUDED.is_verified,
  is_premium = EXCLUDED.is_premium,
  is_profile_complete = EXCLUDED.is_profile_complete,
  profile_completion_percent = EXCLUDED.profile_completion_percent,
  last_active_at = EXCLUDED.last_active_at;
INSERT INTO public.profiles (id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, father_occupation, mother_occupation, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at)
VALUES ('00000000-0000-4000-a000-00000000004e', 'TM000078', 'Meenakshi Murthy', 'female', '2001-10-27', 154, 'never_married', 'Muslim', 'Marakayar', 'Marakayar subcaste', 'no', 'M.B.A', 'M.B.A Graduate', 'Pharmacist', 'Pharmacist Details', '₹5 Lakhs - ₹7 Lakhs', 'HCL', 'Thanjavur', 'Thanjavur', 'Hi, I am Meenakshi. I have completed my M.B.A and am currently working as a Pharmacist at HCL in Thanjavur. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'rich', 'Retired Employee', 'Homemaker', true, true, true, 100, NOW() - INTERVAL '10 days')
ON CONFLICT (id) DO UPDATE SET
  profile_id = EXCLUDED.profile_id,
  display_name = EXCLUDED.display_name,
  gender = EXCLUDED.gender,
  date_of_birth = EXCLUDED.date_of_birth,
  height_cm = EXCLUDED.height_cm,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  subcaste = EXCLUDED.subcaste,
  dosham = EXCLUDED.dosham,
  education = EXCLUDED.education,
  education_detail = EXCLUDED.education_detail,
  occupation = EXCLUDED.occupation,
  occupation_detail = EXCLUDED.occupation_detail,
  annual_income = EXCLUDED.annual_income,
  company_name = EXCLUDED.company_name,
  city = EXCLUDED.city,
  district = EXCLUDED.district,
  about_me = EXCLUDED.about_me,
  family_type = EXCLUDED.family_type,
  family_status = EXCLUDED.family_status,
  father_occupation = EXCLUDED.father_occupation,
  mother_occupation = EXCLUDED.mother_occupation,
  is_verified = EXCLUDED.is_verified,
  is_premium = EXCLUDED.is_premium,
  is_profile_complete = EXCLUDED.is_profile_complete,
  profile_completion_percent = EXCLUDED.profile_completion_percent,
  last_active_at = EXCLUDED.last_active_at;
INSERT INTO public.profiles (id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, father_occupation, mother_occupation, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at)
VALUES ('00000000-0000-4000-a000-00000000004f', 'TM000079', 'Sakthi Velan', 'male', '2003-05-17', 188, 'never_married', 'Hindu', 'Brahmin - Iyengar', NULL, 'no', 'B.Ed', 'B.Ed Graduate', 'Pharmacist', 'Pharmacist Details', '₹5 Lakhs - ₹7 Lakhs', 'Wipro', 'Tiruchirappalli', 'Trichy', 'Hi, I am Sakthi. I have completed my B.Ed and am currently working as a Pharmacist at Wipro in Tiruchirappalli. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'upper_middle_class', 'Retired Employee', 'Homemaker', true, true, true, 100, NOW() - INTERVAL '6 days')
ON CONFLICT (id) DO UPDATE SET
  profile_id = EXCLUDED.profile_id,
  display_name = EXCLUDED.display_name,
  gender = EXCLUDED.gender,
  date_of_birth = EXCLUDED.date_of_birth,
  height_cm = EXCLUDED.height_cm,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  subcaste = EXCLUDED.subcaste,
  dosham = EXCLUDED.dosham,
  education = EXCLUDED.education,
  education_detail = EXCLUDED.education_detail,
  occupation = EXCLUDED.occupation,
  occupation_detail = EXCLUDED.occupation_detail,
  annual_income = EXCLUDED.annual_income,
  company_name = EXCLUDED.company_name,
  city = EXCLUDED.city,
  district = EXCLUDED.district,
  about_me = EXCLUDED.about_me,
  family_type = EXCLUDED.family_type,
  family_status = EXCLUDED.family_status,
  father_occupation = EXCLUDED.father_occupation,
  mother_occupation = EXCLUDED.mother_occupation,
  is_verified = EXCLUDED.is_verified,
  is_premium = EXCLUDED.is_premium,
  is_profile_complete = EXCLUDED.is_profile_complete,
  profile_completion_percent = EXCLUDED.profile_completion_percent,
  last_active_at = EXCLUDED.last_active_at;
INSERT INTO public.profiles (id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, father_occupation, mother_occupation, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at)
VALUES ('00000000-0000-4000-a000-000000000050', 'TM000080', 'Rekha Gopal', 'female', '1998-01-04', 152, 'never_married', 'Muslim', 'Marakayar', 'Marakayar subcaste', 'no', 'M.Sc', 'M.Sc Graduate', 'School Teacher', 'School Teacher Details', '₹20 Lakhs+', 'HCL', 'Chennai', 'Chennai', 'Hi, I am Rekha. I have completed my M.Sc and am currently working as a School Teacher at HCL in Chennai. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'upper_middle_class', 'Retired Employee', 'Homemaker', true, false, true, 100, NOW() - INTERVAL '6 days')
ON CONFLICT (id) DO UPDATE SET
  profile_id = EXCLUDED.profile_id,
  display_name = EXCLUDED.display_name,
  gender = EXCLUDED.gender,
  date_of_birth = EXCLUDED.date_of_birth,
  height_cm = EXCLUDED.height_cm,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  subcaste = EXCLUDED.subcaste,
  dosham = EXCLUDED.dosham,
  education = EXCLUDED.education,
  education_detail = EXCLUDED.education_detail,
  occupation = EXCLUDED.occupation,
  occupation_detail = EXCLUDED.occupation_detail,
  annual_income = EXCLUDED.annual_income,
  company_name = EXCLUDED.company_name,
  city = EXCLUDED.city,
  district = EXCLUDED.district,
  about_me = EXCLUDED.about_me,
  family_type = EXCLUDED.family_type,
  family_status = EXCLUDED.family_status,
  father_occupation = EXCLUDED.father_occupation,
  mother_occupation = EXCLUDED.mother_occupation,
  is_verified = EXCLUDED.is_verified,
  is_premium = EXCLUDED.is_premium,
  is_profile_complete = EXCLUDED.is_profile_complete,
  profile_completion_percent = EXCLUDED.profile_completion_percent,
  last_active_at = EXCLUDED.last_active_at;
INSERT INTO public.profiles (id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, father_occupation, mother_occupation, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at)
VALUES ('00000000-0000-4000-a000-000000000051', 'TM000081', 'Thirumal Selvan', 'male', '2004-08-15', 183, 'divorced', 'Hindu', 'Chettiar', 'Chettiar subcaste', 'no', 'Ph.D', 'Ph.D Graduate', 'School Teacher', 'School Teacher Details', '₹5 Lakhs - ₹7 Lakhs', 'Private Practice', 'Thanjavur', 'Thanjavur', 'Hi, I am Thirumal. I have completed my Ph.D and am currently working as a School Teacher at Private Practice in Thanjavur. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'upper_middle_class', 'Retired Employee', 'Homemaker', false, false, true, 100, NOW() - INTERVAL '6 days')
ON CONFLICT (id) DO UPDATE SET
  profile_id = EXCLUDED.profile_id,
  display_name = EXCLUDED.display_name,
  gender = EXCLUDED.gender,
  date_of_birth = EXCLUDED.date_of_birth,
  height_cm = EXCLUDED.height_cm,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  subcaste = EXCLUDED.subcaste,
  dosham = EXCLUDED.dosham,
  education = EXCLUDED.education,
  education_detail = EXCLUDED.education_detail,
  occupation = EXCLUDED.occupation,
  occupation_detail = EXCLUDED.occupation_detail,
  annual_income = EXCLUDED.annual_income,
  company_name = EXCLUDED.company_name,
  city = EXCLUDED.city,
  district = EXCLUDED.district,
  about_me = EXCLUDED.about_me,
  family_type = EXCLUDED.family_type,
  family_status = EXCLUDED.family_status,
  father_occupation = EXCLUDED.father_occupation,
  mother_occupation = EXCLUDED.mother_occupation,
  is_verified = EXCLUDED.is_verified,
  is_premium = EXCLUDED.is_premium,
  is_profile_complete = EXCLUDED.is_profile_complete,
  profile_completion_percent = EXCLUDED.profile_completion_percent,
  last_active_at = EXCLUDED.last_active_at;
INSERT INTO public.profiles (id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, father_occupation, mother_occupation, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at)
VALUES ('00000000-0000-4000-a000-000000000052', 'TM000082', 'Malarvizhi Swamy', 'female', '1991-12-06', 170, 'never_married', 'Hindu', 'Mudaliar', 'Mudaliar subcaste', 'no', 'M.Com', 'M.Com Graduate', 'Business Owner', 'Business Owner Details', '₹20 Lakhs+', 'Zoho', 'Erode', 'Erode', 'Hi, I am Malarvizhi. I have completed my M.Com and am currently working as a Business Owner at Zoho in Erode. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'rich', 'Retired Employee', 'Homemaker', true, false, true, 100, NOW() - INTERVAL '9 days')
ON CONFLICT (id) DO UPDATE SET
  profile_id = EXCLUDED.profile_id,
  display_name = EXCLUDED.display_name,
  gender = EXCLUDED.gender,
  date_of_birth = EXCLUDED.date_of_birth,
  height_cm = EXCLUDED.height_cm,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  subcaste = EXCLUDED.subcaste,
  dosham = EXCLUDED.dosham,
  education = EXCLUDED.education,
  education_detail = EXCLUDED.education_detail,
  occupation = EXCLUDED.occupation,
  occupation_detail = EXCLUDED.occupation_detail,
  annual_income = EXCLUDED.annual_income,
  company_name = EXCLUDED.company_name,
  city = EXCLUDED.city,
  district = EXCLUDED.district,
  about_me = EXCLUDED.about_me,
  family_type = EXCLUDED.family_type,
  family_status = EXCLUDED.family_status,
  father_occupation = EXCLUDED.father_occupation,
  mother_occupation = EXCLUDED.mother_occupation,
  is_verified = EXCLUDED.is_verified,
  is_premium = EXCLUDED.is_premium,
  is_profile_complete = EXCLUDED.is_profile_complete,
  profile_completion_percent = EXCLUDED.profile_completion_percent,
  last_active_at = EXCLUDED.last_active_at;
INSERT INTO public.profiles (id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, father_occupation, mother_occupation, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at)
VALUES ('00000000-0000-4000-a000-000000000053', 'TM000083', 'Chinnasamy Velan', 'male', '1990-09-25', 183, 'never_married', 'Hindu', 'Naidu', 'Naidu subcaste', 'yes', 'B.Sc', 'B.Sc Graduate', 'Architect', 'Architect Details', '₹3 Lakhs - ₹5 Lakhs', 'Cognizant', 'Chennai', 'Chennai', 'Hi, I am Chinnasamy. I have completed my B.Sc and am currently working as a Architect at Cognizant in Chennai. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'joint', 'upper_middle_class', 'Retired Employee', 'Homemaker', false, false, true, 100, NOW() - INTERVAL '8 days')
ON CONFLICT (id) DO UPDATE SET
  profile_id = EXCLUDED.profile_id,
  display_name = EXCLUDED.display_name,
  gender = EXCLUDED.gender,
  date_of_birth = EXCLUDED.date_of_birth,
  height_cm = EXCLUDED.height_cm,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  subcaste = EXCLUDED.subcaste,
  dosham = EXCLUDED.dosham,
  education = EXCLUDED.education,
  education_detail = EXCLUDED.education_detail,
  occupation = EXCLUDED.occupation,
  occupation_detail = EXCLUDED.occupation_detail,
  annual_income = EXCLUDED.annual_income,
  company_name = EXCLUDED.company_name,
  city = EXCLUDED.city,
  district = EXCLUDED.district,
  about_me = EXCLUDED.about_me,
  family_type = EXCLUDED.family_type,
  family_status = EXCLUDED.family_status,
  father_occupation = EXCLUDED.father_occupation,
  mother_occupation = EXCLUDED.mother_occupation,
  is_verified = EXCLUDED.is_verified,
  is_premium = EXCLUDED.is_premium,
  is_profile_complete = EXCLUDED.is_profile_complete,
  profile_completion_percent = EXCLUDED.profile_completion_percent,
  last_active_at = EXCLUDED.last_active_at;
INSERT INTO public.profiles (id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, father_occupation, mother_occupation, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at)
VALUES ('00000000-0000-4000-a000-000000000054', 'TM000084', 'Keerthana Mani', 'female', '1997-09-10', 174, 'never_married', 'Hindu', 'Kallar', 'Kallar subcaste', 'no', 'B.Com', 'B.Com Graduate', 'Auditor', 'Auditor Details', '₹15 Lakhs - ₹20 Lakhs', 'TCS', 'Tirunelveli', 'Tirunelveli', 'Hi, I am Keerthana. I have completed my B.Com and am currently working as a Auditor at TCS in Tirunelveli. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'upper_middle_class', 'Retired Employee', 'Homemaker', true, true, true, 100, NOW() - INTERVAL '0 days')
ON CONFLICT (id) DO UPDATE SET
  profile_id = EXCLUDED.profile_id,
  display_name = EXCLUDED.display_name,
  gender = EXCLUDED.gender,
  date_of_birth = EXCLUDED.date_of_birth,
  height_cm = EXCLUDED.height_cm,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  subcaste = EXCLUDED.subcaste,
  dosham = EXCLUDED.dosham,
  education = EXCLUDED.education,
  education_detail = EXCLUDED.education_detail,
  occupation = EXCLUDED.occupation,
  occupation_detail = EXCLUDED.occupation_detail,
  annual_income = EXCLUDED.annual_income,
  company_name = EXCLUDED.company_name,
  city = EXCLUDED.city,
  district = EXCLUDED.district,
  about_me = EXCLUDED.about_me,
  family_type = EXCLUDED.family_type,
  family_status = EXCLUDED.family_status,
  father_occupation = EXCLUDED.father_occupation,
  mother_occupation = EXCLUDED.mother_occupation,
  is_verified = EXCLUDED.is_verified,
  is_premium = EXCLUDED.is_premium,
  is_profile_complete = EXCLUDED.is_profile_complete,
  profile_completion_percent = EXCLUDED.profile_completion_percent,
  last_active_at = EXCLUDED.last_active_at;
INSERT INTO public.profiles (id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, father_occupation, mother_occupation, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at)
VALUES ('00000000-0000-4000-a000-000000000055', 'TM000085', 'Thirumal Murthy', 'male', '1988-10-11', 162, 'divorced', 'Hindu', 'Adi Dravida', NULL, 'yes', 'M.C.A', 'M.C.A Graduate', 'School Teacher', 'School Teacher Details', '₹3 Lakhs - ₹5 Lakhs', 'Government Service', 'Chennai', 'Chennai', 'Hi, I am Thirumal. I have completed my M.C.A and am currently working as a School Teacher at Government Service in Chennai. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'joint', 'middle_class', 'Retired Employee', 'Homemaker', true, true, true, 100, NOW() - INTERVAL '6 days')
ON CONFLICT (id) DO UPDATE SET
  profile_id = EXCLUDED.profile_id,
  display_name = EXCLUDED.display_name,
  gender = EXCLUDED.gender,
  date_of_birth = EXCLUDED.date_of_birth,
  height_cm = EXCLUDED.height_cm,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  subcaste = EXCLUDED.subcaste,
  dosham = EXCLUDED.dosham,
  education = EXCLUDED.education,
  education_detail = EXCLUDED.education_detail,
  occupation = EXCLUDED.occupation,
  occupation_detail = EXCLUDED.occupation_detail,
  annual_income = EXCLUDED.annual_income,
  company_name = EXCLUDED.company_name,
  city = EXCLUDED.city,
  district = EXCLUDED.district,
  about_me = EXCLUDED.about_me,
  family_type = EXCLUDED.family_type,
  family_status = EXCLUDED.family_status,
  father_occupation = EXCLUDED.father_occupation,
  mother_occupation = EXCLUDED.mother_occupation,
  is_verified = EXCLUDED.is_verified,
  is_premium = EXCLUDED.is_premium,
  is_profile_complete = EXCLUDED.is_profile_complete,
  profile_completion_percent = EXCLUDED.profile_completion_percent,
  last_active_at = EXCLUDED.last_active_at;
INSERT INTO public.profiles (id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, father_occupation, mother_occupation, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at)
VALUES ('00000000-0000-4000-a000-000000000056', 'TM000086', 'Swetha Shankar', 'female', '2002-11-28', 165, 'never_married', 'Hindu', 'Arunthathiyar', NULL, 'no', 'B.Sc', 'B.Sc Graduate', 'College Professor', 'College Professor Details', '₹7 Lakhs - ₹10 Lakhs', 'Government Service', 'Tirunelveli', 'Tirunelveli', 'Hi, I am Swetha. I have completed my B.Sc and am currently working as a College Professor at Government Service in Tirunelveli. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'middle_class', 'Retired Employee', 'Homemaker', true, false, true, 100, NOW() - INTERVAL '2 days')
ON CONFLICT (id) DO UPDATE SET
  profile_id = EXCLUDED.profile_id,
  display_name = EXCLUDED.display_name,
  gender = EXCLUDED.gender,
  date_of_birth = EXCLUDED.date_of_birth,
  height_cm = EXCLUDED.height_cm,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  subcaste = EXCLUDED.subcaste,
  dosham = EXCLUDED.dosham,
  education = EXCLUDED.education,
  education_detail = EXCLUDED.education_detail,
  occupation = EXCLUDED.occupation,
  occupation_detail = EXCLUDED.occupation_detail,
  annual_income = EXCLUDED.annual_income,
  company_name = EXCLUDED.company_name,
  city = EXCLUDED.city,
  district = EXCLUDED.district,
  about_me = EXCLUDED.about_me,
  family_type = EXCLUDED.family_type,
  family_status = EXCLUDED.family_status,
  father_occupation = EXCLUDED.father_occupation,
  mother_occupation = EXCLUDED.mother_occupation,
  is_verified = EXCLUDED.is_verified,
  is_premium = EXCLUDED.is_premium,
  is_profile_complete = EXCLUDED.is_profile_complete,
  profile_completion_percent = EXCLUDED.profile_completion_percent,
  last_active_at = EXCLUDED.last_active_at;
INSERT INTO public.profiles (id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, father_occupation, mother_occupation, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at)
VALUES ('00000000-0000-4000-a000-000000000057', 'TM000087', 'Kabilan Selvan', 'male', '2001-01-15', 177, 'never_married', 'Christian', 'RC Christian', NULL, 'no', 'M.B.A', 'M.B.A Graduate', 'HR Specialist', 'HR Specialist Details', '₹7 Lakhs - ₹10 Lakhs', 'Government Service', 'Chennai', 'Chennai', 'Hi, I am Kabilan. I have completed my M.B.A and am currently working as a HR Specialist at Government Service in Chennai. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'middle_class', 'Retired Employee', 'Homemaker', false, false, true, 100, NOW() - INTERVAL '2 days')
ON CONFLICT (id) DO UPDATE SET
  profile_id = EXCLUDED.profile_id,
  display_name = EXCLUDED.display_name,
  gender = EXCLUDED.gender,
  date_of_birth = EXCLUDED.date_of_birth,
  height_cm = EXCLUDED.height_cm,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  subcaste = EXCLUDED.subcaste,
  dosham = EXCLUDED.dosham,
  education = EXCLUDED.education,
  education_detail = EXCLUDED.education_detail,
  occupation = EXCLUDED.occupation,
  occupation_detail = EXCLUDED.occupation_detail,
  annual_income = EXCLUDED.annual_income,
  company_name = EXCLUDED.company_name,
  city = EXCLUDED.city,
  district = EXCLUDED.district,
  about_me = EXCLUDED.about_me,
  family_type = EXCLUDED.family_type,
  family_status = EXCLUDED.family_status,
  father_occupation = EXCLUDED.father_occupation,
  mother_occupation = EXCLUDED.mother_occupation,
  is_verified = EXCLUDED.is_verified,
  is_premium = EXCLUDED.is_premium,
  is_profile_complete = EXCLUDED.is_profile_complete,
  profile_completion_percent = EXCLUDED.profile_completion_percent,
  last_active_at = EXCLUDED.last_active_at;
INSERT INTO public.profiles (id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, father_occupation, mother_occupation, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at)
VALUES ('00000000-0000-4000-a000-000000000058', 'TM000088', 'Preethi Balan', 'female', '1993-03-06', 156, 'never_married', 'Hindu', 'Vanniyar', 'Vanniyar subcaste', 'no', 'B.Com', 'B.Com Graduate', 'Advocate', 'Advocate Details', '₹5 Lakhs - ₹7 Lakhs', 'Self Employed', 'Tiruppur', 'Tiruppur', 'Hi, I am Preethi. I have completed my B.Com and am currently working as a Advocate at Self Employed in Tiruppur. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'rich', 'Retired Employee', 'Homemaker', true, false, true, 100, NOW() - INTERVAL '2 days')
ON CONFLICT (id) DO UPDATE SET
  profile_id = EXCLUDED.profile_id,
  display_name = EXCLUDED.display_name,
  gender = EXCLUDED.gender,
  date_of_birth = EXCLUDED.date_of_birth,
  height_cm = EXCLUDED.height_cm,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  subcaste = EXCLUDED.subcaste,
  dosham = EXCLUDED.dosham,
  education = EXCLUDED.education,
  education_detail = EXCLUDED.education_detail,
  occupation = EXCLUDED.occupation,
  occupation_detail = EXCLUDED.occupation_detail,
  annual_income = EXCLUDED.annual_income,
  company_name = EXCLUDED.company_name,
  city = EXCLUDED.city,
  district = EXCLUDED.district,
  about_me = EXCLUDED.about_me,
  family_type = EXCLUDED.family_type,
  family_status = EXCLUDED.family_status,
  father_occupation = EXCLUDED.father_occupation,
  mother_occupation = EXCLUDED.mother_occupation,
  is_verified = EXCLUDED.is_verified,
  is_premium = EXCLUDED.is_premium,
  is_profile_complete = EXCLUDED.is_profile_complete,
  profile_completion_percent = EXCLUDED.profile_completion_percent,
  last_active_at = EXCLUDED.last_active_at;
INSERT INTO public.profiles (id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, father_occupation, mother_occupation, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at)
VALUES ('00000000-0000-4000-a000-000000000059', 'TM000089', 'Ranjith Raman', 'male', '2004-06-11', 177, 'never_married', 'Hindu', 'Brahmin - Iyengar', 'Brahmin - Iyengar subcaste', 'no', 'M.A', 'M.A Graduate', 'Software Engineer', 'Software Engineer Details', '₹20 Lakhs+', 'Cognizant', 'Kanchipuram', 'Kanchipuram', 'Hi, I am Ranjith. I have completed my M.A and am currently working as a Software Engineer at Cognizant in Kanchipuram. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'joint', 'middle_class', 'Retired Employee', 'Homemaker', true, false, true, 100, NOW() - INTERVAL '1 days')
ON CONFLICT (id) DO UPDATE SET
  profile_id = EXCLUDED.profile_id,
  display_name = EXCLUDED.display_name,
  gender = EXCLUDED.gender,
  date_of_birth = EXCLUDED.date_of_birth,
  height_cm = EXCLUDED.height_cm,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  subcaste = EXCLUDED.subcaste,
  dosham = EXCLUDED.dosham,
  education = EXCLUDED.education,
  education_detail = EXCLUDED.education_detail,
  occupation = EXCLUDED.occupation,
  occupation_detail = EXCLUDED.occupation_detail,
  annual_income = EXCLUDED.annual_income,
  company_name = EXCLUDED.company_name,
  city = EXCLUDED.city,
  district = EXCLUDED.district,
  about_me = EXCLUDED.about_me,
  family_type = EXCLUDED.family_type,
  family_status = EXCLUDED.family_status,
  father_occupation = EXCLUDED.father_occupation,
  mother_occupation = EXCLUDED.mother_occupation,
  is_verified = EXCLUDED.is_verified,
  is_premium = EXCLUDED.is_premium,
  is_profile_complete = EXCLUDED.is_profile_complete,
  profile_completion_percent = EXCLUDED.profile_completion_percent,
  last_active_at = EXCLUDED.last_active_at;
INSERT INTO public.profiles (id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, father_occupation, mother_occupation, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at)
VALUES ('00000000-0000-4000-a000-00000000005a', 'TM000090', 'Archana Kumar', 'female', '1998-08-03', 174, 'divorced', 'Christian', 'Protestant Christian', 'Protestant Christian subcaste', 'yes', 'B.E. / B.Tech', 'B.E. / B.Tech Graduate', 'College Professor', 'College Professor Details', '₹5 Lakhs - ₹7 Lakhs', 'Self Employed', 'Thanjavur', 'Thanjavur', 'Hi, I am Archana. I have completed my B.E. / B.Tech and am currently working as a College Professor at Self Employed in Thanjavur. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'middle_class', 'Retired Employee', 'Homemaker', true, false, true, 100, NOW() - INTERVAL '1 days')
ON CONFLICT (id) DO UPDATE SET
  profile_id = EXCLUDED.profile_id,
  display_name = EXCLUDED.display_name,
  gender = EXCLUDED.gender,
  date_of_birth = EXCLUDED.date_of_birth,
  height_cm = EXCLUDED.height_cm,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  subcaste = EXCLUDED.subcaste,
  dosham = EXCLUDED.dosham,
  education = EXCLUDED.education,
  education_detail = EXCLUDED.education_detail,
  occupation = EXCLUDED.occupation,
  occupation_detail = EXCLUDED.occupation_detail,
  annual_income = EXCLUDED.annual_income,
  company_name = EXCLUDED.company_name,
  city = EXCLUDED.city,
  district = EXCLUDED.district,
  about_me = EXCLUDED.about_me,
  family_type = EXCLUDED.family_type,
  family_status = EXCLUDED.family_status,
  father_occupation = EXCLUDED.father_occupation,
  mother_occupation = EXCLUDED.mother_occupation,
  is_verified = EXCLUDED.is_verified,
  is_premium = EXCLUDED.is_premium,
  is_profile_complete = EXCLUDED.is_profile_complete,
  profile_completion_percent = EXCLUDED.profile_completion_percent,
  last_active_at = EXCLUDED.last_active_at;
INSERT INTO public.profiles (id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, father_occupation, mother_occupation, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at)
VALUES ('00000000-0000-4000-a000-00000000005b', 'TM000091', 'Thirumal Lingam', 'male', '1989-06-28', 163, 'never_married', 'Hindu', 'Pillai', NULL, 'no', 'B.E. / B.Tech', 'B.E. / B.Tech Graduate', 'Architect', 'Architect Details', '₹10 Lakhs - ₹15 Lakhs', 'Cognizant', 'Tiruppur', 'Tiruppur', 'Hi, I am Thirumal. I have completed my B.E. / B.Tech and am currently working as a Architect at Cognizant in Tiruppur. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'upper_middle_class', 'Retired Employee', 'Homemaker', true, false, true, 100, NOW() - INTERVAL '3 days')
ON CONFLICT (id) DO UPDATE SET
  profile_id = EXCLUDED.profile_id,
  display_name = EXCLUDED.display_name,
  gender = EXCLUDED.gender,
  date_of_birth = EXCLUDED.date_of_birth,
  height_cm = EXCLUDED.height_cm,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  subcaste = EXCLUDED.subcaste,
  dosham = EXCLUDED.dosham,
  education = EXCLUDED.education,
  education_detail = EXCLUDED.education_detail,
  occupation = EXCLUDED.occupation,
  occupation_detail = EXCLUDED.occupation_detail,
  annual_income = EXCLUDED.annual_income,
  company_name = EXCLUDED.company_name,
  city = EXCLUDED.city,
  district = EXCLUDED.district,
  about_me = EXCLUDED.about_me,
  family_type = EXCLUDED.family_type,
  family_status = EXCLUDED.family_status,
  father_occupation = EXCLUDED.father_occupation,
  mother_occupation = EXCLUDED.mother_occupation,
  is_verified = EXCLUDED.is_verified,
  is_premium = EXCLUDED.is_premium,
  is_profile_complete = EXCLUDED.is_profile_complete,
  profile_completion_percent = EXCLUDED.profile_completion_percent,
  last_active_at = EXCLUDED.last_active_at;
INSERT INTO public.profiles (id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, father_occupation, mother_occupation, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at)
VALUES ('00000000-0000-4000-a000-00000000005c', 'TM000092', 'Harini Balan', 'female', '1996-09-16', 153, 'never_married', 'Christian', 'Vellalar Christian', NULL, 'yes', 'M.Com', 'M.Com Graduate', 'Bank Manager', 'Bank Manager Details', '₹15 Lakhs - ₹20 Lakhs', 'TCS', 'Coimbatore', 'Coimbatore', 'Hi, I am Harini. I have completed my M.Com and am currently working as a Bank Manager at TCS in Coimbatore. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'joint', 'upper_middle_class', 'Retired Employee', 'Homemaker', false, false, true, 100, NOW() - INTERVAL '5 days')
ON CONFLICT (id) DO UPDATE SET
  profile_id = EXCLUDED.profile_id,
  display_name = EXCLUDED.display_name,
  gender = EXCLUDED.gender,
  date_of_birth = EXCLUDED.date_of_birth,
  height_cm = EXCLUDED.height_cm,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  subcaste = EXCLUDED.subcaste,
  dosham = EXCLUDED.dosham,
  education = EXCLUDED.education,
  education_detail = EXCLUDED.education_detail,
  occupation = EXCLUDED.occupation,
  occupation_detail = EXCLUDED.occupation_detail,
  annual_income = EXCLUDED.annual_income,
  company_name = EXCLUDED.company_name,
  city = EXCLUDED.city,
  district = EXCLUDED.district,
  about_me = EXCLUDED.about_me,
  family_type = EXCLUDED.family_type,
  family_status = EXCLUDED.family_status,
  father_occupation = EXCLUDED.father_occupation,
  mother_occupation = EXCLUDED.mother_occupation,
  is_verified = EXCLUDED.is_verified,
  is_premium = EXCLUDED.is_premium,
  is_profile_complete = EXCLUDED.is_profile_complete,
  profile_completion_percent = EXCLUDED.profile_completion_percent,
  last_active_at = EXCLUDED.last_active_at;
INSERT INTO public.profiles (id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, father_occupation, mother_occupation, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at)
VALUES ('00000000-0000-4000-a000-00000000005d', 'TM000093', 'Ranjith Raman', 'male', '1992-11-19', 179, 'never_married', 'Hindu', 'Pillai', 'Pillai subcaste', 'no', 'B.E. / B.Tech', 'B.E. / B.Tech Graduate', 'Dentist', 'Dentist Details', '₹20 Lakhs+', 'Infosys', 'Salem', 'Salem', 'Hi, I am Ranjith. I have completed my B.E. / B.Tech and am currently working as a Dentist at Infosys in Salem. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'middle_class', 'Retired Employee', 'Homemaker', true, true, true, 100, NOW() - INTERVAL '2 days')
ON CONFLICT (id) DO UPDATE SET
  profile_id = EXCLUDED.profile_id,
  display_name = EXCLUDED.display_name,
  gender = EXCLUDED.gender,
  date_of_birth = EXCLUDED.date_of_birth,
  height_cm = EXCLUDED.height_cm,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  subcaste = EXCLUDED.subcaste,
  dosham = EXCLUDED.dosham,
  education = EXCLUDED.education,
  education_detail = EXCLUDED.education_detail,
  occupation = EXCLUDED.occupation,
  occupation_detail = EXCLUDED.occupation_detail,
  annual_income = EXCLUDED.annual_income,
  company_name = EXCLUDED.company_name,
  city = EXCLUDED.city,
  district = EXCLUDED.district,
  about_me = EXCLUDED.about_me,
  family_type = EXCLUDED.family_type,
  family_status = EXCLUDED.family_status,
  father_occupation = EXCLUDED.father_occupation,
  mother_occupation = EXCLUDED.mother_occupation,
  is_verified = EXCLUDED.is_verified,
  is_premium = EXCLUDED.is_premium,
  is_profile_complete = EXCLUDED.is_profile_complete,
  profile_completion_percent = EXCLUDED.profile_completion_percent,
  last_active_at = EXCLUDED.last_active_at;
INSERT INTO public.profiles (id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, father_occupation, mother_occupation, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at)
VALUES ('00000000-0000-4000-a000-00000000005e', 'TM000094', 'Nandhini Balan', 'female', '1994-06-16', 171, 'divorced', 'Muslim', 'Shia Muslim', NULL, 'yes', 'B.E. / B.Tech', 'B.E. / B.Tech Graduate', 'HR Specialist', 'HR Specialist Details', '₹20 Lakhs+', 'HCL', 'Tiruchirappalli', 'Trichy', 'Hi, I am Nandhini. I have completed my B.E. / B.Tech and am currently working as a HR Specialist at HCL in Tiruchirappalli. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'upper_middle_class', 'Retired Employee', 'Homemaker', false, false, true, 100, NOW() - INTERVAL '10 days')
ON CONFLICT (id) DO UPDATE SET
  profile_id = EXCLUDED.profile_id,
  display_name = EXCLUDED.display_name,
  gender = EXCLUDED.gender,
  date_of_birth = EXCLUDED.date_of_birth,
  height_cm = EXCLUDED.height_cm,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  subcaste = EXCLUDED.subcaste,
  dosham = EXCLUDED.dosham,
  education = EXCLUDED.education,
  education_detail = EXCLUDED.education_detail,
  occupation = EXCLUDED.occupation,
  occupation_detail = EXCLUDED.occupation_detail,
  annual_income = EXCLUDED.annual_income,
  company_name = EXCLUDED.company_name,
  city = EXCLUDED.city,
  district = EXCLUDED.district,
  about_me = EXCLUDED.about_me,
  family_type = EXCLUDED.family_type,
  family_status = EXCLUDED.family_status,
  father_occupation = EXCLUDED.father_occupation,
  mother_occupation = EXCLUDED.mother_occupation,
  is_verified = EXCLUDED.is_verified,
  is_premium = EXCLUDED.is_premium,
  is_profile_complete = EXCLUDED.is_profile_complete,
  profile_completion_percent = EXCLUDED.profile_completion_percent,
  last_active_at = EXCLUDED.last_active_at;
INSERT INTO public.profiles (id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, father_occupation, mother_occupation, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at)
VALUES ('00000000-0000-4000-a000-00000000005f', 'TM000095', 'Srinivasan Gopal', 'male', '2000-03-12', 177, 'divorced', 'Muslim', 'Rawther', NULL, 'no', 'M.Com', 'M.Com Graduate', 'Dentist', 'Dentist Details', '₹10 Lakhs - ₹15 Lakhs', 'Private Practice', 'Madurai', 'Madurai', 'Hi, I am Srinivasan. I have completed my M.Com and am currently working as a Dentist at Private Practice in Madurai. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'upper_middle_class', 'Retired Employee', 'Homemaker', true, false, true, 100, NOW() - INTERVAL '7 days')
ON CONFLICT (id) DO UPDATE SET
  profile_id = EXCLUDED.profile_id,
  display_name = EXCLUDED.display_name,
  gender = EXCLUDED.gender,
  date_of_birth = EXCLUDED.date_of_birth,
  height_cm = EXCLUDED.height_cm,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  subcaste = EXCLUDED.subcaste,
  dosham = EXCLUDED.dosham,
  education = EXCLUDED.education,
  education_detail = EXCLUDED.education_detail,
  occupation = EXCLUDED.occupation,
  occupation_detail = EXCLUDED.occupation_detail,
  annual_income = EXCLUDED.annual_income,
  company_name = EXCLUDED.company_name,
  city = EXCLUDED.city,
  district = EXCLUDED.district,
  about_me = EXCLUDED.about_me,
  family_type = EXCLUDED.family_type,
  family_status = EXCLUDED.family_status,
  father_occupation = EXCLUDED.father_occupation,
  mother_occupation = EXCLUDED.mother_occupation,
  is_verified = EXCLUDED.is_verified,
  is_premium = EXCLUDED.is_premium,
  is_profile_complete = EXCLUDED.is_profile_complete,
  profile_completion_percent = EXCLUDED.profile_completion_percent,
  last_active_at = EXCLUDED.last_active_at;
INSERT INTO public.profiles (id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, father_occupation, mother_occupation, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at)
VALUES ('00000000-0000-4000-a000-000000000060', 'TM000096', 'Pavithra Devan', 'female', '1993-11-01', 167, 'never_married', 'Hindu', 'Sengunthar', 'Sengunthar subcaste', 'no', 'M.A', 'M.A Graduate', 'Police Officer', 'Police Officer Details', '₹10 Lakhs - ₹15 Lakhs', 'TCS', 'Kanchipuram', 'Kanchipuram', 'Hi, I am Pavithra. I have completed my M.A and am currently working as a Police Officer at TCS in Kanchipuram. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'upper_middle_class', 'Retired Employee', 'Homemaker', true, true, true, 100, NOW() - INTERVAL '5 days')
ON CONFLICT (id) DO UPDATE SET
  profile_id = EXCLUDED.profile_id,
  display_name = EXCLUDED.display_name,
  gender = EXCLUDED.gender,
  date_of_birth = EXCLUDED.date_of_birth,
  height_cm = EXCLUDED.height_cm,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  subcaste = EXCLUDED.subcaste,
  dosham = EXCLUDED.dosham,
  education = EXCLUDED.education,
  education_detail = EXCLUDED.education_detail,
  occupation = EXCLUDED.occupation,
  occupation_detail = EXCLUDED.occupation_detail,
  annual_income = EXCLUDED.annual_income,
  company_name = EXCLUDED.company_name,
  city = EXCLUDED.city,
  district = EXCLUDED.district,
  about_me = EXCLUDED.about_me,
  family_type = EXCLUDED.family_type,
  family_status = EXCLUDED.family_status,
  father_occupation = EXCLUDED.father_occupation,
  mother_occupation = EXCLUDED.mother_occupation,
  is_verified = EXCLUDED.is_verified,
  is_premium = EXCLUDED.is_premium,
  is_profile_complete = EXCLUDED.is_profile_complete,
  profile_completion_percent = EXCLUDED.profile_completion_percent,
  last_active_at = EXCLUDED.last_active_at;
INSERT INTO public.profiles (id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, father_occupation, mother_occupation, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at)
VALUES ('00000000-0000-4000-a000-000000000061', 'TM000097', 'Anbarasan Naicker', 'male', '2003-01-23', 162, 'never_married', 'Muslim', 'Shia Muslim', 'Shia Muslim subcaste', 'no', 'B.Ed', 'B.Ed Graduate', 'School Teacher', 'School Teacher Details', '₹7 Lakhs - ₹10 Lakhs', 'TCS', 'Tiruppur', 'Tiruppur', 'Hi, I am Anbarasan. I have completed my B.Ed and am currently working as a School Teacher at TCS in Tiruppur. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'joint', 'rich', 'Retired Employee', 'Homemaker', true, true, true, 100, NOW() - INTERVAL '6 days')
ON CONFLICT (id) DO UPDATE SET
  profile_id = EXCLUDED.profile_id,
  display_name = EXCLUDED.display_name,
  gender = EXCLUDED.gender,
  date_of_birth = EXCLUDED.date_of_birth,
  height_cm = EXCLUDED.height_cm,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  subcaste = EXCLUDED.subcaste,
  dosham = EXCLUDED.dosham,
  education = EXCLUDED.education,
  education_detail = EXCLUDED.education_detail,
  occupation = EXCLUDED.occupation,
  occupation_detail = EXCLUDED.occupation_detail,
  annual_income = EXCLUDED.annual_income,
  company_name = EXCLUDED.company_name,
  city = EXCLUDED.city,
  district = EXCLUDED.district,
  about_me = EXCLUDED.about_me,
  family_type = EXCLUDED.family_type,
  family_status = EXCLUDED.family_status,
  father_occupation = EXCLUDED.father_occupation,
  mother_occupation = EXCLUDED.mother_occupation,
  is_verified = EXCLUDED.is_verified,
  is_premium = EXCLUDED.is_premium,
  is_profile_complete = EXCLUDED.is_profile_complete,
  profile_completion_percent = EXCLUDED.profile_completion_percent,
  last_active_at = EXCLUDED.last_active_at;
INSERT INTO public.profiles (id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, father_occupation, mother_occupation, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at)
VALUES ('00000000-0000-4000-a000-000000000062', 'TM000098', 'Preethi Raj', 'female', '2005-10-03', 169, 'never_married', 'Hindu', 'Mudaliar', 'Mudaliar subcaste', 'no', 'B.A', 'B.A Graduate', 'Mechanical Engineer', 'Mechanical Engineer Details', '₹20 Lakhs+', 'HCL', 'Tirunelveli', 'Tirunelveli', 'Hi, I am Preethi. I have completed my B.A and am currently working as a Mechanical Engineer at HCL in Tirunelveli. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'joint', 'rich', 'Retired Employee', 'Homemaker', true, false, true, 100, NOW() - INTERVAL '1 days')
ON CONFLICT (id) DO UPDATE SET
  profile_id = EXCLUDED.profile_id,
  display_name = EXCLUDED.display_name,
  gender = EXCLUDED.gender,
  date_of_birth = EXCLUDED.date_of_birth,
  height_cm = EXCLUDED.height_cm,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  subcaste = EXCLUDED.subcaste,
  dosham = EXCLUDED.dosham,
  education = EXCLUDED.education,
  education_detail = EXCLUDED.education_detail,
  occupation = EXCLUDED.occupation,
  occupation_detail = EXCLUDED.occupation_detail,
  annual_income = EXCLUDED.annual_income,
  company_name = EXCLUDED.company_name,
  city = EXCLUDED.city,
  district = EXCLUDED.district,
  about_me = EXCLUDED.about_me,
  family_type = EXCLUDED.family_type,
  family_status = EXCLUDED.family_status,
  father_occupation = EXCLUDED.father_occupation,
  mother_occupation = EXCLUDED.mother_occupation,
  is_verified = EXCLUDED.is_verified,
  is_premium = EXCLUDED.is_premium,
  is_profile_complete = EXCLUDED.is_profile_complete,
  profile_completion_percent = EXCLUDED.profile_completion_percent,
  last_active_at = EXCLUDED.last_active_at;
INSERT INTO public.profiles (id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, father_occupation, mother_occupation, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at)
VALUES ('00000000-0000-4000-a000-000000000063', 'TM000099', 'Anand Naicker', 'male', '2001-06-19', 174, 'divorced', 'Christian', 'RC Christian', 'RC Christian subcaste', 'no', 'M.A', 'M.A Graduate', 'Architect', 'Architect Details', '₹20 Lakhs+', 'Cognizant', 'Thoothukudi', 'Tuticorin', 'Hi, I am Anand. I have completed my M.A and am currently working as a Architect at Cognizant in Thoothukudi. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'upper_middle_class', 'Retired Employee', 'Homemaker', true, false, true, 100, NOW() - INTERVAL '3 days')
ON CONFLICT (id) DO UPDATE SET
  profile_id = EXCLUDED.profile_id,
  display_name = EXCLUDED.display_name,
  gender = EXCLUDED.gender,
  date_of_birth = EXCLUDED.date_of_birth,
  height_cm = EXCLUDED.height_cm,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  subcaste = EXCLUDED.subcaste,
  dosham = EXCLUDED.dosham,
  education = EXCLUDED.education,
  education_detail = EXCLUDED.education_detail,
  occupation = EXCLUDED.occupation,
  occupation_detail = EXCLUDED.occupation_detail,
  annual_income = EXCLUDED.annual_income,
  company_name = EXCLUDED.company_name,
  city = EXCLUDED.city,
  district = EXCLUDED.district,
  about_me = EXCLUDED.about_me,
  family_type = EXCLUDED.family_type,
  family_status = EXCLUDED.family_status,
  father_occupation = EXCLUDED.father_occupation,
  mother_occupation = EXCLUDED.mother_occupation,
  is_verified = EXCLUDED.is_verified,
  is_premium = EXCLUDED.is_premium,
  is_profile_complete = EXCLUDED.is_profile_complete,
  profile_completion_percent = EXCLUDED.profile_completion_percent,
  last_active_at = EXCLUDED.last_active_at;
INSERT INTO public.profiles (id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, father_occupation, mother_occupation, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at)
VALUES ('00000000-0000-4000-a000-000000000064', 'TM000100', 'Chitra Raman', 'female', '1998-10-28', 160, 'never_married', 'Hindu', 'Arunthathiyar', 'Arunthathiyar subcaste', 'yes', 'B.Ed', 'B.Ed Graduate', 'Advocate', 'Advocate Details', '₹5 Lakhs - ₹7 Lakhs', 'Infosys', 'Vellore', 'Vellore', 'Hi, I am Chitra. I have completed my B.Ed and am currently working as a Advocate at Infosys in Vellore. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'upper_middle_class', 'Retired Employee', 'Homemaker', false, false, true, 100, NOW() - INTERVAL '5 days')
ON CONFLICT (id) DO UPDATE SET
  profile_id = EXCLUDED.profile_id,
  display_name = EXCLUDED.display_name,
  gender = EXCLUDED.gender,
  date_of_birth = EXCLUDED.date_of_birth,
  height_cm = EXCLUDED.height_cm,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  subcaste = EXCLUDED.subcaste,
  dosham = EXCLUDED.dosham,
  education = EXCLUDED.education,
  education_detail = EXCLUDED.education_detail,
  occupation = EXCLUDED.occupation,
  occupation_detail = EXCLUDED.occupation_detail,
  annual_income = EXCLUDED.annual_income,
  company_name = EXCLUDED.company_name,
  city = EXCLUDED.city,
  district = EXCLUDED.district,
  about_me = EXCLUDED.about_me,
  family_type = EXCLUDED.family_type,
  family_status = EXCLUDED.family_status,
  father_occupation = EXCLUDED.father_occupation,
  mother_occupation = EXCLUDED.mother_occupation,
  is_verified = EXCLUDED.is_verified,
  is_premium = EXCLUDED.is_premium,
  is_profile_complete = EXCLUDED.is_profile_complete,
  profile_completion_percent = EXCLUDED.profile_completion_percent,
  last_active_at = EXCLUDED.last_active_at;
INSERT INTO public.profiles (id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, father_occupation, mother_occupation, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at)
VALUES ('00000000-0000-4000-a000-000000000065', 'TM000101', 'Thirumal Shankar', 'male', '1989-02-05', 179, 'never_married', 'Hindu', 'Chettiar', NULL, 'no', 'M.B.B.S', 'M.B.B.S Graduate', 'Architect', 'Architect Details', '₹15 Lakhs - ₹20 Lakhs', 'Zoho', 'Thanjavur', 'Thanjavur', 'Hi, I am Thirumal. I have completed my M.B.B.S and am currently working as a Architect at Zoho in Thanjavur. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'upper_middle_class', 'Retired Employee', 'Homemaker', true, false, true, 100, NOW() - INTERVAL '1 days')
ON CONFLICT (id) DO UPDATE SET
  profile_id = EXCLUDED.profile_id,
  display_name = EXCLUDED.display_name,
  gender = EXCLUDED.gender,
  date_of_birth = EXCLUDED.date_of_birth,
  height_cm = EXCLUDED.height_cm,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  subcaste = EXCLUDED.subcaste,
  dosham = EXCLUDED.dosham,
  education = EXCLUDED.education,
  education_detail = EXCLUDED.education_detail,
  occupation = EXCLUDED.occupation,
  occupation_detail = EXCLUDED.occupation_detail,
  annual_income = EXCLUDED.annual_income,
  company_name = EXCLUDED.company_name,
  city = EXCLUDED.city,
  district = EXCLUDED.district,
  about_me = EXCLUDED.about_me,
  family_type = EXCLUDED.family_type,
  family_status = EXCLUDED.family_status,
  father_occupation = EXCLUDED.father_occupation,
  mother_occupation = EXCLUDED.mother_occupation,
  is_verified = EXCLUDED.is_verified,
  is_premium = EXCLUDED.is_premium,
  is_profile_complete = EXCLUDED.is_profile_complete,
  profile_completion_percent = EXCLUDED.profile_completion_percent,
  last_active_at = EXCLUDED.last_active_at;
INSERT INTO public.profiles (id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, father_occupation, mother_occupation, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at)
VALUES ('00000000-0000-4000-a000-000000000066', 'TM000102', 'Soundarya Kumar', 'female', '2000-07-26', 158, 'never_married', 'Christian', 'CSI Christian', NULL, 'no', 'B.Com', 'B.Com Graduate', 'School Teacher', 'School Teacher Details', '₹7 Lakhs - ₹10 Lakhs', 'Zoho', 'Erode', 'Erode', 'Hi, I am Soundarya. I have completed my B.Com and am currently working as a School Teacher at Zoho in Erode. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'rich', 'Retired Employee', 'Homemaker', true, false, true, 100, NOW() - INTERVAL '7 days')
ON CONFLICT (id) DO UPDATE SET
  profile_id = EXCLUDED.profile_id,
  display_name = EXCLUDED.display_name,
  gender = EXCLUDED.gender,
  date_of_birth = EXCLUDED.date_of_birth,
  height_cm = EXCLUDED.height_cm,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  subcaste = EXCLUDED.subcaste,
  dosham = EXCLUDED.dosham,
  education = EXCLUDED.education,
  education_detail = EXCLUDED.education_detail,
  occupation = EXCLUDED.occupation,
  occupation_detail = EXCLUDED.occupation_detail,
  annual_income = EXCLUDED.annual_income,
  company_name = EXCLUDED.company_name,
  city = EXCLUDED.city,
  district = EXCLUDED.district,
  about_me = EXCLUDED.about_me,
  family_type = EXCLUDED.family_type,
  family_status = EXCLUDED.family_status,
  father_occupation = EXCLUDED.father_occupation,
  mother_occupation = EXCLUDED.mother_occupation,
  is_verified = EXCLUDED.is_verified,
  is_premium = EXCLUDED.is_premium,
  is_profile_complete = EXCLUDED.is_profile_complete,
  profile_completion_percent = EXCLUDED.profile_completion_percent,
  last_active_at = EXCLUDED.last_active_at;
INSERT INTO public.profiles (id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, father_occupation, mother_occupation, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at)
VALUES ('00000000-0000-4000-a000-000000000067', 'TM000103', 'Saravanan Nathan', 'male', '1997-07-23', 170, 'divorced', 'Hindu', 'Pillai', 'Pillai subcaste', 'no', 'B.Com', 'B.Com Graduate', 'Dentist', 'Dentist Details', '₹3 Lakhs - ₹5 Lakhs', 'TCS', 'Erode', 'Erode', 'Hi, I am Saravanan. I have completed my B.Com and am currently working as a Dentist at TCS in Erode. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'upper_middle_class', 'Retired Employee', 'Homemaker', true, false, true, 100, NOW() - INTERVAL '3 days')
ON CONFLICT (id) DO UPDATE SET
  profile_id = EXCLUDED.profile_id,
  display_name = EXCLUDED.display_name,
  gender = EXCLUDED.gender,
  date_of_birth = EXCLUDED.date_of_birth,
  height_cm = EXCLUDED.height_cm,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  subcaste = EXCLUDED.subcaste,
  dosham = EXCLUDED.dosham,
  education = EXCLUDED.education,
  education_detail = EXCLUDED.education_detail,
  occupation = EXCLUDED.occupation,
  occupation_detail = EXCLUDED.occupation_detail,
  annual_income = EXCLUDED.annual_income,
  company_name = EXCLUDED.company_name,
  city = EXCLUDED.city,
  district = EXCLUDED.district,
  about_me = EXCLUDED.about_me,
  family_type = EXCLUDED.family_type,
  family_status = EXCLUDED.family_status,
  father_occupation = EXCLUDED.father_occupation,
  mother_occupation = EXCLUDED.mother_occupation,
  is_verified = EXCLUDED.is_verified,
  is_premium = EXCLUDED.is_premium,
  is_profile_complete = EXCLUDED.is_profile_complete,
  profile_completion_percent = EXCLUDED.profile_completion_percent,
  last_active_at = EXCLUDED.last_active_at;
INSERT INTO public.profiles (id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, father_occupation, mother_occupation, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at)
VALUES ('00000000-0000-4000-a000-000000000068', 'TM000104', 'Uma Balan', 'female', '1997-12-23', 161, 'never_married', 'Hindu', 'Mudaliar', NULL, 'no', 'B.Com', 'B.Com Graduate', 'Auditor', 'Auditor Details', '₹7 Lakhs - ₹10 Lakhs', 'Cognizant', 'Tirunelveli', 'Tirunelveli', 'Hi, I am Uma. I have completed my B.Com and am currently working as a Auditor at Cognizant in Tirunelveli. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'rich', 'Retired Employee', 'Homemaker', false, true, true, 100, NOW() - INTERVAL '8 days')
ON CONFLICT (id) DO UPDATE SET
  profile_id = EXCLUDED.profile_id,
  display_name = EXCLUDED.display_name,
  gender = EXCLUDED.gender,
  date_of_birth = EXCLUDED.date_of_birth,
  height_cm = EXCLUDED.height_cm,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  subcaste = EXCLUDED.subcaste,
  dosham = EXCLUDED.dosham,
  education = EXCLUDED.education,
  education_detail = EXCLUDED.education_detail,
  occupation = EXCLUDED.occupation,
  occupation_detail = EXCLUDED.occupation_detail,
  annual_income = EXCLUDED.annual_income,
  company_name = EXCLUDED.company_name,
  city = EXCLUDED.city,
  district = EXCLUDED.district,
  about_me = EXCLUDED.about_me,
  family_type = EXCLUDED.family_type,
  family_status = EXCLUDED.family_status,
  father_occupation = EXCLUDED.father_occupation,
  mother_occupation = EXCLUDED.mother_occupation,
  is_verified = EXCLUDED.is_verified,
  is_premium = EXCLUDED.is_premium,
  is_profile_complete = EXCLUDED.is_profile_complete,
  profile_completion_percent = EXCLUDED.profile_completion_percent,
  last_active_at = EXCLUDED.last_active_at;
INSERT INTO public.profiles (id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, father_occupation, mother_occupation, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at)
VALUES ('00000000-0000-4000-a000-000000000069', 'TM000105', 'Naveen Kumar', 'male', '2001-07-19', 178, 'never_married', 'Hindu', 'Devendra Kula Vellalar', NULL, 'no', 'M.Com', 'M.Com Graduate', 'Police Officer', 'Police Officer Details', '₹5 Lakhs - ₹7 Lakhs', 'Self Employed', 'Coimbatore', 'Coimbatore', 'Hi, I am Naveen. I have completed my M.Com and am currently working as a Police Officer at Self Employed in Coimbatore. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'middle_class', 'Retired Employee', 'Homemaker', true, true, true, 100, NOW() - INTERVAL '6 days')
ON CONFLICT (id) DO UPDATE SET
  profile_id = EXCLUDED.profile_id,
  display_name = EXCLUDED.display_name,
  gender = EXCLUDED.gender,
  date_of_birth = EXCLUDED.date_of_birth,
  height_cm = EXCLUDED.height_cm,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  subcaste = EXCLUDED.subcaste,
  dosham = EXCLUDED.dosham,
  education = EXCLUDED.education,
  education_detail = EXCLUDED.education_detail,
  occupation = EXCLUDED.occupation,
  occupation_detail = EXCLUDED.occupation_detail,
  annual_income = EXCLUDED.annual_income,
  company_name = EXCLUDED.company_name,
  city = EXCLUDED.city,
  district = EXCLUDED.district,
  about_me = EXCLUDED.about_me,
  family_type = EXCLUDED.family_type,
  family_status = EXCLUDED.family_status,
  father_occupation = EXCLUDED.father_occupation,
  mother_occupation = EXCLUDED.mother_occupation,
  is_verified = EXCLUDED.is_verified,
  is_premium = EXCLUDED.is_premium,
  is_profile_complete = EXCLUDED.is_profile_complete,
  profile_completion_percent = EXCLUDED.profile_completion_percent,
  last_active_at = EXCLUDED.last_active_at;
INSERT INTO public.profiles (id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, father_occupation, mother_occupation, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at)
VALUES ('00000000-0000-4000-a000-00000000006a', 'TM000106', 'Abirami Murthy', 'female', '2003-07-07', 162, 'divorced', 'Hindu', 'Pillai', 'Pillai subcaste', 'yes', 'M.C.A', 'M.C.A Graduate', 'Pharmacist', 'Pharmacist Details', '₹20 Lakhs+', 'Infosys', 'Chennai', 'Chennai', 'Hi, I am Abirami. I have completed my M.C.A and am currently working as a Pharmacist at Infosys in Chennai. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'upper_middle_class', 'Retired Employee', 'Homemaker', true, false, true, 100, NOW() - INTERVAL '7 days')
ON CONFLICT (id) DO UPDATE SET
  profile_id = EXCLUDED.profile_id,
  display_name = EXCLUDED.display_name,
  gender = EXCLUDED.gender,
  date_of_birth = EXCLUDED.date_of_birth,
  height_cm = EXCLUDED.height_cm,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  subcaste = EXCLUDED.subcaste,
  dosham = EXCLUDED.dosham,
  education = EXCLUDED.education,
  education_detail = EXCLUDED.education_detail,
  occupation = EXCLUDED.occupation,
  occupation_detail = EXCLUDED.occupation_detail,
  annual_income = EXCLUDED.annual_income,
  company_name = EXCLUDED.company_name,
  city = EXCLUDED.city,
  district = EXCLUDED.district,
  about_me = EXCLUDED.about_me,
  family_type = EXCLUDED.family_type,
  family_status = EXCLUDED.family_status,
  father_occupation = EXCLUDED.father_occupation,
  mother_occupation = EXCLUDED.mother_occupation,
  is_verified = EXCLUDED.is_verified,
  is_premium = EXCLUDED.is_premium,
  is_profile_complete = EXCLUDED.is_profile_complete,
  profile_completion_percent = EXCLUDED.profile_completion_percent,
  last_active_at = EXCLUDED.last_active_at;
INSERT INTO public.profiles (id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, father_occupation, mother_occupation, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at)
VALUES ('00000000-0000-4000-a000-00000000006b', 'TM000107', 'Manikandan Velan', 'male', '1999-11-22', 188, 'divorced', 'Hindu', 'Nadar', 'Nadar subcaste', 'no', 'M.A', 'M.A Graduate', 'Mechanical Engineer', 'Mechanical Engineer Details', '₹5 Lakhs - ₹7 Lakhs', 'Zoho', 'Tiruchirappalli', 'Trichy', 'Hi, I am Manikandan. I have completed my M.A and am currently working as a Mechanical Engineer at Zoho in Tiruchirappalli. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'middle_class', 'Retired Employee', 'Homemaker', false, false, true, 100, NOW() - INTERVAL '1 days')
ON CONFLICT (id) DO UPDATE SET
  profile_id = EXCLUDED.profile_id,
  display_name = EXCLUDED.display_name,
  gender = EXCLUDED.gender,
  date_of_birth = EXCLUDED.date_of_birth,
  height_cm = EXCLUDED.height_cm,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  subcaste = EXCLUDED.subcaste,
  dosham = EXCLUDED.dosham,
  education = EXCLUDED.education,
  education_detail = EXCLUDED.education_detail,
  occupation = EXCLUDED.occupation,
  occupation_detail = EXCLUDED.occupation_detail,
  annual_income = EXCLUDED.annual_income,
  company_name = EXCLUDED.company_name,
  city = EXCLUDED.city,
  district = EXCLUDED.district,
  about_me = EXCLUDED.about_me,
  family_type = EXCLUDED.family_type,
  family_status = EXCLUDED.family_status,
  father_occupation = EXCLUDED.father_occupation,
  mother_occupation = EXCLUDED.mother_occupation,
  is_verified = EXCLUDED.is_verified,
  is_premium = EXCLUDED.is_premium,
  is_profile_complete = EXCLUDED.is_profile_complete,
  profile_completion_percent = EXCLUDED.profile_completion_percent,
  last_active_at = EXCLUDED.last_active_at;
INSERT INTO public.profiles (id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, father_occupation, mother_occupation, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at)
VALUES ('00000000-0000-4000-a000-00000000006c', 'TM000108', 'Sandhya Selvan', 'female', '1999-06-28', 161, 'never_married', 'Hindu', 'Vishwakarma', 'Vishwakarma subcaste', 'no', 'M.Sc', 'M.Sc Graduate', 'Advocate', 'Advocate Details', '₹7 Lakhs - ₹10 Lakhs', 'Private Practice', 'Erode', 'Erode', 'Hi, I am Sandhya. I have completed my M.Sc and am currently working as a Advocate at Private Practice in Erode. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'upper_middle_class', 'Retired Employee', 'Homemaker', true, true, true, 100, NOW() - INTERVAL '3 days')
ON CONFLICT (id) DO UPDATE SET
  profile_id = EXCLUDED.profile_id,
  display_name = EXCLUDED.display_name,
  gender = EXCLUDED.gender,
  date_of_birth = EXCLUDED.date_of_birth,
  height_cm = EXCLUDED.height_cm,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  subcaste = EXCLUDED.subcaste,
  dosham = EXCLUDED.dosham,
  education = EXCLUDED.education,
  education_detail = EXCLUDED.education_detail,
  occupation = EXCLUDED.occupation,
  occupation_detail = EXCLUDED.occupation_detail,
  annual_income = EXCLUDED.annual_income,
  company_name = EXCLUDED.company_name,
  city = EXCLUDED.city,
  district = EXCLUDED.district,
  about_me = EXCLUDED.about_me,
  family_type = EXCLUDED.family_type,
  family_status = EXCLUDED.family_status,
  father_occupation = EXCLUDED.father_occupation,
  mother_occupation = EXCLUDED.mother_occupation,
  is_verified = EXCLUDED.is_verified,
  is_premium = EXCLUDED.is_premium,
  is_profile_complete = EXCLUDED.is_profile_complete,
  profile_completion_percent = EXCLUDED.profile_completion_percent,
  last_active_at = EXCLUDED.last_active_at;
INSERT INTO public.profiles (id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, father_occupation, mother_occupation, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at)
VALUES ('00000000-0000-4000-a000-00000000006d', 'TM000109', 'Ganesan Swamy', 'male', '1992-11-11', 176, 'never_married', 'Hindu', 'Arunthathiyar', NULL, 'no', 'B.Sc', 'B.Sc Graduate', 'Dentist', 'Dentist Details', '₹5 Lakhs - ₹7 Lakhs', 'Self Employed', 'Thanjavur', 'Thanjavur', 'Hi, I am Ganesan. I have completed my B.Sc and am currently working as a Dentist at Self Employed in Thanjavur. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'upper_middle_class', 'Retired Employee', 'Homemaker', false, false, true, 100, NOW() - INTERVAL '4 days')
ON CONFLICT (id) DO UPDATE SET
  profile_id = EXCLUDED.profile_id,
  display_name = EXCLUDED.display_name,
  gender = EXCLUDED.gender,
  date_of_birth = EXCLUDED.date_of_birth,
  height_cm = EXCLUDED.height_cm,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  subcaste = EXCLUDED.subcaste,
  dosham = EXCLUDED.dosham,
  education = EXCLUDED.education,
  education_detail = EXCLUDED.education_detail,
  occupation = EXCLUDED.occupation,
  occupation_detail = EXCLUDED.occupation_detail,
  annual_income = EXCLUDED.annual_income,
  company_name = EXCLUDED.company_name,
  city = EXCLUDED.city,
  district = EXCLUDED.district,
  about_me = EXCLUDED.about_me,
  family_type = EXCLUDED.family_type,
  family_status = EXCLUDED.family_status,
  father_occupation = EXCLUDED.father_occupation,
  mother_occupation = EXCLUDED.mother_occupation,
  is_verified = EXCLUDED.is_verified,
  is_premium = EXCLUDED.is_premium,
  is_profile_complete = EXCLUDED.is_profile_complete,
  profile_completion_percent = EXCLUDED.profile_completion_percent,
  last_active_at = EXCLUDED.last_active_at;
INSERT INTO public.profiles (id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, father_occupation, mother_occupation, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at)
VALUES ('00000000-0000-4000-a000-00000000006e', 'TM000110', 'Vidya Raman', 'female', '1994-02-07', 153, 'never_married', 'Hindu', 'Vellalar', NULL, 'no', 'M.Com', 'M.Com Graduate', 'Government Officer', 'Government Officer Details', '₹3 Lakhs - ₹5 Lakhs', 'Wipro', 'Thanjavur', 'Thanjavur', 'Hi, I am Vidya. I have completed my M.Com and am currently working as a Government Officer at Wipro in Thanjavur. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'middle_class', 'Retired Employee', 'Homemaker', true, true, true, 100, NOW() - INTERVAL '0 days')
ON CONFLICT (id) DO UPDATE SET
  profile_id = EXCLUDED.profile_id,
  display_name = EXCLUDED.display_name,
  gender = EXCLUDED.gender,
  date_of_birth = EXCLUDED.date_of_birth,
  height_cm = EXCLUDED.height_cm,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  subcaste = EXCLUDED.subcaste,
  dosham = EXCLUDED.dosham,
  education = EXCLUDED.education,
  education_detail = EXCLUDED.education_detail,
  occupation = EXCLUDED.occupation,
  occupation_detail = EXCLUDED.occupation_detail,
  annual_income = EXCLUDED.annual_income,
  company_name = EXCLUDED.company_name,
  city = EXCLUDED.city,
  district = EXCLUDED.district,
  about_me = EXCLUDED.about_me,
  family_type = EXCLUDED.family_type,
  family_status = EXCLUDED.family_status,
  father_occupation = EXCLUDED.father_occupation,
  mother_occupation = EXCLUDED.mother_occupation,
  is_verified = EXCLUDED.is_verified,
  is_premium = EXCLUDED.is_premium,
  is_profile_complete = EXCLUDED.is_profile_complete,
  profile_completion_percent = EXCLUDED.profile_completion_percent,
  last_active_at = EXCLUDED.last_active_at;
INSERT INTO public.profiles (id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, father_occupation, mother_occupation, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at)
VALUES ('00000000-0000-4000-a000-00000000006f', 'TM000111', 'Vijay Mani', 'male', '2000-01-05', 177, 'divorced', 'Hindu', 'Vellalar', NULL, 'yes', 'Ph.D', 'Ph.D Graduate', 'Bank Manager', 'Bank Manager Details', '₹10 Lakhs - ₹15 Lakhs', 'Government Service', 'Chennai', 'Chennai', 'Hi, I am Vijay. I have completed my Ph.D and am currently working as a Bank Manager at Government Service in Chennai. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'middle_class', 'Retired Employee', 'Homemaker', false, false, true, 100, NOW() - INTERVAL '6 days')
ON CONFLICT (id) DO UPDATE SET
  profile_id = EXCLUDED.profile_id,
  display_name = EXCLUDED.display_name,
  gender = EXCLUDED.gender,
  date_of_birth = EXCLUDED.date_of_birth,
  height_cm = EXCLUDED.height_cm,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  subcaste = EXCLUDED.subcaste,
  dosham = EXCLUDED.dosham,
  education = EXCLUDED.education,
  education_detail = EXCLUDED.education_detail,
  occupation = EXCLUDED.occupation,
  occupation_detail = EXCLUDED.occupation_detail,
  annual_income = EXCLUDED.annual_income,
  company_name = EXCLUDED.company_name,
  city = EXCLUDED.city,
  district = EXCLUDED.district,
  about_me = EXCLUDED.about_me,
  family_type = EXCLUDED.family_type,
  family_status = EXCLUDED.family_status,
  father_occupation = EXCLUDED.father_occupation,
  mother_occupation = EXCLUDED.mother_occupation,
  is_verified = EXCLUDED.is_verified,
  is_premium = EXCLUDED.is_premium,
  is_profile_complete = EXCLUDED.is_profile_complete,
  profile_completion_percent = EXCLUDED.profile_completion_percent,
  last_active_at = EXCLUDED.last_active_at;
INSERT INTO public.profiles (id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, father_occupation, mother_occupation, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at)
VALUES ('00000000-0000-4000-a000-000000000070', 'TM000112', 'Swetha Shankar', 'female', '2005-06-27', 160, 'never_married', 'Hindu', 'Naidu', NULL, 'no', 'M.B.B.S', 'M.B.B.S Graduate', 'Doctor', 'Doctor Details', '₹20 Lakhs+', 'HCL', 'Tiruchirappalli', 'Trichy', 'Hi, I am Swetha. I have completed my M.B.B.S and am currently working as a Doctor at HCL in Tiruchirappalli. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'rich', 'Retired Employee', 'Homemaker', true, false, true, 100, NOW() - INTERVAL '1 days')
ON CONFLICT (id) DO UPDATE SET
  profile_id = EXCLUDED.profile_id,
  display_name = EXCLUDED.display_name,
  gender = EXCLUDED.gender,
  date_of_birth = EXCLUDED.date_of_birth,
  height_cm = EXCLUDED.height_cm,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  subcaste = EXCLUDED.subcaste,
  dosham = EXCLUDED.dosham,
  education = EXCLUDED.education,
  education_detail = EXCLUDED.education_detail,
  occupation = EXCLUDED.occupation,
  occupation_detail = EXCLUDED.occupation_detail,
  annual_income = EXCLUDED.annual_income,
  company_name = EXCLUDED.company_name,
  city = EXCLUDED.city,
  district = EXCLUDED.district,
  about_me = EXCLUDED.about_me,
  family_type = EXCLUDED.family_type,
  family_status = EXCLUDED.family_status,
  father_occupation = EXCLUDED.father_occupation,
  mother_occupation = EXCLUDED.mother_occupation,
  is_verified = EXCLUDED.is_verified,
  is_premium = EXCLUDED.is_premium,
  is_profile_complete = EXCLUDED.is_profile_complete,
  profile_completion_percent = EXCLUDED.profile_completion_percent,
  last_active_at = EXCLUDED.last_active_at;
INSERT INTO public.profiles (id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, father_occupation, mother_occupation, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at)
VALUES ('00000000-0000-4000-a000-000000000071', 'TM000113', 'Suresh Mani', 'male', '1992-01-24', 182, 'never_married', 'Hindu', 'Maravar', 'Maravar subcaste', 'no', 'B.Com', 'B.Com Graduate', 'Auditor', 'Auditor Details', '₹20 Lakhs+', 'Private Practice', 'Vellore', 'Vellore', 'Hi, I am Suresh. I have completed my B.Com and am currently working as a Auditor at Private Practice in Vellore. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'joint', 'rich', 'Retired Employee', 'Homemaker', true, true, true, 100, NOW() - INTERVAL '1 days')
ON CONFLICT (id) DO UPDATE SET
  profile_id = EXCLUDED.profile_id,
  display_name = EXCLUDED.display_name,
  gender = EXCLUDED.gender,
  date_of_birth = EXCLUDED.date_of_birth,
  height_cm = EXCLUDED.height_cm,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  subcaste = EXCLUDED.subcaste,
  dosham = EXCLUDED.dosham,
  education = EXCLUDED.education,
  education_detail = EXCLUDED.education_detail,
  occupation = EXCLUDED.occupation,
  occupation_detail = EXCLUDED.occupation_detail,
  annual_income = EXCLUDED.annual_income,
  company_name = EXCLUDED.company_name,
  city = EXCLUDED.city,
  district = EXCLUDED.district,
  about_me = EXCLUDED.about_me,
  family_type = EXCLUDED.family_type,
  family_status = EXCLUDED.family_status,
  father_occupation = EXCLUDED.father_occupation,
  mother_occupation = EXCLUDED.mother_occupation,
  is_verified = EXCLUDED.is_verified,
  is_premium = EXCLUDED.is_premium,
  is_profile_complete = EXCLUDED.is_profile_complete,
  profile_completion_percent = EXCLUDED.profile_completion_percent,
  last_active_at = EXCLUDED.last_active_at;
INSERT INTO public.profiles (id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, father_occupation, mother_occupation, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at)
VALUES ('00000000-0000-4000-a000-000000000072', 'TM000114', 'Sandhya Pandian', 'female', '1989-11-16', 152, 'never_married', 'Hindu', 'Agamudayar', NULL, 'no', 'B.A', 'B.A Graduate', 'HR Specialist', 'HR Specialist Details', '₹20 Lakhs+', 'Zoho', 'Coimbatore', 'Coimbatore', 'Hi, I am Sandhya. I have completed my B.A and am currently working as a HR Specialist at Zoho in Coimbatore. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'middle_class', 'Retired Employee', 'Homemaker', false, false, true, 100, NOW() - INTERVAL '2 days')
ON CONFLICT (id) DO UPDATE SET
  profile_id = EXCLUDED.profile_id,
  display_name = EXCLUDED.display_name,
  gender = EXCLUDED.gender,
  date_of_birth = EXCLUDED.date_of_birth,
  height_cm = EXCLUDED.height_cm,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  subcaste = EXCLUDED.subcaste,
  dosham = EXCLUDED.dosham,
  education = EXCLUDED.education,
  education_detail = EXCLUDED.education_detail,
  occupation = EXCLUDED.occupation,
  occupation_detail = EXCLUDED.occupation_detail,
  annual_income = EXCLUDED.annual_income,
  company_name = EXCLUDED.company_name,
  city = EXCLUDED.city,
  district = EXCLUDED.district,
  about_me = EXCLUDED.about_me,
  family_type = EXCLUDED.family_type,
  family_status = EXCLUDED.family_status,
  father_occupation = EXCLUDED.father_occupation,
  mother_occupation = EXCLUDED.mother_occupation,
  is_verified = EXCLUDED.is_verified,
  is_premium = EXCLUDED.is_premium,
  is_profile_complete = EXCLUDED.is_profile_complete,
  profile_completion_percent = EXCLUDED.profile_completion_percent,
  last_active_at = EXCLUDED.last_active_at;
INSERT INTO public.profiles (id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, father_occupation, mother_occupation, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at)
VALUES ('00000000-0000-4000-a000-000000000073', 'TM000115', 'Prakash Sundaram', 'male', '1992-12-10', 172, 'never_married', 'Hindu', 'Arunthathiyar', NULL, 'no', 'B.Sc', 'B.Sc Graduate', 'Pharmacist', 'Pharmacist Details', '₹20 Lakhs+', 'Private Practice', 'Salem', 'Salem', 'Hi, I am Prakash. I have completed my B.Sc and am currently working as a Pharmacist at Private Practice in Salem. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'rich', 'Retired Employee', 'Homemaker', true, false, true, 100, NOW() - INTERVAL '10 days')
ON CONFLICT (id) DO UPDATE SET
  profile_id = EXCLUDED.profile_id,
  display_name = EXCLUDED.display_name,
  gender = EXCLUDED.gender,
  date_of_birth = EXCLUDED.date_of_birth,
  height_cm = EXCLUDED.height_cm,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  subcaste = EXCLUDED.subcaste,
  dosham = EXCLUDED.dosham,
  education = EXCLUDED.education,
  education_detail = EXCLUDED.education_detail,
  occupation = EXCLUDED.occupation,
  occupation_detail = EXCLUDED.occupation_detail,
  annual_income = EXCLUDED.annual_income,
  company_name = EXCLUDED.company_name,
  city = EXCLUDED.city,
  district = EXCLUDED.district,
  about_me = EXCLUDED.about_me,
  family_type = EXCLUDED.family_type,
  family_status = EXCLUDED.family_status,
  father_occupation = EXCLUDED.father_occupation,
  mother_occupation = EXCLUDED.mother_occupation,
  is_verified = EXCLUDED.is_verified,
  is_premium = EXCLUDED.is_premium,
  is_profile_complete = EXCLUDED.is_profile_complete,
  profile_completion_percent = EXCLUDED.profile_completion_percent,
  last_active_at = EXCLUDED.last_active_at;
INSERT INTO public.profiles (id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, father_occupation, mother_occupation, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at)
VALUES ('00000000-0000-4000-a000-000000000074', 'TM000116', 'Vidya Shankar', 'female', '1989-12-09', 162, 'never_married', 'Hindu', 'Mudaliar', NULL, 'no', 'M.Sc', 'M.Sc Graduate', 'Architect', 'Architect Details', '₹10 Lakhs - ₹15 Lakhs', 'Cognizant', 'Kanchipuram', 'Kanchipuram', 'Hi, I am Vidya. I have completed my M.Sc and am currently working as a Architect at Cognizant in Kanchipuram. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'rich', 'Retired Employee', 'Homemaker', true, false, true, 100, NOW() - INTERVAL '8 days')
ON CONFLICT (id) DO UPDATE SET
  profile_id = EXCLUDED.profile_id,
  display_name = EXCLUDED.display_name,
  gender = EXCLUDED.gender,
  date_of_birth = EXCLUDED.date_of_birth,
  height_cm = EXCLUDED.height_cm,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  subcaste = EXCLUDED.subcaste,
  dosham = EXCLUDED.dosham,
  education = EXCLUDED.education,
  education_detail = EXCLUDED.education_detail,
  occupation = EXCLUDED.occupation,
  occupation_detail = EXCLUDED.occupation_detail,
  annual_income = EXCLUDED.annual_income,
  company_name = EXCLUDED.company_name,
  city = EXCLUDED.city,
  district = EXCLUDED.district,
  about_me = EXCLUDED.about_me,
  family_type = EXCLUDED.family_type,
  family_status = EXCLUDED.family_status,
  father_occupation = EXCLUDED.father_occupation,
  mother_occupation = EXCLUDED.mother_occupation,
  is_verified = EXCLUDED.is_verified,
  is_premium = EXCLUDED.is_premium,
  is_profile_complete = EXCLUDED.is_profile_complete,
  profile_completion_percent = EXCLUDED.profile_completion_percent,
  last_active_at = EXCLUDED.last_active_at;
INSERT INTO public.profiles (id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, father_occupation, mother_occupation, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at)
VALUES ('00000000-0000-4000-a000-000000000075', 'TM000117', 'Velmurugan Naicker', 'male', '1992-06-27', 164, 'never_married', 'Hindu', 'Arunthathiyar', 'Arunthathiyar subcaste', 'no', 'B.Sc', 'B.Sc Graduate', 'Auditor', 'Auditor Details', '₹7 Lakhs - ₹10 Lakhs', 'Accenture', 'Coimbatore', 'Coimbatore', 'Hi, I am Velmurugan. I have completed my B.Sc and am currently working as a Auditor at Accenture in Coimbatore. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'joint', 'upper_middle_class', 'Retired Employee', 'Homemaker', true, true, true, 100, NOW() - INTERVAL '10 days')
ON CONFLICT (id) DO UPDATE SET
  profile_id = EXCLUDED.profile_id,
  display_name = EXCLUDED.display_name,
  gender = EXCLUDED.gender,
  date_of_birth = EXCLUDED.date_of_birth,
  height_cm = EXCLUDED.height_cm,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  subcaste = EXCLUDED.subcaste,
  dosham = EXCLUDED.dosham,
  education = EXCLUDED.education,
  education_detail = EXCLUDED.education_detail,
  occupation = EXCLUDED.occupation,
  occupation_detail = EXCLUDED.occupation_detail,
  annual_income = EXCLUDED.annual_income,
  company_name = EXCLUDED.company_name,
  city = EXCLUDED.city,
  district = EXCLUDED.district,
  about_me = EXCLUDED.about_me,
  family_type = EXCLUDED.family_type,
  family_status = EXCLUDED.family_status,
  father_occupation = EXCLUDED.father_occupation,
  mother_occupation = EXCLUDED.mother_occupation,
  is_verified = EXCLUDED.is_verified,
  is_premium = EXCLUDED.is_premium,
  is_profile_complete = EXCLUDED.is_profile_complete,
  profile_completion_percent = EXCLUDED.profile_completion_percent,
  last_active_at = EXCLUDED.last_active_at;
INSERT INTO public.profiles (id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, father_occupation, mother_occupation, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at)
VALUES ('00000000-0000-4000-a000-000000000076', 'TM000118', 'Kavitha Moorthy', 'female', '2000-05-02', 173, 'never_married', 'Hindu', 'Nadar', 'Nadar subcaste', 'no', 'M.B.A', 'M.B.A Graduate', 'Mechanical Engineer', 'Mechanical Engineer Details', '₹10 Lakhs - ₹15 Lakhs', 'Infosys', 'Chennai', 'Chennai', 'Hi, I am Kavitha. I have completed my M.B.A and am currently working as a Mechanical Engineer at Infosys in Chennai. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'rich', 'Retired Employee', 'Homemaker', true, false, true, 100, NOW() - INTERVAL '3 days')
ON CONFLICT (id) DO UPDATE SET
  profile_id = EXCLUDED.profile_id,
  display_name = EXCLUDED.display_name,
  gender = EXCLUDED.gender,
  date_of_birth = EXCLUDED.date_of_birth,
  height_cm = EXCLUDED.height_cm,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  subcaste = EXCLUDED.subcaste,
  dosham = EXCLUDED.dosham,
  education = EXCLUDED.education,
  education_detail = EXCLUDED.education_detail,
  occupation = EXCLUDED.occupation,
  occupation_detail = EXCLUDED.occupation_detail,
  annual_income = EXCLUDED.annual_income,
  company_name = EXCLUDED.company_name,
  city = EXCLUDED.city,
  district = EXCLUDED.district,
  about_me = EXCLUDED.about_me,
  family_type = EXCLUDED.family_type,
  family_status = EXCLUDED.family_status,
  father_occupation = EXCLUDED.father_occupation,
  mother_occupation = EXCLUDED.mother_occupation,
  is_verified = EXCLUDED.is_verified,
  is_premium = EXCLUDED.is_premium,
  is_profile_complete = EXCLUDED.is_profile_complete,
  profile_completion_percent = EXCLUDED.profile_completion_percent,
  last_active_at = EXCLUDED.last_active_at;
INSERT INTO public.profiles (id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, father_occupation, mother_occupation, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at)
VALUES ('00000000-0000-4000-a000-000000000077', 'TM000119', 'Siddharth Sundaram', 'male', '1996-09-10', 177, 'never_married', 'Hindu', 'Maravar', 'Maravar subcaste', 'no', 'M.B.A', 'M.B.A Graduate', 'Auditor', 'Auditor Details', '₹5 Lakhs - ₹7 Lakhs', 'TCS', 'Thanjavur', 'Thanjavur', 'Hi, I am Siddharth. I have completed my M.B.A and am currently working as a Auditor at TCS in Thanjavur. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'upper_middle_class', 'Retired Employee', 'Homemaker', true, false, true, 100, NOW() - INTERVAL '7 days')
ON CONFLICT (id) DO UPDATE SET
  profile_id = EXCLUDED.profile_id,
  display_name = EXCLUDED.display_name,
  gender = EXCLUDED.gender,
  date_of_birth = EXCLUDED.date_of_birth,
  height_cm = EXCLUDED.height_cm,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  subcaste = EXCLUDED.subcaste,
  dosham = EXCLUDED.dosham,
  education = EXCLUDED.education,
  education_detail = EXCLUDED.education_detail,
  occupation = EXCLUDED.occupation,
  occupation_detail = EXCLUDED.occupation_detail,
  annual_income = EXCLUDED.annual_income,
  company_name = EXCLUDED.company_name,
  city = EXCLUDED.city,
  district = EXCLUDED.district,
  about_me = EXCLUDED.about_me,
  family_type = EXCLUDED.family_type,
  family_status = EXCLUDED.family_status,
  father_occupation = EXCLUDED.father_occupation,
  mother_occupation = EXCLUDED.mother_occupation,
  is_verified = EXCLUDED.is_verified,
  is_premium = EXCLUDED.is_premium,
  is_profile_complete = EXCLUDED.is_profile_complete,
  profile_completion_percent = EXCLUDED.profile_completion_percent,
  last_active_at = EXCLUDED.last_active_at;
INSERT INTO public.profiles (id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, father_occupation, mother_occupation, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at)
VALUES ('00000000-0000-4000-a000-000000000078', 'TM000120', 'Abirami Devan', 'female', '2003-08-07', 172, 'never_married', 'Hindu', 'Vellalar', NULL, 'no', 'B.Ed', 'B.Ed Graduate', 'Pharmacist', 'Pharmacist Details', '₹7 Lakhs - ₹10 Lakhs', 'Self Employed', 'Chennai', 'Chennai', 'Hi, I am Abirami. I have completed my B.Ed and am currently working as a Pharmacist at Self Employed in Chennai. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'middle_class', 'Retired Employee', 'Homemaker', true, false, true, 100, NOW() - INTERVAL '10 days')
ON CONFLICT (id) DO UPDATE SET
  profile_id = EXCLUDED.profile_id,
  display_name = EXCLUDED.display_name,
  gender = EXCLUDED.gender,
  date_of_birth = EXCLUDED.date_of_birth,
  height_cm = EXCLUDED.height_cm,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  subcaste = EXCLUDED.subcaste,
  dosham = EXCLUDED.dosham,
  education = EXCLUDED.education,
  education_detail = EXCLUDED.education_detail,
  occupation = EXCLUDED.occupation,
  occupation_detail = EXCLUDED.occupation_detail,
  annual_income = EXCLUDED.annual_income,
  company_name = EXCLUDED.company_name,
  city = EXCLUDED.city,
  district = EXCLUDED.district,
  about_me = EXCLUDED.about_me,
  family_type = EXCLUDED.family_type,
  family_status = EXCLUDED.family_status,
  father_occupation = EXCLUDED.father_occupation,
  mother_occupation = EXCLUDED.mother_occupation,
  is_verified = EXCLUDED.is_verified,
  is_premium = EXCLUDED.is_premium,
  is_profile_complete = EXCLUDED.is_profile_complete,
  profile_completion_percent = EXCLUDED.profile_completion_percent,
  last_active_at = EXCLUDED.last_active_at;
INSERT INTO public.profiles (id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, father_occupation, mother_occupation, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at)
VALUES ('00000000-0000-4000-a000-000000000079', 'TM000121', 'Sathish Naicker', 'male', '1993-03-21', 163, 'never_married', 'Hindu', 'Chettiar', 'Chettiar subcaste', 'no', 'M.A', 'M.A Graduate', 'Civil Engineer', 'Civil Engineer Details', '₹15 Lakhs - ₹20 Lakhs', 'Wipro', 'Tirunelveli', 'Tirunelveli', 'Hi, I am Sathish. I have completed my M.A and am currently working as a Civil Engineer at Wipro in Tirunelveli. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'rich', 'Retired Employee', 'Homemaker', false, true, true, 100, NOW() - INTERVAL '7 days')
ON CONFLICT (id) DO UPDATE SET
  profile_id = EXCLUDED.profile_id,
  display_name = EXCLUDED.display_name,
  gender = EXCLUDED.gender,
  date_of_birth = EXCLUDED.date_of_birth,
  height_cm = EXCLUDED.height_cm,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  subcaste = EXCLUDED.subcaste,
  dosham = EXCLUDED.dosham,
  education = EXCLUDED.education,
  education_detail = EXCLUDED.education_detail,
  occupation = EXCLUDED.occupation,
  occupation_detail = EXCLUDED.occupation_detail,
  annual_income = EXCLUDED.annual_income,
  company_name = EXCLUDED.company_name,
  city = EXCLUDED.city,
  district = EXCLUDED.district,
  about_me = EXCLUDED.about_me,
  family_type = EXCLUDED.family_type,
  family_status = EXCLUDED.family_status,
  father_occupation = EXCLUDED.father_occupation,
  mother_occupation = EXCLUDED.mother_occupation,
  is_verified = EXCLUDED.is_verified,
  is_premium = EXCLUDED.is_premium,
  is_profile_complete = EXCLUDED.is_profile_complete,
  profile_completion_percent = EXCLUDED.profile_completion_percent,
  last_active_at = EXCLUDED.last_active_at;
INSERT INTO public.profiles (id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, father_occupation, mother_occupation, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at)
VALUES ('00000000-0000-4000-a000-00000000007a', 'TM000122', 'Divya Murthy', 'female', '2005-11-12', 169, 'never_married', 'Muslim', 'Rawther', NULL, 'no', 'M.Sc', 'M.Sc Graduate', 'School Teacher', 'School Teacher Details', '₹7 Lakhs - ₹10 Lakhs', 'Private Practice', 'Thoothukudi', 'Tuticorin', 'Hi, I am Divya. I have completed my M.Sc and am currently working as a School Teacher at Private Practice in Thoothukudi. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'middle_class', 'Retired Employee', 'Homemaker', false, false, true, 100, NOW() - INTERVAL '8 days')
ON CONFLICT (id) DO UPDATE SET
  profile_id = EXCLUDED.profile_id,
  display_name = EXCLUDED.display_name,
  gender = EXCLUDED.gender,
  date_of_birth = EXCLUDED.date_of_birth,
  height_cm = EXCLUDED.height_cm,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  subcaste = EXCLUDED.subcaste,
  dosham = EXCLUDED.dosham,
  education = EXCLUDED.education,
  education_detail = EXCLUDED.education_detail,
  occupation = EXCLUDED.occupation,
  occupation_detail = EXCLUDED.occupation_detail,
  annual_income = EXCLUDED.annual_income,
  company_name = EXCLUDED.company_name,
  city = EXCLUDED.city,
  district = EXCLUDED.district,
  about_me = EXCLUDED.about_me,
  family_type = EXCLUDED.family_type,
  family_status = EXCLUDED.family_status,
  father_occupation = EXCLUDED.father_occupation,
  mother_occupation = EXCLUDED.mother_occupation,
  is_verified = EXCLUDED.is_verified,
  is_premium = EXCLUDED.is_premium,
  is_profile_complete = EXCLUDED.is_profile_complete,
  profile_completion_percent = EXCLUDED.profile_completion_percent,
  last_active_at = EXCLUDED.last_active_at;
INSERT INTO public.profiles (id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, father_occupation, mother_occupation, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at)
VALUES ('00000000-0000-4000-a000-00000000007b', 'TM000123', 'Velmurugan Samy', 'male', '2001-05-20', 168, 'never_married', 'Hindu', 'Vellalar', NULL, 'no', 'M.Com', 'M.Com Graduate', 'Advocate', 'Advocate Details', '₹15 Lakhs - ₹20 Lakhs', 'HCL', 'Tiruchirappalli', 'Trichy', 'Hi, I am Velmurugan. I have completed my M.Com and am currently working as a Advocate at HCL in Tiruchirappalli. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'joint', 'upper_middle_class', 'Retired Employee', 'Homemaker', true, true, true, 100, NOW() - INTERVAL '5 days')
ON CONFLICT (id) DO UPDATE SET
  profile_id = EXCLUDED.profile_id,
  display_name = EXCLUDED.display_name,
  gender = EXCLUDED.gender,
  date_of_birth = EXCLUDED.date_of_birth,
  height_cm = EXCLUDED.height_cm,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  subcaste = EXCLUDED.subcaste,
  dosham = EXCLUDED.dosham,
  education = EXCLUDED.education,
  education_detail = EXCLUDED.education_detail,
  occupation = EXCLUDED.occupation,
  occupation_detail = EXCLUDED.occupation_detail,
  annual_income = EXCLUDED.annual_income,
  company_name = EXCLUDED.company_name,
  city = EXCLUDED.city,
  district = EXCLUDED.district,
  about_me = EXCLUDED.about_me,
  family_type = EXCLUDED.family_type,
  family_status = EXCLUDED.family_status,
  father_occupation = EXCLUDED.father_occupation,
  mother_occupation = EXCLUDED.mother_occupation,
  is_verified = EXCLUDED.is_verified,
  is_premium = EXCLUDED.is_premium,
  is_profile_complete = EXCLUDED.is_profile_complete,
  profile_completion_percent = EXCLUDED.profile_completion_percent,
  last_active_at = EXCLUDED.last_active_at;
INSERT INTO public.profiles (id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, father_occupation, mother_occupation, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at)
VALUES ('00000000-0000-4000-a000-00000000007c', 'TM000124', 'Nivedha Murthy', 'female', '2003-08-03', 163, 'divorced', 'Hindu', 'Naicker', NULL, 'no', 'M.Sc', 'M.Sc Graduate', 'Advocate', 'Advocate Details', '₹5 Lakhs - ₹7 Lakhs', 'Self Employed', 'Chennai', 'Chennai', 'Hi, I am Nivedha. I have completed my M.Sc and am currently working as a Advocate at Self Employed in Chennai. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'upper_middle_class', 'Retired Employee', 'Homemaker', true, false, true, 100, NOW() - INTERVAL '7 days')
ON CONFLICT (id) DO UPDATE SET
  profile_id = EXCLUDED.profile_id,
  display_name = EXCLUDED.display_name,
  gender = EXCLUDED.gender,
  date_of_birth = EXCLUDED.date_of_birth,
  height_cm = EXCLUDED.height_cm,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  subcaste = EXCLUDED.subcaste,
  dosham = EXCLUDED.dosham,
  education = EXCLUDED.education,
  education_detail = EXCLUDED.education_detail,
  occupation = EXCLUDED.occupation,
  occupation_detail = EXCLUDED.occupation_detail,
  annual_income = EXCLUDED.annual_income,
  company_name = EXCLUDED.company_name,
  city = EXCLUDED.city,
  district = EXCLUDED.district,
  about_me = EXCLUDED.about_me,
  family_type = EXCLUDED.family_type,
  family_status = EXCLUDED.family_status,
  father_occupation = EXCLUDED.father_occupation,
  mother_occupation = EXCLUDED.mother_occupation,
  is_verified = EXCLUDED.is_verified,
  is_premium = EXCLUDED.is_premium,
  is_profile_complete = EXCLUDED.is_profile_complete,
  profile_completion_percent = EXCLUDED.profile_completion_percent,
  last_active_at = EXCLUDED.last_active_at;
INSERT INTO public.profiles (id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, father_occupation, mother_occupation, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at)
VALUES ('00000000-0000-4000-a000-00000000007d', 'TM000125', 'Srinivasan Gopal', 'male', '1988-07-09', 180, 'never_married', 'Hindu', 'Thevar', 'Thevar subcaste', 'yes', 'Ph.D', 'Ph.D Graduate', 'HR Specialist', 'HR Specialist Details', '₹5 Lakhs - ₹7 Lakhs', 'Private Practice', 'Thoothukudi', 'Tuticorin', 'Hi, I am Srinivasan. I have completed my Ph.D and am currently working as a HR Specialist at Private Practice in Thoothukudi. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'joint', 'upper_middle_class', 'Retired Employee', 'Homemaker', true, true, true, 100, NOW() - INTERVAL '10 days')
ON CONFLICT (id) DO UPDATE SET
  profile_id = EXCLUDED.profile_id,
  display_name = EXCLUDED.display_name,
  gender = EXCLUDED.gender,
  date_of_birth = EXCLUDED.date_of_birth,
  height_cm = EXCLUDED.height_cm,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  subcaste = EXCLUDED.subcaste,
  dosham = EXCLUDED.dosham,
  education = EXCLUDED.education,
  education_detail = EXCLUDED.education_detail,
  occupation = EXCLUDED.occupation,
  occupation_detail = EXCLUDED.occupation_detail,
  annual_income = EXCLUDED.annual_income,
  company_name = EXCLUDED.company_name,
  city = EXCLUDED.city,
  district = EXCLUDED.district,
  about_me = EXCLUDED.about_me,
  family_type = EXCLUDED.family_type,
  family_status = EXCLUDED.family_status,
  father_occupation = EXCLUDED.father_occupation,
  mother_occupation = EXCLUDED.mother_occupation,
  is_verified = EXCLUDED.is_verified,
  is_premium = EXCLUDED.is_premium,
  is_profile_complete = EXCLUDED.is_profile_complete,
  profile_completion_percent = EXCLUDED.profile_completion_percent,
  last_active_at = EXCLUDED.last_active_at;
INSERT INTO public.profiles (id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, father_occupation, mother_occupation, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at)
VALUES ('00000000-0000-4000-a000-00000000007e', 'TM000126', 'Geetha Mani', 'female', '2003-07-06', 164, 'never_married', 'Hindu', 'Vellalar', NULL, 'no', 'B.Ed', 'B.Ed Graduate', 'School Teacher', 'School Teacher Details', '₹5 Lakhs - ₹7 Lakhs', 'Wipro', 'Chennai', 'Chennai', 'Hi, I am Geetha. I have completed my B.Ed and am currently working as a School Teacher at Wipro in Chennai. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'rich', 'Retired Employee', 'Homemaker', true, true, true, 100, NOW() - INTERVAL '6 days')
ON CONFLICT (id) DO UPDATE SET
  profile_id = EXCLUDED.profile_id,
  display_name = EXCLUDED.display_name,
  gender = EXCLUDED.gender,
  date_of_birth = EXCLUDED.date_of_birth,
  height_cm = EXCLUDED.height_cm,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  subcaste = EXCLUDED.subcaste,
  dosham = EXCLUDED.dosham,
  education = EXCLUDED.education,
  education_detail = EXCLUDED.education_detail,
  occupation = EXCLUDED.occupation,
  occupation_detail = EXCLUDED.occupation_detail,
  annual_income = EXCLUDED.annual_income,
  company_name = EXCLUDED.company_name,
  city = EXCLUDED.city,
  district = EXCLUDED.district,
  about_me = EXCLUDED.about_me,
  family_type = EXCLUDED.family_type,
  family_status = EXCLUDED.family_status,
  father_occupation = EXCLUDED.father_occupation,
  mother_occupation = EXCLUDED.mother_occupation,
  is_verified = EXCLUDED.is_verified,
  is_premium = EXCLUDED.is_premium,
  is_profile_complete = EXCLUDED.is_profile_complete,
  profile_completion_percent = EXCLUDED.profile_completion_percent,
  last_active_at = EXCLUDED.last_active_at;
INSERT INTO public.profiles (id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, father_occupation, mother_occupation, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at)
VALUES ('00000000-0000-4000-a000-00000000007f', 'TM000127', 'Kannan Mani', 'male', '1999-06-04', 185, 'never_married', 'Hindu', 'Arunthathiyar', NULL, 'no', 'B.Com', 'B.Com Graduate', 'Police Officer', 'Police Officer Details', '₹7 Lakhs - ₹10 Lakhs', 'Private Practice', 'Madurai', 'Madurai', 'Hi, I am Kannan. I have completed my B.Com and am currently working as a Police Officer at Private Practice in Madurai. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'upper_middle_class', 'Retired Employee', 'Homemaker', true, false, true, 100, NOW() - INTERVAL '8 days')
ON CONFLICT (id) DO UPDATE SET
  profile_id = EXCLUDED.profile_id,
  display_name = EXCLUDED.display_name,
  gender = EXCLUDED.gender,
  date_of_birth = EXCLUDED.date_of_birth,
  height_cm = EXCLUDED.height_cm,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  subcaste = EXCLUDED.subcaste,
  dosham = EXCLUDED.dosham,
  education = EXCLUDED.education,
  education_detail = EXCLUDED.education_detail,
  occupation = EXCLUDED.occupation,
  occupation_detail = EXCLUDED.occupation_detail,
  annual_income = EXCLUDED.annual_income,
  company_name = EXCLUDED.company_name,
  city = EXCLUDED.city,
  district = EXCLUDED.district,
  about_me = EXCLUDED.about_me,
  family_type = EXCLUDED.family_type,
  family_status = EXCLUDED.family_status,
  father_occupation = EXCLUDED.father_occupation,
  mother_occupation = EXCLUDED.mother_occupation,
  is_verified = EXCLUDED.is_verified,
  is_premium = EXCLUDED.is_premium,
  is_profile_complete = EXCLUDED.is_profile_complete,
  profile_completion_percent = EXCLUDED.profile_completion_percent,
  last_active_at = EXCLUDED.last_active_at;
INSERT INTO public.profiles (id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, father_occupation, mother_occupation, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at)
VALUES ('00000000-0000-4000-a000-000000000080', 'TM000128', 'Saraswathi Samy', 'female', '1993-03-14', 166, 'divorced', 'Hindu', 'Arunthathiyar', NULL, 'yes', 'B.Sc', 'B.Sc Graduate', 'Business Owner', 'Business Owner Details', '₹5 Lakhs - ₹7 Lakhs', 'Infosys', 'Thoothukudi', 'Tuticorin', 'Hi, I am Saraswathi. I have completed my B.Sc and am currently working as a Business Owner at Infosys in Thoothukudi. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'rich', 'Retired Employee', 'Homemaker', false, false, true, 100, NOW() - INTERVAL '0 days')
ON CONFLICT (id) DO UPDATE SET
  profile_id = EXCLUDED.profile_id,
  display_name = EXCLUDED.display_name,
  gender = EXCLUDED.gender,
  date_of_birth = EXCLUDED.date_of_birth,
  height_cm = EXCLUDED.height_cm,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  subcaste = EXCLUDED.subcaste,
  dosham = EXCLUDED.dosham,
  education = EXCLUDED.education,
  education_detail = EXCLUDED.education_detail,
  occupation = EXCLUDED.occupation,
  occupation_detail = EXCLUDED.occupation_detail,
  annual_income = EXCLUDED.annual_income,
  company_name = EXCLUDED.company_name,
  city = EXCLUDED.city,
  district = EXCLUDED.district,
  about_me = EXCLUDED.about_me,
  family_type = EXCLUDED.family_type,
  family_status = EXCLUDED.family_status,
  father_occupation = EXCLUDED.father_occupation,
  mother_occupation = EXCLUDED.mother_occupation,
  is_verified = EXCLUDED.is_verified,
  is_premium = EXCLUDED.is_premium,
  is_profile_complete = EXCLUDED.is_profile_complete,
  profile_completion_percent = EXCLUDED.profile_completion_percent,
  last_active_at = EXCLUDED.last_active_at;
INSERT INTO public.profiles (id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, father_occupation, mother_occupation, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at)
VALUES ('00000000-0000-4000-a000-000000000081', 'TM000129', 'Sathish Gopal', 'male', '1990-08-05', 169, 'never_married', 'Hindu', 'Vishwakarma', NULL, 'no', 'B.Ed', 'B.Ed Graduate', 'School Teacher', 'School Teacher Details', '₹3 Lakhs - ₹5 Lakhs', 'Wipro', 'Tirunelveli', 'Tirunelveli', 'Hi, I am Sathish. I have completed my B.Ed and am currently working as a School Teacher at Wipro in Tirunelveli. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'joint', 'upper_middle_class', 'Retired Employee', 'Homemaker', false, false, true, 100, NOW() - INTERVAL '7 days')
ON CONFLICT (id) DO UPDATE SET
  profile_id = EXCLUDED.profile_id,
  display_name = EXCLUDED.display_name,
  gender = EXCLUDED.gender,
  date_of_birth = EXCLUDED.date_of_birth,
  height_cm = EXCLUDED.height_cm,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  subcaste = EXCLUDED.subcaste,
  dosham = EXCLUDED.dosham,
  education = EXCLUDED.education,
  education_detail = EXCLUDED.education_detail,
  occupation = EXCLUDED.occupation,
  occupation_detail = EXCLUDED.occupation_detail,
  annual_income = EXCLUDED.annual_income,
  company_name = EXCLUDED.company_name,
  city = EXCLUDED.city,
  district = EXCLUDED.district,
  about_me = EXCLUDED.about_me,
  family_type = EXCLUDED.family_type,
  family_status = EXCLUDED.family_status,
  father_occupation = EXCLUDED.father_occupation,
  mother_occupation = EXCLUDED.mother_occupation,
  is_verified = EXCLUDED.is_verified,
  is_premium = EXCLUDED.is_premium,
  is_profile_complete = EXCLUDED.is_profile_complete,
  profile_completion_percent = EXCLUDED.profile_completion_percent,
  last_active_at = EXCLUDED.last_active_at;
INSERT INTO public.profiles (id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, father_occupation, mother_occupation, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at)
VALUES ('00000000-0000-4000-a000-000000000082', 'TM000130', 'Nivedha Kumar', 'female', '2003-09-03', 152, 'never_married', 'Hindu', 'Mudaliar', 'Mudaliar subcaste', 'no', 'M.A', 'M.A Graduate', 'Police Officer', 'Police Officer Details', '₹7 Lakhs - ₹10 Lakhs', 'Self Employed', 'Madurai', 'Madurai', 'Hi, I am Nivedha. I have completed my M.A and am currently working as a Police Officer at Self Employed in Madurai. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'middle_class', 'Retired Employee', 'Homemaker', false, false, true, 100, NOW() - INTERVAL '7 days')
ON CONFLICT (id) DO UPDATE SET
  profile_id = EXCLUDED.profile_id,
  display_name = EXCLUDED.display_name,
  gender = EXCLUDED.gender,
  date_of_birth = EXCLUDED.date_of_birth,
  height_cm = EXCLUDED.height_cm,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  subcaste = EXCLUDED.subcaste,
  dosham = EXCLUDED.dosham,
  education = EXCLUDED.education,
  education_detail = EXCLUDED.education_detail,
  occupation = EXCLUDED.occupation,
  occupation_detail = EXCLUDED.occupation_detail,
  annual_income = EXCLUDED.annual_income,
  company_name = EXCLUDED.company_name,
  city = EXCLUDED.city,
  district = EXCLUDED.district,
  about_me = EXCLUDED.about_me,
  family_type = EXCLUDED.family_type,
  family_status = EXCLUDED.family_status,
  father_occupation = EXCLUDED.father_occupation,
  mother_occupation = EXCLUDED.mother_occupation,
  is_verified = EXCLUDED.is_verified,
  is_premium = EXCLUDED.is_premium,
  is_profile_complete = EXCLUDED.is_profile_complete,
  profile_completion_percent = EXCLUDED.profile_completion_percent,
  last_active_at = EXCLUDED.last_active_at;
INSERT INTO public.profiles (id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, father_occupation, mother_occupation, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at)
VALUES ('00000000-0000-4000-a000-000000000083', 'TM000131', 'Chinnasamy Kumar', 'male', '2002-12-17', 180, 'never_married', 'Christian', 'Vellalar Christian', 'Vellalar Christian subcaste', 'no', 'B.Com', 'B.Com Graduate', 'Software Engineer', 'Software Engineer Details', '₹10 Lakhs - ₹15 Lakhs', 'Government Service', 'Erode', 'Erode', 'Hi, I am Chinnasamy. I have completed my B.Com and am currently working as a Software Engineer at Government Service in Erode. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'joint', 'upper_middle_class', 'Retired Employee', 'Homemaker', true, false, true, 100, NOW() - INTERVAL '3 days')
ON CONFLICT (id) DO UPDATE SET
  profile_id = EXCLUDED.profile_id,
  display_name = EXCLUDED.display_name,
  gender = EXCLUDED.gender,
  date_of_birth = EXCLUDED.date_of_birth,
  height_cm = EXCLUDED.height_cm,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  subcaste = EXCLUDED.subcaste,
  dosham = EXCLUDED.dosham,
  education = EXCLUDED.education,
  education_detail = EXCLUDED.education_detail,
  occupation = EXCLUDED.occupation,
  occupation_detail = EXCLUDED.occupation_detail,
  annual_income = EXCLUDED.annual_income,
  company_name = EXCLUDED.company_name,
  city = EXCLUDED.city,
  district = EXCLUDED.district,
  about_me = EXCLUDED.about_me,
  family_type = EXCLUDED.family_type,
  family_status = EXCLUDED.family_status,
  father_occupation = EXCLUDED.father_occupation,
  mother_occupation = EXCLUDED.mother_occupation,
  is_verified = EXCLUDED.is_verified,
  is_premium = EXCLUDED.is_premium,
  is_profile_complete = EXCLUDED.is_profile_complete,
  profile_completion_percent = EXCLUDED.profile_completion_percent,
  last_active_at = EXCLUDED.last_active_at;
INSERT INTO public.profiles (id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, father_occupation, mother_occupation, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at)
VALUES ('00000000-0000-4000-a000-000000000084', 'TM000132', 'Pooja Raj', 'female', '2000-12-24', 163, 'never_married', 'Hindu', 'Vellalar', 'Vellalar subcaste', 'no', 'B.Ed', 'B.Ed Graduate', 'Mechanical Engineer', 'Mechanical Engineer Details', '₹3 Lakhs - ₹5 Lakhs', 'Accenture', 'Kanchipuram', 'Kanchipuram', 'Hi, I am Pooja. I have completed my B.Ed and am currently working as a Mechanical Engineer at Accenture in Kanchipuram. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'joint', 'upper_middle_class', 'Retired Employee', 'Homemaker', false, false, true, 100, NOW() - INTERVAL '9 days')
ON CONFLICT (id) DO UPDATE SET
  profile_id = EXCLUDED.profile_id,
  display_name = EXCLUDED.display_name,
  gender = EXCLUDED.gender,
  date_of_birth = EXCLUDED.date_of_birth,
  height_cm = EXCLUDED.height_cm,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  subcaste = EXCLUDED.subcaste,
  dosham = EXCLUDED.dosham,
  education = EXCLUDED.education,
  education_detail = EXCLUDED.education_detail,
  occupation = EXCLUDED.occupation,
  occupation_detail = EXCLUDED.occupation_detail,
  annual_income = EXCLUDED.annual_income,
  company_name = EXCLUDED.company_name,
  city = EXCLUDED.city,
  district = EXCLUDED.district,
  about_me = EXCLUDED.about_me,
  family_type = EXCLUDED.family_type,
  family_status = EXCLUDED.family_status,
  father_occupation = EXCLUDED.father_occupation,
  mother_occupation = EXCLUDED.mother_occupation,
  is_verified = EXCLUDED.is_verified,
  is_premium = EXCLUDED.is_premium,
  is_profile_complete = EXCLUDED.is_profile_complete,
  profile_completion_percent = EXCLUDED.profile_completion_percent,
  last_active_at = EXCLUDED.last_active_at;
INSERT INTO public.profiles (id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, father_occupation, mother_occupation, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at)
VALUES ('00000000-0000-4000-a000-000000000085', 'TM000133', 'Arun Balan', 'male', '1993-11-26', 174, 'divorced', 'Hindu', 'Brahmin - Iyer', NULL, 'no', 'M.B.A', 'M.B.A Graduate', 'Police Officer', 'Police Officer Details', '₹10 Lakhs - ₹15 Lakhs', 'HCL', 'Vellore', 'Vellore', 'Hi, I am Arun. I have completed my M.B.A and am currently working as a Police Officer at HCL in Vellore. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'upper_middle_class', 'Retired Employee', 'Homemaker', false, false, true, 100, NOW() - INTERVAL '7 days')
ON CONFLICT (id) DO UPDATE SET
  profile_id = EXCLUDED.profile_id,
  display_name = EXCLUDED.display_name,
  gender = EXCLUDED.gender,
  date_of_birth = EXCLUDED.date_of_birth,
  height_cm = EXCLUDED.height_cm,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  subcaste = EXCLUDED.subcaste,
  dosham = EXCLUDED.dosham,
  education = EXCLUDED.education,
  education_detail = EXCLUDED.education_detail,
  occupation = EXCLUDED.occupation,
  occupation_detail = EXCLUDED.occupation_detail,
  annual_income = EXCLUDED.annual_income,
  company_name = EXCLUDED.company_name,
  city = EXCLUDED.city,
  district = EXCLUDED.district,
  about_me = EXCLUDED.about_me,
  family_type = EXCLUDED.family_type,
  family_status = EXCLUDED.family_status,
  father_occupation = EXCLUDED.father_occupation,
  mother_occupation = EXCLUDED.mother_occupation,
  is_verified = EXCLUDED.is_verified,
  is_premium = EXCLUDED.is_premium,
  is_profile_complete = EXCLUDED.is_profile_complete,
  profile_completion_percent = EXCLUDED.profile_completion_percent,
  last_active_at = EXCLUDED.last_active_at;
INSERT INTO public.profiles (id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, father_occupation, mother_occupation, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at)
VALUES ('00000000-0000-4000-a000-000000000086', 'TM000134', 'Gayathri Lingam', 'female', '1998-02-08', 158, 'never_married', 'Hindu', 'Kallar', 'Kallar subcaste', 'no', 'Ph.D', 'Ph.D Graduate', 'Doctor', 'Doctor Details', '₹15 Lakhs - ₹20 Lakhs', 'Self Employed', 'Tiruchirappalli', 'Trichy', 'Hi, I am Gayathri. I have completed my Ph.D and am currently working as a Doctor at Self Employed in Tiruchirappalli. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'rich', 'Retired Employee', 'Homemaker', true, false, true, 100, NOW() - INTERVAL '0 days')
ON CONFLICT (id) DO UPDATE SET
  profile_id = EXCLUDED.profile_id,
  display_name = EXCLUDED.display_name,
  gender = EXCLUDED.gender,
  date_of_birth = EXCLUDED.date_of_birth,
  height_cm = EXCLUDED.height_cm,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  subcaste = EXCLUDED.subcaste,
  dosham = EXCLUDED.dosham,
  education = EXCLUDED.education,
  education_detail = EXCLUDED.education_detail,
  occupation = EXCLUDED.occupation,
  occupation_detail = EXCLUDED.occupation_detail,
  annual_income = EXCLUDED.annual_income,
  company_name = EXCLUDED.company_name,
  city = EXCLUDED.city,
  district = EXCLUDED.district,
  about_me = EXCLUDED.about_me,
  family_type = EXCLUDED.family_type,
  family_status = EXCLUDED.family_status,
  father_occupation = EXCLUDED.father_occupation,
  mother_occupation = EXCLUDED.mother_occupation,
  is_verified = EXCLUDED.is_verified,
  is_premium = EXCLUDED.is_premium,
  is_profile_complete = EXCLUDED.is_profile_complete,
  profile_completion_percent = EXCLUDED.profile_completion_percent,
  last_active_at = EXCLUDED.last_active_at;
INSERT INTO public.profiles (id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, father_occupation, mother_occupation, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at)
VALUES ('00000000-0000-4000-a000-000000000087', 'TM000135', 'Vetrivel Mani', 'male', '2002-05-19', 183, 'never_married', 'Hindu', 'Vishwakarma', NULL, 'no', 'B.Com', 'B.Com Graduate', 'Business Owner', 'Business Owner Details', '₹20 Lakhs+', 'HCL', 'Tiruchirappalli', 'Trichy', 'Hi, I am Vetrivel. I have completed my B.Com and am currently working as a Business Owner at HCL in Tiruchirappalli. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'joint', 'rich', 'Retired Employee', 'Homemaker', true, false, true, 100, NOW() - INTERVAL '9 days')
ON CONFLICT (id) DO UPDATE SET
  profile_id = EXCLUDED.profile_id,
  display_name = EXCLUDED.display_name,
  gender = EXCLUDED.gender,
  date_of_birth = EXCLUDED.date_of_birth,
  height_cm = EXCLUDED.height_cm,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  subcaste = EXCLUDED.subcaste,
  dosham = EXCLUDED.dosham,
  education = EXCLUDED.education,
  education_detail = EXCLUDED.education_detail,
  occupation = EXCLUDED.occupation,
  occupation_detail = EXCLUDED.occupation_detail,
  annual_income = EXCLUDED.annual_income,
  company_name = EXCLUDED.company_name,
  city = EXCLUDED.city,
  district = EXCLUDED.district,
  about_me = EXCLUDED.about_me,
  family_type = EXCLUDED.family_type,
  family_status = EXCLUDED.family_status,
  father_occupation = EXCLUDED.father_occupation,
  mother_occupation = EXCLUDED.mother_occupation,
  is_verified = EXCLUDED.is_verified,
  is_premium = EXCLUDED.is_premium,
  is_profile_complete = EXCLUDED.is_profile_complete,
  profile_completion_percent = EXCLUDED.profile_completion_percent,
  last_active_at = EXCLUDED.last_active_at;
INSERT INTO public.profiles (id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, father_occupation, mother_occupation, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at)
VALUES ('00000000-0000-4000-a000-000000000088', 'TM000136', 'Megala Krishnan', 'female', '2000-05-13', 167, 'never_married', 'Hindu', 'Vellalar', 'Vellalar subcaste', 'no', 'M.Sc', 'M.Sc Graduate', 'Mechanical Engineer', 'Mechanical Engineer Details', '₹5 Lakhs - ₹7 Lakhs', 'Wipro', 'Tiruppur', 'Tiruppur', 'Hi, I am Megala. I have completed my M.Sc and am currently working as a Mechanical Engineer at Wipro in Tiruppur. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'middle_class', 'Retired Employee', 'Homemaker', true, false, true, 100, NOW() - INTERVAL '7 days')
ON CONFLICT (id) DO UPDATE SET
  profile_id = EXCLUDED.profile_id,
  display_name = EXCLUDED.display_name,
  gender = EXCLUDED.gender,
  date_of_birth = EXCLUDED.date_of_birth,
  height_cm = EXCLUDED.height_cm,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  subcaste = EXCLUDED.subcaste,
  dosham = EXCLUDED.dosham,
  education = EXCLUDED.education,
  education_detail = EXCLUDED.education_detail,
  occupation = EXCLUDED.occupation,
  occupation_detail = EXCLUDED.occupation_detail,
  annual_income = EXCLUDED.annual_income,
  company_name = EXCLUDED.company_name,
  city = EXCLUDED.city,
  district = EXCLUDED.district,
  about_me = EXCLUDED.about_me,
  family_type = EXCLUDED.family_type,
  family_status = EXCLUDED.family_status,
  father_occupation = EXCLUDED.father_occupation,
  mother_occupation = EXCLUDED.mother_occupation,
  is_verified = EXCLUDED.is_verified,
  is_premium = EXCLUDED.is_premium,
  is_profile_complete = EXCLUDED.is_profile_complete,
  profile_completion_percent = EXCLUDED.profile_completion_percent,
  last_active_at = EXCLUDED.last_active_at;
INSERT INTO public.profiles (id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, father_occupation, mother_occupation, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at)
VALUES ('00000000-0000-4000-a000-000000000089', 'TM000137', 'Deepak Selvan', 'male', '2004-10-28', 173, 'never_married', 'Hindu', 'Agamudayar', NULL, 'no', 'M.Com', 'M.Com Graduate', 'Mechanical Engineer', 'Mechanical Engineer Details', '₹3 Lakhs - ₹5 Lakhs', 'Accenture', 'Tirunelveli', 'Tirunelveli', 'Hi, I am Deepak. I have completed my M.Com and am currently working as a Mechanical Engineer at Accenture in Tirunelveli. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'joint', 'upper_middle_class', 'Retired Employee', 'Homemaker', true, true, true, 100, NOW() - INTERVAL '6 days')
ON CONFLICT (id) DO UPDATE SET
  profile_id = EXCLUDED.profile_id,
  display_name = EXCLUDED.display_name,
  gender = EXCLUDED.gender,
  date_of_birth = EXCLUDED.date_of_birth,
  height_cm = EXCLUDED.height_cm,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  subcaste = EXCLUDED.subcaste,
  dosham = EXCLUDED.dosham,
  education = EXCLUDED.education,
  education_detail = EXCLUDED.education_detail,
  occupation = EXCLUDED.occupation,
  occupation_detail = EXCLUDED.occupation_detail,
  annual_income = EXCLUDED.annual_income,
  company_name = EXCLUDED.company_name,
  city = EXCLUDED.city,
  district = EXCLUDED.district,
  about_me = EXCLUDED.about_me,
  family_type = EXCLUDED.family_type,
  family_status = EXCLUDED.family_status,
  father_occupation = EXCLUDED.father_occupation,
  mother_occupation = EXCLUDED.mother_occupation,
  is_verified = EXCLUDED.is_verified,
  is_premium = EXCLUDED.is_premium,
  is_profile_complete = EXCLUDED.is_profile_complete,
  profile_completion_percent = EXCLUDED.profile_completion_percent,
  last_active_at = EXCLUDED.last_active_at;
INSERT INTO public.profiles (id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, father_occupation, mother_occupation, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at)
VALUES ('00000000-0000-4000-a000-00000000008a', 'TM000138', 'Ramya Mani', 'female', '1992-09-24', 162, 'never_married', 'Hindu', 'Pillai', 'Pillai subcaste', 'no', 'Ph.D', 'Ph.D Graduate', 'Mechanical Engineer', 'Mechanical Engineer Details', '₹15 Lakhs - ₹20 Lakhs', 'TCS', 'Tiruchirappalli', 'Trichy', 'Hi, I am Ramya. I have completed my Ph.D and am currently working as a Mechanical Engineer at TCS in Tiruchirappalli. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'joint', 'middle_class', 'Retired Employee', 'Homemaker', false, false, true, 100, NOW() - INTERVAL '7 days')
ON CONFLICT (id) DO UPDATE SET
  profile_id = EXCLUDED.profile_id,
  display_name = EXCLUDED.display_name,
  gender = EXCLUDED.gender,
  date_of_birth = EXCLUDED.date_of_birth,
  height_cm = EXCLUDED.height_cm,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  subcaste = EXCLUDED.subcaste,
  dosham = EXCLUDED.dosham,
  education = EXCLUDED.education,
  education_detail = EXCLUDED.education_detail,
  occupation = EXCLUDED.occupation,
  occupation_detail = EXCLUDED.occupation_detail,
  annual_income = EXCLUDED.annual_income,
  company_name = EXCLUDED.company_name,
  city = EXCLUDED.city,
  district = EXCLUDED.district,
  about_me = EXCLUDED.about_me,
  family_type = EXCLUDED.family_type,
  family_status = EXCLUDED.family_status,
  father_occupation = EXCLUDED.father_occupation,
  mother_occupation = EXCLUDED.mother_occupation,
  is_verified = EXCLUDED.is_verified,
  is_premium = EXCLUDED.is_premium,
  is_profile_complete = EXCLUDED.is_profile_complete,
  profile_completion_percent = EXCLUDED.profile_completion_percent,
  last_active_at = EXCLUDED.last_active_at;
INSERT INTO public.profiles (id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, father_occupation, mother_occupation, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at)
VALUES ('00000000-0000-4000-a000-00000000008b', 'TM000139', 'Vetrivel Nathan', 'male', '1998-11-10', 172, 'never_married', 'Hindu', 'Sengunthar', NULL, 'yes', 'B.Com', 'B.Com Graduate', 'Doctor', 'Doctor Details', '₹3 Lakhs - ₹5 Lakhs', 'Accenture', 'Salem', 'Salem', 'Hi, I am Vetrivel. I have completed my B.Com and am currently working as a Doctor at Accenture in Salem. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'upper_middle_class', 'Retired Employee', 'Homemaker', true, false, true, 100, NOW() - INTERVAL '9 days')
ON CONFLICT (id) DO UPDATE SET
  profile_id = EXCLUDED.profile_id,
  display_name = EXCLUDED.display_name,
  gender = EXCLUDED.gender,
  date_of_birth = EXCLUDED.date_of_birth,
  height_cm = EXCLUDED.height_cm,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  subcaste = EXCLUDED.subcaste,
  dosham = EXCLUDED.dosham,
  education = EXCLUDED.education,
  education_detail = EXCLUDED.education_detail,
  occupation = EXCLUDED.occupation,
  occupation_detail = EXCLUDED.occupation_detail,
  annual_income = EXCLUDED.annual_income,
  company_name = EXCLUDED.company_name,
  city = EXCLUDED.city,
  district = EXCLUDED.district,
  about_me = EXCLUDED.about_me,
  family_type = EXCLUDED.family_type,
  family_status = EXCLUDED.family_status,
  father_occupation = EXCLUDED.father_occupation,
  mother_occupation = EXCLUDED.mother_occupation,
  is_verified = EXCLUDED.is_verified,
  is_premium = EXCLUDED.is_premium,
  is_profile_complete = EXCLUDED.is_profile_complete,
  profile_completion_percent = EXCLUDED.profile_completion_percent,
  last_active_at = EXCLUDED.last_active_at;
INSERT INTO public.profiles (id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, father_occupation, mother_occupation, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at)
VALUES ('00000000-0000-4000-a000-00000000008c', 'TM000140', 'Priya Swamy', 'female', '1997-01-07', 167, 'never_married', 'Hindu', 'Thevar', 'Thevar subcaste', 'no', 'M.A', 'M.A Graduate', 'Government Officer', 'Government Officer Details', '₹7 Lakhs - ₹10 Lakhs', 'Infosys', 'Madurai', 'Madurai', 'Hi, I am Priya. I have completed my M.A and am currently working as a Government Officer at Infosys in Madurai. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'joint', 'middle_class', 'Retired Employee', 'Homemaker', false, false, true, 100, NOW() - INTERVAL '5 days')
ON CONFLICT (id) DO UPDATE SET
  profile_id = EXCLUDED.profile_id,
  display_name = EXCLUDED.display_name,
  gender = EXCLUDED.gender,
  date_of_birth = EXCLUDED.date_of_birth,
  height_cm = EXCLUDED.height_cm,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  subcaste = EXCLUDED.subcaste,
  dosham = EXCLUDED.dosham,
  education = EXCLUDED.education,
  education_detail = EXCLUDED.education_detail,
  occupation = EXCLUDED.occupation,
  occupation_detail = EXCLUDED.occupation_detail,
  annual_income = EXCLUDED.annual_income,
  company_name = EXCLUDED.company_name,
  city = EXCLUDED.city,
  district = EXCLUDED.district,
  about_me = EXCLUDED.about_me,
  family_type = EXCLUDED.family_type,
  family_status = EXCLUDED.family_status,
  father_occupation = EXCLUDED.father_occupation,
  mother_occupation = EXCLUDED.mother_occupation,
  is_verified = EXCLUDED.is_verified,
  is_premium = EXCLUDED.is_premium,
  is_profile_complete = EXCLUDED.is_profile_complete,
  profile_completion_percent = EXCLUDED.profile_completion_percent,
  last_active_at = EXCLUDED.last_active_at;
INSERT INTO public.profiles (id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, father_occupation, mother_occupation, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at)
VALUES ('00000000-0000-4000-a000-00000000008d', 'TM000141', 'Viswanathan Selvan', 'male', '2000-03-03', 162, 'never_married', 'Muslim', 'Rawther', 'Rawther subcaste', 'no', 'B.Ed', 'B.Ed Graduate', 'Civil Engineer', 'Civil Engineer Details', '₹20 Lakhs+', 'Infosys', 'Erode', 'Erode', 'Hi, I am Viswanathan. I have completed my B.Ed and am currently working as a Civil Engineer at Infosys in Erode. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'middle_class', 'Retired Employee', 'Homemaker', true, false, true, 100, NOW() - INTERVAL '8 days')
ON CONFLICT (id) DO UPDATE SET
  profile_id = EXCLUDED.profile_id,
  display_name = EXCLUDED.display_name,
  gender = EXCLUDED.gender,
  date_of_birth = EXCLUDED.date_of_birth,
  height_cm = EXCLUDED.height_cm,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  subcaste = EXCLUDED.subcaste,
  dosham = EXCLUDED.dosham,
  education = EXCLUDED.education,
  education_detail = EXCLUDED.education_detail,
  occupation = EXCLUDED.occupation,
  occupation_detail = EXCLUDED.occupation_detail,
  annual_income = EXCLUDED.annual_income,
  company_name = EXCLUDED.company_name,
  city = EXCLUDED.city,
  district = EXCLUDED.district,
  about_me = EXCLUDED.about_me,
  family_type = EXCLUDED.family_type,
  family_status = EXCLUDED.family_status,
  father_occupation = EXCLUDED.father_occupation,
  mother_occupation = EXCLUDED.mother_occupation,
  is_verified = EXCLUDED.is_verified,
  is_premium = EXCLUDED.is_premium,
  is_profile_complete = EXCLUDED.is_profile_complete,
  profile_completion_percent = EXCLUDED.profile_completion_percent,
  last_active_at = EXCLUDED.last_active_at;
INSERT INTO public.profiles (id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, father_occupation, mother_occupation, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at)
VALUES ('00000000-0000-4000-a000-00000000008e', 'TM000142', 'Gayathri Selvan', 'female', '2001-01-12', 152, 'never_married', 'Christian', 'RC Christian', NULL, 'no', 'B.Sc', 'B.Sc Graduate', 'Pharmacist', 'Pharmacist Details', '₹15 Lakhs - ₹20 Lakhs', 'Wipro', 'Chennai', 'Chennai', 'Hi, I am Gayathri. I have completed my B.Sc and am currently working as a Pharmacist at Wipro in Chennai. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'middle_class', 'Retired Employee', 'Homemaker', false, true, true, 100, NOW() - INTERVAL '0 days')
ON CONFLICT (id) DO UPDATE SET
  profile_id = EXCLUDED.profile_id,
  display_name = EXCLUDED.display_name,
  gender = EXCLUDED.gender,
  date_of_birth = EXCLUDED.date_of_birth,
  height_cm = EXCLUDED.height_cm,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  subcaste = EXCLUDED.subcaste,
  dosham = EXCLUDED.dosham,
  education = EXCLUDED.education,
  education_detail = EXCLUDED.education_detail,
  occupation = EXCLUDED.occupation,
  occupation_detail = EXCLUDED.occupation_detail,
  annual_income = EXCLUDED.annual_income,
  company_name = EXCLUDED.company_name,
  city = EXCLUDED.city,
  district = EXCLUDED.district,
  about_me = EXCLUDED.about_me,
  family_type = EXCLUDED.family_type,
  family_status = EXCLUDED.family_status,
  father_occupation = EXCLUDED.father_occupation,
  mother_occupation = EXCLUDED.mother_occupation,
  is_verified = EXCLUDED.is_verified,
  is_premium = EXCLUDED.is_premium,
  is_profile_complete = EXCLUDED.is_profile_complete,
  profile_completion_percent = EXCLUDED.profile_completion_percent,
  last_active_at = EXCLUDED.last_active_at;
INSERT INTO public.profiles (id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, father_occupation, mother_occupation, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at)
VALUES ('00000000-0000-4000-a000-00000000008f', 'TM000143', 'Surya Velan', 'male', '1992-01-25', 175, 'never_married', 'Hindu', 'Naicker', 'Naicker subcaste', 'no', 'M.Com', 'M.Com Graduate', 'Advocate', 'Advocate Details', '₹7 Lakhs - ₹10 Lakhs', 'HCL', 'Erode', 'Erode', 'Hi, I am Surya. I have completed my M.Com and am currently working as a Advocate at HCL in Erode. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'upper_middle_class', 'Retired Employee', 'Homemaker', false, false, true, 100, NOW() - INTERVAL '8 days')
ON CONFLICT (id) DO UPDATE SET
  profile_id = EXCLUDED.profile_id,
  display_name = EXCLUDED.display_name,
  gender = EXCLUDED.gender,
  date_of_birth = EXCLUDED.date_of_birth,
  height_cm = EXCLUDED.height_cm,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  subcaste = EXCLUDED.subcaste,
  dosham = EXCLUDED.dosham,
  education = EXCLUDED.education,
  education_detail = EXCLUDED.education_detail,
  occupation = EXCLUDED.occupation,
  occupation_detail = EXCLUDED.occupation_detail,
  annual_income = EXCLUDED.annual_income,
  company_name = EXCLUDED.company_name,
  city = EXCLUDED.city,
  district = EXCLUDED.district,
  about_me = EXCLUDED.about_me,
  family_type = EXCLUDED.family_type,
  family_status = EXCLUDED.family_status,
  father_occupation = EXCLUDED.father_occupation,
  mother_occupation = EXCLUDED.mother_occupation,
  is_verified = EXCLUDED.is_verified,
  is_premium = EXCLUDED.is_premium,
  is_profile_complete = EXCLUDED.is_profile_complete,
  profile_completion_percent = EXCLUDED.profile_completion_percent,
  last_active_at = EXCLUDED.last_active_at;
INSERT INTO public.profiles (id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, father_occupation, mother_occupation, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at)
VALUES ('00000000-0000-4000-a000-000000000090', 'TM000144', 'Gowri Shankar', 'female', '2002-08-14', 168, 'never_married', 'Muslim', 'Rawther', 'Rawther subcaste', 'no', 'M.Com', 'M.Com Graduate', 'College Professor', 'College Professor Details', '₹10 Lakhs - ₹15 Lakhs', 'Infosys', 'Tiruchirappalli', 'Trichy', 'Hi, I am Gowri. I have completed my M.Com and am currently working as a College Professor at Infosys in Tiruchirappalli. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'middle_class', 'Retired Employee', 'Homemaker', true, false, true, 100, NOW() - INTERVAL '7 days')
ON CONFLICT (id) DO UPDATE SET
  profile_id = EXCLUDED.profile_id,
  display_name = EXCLUDED.display_name,
  gender = EXCLUDED.gender,
  date_of_birth = EXCLUDED.date_of_birth,
  height_cm = EXCLUDED.height_cm,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  subcaste = EXCLUDED.subcaste,
  dosham = EXCLUDED.dosham,
  education = EXCLUDED.education,
  education_detail = EXCLUDED.education_detail,
  occupation = EXCLUDED.occupation,
  occupation_detail = EXCLUDED.occupation_detail,
  annual_income = EXCLUDED.annual_income,
  company_name = EXCLUDED.company_name,
  city = EXCLUDED.city,
  district = EXCLUDED.district,
  about_me = EXCLUDED.about_me,
  family_type = EXCLUDED.family_type,
  family_status = EXCLUDED.family_status,
  father_occupation = EXCLUDED.father_occupation,
  mother_occupation = EXCLUDED.mother_occupation,
  is_verified = EXCLUDED.is_verified,
  is_premium = EXCLUDED.is_premium,
  is_profile_complete = EXCLUDED.is_profile_complete,
  profile_completion_percent = EXCLUDED.profile_completion_percent,
  last_active_at = EXCLUDED.last_active_at;
INSERT INTO public.profiles (id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, father_occupation, mother_occupation, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at)
VALUES ('00000000-0000-4000-a000-000000000091', 'TM000145', 'Saravanan Nathan', 'male', '2004-08-03', 182, 'never_married', 'Hindu', 'Adi Dravida', 'Adi Dravida subcaste', 'no', 'Ph.D', 'Ph.D Graduate', 'Advocate', 'Advocate Details', '₹20 Lakhs+', 'Private Practice', 'Erode', 'Erode', 'Hi, I am Saravanan. I have completed my Ph.D and am currently working as a Advocate at Private Practice in Erode. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'rich', 'Retired Employee', 'Homemaker', true, false, true, 100, NOW() - INTERVAL '10 days')
ON CONFLICT (id) DO UPDATE SET
  profile_id = EXCLUDED.profile_id,
  display_name = EXCLUDED.display_name,
  gender = EXCLUDED.gender,
  date_of_birth = EXCLUDED.date_of_birth,
  height_cm = EXCLUDED.height_cm,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  subcaste = EXCLUDED.subcaste,
  dosham = EXCLUDED.dosham,
  education = EXCLUDED.education,
  education_detail = EXCLUDED.education_detail,
  occupation = EXCLUDED.occupation,
  occupation_detail = EXCLUDED.occupation_detail,
  annual_income = EXCLUDED.annual_income,
  company_name = EXCLUDED.company_name,
  city = EXCLUDED.city,
  district = EXCLUDED.district,
  about_me = EXCLUDED.about_me,
  family_type = EXCLUDED.family_type,
  family_status = EXCLUDED.family_status,
  father_occupation = EXCLUDED.father_occupation,
  mother_occupation = EXCLUDED.mother_occupation,
  is_verified = EXCLUDED.is_verified,
  is_premium = EXCLUDED.is_premium,
  is_profile_complete = EXCLUDED.is_profile_complete,
  profile_completion_percent = EXCLUDED.profile_completion_percent,
  last_active_at = EXCLUDED.last_active_at;
INSERT INTO public.profiles (id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, father_occupation, mother_occupation, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at)
VALUES ('00000000-0000-4000-a000-000000000092', 'TM000146', 'Banumathi Mani', 'female', '2001-01-28', 159, 'never_married', 'Hindu', 'Chettiar', NULL, 'yes', 'M.B.B.S', 'M.B.B.S Graduate', 'Software Engineer', 'Software Engineer Details', '₹15 Lakhs - ₹20 Lakhs', 'Accenture', 'Tirunelveli', 'Tirunelveli', 'Hi, I am Banumathi. I have completed my M.B.B.S and am currently working as a Software Engineer at Accenture in Tirunelveli. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'joint', 'upper_middle_class', 'Retired Employee', 'Homemaker', false, false, true, 100, NOW() - INTERVAL '0 days')
ON CONFLICT (id) DO UPDATE SET
  profile_id = EXCLUDED.profile_id,
  display_name = EXCLUDED.display_name,
  gender = EXCLUDED.gender,
  date_of_birth = EXCLUDED.date_of_birth,
  height_cm = EXCLUDED.height_cm,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  subcaste = EXCLUDED.subcaste,
  dosham = EXCLUDED.dosham,
  education = EXCLUDED.education,
  education_detail = EXCLUDED.education_detail,
  occupation = EXCLUDED.occupation,
  occupation_detail = EXCLUDED.occupation_detail,
  annual_income = EXCLUDED.annual_income,
  company_name = EXCLUDED.company_name,
  city = EXCLUDED.city,
  district = EXCLUDED.district,
  about_me = EXCLUDED.about_me,
  family_type = EXCLUDED.family_type,
  family_status = EXCLUDED.family_status,
  father_occupation = EXCLUDED.father_occupation,
  mother_occupation = EXCLUDED.mother_occupation,
  is_verified = EXCLUDED.is_verified,
  is_premium = EXCLUDED.is_premium,
  is_profile_complete = EXCLUDED.is_profile_complete,
  profile_completion_percent = EXCLUDED.profile_completion_percent,
  last_active_at = EXCLUDED.last_active_at;
INSERT INTO public.profiles (id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, father_occupation, mother_occupation, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at)
VALUES ('00000000-0000-4000-a000-000000000093', 'TM000147', 'Vijay Pandian', 'male', '1998-08-27', 166, 'never_married', 'Hindu', 'Vanniyar', NULL, 'yes', 'B.E. / B.Tech', 'B.E. / B.Tech Graduate', 'Civil Engineer', 'Civil Engineer Details', '₹7 Lakhs - ₹10 Lakhs', 'HCL', 'Tiruppur', 'Tiruppur', 'Hi, I am Vijay. I have completed my B.E. / B.Tech and am currently working as a Civil Engineer at HCL in Tiruppur. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'rich', 'Retired Employee', 'Homemaker', true, true, true, 100, NOW() - INTERVAL '8 days')
ON CONFLICT (id) DO UPDATE SET
  profile_id = EXCLUDED.profile_id,
  display_name = EXCLUDED.display_name,
  gender = EXCLUDED.gender,
  date_of_birth = EXCLUDED.date_of_birth,
  height_cm = EXCLUDED.height_cm,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  subcaste = EXCLUDED.subcaste,
  dosham = EXCLUDED.dosham,
  education = EXCLUDED.education,
  education_detail = EXCLUDED.education_detail,
  occupation = EXCLUDED.occupation,
  occupation_detail = EXCLUDED.occupation_detail,
  annual_income = EXCLUDED.annual_income,
  company_name = EXCLUDED.company_name,
  city = EXCLUDED.city,
  district = EXCLUDED.district,
  about_me = EXCLUDED.about_me,
  family_type = EXCLUDED.family_type,
  family_status = EXCLUDED.family_status,
  father_occupation = EXCLUDED.father_occupation,
  mother_occupation = EXCLUDED.mother_occupation,
  is_verified = EXCLUDED.is_verified,
  is_premium = EXCLUDED.is_premium,
  is_profile_complete = EXCLUDED.is_profile_complete,
  profile_completion_percent = EXCLUDED.profile_completion_percent,
  last_active_at = EXCLUDED.last_active_at;
INSERT INTO public.profiles (id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, father_occupation, mother_occupation, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at)
VALUES ('00000000-0000-4000-a000-000000000094', 'TM000148', 'Harini Kumar', 'female', '1999-01-05', 157, 'never_married', 'Hindu', 'Maravar', 'Maravar subcaste', 'no', 'B.E. / B.Tech', 'B.E. / B.Tech Graduate', 'Architect', 'Architect Details', '₹20 Lakhs+', 'Zoho', 'Erode', 'Erode', 'Hi, I am Harini. I have completed my B.E. / B.Tech and am currently working as a Architect at Zoho in Erode. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'middle_class', 'Retired Employee', 'Homemaker', false, false, true, 100, NOW() - INTERVAL '6 days')
ON CONFLICT (id) DO UPDATE SET
  profile_id = EXCLUDED.profile_id,
  display_name = EXCLUDED.display_name,
  gender = EXCLUDED.gender,
  date_of_birth = EXCLUDED.date_of_birth,
  height_cm = EXCLUDED.height_cm,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  subcaste = EXCLUDED.subcaste,
  dosham = EXCLUDED.dosham,
  education = EXCLUDED.education,
  education_detail = EXCLUDED.education_detail,
  occupation = EXCLUDED.occupation,
  occupation_detail = EXCLUDED.occupation_detail,
  annual_income = EXCLUDED.annual_income,
  company_name = EXCLUDED.company_name,
  city = EXCLUDED.city,
  district = EXCLUDED.district,
  about_me = EXCLUDED.about_me,
  family_type = EXCLUDED.family_type,
  family_status = EXCLUDED.family_status,
  father_occupation = EXCLUDED.father_occupation,
  mother_occupation = EXCLUDED.mother_occupation,
  is_verified = EXCLUDED.is_verified,
  is_premium = EXCLUDED.is_premium,
  is_profile_complete = EXCLUDED.is_profile_complete,
  profile_completion_percent = EXCLUDED.profile_completion_percent,
  last_active_at = EXCLUDED.last_active_at;
INSERT INTO public.profiles (id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, father_occupation, mother_occupation, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at)
VALUES ('00000000-0000-4000-a000-000000000095', 'TM000149', 'Ramakrishnan Swamy', 'male', '1993-12-03', 175, 'divorced', 'Hindu', 'Maravar', 'Maravar subcaste', 'no', 'M.B.B.S', 'M.B.B.S Graduate', 'School Teacher', 'School Teacher Details', '₹15 Lakhs - ₹20 Lakhs', 'HCL', 'Tiruppur', 'Tiruppur', 'Hi, I am Ramakrishnan. I have completed my M.B.B.S and am currently working as a School Teacher at HCL in Tiruppur. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'rich', 'Retired Employee', 'Homemaker', true, true, true, 100, NOW() - INTERVAL '7 days')
ON CONFLICT (id) DO UPDATE SET
  profile_id = EXCLUDED.profile_id,
  display_name = EXCLUDED.display_name,
  gender = EXCLUDED.gender,
  date_of_birth = EXCLUDED.date_of_birth,
  height_cm = EXCLUDED.height_cm,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  subcaste = EXCLUDED.subcaste,
  dosham = EXCLUDED.dosham,
  education = EXCLUDED.education,
  education_detail = EXCLUDED.education_detail,
  occupation = EXCLUDED.occupation,
  occupation_detail = EXCLUDED.occupation_detail,
  annual_income = EXCLUDED.annual_income,
  company_name = EXCLUDED.company_name,
  city = EXCLUDED.city,
  district = EXCLUDED.district,
  about_me = EXCLUDED.about_me,
  family_type = EXCLUDED.family_type,
  family_status = EXCLUDED.family_status,
  father_occupation = EXCLUDED.father_occupation,
  mother_occupation = EXCLUDED.mother_occupation,
  is_verified = EXCLUDED.is_verified,
  is_premium = EXCLUDED.is_premium,
  is_profile_complete = EXCLUDED.is_profile_complete,
  profile_completion_percent = EXCLUDED.profile_completion_percent,
  last_active_at = EXCLUDED.last_active_at;
INSERT INTO public.profiles (id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, father_occupation, mother_occupation, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at)
VALUES ('00000000-0000-4000-a000-000000000096', 'TM000150', 'Swetha Raj', 'female', '2003-09-01', 154, 'never_married', 'Hindu', 'Pillai', 'Pillai subcaste', 'yes', 'B.A', 'B.A Graduate', 'Mechanical Engineer', 'Mechanical Engineer Details', '₹7 Lakhs - ₹10 Lakhs', 'Infosys', 'Chennai', 'Chennai', 'Hi, I am Swetha. I have completed my B.A and am currently working as a Mechanical Engineer at Infosys in Chennai. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'middle_class', 'Retired Employee', 'Homemaker', true, false, true, 100, NOW() - INTERVAL '4 days')
ON CONFLICT (id) DO UPDATE SET
  profile_id = EXCLUDED.profile_id,
  display_name = EXCLUDED.display_name,
  gender = EXCLUDED.gender,
  date_of_birth = EXCLUDED.date_of_birth,
  height_cm = EXCLUDED.height_cm,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  subcaste = EXCLUDED.subcaste,
  dosham = EXCLUDED.dosham,
  education = EXCLUDED.education,
  education_detail = EXCLUDED.education_detail,
  occupation = EXCLUDED.occupation,
  occupation_detail = EXCLUDED.occupation_detail,
  annual_income = EXCLUDED.annual_income,
  company_name = EXCLUDED.company_name,
  city = EXCLUDED.city,
  district = EXCLUDED.district,
  about_me = EXCLUDED.about_me,
  family_type = EXCLUDED.family_type,
  family_status = EXCLUDED.family_status,
  father_occupation = EXCLUDED.father_occupation,
  mother_occupation = EXCLUDED.mother_occupation,
  is_verified = EXCLUDED.is_verified,
  is_premium = EXCLUDED.is_premium,
  is_profile_complete = EXCLUDED.is_profile_complete,
  profile_completion_percent = EXCLUDED.profile_completion_percent,
  last_active_at = EXCLUDED.last_active_at;
INSERT INTO public.profiles (id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, father_occupation, mother_occupation, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at)
VALUES ('00000000-0000-4000-a000-000000000097', 'TM000151', 'Vignesh Nathan', 'male', '2003-10-05', 179, 'never_married', 'Hindu', 'Brahmin - Iyengar', NULL, 'no', 'B.Ed', 'B.Ed Graduate', 'Pharmacist', 'Pharmacist Details', '₹5 Lakhs - ₹7 Lakhs', 'Infosys', 'Chennai', 'Chennai', 'Hi, I am Vignesh. I have completed my B.Ed and am currently working as a Pharmacist at Infosys in Chennai. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'middle_class', 'Retired Employee', 'Homemaker', false, false, true, 100, NOW() - INTERVAL '1 days')
ON CONFLICT (id) DO UPDATE SET
  profile_id = EXCLUDED.profile_id,
  display_name = EXCLUDED.display_name,
  gender = EXCLUDED.gender,
  date_of_birth = EXCLUDED.date_of_birth,
  height_cm = EXCLUDED.height_cm,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  subcaste = EXCLUDED.subcaste,
  dosham = EXCLUDED.dosham,
  education = EXCLUDED.education,
  education_detail = EXCLUDED.education_detail,
  occupation = EXCLUDED.occupation,
  occupation_detail = EXCLUDED.occupation_detail,
  annual_income = EXCLUDED.annual_income,
  company_name = EXCLUDED.company_name,
  city = EXCLUDED.city,
  district = EXCLUDED.district,
  about_me = EXCLUDED.about_me,
  family_type = EXCLUDED.family_type,
  family_status = EXCLUDED.family_status,
  father_occupation = EXCLUDED.father_occupation,
  mother_occupation = EXCLUDED.mother_occupation,
  is_verified = EXCLUDED.is_verified,
  is_premium = EXCLUDED.is_premium,
  is_profile_complete = EXCLUDED.is_profile_complete,
  profile_completion_percent = EXCLUDED.profile_completion_percent,
  last_active_at = EXCLUDED.last_active_at;
INSERT INTO public.profiles (id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, father_occupation, mother_occupation, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at)
VALUES ('00000000-0000-4000-a000-000000000098', 'TM000152', 'Soundarya Raj', 'female', '1988-06-08', 173, 'never_married', 'Hindu', 'Thevar', 'Thevar subcaste', 'no', 'M.B.A', 'M.B.A Graduate', 'College Professor', 'College Professor Details', '₹7 Lakhs - ₹10 Lakhs', 'TCS', 'Vellore', 'Vellore', 'Hi, I am Soundarya. I have completed my M.B.A and am currently working as a College Professor at TCS in Vellore. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'rich', 'Retired Employee', 'Homemaker', false, false, true, 100, NOW() - INTERVAL '1 days')
ON CONFLICT (id) DO UPDATE SET
  profile_id = EXCLUDED.profile_id,
  display_name = EXCLUDED.display_name,
  gender = EXCLUDED.gender,
  date_of_birth = EXCLUDED.date_of_birth,
  height_cm = EXCLUDED.height_cm,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  subcaste = EXCLUDED.subcaste,
  dosham = EXCLUDED.dosham,
  education = EXCLUDED.education,
  education_detail = EXCLUDED.education_detail,
  occupation = EXCLUDED.occupation,
  occupation_detail = EXCLUDED.occupation_detail,
  annual_income = EXCLUDED.annual_income,
  company_name = EXCLUDED.company_name,
  city = EXCLUDED.city,
  district = EXCLUDED.district,
  about_me = EXCLUDED.about_me,
  family_type = EXCLUDED.family_type,
  family_status = EXCLUDED.family_status,
  father_occupation = EXCLUDED.father_occupation,
  mother_occupation = EXCLUDED.mother_occupation,
  is_verified = EXCLUDED.is_verified,
  is_premium = EXCLUDED.is_premium,
  is_profile_complete = EXCLUDED.is_profile_complete,
  profile_completion_percent = EXCLUDED.profile_completion_percent,
  last_active_at = EXCLUDED.last_active_at;
INSERT INTO public.profiles (id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, father_occupation, mother_occupation, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at)
VALUES ('00000000-0000-4000-a000-000000000099', 'TM000153', 'Sakthi Selvan', 'male', '1999-09-02', 162, 'never_married', 'Hindu', 'Brahmin - Iyengar', NULL, 'no', 'M.A', 'M.A Graduate', 'Dentist', 'Dentist Details', '₹7 Lakhs - ₹10 Lakhs', 'Zoho', 'Kanchipuram', 'Kanchipuram', 'Hi, I am Sakthi. I have completed my M.A and am currently working as a Dentist at Zoho in Kanchipuram. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'upper_middle_class', 'Retired Employee', 'Homemaker', true, true, true, 100, NOW() - INTERVAL '5 days')
ON CONFLICT (id) DO UPDATE SET
  profile_id = EXCLUDED.profile_id,
  display_name = EXCLUDED.display_name,
  gender = EXCLUDED.gender,
  date_of_birth = EXCLUDED.date_of_birth,
  height_cm = EXCLUDED.height_cm,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  subcaste = EXCLUDED.subcaste,
  dosham = EXCLUDED.dosham,
  education = EXCLUDED.education,
  education_detail = EXCLUDED.education_detail,
  occupation = EXCLUDED.occupation,
  occupation_detail = EXCLUDED.occupation_detail,
  annual_income = EXCLUDED.annual_income,
  company_name = EXCLUDED.company_name,
  city = EXCLUDED.city,
  district = EXCLUDED.district,
  about_me = EXCLUDED.about_me,
  family_type = EXCLUDED.family_type,
  family_status = EXCLUDED.family_status,
  father_occupation = EXCLUDED.father_occupation,
  mother_occupation = EXCLUDED.mother_occupation,
  is_verified = EXCLUDED.is_verified,
  is_premium = EXCLUDED.is_premium,
  is_profile_complete = EXCLUDED.is_profile_complete,
  profile_completion_percent = EXCLUDED.profile_completion_percent,
  last_active_at = EXCLUDED.last_active_at;
INSERT INTO public.profiles (id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, father_occupation, mother_occupation, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at)
VALUES ('00000000-0000-4000-a000-00000000009a', 'TM000154', 'Vidya Murthy', 'female', '1996-08-23', 167, 'never_married', 'Hindu', 'Brahmin - Iyer', NULL, 'no', 'B.E. / B.Tech', 'B.E. / B.Tech Graduate', 'Mechanical Engineer', 'Mechanical Engineer Details', '₹5 Lakhs - ₹7 Lakhs', 'Private Practice', 'Tiruppur', 'Tiruppur', 'Hi, I am Vidya. I have completed my B.E. / B.Tech and am currently working as a Mechanical Engineer at Private Practice in Tiruppur. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'middle_class', 'Retired Employee', 'Homemaker', true, false, true, 100, NOW() - INTERVAL '2 days')
ON CONFLICT (id) DO UPDATE SET
  profile_id = EXCLUDED.profile_id,
  display_name = EXCLUDED.display_name,
  gender = EXCLUDED.gender,
  date_of_birth = EXCLUDED.date_of_birth,
  height_cm = EXCLUDED.height_cm,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  subcaste = EXCLUDED.subcaste,
  dosham = EXCLUDED.dosham,
  education = EXCLUDED.education,
  education_detail = EXCLUDED.education_detail,
  occupation = EXCLUDED.occupation,
  occupation_detail = EXCLUDED.occupation_detail,
  annual_income = EXCLUDED.annual_income,
  company_name = EXCLUDED.company_name,
  city = EXCLUDED.city,
  district = EXCLUDED.district,
  about_me = EXCLUDED.about_me,
  family_type = EXCLUDED.family_type,
  family_status = EXCLUDED.family_status,
  father_occupation = EXCLUDED.father_occupation,
  mother_occupation = EXCLUDED.mother_occupation,
  is_verified = EXCLUDED.is_verified,
  is_premium = EXCLUDED.is_premium,
  is_profile_complete = EXCLUDED.is_profile_complete,
  profile_completion_percent = EXCLUDED.profile_completion_percent,
  last_active_at = EXCLUDED.last_active_at;
INSERT INTO public.profiles (id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, father_occupation, mother_occupation, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at)
VALUES ('00000000-0000-4000-a000-00000000009b', 'TM000155', 'Sathish Swamy', 'male', '1997-06-20', 182, 'divorced', 'Hindu', 'Vanniyar', NULL, 'no', 'B.A', 'B.A Graduate', 'Government Officer', 'Government Officer Details', '₹5 Lakhs - ₹7 Lakhs', 'Cognizant', 'Kanchipuram', 'Kanchipuram', 'Hi, I am Sathish. I have completed my B.A and am currently working as a Government Officer at Cognizant in Kanchipuram. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'middle_class', 'Retired Employee', 'Homemaker', true, false, true, 100, NOW() - INTERVAL '4 days')
ON CONFLICT (id) DO UPDATE SET
  profile_id = EXCLUDED.profile_id,
  display_name = EXCLUDED.display_name,
  gender = EXCLUDED.gender,
  date_of_birth = EXCLUDED.date_of_birth,
  height_cm = EXCLUDED.height_cm,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  subcaste = EXCLUDED.subcaste,
  dosham = EXCLUDED.dosham,
  education = EXCLUDED.education,
  education_detail = EXCLUDED.education_detail,
  occupation = EXCLUDED.occupation,
  occupation_detail = EXCLUDED.occupation_detail,
  annual_income = EXCLUDED.annual_income,
  company_name = EXCLUDED.company_name,
  city = EXCLUDED.city,
  district = EXCLUDED.district,
  about_me = EXCLUDED.about_me,
  family_type = EXCLUDED.family_type,
  family_status = EXCLUDED.family_status,
  father_occupation = EXCLUDED.father_occupation,
  mother_occupation = EXCLUDED.mother_occupation,
  is_verified = EXCLUDED.is_verified,
  is_premium = EXCLUDED.is_premium,
  is_profile_complete = EXCLUDED.is_profile_complete,
  profile_completion_percent = EXCLUDED.profile_completion_percent,
  last_active_at = EXCLUDED.last_active_at;
INSERT INTO public.profiles (id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, father_occupation, mother_occupation, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at)
VALUES ('00000000-0000-4000-a000-00000000009c', 'TM000156', 'Malathi Samy', 'female', '2001-07-01', 150, 'never_married', 'Hindu', 'Naicker', NULL, 'no', 'B.A', 'B.A Graduate', 'School Teacher', 'School Teacher Details', '₹20 Lakhs+', 'Wipro', 'Kanchipuram', 'Kanchipuram', 'Hi, I am Malathi. I have completed my B.A and am currently working as a School Teacher at Wipro in Kanchipuram. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'middle_class', 'Retired Employee', 'Homemaker', true, false, true, 100, NOW() - INTERVAL '5 days')
ON CONFLICT (id) DO UPDATE SET
  profile_id = EXCLUDED.profile_id,
  display_name = EXCLUDED.display_name,
  gender = EXCLUDED.gender,
  date_of_birth = EXCLUDED.date_of_birth,
  height_cm = EXCLUDED.height_cm,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  subcaste = EXCLUDED.subcaste,
  dosham = EXCLUDED.dosham,
  education = EXCLUDED.education,
  education_detail = EXCLUDED.education_detail,
  occupation = EXCLUDED.occupation,
  occupation_detail = EXCLUDED.occupation_detail,
  annual_income = EXCLUDED.annual_income,
  company_name = EXCLUDED.company_name,
  city = EXCLUDED.city,
  district = EXCLUDED.district,
  about_me = EXCLUDED.about_me,
  family_type = EXCLUDED.family_type,
  family_status = EXCLUDED.family_status,
  father_occupation = EXCLUDED.father_occupation,
  mother_occupation = EXCLUDED.mother_occupation,
  is_verified = EXCLUDED.is_verified,
  is_premium = EXCLUDED.is_premium,
  is_profile_complete = EXCLUDED.is_profile_complete,
  profile_completion_percent = EXCLUDED.profile_completion_percent,
  last_active_at = EXCLUDED.last_active_at;
INSERT INTO public.profiles (id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, father_occupation, mother_occupation, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at)
VALUES ('00000000-0000-4000-a000-00000000009d', 'TM000157', 'Gautham Velan', 'male', '1992-04-28', 172, 'never_married', 'Hindu', 'Yadav', NULL, 'no', 'B.Sc', 'B.Sc Graduate', 'College Professor', 'College Professor Details', '₹20 Lakhs+', 'Zoho', 'Tiruppur', 'Tiruppur', 'Hi, I am Gautham. I have completed my B.Sc and am currently working as a College Professor at Zoho in Tiruppur. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'upper_middle_class', 'Retired Employee', 'Homemaker', false, false, true, 100, NOW() - INTERVAL '9 days')
ON CONFLICT (id) DO UPDATE SET
  profile_id = EXCLUDED.profile_id,
  display_name = EXCLUDED.display_name,
  gender = EXCLUDED.gender,
  date_of_birth = EXCLUDED.date_of_birth,
  height_cm = EXCLUDED.height_cm,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  subcaste = EXCLUDED.subcaste,
  dosham = EXCLUDED.dosham,
  education = EXCLUDED.education,
  education_detail = EXCLUDED.education_detail,
  occupation = EXCLUDED.occupation,
  occupation_detail = EXCLUDED.occupation_detail,
  annual_income = EXCLUDED.annual_income,
  company_name = EXCLUDED.company_name,
  city = EXCLUDED.city,
  district = EXCLUDED.district,
  about_me = EXCLUDED.about_me,
  family_type = EXCLUDED.family_type,
  family_status = EXCLUDED.family_status,
  father_occupation = EXCLUDED.father_occupation,
  mother_occupation = EXCLUDED.mother_occupation,
  is_verified = EXCLUDED.is_verified,
  is_premium = EXCLUDED.is_premium,
  is_profile_complete = EXCLUDED.is_profile_complete,
  profile_completion_percent = EXCLUDED.profile_completion_percent,
  last_active_at = EXCLUDED.last_active_at;
INSERT INTO public.profiles (id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, father_occupation, mother_occupation, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at)
VALUES ('00000000-0000-4000-a000-00000000009e', 'TM000158', 'Malathi Swamy', 'female', '1998-04-07', 164, 'never_married', 'Hindu', 'Brahmin - Iyer', 'Brahmin - Iyer subcaste', 'yes', 'M.Sc', 'M.Sc Graduate', 'College Professor', 'College Professor Details', '₹7 Lakhs - ₹10 Lakhs', 'Wipro', 'Erode', 'Erode', 'Hi, I am Malathi. I have completed my M.Sc and am currently working as a College Professor at Wipro in Erode. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'joint', 'rich', 'Retired Employee', 'Homemaker', true, true, true, 100, NOW() - INTERVAL '0 days')
ON CONFLICT (id) DO UPDATE SET
  profile_id = EXCLUDED.profile_id,
  display_name = EXCLUDED.display_name,
  gender = EXCLUDED.gender,
  date_of_birth = EXCLUDED.date_of_birth,
  height_cm = EXCLUDED.height_cm,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  subcaste = EXCLUDED.subcaste,
  dosham = EXCLUDED.dosham,
  education = EXCLUDED.education,
  education_detail = EXCLUDED.education_detail,
  occupation = EXCLUDED.occupation,
  occupation_detail = EXCLUDED.occupation_detail,
  annual_income = EXCLUDED.annual_income,
  company_name = EXCLUDED.company_name,
  city = EXCLUDED.city,
  district = EXCLUDED.district,
  about_me = EXCLUDED.about_me,
  family_type = EXCLUDED.family_type,
  family_status = EXCLUDED.family_status,
  father_occupation = EXCLUDED.father_occupation,
  mother_occupation = EXCLUDED.mother_occupation,
  is_verified = EXCLUDED.is_verified,
  is_premium = EXCLUDED.is_premium,
  is_profile_complete = EXCLUDED.is_profile_complete,
  profile_completion_percent = EXCLUDED.profile_completion_percent,
  last_active_at = EXCLUDED.last_active_at;
INSERT INTO public.profiles (id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, father_occupation, mother_occupation, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at)
VALUES ('00000000-0000-4000-a000-00000000009f', 'TM000159', 'Dinesh Mani', 'male', '1995-01-25', 188, 'never_married', 'Hindu', 'Maravar', 'Maravar subcaste', 'no', 'M.B.B.S', 'M.B.B.S Graduate', 'Police Officer', 'Police Officer Details', '₹10 Lakhs - ₹15 Lakhs', 'Self Employed', 'Thoothukudi', 'Tuticorin', 'Hi, I am Dinesh. I have completed my M.B.B.S and am currently working as a Police Officer at Self Employed in Thoothukudi. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'rich', 'Retired Employee', 'Homemaker', true, false, true, 100, NOW() - INTERVAL '2 days')
ON CONFLICT (id) DO UPDATE SET
  profile_id = EXCLUDED.profile_id,
  display_name = EXCLUDED.display_name,
  gender = EXCLUDED.gender,
  date_of_birth = EXCLUDED.date_of_birth,
  height_cm = EXCLUDED.height_cm,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  subcaste = EXCLUDED.subcaste,
  dosham = EXCLUDED.dosham,
  education = EXCLUDED.education,
  education_detail = EXCLUDED.education_detail,
  occupation = EXCLUDED.occupation,
  occupation_detail = EXCLUDED.occupation_detail,
  annual_income = EXCLUDED.annual_income,
  company_name = EXCLUDED.company_name,
  city = EXCLUDED.city,
  district = EXCLUDED.district,
  about_me = EXCLUDED.about_me,
  family_type = EXCLUDED.family_type,
  family_status = EXCLUDED.family_status,
  father_occupation = EXCLUDED.father_occupation,
  mother_occupation = EXCLUDED.mother_occupation,
  is_verified = EXCLUDED.is_verified,
  is_premium = EXCLUDED.is_premium,
  is_profile_complete = EXCLUDED.is_profile_complete,
  profile_completion_percent = EXCLUDED.profile_completion_percent,
  last_active_at = EXCLUDED.last_active_at;
INSERT INTO public.profiles (id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, father_occupation, mother_occupation, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at)
VALUES ('00000000-0000-4000-a000-0000000000a0', 'TM000160', 'Vanitha Mani', 'female', '2005-02-03', 174, 'never_married', 'Hindu', 'Maravar', 'Maravar subcaste', 'yes', 'B.A', 'B.A Graduate', 'Pharmacist', 'Pharmacist Details', '₹7 Lakhs - ₹10 Lakhs', 'TCS', 'Thoothukudi', 'Tuticorin', 'Hi, I am Vanitha. I have completed my B.A and am currently working as a Pharmacist at TCS in Thoothukudi. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'rich', 'Retired Employee', 'Homemaker', true, true, true, 100, NOW() - INTERVAL '6 days')
ON CONFLICT (id) DO UPDATE SET
  profile_id = EXCLUDED.profile_id,
  display_name = EXCLUDED.display_name,
  gender = EXCLUDED.gender,
  date_of_birth = EXCLUDED.date_of_birth,
  height_cm = EXCLUDED.height_cm,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  subcaste = EXCLUDED.subcaste,
  dosham = EXCLUDED.dosham,
  education = EXCLUDED.education,
  education_detail = EXCLUDED.education_detail,
  occupation = EXCLUDED.occupation,
  occupation_detail = EXCLUDED.occupation_detail,
  annual_income = EXCLUDED.annual_income,
  company_name = EXCLUDED.company_name,
  city = EXCLUDED.city,
  district = EXCLUDED.district,
  about_me = EXCLUDED.about_me,
  family_type = EXCLUDED.family_type,
  family_status = EXCLUDED.family_status,
  father_occupation = EXCLUDED.father_occupation,
  mother_occupation = EXCLUDED.mother_occupation,
  is_verified = EXCLUDED.is_verified,
  is_premium = EXCLUDED.is_premium,
  is_profile_complete = EXCLUDED.is_profile_complete,
  profile_completion_percent = EXCLUDED.profile_completion_percent,
  last_active_at = EXCLUDED.last_active_at;
INSERT INTO public.profiles (id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, father_occupation, mother_occupation, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at)
VALUES ('00000000-0000-4000-a000-0000000000a1', 'TM000161', 'Siddharth Krishnan', 'male', '1990-03-04', 181, 'never_married', 'Hindu', 'Brahmin - Iyer', 'Brahmin - Iyer subcaste', 'yes', 'B.Com', 'B.Com Graduate', 'Architect', 'Architect Details', '₹10 Lakhs - ₹15 Lakhs', 'Zoho', 'Salem', 'Salem', 'Hi, I am Siddharth. I have completed my B.Com and am currently working as a Architect at Zoho in Salem. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'middle_class', 'Retired Employee', 'Homemaker', true, false, true, 100, NOW() - INTERVAL '0 days')
ON CONFLICT (id) DO UPDATE SET
  profile_id = EXCLUDED.profile_id,
  display_name = EXCLUDED.display_name,
  gender = EXCLUDED.gender,
  date_of_birth = EXCLUDED.date_of_birth,
  height_cm = EXCLUDED.height_cm,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  subcaste = EXCLUDED.subcaste,
  dosham = EXCLUDED.dosham,
  education = EXCLUDED.education,
  education_detail = EXCLUDED.education_detail,
  occupation = EXCLUDED.occupation,
  occupation_detail = EXCLUDED.occupation_detail,
  annual_income = EXCLUDED.annual_income,
  company_name = EXCLUDED.company_name,
  city = EXCLUDED.city,
  district = EXCLUDED.district,
  about_me = EXCLUDED.about_me,
  family_type = EXCLUDED.family_type,
  family_status = EXCLUDED.family_status,
  father_occupation = EXCLUDED.father_occupation,
  mother_occupation = EXCLUDED.mother_occupation,
  is_verified = EXCLUDED.is_verified,
  is_premium = EXCLUDED.is_premium,
  is_profile_complete = EXCLUDED.is_profile_complete,
  profile_completion_percent = EXCLUDED.profile_completion_percent,
  last_active_at = EXCLUDED.last_active_at;
INSERT INTO public.profiles (id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, father_occupation, mother_occupation, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at)
VALUES ('00000000-0000-4000-a000-0000000000a2', 'TM000162', 'Chitra Naicker', 'female', '2003-04-25', 165, 'never_married', 'Hindu', 'Pillai', NULL, 'no', 'B.Sc', 'B.Sc Graduate', 'Pharmacist', 'Pharmacist Details', '₹20 Lakhs+', 'Wipro', 'Tirunelveli', 'Tirunelveli', 'Hi, I am Chitra. I have completed my B.Sc and am currently working as a Pharmacist at Wipro in Tirunelveli. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'rich', 'Retired Employee', 'Homemaker', true, true, true, 100, NOW() - INTERVAL '2 days')
ON CONFLICT (id) DO UPDATE SET
  profile_id = EXCLUDED.profile_id,
  display_name = EXCLUDED.display_name,
  gender = EXCLUDED.gender,
  date_of_birth = EXCLUDED.date_of_birth,
  height_cm = EXCLUDED.height_cm,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  subcaste = EXCLUDED.subcaste,
  dosham = EXCLUDED.dosham,
  education = EXCLUDED.education,
  education_detail = EXCLUDED.education_detail,
  occupation = EXCLUDED.occupation,
  occupation_detail = EXCLUDED.occupation_detail,
  annual_income = EXCLUDED.annual_income,
  company_name = EXCLUDED.company_name,
  city = EXCLUDED.city,
  district = EXCLUDED.district,
  about_me = EXCLUDED.about_me,
  family_type = EXCLUDED.family_type,
  family_status = EXCLUDED.family_status,
  father_occupation = EXCLUDED.father_occupation,
  mother_occupation = EXCLUDED.mother_occupation,
  is_verified = EXCLUDED.is_verified,
  is_premium = EXCLUDED.is_premium,
  is_profile_complete = EXCLUDED.is_profile_complete,
  profile_completion_percent = EXCLUDED.profile_completion_percent,
  last_active_at = EXCLUDED.last_active_at;
INSERT INTO public.profiles (id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, father_occupation, mother_occupation, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at)
VALUES ('00000000-0000-4000-a000-0000000000a3', 'TM000163', 'Shankar Krishnan', 'male', '1988-05-06', 169, 'never_married', 'Hindu', 'Adi Dravida', NULL, 'no', 'M.B.A', 'M.B.A Graduate', 'Civil Engineer', 'Civil Engineer Details', '₹5 Lakhs - ₹7 Lakhs', 'Government Service', 'Chennai', 'Chennai', 'Hi, I am Shankar. I have completed my M.B.A and am currently working as a Civil Engineer at Government Service in Chennai. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'joint', 'middle_class', 'Retired Employee', 'Homemaker', true, false, true, 100, NOW() - INTERVAL '1 days')
ON CONFLICT (id) DO UPDATE SET
  profile_id = EXCLUDED.profile_id,
  display_name = EXCLUDED.display_name,
  gender = EXCLUDED.gender,
  date_of_birth = EXCLUDED.date_of_birth,
  height_cm = EXCLUDED.height_cm,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  subcaste = EXCLUDED.subcaste,
  dosham = EXCLUDED.dosham,
  education = EXCLUDED.education,
  education_detail = EXCLUDED.education_detail,
  occupation = EXCLUDED.occupation,
  occupation_detail = EXCLUDED.occupation_detail,
  annual_income = EXCLUDED.annual_income,
  company_name = EXCLUDED.company_name,
  city = EXCLUDED.city,
  district = EXCLUDED.district,
  about_me = EXCLUDED.about_me,
  family_type = EXCLUDED.family_type,
  family_status = EXCLUDED.family_status,
  father_occupation = EXCLUDED.father_occupation,
  mother_occupation = EXCLUDED.mother_occupation,
  is_verified = EXCLUDED.is_verified,
  is_premium = EXCLUDED.is_premium,
  is_profile_complete = EXCLUDED.is_profile_complete,
  profile_completion_percent = EXCLUDED.profile_completion_percent,
  last_active_at = EXCLUDED.last_active_at;
INSERT INTO public.profiles (id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, father_occupation, mother_occupation, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at)
VALUES ('00000000-0000-4000-a000-0000000000a4', 'TM000164', 'Indhumathi Krishnan', 'female', '2001-09-06', 153, 'never_married', 'Muslim', 'Labbai', 'Labbai subcaste', 'no', 'M.Com', 'M.Com Graduate', 'College Professor', 'College Professor Details', '₹3 Lakhs - ₹5 Lakhs', 'Private Practice', 'Tiruppur', 'Tiruppur', 'Hi, I am Indhumathi. I have completed my M.Com and am currently working as a College Professor at Private Practice in Tiruppur. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'rich', 'Retired Employee', 'Homemaker', true, true, true, 100, NOW() - INTERVAL '1 days')
ON CONFLICT (id) DO UPDATE SET
  profile_id = EXCLUDED.profile_id,
  display_name = EXCLUDED.display_name,
  gender = EXCLUDED.gender,
  date_of_birth = EXCLUDED.date_of_birth,
  height_cm = EXCLUDED.height_cm,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  subcaste = EXCLUDED.subcaste,
  dosham = EXCLUDED.dosham,
  education = EXCLUDED.education,
  education_detail = EXCLUDED.education_detail,
  occupation = EXCLUDED.occupation,
  occupation_detail = EXCLUDED.occupation_detail,
  annual_income = EXCLUDED.annual_income,
  company_name = EXCLUDED.company_name,
  city = EXCLUDED.city,
  district = EXCLUDED.district,
  about_me = EXCLUDED.about_me,
  family_type = EXCLUDED.family_type,
  family_status = EXCLUDED.family_status,
  father_occupation = EXCLUDED.father_occupation,
  mother_occupation = EXCLUDED.mother_occupation,
  is_verified = EXCLUDED.is_verified,
  is_premium = EXCLUDED.is_premium,
  is_profile_complete = EXCLUDED.is_profile_complete,
  profile_completion_percent = EXCLUDED.profile_completion_percent,
  last_active_at = EXCLUDED.last_active_at;
INSERT INTO public.profiles (id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, father_occupation, mother_occupation, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at)
VALUES ('00000000-0000-4000-a000-0000000000a5', 'TM000165', 'Prabhu Pandian', 'male', '1998-12-15', 163, 'never_married', 'Hindu', 'Naicker', 'Naicker subcaste', 'no', 'B.Ed', 'B.Ed Graduate', 'Civil Engineer', 'Civil Engineer Details', '₹20 Lakhs+', 'TCS', 'Erode', 'Erode', 'Hi, I am Prabhu. I have completed my B.Ed and am currently working as a Civil Engineer at TCS in Erode. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'rich', 'Retired Employee', 'Homemaker', false, false, true, 100, NOW() - INTERVAL '9 days')
ON CONFLICT (id) DO UPDATE SET
  profile_id = EXCLUDED.profile_id,
  display_name = EXCLUDED.display_name,
  gender = EXCLUDED.gender,
  date_of_birth = EXCLUDED.date_of_birth,
  height_cm = EXCLUDED.height_cm,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  subcaste = EXCLUDED.subcaste,
  dosham = EXCLUDED.dosham,
  education = EXCLUDED.education,
  education_detail = EXCLUDED.education_detail,
  occupation = EXCLUDED.occupation,
  occupation_detail = EXCLUDED.occupation_detail,
  annual_income = EXCLUDED.annual_income,
  company_name = EXCLUDED.company_name,
  city = EXCLUDED.city,
  district = EXCLUDED.district,
  about_me = EXCLUDED.about_me,
  family_type = EXCLUDED.family_type,
  family_status = EXCLUDED.family_status,
  father_occupation = EXCLUDED.father_occupation,
  mother_occupation = EXCLUDED.mother_occupation,
  is_verified = EXCLUDED.is_verified,
  is_premium = EXCLUDED.is_premium,
  is_profile_complete = EXCLUDED.is_profile_complete,
  profile_completion_percent = EXCLUDED.profile_completion_percent,
  last_active_at = EXCLUDED.last_active_at;
INSERT INTO public.profiles (id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, father_occupation, mother_occupation, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at)
VALUES ('00000000-0000-4000-a000-0000000000a6', 'TM000166', 'Janani Murthy', 'female', '1991-04-17', 151, 'never_married', 'Hindu', 'Naicker', 'Naicker subcaste', 'no', 'B.Com', 'B.Com Graduate', 'Architect', 'Architect Details', '₹20 Lakhs+', 'Accenture', 'Salem', 'Salem', 'Hi, I am Janani. I have completed my B.Com and am currently working as a Architect at Accenture in Salem. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'rich', 'Retired Employee', 'Homemaker', true, true, true, 100, NOW() - INTERVAL '5 days')
ON CONFLICT (id) DO UPDATE SET
  profile_id = EXCLUDED.profile_id,
  display_name = EXCLUDED.display_name,
  gender = EXCLUDED.gender,
  date_of_birth = EXCLUDED.date_of_birth,
  height_cm = EXCLUDED.height_cm,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  subcaste = EXCLUDED.subcaste,
  dosham = EXCLUDED.dosham,
  education = EXCLUDED.education,
  education_detail = EXCLUDED.education_detail,
  occupation = EXCLUDED.occupation,
  occupation_detail = EXCLUDED.occupation_detail,
  annual_income = EXCLUDED.annual_income,
  company_name = EXCLUDED.company_name,
  city = EXCLUDED.city,
  district = EXCLUDED.district,
  about_me = EXCLUDED.about_me,
  family_type = EXCLUDED.family_type,
  family_status = EXCLUDED.family_status,
  father_occupation = EXCLUDED.father_occupation,
  mother_occupation = EXCLUDED.mother_occupation,
  is_verified = EXCLUDED.is_verified,
  is_premium = EXCLUDED.is_premium,
  is_profile_complete = EXCLUDED.is_profile_complete,
  profile_completion_percent = EXCLUDED.profile_completion_percent,
  last_active_at = EXCLUDED.last_active_at;
INSERT INTO public.profiles (id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, father_occupation, mother_occupation, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at)
VALUES ('00000000-0000-4000-a000-0000000000a7', 'TM000167', 'Kabilan Moorthy', 'male', '2003-05-06', 176, 'never_married', 'Hindu', 'Brahmin - Iyengar', NULL, 'no', 'B.E. / B.Tech', 'B.E. / B.Tech Graduate', 'Police Officer', 'Police Officer Details', '₹15 Lakhs - ₹20 Lakhs', 'Cognizant', 'Vellore', 'Vellore', 'Hi, I am Kabilan. I have completed my B.E. / B.Tech and am currently working as a Police Officer at Cognizant in Vellore. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'rich', 'Retired Employee', 'Homemaker', true, false, true, 100, NOW() - INTERVAL '2 days')
ON CONFLICT (id) DO UPDATE SET
  profile_id = EXCLUDED.profile_id,
  display_name = EXCLUDED.display_name,
  gender = EXCLUDED.gender,
  date_of_birth = EXCLUDED.date_of_birth,
  height_cm = EXCLUDED.height_cm,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  subcaste = EXCLUDED.subcaste,
  dosham = EXCLUDED.dosham,
  education = EXCLUDED.education,
  education_detail = EXCLUDED.education_detail,
  occupation = EXCLUDED.occupation,
  occupation_detail = EXCLUDED.occupation_detail,
  annual_income = EXCLUDED.annual_income,
  company_name = EXCLUDED.company_name,
  city = EXCLUDED.city,
  district = EXCLUDED.district,
  about_me = EXCLUDED.about_me,
  family_type = EXCLUDED.family_type,
  family_status = EXCLUDED.family_status,
  father_occupation = EXCLUDED.father_occupation,
  mother_occupation = EXCLUDED.mother_occupation,
  is_verified = EXCLUDED.is_verified,
  is_premium = EXCLUDED.is_premium,
  is_profile_complete = EXCLUDED.is_profile_complete,
  profile_completion_percent = EXCLUDED.profile_completion_percent,
  last_active_at = EXCLUDED.last_active_at;
INSERT INTO public.profiles (id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, father_occupation, mother_occupation, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at)
VALUES ('00000000-0000-4000-a000-0000000000a8', 'TM000168', 'Sneha Selvan', 'female', '1994-06-10', 158, 'never_married', 'Hindu', 'Thevar', NULL, 'no', 'M.B.A', 'M.B.A Graduate', 'Police Officer', 'Police Officer Details', '₹15 Lakhs - ₹20 Lakhs', 'Cognizant', 'Vellore', 'Vellore', 'Hi, I am Sneha. I have completed my M.B.A and am currently working as a Police Officer at Cognizant in Vellore. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'upper_middle_class', 'Retired Employee', 'Homemaker', true, false, true, 100, NOW() - INTERVAL '5 days')
ON CONFLICT (id) DO UPDATE SET
  profile_id = EXCLUDED.profile_id,
  display_name = EXCLUDED.display_name,
  gender = EXCLUDED.gender,
  date_of_birth = EXCLUDED.date_of_birth,
  height_cm = EXCLUDED.height_cm,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  subcaste = EXCLUDED.subcaste,
  dosham = EXCLUDED.dosham,
  education = EXCLUDED.education,
  education_detail = EXCLUDED.education_detail,
  occupation = EXCLUDED.occupation,
  occupation_detail = EXCLUDED.occupation_detail,
  annual_income = EXCLUDED.annual_income,
  company_name = EXCLUDED.company_name,
  city = EXCLUDED.city,
  district = EXCLUDED.district,
  about_me = EXCLUDED.about_me,
  family_type = EXCLUDED.family_type,
  family_status = EXCLUDED.family_status,
  father_occupation = EXCLUDED.father_occupation,
  mother_occupation = EXCLUDED.mother_occupation,
  is_verified = EXCLUDED.is_verified,
  is_premium = EXCLUDED.is_premium,
  is_profile_complete = EXCLUDED.is_profile_complete,
  profile_completion_percent = EXCLUDED.profile_completion_percent,
  last_active_at = EXCLUDED.last_active_at;
INSERT INTO public.profiles (id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, father_occupation, mother_occupation, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at)
VALUES ('00000000-0000-4000-a000-0000000000a9', 'TM000169', 'Muthu Krishnan', 'male', '1996-06-07', 188, 'never_married', 'Muslim', 'Shia Muslim', NULL, 'no', 'B.Com', 'B.Com Graduate', 'Doctor', 'Doctor Details', '₹5 Lakhs - ₹7 Lakhs', 'Cognizant', 'Thanjavur', 'Thanjavur', 'Hi, I am Muthu. I have completed my B.Com and am currently working as a Doctor at Cognizant in Thanjavur. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'joint', 'upper_middle_class', 'Retired Employee', 'Homemaker', true, false, true, 100, NOW() - INTERVAL '2 days')
ON CONFLICT (id) DO UPDATE SET
  profile_id = EXCLUDED.profile_id,
  display_name = EXCLUDED.display_name,
  gender = EXCLUDED.gender,
  date_of_birth = EXCLUDED.date_of_birth,
  height_cm = EXCLUDED.height_cm,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  subcaste = EXCLUDED.subcaste,
  dosham = EXCLUDED.dosham,
  education = EXCLUDED.education,
  education_detail = EXCLUDED.education_detail,
  occupation = EXCLUDED.occupation,
  occupation_detail = EXCLUDED.occupation_detail,
  annual_income = EXCLUDED.annual_income,
  company_name = EXCLUDED.company_name,
  city = EXCLUDED.city,
  district = EXCLUDED.district,
  about_me = EXCLUDED.about_me,
  family_type = EXCLUDED.family_type,
  family_status = EXCLUDED.family_status,
  father_occupation = EXCLUDED.father_occupation,
  mother_occupation = EXCLUDED.mother_occupation,
  is_verified = EXCLUDED.is_verified,
  is_premium = EXCLUDED.is_premium,
  is_profile_complete = EXCLUDED.is_profile_complete,
  profile_completion_percent = EXCLUDED.profile_completion_percent,
  last_active_at = EXCLUDED.last_active_at;
INSERT INTO public.profiles (id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, father_occupation, mother_occupation, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at)
VALUES ('00000000-0000-4000-a000-0000000000aa', 'TM000170', 'Preethi Krishnan', 'female', '1995-09-17', 153, 'never_married', 'Hindu', 'Sengunthar', 'Sengunthar subcaste', 'no', 'M.Com', 'M.Com Graduate', 'Business Owner', 'Business Owner Details', '₹15 Lakhs - ₹20 Lakhs', 'Infosys', 'Tiruchirappalli', 'Trichy', 'Hi, I am Preethi. I have completed my M.Com and am currently working as a Business Owner at Infosys in Tiruchirappalli. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'joint', 'upper_middle_class', 'Retired Employee', 'Homemaker', false, true, true, 100, NOW() - INTERVAL '7 days')
ON CONFLICT (id) DO UPDATE SET
  profile_id = EXCLUDED.profile_id,
  display_name = EXCLUDED.display_name,
  gender = EXCLUDED.gender,
  date_of_birth = EXCLUDED.date_of_birth,
  height_cm = EXCLUDED.height_cm,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  subcaste = EXCLUDED.subcaste,
  dosham = EXCLUDED.dosham,
  education = EXCLUDED.education,
  education_detail = EXCLUDED.education_detail,
  occupation = EXCLUDED.occupation,
  occupation_detail = EXCLUDED.occupation_detail,
  annual_income = EXCLUDED.annual_income,
  company_name = EXCLUDED.company_name,
  city = EXCLUDED.city,
  district = EXCLUDED.district,
  about_me = EXCLUDED.about_me,
  family_type = EXCLUDED.family_type,
  family_status = EXCLUDED.family_status,
  father_occupation = EXCLUDED.father_occupation,
  mother_occupation = EXCLUDED.mother_occupation,
  is_verified = EXCLUDED.is_verified,
  is_premium = EXCLUDED.is_premium,
  is_profile_complete = EXCLUDED.is_profile_complete,
  profile_completion_percent = EXCLUDED.profile_completion_percent,
  last_active_at = EXCLUDED.last_active_at;

-- 3. HOROSCOPE DETAILS INSERTIONS
INSERT INTO public.horoscope_details (user_id, star, raasi, lagnam, gothram, manglik)
VALUES ('00000000-0000-4000-a000-000000000001', 'Vishakha', 'Mithunam', 'Dhanusu', 'Atri', 'no')
ON CONFLICT (user_id) DO UPDATE SET
  star = EXCLUDED.star,
  raasi = EXCLUDED.raasi,
  lagnam = EXCLUDED.lagnam,
  gothram = EXCLUDED.gothram,
  manglik = EXCLUDED.manglik;
INSERT INTO public.horoscope_details (user_id, star, raasi, lagnam, gothram, manglik)
VALUES ('00000000-0000-4000-a000-000000000002', 'Poorvabhadrapada', 'Dhanusu', 'Kanni', 'Bharadwaj', 'no')
ON CONFLICT (user_id) DO UPDATE SET
  star = EXCLUDED.star,
  raasi = EXCLUDED.raasi,
  lagnam = EXCLUDED.lagnam,
  gothram = EXCLUDED.gothram,
  manglik = EXCLUDED.manglik;
INSERT INTO public.horoscope_details (user_id, star, raasi, lagnam, gothram, manglik)
VALUES ('00000000-0000-4000-a000-000000000003', 'Poorvaphalguni', 'Viruchigam', 'Thulaam', 'Bharadwaj', 'no')
ON CONFLICT (user_id) DO UPDATE SET
  star = EXCLUDED.star,
  raasi = EXCLUDED.raasi,
  lagnam = EXCLUDED.lagnam,
  gothram = EXCLUDED.gothram,
  manglik = EXCLUDED.manglik;
INSERT INTO public.horoscope_details (user_id, star, raasi, lagnam, gothram, manglik)
VALUES ('00000000-0000-4000-a000-000000000004', 'Anuradha', 'Magaram', 'Kumbam', 'Angirasa', 'no')
ON CONFLICT (user_id) DO UPDATE SET
  star = EXCLUDED.star,
  raasi = EXCLUDED.raasi,
  lagnam = EXCLUDED.lagnam,
  gothram = EXCLUDED.gothram,
  manglik = EXCLUDED.manglik;
INSERT INTO public.horoscope_details (user_id, star, raasi, lagnam, gothram, manglik)
VALUES ('00000000-0000-4000-a000-000000000005', 'Rohini', 'Dhanusu', 'Meenam', 'Angirasa', 'yes')
ON CONFLICT (user_id) DO UPDATE SET
  star = EXCLUDED.star,
  raasi = EXCLUDED.raasi,
  lagnam = EXCLUDED.lagnam,
  gothram = EXCLUDED.gothram,
  manglik = EXCLUDED.manglik;
INSERT INTO public.horoscope_details (user_id, star, raasi, lagnam, gothram, manglik)
VALUES ('00000000-0000-4000-a000-000000000006', 'Poorvabhadrapada', 'Thulaam', 'Kanni', 'Murugan', 'no')
ON CONFLICT (user_id) DO UPDATE SET
  star = EXCLUDED.star,
  raasi = EXCLUDED.raasi,
  lagnam = EXCLUDED.lagnam,
  gothram = EXCLUDED.gothram,
  manglik = EXCLUDED.manglik;
INSERT INTO public.horoscope_details (user_id, star, raasi, lagnam, gothram, manglik)
VALUES ('00000000-0000-4000-a000-000000000007', 'Hasta', 'Dhanusu', 'Magaram', 'Agastya', 'no')
ON CONFLICT (user_id) DO UPDATE SET
  star = EXCLUDED.star,
  raasi = EXCLUDED.raasi,
  lagnam = EXCLUDED.lagnam,
  gothram = EXCLUDED.gothram,
  manglik = EXCLUDED.manglik;
INSERT INTO public.horoscope_details (user_id, star, raasi, lagnam, gothram, manglik)
VALUES ('00000000-0000-4000-a000-000000000008', 'Moola', 'Meenam', 'Simham', 'Gautama', 'no')
ON CONFLICT (user_id) DO UPDATE SET
  star = EXCLUDED.star,
  raasi = EXCLUDED.raasi,
  lagnam = EXCLUDED.lagnam,
  gothram = EXCLUDED.gothram,
  manglik = EXCLUDED.manglik;
INSERT INTO public.horoscope_details (user_id, star, raasi, lagnam, gothram, manglik)
VALUES ('00000000-0000-4000-a000-000000000009', 'Poorvaphalguni', 'Magaram', 'Simham', 'Bharadwaj', 'no')
ON CONFLICT (user_id) DO UPDATE SET
  star = EXCLUDED.star,
  raasi = EXCLUDED.raasi,
  lagnam = EXCLUDED.lagnam,
  gothram = EXCLUDED.gothram,
  manglik = EXCLUDED.manglik;
INSERT INTO public.horoscope_details (user_id, star, raasi, lagnam, gothram, manglik)
VALUES ('00000000-0000-4000-a000-00000000000a', 'Moola', 'Simham', 'Kanni', 'Agastya', 'no')
ON CONFLICT (user_id) DO UPDATE SET
  star = EXCLUDED.star,
  raasi = EXCLUDED.raasi,
  lagnam = EXCLUDED.lagnam,
  gothram = EXCLUDED.gothram,
  manglik = EXCLUDED.manglik;
INSERT INTO public.horoscope_details (user_id, star, raasi, lagnam, gothram, manglik)
VALUES ('00000000-0000-4000-a000-00000000000b', 'Krittika', 'Kadagam', 'Simham', 'Harita', 'no')
ON CONFLICT (user_id) DO UPDATE SET
  star = EXCLUDED.star,
  raasi = EXCLUDED.raasi,
  lagnam = EXCLUDED.lagnam,
  gothram = EXCLUDED.gothram,
  manglik = EXCLUDED.manglik;
INSERT INTO public.horoscope_details (user_id, star, raasi, lagnam, gothram, manglik)
VALUES ('00000000-0000-4000-a000-00000000000c', 'Vishakha', 'Magaram', 'Meenam', 'Siva', 'no')
ON CONFLICT (user_id) DO UPDATE SET
  star = EXCLUDED.star,
  raasi = EXCLUDED.raasi,
  lagnam = EXCLUDED.lagnam,
  gothram = EXCLUDED.gothram,
  manglik = EXCLUDED.manglik;
INSERT INTO public.horoscope_details (user_id, star, raasi, lagnam, gothram, manglik)
VALUES ('00000000-0000-4000-a000-00000000000d', 'Shatabhisha', 'Mithunam', 'Magaram', 'Vashishta', 'no')
ON CONFLICT (user_id) DO UPDATE SET
  star = EXCLUDED.star,
  raasi = EXCLUDED.raasi,
  lagnam = EXCLUDED.lagnam,
  gothram = EXCLUDED.gothram,
  manglik = EXCLUDED.manglik;
INSERT INTO public.horoscope_details (user_id, star, raasi, lagnam, gothram, manglik)
VALUES ('00000000-0000-4000-a000-00000000000e', 'Krittika', 'Mesham', 'Kadagam', 'Viswamitra', 'no')
ON CONFLICT (user_id) DO UPDATE SET
  star = EXCLUDED.star,
  raasi = EXCLUDED.raasi,
  lagnam = EXCLUDED.lagnam,
  gothram = EXCLUDED.gothram,
  manglik = EXCLUDED.manglik;
INSERT INTO public.horoscope_details (user_id, star, raasi, lagnam, gothram, manglik)
VALUES ('00000000-0000-4000-a000-00000000000f', 'Arudra', 'Kadagam', 'Simham', 'Viswamitra', 'no')
ON CONFLICT (user_id) DO UPDATE SET
  star = EXCLUDED.star,
  raasi = EXCLUDED.raasi,
  lagnam = EXCLUDED.lagnam,
  gothram = EXCLUDED.gothram,
  manglik = EXCLUDED.manglik;
INSERT INTO public.horoscope_details (user_id, star, raasi, lagnam, gothram, manglik)
VALUES ('00000000-0000-4000-a000-000000000010', 'Punarvasu', 'Kanni', 'Magaram', 'Kasyapa', 'no')
ON CONFLICT (user_id) DO UPDATE SET
  star = EXCLUDED.star,
  raasi = EXCLUDED.raasi,
  lagnam = EXCLUDED.lagnam,
  gothram = EXCLUDED.gothram,
  manglik = EXCLUDED.manglik;
INSERT INTO public.horoscope_details (user_id, star, raasi, lagnam, gothram, manglik)
VALUES ('00000000-0000-4000-a000-000000000011', 'Uttarabhadrapada', 'Meenam', 'Mesham', 'Kasyapa', 'yes')
ON CONFLICT (user_id) DO UPDATE SET
  star = EXCLUDED.star,
  raasi = EXCLUDED.raasi,
  lagnam = EXCLUDED.lagnam,
  gothram = EXCLUDED.gothram,
  manglik = EXCLUDED.manglik;
INSERT INTO public.horoscope_details (user_id, star, raasi, lagnam, gothram, manglik)
VALUES ('00000000-0000-4000-a000-000000000012', 'Uttarachadha', 'Mesham', 'Kanni', 'Vashishta', 'no')
ON CONFLICT (user_id) DO UPDATE SET
  star = EXCLUDED.star,
  raasi = EXCLUDED.raasi,
  lagnam = EXCLUDED.lagnam,
  gothram = EXCLUDED.gothram,
  manglik = EXCLUDED.manglik;
INSERT INTO public.horoscope_details (user_id, star, raasi, lagnam, gothram, manglik)
VALUES ('00000000-0000-4000-a000-000000000013', 'Uttaraphalguni', 'Magaram', 'Magaram', 'Harita', 'no')
ON CONFLICT (user_id) DO UPDATE SET
  star = EXCLUDED.star,
  raasi = EXCLUDED.raasi,
  lagnam = EXCLUDED.lagnam,
  gothram = EXCLUDED.gothram,
  manglik = EXCLUDED.manglik;
INSERT INTO public.horoscope_details (user_id, star, raasi, lagnam, gothram, manglik)
VALUES ('00000000-0000-4000-a000-000000000014', 'Poorvashadha', 'Dhanusu', 'Simham', 'Bharadwaj', 'no')
ON CONFLICT (user_id) DO UPDATE SET
  star = EXCLUDED.star,
  raasi = EXCLUDED.raasi,
  lagnam = EXCLUDED.lagnam,
  gothram = EXCLUDED.gothram,
  manglik = EXCLUDED.manglik;
INSERT INTO public.horoscope_details (user_id, star, raasi, lagnam, gothram, manglik)
VALUES ('00000000-0000-4000-a000-000000000015', 'Ashwini', 'Rishabam', 'Simham', 'Kasyapa', 'no')
ON CONFLICT (user_id) DO UPDATE SET
  star = EXCLUDED.star,
  raasi = EXCLUDED.raasi,
  lagnam = EXCLUDED.lagnam,
  gothram = EXCLUDED.gothram,
  manglik = EXCLUDED.manglik;
INSERT INTO public.horoscope_details (user_id, star, raasi, lagnam, gothram, manglik)
VALUES ('00000000-0000-4000-a000-000000000016', 'Bharani', 'Kadagam', 'Rishabam', 'Kasyapa', 'no')
ON CONFLICT (user_id) DO UPDATE SET
  star = EXCLUDED.star,
  raasi = EXCLUDED.raasi,
  lagnam = EXCLUDED.lagnam,
  gothram = EXCLUDED.gothram,
  manglik = EXCLUDED.manglik;
INSERT INTO public.horoscope_details (user_id, star, raasi, lagnam, gothram, manglik)
VALUES ('00000000-0000-4000-a000-000000000017', 'Chitra', 'Rishabam', 'Viruchigam', 'Murugan', 'no')
ON CONFLICT (user_id) DO UPDATE SET
  star = EXCLUDED.star,
  raasi = EXCLUDED.raasi,
  lagnam = EXCLUDED.lagnam,
  gothram = EXCLUDED.gothram,
  manglik = EXCLUDED.manglik;
INSERT INTO public.horoscope_details (user_id, star, raasi, lagnam, gothram, manglik)
VALUES ('00000000-0000-4000-a000-000000000018', 'Poorvaphalguni', 'Meenam', 'Simham', 'Harita', 'no')
ON CONFLICT (user_id) DO UPDATE SET
  star = EXCLUDED.star,
  raasi = EXCLUDED.raasi,
  lagnam = EXCLUDED.lagnam,
  gothram = EXCLUDED.gothram,
  manglik = EXCLUDED.manglik;
INSERT INTO public.horoscope_details (user_id, star, raasi, lagnam, gothram, manglik)
VALUES ('00000000-0000-4000-a000-000000000019', 'Anuradha', 'Kadagam', 'Magaram', 'Atri', 'no')
ON CONFLICT (user_id) DO UPDATE SET
  star = EXCLUDED.star,
  raasi = EXCLUDED.raasi,
  lagnam = EXCLUDED.lagnam,
  gothram = EXCLUDED.gothram,
  manglik = EXCLUDED.manglik;
INSERT INTO public.horoscope_details (user_id, star, raasi, lagnam, gothram, manglik)
VALUES ('00000000-0000-4000-a000-00000000001a', 'Krittika', 'Viruchigam', 'Kanni', 'Siva', 'no')
ON CONFLICT (user_id) DO UPDATE SET
  star = EXCLUDED.star,
  raasi = EXCLUDED.raasi,
  lagnam = EXCLUDED.lagnam,
  gothram = EXCLUDED.gothram,
  manglik = EXCLUDED.manglik;
INSERT INTO public.horoscope_details (user_id, star, raasi, lagnam, gothram, manglik)
VALUES ('00000000-0000-4000-a000-00000000001b', 'Punarvasu', 'Meenam', 'Simham', 'Murugan', 'yes')
ON CONFLICT (user_id) DO UPDATE SET
  star = EXCLUDED.star,
  raasi = EXCLUDED.raasi,
  lagnam = EXCLUDED.lagnam,
  gothram = EXCLUDED.gothram,
  manglik = EXCLUDED.manglik;
INSERT INTO public.horoscope_details (user_id, star, raasi, lagnam, gothram, manglik)
VALUES ('00000000-0000-4000-a000-00000000001c', 'Hasta', 'Simham', 'Kadagam', 'Viswamitra', 'no')
ON CONFLICT (user_id) DO UPDATE SET
  star = EXCLUDED.star,
  raasi = EXCLUDED.raasi,
  lagnam = EXCLUDED.lagnam,
  gothram = EXCLUDED.gothram,
  manglik = EXCLUDED.manglik;
INSERT INTO public.horoscope_details (user_id, star, raasi, lagnam, gothram, manglik)
VALUES ('00000000-0000-4000-a000-00000000001d', 'Jyeshta', 'Mithunam', 'Viruchigam', 'Harita', 'yes')
ON CONFLICT (user_id) DO UPDATE SET
  star = EXCLUDED.star,
  raasi = EXCLUDED.raasi,
  lagnam = EXCLUDED.lagnam,
  gothram = EXCLUDED.gothram,
  manglik = EXCLUDED.manglik;
INSERT INTO public.horoscope_details (user_id, star, raasi, lagnam, gothram, manglik)
VALUES ('00000000-0000-4000-a000-00000000001e', 'Poorvaphalguni', 'Kanni', 'Simham', 'Agastya', 'no')
ON CONFLICT (user_id) DO UPDATE SET
  star = EXCLUDED.star,
  raasi = EXCLUDED.raasi,
  lagnam = EXCLUDED.lagnam,
  gothram = EXCLUDED.gothram,
  manglik = EXCLUDED.manglik;
INSERT INTO public.horoscope_details (user_id, star, raasi, lagnam, gothram, manglik)
VALUES ('00000000-0000-4000-a000-00000000001f', 'Vishakha', 'Dhanusu', 'Kadagam', 'Harita', 'yes')
ON CONFLICT (user_id) DO UPDATE SET
  star = EXCLUDED.star,
  raasi = EXCLUDED.raasi,
  lagnam = EXCLUDED.lagnam,
  gothram = EXCLUDED.gothram,
  manglik = EXCLUDED.manglik;
INSERT INTO public.horoscope_details (user_id, star, raasi, lagnam, gothram, manglik)
VALUES ('00000000-0000-4000-a000-000000000020', 'Revati', 'Rishabam', 'Simham', 'Angirasa', 'no')
ON CONFLICT (user_id) DO UPDATE SET
  star = EXCLUDED.star,
  raasi = EXCLUDED.raasi,
  lagnam = EXCLUDED.lagnam,
  gothram = EXCLUDED.gothram,
  manglik = EXCLUDED.manglik;
INSERT INTO public.horoscope_details (user_id, star, raasi, lagnam, gothram, manglik)
VALUES ('00000000-0000-4000-a000-000000000021', 'Vishakha', 'Mesham', 'Magaram', 'Bharadwaj', 'no')
ON CONFLICT (user_id) DO UPDATE SET
  star = EXCLUDED.star,
  raasi = EXCLUDED.raasi,
  lagnam = EXCLUDED.lagnam,
  gothram = EXCLUDED.gothram,
  manglik = EXCLUDED.manglik;
INSERT INTO public.horoscope_details (user_id, star, raasi, lagnam, gothram, manglik)
VALUES ('00000000-0000-4000-a000-000000000022', 'Anuradha', 'Kadagam', 'Simham', 'Vashishta', 'no')
ON CONFLICT (user_id) DO UPDATE SET
  star = EXCLUDED.star,
  raasi = EXCLUDED.raasi,
  lagnam = EXCLUDED.lagnam,
  gothram = EXCLUDED.gothram,
  manglik = EXCLUDED.manglik;
INSERT INTO public.horoscope_details (user_id, star, raasi, lagnam, gothram, manglik)
VALUES ('00000000-0000-4000-a000-000000000023', 'Uttaraphalguni', 'Kadagam', 'Kadagam', 'Agastya', 'yes')
ON CONFLICT (user_id) DO UPDATE SET
  star = EXCLUDED.star,
  raasi = EXCLUDED.raasi,
  lagnam = EXCLUDED.lagnam,
  gothram = EXCLUDED.gothram,
  manglik = EXCLUDED.manglik;
INSERT INTO public.horoscope_details (user_id, star, raasi, lagnam, gothram, manglik)
VALUES ('00000000-0000-4000-a000-000000000024', 'Revati', 'Magaram', 'Mithunam', 'Murugan', 'no')
ON CONFLICT (user_id) DO UPDATE SET
  star = EXCLUDED.star,
  raasi = EXCLUDED.raasi,
  lagnam = EXCLUDED.lagnam,
  gothram = EXCLUDED.gothram,
  manglik = EXCLUDED.manglik;
INSERT INTO public.horoscope_details (user_id, star, raasi, lagnam, gothram, manglik)
VALUES ('00000000-0000-4000-a000-000000000025', 'Poorvabhadrapada', 'Kadagam', 'Kumbam', 'Siva', 'no')
ON CONFLICT (user_id) DO UPDATE SET
  star = EXCLUDED.star,
  raasi = EXCLUDED.raasi,
  lagnam = EXCLUDED.lagnam,
  gothram = EXCLUDED.gothram,
  manglik = EXCLUDED.manglik;
INSERT INTO public.horoscope_details (user_id, star, raasi, lagnam, gothram, manglik)
VALUES ('00000000-0000-4000-a000-000000000026', 'Anuradha', 'Kanni', 'Dhanusu', 'Murugan', 'no')
ON CONFLICT (user_id) DO UPDATE SET
  star = EXCLUDED.star,
  raasi = EXCLUDED.raasi,
  lagnam = EXCLUDED.lagnam,
  gothram = EXCLUDED.gothram,
  manglik = EXCLUDED.manglik;
INSERT INTO public.horoscope_details (user_id, star, raasi, lagnam, gothram, manglik)
VALUES ('00000000-0000-4000-a000-000000000027', 'Jyeshta', 'Dhanusu', 'Meenam', 'Bharadwaj', 'no')
ON CONFLICT (user_id) DO UPDATE SET
  star = EXCLUDED.star,
  raasi = EXCLUDED.raasi,
  lagnam = EXCLUDED.lagnam,
  gothram = EXCLUDED.gothram,
  manglik = EXCLUDED.manglik;
INSERT INTO public.horoscope_details (user_id, star, raasi, lagnam, gothram, manglik)
VALUES ('00000000-0000-4000-a000-000000000028', 'Pushya', 'Mithunam', 'Kumbam', 'Angirasa', 'no')
ON CONFLICT (user_id) DO UPDATE SET
  star = EXCLUDED.star,
  raasi = EXCLUDED.raasi,
  lagnam = EXCLUDED.lagnam,
  gothram = EXCLUDED.gothram,
  manglik = EXCLUDED.manglik;
INSERT INTO public.horoscope_details (user_id, star, raasi, lagnam, gothram, manglik)
VALUES ('00000000-0000-4000-a000-000000000029', 'Rohini', 'Kanni', 'Thulaam', 'Bharadwaj', 'no')
ON CONFLICT (user_id) DO UPDATE SET
  star = EXCLUDED.star,
  raasi = EXCLUDED.raasi,
  lagnam = EXCLUDED.lagnam,
  gothram = EXCLUDED.gothram,
  manglik = EXCLUDED.manglik;
INSERT INTO public.horoscope_details (user_id, star, raasi, lagnam, gothram, manglik)
VALUES ('00000000-0000-4000-a000-00000000002a', 'Moola', 'Viruchigam', 'Thulaam', 'Angirasa', 'no')
ON CONFLICT (user_id) DO UPDATE SET
  star = EXCLUDED.star,
  raasi = EXCLUDED.raasi,
  lagnam = EXCLUDED.lagnam,
  gothram = EXCLUDED.gothram,
  manglik = EXCLUDED.manglik;
INSERT INTO public.horoscope_details (user_id, star, raasi, lagnam, gothram, manglik)
VALUES ('00000000-0000-4000-a000-00000000002b', 'Poorvabhadrapada', 'Mithunam', 'Simham', 'Harita', 'no')
ON CONFLICT (user_id) DO UPDATE SET
  star = EXCLUDED.star,
  raasi = EXCLUDED.raasi,
  lagnam = EXCLUDED.lagnam,
  gothram = EXCLUDED.gothram,
  manglik = EXCLUDED.manglik;
INSERT INTO public.horoscope_details (user_id, star, raasi, lagnam, gothram, manglik)
VALUES ('00000000-0000-4000-a000-00000000002c', 'Shravana', 'Dhanusu', 'Kumbam', 'Kasyapa', 'no')
ON CONFLICT (user_id) DO UPDATE SET
  star = EXCLUDED.star,
  raasi = EXCLUDED.raasi,
  lagnam = EXCLUDED.lagnam,
  gothram = EXCLUDED.gothram,
  manglik = EXCLUDED.manglik;
INSERT INTO public.horoscope_details (user_id, star, raasi, lagnam, gothram, manglik)
VALUES ('00000000-0000-4000-a000-00000000002d', 'Swati', 'Mithunam', 'Meenam', 'Viswamitra', 'no')
ON CONFLICT (user_id) DO UPDATE SET
  star = EXCLUDED.star,
  raasi = EXCLUDED.raasi,
  lagnam = EXCLUDED.lagnam,
  gothram = EXCLUDED.gothram,
  manglik = EXCLUDED.manglik;
INSERT INTO public.horoscope_details (user_id, star, raasi, lagnam, gothram, manglik)
VALUES ('00000000-0000-4000-a000-00000000002e', 'Moola', 'Viruchigam', 'Magaram', 'Kasyapa', 'no')
ON CONFLICT (user_id) DO UPDATE SET
  star = EXCLUDED.star,
  raasi = EXCLUDED.raasi,
  lagnam = EXCLUDED.lagnam,
  gothram = EXCLUDED.gothram,
  manglik = EXCLUDED.manglik;
INSERT INTO public.horoscope_details (user_id, star, raasi, lagnam, gothram, manglik)
VALUES ('00000000-0000-4000-a000-00000000002f', 'Uttarachadha', 'Meenam', 'Mithunam', 'Angirasa', 'no')
ON CONFLICT (user_id) DO UPDATE SET
  star = EXCLUDED.star,
  raasi = EXCLUDED.raasi,
  lagnam = EXCLUDED.lagnam,
  gothram = EXCLUDED.gothram,
  manglik = EXCLUDED.manglik;
INSERT INTO public.horoscope_details (user_id, star, raasi, lagnam, gothram, manglik)
VALUES ('00000000-0000-4000-a000-000000000030', 'Anuradha', 'Kumbam', 'Viruchigam', 'Bharadwaj', 'yes')
ON CONFLICT (user_id) DO UPDATE SET
  star = EXCLUDED.star,
  raasi = EXCLUDED.raasi,
  lagnam = EXCLUDED.lagnam,
  gothram = EXCLUDED.gothram,
  manglik = EXCLUDED.manglik;
INSERT INTO public.horoscope_details (user_id, star, raasi, lagnam, gothram, manglik)
VALUES ('00000000-0000-4000-a000-000000000031', 'Chitra', 'Mesham', 'Kadagam', 'Vishnu', 'no')
ON CONFLICT (user_id) DO UPDATE SET
  star = EXCLUDED.star,
  raasi = EXCLUDED.raasi,
  lagnam = EXCLUDED.lagnam,
  gothram = EXCLUDED.gothram,
  manglik = EXCLUDED.manglik;
INSERT INTO public.horoscope_details (user_id, star, raasi, lagnam, gothram, manglik)
VALUES ('00000000-0000-4000-a000-000000000032', 'Poorvashadha', 'Magaram', 'Dhanusu', 'Kasyapa', 'no')
ON CONFLICT (user_id) DO UPDATE SET
  star = EXCLUDED.star,
  raasi = EXCLUDED.raasi,
  lagnam = EXCLUDED.lagnam,
  gothram = EXCLUDED.gothram,
  manglik = EXCLUDED.manglik;
INSERT INTO public.horoscope_details (user_id, star, raasi, lagnam, gothram, manglik)
VALUES ('00000000-0000-4000-a000-000000000033', 'Arudra', 'Rishabam', 'Kumbam', 'Atri', 'yes')
ON CONFLICT (user_id) DO UPDATE SET
  star = EXCLUDED.star,
  raasi = EXCLUDED.raasi,
  lagnam = EXCLUDED.lagnam,
  gothram = EXCLUDED.gothram,
  manglik = EXCLUDED.manglik;
INSERT INTO public.horoscope_details (user_id, star, raasi, lagnam, gothram, manglik)
VALUES ('00000000-0000-4000-a000-000000000034', 'Poorvashadha', 'Viruchigam', 'Meenam', 'Gautama', 'no')
ON CONFLICT (user_id) DO UPDATE SET
  star = EXCLUDED.star,
  raasi = EXCLUDED.raasi,
  lagnam = EXCLUDED.lagnam,
  gothram = EXCLUDED.gothram,
  manglik = EXCLUDED.manglik;
INSERT INTO public.horoscope_details (user_id, star, raasi, lagnam, gothram, manglik)
VALUES ('00000000-0000-4000-a000-000000000035', 'Uttarabhadrapada', 'Thulaam', 'Kumbam', 'Harita', 'yes')
ON CONFLICT (user_id) DO UPDATE SET
  star = EXCLUDED.star,
  raasi = EXCLUDED.raasi,
  lagnam = EXCLUDED.lagnam,
  gothram = EXCLUDED.gothram,
  manglik = EXCLUDED.manglik;
INSERT INTO public.horoscope_details (user_id, star, raasi, lagnam, gothram, manglik)
VALUES ('00000000-0000-4000-a000-000000000036', 'Arudra', 'Mesham', 'Kumbam', 'Angirasa', 'no')
ON CONFLICT (user_id) DO UPDATE SET
  star = EXCLUDED.star,
  raasi = EXCLUDED.raasi,
  lagnam = EXCLUDED.lagnam,
  gothram = EXCLUDED.gothram,
  manglik = EXCLUDED.manglik;
INSERT INTO public.horoscope_details (user_id, star, raasi, lagnam, gothram, manglik)
VALUES ('00000000-0000-4000-a000-000000000037', 'Uttaraphalguni', 'Mesham', 'Magaram', 'Siva', 'no')
ON CONFLICT (user_id) DO UPDATE SET
  star = EXCLUDED.star,
  raasi = EXCLUDED.raasi,
  lagnam = EXCLUDED.lagnam,
  gothram = EXCLUDED.gothram,
  manglik = EXCLUDED.manglik;
INSERT INTO public.horoscope_details (user_id, star, raasi, lagnam, gothram, manglik)
VALUES ('00000000-0000-4000-a000-000000000038', 'Revati', 'Mithunam', 'Dhanusu', 'Gautama', 'no')
ON CONFLICT (user_id) DO UPDATE SET
  star = EXCLUDED.star,
  raasi = EXCLUDED.raasi,
  lagnam = EXCLUDED.lagnam,
  gothram = EXCLUDED.gothram,
  manglik = EXCLUDED.manglik;
INSERT INTO public.horoscope_details (user_id, star, raasi, lagnam, gothram, manglik)
VALUES ('00000000-0000-4000-a000-000000000039', 'Poorvabhadrapada', 'Rishabam', 'Magaram', 'Siva', 'no')
ON CONFLICT (user_id) DO UPDATE SET
  star = EXCLUDED.star,
  raasi = EXCLUDED.raasi,
  lagnam = EXCLUDED.lagnam,
  gothram = EXCLUDED.gothram,
  manglik = EXCLUDED.manglik;
INSERT INTO public.horoscope_details (user_id, star, raasi, lagnam, gothram, manglik)
VALUES ('00000000-0000-4000-a000-00000000003a', 'Hasta', 'Simham', 'Thulaam', 'Atri', 'no')
ON CONFLICT (user_id) DO UPDATE SET
  star = EXCLUDED.star,
  raasi = EXCLUDED.raasi,
  lagnam = EXCLUDED.lagnam,
  gothram = EXCLUDED.gothram,
  manglik = EXCLUDED.manglik;
INSERT INTO public.horoscope_details (user_id, star, raasi, lagnam, gothram, manglik)
VALUES ('00000000-0000-4000-a000-00000000003b', 'Poorvashadha', 'Simham', 'Thulaam', 'Angirasa', 'no')
ON CONFLICT (user_id) DO UPDATE SET
  star = EXCLUDED.star,
  raasi = EXCLUDED.raasi,
  lagnam = EXCLUDED.lagnam,
  gothram = EXCLUDED.gothram,
  manglik = EXCLUDED.manglik;
INSERT INTO public.horoscope_details (user_id, star, raasi, lagnam, gothram, manglik)
VALUES ('00000000-0000-4000-a000-00000000003c', 'Rohini', 'Mesham', 'Dhanusu', 'Harita', 'no')
ON CONFLICT (user_id) DO UPDATE SET
  star = EXCLUDED.star,
  raasi = EXCLUDED.raasi,
  lagnam = EXCLUDED.lagnam,
  gothram = EXCLUDED.gothram,
  manglik = EXCLUDED.manglik;
INSERT INTO public.horoscope_details (user_id, star, raasi, lagnam, gothram, manglik)
VALUES ('00000000-0000-4000-a000-00000000003d', 'Shravana', 'Magaram', 'Magaram', 'Angirasa', 'yes')
ON CONFLICT (user_id) DO UPDATE SET
  star = EXCLUDED.star,
  raasi = EXCLUDED.raasi,
  lagnam = EXCLUDED.lagnam,
  gothram = EXCLUDED.gothram,
  manglik = EXCLUDED.manglik;
INSERT INTO public.horoscope_details (user_id, star, raasi, lagnam, gothram, manglik)
VALUES ('00000000-0000-4000-a000-00000000003e', 'Krittika', 'Meenam', 'Kadagam', 'Agastya', 'yes')
ON CONFLICT (user_id) DO UPDATE SET
  star = EXCLUDED.star,
  raasi = EXCLUDED.raasi,
  lagnam = EXCLUDED.lagnam,
  gothram = EXCLUDED.gothram,
  manglik = EXCLUDED.manglik;
INSERT INTO public.horoscope_details (user_id, star, raasi, lagnam, gothram, manglik)
VALUES ('00000000-0000-4000-a000-00000000003f', 'Swati', 'Mesham', 'Meenam', 'Siva', 'no')
ON CONFLICT (user_id) DO UPDATE SET
  star = EXCLUDED.star,
  raasi = EXCLUDED.raasi,
  lagnam = EXCLUDED.lagnam,
  gothram = EXCLUDED.gothram,
  manglik = EXCLUDED.manglik;
INSERT INTO public.horoscope_details (user_id, star, raasi, lagnam, gothram, manglik)
VALUES ('00000000-0000-4000-a000-000000000040', 'Chitra', 'Thulaam', 'Simham', 'Murugan', 'no')
ON CONFLICT (user_id) DO UPDATE SET
  star = EXCLUDED.star,
  raasi = EXCLUDED.raasi,
  lagnam = EXCLUDED.lagnam,
  gothram = EXCLUDED.gothram,
  manglik = EXCLUDED.manglik;
INSERT INTO public.horoscope_details (user_id, star, raasi, lagnam, gothram, manglik)
VALUES ('00000000-0000-4000-a000-000000000041', 'Krittika', 'Magaram', 'Magaram', 'Bharadwaj', 'yes')
ON CONFLICT (user_id) DO UPDATE SET
  star = EXCLUDED.star,
  raasi = EXCLUDED.raasi,
  lagnam = EXCLUDED.lagnam,
  gothram = EXCLUDED.gothram,
  manglik = EXCLUDED.manglik;
INSERT INTO public.horoscope_details (user_id, star, raasi, lagnam, gothram, manglik)
VALUES ('00000000-0000-4000-a000-000000000042', 'Rohini', 'Magaram', 'Dhanusu', 'Viswamitra', 'no')
ON CONFLICT (user_id) DO UPDATE SET
  star = EXCLUDED.star,
  raasi = EXCLUDED.raasi,
  lagnam = EXCLUDED.lagnam,
  gothram = EXCLUDED.gothram,
  manglik = EXCLUDED.manglik;
INSERT INTO public.horoscope_details (user_id, star, raasi, lagnam, gothram, manglik)
VALUES ('00000000-0000-4000-a000-000000000043', 'Magha', 'Magaram', 'Mithunam', 'Bharadwaj', 'no')
ON CONFLICT (user_id) DO UPDATE SET
  star = EXCLUDED.star,
  raasi = EXCLUDED.raasi,
  lagnam = EXCLUDED.lagnam,
  gothram = EXCLUDED.gothram,
  manglik = EXCLUDED.manglik;
INSERT INTO public.horoscope_details (user_id, star, raasi, lagnam, gothram, manglik)
VALUES ('00000000-0000-4000-a000-000000000044', 'Arudra', 'Thulaam', 'Mithunam', 'Agastya', 'no')
ON CONFLICT (user_id) DO UPDATE SET
  star = EXCLUDED.star,
  raasi = EXCLUDED.raasi,
  lagnam = EXCLUDED.lagnam,
  gothram = EXCLUDED.gothram,
  manglik = EXCLUDED.manglik;
INSERT INTO public.horoscope_details (user_id, star, raasi, lagnam, gothram, manglik)
VALUES ('00000000-0000-4000-a000-000000000045', 'Ashwini', 'Mithunam', 'Kumbam', 'Viswamitra', 'no')
ON CONFLICT (user_id) DO UPDATE SET
  star = EXCLUDED.star,
  raasi = EXCLUDED.raasi,
  lagnam = EXCLUDED.lagnam,
  gothram = EXCLUDED.gothram,
  manglik = EXCLUDED.manglik;
INSERT INTO public.horoscope_details (user_id, star, raasi, lagnam, gothram, manglik)
VALUES ('00000000-0000-4000-a000-000000000046', 'Poorvabhadrapada', 'Kadagam', 'Meenam', 'Atri', 'no')
ON CONFLICT (user_id) DO UPDATE SET
  star = EXCLUDED.star,
  raasi = EXCLUDED.raasi,
  lagnam = EXCLUDED.lagnam,
  gothram = EXCLUDED.gothram,
  manglik = EXCLUDED.manglik;
INSERT INTO public.horoscope_details (user_id, star, raasi, lagnam, gothram, manglik)
VALUES ('00000000-0000-4000-a000-000000000047', 'Revati', 'Kanni', 'Rishabam', 'Atri', 'no')
ON CONFLICT (user_id) DO UPDATE SET
  star = EXCLUDED.star,
  raasi = EXCLUDED.raasi,
  lagnam = EXCLUDED.lagnam,
  gothram = EXCLUDED.gothram,
  manglik = EXCLUDED.manglik;
INSERT INTO public.horoscope_details (user_id, star, raasi, lagnam, gothram, manglik)
VALUES ('00000000-0000-4000-a000-000000000048', 'Poorvaphalguni', 'Magaram', 'Rishabam', 'Vashishta', 'no')
ON CONFLICT (user_id) DO UPDATE SET
  star = EXCLUDED.star,
  raasi = EXCLUDED.raasi,
  lagnam = EXCLUDED.lagnam,
  gothram = EXCLUDED.gothram,
  manglik = EXCLUDED.manglik;
INSERT INTO public.horoscope_details (user_id, star, raasi, lagnam, gothram, manglik)
VALUES ('00000000-0000-4000-a000-000000000049', 'Revati', 'Rishabam', 'Magaram', 'Murugan', 'no')
ON CONFLICT (user_id) DO UPDATE SET
  star = EXCLUDED.star,
  raasi = EXCLUDED.raasi,
  lagnam = EXCLUDED.lagnam,
  gothram = EXCLUDED.gothram,
  manglik = EXCLUDED.manglik;
INSERT INTO public.horoscope_details (user_id, star, raasi, lagnam, gothram, manglik)
VALUES ('00000000-0000-4000-a000-00000000004a', 'Magha', 'Dhanusu', 'Kumbam', 'Viswamitra', 'no')
ON CONFLICT (user_id) DO UPDATE SET
  star = EXCLUDED.star,
  raasi = EXCLUDED.raasi,
  lagnam = EXCLUDED.lagnam,
  gothram = EXCLUDED.gothram,
  manglik = EXCLUDED.manglik;
INSERT INTO public.horoscope_details (user_id, star, raasi, lagnam, gothram, manglik)
VALUES ('00000000-0000-4000-a000-00000000004b', 'Rohini', 'Meenam', 'Meenam', 'Bharadwaj', 'yes')
ON CONFLICT (user_id) DO UPDATE SET
  star = EXCLUDED.star,
  raasi = EXCLUDED.raasi,
  lagnam = EXCLUDED.lagnam,
  gothram = EXCLUDED.gothram,
  manglik = EXCLUDED.manglik;
INSERT INTO public.horoscope_details (user_id, star, raasi, lagnam, gothram, manglik)
VALUES ('00000000-0000-4000-a000-00000000004c', 'Vishakha', 'Kanni', 'Mithunam', 'Viswamitra', 'no')
ON CONFLICT (user_id) DO UPDATE SET
  star = EXCLUDED.star,
  raasi = EXCLUDED.raasi,
  lagnam = EXCLUDED.lagnam,
  gothram = EXCLUDED.gothram,
  manglik = EXCLUDED.manglik;
INSERT INTO public.horoscope_details (user_id, star, raasi, lagnam, gothram, manglik)
VALUES ('00000000-0000-4000-a000-00000000004d', 'Shatabhisha', 'Kumbam', 'Mithunam', 'Vashishta', 'no')
ON CONFLICT (user_id) DO UPDATE SET
  star = EXCLUDED.star,
  raasi = EXCLUDED.raasi,
  lagnam = EXCLUDED.lagnam,
  gothram = EXCLUDED.gothram,
  manglik = EXCLUDED.manglik;
INSERT INTO public.horoscope_details (user_id, star, raasi, lagnam, gothram, manglik)
VALUES ('00000000-0000-4000-a000-00000000004e', 'Punarvasu', 'Meenam', 'Simham', 'Bharadwaj', 'no')
ON CONFLICT (user_id) DO UPDATE SET
  star = EXCLUDED.star,
  raasi = EXCLUDED.raasi,
  lagnam = EXCLUDED.lagnam,
  gothram = EXCLUDED.gothram,
  manglik = EXCLUDED.manglik;
INSERT INTO public.horoscope_details (user_id, star, raasi, lagnam, gothram, manglik)
VALUES ('00000000-0000-4000-a000-00000000004f', 'Uttaraphalguni', 'Dhanusu', 'Kanni', 'Vashishta', 'no')
ON CONFLICT (user_id) DO UPDATE SET
  star = EXCLUDED.star,
  raasi = EXCLUDED.raasi,
  lagnam = EXCLUDED.lagnam,
  gothram = EXCLUDED.gothram,
  manglik = EXCLUDED.manglik;
INSERT INTO public.horoscope_details (user_id, star, raasi, lagnam, gothram, manglik)
VALUES ('00000000-0000-4000-a000-000000000050', 'Revati', 'Magaram', 'Simham', 'Atri', 'no')
ON CONFLICT (user_id) DO UPDATE SET
  star = EXCLUDED.star,
  raasi = EXCLUDED.raasi,
  lagnam = EXCLUDED.lagnam,
  gothram = EXCLUDED.gothram,
  manglik = EXCLUDED.manglik;
INSERT INTO public.horoscope_details (user_id, star, raasi, lagnam, gothram, manglik)
VALUES ('00000000-0000-4000-a000-000000000051', 'Shravana', 'Rishabam', 'Magaram', 'Harita', 'no')
ON CONFLICT (user_id) DO UPDATE SET
  star = EXCLUDED.star,
  raasi = EXCLUDED.raasi,
  lagnam = EXCLUDED.lagnam,
  gothram = EXCLUDED.gothram,
  manglik = EXCLUDED.manglik;
INSERT INTO public.horoscope_details (user_id, star, raasi, lagnam, gothram, manglik)
VALUES ('00000000-0000-4000-a000-000000000052', 'Anuradha', 'Kanni', 'Dhanusu', 'Angirasa', 'yes')
ON CONFLICT (user_id) DO UPDATE SET
  star = EXCLUDED.star,
  raasi = EXCLUDED.raasi,
  lagnam = EXCLUDED.lagnam,
  gothram = EXCLUDED.gothram,
  manglik = EXCLUDED.manglik;
INSERT INTO public.horoscope_details (user_id, star, raasi, lagnam, gothram, manglik)
VALUES ('00000000-0000-4000-a000-000000000053', 'Uttaraphalguni', 'Kumbam', 'Magaram', 'Bharadwaj', 'no')
ON CONFLICT (user_id) DO UPDATE SET
  star = EXCLUDED.star,
  raasi = EXCLUDED.raasi,
  lagnam = EXCLUDED.lagnam,
  gothram = EXCLUDED.gothram,
  manglik = EXCLUDED.manglik;
INSERT INTO public.horoscope_details (user_id, star, raasi, lagnam, gothram, manglik)
VALUES ('00000000-0000-4000-a000-000000000054', 'Poorvabhadrapada', 'Thulaam', 'Thulaam', 'Agastya', 'no')
ON CONFLICT (user_id) DO UPDATE SET
  star = EXCLUDED.star,
  raasi = EXCLUDED.raasi,
  lagnam = EXCLUDED.lagnam,
  gothram = EXCLUDED.gothram,
  manglik = EXCLUDED.manglik;
INSERT INTO public.horoscope_details (user_id, star, raasi, lagnam, gothram, manglik)
VALUES ('00000000-0000-4000-a000-000000000055', 'Jyeshta', 'Rishabam', 'Dhanusu', 'Agastya', 'no')
ON CONFLICT (user_id) DO UPDATE SET
  star = EXCLUDED.star,
  raasi = EXCLUDED.raasi,
  lagnam = EXCLUDED.lagnam,
  gothram = EXCLUDED.gothram,
  manglik = EXCLUDED.manglik;
INSERT INTO public.horoscope_details (user_id, star, raasi, lagnam, gothram, manglik)
VALUES ('00000000-0000-4000-a000-000000000056', 'Shatabhisha', 'Mithunam', 'Rishabam', 'Gautama', 'no')
ON CONFLICT (user_id) DO UPDATE SET
  star = EXCLUDED.star,
  raasi = EXCLUDED.raasi,
  lagnam = EXCLUDED.lagnam,
  gothram = EXCLUDED.gothram,
  manglik = EXCLUDED.manglik;
INSERT INTO public.horoscope_details (user_id, star, raasi, lagnam, gothram, manglik)
VALUES ('00000000-0000-4000-a000-000000000057', 'Uttaraphalguni', 'Meenam', 'Kumbam', 'Vashishta', 'no')
ON CONFLICT (user_id) DO UPDATE SET
  star = EXCLUDED.star,
  raasi = EXCLUDED.raasi,
  lagnam = EXCLUDED.lagnam,
  gothram = EXCLUDED.gothram,
  manglik = EXCLUDED.manglik;
INSERT INTO public.horoscope_details (user_id, star, raasi, lagnam, gothram, manglik)
VALUES ('00000000-0000-4000-a000-000000000058', 'Uttarabhadrapada', 'Thulaam', 'Kadagam', 'Gautama', 'no')
ON CONFLICT (user_id) DO UPDATE SET
  star = EXCLUDED.star,
  raasi = EXCLUDED.raasi,
  lagnam = EXCLUDED.lagnam,
  gothram = EXCLUDED.gothram,
  manglik = EXCLUDED.manglik;
INSERT INTO public.horoscope_details (user_id, star, raasi, lagnam, gothram, manglik)
VALUES ('00000000-0000-4000-a000-000000000059', 'Punarvasu', 'Simham', 'Mithunam', 'Murugan', 'no')
ON CONFLICT (user_id) DO UPDATE SET
  star = EXCLUDED.star,
  raasi = EXCLUDED.raasi,
  lagnam = EXCLUDED.lagnam,
  gothram = EXCLUDED.gothram,
  manglik = EXCLUDED.manglik;
INSERT INTO public.horoscope_details (user_id, star, raasi, lagnam, gothram, manglik)
VALUES ('00000000-0000-4000-a000-00000000005a', 'Uttarabhadrapada', 'Simham', 'Dhanusu', 'Kasyapa', 'no')
ON CONFLICT (user_id) DO UPDATE SET
  star = EXCLUDED.star,
  raasi = EXCLUDED.raasi,
  lagnam = EXCLUDED.lagnam,
  gothram = EXCLUDED.gothram,
  manglik = EXCLUDED.manglik;
INSERT INTO public.horoscope_details (user_id, star, raasi, lagnam, gothram, manglik)
VALUES ('00000000-0000-4000-a000-00000000005b', 'Shravana', 'Kumbam', 'Simham', 'Harita', 'no')
ON CONFLICT (user_id) DO UPDATE SET
  star = EXCLUDED.star,
  raasi = EXCLUDED.raasi,
  lagnam = EXCLUDED.lagnam,
  gothram = EXCLUDED.gothram,
  manglik = EXCLUDED.manglik;
INSERT INTO public.horoscope_details (user_id, star, raasi, lagnam, gothram, manglik)
VALUES ('00000000-0000-4000-a000-00000000005c', 'Poorvaphalguni', 'Simham', 'Meenam', 'Kasyapa', 'no')
ON CONFLICT (user_id) DO UPDATE SET
  star = EXCLUDED.star,
  raasi = EXCLUDED.raasi,
  lagnam = EXCLUDED.lagnam,
  gothram = EXCLUDED.gothram,
  manglik = EXCLUDED.manglik;
INSERT INTO public.horoscope_details (user_id, star, raasi, lagnam, gothram, manglik)
VALUES ('00000000-0000-4000-a000-00000000005d', 'Hasta', 'Simham', 'Rishabam', 'Kasyapa', 'no')
ON CONFLICT (user_id) DO UPDATE SET
  star = EXCLUDED.star,
  raasi = EXCLUDED.raasi,
  lagnam = EXCLUDED.lagnam,
  gothram = EXCLUDED.gothram,
  manglik = EXCLUDED.manglik;
INSERT INTO public.horoscope_details (user_id, star, raasi, lagnam, gothram, manglik)
VALUES ('00000000-0000-4000-a000-00000000005e', 'Uttaraphalguni', 'Dhanusu', 'Kadagam', 'Siva', 'yes')
ON CONFLICT (user_id) DO UPDATE SET
  star = EXCLUDED.star,
  raasi = EXCLUDED.raasi,
  lagnam = EXCLUDED.lagnam,
  gothram = EXCLUDED.gothram,
  manglik = EXCLUDED.manglik;
INSERT INTO public.horoscope_details (user_id, star, raasi, lagnam, gothram, manglik)
VALUES ('00000000-0000-4000-a000-00000000005f', 'Jyeshta', 'Dhanusu', 'Mithunam', 'Agastya', 'no')
ON CONFLICT (user_id) DO UPDATE SET
  star = EXCLUDED.star,
  raasi = EXCLUDED.raasi,
  lagnam = EXCLUDED.lagnam,
  gothram = EXCLUDED.gothram,
  manglik = EXCLUDED.manglik;
INSERT INTO public.horoscope_details (user_id, star, raasi, lagnam, gothram, manglik)
VALUES ('00000000-0000-4000-a000-000000000060', 'Poorvashadha', 'Dhanusu', 'Simham', 'Murugan', 'no')
ON CONFLICT (user_id) DO UPDATE SET
  star = EXCLUDED.star,
  raasi = EXCLUDED.raasi,
  lagnam = EXCLUDED.lagnam,
  gothram = EXCLUDED.gothram,
  manglik = EXCLUDED.manglik;
INSERT INTO public.horoscope_details (user_id, star, raasi, lagnam, gothram, manglik)
VALUES ('00000000-0000-4000-a000-000000000061', 'Ashwini', 'Thulaam', 'Rishabam', 'Gautama', 'yes')
ON CONFLICT (user_id) DO UPDATE SET
  star = EXCLUDED.star,
  raasi = EXCLUDED.raasi,
  lagnam = EXCLUDED.lagnam,
  gothram = EXCLUDED.gothram,
  manglik = EXCLUDED.manglik;
INSERT INTO public.horoscope_details (user_id, star, raasi, lagnam, gothram, manglik)
VALUES ('00000000-0000-4000-a000-000000000062', 'Shatabhisha', 'Thulaam', 'Thulaam', 'Atri', 'no')
ON CONFLICT (user_id) DO UPDATE SET
  star = EXCLUDED.star,
  raasi = EXCLUDED.raasi,
  lagnam = EXCLUDED.lagnam,
  gothram = EXCLUDED.gothram,
  manglik = EXCLUDED.manglik;
INSERT INTO public.horoscope_details (user_id, star, raasi, lagnam, gothram, manglik)
VALUES ('00000000-0000-4000-a000-000000000063', 'Magha', 'Viruchigam', 'Viruchigam', 'Kasyapa', 'no')
ON CONFLICT (user_id) DO UPDATE SET
  star = EXCLUDED.star,
  raasi = EXCLUDED.raasi,
  lagnam = EXCLUDED.lagnam,
  gothram = EXCLUDED.gothram,
  manglik = EXCLUDED.manglik;
INSERT INTO public.horoscope_details (user_id, star, raasi, lagnam, gothram, manglik)
VALUES ('00000000-0000-4000-a000-000000000064', 'Pushya', 'Viruchigam', 'Rishabam', 'Vishnu', 'no')
ON CONFLICT (user_id) DO UPDATE SET
  star = EXCLUDED.star,
  raasi = EXCLUDED.raasi,
  lagnam = EXCLUDED.lagnam,
  gothram = EXCLUDED.gothram,
  manglik = EXCLUDED.manglik;
INSERT INTO public.horoscope_details (user_id, star, raasi, lagnam, gothram, manglik)
VALUES ('00000000-0000-4000-a000-000000000065', 'Dhanishta', 'Viruchigam', 'Mesham', 'Bharadwaj', 'no')
ON CONFLICT (user_id) DO UPDATE SET
  star = EXCLUDED.star,
  raasi = EXCLUDED.raasi,
  lagnam = EXCLUDED.lagnam,
  gothram = EXCLUDED.gothram,
  manglik = EXCLUDED.manglik;
INSERT INTO public.horoscope_details (user_id, star, raasi, lagnam, gothram, manglik)
VALUES ('00000000-0000-4000-a000-000000000066', 'Uttaraphalguni', 'Mesham', 'Kadagam', 'Siva', 'no')
ON CONFLICT (user_id) DO UPDATE SET
  star = EXCLUDED.star,
  raasi = EXCLUDED.raasi,
  lagnam = EXCLUDED.lagnam,
  gothram = EXCLUDED.gothram,
  manglik = EXCLUDED.manglik;
INSERT INTO public.horoscope_details (user_id, star, raasi, lagnam, gothram, manglik)
VALUES ('00000000-0000-4000-a000-000000000067', 'Poorvaphalguni', 'Rishabam', 'Meenam', 'Viswamitra', 'no')
ON CONFLICT (user_id) DO UPDATE SET
  star = EXCLUDED.star,
  raasi = EXCLUDED.raasi,
  lagnam = EXCLUDED.lagnam,
  gothram = EXCLUDED.gothram,
  manglik = EXCLUDED.manglik;
INSERT INTO public.horoscope_details (user_id, star, raasi, lagnam, gothram, manglik)
VALUES ('00000000-0000-4000-a000-000000000068', 'Mirgashira', 'Mesham', 'Rishabam', 'Gautama', 'no')
ON CONFLICT (user_id) DO UPDATE SET
  star = EXCLUDED.star,
  raasi = EXCLUDED.raasi,
  lagnam = EXCLUDED.lagnam,
  gothram = EXCLUDED.gothram,
  manglik = EXCLUDED.manglik;
INSERT INTO public.horoscope_details (user_id, star, raasi, lagnam, gothram, manglik)
VALUES ('00000000-0000-4000-a000-000000000069', 'Shravana', 'Magaram', 'Kadagam', 'Agastya', 'no')
ON CONFLICT (user_id) DO UPDATE SET
  star = EXCLUDED.star,
  raasi = EXCLUDED.raasi,
  lagnam = EXCLUDED.lagnam,
  gothram = EXCLUDED.gothram,
  manglik = EXCLUDED.manglik;
INSERT INTO public.horoscope_details (user_id, star, raasi, lagnam, gothram, manglik)
VALUES ('00000000-0000-4000-a000-00000000006a', 'Poorvaphalguni', 'Meenam', 'Kanni', 'Kasyapa', 'no')
ON CONFLICT (user_id) DO UPDATE SET
  star = EXCLUDED.star,
  raasi = EXCLUDED.raasi,
  lagnam = EXCLUDED.lagnam,
  gothram = EXCLUDED.gothram,
  manglik = EXCLUDED.manglik;
INSERT INTO public.horoscope_details (user_id, star, raasi, lagnam, gothram, manglik)
VALUES ('00000000-0000-4000-a000-00000000006b', 'Jyeshta', 'Simham', 'Mithunam', 'Murugan', 'yes')
ON CONFLICT (user_id) DO UPDATE SET
  star = EXCLUDED.star,
  raasi = EXCLUDED.raasi,
  lagnam = EXCLUDED.lagnam,
  gothram = EXCLUDED.gothram,
  manglik = EXCLUDED.manglik;
INSERT INTO public.horoscope_details (user_id, star, raasi, lagnam, gothram, manglik)
VALUES ('00000000-0000-4000-a000-00000000006c', 'Uttarabhadrapada', 'Mesham', 'Meenam', 'Bharadwaj', 'no')
ON CONFLICT (user_id) DO UPDATE SET
  star = EXCLUDED.star,
  raasi = EXCLUDED.raasi,
  lagnam = EXCLUDED.lagnam,
  gothram = EXCLUDED.gothram,
  manglik = EXCLUDED.manglik;
INSERT INTO public.horoscope_details (user_id, star, raasi, lagnam, gothram, manglik)
VALUES ('00000000-0000-4000-a000-00000000006d', 'Swati', 'Simham', 'Simham', 'Viswamitra', 'no')
ON CONFLICT (user_id) DO UPDATE SET
  star = EXCLUDED.star,
  raasi = EXCLUDED.raasi,
  lagnam = EXCLUDED.lagnam,
  gothram = EXCLUDED.gothram,
  manglik = EXCLUDED.manglik;
INSERT INTO public.horoscope_details (user_id, star, raasi, lagnam, gothram, manglik)
VALUES ('00000000-0000-4000-a000-00000000006e', 'Mirgashira', 'Dhanusu', 'Meenam', 'Vashishta', 'no')
ON CONFLICT (user_id) DO UPDATE SET
  star = EXCLUDED.star,
  raasi = EXCLUDED.raasi,
  lagnam = EXCLUDED.lagnam,
  gothram = EXCLUDED.gothram,
  manglik = EXCLUDED.manglik;
INSERT INTO public.horoscope_details (user_id, star, raasi, lagnam, gothram, manglik)
VALUES ('00000000-0000-4000-a000-00000000006f', 'Ashwini', 'Dhanusu', 'Rishabam', 'Vashishta', 'no')
ON CONFLICT (user_id) DO UPDATE SET
  star = EXCLUDED.star,
  raasi = EXCLUDED.raasi,
  lagnam = EXCLUDED.lagnam,
  gothram = EXCLUDED.gothram,
  manglik = EXCLUDED.manglik;
INSERT INTO public.horoscope_details (user_id, star, raasi, lagnam, gothram, manglik)
VALUES ('00000000-0000-4000-a000-000000000070', 'Mirgashira', 'Rishabam', 'Meenam', 'Kasyapa', 'no')
ON CONFLICT (user_id) DO UPDATE SET
  star = EXCLUDED.star,
  raasi = EXCLUDED.raasi,
  lagnam = EXCLUDED.lagnam,
  gothram = EXCLUDED.gothram,
  manglik = EXCLUDED.manglik;
INSERT INTO public.horoscope_details (user_id, star, raasi, lagnam, gothram, manglik)
VALUES ('00000000-0000-4000-a000-000000000071', 'Moola', 'Viruchigam', 'Dhanusu', 'Agastya', 'no')
ON CONFLICT (user_id) DO UPDATE SET
  star = EXCLUDED.star,
  raasi = EXCLUDED.raasi,
  lagnam = EXCLUDED.lagnam,
  gothram = EXCLUDED.gothram,
  manglik = EXCLUDED.manglik;
INSERT INTO public.horoscope_details (user_id, star, raasi, lagnam, gothram, manglik)
VALUES ('00000000-0000-4000-a000-000000000072', 'Jyeshta', 'Meenam', 'Meenam', 'Bharadwaj', 'no')
ON CONFLICT (user_id) DO UPDATE SET
  star = EXCLUDED.star,
  raasi = EXCLUDED.raasi,
  lagnam = EXCLUDED.lagnam,
  gothram = EXCLUDED.gothram,
  manglik = EXCLUDED.manglik;
INSERT INTO public.horoscope_details (user_id, star, raasi, lagnam, gothram, manglik)
VALUES ('00000000-0000-4000-a000-000000000073', 'Poorvashadha', 'Kadagam', 'Mesham', 'Vishnu', 'no')
ON CONFLICT (user_id) DO UPDATE SET
  star = EXCLUDED.star,
  raasi = EXCLUDED.raasi,
  lagnam = EXCLUDED.lagnam,
  gothram = EXCLUDED.gothram,
  manglik = EXCLUDED.manglik;
INSERT INTO public.horoscope_details (user_id, star, raasi, lagnam, gothram, manglik)
VALUES ('00000000-0000-4000-a000-000000000074', 'Arudra', 'Magaram', 'Kadagam', 'Siva', 'no')
ON CONFLICT (user_id) DO UPDATE SET
  star = EXCLUDED.star,
  raasi = EXCLUDED.raasi,
  lagnam = EXCLUDED.lagnam,
  gothram = EXCLUDED.gothram,
  manglik = EXCLUDED.manglik;
INSERT INTO public.horoscope_details (user_id, star, raasi, lagnam, gothram, manglik)
VALUES ('00000000-0000-4000-a000-000000000075', 'Rohini', 'Mithunam', 'Kadagam', 'Atri', 'yes')
ON CONFLICT (user_id) DO UPDATE SET
  star = EXCLUDED.star,
  raasi = EXCLUDED.raasi,
  lagnam = EXCLUDED.lagnam,
  gothram = EXCLUDED.gothram,
  manglik = EXCLUDED.manglik;
INSERT INTO public.horoscope_details (user_id, star, raasi, lagnam, gothram, manglik)
VALUES ('00000000-0000-4000-a000-000000000076', 'Jyeshta', 'Dhanusu', 'Mesham', 'Kasyapa', 'no')
ON CONFLICT (user_id) DO UPDATE SET
  star = EXCLUDED.star,
  raasi = EXCLUDED.raasi,
  lagnam = EXCLUDED.lagnam,
  gothram = EXCLUDED.gothram,
  manglik = EXCLUDED.manglik;
INSERT INTO public.horoscope_details (user_id, star, raasi, lagnam, gothram, manglik)
VALUES ('00000000-0000-4000-a000-000000000077', 'Krittika', 'Mithunam', 'Rishabam', 'Harita', 'yes')
ON CONFLICT (user_id) DO UPDATE SET
  star = EXCLUDED.star,
  raasi = EXCLUDED.raasi,
  lagnam = EXCLUDED.lagnam,
  gothram = EXCLUDED.gothram,
  manglik = EXCLUDED.manglik;
INSERT INTO public.horoscope_details (user_id, star, raasi, lagnam, gothram, manglik)
VALUES ('00000000-0000-4000-a000-000000000078', 'Moola', 'Mesham', 'Dhanusu', 'Vishnu', 'no')
ON CONFLICT (user_id) DO UPDATE SET
  star = EXCLUDED.star,
  raasi = EXCLUDED.raasi,
  lagnam = EXCLUDED.lagnam,
  gothram = EXCLUDED.gothram,
  manglik = EXCLUDED.manglik;
INSERT INTO public.horoscope_details (user_id, star, raasi, lagnam, gothram, manglik)
VALUES ('00000000-0000-4000-a000-000000000079', 'Dhanishta', 'Rishabam', 'Viruchigam', 'Agastya', 'no')
ON CONFLICT (user_id) DO UPDATE SET
  star = EXCLUDED.star,
  raasi = EXCLUDED.raasi,
  lagnam = EXCLUDED.lagnam,
  gothram = EXCLUDED.gothram,
  manglik = EXCLUDED.manglik;
INSERT INTO public.horoscope_details (user_id, star, raasi, lagnam, gothram, manglik)
VALUES ('00000000-0000-4000-a000-00000000007a', 'Rohini', 'Kumbam', 'Magaram', 'Bharadwaj', 'no')
ON CONFLICT (user_id) DO UPDATE SET
  star = EXCLUDED.star,
  raasi = EXCLUDED.raasi,
  lagnam = EXCLUDED.lagnam,
  gothram = EXCLUDED.gothram,
  manglik = EXCLUDED.manglik;
INSERT INTO public.horoscope_details (user_id, star, raasi, lagnam, gothram, manglik)
VALUES ('00000000-0000-4000-a000-00000000007b', 'Jyeshta', 'Thulaam', 'Dhanusu', 'Bharadwaj', 'no')
ON CONFLICT (user_id) DO UPDATE SET
  star = EXCLUDED.star,
  raasi = EXCLUDED.raasi,
  lagnam = EXCLUDED.lagnam,
  gothram = EXCLUDED.gothram,
  manglik = EXCLUDED.manglik;
INSERT INTO public.horoscope_details (user_id, star, raasi, lagnam, gothram, manglik)
VALUES ('00000000-0000-4000-a000-00000000007c', 'Shravana', 'Kanni', 'Dhanusu', 'Bharadwaj', 'no')
ON CONFLICT (user_id) DO UPDATE SET
  star = EXCLUDED.star,
  raasi = EXCLUDED.raasi,
  lagnam = EXCLUDED.lagnam,
  gothram = EXCLUDED.gothram,
  manglik = EXCLUDED.manglik;
INSERT INTO public.horoscope_details (user_id, star, raasi, lagnam, gothram, manglik)
VALUES ('00000000-0000-4000-a000-00000000007d', 'Arudra', 'Rishabam', 'Thulaam', 'Siva', 'no')
ON CONFLICT (user_id) DO UPDATE SET
  star = EXCLUDED.star,
  raasi = EXCLUDED.raasi,
  lagnam = EXCLUDED.lagnam,
  gothram = EXCLUDED.gothram,
  manglik = EXCLUDED.manglik;
INSERT INTO public.horoscope_details (user_id, star, raasi, lagnam, gothram, manglik)
VALUES ('00000000-0000-4000-a000-00000000007e', 'Poorvaphalguni', 'Rishabam', 'Simham', 'Bharadwaj', 'no')
ON CONFLICT (user_id) DO UPDATE SET
  star = EXCLUDED.star,
  raasi = EXCLUDED.raasi,
  lagnam = EXCLUDED.lagnam,
  gothram = EXCLUDED.gothram,
  manglik = EXCLUDED.manglik;
INSERT INTO public.horoscope_details (user_id, star, raasi, lagnam, gothram, manglik)
VALUES ('00000000-0000-4000-a000-00000000007f', 'Uttaraphalguni', 'Kanni', 'Simham', 'Gautama', 'no')
ON CONFLICT (user_id) DO UPDATE SET
  star = EXCLUDED.star,
  raasi = EXCLUDED.raasi,
  lagnam = EXCLUDED.lagnam,
  gothram = EXCLUDED.gothram,
  manglik = EXCLUDED.manglik;
INSERT INTO public.horoscope_details (user_id, star, raasi, lagnam, gothram, manglik)
VALUES ('00000000-0000-4000-a000-000000000080', 'Poorvashadha', 'Mesham', 'Simham', 'Agastya', 'yes')
ON CONFLICT (user_id) DO UPDATE SET
  star = EXCLUDED.star,
  raasi = EXCLUDED.raasi,
  lagnam = EXCLUDED.lagnam,
  gothram = EXCLUDED.gothram,
  manglik = EXCLUDED.manglik;
INSERT INTO public.horoscope_details (user_id, star, raasi, lagnam, gothram, manglik)
VALUES ('00000000-0000-4000-a000-000000000081', 'Chitra', 'Mithunam', 'Thulaam', 'Kasyapa', 'no')
ON CONFLICT (user_id) DO UPDATE SET
  star = EXCLUDED.star,
  raasi = EXCLUDED.raasi,
  lagnam = EXCLUDED.lagnam,
  gothram = EXCLUDED.gothram,
  manglik = EXCLUDED.manglik;
INSERT INTO public.horoscope_details (user_id, star, raasi, lagnam, gothram, manglik)
VALUES ('00000000-0000-4000-a000-000000000082', 'Jyeshta', 'Thulaam', 'Magaram', 'Kasyapa', 'no')
ON CONFLICT (user_id) DO UPDATE SET
  star = EXCLUDED.star,
  raasi = EXCLUDED.raasi,
  lagnam = EXCLUDED.lagnam,
  gothram = EXCLUDED.gothram,
  manglik = EXCLUDED.manglik;
INSERT INTO public.horoscope_details (user_id, star, raasi, lagnam, gothram, manglik)
VALUES ('00000000-0000-4000-a000-000000000083', 'Krittika', 'Kadagam', 'Meenam', 'Atri', 'no')
ON CONFLICT (user_id) DO UPDATE SET
  star = EXCLUDED.star,
  raasi = EXCLUDED.raasi,
  lagnam = EXCLUDED.lagnam,
  gothram = EXCLUDED.gothram,
  manglik = EXCLUDED.manglik;
INSERT INTO public.horoscope_details (user_id, star, raasi, lagnam, gothram, manglik)
VALUES ('00000000-0000-4000-a000-000000000084', 'Shravana', 'Rishabam', 'Mesham', 'Siva', 'no')
ON CONFLICT (user_id) DO UPDATE SET
  star = EXCLUDED.star,
  raasi = EXCLUDED.raasi,
  lagnam = EXCLUDED.lagnam,
  gothram = EXCLUDED.gothram,
  manglik = EXCLUDED.manglik;
INSERT INTO public.horoscope_details (user_id, star, raasi, lagnam, gothram, manglik)
VALUES ('00000000-0000-4000-a000-000000000085', 'Jyeshta', 'Thulaam', 'Thulaam', 'Agastya', 'no')
ON CONFLICT (user_id) DO UPDATE SET
  star = EXCLUDED.star,
  raasi = EXCLUDED.raasi,
  lagnam = EXCLUDED.lagnam,
  gothram = EXCLUDED.gothram,
  manglik = EXCLUDED.manglik;
INSERT INTO public.horoscope_details (user_id, star, raasi, lagnam, gothram, manglik)
VALUES ('00000000-0000-4000-a000-000000000086', 'Poorvabhadrapada', 'Magaram', 'Magaram', 'Vishnu', 'no')
ON CONFLICT (user_id) DO UPDATE SET
  star = EXCLUDED.star,
  raasi = EXCLUDED.raasi,
  lagnam = EXCLUDED.lagnam,
  gothram = EXCLUDED.gothram,
  manglik = EXCLUDED.manglik;
INSERT INTO public.horoscope_details (user_id, star, raasi, lagnam, gothram, manglik)
VALUES ('00000000-0000-4000-a000-000000000087', 'Magha', 'Magaram', 'Simham', 'Agastya', 'no')
ON CONFLICT (user_id) DO UPDATE SET
  star = EXCLUDED.star,
  raasi = EXCLUDED.raasi,
  lagnam = EXCLUDED.lagnam,
  gothram = EXCLUDED.gothram,
  manglik = EXCLUDED.manglik;
INSERT INTO public.horoscope_details (user_id, star, raasi, lagnam, gothram, manglik)
VALUES ('00000000-0000-4000-a000-000000000088', 'Aslesha', 'Mesham', 'Thulaam', 'Vishnu', 'no')
ON CONFLICT (user_id) DO UPDATE SET
  star = EXCLUDED.star,
  raasi = EXCLUDED.raasi,
  lagnam = EXCLUDED.lagnam,
  gothram = EXCLUDED.gothram,
  manglik = EXCLUDED.manglik;
INSERT INTO public.horoscope_details (user_id, star, raasi, lagnam, gothram, manglik)
VALUES ('00000000-0000-4000-a000-000000000089', 'Dhanishta', 'Magaram', 'Kanni', 'Bharadwaj', 'no')
ON CONFLICT (user_id) DO UPDATE SET
  star = EXCLUDED.star,
  raasi = EXCLUDED.raasi,
  lagnam = EXCLUDED.lagnam,
  gothram = EXCLUDED.gothram,
  manglik = EXCLUDED.manglik;
INSERT INTO public.horoscope_details (user_id, star, raasi, lagnam, gothram, manglik)
VALUES ('00000000-0000-4000-a000-00000000008a', 'Ashwini', 'Kanni', 'Dhanusu', 'Harita', 'no')
ON CONFLICT (user_id) DO UPDATE SET
  star = EXCLUDED.star,
  raasi = EXCLUDED.raasi,
  lagnam = EXCLUDED.lagnam,
  gothram = EXCLUDED.gothram,
  manglik = EXCLUDED.manglik;
INSERT INTO public.horoscope_details (user_id, star, raasi, lagnam, gothram, manglik)
VALUES ('00000000-0000-4000-a000-00000000008b', 'Hasta', 'Mithunam', 'Viruchigam', 'Agastya', 'no')
ON CONFLICT (user_id) DO UPDATE SET
  star = EXCLUDED.star,
  raasi = EXCLUDED.raasi,
  lagnam = EXCLUDED.lagnam,
  gothram = EXCLUDED.gothram,
  manglik = EXCLUDED.manglik;
INSERT INTO public.horoscope_details (user_id, star, raasi, lagnam, gothram, manglik)
VALUES ('00000000-0000-4000-a000-00000000008c', 'Anuradha', 'Meenam', 'Kumbam', 'Gautama', 'no')
ON CONFLICT (user_id) DO UPDATE SET
  star = EXCLUDED.star,
  raasi = EXCLUDED.raasi,
  lagnam = EXCLUDED.lagnam,
  gothram = EXCLUDED.gothram,
  manglik = EXCLUDED.manglik;
INSERT INTO public.horoscope_details (user_id, star, raasi, lagnam, gothram, manglik)
VALUES ('00000000-0000-4000-a000-00000000008d', 'Anuradha', 'Dhanusu', 'Thulaam', 'Kasyapa', 'no')
ON CONFLICT (user_id) DO UPDATE SET
  star = EXCLUDED.star,
  raasi = EXCLUDED.raasi,
  lagnam = EXCLUDED.lagnam,
  gothram = EXCLUDED.gothram,
  manglik = EXCLUDED.manglik;
INSERT INTO public.horoscope_details (user_id, star, raasi, lagnam, gothram, manglik)
VALUES ('00000000-0000-4000-a000-00000000008e', 'Poorvabhadrapada', 'Kumbam', 'Meenam', 'Agastya', 'no')
ON CONFLICT (user_id) DO UPDATE SET
  star = EXCLUDED.star,
  raasi = EXCLUDED.raasi,
  lagnam = EXCLUDED.lagnam,
  gothram = EXCLUDED.gothram,
  manglik = EXCLUDED.manglik;
INSERT INTO public.horoscope_details (user_id, star, raasi, lagnam, gothram, manglik)
VALUES ('00000000-0000-4000-a000-00000000008f', 'Uttaraphalguni', 'Mithunam', 'Kumbam', 'Vishnu', 'no')
ON CONFLICT (user_id) DO UPDATE SET
  star = EXCLUDED.star,
  raasi = EXCLUDED.raasi,
  lagnam = EXCLUDED.lagnam,
  gothram = EXCLUDED.gothram,
  manglik = EXCLUDED.manglik;
INSERT INTO public.horoscope_details (user_id, star, raasi, lagnam, gothram, manglik)
VALUES ('00000000-0000-4000-a000-000000000090', 'Uttaraphalguni', 'Dhanusu', 'Rishabam', 'Vishnu', 'no')
ON CONFLICT (user_id) DO UPDATE SET
  star = EXCLUDED.star,
  raasi = EXCLUDED.raasi,
  lagnam = EXCLUDED.lagnam,
  gothram = EXCLUDED.gothram,
  manglik = EXCLUDED.manglik;
INSERT INTO public.horoscope_details (user_id, star, raasi, lagnam, gothram, manglik)
VALUES ('00000000-0000-4000-a000-000000000091', 'Mirgashira', 'Meenam', 'Kanni', 'Atri', 'no')
ON CONFLICT (user_id) DO UPDATE SET
  star = EXCLUDED.star,
  raasi = EXCLUDED.raasi,
  lagnam = EXCLUDED.lagnam,
  gothram = EXCLUDED.gothram,
  manglik = EXCLUDED.manglik;
INSERT INTO public.horoscope_details (user_id, star, raasi, lagnam, gothram, manglik)
VALUES ('00000000-0000-4000-a000-000000000092', 'Moola', 'Meenam', 'Thulaam', 'Harita', 'no')
ON CONFLICT (user_id) DO UPDATE SET
  star = EXCLUDED.star,
  raasi = EXCLUDED.raasi,
  lagnam = EXCLUDED.lagnam,
  gothram = EXCLUDED.gothram,
  manglik = EXCLUDED.manglik;
INSERT INTO public.horoscope_details (user_id, star, raasi, lagnam, gothram, manglik)
VALUES ('00000000-0000-4000-a000-000000000093', 'Vishakha', 'Magaram', 'Magaram', 'Vashishta', 'no')
ON CONFLICT (user_id) DO UPDATE SET
  star = EXCLUDED.star,
  raasi = EXCLUDED.raasi,
  lagnam = EXCLUDED.lagnam,
  gothram = EXCLUDED.gothram,
  manglik = EXCLUDED.manglik;
INSERT INTO public.horoscope_details (user_id, star, raasi, lagnam, gothram, manglik)
VALUES ('00000000-0000-4000-a000-000000000094', 'Uttarabhadrapada', 'Kanni', 'Kanni', 'Viswamitra', 'no')
ON CONFLICT (user_id) DO UPDATE SET
  star = EXCLUDED.star,
  raasi = EXCLUDED.raasi,
  lagnam = EXCLUDED.lagnam,
  gothram = EXCLUDED.gothram,
  manglik = EXCLUDED.manglik;
INSERT INTO public.horoscope_details (user_id, star, raasi, lagnam, gothram, manglik)
VALUES ('00000000-0000-4000-a000-000000000095', 'Punarvasu', 'Mithunam', 'Kadagam', 'Kasyapa', 'yes')
ON CONFLICT (user_id) DO UPDATE SET
  star = EXCLUDED.star,
  raasi = EXCLUDED.raasi,
  lagnam = EXCLUDED.lagnam,
  gothram = EXCLUDED.gothram,
  manglik = EXCLUDED.manglik;
INSERT INTO public.horoscope_details (user_id, star, raasi, lagnam, gothram, manglik)
VALUES ('00000000-0000-4000-a000-000000000096', 'Jyeshta', 'Kanni', 'Mithunam', 'Murugan', 'yes')
ON CONFLICT (user_id) DO UPDATE SET
  star = EXCLUDED.star,
  raasi = EXCLUDED.raasi,
  lagnam = EXCLUDED.lagnam,
  gothram = EXCLUDED.gothram,
  manglik = EXCLUDED.manglik;
INSERT INTO public.horoscope_details (user_id, star, raasi, lagnam, gothram, manglik)
VALUES ('00000000-0000-4000-a000-000000000097', 'Jyeshta', 'Magaram', 'Kadagam', 'Murugan', 'no')
ON CONFLICT (user_id) DO UPDATE SET
  star = EXCLUDED.star,
  raasi = EXCLUDED.raasi,
  lagnam = EXCLUDED.lagnam,
  gothram = EXCLUDED.gothram,
  manglik = EXCLUDED.manglik;
INSERT INTO public.horoscope_details (user_id, star, raasi, lagnam, gothram, manglik)
VALUES ('00000000-0000-4000-a000-000000000098', 'Bharani', 'Simham', 'Kadagam', 'Agastya', 'no')
ON CONFLICT (user_id) DO UPDATE SET
  star = EXCLUDED.star,
  raasi = EXCLUDED.raasi,
  lagnam = EXCLUDED.lagnam,
  gothram = EXCLUDED.gothram,
  manglik = EXCLUDED.manglik;
INSERT INTO public.horoscope_details (user_id, star, raasi, lagnam, gothram, manglik)
VALUES ('00000000-0000-4000-a000-000000000099', 'Anuradha', 'Dhanusu', 'Thulaam', 'Viswamitra', 'no')
ON CONFLICT (user_id) DO UPDATE SET
  star = EXCLUDED.star,
  raasi = EXCLUDED.raasi,
  lagnam = EXCLUDED.lagnam,
  gothram = EXCLUDED.gothram,
  manglik = EXCLUDED.manglik;
INSERT INTO public.horoscope_details (user_id, star, raasi, lagnam, gothram, manglik)
VALUES ('00000000-0000-4000-a000-00000000009a', 'Vishakha', 'Rishabam', 'Dhanusu', 'Murugan', 'yes')
ON CONFLICT (user_id) DO UPDATE SET
  star = EXCLUDED.star,
  raasi = EXCLUDED.raasi,
  lagnam = EXCLUDED.lagnam,
  gothram = EXCLUDED.gothram,
  manglik = EXCLUDED.manglik;
INSERT INTO public.horoscope_details (user_id, star, raasi, lagnam, gothram, manglik)
VALUES ('00000000-0000-4000-a000-00000000009b', 'Aslesha', 'Meenam', 'Simham', 'Vishnu', 'no')
ON CONFLICT (user_id) DO UPDATE SET
  star = EXCLUDED.star,
  raasi = EXCLUDED.raasi,
  lagnam = EXCLUDED.lagnam,
  gothram = EXCLUDED.gothram,
  manglik = EXCLUDED.manglik;
INSERT INTO public.horoscope_details (user_id, star, raasi, lagnam, gothram, manglik)
VALUES ('00000000-0000-4000-a000-00000000009c', 'Punarvasu', 'Thulaam', 'Simham', 'Viswamitra', 'no')
ON CONFLICT (user_id) DO UPDATE SET
  star = EXCLUDED.star,
  raasi = EXCLUDED.raasi,
  lagnam = EXCLUDED.lagnam,
  gothram = EXCLUDED.gothram,
  manglik = EXCLUDED.manglik;
INSERT INTO public.horoscope_details (user_id, star, raasi, lagnam, gothram, manglik)
VALUES ('00000000-0000-4000-a000-00000000009d', 'Rohini', 'Kumbam', 'Kanni', 'Angirasa', 'no')
ON CONFLICT (user_id) DO UPDATE SET
  star = EXCLUDED.star,
  raasi = EXCLUDED.raasi,
  lagnam = EXCLUDED.lagnam,
  gothram = EXCLUDED.gothram,
  manglik = EXCLUDED.manglik;
INSERT INTO public.horoscope_details (user_id, star, raasi, lagnam, gothram, manglik)
VALUES ('00000000-0000-4000-a000-00000000009e', 'Hasta', 'Dhanusu', 'Magaram', 'Angirasa', 'no')
ON CONFLICT (user_id) DO UPDATE SET
  star = EXCLUDED.star,
  raasi = EXCLUDED.raasi,
  lagnam = EXCLUDED.lagnam,
  gothram = EXCLUDED.gothram,
  manglik = EXCLUDED.manglik;
INSERT INTO public.horoscope_details (user_id, star, raasi, lagnam, gothram, manglik)
VALUES ('00000000-0000-4000-a000-00000000009f', 'Dhanishta', 'Viruchigam', 'Mesham', 'Harita', 'no')
ON CONFLICT (user_id) DO UPDATE SET
  star = EXCLUDED.star,
  raasi = EXCLUDED.raasi,
  lagnam = EXCLUDED.lagnam,
  gothram = EXCLUDED.gothram,
  manglik = EXCLUDED.manglik;
INSERT INTO public.horoscope_details (user_id, star, raasi, lagnam, gothram, manglik)
VALUES ('00000000-0000-4000-a000-0000000000a0', 'Shatabhisha', 'Mithunam', 'Mesham', 'Kasyapa', 'no')
ON CONFLICT (user_id) DO UPDATE SET
  star = EXCLUDED.star,
  raasi = EXCLUDED.raasi,
  lagnam = EXCLUDED.lagnam,
  gothram = EXCLUDED.gothram,
  manglik = EXCLUDED.manglik;
INSERT INTO public.horoscope_details (user_id, star, raasi, lagnam, gothram, manglik)
VALUES ('00000000-0000-4000-a000-0000000000a1', 'Shatabhisha', 'Mesham', 'Magaram', 'Vashishta', 'no')
ON CONFLICT (user_id) DO UPDATE SET
  star = EXCLUDED.star,
  raasi = EXCLUDED.raasi,
  lagnam = EXCLUDED.lagnam,
  gothram = EXCLUDED.gothram,
  manglik = EXCLUDED.manglik;
INSERT INTO public.horoscope_details (user_id, star, raasi, lagnam, gothram, manglik)
VALUES ('00000000-0000-4000-a000-0000000000a2', 'Aslesha', 'Dhanusu', 'Kumbam', 'Kasyapa', 'yes')
ON CONFLICT (user_id) DO UPDATE SET
  star = EXCLUDED.star,
  raasi = EXCLUDED.raasi,
  lagnam = EXCLUDED.lagnam,
  gothram = EXCLUDED.gothram,
  manglik = EXCLUDED.manglik;
INSERT INTO public.horoscope_details (user_id, star, raasi, lagnam, gothram, manglik)
VALUES ('00000000-0000-4000-a000-0000000000a3', 'Bharani', 'Mithunam', 'Meenam', 'Bharadwaj', 'yes')
ON CONFLICT (user_id) DO UPDATE SET
  star = EXCLUDED.star,
  raasi = EXCLUDED.raasi,
  lagnam = EXCLUDED.lagnam,
  gothram = EXCLUDED.gothram,
  manglik = EXCLUDED.manglik;
INSERT INTO public.horoscope_details (user_id, star, raasi, lagnam, gothram, manglik)
VALUES ('00000000-0000-4000-a000-0000000000a4', 'Magha', 'Kanni', 'Mithunam', 'Angirasa', 'no')
ON CONFLICT (user_id) DO UPDATE SET
  star = EXCLUDED.star,
  raasi = EXCLUDED.raasi,
  lagnam = EXCLUDED.lagnam,
  gothram = EXCLUDED.gothram,
  manglik = EXCLUDED.manglik;
INSERT INTO public.horoscope_details (user_id, star, raasi, lagnam, gothram, manglik)
VALUES ('00000000-0000-4000-a000-0000000000a5', 'Uttaraphalguni', 'Kumbam', 'Magaram', 'Angirasa', 'no')
ON CONFLICT (user_id) DO UPDATE SET
  star = EXCLUDED.star,
  raasi = EXCLUDED.raasi,
  lagnam = EXCLUDED.lagnam,
  gothram = EXCLUDED.gothram,
  manglik = EXCLUDED.manglik;
INSERT INTO public.horoscope_details (user_id, star, raasi, lagnam, gothram, manglik)
VALUES ('00000000-0000-4000-a000-0000000000a6', 'Uttarabhadrapada', 'Thulaam', 'Mithunam', 'Angirasa', 'no')
ON CONFLICT (user_id) DO UPDATE SET
  star = EXCLUDED.star,
  raasi = EXCLUDED.raasi,
  lagnam = EXCLUDED.lagnam,
  gothram = EXCLUDED.gothram,
  manglik = EXCLUDED.manglik;
INSERT INTO public.horoscope_details (user_id, star, raasi, lagnam, gothram, manglik)
VALUES ('00000000-0000-4000-a000-0000000000a7', 'Punarvasu', 'Magaram', 'Dhanusu', 'Atri', 'no')
ON CONFLICT (user_id) DO UPDATE SET
  star = EXCLUDED.star,
  raasi = EXCLUDED.raasi,
  lagnam = EXCLUDED.lagnam,
  gothram = EXCLUDED.gothram,
  manglik = EXCLUDED.manglik;
INSERT INTO public.horoscope_details (user_id, star, raasi, lagnam, gothram, manglik)
VALUES ('00000000-0000-4000-a000-0000000000a8', 'Vishakha', 'Mesham', 'Dhanusu', 'Agastya', 'no')
ON CONFLICT (user_id) DO UPDATE SET
  star = EXCLUDED.star,
  raasi = EXCLUDED.raasi,
  lagnam = EXCLUDED.lagnam,
  gothram = EXCLUDED.gothram,
  manglik = EXCLUDED.manglik;
INSERT INTO public.horoscope_details (user_id, star, raasi, lagnam, gothram, manglik)
VALUES ('00000000-0000-4000-a000-0000000000a9', 'Dhanishta', 'Simham', 'Thulaam', 'Bharadwaj', 'yes')
ON CONFLICT (user_id) DO UPDATE SET
  star = EXCLUDED.star,
  raasi = EXCLUDED.raasi,
  lagnam = EXCLUDED.lagnam,
  gothram = EXCLUDED.gothram,
  manglik = EXCLUDED.manglik;
INSERT INTO public.horoscope_details (user_id, star, raasi, lagnam, gothram, manglik)
VALUES ('00000000-0000-4000-a000-0000000000aa', 'Swati', 'Magaram', 'Thulaam', 'Bharadwaj', 'no')
ON CONFLICT (user_id) DO UPDATE SET
  star = EXCLUDED.star,
  raasi = EXCLUDED.raasi,
  lagnam = EXCLUDED.lagnam,
  gothram = EXCLUDED.gothram,
  manglik = EXCLUDED.manglik;

-- 4. PARTNER PREFERENCES INSERTIONS
INSERT INTO public.partner_preferences (user_id, age_min, age_max, height_min, height_max, marital_status, religion, caste, education, occupation, food_habit)
VALUES ('00000000-0000-4000-a000-000000000001', 21, 45, 164, 179, ARRAY['never_married']::TEXT[], ARRAY['Christian']::TEXT[], ARRAY['Protestant Christian', 'Caste No Bar']::TEXT[], ARRAY['M.Com', 'No Education Bar']::TEXT[], ARRAY['Dentist']::TEXT[], ARRAY['vegetarian','non_vegetarian']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  height_min = EXCLUDED.height_min,
  height_max = EXCLUDED.height_max,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  education = EXCLUDED.education,
  occupation = EXCLUDED.occupation,
  food_habit = EXCLUDED.food_habit;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, height_min, height_max, marital_status, religion, caste, education, occupation, food_habit)
VALUES ('00000000-0000-4000-a000-000000000002', 22, 30, 136, 151, ARRAY['never_married']::TEXT[], ARRAY['Hindu']::TEXT[], ARRAY['Arunthathiyar', 'Caste No Bar']::TEXT[], ARRAY['B.Sc', 'No Education Bar']::TEXT[], ARRAY['Pharmacist']::TEXT[], ARRAY['vegetarian','non_vegetarian']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  height_min = EXCLUDED.height_min,
  height_max = EXCLUDED.height_max,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  education = EXCLUDED.education,
  occupation = EXCLUDED.occupation,
  food_habit = EXCLUDED.food_habit;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, height_min, height_max, marital_status, religion, caste, education, occupation, food_habit)
VALUES ('00000000-0000-4000-a000-000000000003', 28, 42, 157, 172, ARRAY['never_married']::TEXT[], ARRAY['Hindu']::TEXT[], ARRAY['Brahmin - Iyengar', 'Caste No Bar']::TEXT[], ARRAY['M.B.A', 'No Education Bar']::TEXT[], ARRAY['Business Owner']::TEXT[], ARRAY['vegetarian','non_vegetarian']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  height_min = EXCLUDED.height_min,
  height_max = EXCLUDED.height_max,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  education = EXCLUDED.education,
  occupation = EXCLUDED.occupation,
  food_habit = EXCLUDED.food_habit;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, height_min, height_max, marital_status, religion, caste, education, occupation, food_habit)
VALUES ('00000000-0000-4000-a000-000000000004', 21, 31, 144, 159, ARRAY['never_married']::TEXT[], ARRAY['Hindu']::TEXT[], ARRAY['Agamudayar', 'Caste No Bar']::TEXT[], ARRAY['M.B.A', 'No Education Bar']::TEXT[], ARRAY['Doctor']::TEXT[], ARRAY['vegetarian','non_vegetarian']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  height_min = EXCLUDED.height_min,
  height_max = EXCLUDED.height_max,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  education = EXCLUDED.education,
  occupation = EXCLUDED.occupation,
  food_habit = EXCLUDED.food_habit;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, height_min, height_max, marital_status, religion, caste, education, occupation, food_habit)
VALUES ('00000000-0000-4000-a000-000000000005', 21, 41, 158, 173, ARRAY['never_married']::TEXT[], ARRAY['Hindu']::TEXT[], ARRAY['Pillai', 'Caste No Bar']::TEXT[], ARRAY['M.A', 'No Education Bar']::TEXT[], ARRAY['Police Officer']::TEXT[], ARRAY['vegetarian','non_vegetarian']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  height_min = EXCLUDED.height_min,
  height_max = EXCLUDED.height_max,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  education = EXCLUDED.education,
  occupation = EXCLUDED.occupation,
  food_habit = EXCLUDED.food_habit;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, height_min, height_max, marital_status, religion, caste, education, occupation, food_habit)
VALUES ('00000000-0000-4000-a000-000000000006', 24, 45, 142, 157, ARRAY['never_married']::TEXT[], ARRAY['Hindu']::TEXT[], ARRAY['Maravar', 'Caste No Bar']::TEXT[], ARRAY['M.B.A', 'No Education Bar']::TEXT[], ARRAY['Mechanical Engineer']::TEXT[], ARRAY['vegetarian','non_vegetarian']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  height_min = EXCLUDED.height_min,
  height_max = EXCLUDED.height_max,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  education = EXCLUDED.education,
  occupation = EXCLUDED.occupation,
  food_habit = EXCLUDED.food_habit;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, height_min, height_max, marital_status, religion, caste, education, occupation, food_habit)
VALUES ('00000000-0000-4000-a000-000000000007', 25, 36, 157, 172, ARRAY['never_married']::TEXT[], ARRAY['Hindu']::TEXT[], ARRAY['Vanniyar', 'Caste No Bar']::TEXT[], ARRAY['M.B.B.S', 'No Education Bar']::TEXT[], ARRAY['College Professor']::TEXT[], ARRAY['vegetarian','non_vegetarian']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  height_min = EXCLUDED.height_min,
  height_max = EXCLUDED.height_max,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  education = EXCLUDED.education,
  occupation = EXCLUDED.occupation,
  food_habit = EXCLUDED.food_habit;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, height_min, height_max, marital_status, religion, caste, education, occupation, food_habit)
VALUES ('00000000-0000-4000-a000-000000000008', 27, 43, 154, 169, ARRAY['never_married']::TEXT[], ARRAY['Hindu']::TEXT[], ARRAY['Mudaliar', 'Caste No Bar']::TEXT[], ARRAY['Ph.D', 'No Education Bar']::TEXT[], ARRAY['Business Owner']::TEXT[], ARRAY['vegetarian','non_vegetarian']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  height_min = EXCLUDED.height_min,
  height_max = EXCLUDED.height_max,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  education = EXCLUDED.education,
  occupation = EXCLUDED.occupation,
  food_habit = EXCLUDED.food_habit;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, height_min, height_max, marital_status, religion, caste, education, occupation, food_habit)
VALUES ('00000000-0000-4000-a000-000000000009', 27, 44, 170, 185, ARRAY['never_married']::TEXT[], ARRAY['Muslim']::TEXT[], ARRAY['Sunni Muslim', 'Caste No Bar']::TEXT[], ARRAY['B.Sc', 'No Education Bar']::TEXT[], ARRAY['Civil Engineer']::TEXT[], ARRAY['vegetarian','non_vegetarian']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  height_min = EXCLUDED.height_min,
  height_max = EXCLUDED.height_max,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  education = EXCLUDED.education,
  occupation = EXCLUDED.occupation,
  food_habit = EXCLUDED.food_habit;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, height_min, height_max, marital_status, religion, caste, education, occupation, food_habit)
VALUES ('00000000-0000-4000-a000-00000000000a', 27, 32, 136, 151, ARRAY['never_married']::TEXT[], ARRAY['Hindu']::TEXT[], ARRAY['Maravar', 'Caste No Bar']::TEXT[], ARRAY['M.Com', 'No Education Bar']::TEXT[], ARRAY['College Professor']::TEXT[], ARRAY['vegetarian','non_vegetarian']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  height_min = EXCLUDED.height_min,
  height_max = EXCLUDED.height_max,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  education = EXCLUDED.education,
  occupation = EXCLUDED.occupation,
  food_habit = EXCLUDED.food_habit;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, height_min, height_max, marital_status, religion, caste, education, occupation, food_habit)
VALUES ('00000000-0000-4000-a000-00000000000b', 27, 35, 153, 168, ARRAY['never_married']::TEXT[], ARRAY['Hindu']::TEXT[], ARRAY['Agamudayar', 'Caste No Bar']::TEXT[], ARRAY['M.Sc', 'No Education Bar']::TEXT[], ARRAY['HR Specialist']::TEXT[], ARRAY['vegetarian','non_vegetarian']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  height_min = EXCLUDED.height_min,
  height_max = EXCLUDED.height_max,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  education = EXCLUDED.education,
  occupation = EXCLUDED.occupation,
  food_habit = EXCLUDED.food_habit;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, height_min, height_max, marital_status, religion, caste, education, occupation, food_habit)
VALUES ('00000000-0000-4000-a000-00000000000c', 24, 42, 151, 166, ARRAY['never_married']::TEXT[], ARRAY['Hindu']::TEXT[], ARRAY['Kallar', 'Caste No Bar']::TEXT[], ARRAY['M.C.A', 'No Education Bar']::TEXT[], ARRAY['Civil Engineer']::TEXT[], ARRAY['vegetarian','non_vegetarian']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  height_min = EXCLUDED.height_min,
  height_max = EXCLUDED.height_max,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  education = EXCLUDED.education,
  occupation = EXCLUDED.occupation,
  food_habit = EXCLUDED.food_habit;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, height_min, height_max, marital_status, religion, caste, education, occupation, food_habit)
VALUES ('00000000-0000-4000-a000-00000000000d', 23, 42, 149, 164, ARRAY['never_married']::TEXT[], ARRAY['Hindu']::TEXT[], ARRAY['Pillai', 'Caste No Bar']::TEXT[], ARRAY['M.C.A', 'No Education Bar']::TEXT[], ARRAY['Government Officer']::TEXT[], ARRAY['vegetarian','non_vegetarian']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  height_min = EXCLUDED.height_min,
  height_max = EXCLUDED.height_max,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  education = EXCLUDED.education,
  occupation = EXCLUDED.occupation,
  food_habit = EXCLUDED.food_habit;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, height_min, height_max, marital_status, religion, caste, education, occupation, food_habit)
VALUES ('00000000-0000-4000-a000-00000000000e', 28, 43, 141, 156, ARRAY['never_married']::TEXT[], ARRAY['Hindu']::TEXT[], ARRAY['Devendra Kula Vellalar', 'Caste No Bar']::TEXT[], ARRAY['M.A', 'No Education Bar']::TEXT[], ARRAY['Bank Manager']::TEXT[], ARRAY['vegetarian','non_vegetarian']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  height_min = EXCLUDED.height_min,
  height_max = EXCLUDED.height_max,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  education = EXCLUDED.education,
  occupation = EXCLUDED.occupation,
  food_habit = EXCLUDED.food_habit;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, height_min, height_max, marital_status, religion, caste, education, occupation, food_habit)
VALUES ('00000000-0000-4000-a000-00000000000f', 21, 31, 152, 167, ARRAY['never_married']::TEXT[], ARRAY['Hindu']::TEXT[], ARRAY['Vanniyar', 'Caste No Bar']::TEXT[], ARRAY['M.Sc', 'No Education Bar']::TEXT[], ARRAY['Police Officer']::TEXT[], ARRAY['vegetarian','non_vegetarian']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  height_min = EXCLUDED.height_min,
  height_max = EXCLUDED.height_max,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  education = EXCLUDED.education,
  occupation = EXCLUDED.occupation,
  food_habit = EXCLUDED.food_habit;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, height_min, height_max, marital_status, religion, caste, education, occupation, food_habit)
VALUES ('00000000-0000-4000-a000-000000000010', 22, 43, 152, 167, ARRAY['never_married']::TEXT[], ARRAY['Muslim']::TEXT[], ARRAY['Shia Muslim', 'Caste No Bar']::TEXT[], ARRAY['M.Com', 'No Education Bar']::TEXT[], ARRAY['Police Officer']::TEXT[], ARRAY['vegetarian','non_vegetarian']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  height_min = EXCLUDED.height_min,
  height_max = EXCLUDED.height_max,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  education = EXCLUDED.education,
  occupation = EXCLUDED.occupation,
  food_habit = EXCLUDED.food_habit;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, height_min, height_max, marital_status, religion, caste, education, occupation, food_habit)
VALUES ('00000000-0000-4000-a000-000000000011', 23, 42, 166, 181, ARRAY['never_married']::TEXT[], ARRAY['Hindu']::TEXT[], ARRAY['Vellalar', 'Caste No Bar']::TEXT[], ARRAY['M.B.B.S', 'No Education Bar']::TEXT[], ARRAY['Police Officer']::TEXT[], ARRAY['vegetarian','non_vegetarian']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  height_min = EXCLUDED.height_min,
  height_max = EXCLUDED.height_max,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  education = EXCLUDED.education,
  occupation = EXCLUDED.occupation,
  food_habit = EXCLUDED.food_habit;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, height_min, height_max, marital_status, religion, caste, education, occupation, food_habit)
VALUES ('00000000-0000-4000-a000-000000000012', 27, 37, 141, 156, ARRAY['never_married']::TEXT[], ARRAY['Hindu']::TEXT[], ARRAY['Kallar', 'Caste No Bar']::TEXT[], ARRAY['M.B.A', 'No Education Bar']::TEXT[], ARRAY['HR Specialist']::TEXT[], ARRAY['vegetarian','non_vegetarian']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  height_min = EXCLUDED.height_min,
  height_max = EXCLUDED.height_max,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  education = EXCLUDED.education,
  occupation = EXCLUDED.occupation,
  food_habit = EXCLUDED.food_habit;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, height_min, height_max, marital_status, religion, caste, education, occupation, food_habit)
VALUES ('00000000-0000-4000-a000-000000000013', 24, 41, 162, 177, ARRAY['never_married']::TEXT[], ARRAY['Christian']::TEXT[], ARRAY['RC Christian', 'Caste No Bar']::TEXT[], ARRAY['B.Com', 'No Education Bar']::TEXT[], ARRAY['Architect']::TEXT[], ARRAY['vegetarian','non_vegetarian']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  height_min = EXCLUDED.height_min,
  height_max = EXCLUDED.height_max,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  education = EXCLUDED.education,
  occupation = EXCLUDED.occupation,
  food_habit = EXCLUDED.food_habit;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, height_min, height_max, marital_status, religion, caste, education, occupation, food_habit)
VALUES ('00000000-0000-4000-a000-000000000014', 24, 40, 155, 170, ARRAY['never_married']::TEXT[], ARRAY['Hindu']::TEXT[], ARRAY['Agamudayar', 'Caste No Bar']::TEXT[], ARRAY['M.Sc', 'No Education Bar']::TEXT[], ARRAY['Advocate']::TEXT[], ARRAY['vegetarian','non_vegetarian']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  height_min = EXCLUDED.height_min,
  height_max = EXCLUDED.height_max,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  education = EXCLUDED.education,
  occupation = EXCLUDED.occupation,
  food_habit = EXCLUDED.food_habit;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, height_min, height_max, marital_status, religion, caste, education, occupation, food_habit)
VALUES ('00000000-0000-4000-a000-000000000015', 24, 45, 161, 176, ARRAY['never_married']::TEXT[], ARRAY['Hindu']::TEXT[], ARRAY['Brahmin - Iyengar', 'Caste No Bar']::TEXT[], ARRAY['B.Sc', 'No Education Bar']::TEXT[], ARRAY['College Professor']::TEXT[], ARRAY['vegetarian','non_vegetarian']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  height_min = EXCLUDED.height_min,
  height_max = EXCLUDED.height_max,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  education = EXCLUDED.education,
  occupation = EXCLUDED.occupation,
  food_habit = EXCLUDED.food_habit;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, height_min, height_max, marital_status, religion, caste, education, occupation, food_habit)
VALUES ('00000000-0000-4000-a000-000000000016', 23, 40, 135, 150, ARRAY['never_married']::TEXT[], ARRAY['Hindu']::TEXT[], ARRAY['Naicker', 'Caste No Bar']::TEXT[], ARRAY['Ph.D', 'No Education Bar']::TEXT[], ARRAY['Civil Engineer']::TEXT[], ARRAY['vegetarian','non_vegetarian']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  height_min = EXCLUDED.height_min,
  height_max = EXCLUDED.height_max,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  education = EXCLUDED.education,
  occupation = EXCLUDED.occupation,
  food_habit = EXCLUDED.food_habit;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, height_min, height_max, marital_status, religion, caste, education, occupation, food_habit)
VALUES ('00000000-0000-4000-a000-000000000017', 26, 43, 153, 168, ARRAY['never_married']::TEXT[], ARRAY['Hindu']::TEXT[], ARRAY['Arunthathiyar', 'Caste No Bar']::TEXT[], ARRAY['B.A', 'No Education Bar']::TEXT[], ARRAY['Doctor']::TEXT[], ARRAY['vegetarian','non_vegetarian']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  height_min = EXCLUDED.height_min,
  height_max = EXCLUDED.height_max,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  education = EXCLUDED.education,
  occupation = EXCLUDED.occupation,
  food_habit = EXCLUDED.food_habit;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, height_min, height_max, marital_status, religion, caste, education, occupation, food_habit)
VALUES ('00000000-0000-4000-a000-000000000018', 21, 32, 152, 167, ARRAY['never_married']::TEXT[], ARRAY['Hindu']::TEXT[], ARRAY['Thevar', 'Caste No Bar']::TEXT[], ARRAY['B.Ed', 'No Education Bar']::TEXT[], ARRAY['Pharmacist']::TEXT[], ARRAY['vegetarian','non_vegetarian']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  height_min = EXCLUDED.height_min,
  height_max = EXCLUDED.height_max,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  education = EXCLUDED.education,
  occupation = EXCLUDED.occupation,
  food_habit = EXCLUDED.food_habit;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, height_min, height_max, marital_status, religion, caste, education, occupation, food_habit)
VALUES ('00000000-0000-4000-a000-000000000019', 28, 44, 165, 180, ARRAY['never_married']::TEXT[], ARRAY['Hindu']::TEXT[], ARRAY['Thevar', 'Caste No Bar']::TEXT[], ARRAY['M.B.B.S', 'No Education Bar']::TEXT[], ARRAY['Doctor']::TEXT[], ARRAY['vegetarian','non_vegetarian']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  height_min = EXCLUDED.height_min,
  height_max = EXCLUDED.height_max,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  education = EXCLUDED.education,
  occupation = EXCLUDED.occupation,
  food_habit = EXCLUDED.food_habit;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, height_min, height_max, marital_status, religion, caste, education, occupation, food_habit)
VALUES ('00000000-0000-4000-a000-00000000001a', 26, 31, 150, 165, ARRAY['never_married']::TEXT[], ARRAY['Hindu']::TEXT[], ARRAY['Naicker', 'Caste No Bar']::TEXT[], ARRAY['M.C.A', 'No Education Bar']::TEXT[], ARRAY['Business Owner']::TEXT[], ARRAY['vegetarian','non_vegetarian']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  height_min = EXCLUDED.height_min,
  height_max = EXCLUDED.height_max,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  education = EXCLUDED.education,
  occupation = EXCLUDED.occupation,
  food_habit = EXCLUDED.food_habit;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, height_min, height_max, marital_status, religion, caste, education, occupation, food_habit)
VALUES ('00000000-0000-4000-a000-00000000001b', 24, 34, 171, 186, ARRAY['never_married']::TEXT[], ARRAY['Hindu']::TEXT[], ARRAY['Maravar', 'Caste No Bar']::TEXT[], ARRAY['B.E. / B.Tech', 'No Education Bar']::TEXT[], ARRAY['Software Engineer']::TEXT[], ARRAY['vegetarian','non_vegetarian']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  height_min = EXCLUDED.height_min,
  height_max = EXCLUDED.height_max,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  education = EXCLUDED.education,
  occupation = EXCLUDED.occupation,
  food_habit = EXCLUDED.food_habit;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, height_min, height_max, marital_status, religion, caste, education, occupation, food_habit)
VALUES ('00000000-0000-4000-a000-00000000001c', 25, 37, 157, 172, ARRAY['never_married']::TEXT[], ARRAY['Muslim']::TEXT[], ARRAY['Labbai', 'Caste No Bar']::TEXT[], ARRAY['M.Sc', 'No Education Bar']::TEXT[], ARRAY['Mechanical Engineer']::TEXT[], ARRAY['vegetarian','non_vegetarian']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  height_min = EXCLUDED.height_min,
  height_max = EXCLUDED.height_max,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  education = EXCLUDED.education,
  occupation = EXCLUDED.occupation,
  food_habit = EXCLUDED.food_habit;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, height_min, height_max, marital_status, religion, caste, education, occupation, food_habit)
VALUES ('00000000-0000-4000-a000-00000000001d', 27, 32, 152, 167, ARRAY['never_married']::TEXT[], ARRAY['Muslim']::TEXT[], ARRAY['Shia Muslim', 'Caste No Bar']::TEXT[], ARRAY['B.Ed', 'No Education Bar']::TEXT[], ARRAY['Software Engineer']::TEXT[], ARRAY['vegetarian','non_vegetarian']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  height_min = EXCLUDED.height_min,
  height_max = EXCLUDED.height_max,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  education = EXCLUDED.education,
  occupation = EXCLUDED.occupation,
  food_habit = EXCLUDED.food_habit;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, height_min, height_max, marital_status, religion, caste, education, occupation, food_habit)
VALUES ('00000000-0000-4000-a000-00000000001e', 27, 34, 147, 162, ARRAY['never_married']::TEXT[], ARRAY['Hindu']::TEXT[], ARRAY['Pillai', 'Caste No Bar']::TEXT[], ARRAY['M.A', 'No Education Bar']::TEXT[], ARRAY['Dentist']::TEXT[], ARRAY['vegetarian','non_vegetarian']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  height_min = EXCLUDED.height_min,
  height_max = EXCLUDED.height_max,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  education = EXCLUDED.education,
  occupation = EXCLUDED.occupation,
  food_habit = EXCLUDED.food_habit;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, height_min, height_max, marital_status, religion, caste, education, occupation, food_habit)
VALUES ('00000000-0000-4000-a000-00000000001f', 22, 35, 170, 185, ARRAY['never_married']::TEXT[], ARRAY['Hindu']::TEXT[], ARRAY['Brahmin - Iyengar', 'Caste No Bar']::TEXT[], ARRAY['B.Sc', 'No Education Bar']::TEXT[], ARRAY['College Professor']::TEXT[], ARRAY['vegetarian','non_vegetarian']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  height_min = EXCLUDED.height_min,
  height_max = EXCLUDED.height_max,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  education = EXCLUDED.education,
  occupation = EXCLUDED.occupation,
  food_habit = EXCLUDED.food_habit;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, height_min, height_max, marital_status, religion, caste, education, occupation, food_habit)
VALUES ('00000000-0000-4000-a000-000000000020', 28, 32, 150, 165, ARRAY['never_married']::TEXT[], ARRAY['Hindu']::TEXT[], ARRAY['Sengunthar', 'Caste No Bar']::TEXT[], ARRAY['M.A', 'No Education Bar']::TEXT[], ARRAY['Advocate']::TEXT[], ARRAY['vegetarian','non_vegetarian']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  height_min = EXCLUDED.height_min,
  height_max = EXCLUDED.height_max,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  education = EXCLUDED.education,
  occupation = EXCLUDED.occupation,
  food_habit = EXCLUDED.food_habit;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, height_min, height_max, marital_status, religion, caste, education, occupation, food_habit)
VALUES ('00000000-0000-4000-a000-000000000021', 27, 38, 164, 179, ARRAY['never_married']::TEXT[], ARRAY['Hindu']::TEXT[], ARRAY['Vanniyar', 'Caste No Bar']::TEXT[], ARRAY['M.Sc', 'No Education Bar']::TEXT[], ARRAY['School Teacher']::TEXT[], ARRAY['vegetarian','non_vegetarian']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  height_min = EXCLUDED.height_min,
  height_max = EXCLUDED.height_max,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  education = EXCLUDED.education,
  occupation = EXCLUDED.occupation,
  food_habit = EXCLUDED.food_habit;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, height_min, height_max, marital_status, religion, caste, education, occupation, food_habit)
VALUES ('00000000-0000-4000-a000-000000000022', 21, 43, 147, 162, ARRAY['never_married']::TEXT[], ARRAY['Hindu']::TEXT[], ARRAY['Yadav', 'Caste No Bar']::TEXT[], ARRAY['M.B.B.S', 'No Education Bar']::TEXT[], ARRAY['Architect']::TEXT[], ARRAY['vegetarian','non_vegetarian']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  height_min = EXCLUDED.height_min,
  height_max = EXCLUDED.height_max,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  education = EXCLUDED.education,
  occupation = EXCLUDED.occupation,
  food_habit = EXCLUDED.food_habit;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, height_min, height_max, marital_status, religion, caste, education, occupation, food_habit)
VALUES ('00000000-0000-4000-a000-000000000023', 27, 32, 171, 186, ARRAY['never_married']::TEXT[], ARRAY['Hindu']::TEXT[], ARRAY['Pillai', 'Caste No Bar']::TEXT[], ARRAY['M.B.A', 'No Education Bar']::TEXT[], ARRAY['Mechanical Engineer']::TEXT[], ARRAY['vegetarian','non_vegetarian']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  height_min = EXCLUDED.height_min,
  height_max = EXCLUDED.height_max,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  education = EXCLUDED.education,
  occupation = EXCLUDED.occupation,
  food_habit = EXCLUDED.food_habit;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, height_min, height_max, marital_status, religion, caste, education, occupation, food_habit)
VALUES ('00000000-0000-4000-a000-000000000024', 26, 36, 139, 154, ARRAY['never_married']::TEXT[], ARRAY['Hindu']::TEXT[], ARRAY['Naicker', 'Caste No Bar']::TEXT[], ARRAY['Ph.D', 'No Education Bar']::TEXT[], ARRAY['Software Engineer']::TEXT[], ARRAY['vegetarian','non_vegetarian']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  height_min = EXCLUDED.height_min,
  height_max = EXCLUDED.height_max,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  education = EXCLUDED.education,
  occupation = EXCLUDED.occupation,
  food_habit = EXCLUDED.food_habit;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, height_min, height_max, marital_status, religion, caste, education, occupation, food_habit)
VALUES ('00000000-0000-4000-a000-000000000025', 22, 44, 167, 182, ARRAY['never_married']::TEXT[], ARRAY['Muslim']::TEXT[], ARRAY['Rawther', 'Caste No Bar']::TEXT[], ARRAY['M.C.A', 'No Education Bar']::TEXT[], ARRAY['Software Engineer']::TEXT[], ARRAY['vegetarian','non_vegetarian']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  height_min = EXCLUDED.height_min,
  height_max = EXCLUDED.height_max,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  education = EXCLUDED.education,
  occupation = EXCLUDED.occupation,
  food_habit = EXCLUDED.food_habit;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, height_min, height_max, marital_status, religion, caste, education, occupation, food_habit)
VALUES ('00000000-0000-4000-a000-000000000026', 24, 37, 145, 160, ARRAY['never_married']::TEXT[], ARRAY['Hindu']::TEXT[], ARRAY['Thevar', 'Caste No Bar']::TEXT[], ARRAY['M.C.A', 'No Education Bar']::TEXT[], ARRAY['HR Specialist']::TEXT[], ARRAY['vegetarian','non_vegetarian']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  height_min = EXCLUDED.height_min,
  height_max = EXCLUDED.height_max,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  education = EXCLUDED.education,
  occupation = EXCLUDED.occupation,
  food_habit = EXCLUDED.food_habit;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, height_min, height_max, marital_status, religion, caste, education, occupation, food_habit)
VALUES ('00000000-0000-4000-a000-000000000027', 21, 38, 153, 168, ARRAY['never_married']::TEXT[], ARRAY['Hindu']::TEXT[], ARRAY['Agamudayar', 'Caste No Bar']::TEXT[], ARRAY['Ph.D', 'No Education Bar']::TEXT[], ARRAY['College Professor']::TEXT[], ARRAY['vegetarian','non_vegetarian']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  height_min = EXCLUDED.height_min,
  height_max = EXCLUDED.height_max,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  education = EXCLUDED.education,
  occupation = EXCLUDED.occupation,
  food_habit = EXCLUDED.food_habit;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, height_min, height_max, marital_status, religion, caste, education, occupation, food_habit)
VALUES ('00000000-0000-4000-a000-000000000028', 25, 37, 141, 156, ARRAY['never_married']::TEXT[], ARRAY['Hindu']::TEXT[], ARRAY['Kallar', 'Caste No Bar']::TEXT[], ARRAY['B.Sc', 'No Education Bar']::TEXT[], ARRAY['Bank Manager']::TEXT[], ARRAY['vegetarian','non_vegetarian']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  height_min = EXCLUDED.height_min,
  height_max = EXCLUDED.height_max,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  education = EXCLUDED.education,
  occupation = EXCLUDED.occupation,
  food_habit = EXCLUDED.food_habit;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, height_min, height_max, marital_status, religion, caste, education, occupation, food_habit)
VALUES ('00000000-0000-4000-a000-000000000029', 27, 36, 165, 180, ARRAY['never_married']::TEXT[], ARRAY['Hindu']::TEXT[], ARRAY['Vellalar', 'Caste No Bar']::TEXT[], ARRAY['M.B.B.S', 'No Education Bar']::TEXT[], ARRAY['Police Officer']::TEXT[], ARRAY['vegetarian','non_vegetarian']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  height_min = EXCLUDED.height_min,
  height_max = EXCLUDED.height_max,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  education = EXCLUDED.education,
  occupation = EXCLUDED.occupation,
  food_habit = EXCLUDED.food_habit;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, height_min, height_max, marital_status, religion, caste, education, occupation, food_habit)
VALUES ('00000000-0000-4000-a000-00000000002a', 28, 34, 137, 152, ARRAY['never_married']::TEXT[], ARRAY['Hindu']::TEXT[], ARRAY['Arunthathiyar', 'Caste No Bar']::TEXT[], ARRAY['M.A', 'No Education Bar']::TEXT[], ARRAY['Pharmacist']::TEXT[], ARRAY['vegetarian','non_vegetarian']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  height_min = EXCLUDED.height_min,
  height_max = EXCLUDED.height_max,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  education = EXCLUDED.education,
  occupation = EXCLUDED.occupation,
  food_habit = EXCLUDED.food_habit;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, height_min, height_max, marital_status, religion, caste, education, occupation, food_habit)
VALUES ('00000000-0000-4000-a000-00000000002b', 28, 45, 170, 185, ARRAY['never_married']::TEXT[], ARRAY['Hindu']::TEXT[], ARRAY['Adi Dravida', 'Caste No Bar']::TEXT[], ARRAY['B.A', 'No Education Bar']::TEXT[], ARRAY['School Teacher']::TEXT[], ARRAY['vegetarian','non_vegetarian']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  height_min = EXCLUDED.height_min,
  height_max = EXCLUDED.height_max,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  education = EXCLUDED.education,
  occupation = EXCLUDED.occupation,
  food_habit = EXCLUDED.food_habit;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, height_min, height_max, marital_status, religion, caste, education, occupation, food_habit)
VALUES ('00000000-0000-4000-a000-00000000002c', 28, 40, 142, 157, ARRAY['never_married']::TEXT[], ARRAY['Hindu']::TEXT[], ARRAY['Kallar', 'Caste No Bar']::TEXT[], ARRAY['M.A', 'No Education Bar']::TEXT[], ARRAY['College Professor']::TEXT[], ARRAY['vegetarian','non_vegetarian']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  height_min = EXCLUDED.height_min,
  height_max = EXCLUDED.height_max,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  education = EXCLUDED.education,
  occupation = EXCLUDED.occupation,
  food_habit = EXCLUDED.food_habit;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, height_min, height_max, marital_status, religion, caste, education, occupation, food_habit)
VALUES ('00000000-0000-4000-a000-00000000002d', 27, 36, 160, 175, ARRAY['never_married']::TEXT[], ARRAY['Hindu']::TEXT[], ARRAY['Naidu', 'Caste No Bar']::TEXT[], ARRAY['B.Ed', 'No Education Bar']::TEXT[], ARRAY['Mechanical Engineer']::TEXT[], ARRAY['vegetarian','non_vegetarian']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  height_min = EXCLUDED.height_min,
  height_max = EXCLUDED.height_max,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  education = EXCLUDED.education,
  occupation = EXCLUDED.occupation,
  food_habit = EXCLUDED.food_habit;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, height_min, height_max, marital_status, religion, caste, education, occupation, food_habit)
VALUES ('00000000-0000-4000-a000-00000000002e', 25, 40, 135, 150, ARRAY['never_married']::TEXT[], ARRAY['Hindu']::TEXT[], ARRAY['Devendra Kula Vellalar', 'Caste No Bar']::TEXT[], ARRAY['B.Sc', 'No Education Bar']::TEXT[], ARRAY['Auditor']::TEXT[], ARRAY['vegetarian','non_vegetarian']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  height_min = EXCLUDED.height_min,
  height_max = EXCLUDED.height_max,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  education = EXCLUDED.education,
  occupation = EXCLUDED.occupation,
  food_habit = EXCLUDED.food_habit;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, height_min, height_max, marital_status, religion, caste, education, occupation, food_habit)
VALUES ('00000000-0000-4000-a000-00000000002f', 27, 30, 172, 187, ARRAY['never_married']::TEXT[], ARRAY['Hindu']::TEXT[], ARRAY['Nadar', 'Caste No Bar']::TEXT[], ARRAY['M.Sc', 'No Education Bar']::TEXT[], ARRAY['Dentist']::TEXT[], ARRAY['vegetarian','non_vegetarian']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  height_min = EXCLUDED.height_min,
  height_max = EXCLUDED.height_max,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  education = EXCLUDED.education,
  occupation = EXCLUDED.occupation,
  food_habit = EXCLUDED.food_habit;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, height_min, height_max, marital_status, religion, caste, education, occupation, food_habit)
VALUES ('00000000-0000-4000-a000-000000000030', 27, 35, 150, 165, ARRAY['never_married']::TEXT[], ARRAY['Hindu']::TEXT[], ARRAY['Arunthathiyar', 'Caste No Bar']::TEXT[], ARRAY['M.C.A', 'No Education Bar']::TEXT[], ARRAY['Bank Manager']::TEXT[], ARRAY['vegetarian','non_vegetarian']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  height_min = EXCLUDED.height_min,
  height_max = EXCLUDED.height_max,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  education = EXCLUDED.education,
  occupation = EXCLUDED.occupation,
  food_habit = EXCLUDED.food_habit;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, height_min, height_max, marital_status, religion, caste, education, occupation, food_habit)
VALUES ('00000000-0000-4000-a000-000000000031', 24, 38, 164, 179, ARRAY['never_married']::TEXT[], ARRAY['Muslim']::TEXT[], ARRAY['Marakayar', 'Caste No Bar']::TEXT[], ARRAY['B.A', 'No Education Bar']::TEXT[], ARRAY['Business Owner']::TEXT[], ARRAY['vegetarian','non_vegetarian']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  height_min = EXCLUDED.height_min,
  height_max = EXCLUDED.height_max,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  education = EXCLUDED.education,
  occupation = EXCLUDED.occupation,
  food_habit = EXCLUDED.food_habit;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, height_min, height_max, marital_status, religion, caste, education, occupation, food_habit)
VALUES ('00000000-0000-4000-a000-000000000032', 21, 35, 145, 160, ARRAY['never_married']::TEXT[], ARRAY['Muslim']::TEXT[], ARRAY['Labbai', 'Caste No Bar']::TEXT[], ARRAY['Ph.D', 'No Education Bar']::TEXT[], ARRAY['Bank Manager']::TEXT[], ARRAY['vegetarian','non_vegetarian']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  height_min = EXCLUDED.height_min,
  height_max = EXCLUDED.height_max,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  education = EXCLUDED.education,
  occupation = EXCLUDED.occupation,
  food_habit = EXCLUDED.food_habit;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, height_min, height_max, marital_status, religion, caste, education, occupation, food_habit)
VALUES ('00000000-0000-4000-a000-000000000033', 22, 39, 171, 186, ARRAY['never_married']::TEXT[], ARRAY['Muslim']::TEXT[], ARRAY['Rawther', 'Caste No Bar']::TEXT[], ARRAY['B.E. / B.Tech', 'No Education Bar']::TEXT[], ARRAY['Bank Manager']::TEXT[], ARRAY['vegetarian','non_vegetarian']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  height_min = EXCLUDED.height_min,
  height_max = EXCLUDED.height_max,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  education = EXCLUDED.education,
  occupation = EXCLUDED.occupation,
  food_habit = EXCLUDED.food_habit;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, height_min, height_max, marital_status, religion, caste, education, occupation, food_habit)
VALUES ('00000000-0000-4000-a000-000000000034', 21, 35, 136, 151, ARRAY['never_married']::TEXT[], ARRAY['Hindu']::TEXT[], ARRAY['Vanniyar', 'Caste No Bar']::TEXT[], ARRAY['Ph.D', 'No Education Bar']::TEXT[], ARRAY['Bank Manager']::TEXT[], ARRAY['vegetarian','non_vegetarian']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  height_min = EXCLUDED.height_min,
  height_max = EXCLUDED.height_max,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  education = EXCLUDED.education,
  occupation = EXCLUDED.occupation,
  food_habit = EXCLUDED.food_habit;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, height_min, height_max, marital_status, religion, caste, education, occupation, food_habit)
VALUES ('00000000-0000-4000-a000-000000000035', 23, 36, 166, 181, ARRAY['never_married']::TEXT[], ARRAY['Hindu']::TEXT[], ARRAY['Adi Dravida', 'Caste No Bar']::TEXT[], ARRAY['M.C.A', 'No Education Bar']::TEXT[], ARRAY['Mechanical Engineer']::TEXT[], ARRAY['vegetarian','non_vegetarian']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  height_min = EXCLUDED.height_min,
  height_max = EXCLUDED.height_max,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  education = EXCLUDED.education,
  occupation = EXCLUDED.occupation,
  food_habit = EXCLUDED.food_habit;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, height_min, height_max, marital_status, religion, caste, education, occupation, food_habit)
VALUES ('00000000-0000-4000-a000-000000000036', 22, 40, 144, 159, ARRAY['never_married']::TEXT[], ARRAY['Hindu']::TEXT[], ARRAY['Chettiar', 'Caste No Bar']::TEXT[], ARRAY['B.Ed', 'No Education Bar']::TEXT[], ARRAY['Advocate']::TEXT[], ARRAY['vegetarian','non_vegetarian']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  height_min = EXCLUDED.height_min,
  height_max = EXCLUDED.height_max,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  education = EXCLUDED.education,
  occupation = EXCLUDED.occupation,
  food_habit = EXCLUDED.food_habit;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, height_min, height_max, marital_status, religion, caste, education, occupation, food_habit)
VALUES ('00000000-0000-4000-a000-000000000037', 21, 42, 154, 169, ARRAY['never_married']::TEXT[], ARRAY['Christian']::TEXT[], ARRAY['RC Christian', 'Caste No Bar']::TEXT[], ARRAY['M.B.A', 'No Education Bar']::TEXT[], ARRAY['School Teacher']::TEXT[], ARRAY['vegetarian','non_vegetarian']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  height_min = EXCLUDED.height_min,
  height_max = EXCLUDED.height_max,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  education = EXCLUDED.education,
  occupation = EXCLUDED.occupation,
  food_habit = EXCLUDED.food_habit;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, height_min, height_max, marital_status, religion, caste, education, occupation, food_habit)
VALUES ('00000000-0000-4000-a000-000000000038', 25, 45, 150, 165, ARRAY['never_married']::TEXT[], ARRAY['Christian']::TEXT[], ARRAY['RC Christian', 'Caste No Bar']::TEXT[], ARRAY['B.E. / B.Tech', 'No Education Bar']::TEXT[], ARRAY['Business Owner']::TEXT[], ARRAY['vegetarian','non_vegetarian']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  height_min = EXCLUDED.height_min,
  height_max = EXCLUDED.height_max,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  education = EXCLUDED.education,
  occupation = EXCLUDED.occupation,
  food_habit = EXCLUDED.food_habit;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, height_min, height_max, marital_status, religion, caste, education, occupation, food_habit)
VALUES ('00000000-0000-4000-a000-000000000039', 23, 32, 167, 182, ARRAY['never_married']::TEXT[], ARRAY['Hindu']::TEXT[], ARRAY['Adi Dravida', 'Caste No Bar']::TEXT[], ARRAY['M.B.B.S', 'No Education Bar']::TEXT[], ARRAY['School Teacher']::TEXT[], ARRAY['vegetarian','non_vegetarian']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  height_min = EXCLUDED.height_min,
  height_max = EXCLUDED.height_max,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  education = EXCLUDED.education,
  occupation = EXCLUDED.occupation,
  food_habit = EXCLUDED.food_habit;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, height_min, height_max, marital_status, religion, caste, education, occupation, food_habit)
VALUES ('00000000-0000-4000-a000-00000000003a', 26, 35, 145, 160, ARRAY['never_married']::TEXT[], ARRAY['Hindu']::TEXT[], ARRAY['Devendra Kula Vellalar', 'Caste No Bar']::TEXT[], ARRAY['M.C.A', 'No Education Bar']::TEXT[], ARRAY['Architect']::TEXT[], ARRAY['vegetarian','non_vegetarian']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  height_min = EXCLUDED.height_min,
  height_max = EXCLUDED.height_max,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  education = EXCLUDED.education,
  occupation = EXCLUDED.occupation,
  food_habit = EXCLUDED.food_habit;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, height_min, height_max, marital_status, religion, caste, education, occupation, food_habit)
VALUES ('00000000-0000-4000-a000-00000000003b', 24, 45, 164, 179, ARRAY['never_married']::TEXT[], ARRAY['Hindu']::TEXT[], ARRAY['Naidu', 'Caste No Bar']::TEXT[], ARRAY['B.Sc', 'No Education Bar']::TEXT[], ARRAY['Software Engineer']::TEXT[], ARRAY['vegetarian','non_vegetarian']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  height_min = EXCLUDED.height_min,
  height_max = EXCLUDED.height_max,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  education = EXCLUDED.education,
  occupation = EXCLUDED.occupation,
  food_habit = EXCLUDED.food_habit;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, height_min, height_max, marital_status, religion, caste, education, occupation, food_habit)
VALUES ('00000000-0000-4000-a000-00000000003c', 27, 37, 139, 154, ARRAY['never_married']::TEXT[], ARRAY['Hindu']::TEXT[], ARRAY['Vishwakarma', 'Caste No Bar']::TEXT[], ARRAY['M.B.B.S', 'No Education Bar']::TEXT[], ARRAY['Auditor']::TEXT[], ARRAY['vegetarian','non_vegetarian']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  height_min = EXCLUDED.height_min,
  height_max = EXCLUDED.height_max,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  education = EXCLUDED.education,
  occupation = EXCLUDED.occupation,
  food_habit = EXCLUDED.food_habit;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, height_min, height_max, marital_status, religion, caste, education, occupation, food_habit)
VALUES ('00000000-0000-4000-a000-00000000003d', 23, 37, 167, 182, ARRAY['never_married']::TEXT[], ARRAY['Hindu']::TEXT[], ARRAY['Yadav', 'Caste No Bar']::TEXT[], ARRAY['M.Sc', 'No Education Bar']::TEXT[], ARRAY['Software Engineer']::TEXT[], ARRAY['vegetarian','non_vegetarian']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  height_min = EXCLUDED.height_min,
  height_max = EXCLUDED.height_max,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  education = EXCLUDED.education,
  occupation = EXCLUDED.occupation,
  food_habit = EXCLUDED.food_habit;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, height_min, height_max, marital_status, religion, caste, education, occupation, food_habit)
VALUES ('00000000-0000-4000-a000-00000000003e', 23, 33, 153, 168, ARRAY['never_married']::TEXT[], ARRAY['Hindu']::TEXT[], ARRAY['Kallar', 'Caste No Bar']::TEXT[], ARRAY['M.C.A', 'No Education Bar']::TEXT[], ARRAY['College Professor']::TEXT[], ARRAY['vegetarian','non_vegetarian']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  height_min = EXCLUDED.height_min,
  height_max = EXCLUDED.height_max,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  education = EXCLUDED.education,
  occupation = EXCLUDED.occupation,
  food_habit = EXCLUDED.food_habit;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, height_min, height_max, marital_status, religion, caste, education, occupation, food_habit)
VALUES ('00000000-0000-4000-a000-00000000003f', 24, 45, 151, 166, ARRAY['never_married']::TEXT[], ARRAY['Hindu']::TEXT[], ARRAY['Devendra Kula Vellalar', 'Caste No Bar']::TEXT[], ARRAY['B.Com', 'No Education Bar']::TEXT[], ARRAY['College Professor']::TEXT[], ARRAY['vegetarian','non_vegetarian']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  height_min = EXCLUDED.height_min,
  height_max = EXCLUDED.height_max,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  education = EXCLUDED.education,
  occupation = EXCLUDED.occupation,
  food_habit = EXCLUDED.food_habit;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, height_min, height_max, marital_status, religion, caste, education, occupation, food_habit)
VALUES ('00000000-0000-4000-a000-000000000040', 22, 45, 146, 161, ARRAY['never_married']::TEXT[], ARRAY['Hindu']::TEXT[], ARRAY['Kallar', 'Caste No Bar']::TEXT[], ARRAY['Ph.D', 'No Education Bar']::TEXT[], ARRAY['Mechanical Engineer']::TEXT[], ARRAY['vegetarian','non_vegetarian']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  height_min = EXCLUDED.height_min,
  height_max = EXCLUDED.height_max,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  education = EXCLUDED.education,
  occupation = EXCLUDED.occupation,
  food_habit = EXCLUDED.food_habit;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, height_min, height_max, marital_status, religion, caste, education, occupation, food_habit)
VALUES ('00000000-0000-4000-a000-000000000041', 28, 30, 156, 171, ARRAY['never_married']::TEXT[], ARRAY['Hindu']::TEXT[], ARRAY['Nadar', 'Caste No Bar']::TEXT[], ARRAY['M.B.A', 'No Education Bar']::TEXT[], ARRAY['Civil Engineer']::TEXT[], ARRAY['vegetarian','non_vegetarian']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  height_min = EXCLUDED.height_min,
  height_max = EXCLUDED.height_max,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  education = EXCLUDED.education,
  occupation = EXCLUDED.occupation,
  food_habit = EXCLUDED.food_habit;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, height_min, height_max, marital_status, religion, caste, education, occupation, food_habit)
VALUES ('00000000-0000-4000-a000-000000000042', 22, 30, 143, 158, ARRAY['never_married']::TEXT[], ARRAY['Hindu']::TEXT[], ARRAY['Vishwakarma', 'Caste No Bar']::TEXT[], ARRAY['Ph.D', 'No Education Bar']::TEXT[], ARRAY['Government Officer']::TEXT[], ARRAY['vegetarian','non_vegetarian']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  height_min = EXCLUDED.height_min,
  height_max = EXCLUDED.height_max,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  education = EXCLUDED.education,
  occupation = EXCLUDED.occupation,
  food_habit = EXCLUDED.food_habit;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, height_min, height_max, marital_status, religion, caste, education, occupation, food_habit)
VALUES ('00000000-0000-4000-a000-000000000043', 27, 30, 158, 173, ARRAY['never_married']::TEXT[], ARRAY['Hindu']::TEXT[], ARRAY['Nadar', 'Caste No Bar']::TEXT[], ARRAY['M.C.A', 'No Education Bar']::TEXT[], ARRAY['Mechanical Engineer']::TEXT[], ARRAY['vegetarian','non_vegetarian']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  height_min = EXCLUDED.height_min,
  height_max = EXCLUDED.height_max,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  education = EXCLUDED.education,
  occupation = EXCLUDED.occupation,
  food_habit = EXCLUDED.food_habit;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, height_min, height_max, marital_status, religion, caste, education, occupation, food_habit)
VALUES ('00000000-0000-4000-a000-000000000044', 25, 39, 147, 162, ARRAY['never_married']::TEXT[], ARRAY['Hindu']::TEXT[], ARRAY['Vellalar', 'Caste No Bar']::TEXT[], ARRAY['B.Com', 'No Education Bar']::TEXT[], ARRAY['Business Owner']::TEXT[], ARRAY['vegetarian','non_vegetarian']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  height_min = EXCLUDED.height_min,
  height_max = EXCLUDED.height_max,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  education = EXCLUDED.education,
  occupation = EXCLUDED.occupation,
  food_habit = EXCLUDED.food_habit;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, height_min, height_max, marital_status, religion, caste, education, occupation, food_habit)
VALUES ('00000000-0000-4000-a000-000000000045', 21, 41, 152, 167, ARRAY['never_married']::TEXT[], ARRAY['Hindu']::TEXT[], ARRAY['Naicker', 'Caste No Bar']::TEXT[], ARRAY['M.Sc', 'No Education Bar']::TEXT[], ARRAY['Bank Manager']::TEXT[], ARRAY['vegetarian','non_vegetarian']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  height_min = EXCLUDED.height_min,
  height_max = EXCLUDED.height_max,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  education = EXCLUDED.education,
  occupation = EXCLUDED.occupation,
  food_habit = EXCLUDED.food_habit;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, height_min, height_max, marital_status, religion, caste, education, occupation, food_habit)
VALUES ('00000000-0000-4000-a000-000000000046', 27, 42, 154, 169, ARRAY['never_married']::TEXT[], ARRAY['Hindu']::TEXT[], ARRAY['Arunthathiyar', 'Caste No Bar']::TEXT[], ARRAY['B.Sc', 'No Education Bar']::TEXT[], ARRAY['Mechanical Engineer']::TEXT[], ARRAY['vegetarian','non_vegetarian']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  height_min = EXCLUDED.height_min,
  height_max = EXCLUDED.height_max,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  education = EXCLUDED.education,
  occupation = EXCLUDED.occupation,
  food_habit = EXCLUDED.food_habit;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, height_min, height_max, marital_status, religion, caste, education, occupation, food_habit)
VALUES ('00000000-0000-4000-a000-000000000047', 28, 37, 154, 169, ARRAY['never_married']::TEXT[], ARRAY['Hindu']::TEXT[], ARRAY['Vishwakarma', 'Caste No Bar']::TEXT[], ARRAY['B.E. / B.Tech', 'No Education Bar']::TEXT[], ARRAY['Government Officer']::TEXT[], ARRAY['vegetarian','non_vegetarian']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  height_min = EXCLUDED.height_min,
  height_max = EXCLUDED.height_max,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  education = EXCLUDED.education,
  occupation = EXCLUDED.occupation,
  food_habit = EXCLUDED.food_habit;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, height_min, height_max, marital_status, religion, caste, education, occupation, food_habit)
VALUES ('00000000-0000-4000-a000-000000000048', 26, 35, 137, 152, ARRAY['never_married']::TEXT[], ARRAY['Muslim']::TEXT[], ARRAY['Marakayar', 'Caste No Bar']::TEXT[], ARRAY['M.B.B.S', 'No Education Bar']::TEXT[], ARRAY['HR Specialist']::TEXT[], ARRAY['vegetarian','non_vegetarian']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  height_min = EXCLUDED.height_min,
  height_max = EXCLUDED.height_max,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  education = EXCLUDED.education,
  occupation = EXCLUDED.occupation,
  food_habit = EXCLUDED.food_habit;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, height_min, height_max, marital_status, religion, caste, education, occupation, food_habit)
VALUES ('00000000-0000-4000-a000-000000000049', 21, 44, 173, 188, ARRAY['never_married']::TEXT[], ARRAY['Hindu']::TEXT[], ARRAY['Agamudayar', 'Caste No Bar']::TEXT[], ARRAY['B.Sc', 'No Education Bar']::TEXT[], ARRAY['Dentist']::TEXT[], ARRAY['vegetarian','non_vegetarian']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  height_min = EXCLUDED.height_min,
  height_max = EXCLUDED.height_max,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  education = EXCLUDED.education,
  occupation = EXCLUDED.occupation,
  food_habit = EXCLUDED.food_habit;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, height_min, height_max, marital_status, religion, caste, education, occupation, food_habit)
VALUES ('00000000-0000-4000-a000-00000000004a', 28, 44, 146, 161, ARRAY['never_married']::TEXT[], ARRAY['Hindu']::TEXT[], ARRAY['Arunthathiyar', 'Caste No Bar']::TEXT[], ARRAY['M.B.B.S', 'No Education Bar']::TEXT[], ARRAY['Police Officer']::TEXT[], ARRAY['vegetarian','non_vegetarian']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  height_min = EXCLUDED.height_min,
  height_max = EXCLUDED.height_max,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  education = EXCLUDED.education,
  occupation = EXCLUDED.occupation,
  food_habit = EXCLUDED.food_habit;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, height_min, height_max, marital_status, religion, caste, education, occupation, food_habit)
VALUES ('00000000-0000-4000-a000-00000000004b', 26, 45, 155, 170, ARRAY['never_married']::TEXT[], ARRAY['Hindu']::TEXT[], ARRAY['Naicker', 'Caste No Bar']::TEXT[], ARRAY['M.C.A', 'No Education Bar']::TEXT[], ARRAY['Police Officer']::TEXT[], ARRAY['vegetarian','non_vegetarian']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  height_min = EXCLUDED.height_min,
  height_max = EXCLUDED.height_max,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  education = EXCLUDED.education,
  occupation = EXCLUDED.occupation,
  food_habit = EXCLUDED.food_habit;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, height_min, height_max, marital_status, religion, caste, education, occupation, food_habit)
VALUES ('00000000-0000-4000-a000-00000000004c', 21, 39, 160, 175, ARRAY['never_married']::TEXT[], ARRAY['Hindu']::TEXT[], ARRAY['Pillai', 'Caste No Bar']::TEXT[], ARRAY['M.B.B.S', 'No Education Bar']::TEXT[], ARRAY['Business Owner']::TEXT[], ARRAY['vegetarian','non_vegetarian']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  height_min = EXCLUDED.height_min,
  height_max = EXCLUDED.height_max,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  education = EXCLUDED.education,
  occupation = EXCLUDED.occupation,
  food_habit = EXCLUDED.food_habit;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, height_min, height_max, marital_status, religion, caste, education, occupation, food_habit)
VALUES ('00000000-0000-4000-a000-00000000004d', 26, 31, 160, 175, ARRAY['never_married']::TEXT[], ARRAY['Hindu']::TEXT[], ARRAY['Thevar', 'Caste No Bar']::TEXT[], ARRAY['M.Com', 'No Education Bar']::TEXT[], ARRAY['Government Officer']::TEXT[], ARRAY['vegetarian','non_vegetarian']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  height_min = EXCLUDED.height_min,
  height_max = EXCLUDED.height_max,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  education = EXCLUDED.education,
  occupation = EXCLUDED.occupation,
  food_habit = EXCLUDED.food_habit;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, height_min, height_max, marital_status, religion, caste, education, occupation, food_habit)
VALUES ('00000000-0000-4000-a000-00000000004e', 28, 40, 139, 154, ARRAY['never_married']::TEXT[], ARRAY['Muslim']::TEXT[], ARRAY['Marakayar', 'Caste No Bar']::TEXT[], ARRAY['M.B.A', 'No Education Bar']::TEXT[], ARRAY['Pharmacist']::TEXT[], ARRAY['vegetarian','non_vegetarian']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  height_min = EXCLUDED.height_min,
  height_max = EXCLUDED.height_max,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  education = EXCLUDED.education,
  occupation = EXCLUDED.occupation,
  food_habit = EXCLUDED.food_habit;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, height_min, height_max, marital_status, religion, caste, education, occupation, food_habit)
VALUES ('00000000-0000-4000-a000-00000000004f', 22, 38, 173, 188, ARRAY['never_married']::TEXT[], ARRAY['Hindu']::TEXT[], ARRAY['Brahmin - Iyengar', 'Caste No Bar']::TEXT[], ARRAY['B.Ed', 'No Education Bar']::TEXT[], ARRAY['Pharmacist']::TEXT[], ARRAY['vegetarian','non_vegetarian']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  height_min = EXCLUDED.height_min,
  height_max = EXCLUDED.height_max,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  education = EXCLUDED.education,
  occupation = EXCLUDED.occupation,
  food_habit = EXCLUDED.food_habit;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, height_min, height_max, marital_status, religion, caste, education, occupation, food_habit)
VALUES ('00000000-0000-4000-a000-000000000050', 22, 38, 137, 152, ARRAY['never_married']::TEXT[], ARRAY['Muslim']::TEXT[], ARRAY['Marakayar', 'Caste No Bar']::TEXT[], ARRAY['M.Sc', 'No Education Bar']::TEXT[], ARRAY['School Teacher']::TEXT[], ARRAY['vegetarian','non_vegetarian']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  height_min = EXCLUDED.height_min,
  height_max = EXCLUDED.height_max,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  education = EXCLUDED.education,
  occupation = EXCLUDED.occupation,
  food_habit = EXCLUDED.food_habit;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, height_min, height_max, marital_status, religion, caste, education, occupation, food_habit)
VALUES ('00000000-0000-4000-a000-000000000051', 24, 37, 168, 183, ARRAY['never_married']::TEXT[], ARRAY['Hindu']::TEXT[], ARRAY['Chettiar', 'Caste No Bar']::TEXT[], ARRAY['Ph.D', 'No Education Bar']::TEXT[], ARRAY['School Teacher']::TEXT[], ARRAY['vegetarian','non_vegetarian']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  height_min = EXCLUDED.height_min,
  height_max = EXCLUDED.height_max,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  education = EXCLUDED.education,
  occupation = EXCLUDED.occupation,
  food_habit = EXCLUDED.food_habit;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, height_min, height_max, marital_status, religion, caste, education, occupation, food_habit)
VALUES ('00000000-0000-4000-a000-000000000052', 21, 44, 155, 170, ARRAY['never_married']::TEXT[], ARRAY['Hindu']::TEXT[], ARRAY['Mudaliar', 'Caste No Bar']::TEXT[], ARRAY['M.Com', 'No Education Bar']::TEXT[], ARRAY['Business Owner']::TEXT[], ARRAY['vegetarian','non_vegetarian']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  height_min = EXCLUDED.height_min,
  height_max = EXCLUDED.height_max,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  education = EXCLUDED.education,
  occupation = EXCLUDED.occupation,
  food_habit = EXCLUDED.food_habit;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, height_min, height_max, marital_status, religion, caste, education, occupation, food_habit)
VALUES ('00000000-0000-4000-a000-000000000053', 22, 30, 168, 183, ARRAY['never_married']::TEXT[], ARRAY['Hindu']::TEXT[], ARRAY['Naidu', 'Caste No Bar']::TEXT[], ARRAY['B.Sc', 'No Education Bar']::TEXT[], ARRAY['Architect']::TEXT[], ARRAY['vegetarian','non_vegetarian']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  height_min = EXCLUDED.height_min,
  height_max = EXCLUDED.height_max,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  education = EXCLUDED.education,
  occupation = EXCLUDED.occupation,
  food_habit = EXCLUDED.food_habit;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, height_min, height_max, marital_status, religion, caste, education, occupation, food_habit)
VALUES ('00000000-0000-4000-a000-000000000054', 25, 41, 159, 174, ARRAY['never_married']::TEXT[], ARRAY['Hindu']::TEXT[], ARRAY['Kallar', 'Caste No Bar']::TEXT[], ARRAY['B.Com', 'No Education Bar']::TEXT[], ARRAY['Auditor']::TEXT[], ARRAY['vegetarian','non_vegetarian']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  height_min = EXCLUDED.height_min,
  height_max = EXCLUDED.height_max,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  education = EXCLUDED.education,
  occupation = EXCLUDED.occupation,
  food_habit = EXCLUDED.food_habit;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, height_min, height_max, marital_status, religion, caste, education, occupation, food_habit)
VALUES ('00000000-0000-4000-a000-000000000055', 21, 36, 147, 162, ARRAY['never_married']::TEXT[], ARRAY['Hindu']::TEXT[], ARRAY['Adi Dravida', 'Caste No Bar']::TEXT[], ARRAY['M.C.A', 'No Education Bar']::TEXT[], ARRAY['School Teacher']::TEXT[], ARRAY['vegetarian','non_vegetarian']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  height_min = EXCLUDED.height_min,
  height_max = EXCLUDED.height_max,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  education = EXCLUDED.education,
  occupation = EXCLUDED.occupation,
  food_habit = EXCLUDED.food_habit;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, height_min, height_max, marital_status, religion, caste, education, occupation, food_habit)
VALUES ('00000000-0000-4000-a000-000000000056', 21, 34, 150, 165, ARRAY['never_married']::TEXT[], ARRAY['Hindu']::TEXT[], ARRAY['Arunthathiyar', 'Caste No Bar']::TEXT[], ARRAY['B.Sc', 'No Education Bar']::TEXT[], ARRAY['College Professor']::TEXT[], ARRAY['vegetarian','non_vegetarian']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  height_min = EXCLUDED.height_min,
  height_max = EXCLUDED.height_max,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  education = EXCLUDED.education,
  occupation = EXCLUDED.occupation,
  food_habit = EXCLUDED.food_habit;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, height_min, height_max, marital_status, religion, caste, education, occupation, food_habit)
VALUES ('00000000-0000-4000-a000-000000000057', 22, 44, 162, 177, ARRAY['never_married']::TEXT[], ARRAY['Christian']::TEXT[], ARRAY['RC Christian', 'Caste No Bar']::TEXT[], ARRAY['M.B.A', 'No Education Bar']::TEXT[], ARRAY['HR Specialist']::TEXT[], ARRAY['vegetarian','non_vegetarian']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  height_min = EXCLUDED.height_min,
  height_max = EXCLUDED.height_max,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  education = EXCLUDED.education,
  occupation = EXCLUDED.occupation,
  food_habit = EXCLUDED.food_habit;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, height_min, height_max, marital_status, religion, caste, education, occupation, food_habit)
VALUES ('00000000-0000-4000-a000-000000000058', 27, 36, 141, 156, ARRAY['never_married']::TEXT[], ARRAY['Hindu']::TEXT[], ARRAY['Vanniyar', 'Caste No Bar']::TEXT[], ARRAY['B.Com', 'No Education Bar']::TEXT[], ARRAY['Advocate']::TEXT[], ARRAY['vegetarian','non_vegetarian']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  height_min = EXCLUDED.height_min,
  height_max = EXCLUDED.height_max,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  education = EXCLUDED.education,
  occupation = EXCLUDED.occupation,
  food_habit = EXCLUDED.food_habit;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, height_min, height_max, marital_status, religion, caste, education, occupation, food_habit)
VALUES ('00000000-0000-4000-a000-000000000059', 24, 34, 162, 177, ARRAY['never_married']::TEXT[], ARRAY['Hindu']::TEXT[], ARRAY['Brahmin - Iyengar', 'Caste No Bar']::TEXT[], ARRAY['M.A', 'No Education Bar']::TEXT[], ARRAY['Software Engineer']::TEXT[], ARRAY['vegetarian','non_vegetarian']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  height_min = EXCLUDED.height_min,
  height_max = EXCLUDED.height_max,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  education = EXCLUDED.education,
  occupation = EXCLUDED.occupation,
  food_habit = EXCLUDED.food_habit;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, height_min, height_max, marital_status, religion, caste, education, occupation, food_habit)
VALUES ('00000000-0000-4000-a000-00000000005a', 23, 44, 159, 174, ARRAY['never_married']::TEXT[], ARRAY['Christian']::TEXT[], ARRAY['Protestant Christian', 'Caste No Bar']::TEXT[], ARRAY['B.E. / B.Tech', 'No Education Bar']::TEXT[], ARRAY['College Professor']::TEXT[], ARRAY['vegetarian','non_vegetarian']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  height_min = EXCLUDED.height_min,
  height_max = EXCLUDED.height_max,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  education = EXCLUDED.education,
  occupation = EXCLUDED.occupation,
  food_habit = EXCLUDED.food_habit;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, height_min, height_max, marital_status, religion, caste, education, occupation, food_habit)
VALUES ('00000000-0000-4000-a000-00000000005b', 22, 44, 148, 163, ARRAY['never_married']::TEXT[], ARRAY['Hindu']::TEXT[], ARRAY['Pillai', 'Caste No Bar']::TEXT[], ARRAY['B.E. / B.Tech', 'No Education Bar']::TEXT[], ARRAY['Architect']::TEXT[], ARRAY['vegetarian','non_vegetarian']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  height_min = EXCLUDED.height_min,
  height_max = EXCLUDED.height_max,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  education = EXCLUDED.education,
  occupation = EXCLUDED.occupation,
  food_habit = EXCLUDED.food_habit;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, height_min, height_max, marital_status, religion, caste, education, occupation, food_habit)
VALUES ('00000000-0000-4000-a000-00000000005c', 23, 44, 138, 153, ARRAY['never_married']::TEXT[], ARRAY['Christian']::TEXT[], ARRAY['Vellalar Christian', 'Caste No Bar']::TEXT[], ARRAY['M.Com', 'No Education Bar']::TEXT[], ARRAY['Bank Manager']::TEXT[], ARRAY['vegetarian','non_vegetarian']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  height_min = EXCLUDED.height_min,
  height_max = EXCLUDED.height_max,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  education = EXCLUDED.education,
  occupation = EXCLUDED.occupation,
  food_habit = EXCLUDED.food_habit;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, height_min, height_max, marital_status, religion, caste, education, occupation, food_habit)
VALUES ('00000000-0000-4000-a000-00000000005d', 22, 38, 164, 179, ARRAY['never_married']::TEXT[], ARRAY['Hindu']::TEXT[], ARRAY['Pillai', 'Caste No Bar']::TEXT[], ARRAY['B.E. / B.Tech', 'No Education Bar']::TEXT[], ARRAY['Dentist']::TEXT[], ARRAY['vegetarian','non_vegetarian']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  height_min = EXCLUDED.height_min,
  height_max = EXCLUDED.height_max,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  education = EXCLUDED.education,
  occupation = EXCLUDED.occupation,
  food_habit = EXCLUDED.food_habit;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, height_min, height_max, marital_status, religion, caste, education, occupation, food_habit)
VALUES ('00000000-0000-4000-a000-00000000005e', 24, 42, 156, 171, ARRAY['never_married']::TEXT[], ARRAY['Muslim']::TEXT[], ARRAY['Shia Muslim', 'Caste No Bar']::TEXT[], ARRAY['B.E. / B.Tech', 'No Education Bar']::TEXT[], ARRAY['HR Specialist']::TEXT[], ARRAY['vegetarian','non_vegetarian']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  height_min = EXCLUDED.height_min,
  height_max = EXCLUDED.height_max,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  education = EXCLUDED.education,
  occupation = EXCLUDED.occupation,
  food_habit = EXCLUDED.food_habit;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, height_min, height_max, marital_status, religion, caste, education, occupation, food_habit)
VALUES ('00000000-0000-4000-a000-00000000005f', 21, 34, 162, 177, ARRAY['never_married']::TEXT[], ARRAY['Muslim']::TEXT[], ARRAY['Rawther', 'Caste No Bar']::TEXT[], ARRAY['M.Com', 'No Education Bar']::TEXT[], ARRAY['Dentist']::TEXT[], ARRAY['vegetarian','non_vegetarian']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  height_min = EXCLUDED.height_min,
  height_max = EXCLUDED.height_max,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  education = EXCLUDED.education,
  occupation = EXCLUDED.occupation,
  food_habit = EXCLUDED.food_habit;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, height_min, height_max, marital_status, religion, caste, education, occupation, food_habit)
VALUES ('00000000-0000-4000-a000-000000000060', 22, 36, 152, 167, ARRAY['never_married']::TEXT[], ARRAY['Hindu']::TEXT[], ARRAY['Sengunthar', 'Caste No Bar']::TEXT[], ARRAY['M.A', 'No Education Bar']::TEXT[], ARRAY['Police Officer']::TEXT[], ARRAY['vegetarian','non_vegetarian']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  height_min = EXCLUDED.height_min,
  height_max = EXCLUDED.height_max,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  education = EXCLUDED.education,
  occupation = EXCLUDED.occupation,
  food_habit = EXCLUDED.food_habit;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, height_min, height_max, marital_status, religion, caste, education, occupation, food_habit)
VALUES ('00000000-0000-4000-a000-000000000061', 28, 37, 147, 162, ARRAY['never_married']::TEXT[], ARRAY['Muslim']::TEXT[], ARRAY['Shia Muslim', 'Caste No Bar']::TEXT[], ARRAY['B.Ed', 'No Education Bar']::TEXT[], ARRAY['School Teacher']::TEXT[], ARRAY['vegetarian','non_vegetarian']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  height_min = EXCLUDED.height_min,
  height_max = EXCLUDED.height_max,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  education = EXCLUDED.education,
  occupation = EXCLUDED.occupation,
  food_habit = EXCLUDED.food_habit;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, height_min, height_max, marital_status, religion, caste, education, occupation, food_habit)
VALUES ('00000000-0000-4000-a000-000000000062', 26, 30, 154, 169, ARRAY['never_married']::TEXT[], ARRAY['Hindu']::TEXT[], ARRAY['Mudaliar', 'Caste No Bar']::TEXT[], ARRAY['B.A', 'No Education Bar']::TEXT[], ARRAY['Mechanical Engineer']::TEXT[], ARRAY['vegetarian','non_vegetarian']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  height_min = EXCLUDED.height_min,
  height_max = EXCLUDED.height_max,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  education = EXCLUDED.education,
  occupation = EXCLUDED.occupation,
  food_habit = EXCLUDED.food_habit;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, height_min, height_max, marital_status, religion, caste, education, occupation, food_habit)
VALUES ('00000000-0000-4000-a000-000000000063', 22, 33, 159, 174, ARRAY['never_married']::TEXT[], ARRAY['Christian']::TEXT[], ARRAY['RC Christian', 'Caste No Bar']::TEXT[], ARRAY['M.A', 'No Education Bar']::TEXT[], ARRAY['Architect']::TEXT[], ARRAY['vegetarian','non_vegetarian']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  height_min = EXCLUDED.height_min,
  height_max = EXCLUDED.height_max,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  education = EXCLUDED.education,
  occupation = EXCLUDED.occupation,
  food_habit = EXCLUDED.food_habit;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, height_min, height_max, marital_status, religion, caste, education, occupation, food_habit)
VALUES ('00000000-0000-4000-a000-000000000064', 24, 33, 145, 160, ARRAY['never_married']::TEXT[], ARRAY['Hindu']::TEXT[], ARRAY['Arunthathiyar', 'Caste No Bar']::TEXT[], ARRAY['B.Ed', 'No Education Bar']::TEXT[], ARRAY['Advocate']::TEXT[], ARRAY['vegetarian','non_vegetarian']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  height_min = EXCLUDED.height_min,
  height_max = EXCLUDED.height_max,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  education = EXCLUDED.education,
  occupation = EXCLUDED.occupation,
  food_habit = EXCLUDED.food_habit;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, height_min, height_max, marital_status, religion, caste, education, occupation, food_habit)
VALUES ('00000000-0000-4000-a000-000000000065', 24, 33, 164, 179, ARRAY['never_married']::TEXT[], ARRAY['Hindu']::TEXT[], ARRAY['Chettiar', 'Caste No Bar']::TEXT[], ARRAY['M.B.B.S', 'No Education Bar']::TEXT[], ARRAY['Architect']::TEXT[], ARRAY['vegetarian','non_vegetarian']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  height_min = EXCLUDED.height_min,
  height_max = EXCLUDED.height_max,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  education = EXCLUDED.education,
  occupation = EXCLUDED.occupation,
  food_habit = EXCLUDED.food_habit;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, height_min, height_max, marital_status, religion, caste, education, occupation, food_habit)
VALUES ('00000000-0000-4000-a000-000000000066', 26, 31, 143, 158, ARRAY['never_married']::TEXT[], ARRAY['Christian']::TEXT[], ARRAY['CSI Christian', 'Caste No Bar']::TEXT[], ARRAY['B.Com', 'No Education Bar']::TEXT[], ARRAY['School Teacher']::TEXT[], ARRAY['vegetarian','non_vegetarian']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  height_min = EXCLUDED.height_min,
  height_max = EXCLUDED.height_max,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  education = EXCLUDED.education,
  occupation = EXCLUDED.occupation,
  food_habit = EXCLUDED.food_habit;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, height_min, height_max, marital_status, religion, caste, education, occupation, food_habit)
VALUES ('00000000-0000-4000-a000-000000000067', 24, 41, 155, 170, ARRAY['never_married']::TEXT[], ARRAY['Hindu']::TEXT[], ARRAY['Pillai', 'Caste No Bar']::TEXT[], ARRAY['B.Com', 'No Education Bar']::TEXT[], ARRAY['Dentist']::TEXT[], ARRAY['vegetarian','non_vegetarian']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  height_min = EXCLUDED.height_min,
  height_max = EXCLUDED.height_max,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  education = EXCLUDED.education,
  occupation = EXCLUDED.occupation,
  food_habit = EXCLUDED.food_habit;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, height_min, height_max, marital_status, religion, caste, education, occupation, food_habit)
VALUES ('00000000-0000-4000-a000-000000000068', 26, 37, 146, 161, ARRAY['never_married']::TEXT[], ARRAY['Hindu']::TEXT[], ARRAY['Mudaliar', 'Caste No Bar']::TEXT[], ARRAY['B.Com', 'No Education Bar']::TEXT[], ARRAY['Auditor']::TEXT[], ARRAY['vegetarian','non_vegetarian']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  height_min = EXCLUDED.height_min,
  height_max = EXCLUDED.height_max,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  education = EXCLUDED.education,
  occupation = EXCLUDED.occupation,
  food_habit = EXCLUDED.food_habit;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, height_min, height_max, marital_status, religion, caste, education, occupation, food_habit)
VALUES ('00000000-0000-4000-a000-000000000069', 22, 31, 163, 178, ARRAY['never_married']::TEXT[], ARRAY['Hindu']::TEXT[], ARRAY['Devendra Kula Vellalar', 'Caste No Bar']::TEXT[], ARRAY['M.Com', 'No Education Bar']::TEXT[], ARRAY['Police Officer']::TEXT[], ARRAY['vegetarian','non_vegetarian']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  height_min = EXCLUDED.height_min,
  height_max = EXCLUDED.height_max,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  education = EXCLUDED.education,
  occupation = EXCLUDED.occupation,
  food_habit = EXCLUDED.food_habit;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, height_min, height_max, marital_status, religion, caste, education, occupation, food_habit)
VALUES ('00000000-0000-4000-a000-00000000006a', 26, 43, 147, 162, ARRAY['never_married']::TEXT[], ARRAY['Hindu']::TEXT[], ARRAY['Pillai', 'Caste No Bar']::TEXT[], ARRAY['M.C.A', 'No Education Bar']::TEXT[], ARRAY['Pharmacist']::TEXT[], ARRAY['vegetarian','non_vegetarian']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  height_min = EXCLUDED.height_min,
  height_max = EXCLUDED.height_max,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  education = EXCLUDED.education,
  occupation = EXCLUDED.occupation,
  food_habit = EXCLUDED.food_habit;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, height_min, height_max, marital_status, religion, caste, education, occupation, food_habit)
VALUES ('00000000-0000-4000-a000-00000000006b', 28, 35, 173, 188, ARRAY['never_married']::TEXT[], ARRAY['Hindu']::TEXT[], ARRAY['Nadar', 'Caste No Bar']::TEXT[], ARRAY['M.A', 'No Education Bar']::TEXT[], ARRAY['Mechanical Engineer']::TEXT[], ARRAY['vegetarian','non_vegetarian']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  height_min = EXCLUDED.height_min,
  height_max = EXCLUDED.height_max,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  education = EXCLUDED.education,
  occupation = EXCLUDED.occupation,
  food_habit = EXCLUDED.food_habit;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, height_min, height_max, marital_status, religion, caste, education, occupation, food_habit)
VALUES ('00000000-0000-4000-a000-00000000006c', 25, 39, 146, 161, ARRAY['never_married']::TEXT[], ARRAY['Hindu']::TEXT[], ARRAY['Vishwakarma', 'Caste No Bar']::TEXT[], ARRAY['M.Sc', 'No Education Bar']::TEXT[], ARRAY['Advocate']::TEXT[], ARRAY['vegetarian','non_vegetarian']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  height_min = EXCLUDED.height_min,
  height_max = EXCLUDED.height_max,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  education = EXCLUDED.education,
  occupation = EXCLUDED.occupation,
  food_habit = EXCLUDED.food_habit;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, height_min, height_max, marital_status, religion, caste, education, occupation, food_habit)
VALUES ('00000000-0000-4000-a000-00000000006d', 27, 32, 161, 176, ARRAY['never_married']::TEXT[], ARRAY['Hindu']::TEXT[], ARRAY['Arunthathiyar', 'Caste No Bar']::TEXT[], ARRAY['B.Sc', 'No Education Bar']::TEXT[], ARRAY['Dentist']::TEXT[], ARRAY['vegetarian','non_vegetarian']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  height_min = EXCLUDED.height_min,
  height_max = EXCLUDED.height_max,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  education = EXCLUDED.education,
  occupation = EXCLUDED.occupation,
  food_habit = EXCLUDED.food_habit;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, height_min, height_max, marital_status, religion, caste, education, occupation, food_habit)
VALUES ('00000000-0000-4000-a000-00000000006e', 27, 33, 138, 153, ARRAY['never_married']::TEXT[], ARRAY['Hindu']::TEXT[], ARRAY['Vellalar', 'Caste No Bar']::TEXT[], ARRAY['M.Com', 'No Education Bar']::TEXT[], ARRAY['Government Officer']::TEXT[], ARRAY['vegetarian','non_vegetarian']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  height_min = EXCLUDED.height_min,
  height_max = EXCLUDED.height_max,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  education = EXCLUDED.education,
  occupation = EXCLUDED.occupation,
  food_habit = EXCLUDED.food_habit;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, height_min, height_max, marital_status, religion, caste, education, occupation, food_habit)
VALUES ('00000000-0000-4000-a000-00000000006f', 26, 31, 162, 177, ARRAY['never_married']::TEXT[], ARRAY['Hindu']::TEXT[], ARRAY['Vellalar', 'Caste No Bar']::TEXT[], ARRAY['Ph.D', 'No Education Bar']::TEXT[], ARRAY['Bank Manager']::TEXT[], ARRAY['vegetarian','non_vegetarian']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  height_min = EXCLUDED.height_min,
  height_max = EXCLUDED.height_max,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  education = EXCLUDED.education,
  occupation = EXCLUDED.occupation,
  food_habit = EXCLUDED.food_habit;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, height_min, height_max, marital_status, religion, caste, education, occupation, food_habit)
VALUES ('00000000-0000-4000-a000-000000000070', 27, 44, 145, 160, ARRAY['never_married']::TEXT[], ARRAY['Hindu']::TEXT[], ARRAY['Naidu', 'Caste No Bar']::TEXT[], ARRAY['M.B.B.S', 'No Education Bar']::TEXT[], ARRAY['Doctor']::TEXT[], ARRAY['vegetarian','non_vegetarian']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  height_min = EXCLUDED.height_min,
  height_max = EXCLUDED.height_max,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  education = EXCLUDED.education,
  occupation = EXCLUDED.occupation,
  food_habit = EXCLUDED.food_habit;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, height_min, height_max, marital_status, religion, caste, education, occupation, food_habit)
VALUES ('00000000-0000-4000-a000-000000000071', 28, 40, 167, 182, ARRAY['never_married']::TEXT[], ARRAY['Hindu']::TEXT[], ARRAY['Maravar', 'Caste No Bar']::TEXT[], ARRAY['B.Com', 'No Education Bar']::TEXT[], ARRAY['Auditor']::TEXT[], ARRAY['vegetarian','non_vegetarian']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  height_min = EXCLUDED.height_min,
  height_max = EXCLUDED.height_max,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  education = EXCLUDED.education,
  occupation = EXCLUDED.occupation,
  food_habit = EXCLUDED.food_habit;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, height_min, height_max, marital_status, religion, caste, education, occupation, food_habit)
VALUES ('00000000-0000-4000-a000-000000000072', 26, 36, 137, 152, ARRAY['never_married']::TEXT[], ARRAY['Hindu']::TEXT[], ARRAY['Agamudayar', 'Caste No Bar']::TEXT[], ARRAY['B.A', 'No Education Bar']::TEXT[], ARRAY['HR Specialist']::TEXT[], ARRAY['vegetarian','non_vegetarian']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  height_min = EXCLUDED.height_min,
  height_max = EXCLUDED.height_max,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  education = EXCLUDED.education,
  occupation = EXCLUDED.occupation,
  food_habit = EXCLUDED.food_habit;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, height_min, height_max, marital_status, religion, caste, education, occupation, food_habit)
VALUES ('00000000-0000-4000-a000-000000000073', 23, 44, 157, 172, ARRAY['never_married']::TEXT[], ARRAY['Hindu']::TEXT[], ARRAY['Arunthathiyar', 'Caste No Bar']::TEXT[], ARRAY['B.Sc', 'No Education Bar']::TEXT[], ARRAY['Pharmacist']::TEXT[], ARRAY['vegetarian','non_vegetarian']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  height_min = EXCLUDED.height_min,
  height_max = EXCLUDED.height_max,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  education = EXCLUDED.education,
  occupation = EXCLUDED.occupation,
  food_habit = EXCLUDED.food_habit;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, height_min, height_max, marital_status, religion, caste, education, occupation, food_habit)
VALUES ('00000000-0000-4000-a000-000000000074', 21, 41, 147, 162, ARRAY['never_married']::TEXT[], ARRAY['Hindu']::TEXT[], ARRAY['Mudaliar', 'Caste No Bar']::TEXT[], ARRAY['M.Sc', 'No Education Bar']::TEXT[], ARRAY['Architect']::TEXT[], ARRAY['vegetarian','non_vegetarian']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  height_min = EXCLUDED.height_min,
  height_max = EXCLUDED.height_max,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  education = EXCLUDED.education,
  occupation = EXCLUDED.occupation,
  food_habit = EXCLUDED.food_habit;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, height_min, height_max, marital_status, religion, caste, education, occupation, food_habit)
VALUES ('00000000-0000-4000-a000-000000000075', 24, 36, 149, 164, ARRAY['never_married']::TEXT[], ARRAY['Hindu']::TEXT[], ARRAY['Arunthathiyar', 'Caste No Bar']::TEXT[], ARRAY['B.Sc', 'No Education Bar']::TEXT[], ARRAY['Auditor']::TEXT[], ARRAY['vegetarian','non_vegetarian']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  height_min = EXCLUDED.height_min,
  height_max = EXCLUDED.height_max,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  education = EXCLUDED.education,
  occupation = EXCLUDED.occupation,
  food_habit = EXCLUDED.food_habit;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, height_min, height_max, marital_status, religion, caste, education, occupation, food_habit)
VALUES ('00000000-0000-4000-a000-000000000076', 28, 34, 158, 173, ARRAY['never_married']::TEXT[], ARRAY['Hindu']::TEXT[], ARRAY['Nadar', 'Caste No Bar']::TEXT[], ARRAY['M.B.A', 'No Education Bar']::TEXT[], ARRAY['Mechanical Engineer']::TEXT[], ARRAY['vegetarian','non_vegetarian']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  height_min = EXCLUDED.height_min,
  height_max = EXCLUDED.height_max,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  education = EXCLUDED.education,
  occupation = EXCLUDED.occupation,
  food_habit = EXCLUDED.food_habit;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, height_min, height_max, marital_status, religion, caste, education, occupation, food_habit)
VALUES ('00000000-0000-4000-a000-000000000077', 28, 44, 162, 177, ARRAY['never_married']::TEXT[], ARRAY['Hindu']::TEXT[], ARRAY['Maravar', 'Caste No Bar']::TEXT[], ARRAY['M.B.A', 'No Education Bar']::TEXT[], ARRAY['Auditor']::TEXT[], ARRAY['vegetarian','non_vegetarian']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  height_min = EXCLUDED.height_min,
  height_max = EXCLUDED.height_max,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  education = EXCLUDED.education,
  occupation = EXCLUDED.occupation,
  food_habit = EXCLUDED.food_habit;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, height_min, height_max, marital_status, religion, caste, education, occupation, food_habit)
VALUES ('00000000-0000-4000-a000-000000000078', 23, 37, 157, 172, ARRAY['never_married']::TEXT[], ARRAY['Hindu']::TEXT[], ARRAY['Vellalar', 'Caste No Bar']::TEXT[], ARRAY['B.Ed', 'No Education Bar']::TEXT[], ARRAY['Pharmacist']::TEXT[], ARRAY['vegetarian','non_vegetarian']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  height_min = EXCLUDED.height_min,
  height_max = EXCLUDED.height_max,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  education = EXCLUDED.education,
  occupation = EXCLUDED.occupation,
  food_habit = EXCLUDED.food_habit;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, height_min, height_max, marital_status, religion, caste, education, occupation, food_habit)
VALUES ('00000000-0000-4000-a000-000000000079', 27, 35, 148, 163, ARRAY['never_married']::TEXT[], ARRAY['Hindu']::TEXT[], ARRAY['Chettiar', 'Caste No Bar']::TEXT[], ARRAY['M.A', 'No Education Bar']::TEXT[], ARRAY['Civil Engineer']::TEXT[], ARRAY['vegetarian','non_vegetarian']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  height_min = EXCLUDED.height_min,
  height_max = EXCLUDED.height_max,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  education = EXCLUDED.education,
  occupation = EXCLUDED.occupation,
  food_habit = EXCLUDED.food_habit;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, height_min, height_max, marital_status, religion, caste, education, occupation, food_habit)
VALUES ('00000000-0000-4000-a000-00000000007a', 24, 31, 154, 169, ARRAY['never_married']::TEXT[], ARRAY['Muslim']::TEXT[], ARRAY['Rawther', 'Caste No Bar']::TEXT[], ARRAY['M.Sc', 'No Education Bar']::TEXT[], ARRAY['School Teacher']::TEXT[], ARRAY['vegetarian','non_vegetarian']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  height_min = EXCLUDED.height_min,
  height_max = EXCLUDED.height_max,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  education = EXCLUDED.education,
  occupation = EXCLUDED.occupation,
  food_habit = EXCLUDED.food_habit;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, height_min, height_max, marital_status, religion, caste, education, occupation, food_habit)
VALUES ('00000000-0000-4000-a000-00000000007b', 28, 35, 153, 168, ARRAY['never_married']::TEXT[], ARRAY['Hindu']::TEXT[], ARRAY['Vellalar', 'Caste No Bar']::TEXT[], ARRAY['M.Com', 'No Education Bar']::TEXT[], ARRAY['Advocate']::TEXT[], ARRAY['vegetarian','non_vegetarian']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  height_min = EXCLUDED.height_min,
  height_max = EXCLUDED.height_max,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  education = EXCLUDED.education,
  occupation = EXCLUDED.occupation,
  food_habit = EXCLUDED.food_habit;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, height_min, height_max, marital_status, religion, caste, education, occupation, food_habit)
VALUES ('00000000-0000-4000-a000-00000000007c', 21, 37, 148, 163, ARRAY['never_married']::TEXT[], ARRAY['Hindu']::TEXT[], ARRAY['Naicker', 'Caste No Bar']::TEXT[], ARRAY['M.Sc', 'No Education Bar']::TEXT[], ARRAY['Advocate']::TEXT[], ARRAY['vegetarian','non_vegetarian']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  height_min = EXCLUDED.height_min,
  height_max = EXCLUDED.height_max,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  education = EXCLUDED.education,
  occupation = EXCLUDED.occupation,
  food_habit = EXCLUDED.food_habit;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, height_min, height_max, marital_status, religion, caste, education, occupation, food_habit)
VALUES ('00000000-0000-4000-a000-00000000007d', 27, 39, 165, 180, ARRAY['never_married']::TEXT[], ARRAY['Hindu']::TEXT[], ARRAY['Thevar', 'Caste No Bar']::TEXT[], ARRAY['Ph.D', 'No Education Bar']::TEXT[], ARRAY['HR Specialist']::TEXT[], ARRAY['vegetarian','non_vegetarian']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  height_min = EXCLUDED.height_min,
  height_max = EXCLUDED.height_max,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  education = EXCLUDED.education,
  occupation = EXCLUDED.occupation,
  food_habit = EXCLUDED.food_habit;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, height_min, height_max, marital_status, religion, caste, education, occupation, food_habit)
VALUES ('00000000-0000-4000-a000-00000000007e', 22, 32, 149, 164, ARRAY['never_married']::TEXT[], ARRAY['Hindu']::TEXT[], ARRAY['Vellalar', 'Caste No Bar']::TEXT[], ARRAY['B.Ed', 'No Education Bar']::TEXT[], ARRAY['School Teacher']::TEXT[], ARRAY['vegetarian','non_vegetarian']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  height_min = EXCLUDED.height_min,
  height_max = EXCLUDED.height_max,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  education = EXCLUDED.education,
  occupation = EXCLUDED.occupation,
  food_habit = EXCLUDED.food_habit;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, height_min, height_max, marital_status, religion, caste, education, occupation, food_habit)
VALUES ('00000000-0000-4000-a000-00000000007f', 26, 40, 170, 185, ARRAY['never_married']::TEXT[], ARRAY['Hindu']::TEXT[], ARRAY['Arunthathiyar', 'Caste No Bar']::TEXT[], ARRAY['B.Com', 'No Education Bar']::TEXT[], ARRAY['Police Officer']::TEXT[], ARRAY['vegetarian','non_vegetarian']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  height_min = EXCLUDED.height_min,
  height_max = EXCLUDED.height_max,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  education = EXCLUDED.education,
  occupation = EXCLUDED.occupation,
  food_habit = EXCLUDED.food_habit;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, height_min, height_max, marital_status, religion, caste, education, occupation, food_habit)
VALUES ('00000000-0000-4000-a000-000000000080', 26, 34, 151, 166, ARRAY['never_married']::TEXT[], ARRAY['Hindu']::TEXT[], ARRAY['Arunthathiyar', 'Caste No Bar']::TEXT[], ARRAY['B.Sc', 'No Education Bar']::TEXT[], ARRAY['Business Owner']::TEXT[], ARRAY['vegetarian','non_vegetarian']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  height_min = EXCLUDED.height_min,
  height_max = EXCLUDED.height_max,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  education = EXCLUDED.education,
  occupation = EXCLUDED.occupation,
  food_habit = EXCLUDED.food_habit;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, height_min, height_max, marital_status, religion, caste, education, occupation, food_habit)
VALUES ('00000000-0000-4000-a000-000000000081', 24, 36, 154, 169, ARRAY['never_married']::TEXT[], ARRAY['Hindu']::TEXT[], ARRAY['Vishwakarma', 'Caste No Bar']::TEXT[], ARRAY['B.Ed', 'No Education Bar']::TEXT[], ARRAY['School Teacher']::TEXT[], ARRAY['vegetarian','non_vegetarian']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  height_min = EXCLUDED.height_min,
  height_max = EXCLUDED.height_max,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  education = EXCLUDED.education,
  occupation = EXCLUDED.occupation,
  food_habit = EXCLUDED.food_habit;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, height_min, height_max, marital_status, religion, caste, education, occupation, food_habit)
VALUES ('00000000-0000-4000-a000-000000000082', 24, 43, 137, 152, ARRAY['never_married']::TEXT[], ARRAY['Hindu']::TEXT[], ARRAY['Mudaliar', 'Caste No Bar']::TEXT[], ARRAY['M.A', 'No Education Bar']::TEXT[], ARRAY['Police Officer']::TEXT[], ARRAY['vegetarian','non_vegetarian']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  height_min = EXCLUDED.height_min,
  height_max = EXCLUDED.height_max,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  education = EXCLUDED.education,
  occupation = EXCLUDED.occupation,
  food_habit = EXCLUDED.food_habit;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, height_min, height_max, marital_status, religion, caste, education, occupation, food_habit)
VALUES ('00000000-0000-4000-a000-000000000083', 27, 37, 165, 180, ARRAY['never_married']::TEXT[], ARRAY['Christian']::TEXT[], ARRAY['Vellalar Christian', 'Caste No Bar']::TEXT[], ARRAY['B.Com', 'No Education Bar']::TEXT[], ARRAY['Software Engineer']::TEXT[], ARRAY['vegetarian','non_vegetarian']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  height_min = EXCLUDED.height_min,
  height_max = EXCLUDED.height_max,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  education = EXCLUDED.education,
  occupation = EXCLUDED.occupation,
  food_habit = EXCLUDED.food_habit;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, height_min, height_max, marital_status, religion, caste, education, occupation, food_habit)
VALUES ('00000000-0000-4000-a000-000000000084', 21, 30, 148, 163, ARRAY['never_married']::TEXT[], ARRAY['Hindu']::TEXT[], ARRAY['Vellalar', 'Caste No Bar']::TEXT[], ARRAY['B.Ed', 'No Education Bar']::TEXT[], ARRAY['Mechanical Engineer']::TEXT[], ARRAY['vegetarian','non_vegetarian']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  height_min = EXCLUDED.height_min,
  height_max = EXCLUDED.height_max,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  education = EXCLUDED.education,
  occupation = EXCLUDED.occupation,
  food_habit = EXCLUDED.food_habit;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, height_min, height_max, marital_status, religion, caste, education, occupation, food_habit)
VALUES ('00000000-0000-4000-a000-000000000085', 28, 44, 159, 174, ARRAY['never_married']::TEXT[], ARRAY['Hindu']::TEXT[], ARRAY['Brahmin - Iyer', 'Caste No Bar']::TEXT[], ARRAY['M.B.A', 'No Education Bar']::TEXT[], ARRAY['Police Officer']::TEXT[], ARRAY['vegetarian','non_vegetarian']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  height_min = EXCLUDED.height_min,
  height_max = EXCLUDED.height_max,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  education = EXCLUDED.education,
  occupation = EXCLUDED.occupation,
  food_habit = EXCLUDED.food_habit;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, height_min, height_max, marital_status, religion, caste, education, occupation, food_habit)
VALUES ('00000000-0000-4000-a000-000000000086', 22, 30, 143, 158, ARRAY['never_married']::TEXT[], ARRAY['Hindu']::TEXT[], ARRAY['Kallar', 'Caste No Bar']::TEXT[], ARRAY['Ph.D', 'No Education Bar']::TEXT[], ARRAY['Doctor']::TEXT[], ARRAY['vegetarian','non_vegetarian']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  height_min = EXCLUDED.height_min,
  height_max = EXCLUDED.height_max,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  education = EXCLUDED.education,
  occupation = EXCLUDED.occupation,
  food_habit = EXCLUDED.food_habit;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, height_min, height_max, marital_status, religion, caste, education, occupation, food_habit)
VALUES ('00000000-0000-4000-a000-000000000087', 26, 33, 168, 183, ARRAY['never_married']::TEXT[], ARRAY['Hindu']::TEXT[], ARRAY['Vishwakarma', 'Caste No Bar']::TEXT[], ARRAY['B.Com', 'No Education Bar']::TEXT[], ARRAY['Business Owner']::TEXT[], ARRAY['vegetarian','non_vegetarian']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  height_min = EXCLUDED.height_min,
  height_max = EXCLUDED.height_max,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  education = EXCLUDED.education,
  occupation = EXCLUDED.occupation,
  food_habit = EXCLUDED.food_habit;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, height_min, height_max, marital_status, religion, caste, education, occupation, food_habit)
VALUES ('00000000-0000-4000-a000-000000000088', 28, 30, 152, 167, ARRAY['never_married']::TEXT[], ARRAY['Hindu']::TEXT[], ARRAY['Vellalar', 'Caste No Bar']::TEXT[], ARRAY['M.Sc', 'No Education Bar']::TEXT[], ARRAY['Mechanical Engineer']::TEXT[], ARRAY['vegetarian','non_vegetarian']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  height_min = EXCLUDED.height_min,
  height_max = EXCLUDED.height_max,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  education = EXCLUDED.education,
  occupation = EXCLUDED.occupation,
  food_habit = EXCLUDED.food_habit;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, height_min, height_max, marital_status, religion, caste, education, occupation, food_habit)
VALUES ('00000000-0000-4000-a000-000000000089', 24, 33, 158, 173, ARRAY['never_married']::TEXT[], ARRAY['Hindu']::TEXT[], ARRAY['Agamudayar', 'Caste No Bar']::TEXT[], ARRAY['M.Com', 'No Education Bar']::TEXT[], ARRAY['Mechanical Engineer']::TEXT[], ARRAY['vegetarian','non_vegetarian']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  height_min = EXCLUDED.height_min,
  height_max = EXCLUDED.height_max,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  education = EXCLUDED.education,
  occupation = EXCLUDED.occupation,
  food_habit = EXCLUDED.food_habit;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, height_min, height_max, marital_status, religion, caste, education, occupation, food_habit)
VALUES ('00000000-0000-4000-a000-00000000008a', 28, 39, 147, 162, ARRAY['never_married']::TEXT[], ARRAY['Hindu']::TEXT[], ARRAY['Pillai', 'Caste No Bar']::TEXT[], ARRAY['Ph.D', 'No Education Bar']::TEXT[], ARRAY['Mechanical Engineer']::TEXT[], ARRAY['vegetarian','non_vegetarian']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  height_min = EXCLUDED.height_min,
  height_max = EXCLUDED.height_max,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  education = EXCLUDED.education,
  occupation = EXCLUDED.occupation,
  food_habit = EXCLUDED.food_habit;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, height_min, height_max, marital_status, religion, caste, education, occupation, food_habit)
VALUES ('00000000-0000-4000-a000-00000000008b', 23, 39, 157, 172, ARRAY['never_married']::TEXT[], ARRAY['Hindu']::TEXT[], ARRAY['Sengunthar', 'Caste No Bar']::TEXT[], ARRAY['B.Com', 'No Education Bar']::TEXT[], ARRAY['Doctor']::TEXT[], ARRAY['vegetarian','non_vegetarian']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  height_min = EXCLUDED.height_min,
  height_max = EXCLUDED.height_max,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  education = EXCLUDED.education,
  occupation = EXCLUDED.occupation,
  food_habit = EXCLUDED.food_habit;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, height_min, height_max, marital_status, religion, caste, education, occupation, food_habit)
VALUES ('00000000-0000-4000-a000-00000000008c', 26, 42, 152, 167, ARRAY['never_married']::TEXT[], ARRAY['Hindu']::TEXT[], ARRAY['Thevar', 'Caste No Bar']::TEXT[], ARRAY['M.A', 'No Education Bar']::TEXT[], ARRAY['Government Officer']::TEXT[], ARRAY['vegetarian','non_vegetarian']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  height_min = EXCLUDED.height_min,
  height_max = EXCLUDED.height_max,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  education = EXCLUDED.education,
  occupation = EXCLUDED.occupation,
  food_habit = EXCLUDED.food_habit;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, height_min, height_max, marital_status, religion, caste, education, occupation, food_habit)
VALUES ('00000000-0000-4000-a000-00000000008d', 21, 38, 147, 162, ARRAY['never_married']::TEXT[], ARRAY['Muslim']::TEXT[], ARRAY['Rawther', 'Caste No Bar']::TEXT[], ARRAY['B.Ed', 'No Education Bar']::TEXT[], ARRAY['Civil Engineer']::TEXT[], ARRAY['vegetarian','non_vegetarian']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  height_min = EXCLUDED.height_min,
  height_max = EXCLUDED.height_max,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  education = EXCLUDED.education,
  occupation = EXCLUDED.occupation,
  food_habit = EXCLUDED.food_habit;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, height_min, height_max, marital_status, religion, caste, education, occupation, food_habit)
VALUES ('00000000-0000-4000-a000-00000000008e', 23, 39, 137, 152, ARRAY['never_married']::TEXT[], ARRAY['Christian']::TEXT[], ARRAY['RC Christian', 'Caste No Bar']::TEXT[], ARRAY['B.Sc', 'No Education Bar']::TEXT[], ARRAY['Pharmacist']::TEXT[], ARRAY['vegetarian','non_vegetarian']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  height_min = EXCLUDED.height_min,
  height_max = EXCLUDED.height_max,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  education = EXCLUDED.education,
  occupation = EXCLUDED.occupation,
  food_habit = EXCLUDED.food_habit;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, height_min, height_max, marital_status, religion, caste, education, occupation, food_habit)
VALUES ('00000000-0000-4000-a000-00000000008f', 25, 43, 160, 175, ARRAY['never_married']::TEXT[], ARRAY['Hindu']::TEXT[], ARRAY['Naicker', 'Caste No Bar']::TEXT[], ARRAY['M.Com', 'No Education Bar']::TEXT[], ARRAY['Advocate']::TEXT[], ARRAY['vegetarian','non_vegetarian']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  height_min = EXCLUDED.height_min,
  height_max = EXCLUDED.height_max,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  education = EXCLUDED.education,
  occupation = EXCLUDED.occupation,
  food_habit = EXCLUDED.food_habit;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, height_min, height_max, marital_status, religion, caste, education, occupation, food_habit)
VALUES ('00000000-0000-4000-a000-000000000090', 28, 45, 153, 168, ARRAY['never_married']::TEXT[], ARRAY['Muslim']::TEXT[], ARRAY['Rawther', 'Caste No Bar']::TEXT[], ARRAY['M.Com', 'No Education Bar']::TEXT[], ARRAY['College Professor']::TEXT[], ARRAY['vegetarian','non_vegetarian']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  height_min = EXCLUDED.height_min,
  height_max = EXCLUDED.height_max,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  education = EXCLUDED.education,
  occupation = EXCLUDED.occupation,
  food_habit = EXCLUDED.food_habit;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, height_min, height_max, marital_status, religion, caste, education, occupation, food_habit)
VALUES ('00000000-0000-4000-a000-000000000091', 25, 44, 167, 182, ARRAY['never_married']::TEXT[], ARRAY['Hindu']::TEXT[], ARRAY['Adi Dravida', 'Caste No Bar']::TEXT[], ARRAY['Ph.D', 'No Education Bar']::TEXT[], ARRAY['Advocate']::TEXT[], ARRAY['vegetarian','non_vegetarian']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  height_min = EXCLUDED.height_min,
  height_max = EXCLUDED.height_max,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  education = EXCLUDED.education,
  occupation = EXCLUDED.occupation,
  food_habit = EXCLUDED.food_habit;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, height_min, height_max, marital_status, religion, caste, education, occupation, food_habit)
VALUES ('00000000-0000-4000-a000-000000000092', 27, 40, 144, 159, ARRAY['never_married']::TEXT[], ARRAY['Hindu']::TEXT[], ARRAY['Chettiar', 'Caste No Bar']::TEXT[], ARRAY['M.B.B.S', 'No Education Bar']::TEXT[], ARRAY['Software Engineer']::TEXT[], ARRAY['vegetarian','non_vegetarian']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  height_min = EXCLUDED.height_min,
  height_max = EXCLUDED.height_max,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  education = EXCLUDED.education,
  occupation = EXCLUDED.occupation,
  food_habit = EXCLUDED.food_habit;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, height_min, height_max, marital_status, religion, caste, education, occupation, food_habit)
VALUES ('00000000-0000-4000-a000-000000000093', 22, 43, 151, 166, ARRAY['never_married']::TEXT[], ARRAY['Hindu']::TEXT[], ARRAY['Vanniyar', 'Caste No Bar']::TEXT[], ARRAY['B.E. / B.Tech', 'No Education Bar']::TEXT[], ARRAY['Civil Engineer']::TEXT[], ARRAY['vegetarian','non_vegetarian']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  height_min = EXCLUDED.height_min,
  height_max = EXCLUDED.height_max,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  education = EXCLUDED.education,
  occupation = EXCLUDED.occupation,
  food_habit = EXCLUDED.food_habit;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, height_min, height_max, marital_status, religion, caste, education, occupation, food_habit)
VALUES ('00000000-0000-4000-a000-000000000094', 25, 40, 142, 157, ARRAY['never_married']::TEXT[], ARRAY['Hindu']::TEXT[], ARRAY['Maravar', 'Caste No Bar']::TEXT[], ARRAY['B.E. / B.Tech', 'No Education Bar']::TEXT[], ARRAY['Architect']::TEXT[], ARRAY['vegetarian','non_vegetarian']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  height_min = EXCLUDED.height_min,
  height_max = EXCLUDED.height_max,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  education = EXCLUDED.education,
  occupation = EXCLUDED.occupation,
  food_habit = EXCLUDED.food_habit;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, height_min, height_max, marital_status, religion, caste, education, occupation, food_habit)
VALUES ('00000000-0000-4000-a000-000000000095', 26, 37, 160, 175, ARRAY['never_married']::TEXT[], ARRAY['Hindu']::TEXT[], ARRAY['Maravar', 'Caste No Bar']::TEXT[], ARRAY['M.B.B.S', 'No Education Bar']::TEXT[], ARRAY['School Teacher']::TEXT[], ARRAY['vegetarian','non_vegetarian']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  height_min = EXCLUDED.height_min,
  height_max = EXCLUDED.height_max,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  education = EXCLUDED.education,
  occupation = EXCLUDED.occupation,
  food_habit = EXCLUDED.food_habit;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, height_min, height_max, marital_status, religion, caste, education, occupation, food_habit)
VALUES ('00000000-0000-4000-a000-000000000096', 27, 30, 139, 154, ARRAY['never_married']::TEXT[], ARRAY['Hindu']::TEXT[], ARRAY['Pillai', 'Caste No Bar']::TEXT[], ARRAY['B.A', 'No Education Bar']::TEXT[], ARRAY['Mechanical Engineer']::TEXT[], ARRAY['vegetarian','non_vegetarian']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  height_min = EXCLUDED.height_min,
  height_max = EXCLUDED.height_max,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  education = EXCLUDED.education,
  occupation = EXCLUDED.occupation,
  food_habit = EXCLUDED.food_habit;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, height_min, height_max, marital_status, religion, caste, education, occupation, food_habit)
VALUES ('00000000-0000-4000-a000-000000000097', 21, 45, 164, 179, ARRAY['never_married']::TEXT[], ARRAY['Hindu']::TEXT[], ARRAY['Brahmin - Iyengar', 'Caste No Bar']::TEXT[], ARRAY['B.Ed', 'No Education Bar']::TEXT[], ARRAY['Pharmacist']::TEXT[], ARRAY['vegetarian','non_vegetarian']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  height_min = EXCLUDED.height_min,
  height_max = EXCLUDED.height_max,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  education = EXCLUDED.education,
  occupation = EXCLUDED.occupation,
  food_habit = EXCLUDED.food_habit;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, height_min, height_max, marital_status, religion, caste, education, occupation, food_habit)
VALUES ('00000000-0000-4000-a000-000000000098', 24, 31, 158, 173, ARRAY['never_married']::TEXT[], ARRAY['Hindu']::TEXT[], ARRAY['Thevar', 'Caste No Bar']::TEXT[], ARRAY['M.B.A', 'No Education Bar']::TEXT[], ARRAY['College Professor']::TEXT[], ARRAY['vegetarian','non_vegetarian']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  height_min = EXCLUDED.height_min,
  height_max = EXCLUDED.height_max,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  education = EXCLUDED.education,
  occupation = EXCLUDED.occupation,
  food_habit = EXCLUDED.food_habit;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, height_min, height_max, marital_status, religion, caste, education, occupation, food_habit)
VALUES ('00000000-0000-4000-a000-000000000099', 27, 43, 147, 162, ARRAY['never_married']::TEXT[], ARRAY['Hindu']::TEXT[], ARRAY['Brahmin - Iyengar', 'Caste No Bar']::TEXT[], ARRAY['M.A', 'No Education Bar']::TEXT[], ARRAY['Dentist']::TEXT[], ARRAY['vegetarian','non_vegetarian']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  height_min = EXCLUDED.height_min,
  height_max = EXCLUDED.height_max,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  education = EXCLUDED.education,
  occupation = EXCLUDED.occupation,
  food_habit = EXCLUDED.food_habit;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, height_min, height_max, marital_status, religion, caste, education, occupation, food_habit)
VALUES ('00000000-0000-4000-a000-00000000009a', 24, 45, 152, 167, ARRAY['never_married']::TEXT[], ARRAY['Hindu']::TEXT[], ARRAY['Brahmin - Iyer', 'Caste No Bar']::TEXT[], ARRAY['B.E. / B.Tech', 'No Education Bar']::TEXT[], ARRAY['Mechanical Engineer']::TEXT[], ARRAY['vegetarian','non_vegetarian']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  height_min = EXCLUDED.height_min,
  height_max = EXCLUDED.height_max,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  education = EXCLUDED.education,
  occupation = EXCLUDED.occupation,
  food_habit = EXCLUDED.food_habit;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, height_min, height_max, marital_status, religion, caste, education, occupation, food_habit)
VALUES ('00000000-0000-4000-a000-00000000009b', 23, 30, 167, 182, ARRAY['never_married']::TEXT[], ARRAY['Hindu']::TEXT[], ARRAY['Vanniyar', 'Caste No Bar']::TEXT[], ARRAY['B.A', 'No Education Bar']::TEXT[], ARRAY['Government Officer']::TEXT[], ARRAY['vegetarian','non_vegetarian']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  height_min = EXCLUDED.height_min,
  height_max = EXCLUDED.height_max,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  education = EXCLUDED.education,
  occupation = EXCLUDED.occupation,
  food_habit = EXCLUDED.food_habit;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, height_min, height_max, marital_status, religion, caste, education, occupation, food_habit)
VALUES ('00000000-0000-4000-a000-00000000009c', 21, 35, 135, 150, ARRAY['never_married']::TEXT[], ARRAY['Hindu']::TEXT[], ARRAY['Naicker', 'Caste No Bar']::TEXT[], ARRAY['B.A', 'No Education Bar']::TEXT[], ARRAY['School Teacher']::TEXT[], ARRAY['vegetarian','non_vegetarian']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  height_min = EXCLUDED.height_min,
  height_max = EXCLUDED.height_max,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  education = EXCLUDED.education,
  occupation = EXCLUDED.occupation,
  food_habit = EXCLUDED.food_habit;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, height_min, height_max, marital_status, religion, caste, education, occupation, food_habit)
VALUES ('00000000-0000-4000-a000-00000000009d', 23, 35, 157, 172, ARRAY['never_married']::TEXT[], ARRAY['Hindu']::TEXT[], ARRAY['Yadav', 'Caste No Bar']::TEXT[], ARRAY['B.Sc', 'No Education Bar']::TEXT[], ARRAY['College Professor']::TEXT[], ARRAY['vegetarian','non_vegetarian']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  height_min = EXCLUDED.height_min,
  height_max = EXCLUDED.height_max,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  education = EXCLUDED.education,
  occupation = EXCLUDED.occupation,
  food_habit = EXCLUDED.food_habit;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, height_min, height_max, marital_status, religion, caste, education, occupation, food_habit)
VALUES ('00000000-0000-4000-a000-00000000009e', 23, 34, 149, 164, ARRAY['never_married']::TEXT[], ARRAY['Hindu']::TEXT[], ARRAY['Brahmin - Iyer', 'Caste No Bar']::TEXT[], ARRAY['M.Sc', 'No Education Bar']::TEXT[], ARRAY['College Professor']::TEXT[], ARRAY['vegetarian','non_vegetarian']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  height_min = EXCLUDED.height_min,
  height_max = EXCLUDED.height_max,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  education = EXCLUDED.education,
  occupation = EXCLUDED.occupation,
  food_habit = EXCLUDED.food_habit;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, height_min, height_max, marital_status, religion, caste, education, occupation, food_habit)
VALUES ('00000000-0000-4000-a000-00000000009f', 25, 42, 173, 188, ARRAY['never_married']::TEXT[], ARRAY['Hindu']::TEXT[], ARRAY['Maravar', 'Caste No Bar']::TEXT[], ARRAY['M.B.B.S', 'No Education Bar']::TEXT[], ARRAY['Police Officer']::TEXT[], ARRAY['vegetarian','non_vegetarian']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  height_min = EXCLUDED.height_min,
  height_max = EXCLUDED.height_max,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  education = EXCLUDED.education,
  occupation = EXCLUDED.occupation,
  food_habit = EXCLUDED.food_habit;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, height_min, height_max, marital_status, religion, caste, education, occupation, food_habit)
VALUES ('00000000-0000-4000-a000-0000000000a0', 27, 33, 159, 174, ARRAY['never_married']::TEXT[], ARRAY['Hindu']::TEXT[], ARRAY['Maravar', 'Caste No Bar']::TEXT[], ARRAY['B.A', 'No Education Bar']::TEXT[], ARRAY['Pharmacist']::TEXT[], ARRAY['vegetarian','non_vegetarian']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  height_min = EXCLUDED.height_min,
  height_max = EXCLUDED.height_max,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  education = EXCLUDED.education,
  occupation = EXCLUDED.occupation,
  food_habit = EXCLUDED.food_habit;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, height_min, height_max, marital_status, religion, caste, education, occupation, food_habit)
VALUES ('00000000-0000-4000-a000-0000000000a1', 24, 41, 166, 181, ARRAY['never_married']::TEXT[], ARRAY['Hindu']::TEXT[], ARRAY['Brahmin - Iyer', 'Caste No Bar']::TEXT[], ARRAY['B.Com', 'No Education Bar']::TEXT[], ARRAY['Architect']::TEXT[], ARRAY['vegetarian','non_vegetarian']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  height_min = EXCLUDED.height_min,
  height_max = EXCLUDED.height_max,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  education = EXCLUDED.education,
  occupation = EXCLUDED.occupation,
  food_habit = EXCLUDED.food_habit;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, height_min, height_max, marital_status, religion, caste, education, occupation, food_habit)
VALUES ('00000000-0000-4000-a000-0000000000a2', 22, 45, 150, 165, ARRAY['never_married']::TEXT[], ARRAY['Hindu']::TEXT[], ARRAY['Pillai', 'Caste No Bar']::TEXT[], ARRAY['B.Sc', 'No Education Bar']::TEXT[], ARRAY['Pharmacist']::TEXT[], ARRAY['vegetarian','non_vegetarian']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  height_min = EXCLUDED.height_min,
  height_max = EXCLUDED.height_max,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  education = EXCLUDED.education,
  occupation = EXCLUDED.occupation,
  food_habit = EXCLUDED.food_habit;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, height_min, height_max, marital_status, religion, caste, education, occupation, food_habit)
VALUES ('00000000-0000-4000-a000-0000000000a3', 25, 36, 154, 169, ARRAY['never_married']::TEXT[], ARRAY['Hindu']::TEXT[], ARRAY['Adi Dravida', 'Caste No Bar']::TEXT[], ARRAY['M.B.A', 'No Education Bar']::TEXT[], ARRAY['Civil Engineer']::TEXT[], ARRAY['vegetarian','non_vegetarian']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  height_min = EXCLUDED.height_min,
  height_max = EXCLUDED.height_max,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  education = EXCLUDED.education,
  occupation = EXCLUDED.occupation,
  food_habit = EXCLUDED.food_habit;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, height_min, height_max, marital_status, religion, caste, education, occupation, food_habit)
VALUES ('00000000-0000-4000-a000-0000000000a4', 28, 36, 138, 153, ARRAY['never_married']::TEXT[], ARRAY['Muslim']::TEXT[], ARRAY['Labbai', 'Caste No Bar']::TEXT[], ARRAY['M.Com', 'No Education Bar']::TEXT[], ARRAY['College Professor']::TEXT[], ARRAY['vegetarian','non_vegetarian']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  height_min = EXCLUDED.height_min,
  height_max = EXCLUDED.height_max,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  education = EXCLUDED.education,
  occupation = EXCLUDED.occupation,
  food_habit = EXCLUDED.food_habit;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, height_min, height_max, marital_status, religion, caste, education, occupation, food_habit)
VALUES ('00000000-0000-4000-a000-0000000000a5', 28, 34, 148, 163, ARRAY['never_married']::TEXT[], ARRAY['Hindu']::TEXT[], ARRAY['Naicker', 'Caste No Bar']::TEXT[], ARRAY['B.Ed', 'No Education Bar']::TEXT[], ARRAY['Civil Engineer']::TEXT[], ARRAY['vegetarian','non_vegetarian']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  height_min = EXCLUDED.height_min,
  height_max = EXCLUDED.height_max,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  education = EXCLUDED.education,
  occupation = EXCLUDED.occupation,
  food_habit = EXCLUDED.food_habit;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, height_min, height_max, marital_status, religion, caste, education, occupation, food_habit)
VALUES ('00000000-0000-4000-a000-0000000000a6', 28, 35, 136, 151, ARRAY['never_married']::TEXT[], ARRAY['Hindu']::TEXT[], ARRAY['Naicker', 'Caste No Bar']::TEXT[], ARRAY['B.Com', 'No Education Bar']::TEXT[], ARRAY['Architect']::TEXT[], ARRAY['vegetarian','non_vegetarian']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  height_min = EXCLUDED.height_min,
  height_max = EXCLUDED.height_max,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  education = EXCLUDED.education,
  occupation = EXCLUDED.occupation,
  food_habit = EXCLUDED.food_habit;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, height_min, height_max, marital_status, religion, caste, education, occupation, food_habit)
VALUES ('00000000-0000-4000-a000-0000000000a7', 25, 43, 161, 176, ARRAY['never_married']::TEXT[], ARRAY['Hindu']::TEXT[], ARRAY['Brahmin - Iyengar', 'Caste No Bar']::TEXT[], ARRAY['B.E. / B.Tech', 'No Education Bar']::TEXT[], ARRAY['Police Officer']::TEXT[], ARRAY['vegetarian','non_vegetarian']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  height_min = EXCLUDED.height_min,
  height_max = EXCLUDED.height_max,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  education = EXCLUDED.education,
  occupation = EXCLUDED.occupation,
  food_habit = EXCLUDED.food_habit;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, height_min, height_max, marital_status, religion, caste, education, occupation, food_habit)
VALUES ('00000000-0000-4000-a000-0000000000a8', 24, 43, 143, 158, ARRAY['never_married']::TEXT[], ARRAY['Hindu']::TEXT[], ARRAY['Thevar', 'Caste No Bar']::TEXT[], ARRAY['M.B.A', 'No Education Bar']::TEXT[], ARRAY['Police Officer']::TEXT[], ARRAY['vegetarian','non_vegetarian']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  height_min = EXCLUDED.height_min,
  height_max = EXCLUDED.height_max,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  education = EXCLUDED.education,
  occupation = EXCLUDED.occupation,
  food_habit = EXCLUDED.food_habit;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, height_min, height_max, marital_status, religion, caste, education, occupation, food_habit)
VALUES ('00000000-0000-4000-a000-0000000000a9', 22, 44, 173, 188, ARRAY['never_married']::TEXT[], ARRAY['Muslim']::TEXT[], ARRAY['Shia Muslim', 'Caste No Bar']::TEXT[], ARRAY['B.Com', 'No Education Bar']::TEXT[], ARRAY['Doctor']::TEXT[], ARRAY['vegetarian','non_vegetarian']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  height_min = EXCLUDED.height_min,
  height_max = EXCLUDED.height_max,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  education = EXCLUDED.education,
  occupation = EXCLUDED.occupation,
  food_habit = EXCLUDED.food_habit;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, height_min, height_max, marital_status, religion, caste, education, occupation, food_habit)
VALUES ('00000000-0000-4000-a000-0000000000aa', 22, 39, 138, 153, ARRAY['never_married']::TEXT[], ARRAY['Hindu']::TEXT[], ARRAY['Sengunthar', 'Caste No Bar']::TEXT[], ARRAY['M.Com', 'No Education Bar']::TEXT[], ARRAY['Business Owner']::TEXT[], ARRAY['vegetarian','non_vegetarian']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  height_min = EXCLUDED.height_min,
  height_max = EXCLUDED.height_max,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  education = EXCLUDED.education,
  occupation = EXCLUDED.occupation,
  food_habit = EXCLUDED.food_habit;

-- 5. PHOTOS INSERTIONS (Lightweight URL)
INSERT INTO public.photos (user_id, storage_path, thumbnail_path, is_primary, is_approved)
VALUES ('00000000-0000-4000-a000-000000000001', 'https://randomuser.me/api/portraits/men/2.jpg', 'https://randomuser.me/api/portraits/men/2.jpg', true, true)
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.photos (user_id, storage_path, thumbnail_path, is_primary, is_approved)
VALUES ('00000000-0000-4000-a000-000000000002', 'https://randomuser.me/api/portraits/women/3.jpg', 'https://randomuser.me/api/portraits/women/3.jpg', true, true)
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.photos (user_id, storage_path, thumbnail_path, is_primary, is_approved)
VALUES ('00000000-0000-4000-a000-000000000003', 'https://randomuser.me/api/portraits/men/4.jpg', 'https://randomuser.me/api/portraits/men/4.jpg', true, true)
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.photos (user_id, storage_path, thumbnail_path, is_primary, is_approved)
VALUES ('00000000-0000-4000-a000-000000000004', 'https://randomuser.me/api/portraits/women/5.jpg', 'https://randomuser.me/api/portraits/women/5.jpg', true, true)
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.photos (user_id, storage_path, thumbnail_path, is_primary, is_approved)
VALUES ('00000000-0000-4000-a000-000000000005', 'https://randomuser.me/api/portraits/men/6.jpg', 'https://randomuser.me/api/portraits/men/6.jpg', true, true)
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.photos (user_id, storage_path, thumbnail_path, is_primary, is_approved)
VALUES ('00000000-0000-4000-a000-000000000006', 'https://randomuser.me/api/portraits/women/7.jpg', 'https://randomuser.me/api/portraits/women/7.jpg', true, true)
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.photos (user_id, storage_path, thumbnail_path, is_primary, is_approved)
VALUES ('00000000-0000-4000-a000-000000000007', 'https://randomuser.me/api/portraits/men/8.jpg', 'https://randomuser.me/api/portraits/men/8.jpg', true, true)
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.photos (user_id, storage_path, thumbnail_path, is_primary, is_approved)
VALUES ('00000000-0000-4000-a000-000000000008', 'https://randomuser.me/api/portraits/women/9.jpg', 'https://randomuser.me/api/portraits/women/9.jpg', true, true)
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.photos (user_id, storage_path, thumbnail_path, is_primary, is_approved)
VALUES ('00000000-0000-4000-a000-000000000009', 'https://randomuser.me/api/portraits/men/10.jpg', 'https://randomuser.me/api/portraits/men/10.jpg', true, true)
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.photos (user_id, storage_path, thumbnail_path, is_primary, is_approved)
VALUES ('00000000-0000-4000-a000-00000000000a', 'https://randomuser.me/api/portraits/women/11.jpg', 'https://randomuser.me/api/portraits/women/11.jpg', true, true)
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.photos (user_id, storage_path, thumbnail_path, is_primary, is_approved)
VALUES ('00000000-0000-4000-a000-00000000000b', 'https://randomuser.me/api/portraits/men/12.jpg', 'https://randomuser.me/api/portraits/men/12.jpg', true, true)
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.photos (user_id, storage_path, thumbnail_path, is_primary, is_approved)
VALUES ('00000000-0000-4000-a000-00000000000c', 'https://randomuser.me/api/portraits/women/13.jpg', 'https://randomuser.me/api/portraits/women/13.jpg', true, true)
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.photos (user_id, storage_path, thumbnail_path, is_primary, is_approved)
VALUES ('00000000-0000-4000-a000-00000000000d', 'https://randomuser.me/api/portraits/men/14.jpg', 'https://randomuser.me/api/portraits/men/14.jpg', true, true)
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.photos (user_id, storage_path, thumbnail_path, is_primary, is_approved)
VALUES ('00000000-0000-4000-a000-00000000000e', 'https://randomuser.me/api/portraits/women/15.jpg', 'https://randomuser.me/api/portraits/women/15.jpg', true, true)
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.photos (user_id, storage_path, thumbnail_path, is_primary, is_approved)
VALUES ('00000000-0000-4000-a000-00000000000f', 'https://randomuser.me/api/portraits/men/16.jpg', 'https://randomuser.me/api/portraits/men/16.jpg', true, true)
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.photos (user_id, storage_path, thumbnail_path, is_primary, is_approved)
VALUES ('00000000-0000-4000-a000-000000000010', 'https://randomuser.me/api/portraits/women/17.jpg', 'https://randomuser.me/api/portraits/women/17.jpg', true, true)
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.photos (user_id, storage_path, thumbnail_path, is_primary, is_approved)
VALUES ('00000000-0000-4000-a000-000000000011', 'https://randomuser.me/api/portraits/men/18.jpg', 'https://randomuser.me/api/portraits/men/18.jpg', true, true)
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.photos (user_id, storage_path, thumbnail_path, is_primary, is_approved)
VALUES ('00000000-0000-4000-a000-000000000012', 'https://randomuser.me/api/portraits/women/19.jpg', 'https://randomuser.me/api/portraits/women/19.jpg', true, true)
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.photos (user_id, storage_path, thumbnail_path, is_primary, is_approved)
VALUES ('00000000-0000-4000-a000-000000000013', 'https://randomuser.me/api/portraits/men/20.jpg', 'https://randomuser.me/api/portraits/men/20.jpg', true, true)
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.photos (user_id, storage_path, thumbnail_path, is_primary, is_approved)
VALUES ('00000000-0000-4000-a000-000000000014', 'https://randomuser.me/api/portraits/women/21.jpg', 'https://randomuser.me/api/portraits/women/21.jpg', true, true)
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.photos (user_id, storage_path, thumbnail_path, is_primary, is_approved)
VALUES ('00000000-0000-4000-a000-000000000015', 'https://randomuser.me/api/portraits/men/22.jpg', 'https://randomuser.me/api/portraits/men/22.jpg', true, true)
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.photos (user_id, storage_path, thumbnail_path, is_primary, is_approved)
VALUES ('00000000-0000-4000-a000-000000000016', 'https://randomuser.me/api/portraits/women/23.jpg', 'https://randomuser.me/api/portraits/women/23.jpg', true, true)
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.photos (user_id, storage_path, thumbnail_path, is_primary, is_approved)
VALUES ('00000000-0000-4000-a000-000000000017', 'https://randomuser.me/api/portraits/men/24.jpg', 'https://randomuser.me/api/portraits/men/24.jpg', true, true)
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.photos (user_id, storage_path, thumbnail_path, is_primary, is_approved)
VALUES ('00000000-0000-4000-a000-000000000018', 'https://randomuser.me/api/portraits/women/25.jpg', 'https://randomuser.me/api/portraits/women/25.jpg', true, true)
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.photos (user_id, storage_path, thumbnail_path, is_primary, is_approved)
VALUES ('00000000-0000-4000-a000-000000000019', 'https://randomuser.me/api/portraits/men/26.jpg', 'https://randomuser.me/api/portraits/men/26.jpg', true, true)
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.photos (user_id, storage_path, thumbnail_path, is_primary, is_approved)
VALUES ('00000000-0000-4000-a000-00000000001a', 'https://randomuser.me/api/portraits/women/27.jpg', 'https://randomuser.me/api/portraits/women/27.jpg', true, true)
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.photos (user_id, storage_path, thumbnail_path, is_primary, is_approved)
VALUES ('00000000-0000-4000-a000-00000000001b', 'https://randomuser.me/api/portraits/men/28.jpg', 'https://randomuser.me/api/portraits/men/28.jpg', true, true)
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.photos (user_id, storage_path, thumbnail_path, is_primary, is_approved)
VALUES ('00000000-0000-4000-a000-00000000001c', 'https://randomuser.me/api/portraits/women/29.jpg', 'https://randomuser.me/api/portraits/women/29.jpg', true, true)
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.photos (user_id, storage_path, thumbnail_path, is_primary, is_approved)
VALUES ('00000000-0000-4000-a000-00000000001d', 'https://randomuser.me/api/portraits/men/30.jpg', 'https://randomuser.me/api/portraits/men/30.jpg', true, true)
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.photos (user_id, storage_path, thumbnail_path, is_primary, is_approved)
VALUES ('00000000-0000-4000-a000-00000000001e', 'https://randomuser.me/api/portraits/women/31.jpg', 'https://randomuser.me/api/portraits/women/31.jpg', true, true)
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.photos (user_id, storage_path, thumbnail_path, is_primary, is_approved)
VALUES ('00000000-0000-4000-a000-00000000001f', 'https://randomuser.me/api/portraits/men/32.jpg', 'https://randomuser.me/api/portraits/men/32.jpg', true, true)
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.photos (user_id, storage_path, thumbnail_path, is_primary, is_approved)
VALUES ('00000000-0000-4000-a000-000000000020', 'https://randomuser.me/api/portraits/women/33.jpg', 'https://randomuser.me/api/portraits/women/33.jpg', true, true)
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.photos (user_id, storage_path, thumbnail_path, is_primary, is_approved)
VALUES ('00000000-0000-4000-a000-000000000021', 'https://randomuser.me/api/portraits/men/34.jpg', 'https://randomuser.me/api/portraits/men/34.jpg', true, true)
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.photos (user_id, storage_path, thumbnail_path, is_primary, is_approved)
VALUES ('00000000-0000-4000-a000-000000000022', 'https://randomuser.me/api/portraits/women/35.jpg', 'https://randomuser.me/api/portraits/women/35.jpg', true, true)
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.photos (user_id, storage_path, thumbnail_path, is_primary, is_approved)
VALUES ('00000000-0000-4000-a000-000000000023', 'https://randomuser.me/api/portraits/men/36.jpg', 'https://randomuser.me/api/portraits/men/36.jpg', true, true)
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.photos (user_id, storage_path, thumbnail_path, is_primary, is_approved)
VALUES ('00000000-0000-4000-a000-000000000024', 'https://randomuser.me/api/portraits/women/37.jpg', 'https://randomuser.me/api/portraits/women/37.jpg', true, true)
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.photos (user_id, storage_path, thumbnail_path, is_primary, is_approved)
VALUES ('00000000-0000-4000-a000-000000000025', 'https://randomuser.me/api/portraits/men/38.jpg', 'https://randomuser.me/api/portraits/men/38.jpg', true, true)
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.photos (user_id, storage_path, thumbnail_path, is_primary, is_approved)
VALUES ('00000000-0000-4000-a000-000000000026', 'https://randomuser.me/api/portraits/women/39.jpg', 'https://randomuser.me/api/portraits/women/39.jpg', true, true)
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.photos (user_id, storage_path, thumbnail_path, is_primary, is_approved)
VALUES ('00000000-0000-4000-a000-000000000027', 'https://randomuser.me/api/portraits/men/40.jpg', 'https://randomuser.me/api/portraits/men/40.jpg', true, true)
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.photos (user_id, storage_path, thumbnail_path, is_primary, is_approved)
VALUES ('00000000-0000-4000-a000-000000000028', 'https://randomuser.me/api/portraits/women/41.jpg', 'https://randomuser.me/api/portraits/women/41.jpg', true, true)
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.photos (user_id, storage_path, thumbnail_path, is_primary, is_approved)
VALUES ('00000000-0000-4000-a000-000000000029', 'https://randomuser.me/api/portraits/men/42.jpg', 'https://randomuser.me/api/portraits/men/42.jpg', true, true)
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.photos (user_id, storage_path, thumbnail_path, is_primary, is_approved)
VALUES ('00000000-0000-4000-a000-00000000002a', 'https://randomuser.me/api/portraits/women/43.jpg', 'https://randomuser.me/api/portraits/women/43.jpg', true, true)
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.photos (user_id, storage_path, thumbnail_path, is_primary, is_approved)
VALUES ('00000000-0000-4000-a000-00000000002b', 'https://randomuser.me/api/portraits/men/44.jpg', 'https://randomuser.me/api/portraits/men/44.jpg', true, true)
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.photos (user_id, storage_path, thumbnail_path, is_primary, is_approved)
VALUES ('00000000-0000-4000-a000-00000000002c', 'https://randomuser.me/api/portraits/women/45.jpg', 'https://randomuser.me/api/portraits/women/45.jpg', true, true)
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.photos (user_id, storage_path, thumbnail_path, is_primary, is_approved)
VALUES ('00000000-0000-4000-a000-00000000002d', 'https://randomuser.me/api/portraits/men/46.jpg', 'https://randomuser.me/api/portraits/men/46.jpg', true, true)
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.photos (user_id, storage_path, thumbnail_path, is_primary, is_approved)
VALUES ('00000000-0000-4000-a000-00000000002e', 'https://randomuser.me/api/portraits/women/47.jpg', 'https://randomuser.me/api/portraits/women/47.jpg', true, true)
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.photos (user_id, storage_path, thumbnail_path, is_primary, is_approved)
VALUES ('00000000-0000-4000-a000-00000000002f', 'https://randomuser.me/api/portraits/men/48.jpg', 'https://randomuser.me/api/portraits/men/48.jpg', true, true)
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.photos (user_id, storage_path, thumbnail_path, is_primary, is_approved)
VALUES ('00000000-0000-4000-a000-000000000030', 'https://randomuser.me/api/portraits/women/49.jpg', 'https://randomuser.me/api/portraits/women/49.jpg', true, true)
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.photos (user_id, storage_path, thumbnail_path, is_primary, is_approved)
VALUES ('00000000-0000-4000-a000-000000000031', 'https://randomuser.me/api/portraits/men/50.jpg', 'https://randomuser.me/api/portraits/men/50.jpg', true, true)
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.photos (user_id, storage_path, thumbnail_path, is_primary, is_approved)
VALUES ('00000000-0000-4000-a000-000000000032', 'https://randomuser.me/api/portraits/women/51.jpg', 'https://randomuser.me/api/portraits/women/51.jpg', true, true)
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.photos (user_id, storage_path, thumbnail_path, is_primary, is_approved)
VALUES ('00000000-0000-4000-a000-000000000033', 'https://randomuser.me/api/portraits/men/52.jpg', 'https://randomuser.me/api/portraits/men/52.jpg', true, true)
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.photos (user_id, storage_path, thumbnail_path, is_primary, is_approved)
VALUES ('00000000-0000-4000-a000-000000000034', 'https://randomuser.me/api/portraits/women/53.jpg', 'https://randomuser.me/api/portraits/women/53.jpg', true, true)
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.photos (user_id, storage_path, thumbnail_path, is_primary, is_approved)
VALUES ('00000000-0000-4000-a000-000000000035', 'https://randomuser.me/api/portraits/men/54.jpg', 'https://randomuser.me/api/portraits/men/54.jpg', true, true)
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.photos (user_id, storage_path, thumbnail_path, is_primary, is_approved)
VALUES ('00000000-0000-4000-a000-000000000036', 'https://randomuser.me/api/portraits/women/55.jpg', 'https://randomuser.me/api/portraits/women/55.jpg', true, true)
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.photos (user_id, storage_path, thumbnail_path, is_primary, is_approved)
VALUES ('00000000-0000-4000-a000-000000000037', 'https://randomuser.me/api/portraits/men/56.jpg', 'https://randomuser.me/api/portraits/men/56.jpg', true, true)
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.photos (user_id, storage_path, thumbnail_path, is_primary, is_approved)
VALUES ('00000000-0000-4000-a000-000000000038', 'https://randomuser.me/api/portraits/women/57.jpg', 'https://randomuser.me/api/portraits/women/57.jpg', true, true)
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.photos (user_id, storage_path, thumbnail_path, is_primary, is_approved)
VALUES ('00000000-0000-4000-a000-000000000039', 'https://randomuser.me/api/portraits/men/58.jpg', 'https://randomuser.me/api/portraits/men/58.jpg', true, true)
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.photos (user_id, storage_path, thumbnail_path, is_primary, is_approved)
VALUES ('00000000-0000-4000-a000-00000000003a', 'https://randomuser.me/api/portraits/women/59.jpg', 'https://randomuser.me/api/portraits/women/59.jpg', true, true)
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.photos (user_id, storage_path, thumbnail_path, is_primary, is_approved)
VALUES ('00000000-0000-4000-a000-00000000003b', 'https://randomuser.me/api/portraits/men/60.jpg', 'https://randomuser.me/api/portraits/men/60.jpg', true, true)
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.photos (user_id, storage_path, thumbnail_path, is_primary, is_approved)
VALUES ('00000000-0000-4000-a000-00000000003c', 'https://randomuser.me/api/portraits/women/61.jpg', 'https://randomuser.me/api/portraits/women/61.jpg', true, true)
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.photos (user_id, storage_path, thumbnail_path, is_primary, is_approved)
VALUES ('00000000-0000-4000-a000-00000000003d', 'https://randomuser.me/api/portraits/men/62.jpg', 'https://randomuser.me/api/portraits/men/62.jpg', true, true)
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.photos (user_id, storage_path, thumbnail_path, is_primary, is_approved)
VALUES ('00000000-0000-4000-a000-00000000003e', 'https://randomuser.me/api/portraits/women/63.jpg', 'https://randomuser.me/api/portraits/women/63.jpg', true, true)
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.photos (user_id, storage_path, thumbnail_path, is_primary, is_approved)
VALUES ('00000000-0000-4000-a000-00000000003f', 'https://randomuser.me/api/portraits/men/64.jpg', 'https://randomuser.me/api/portraits/men/64.jpg', true, true)
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.photos (user_id, storage_path, thumbnail_path, is_primary, is_approved)
VALUES ('00000000-0000-4000-a000-000000000040', 'https://randomuser.me/api/portraits/women/65.jpg', 'https://randomuser.me/api/portraits/women/65.jpg', true, true)
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.photos (user_id, storage_path, thumbnail_path, is_primary, is_approved)
VALUES ('00000000-0000-4000-a000-000000000041', 'https://randomuser.me/api/portraits/men/66.jpg', 'https://randomuser.me/api/portraits/men/66.jpg', true, true)
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.photos (user_id, storage_path, thumbnail_path, is_primary, is_approved)
VALUES ('00000000-0000-4000-a000-000000000042', 'https://randomuser.me/api/portraits/women/67.jpg', 'https://randomuser.me/api/portraits/women/67.jpg', true, true)
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.photos (user_id, storage_path, thumbnail_path, is_primary, is_approved)
VALUES ('00000000-0000-4000-a000-000000000043', 'https://randomuser.me/api/portraits/men/68.jpg', 'https://randomuser.me/api/portraits/men/68.jpg', true, true)
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.photos (user_id, storage_path, thumbnail_path, is_primary, is_approved)
VALUES ('00000000-0000-4000-a000-000000000044', 'https://randomuser.me/api/portraits/women/69.jpg', 'https://randomuser.me/api/portraits/women/69.jpg', true, true)
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.photos (user_id, storage_path, thumbnail_path, is_primary, is_approved)
VALUES ('00000000-0000-4000-a000-000000000045', 'https://randomuser.me/api/portraits/men/70.jpg', 'https://randomuser.me/api/portraits/men/70.jpg', true, true)
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.photos (user_id, storage_path, thumbnail_path, is_primary, is_approved)
VALUES ('00000000-0000-4000-a000-000000000046', 'https://randomuser.me/api/portraits/women/71.jpg', 'https://randomuser.me/api/portraits/women/71.jpg', true, true)
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.photos (user_id, storage_path, thumbnail_path, is_primary, is_approved)
VALUES ('00000000-0000-4000-a000-000000000047', 'https://randomuser.me/api/portraits/men/72.jpg', 'https://randomuser.me/api/portraits/men/72.jpg', true, true)
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.photos (user_id, storage_path, thumbnail_path, is_primary, is_approved)
VALUES ('00000000-0000-4000-a000-000000000048', 'https://randomuser.me/api/portraits/women/73.jpg', 'https://randomuser.me/api/portraits/women/73.jpg', true, true)
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.photos (user_id, storage_path, thumbnail_path, is_primary, is_approved)
VALUES ('00000000-0000-4000-a000-000000000049', 'https://randomuser.me/api/portraits/men/74.jpg', 'https://randomuser.me/api/portraits/men/74.jpg', true, true)
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.photos (user_id, storage_path, thumbnail_path, is_primary, is_approved)
VALUES ('00000000-0000-4000-a000-00000000004a', 'https://randomuser.me/api/portraits/women/75.jpg', 'https://randomuser.me/api/portraits/women/75.jpg', true, true)
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.photos (user_id, storage_path, thumbnail_path, is_primary, is_approved)
VALUES ('00000000-0000-4000-a000-00000000004b', 'https://randomuser.me/api/portraits/men/76.jpg', 'https://randomuser.me/api/portraits/men/76.jpg', true, true)
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.photos (user_id, storage_path, thumbnail_path, is_primary, is_approved)
VALUES ('00000000-0000-4000-a000-00000000004c', 'https://randomuser.me/api/portraits/women/77.jpg', 'https://randomuser.me/api/portraits/women/77.jpg', true, true)
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.photos (user_id, storage_path, thumbnail_path, is_primary, is_approved)
VALUES ('00000000-0000-4000-a000-00000000004d', 'https://randomuser.me/api/portraits/men/78.jpg', 'https://randomuser.me/api/portraits/men/78.jpg', true, true)
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.photos (user_id, storage_path, thumbnail_path, is_primary, is_approved)
VALUES ('00000000-0000-4000-a000-00000000004e', 'https://randomuser.me/api/portraits/women/79.jpg', 'https://randomuser.me/api/portraits/women/79.jpg', true, true)
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.photos (user_id, storage_path, thumbnail_path, is_primary, is_approved)
VALUES ('00000000-0000-4000-a000-00000000004f', 'https://randomuser.me/api/portraits/men/80.jpg', 'https://randomuser.me/api/portraits/men/80.jpg', true, true)
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.photos (user_id, storage_path, thumbnail_path, is_primary, is_approved)
VALUES ('00000000-0000-4000-a000-000000000050', 'https://randomuser.me/api/portraits/women/81.jpg', 'https://randomuser.me/api/portraits/women/81.jpg', true, true)
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.photos (user_id, storage_path, thumbnail_path, is_primary, is_approved)
VALUES ('00000000-0000-4000-a000-000000000051', 'https://randomuser.me/api/portraits/men/82.jpg', 'https://randomuser.me/api/portraits/men/82.jpg', true, true)
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.photos (user_id, storage_path, thumbnail_path, is_primary, is_approved)
VALUES ('00000000-0000-4000-a000-000000000052', 'https://randomuser.me/api/portraits/women/83.jpg', 'https://randomuser.me/api/portraits/women/83.jpg', true, true)
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.photos (user_id, storage_path, thumbnail_path, is_primary, is_approved)
VALUES ('00000000-0000-4000-a000-000000000053', 'https://randomuser.me/api/portraits/men/84.jpg', 'https://randomuser.me/api/portraits/men/84.jpg', true, true)
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.photos (user_id, storage_path, thumbnail_path, is_primary, is_approved)
VALUES ('00000000-0000-4000-a000-000000000054', 'https://randomuser.me/api/portraits/women/85.jpg', 'https://randomuser.me/api/portraits/women/85.jpg', true, true)
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.photos (user_id, storage_path, thumbnail_path, is_primary, is_approved)
VALUES ('00000000-0000-4000-a000-000000000055', 'https://randomuser.me/api/portraits/men/86.jpg', 'https://randomuser.me/api/portraits/men/86.jpg', true, true)
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.photos (user_id, storage_path, thumbnail_path, is_primary, is_approved)
VALUES ('00000000-0000-4000-a000-000000000056', 'https://randomuser.me/api/portraits/women/87.jpg', 'https://randomuser.me/api/portraits/women/87.jpg', true, true)
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.photos (user_id, storage_path, thumbnail_path, is_primary, is_approved)
VALUES ('00000000-0000-4000-a000-000000000057', 'https://randomuser.me/api/portraits/men/88.jpg', 'https://randomuser.me/api/portraits/men/88.jpg', true, true)
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.photos (user_id, storage_path, thumbnail_path, is_primary, is_approved)
VALUES ('00000000-0000-4000-a000-000000000058', 'https://randomuser.me/api/portraits/women/89.jpg', 'https://randomuser.me/api/portraits/women/89.jpg', true, true)
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.photos (user_id, storage_path, thumbnail_path, is_primary, is_approved)
VALUES ('00000000-0000-4000-a000-000000000059', 'https://randomuser.me/api/portraits/men/90.jpg', 'https://randomuser.me/api/portraits/men/90.jpg', true, true)
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.photos (user_id, storage_path, thumbnail_path, is_primary, is_approved)
VALUES ('00000000-0000-4000-a000-00000000005a', 'https://randomuser.me/api/portraits/women/91.jpg', 'https://randomuser.me/api/portraits/women/91.jpg', true, true)
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.photos (user_id, storage_path, thumbnail_path, is_primary, is_approved)
VALUES ('00000000-0000-4000-a000-00000000005b', 'https://randomuser.me/api/portraits/men/92.jpg', 'https://randomuser.me/api/portraits/men/92.jpg', true, true)
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.photos (user_id, storage_path, thumbnail_path, is_primary, is_approved)
VALUES ('00000000-0000-4000-a000-00000000005c', 'https://randomuser.me/api/portraits/women/93.jpg', 'https://randomuser.me/api/portraits/women/93.jpg', true, true)
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.photos (user_id, storage_path, thumbnail_path, is_primary, is_approved)
VALUES ('00000000-0000-4000-a000-00000000005d', 'https://randomuser.me/api/portraits/men/94.jpg', 'https://randomuser.me/api/portraits/men/94.jpg', true, true)
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.photos (user_id, storage_path, thumbnail_path, is_primary, is_approved)
VALUES ('00000000-0000-4000-a000-00000000005e', 'https://randomuser.me/api/portraits/women/95.jpg', 'https://randomuser.me/api/portraits/women/95.jpg', true, true)
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.photos (user_id, storage_path, thumbnail_path, is_primary, is_approved)
VALUES ('00000000-0000-4000-a000-00000000005f', 'https://randomuser.me/api/portraits/men/96.jpg', 'https://randomuser.me/api/portraits/men/96.jpg', true, true)
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.photos (user_id, storage_path, thumbnail_path, is_primary, is_approved)
VALUES ('00000000-0000-4000-a000-000000000060', 'https://randomuser.me/api/portraits/women/97.jpg', 'https://randomuser.me/api/portraits/women/97.jpg', true, true)
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.photos (user_id, storage_path, thumbnail_path, is_primary, is_approved)
VALUES ('00000000-0000-4000-a000-000000000061', 'https://randomuser.me/api/portraits/men/98.jpg', 'https://randomuser.me/api/portraits/men/98.jpg', true, true)
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.photos (user_id, storage_path, thumbnail_path, is_primary, is_approved)
VALUES ('00000000-0000-4000-a000-000000000062', 'https://randomuser.me/api/portraits/women/99.jpg', 'https://randomuser.me/api/portraits/women/99.jpg', true, true)
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.photos (user_id, storage_path, thumbnail_path, is_primary, is_approved)
VALUES ('00000000-0000-4000-a000-000000000063', 'https://randomuser.me/api/portraits/men/1.jpg', 'https://randomuser.me/api/portraits/men/1.jpg', true, true)
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.photos (user_id, storage_path, thumbnail_path, is_primary, is_approved)
VALUES ('00000000-0000-4000-a000-000000000064', 'https://randomuser.me/api/portraits/women/2.jpg', 'https://randomuser.me/api/portraits/women/2.jpg', true, true)
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.photos (user_id, storage_path, thumbnail_path, is_primary, is_approved)
VALUES ('00000000-0000-4000-a000-000000000065', 'https://randomuser.me/api/portraits/men/3.jpg', 'https://randomuser.me/api/portraits/men/3.jpg', true, true)
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.photos (user_id, storage_path, thumbnail_path, is_primary, is_approved)
VALUES ('00000000-0000-4000-a000-000000000066', 'https://randomuser.me/api/portraits/women/4.jpg', 'https://randomuser.me/api/portraits/women/4.jpg', true, true)
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.photos (user_id, storage_path, thumbnail_path, is_primary, is_approved)
VALUES ('00000000-0000-4000-a000-000000000067', 'https://randomuser.me/api/portraits/men/5.jpg', 'https://randomuser.me/api/portraits/men/5.jpg', true, true)
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.photos (user_id, storage_path, thumbnail_path, is_primary, is_approved)
VALUES ('00000000-0000-4000-a000-000000000068', 'https://randomuser.me/api/portraits/women/6.jpg', 'https://randomuser.me/api/portraits/women/6.jpg', true, true)
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.photos (user_id, storage_path, thumbnail_path, is_primary, is_approved)
VALUES ('00000000-0000-4000-a000-000000000069', 'https://randomuser.me/api/portraits/men/7.jpg', 'https://randomuser.me/api/portraits/men/7.jpg', true, true)
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.photos (user_id, storage_path, thumbnail_path, is_primary, is_approved)
VALUES ('00000000-0000-4000-a000-00000000006a', 'https://randomuser.me/api/portraits/women/8.jpg', 'https://randomuser.me/api/portraits/women/8.jpg', true, true)
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.photos (user_id, storage_path, thumbnail_path, is_primary, is_approved)
VALUES ('00000000-0000-4000-a000-00000000006b', 'https://randomuser.me/api/portraits/men/9.jpg', 'https://randomuser.me/api/portraits/men/9.jpg', true, true)
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.photos (user_id, storage_path, thumbnail_path, is_primary, is_approved)
VALUES ('00000000-0000-4000-a000-00000000006c', 'https://randomuser.me/api/portraits/women/10.jpg', 'https://randomuser.me/api/portraits/women/10.jpg', true, true)
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.photos (user_id, storage_path, thumbnail_path, is_primary, is_approved)
VALUES ('00000000-0000-4000-a000-00000000006d', 'https://randomuser.me/api/portraits/men/11.jpg', 'https://randomuser.me/api/portraits/men/11.jpg', true, true)
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.photos (user_id, storage_path, thumbnail_path, is_primary, is_approved)
VALUES ('00000000-0000-4000-a000-00000000006e', 'https://randomuser.me/api/portraits/women/12.jpg', 'https://randomuser.me/api/portraits/women/12.jpg', true, true)
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.photos (user_id, storage_path, thumbnail_path, is_primary, is_approved)
VALUES ('00000000-0000-4000-a000-00000000006f', 'https://randomuser.me/api/portraits/men/13.jpg', 'https://randomuser.me/api/portraits/men/13.jpg', true, true)
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.photos (user_id, storage_path, thumbnail_path, is_primary, is_approved)
VALUES ('00000000-0000-4000-a000-000000000070', 'https://randomuser.me/api/portraits/women/14.jpg', 'https://randomuser.me/api/portraits/women/14.jpg', true, true)
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.photos (user_id, storage_path, thumbnail_path, is_primary, is_approved)
VALUES ('00000000-0000-4000-a000-000000000071', 'https://randomuser.me/api/portraits/men/15.jpg', 'https://randomuser.me/api/portraits/men/15.jpg', true, true)
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.photos (user_id, storage_path, thumbnail_path, is_primary, is_approved)
VALUES ('00000000-0000-4000-a000-000000000072', 'https://randomuser.me/api/portraits/women/16.jpg', 'https://randomuser.me/api/portraits/women/16.jpg', true, true)
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.photos (user_id, storage_path, thumbnail_path, is_primary, is_approved)
VALUES ('00000000-0000-4000-a000-000000000073', 'https://randomuser.me/api/portraits/men/17.jpg', 'https://randomuser.me/api/portraits/men/17.jpg', true, true)
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.photos (user_id, storage_path, thumbnail_path, is_primary, is_approved)
VALUES ('00000000-0000-4000-a000-000000000074', 'https://randomuser.me/api/portraits/women/18.jpg', 'https://randomuser.me/api/portraits/women/18.jpg', true, true)
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.photos (user_id, storage_path, thumbnail_path, is_primary, is_approved)
VALUES ('00000000-0000-4000-a000-000000000075', 'https://randomuser.me/api/portraits/men/19.jpg', 'https://randomuser.me/api/portraits/men/19.jpg', true, true)
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.photos (user_id, storage_path, thumbnail_path, is_primary, is_approved)
VALUES ('00000000-0000-4000-a000-000000000076', 'https://randomuser.me/api/portraits/women/20.jpg', 'https://randomuser.me/api/portraits/women/20.jpg', true, true)
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.photos (user_id, storage_path, thumbnail_path, is_primary, is_approved)
VALUES ('00000000-0000-4000-a000-000000000077', 'https://randomuser.me/api/portraits/men/21.jpg', 'https://randomuser.me/api/portraits/men/21.jpg', true, true)
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.photos (user_id, storage_path, thumbnail_path, is_primary, is_approved)
VALUES ('00000000-0000-4000-a000-000000000078', 'https://randomuser.me/api/portraits/women/22.jpg', 'https://randomuser.me/api/portraits/women/22.jpg', true, true)
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.photos (user_id, storage_path, thumbnail_path, is_primary, is_approved)
VALUES ('00000000-0000-4000-a000-000000000079', 'https://randomuser.me/api/portraits/men/23.jpg', 'https://randomuser.me/api/portraits/men/23.jpg', true, true)
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.photos (user_id, storage_path, thumbnail_path, is_primary, is_approved)
VALUES ('00000000-0000-4000-a000-00000000007a', 'https://randomuser.me/api/portraits/women/24.jpg', 'https://randomuser.me/api/portraits/women/24.jpg', true, true)
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.photos (user_id, storage_path, thumbnail_path, is_primary, is_approved)
VALUES ('00000000-0000-4000-a000-00000000007b', 'https://randomuser.me/api/portraits/men/25.jpg', 'https://randomuser.me/api/portraits/men/25.jpg', true, true)
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.photos (user_id, storage_path, thumbnail_path, is_primary, is_approved)
VALUES ('00000000-0000-4000-a000-00000000007c', 'https://randomuser.me/api/portraits/women/26.jpg', 'https://randomuser.me/api/portraits/women/26.jpg', true, true)
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.photos (user_id, storage_path, thumbnail_path, is_primary, is_approved)
VALUES ('00000000-0000-4000-a000-00000000007d', 'https://randomuser.me/api/portraits/men/27.jpg', 'https://randomuser.me/api/portraits/men/27.jpg', true, true)
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.photos (user_id, storage_path, thumbnail_path, is_primary, is_approved)
VALUES ('00000000-0000-4000-a000-00000000007e', 'https://randomuser.me/api/portraits/women/28.jpg', 'https://randomuser.me/api/portraits/women/28.jpg', true, true)
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.photos (user_id, storage_path, thumbnail_path, is_primary, is_approved)
VALUES ('00000000-0000-4000-a000-00000000007f', 'https://randomuser.me/api/portraits/men/29.jpg', 'https://randomuser.me/api/portraits/men/29.jpg', true, true)
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.photos (user_id, storage_path, thumbnail_path, is_primary, is_approved)
VALUES ('00000000-0000-4000-a000-000000000080', 'https://randomuser.me/api/portraits/women/30.jpg', 'https://randomuser.me/api/portraits/women/30.jpg', true, true)
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.photos (user_id, storage_path, thumbnail_path, is_primary, is_approved)
VALUES ('00000000-0000-4000-a000-000000000081', 'https://randomuser.me/api/portraits/men/31.jpg', 'https://randomuser.me/api/portraits/men/31.jpg', true, true)
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.photos (user_id, storage_path, thumbnail_path, is_primary, is_approved)
VALUES ('00000000-0000-4000-a000-000000000082', 'https://randomuser.me/api/portraits/women/32.jpg', 'https://randomuser.me/api/portraits/women/32.jpg', true, true)
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.photos (user_id, storage_path, thumbnail_path, is_primary, is_approved)
VALUES ('00000000-0000-4000-a000-000000000083', 'https://randomuser.me/api/portraits/men/33.jpg', 'https://randomuser.me/api/portraits/men/33.jpg', true, true)
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.photos (user_id, storage_path, thumbnail_path, is_primary, is_approved)
VALUES ('00000000-0000-4000-a000-000000000084', 'https://randomuser.me/api/portraits/women/34.jpg', 'https://randomuser.me/api/portraits/women/34.jpg', true, true)
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.photos (user_id, storage_path, thumbnail_path, is_primary, is_approved)
VALUES ('00000000-0000-4000-a000-000000000085', 'https://randomuser.me/api/portraits/men/35.jpg', 'https://randomuser.me/api/portraits/men/35.jpg', true, true)
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.photos (user_id, storage_path, thumbnail_path, is_primary, is_approved)
VALUES ('00000000-0000-4000-a000-000000000086', 'https://randomuser.me/api/portraits/women/36.jpg', 'https://randomuser.me/api/portraits/women/36.jpg', true, true)
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.photos (user_id, storage_path, thumbnail_path, is_primary, is_approved)
VALUES ('00000000-0000-4000-a000-000000000087', 'https://randomuser.me/api/portraits/men/37.jpg', 'https://randomuser.me/api/portraits/men/37.jpg', true, true)
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.photos (user_id, storage_path, thumbnail_path, is_primary, is_approved)
VALUES ('00000000-0000-4000-a000-000000000088', 'https://randomuser.me/api/portraits/women/38.jpg', 'https://randomuser.me/api/portraits/women/38.jpg', true, true)
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.photos (user_id, storage_path, thumbnail_path, is_primary, is_approved)
VALUES ('00000000-0000-4000-a000-000000000089', 'https://randomuser.me/api/portraits/men/39.jpg', 'https://randomuser.me/api/portraits/men/39.jpg', true, true)
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.photos (user_id, storage_path, thumbnail_path, is_primary, is_approved)
VALUES ('00000000-0000-4000-a000-00000000008a', 'https://randomuser.me/api/portraits/women/40.jpg', 'https://randomuser.me/api/portraits/women/40.jpg', true, true)
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.photos (user_id, storage_path, thumbnail_path, is_primary, is_approved)
VALUES ('00000000-0000-4000-a000-00000000008b', 'https://randomuser.me/api/portraits/men/41.jpg', 'https://randomuser.me/api/portraits/men/41.jpg', true, true)
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.photos (user_id, storage_path, thumbnail_path, is_primary, is_approved)
VALUES ('00000000-0000-4000-a000-00000000008c', 'https://randomuser.me/api/portraits/women/42.jpg', 'https://randomuser.me/api/portraits/women/42.jpg', true, true)
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.photos (user_id, storage_path, thumbnail_path, is_primary, is_approved)
VALUES ('00000000-0000-4000-a000-00000000008d', 'https://randomuser.me/api/portraits/men/43.jpg', 'https://randomuser.me/api/portraits/men/43.jpg', true, true)
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.photos (user_id, storage_path, thumbnail_path, is_primary, is_approved)
VALUES ('00000000-0000-4000-a000-00000000008e', 'https://randomuser.me/api/portraits/women/44.jpg', 'https://randomuser.me/api/portraits/women/44.jpg', true, true)
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.photos (user_id, storage_path, thumbnail_path, is_primary, is_approved)
VALUES ('00000000-0000-4000-a000-00000000008f', 'https://randomuser.me/api/portraits/men/45.jpg', 'https://randomuser.me/api/portraits/men/45.jpg', true, true)
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.photos (user_id, storage_path, thumbnail_path, is_primary, is_approved)
VALUES ('00000000-0000-4000-a000-000000000090', 'https://randomuser.me/api/portraits/women/46.jpg', 'https://randomuser.me/api/portraits/women/46.jpg', true, true)
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.photos (user_id, storage_path, thumbnail_path, is_primary, is_approved)
VALUES ('00000000-0000-4000-a000-000000000091', 'https://randomuser.me/api/portraits/men/47.jpg', 'https://randomuser.me/api/portraits/men/47.jpg', true, true)
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.photos (user_id, storage_path, thumbnail_path, is_primary, is_approved)
VALUES ('00000000-0000-4000-a000-000000000092', 'https://randomuser.me/api/portraits/women/48.jpg', 'https://randomuser.me/api/portraits/women/48.jpg', true, true)
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.photos (user_id, storage_path, thumbnail_path, is_primary, is_approved)
VALUES ('00000000-0000-4000-a000-000000000093', 'https://randomuser.me/api/portraits/men/49.jpg', 'https://randomuser.me/api/portraits/men/49.jpg', true, true)
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.photos (user_id, storage_path, thumbnail_path, is_primary, is_approved)
VALUES ('00000000-0000-4000-a000-000000000094', 'https://randomuser.me/api/portraits/women/50.jpg', 'https://randomuser.me/api/portraits/women/50.jpg', true, true)
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.photos (user_id, storage_path, thumbnail_path, is_primary, is_approved)
VALUES ('00000000-0000-4000-a000-000000000095', 'https://randomuser.me/api/portraits/men/51.jpg', 'https://randomuser.me/api/portraits/men/51.jpg', true, true)
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.photos (user_id, storage_path, thumbnail_path, is_primary, is_approved)
VALUES ('00000000-0000-4000-a000-000000000096', 'https://randomuser.me/api/portraits/women/52.jpg', 'https://randomuser.me/api/portraits/women/52.jpg', true, true)
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.photos (user_id, storage_path, thumbnail_path, is_primary, is_approved)
VALUES ('00000000-0000-4000-a000-000000000097', 'https://randomuser.me/api/portraits/men/53.jpg', 'https://randomuser.me/api/portraits/men/53.jpg', true, true)
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.photos (user_id, storage_path, thumbnail_path, is_primary, is_approved)
VALUES ('00000000-0000-4000-a000-000000000098', 'https://randomuser.me/api/portraits/women/54.jpg', 'https://randomuser.me/api/portraits/women/54.jpg', true, true)
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.photos (user_id, storage_path, thumbnail_path, is_primary, is_approved)
VALUES ('00000000-0000-4000-a000-000000000099', 'https://randomuser.me/api/portraits/men/55.jpg', 'https://randomuser.me/api/portraits/men/55.jpg', true, true)
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.photos (user_id, storage_path, thumbnail_path, is_primary, is_approved)
VALUES ('00000000-0000-4000-a000-00000000009a', 'https://randomuser.me/api/portraits/women/56.jpg', 'https://randomuser.me/api/portraits/women/56.jpg', true, true)
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.photos (user_id, storage_path, thumbnail_path, is_primary, is_approved)
VALUES ('00000000-0000-4000-a000-00000000009b', 'https://randomuser.me/api/portraits/men/57.jpg', 'https://randomuser.me/api/portraits/men/57.jpg', true, true)
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.photos (user_id, storage_path, thumbnail_path, is_primary, is_approved)
VALUES ('00000000-0000-4000-a000-00000000009c', 'https://randomuser.me/api/portraits/women/58.jpg', 'https://randomuser.me/api/portraits/women/58.jpg', true, true)
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.photos (user_id, storage_path, thumbnail_path, is_primary, is_approved)
VALUES ('00000000-0000-4000-a000-00000000009d', 'https://randomuser.me/api/portraits/men/59.jpg', 'https://randomuser.me/api/portraits/men/59.jpg', true, true)
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.photos (user_id, storage_path, thumbnail_path, is_primary, is_approved)
VALUES ('00000000-0000-4000-a000-00000000009e', 'https://randomuser.me/api/portraits/women/60.jpg', 'https://randomuser.me/api/portraits/women/60.jpg', true, true)
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.photos (user_id, storage_path, thumbnail_path, is_primary, is_approved)
VALUES ('00000000-0000-4000-a000-00000000009f', 'https://randomuser.me/api/portraits/men/61.jpg', 'https://randomuser.me/api/portraits/men/61.jpg', true, true)
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.photos (user_id, storage_path, thumbnail_path, is_primary, is_approved)
VALUES ('00000000-0000-4000-a000-0000000000a0', 'https://randomuser.me/api/portraits/women/62.jpg', 'https://randomuser.me/api/portraits/women/62.jpg', true, true)
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.photos (user_id, storage_path, thumbnail_path, is_primary, is_approved)
VALUES ('00000000-0000-4000-a000-0000000000a1', 'https://randomuser.me/api/portraits/men/63.jpg', 'https://randomuser.me/api/portraits/men/63.jpg', true, true)
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.photos (user_id, storage_path, thumbnail_path, is_primary, is_approved)
VALUES ('00000000-0000-4000-a000-0000000000a2', 'https://randomuser.me/api/portraits/women/64.jpg', 'https://randomuser.me/api/portraits/women/64.jpg', true, true)
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.photos (user_id, storage_path, thumbnail_path, is_primary, is_approved)
VALUES ('00000000-0000-4000-a000-0000000000a3', 'https://randomuser.me/api/portraits/men/65.jpg', 'https://randomuser.me/api/portraits/men/65.jpg', true, true)
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.photos (user_id, storage_path, thumbnail_path, is_primary, is_approved)
VALUES ('00000000-0000-4000-a000-0000000000a4', 'https://randomuser.me/api/portraits/women/66.jpg', 'https://randomuser.me/api/portraits/women/66.jpg', true, true)
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.photos (user_id, storage_path, thumbnail_path, is_primary, is_approved)
VALUES ('00000000-0000-4000-a000-0000000000a5', 'https://randomuser.me/api/portraits/men/67.jpg', 'https://randomuser.me/api/portraits/men/67.jpg', true, true)
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.photos (user_id, storage_path, thumbnail_path, is_primary, is_approved)
VALUES ('00000000-0000-4000-a000-0000000000a6', 'https://randomuser.me/api/portraits/women/68.jpg', 'https://randomuser.me/api/portraits/women/68.jpg', true, true)
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.photos (user_id, storage_path, thumbnail_path, is_primary, is_approved)
VALUES ('00000000-0000-4000-a000-0000000000a7', 'https://randomuser.me/api/portraits/men/69.jpg', 'https://randomuser.me/api/portraits/men/69.jpg', true, true)
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.photos (user_id, storage_path, thumbnail_path, is_primary, is_approved)
VALUES ('00000000-0000-4000-a000-0000000000a8', 'https://randomuser.me/api/portraits/women/70.jpg', 'https://randomuser.me/api/portraits/women/70.jpg', true, true)
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.photos (user_id, storage_path, thumbnail_path, is_primary, is_approved)
VALUES ('00000000-0000-4000-a000-0000000000a9', 'https://randomuser.me/api/portraits/men/71.jpg', 'https://randomuser.me/api/portraits/men/71.jpg', true, true)
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.photos (user_id, storage_path, thumbnail_path, is_primary, is_approved)
VALUES ('00000000-0000-4000-a000-0000000000aa', 'https://randomuser.me/api/portraits/women/72.jpg', 'https://randomuser.me/api/portraits/women/72.jpg', true, true)
ON CONFLICT (id) DO NOTHING;

COMMIT;
