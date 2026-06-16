-- ============================================================
-- Wedring Matrimony — Seeding Ecosystem (Part 1)
-- ============================================================

CREATE EXTENSION IF NOT EXISTS pgcrypto;

BEGIN;

-- CLEAN existing seed records to avoid conflicts
DELETE FROM public.interests WHERE message LIKE '%connect%';
DELETE FROM public.subscriptions WHERE razorpay_payment_id LIKE 'pay_mock_%';
DELETE FROM public.photos WHERE storage_path LIKE '%randomuser.me%';
DELETE FROM public.horoscope_details WHERE gothram IN ('Siva', 'Vishnu', 'Murugan', 'Bharadwaj', 'Kasyapa', 'Vashishta', 'Agastya', 'Viswamitra', 'Gautama', 'Atri', 'Angirasa', 'Harita');
DELETE FROM public.partner_preferences WHERE user_id IN (SELECT id FROM public.profiles WHERE display_name LIKE '%Kumar%' OR display_name LIKE '%Raj%' OR display_name LIKE '%Sundaram%' OR display_name LIKE '%Selvan%');
DELETE FROM public.profiles WHERE profile_id LIKE 'TM%';

-- 1. AUTH USERS INSERTIONS
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-000000000001', 'tamiluser1@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Karthik Pandian"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-000000000002', 'tamiluser2@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Pavithra Pandian"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-000000000003', 'tamiluser3@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Muthu Moorthy"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-000000000004', 'tamiluser4@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Shalini Selvan"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-000000000005', 'tamiluser5@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Murugan Velan"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-000000000006', 'tamiluser6@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Kavitha Pandian"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-000000000007', 'tamiluser7@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Karthik Krishnan"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-000000000008', 'tamiluser8@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Rajeshwari Swamy"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-000000000009', 'tamiluser9@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Ramesh Gopal"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-00000000000a', 'tamiluser10@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Nivedha Shankar"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-00000000000b', 'tamiluser11@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Saravanan Swamy"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-00000000000c', 'tamiluser12@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Lakshmi Naicker"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-00000000000d', 'tamiluser13@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Karthik Mani"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-00000000000e', 'tamiluser14@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Anitha Pandian"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-00000000000f', 'tamiluser15@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Dinesh Nathan"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-000000000010', 'tamiluser16@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Rajeshwari Raman"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-000000000011', 'tamiluser17@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Vignesh Kumar"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-000000000012', 'tamiluser18@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Gowri Selvan"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-000000000013', 'tamiluser19@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Vignesh Moorthy"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-000000000014', 'tamiluser20@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Preethi Devan"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-000000000015', 'tamiluser21@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Siddharth Sundaram"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-000000000016', 'tamiluser22@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Divya Velan"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-000000000017', 'tamiluser23@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Chinnasamy Samy"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-000000000018', 'tamiluser24@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Banumathi Samy"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-000000000019', 'tamiluser25@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Chinnasamy Sundaram"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-00000000001a', 'tamiluser26@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Vidya Nathan"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-00000000001b', 'tamiluser27@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Sakthi Selvan"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-00000000001c', 'tamiluser28@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Abirami Samy"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-00000000001d', 'tamiluser29@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Anbarasan Swamy"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-00000000001e', 'tamiluser30@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Keerthana Lingam"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-00000000001f', 'tamiluser31@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Kannan Mani"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-000000000020', 'tamiluser32@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Rekha Devan"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-000000000021', 'tamiluser33@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Surya Krishnan"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-000000000022', 'tamiluser34@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Lakshmi Kumar"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-000000000023', 'tamiluser35@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Sathish Krishnan"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-000000000024', 'tamiluser36@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Ramani Balan"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-000000000025', 'tamiluser37@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Vignesh Raman"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-000000000026', 'tamiluser38@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Vidya Murthy"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-000000000027', 'tamiluser39@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Sundar Selvan"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-000000000028', 'tamiluser40@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Radha Sundaram"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-000000000029', 'tamiluser41@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Jeeva Samy"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-00000000002a', 'tamiluser42@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Megala Moorthy"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-00000000002b', 'tamiluser43@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Siva Raman"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-00000000002c', 'tamiluser44@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Anitha Raj"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-00000000002d', 'tamiluser45@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Bala Swamy"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-00000000002e', 'tamiluser46@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Sowmya Moorthy"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-00000000002f', 'tamiluser47@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Kannan Gopal"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-000000000030', 'tamiluser48@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Geetha Murthy"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-000000000031', 'tamiluser49@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Gautham Raman"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-000000000032', 'tamiluser50@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Shalini Nathan"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-000000000033', 'tamiluser51@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Kabilan Kumar"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-000000000034', 'tamiluser52@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Radha Nathan"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-000000000035', 'tamiluser53@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Naveen Samy"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-000000000036', 'tamiluser54@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Divya Sundaram"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-000000000037', 'tamiluser55@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Dinesh Nathan"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-000000000038', 'tamiluser56@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Shalini Kumar"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-000000000039', 'tamiluser57@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Jayakumar Naicker"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-00000000003a', 'tamiluser58@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Swetha Velan"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-00000000003b', 'tamiluser59@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Anand Selvan"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-00000000003c', 'tamiluser60@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Gayathri Nathan"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-00000000003d', 'tamiluser61@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Anand Devan"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-00000000003e', 'tamiluser62@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Nandhini Pandian"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-00000000003f', 'tamiluser63@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Kannan Samy"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-000000000040', 'tamiluser64@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Deepa Swamy"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-000000000041', 'tamiluser65@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Jayakumar Lingam"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-000000000042', 'tamiluser66@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Radha Swamy"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-000000000043', 'tamiluser67@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Prabhu Sundaram"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-000000000044', 'tamiluser68@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Soundarya Sundaram"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-000000000045', 'tamiluser69@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Aravind Raman"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-000000000046', 'tamiluser70@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Dharshini Nathan"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-000000000047', 'tamiluser71@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Karthik Nathan"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-000000000048', 'tamiluser72@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Vijaya Krishnan"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-000000000049', 'tamiluser73@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Sakthi Murthy"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-00000000004a', 'tamiluser74@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Nandhini Swamy"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-00000000004b', 'tamiluser75@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Karthik Naicker"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-00000000004c', 'tamiluser76@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Megala Mani"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-00000000004d', 'tamiluser77@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Surya Devan"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-00000000004e', 'tamiluser78@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Kavitha Nathan"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-00000000004f', 'tamiluser79@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Anbarasan Kumar"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-000000000050', 'tamiluser80@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Ponmani Velan"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-000000000051', 'tamiluser81@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Anbarasan Gopal"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-000000000052', 'tamiluser82@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Malathi Kumar"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-000000000053', 'tamiluser83@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Surya Raj"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-000000000054', 'tamiluser84@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Malarvizhi Raj"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-000000000055', 'tamiluser85@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Srinivasan Murthy"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-000000000056', 'tamiluser86@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Nandhini Pandian"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-000000000057', 'tamiluser87@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Bala Murthy"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-000000000058', 'tamiluser88@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Gowri Naicker"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-000000000059', 'tamiluser89@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Elango Devan"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-00000000005a', 'tamiluser90@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Pooja Raj"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-00000000005b', 'tamiluser91@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Selvam Nathan"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-00000000005c', 'tamiluser92@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Radha Raj"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-00000000005d', 'tamiluser93@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Siddharth Naicker"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-00000000005e', 'tamiluser94@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Vanitha Kumar"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-00000000005f', 'tamiluser95@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Sundar Balan"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-000000000060', 'tamiluser96@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Radha Gopal"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-000000000061', 'tamiluser97@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Vetrivel Moorthy"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-000000000062', 'tamiluser98@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Nandhini Kumar"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-000000000063', 'tamiluser99@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Prabhu Raman"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-000000000064', 'tamiluser100@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Lakshmi Murthy"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-000000000065', 'tamiluser101@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Elango Pandian"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-000000000066', 'tamiluser102@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Sowmya Nathan"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-000000000067', 'tamiluser103@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Elango Pandian"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-000000000068', 'tamiluser104@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Ramya Swamy"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-000000000069', 'tamiluser105@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Kannan Raj"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-00000000006a', 'tamiluser106@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Deepa Murthy"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-00000000006b', 'tamiluser107@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Jeeva Pandian"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-00000000006c', 'tamiluser108@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Soundarya Nathan"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-00000000006d', 'tamiluser109@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Prakash Raman"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-00000000006e', 'tamiluser110@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Saraswathi Lingam"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-00000000006f', 'tamiluser111@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Murugan Gopal"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-000000000070', 'tamiluser112@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Swetha Velan"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-000000000071', 'tamiluser113@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Elango Moorthy"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-000000000072', 'tamiluser114@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Abirami Moorthy"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-000000000073', 'tamiluser115@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Ajith Raman"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-000000000074', 'tamiluser116@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Vanitha Naicker"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-000000000075', 'tamiluser117@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Siva Lingam"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-000000000076', 'tamiluser118@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Anitha Shankar"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-000000000077', 'tamiluser119@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Vijay Nathan"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-000000000078', 'tamiluser120@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Oviya Selvan"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-000000000079', 'tamiluser121@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Aravind Krishnan"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-00000000007a', 'tamiluser122@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Lakshmi Devan"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-00000000007b', 'tamiluser123@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Naveen Raman"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-00000000007c', 'tamiluser124@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Shanthi Naicker"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-00000000007d', 'tamiluser125@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Anand Samy"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-00000000007e', 'tamiluser126@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Indhumathi Raman"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-00000000007f', 'tamiluser127@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Sakthi Kumar"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-000000000080', 'tamiluser128@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Janani Sundaram"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-000000000081', 'tamiluser129@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Ganesan Naicker"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-000000000082', 'tamiluser130@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Anitha Swamy"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-000000000083', 'tamiluser131@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Gautham Kumar"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-000000000084', 'tamiluser132@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Vidya Mani"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-000000000085', 'tamiluser133@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Thirumal Balan"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-000000000086', 'tamiluser134@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Indhumathi Balan"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-000000000087', 'tamiluser135@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Sundar Murthy"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-000000000088', 'tamiluser136@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Gayathri Selvan"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-000000000089', 'tamiluser137@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Karthik Devan"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-00000000008a', 'tamiluser138@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Priya Samy"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-00000000008b', 'tamiluser139@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Velmurugan Swamy"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-00000000008c', 'tamiluser140@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Megala Devan"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-00000000008d', 'tamiluser141@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Saravanan Gopal"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-00000000008e', 'tamiluser142@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Vanitha Lingam"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-00000000008f', 'tamiluser143@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Anbarasan Gopal"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-000000000090', 'tamiluser144@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Gowri Swamy"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-000000000091', 'tamiluser145@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Rajesh Mani"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-000000000092', 'tamiluser146@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Kokila Kumar"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-000000000093', 'tamiluser147@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Bala Lingam"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-000000000094', 'tamiluser148@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Keerthana Devan"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-000000000095', 'tamiluser149@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Suresh Raman"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-000000000096', 'tamiluser150@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Divya Sundaram"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-000000000097', 'tamiluser151@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Murugan Samy"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-000000000098', 'tamiluser152@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Yazhini Moorthy"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-000000000099', 'tamiluser153@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Prakash Moorthy"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-00000000009a', 'tamiluser154@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Nivedha Sundaram"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-00000000009b', 'tamiluser155@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Sakthi Gopal"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-00000000009c', 'tamiluser156@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Kayalvizhi Shankar"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-00000000009d', 'tamiluser157@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Bala Sundaram"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-00000000009e', 'tamiluser158@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Priya Sundaram"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-00000000009f', 'tamiluser159@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Siddharth Pandian"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-0000000000a0', 'tamiluser160@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Vijaya Raman"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-0000000000a1', 'tamiluser161@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Dinesh Mani"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-0000000000a2', 'tamiluser162@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Vidya Balan"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-0000000000a3', 'tamiluser163@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Vinoth Velan"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-0000000000a4', 'tamiluser164@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Soundarya Swamy"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-0000000000a5', 'tamiluser165@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Elango Lingam"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-0000000000a6', 'tamiluser166@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Gayathri Naicker"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-0000000000a7', 'tamiluser167@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Bala Shankar"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-0000000000a8', 'tamiluser168@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Malathi Balan"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-0000000000a9', 'tamiluser169@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Karthik Moorthy"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-0000000000aa', 'tamiluser170@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Megala Raj"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;

-- 2. PUBLIC PROFILES INSERTIONS
INSERT INTO public.profiles (
      id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at, star, raasi, lagnam, gothram, tier, contacts_remaining, interests_remaining, food_habit, smoking, drinking
    ) VALUES (
      '00000000-0000-4000-a000-000000000001', 'TM000001', 'Karthik Pandian', 'male', '2000-05-07', 173, 'never_married', 'Hindu', 'Arunthathiyar', NULL, 'yes', 'B.E. / B.Tech', 'B.E. / B.Tech Graduate', 'Bank Manager', 'Bank Manager Details', '₹20 Lakhs+', 'Cognizant', 'Coimbatore', 'Coimbatore', 'Hi, I am Karthik. I have completed my B.E. / B.Tech and am currently working as a Bank Manager at Cognizant in Coimbatore. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'joint', 'upper_middle_class', true, false, true, 100, NOW() - INTERVAL '10 days', 'Dhanishta', 'Rishabam', 'Mithunam', 'Vishnu', 'free', 5, 5, 'vegetarian', 'no', 'no'
    ) ON CONFLICT (id) DO UPDATE SET
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
      is_verified = EXCLUDED.is_verified,
      is_premium = EXCLUDED.is_premium,
      is_profile_complete = EXCLUDED.is_profile_complete,
      profile_completion_percent = EXCLUDED.profile_completion_percent,
      last_active_at = EXCLUDED.last_active_at,
      star = EXCLUDED.star,
      raasi = EXCLUDED.raasi,
      lagnam = EXCLUDED.lagnam,
      gothram = EXCLUDED.gothram,
      tier = EXCLUDED.tier,
      contacts_remaining = EXCLUDED.contacts_remaining,
      interests_remaining = EXCLUDED.interests_remaining,
      food_habit = EXCLUDED.food_habit,
      smoking = EXCLUDED.smoking,
      drinking = EXCLUDED.drinking;
INSERT INTO public.profiles (
      id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at, star, raasi, lagnam, gothram, tier, contacts_remaining, interests_remaining, food_habit, smoking, drinking
    ) VALUES (
      '00000000-0000-4000-a000-000000000002', 'TM000002', 'Pavithra Pandian', 'female', '2001-01-23', 163, 'never_married', 'Hindu', 'Pillai', 'Pillai subcaste', 'no', 'M.A', 'M.A Graduate', 'College Professor', 'College Professor Details', '₹20 Lakhs+', 'HCL', 'Kanchipuram', 'Kanchipuram', 'Hi, I am Pavithra. I have completed my M.A and am currently working as a College Professor at HCL in Kanchipuram. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'joint', 'upper_middle_class', true, false, true, 100, NOW() - INTERVAL '9 days', 'Uttarachadha', 'Mithunam', 'Kumbam', 'Vishnu', 'free', 5, 5, 'vegetarian', 'no', 'no'
    ) ON CONFLICT (id) DO UPDATE SET
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
      is_verified = EXCLUDED.is_verified,
      is_premium = EXCLUDED.is_premium,
      is_profile_complete = EXCLUDED.is_profile_complete,
      profile_completion_percent = EXCLUDED.profile_completion_percent,
      last_active_at = EXCLUDED.last_active_at,
      star = EXCLUDED.star,
      raasi = EXCLUDED.raasi,
      lagnam = EXCLUDED.lagnam,
      gothram = EXCLUDED.gothram,
      tier = EXCLUDED.tier,
      contacts_remaining = EXCLUDED.contacts_remaining,
      interests_remaining = EXCLUDED.interests_remaining,
      food_habit = EXCLUDED.food_habit,
      smoking = EXCLUDED.smoking,
      drinking = EXCLUDED.drinking;
INSERT INTO public.profiles (
      id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at, star, raasi, lagnam, gothram, tier, contacts_remaining, interests_remaining, food_habit, smoking, drinking
    ) VALUES (
      '00000000-0000-4000-a000-000000000003', 'TM000003', 'Muthu Moorthy', 'male', '2002-05-06', 166, 'never_married', 'Hindu', 'Brahmin - Iyer', NULL, 'yes', 'M.B.B.S', 'M.B.B.S Graduate', 'Advocate', 'Advocate Details', '₹5 Lakhs - ₹7 Lakhs', 'Government Service', 'Vellore', 'Vellore', 'Hi, I am Muthu. I have completed my M.B.B.S and am currently working as a Advocate at Government Service in Vellore. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'upper_middle_class', true, true, true, 100, NOW() - INTERVAL '8 days', 'Uttaraphalguni', 'Dhanusu', 'Kumbam', 'Gautama', 'gold', 50, 100, 'vegetarian', 'no', 'no'
    ) ON CONFLICT (id) DO UPDATE SET
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
      is_verified = EXCLUDED.is_verified,
      is_premium = EXCLUDED.is_premium,
      is_profile_complete = EXCLUDED.is_profile_complete,
      profile_completion_percent = EXCLUDED.profile_completion_percent,
      last_active_at = EXCLUDED.last_active_at,
      star = EXCLUDED.star,
      raasi = EXCLUDED.raasi,
      lagnam = EXCLUDED.lagnam,
      gothram = EXCLUDED.gothram,
      tier = EXCLUDED.tier,
      contacts_remaining = EXCLUDED.contacts_remaining,
      interests_remaining = EXCLUDED.interests_remaining,
      food_habit = EXCLUDED.food_habit,
      smoking = EXCLUDED.smoking,
      drinking = EXCLUDED.drinking;
INSERT INTO public.profiles (
      id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at, star, raasi, lagnam, gothram, tier, contacts_remaining, interests_remaining, food_habit, smoking, drinking
    ) VALUES (
      '00000000-0000-4000-a000-000000000004', 'TM000004', 'Shalini Selvan', 'female', '1995-12-11', 172, 'divorced', 'Hindu', 'Kallar', 'Kallar subcaste', 'no', 'M.B.A', 'M.B.A Graduate', 'Dentist', 'Dentist Details', '₹3 Lakhs - ₹5 Lakhs', 'Self Employed', 'Salem', 'Salem', 'Hi, I am Shalini. I have completed my M.B.A and am currently working as a Dentist at Self Employed in Salem. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'middle_class', true, false, true, 100, NOW() - INTERVAL '4 days', 'Rohini', 'Rishabam', 'Simham', 'Agastya', 'free', 5, 5, 'vegetarian', 'no', 'no'
    ) ON CONFLICT (id) DO UPDATE SET
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
      is_verified = EXCLUDED.is_verified,
      is_premium = EXCLUDED.is_premium,
      is_profile_complete = EXCLUDED.is_profile_complete,
      profile_completion_percent = EXCLUDED.profile_completion_percent,
      last_active_at = EXCLUDED.last_active_at,
      star = EXCLUDED.star,
      raasi = EXCLUDED.raasi,
      lagnam = EXCLUDED.lagnam,
      gothram = EXCLUDED.gothram,
      tier = EXCLUDED.tier,
      contacts_remaining = EXCLUDED.contacts_remaining,
      interests_remaining = EXCLUDED.interests_remaining,
      food_habit = EXCLUDED.food_habit,
      smoking = EXCLUDED.smoking,
      drinking = EXCLUDED.drinking;
INSERT INTO public.profiles (
      id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at, star, raasi, lagnam, gothram, tier, contacts_remaining, interests_remaining, food_habit, smoking, drinking
    ) VALUES (
      '00000000-0000-4000-a000-000000000005', 'TM000005', 'Murugan Velan', 'male', '2000-05-15', 183, 'never_married', 'Hindu', 'Kallar', NULL, 'no', 'M.C.A', 'M.C.A Graduate', 'Auditor', 'Auditor Details', '₹20 Lakhs+', 'Zoho', 'Chennai', 'Chennai', 'Hi, I am Murugan. I have completed my M.C.A and am currently working as a Auditor at Zoho in Chennai. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'middle_class', true, false, true, 100, NOW() - INTERVAL '3 days', 'Poorvashadha', 'Kanni', 'Mesham', 'Agastya', 'free', 5, 5, 'vegetarian', 'no', 'no'
    ) ON CONFLICT (id) DO UPDATE SET
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
      is_verified = EXCLUDED.is_verified,
      is_premium = EXCLUDED.is_premium,
      is_profile_complete = EXCLUDED.is_profile_complete,
      profile_completion_percent = EXCLUDED.profile_completion_percent,
      last_active_at = EXCLUDED.last_active_at,
      star = EXCLUDED.star,
      raasi = EXCLUDED.raasi,
      lagnam = EXCLUDED.lagnam,
      gothram = EXCLUDED.gothram,
      tier = EXCLUDED.tier,
      contacts_remaining = EXCLUDED.contacts_remaining,
      interests_remaining = EXCLUDED.interests_remaining,
      food_habit = EXCLUDED.food_habit,
      smoking = EXCLUDED.smoking,
      drinking = EXCLUDED.drinking;
INSERT INTO public.profiles (
      id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at, star, raasi, lagnam, gothram, tier, contacts_remaining, interests_remaining, food_habit, smoking, drinking
    ) VALUES (
      '00000000-0000-4000-a000-000000000006', 'TM000006', 'Kavitha Pandian', 'female', '2003-08-26', 154, 'never_married', 'Hindu', 'Nadar', 'Nadar subcaste', 'yes', 'B.A', 'B.A Graduate', 'Dentist', 'Dentist Details', '₹3 Lakhs - ₹5 Lakhs', 'HCL', 'Kanchipuram', 'Kanchipuram', 'Hi, I am Kavitha. I have completed my B.A and am currently working as a Dentist at HCL in Kanchipuram. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'rich', true, false, true, 100, NOW() - INTERVAL '0 days', 'Punarvasu', 'Rishabam', 'Simham', 'Murugan', 'free', 5, 5, 'vegetarian', 'no', 'no'
    ) ON CONFLICT (id) DO UPDATE SET
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
      is_verified = EXCLUDED.is_verified,
      is_premium = EXCLUDED.is_premium,
      is_profile_complete = EXCLUDED.is_profile_complete,
      profile_completion_percent = EXCLUDED.profile_completion_percent,
      last_active_at = EXCLUDED.last_active_at,
      star = EXCLUDED.star,
      raasi = EXCLUDED.raasi,
      lagnam = EXCLUDED.lagnam,
      gothram = EXCLUDED.gothram,
      tier = EXCLUDED.tier,
      contacts_remaining = EXCLUDED.contacts_remaining,
      interests_remaining = EXCLUDED.interests_remaining,
      food_habit = EXCLUDED.food_habit,
      smoking = EXCLUDED.smoking,
      drinking = EXCLUDED.drinking;
INSERT INTO public.profiles (
      id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at, star, raasi, lagnam, gothram, tier, contacts_remaining, interests_remaining, food_habit, smoking, drinking
    ) VALUES (
      '00000000-0000-4000-a000-000000000007', 'TM000007', 'Karthik Krishnan', 'male', '1989-11-28', 179, 'divorced', 'Hindu', 'Sengunthar', NULL, 'no', 'M.B.A', 'M.B.A Graduate', 'HR Specialist', 'HR Specialist Details', '₹20 Lakhs+', 'Zoho', 'Kanchipuram', 'Kanchipuram', 'Hi, I am Karthik. I have completed my M.B.A and am currently working as a HR Specialist at Zoho in Kanchipuram. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'middle_class', true, false, true, 100, NOW() - INTERVAL '2 days', 'Uttarachadha', 'Mesham', 'Rishabam', 'Angirasa', 'free', 5, 5, 'vegetarian', 'no', 'no'
    ) ON CONFLICT (id) DO UPDATE SET
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
      is_verified = EXCLUDED.is_verified,
      is_premium = EXCLUDED.is_premium,
      is_profile_complete = EXCLUDED.is_profile_complete,
      profile_completion_percent = EXCLUDED.profile_completion_percent,
      last_active_at = EXCLUDED.last_active_at,
      star = EXCLUDED.star,
      raasi = EXCLUDED.raasi,
      lagnam = EXCLUDED.lagnam,
      gothram = EXCLUDED.gothram,
      tier = EXCLUDED.tier,
      contacts_remaining = EXCLUDED.contacts_remaining,
      interests_remaining = EXCLUDED.interests_remaining,
      food_habit = EXCLUDED.food_habit,
      smoking = EXCLUDED.smoking,
      drinking = EXCLUDED.drinking;
INSERT INTO public.profiles (
      id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at, star, raasi, lagnam, gothram, tier, contacts_remaining, interests_remaining, food_habit, smoking, drinking
    ) VALUES (
      '00000000-0000-4000-a000-000000000008', 'TM000008', 'Rajeshwari Swamy', 'female', '2001-10-07', 156, 'never_married', 'Muslim', 'Shia Muslim', NULL, 'yes', 'B.Com', 'B.Com Graduate', 'Bank Manager', 'Bank Manager Details', '₹7 Lakhs - ₹10 Lakhs', 'TCS', 'Thanjavur', 'Thanjavur', 'Hi, I am Rajeshwari. I have completed my B.Com and am currently working as a Bank Manager at TCS in Thanjavur. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'middle_class', true, false, true, 100, NOW() - INTERVAL '10 days', 'Vishakha', 'Dhanusu', 'Viruchigam', 'Angirasa', 'free', 5, 5, 'vegetarian', 'no', 'no'
    ) ON CONFLICT (id) DO UPDATE SET
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
      is_verified = EXCLUDED.is_verified,
      is_premium = EXCLUDED.is_premium,
      is_profile_complete = EXCLUDED.is_profile_complete,
      profile_completion_percent = EXCLUDED.profile_completion_percent,
      last_active_at = EXCLUDED.last_active_at,
      star = EXCLUDED.star,
      raasi = EXCLUDED.raasi,
      lagnam = EXCLUDED.lagnam,
      gothram = EXCLUDED.gothram,
      tier = EXCLUDED.tier,
      contacts_remaining = EXCLUDED.contacts_remaining,
      interests_remaining = EXCLUDED.interests_remaining,
      food_habit = EXCLUDED.food_habit,
      smoking = EXCLUDED.smoking,
      drinking = EXCLUDED.drinking;
INSERT INTO public.profiles (
      id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at, star, raasi, lagnam, gothram, tier, contacts_remaining, interests_remaining, food_habit, smoking, drinking
    ) VALUES (
      '00000000-0000-4000-a000-000000000009', 'TM000009', 'Ramesh Gopal', 'male', '2000-08-04', 175, 'divorced', 'Christian', 'Nadar Christian', 'Nadar Christian subcaste', 'no', 'M.B.A', 'M.B.A Graduate', 'Doctor', 'Doctor Details', '₹20 Lakhs+', 'Self Employed', 'Thoothukudi', 'Tuticorin', 'Hi, I am Ramesh. I have completed my M.B.A and am currently working as a Doctor at Self Employed in Thoothukudi. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'joint', 'upper_middle_class', true, false, true, 100, NOW() - INTERVAL '1 days', 'Jyeshta', 'Kanni', 'Dhanusu', 'Atri', 'free', 5, 5, 'vegetarian', 'no', 'no'
    ) ON CONFLICT (id) DO UPDATE SET
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
      is_verified = EXCLUDED.is_verified,
      is_premium = EXCLUDED.is_premium,
      is_profile_complete = EXCLUDED.is_profile_complete,
      profile_completion_percent = EXCLUDED.profile_completion_percent,
      last_active_at = EXCLUDED.last_active_at,
      star = EXCLUDED.star,
      raasi = EXCLUDED.raasi,
      lagnam = EXCLUDED.lagnam,
      gothram = EXCLUDED.gothram,
      tier = EXCLUDED.tier,
      contacts_remaining = EXCLUDED.contacts_remaining,
      interests_remaining = EXCLUDED.interests_remaining,
      food_habit = EXCLUDED.food_habit,
      smoking = EXCLUDED.smoking,
      drinking = EXCLUDED.drinking;
INSERT INTO public.profiles (
      id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at, star, raasi, lagnam, gothram, tier, contacts_remaining, interests_remaining, food_habit, smoking, drinking
    ) VALUES (
      '00000000-0000-4000-a000-00000000000a', 'TM000010', 'Nivedha Shankar', 'female', '1988-07-20', 172, 'never_married', 'Hindu', 'Mudaliar', 'Mudaliar subcaste', 'no', 'B.Com', 'B.Com Graduate', 'Government Officer', 'Government Officer Details', '₹20 Lakhs+', 'Zoho', 'Chennai', 'Chennai', 'Hi, I am Nivedha. I have completed my B.Com and am currently working as a Government Officer at Zoho in Chennai. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'upper_middle_class', true, false, true, 100, NOW() - INTERVAL '1 days', 'Krittika', 'Magaram', 'Dhanusu', 'Atri', 'free', 5, 5, 'vegetarian', 'no', 'no'
    ) ON CONFLICT (id) DO UPDATE SET
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
      is_verified = EXCLUDED.is_verified,
      is_premium = EXCLUDED.is_premium,
      is_profile_complete = EXCLUDED.is_profile_complete,
      profile_completion_percent = EXCLUDED.profile_completion_percent,
      last_active_at = EXCLUDED.last_active_at,
      star = EXCLUDED.star,
      raasi = EXCLUDED.raasi,
      lagnam = EXCLUDED.lagnam,
      gothram = EXCLUDED.gothram,
      tier = EXCLUDED.tier,
      contacts_remaining = EXCLUDED.contacts_remaining,
      interests_remaining = EXCLUDED.interests_remaining,
      food_habit = EXCLUDED.food_habit,
      smoking = EXCLUDED.smoking,
      drinking = EXCLUDED.drinking;
INSERT INTO public.profiles (
      id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at, star, raasi, lagnam, gothram, tier, contacts_remaining, interests_remaining, food_habit, smoking, drinking
    ) VALUES (
      '00000000-0000-4000-a000-00000000000b', 'TM000011', 'Saravanan Swamy', 'male', '2005-04-26', 180, 'never_married', 'Hindu', 'Thevar', NULL, 'no', 'B.E. / B.Tech', 'B.E. / B.Tech Graduate', 'Software Engineer', 'Software Engineer Details', '₹10 Lakhs - ₹15 Lakhs', 'Self Employed', 'Coimbatore', 'Coimbatore', 'Hi, I am Saravanan. I have completed my B.E. / B.Tech and am currently working as a Software Engineer at Self Employed in Coimbatore. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'rich', true, false, true, 100, NOW() - INTERVAL '5 days', 'Moola', 'Meenam', 'Kumbam', 'Vishnu', 'free', 5, 5, 'vegetarian', 'no', 'no'
    ) ON CONFLICT (id) DO UPDATE SET
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
      is_verified = EXCLUDED.is_verified,
      is_premium = EXCLUDED.is_premium,
      is_profile_complete = EXCLUDED.is_profile_complete,
      profile_completion_percent = EXCLUDED.profile_completion_percent,
      last_active_at = EXCLUDED.last_active_at,
      star = EXCLUDED.star,
      raasi = EXCLUDED.raasi,
      lagnam = EXCLUDED.lagnam,
      gothram = EXCLUDED.gothram,
      tier = EXCLUDED.tier,
      contacts_remaining = EXCLUDED.contacts_remaining,
      interests_remaining = EXCLUDED.interests_remaining,
      food_habit = EXCLUDED.food_habit,
      smoking = EXCLUDED.smoking,
      drinking = EXCLUDED.drinking;
INSERT INTO public.profiles (
      id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at, star, raasi, lagnam, gothram, tier, contacts_remaining, interests_remaining, food_habit, smoking, drinking
    ) VALUES (
      '00000000-0000-4000-a000-00000000000c', 'TM000012', 'Lakshmi Naicker', 'female', '1989-09-08', 157, 'divorced', 'Hindu', 'Kallar', NULL, 'yes', 'M.C.A', 'M.C.A Graduate', 'Doctor', 'Doctor Details', '₹10 Lakhs - ₹15 Lakhs', 'HCL', 'Chennai', 'Chennai', 'Hi, I am Lakshmi. I have completed my M.C.A and am currently working as a Doctor at HCL in Chennai. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'upper_middle_class', true, false, true, 100, NOW() - INTERVAL '1 days', 'Swati', 'Kumbam', 'Simham', 'Harita', 'free', 5, 5, 'vegetarian', 'no', 'no'
    ) ON CONFLICT (id) DO UPDATE SET
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
      is_verified = EXCLUDED.is_verified,
      is_premium = EXCLUDED.is_premium,
      is_profile_complete = EXCLUDED.is_profile_complete,
      profile_completion_percent = EXCLUDED.profile_completion_percent,
      last_active_at = EXCLUDED.last_active_at,
      star = EXCLUDED.star,
      raasi = EXCLUDED.raasi,
      lagnam = EXCLUDED.lagnam,
      gothram = EXCLUDED.gothram,
      tier = EXCLUDED.tier,
      contacts_remaining = EXCLUDED.contacts_remaining,
      interests_remaining = EXCLUDED.interests_remaining,
      food_habit = EXCLUDED.food_habit,
      smoking = EXCLUDED.smoking,
      drinking = EXCLUDED.drinking;
INSERT INTO public.profiles (
      id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at, star, raasi, lagnam, gothram, tier, contacts_remaining, interests_remaining, food_habit, smoking, drinking
    ) VALUES (
      '00000000-0000-4000-a000-00000000000d', 'TM000013', 'Karthik Mani', 'male', '1992-12-25', 180, 'divorced', 'Christian', 'Protestant Christian', 'Protestant Christian subcaste', 'no', 'B.Sc', 'B.Sc Graduate', 'Pharmacist', 'Pharmacist Details', '₹15 Lakhs - ₹20 Lakhs', 'Private Practice', 'Tirunelveli', 'Tirunelveli', 'Hi, I am Karthik. I have completed my B.Sc and am currently working as a Pharmacist at Private Practice in Tirunelveli. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'upper_middle_class', true, false, true, 100, NOW() - INTERVAL '4 days', 'Uttaraphalguni', 'Simham', 'Kumbam', 'Atri', 'free', 5, 5, 'vegetarian', 'no', 'no'
    ) ON CONFLICT (id) DO UPDATE SET
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
      is_verified = EXCLUDED.is_verified,
      is_premium = EXCLUDED.is_premium,
      is_profile_complete = EXCLUDED.is_profile_complete,
      profile_completion_percent = EXCLUDED.profile_completion_percent,
      last_active_at = EXCLUDED.last_active_at,
      star = EXCLUDED.star,
      raasi = EXCLUDED.raasi,
      lagnam = EXCLUDED.lagnam,
      gothram = EXCLUDED.gothram,
      tier = EXCLUDED.tier,
      contacts_remaining = EXCLUDED.contacts_remaining,
      interests_remaining = EXCLUDED.interests_remaining,
      food_habit = EXCLUDED.food_habit,
      smoking = EXCLUDED.smoking,
      drinking = EXCLUDED.drinking;
INSERT INTO public.profiles (
      id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at, star, raasi, lagnam, gothram, tier, contacts_remaining, interests_remaining, food_habit, smoking, drinking
    ) VALUES (
      '00000000-0000-4000-a000-00000000000e', 'TM000014', 'Anitha Pandian', 'female', '2005-05-02', 169, 'never_married', 'Hindu', 'Mudaliar', 'Mudaliar subcaste', 'no', 'M.B.B.S', 'M.B.B.S Graduate', 'Pharmacist', 'Pharmacist Details', '₹10 Lakhs - ₹15 Lakhs', 'Zoho', 'Thoothukudi', 'Tuticorin', 'Hi, I am Anitha. I have completed my M.B.B.S and am currently working as a Pharmacist at Zoho in Thoothukudi. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'middle_class', false, false, true, 100, NOW() - INTERVAL '8 days', 'Poorvabhadrapada', 'Dhanusu', 'Meenam', 'Vashishta', 'free', 5, 5, 'vegetarian', 'no', 'no'
    ) ON CONFLICT (id) DO UPDATE SET
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
      is_verified = EXCLUDED.is_verified,
      is_premium = EXCLUDED.is_premium,
      is_profile_complete = EXCLUDED.is_profile_complete,
      profile_completion_percent = EXCLUDED.profile_completion_percent,
      last_active_at = EXCLUDED.last_active_at,
      star = EXCLUDED.star,
      raasi = EXCLUDED.raasi,
      lagnam = EXCLUDED.lagnam,
      gothram = EXCLUDED.gothram,
      tier = EXCLUDED.tier,
      contacts_remaining = EXCLUDED.contacts_remaining,
      interests_remaining = EXCLUDED.interests_remaining,
      food_habit = EXCLUDED.food_habit,
      smoking = EXCLUDED.smoking,
      drinking = EXCLUDED.drinking;
INSERT INTO public.profiles (
      id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at, star, raasi, lagnam, gothram, tier, contacts_remaining, interests_remaining, food_habit, smoking, drinking
    ) VALUES (
      '00000000-0000-4000-a000-00000000000f', 'TM000015', 'Dinesh Nathan', 'male', '1988-02-26', 172, 'divorced', 'Hindu', 'Vishwakarma', NULL, 'no', 'M.Sc', 'M.Sc Graduate', 'HR Specialist', 'HR Specialist Details', '₹10 Lakhs - ₹15 Lakhs', 'TCS', 'Chennai', 'Chennai', 'Hi, I am Dinesh. I have completed my M.Sc and am currently working as a HR Specialist at TCS in Chennai. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'middle_class', false, false, true, 100, NOW() - INTERVAL '0 days', 'Poorvashadha', 'Kadagam', 'Kanni', 'Vishnu', 'free', 5, 5, 'vegetarian', 'no', 'no'
    ) ON CONFLICT (id) DO UPDATE SET
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
      is_verified = EXCLUDED.is_verified,
      is_premium = EXCLUDED.is_premium,
      is_profile_complete = EXCLUDED.is_profile_complete,
      profile_completion_percent = EXCLUDED.profile_completion_percent,
      last_active_at = EXCLUDED.last_active_at,
      star = EXCLUDED.star,
      raasi = EXCLUDED.raasi,
      lagnam = EXCLUDED.lagnam,
      gothram = EXCLUDED.gothram,
      tier = EXCLUDED.tier,
      contacts_remaining = EXCLUDED.contacts_remaining,
      interests_remaining = EXCLUDED.interests_remaining,
      food_habit = EXCLUDED.food_habit,
      smoking = EXCLUDED.smoking,
      drinking = EXCLUDED.drinking;
INSERT INTO public.profiles (
      id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at, star, raasi, lagnam, gothram, tier, contacts_remaining, interests_remaining, food_habit, smoking, drinking
    ) VALUES (
      '00000000-0000-4000-a000-000000000010', 'TM000016', 'Rajeshwari Raman', 'female', '2005-05-17', 167, 'never_married', 'Hindu', 'Naidu', NULL, 'no', 'M.C.A', 'M.C.A Graduate', 'College Professor', 'College Professor Details', '₹5 Lakhs - ₹7 Lakhs', 'Accenture', 'Kanchipuram', 'Kanchipuram', 'Hi, I am Rajeshwari. I have completed my M.C.A and am currently working as a College Professor at Accenture in Kanchipuram. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'joint', 'middle_class', false, false, true, 100, NOW() - INTERVAL '5 days', 'Dhanishta', 'Viruchigam', 'Kadagam', 'Angirasa', 'free', 5, 5, 'vegetarian', 'no', 'no'
    ) ON CONFLICT (id) DO UPDATE SET
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
      is_verified = EXCLUDED.is_verified,
      is_premium = EXCLUDED.is_premium,
      is_profile_complete = EXCLUDED.is_profile_complete,
      profile_completion_percent = EXCLUDED.profile_completion_percent,
      last_active_at = EXCLUDED.last_active_at,
      star = EXCLUDED.star,
      raasi = EXCLUDED.raasi,
      lagnam = EXCLUDED.lagnam,
      gothram = EXCLUDED.gothram,
      tier = EXCLUDED.tier,
      contacts_remaining = EXCLUDED.contacts_remaining,
      interests_remaining = EXCLUDED.interests_remaining,
      food_habit = EXCLUDED.food_habit,
      smoking = EXCLUDED.smoking,
      drinking = EXCLUDED.drinking;
INSERT INTO public.profiles (
      id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at, star, raasi, lagnam, gothram, tier, contacts_remaining, interests_remaining, food_habit, smoking, drinking
    ) VALUES (
      '00000000-0000-4000-a000-000000000011', 'TM000017', 'Vignesh Kumar', 'male', '1990-01-05', 168, 'never_married', 'Hindu', 'Naicker', NULL, 'no', 'B.Sc', 'B.Sc Graduate', 'Software Engineer', 'Software Engineer Details', '₹10 Lakhs - ₹15 Lakhs', 'Zoho', 'Erode', 'Erode', 'Hi, I am Vignesh. I have completed my B.Sc and am currently working as a Software Engineer at Zoho in Erode. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'joint', 'middle_class', false, false, true, 100, NOW() - INTERVAL '10 days', 'Rohini', 'Rishabam', 'Kadagam', 'Atri', 'free', 5, 5, 'vegetarian', 'no', 'no'
    ) ON CONFLICT (id) DO UPDATE SET
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
      is_verified = EXCLUDED.is_verified,
      is_premium = EXCLUDED.is_premium,
      is_profile_complete = EXCLUDED.is_profile_complete,
      profile_completion_percent = EXCLUDED.profile_completion_percent,
      last_active_at = EXCLUDED.last_active_at,
      star = EXCLUDED.star,
      raasi = EXCLUDED.raasi,
      lagnam = EXCLUDED.lagnam,
      gothram = EXCLUDED.gothram,
      tier = EXCLUDED.tier,
      contacts_remaining = EXCLUDED.contacts_remaining,
      interests_remaining = EXCLUDED.interests_remaining,
      food_habit = EXCLUDED.food_habit,
      smoking = EXCLUDED.smoking,
      drinking = EXCLUDED.drinking;
INSERT INTO public.profiles (
      id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at, star, raasi, lagnam, gothram, tier, contacts_remaining, interests_remaining, food_habit, smoking, drinking
    ) VALUES (
      '00000000-0000-4000-a000-000000000012', 'TM000018', 'Gowri Selvan', 'female', '1991-02-07', 168, 'never_married', 'Hindu', 'Devendra Kula Vellalar', 'Devendra Kula Vellalar subcaste', 'no', 'B.Sc', 'B.Sc Graduate', 'Business Owner', 'Business Owner Details', '₹10 Lakhs - ₹15 Lakhs', 'Private Practice', 'Salem', 'Salem', 'Hi, I am Gowri. I have completed my B.Sc and am currently working as a Business Owner at Private Practice in Salem. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'rich', true, false, true, 100, NOW() - INTERVAL '5 days', 'Anuradha', 'Meenam', 'Thulaam', 'Atri', 'free', 5, 5, 'vegetarian', 'no', 'no'
    ) ON CONFLICT (id) DO UPDATE SET
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
      is_verified = EXCLUDED.is_verified,
      is_premium = EXCLUDED.is_premium,
      is_profile_complete = EXCLUDED.is_profile_complete,
      profile_completion_percent = EXCLUDED.profile_completion_percent,
      last_active_at = EXCLUDED.last_active_at,
      star = EXCLUDED.star,
      raasi = EXCLUDED.raasi,
      lagnam = EXCLUDED.lagnam,
      gothram = EXCLUDED.gothram,
      tier = EXCLUDED.tier,
      contacts_remaining = EXCLUDED.contacts_remaining,
      interests_remaining = EXCLUDED.interests_remaining,
      food_habit = EXCLUDED.food_habit,
      smoking = EXCLUDED.smoking,
      drinking = EXCLUDED.drinking;
INSERT INTO public.profiles (
      id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at, star, raasi, lagnam, gothram, tier, contacts_remaining, interests_remaining, food_habit, smoking, drinking
    ) VALUES (
      '00000000-0000-4000-a000-000000000013', 'TM000019', 'Vignesh Moorthy', 'male', '1995-04-10', 184, 'never_married', 'Hindu', 'Kallar', NULL, 'no', 'M.C.A', 'M.C.A Graduate', 'Bank Manager', 'Bank Manager Details', '₹5 Lakhs - ₹7 Lakhs', 'HCL', 'Thanjavur', 'Thanjavur', 'Hi, I am Vignesh. I have completed my M.C.A and am currently working as a Bank Manager at HCL in Thanjavur. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'middle_class', true, false, true, 100, NOW() - INTERVAL '10 days', 'Swati', 'Simham', 'Kanni', 'Harita', 'free', 5, 5, 'vegetarian', 'no', 'no'
    ) ON CONFLICT (id) DO UPDATE SET
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
      is_verified = EXCLUDED.is_verified,
      is_premium = EXCLUDED.is_premium,
      is_profile_complete = EXCLUDED.is_profile_complete,
      profile_completion_percent = EXCLUDED.profile_completion_percent,
      last_active_at = EXCLUDED.last_active_at,
      star = EXCLUDED.star,
      raasi = EXCLUDED.raasi,
      lagnam = EXCLUDED.lagnam,
      gothram = EXCLUDED.gothram,
      tier = EXCLUDED.tier,
      contacts_remaining = EXCLUDED.contacts_remaining,
      interests_remaining = EXCLUDED.interests_remaining,
      food_habit = EXCLUDED.food_habit,
      smoking = EXCLUDED.smoking,
      drinking = EXCLUDED.drinking;
INSERT INTO public.profiles (
      id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at, star, raasi, lagnam, gothram, tier, contacts_remaining, interests_remaining, food_habit, smoking, drinking
    ) VALUES (
      '00000000-0000-4000-a000-000000000014', 'TM000020', 'Preethi Devan', 'female', '2002-08-17', 154, 'never_married', 'Hindu', 'Adi Dravida', 'Adi Dravida subcaste', 'no', 'M.B.A', 'M.B.A Graduate', 'School Teacher', 'School Teacher Details', '₹7 Lakhs - ₹10 Lakhs', 'Private Practice', 'Vellore', 'Vellore', 'Hi, I am Preethi. I have completed my M.B.A and am currently working as a School Teacher at Private Practice in Vellore. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'rich', true, false, true, 100, NOW() - INTERVAL '0 days', 'Magha', 'Simham', 'Rishabam', 'Atri', 'free', 5, 5, 'vegetarian', 'no', 'no'
    ) ON CONFLICT (id) DO UPDATE SET
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
      is_verified = EXCLUDED.is_verified,
      is_premium = EXCLUDED.is_premium,
      is_profile_complete = EXCLUDED.is_profile_complete,
      profile_completion_percent = EXCLUDED.profile_completion_percent,
      last_active_at = EXCLUDED.last_active_at,
      star = EXCLUDED.star,
      raasi = EXCLUDED.raasi,
      lagnam = EXCLUDED.lagnam,
      gothram = EXCLUDED.gothram,
      tier = EXCLUDED.tier,
      contacts_remaining = EXCLUDED.contacts_remaining,
      interests_remaining = EXCLUDED.interests_remaining,
      food_habit = EXCLUDED.food_habit,
      smoking = EXCLUDED.smoking,
      drinking = EXCLUDED.drinking;
INSERT INTO public.profiles (
      id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at, star, raasi, lagnam, gothram, tier, contacts_remaining, interests_remaining, food_habit, smoking, drinking
    ) VALUES (
      '00000000-0000-4000-a000-000000000015', 'TM000021', 'Siddharth Sundaram', 'male', '2002-10-21', 183, 'never_married', 'Hindu', 'Vanniyar', 'Vanniyar subcaste', 'no', 'M.Sc', 'M.Sc Graduate', 'Bank Manager', 'Bank Manager Details', '₹7 Lakhs - ₹10 Lakhs', 'Infosys', 'Thanjavur', 'Thanjavur', 'Hi, I am Siddharth. I have completed my M.Sc and am currently working as a Bank Manager at Infosys in Thanjavur. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'middle_class', true, false, true, 100, NOW() - INTERVAL '0 days', 'Dhanishta', 'Kadagam', 'Kadagam', 'Murugan', 'free', 5, 5, 'vegetarian', 'no', 'no'
    ) ON CONFLICT (id) DO UPDATE SET
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
      is_verified = EXCLUDED.is_verified,
      is_premium = EXCLUDED.is_premium,
      is_profile_complete = EXCLUDED.is_profile_complete,
      profile_completion_percent = EXCLUDED.profile_completion_percent,
      last_active_at = EXCLUDED.last_active_at,
      star = EXCLUDED.star,
      raasi = EXCLUDED.raasi,
      lagnam = EXCLUDED.lagnam,
      gothram = EXCLUDED.gothram,
      tier = EXCLUDED.tier,
      contacts_remaining = EXCLUDED.contacts_remaining,
      interests_remaining = EXCLUDED.interests_remaining,
      food_habit = EXCLUDED.food_habit,
      smoking = EXCLUDED.smoking,
      drinking = EXCLUDED.drinking;
INSERT INTO public.profiles (
      id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at, star, raasi, lagnam, gothram, tier, contacts_remaining, interests_remaining, food_habit, smoking, drinking
    ) VALUES (
      '00000000-0000-4000-a000-000000000016', 'TM000022', 'Divya Velan', 'female', '2002-05-13', 155, 'never_married', 'Hindu', 'Brahmin - Iyengar', NULL, 'no', 'M.B.A', 'M.B.A Graduate', 'Pharmacist', 'Pharmacist Details', '₹10 Lakhs - ₹15 Lakhs', 'HCL', 'Madurai', 'Madurai', 'Hi, I am Divya. I have completed my M.B.A and am currently working as a Pharmacist at HCL in Madurai. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'joint', 'upper_middle_class', true, false, true, 100, NOW() - INTERVAL '9 days', 'Dhanishta', 'Kadagam', 'Mesham', 'Bharadwaj', 'free', 5, 5, 'vegetarian', 'no', 'no'
    ) ON CONFLICT (id) DO UPDATE SET
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
      is_verified = EXCLUDED.is_verified,
      is_premium = EXCLUDED.is_premium,
      is_profile_complete = EXCLUDED.is_profile_complete,
      profile_completion_percent = EXCLUDED.profile_completion_percent,
      last_active_at = EXCLUDED.last_active_at,
      star = EXCLUDED.star,
      raasi = EXCLUDED.raasi,
      lagnam = EXCLUDED.lagnam,
      gothram = EXCLUDED.gothram,
      tier = EXCLUDED.tier,
      contacts_remaining = EXCLUDED.contacts_remaining,
      interests_remaining = EXCLUDED.interests_remaining,
      food_habit = EXCLUDED.food_habit,
      smoking = EXCLUDED.smoking,
      drinking = EXCLUDED.drinking;
INSERT INTO public.profiles (
      id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at, star, raasi, lagnam, gothram, tier, contacts_remaining, interests_remaining, food_habit, smoking, drinking
    ) VALUES (
      '00000000-0000-4000-a000-000000000017', 'TM000023', 'Chinnasamy Samy', 'male', '2000-01-13', 178, 'never_married', 'Hindu', 'Pillai', 'Pillai subcaste', 'no', 'B.Com', 'B.Com Graduate', 'School Teacher', 'School Teacher Details', '₹15 Lakhs - ₹20 Lakhs', 'Accenture', 'Erode', 'Erode', 'Hi, I am Chinnasamy. I have completed my B.Com and am currently working as a School Teacher at Accenture in Erode. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'upper_middle_class', true, false, true, 100, NOW() - INTERVAL '10 days', 'Uttarabhadrapada', 'Viruchigam', 'Mesham', 'Siva', 'free', 5, 5, 'vegetarian', 'no', 'no'
    ) ON CONFLICT (id) DO UPDATE SET
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
      is_verified = EXCLUDED.is_verified,
      is_premium = EXCLUDED.is_premium,
      is_profile_complete = EXCLUDED.is_profile_complete,
      profile_completion_percent = EXCLUDED.profile_completion_percent,
      last_active_at = EXCLUDED.last_active_at,
      star = EXCLUDED.star,
      raasi = EXCLUDED.raasi,
      lagnam = EXCLUDED.lagnam,
      gothram = EXCLUDED.gothram,
      tier = EXCLUDED.tier,
      contacts_remaining = EXCLUDED.contacts_remaining,
      interests_remaining = EXCLUDED.interests_remaining,
      food_habit = EXCLUDED.food_habit,
      smoking = EXCLUDED.smoking,
      drinking = EXCLUDED.drinking;
INSERT INTO public.profiles (
      id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at, star, raasi, lagnam, gothram, tier, contacts_remaining, interests_remaining, food_habit, smoking, drinking
    ) VALUES (
      '00000000-0000-4000-a000-000000000018', 'TM000024', 'Banumathi Samy', 'female', '1993-10-01', 170, 'divorced', 'Hindu', 'Yadav', 'Yadav subcaste', 'no', 'M.A', 'M.A Graduate', 'College Professor', 'College Professor Details', '₹3 Lakhs - ₹5 Lakhs', 'Zoho', 'Thoothukudi', 'Tuticorin', 'Hi, I am Banumathi. I have completed my M.A and am currently working as a College Professor at Zoho in Thoothukudi. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'middle_class', true, false, true, 100, NOW() - INTERVAL '0 days', 'Rohini', 'Rishabam', 'Kanni', 'Agastya', 'free', 5, 5, 'vegetarian', 'no', 'no'
    ) ON CONFLICT (id) DO UPDATE SET
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
      is_verified = EXCLUDED.is_verified,
      is_premium = EXCLUDED.is_premium,
      is_profile_complete = EXCLUDED.is_profile_complete,
      profile_completion_percent = EXCLUDED.profile_completion_percent,
      last_active_at = EXCLUDED.last_active_at,
      star = EXCLUDED.star,
      raasi = EXCLUDED.raasi,
      lagnam = EXCLUDED.lagnam,
      gothram = EXCLUDED.gothram,
      tier = EXCLUDED.tier,
      contacts_remaining = EXCLUDED.contacts_remaining,
      interests_remaining = EXCLUDED.interests_remaining,
      food_habit = EXCLUDED.food_habit,
      smoking = EXCLUDED.smoking,
      drinking = EXCLUDED.drinking;
INSERT INTO public.profiles (
      id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at, star, raasi, lagnam, gothram, tier, contacts_remaining, interests_remaining, food_habit, smoking, drinking
    ) VALUES (
      '00000000-0000-4000-a000-000000000019', 'TM000025', 'Chinnasamy Sundaram', 'male', '1994-10-05', 162, 'never_married', 'Hindu', 'Agamudayar', 'Agamudayar subcaste', 'yes', 'Ph.D', 'Ph.D Graduate', 'Doctor', 'Doctor Details', '₹10 Lakhs - ₹15 Lakhs', 'Cognizant', 'Coimbatore', 'Coimbatore', 'Hi, I am Chinnasamy. I have completed my Ph.D and am currently working as a Doctor at Cognizant in Coimbatore. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'upper_middle_class', false, false, true, 100, NOW() - INTERVAL '7 days', 'Poorvabhadrapada', 'Kumbam', 'Viruchigam', 'Gautama', 'free', 5, 5, 'vegetarian', 'no', 'no'
    ) ON CONFLICT (id) DO UPDATE SET
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
      is_verified = EXCLUDED.is_verified,
      is_premium = EXCLUDED.is_premium,
      is_profile_complete = EXCLUDED.is_profile_complete,
      profile_completion_percent = EXCLUDED.profile_completion_percent,
      last_active_at = EXCLUDED.last_active_at,
      star = EXCLUDED.star,
      raasi = EXCLUDED.raasi,
      lagnam = EXCLUDED.lagnam,
      gothram = EXCLUDED.gothram,
      tier = EXCLUDED.tier,
      contacts_remaining = EXCLUDED.contacts_remaining,
      interests_remaining = EXCLUDED.interests_remaining,
      food_habit = EXCLUDED.food_habit,
      smoking = EXCLUDED.smoking,
      drinking = EXCLUDED.drinking;
INSERT INTO public.profiles (
      id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at, star, raasi, lagnam, gothram, tier, contacts_remaining, interests_remaining, food_habit, smoking, drinking
    ) VALUES (
      '00000000-0000-4000-a000-00000000001a', 'TM000026', 'Vidya Nathan', 'female', '1990-05-10', 172, 'divorced', 'Hindu', 'Vishwakarma', NULL, 'no', 'B.Com', 'B.Com Graduate', 'Doctor', 'Doctor Details', '₹20 Lakhs+', 'Government Service', 'Thoothukudi', 'Tuticorin', 'Hi, I am Vidya. I have completed my B.Com and am currently working as a Doctor at Government Service in Thoothukudi. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'upper_middle_class', false, true, true, 100, NOW() - INTERVAL '8 days', 'Uttarabhadrapada', 'Kumbam', 'Kumbam', 'Angirasa', 'gold', 50, 100, 'vegetarian', 'no', 'no'
    ) ON CONFLICT (id) DO UPDATE SET
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
      is_verified = EXCLUDED.is_verified,
      is_premium = EXCLUDED.is_premium,
      is_profile_complete = EXCLUDED.is_profile_complete,
      profile_completion_percent = EXCLUDED.profile_completion_percent,
      last_active_at = EXCLUDED.last_active_at,
      star = EXCLUDED.star,
      raasi = EXCLUDED.raasi,
      lagnam = EXCLUDED.lagnam,
      gothram = EXCLUDED.gothram,
      tier = EXCLUDED.tier,
      contacts_remaining = EXCLUDED.contacts_remaining,
      interests_remaining = EXCLUDED.interests_remaining,
      food_habit = EXCLUDED.food_habit,
      smoking = EXCLUDED.smoking,
      drinking = EXCLUDED.drinking;
INSERT INTO public.profiles (
      id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at, star, raasi, lagnam, gothram, tier, contacts_remaining, interests_remaining, food_habit, smoking, drinking
    ) VALUES (
      '00000000-0000-4000-a000-00000000001b', 'TM000027', 'Sakthi Selvan', 'male', '1994-05-28', 183, 'never_married', 'Hindu', 'Pillai', 'Pillai subcaste', 'yes', 'Ph.D', 'Ph.D Graduate', 'Doctor', 'Doctor Details', '₹20 Lakhs+', 'Self Employed', 'Vellore', 'Vellore', 'Hi, I am Sakthi. I have completed my Ph.D and am currently working as a Doctor at Self Employed in Vellore. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'middle_class', false, true, true, 100, NOW() - INTERVAL '5 days', 'Poorvashadha', 'Magaram', 'Kumbam', 'Agastya', 'gold', 50, 100, 'vegetarian', 'no', 'no'
    ) ON CONFLICT (id) DO UPDATE SET
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
      is_verified = EXCLUDED.is_verified,
      is_premium = EXCLUDED.is_premium,
      is_profile_complete = EXCLUDED.is_profile_complete,
      profile_completion_percent = EXCLUDED.profile_completion_percent,
      last_active_at = EXCLUDED.last_active_at,
      star = EXCLUDED.star,
      raasi = EXCLUDED.raasi,
      lagnam = EXCLUDED.lagnam,
      gothram = EXCLUDED.gothram,
      tier = EXCLUDED.tier,
      contacts_remaining = EXCLUDED.contacts_remaining,
      interests_remaining = EXCLUDED.interests_remaining,
      food_habit = EXCLUDED.food_habit,
      smoking = EXCLUDED.smoking,
      drinking = EXCLUDED.drinking;
INSERT INTO public.profiles (
      id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at, star, raasi, lagnam, gothram, tier, contacts_remaining, interests_remaining, food_habit, smoking, drinking
    ) VALUES (
      '00000000-0000-4000-a000-00000000001c', 'TM000028', 'Abirami Samy', 'female', '2001-11-15', 162, 'never_married', 'Hindu', 'Adi Dravida', 'Adi Dravida subcaste', 'no', 'Ph.D', 'Ph.D Graduate', 'College Professor', 'College Professor Details', '₹20 Lakhs+', 'Self Employed', 'Tiruppur', 'Tiruppur', 'Hi, I am Abirami. I have completed my Ph.D and am currently working as a College Professor at Self Employed in Tiruppur. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'middle_class', true, false, true, 100, NOW() - INTERVAL '9 days', 'Arudra', 'Kadagam', 'Mesham', 'Viswamitra', 'free', 5, 5, 'vegetarian', 'no', 'no'
    ) ON CONFLICT (id) DO UPDATE SET
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
      is_verified = EXCLUDED.is_verified,
      is_premium = EXCLUDED.is_premium,
      is_profile_complete = EXCLUDED.is_profile_complete,
      profile_completion_percent = EXCLUDED.profile_completion_percent,
      last_active_at = EXCLUDED.last_active_at,
      star = EXCLUDED.star,
      raasi = EXCLUDED.raasi,
      lagnam = EXCLUDED.lagnam,
      gothram = EXCLUDED.gothram,
      tier = EXCLUDED.tier,
      contacts_remaining = EXCLUDED.contacts_remaining,
      interests_remaining = EXCLUDED.interests_remaining,
      food_habit = EXCLUDED.food_habit,
      smoking = EXCLUDED.smoking,
      drinking = EXCLUDED.drinking;
INSERT INTO public.profiles (
      id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at, star, raasi, lagnam, gothram, tier, contacts_remaining, interests_remaining, food_habit, smoking, drinking
    ) VALUES (
      '00000000-0000-4000-a000-00000000001d', 'TM000029', 'Anbarasan Swamy', 'male', '1999-09-07', 184, 'never_married', 'Hindu', 'Vishwakarma', NULL, 'no', 'B.A', 'B.A Graduate', 'Government Officer', 'Government Officer Details', '₹5 Lakhs - ₹7 Lakhs', 'Government Service', 'Tiruchirappalli', 'Trichy', 'Hi, I am Anbarasan. I have completed my B.A and am currently working as a Government Officer at Government Service in Tiruchirappalli. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'joint', 'upper_middle_class', true, false, true, 100, NOW() - INTERVAL '4 days', 'Poorvaphalguni', 'Rishabam', 'Mesham', 'Murugan', 'free', 5, 5, 'vegetarian', 'no', 'no'
    ) ON CONFLICT (id) DO UPDATE SET
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
      is_verified = EXCLUDED.is_verified,
      is_premium = EXCLUDED.is_premium,
      is_profile_complete = EXCLUDED.is_profile_complete,
      profile_completion_percent = EXCLUDED.profile_completion_percent,
      last_active_at = EXCLUDED.last_active_at,
      star = EXCLUDED.star,
      raasi = EXCLUDED.raasi,
      lagnam = EXCLUDED.lagnam,
      gothram = EXCLUDED.gothram,
      tier = EXCLUDED.tier,
      contacts_remaining = EXCLUDED.contacts_remaining,
      interests_remaining = EXCLUDED.interests_remaining,
      food_habit = EXCLUDED.food_habit,
      smoking = EXCLUDED.smoking,
      drinking = EXCLUDED.drinking;
INSERT INTO public.profiles (
      id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at, star, raasi, lagnam, gothram, tier, contacts_remaining, interests_remaining, food_habit, smoking, drinking
    ) VALUES (
      '00000000-0000-4000-a000-00000000001e', 'TM000030', 'Keerthana Lingam', 'female', '1995-02-01', 158, 'never_married', 'Hindu', 'Agamudayar', 'Agamudayar subcaste', 'yes', 'B.Com', 'B.Com Graduate', 'Police Officer', 'Police Officer Details', '₹5 Lakhs - ₹7 Lakhs', 'Cognizant', 'Kanchipuram', 'Kanchipuram', 'Hi, I am Keerthana. I have completed my B.Com and am currently working as a Police Officer at Cognizant in Kanchipuram. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'rich', false, false, true, 100, NOW() - INTERVAL '9 days', 'Aslesha', 'Mesham', 'Mithunam', 'Vashishta', 'free', 5, 5, 'vegetarian', 'no', 'no'
    ) ON CONFLICT (id) DO UPDATE SET
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
      is_verified = EXCLUDED.is_verified,
      is_premium = EXCLUDED.is_premium,
      is_profile_complete = EXCLUDED.is_profile_complete,
      profile_completion_percent = EXCLUDED.profile_completion_percent,
      last_active_at = EXCLUDED.last_active_at,
      star = EXCLUDED.star,
      raasi = EXCLUDED.raasi,
      lagnam = EXCLUDED.lagnam,
      gothram = EXCLUDED.gothram,
      tier = EXCLUDED.tier,
      contacts_remaining = EXCLUDED.contacts_remaining,
      interests_remaining = EXCLUDED.interests_remaining,
      food_habit = EXCLUDED.food_habit,
      smoking = EXCLUDED.smoking,
      drinking = EXCLUDED.drinking;
INSERT INTO public.profiles (
      id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at, star, raasi, lagnam, gothram, tier, contacts_remaining, interests_remaining, food_habit, smoking, drinking
    ) VALUES (
      '00000000-0000-4000-a000-00000000001f', 'TM000031', 'Kannan Mani', 'male', '2003-02-03', 186, 'never_married', 'Hindu', 'Maravar', NULL, 'no', 'B.Sc', 'B.Sc Graduate', 'School Teacher', 'School Teacher Details', '₹5 Lakhs - ₹7 Lakhs', 'TCS', 'Kanchipuram', 'Kanchipuram', 'Hi, I am Kannan. I have completed my B.Sc and am currently working as a School Teacher at TCS in Kanchipuram. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'upper_middle_class', false, false, true, 100, NOW() - INTERVAL '5 days', 'Poorvaphalguni', 'Rishabam', 'Thulaam', 'Bharadwaj', 'free', 5, 5, 'vegetarian', 'no', 'no'
    ) ON CONFLICT (id) DO UPDATE SET
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
      is_verified = EXCLUDED.is_verified,
      is_premium = EXCLUDED.is_premium,
      is_profile_complete = EXCLUDED.is_profile_complete,
      profile_completion_percent = EXCLUDED.profile_completion_percent,
      last_active_at = EXCLUDED.last_active_at,
      star = EXCLUDED.star,
      raasi = EXCLUDED.raasi,
      lagnam = EXCLUDED.lagnam,
      gothram = EXCLUDED.gothram,
      tier = EXCLUDED.tier,
      contacts_remaining = EXCLUDED.contacts_remaining,
      interests_remaining = EXCLUDED.interests_remaining,
      food_habit = EXCLUDED.food_habit,
      smoking = EXCLUDED.smoking,
      drinking = EXCLUDED.drinking;
INSERT INTO public.profiles (
      id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at, star, raasi, lagnam, gothram, tier, contacts_remaining, interests_remaining, food_habit, smoking, drinking
    ) VALUES (
      '00000000-0000-4000-a000-000000000020', 'TM000032', 'Rekha Devan', 'female', '1999-03-25', 152, 'never_married', 'Hindu', 'Mudaliar', 'Mudaliar subcaste', 'yes', 'M.A', 'M.A Graduate', 'Doctor', 'Doctor Details', '₹3 Lakhs - ₹5 Lakhs', 'Government Service', 'Thanjavur', 'Thanjavur', 'Hi, I am Rekha. I have completed my M.A and am currently working as a Doctor at Government Service in Thanjavur. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'middle_class', true, false, true, 100, NOW() - INTERVAL '7 days', 'Magha', 'Kanni', 'Meenam', 'Vishnu', 'free', 5, 5, 'vegetarian', 'no', 'no'
    ) ON CONFLICT (id) DO UPDATE SET
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
      is_verified = EXCLUDED.is_verified,
      is_premium = EXCLUDED.is_premium,
      is_profile_complete = EXCLUDED.is_profile_complete,
      profile_completion_percent = EXCLUDED.profile_completion_percent,
      last_active_at = EXCLUDED.last_active_at,
      star = EXCLUDED.star,
      raasi = EXCLUDED.raasi,
      lagnam = EXCLUDED.lagnam,
      gothram = EXCLUDED.gothram,
      tier = EXCLUDED.tier,
      contacts_remaining = EXCLUDED.contacts_remaining,
      interests_remaining = EXCLUDED.interests_remaining,
      food_habit = EXCLUDED.food_habit,
      smoking = EXCLUDED.smoking,
      drinking = EXCLUDED.drinking;
INSERT INTO public.profiles (
      id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at, star, raasi, lagnam, gothram, tier, contacts_remaining, interests_remaining, food_habit, smoking, drinking
    ) VALUES (
      '00000000-0000-4000-a000-000000000021', 'TM000033', 'Surya Krishnan', 'male', '2000-11-13', 187, 'never_married', 'Hindu', 'Mudaliar', NULL, 'no', 'M.A', 'M.A Graduate', 'College Professor', 'College Professor Details', '₹20 Lakhs+', 'Government Service', 'Tiruppur', 'Tiruppur', 'Hi, I am Surya. I have completed my M.A and am currently working as a College Professor at Government Service in Tiruppur. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'middle_class', true, false, true, 100, NOW() - INTERVAL '0 days', 'Uttarachadha', 'Rishabam', 'Dhanusu', 'Agastya', 'free', 5, 5, 'vegetarian', 'no', 'no'
    ) ON CONFLICT (id) DO UPDATE SET
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
      is_verified = EXCLUDED.is_verified,
      is_premium = EXCLUDED.is_premium,
      is_profile_complete = EXCLUDED.is_profile_complete,
      profile_completion_percent = EXCLUDED.profile_completion_percent,
      last_active_at = EXCLUDED.last_active_at,
      star = EXCLUDED.star,
      raasi = EXCLUDED.raasi,
      lagnam = EXCLUDED.lagnam,
      gothram = EXCLUDED.gothram,
      tier = EXCLUDED.tier,
      contacts_remaining = EXCLUDED.contacts_remaining,
      interests_remaining = EXCLUDED.interests_remaining,
      food_habit = EXCLUDED.food_habit,
      smoking = EXCLUDED.smoking,
      drinking = EXCLUDED.drinking;
INSERT INTO public.profiles (
      id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at, star, raasi, lagnam, gothram, tier, contacts_remaining, interests_remaining, food_habit, smoking, drinking
    ) VALUES (
      '00000000-0000-4000-a000-000000000022', 'TM000034', 'Lakshmi Kumar', 'female', '1994-06-25', 160, 'never_married', 'Christian', 'Protestant Christian', NULL, 'no', 'M.Sc', 'M.Sc Graduate', 'HR Specialist', 'HR Specialist Details', '₹3 Lakhs - ₹5 Lakhs', 'Infosys', 'Salem', 'Salem', 'Hi, I am Lakshmi. I have completed my M.Sc and am currently working as a HR Specialist at Infosys in Salem. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'middle_class', true, false, true, 100, NOW() - INTERVAL '2 days', 'Poorvabhadrapada', 'Meenam', 'Kumbam', 'Kasyapa', 'free', 5, 5, 'vegetarian', 'no', 'no'
    ) ON CONFLICT (id) DO UPDATE SET
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
      is_verified = EXCLUDED.is_verified,
      is_premium = EXCLUDED.is_premium,
      is_profile_complete = EXCLUDED.is_profile_complete,
      profile_completion_percent = EXCLUDED.profile_completion_percent,
      last_active_at = EXCLUDED.last_active_at,
      star = EXCLUDED.star,
      raasi = EXCLUDED.raasi,
      lagnam = EXCLUDED.lagnam,
      gothram = EXCLUDED.gothram,
      tier = EXCLUDED.tier,
      contacts_remaining = EXCLUDED.contacts_remaining,
      interests_remaining = EXCLUDED.interests_remaining,
      food_habit = EXCLUDED.food_habit,
      smoking = EXCLUDED.smoking,
      drinking = EXCLUDED.drinking;
INSERT INTO public.profiles (
      id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at, star, raasi, lagnam, gothram, tier, contacts_remaining, interests_remaining, food_habit, smoking, drinking
    ) VALUES (
      '00000000-0000-4000-a000-000000000023', 'TM000035', 'Sathish Krishnan', 'male', '2004-05-28', 178, 'never_married', 'Hindu', 'Naicker', 'Naicker subcaste', 'no', 'M.B.B.S', 'M.B.B.S Graduate', 'Civil Engineer', 'Civil Engineer Details', '₹5 Lakhs - ₹7 Lakhs', 'Accenture', 'Chennai', 'Chennai', 'Hi, I am Sathish. I have completed my M.B.B.S and am currently working as a Civil Engineer at Accenture in Chennai. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'joint', 'upper_middle_class', true, true, true, 100, NOW() - INTERVAL '2 days', 'Moola', 'Meenam', 'Meenam', 'Vashishta', 'gold', 50, 100, 'vegetarian', 'no', 'no'
    ) ON CONFLICT (id) DO UPDATE SET
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
      is_verified = EXCLUDED.is_verified,
      is_premium = EXCLUDED.is_premium,
      is_profile_complete = EXCLUDED.is_profile_complete,
      profile_completion_percent = EXCLUDED.profile_completion_percent,
      last_active_at = EXCLUDED.last_active_at,
      star = EXCLUDED.star,
      raasi = EXCLUDED.raasi,
      lagnam = EXCLUDED.lagnam,
      gothram = EXCLUDED.gothram,
      tier = EXCLUDED.tier,
      contacts_remaining = EXCLUDED.contacts_remaining,
      interests_remaining = EXCLUDED.interests_remaining,
      food_habit = EXCLUDED.food_habit,
      smoking = EXCLUDED.smoking,
      drinking = EXCLUDED.drinking;
INSERT INTO public.profiles (
      id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at, star, raasi, lagnam, gothram, tier, contacts_remaining, interests_remaining, food_habit, smoking, drinking
    ) VALUES (
      '00000000-0000-4000-a000-000000000024', 'TM000036', 'Ramani Balan', 'female', '1992-02-20', 172, 'never_married', 'Hindu', 'Naidu', NULL, 'no', 'B.A', 'B.A Graduate', 'Government Officer', 'Government Officer Details', '₹15 Lakhs - ₹20 Lakhs', 'Wipro', 'Thoothukudi', 'Tuticorin', 'Hi, I am Ramani. I have completed my B.A and am currently working as a Government Officer at Wipro in Thoothukudi. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'upper_middle_class', false, false, true, 100, NOW() - INTERVAL '10 days', 'Jyeshta', 'Kadagam', 'Kumbam', 'Murugan', 'free', 5, 5, 'vegetarian', 'no', 'no'
    ) ON CONFLICT (id) DO UPDATE SET
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
      is_verified = EXCLUDED.is_verified,
      is_premium = EXCLUDED.is_premium,
      is_profile_complete = EXCLUDED.is_profile_complete,
      profile_completion_percent = EXCLUDED.profile_completion_percent,
      last_active_at = EXCLUDED.last_active_at,
      star = EXCLUDED.star,
      raasi = EXCLUDED.raasi,
      lagnam = EXCLUDED.lagnam,
      gothram = EXCLUDED.gothram,
      tier = EXCLUDED.tier,
      contacts_remaining = EXCLUDED.contacts_remaining,
      interests_remaining = EXCLUDED.interests_remaining,
      food_habit = EXCLUDED.food_habit,
      smoking = EXCLUDED.smoking,
      drinking = EXCLUDED.drinking;
INSERT INTO public.profiles (
      id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at, star, raasi, lagnam, gothram, tier, contacts_remaining, interests_remaining, food_habit, smoking, drinking
    ) VALUES (
      '00000000-0000-4000-a000-000000000025', 'TM000037', 'Vignesh Raman', 'male', '2003-12-10', 173, 'divorced', 'Hindu', 'Adi Dravida', 'Adi Dravida subcaste', 'no', 'M.B.B.S', 'M.B.B.S Graduate', 'Architect', 'Architect Details', '₹15 Lakhs - ₹20 Lakhs', 'Wipro', 'Erode', 'Erode', 'Hi, I am Vignesh. I have completed my M.B.B.S and am currently working as a Architect at Wipro in Erode. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'joint', 'rich', true, false, true, 100, NOW() - INTERVAL '8 days', 'Moola', 'Kumbam', 'Meenam', 'Harita', 'free', 5, 5, 'vegetarian', 'no', 'no'
    ) ON CONFLICT (id) DO UPDATE SET
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
      is_verified = EXCLUDED.is_verified,
      is_premium = EXCLUDED.is_premium,
      is_profile_complete = EXCLUDED.is_profile_complete,
      profile_completion_percent = EXCLUDED.profile_completion_percent,
      last_active_at = EXCLUDED.last_active_at,
      star = EXCLUDED.star,
      raasi = EXCLUDED.raasi,
      lagnam = EXCLUDED.lagnam,
      gothram = EXCLUDED.gothram,
      tier = EXCLUDED.tier,
      contacts_remaining = EXCLUDED.contacts_remaining,
      interests_remaining = EXCLUDED.interests_remaining,
      food_habit = EXCLUDED.food_habit,
      smoking = EXCLUDED.smoking,
      drinking = EXCLUDED.drinking;
INSERT INTO public.profiles (
      id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at, star, raasi, lagnam, gothram, tier, contacts_remaining, interests_remaining, food_habit, smoking, drinking
    ) VALUES (
      '00000000-0000-4000-a000-000000000026', 'TM000038', 'Vidya Murthy', 'female', '1998-12-28', 150, 'never_married', 'Hindu', 'Vanniyar', 'Vanniyar subcaste', 'yes', 'Ph.D', 'Ph.D Graduate', 'College Professor', 'College Professor Details', '₹3 Lakhs - ₹5 Lakhs', 'Government Service', 'Erode', 'Erode', 'Hi, I am Vidya. I have completed my Ph.D and am currently working as a College Professor at Government Service in Erode. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'middle_class', true, false, true, 100, NOW() - INTERVAL '6 days', 'Bharani', 'Kadagam', 'Thulaam', 'Angirasa', 'free', 5, 5, 'vegetarian', 'no', 'no'
    ) ON CONFLICT (id) DO UPDATE SET
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
      is_verified = EXCLUDED.is_verified,
      is_premium = EXCLUDED.is_premium,
      is_profile_complete = EXCLUDED.is_profile_complete,
      profile_completion_percent = EXCLUDED.profile_completion_percent,
      last_active_at = EXCLUDED.last_active_at,
      star = EXCLUDED.star,
      raasi = EXCLUDED.raasi,
      lagnam = EXCLUDED.lagnam,
      gothram = EXCLUDED.gothram,
      tier = EXCLUDED.tier,
      contacts_remaining = EXCLUDED.contacts_remaining,
      interests_remaining = EXCLUDED.interests_remaining,
      food_habit = EXCLUDED.food_habit,
      smoking = EXCLUDED.smoking,
      drinking = EXCLUDED.drinking;
INSERT INTO public.profiles (
      id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at, star, raasi, lagnam, gothram, tier, contacts_remaining, interests_remaining, food_habit, smoking, drinking
    ) VALUES (
      '00000000-0000-4000-a000-000000000027', 'TM000039', 'Sundar Selvan', 'male', '2005-05-09', 179, 'never_married', 'Hindu', 'Vanniyar', NULL, 'yes', 'B.A', 'B.A Graduate', 'Business Owner', 'Business Owner Details', '₹20 Lakhs+', 'Infosys', 'Kanchipuram', 'Kanchipuram', 'Hi, I am Sundar. I have completed my B.A and am currently working as a Business Owner at Infosys in Kanchipuram. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'joint', 'upper_middle_class', true, false, true, 100, NOW() - INTERVAL '3 days', 'Revati', 'Thulaam', 'Mithunam', 'Gautama', 'free', 5, 5, 'vegetarian', 'no', 'no'
    ) ON CONFLICT (id) DO UPDATE SET
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
      is_verified = EXCLUDED.is_verified,
      is_premium = EXCLUDED.is_premium,
      is_profile_complete = EXCLUDED.is_profile_complete,
      profile_completion_percent = EXCLUDED.profile_completion_percent,
      last_active_at = EXCLUDED.last_active_at,
      star = EXCLUDED.star,
      raasi = EXCLUDED.raasi,
      lagnam = EXCLUDED.lagnam,
      gothram = EXCLUDED.gothram,
      tier = EXCLUDED.tier,
      contacts_remaining = EXCLUDED.contacts_remaining,
      interests_remaining = EXCLUDED.interests_remaining,
      food_habit = EXCLUDED.food_habit,
      smoking = EXCLUDED.smoking,
      drinking = EXCLUDED.drinking;
INSERT INTO public.profiles (
      id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at, star, raasi, lagnam, gothram, tier, contacts_remaining, interests_remaining, food_habit, smoking, drinking
    ) VALUES (
      '00000000-0000-4000-a000-000000000028', 'TM000040', 'Radha Sundaram', 'female', '2002-09-22', 166, 'never_married', 'Christian', 'Nadar Christian', 'Nadar Christian subcaste', 'no', 'B.Com', 'B.Com Graduate', 'HR Specialist', 'HR Specialist Details', '₹3 Lakhs - ₹5 Lakhs', 'Accenture', 'Vellore', 'Vellore', 'Hi, I am Radha. I have completed my B.Com and am currently working as a HR Specialist at Accenture in Vellore. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'upper_middle_class', true, false, true, 100, NOW() - INTERVAL '2 days', 'Shatabhisha', 'Meenam', 'Meenam', 'Murugan', 'free', 5, 5, 'vegetarian', 'no', 'no'
    ) ON CONFLICT (id) DO UPDATE SET
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
      is_verified = EXCLUDED.is_verified,
      is_premium = EXCLUDED.is_premium,
      is_profile_complete = EXCLUDED.is_profile_complete,
      profile_completion_percent = EXCLUDED.profile_completion_percent,
      last_active_at = EXCLUDED.last_active_at,
      star = EXCLUDED.star,
      raasi = EXCLUDED.raasi,
      lagnam = EXCLUDED.lagnam,
      gothram = EXCLUDED.gothram,
      tier = EXCLUDED.tier,
      contacts_remaining = EXCLUDED.contacts_remaining,
      interests_remaining = EXCLUDED.interests_remaining,
      food_habit = EXCLUDED.food_habit,
      smoking = EXCLUDED.smoking,
      drinking = EXCLUDED.drinking;
INSERT INTO public.profiles (
      id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at, star, raasi, lagnam, gothram, tier, contacts_remaining, interests_remaining, food_habit, smoking, drinking
    ) VALUES (
      '00000000-0000-4000-a000-000000000029', 'TM000041', 'Jeeva Samy', 'male', '1995-04-03', 178, 'never_married', 'Hindu', 'Nadar', 'Nadar subcaste', 'no', 'M.B.A', 'M.B.A Graduate', 'School Teacher', 'School Teacher Details', '₹7 Lakhs - ₹10 Lakhs', 'TCS', 'Tiruppur', 'Tiruppur', 'Hi, I am Jeeva. I have completed my M.B.A and am currently working as a School Teacher at TCS in Tiruppur. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'rich', true, false, true, 100, NOW() - INTERVAL '4 days', 'Chitra', 'Simham', 'Simham', 'Angirasa', 'free', 5, 5, 'vegetarian', 'no', 'no'
    ) ON CONFLICT (id) DO UPDATE SET
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
      is_verified = EXCLUDED.is_verified,
      is_premium = EXCLUDED.is_premium,
      is_profile_complete = EXCLUDED.is_profile_complete,
      profile_completion_percent = EXCLUDED.profile_completion_percent,
      last_active_at = EXCLUDED.last_active_at,
      star = EXCLUDED.star,
      raasi = EXCLUDED.raasi,
      lagnam = EXCLUDED.lagnam,
      gothram = EXCLUDED.gothram,
      tier = EXCLUDED.tier,
      contacts_remaining = EXCLUDED.contacts_remaining,
      interests_remaining = EXCLUDED.interests_remaining,
      food_habit = EXCLUDED.food_habit,
      smoking = EXCLUDED.smoking,
      drinking = EXCLUDED.drinking;
INSERT INTO public.profiles (
      id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at, star, raasi, lagnam, gothram, tier, contacts_remaining, interests_remaining, food_habit, smoking, drinking
    ) VALUES (
      '00000000-0000-4000-a000-00000000002a', 'TM000042', 'Megala Moorthy', 'female', '1989-10-11', 163, 'never_married', 'Hindu', 'Naidu', 'Naidu subcaste', 'no', 'B.A', 'B.A Graduate', 'College Professor', 'College Professor Details', '₹5 Lakhs - ₹7 Lakhs', 'Infosys', 'Tiruppur', 'Tiruppur', 'Hi, I am Megala. I have completed my B.A and am currently working as a College Professor at Infosys in Tiruppur. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'joint', 'rich', true, false, true, 100, NOW() - INTERVAL '7 days', 'Pushya', 'Rishabam', 'Kadagam', 'Agastya', 'free', 5, 5, 'vegetarian', 'no', 'no'
    ) ON CONFLICT (id) DO UPDATE SET
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
      is_verified = EXCLUDED.is_verified,
      is_premium = EXCLUDED.is_premium,
      is_profile_complete = EXCLUDED.is_profile_complete,
      profile_completion_percent = EXCLUDED.profile_completion_percent,
      last_active_at = EXCLUDED.last_active_at,
      star = EXCLUDED.star,
      raasi = EXCLUDED.raasi,
      lagnam = EXCLUDED.lagnam,
      gothram = EXCLUDED.gothram,
      tier = EXCLUDED.tier,
      contacts_remaining = EXCLUDED.contacts_remaining,
      interests_remaining = EXCLUDED.interests_remaining,
      food_habit = EXCLUDED.food_habit,
      smoking = EXCLUDED.smoking,
      drinking = EXCLUDED.drinking;
INSERT INTO public.profiles (
      id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at, star, raasi, lagnam, gothram, tier, contacts_remaining, interests_remaining, food_habit, smoking, drinking
    ) VALUES (
      '00000000-0000-4000-a000-00000000002b', 'TM000043', 'Siva Raman', 'male', '2003-07-27', 174, 'never_married', 'Hindu', 'Brahmin - Iyengar', 'Brahmin - Iyengar subcaste', 'no', 'Ph.D', 'Ph.D Graduate', 'HR Specialist', 'HR Specialist Details', '₹3 Lakhs - ₹5 Lakhs', 'Accenture', 'Chennai', 'Chennai', 'Hi, I am Siva. I have completed my Ph.D and am currently working as a HR Specialist at Accenture in Chennai. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'rich', true, false, true, 100, NOW() - INTERVAL '8 days', 'Mirgashira', 'Kumbam', 'Mithunam', 'Vashishta', 'free', 5, 5, 'vegetarian', 'no', 'no'
    ) ON CONFLICT (id) DO UPDATE SET
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
      is_verified = EXCLUDED.is_verified,
      is_premium = EXCLUDED.is_premium,
      is_profile_complete = EXCLUDED.is_profile_complete,
      profile_completion_percent = EXCLUDED.profile_completion_percent,
      last_active_at = EXCLUDED.last_active_at,
      star = EXCLUDED.star,
      raasi = EXCLUDED.raasi,
      lagnam = EXCLUDED.lagnam,
      gothram = EXCLUDED.gothram,
      tier = EXCLUDED.tier,
      contacts_remaining = EXCLUDED.contacts_remaining,
      interests_remaining = EXCLUDED.interests_remaining,
      food_habit = EXCLUDED.food_habit,
      smoking = EXCLUDED.smoking,
      drinking = EXCLUDED.drinking;
INSERT INTO public.profiles (
      id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at, star, raasi, lagnam, gothram, tier, contacts_remaining, interests_remaining, food_habit, smoking, drinking
    ) VALUES (
      '00000000-0000-4000-a000-00000000002c', 'TM000044', 'Anitha Raj', 'female', '2000-08-09', 153, 'never_married', 'Hindu', 'Mudaliar', 'Mudaliar subcaste', 'no', 'B.E. / B.Tech', 'B.E. / B.Tech Graduate', 'Auditor', 'Auditor Details', '₹15 Lakhs - ₹20 Lakhs', 'HCL', 'Kanchipuram', 'Kanchipuram', 'Hi, I am Anitha. I have completed my B.E. / B.Tech and am currently working as a Auditor at HCL in Kanchipuram. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'rich', true, false, true, 100, NOW() - INTERVAL '10 days', 'Uttarachadha', 'Mesham', 'Mesham', 'Viswamitra', 'free', 5, 5, 'vegetarian', 'no', 'no'
    ) ON CONFLICT (id) DO UPDATE SET
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
      is_verified = EXCLUDED.is_verified,
      is_premium = EXCLUDED.is_premium,
      is_profile_complete = EXCLUDED.is_profile_complete,
      profile_completion_percent = EXCLUDED.profile_completion_percent,
      last_active_at = EXCLUDED.last_active_at,
      star = EXCLUDED.star,
      raasi = EXCLUDED.raasi,
      lagnam = EXCLUDED.lagnam,
      gothram = EXCLUDED.gothram,
      tier = EXCLUDED.tier,
      contacts_remaining = EXCLUDED.contacts_remaining,
      interests_remaining = EXCLUDED.interests_remaining,
      food_habit = EXCLUDED.food_habit,
      smoking = EXCLUDED.smoking,
      drinking = EXCLUDED.drinking;
INSERT INTO public.profiles (
      id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at, star, raasi, lagnam, gothram, tier, contacts_remaining, interests_remaining, food_habit, smoking, drinking
    ) VALUES (
      '00000000-0000-4000-a000-00000000002d', 'TM000045', 'Bala Swamy', 'male', '2003-02-02', 170, 'never_married', 'Hindu', 'Agamudayar', NULL, 'no', 'M.Sc', 'M.Sc Graduate', 'Advocate', 'Advocate Details', '₹15 Lakhs - ₹20 Lakhs', 'Zoho', 'Thanjavur', 'Thanjavur', 'Hi, I am Bala. I have completed my M.Sc and am currently working as a Advocate at Zoho in Thanjavur. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'joint', 'rich', false, true, true, 100, NOW() - INTERVAL '7 days', 'Revati', 'Rishabam', 'Dhanusu', 'Siva', 'gold', 50, 100, 'vegetarian', 'no', 'no'
    ) ON CONFLICT (id) DO UPDATE SET
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
      is_verified = EXCLUDED.is_verified,
      is_premium = EXCLUDED.is_premium,
      is_profile_complete = EXCLUDED.is_profile_complete,
      profile_completion_percent = EXCLUDED.profile_completion_percent,
      last_active_at = EXCLUDED.last_active_at,
      star = EXCLUDED.star,
      raasi = EXCLUDED.raasi,
      lagnam = EXCLUDED.lagnam,
      gothram = EXCLUDED.gothram,
      tier = EXCLUDED.tier,
      contacts_remaining = EXCLUDED.contacts_remaining,
      interests_remaining = EXCLUDED.interests_remaining,
      food_habit = EXCLUDED.food_habit,
      smoking = EXCLUDED.smoking,
      drinking = EXCLUDED.drinking;
INSERT INTO public.profiles (
      id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at, star, raasi, lagnam, gothram, tier, contacts_remaining, interests_remaining, food_habit, smoking, drinking
    ) VALUES (
      '00000000-0000-4000-a000-00000000002e', 'TM000046', 'Sowmya Moorthy', 'female', '1997-08-27', 156, 'never_married', 'Hindu', 'Vanniyar', NULL, 'no', 'M.B.A', 'M.B.A Graduate', 'Architect', 'Architect Details', '₹10 Lakhs - ₹15 Lakhs', 'Government Service', 'Kanchipuram', 'Kanchipuram', 'Hi, I am Sowmya. I have completed my M.B.A and am currently working as a Architect at Government Service in Kanchipuram. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'middle_class', true, false, true, 100, NOW() - INTERVAL '5 days', 'Mirgashira', 'Meenam', 'Kanni', 'Vashishta', 'free', 5, 5, 'vegetarian', 'no', 'no'
    ) ON CONFLICT (id) DO UPDATE SET
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
      is_verified = EXCLUDED.is_verified,
      is_premium = EXCLUDED.is_premium,
      is_profile_complete = EXCLUDED.is_profile_complete,
      profile_completion_percent = EXCLUDED.profile_completion_percent,
      last_active_at = EXCLUDED.last_active_at,
      star = EXCLUDED.star,
      raasi = EXCLUDED.raasi,
      lagnam = EXCLUDED.lagnam,
      gothram = EXCLUDED.gothram,
      tier = EXCLUDED.tier,
      contacts_remaining = EXCLUDED.contacts_remaining,
      interests_remaining = EXCLUDED.interests_remaining,
      food_habit = EXCLUDED.food_habit,
      smoking = EXCLUDED.smoking,
      drinking = EXCLUDED.drinking;
INSERT INTO public.profiles (
      id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at, star, raasi, lagnam, gothram, tier, contacts_remaining, interests_remaining, food_habit, smoking, drinking
    ) VALUES (
      '00000000-0000-4000-a000-00000000002f', 'TM000047', 'Kannan Gopal', 'male', '1991-09-19', 170, 'never_married', 'Hindu', 'Arunthathiyar', NULL, 'yes', 'M.A', 'M.A Graduate', 'Civil Engineer', 'Civil Engineer Details', '₹3 Lakhs - ₹5 Lakhs', 'Infosys', 'Vellore', 'Vellore', 'Hi, I am Kannan. I have completed my M.A and am currently working as a Civil Engineer at Infosys in Vellore. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'middle_class', true, false, true, 100, NOW() - INTERVAL '2 days', 'Dhanishta', 'Mithunam', 'Thulaam', 'Bharadwaj', 'free', 5, 5, 'vegetarian', 'no', 'no'
    ) ON CONFLICT (id) DO UPDATE SET
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
      is_verified = EXCLUDED.is_verified,
      is_premium = EXCLUDED.is_premium,
      is_profile_complete = EXCLUDED.is_profile_complete,
      profile_completion_percent = EXCLUDED.profile_completion_percent,
      last_active_at = EXCLUDED.last_active_at,
      star = EXCLUDED.star,
      raasi = EXCLUDED.raasi,
      lagnam = EXCLUDED.lagnam,
      gothram = EXCLUDED.gothram,
      tier = EXCLUDED.tier,
      contacts_remaining = EXCLUDED.contacts_remaining,
      interests_remaining = EXCLUDED.interests_remaining,
      food_habit = EXCLUDED.food_habit,
      smoking = EXCLUDED.smoking,
      drinking = EXCLUDED.drinking;
INSERT INTO public.profiles (
      id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at, star, raasi, lagnam, gothram, tier, contacts_remaining, interests_remaining, food_habit, smoking, drinking
    ) VALUES (
      '00000000-0000-4000-a000-000000000030', 'TM000048', 'Geetha Murthy', 'female', '1988-06-14', 174, 'never_married', 'Hindu', 'Agamudayar', 'Agamudayar subcaste', 'no', 'M.A', 'M.A Graduate', 'Doctor', 'Doctor Details', '₹5 Lakhs - ₹7 Lakhs', 'Private Practice', 'Chennai', 'Chennai', 'Hi, I am Geetha. I have completed my M.A and am currently working as a Doctor at Private Practice in Chennai. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'upper_middle_class', true, false, true, 100, NOW() - INTERVAL '0 days', 'Aslesha', 'Meenam', 'Simham', 'Atri', 'free', 5, 5, 'vegetarian', 'no', 'no'
    ) ON CONFLICT (id) DO UPDATE SET
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
      is_verified = EXCLUDED.is_verified,
      is_premium = EXCLUDED.is_premium,
      is_profile_complete = EXCLUDED.is_profile_complete,
      profile_completion_percent = EXCLUDED.profile_completion_percent,
      last_active_at = EXCLUDED.last_active_at,
      star = EXCLUDED.star,
      raasi = EXCLUDED.raasi,
      lagnam = EXCLUDED.lagnam,
      gothram = EXCLUDED.gothram,
      tier = EXCLUDED.tier,
      contacts_remaining = EXCLUDED.contacts_remaining,
      interests_remaining = EXCLUDED.interests_remaining,
      food_habit = EXCLUDED.food_habit,
      smoking = EXCLUDED.smoking,
      drinking = EXCLUDED.drinking;
INSERT INTO public.profiles (
      id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at, star, raasi, lagnam, gothram, tier, contacts_remaining, interests_remaining, food_habit, smoking, drinking
    ) VALUES (
      '00000000-0000-4000-a000-000000000031', 'TM000049', 'Gautham Raman', 'male', '1992-09-06', 162, 'never_married', 'Christian', 'Protestant Christian', 'Protestant Christian subcaste', 'no', 'M.C.A', 'M.C.A Graduate', 'School Teacher', 'School Teacher Details', '₹15 Lakhs - ₹20 Lakhs', 'Accenture', 'Thoothukudi', 'Tuticorin', 'Hi, I am Gautham. I have completed my M.C.A and am currently working as a School Teacher at Accenture in Thoothukudi. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'middle_class', true, true, true, 100, NOW() - INTERVAL '6 days', 'Vishakha', 'Mithunam', 'Viruchigam', 'Kasyapa', 'gold', 50, 100, 'vegetarian', 'no', 'no'
    ) ON CONFLICT (id) DO UPDATE SET
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
      is_verified = EXCLUDED.is_verified,
      is_premium = EXCLUDED.is_premium,
      is_profile_complete = EXCLUDED.is_profile_complete,
      profile_completion_percent = EXCLUDED.profile_completion_percent,
      last_active_at = EXCLUDED.last_active_at,
      star = EXCLUDED.star,
      raasi = EXCLUDED.raasi,
      lagnam = EXCLUDED.lagnam,
      gothram = EXCLUDED.gothram,
      tier = EXCLUDED.tier,
      contacts_remaining = EXCLUDED.contacts_remaining,
      interests_remaining = EXCLUDED.interests_remaining,
      food_habit = EXCLUDED.food_habit,
      smoking = EXCLUDED.smoking,
      drinking = EXCLUDED.drinking;
INSERT INTO public.profiles (
      id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at, star, raasi, lagnam, gothram, tier, contacts_remaining, interests_remaining, food_habit, smoking, drinking
    ) VALUES (
      '00000000-0000-4000-a000-000000000032', 'TM000050', 'Shalini Nathan', 'female', '1994-02-09', 152, 'never_married', 'Hindu', 'Sengunthar', 'Sengunthar subcaste', 'no', 'B.E. / B.Tech', 'B.E. / B.Tech Graduate', 'Police Officer', 'Police Officer Details', '₹10 Lakhs - ₹15 Lakhs', 'Government Service', 'Chennai', 'Chennai', 'Hi, I am Shalini. I have completed my B.E. / B.Tech and am currently working as a Police Officer at Government Service in Chennai. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'rich', true, false, true, 100, NOW() - INTERVAL '10 days', 'Anuradha', 'Simham', 'Mesham', 'Kasyapa', 'free', 5, 5, 'vegetarian', 'no', 'no'
    ) ON CONFLICT (id) DO UPDATE SET
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
      is_verified = EXCLUDED.is_verified,
      is_premium = EXCLUDED.is_premium,
      is_profile_complete = EXCLUDED.is_profile_complete,
      profile_completion_percent = EXCLUDED.profile_completion_percent,
      last_active_at = EXCLUDED.last_active_at,
      star = EXCLUDED.star,
      raasi = EXCLUDED.raasi,
      lagnam = EXCLUDED.lagnam,
      gothram = EXCLUDED.gothram,
      tier = EXCLUDED.tier,
      contacts_remaining = EXCLUDED.contacts_remaining,
      interests_remaining = EXCLUDED.interests_remaining,
      food_habit = EXCLUDED.food_habit,
      smoking = EXCLUDED.smoking,
      drinking = EXCLUDED.drinking;
INSERT INTO public.profiles (
      id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at, star, raasi, lagnam, gothram, tier, contacts_remaining, interests_remaining, food_habit, smoking, drinking
    ) VALUES (
      '00000000-0000-4000-a000-000000000033', 'TM000051', 'Kabilan Kumar', 'male', '1991-10-02', 166, 'never_married', 'Hindu', 'Gounder', 'Gounder subcaste', 'no', 'M.B.A', 'M.B.A Graduate', 'College Professor', 'College Professor Details', '₹3 Lakhs - ₹5 Lakhs', 'TCS', 'Tiruppur', 'Tiruppur', 'Hi, I am Kabilan. I have completed my M.B.A and am currently working as a College Professor at TCS in Tiruppur. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'rich', false, false, true, 100, NOW() - INTERVAL '4 days', 'Hasta', 'Viruchigam', 'Viruchigam', 'Bharadwaj', 'free', 5, 5, 'vegetarian', 'no', 'no'
    ) ON CONFLICT (id) DO UPDATE SET
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
      is_verified = EXCLUDED.is_verified,
      is_premium = EXCLUDED.is_premium,
      is_profile_complete = EXCLUDED.is_profile_complete,
      profile_completion_percent = EXCLUDED.profile_completion_percent,
      last_active_at = EXCLUDED.last_active_at,
      star = EXCLUDED.star,
      raasi = EXCLUDED.raasi,
      lagnam = EXCLUDED.lagnam,
      gothram = EXCLUDED.gothram,
      tier = EXCLUDED.tier,
      contacts_remaining = EXCLUDED.contacts_remaining,
      interests_remaining = EXCLUDED.interests_remaining,
      food_habit = EXCLUDED.food_habit,
      smoking = EXCLUDED.smoking,
      drinking = EXCLUDED.drinking;
INSERT INTO public.profiles (
      id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at, star, raasi, lagnam, gothram, tier, contacts_remaining, interests_remaining, food_habit, smoking, drinking
    ) VALUES (
      '00000000-0000-4000-a000-000000000034', 'TM000052', 'Radha Nathan', 'female', '1999-11-16', 167, 'never_married', 'Hindu', 'Arunthathiyar', 'Arunthathiyar subcaste', 'yes', 'M.C.A', 'M.C.A Graduate', 'Police Officer', 'Police Officer Details', '₹5 Lakhs - ₹7 Lakhs', 'Infosys', 'Kanchipuram', 'Kanchipuram', 'Hi, I am Radha. I have completed my M.C.A and am currently working as a Police Officer at Infosys in Kanchipuram. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'upper_middle_class', true, true, true, 100, NOW() - INTERVAL '10 days', 'Punarvasu', 'Kanni', 'Meenam', 'Vishnu', 'gold', 50, 100, 'vegetarian', 'no', 'no'
    ) ON CONFLICT (id) DO UPDATE SET
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
      is_verified = EXCLUDED.is_verified,
      is_premium = EXCLUDED.is_premium,
      is_profile_complete = EXCLUDED.is_profile_complete,
      profile_completion_percent = EXCLUDED.profile_completion_percent,
      last_active_at = EXCLUDED.last_active_at,
      star = EXCLUDED.star,
      raasi = EXCLUDED.raasi,
      lagnam = EXCLUDED.lagnam,
      gothram = EXCLUDED.gothram,
      tier = EXCLUDED.tier,
      contacts_remaining = EXCLUDED.contacts_remaining,
      interests_remaining = EXCLUDED.interests_remaining,
      food_habit = EXCLUDED.food_habit,
      smoking = EXCLUDED.smoking,
      drinking = EXCLUDED.drinking;
INSERT INTO public.profiles (
      id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at, star, raasi, lagnam, gothram, tier, contacts_remaining, interests_remaining, food_habit, smoking, drinking
    ) VALUES (
      '00000000-0000-4000-a000-000000000035', 'TM000053', 'Naveen Samy', 'male', '1989-12-03', 180, 'never_married', 'Hindu', 'Brahmin - Iyer', NULL, 'no', 'B.E. / B.Tech', 'B.E. / B.Tech Graduate', 'Auditor', 'Auditor Details', '₹15 Lakhs - ₹20 Lakhs', 'Self Employed', 'Thoothukudi', 'Tuticorin', 'Hi, I am Naveen. I have completed my B.E. / B.Tech and am currently working as a Auditor at Self Employed in Thoothukudi. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'rich', true, true, true, 100, NOW() - INTERVAL '1 days', 'Chitra', 'Simham', 'Kumbam', 'Atri', 'gold', 50, 100, 'vegetarian', 'no', 'no'
    ) ON CONFLICT (id) DO UPDATE SET
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
      is_verified = EXCLUDED.is_verified,
      is_premium = EXCLUDED.is_premium,
      is_profile_complete = EXCLUDED.is_profile_complete,
      profile_completion_percent = EXCLUDED.profile_completion_percent,
      last_active_at = EXCLUDED.last_active_at,
      star = EXCLUDED.star,
      raasi = EXCLUDED.raasi,
      lagnam = EXCLUDED.lagnam,
      gothram = EXCLUDED.gothram,
      tier = EXCLUDED.tier,
      contacts_remaining = EXCLUDED.contacts_remaining,
      interests_remaining = EXCLUDED.interests_remaining,
      food_habit = EXCLUDED.food_habit,
      smoking = EXCLUDED.smoking,
      drinking = EXCLUDED.drinking;
INSERT INTO public.profiles (
      id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at, star, raasi, lagnam, gothram, tier, contacts_remaining, interests_remaining, food_habit, smoking, drinking
    ) VALUES (
      '00000000-0000-4000-a000-000000000036', 'TM000054', 'Divya Sundaram', 'female', '1999-09-06', 154, 'never_married', 'Christian', 'Protestant Christian', NULL, 'yes', 'B.Ed', 'B.Ed Graduate', 'Mechanical Engineer', 'Mechanical Engineer Details', '₹7 Lakhs - ₹10 Lakhs', 'Cognizant', 'Thanjavur', 'Thanjavur', 'Hi, I am Divya. I have completed my B.Ed and am currently working as a Mechanical Engineer at Cognizant in Thanjavur. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'joint', 'middle_class', false, false, true, 100, NOW() - INTERVAL '8 days', 'Shatabhisha', 'Kumbam', 'Thulaam', 'Harita', 'free', 5, 5, 'vegetarian', 'no', 'no'
    ) ON CONFLICT (id) DO UPDATE SET
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
      is_verified = EXCLUDED.is_verified,
      is_premium = EXCLUDED.is_premium,
      is_profile_complete = EXCLUDED.is_profile_complete,
      profile_completion_percent = EXCLUDED.profile_completion_percent,
      last_active_at = EXCLUDED.last_active_at,
      star = EXCLUDED.star,
      raasi = EXCLUDED.raasi,
      lagnam = EXCLUDED.lagnam,
      gothram = EXCLUDED.gothram,
      tier = EXCLUDED.tier,
      contacts_remaining = EXCLUDED.contacts_remaining,
      interests_remaining = EXCLUDED.interests_remaining,
      food_habit = EXCLUDED.food_habit,
      smoking = EXCLUDED.smoking,
      drinking = EXCLUDED.drinking;
INSERT INTO public.profiles (
      id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at, star, raasi, lagnam, gothram, tier, contacts_remaining, interests_remaining, food_habit, smoking, drinking
    ) VALUES (
      '00000000-0000-4000-a000-000000000037', 'TM000055', 'Dinesh Nathan', 'male', '1993-04-13', 184, 'never_married', 'Christian', 'Nadar Christian', 'Nadar Christian subcaste', 'no', 'B.A', 'B.A Graduate', 'College Professor', 'College Professor Details', '₹20 Lakhs+', 'TCS', 'Tiruchirappalli', 'Trichy', 'Hi, I am Dinesh. I have completed my B.A and am currently working as a College Professor at TCS in Tiruchirappalli. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'upper_middle_class', true, false, true, 100, NOW() - INTERVAL '0 days', 'Uttarachadha', 'Mithunam', 'Rishabam', 'Siva', 'free', 5, 5, 'vegetarian', 'no', 'no'
    ) ON CONFLICT (id) DO UPDATE SET
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
      is_verified = EXCLUDED.is_verified,
      is_premium = EXCLUDED.is_premium,
      is_profile_complete = EXCLUDED.is_profile_complete,
      profile_completion_percent = EXCLUDED.profile_completion_percent,
      last_active_at = EXCLUDED.last_active_at,
      star = EXCLUDED.star,
      raasi = EXCLUDED.raasi,
      lagnam = EXCLUDED.lagnam,
      gothram = EXCLUDED.gothram,
      tier = EXCLUDED.tier,
      contacts_remaining = EXCLUDED.contacts_remaining,
      interests_remaining = EXCLUDED.interests_remaining,
      food_habit = EXCLUDED.food_habit,
      smoking = EXCLUDED.smoking,
      drinking = EXCLUDED.drinking;
INSERT INTO public.profiles (
      id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at, star, raasi, lagnam, gothram, tier, contacts_remaining, interests_remaining, food_habit, smoking, drinking
    ) VALUES (
      '00000000-0000-4000-a000-000000000038', 'TM000056', 'Shalini Kumar', 'female', '1991-11-01', 158, 'never_married', 'Hindu', 'Agamudayar', 'Agamudayar subcaste', 'no', 'M.C.A', 'M.C.A Graduate', 'Auditor', 'Auditor Details', '₹7 Lakhs - ₹10 Lakhs', 'Government Service', 'Vellore', 'Vellore', 'Hi, I am Shalini. I have completed my M.C.A and am currently working as a Auditor at Government Service in Vellore. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'middle_class', true, false, true, 100, NOW() - INTERVAL '3 days', 'Arudra', 'Kanni', 'Viruchigam', 'Harita', 'free', 5, 5, 'vegetarian', 'no', 'no'
    ) ON CONFLICT (id) DO UPDATE SET
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
      is_verified = EXCLUDED.is_verified,
      is_premium = EXCLUDED.is_premium,
      is_profile_complete = EXCLUDED.is_profile_complete,
      profile_completion_percent = EXCLUDED.profile_completion_percent,
      last_active_at = EXCLUDED.last_active_at,
      star = EXCLUDED.star,
      raasi = EXCLUDED.raasi,
      lagnam = EXCLUDED.lagnam,
      gothram = EXCLUDED.gothram,
      tier = EXCLUDED.tier,
      contacts_remaining = EXCLUDED.contacts_remaining,
      interests_remaining = EXCLUDED.interests_remaining,
      food_habit = EXCLUDED.food_habit,
      smoking = EXCLUDED.smoking,
      drinking = EXCLUDED.drinking;
INSERT INTO public.profiles (
      id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at, star, raasi, lagnam, gothram, tier, contacts_remaining, interests_remaining, food_habit, smoking, drinking
    ) VALUES (
      '00000000-0000-4000-a000-000000000039', 'TM000057', 'Jayakumar Naicker', 'male', '1993-09-08', 187, 'never_married', 'Hindu', 'Gounder', 'Gounder subcaste', 'no', 'M.A', 'M.A Graduate', 'Bank Manager', 'Bank Manager Details', '₹10 Lakhs - ₹15 Lakhs', 'Self Employed', 'Tiruppur', 'Tiruppur', 'Hi, I am Jayakumar. I have completed my M.A and am currently working as a Bank Manager at Self Employed in Tiruppur. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'rich', true, false, true, 100, NOW() - INTERVAL '7 days', 'Anuradha', 'Meenam', 'Mesham', 'Angirasa', 'free', 5, 5, 'vegetarian', 'no', 'no'
    ) ON CONFLICT (id) DO UPDATE SET
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
      is_verified = EXCLUDED.is_verified,
      is_premium = EXCLUDED.is_premium,
      is_profile_complete = EXCLUDED.is_profile_complete,
      profile_completion_percent = EXCLUDED.profile_completion_percent,
      last_active_at = EXCLUDED.last_active_at,
      star = EXCLUDED.star,
      raasi = EXCLUDED.raasi,
      lagnam = EXCLUDED.lagnam,
      gothram = EXCLUDED.gothram,
      tier = EXCLUDED.tier,
      contacts_remaining = EXCLUDED.contacts_remaining,
      interests_remaining = EXCLUDED.interests_remaining,
      food_habit = EXCLUDED.food_habit,
      smoking = EXCLUDED.smoking,
      drinking = EXCLUDED.drinking;
INSERT INTO public.profiles (
      id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at, star, raasi, lagnam, gothram, tier, contacts_remaining, interests_remaining, food_habit, smoking, drinking
    ) VALUES (
      '00000000-0000-4000-a000-00000000003a', 'TM000058', 'Swetha Velan', 'female', '1993-02-27', 175, 'never_married', 'Muslim', 'Labbai', NULL, 'no', 'M.B.A', 'M.B.A Graduate', 'Mechanical Engineer', 'Mechanical Engineer Details', '₹20 Lakhs+', 'Private Practice', 'Erode', 'Erode', 'Hi, I am Swetha. I have completed my M.B.A and am currently working as a Mechanical Engineer at Private Practice in Erode. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'middle_class', true, false, true, 100, NOW() - INTERVAL '4 days', 'Uttaraphalguni', 'Dhanusu', 'Viruchigam', 'Vishnu', 'free', 5, 5, 'vegetarian', 'no', 'no'
    ) ON CONFLICT (id) DO UPDATE SET
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
      is_verified = EXCLUDED.is_verified,
      is_premium = EXCLUDED.is_premium,
      is_profile_complete = EXCLUDED.is_profile_complete,
      profile_completion_percent = EXCLUDED.profile_completion_percent,
      last_active_at = EXCLUDED.last_active_at,
      star = EXCLUDED.star,
      raasi = EXCLUDED.raasi,
      lagnam = EXCLUDED.lagnam,
      gothram = EXCLUDED.gothram,
      tier = EXCLUDED.tier,
      contacts_remaining = EXCLUDED.contacts_remaining,
      interests_remaining = EXCLUDED.interests_remaining,
      food_habit = EXCLUDED.food_habit,
      smoking = EXCLUDED.smoking,
      drinking = EXCLUDED.drinking;
INSERT INTO public.profiles (
      id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at, star, raasi, lagnam, gothram, tier, contacts_remaining, interests_remaining, food_habit, smoking, drinking
    ) VALUES (
      '00000000-0000-4000-a000-00000000003b', 'TM000059', 'Anand Selvan', 'male', '1990-05-24', 187, 'never_married', 'Hindu', 'Naicker', 'Naicker subcaste', 'yes', 'M.Sc', 'M.Sc Graduate', 'Bank Manager', 'Bank Manager Details', '₹5 Lakhs - ₹7 Lakhs', 'HCL', 'Thoothukudi', 'Tuticorin', 'Hi, I am Anand. I have completed my M.Sc and am currently working as a Bank Manager at HCL in Thoothukudi. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'rich', true, false, true, 100, NOW() - INTERVAL '9 days', 'Dhanishta', 'Meenam', 'Thulaam', 'Angirasa', 'free', 5, 5, 'vegetarian', 'no', 'no'
    ) ON CONFLICT (id) DO UPDATE SET
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
      is_verified = EXCLUDED.is_verified,
      is_premium = EXCLUDED.is_premium,
      is_profile_complete = EXCLUDED.is_profile_complete,
      profile_completion_percent = EXCLUDED.profile_completion_percent,
      last_active_at = EXCLUDED.last_active_at,
      star = EXCLUDED.star,
      raasi = EXCLUDED.raasi,
      lagnam = EXCLUDED.lagnam,
      gothram = EXCLUDED.gothram,
      tier = EXCLUDED.tier,
      contacts_remaining = EXCLUDED.contacts_remaining,
      interests_remaining = EXCLUDED.interests_remaining,
      food_habit = EXCLUDED.food_habit,
      smoking = EXCLUDED.smoking,
      drinking = EXCLUDED.drinking;
INSERT INTO public.profiles (
      id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at, star, raasi, lagnam, gothram, tier, contacts_remaining, interests_remaining, food_habit, smoking, drinking
    ) VALUES (
      '00000000-0000-4000-a000-00000000003c', 'TM000060', 'Gayathri Nathan', 'female', '1989-11-04', 173, 'divorced', 'Hindu', 'Gounder', NULL, 'no', 'M.A', 'M.A Graduate', 'Software Engineer', 'Software Engineer Details', '₹5 Lakhs - ₹7 Lakhs', 'Zoho', 'Erode', 'Erode', 'Hi, I am Gayathri. I have completed my M.A and am currently working as a Software Engineer at Zoho in Erode. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'joint', 'middle_class', false, false, true, 100, NOW() - INTERVAL '0 days', 'Aslesha', 'Kanni', 'Kumbam', 'Harita', 'free', 5, 5, 'vegetarian', 'no', 'no'
    ) ON CONFLICT (id) DO UPDATE SET
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
      is_verified = EXCLUDED.is_verified,
      is_premium = EXCLUDED.is_premium,
      is_profile_complete = EXCLUDED.is_profile_complete,
      profile_completion_percent = EXCLUDED.profile_completion_percent,
      last_active_at = EXCLUDED.last_active_at,
      star = EXCLUDED.star,
      raasi = EXCLUDED.raasi,
      lagnam = EXCLUDED.lagnam,
      gothram = EXCLUDED.gothram,
      tier = EXCLUDED.tier,
      contacts_remaining = EXCLUDED.contacts_remaining,
      interests_remaining = EXCLUDED.interests_remaining,
      food_habit = EXCLUDED.food_habit,
      smoking = EXCLUDED.smoking,
      drinking = EXCLUDED.drinking;
INSERT INTO public.profiles (
      id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at, star, raasi, lagnam, gothram, tier, contacts_remaining, interests_remaining, food_habit, smoking, drinking
    ) VALUES (
      '00000000-0000-4000-a000-00000000003d', 'TM000061', 'Anand Devan', 'male', '2000-03-14', 174, 'never_married', 'Hindu', 'Vellalar', 'Vellalar subcaste', 'yes', 'B.Sc', 'B.Sc Graduate', 'Dentist', 'Dentist Details', '₹10 Lakhs - ₹15 Lakhs', 'Accenture', 'Kanchipuram', 'Kanchipuram', 'Hi, I am Anand. I have completed my B.Sc and am currently working as a Dentist at Accenture in Kanchipuram. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'upper_middle_class', true, false, true, 100, NOW() - INTERVAL '8 days', 'Magha', 'Dhanusu', 'Mithunam', 'Angirasa', 'free', 5, 5, 'vegetarian', 'no', 'no'
    ) ON CONFLICT (id) DO UPDATE SET
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
      is_verified = EXCLUDED.is_verified,
      is_premium = EXCLUDED.is_premium,
      is_profile_complete = EXCLUDED.is_profile_complete,
      profile_completion_percent = EXCLUDED.profile_completion_percent,
      last_active_at = EXCLUDED.last_active_at,
      star = EXCLUDED.star,
      raasi = EXCLUDED.raasi,
      lagnam = EXCLUDED.lagnam,
      gothram = EXCLUDED.gothram,
      tier = EXCLUDED.tier,
      contacts_remaining = EXCLUDED.contacts_remaining,
      interests_remaining = EXCLUDED.interests_remaining,
      food_habit = EXCLUDED.food_habit,
      smoking = EXCLUDED.smoking,
      drinking = EXCLUDED.drinking;
INSERT INTO public.profiles (
      id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at, star, raasi, lagnam, gothram, tier, contacts_remaining, interests_remaining, food_habit, smoking, drinking
    ) VALUES (
      '00000000-0000-4000-a000-00000000003e', 'TM000062', 'Nandhini Pandian', 'female', '1998-05-16', 157, 'never_married', 'Christian', 'Protestant Christian', NULL, 'no', 'M.B.B.S', 'M.B.B.S Graduate', 'Advocate', 'Advocate Details', '₹15 Lakhs - ₹20 Lakhs', 'Wipro', 'Chennai', 'Chennai', 'Hi, I am Nandhini. I have completed my M.B.B.S and am currently working as a Advocate at Wipro in Chennai. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'joint', 'rich', true, false, true, 100, NOW() - INTERVAL '9 days', 'Anuradha', 'Kanni', 'Mesham', 'Siva', 'free', 5, 5, 'vegetarian', 'no', 'no'
    ) ON CONFLICT (id) DO UPDATE SET
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
      is_verified = EXCLUDED.is_verified,
      is_premium = EXCLUDED.is_premium,
      is_profile_complete = EXCLUDED.is_profile_complete,
      profile_completion_percent = EXCLUDED.profile_completion_percent,
      last_active_at = EXCLUDED.last_active_at,
      star = EXCLUDED.star,
      raasi = EXCLUDED.raasi,
      lagnam = EXCLUDED.lagnam,
      gothram = EXCLUDED.gothram,
      tier = EXCLUDED.tier,
      contacts_remaining = EXCLUDED.contacts_remaining,
      interests_remaining = EXCLUDED.interests_remaining,
      food_habit = EXCLUDED.food_habit,
      smoking = EXCLUDED.smoking,
      drinking = EXCLUDED.drinking;
INSERT INTO public.profiles (
      id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at, star, raasi, lagnam, gothram, tier, contacts_remaining, interests_remaining, food_habit, smoking, drinking
    ) VALUES (
      '00000000-0000-4000-a000-00000000003f', 'TM000063', 'Kannan Samy', 'male', '1999-09-19', 163, 'never_married', 'Hindu', 'Yadav', 'Yadav subcaste', 'yes', 'B.Com', 'B.Com Graduate', 'Business Owner', 'Business Owner Details', '₹10 Lakhs - ₹15 Lakhs', 'Self Employed', 'Tiruppur', 'Tiruppur', 'Hi, I am Kannan. I have completed my B.Com and am currently working as a Business Owner at Self Employed in Tiruppur. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'joint', 'upper_middle_class', false, false, true, 100, NOW() - INTERVAL '6 days', 'Rohini', 'Rishabam', 'Simham', 'Vashishta', 'free', 5, 5, 'vegetarian', 'no', 'no'
    ) ON CONFLICT (id) DO UPDATE SET
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
      is_verified = EXCLUDED.is_verified,
      is_premium = EXCLUDED.is_premium,
      is_profile_complete = EXCLUDED.is_profile_complete,
      profile_completion_percent = EXCLUDED.profile_completion_percent,
      last_active_at = EXCLUDED.last_active_at,
      star = EXCLUDED.star,
      raasi = EXCLUDED.raasi,
      lagnam = EXCLUDED.lagnam,
      gothram = EXCLUDED.gothram,
      tier = EXCLUDED.tier,
      contacts_remaining = EXCLUDED.contacts_remaining,
      interests_remaining = EXCLUDED.interests_remaining,
      food_habit = EXCLUDED.food_habit,
      smoking = EXCLUDED.smoking,
      drinking = EXCLUDED.drinking;
INSERT INTO public.profiles (
      id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at, star, raasi, lagnam, gothram, tier, contacts_remaining, interests_remaining, food_habit, smoking, drinking
    ) VALUES (
      '00000000-0000-4000-a000-000000000040', 'TM000064', 'Deepa Swamy', 'female', '2001-08-03', 155, 'divorced', 'Hindu', 'Naidu', NULL, 'no', 'M.Com', 'M.Com Graduate', 'Architect', 'Architect Details', '₹20 Lakhs+', 'Zoho', 'Thanjavur', 'Thanjavur', 'Hi, I am Deepa. I have completed my M.Com and am currently working as a Architect at Zoho in Thanjavur. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'middle_class', false, false, true, 100, NOW() - INTERVAL '8 days', 'Poorvashadha', 'Thulaam', 'Kanni', 'Atri', 'free', 5, 5, 'vegetarian', 'no', 'no'
    ) ON CONFLICT (id) DO UPDATE SET
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
      is_verified = EXCLUDED.is_verified,
      is_premium = EXCLUDED.is_premium,
      is_profile_complete = EXCLUDED.is_profile_complete,
      profile_completion_percent = EXCLUDED.profile_completion_percent,
      last_active_at = EXCLUDED.last_active_at,
      star = EXCLUDED.star,
      raasi = EXCLUDED.raasi,
      lagnam = EXCLUDED.lagnam,
      gothram = EXCLUDED.gothram,
      tier = EXCLUDED.tier,
      contacts_remaining = EXCLUDED.contacts_remaining,
      interests_remaining = EXCLUDED.interests_remaining,
      food_habit = EXCLUDED.food_habit,
      smoking = EXCLUDED.smoking,
      drinking = EXCLUDED.drinking;
INSERT INTO public.profiles (
      id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at, star, raasi, lagnam, gothram, tier, contacts_remaining, interests_remaining, food_habit, smoking, drinking
    ) VALUES (
      '00000000-0000-4000-a000-000000000041', 'TM000065', 'Jayakumar Lingam', 'male', '2005-01-13', 186, 'never_married', 'Hindu', 'Vellalar', 'Vellalar subcaste', 'no', 'M.B.B.S', 'M.B.B.S Graduate', 'Civil Engineer', 'Civil Engineer Details', '₹3 Lakhs - ₹5 Lakhs', 'Private Practice', 'Thoothukudi', 'Tuticorin', 'Hi, I am Jayakumar. I have completed my M.B.B.S and am currently working as a Civil Engineer at Private Practice in Thoothukudi. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'joint', 'middle_class', true, false, true, 100, NOW() - INTERVAL '0 days', 'Uttarabhadrapada', 'Kanni', 'Kadagam', 'Vashishta', 'free', 5, 5, 'vegetarian', 'no', 'no'
    ) ON CONFLICT (id) DO UPDATE SET
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
      is_verified = EXCLUDED.is_verified,
      is_premium = EXCLUDED.is_premium,
      is_profile_complete = EXCLUDED.is_profile_complete,
      profile_completion_percent = EXCLUDED.profile_completion_percent,
      last_active_at = EXCLUDED.last_active_at,
      star = EXCLUDED.star,
      raasi = EXCLUDED.raasi,
      lagnam = EXCLUDED.lagnam,
      gothram = EXCLUDED.gothram,
      tier = EXCLUDED.tier,
      contacts_remaining = EXCLUDED.contacts_remaining,
      interests_remaining = EXCLUDED.interests_remaining,
      food_habit = EXCLUDED.food_habit,
      smoking = EXCLUDED.smoking,
      drinking = EXCLUDED.drinking;
INSERT INTO public.profiles (
      id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at, star, raasi, lagnam, gothram, tier, contacts_remaining, interests_remaining, food_habit, smoking, drinking
    ) VALUES (
      '00000000-0000-4000-a000-000000000042', 'TM000066', 'Radha Swamy', 'female', '2000-02-13', 164, 'divorced', 'Hindu', 'Maravar', 'Maravar subcaste', 'yes', 'B.Sc', 'B.Sc Graduate', 'School Teacher', 'School Teacher Details', '₹7 Lakhs - ₹10 Lakhs', 'Government Service', 'Chennai', 'Chennai', 'Hi, I am Radha. I have completed my B.Sc and am currently working as a School Teacher at Government Service in Chennai. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'rich', true, false, true, 100, NOW() - INTERVAL '9 days', 'Krittika', 'Kumbam', 'Magaram', 'Harita', 'free', 5, 5, 'vegetarian', 'no', 'no'
    ) ON CONFLICT (id) DO UPDATE SET
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
      is_verified = EXCLUDED.is_verified,
      is_premium = EXCLUDED.is_premium,
      is_profile_complete = EXCLUDED.is_profile_complete,
      profile_completion_percent = EXCLUDED.profile_completion_percent,
      last_active_at = EXCLUDED.last_active_at,
      star = EXCLUDED.star,
      raasi = EXCLUDED.raasi,
      lagnam = EXCLUDED.lagnam,
      gothram = EXCLUDED.gothram,
      tier = EXCLUDED.tier,
      contacts_remaining = EXCLUDED.contacts_remaining,
      interests_remaining = EXCLUDED.interests_remaining,
      food_habit = EXCLUDED.food_habit,
      smoking = EXCLUDED.smoking,
      drinking = EXCLUDED.drinking;
INSERT INTO public.profiles (
      id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at, star, raasi, lagnam, gothram, tier, contacts_remaining, interests_remaining, food_habit, smoking, drinking
    ) VALUES (
      '00000000-0000-4000-a000-000000000043', 'TM000067', 'Prabhu Sundaram', 'male', '1996-09-11', 163, 'divorced', 'Hindu', 'Sengunthar', NULL, 'yes', 'B.Sc', 'B.Sc Graduate', 'Doctor', 'Doctor Details', '₹10 Lakhs - ₹15 Lakhs', 'HCL', 'Salem', 'Salem', 'Hi, I am Prabhu. I have completed my B.Sc and am currently working as a Doctor at HCL in Salem. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'upper_middle_class', false, true, true, 100, NOW() - INTERVAL '7 days', 'Aslesha', 'Meenam', 'Simham', 'Viswamitra', 'gold', 50, 100, 'vegetarian', 'no', 'no'
    ) ON CONFLICT (id) DO UPDATE SET
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
      is_verified = EXCLUDED.is_verified,
      is_premium = EXCLUDED.is_premium,
      is_profile_complete = EXCLUDED.is_profile_complete,
      profile_completion_percent = EXCLUDED.profile_completion_percent,
      last_active_at = EXCLUDED.last_active_at,
      star = EXCLUDED.star,
      raasi = EXCLUDED.raasi,
      lagnam = EXCLUDED.lagnam,
      gothram = EXCLUDED.gothram,
      tier = EXCLUDED.tier,
      contacts_remaining = EXCLUDED.contacts_remaining,
      interests_remaining = EXCLUDED.interests_remaining,
      food_habit = EXCLUDED.food_habit,
      smoking = EXCLUDED.smoking,
      drinking = EXCLUDED.drinking;
INSERT INTO public.profiles (
      id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at, star, raasi, lagnam, gothram, tier, contacts_remaining, interests_remaining, food_habit, smoking, drinking
    ) VALUES (
      '00000000-0000-4000-a000-000000000044', 'TM000068', 'Soundarya Sundaram', 'female', '1991-05-25', 170, 'never_married', 'Hindu', 'Vishwakarma', 'Vishwakarma subcaste', 'no', 'B.E. / B.Tech', 'B.E. / B.Tech Graduate', 'Dentist', 'Dentist Details', '₹10 Lakhs - ₹15 Lakhs', 'Private Practice', 'Thoothukudi', 'Tuticorin', 'Hi, I am Soundarya. I have completed my B.E. / B.Tech and am currently working as a Dentist at Private Practice in Thoothukudi. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'middle_class', true, true, true, 100, NOW() - INTERVAL '6 days', 'Revati', 'Viruchigam', 'Viruchigam', 'Kasyapa', 'gold', 50, 100, 'vegetarian', 'no', 'no'
    ) ON CONFLICT (id) DO UPDATE SET
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
      is_verified = EXCLUDED.is_verified,
      is_premium = EXCLUDED.is_premium,
      is_profile_complete = EXCLUDED.is_profile_complete,
      profile_completion_percent = EXCLUDED.profile_completion_percent,
      last_active_at = EXCLUDED.last_active_at,
      star = EXCLUDED.star,
      raasi = EXCLUDED.raasi,
      lagnam = EXCLUDED.lagnam,
      gothram = EXCLUDED.gothram,
      tier = EXCLUDED.tier,
      contacts_remaining = EXCLUDED.contacts_remaining,
      interests_remaining = EXCLUDED.interests_remaining,
      food_habit = EXCLUDED.food_habit,
      smoking = EXCLUDED.smoking,
      drinking = EXCLUDED.drinking;
INSERT INTO public.profiles (
      id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at, star, raasi, lagnam, gothram, tier, contacts_remaining, interests_remaining, food_habit, smoking, drinking
    ) VALUES (
      '00000000-0000-4000-a000-000000000045', 'TM000069', 'Aravind Raman', 'male', '1998-11-07', 164, 'never_married', 'Hindu', 'Nadar', NULL, 'yes', 'M.Sc', 'M.Sc Graduate', 'Mechanical Engineer', 'Mechanical Engineer Details', '₹5 Lakhs - ₹7 Lakhs', 'HCL', 'Coimbatore', 'Coimbatore', 'Hi, I am Aravind. I have completed my M.Sc and am currently working as a Mechanical Engineer at HCL in Coimbatore. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'upper_middle_class', false, false, true, 100, NOW() - INTERVAL '10 days', 'Swati', 'Meenam', 'Kadagam', 'Vishnu', 'free', 5, 5, 'vegetarian', 'no', 'no'
    ) ON CONFLICT (id) DO UPDATE SET
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
      is_verified = EXCLUDED.is_verified,
      is_premium = EXCLUDED.is_premium,
      is_profile_complete = EXCLUDED.is_profile_complete,
      profile_completion_percent = EXCLUDED.profile_completion_percent,
      last_active_at = EXCLUDED.last_active_at,
      star = EXCLUDED.star,
      raasi = EXCLUDED.raasi,
      lagnam = EXCLUDED.lagnam,
      gothram = EXCLUDED.gothram,
      tier = EXCLUDED.tier,
      contacts_remaining = EXCLUDED.contacts_remaining,
      interests_remaining = EXCLUDED.interests_remaining,
      food_habit = EXCLUDED.food_habit,
      smoking = EXCLUDED.smoking,
      drinking = EXCLUDED.drinking;
INSERT INTO public.profiles (
      id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at, star, raasi, lagnam, gothram, tier, contacts_remaining, interests_remaining, food_habit, smoking, drinking
    ) VALUES (
      '00000000-0000-4000-a000-000000000046', 'TM000070', 'Dharshini Nathan', 'female', '1999-03-27', 171, 'divorced', 'Hindu', 'Thevar', 'Thevar subcaste', 'no', 'M.A', 'M.A Graduate', 'Mechanical Engineer', 'Mechanical Engineer Details', '₹5 Lakhs - ₹7 Lakhs', 'Government Service', 'Tiruppur', 'Tiruppur', 'Hi, I am Dharshini. I have completed my M.A and am currently working as a Mechanical Engineer at Government Service in Tiruppur. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'upper_middle_class', true, true, true, 100, NOW() - INTERVAL '1 days', 'Poorvashadha', 'Dhanusu', 'Kanni', 'Siva', 'gold', 50, 100, 'vegetarian', 'no', 'no'
    ) ON CONFLICT (id) DO UPDATE SET
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
      is_verified = EXCLUDED.is_verified,
      is_premium = EXCLUDED.is_premium,
      is_profile_complete = EXCLUDED.is_profile_complete,
      profile_completion_percent = EXCLUDED.profile_completion_percent,
      last_active_at = EXCLUDED.last_active_at,
      star = EXCLUDED.star,
      raasi = EXCLUDED.raasi,
      lagnam = EXCLUDED.lagnam,
      gothram = EXCLUDED.gothram,
      tier = EXCLUDED.tier,
      contacts_remaining = EXCLUDED.contacts_remaining,
      interests_remaining = EXCLUDED.interests_remaining,
      food_habit = EXCLUDED.food_habit,
      smoking = EXCLUDED.smoking,
      drinking = EXCLUDED.drinking;
INSERT INTO public.profiles (
      id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at, star, raasi, lagnam, gothram, tier, contacts_remaining, interests_remaining, food_habit, smoking, drinking
    ) VALUES (
      '00000000-0000-4000-a000-000000000047', 'TM000071', 'Karthik Nathan', 'male', '2005-07-10', 175, 'divorced', 'Hindu', 'Vanniyar', NULL, 'yes', 'M.C.A', 'M.C.A Graduate', 'Government Officer', 'Government Officer Details', '₹10 Lakhs - ₹15 Lakhs', 'HCL', 'Tiruchirappalli', 'Trichy', 'Hi, I am Karthik. I have completed my M.C.A and am currently working as a Government Officer at HCL in Tiruchirappalli. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'middle_class', true, false, true, 100, NOW() - INTERVAL '6 days', 'Krittika', 'Mesham', 'Meenam', 'Angirasa', 'free', 5, 5, 'vegetarian', 'no', 'no'
    ) ON CONFLICT (id) DO UPDATE SET
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
      is_verified = EXCLUDED.is_verified,
      is_premium = EXCLUDED.is_premium,
      is_profile_complete = EXCLUDED.is_profile_complete,
      profile_completion_percent = EXCLUDED.profile_completion_percent,
      last_active_at = EXCLUDED.last_active_at,
      star = EXCLUDED.star,
      raasi = EXCLUDED.raasi,
      lagnam = EXCLUDED.lagnam,
      gothram = EXCLUDED.gothram,
      tier = EXCLUDED.tier,
      contacts_remaining = EXCLUDED.contacts_remaining,
      interests_remaining = EXCLUDED.interests_remaining,
      food_habit = EXCLUDED.food_habit,
      smoking = EXCLUDED.smoking,
      drinking = EXCLUDED.drinking;
INSERT INTO public.profiles (
      id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at, star, raasi, lagnam, gothram, tier, contacts_remaining, interests_remaining, food_habit, smoking, drinking
    ) VALUES (
      '00000000-0000-4000-a000-000000000048', 'TM000072', 'Vijaya Krishnan', 'female', '2004-04-15', 165, 'never_married', 'Hindu', 'Adi Dravida', NULL, 'no', 'B.Com', 'B.Com Graduate', 'Dentist', 'Dentist Details', '₹7 Lakhs - ₹10 Lakhs', 'Wipro', 'Thanjavur', 'Thanjavur', 'Hi, I am Vijaya. I have completed my B.Com and am currently working as a Dentist at Wipro in Thanjavur. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'joint', 'rich', true, false, true, 100, NOW() - INTERVAL '1 days', 'Revati', 'Viruchigam', 'Magaram', 'Bharadwaj', 'free', 5, 5, 'vegetarian', 'no', 'no'
    ) ON CONFLICT (id) DO UPDATE SET
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
      is_verified = EXCLUDED.is_verified,
      is_premium = EXCLUDED.is_premium,
      is_profile_complete = EXCLUDED.is_profile_complete,
      profile_completion_percent = EXCLUDED.profile_completion_percent,
      last_active_at = EXCLUDED.last_active_at,
      star = EXCLUDED.star,
      raasi = EXCLUDED.raasi,
      lagnam = EXCLUDED.lagnam,
      gothram = EXCLUDED.gothram,
      tier = EXCLUDED.tier,
      contacts_remaining = EXCLUDED.contacts_remaining,
      interests_remaining = EXCLUDED.interests_remaining,
      food_habit = EXCLUDED.food_habit,
      smoking = EXCLUDED.smoking,
      drinking = EXCLUDED.drinking;
INSERT INTO public.profiles (
      id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at, star, raasi, lagnam, gothram, tier, contacts_remaining, interests_remaining, food_habit, smoking, drinking
    ) VALUES (
      '00000000-0000-4000-a000-000000000049', 'TM000073', 'Sakthi Murthy', 'male', '1994-10-14', 185, 'never_married', 'Hindu', 'Arunthathiyar', NULL, 'no', 'B.Ed', 'B.Ed Graduate', 'Dentist', 'Dentist Details', '₹3 Lakhs - ₹5 Lakhs', 'Private Practice', 'Salem', 'Salem', 'Hi, I am Sakthi. I have completed my B.Ed and am currently working as a Dentist at Private Practice in Salem. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'upper_middle_class', true, false, true, 100, NOW() - INTERVAL '2 days', 'Pushya', 'Dhanusu', 'Kumbam', 'Agastya', 'free', 5, 5, 'vegetarian', 'no', 'no'
    ) ON CONFLICT (id) DO UPDATE SET
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
      is_verified = EXCLUDED.is_verified,
      is_premium = EXCLUDED.is_premium,
      is_profile_complete = EXCLUDED.is_profile_complete,
      profile_completion_percent = EXCLUDED.profile_completion_percent,
      last_active_at = EXCLUDED.last_active_at,
      star = EXCLUDED.star,
      raasi = EXCLUDED.raasi,
      lagnam = EXCLUDED.lagnam,
      gothram = EXCLUDED.gothram,
      tier = EXCLUDED.tier,
      contacts_remaining = EXCLUDED.contacts_remaining,
      interests_remaining = EXCLUDED.interests_remaining,
      food_habit = EXCLUDED.food_habit,
      smoking = EXCLUDED.smoking,
      drinking = EXCLUDED.drinking;
INSERT INTO public.profiles (
      id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at, star, raasi, lagnam, gothram, tier, contacts_remaining, interests_remaining, food_habit, smoking, drinking
    ) VALUES (
      '00000000-0000-4000-a000-00000000004a', 'TM000074', 'Nandhini Swamy', 'female', '1993-02-22', 171, 'never_married', 'Christian', 'RC Christian', 'RC Christian subcaste', 'no', 'B.E. / B.Tech', 'B.E. / B.Tech Graduate', 'School Teacher', 'School Teacher Details', '₹3 Lakhs - ₹5 Lakhs', 'Zoho', 'Madurai', 'Madurai', 'Hi, I am Nandhini. I have completed my B.E. / B.Tech and am currently working as a School Teacher at Zoho in Madurai. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'joint', 'rich', false, false, true, 100, NOW() - INTERVAL '1 days', 'Hasta', 'Magaram', 'Kumbam', 'Agastya', 'free', 5, 5, 'vegetarian', 'no', 'no'
    ) ON CONFLICT (id) DO UPDATE SET
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
      is_verified = EXCLUDED.is_verified,
      is_premium = EXCLUDED.is_premium,
      is_profile_complete = EXCLUDED.is_profile_complete,
      profile_completion_percent = EXCLUDED.profile_completion_percent,
      last_active_at = EXCLUDED.last_active_at,
      star = EXCLUDED.star,
      raasi = EXCLUDED.raasi,
      lagnam = EXCLUDED.lagnam,
      gothram = EXCLUDED.gothram,
      tier = EXCLUDED.tier,
      contacts_remaining = EXCLUDED.contacts_remaining,
      interests_remaining = EXCLUDED.interests_remaining,
      food_habit = EXCLUDED.food_habit,
      smoking = EXCLUDED.smoking,
      drinking = EXCLUDED.drinking;
INSERT INTO public.profiles (
      id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at, star, raasi, lagnam, gothram, tier, contacts_remaining, interests_remaining, food_habit, smoking, drinking
    ) VALUES (
      '00000000-0000-4000-a000-00000000004b', 'TM000075', 'Karthik Naicker', 'male', '2001-10-26', 168, 'never_married', 'Hindu', 'Naidu', NULL, 'no', 'Ph.D', 'Ph.D Graduate', 'Dentist', 'Dentist Details', '₹5 Lakhs - ₹7 Lakhs', 'Government Service', 'Tirunelveli', 'Tirunelveli', 'Hi, I am Karthik. I have completed my Ph.D and am currently working as a Dentist at Government Service in Tirunelveli. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'joint', 'upper_middle_class', true, false, true, 100, NOW() - INTERVAL '5 days', 'Anuradha', 'Thulaam', 'Viruchigam', 'Murugan', 'free', 5, 5, 'vegetarian', 'no', 'no'
    ) ON CONFLICT (id) DO UPDATE SET
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
      is_verified = EXCLUDED.is_verified,
      is_premium = EXCLUDED.is_premium,
      is_profile_complete = EXCLUDED.is_profile_complete,
      profile_completion_percent = EXCLUDED.profile_completion_percent,
      last_active_at = EXCLUDED.last_active_at,
      star = EXCLUDED.star,
      raasi = EXCLUDED.raasi,
      lagnam = EXCLUDED.lagnam,
      gothram = EXCLUDED.gothram,
      tier = EXCLUDED.tier,
      contacts_remaining = EXCLUDED.contacts_remaining,
      interests_remaining = EXCLUDED.interests_remaining,
      food_habit = EXCLUDED.food_habit,
      smoking = EXCLUDED.smoking,
      drinking = EXCLUDED.drinking;
INSERT INTO public.profiles (
      id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at, star, raasi, lagnam, gothram, tier, contacts_remaining, interests_remaining, food_habit, smoking, drinking
    ) VALUES (
      '00000000-0000-4000-a000-00000000004c', 'TM000076', 'Megala Mani', 'female', '2001-03-24', 159, 'never_married', 'Hindu', 'Adi Dravida', 'Adi Dravida subcaste', 'no', 'B.Com', 'B.Com Graduate', 'HR Specialist', 'HR Specialist Details', '₹5 Lakhs - ₹7 Lakhs', 'Cognizant', 'Kanchipuram', 'Kanchipuram', 'Hi, I am Megala. I have completed my B.Com and am currently working as a HR Specialist at Cognizant in Kanchipuram. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'rich', true, false, true, 100, NOW() - INTERVAL '5 days', 'Rohini', 'Thulaam', 'Rishabam', 'Vishnu', 'free', 5, 5, 'vegetarian', 'no', 'no'
    ) ON CONFLICT (id) DO UPDATE SET
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
      is_verified = EXCLUDED.is_verified,
      is_premium = EXCLUDED.is_premium,
      is_profile_complete = EXCLUDED.is_profile_complete,
      profile_completion_percent = EXCLUDED.profile_completion_percent,
      last_active_at = EXCLUDED.last_active_at,
      star = EXCLUDED.star,
      raasi = EXCLUDED.raasi,
      lagnam = EXCLUDED.lagnam,
      gothram = EXCLUDED.gothram,
      tier = EXCLUDED.tier,
      contacts_remaining = EXCLUDED.contacts_remaining,
      interests_remaining = EXCLUDED.interests_remaining,
      food_habit = EXCLUDED.food_habit,
      smoking = EXCLUDED.smoking,
      drinking = EXCLUDED.drinking;
INSERT INTO public.profiles (
      id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at, star, raasi, lagnam, gothram, tier, contacts_remaining, interests_remaining, food_habit, smoking, drinking
    ) VALUES (
      '00000000-0000-4000-a000-00000000004d', 'TM000077', 'Surya Devan', 'male', '2000-04-02', 172, 'never_married', 'Hindu', 'Agamudayar', 'Agamudayar subcaste', 'no', 'M.B.A', 'M.B.A Graduate', 'Software Engineer', 'Software Engineer Details', '₹3 Lakhs - ₹5 Lakhs', 'TCS', 'Erode', 'Erode', 'Hi, I am Surya. I have completed my M.B.A and am currently working as a Software Engineer at TCS in Erode. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'rich', true, false, true, 100, NOW() - INTERVAL '2 days', 'Shatabhisha', 'Viruchigam', 'Simham', 'Agastya', 'free', 5, 5, 'vegetarian', 'no', 'no'
    ) ON CONFLICT (id) DO UPDATE SET
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
      is_verified = EXCLUDED.is_verified,
      is_premium = EXCLUDED.is_premium,
      is_profile_complete = EXCLUDED.is_profile_complete,
      profile_completion_percent = EXCLUDED.profile_completion_percent,
      last_active_at = EXCLUDED.last_active_at,
      star = EXCLUDED.star,
      raasi = EXCLUDED.raasi,
      lagnam = EXCLUDED.lagnam,
      gothram = EXCLUDED.gothram,
      tier = EXCLUDED.tier,
      contacts_remaining = EXCLUDED.contacts_remaining,
      interests_remaining = EXCLUDED.interests_remaining,
      food_habit = EXCLUDED.food_habit,
      smoking = EXCLUDED.smoking,
      drinking = EXCLUDED.drinking;
INSERT INTO public.profiles (
      id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at, star, raasi, lagnam, gothram, tier, contacts_remaining, interests_remaining, food_habit, smoking, drinking
    ) VALUES (
      '00000000-0000-4000-a000-00000000004e', 'TM000078', 'Kavitha Nathan', 'female', '1997-06-21', 168, 'divorced', 'Hindu', 'Naidu', 'Naidu subcaste', 'no', 'M.Sc', 'M.Sc Graduate', 'Advocate', 'Advocate Details', '₹10 Lakhs - ₹15 Lakhs', 'Private Practice', 'Thoothukudi', 'Tuticorin', 'Hi, I am Kavitha. I have completed my M.Sc and am currently working as a Advocate at Private Practice in Thoothukudi. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'upper_middle_class', true, false, true, 100, NOW() - INTERVAL '4 days', 'Magha', 'Dhanusu', 'Kanni', 'Bharadwaj', 'free', 5, 5, 'vegetarian', 'no', 'no'
    ) ON CONFLICT (id) DO UPDATE SET
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
      is_verified = EXCLUDED.is_verified,
      is_premium = EXCLUDED.is_premium,
      is_profile_complete = EXCLUDED.is_profile_complete,
      profile_completion_percent = EXCLUDED.profile_completion_percent,
      last_active_at = EXCLUDED.last_active_at,
      star = EXCLUDED.star,
      raasi = EXCLUDED.raasi,
      lagnam = EXCLUDED.lagnam,
      gothram = EXCLUDED.gothram,
      tier = EXCLUDED.tier,
      contacts_remaining = EXCLUDED.contacts_remaining,
      interests_remaining = EXCLUDED.interests_remaining,
      food_habit = EXCLUDED.food_habit,
      smoking = EXCLUDED.smoking,
      drinking = EXCLUDED.drinking;
INSERT INTO public.profiles (
      id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at, star, raasi, lagnam, gothram, tier, contacts_remaining, interests_remaining, food_habit, smoking, drinking
    ) VALUES (
      '00000000-0000-4000-a000-00000000004f', 'TM000079', 'Anbarasan Kumar', 'male', '2001-12-15', 182, 'never_married', 'Hindu', 'Maravar', 'Maravar subcaste', 'no', 'M.Com', 'M.Com Graduate', 'Pharmacist', 'Pharmacist Details', '₹10 Lakhs - ₹15 Lakhs', 'Government Service', 'Tiruchirappalli', 'Trichy', 'Hi, I am Anbarasan. I have completed my M.Com and am currently working as a Pharmacist at Government Service in Tiruchirappalli. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'rich', true, true, true, 100, NOW() - INTERVAL '1 days', 'Krittika', 'Mesham', 'Kanni', 'Gautama', 'gold', 50, 100, 'vegetarian', 'no', 'no'
    ) ON CONFLICT (id) DO UPDATE SET
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
      is_verified = EXCLUDED.is_verified,
      is_premium = EXCLUDED.is_premium,
      is_profile_complete = EXCLUDED.is_profile_complete,
      profile_completion_percent = EXCLUDED.profile_completion_percent,
      last_active_at = EXCLUDED.last_active_at,
      star = EXCLUDED.star,
      raasi = EXCLUDED.raasi,
      lagnam = EXCLUDED.lagnam,
      gothram = EXCLUDED.gothram,
      tier = EXCLUDED.tier,
      contacts_remaining = EXCLUDED.contacts_remaining,
      interests_remaining = EXCLUDED.interests_remaining,
      food_habit = EXCLUDED.food_habit,
      smoking = EXCLUDED.smoking,
      drinking = EXCLUDED.drinking;
INSERT INTO public.profiles (
      id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at, star, raasi, lagnam, gothram, tier, contacts_remaining, interests_remaining, food_habit, smoking, drinking
    ) VALUES (
      '00000000-0000-4000-a000-000000000050', 'TM000080', 'Ponmani Velan', 'female', '1999-10-18', 157, 'never_married', 'Hindu', 'Agamudayar', 'Agamudayar subcaste', 'yes', 'M.A', 'M.A Graduate', 'Civil Engineer', 'Civil Engineer Details', '₹10 Lakhs - ₹15 Lakhs', 'Zoho', 'Tiruppur', 'Tiruppur', 'Hi, I am Ponmani. I have completed my M.A and am currently working as a Civil Engineer at Zoho in Tiruppur. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'upper_middle_class', false, false, true, 100, NOW() - INTERVAL '8 days', 'Mirgashira', 'Dhanusu', 'Thulaam', 'Atri', 'free', 5, 5, 'vegetarian', 'no', 'no'
    ) ON CONFLICT (id) DO UPDATE SET
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
      is_verified = EXCLUDED.is_verified,
      is_premium = EXCLUDED.is_premium,
      is_profile_complete = EXCLUDED.is_profile_complete,
      profile_completion_percent = EXCLUDED.profile_completion_percent,
      last_active_at = EXCLUDED.last_active_at,
      star = EXCLUDED.star,
      raasi = EXCLUDED.raasi,
      lagnam = EXCLUDED.lagnam,
      gothram = EXCLUDED.gothram,
      tier = EXCLUDED.tier,
      contacts_remaining = EXCLUDED.contacts_remaining,
      interests_remaining = EXCLUDED.interests_remaining,
      food_habit = EXCLUDED.food_habit,
      smoking = EXCLUDED.smoking,
      drinking = EXCLUDED.drinking;
INSERT INTO public.profiles (
      id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at, star, raasi, lagnam, gothram, tier, contacts_remaining, interests_remaining, food_habit, smoking, drinking
    ) VALUES (
      '00000000-0000-4000-a000-000000000051', 'TM000081', 'Anbarasan Gopal', 'male', '1992-06-02', 185, 'never_married', 'Hindu', 'Mudaliar', 'Mudaliar subcaste', 'no', 'Ph.D', 'Ph.D Graduate', 'Mechanical Engineer', 'Mechanical Engineer Details', '₹3 Lakhs - ₹5 Lakhs', 'Zoho', 'Tiruchirappalli', 'Trichy', 'Hi, I am Anbarasan. I have completed my Ph.D and am currently working as a Mechanical Engineer at Zoho in Tiruchirappalli. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'middle_class', true, false, true, 100, NOW() - INTERVAL '4 days', 'Bharani', 'Magaram', 'Rishabam', 'Bharadwaj', 'free', 5, 5, 'vegetarian', 'no', 'no'
    ) ON CONFLICT (id) DO UPDATE SET
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
      is_verified = EXCLUDED.is_verified,
      is_premium = EXCLUDED.is_premium,
      is_profile_complete = EXCLUDED.is_profile_complete,
      profile_completion_percent = EXCLUDED.profile_completion_percent,
      last_active_at = EXCLUDED.last_active_at,
      star = EXCLUDED.star,
      raasi = EXCLUDED.raasi,
      lagnam = EXCLUDED.lagnam,
      gothram = EXCLUDED.gothram,
      tier = EXCLUDED.tier,
      contacts_remaining = EXCLUDED.contacts_remaining,
      interests_remaining = EXCLUDED.interests_remaining,
      food_habit = EXCLUDED.food_habit,
      smoking = EXCLUDED.smoking,
      drinking = EXCLUDED.drinking;
INSERT INTO public.profiles (
      id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at, star, raasi, lagnam, gothram, tier, contacts_remaining, interests_remaining, food_habit, smoking, drinking
    ) VALUES (
      '00000000-0000-4000-a000-000000000052', 'TM000082', 'Malathi Kumar', 'female', '1999-08-26', 161, 'never_married', 'Hindu', 'Naidu', NULL, 'no', 'Ph.D', 'Ph.D Graduate', 'HR Specialist', 'HR Specialist Details', '₹3 Lakhs - ₹5 Lakhs', 'Government Service', 'Kanchipuram', 'Kanchipuram', 'Hi, I am Malathi. I have completed my Ph.D and am currently working as a HR Specialist at Government Service in Kanchipuram. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'rich', false, false, true, 100, NOW() - INTERVAL '5 days', 'Bharani', 'Magaram', 'Mithunam', 'Kasyapa', 'free', 5, 5, 'vegetarian', 'no', 'no'
    ) ON CONFLICT (id) DO UPDATE SET
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
      is_verified = EXCLUDED.is_verified,
      is_premium = EXCLUDED.is_premium,
      is_profile_complete = EXCLUDED.is_profile_complete,
      profile_completion_percent = EXCLUDED.profile_completion_percent,
      last_active_at = EXCLUDED.last_active_at,
      star = EXCLUDED.star,
      raasi = EXCLUDED.raasi,
      lagnam = EXCLUDED.lagnam,
      gothram = EXCLUDED.gothram,
      tier = EXCLUDED.tier,
      contacts_remaining = EXCLUDED.contacts_remaining,
      interests_remaining = EXCLUDED.interests_remaining,
      food_habit = EXCLUDED.food_habit,
      smoking = EXCLUDED.smoking,
      drinking = EXCLUDED.drinking;
INSERT INTO public.profiles (
      id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at, star, raasi, lagnam, gothram, tier, contacts_remaining, interests_remaining, food_habit, smoking, drinking
    ) VALUES (
      '00000000-0000-4000-a000-000000000053', 'TM000083', 'Surya Raj', 'male', '1988-08-05', 185, 'never_married', 'Muslim', 'Labbai', NULL, 'no', 'B.Ed', 'B.Ed Graduate', 'Bank Manager', 'Bank Manager Details', '₹20 Lakhs+', 'Accenture', 'Thanjavur', 'Thanjavur', 'Hi, I am Surya. I have completed my B.Ed and am currently working as a Bank Manager at Accenture in Thanjavur. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'middle_class', true, false, true, 100, NOW() - INTERVAL '7 days', 'Anuradha', 'Mithunam', 'Rishabam', 'Bharadwaj', 'free', 5, 5, 'vegetarian', 'no', 'no'
    ) ON CONFLICT (id) DO UPDATE SET
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
      is_verified = EXCLUDED.is_verified,
      is_premium = EXCLUDED.is_premium,
      is_profile_complete = EXCLUDED.is_profile_complete,
      profile_completion_percent = EXCLUDED.profile_completion_percent,
      last_active_at = EXCLUDED.last_active_at,
      star = EXCLUDED.star,
      raasi = EXCLUDED.raasi,
      lagnam = EXCLUDED.lagnam,
      gothram = EXCLUDED.gothram,
      tier = EXCLUDED.tier,
      contacts_remaining = EXCLUDED.contacts_remaining,
      interests_remaining = EXCLUDED.interests_remaining,
      food_habit = EXCLUDED.food_habit,
      smoking = EXCLUDED.smoking,
      drinking = EXCLUDED.drinking;
INSERT INTO public.profiles (
      id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at, star, raasi, lagnam, gothram, tier, contacts_remaining, interests_remaining, food_habit, smoking, drinking
    ) VALUES (
      '00000000-0000-4000-a000-000000000054', 'TM000084', 'Malarvizhi Raj', 'female', '1989-05-25', 165, 'never_married', 'Hindu', 'Pillai', NULL, 'no', 'B.Com', 'B.Com Graduate', 'Pharmacist', 'Pharmacist Details', '₹10 Lakhs - ₹15 Lakhs', 'Infosys', 'Coimbatore', 'Coimbatore', 'Hi, I am Malarvizhi. I have completed my B.Com and am currently working as a Pharmacist at Infosys in Coimbatore. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'joint', 'middle_class', true, false, true, 100, NOW() - INTERVAL '1 days', 'Poorvashadha', 'Kanni', 'Kadagam', 'Viswamitra', 'free', 5, 5, 'vegetarian', 'no', 'no'
    ) ON CONFLICT (id) DO UPDATE SET
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
      is_verified = EXCLUDED.is_verified,
      is_premium = EXCLUDED.is_premium,
      is_profile_complete = EXCLUDED.is_profile_complete,
      profile_completion_percent = EXCLUDED.profile_completion_percent,
      last_active_at = EXCLUDED.last_active_at,
      star = EXCLUDED.star,
      raasi = EXCLUDED.raasi,
      lagnam = EXCLUDED.lagnam,
      gothram = EXCLUDED.gothram,
      tier = EXCLUDED.tier,
      contacts_remaining = EXCLUDED.contacts_remaining,
      interests_remaining = EXCLUDED.interests_remaining,
      food_habit = EXCLUDED.food_habit,
      smoking = EXCLUDED.smoking,
      drinking = EXCLUDED.drinking;
INSERT INTO public.profiles (
      id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at, star, raasi, lagnam, gothram, tier, contacts_remaining, interests_remaining, food_habit, smoking, drinking
    ) VALUES (
      '00000000-0000-4000-a000-000000000055', 'TM000085', 'Srinivasan Murthy', 'male', '2003-02-10', 171, 'never_married', 'Muslim', 'Sunni Muslim', NULL, 'no', 'M.B.A', 'M.B.A Graduate', 'Auditor', 'Auditor Details', '₹7 Lakhs - ₹10 Lakhs', 'Wipro', 'Salem', 'Salem', 'Hi, I am Srinivasan. I have completed my M.B.A and am currently working as a Auditor at Wipro in Salem. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'rich', true, true, true, 100, NOW() - INTERVAL '6 days', 'Mirgashira', 'Magaram', 'Rishabam', 'Siva', 'gold', 50, 100, 'vegetarian', 'no', 'no'
    ) ON CONFLICT (id) DO UPDATE SET
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
      is_verified = EXCLUDED.is_verified,
      is_premium = EXCLUDED.is_premium,
      is_profile_complete = EXCLUDED.is_profile_complete,
      profile_completion_percent = EXCLUDED.profile_completion_percent,
      last_active_at = EXCLUDED.last_active_at,
      star = EXCLUDED.star,
      raasi = EXCLUDED.raasi,
      lagnam = EXCLUDED.lagnam,
      gothram = EXCLUDED.gothram,
      tier = EXCLUDED.tier,
      contacts_remaining = EXCLUDED.contacts_remaining,
      interests_remaining = EXCLUDED.interests_remaining,
      food_habit = EXCLUDED.food_habit,
      smoking = EXCLUDED.smoking,
      drinking = EXCLUDED.drinking;
INSERT INTO public.profiles (
      id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at, star, raasi, lagnam, gothram, tier, contacts_remaining, interests_remaining, food_habit, smoking, drinking
    ) VALUES (
      '00000000-0000-4000-a000-000000000056', 'TM000086', 'Nandhini Pandian', 'female', '2005-04-01', 172, 'never_married', 'Muslim', 'Marakayar', NULL, 'yes', 'B.Ed', 'B.Ed Graduate', 'Software Engineer', 'Software Engineer Details', '₹5 Lakhs - ₹7 Lakhs', 'HCL', 'Chennai', 'Chennai', 'Hi, I am Nandhini. I have completed my B.Ed and am currently working as a Software Engineer at HCL in Chennai. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'upper_middle_class', true, false, true, 100, NOW() - INTERVAL '6 days', 'Poorvaphalguni', 'Kumbam', 'Mithunam', 'Agastya', 'free', 5, 5, 'vegetarian', 'no', 'no'
    ) ON CONFLICT (id) DO UPDATE SET
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
      is_verified = EXCLUDED.is_verified,
      is_premium = EXCLUDED.is_premium,
      is_profile_complete = EXCLUDED.is_profile_complete,
      profile_completion_percent = EXCLUDED.profile_completion_percent,
      last_active_at = EXCLUDED.last_active_at,
      star = EXCLUDED.star,
      raasi = EXCLUDED.raasi,
      lagnam = EXCLUDED.lagnam,
      gothram = EXCLUDED.gothram,
      tier = EXCLUDED.tier,
      contacts_remaining = EXCLUDED.contacts_remaining,
      interests_remaining = EXCLUDED.interests_remaining,
      food_habit = EXCLUDED.food_habit,
      smoking = EXCLUDED.smoking,
      drinking = EXCLUDED.drinking;
INSERT INTO public.profiles (
      id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at, star, raasi, lagnam, gothram, tier, contacts_remaining, interests_remaining, food_habit, smoking, drinking
    ) VALUES (
      '00000000-0000-4000-a000-000000000057', 'TM000087', 'Bala Murthy', 'male', '2000-11-14', 188, 'never_married', 'Hindu', 'Vellalar', 'Vellalar subcaste', 'no', 'B.Ed', 'B.Ed Graduate', 'Bank Manager', 'Bank Manager Details', '₹20 Lakhs+', 'HCL', 'Thanjavur', 'Thanjavur', 'Hi, I am Bala. I have completed my B.Ed and am currently working as a Bank Manager at HCL in Thanjavur. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'joint', 'upper_middle_class', true, false, true, 100, NOW() - INTERVAL '0 days', 'Arudra', 'Mithunam', 'Mithunam', 'Gautama', 'free', 5, 5, 'vegetarian', 'no', 'no'
    ) ON CONFLICT (id) DO UPDATE SET
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
      is_verified = EXCLUDED.is_verified,
      is_premium = EXCLUDED.is_premium,
      is_profile_complete = EXCLUDED.is_profile_complete,
      profile_completion_percent = EXCLUDED.profile_completion_percent,
      last_active_at = EXCLUDED.last_active_at,
      star = EXCLUDED.star,
      raasi = EXCLUDED.raasi,
      lagnam = EXCLUDED.lagnam,
      gothram = EXCLUDED.gothram,
      tier = EXCLUDED.tier,
      contacts_remaining = EXCLUDED.contacts_remaining,
      interests_remaining = EXCLUDED.interests_remaining,
      food_habit = EXCLUDED.food_habit,
      smoking = EXCLUDED.smoking,
      drinking = EXCLUDED.drinking;
INSERT INTO public.profiles (
      id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at, star, raasi, lagnam, gothram, tier, contacts_remaining, interests_remaining, food_habit, smoking, drinking
    ) VALUES (
      '00000000-0000-4000-a000-000000000058', 'TM000088', 'Gowri Naicker', 'female', '2005-08-04', 165, 'never_married', 'Hindu', 'Vanniyar', NULL, 'no', 'B.A', 'B.A Graduate', 'Business Owner', 'Business Owner Details', '₹20 Lakhs+', 'HCL', 'Chennai', 'Chennai', 'Hi, I am Gowri. I have completed my B.A and am currently working as a Business Owner at HCL in Chennai. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'joint', 'upper_middle_class', true, false, true, 100, NOW() - INTERVAL '6 days', 'Jyeshta', 'Magaram', 'Dhanusu', 'Agastya', 'free', 5, 5, 'vegetarian', 'no', 'no'
    ) ON CONFLICT (id) DO UPDATE SET
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
      is_verified = EXCLUDED.is_verified,
      is_premium = EXCLUDED.is_premium,
      is_profile_complete = EXCLUDED.is_profile_complete,
      profile_completion_percent = EXCLUDED.profile_completion_percent,
      last_active_at = EXCLUDED.last_active_at,
      star = EXCLUDED.star,
      raasi = EXCLUDED.raasi,
      lagnam = EXCLUDED.lagnam,
      gothram = EXCLUDED.gothram,
      tier = EXCLUDED.tier,
      contacts_remaining = EXCLUDED.contacts_remaining,
      interests_remaining = EXCLUDED.interests_remaining,
      food_habit = EXCLUDED.food_habit,
      smoking = EXCLUDED.smoking,
      drinking = EXCLUDED.drinking;
INSERT INTO public.profiles (
      id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at, star, raasi, lagnam, gothram, tier, contacts_remaining, interests_remaining, food_habit, smoking, drinking
    ) VALUES (
      '00000000-0000-4000-a000-000000000059', 'TM000089', 'Elango Devan', 'male', '1992-11-27', 186, 'never_married', 'Hindu', 'Nadar', NULL, 'no', 'M.Sc', 'M.Sc Graduate', 'School Teacher', 'School Teacher Details', '₹7 Lakhs - ₹10 Lakhs', 'Self Employed', 'Madurai', 'Madurai', 'Hi, I am Elango. I have completed my M.Sc and am currently working as a School Teacher at Self Employed in Madurai. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'rich', true, true, true, 100, NOW() - INTERVAL '5 days', 'Uttaraphalguni', 'Dhanusu', 'Rishabam', 'Vishnu', 'gold', 50, 100, 'vegetarian', 'no', 'no'
    ) ON CONFLICT (id) DO UPDATE SET
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
      is_verified = EXCLUDED.is_verified,
      is_premium = EXCLUDED.is_premium,
      is_profile_complete = EXCLUDED.is_profile_complete,
      profile_completion_percent = EXCLUDED.profile_completion_percent,
      last_active_at = EXCLUDED.last_active_at,
      star = EXCLUDED.star,
      raasi = EXCLUDED.raasi,
      lagnam = EXCLUDED.lagnam,
      gothram = EXCLUDED.gothram,
      tier = EXCLUDED.tier,
      contacts_remaining = EXCLUDED.contacts_remaining,
      interests_remaining = EXCLUDED.interests_remaining,
      food_habit = EXCLUDED.food_habit,
      smoking = EXCLUDED.smoking,
      drinking = EXCLUDED.drinking;
INSERT INTO public.profiles (
      id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at, star, raasi, lagnam, gothram, tier, contacts_remaining, interests_remaining, food_habit, smoking, drinking
    ) VALUES (
      '00000000-0000-4000-a000-00000000005a', 'TM000090', 'Pooja Raj', 'female', '1988-06-03', 162, 'never_married', 'Hindu', 'Chettiar', NULL, 'no', 'M.B.A', 'M.B.A Graduate', 'College Professor', 'College Professor Details', '₹10 Lakhs - ₹15 Lakhs', 'TCS', 'Erode', 'Erode', 'Hi, I am Pooja. I have completed my M.B.A and am currently working as a College Professor at TCS in Erode. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'rich', false, false, true, 100, NOW() - INTERVAL '7 days', 'Uttaraphalguni', 'Mithunam', 'Mesham', 'Vishnu', 'free', 5, 5, 'vegetarian', 'no', 'no'
    ) ON CONFLICT (id) DO UPDATE SET
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
      is_verified = EXCLUDED.is_verified,
      is_premium = EXCLUDED.is_premium,
      is_profile_complete = EXCLUDED.is_profile_complete,
      profile_completion_percent = EXCLUDED.profile_completion_percent,
      last_active_at = EXCLUDED.last_active_at,
      star = EXCLUDED.star,
      raasi = EXCLUDED.raasi,
      lagnam = EXCLUDED.lagnam,
      gothram = EXCLUDED.gothram,
      tier = EXCLUDED.tier,
      contacts_remaining = EXCLUDED.contacts_remaining,
      interests_remaining = EXCLUDED.interests_remaining,
      food_habit = EXCLUDED.food_habit,
      smoking = EXCLUDED.smoking,
      drinking = EXCLUDED.drinking;
INSERT INTO public.profiles (
      id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at, star, raasi, lagnam, gothram, tier, contacts_remaining, interests_remaining, food_habit, smoking, drinking
    ) VALUES (
      '00000000-0000-4000-a000-00000000005b', 'TM000091', 'Selvam Nathan', 'male', '2004-11-23', 172, 'never_married', 'Hindu', 'Vishwakarma', NULL, 'no', 'M.Com', 'M.Com Graduate', 'College Professor', 'College Professor Details', '₹7 Lakhs - ₹10 Lakhs', 'Zoho', 'Vellore', 'Vellore', 'Hi, I am Selvam. I have completed my M.Com and am currently working as a College Professor at Zoho in Vellore. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'upper_middle_class', true, false, true, 100, NOW() - INTERVAL '4 days', 'Magha', 'Rishabam', 'Simham', 'Viswamitra', 'free', 5, 5, 'vegetarian', 'no', 'no'
    ) ON CONFLICT (id) DO UPDATE SET
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
      is_verified = EXCLUDED.is_verified,
      is_premium = EXCLUDED.is_premium,
      is_profile_complete = EXCLUDED.is_profile_complete,
      profile_completion_percent = EXCLUDED.profile_completion_percent,
      last_active_at = EXCLUDED.last_active_at,
      star = EXCLUDED.star,
      raasi = EXCLUDED.raasi,
      lagnam = EXCLUDED.lagnam,
      gothram = EXCLUDED.gothram,
      tier = EXCLUDED.tier,
      contacts_remaining = EXCLUDED.contacts_remaining,
      interests_remaining = EXCLUDED.interests_remaining,
      food_habit = EXCLUDED.food_habit,
      smoking = EXCLUDED.smoking,
      drinking = EXCLUDED.drinking;
INSERT INTO public.profiles (
      id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at, star, raasi, lagnam, gothram, tier, contacts_remaining, interests_remaining, food_habit, smoking, drinking
    ) VALUES (
      '00000000-0000-4000-a000-00000000005c', 'TM000092', 'Radha Raj', 'female', '1995-05-21', 155, 'never_married', 'Hindu', 'Vellalar', 'Vellalar subcaste', 'no', 'M.C.A', 'M.C.A Graduate', 'School Teacher', 'School Teacher Details', '₹20 Lakhs+', 'TCS', 'Erode', 'Erode', 'Hi, I am Radha. I have completed my M.C.A and am currently working as a School Teacher at TCS in Erode. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'joint', 'middle_class', true, false, true, 100, NOW() - INTERVAL '0 days', 'Moola', 'Mesham', 'Meenam', 'Gautama', 'free', 5, 5, 'vegetarian', 'no', 'no'
    ) ON CONFLICT (id) DO UPDATE SET
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
      is_verified = EXCLUDED.is_verified,
      is_premium = EXCLUDED.is_premium,
      is_profile_complete = EXCLUDED.is_profile_complete,
      profile_completion_percent = EXCLUDED.profile_completion_percent,
      last_active_at = EXCLUDED.last_active_at,
      star = EXCLUDED.star,
      raasi = EXCLUDED.raasi,
      lagnam = EXCLUDED.lagnam,
      gothram = EXCLUDED.gothram,
      tier = EXCLUDED.tier,
      contacts_remaining = EXCLUDED.contacts_remaining,
      interests_remaining = EXCLUDED.interests_remaining,
      food_habit = EXCLUDED.food_habit,
      smoking = EXCLUDED.smoking,
      drinking = EXCLUDED.drinking;
INSERT INTO public.profiles (
      id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at, star, raasi, lagnam, gothram, tier, contacts_remaining, interests_remaining, food_habit, smoking, drinking
    ) VALUES (
      '00000000-0000-4000-a000-00000000005d', 'TM000093', 'Siddharth Naicker', 'male', '1991-05-25', 163, 'never_married', 'Hindu', 'Vanniyar', NULL, 'no', 'B.Com', 'B.Com Graduate', 'Doctor', 'Doctor Details', '₹3 Lakhs - ₹5 Lakhs', 'Infosys', 'Thanjavur', 'Thanjavur', 'Hi, I am Siddharth. I have completed my B.Com and am currently working as a Doctor at Infosys in Thanjavur. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'upper_middle_class', true, false, true, 100, NOW() - INTERVAL '8 days', 'Revati', 'Mesham', 'Mesham', 'Angirasa', 'free', 5, 5, 'vegetarian', 'no', 'no'
    ) ON CONFLICT (id) DO UPDATE SET
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
      is_verified = EXCLUDED.is_verified,
      is_premium = EXCLUDED.is_premium,
      is_profile_complete = EXCLUDED.is_profile_complete,
      profile_completion_percent = EXCLUDED.profile_completion_percent,
      last_active_at = EXCLUDED.last_active_at,
      star = EXCLUDED.star,
      raasi = EXCLUDED.raasi,
      lagnam = EXCLUDED.lagnam,
      gothram = EXCLUDED.gothram,
      tier = EXCLUDED.tier,
      contacts_remaining = EXCLUDED.contacts_remaining,
      interests_remaining = EXCLUDED.interests_remaining,
      food_habit = EXCLUDED.food_habit,
      smoking = EXCLUDED.smoking,
      drinking = EXCLUDED.drinking;
INSERT INTO public.profiles (
      id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at, star, raasi, lagnam, gothram, tier, contacts_remaining, interests_remaining, food_habit, smoking, drinking
    ) VALUES (
      '00000000-0000-4000-a000-00000000005e', 'TM000094', 'Vanitha Kumar', 'female', '1990-05-27', 168, 'divorced', 'Hindu', 'Arunthathiyar', NULL, 'yes', 'B.Ed', 'B.Ed Graduate', 'HR Specialist', 'HR Specialist Details', '₹7 Lakhs - ₹10 Lakhs', 'HCL', 'Chennai', 'Chennai', 'Hi, I am Vanitha. I have completed my B.Ed and am currently working as a HR Specialist at HCL in Chennai. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'upper_middle_class', true, false, true, 100, NOW() - INTERVAL '7 days', 'Uttarachadha', 'Simham', 'Rishabam', 'Vishnu', 'free', 5, 5, 'vegetarian', 'no', 'no'
    ) ON CONFLICT (id) DO UPDATE SET
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
      is_verified = EXCLUDED.is_verified,
      is_premium = EXCLUDED.is_premium,
      is_profile_complete = EXCLUDED.is_profile_complete,
      profile_completion_percent = EXCLUDED.profile_completion_percent,
      last_active_at = EXCLUDED.last_active_at,
      star = EXCLUDED.star,
      raasi = EXCLUDED.raasi,
      lagnam = EXCLUDED.lagnam,
      gothram = EXCLUDED.gothram,
      tier = EXCLUDED.tier,
      contacts_remaining = EXCLUDED.contacts_remaining,
      interests_remaining = EXCLUDED.interests_remaining,
      food_habit = EXCLUDED.food_habit,
      smoking = EXCLUDED.smoking,
      drinking = EXCLUDED.drinking;
INSERT INTO public.profiles (
      id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at, star, raasi, lagnam, gothram, tier, contacts_remaining, interests_remaining, food_habit, smoking, drinking
    ) VALUES (
      '00000000-0000-4000-a000-00000000005f', 'TM000095', 'Sundar Balan', 'male', '1997-04-06', 170, 'divorced', 'Hindu', 'Agamudayar', 'Agamudayar subcaste', 'no', 'B.E. / B.Tech', 'B.E. / B.Tech Graduate', 'Bank Manager', 'Bank Manager Details', '₹3 Lakhs - ₹5 Lakhs', 'Wipro', 'Tiruchirappalli', 'Trichy', 'Hi, I am Sundar. I have completed my B.E. / B.Tech and am currently working as a Bank Manager at Wipro in Tiruchirappalli. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'joint', 'middle_class', false, false, true, 100, NOW() - INTERVAL '2 days', 'Pushya', 'Kanni', 'Viruchigam', 'Vishnu', 'free', 5, 5, 'vegetarian', 'no', 'no'
    ) ON CONFLICT (id) DO UPDATE SET
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
      is_verified = EXCLUDED.is_verified,
      is_premium = EXCLUDED.is_premium,
      is_profile_complete = EXCLUDED.is_profile_complete,
      profile_completion_percent = EXCLUDED.profile_completion_percent,
      last_active_at = EXCLUDED.last_active_at,
      star = EXCLUDED.star,
      raasi = EXCLUDED.raasi,
      lagnam = EXCLUDED.lagnam,
      gothram = EXCLUDED.gothram,
      tier = EXCLUDED.tier,
      contacts_remaining = EXCLUDED.contacts_remaining,
      interests_remaining = EXCLUDED.interests_remaining,
      food_habit = EXCLUDED.food_habit,
      smoking = EXCLUDED.smoking,
      drinking = EXCLUDED.drinking;
INSERT INTO public.profiles (
      id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at, star, raasi, lagnam, gothram, tier, contacts_remaining, interests_remaining, food_habit, smoking, drinking
    ) VALUES (
      '00000000-0000-4000-a000-000000000060', 'TM000096', 'Radha Gopal', 'female', '1994-07-08', 150, 'never_married', 'Hindu', 'Vishwakarma', NULL, 'no', 'M.B.B.S', 'M.B.B.S Graduate', 'Mechanical Engineer', 'Mechanical Engineer Details', '₹20 Lakhs+', 'Private Practice', 'Coimbatore', 'Coimbatore', 'Hi, I am Radha. I have completed my M.B.B.S and am currently working as a Mechanical Engineer at Private Practice in Coimbatore. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'rich', false, true, true, 100, NOW() - INTERVAL '2 days', 'Mirgashira', 'Kadagam', 'Simham', 'Murugan', 'gold', 50, 100, 'vegetarian', 'no', 'no'
    ) ON CONFLICT (id) DO UPDATE SET
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
      is_verified = EXCLUDED.is_verified,
      is_premium = EXCLUDED.is_premium,
      is_profile_complete = EXCLUDED.is_profile_complete,
      profile_completion_percent = EXCLUDED.profile_completion_percent,
      last_active_at = EXCLUDED.last_active_at,
      star = EXCLUDED.star,
      raasi = EXCLUDED.raasi,
      lagnam = EXCLUDED.lagnam,
      gothram = EXCLUDED.gothram,
      tier = EXCLUDED.tier,
      contacts_remaining = EXCLUDED.contacts_remaining,
      interests_remaining = EXCLUDED.interests_remaining,
      food_habit = EXCLUDED.food_habit,
      smoking = EXCLUDED.smoking,
      drinking = EXCLUDED.drinking;
INSERT INTO public.profiles (
      id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at, star, raasi, lagnam, gothram, tier, contacts_remaining, interests_remaining, food_habit, smoking, drinking
    ) VALUES (
      '00000000-0000-4000-a000-000000000061', 'TM000097', 'Vetrivel Moorthy', 'male', '1999-11-28', 169, 'never_married', 'Christian', 'Nadar Christian', NULL, 'yes', 'B.Com', 'B.Com Graduate', 'HR Specialist', 'HR Specialist Details', '₹7 Lakhs - ₹10 Lakhs', 'TCS', 'Tirunelveli', 'Tirunelveli', 'Hi, I am Vetrivel. I have completed my B.Com and am currently working as a HR Specialist at TCS in Tirunelveli. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'joint', 'middle_class', true, false, true, 100, NOW() - INTERVAL '2 days', 'Rohini', 'Thulaam', 'Thulaam', 'Atri', 'free', 5, 5, 'vegetarian', 'no', 'no'
    ) ON CONFLICT (id) DO UPDATE SET
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
      is_verified = EXCLUDED.is_verified,
      is_premium = EXCLUDED.is_premium,
      is_profile_complete = EXCLUDED.is_profile_complete,
      profile_completion_percent = EXCLUDED.profile_completion_percent,
      last_active_at = EXCLUDED.last_active_at,
      star = EXCLUDED.star,
      raasi = EXCLUDED.raasi,
      lagnam = EXCLUDED.lagnam,
      gothram = EXCLUDED.gothram,
      tier = EXCLUDED.tier,
      contacts_remaining = EXCLUDED.contacts_remaining,
      interests_remaining = EXCLUDED.interests_remaining,
      food_habit = EXCLUDED.food_habit,
      smoking = EXCLUDED.smoking,
      drinking = EXCLUDED.drinking;
INSERT INTO public.profiles (
      id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at, star, raasi, lagnam, gothram, tier, contacts_remaining, interests_remaining, food_habit, smoking, drinking
    ) VALUES (
      '00000000-0000-4000-a000-000000000062', 'TM000098', 'Nandhini Kumar', 'female', '1996-07-04', 158, 'never_married', 'Hindu', 'Yadav', 'Yadav subcaste', 'no', 'M.B.A', 'M.B.A Graduate', 'Police Officer', 'Police Officer Details', '₹3 Lakhs - ₹5 Lakhs', 'Infosys', 'Thoothukudi', 'Tuticorin', 'Hi, I am Nandhini. I have completed my M.B.A and am currently working as a Police Officer at Infosys in Thoothukudi. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'rich', true, true, true, 100, NOW() - INTERVAL '2 days', 'Poorvaphalguni', 'Dhanusu', 'Meenam', 'Vashishta', 'gold', 50, 100, 'vegetarian', 'no', 'no'
    ) ON CONFLICT (id) DO UPDATE SET
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
      is_verified = EXCLUDED.is_verified,
      is_premium = EXCLUDED.is_premium,
      is_profile_complete = EXCLUDED.is_profile_complete,
      profile_completion_percent = EXCLUDED.profile_completion_percent,
      last_active_at = EXCLUDED.last_active_at,
      star = EXCLUDED.star,
      raasi = EXCLUDED.raasi,
      lagnam = EXCLUDED.lagnam,
      gothram = EXCLUDED.gothram,
      tier = EXCLUDED.tier,
      contacts_remaining = EXCLUDED.contacts_remaining,
      interests_remaining = EXCLUDED.interests_remaining,
      food_habit = EXCLUDED.food_habit,
      smoking = EXCLUDED.smoking,
      drinking = EXCLUDED.drinking;
INSERT INTO public.profiles (
      id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at, star, raasi, lagnam, gothram, tier, contacts_remaining, interests_remaining, food_habit, smoking, drinking
    ) VALUES (
      '00000000-0000-4000-a000-000000000063', 'TM000099', 'Prabhu Raman', 'male', '1991-08-11', 180, 'never_married', 'Hindu', 'Chettiar', NULL, 'no', 'M.C.A', 'M.C.A Graduate', 'College Professor', 'College Professor Details', '₹10 Lakhs - ₹15 Lakhs', 'Self Employed', 'Vellore', 'Vellore', 'Hi, I am Prabhu. I have completed my M.C.A and am currently working as a College Professor at Self Employed in Vellore. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'upper_middle_class', true, false, true, 100, NOW() - INTERVAL '2 days', 'Anuradha', 'Kumbam', 'Viruchigam', 'Viswamitra', 'free', 5, 5, 'vegetarian', 'no', 'no'
    ) ON CONFLICT (id) DO UPDATE SET
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
      is_verified = EXCLUDED.is_verified,
      is_premium = EXCLUDED.is_premium,
      is_profile_complete = EXCLUDED.is_profile_complete,
      profile_completion_percent = EXCLUDED.profile_completion_percent,
      last_active_at = EXCLUDED.last_active_at,
      star = EXCLUDED.star,
      raasi = EXCLUDED.raasi,
      lagnam = EXCLUDED.lagnam,
      gothram = EXCLUDED.gothram,
      tier = EXCLUDED.tier,
      contacts_remaining = EXCLUDED.contacts_remaining,
      interests_remaining = EXCLUDED.interests_remaining,
      food_habit = EXCLUDED.food_habit,
      smoking = EXCLUDED.smoking,
      drinking = EXCLUDED.drinking;
INSERT INTO public.profiles (
      id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at, star, raasi, lagnam, gothram, tier, contacts_remaining, interests_remaining, food_habit, smoking, drinking
    ) VALUES (
      '00000000-0000-4000-a000-000000000064', 'TM000100', 'Lakshmi Murthy', 'female', '1995-07-06', 173, 'never_married', 'Hindu', 'Kallar', 'Kallar subcaste', 'no', 'B.A', 'B.A Graduate', 'HR Specialist', 'HR Specialist Details', '₹7 Lakhs - ₹10 Lakhs', 'Infosys', 'Tirunelveli', 'Tirunelveli', 'Hi, I am Lakshmi. I have completed my B.A and am currently working as a HR Specialist at Infosys in Tirunelveli. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'upper_middle_class', true, true, true, 100, NOW() - INTERVAL '3 days', 'Poorvashadha', 'Dhanusu', 'Rishabam', 'Harita', 'gold', 50, 100, 'vegetarian', 'no', 'no'
    ) ON CONFLICT (id) DO UPDATE SET
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
      is_verified = EXCLUDED.is_verified,
      is_premium = EXCLUDED.is_premium,
      is_profile_complete = EXCLUDED.is_profile_complete,
      profile_completion_percent = EXCLUDED.profile_completion_percent,
      last_active_at = EXCLUDED.last_active_at,
      star = EXCLUDED.star,
      raasi = EXCLUDED.raasi,
      lagnam = EXCLUDED.lagnam,
      gothram = EXCLUDED.gothram,
      tier = EXCLUDED.tier,
      contacts_remaining = EXCLUDED.contacts_remaining,
      interests_remaining = EXCLUDED.interests_remaining,
      food_habit = EXCLUDED.food_habit,
      smoking = EXCLUDED.smoking,
      drinking = EXCLUDED.drinking;
INSERT INTO public.profiles (
      id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at, star, raasi, lagnam, gothram, tier, contacts_remaining, interests_remaining, food_habit, smoking, drinking
    ) VALUES (
      '00000000-0000-4000-a000-000000000065', 'TM000101', 'Elango Pandian', 'male', '1995-05-11', 177, 'never_married', 'Hindu', 'Naicker', 'Naicker subcaste', 'no', 'M.B.B.S', 'M.B.B.S Graduate', 'Government Officer', 'Government Officer Details', '₹3 Lakhs - ₹5 Lakhs', 'Private Practice', 'Kanchipuram', 'Kanchipuram', 'Hi, I am Elango. I have completed my M.B.B.S and am currently working as a Government Officer at Private Practice in Kanchipuram. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'joint', 'upper_middle_class', false, false, true, 100, NOW() - INTERVAL '10 days', 'Punarvasu', 'Dhanusu', 'Magaram', 'Bharadwaj', 'free', 5, 5, 'vegetarian', 'no', 'no'
    ) ON CONFLICT (id) DO UPDATE SET
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
      is_verified = EXCLUDED.is_verified,
      is_premium = EXCLUDED.is_premium,
      is_profile_complete = EXCLUDED.is_profile_complete,
      profile_completion_percent = EXCLUDED.profile_completion_percent,
      last_active_at = EXCLUDED.last_active_at,
      star = EXCLUDED.star,
      raasi = EXCLUDED.raasi,
      lagnam = EXCLUDED.lagnam,
      gothram = EXCLUDED.gothram,
      tier = EXCLUDED.tier,
      contacts_remaining = EXCLUDED.contacts_remaining,
      interests_remaining = EXCLUDED.interests_remaining,
      food_habit = EXCLUDED.food_habit,
      smoking = EXCLUDED.smoking,
      drinking = EXCLUDED.drinking;
INSERT INTO public.profiles (
      id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at, star, raasi, lagnam, gothram, tier, contacts_remaining, interests_remaining, food_habit, smoking, drinking
    ) VALUES (
      '00000000-0000-4000-a000-000000000066', 'TM000102', 'Sowmya Nathan', 'female', '2002-07-26', 170, 'never_married', 'Hindu', 'Nadar', 'Nadar subcaste', 'no', 'B.E. / B.Tech', 'B.E. / B.Tech Graduate', 'Auditor', 'Auditor Details', '₹15 Lakhs - ₹20 Lakhs', 'Self Employed', 'Tirunelveli', 'Tirunelveli', 'Hi, I am Sowmya. I have completed my B.E. / B.Tech and am currently working as a Auditor at Self Employed in Tirunelveli. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'middle_class', true, false, true, 100, NOW() - INTERVAL '6 days', 'Aslesha', 'Meenam', 'Viruchigam', 'Vishnu', 'free', 5, 5, 'vegetarian', 'no', 'no'
    ) ON CONFLICT (id) DO UPDATE SET
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
      is_verified = EXCLUDED.is_verified,
      is_premium = EXCLUDED.is_premium,
      is_profile_complete = EXCLUDED.is_profile_complete,
      profile_completion_percent = EXCLUDED.profile_completion_percent,
      last_active_at = EXCLUDED.last_active_at,
      star = EXCLUDED.star,
      raasi = EXCLUDED.raasi,
      lagnam = EXCLUDED.lagnam,
      gothram = EXCLUDED.gothram,
      tier = EXCLUDED.tier,
      contacts_remaining = EXCLUDED.contacts_remaining,
      interests_remaining = EXCLUDED.interests_remaining,
      food_habit = EXCLUDED.food_habit,
      smoking = EXCLUDED.smoking,
      drinking = EXCLUDED.drinking;
INSERT INTO public.profiles (
      id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at, star, raasi, lagnam, gothram, tier, contacts_remaining, interests_remaining, food_habit, smoking, drinking
    ) VALUES (
      '00000000-0000-4000-a000-000000000067', 'TM000103', 'Elango Pandian', 'male', '1994-03-27', 163, 'never_married', 'Hindu', 'Brahmin - Iyer', 'Brahmin - Iyer subcaste', 'no', 'M.A', 'M.A Graduate', 'Auditor', 'Auditor Details', '₹15 Lakhs - ₹20 Lakhs', 'Zoho', 'Erode', 'Erode', 'Hi, I am Elango. I have completed my M.A and am currently working as a Auditor at Zoho in Erode. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'joint', 'upper_middle_class', true, true, true, 100, NOW() - INTERVAL '7 days', 'Chitra', 'Rishabam', 'Mithunam', 'Kasyapa', 'gold', 50, 100, 'vegetarian', 'no', 'no'
    ) ON CONFLICT (id) DO UPDATE SET
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
      is_verified = EXCLUDED.is_verified,
      is_premium = EXCLUDED.is_premium,
      is_profile_complete = EXCLUDED.is_profile_complete,
      profile_completion_percent = EXCLUDED.profile_completion_percent,
      last_active_at = EXCLUDED.last_active_at,
      star = EXCLUDED.star,
      raasi = EXCLUDED.raasi,
      lagnam = EXCLUDED.lagnam,
      gothram = EXCLUDED.gothram,
      tier = EXCLUDED.tier,
      contacts_remaining = EXCLUDED.contacts_remaining,
      interests_remaining = EXCLUDED.interests_remaining,
      food_habit = EXCLUDED.food_habit,
      smoking = EXCLUDED.smoking,
      drinking = EXCLUDED.drinking;
INSERT INTO public.profiles (
      id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at, star, raasi, lagnam, gothram, tier, contacts_remaining, interests_remaining, food_habit, smoking, drinking
    ) VALUES (
      '00000000-0000-4000-a000-000000000068', 'TM000104', 'Ramya Swamy', 'female', '1990-03-04', 167, 'never_married', 'Hindu', 'Devendra Kula Vellalar', 'Devendra Kula Vellalar subcaste', 'no', 'M.Com', 'M.Com Graduate', 'Government Officer', 'Government Officer Details', '₹3 Lakhs - ₹5 Lakhs', 'Private Practice', 'Salem', 'Salem', 'Hi, I am Ramya. I have completed my M.Com and am currently working as a Government Officer at Private Practice in Salem. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'middle_class', false, false, true, 100, NOW() - INTERVAL '7 days', 'Vishakha', 'Mesham', 'Mesham', 'Murugan', 'free', 5, 5, 'vegetarian', 'no', 'no'
    ) ON CONFLICT (id) DO UPDATE SET
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
      is_verified = EXCLUDED.is_verified,
      is_premium = EXCLUDED.is_premium,
      is_profile_complete = EXCLUDED.is_profile_complete,
      profile_completion_percent = EXCLUDED.profile_completion_percent,
      last_active_at = EXCLUDED.last_active_at,
      star = EXCLUDED.star,
      raasi = EXCLUDED.raasi,
      lagnam = EXCLUDED.lagnam,
      gothram = EXCLUDED.gothram,
      tier = EXCLUDED.tier,
      contacts_remaining = EXCLUDED.contacts_remaining,
      interests_remaining = EXCLUDED.interests_remaining,
      food_habit = EXCLUDED.food_habit,
      smoking = EXCLUDED.smoking,
      drinking = EXCLUDED.drinking;
INSERT INTO public.profiles (
      id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at, star, raasi, lagnam, gothram, tier, contacts_remaining, interests_remaining, food_habit, smoking, drinking
    ) VALUES (
      '00000000-0000-4000-a000-000000000069', 'TM000105', 'Kannan Raj', 'male', '1989-12-16', 162, 'divorced', 'Christian', 'Pentecostal', 'Pentecostal subcaste', 'no', 'B.E. / B.Tech', 'B.E. / B.Tech Graduate', 'Police Officer', 'Police Officer Details', '₹5 Lakhs - ₹7 Lakhs', 'Infosys', 'Madurai', 'Madurai', 'Hi, I am Kannan. I have completed my B.E. / B.Tech and am currently working as a Police Officer at Infosys in Madurai. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'joint', 'middle_class', false, false, true, 100, NOW() - INTERVAL '3 days', 'Hasta', 'Viruchigam', 'Kumbam', 'Bharadwaj', 'free', 5, 5, 'vegetarian', 'no', 'no'
    ) ON CONFLICT (id) DO UPDATE SET
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
      is_verified = EXCLUDED.is_verified,
      is_premium = EXCLUDED.is_premium,
      is_profile_complete = EXCLUDED.is_profile_complete,
      profile_completion_percent = EXCLUDED.profile_completion_percent,
      last_active_at = EXCLUDED.last_active_at,
      star = EXCLUDED.star,
      raasi = EXCLUDED.raasi,
      lagnam = EXCLUDED.lagnam,
      gothram = EXCLUDED.gothram,
      tier = EXCLUDED.tier,
      contacts_remaining = EXCLUDED.contacts_remaining,
      interests_remaining = EXCLUDED.interests_remaining,
      food_habit = EXCLUDED.food_habit,
      smoking = EXCLUDED.smoking,
      drinking = EXCLUDED.drinking;
INSERT INTO public.profiles (
      id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at, star, raasi, lagnam, gothram, tier, contacts_remaining, interests_remaining, food_habit, smoking, drinking
    ) VALUES (
      '00000000-0000-4000-a000-00000000006a', 'TM000106', 'Deepa Murthy', 'female', '1995-10-19', 162, 'never_married', 'Hindu', 'Agamudayar', 'Agamudayar subcaste', 'no', 'M.B.A', 'M.B.A Graduate', 'Police Officer', 'Police Officer Details', '₹10 Lakhs - ₹15 Lakhs', 'Private Practice', 'Thoothukudi', 'Tuticorin', 'Hi, I am Deepa. I have completed my M.B.A and am currently working as a Police Officer at Private Practice in Thoothukudi. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'joint', 'upper_middle_class', false, false, true, 100, NOW() - INTERVAL '8 days', 'Uttarabhadrapada', 'Dhanusu', 'Magaram', 'Vashishta', 'free', 5, 5, 'vegetarian', 'no', 'no'
    ) ON CONFLICT (id) DO UPDATE SET
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
      is_verified = EXCLUDED.is_verified,
      is_premium = EXCLUDED.is_premium,
      is_profile_complete = EXCLUDED.is_profile_complete,
      profile_completion_percent = EXCLUDED.profile_completion_percent,
      last_active_at = EXCLUDED.last_active_at,
      star = EXCLUDED.star,
      raasi = EXCLUDED.raasi,
      lagnam = EXCLUDED.lagnam,
      gothram = EXCLUDED.gothram,
      tier = EXCLUDED.tier,
      contacts_remaining = EXCLUDED.contacts_remaining,
      interests_remaining = EXCLUDED.interests_remaining,
      food_habit = EXCLUDED.food_habit,
      smoking = EXCLUDED.smoking,
      drinking = EXCLUDED.drinking;
INSERT INTO public.profiles (
      id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at, star, raasi, lagnam, gothram, tier, contacts_remaining, interests_remaining, food_habit, smoking, drinking
    ) VALUES (
      '00000000-0000-4000-a000-00000000006b', 'TM000107', 'Jeeva Pandian', 'male', '2003-05-16', 182, 'never_married', 'Christian', 'Vellalar Christian', 'Vellalar Christian subcaste', 'no', 'Ph.D', 'Ph.D Graduate', 'College Professor', 'College Professor Details', '₹15 Lakhs - ₹20 Lakhs', 'Cognizant', 'Erode', 'Erode', 'Hi, I am Jeeva. I have completed my Ph.D and am currently working as a College Professor at Cognizant in Erode. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'middle_class', true, false, true, 100, NOW() - INTERVAL '1 days', 'Uttaraphalguni', 'Kanni', 'Kanni', 'Vashishta', 'free', 5, 5, 'vegetarian', 'no', 'no'
    ) ON CONFLICT (id) DO UPDATE SET
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
      is_verified = EXCLUDED.is_verified,
      is_premium = EXCLUDED.is_premium,
      is_profile_complete = EXCLUDED.is_profile_complete,
      profile_completion_percent = EXCLUDED.profile_completion_percent,
      last_active_at = EXCLUDED.last_active_at,
      star = EXCLUDED.star,
      raasi = EXCLUDED.raasi,
      lagnam = EXCLUDED.lagnam,
      gothram = EXCLUDED.gothram,
      tier = EXCLUDED.tier,
      contacts_remaining = EXCLUDED.contacts_remaining,
      interests_remaining = EXCLUDED.interests_remaining,
      food_habit = EXCLUDED.food_habit,
      smoking = EXCLUDED.smoking,
      drinking = EXCLUDED.drinking;
INSERT INTO public.profiles (
      id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at, star, raasi, lagnam, gothram, tier, contacts_remaining, interests_remaining, food_habit, smoking, drinking
    ) VALUES (
      '00000000-0000-4000-a000-00000000006c', 'TM000108', 'Soundarya Nathan', 'female', '1994-07-18', 152, 'never_married', 'Hindu', 'Sengunthar', NULL, 'yes', 'M.Sc', 'M.Sc Graduate', 'Advocate', 'Advocate Details', '₹10 Lakhs - ₹15 Lakhs', 'Wipro', 'Thanjavur', 'Thanjavur', 'Hi, I am Soundarya. I have completed my M.Sc and am currently working as a Advocate at Wipro in Thanjavur. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'joint', 'middle_class', true, false, true, 100, NOW() - INTERVAL '9 days', 'Hasta', 'Viruchigam', 'Viruchigam', 'Murugan', 'free', 5, 5, 'vegetarian', 'no', 'no'
    ) ON CONFLICT (id) DO UPDATE SET
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
      is_verified = EXCLUDED.is_verified,
      is_premium = EXCLUDED.is_premium,
      is_profile_complete = EXCLUDED.is_profile_complete,
      profile_completion_percent = EXCLUDED.profile_completion_percent,
      last_active_at = EXCLUDED.last_active_at,
      star = EXCLUDED.star,
      raasi = EXCLUDED.raasi,
      lagnam = EXCLUDED.lagnam,
      gothram = EXCLUDED.gothram,
      tier = EXCLUDED.tier,
      contacts_remaining = EXCLUDED.contacts_remaining,
      interests_remaining = EXCLUDED.interests_remaining,
      food_habit = EXCLUDED.food_habit,
      smoking = EXCLUDED.smoking,
      drinking = EXCLUDED.drinking;
INSERT INTO public.profiles (
      id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at, star, raasi, lagnam, gothram, tier, contacts_remaining, interests_remaining, food_habit, smoking, drinking
    ) VALUES (
      '00000000-0000-4000-a000-00000000006d', 'TM000109', 'Prakash Raman', 'male', '1988-02-12', 180, 'divorced', 'Hindu', 'Sengunthar', NULL, 'no', 'B.Ed', 'B.Ed Graduate', 'College Professor', 'College Professor Details', '₹5 Lakhs - ₹7 Lakhs', 'Accenture', 'Salem', 'Salem', 'Hi, I am Prakash. I have completed my B.Ed and am currently working as a College Professor at Accenture in Salem. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'upper_middle_class', true, true, true, 100, NOW() - INTERVAL '10 days', 'Poorvabhadrapada', 'Rishabam', 'Kadagam', 'Bharadwaj', 'gold', 50, 100, 'vegetarian', 'no', 'no'
    ) ON CONFLICT (id) DO UPDATE SET
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
      is_verified = EXCLUDED.is_verified,
      is_premium = EXCLUDED.is_premium,
      is_profile_complete = EXCLUDED.is_profile_complete,
      profile_completion_percent = EXCLUDED.profile_completion_percent,
      last_active_at = EXCLUDED.last_active_at,
      star = EXCLUDED.star,
      raasi = EXCLUDED.raasi,
      lagnam = EXCLUDED.lagnam,
      gothram = EXCLUDED.gothram,
      tier = EXCLUDED.tier,
      contacts_remaining = EXCLUDED.contacts_remaining,
      interests_remaining = EXCLUDED.interests_remaining,
      food_habit = EXCLUDED.food_habit,
      smoking = EXCLUDED.smoking,
      drinking = EXCLUDED.drinking;
INSERT INTO public.profiles (
      id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at, star, raasi, lagnam, gothram, tier, contacts_remaining, interests_remaining, food_habit, smoking, drinking
    ) VALUES (
      '00000000-0000-4000-a000-00000000006e', 'TM000110', 'Saraswathi Lingam', 'female', '1988-12-18', 166, 'never_married', 'Hindu', 'Chettiar', 'Chettiar subcaste', 'no', 'B.Com', 'B.Com Graduate', 'College Professor', 'College Professor Details', '₹3 Lakhs - ₹5 Lakhs', 'TCS', 'Chennai', 'Chennai', 'Hi, I am Saraswathi. I have completed my B.Com and am currently working as a College Professor at TCS in Chennai. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'upper_middle_class', true, false, true, 100, NOW() - INTERVAL '3 days', 'Poorvashadha', 'Mithunam', 'Magaram', 'Gautama', 'free', 5, 5, 'vegetarian', 'no', 'no'
    ) ON CONFLICT (id) DO UPDATE SET
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
      is_verified = EXCLUDED.is_verified,
      is_premium = EXCLUDED.is_premium,
      is_profile_complete = EXCLUDED.is_profile_complete,
      profile_completion_percent = EXCLUDED.profile_completion_percent,
      last_active_at = EXCLUDED.last_active_at,
      star = EXCLUDED.star,
      raasi = EXCLUDED.raasi,
      lagnam = EXCLUDED.lagnam,
      gothram = EXCLUDED.gothram,
      tier = EXCLUDED.tier,
      contacts_remaining = EXCLUDED.contacts_remaining,
      interests_remaining = EXCLUDED.interests_remaining,
      food_habit = EXCLUDED.food_habit,
      smoking = EXCLUDED.smoking,
      drinking = EXCLUDED.drinking;
INSERT INTO public.profiles (
      id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at, star, raasi, lagnam, gothram, tier, contacts_remaining, interests_remaining, food_habit, smoking, drinking
    ) VALUES (
      '00000000-0000-4000-a000-00000000006f', 'TM000111', 'Murugan Gopal', 'male', '1998-03-07', 175, 'never_married', 'Hindu', 'Naidu', NULL, 'yes', 'M.Com', 'M.Com Graduate', 'Mechanical Engineer', 'Mechanical Engineer Details', '₹15 Lakhs - ₹20 Lakhs', 'TCS', 'Tirunelveli', 'Tirunelveli', 'Hi, I am Murugan. I have completed my M.Com and am currently working as a Mechanical Engineer at TCS in Tirunelveli. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'upper_middle_class', true, false, true, 100, NOW() - INTERVAL '1 days', 'Moola', 'Kanni', 'Thulaam', 'Bharadwaj', 'free', 5, 5, 'vegetarian', 'no', 'no'
    ) ON CONFLICT (id) DO UPDATE SET
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
      is_verified = EXCLUDED.is_verified,
      is_premium = EXCLUDED.is_premium,
      is_profile_complete = EXCLUDED.is_profile_complete,
      profile_completion_percent = EXCLUDED.profile_completion_percent,
      last_active_at = EXCLUDED.last_active_at,
      star = EXCLUDED.star,
      raasi = EXCLUDED.raasi,
      lagnam = EXCLUDED.lagnam,
      gothram = EXCLUDED.gothram,
      tier = EXCLUDED.tier,
      contacts_remaining = EXCLUDED.contacts_remaining,
      interests_remaining = EXCLUDED.interests_remaining,
      food_habit = EXCLUDED.food_habit,
      smoking = EXCLUDED.smoking,
      drinking = EXCLUDED.drinking;
INSERT INTO public.profiles (
      id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at, star, raasi, lagnam, gothram, tier, contacts_remaining, interests_remaining, food_habit, smoking, drinking
    ) VALUES (
      '00000000-0000-4000-a000-000000000070', 'TM000112', 'Swetha Velan', 'female', '1988-02-27', 167, 'never_married', 'Hindu', 'Chettiar', NULL, 'no', 'B.E. / B.Tech', 'B.E. / B.Tech Graduate', 'Bank Manager', 'Bank Manager Details', '₹20 Lakhs+', 'Wipro', 'Chennai', 'Chennai', 'Hi, I am Swetha. I have completed my B.E. / B.Tech and am currently working as a Bank Manager at Wipro in Chennai. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'rich', false, true, true, 100, NOW() - INTERVAL '1 days', 'Anuradha', 'Magaram', 'Viruchigam', 'Agastya', 'gold', 50, 100, 'vegetarian', 'no', 'no'
    ) ON CONFLICT (id) DO UPDATE SET
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
      is_verified = EXCLUDED.is_verified,
      is_premium = EXCLUDED.is_premium,
      is_profile_complete = EXCLUDED.is_profile_complete,
      profile_completion_percent = EXCLUDED.profile_completion_percent,
      last_active_at = EXCLUDED.last_active_at,
      star = EXCLUDED.star,
      raasi = EXCLUDED.raasi,
      lagnam = EXCLUDED.lagnam,
      gothram = EXCLUDED.gothram,
      tier = EXCLUDED.tier,
      contacts_remaining = EXCLUDED.contacts_remaining,
      interests_remaining = EXCLUDED.interests_remaining,
      food_habit = EXCLUDED.food_habit,
      smoking = EXCLUDED.smoking,
      drinking = EXCLUDED.drinking;
INSERT INTO public.profiles (
      id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at, star, raasi, lagnam, gothram, tier, contacts_remaining, interests_remaining, food_habit, smoking, drinking
    ) VALUES (
      '00000000-0000-4000-a000-000000000071', 'TM000113', 'Elango Moorthy', 'male', '1993-10-26', 185, 'divorced', 'Christian', 'Protestant Christian', NULL, 'no', 'M.C.A', 'M.C.A Graduate', 'Architect', 'Architect Details', '₹20 Lakhs+', 'Private Practice', 'Madurai', 'Madurai', 'Hi, I am Elango. I have completed my M.C.A and am currently working as a Architect at Private Practice in Madurai. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'middle_class', true, true, true, 100, NOW() - INTERVAL '6 days', 'Uttaraphalguni', 'Kanni', 'Viruchigam', 'Murugan', 'gold', 50, 100, 'vegetarian', 'no', 'no'
    ) ON CONFLICT (id) DO UPDATE SET
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
      is_verified = EXCLUDED.is_verified,
      is_premium = EXCLUDED.is_premium,
      is_profile_complete = EXCLUDED.is_profile_complete,
      profile_completion_percent = EXCLUDED.profile_completion_percent,
      last_active_at = EXCLUDED.last_active_at,
      star = EXCLUDED.star,
      raasi = EXCLUDED.raasi,
      lagnam = EXCLUDED.lagnam,
      gothram = EXCLUDED.gothram,
      tier = EXCLUDED.tier,
      contacts_remaining = EXCLUDED.contacts_remaining,
      interests_remaining = EXCLUDED.interests_remaining,
      food_habit = EXCLUDED.food_habit,
      smoking = EXCLUDED.smoking,
      drinking = EXCLUDED.drinking;
INSERT INTO public.profiles (
      id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at, star, raasi, lagnam, gothram, tier, contacts_remaining, interests_remaining, food_habit, smoking, drinking
    ) VALUES (
      '00000000-0000-4000-a000-000000000072', 'TM000114', 'Abirami Moorthy', 'female', '2004-03-04', 171, 'divorced', 'Hindu', 'Vanniyar', NULL, 'no', 'B.A', 'B.A Graduate', 'Pharmacist', 'Pharmacist Details', '₹3 Lakhs - ₹5 Lakhs', 'Wipro', 'Thanjavur', 'Thanjavur', 'Hi, I am Abirami. I have completed my B.A and am currently working as a Pharmacist at Wipro in Thanjavur. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'rich', true, true, true, 100, NOW() - INTERVAL '10 days', 'Poorvaphalguni', 'Thulaam', 'Meenam', 'Bharadwaj', 'gold', 50, 100, 'vegetarian', 'no', 'no'
    ) ON CONFLICT (id) DO UPDATE SET
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
      is_verified = EXCLUDED.is_verified,
      is_premium = EXCLUDED.is_premium,
      is_profile_complete = EXCLUDED.is_profile_complete,
      profile_completion_percent = EXCLUDED.profile_completion_percent,
      last_active_at = EXCLUDED.last_active_at,
      star = EXCLUDED.star,
      raasi = EXCLUDED.raasi,
      lagnam = EXCLUDED.lagnam,
      gothram = EXCLUDED.gothram,
      tier = EXCLUDED.tier,
      contacts_remaining = EXCLUDED.contacts_remaining,
      interests_remaining = EXCLUDED.interests_remaining,
      food_habit = EXCLUDED.food_habit,
      smoking = EXCLUDED.smoking,
      drinking = EXCLUDED.drinking;
INSERT INTO public.profiles (
      id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at, star, raasi, lagnam, gothram, tier, contacts_remaining, interests_remaining, food_habit, smoking, drinking
    ) VALUES (
      '00000000-0000-4000-a000-000000000073', 'TM000115', 'Ajith Raman', 'male', '1998-10-24', 162, 'never_married', 'Hindu', 'Vellalar', NULL, 'no', 'B.Sc', 'B.Sc Graduate', 'Police Officer', 'Police Officer Details', '₹20 Lakhs+', 'Private Practice', 'Madurai', 'Madurai', 'Hi, I am Ajith. I have completed my B.Sc and am currently working as a Police Officer at Private Practice in Madurai. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'rich', true, true, true, 100, NOW() - INTERVAL '1 days', 'Bharani', 'Rishabam', 'Viruchigam', 'Gautama', 'gold', 50, 100, 'vegetarian', 'no', 'no'
    ) ON CONFLICT (id) DO UPDATE SET
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
      is_verified = EXCLUDED.is_verified,
      is_premium = EXCLUDED.is_premium,
      is_profile_complete = EXCLUDED.is_profile_complete,
      profile_completion_percent = EXCLUDED.profile_completion_percent,
      last_active_at = EXCLUDED.last_active_at,
      star = EXCLUDED.star,
      raasi = EXCLUDED.raasi,
      lagnam = EXCLUDED.lagnam,
      gothram = EXCLUDED.gothram,
      tier = EXCLUDED.tier,
      contacts_remaining = EXCLUDED.contacts_remaining,
      interests_remaining = EXCLUDED.interests_remaining,
      food_habit = EXCLUDED.food_habit,
      smoking = EXCLUDED.smoking,
      drinking = EXCLUDED.drinking;
INSERT INTO public.profiles (
      id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at, star, raasi, lagnam, gothram, tier, contacts_remaining, interests_remaining, food_habit, smoking, drinking
    ) VALUES (
      '00000000-0000-4000-a000-000000000074', 'TM000116', 'Vanitha Naicker', 'female', '1993-02-09', 163, 'never_married', 'Hindu', 'Pillai', NULL, 'no', 'B.Com', 'B.Com Graduate', 'Civil Engineer', 'Civil Engineer Details', '₹5 Lakhs - ₹7 Lakhs', 'HCL', 'Thanjavur', 'Thanjavur', 'Hi, I am Vanitha. I have completed my B.Com and am currently working as a Civil Engineer at HCL in Thanjavur. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'rich', true, false, true, 100, NOW() - INTERVAL '7 days', 'Ashwini', 'Viruchigam', 'Kadagam', 'Murugan', 'free', 5, 5, 'vegetarian', 'no', 'no'
    ) ON CONFLICT (id) DO UPDATE SET
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
      is_verified = EXCLUDED.is_verified,
      is_premium = EXCLUDED.is_premium,
      is_profile_complete = EXCLUDED.is_profile_complete,
      profile_completion_percent = EXCLUDED.profile_completion_percent,
      last_active_at = EXCLUDED.last_active_at,
      star = EXCLUDED.star,
      raasi = EXCLUDED.raasi,
      lagnam = EXCLUDED.lagnam,
      gothram = EXCLUDED.gothram,
      tier = EXCLUDED.tier,
      contacts_remaining = EXCLUDED.contacts_remaining,
      interests_remaining = EXCLUDED.interests_remaining,
      food_habit = EXCLUDED.food_habit,
      smoking = EXCLUDED.smoking,
      drinking = EXCLUDED.drinking;
INSERT INTO public.profiles (
      id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at, star, raasi, lagnam, gothram, tier, contacts_remaining, interests_remaining, food_habit, smoking, drinking
    ) VALUES (
      '00000000-0000-4000-a000-000000000075', 'TM000117', 'Siva Lingam', 'male', '2000-11-20', 186, 'never_married', 'Hindu', 'Naicker', 'Naicker subcaste', 'no', 'B.A', 'B.A Graduate', 'Auditor', 'Auditor Details', '₹10 Lakhs - ₹15 Lakhs', 'Wipro', 'Tiruppur', 'Tiruppur', 'Hi, I am Siva. I have completed my B.A and am currently working as a Auditor at Wipro in Tiruppur. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'joint', 'rich', true, false, true, 100, NOW() - INTERVAL '8 days', 'Uttarabhadrapada', 'Simham', 'Meenam', 'Vashishta', 'free', 5, 5, 'vegetarian', 'no', 'no'
    ) ON CONFLICT (id) DO UPDATE SET
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
      is_verified = EXCLUDED.is_verified,
      is_premium = EXCLUDED.is_premium,
      is_profile_complete = EXCLUDED.is_profile_complete,
      profile_completion_percent = EXCLUDED.profile_completion_percent,
      last_active_at = EXCLUDED.last_active_at,
      star = EXCLUDED.star,
      raasi = EXCLUDED.raasi,
      lagnam = EXCLUDED.lagnam,
      gothram = EXCLUDED.gothram,
      tier = EXCLUDED.tier,
      contacts_remaining = EXCLUDED.contacts_remaining,
      interests_remaining = EXCLUDED.interests_remaining,
      food_habit = EXCLUDED.food_habit,
      smoking = EXCLUDED.smoking,
      drinking = EXCLUDED.drinking;
INSERT INTO public.profiles (
      id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at, star, raasi, lagnam, gothram, tier, contacts_remaining, interests_remaining, food_habit, smoking, drinking
    ) VALUES (
      '00000000-0000-4000-a000-000000000076', 'TM000118', 'Anitha Shankar', 'female', '1992-07-26', 164, 'never_married', 'Hindu', 'Naicker', 'Naicker subcaste', 'no', 'B.Sc', 'B.Sc Graduate', 'Government Officer', 'Government Officer Details', '₹20 Lakhs+', 'TCS', 'Tiruppur', 'Tiruppur', 'Hi, I am Anitha. I have completed my B.Sc and am currently working as a Government Officer at TCS in Tiruppur. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'middle_class', true, true, true, 100, NOW() - INTERVAL '3 days', 'Rohini', 'Magaram', 'Simham', 'Vishnu', 'gold', 50, 100, 'vegetarian', 'no', 'no'
    ) ON CONFLICT (id) DO UPDATE SET
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
      is_verified = EXCLUDED.is_verified,
      is_premium = EXCLUDED.is_premium,
      is_profile_complete = EXCLUDED.is_profile_complete,
      profile_completion_percent = EXCLUDED.profile_completion_percent,
      last_active_at = EXCLUDED.last_active_at,
      star = EXCLUDED.star,
      raasi = EXCLUDED.raasi,
      lagnam = EXCLUDED.lagnam,
      gothram = EXCLUDED.gothram,
      tier = EXCLUDED.tier,
      contacts_remaining = EXCLUDED.contacts_remaining,
      interests_remaining = EXCLUDED.interests_remaining,
      food_habit = EXCLUDED.food_habit,
      smoking = EXCLUDED.smoking,
      drinking = EXCLUDED.drinking;
INSERT INTO public.profiles (
      id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at, star, raasi, lagnam, gothram, tier, contacts_remaining, interests_remaining, food_habit, smoking, drinking
    ) VALUES (
      '00000000-0000-4000-a000-000000000077', 'TM000119', 'Vijay Nathan', 'male', '1998-09-20', 168, 'never_married', 'Hindu', 'Devendra Kula Vellalar', NULL, 'yes', 'M.C.A', 'M.C.A Graduate', 'College Professor', 'College Professor Details', '₹5 Lakhs - ₹7 Lakhs', 'Accenture', 'Thoothukudi', 'Tuticorin', 'Hi, I am Vijay. I have completed my M.C.A and am currently working as a College Professor at Accenture in Thoothukudi. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'rich', true, false, true, 100, NOW() - INTERVAL '2 days', 'Vishakha', 'Rishabam', 'Meenam', 'Harita', 'free', 5, 5, 'vegetarian', 'no', 'no'
    ) ON CONFLICT (id) DO UPDATE SET
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
      is_verified = EXCLUDED.is_verified,
      is_premium = EXCLUDED.is_premium,
      is_profile_complete = EXCLUDED.is_profile_complete,
      profile_completion_percent = EXCLUDED.profile_completion_percent,
      last_active_at = EXCLUDED.last_active_at,
      star = EXCLUDED.star,
      raasi = EXCLUDED.raasi,
      lagnam = EXCLUDED.lagnam,
      gothram = EXCLUDED.gothram,
      tier = EXCLUDED.tier,
      contacts_remaining = EXCLUDED.contacts_remaining,
      interests_remaining = EXCLUDED.interests_remaining,
      food_habit = EXCLUDED.food_habit,
      smoking = EXCLUDED.smoking,
      drinking = EXCLUDED.drinking;
INSERT INTO public.profiles (
      id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at, star, raasi, lagnam, gothram, tier, contacts_remaining, interests_remaining, food_habit, smoking, drinking
    ) VALUES (
      '00000000-0000-4000-a000-000000000078', 'TM000120', 'Oviya Selvan', 'female', '1997-09-25', 169, 'never_married', 'Hindu', 'Brahmin - Iyengar', 'Brahmin - Iyengar subcaste', 'no', 'B.Ed', 'B.Ed Graduate', 'Police Officer', 'Police Officer Details', '₹10 Lakhs - ₹15 Lakhs', 'Accenture', 'Coimbatore', 'Coimbatore', 'Hi, I am Oviya. I have completed my B.Ed and am currently working as a Police Officer at Accenture in Coimbatore. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'upper_middle_class', false, true, true, 100, NOW() - INTERVAL '0 days', 'Arudra', 'Rishabam', 'Simham', 'Gautama', 'gold', 50, 100, 'vegetarian', 'no', 'no'
    ) ON CONFLICT (id) DO UPDATE SET
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
      is_verified = EXCLUDED.is_verified,
      is_premium = EXCLUDED.is_premium,
      is_profile_complete = EXCLUDED.is_profile_complete,
      profile_completion_percent = EXCLUDED.profile_completion_percent,
      last_active_at = EXCLUDED.last_active_at,
      star = EXCLUDED.star,
      raasi = EXCLUDED.raasi,
      lagnam = EXCLUDED.lagnam,
      gothram = EXCLUDED.gothram,
      tier = EXCLUDED.tier,
      contacts_remaining = EXCLUDED.contacts_remaining,
      interests_remaining = EXCLUDED.interests_remaining,
      food_habit = EXCLUDED.food_habit,
      smoking = EXCLUDED.smoking,
      drinking = EXCLUDED.drinking;
INSERT INTO public.profiles (
      id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at, star, raasi, lagnam, gothram, tier, contacts_remaining, interests_remaining, food_habit, smoking, drinking
    ) VALUES (
      '00000000-0000-4000-a000-000000000079', 'TM000121', 'Aravind Krishnan', 'male', '2003-06-10', 170, 'never_married', 'Hindu', 'Mudaliar', 'Mudaliar subcaste', 'no', 'B.Sc', 'B.Sc Graduate', 'Architect', 'Architect Details', '₹15 Lakhs - ₹20 Lakhs', 'Zoho', 'Coimbatore', 'Coimbatore', 'Hi, I am Aravind. I have completed my B.Sc and am currently working as a Architect at Zoho in Coimbatore. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'upper_middle_class', true, false, true, 100, NOW() - INTERVAL '2 days', 'Chitra', 'Simham', 'Thulaam', 'Angirasa', 'free', 5, 5, 'vegetarian', 'no', 'no'
    ) ON CONFLICT (id) DO UPDATE SET
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
      is_verified = EXCLUDED.is_verified,
      is_premium = EXCLUDED.is_premium,
      is_profile_complete = EXCLUDED.is_profile_complete,
      profile_completion_percent = EXCLUDED.profile_completion_percent,
      last_active_at = EXCLUDED.last_active_at,
      star = EXCLUDED.star,
      raasi = EXCLUDED.raasi,
      lagnam = EXCLUDED.lagnam,
      gothram = EXCLUDED.gothram,
      tier = EXCLUDED.tier,
      contacts_remaining = EXCLUDED.contacts_remaining,
      interests_remaining = EXCLUDED.interests_remaining,
      food_habit = EXCLUDED.food_habit,
      smoking = EXCLUDED.smoking,
      drinking = EXCLUDED.drinking;
INSERT INTO public.profiles (
      id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at, star, raasi, lagnam, gothram, tier, contacts_remaining, interests_remaining, food_habit, smoking, drinking
    ) VALUES (
      '00000000-0000-4000-a000-00000000007a', 'TM000122', 'Lakshmi Devan', 'female', '1997-02-22', 170, 'never_married', 'Hindu', 'Nadar', 'Nadar subcaste', 'no', 'Ph.D', 'Ph.D Graduate', 'Software Engineer', 'Software Engineer Details', '₹20 Lakhs+', 'Infosys', 'Erode', 'Erode', 'Hi, I am Lakshmi. I have completed my Ph.D and am currently working as a Software Engineer at Infosys in Erode. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'middle_class', true, true, true, 100, NOW() - INTERVAL '4 days', 'Moola', 'Kanni', 'Magaram', 'Angirasa', 'gold', 50, 100, 'vegetarian', 'no', 'no'
    ) ON CONFLICT (id) DO UPDATE SET
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
      is_verified = EXCLUDED.is_verified,
      is_premium = EXCLUDED.is_premium,
      is_profile_complete = EXCLUDED.is_profile_complete,
      profile_completion_percent = EXCLUDED.profile_completion_percent,
      last_active_at = EXCLUDED.last_active_at,
      star = EXCLUDED.star,
      raasi = EXCLUDED.raasi,
      lagnam = EXCLUDED.lagnam,
      gothram = EXCLUDED.gothram,
      tier = EXCLUDED.tier,
      contacts_remaining = EXCLUDED.contacts_remaining,
      interests_remaining = EXCLUDED.interests_remaining,
      food_habit = EXCLUDED.food_habit,
      smoking = EXCLUDED.smoking,
      drinking = EXCLUDED.drinking;
INSERT INTO public.profiles (
      id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at, star, raasi, lagnam, gothram, tier, contacts_remaining, interests_remaining, food_habit, smoking, drinking
    ) VALUES (
      '00000000-0000-4000-a000-00000000007b', 'TM000123', 'Naveen Raman', 'male', '1990-04-26', 165, 'never_married', 'Hindu', 'Mudaliar', 'Mudaliar subcaste', 'no', 'B.Com', 'B.Com Graduate', 'Dentist', 'Dentist Details', '₹20 Lakhs+', 'Government Service', 'Madurai', 'Madurai', 'Hi, I am Naveen. I have completed my B.Com and am currently working as a Dentist at Government Service in Madurai. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'rich', false, false, true, 100, NOW() - INTERVAL '1 days', 'Uttaraphalguni', 'Viruchigam', 'Mithunam', 'Bharadwaj', 'free', 5, 5, 'vegetarian', 'no', 'no'
    ) ON CONFLICT (id) DO UPDATE SET
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
      is_verified = EXCLUDED.is_verified,
      is_premium = EXCLUDED.is_premium,
      is_profile_complete = EXCLUDED.is_profile_complete,
      profile_completion_percent = EXCLUDED.profile_completion_percent,
      last_active_at = EXCLUDED.last_active_at,
      star = EXCLUDED.star,
      raasi = EXCLUDED.raasi,
      lagnam = EXCLUDED.lagnam,
      gothram = EXCLUDED.gothram,
      tier = EXCLUDED.tier,
      contacts_remaining = EXCLUDED.contacts_remaining,
      interests_remaining = EXCLUDED.interests_remaining,
      food_habit = EXCLUDED.food_habit,
      smoking = EXCLUDED.smoking,
      drinking = EXCLUDED.drinking;
INSERT INTO public.profiles (
      id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at, star, raasi, lagnam, gothram, tier, contacts_remaining, interests_remaining, food_habit, smoking, drinking
    ) VALUES (
      '00000000-0000-4000-a000-00000000007c', 'TM000124', 'Shanthi Naicker', 'female', '1992-02-05', 172, 'never_married', 'Christian', 'Nadar Christian', NULL, 'no', 'M.A', 'M.A Graduate', 'Auditor', 'Auditor Details', '₹3 Lakhs - ₹5 Lakhs', 'Zoho', 'Kanchipuram', 'Kanchipuram', 'Hi, I am Shanthi. I have completed my M.A and am currently working as a Auditor at Zoho in Kanchipuram. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'upper_middle_class', true, false, true, 100, NOW() - INTERVAL '2 days', 'Arudra', 'Kadagam', 'Dhanusu', 'Viswamitra', 'free', 5, 5, 'vegetarian', 'no', 'no'
    ) ON CONFLICT (id) DO UPDATE SET
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
      is_verified = EXCLUDED.is_verified,
      is_premium = EXCLUDED.is_premium,
      is_profile_complete = EXCLUDED.is_profile_complete,
      profile_completion_percent = EXCLUDED.profile_completion_percent,
      last_active_at = EXCLUDED.last_active_at,
      star = EXCLUDED.star,
      raasi = EXCLUDED.raasi,
      lagnam = EXCLUDED.lagnam,
      gothram = EXCLUDED.gothram,
      tier = EXCLUDED.tier,
      contacts_remaining = EXCLUDED.contacts_remaining,
      interests_remaining = EXCLUDED.interests_remaining,
      food_habit = EXCLUDED.food_habit,
      smoking = EXCLUDED.smoking,
      drinking = EXCLUDED.drinking;
INSERT INTO public.profiles (
      id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at, star, raasi, lagnam, gothram, tier, contacts_remaining, interests_remaining, food_habit, smoking, drinking
    ) VALUES (
      '00000000-0000-4000-a000-00000000007d', 'TM000125', 'Anand Samy', 'male', '1993-03-15', 180, 'never_married', 'Hindu', 'Kallar', 'Kallar subcaste', 'no', 'B.Com', 'B.Com Graduate', 'Doctor', 'Doctor Details', '₹5 Lakhs - ₹7 Lakhs', 'TCS', 'Tirunelveli', 'Tirunelveli', 'Hi, I am Anand. I have completed my B.Com and am currently working as a Doctor at TCS in Tirunelveli. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'upper_middle_class', true, false, true, 100, NOW() - INTERVAL '6 days', 'Vishakha', 'Mesham', 'Rishabam', 'Vashishta', 'free', 5, 5, 'vegetarian', 'no', 'no'
    ) ON CONFLICT (id) DO UPDATE SET
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
      is_verified = EXCLUDED.is_verified,
      is_premium = EXCLUDED.is_premium,
      is_profile_complete = EXCLUDED.is_profile_complete,
      profile_completion_percent = EXCLUDED.profile_completion_percent,
      last_active_at = EXCLUDED.last_active_at,
      star = EXCLUDED.star,
      raasi = EXCLUDED.raasi,
      lagnam = EXCLUDED.lagnam,
      gothram = EXCLUDED.gothram,
      tier = EXCLUDED.tier,
      contacts_remaining = EXCLUDED.contacts_remaining,
      interests_remaining = EXCLUDED.interests_remaining,
      food_habit = EXCLUDED.food_habit,
      smoking = EXCLUDED.smoking,
      drinking = EXCLUDED.drinking;
INSERT INTO public.profiles (
      id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at, star, raasi, lagnam, gothram, tier, contacts_remaining, interests_remaining, food_habit, smoking, drinking
    ) VALUES (
      '00000000-0000-4000-a000-00000000007e', 'TM000126', 'Indhumathi Raman', 'female', '1996-06-18', 175, 'never_married', 'Muslim', 'Labbai', NULL, 'no', 'M.C.A', 'M.C.A Graduate', 'Advocate', 'Advocate Details', '₹7 Lakhs - ₹10 Lakhs', 'TCS', 'Erode', 'Erode', 'Hi, I am Indhumathi. I have completed my M.C.A and am currently working as a Advocate at TCS in Erode. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'middle_class', true, false, true, 100, NOW() - INTERVAL '5 days', 'Poorvashadha', 'Mesham', 'Viruchigam', 'Kasyapa', 'free', 5, 5, 'vegetarian', 'no', 'no'
    ) ON CONFLICT (id) DO UPDATE SET
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
      is_verified = EXCLUDED.is_verified,
      is_premium = EXCLUDED.is_premium,
      is_profile_complete = EXCLUDED.is_profile_complete,
      profile_completion_percent = EXCLUDED.profile_completion_percent,
      last_active_at = EXCLUDED.last_active_at,
      star = EXCLUDED.star,
      raasi = EXCLUDED.raasi,
      lagnam = EXCLUDED.lagnam,
      gothram = EXCLUDED.gothram,
      tier = EXCLUDED.tier,
      contacts_remaining = EXCLUDED.contacts_remaining,
      interests_remaining = EXCLUDED.interests_remaining,
      food_habit = EXCLUDED.food_habit,
      smoking = EXCLUDED.smoking,
      drinking = EXCLUDED.drinking;
INSERT INTO public.profiles (
      id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at, star, raasi, lagnam, gothram, tier, contacts_remaining, interests_remaining, food_habit, smoking, drinking
    ) VALUES (
      '00000000-0000-4000-a000-00000000007f', 'TM000127', 'Sakthi Kumar', 'male', '1989-02-19', 170, 'never_married', 'Hindu', 'Pillai', 'Pillai subcaste', 'no', 'M.B.B.S', 'M.B.B.S Graduate', 'Software Engineer', 'Software Engineer Details', '₹5 Lakhs - ₹7 Lakhs', 'HCL', 'Chennai', 'Chennai', 'Hi, I am Sakthi. I have completed my M.B.B.S and am currently working as a Software Engineer at HCL in Chennai. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'rich', false, false, true, 100, NOW() - INTERVAL '5 days', 'Moola', 'Thulaam', 'Simham', 'Atri', 'free', 5, 5, 'vegetarian', 'no', 'no'
    ) ON CONFLICT (id) DO UPDATE SET
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
      is_verified = EXCLUDED.is_verified,
      is_premium = EXCLUDED.is_premium,
      is_profile_complete = EXCLUDED.is_profile_complete,
      profile_completion_percent = EXCLUDED.profile_completion_percent,
      last_active_at = EXCLUDED.last_active_at,
      star = EXCLUDED.star,
      raasi = EXCLUDED.raasi,
      lagnam = EXCLUDED.lagnam,
      gothram = EXCLUDED.gothram,
      tier = EXCLUDED.tier,
      contacts_remaining = EXCLUDED.contacts_remaining,
      interests_remaining = EXCLUDED.interests_remaining,
      food_habit = EXCLUDED.food_habit,
      smoking = EXCLUDED.smoking,
      drinking = EXCLUDED.drinking;
INSERT INTO public.profiles (
      id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at, star, raasi, lagnam, gothram, tier, contacts_remaining, interests_remaining, food_habit, smoking, drinking
    ) VALUES (
      '00000000-0000-4000-a000-000000000080', 'TM000128', 'Janani Sundaram', 'female', '2005-08-12', 168, 'never_married', 'Hindu', 'Vishwakarma', 'Vishwakarma subcaste', 'no', 'Ph.D', 'Ph.D Graduate', 'Advocate', 'Advocate Details', '₹3 Lakhs - ₹5 Lakhs', 'Government Service', 'Madurai', 'Madurai', 'Hi, I am Janani. I have completed my Ph.D and am currently working as a Advocate at Government Service in Madurai. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'upper_middle_class', true, false, true, 100, NOW() - INTERVAL '6 days', 'Hasta', 'Rishabam', 'Kumbam', 'Siva', 'free', 5, 5, 'vegetarian', 'no', 'no'
    ) ON CONFLICT (id) DO UPDATE SET
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
      is_verified = EXCLUDED.is_verified,
      is_premium = EXCLUDED.is_premium,
      is_profile_complete = EXCLUDED.is_profile_complete,
      profile_completion_percent = EXCLUDED.profile_completion_percent,
      last_active_at = EXCLUDED.last_active_at,
      star = EXCLUDED.star,
      raasi = EXCLUDED.raasi,
      lagnam = EXCLUDED.lagnam,
      gothram = EXCLUDED.gothram,
      tier = EXCLUDED.tier,
      contacts_remaining = EXCLUDED.contacts_remaining,
      interests_remaining = EXCLUDED.interests_remaining,
      food_habit = EXCLUDED.food_habit,
      smoking = EXCLUDED.smoking,
      drinking = EXCLUDED.drinking;
INSERT INTO public.profiles (
      id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at, star, raasi, lagnam, gothram, tier, contacts_remaining, interests_remaining, food_habit, smoking, drinking
    ) VALUES (
      '00000000-0000-4000-a000-000000000081', 'TM000129', 'Ganesan Naicker', 'male', '2005-05-22', 169, 'divorced', 'Hindu', 'Devendra Kula Vellalar', 'Devendra Kula Vellalar subcaste', 'no', 'M.B.B.S', 'M.B.B.S Graduate', 'Pharmacist', 'Pharmacist Details', '₹10 Lakhs - ₹15 Lakhs', 'Infosys', 'Madurai', 'Madurai', 'Hi, I am Ganesan. I have completed my M.B.B.S and am currently working as a Pharmacist at Infosys in Madurai. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'middle_class', true, false, true, 100, NOW() - INTERVAL '10 days', 'Poorvaphalguni', 'Thulaam', 'Mithunam', 'Murugan', 'free', 5, 5, 'vegetarian', 'no', 'no'
    ) ON CONFLICT (id) DO UPDATE SET
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
      is_verified = EXCLUDED.is_verified,
      is_premium = EXCLUDED.is_premium,
      is_profile_complete = EXCLUDED.is_profile_complete,
      profile_completion_percent = EXCLUDED.profile_completion_percent,
      last_active_at = EXCLUDED.last_active_at,
      star = EXCLUDED.star,
      raasi = EXCLUDED.raasi,
      lagnam = EXCLUDED.lagnam,
      gothram = EXCLUDED.gothram,
      tier = EXCLUDED.tier,
      contacts_remaining = EXCLUDED.contacts_remaining,
      interests_remaining = EXCLUDED.interests_remaining,
      food_habit = EXCLUDED.food_habit,
      smoking = EXCLUDED.smoking,
      drinking = EXCLUDED.drinking;
INSERT INTO public.profiles (
      id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at, star, raasi, lagnam, gothram, tier, contacts_remaining, interests_remaining, food_habit, smoking, drinking
    ) VALUES (
      '00000000-0000-4000-a000-000000000082', 'TM000130', 'Anitha Swamy', 'female', '1991-09-26', 167, 'never_married', 'Hindu', 'Pillai', NULL, 'yes', 'B.Sc', 'B.Sc Graduate', 'Bank Manager', 'Bank Manager Details', '₹10 Lakhs - ₹15 Lakhs', 'HCL', 'Tirunelveli', 'Tirunelveli', 'Hi, I am Anitha. I have completed my B.Sc and am currently working as a Bank Manager at HCL in Tirunelveli. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'middle_class', false, true, true, 100, NOW() - INTERVAL '4 days', 'Aslesha', 'Magaram', 'Magaram', 'Vishnu', 'gold', 50, 100, 'vegetarian', 'no', 'no'
    ) ON CONFLICT (id) DO UPDATE SET
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
      is_verified = EXCLUDED.is_verified,
      is_premium = EXCLUDED.is_premium,
      is_profile_complete = EXCLUDED.is_profile_complete,
      profile_completion_percent = EXCLUDED.profile_completion_percent,
      last_active_at = EXCLUDED.last_active_at,
      star = EXCLUDED.star,
      raasi = EXCLUDED.raasi,
      lagnam = EXCLUDED.lagnam,
      gothram = EXCLUDED.gothram,
      tier = EXCLUDED.tier,
      contacts_remaining = EXCLUDED.contacts_remaining,
      interests_remaining = EXCLUDED.interests_remaining,
      food_habit = EXCLUDED.food_habit,
      smoking = EXCLUDED.smoking,
      drinking = EXCLUDED.drinking;
INSERT INTO public.profiles (
      id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at, star, raasi, lagnam, gothram, tier, contacts_remaining, interests_remaining, food_habit, smoking, drinking
    ) VALUES (
      '00000000-0000-4000-a000-000000000083', 'TM000131', 'Gautham Kumar', 'male', '1990-12-09', 162, 'never_married', 'Hindu', 'Pillai', 'Pillai subcaste', 'no', 'M.C.A', 'M.C.A Graduate', 'Pharmacist', 'Pharmacist Details', '₹7 Lakhs - ₹10 Lakhs', 'HCL', 'Salem', 'Salem', 'Hi, I am Gautham. I have completed my M.C.A and am currently working as a Pharmacist at HCL in Salem. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'joint', 'upper_middle_class', false, false, true, 100, NOW() - INTERVAL '5 days', 'Uttarabhadrapada', 'Kumbam', 'Meenam', 'Vashishta', 'free', 5, 5, 'vegetarian', 'no', 'no'
    ) ON CONFLICT (id) DO UPDATE SET
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
      is_verified = EXCLUDED.is_verified,
      is_premium = EXCLUDED.is_premium,
      is_profile_complete = EXCLUDED.is_profile_complete,
      profile_completion_percent = EXCLUDED.profile_completion_percent,
      last_active_at = EXCLUDED.last_active_at,
      star = EXCLUDED.star,
      raasi = EXCLUDED.raasi,
      lagnam = EXCLUDED.lagnam,
      gothram = EXCLUDED.gothram,
      tier = EXCLUDED.tier,
      contacts_remaining = EXCLUDED.contacts_remaining,
      interests_remaining = EXCLUDED.interests_remaining,
      food_habit = EXCLUDED.food_habit,
      smoking = EXCLUDED.smoking,
      drinking = EXCLUDED.drinking;
INSERT INTO public.profiles (
      id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at, star, raasi, lagnam, gothram, tier, contacts_remaining, interests_remaining, food_habit, smoking, drinking
    ) VALUES (
      '00000000-0000-4000-a000-000000000084', 'TM000132', 'Vidya Mani', 'female', '1990-08-07', 157, 'divorced', 'Hindu', 'Kallar', 'Kallar subcaste', 'no', 'M.Sc', 'M.Sc Graduate', 'School Teacher', 'School Teacher Details', '₹3 Lakhs - ₹5 Lakhs', 'Cognizant', 'Chennai', 'Chennai', 'Hi, I am Vidya. I have completed my M.Sc and am currently working as a School Teacher at Cognizant in Chennai. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'upper_middle_class', true, false, true, 100, NOW() - INTERVAL '1 days', 'Bharani', 'Thulaam', 'Mesham', 'Harita', 'free', 5, 5, 'vegetarian', 'no', 'no'
    ) ON CONFLICT (id) DO UPDATE SET
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
      is_verified = EXCLUDED.is_verified,
      is_premium = EXCLUDED.is_premium,
      is_profile_complete = EXCLUDED.is_profile_complete,
      profile_completion_percent = EXCLUDED.profile_completion_percent,
      last_active_at = EXCLUDED.last_active_at,
      star = EXCLUDED.star,
      raasi = EXCLUDED.raasi,
      lagnam = EXCLUDED.lagnam,
      gothram = EXCLUDED.gothram,
      tier = EXCLUDED.tier,
      contacts_remaining = EXCLUDED.contacts_remaining,
      interests_remaining = EXCLUDED.interests_remaining,
      food_habit = EXCLUDED.food_habit,
      smoking = EXCLUDED.smoking,
      drinking = EXCLUDED.drinking;
INSERT INTO public.profiles (
      id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at, star, raasi, lagnam, gothram, tier, contacts_remaining, interests_remaining, food_habit, smoking, drinking
    ) VALUES (
      '00000000-0000-4000-a000-000000000085', 'TM000133', 'Thirumal Balan', 'male', '1997-11-17', 179, 'never_married', 'Hindu', 'Maravar', 'Maravar subcaste', 'no', 'M.C.A', 'M.C.A Graduate', 'HR Specialist', 'HR Specialist Details', '₹20 Lakhs+', 'Private Practice', 'Kanchipuram', 'Kanchipuram', 'Hi, I am Thirumal. I have completed my M.C.A and am currently working as a HR Specialist at Private Practice in Kanchipuram. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'rich', true, false, true, 100, NOW() - INTERVAL '3 days', 'Hasta', 'Rishabam', 'Rishabam', 'Harita', 'free', 5, 5, 'vegetarian', 'no', 'no'
    ) ON CONFLICT (id) DO UPDATE SET
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
      is_verified = EXCLUDED.is_verified,
      is_premium = EXCLUDED.is_premium,
      is_profile_complete = EXCLUDED.is_profile_complete,
      profile_completion_percent = EXCLUDED.profile_completion_percent,
      last_active_at = EXCLUDED.last_active_at,
      star = EXCLUDED.star,
      raasi = EXCLUDED.raasi,
      lagnam = EXCLUDED.lagnam,
      gothram = EXCLUDED.gothram,
      tier = EXCLUDED.tier,
      contacts_remaining = EXCLUDED.contacts_remaining,
      interests_remaining = EXCLUDED.interests_remaining,
      food_habit = EXCLUDED.food_habit,
      smoking = EXCLUDED.smoking,
      drinking = EXCLUDED.drinking;
INSERT INTO public.profiles (
      id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at, star, raasi, lagnam, gothram, tier, contacts_remaining, interests_remaining, food_habit, smoking, drinking
    ) VALUES (
      '00000000-0000-4000-a000-000000000086', 'TM000134', 'Indhumathi Balan', 'female', '2005-04-13', 167, 'never_married', 'Hindu', 'Chettiar', NULL, 'no', 'M.A', 'M.A Graduate', 'Dentist', 'Dentist Details', '₹5 Lakhs - ₹7 Lakhs', 'Zoho', 'Chennai', 'Chennai', 'Hi, I am Indhumathi. I have completed my M.A and am currently working as a Dentist at Zoho in Chennai. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'upper_middle_class', false, false, true, 100, NOW() - INTERVAL '7 days', 'Aslesha', 'Dhanusu', 'Thulaam', 'Gautama', 'free', 5, 5, 'vegetarian', 'no', 'no'
    ) ON CONFLICT (id) DO UPDATE SET
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
      is_verified = EXCLUDED.is_verified,
      is_premium = EXCLUDED.is_premium,
      is_profile_complete = EXCLUDED.is_profile_complete,
      profile_completion_percent = EXCLUDED.profile_completion_percent,
      last_active_at = EXCLUDED.last_active_at,
      star = EXCLUDED.star,
      raasi = EXCLUDED.raasi,
      lagnam = EXCLUDED.lagnam,
      gothram = EXCLUDED.gothram,
      tier = EXCLUDED.tier,
      contacts_remaining = EXCLUDED.contacts_remaining,
      interests_remaining = EXCLUDED.interests_remaining,
      food_habit = EXCLUDED.food_habit,
      smoking = EXCLUDED.smoking,
      drinking = EXCLUDED.drinking;
INSERT INTO public.profiles (
      id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at, star, raasi, lagnam, gothram, tier, contacts_remaining, interests_remaining, food_habit, smoking, drinking
    ) VALUES (
      '00000000-0000-4000-a000-000000000087', 'TM000135', 'Sundar Murthy', 'male', '2004-01-28', 163, 'never_married', 'Christian', 'Protestant Christian', NULL, 'no', 'B.A', 'B.A Graduate', 'Pharmacist', 'Pharmacist Details', '₹5 Lakhs - ₹7 Lakhs', 'Private Practice', 'Erode', 'Erode', 'Hi, I am Sundar. I have completed my B.A and am currently working as a Pharmacist at Private Practice in Erode. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'joint', 'upper_middle_class', true, false, true, 100, NOW() - INTERVAL '4 days', 'Revati', 'Rishabam', 'Dhanusu', 'Angirasa', 'free', 5, 5, 'vegetarian', 'no', 'no'
    ) ON CONFLICT (id) DO UPDATE SET
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
      is_verified = EXCLUDED.is_verified,
      is_premium = EXCLUDED.is_premium,
      is_profile_complete = EXCLUDED.is_profile_complete,
      profile_completion_percent = EXCLUDED.profile_completion_percent,
      last_active_at = EXCLUDED.last_active_at,
      star = EXCLUDED.star,
      raasi = EXCLUDED.raasi,
      lagnam = EXCLUDED.lagnam,
      gothram = EXCLUDED.gothram,
      tier = EXCLUDED.tier,
      contacts_remaining = EXCLUDED.contacts_remaining,
      interests_remaining = EXCLUDED.interests_remaining,
      food_habit = EXCLUDED.food_habit,
      smoking = EXCLUDED.smoking,
      drinking = EXCLUDED.drinking;
INSERT INTO public.profiles (
      id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at, star, raasi, lagnam, gothram, tier, contacts_remaining, interests_remaining, food_habit, smoking, drinking
    ) VALUES (
      '00000000-0000-4000-a000-000000000088', 'TM000136', 'Gayathri Selvan', 'female', '2003-01-18', 161, 'never_married', 'Hindu', 'Vanniyar', 'Vanniyar subcaste', 'no', 'M.A', 'M.A Graduate', 'Bank Manager', 'Bank Manager Details', '₹7 Lakhs - ₹10 Lakhs', 'Wipro', 'Chennai', 'Chennai', 'Hi, I am Gayathri. I have completed my M.A and am currently working as a Bank Manager at Wipro in Chennai. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'middle_class', true, false, true, 100, NOW() - INTERVAL '8 days', 'Hasta', 'Viruchigam', 'Meenam', 'Vishnu', 'free', 5, 5, 'vegetarian', 'no', 'no'
    ) ON CONFLICT (id) DO UPDATE SET
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
      is_verified = EXCLUDED.is_verified,
      is_premium = EXCLUDED.is_premium,
      is_profile_complete = EXCLUDED.is_profile_complete,
      profile_completion_percent = EXCLUDED.profile_completion_percent,
      last_active_at = EXCLUDED.last_active_at,
      star = EXCLUDED.star,
      raasi = EXCLUDED.raasi,
      lagnam = EXCLUDED.lagnam,
      gothram = EXCLUDED.gothram,
      tier = EXCLUDED.tier,
      contacts_remaining = EXCLUDED.contacts_remaining,
      interests_remaining = EXCLUDED.interests_remaining,
      food_habit = EXCLUDED.food_habit,
      smoking = EXCLUDED.smoking,
      drinking = EXCLUDED.drinking;
INSERT INTO public.profiles (
      id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at, star, raasi, lagnam, gothram, tier, contacts_remaining, interests_remaining, food_habit, smoking, drinking
    ) VALUES (
      '00000000-0000-4000-a000-000000000089', 'TM000137', 'Karthik Devan', 'male', '2002-10-17', 164, 'never_married', 'Hindu', 'Gounder', 'Gounder subcaste', 'no', 'B.Ed', 'B.Ed Graduate', 'Auditor', 'Auditor Details', '₹10 Lakhs - ₹15 Lakhs', 'Government Service', 'Vellore', 'Vellore', 'Hi, I am Karthik. I have completed my B.Ed and am currently working as a Auditor at Government Service in Vellore. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'joint', 'middle_class', true, false, true, 100, NOW() - INTERVAL '4 days', 'Ashwini', 'Rishabam', 'Meenam', 'Gautama', 'free', 5, 5, 'vegetarian', 'no', 'no'
    ) ON CONFLICT (id) DO UPDATE SET
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
      is_verified = EXCLUDED.is_verified,
      is_premium = EXCLUDED.is_premium,
      is_profile_complete = EXCLUDED.is_profile_complete,
      profile_completion_percent = EXCLUDED.profile_completion_percent,
      last_active_at = EXCLUDED.last_active_at,
      star = EXCLUDED.star,
      raasi = EXCLUDED.raasi,
      lagnam = EXCLUDED.lagnam,
      gothram = EXCLUDED.gothram,
      tier = EXCLUDED.tier,
      contacts_remaining = EXCLUDED.contacts_remaining,
      interests_remaining = EXCLUDED.interests_remaining,
      food_habit = EXCLUDED.food_habit,
      smoking = EXCLUDED.smoking,
      drinking = EXCLUDED.drinking;
INSERT INTO public.profiles (
      id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at, star, raasi, lagnam, gothram, tier, contacts_remaining, interests_remaining, food_habit, smoking, drinking
    ) VALUES (
      '00000000-0000-4000-a000-00000000008a', 'TM000138', 'Priya Samy', 'female', '2003-12-08', 170, 'never_married', 'Hindu', 'Devendra Kula Vellalar', 'Devendra Kula Vellalar subcaste', 'yes', 'M.B.B.S', 'M.B.B.S Graduate', 'Software Engineer', 'Software Engineer Details', '₹3 Lakhs - ₹5 Lakhs', 'Private Practice', 'Erode', 'Erode', 'Hi, I am Priya. I have completed my M.B.B.S and am currently working as a Software Engineer at Private Practice in Erode. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'rich', false, true, true, 100, NOW() - INTERVAL '1 days', 'Vishakha', 'Dhanusu', 'Mithunam', 'Atri', 'gold', 50, 100, 'vegetarian', 'no', 'no'
    ) ON CONFLICT (id) DO UPDATE SET
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
      is_verified = EXCLUDED.is_verified,
      is_premium = EXCLUDED.is_premium,
      is_profile_complete = EXCLUDED.is_profile_complete,
      profile_completion_percent = EXCLUDED.profile_completion_percent,
      last_active_at = EXCLUDED.last_active_at,
      star = EXCLUDED.star,
      raasi = EXCLUDED.raasi,
      lagnam = EXCLUDED.lagnam,
      gothram = EXCLUDED.gothram,
      tier = EXCLUDED.tier,
      contacts_remaining = EXCLUDED.contacts_remaining,
      interests_remaining = EXCLUDED.interests_remaining,
      food_habit = EXCLUDED.food_habit,
      smoking = EXCLUDED.smoking,
      drinking = EXCLUDED.drinking;
INSERT INTO public.profiles (
      id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at, star, raasi, lagnam, gothram, tier, contacts_remaining, interests_remaining, food_habit, smoking, drinking
    ) VALUES (
      '00000000-0000-4000-a000-00000000008b', 'TM000139', 'Velmurugan Swamy', 'male', '1991-07-09', 172, 'never_married', 'Hindu', 'Brahmin - Iyengar', 'Brahmin - Iyengar subcaste', 'yes', 'M.B.B.S', 'M.B.B.S Graduate', 'Mechanical Engineer', 'Mechanical Engineer Details', '₹7 Lakhs - ₹10 Lakhs', 'HCL', 'Salem', 'Salem', 'Hi, I am Velmurugan. I have completed my M.B.B.S and am currently working as a Mechanical Engineer at HCL in Salem. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'rich', false, false, true, 100, NOW() - INTERVAL '10 days', 'Punarvasu', 'Mesham', 'Meenam', 'Murugan', 'free', 5, 5, 'vegetarian', 'no', 'no'
    ) ON CONFLICT (id) DO UPDATE SET
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
      is_verified = EXCLUDED.is_verified,
      is_premium = EXCLUDED.is_premium,
      is_profile_complete = EXCLUDED.is_profile_complete,
      profile_completion_percent = EXCLUDED.profile_completion_percent,
      last_active_at = EXCLUDED.last_active_at,
      star = EXCLUDED.star,
      raasi = EXCLUDED.raasi,
      lagnam = EXCLUDED.lagnam,
      gothram = EXCLUDED.gothram,
      tier = EXCLUDED.tier,
      contacts_remaining = EXCLUDED.contacts_remaining,
      interests_remaining = EXCLUDED.interests_remaining,
      food_habit = EXCLUDED.food_habit,
      smoking = EXCLUDED.smoking,
      drinking = EXCLUDED.drinking;
INSERT INTO public.profiles (
      id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at, star, raasi, lagnam, gothram, tier, contacts_remaining, interests_remaining, food_habit, smoking, drinking
    ) VALUES (
      '00000000-0000-4000-a000-00000000008c', 'TM000140', 'Megala Devan', 'female', '2005-06-13', 150, 'divorced', 'Hindu', 'Yadav', 'Yadav subcaste', 'no', 'M.A', 'M.A Graduate', 'Architect', 'Architect Details', '₹5 Lakhs - ₹7 Lakhs', 'Self Employed', 'Tiruppur', 'Tiruppur', 'Hi, I am Megala. I have completed my M.A and am currently working as a Architect at Self Employed in Tiruppur. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'middle_class', true, false, true, 100, NOW() - INTERVAL '6 days', 'Poorvashadha', 'Mesham', 'Rishabam', 'Harita', 'free', 5, 5, 'vegetarian', 'no', 'no'
    ) ON CONFLICT (id) DO UPDATE SET
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
      is_verified = EXCLUDED.is_verified,
      is_premium = EXCLUDED.is_premium,
      is_profile_complete = EXCLUDED.is_profile_complete,
      profile_completion_percent = EXCLUDED.profile_completion_percent,
      last_active_at = EXCLUDED.last_active_at,
      star = EXCLUDED.star,
      raasi = EXCLUDED.raasi,
      lagnam = EXCLUDED.lagnam,
      gothram = EXCLUDED.gothram,
      tier = EXCLUDED.tier,
      contacts_remaining = EXCLUDED.contacts_remaining,
      interests_remaining = EXCLUDED.interests_remaining,
      food_habit = EXCLUDED.food_habit,
      smoking = EXCLUDED.smoking,
      drinking = EXCLUDED.drinking;
INSERT INTO public.profiles (
      id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at, star, raasi, lagnam, gothram, tier, contacts_remaining, interests_remaining, food_habit, smoking, drinking
    ) VALUES (
      '00000000-0000-4000-a000-00000000008d', 'TM000141', 'Saravanan Gopal', 'male', '1996-04-09', 183, 'never_married', 'Hindu', 'Maravar', NULL, 'no', 'B.A', 'B.A Graduate', 'Civil Engineer', 'Civil Engineer Details', '₹20 Lakhs+', 'Wipro', 'Tirunelveli', 'Tirunelveli', 'Hi, I am Saravanan. I have completed my B.A and am currently working as a Civil Engineer at Wipro in Tirunelveli. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'middle_class', true, true, true, 100, NOW() - INTERVAL '0 days', 'Vishakha', 'Simham', 'Dhanusu', 'Gautama', 'gold', 50, 100, 'vegetarian', 'no', 'no'
    ) ON CONFLICT (id) DO UPDATE SET
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
      is_verified = EXCLUDED.is_verified,
      is_premium = EXCLUDED.is_premium,
      is_profile_complete = EXCLUDED.is_profile_complete,
      profile_completion_percent = EXCLUDED.profile_completion_percent,
      last_active_at = EXCLUDED.last_active_at,
      star = EXCLUDED.star,
      raasi = EXCLUDED.raasi,
      lagnam = EXCLUDED.lagnam,
      gothram = EXCLUDED.gothram,
      tier = EXCLUDED.tier,
      contacts_remaining = EXCLUDED.contacts_remaining,
      interests_remaining = EXCLUDED.interests_remaining,
      food_habit = EXCLUDED.food_habit,
      smoking = EXCLUDED.smoking,
      drinking = EXCLUDED.drinking;
INSERT INTO public.profiles (
      id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at, star, raasi, lagnam, gothram, tier, contacts_remaining, interests_remaining, food_habit, smoking, drinking
    ) VALUES (
      '00000000-0000-4000-a000-00000000008e', 'TM000142', 'Vanitha Lingam', 'female', '2001-06-16', 163, 'never_married', 'Hindu', 'Maravar', NULL, 'no', 'B.Ed', 'B.Ed Graduate', 'Advocate', 'Advocate Details', '₹15 Lakhs - ₹20 Lakhs', 'Self Employed', 'Madurai', 'Madurai', 'Hi, I am Vanitha. I have completed my B.Ed and am currently working as a Advocate at Self Employed in Madurai. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'joint', 'rich', true, true, true, 100, NOW() - INTERVAL '1 days', 'Aslesha', 'Dhanusu', 'Dhanusu', 'Agastya', 'gold', 50, 100, 'vegetarian', 'no', 'no'
    ) ON CONFLICT (id) DO UPDATE SET
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
      is_verified = EXCLUDED.is_verified,
      is_premium = EXCLUDED.is_premium,
      is_profile_complete = EXCLUDED.is_profile_complete,
      profile_completion_percent = EXCLUDED.profile_completion_percent,
      last_active_at = EXCLUDED.last_active_at,
      star = EXCLUDED.star,
      raasi = EXCLUDED.raasi,
      lagnam = EXCLUDED.lagnam,
      gothram = EXCLUDED.gothram,
      tier = EXCLUDED.tier,
      contacts_remaining = EXCLUDED.contacts_remaining,
      interests_remaining = EXCLUDED.interests_remaining,
      food_habit = EXCLUDED.food_habit,
      smoking = EXCLUDED.smoking,
      drinking = EXCLUDED.drinking;
INSERT INTO public.profiles (
      id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at, star, raasi, lagnam, gothram, tier, contacts_remaining, interests_remaining, food_habit, smoking, drinking
    ) VALUES (
      '00000000-0000-4000-a000-00000000008f', 'TM000143', 'Anbarasan Gopal', 'male', '2004-06-19', 176, 'never_married', 'Hindu', 'Agamudayar', 'Agamudayar subcaste', 'no', 'M.B.A', 'M.B.A Graduate', 'Software Engineer', 'Software Engineer Details', '₹10 Lakhs - ₹15 Lakhs', 'Infosys', 'Erode', 'Erode', 'Hi, I am Anbarasan. I have completed my M.B.A and am currently working as a Software Engineer at Infosys in Erode. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'rich', true, true, true, 100, NOW() - INTERVAL '5 days', 'Shravana', 'Magaram', 'Viruchigam', 'Angirasa', 'gold', 50, 100, 'vegetarian', 'no', 'no'
    ) ON CONFLICT (id) DO UPDATE SET
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
      is_verified = EXCLUDED.is_verified,
      is_premium = EXCLUDED.is_premium,
      is_profile_complete = EXCLUDED.is_profile_complete,
      profile_completion_percent = EXCLUDED.profile_completion_percent,
      last_active_at = EXCLUDED.last_active_at,
      star = EXCLUDED.star,
      raasi = EXCLUDED.raasi,
      lagnam = EXCLUDED.lagnam,
      gothram = EXCLUDED.gothram,
      tier = EXCLUDED.tier,
      contacts_remaining = EXCLUDED.contacts_remaining,
      interests_remaining = EXCLUDED.interests_remaining,
      food_habit = EXCLUDED.food_habit,
      smoking = EXCLUDED.smoking,
      drinking = EXCLUDED.drinking;
INSERT INTO public.profiles (
      id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at, star, raasi, lagnam, gothram, tier, contacts_remaining, interests_remaining, food_habit, smoking, drinking
    ) VALUES (
      '00000000-0000-4000-a000-000000000090', 'TM000144', 'Gowri Swamy', 'female', '2000-03-18', 169, 'never_married', 'Hindu', 'Vanniyar', NULL, 'no', 'B.Ed', 'B.Ed Graduate', 'Auditor', 'Auditor Details', '₹20 Lakhs+', 'Cognizant', 'Salem', 'Salem', 'Hi, I am Gowri. I have completed my B.Ed and am currently working as a Auditor at Cognizant in Salem. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'rich', true, true, true, 100, NOW() - INTERVAL '8 days', 'Revati', 'Dhanusu', 'Mithunam', 'Atri', 'gold', 50, 100, 'vegetarian', 'no', 'no'
    ) ON CONFLICT (id) DO UPDATE SET
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
      is_verified = EXCLUDED.is_verified,
      is_premium = EXCLUDED.is_premium,
      is_profile_complete = EXCLUDED.is_profile_complete,
      profile_completion_percent = EXCLUDED.profile_completion_percent,
      last_active_at = EXCLUDED.last_active_at,
      star = EXCLUDED.star,
      raasi = EXCLUDED.raasi,
      lagnam = EXCLUDED.lagnam,
      gothram = EXCLUDED.gothram,
      tier = EXCLUDED.tier,
      contacts_remaining = EXCLUDED.contacts_remaining,
      interests_remaining = EXCLUDED.interests_remaining,
      food_habit = EXCLUDED.food_habit,
      smoking = EXCLUDED.smoking,
      drinking = EXCLUDED.drinking;
INSERT INTO public.profiles (
      id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at, star, raasi, lagnam, gothram, tier, contacts_remaining, interests_remaining, food_habit, smoking, drinking
    ) VALUES (
      '00000000-0000-4000-a000-000000000091', 'TM000145', 'Rajesh Mani', 'male', '1989-07-08', 187, 'never_married', 'Hindu', 'Brahmin - Iyer', 'Brahmin - Iyer subcaste', 'no', 'M.C.A', 'M.C.A Graduate', 'Doctor', 'Doctor Details', '₹20 Lakhs+', 'Wipro', 'Tiruchirappalli', 'Trichy', 'Hi, I am Rajesh. I have completed my M.C.A and am currently working as a Doctor at Wipro in Tiruchirappalli. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'middle_class', true, false, true, 100, NOW() - INTERVAL '7 days', 'Swati', 'Kumbam', 'Mesham', 'Bharadwaj', 'free', 5, 5, 'vegetarian', 'no', 'no'
    ) ON CONFLICT (id) DO UPDATE SET
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
      is_verified = EXCLUDED.is_verified,
      is_premium = EXCLUDED.is_premium,
      is_profile_complete = EXCLUDED.is_profile_complete,
      profile_completion_percent = EXCLUDED.profile_completion_percent,
      last_active_at = EXCLUDED.last_active_at,
      star = EXCLUDED.star,
      raasi = EXCLUDED.raasi,
      lagnam = EXCLUDED.lagnam,
      gothram = EXCLUDED.gothram,
      tier = EXCLUDED.tier,
      contacts_remaining = EXCLUDED.contacts_remaining,
      interests_remaining = EXCLUDED.interests_remaining,
      food_habit = EXCLUDED.food_habit,
      smoking = EXCLUDED.smoking,
      drinking = EXCLUDED.drinking;
INSERT INTO public.profiles (
      id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at, star, raasi, lagnam, gothram, tier, contacts_remaining, interests_remaining, food_habit, smoking, drinking
    ) VALUES (
      '00000000-0000-4000-a000-000000000092', 'TM000146', 'Kokila Kumar', 'female', '2001-04-24', 157, 'never_married', 'Hindu', 'Vishwakarma', 'Vishwakarma subcaste', 'no', 'B.E. / B.Tech', 'B.E. / B.Tech Graduate', 'Auditor', 'Auditor Details', '₹5 Lakhs - ₹7 Lakhs', 'Private Practice', 'Tiruchirappalli', 'Trichy', 'Hi, I am Kokila. I have completed my B.E. / B.Tech and am currently working as a Auditor at Private Practice in Tiruchirappalli. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'upper_middle_class', true, false, true, 100, NOW() - INTERVAL '5 days', 'Punarvasu', 'Kumbam', 'Kumbam', 'Agastya', 'free', 5, 5, 'vegetarian', 'no', 'no'
    ) ON CONFLICT (id) DO UPDATE SET
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
      is_verified = EXCLUDED.is_verified,
      is_premium = EXCLUDED.is_premium,
      is_profile_complete = EXCLUDED.is_profile_complete,
      profile_completion_percent = EXCLUDED.profile_completion_percent,
      last_active_at = EXCLUDED.last_active_at,
      star = EXCLUDED.star,
      raasi = EXCLUDED.raasi,
      lagnam = EXCLUDED.lagnam,
      gothram = EXCLUDED.gothram,
      tier = EXCLUDED.tier,
      contacts_remaining = EXCLUDED.contacts_remaining,
      interests_remaining = EXCLUDED.interests_remaining,
      food_habit = EXCLUDED.food_habit,
      smoking = EXCLUDED.smoking,
      drinking = EXCLUDED.drinking;
INSERT INTO public.profiles (
      id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at, star, raasi, lagnam, gothram, tier, contacts_remaining, interests_remaining, food_habit, smoking, drinking
    ) VALUES (
      '00000000-0000-4000-a000-000000000093', 'TM000147', 'Bala Lingam', 'male', '2002-04-20', 177, 'never_married', 'Hindu', 'Pillai', 'Pillai subcaste', 'no', 'B.E. / B.Tech', 'B.E. / B.Tech Graduate', 'Pharmacist', 'Pharmacist Details', '₹15 Lakhs - ₹20 Lakhs', 'Cognizant', 'Thoothukudi', 'Tuticorin', 'Hi, I am Bala. I have completed my B.E. / B.Tech and am currently working as a Pharmacist at Cognizant in Thoothukudi. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'middle_class', true, false, true, 100, NOW() - INTERVAL '1 days', 'Mirgashira', 'Mesham', 'Dhanusu', 'Bharadwaj', 'free', 5, 5, 'vegetarian', 'no', 'no'
    ) ON CONFLICT (id) DO UPDATE SET
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
      is_verified = EXCLUDED.is_verified,
      is_premium = EXCLUDED.is_premium,
      is_profile_complete = EXCLUDED.is_profile_complete,
      profile_completion_percent = EXCLUDED.profile_completion_percent,
      last_active_at = EXCLUDED.last_active_at,
      star = EXCLUDED.star,
      raasi = EXCLUDED.raasi,
      lagnam = EXCLUDED.lagnam,
      gothram = EXCLUDED.gothram,
      tier = EXCLUDED.tier,
      contacts_remaining = EXCLUDED.contacts_remaining,
      interests_remaining = EXCLUDED.interests_remaining,
      food_habit = EXCLUDED.food_habit,
      smoking = EXCLUDED.smoking,
      drinking = EXCLUDED.drinking;
INSERT INTO public.profiles (
      id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at, star, raasi, lagnam, gothram, tier, contacts_remaining, interests_remaining, food_habit, smoking, drinking
    ) VALUES (
      '00000000-0000-4000-a000-000000000094', 'TM000148', 'Keerthana Devan', 'female', '2005-12-10', 162, 'never_married', 'Hindu', 'Kallar', NULL, 'no', 'M.B.A', 'M.B.A Graduate', 'Mechanical Engineer', 'Mechanical Engineer Details', '₹3 Lakhs - ₹5 Lakhs', 'Infosys', 'Tirunelveli', 'Tirunelveli', 'Hi, I am Keerthana. I have completed my M.B.A and am currently working as a Mechanical Engineer at Infosys in Tirunelveli. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'rich', true, false, true, 100, NOW() - INTERVAL '0 days', 'Revati', 'Rishabam', 'Viruchigam', 'Harita', 'free', 5, 5, 'vegetarian', 'no', 'no'
    ) ON CONFLICT (id) DO UPDATE SET
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
      is_verified = EXCLUDED.is_verified,
      is_premium = EXCLUDED.is_premium,
      is_profile_complete = EXCLUDED.is_profile_complete,
      profile_completion_percent = EXCLUDED.profile_completion_percent,
      last_active_at = EXCLUDED.last_active_at,
      star = EXCLUDED.star,
      raasi = EXCLUDED.raasi,
      lagnam = EXCLUDED.lagnam,
      gothram = EXCLUDED.gothram,
      tier = EXCLUDED.tier,
      contacts_remaining = EXCLUDED.contacts_remaining,
      interests_remaining = EXCLUDED.interests_remaining,
      food_habit = EXCLUDED.food_habit,
      smoking = EXCLUDED.smoking,
      drinking = EXCLUDED.drinking;
INSERT INTO public.profiles (
      id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at, star, raasi, lagnam, gothram, tier, contacts_remaining, interests_remaining, food_habit, smoking, drinking
    ) VALUES (
      '00000000-0000-4000-a000-000000000095', 'TM000149', 'Suresh Raman', 'male', '1994-12-16', 179, 'never_married', 'Christian', 'RC Christian', 'RC Christian subcaste', 'no', 'M.A', 'M.A Graduate', 'Bank Manager', 'Bank Manager Details', '₹15 Lakhs - ₹20 Lakhs', 'Infosys', 'Coimbatore', 'Coimbatore', 'Hi, I am Suresh. I have completed my M.A and am currently working as a Bank Manager at Infosys in Coimbatore. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'upper_middle_class', true, true, true, 100, NOW() - INTERVAL '9 days', 'Arudra', 'Meenam', 'Viruchigam', 'Agastya', 'gold', 50, 100, 'vegetarian', 'no', 'no'
    ) ON CONFLICT (id) DO UPDATE SET
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
      is_verified = EXCLUDED.is_verified,
      is_premium = EXCLUDED.is_premium,
      is_profile_complete = EXCLUDED.is_profile_complete,
      profile_completion_percent = EXCLUDED.profile_completion_percent,
      last_active_at = EXCLUDED.last_active_at,
      star = EXCLUDED.star,
      raasi = EXCLUDED.raasi,
      lagnam = EXCLUDED.lagnam,
      gothram = EXCLUDED.gothram,
      tier = EXCLUDED.tier,
      contacts_remaining = EXCLUDED.contacts_remaining,
      interests_remaining = EXCLUDED.interests_remaining,
      food_habit = EXCLUDED.food_habit,
      smoking = EXCLUDED.smoking,
      drinking = EXCLUDED.drinking;
INSERT INTO public.profiles (
      id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at, star, raasi, lagnam, gothram, tier, contacts_remaining, interests_remaining, food_habit, smoking, drinking
    ) VALUES (
      '00000000-0000-4000-a000-000000000096', 'TM000150', 'Divya Sundaram', 'female', '2003-07-04', 164, 'never_married', 'Hindu', 'Sengunthar', 'Sengunthar subcaste', 'no', 'M.Com', 'M.Com Graduate', 'Mechanical Engineer', 'Mechanical Engineer Details', '₹20 Lakhs+', 'TCS', 'Madurai', 'Madurai', 'Hi, I am Divya. I have completed my M.Com and am currently working as a Mechanical Engineer at TCS in Madurai. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'middle_class', false, false, true, 100, NOW() - INTERVAL '5 days', 'Swati', 'Thulaam', 'Kanni', 'Atri', 'free', 5, 5, 'vegetarian', 'no', 'no'
    ) ON CONFLICT (id) DO UPDATE SET
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
      is_verified = EXCLUDED.is_verified,
      is_premium = EXCLUDED.is_premium,
      is_profile_complete = EXCLUDED.is_profile_complete,
      profile_completion_percent = EXCLUDED.profile_completion_percent,
      last_active_at = EXCLUDED.last_active_at,
      star = EXCLUDED.star,
      raasi = EXCLUDED.raasi,
      lagnam = EXCLUDED.lagnam,
      gothram = EXCLUDED.gothram,
      tier = EXCLUDED.tier,
      contacts_remaining = EXCLUDED.contacts_remaining,
      interests_remaining = EXCLUDED.interests_remaining,
      food_habit = EXCLUDED.food_habit,
      smoking = EXCLUDED.smoking,
      drinking = EXCLUDED.drinking;
INSERT INTO public.profiles (
      id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at, star, raasi, lagnam, gothram, tier, contacts_remaining, interests_remaining, food_habit, smoking, drinking
    ) VALUES (
      '00000000-0000-4000-a000-000000000097', 'TM000151', 'Murugan Samy', 'male', '2005-12-26', 170, 'never_married', 'Hindu', 'Brahmin - Iyer', 'Brahmin - Iyer subcaste', 'yes', 'M.B.B.S', 'M.B.B.S Graduate', 'Architect', 'Architect Details', '₹15 Lakhs - ₹20 Lakhs', 'Accenture', 'Kanchipuram', 'Kanchipuram', 'Hi, I am Murugan. I have completed my M.B.B.S and am currently working as a Architect at Accenture in Kanchipuram. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'rich', true, true, true, 100, NOW() - INTERVAL '8 days', 'Shravana', 'Mesham', 'Mithunam', 'Angirasa', 'gold', 50, 100, 'vegetarian', 'no', 'no'
    ) ON CONFLICT (id) DO UPDATE SET
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
      is_verified = EXCLUDED.is_verified,
      is_premium = EXCLUDED.is_premium,
      is_profile_complete = EXCLUDED.is_profile_complete,
      profile_completion_percent = EXCLUDED.profile_completion_percent,
      last_active_at = EXCLUDED.last_active_at,
      star = EXCLUDED.star,
      raasi = EXCLUDED.raasi,
      lagnam = EXCLUDED.lagnam,
      gothram = EXCLUDED.gothram,
      tier = EXCLUDED.tier,
      contacts_remaining = EXCLUDED.contacts_remaining,
      interests_remaining = EXCLUDED.interests_remaining,
      food_habit = EXCLUDED.food_habit,
      smoking = EXCLUDED.smoking,
      drinking = EXCLUDED.drinking;
INSERT INTO public.profiles (
      id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at, star, raasi, lagnam, gothram, tier, contacts_remaining, interests_remaining, food_habit, smoking, drinking
    ) VALUES (
      '00000000-0000-4000-a000-000000000098', 'TM000152', 'Yazhini Moorthy', 'female', '2005-12-27', 167, 'never_married', 'Hindu', 'Naidu', NULL, 'no', 'B.Com', 'B.Com Graduate', 'HR Specialist', 'HR Specialist Details', '₹20 Lakhs+', 'Zoho', 'Thanjavur', 'Thanjavur', 'Hi, I am Yazhini. I have completed my B.Com and am currently working as a HR Specialist at Zoho in Thanjavur. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'rich', true, false, true, 100, NOW() - INTERVAL '9 days', 'Revati', 'Kadagam', 'Thulaam', 'Murugan', 'free', 5, 5, 'vegetarian', 'no', 'no'
    ) ON CONFLICT (id) DO UPDATE SET
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
      is_verified = EXCLUDED.is_verified,
      is_premium = EXCLUDED.is_premium,
      is_profile_complete = EXCLUDED.is_profile_complete,
      profile_completion_percent = EXCLUDED.profile_completion_percent,
      last_active_at = EXCLUDED.last_active_at,
      star = EXCLUDED.star,
      raasi = EXCLUDED.raasi,
      lagnam = EXCLUDED.lagnam,
      gothram = EXCLUDED.gothram,
      tier = EXCLUDED.tier,
      contacts_remaining = EXCLUDED.contacts_remaining,
      interests_remaining = EXCLUDED.interests_remaining,
      food_habit = EXCLUDED.food_habit,
      smoking = EXCLUDED.smoking,
      drinking = EXCLUDED.drinking;
INSERT INTO public.profiles (
      id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at, star, raasi, lagnam, gothram, tier, contacts_remaining, interests_remaining, food_habit, smoking, drinking
    ) VALUES (
      '00000000-0000-4000-a000-000000000099', 'TM000153', 'Prakash Moorthy', 'male', '2001-05-06', 178, 'never_married', 'Hindu', 'Vanniyar', NULL, 'yes', 'B.Sc', 'B.Sc Graduate', 'Pharmacist', 'Pharmacist Details', '₹20 Lakhs+', 'Wipro', 'Chennai', 'Chennai', 'Hi, I am Prakash. I have completed my B.Sc and am currently working as a Pharmacist at Wipro in Chennai. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'rich', false, false, true, 100, NOW() - INTERVAL '6 days', 'Shravana', 'Magaram', 'Rishabam', 'Angirasa', 'free', 5, 5, 'vegetarian', 'no', 'no'
    ) ON CONFLICT (id) DO UPDATE SET
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
      is_verified = EXCLUDED.is_verified,
      is_premium = EXCLUDED.is_premium,
      is_profile_complete = EXCLUDED.is_profile_complete,
      profile_completion_percent = EXCLUDED.profile_completion_percent,
      last_active_at = EXCLUDED.last_active_at,
      star = EXCLUDED.star,
      raasi = EXCLUDED.raasi,
      lagnam = EXCLUDED.lagnam,
      gothram = EXCLUDED.gothram,
      tier = EXCLUDED.tier,
      contacts_remaining = EXCLUDED.contacts_remaining,
      interests_remaining = EXCLUDED.interests_remaining,
      food_habit = EXCLUDED.food_habit,
      smoking = EXCLUDED.smoking,
      drinking = EXCLUDED.drinking;
INSERT INTO public.profiles (
      id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at, star, raasi, lagnam, gothram, tier, contacts_remaining, interests_remaining, food_habit, smoking, drinking
    ) VALUES (
      '00000000-0000-4000-a000-00000000009a', 'TM000154', 'Nivedha Sundaram', 'female', '1995-06-11', 175, 'never_married', 'Hindu', 'Vishwakarma', 'Vishwakarma subcaste', 'no', 'M.Sc', 'M.Sc Graduate', 'HR Specialist', 'HR Specialist Details', '₹3 Lakhs - ₹5 Lakhs', 'Zoho', 'Thoothukudi', 'Tuticorin', 'Hi, I am Nivedha. I have completed my M.Sc and am currently working as a HR Specialist at Zoho in Thoothukudi. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'joint', 'middle_class', true, false, true, 100, NOW() - INTERVAL '9 days', 'Revati', 'Dhanusu', 'Magaram', 'Bharadwaj', 'free', 5, 5, 'vegetarian', 'no', 'no'
    ) ON CONFLICT (id) DO UPDATE SET
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
      is_verified = EXCLUDED.is_verified,
      is_premium = EXCLUDED.is_premium,
      is_profile_complete = EXCLUDED.is_profile_complete,
      profile_completion_percent = EXCLUDED.profile_completion_percent,
      last_active_at = EXCLUDED.last_active_at,
      star = EXCLUDED.star,
      raasi = EXCLUDED.raasi,
      lagnam = EXCLUDED.lagnam,
      gothram = EXCLUDED.gothram,
      tier = EXCLUDED.tier,
      contacts_remaining = EXCLUDED.contacts_remaining,
      interests_remaining = EXCLUDED.interests_remaining,
      food_habit = EXCLUDED.food_habit,
      smoking = EXCLUDED.smoking,
      drinking = EXCLUDED.drinking;
INSERT INTO public.profiles (
      id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at, star, raasi, lagnam, gothram, tier, contacts_remaining, interests_remaining, food_habit, smoking, drinking
    ) VALUES (
      '00000000-0000-4000-a000-00000000009b', 'TM000155', 'Sakthi Gopal', 'male', '1988-01-08', 166, 'never_married', 'Hindu', 'Kallar', 'Kallar subcaste', 'yes', 'B.Sc', 'B.Sc Graduate', 'Advocate', 'Advocate Details', '₹15 Lakhs - ₹20 Lakhs', 'Government Service', 'Thanjavur', 'Thanjavur', 'Hi, I am Sakthi. I have completed my B.Sc and am currently working as a Advocate at Government Service in Thanjavur. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'upper_middle_class', true, true, true, 100, NOW() - INTERVAL '0 days', 'Moola', 'Kumbam', 'Magaram', 'Angirasa', 'gold', 50, 100, 'vegetarian', 'no', 'no'
    ) ON CONFLICT (id) DO UPDATE SET
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
      is_verified = EXCLUDED.is_verified,
      is_premium = EXCLUDED.is_premium,
      is_profile_complete = EXCLUDED.is_profile_complete,
      profile_completion_percent = EXCLUDED.profile_completion_percent,
      last_active_at = EXCLUDED.last_active_at,
      star = EXCLUDED.star,
      raasi = EXCLUDED.raasi,
      lagnam = EXCLUDED.lagnam,
      gothram = EXCLUDED.gothram,
      tier = EXCLUDED.tier,
      contacts_remaining = EXCLUDED.contacts_remaining,
      interests_remaining = EXCLUDED.interests_remaining,
      food_habit = EXCLUDED.food_habit,
      smoking = EXCLUDED.smoking,
      drinking = EXCLUDED.drinking;
INSERT INTO public.profiles (
      id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at, star, raasi, lagnam, gothram, tier, contacts_remaining, interests_remaining, food_habit, smoking, drinking
    ) VALUES (
      '00000000-0000-4000-a000-00000000009c', 'TM000156', 'Kayalvizhi Shankar', 'female', '1989-01-14', 175, 'never_married', 'Hindu', 'Gounder', NULL, 'no', 'B.A', 'B.A Graduate', 'Dentist', 'Dentist Details', '₹7 Lakhs - ₹10 Lakhs', 'Wipro', 'Salem', 'Salem', 'Hi, I am Kayalvizhi. I have completed my B.A and am currently working as a Dentist at Wipro in Salem. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'middle_class', true, true, true, 100, NOW() - INTERVAL '2 days', 'Swati', 'Magaram', 'Dhanusu', 'Siva', 'gold', 50, 100, 'vegetarian', 'no', 'no'
    ) ON CONFLICT (id) DO UPDATE SET
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
      is_verified = EXCLUDED.is_verified,
      is_premium = EXCLUDED.is_premium,
      is_profile_complete = EXCLUDED.is_profile_complete,
      profile_completion_percent = EXCLUDED.profile_completion_percent,
      last_active_at = EXCLUDED.last_active_at,
      star = EXCLUDED.star,
      raasi = EXCLUDED.raasi,
      lagnam = EXCLUDED.lagnam,
      gothram = EXCLUDED.gothram,
      tier = EXCLUDED.tier,
      contacts_remaining = EXCLUDED.contacts_remaining,
      interests_remaining = EXCLUDED.interests_remaining,
      food_habit = EXCLUDED.food_habit,
      smoking = EXCLUDED.smoking,
      drinking = EXCLUDED.drinking;
INSERT INTO public.profiles (
      id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at, star, raasi, lagnam, gothram, tier, contacts_remaining, interests_remaining, food_habit, smoking, drinking
    ) VALUES (
      '00000000-0000-4000-a000-00000000009d', 'TM000157', 'Bala Sundaram', 'male', '2004-06-02', 184, 'divorced', 'Muslim', 'Rawther', 'Rawther subcaste', 'no', 'M.B.A', 'M.B.A Graduate', 'Advocate', 'Advocate Details', '₹5 Lakhs - ₹7 Lakhs', 'Government Service', 'Madurai', 'Madurai', 'Hi, I am Bala. I have completed my M.B.A and am currently working as a Advocate at Government Service in Madurai. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'upper_middle_class', false, false, true, 100, NOW() - INTERVAL '9 days', 'Aslesha', 'Meenam', 'Viruchigam', 'Viswamitra', 'free', 5, 5, 'vegetarian', 'no', 'no'
    ) ON CONFLICT (id) DO UPDATE SET
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
      is_verified = EXCLUDED.is_verified,
      is_premium = EXCLUDED.is_premium,
      is_profile_complete = EXCLUDED.is_profile_complete,
      profile_completion_percent = EXCLUDED.profile_completion_percent,
      last_active_at = EXCLUDED.last_active_at,
      star = EXCLUDED.star,
      raasi = EXCLUDED.raasi,
      lagnam = EXCLUDED.lagnam,
      gothram = EXCLUDED.gothram,
      tier = EXCLUDED.tier,
      contacts_remaining = EXCLUDED.contacts_remaining,
      interests_remaining = EXCLUDED.interests_remaining,
      food_habit = EXCLUDED.food_habit,
      smoking = EXCLUDED.smoking,
      drinking = EXCLUDED.drinking;
INSERT INTO public.profiles (
      id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at, star, raasi, lagnam, gothram, tier, contacts_remaining, interests_remaining, food_habit, smoking, drinking
    ) VALUES (
      '00000000-0000-4000-a000-00000000009e', 'TM000158', 'Priya Sundaram', 'female', '2005-09-13', 153, 'divorced', 'Christian', 'Pentecostal', NULL, 'no', 'M.C.A', 'M.C.A Graduate', 'Business Owner', 'Business Owner Details', '₹15 Lakhs - ₹20 Lakhs', 'Zoho', 'Thoothukudi', 'Tuticorin', 'Hi, I am Priya. I have completed my M.C.A and am currently working as a Business Owner at Zoho in Thoothukudi. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'upper_middle_class', true, false, true, 100, NOW() - INTERVAL '4 days', 'Shravana', 'Dhanusu', 'Viruchigam', 'Vishnu', 'free', 5, 5, 'vegetarian', 'no', 'no'
    ) ON CONFLICT (id) DO UPDATE SET
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
      is_verified = EXCLUDED.is_verified,
      is_premium = EXCLUDED.is_premium,
      is_profile_complete = EXCLUDED.is_profile_complete,
      profile_completion_percent = EXCLUDED.profile_completion_percent,
      last_active_at = EXCLUDED.last_active_at,
      star = EXCLUDED.star,
      raasi = EXCLUDED.raasi,
      lagnam = EXCLUDED.lagnam,
      gothram = EXCLUDED.gothram,
      tier = EXCLUDED.tier,
      contacts_remaining = EXCLUDED.contacts_remaining,
      interests_remaining = EXCLUDED.interests_remaining,
      food_habit = EXCLUDED.food_habit,
      smoking = EXCLUDED.smoking,
      drinking = EXCLUDED.drinking;
INSERT INTO public.profiles (
      id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at, star, raasi, lagnam, gothram, tier, contacts_remaining, interests_remaining, food_habit, smoking, drinking
    ) VALUES (
      '00000000-0000-4000-a000-00000000009f', 'TM000159', 'Siddharth Pandian', 'male', '1992-05-17', 166, 'never_married', 'Muslim', 'Sunni Muslim', NULL, 'no', 'M.B.B.S', 'M.B.B.S Graduate', 'Dentist', 'Dentist Details', '₹15 Lakhs - ₹20 Lakhs', 'Zoho', 'Thanjavur', 'Thanjavur', 'Hi, I am Siddharth. I have completed my M.B.B.S and am currently working as a Dentist at Zoho in Thanjavur. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'upper_middle_class', true, false, true, 100, NOW() - INTERVAL '4 days', 'Pushya', 'Dhanusu', 'Dhanusu', 'Agastya', 'free', 5, 5, 'vegetarian', 'no', 'no'
    ) ON CONFLICT (id) DO UPDATE SET
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
      is_verified = EXCLUDED.is_verified,
      is_premium = EXCLUDED.is_premium,
      is_profile_complete = EXCLUDED.is_profile_complete,
      profile_completion_percent = EXCLUDED.profile_completion_percent,
      last_active_at = EXCLUDED.last_active_at,
      star = EXCLUDED.star,
      raasi = EXCLUDED.raasi,
      lagnam = EXCLUDED.lagnam,
      gothram = EXCLUDED.gothram,
      tier = EXCLUDED.tier,
      contacts_remaining = EXCLUDED.contacts_remaining,
      interests_remaining = EXCLUDED.interests_remaining,
      food_habit = EXCLUDED.food_habit,
      smoking = EXCLUDED.smoking,
      drinking = EXCLUDED.drinking;
INSERT INTO public.profiles (
      id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at, star, raasi, lagnam, gothram, tier, contacts_remaining, interests_remaining, food_habit, smoking, drinking
    ) VALUES (
      '00000000-0000-4000-a000-0000000000a0', 'TM000160', 'Vijaya Raman', 'female', '1991-11-26', 166, 'never_married', 'Hindu', 'Naicker', 'Naicker subcaste', 'no', 'M.Sc', 'M.Sc Graduate', 'Pharmacist', 'Pharmacist Details', '₹15 Lakhs - ₹20 Lakhs', 'Cognizant', 'Thanjavur', 'Thanjavur', 'Hi, I am Vijaya. I have completed my M.Sc and am currently working as a Pharmacist at Cognizant in Thanjavur. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'middle_class', true, false, true, 100, NOW() - INTERVAL '8 days', 'Vishakha', 'Viruchigam', 'Viruchigam', 'Gautama', 'free', 5, 5, 'vegetarian', 'no', 'no'
    ) ON CONFLICT (id) DO UPDATE SET
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
      is_verified = EXCLUDED.is_verified,
      is_premium = EXCLUDED.is_premium,
      is_profile_complete = EXCLUDED.is_profile_complete,
      profile_completion_percent = EXCLUDED.profile_completion_percent,
      last_active_at = EXCLUDED.last_active_at,
      star = EXCLUDED.star,
      raasi = EXCLUDED.raasi,
      lagnam = EXCLUDED.lagnam,
      gothram = EXCLUDED.gothram,
      tier = EXCLUDED.tier,
      contacts_remaining = EXCLUDED.contacts_remaining,
      interests_remaining = EXCLUDED.interests_remaining,
      food_habit = EXCLUDED.food_habit,
      smoking = EXCLUDED.smoking,
      drinking = EXCLUDED.drinking;
INSERT INTO public.profiles (
      id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at, star, raasi, lagnam, gothram, tier, contacts_remaining, interests_remaining, food_habit, smoking, drinking
    ) VALUES (
      '00000000-0000-4000-a000-0000000000a1', 'TM000161', 'Dinesh Mani', 'male', '2004-08-10', 186, 'never_married', 'Muslim', 'Shia Muslim', NULL, 'no', 'B.E. / B.Tech', 'B.E. / B.Tech Graduate', 'Business Owner', 'Business Owner Details', '₹7 Lakhs - ₹10 Lakhs', 'TCS', 'Kanchipuram', 'Kanchipuram', 'Hi, I am Dinesh. I have completed my B.E. / B.Tech and am currently working as a Business Owner at TCS in Kanchipuram. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'upper_middle_class', true, false, true, 100, NOW() - INTERVAL '1 days', 'Ashwini', 'Rishabam', 'Meenam', 'Gautama', 'free', 5, 5, 'vegetarian', 'no', 'no'
    ) ON CONFLICT (id) DO UPDATE SET
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
      is_verified = EXCLUDED.is_verified,
      is_premium = EXCLUDED.is_premium,
      is_profile_complete = EXCLUDED.is_profile_complete,
      profile_completion_percent = EXCLUDED.profile_completion_percent,
      last_active_at = EXCLUDED.last_active_at,
      star = EXCLUDED.star,
      raasi = EXCLUDED.raasi,
      lagnam = EXCLUDED.lagnam,
      gothram = EXCLUDED.gothram,
      tier = EXCLUDED.tier,
      contacts_remaining = EXCLUDED.contacts_remaining,
      interests_remaining = EXCLUDED.interests_remaining,
      food_habit = EXCLUDED.food_habit,
      smoking = EXCLUDED.smoking,
      drinking = EXCLUDED.drinking;
INSERT INTO public.profiles (
      id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at, star, raasi, lagnam, gothram, tier, contacts_remaining, interests_remaining, food_habit, smoking, drinking
    ) VALUES (
      '00000000-0000-4000-a000-0000000000a2', 'TM000162', 'Vidya Balan', 'female', '1990-09-20', 171, 'never_married', 'Hindu', 'Brahmin - Iyer', 'Brahmin - Iyer subcaste', 'no', 'M.A', 'M.A Graduate', 'Advocate', 'Advocate Details', '₹20 Lakhs+', 'Wipro', 'Kanchipuram', 'Kanchipuram', 'Hi, I am Vidya. I have completed my M.A and am currently working as a Advocate at Wipro in Kanchipuram. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'middle_class', true, false, true, 100, NOW() - INTERVAL '4 days', 'Rohini', 'Kumbam', 'Kumbam', 'Siva', 'free', 5, 5, 'vegetarian', 'no', 'no'
    ) ON CONFLICT (id) DO UPDATE SET
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
      is_verified = EXCLUDED.is_verified,
      is_premium = EXCLUDED.is_premium,
      is_profile_complete = EXCLUDED.is_profile_complete,
      profile_completion_percent = EXCLUDED.profile_completion_percent,
      last_active_at = EXCLUDED.last_active_at,
      star = EXCLUDED.star,
      raasi = EXCLUDED.raasi,
      lagnam = EXCLUDED.lagnam,
      gothram = EXCLUDED.gothram,
      tier = EXCLUDED.tier,
      contacts_remaining = EXCLUDED.contacts_remaining,
      interests_remaining = EXCLUDED.interests_remaining,
      food_habit = EXCLUDED.food_habit,
      smoking = EXCLUDED.smoking,
      drinking = EXCLUDED.drinking;
INSERT INTO public.profiles (
      id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at, star, raasi, lagnam, gothram, tier, contacts_remaining, interests_remaining, food_habit, smoking, drinking
    ) VALUES (
      '00000000-0000-4000-a000-0000000000a3', 'TM000163', 'Vinoth Velan', 'male', '1994-11-03', 188, 'never_married', 'Hindu', 'Gounder', 'Gounder subcaste', 'no', 'B.Ed', 'B.Ed Graduate', 'Pharmacist', 'Pharmacist Details', '₹5 Lakhs - ₹7 Lakhs', 'TCS', 'Thanjavur', 'Thanjavur', 'Hi, I am Vinoth. I have completed my B.Ed and am currently working as a Pharmacist at TCS in Thanjavur. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'middle_class', false, false, true, 100, NOW() - INTERVAL '2 days', 'Swati', 'Viruchigam', 'Kumbam', 'Kasyapa', 'free', 5, 5, 'vegetarian', 'no', 'no'
    ) ON CONFLICT (id) DO UPDATE SET
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
      is_verified = EXCLUDED.is_verified,
      is_premium = EXCLUDED.is_premium,
      is_profile_complete = EXCLUDED.is_profile_complete,
      profile_completion_percent = EXCLUDED.profile_completion_percent,
      last_active_at = EXCLUDED.last_active_at,
      star = EXCLUDED.star,
      raasi = EXCLUDED.raasi,
      lagnam = EXCLUDED.lagnam,
      gothram = EXCLUDED.gothram,
      tier = EXCLUDED.tier,
      contacts_remaining = EXCLUDED.contacts_remaining,
      interests_remaining = EXCLUDED.interests_remaining,
      food_habit = EXCLUDED.food_habit,
      smoking = EXCLUDED.smoking,
      drinking = EXCLUDED.drinking;
INSERT INTO public.profiles (
      id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at, star, raasi, lagnam, gothram, tier, contacts_remaining, interests_remaining, food_habit, smoking, drinking
    ) VALUES (
      '00000000-0000-4000-a000-0000000000a4', 'TM000164', 'Soundarya Swamy', 'female', '1996-05-10', 170, 'never_married', 'Hindu', 'Vishwakarma', 'Vishwakarma subcaste', 'no', 'B.Ed', 'B.Ed Graduate', 'Civil Engineer', 'Civil Engineer Details', '₹10 Lakhs - ₹15 Lakhs', 'Government Service', 'Erode', 'Erode', 'Hi, I am Soundarya. I have completed my B.Ed and am currently working as a Civil Engineer at Government Service in Erode. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'joint', 'middle_class', true, false, true, 100, NOW() - INTERVAL '10 days', 'Dhanishta', 'Mithunam', 'Kumbam', 'Gautama', 'free', 5, 5, 'vegetarian', 'no', 'no'
    ) ON CONFLICT (id) DO UPDATE SET
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
      is_verified = EXCLUDED.is_verified,
      is_premium = EXCLUDED.is_premium,
      is_profile_complete = EXCLUDED.is_profile_complete,
      profile_completion_percent = EXCLUDED.profile_completion_percent,
      last_active_at = EXCLUDED.last_active_at,
      star = EXCLUDED.star,
      raasi = EXCLUDED.raasi,
      lagnam = EXCLUDED.lagnam,
      gothram = EXCLUDED.gothram,
      tier = EXCLUDED.tier,
      contacts_remaining = EXCLUDED.contacts_remaining,
      interests_remaining = EXCLUDED.interests_remaining,
      food_habit = EXCLUDED.food_habit,
      smoking = EXCLUDED.smoking,
      drinking = EXCLUDED.drinking;
INSERT INTO public.profiles (
      id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at, star, raasi, lagnam, gothram, tier, contacts_remaining, interests_remaining, food_habit, smoking, drinking
    ) VALUES (
      '00000000-0000-4000-a000-0000000000a5', 'TM000165', 'Elango Lingam', 'male', '1997-01-17', 177, 'never_married', 'Christian', 'RC Christian', NULL, 'yes', 'M.Com', 'M.Com Graduate', 'School Teacher', 'School Teacher Details', '₹7 Lakhs - ₹10 Lakhs', 'HCL', 'Tiruppur', 'Tiruppur', 'Hi, I am Elango. I have completed my M.Com and am currently working as a School Teacher at HCL in Tiruppur. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'upper_middle_class', true, false, true, 100, NOW() - INTERVAL '0 days', 'Bharani', 'Kumbam', 'Thulaam', 'Kasyapa', 'free', 5, 5, 'vegetarian', 'no', 'no'
    ) ON CONFLICT (id) DO UPDATE SET
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
      is_verified = EXCLUDED.is_verified,
      is_premium = EXCLUDED.is_premium,
      is_profile_complete = EXCLUDED.is_profile_complete,
      profile_completion_percent = EXCLUDED.profile_completion_percent,
      last_active_at = EXCLUDED.last_active_at,
      star = EXCLUDED.star,
      raasi = EXCLUDED.raasi,
      lagnam = EXCLUDED.lagnam,
      gothram = EXCLUDED.gothram,
      tier = EXCLUDED.tier,
      contacts_remaining = EXCLUDED.contacts_remaining,
      interests_remaining = EXCLUDED.interests_remaining,
      food_habit = EXCLUDED.food_habit,
      smoking = EXCLUDED.smoking,
      drinking = EXCLUDED.drinking;
INSERT INTO public.profiles (
      id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at, star, raasi, lagnam, gothram, tier, contacts_remaining, interests_remaining, food_habit, smoking, drinking
    ) VALUES (
      '00000000-0000-4000-a000-0000000000a6', 'TM000166', 'Gayathri Naicker', 'female', '2005-12-19', 166, 'never_married', 'Hindu', 'Kallar', NULL, 'yes', 'B.A', 'B.A Graduate', 'Government Officer', 'Government Officer Details', '₹20 Lakhs+', 'Cognizant', 'Tirunelveli', 'Tirunelveli', 'Hi, I am Gayathri. I have completed my B.A and am currently working as a Government Officer at Cognizant in Tirunelveli. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'middle_class', true, false, true, 100, NOW() - INTERVAL '4 days', 'Hasta', 'Kadagam', 'Thulaam', 'Murugan', 'free', 5, 5, 'vegetarian', 'no', 'no'
    ) ON CONFLICT (id) DO UPDATE SET
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
      is_verified = EXCLUDED.is_verified,
      is_premium = EXCLUDED.is_premium,
      is_profile_complete = EXCLUDED.is_profile_complete,
      profile_completion_percent = EXCLUDED.profile_completion_percent,
      last_active_at = EXCLUDED.last_active_at,
      star = EXCLUDED.star,
      raasi = EXCLUDED.raasi,
      lagnam = EXCLUDED.lagnam,
      gothram = EXCLUDED.gothram,
      tier = EXCLUDED.tier,
      contacts_remaining = EXCLUDED.contacts_remaining,
      interests_remaining = EXCLUDED.interests_remaining,
      food_habit = EXCLUDED.food_habit,
      smoking = EXCLUDED.smoking,
      drinking = EXCLUDED.drinking;
INSERT INTO public.profiles (
      id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at, star, raasi, lagnam, gothram, tier, contacts_remaining, interests_remaining, food_habit, smoking, drinking
    ) VALUES (
      '00000000-0000-4000-a000-0000000000a7', 'TM000167', 'Bala Shankar', 'male', '1990-12-06', 170, 'never_married', 'Hindu', 'Mudaliar', 'Mudaliar subcaste', 'no', 'B.Sc', 'B.Sc Graduate', 'Advocate', 'Advocate Details', '₹20 Lakhs+', 'Wipro', 'Erode', 'Erode', 'Hi, I am Bala. I have completed my B.Sc and am currently working as a Advocate at Wipro in Erode. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'middle_class', true, false, true, 100, NOW() - INTERVAL '1 days', 'Ashwini', 'Meenam', 'Kanni', 'Atri', 'free', 5, 5, 'vegetarian', 'no', 'no'
    ) ON CONFLICT (id) DO UPDATE SET
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
      is_verified = EXCLUDED.is_verified,
      is_premium = EXCLUDED.is_premium,
      is_profile_complete = EXCLUDED.is_profile_complete,
      profile_completion_percent = EXCLUDED.profile_completion_percent,
      last_active_at = EXCLUDED.last_active_at,
      star = EXCLUDED.star,
      raasi = EXCLUDED.raasi,
      lagnam = EXCLUDED.lagnam,
      gothram = EXCLUDED.gothram,
      tier = EXCLUDED.tier,
      contacts_remaining = EXCLUDED.contacts_remaining,
      interests_remaining = EXCLUDED.interests_remaining,
      food_habit = EXCLUDED.food_habit,
      smoking = EXCLUDED.smoking,
      drinking = EXCLUDED.drinking;
INSERT INTO public.profiles (
      id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at, star, raasi, lagnam, gothram, tier, contacts_remaining, interests_remaining, food_habit, smoking, drinking
    ) VALUES (
      '00000000-0000-4000-a000-0000000000a8', 'TM000168', 'Malathi Balan', 'female', '1993-12-22', 170, 'never_married', 'Hindu', 'Kallar', 'Kallar subcaste', 'no', 'M.C.A', 'M.C.A Graduate', 'Government Officer', 'Government Officer Details', '₹10 Lakhs - ₹15 Lakhs', 'Cognizant', 'Tirunelveli', 'Tirunelveli', 'Hi, I am Malathi. I have completed my M.C.A and am currently working as a Government Officer at Cognizant in Tirunelveli. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'joint', 'middle_class', true, true, true, 100, NOW() - INTERVAL '8 days', 'Poorvashadha', 'Kumbam', 'Magaram', 'Atri', 'gold', 50, 100, 'vegetarian', 'no', 'no'
    ) ON CONFLICT (id) DO UPDATE SET
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
      is_verified = EXCLUDED.is_verified,
      is_premium = EXCLUDED.is_premium,
      is_profile_complete = EXCLUDED.is_profile_complete,
      profile_completion_percent = EXCLUDED.profile_completion_percent,
      last_active_at = EXCLUDED.last_active_at,
      star = EXCLUDED.star,
      raasi = EXCLUDED.raasi,
      lagnam = EXCLUDED.lagnam,
      gothram = EXCLUDED.gothram,
      tier = EXCLUDED.tier,
      contacts_remaining = EXCLUDED.contacts_remaining,
      interests_remaining = EXCLUDED.interests_remaining,
      food_habit = EXCLUDED.food_habit,
      smoking = EXCLUDED.smoking,
      drinking = EXCLUDED.drinking;
INSERT INTO public.profiles (
      id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at, star, raasi, lagnam, gothram, tier, contacts_remaining, interests_remaining, food_habit, smoking, drinking
    ) VALUES (
      '00000000-0000-4000-a000-0000000000a9', 'TM000169', 'Karthik Moorthy', 'male', '1988-09-28', 185, 'never_married', 'Hindu', 'Chettiar', NULL, 'no', 'M.Sc', 'M.Sc Graduate', 'HR Specialist', 'HR Specialist Details', '₹10 Lakhs - ₹15 Lakhs', 'TCS', 'Thoothukudi', 'Tuticorin', 'Hi, I am Karthik. I have completed my M.Sc and am currently working as a HR Specialist at TCS in Thoothukudi. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'upper_middle_class', true, false, true, 100, NOW() - INTERVAL '9 days', 'Shatabhisha', 'Simham', 'Kanni', 'Harita', 'free', 5, 5, 'vegetarian', 'no', 'no'
    ) ON CONFLICT (id) DO UPDATE SET
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
      is_verified = EXCLUDED.is_verified,
      is_premium = EXCLUDED.is_premium,
      is_profile_complete = EXCLUDED.is_profile_complete,
      profile_completion_percent = EXCLUDED.profile_completion_percent,
      last_active_at = EXCLUDED.last_active_at,
      star = EXCLUDED.star,
      raasi = EXCLUDED.raasi,
      lagnam = EXCLUDED.lagnam,
      gothram = EXCLUDED.gothram,
      tier = EXCLUDED.tier,
      contacts_remaining = EXCLUDED.contacts_remaining,
      interests_remaining = EXCLUDED.interests_remaining,
      food_habit = EXCLUDED.food_habit,
      smoking = EXCLUDED.smoking,
      drinking = EXCLUDED.drinking;
INSERT INTO public.profiles (
      id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at, star, raasi, lagnam, gothram, tier, contacts_remaining, interests_remaining, food_habit, smoking, drinking
    ) VALUES (
      '00000000-0000-4000-a000-0000000000aa', 'TM000170', 'Megala Raj', 'female', '2000-09-25', 172, 'never_married', 'Hindu', 'Kallar', 'Kallar subcaste', 'yes', 'B.Com', 'B.Com Graduate', 'HR Specialist', 'HR Specialist Details', '₹7 Lakhs - ₹10 Lakhs', 'HCL', 'Salem', 'Salem', 'Hi, I am Megala. I have completed my B.Com and am currently working as a HR Specialist at HCL in Salem. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'joint', 'upper_middle_class', false, false, true, 100, NOW() - INTERVAL '6 days', 'Punarvasu', 'Dhanusu', 'Meenam', 'Harita', 'free', 5, 5, 'vegetarian', 'no', 'no'
    ) ON CONFLICT (id) DO UPDATE SET
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
      is_verified = EXCLUDED.is_verified,
      is_premium = EXCLUDED.is_premium,
      is_profile_complete = EXCLUDED.is_profile_complete,
      profile_completion_percent = EXCLUDED.profile_completion_percent,
      last_active_at = EXCLUDED.last_active_at,
      star = EXCLUDED.star,
      raasi = EXCLUDED.raasi,
      lagnam = EXCLUDED.lagnam,
      gothram = EXCLUDED.gothram,
      tier = EXCLUDED.tier,
      contacts_remaining = EXCLUDED.contacts_remaining,
      interests_remaining = EXCLUDED.interests_remaining,
      food_habit = EXCLUDED.food_habit,
      smoking = EXCLUDED.smoking,
      drinking = EXCLUDED.drinking;

-- 4. PARTNER PREFERENCES INSERTIONS
INSERT INTO public.partner_preferences (user_id, age_min, age_max, religion, caste)
VALUES ('00000000-0000-4000-a000-000000000001', 28, 45, ARRAY['Hindu']::TEXT[], ARRAY['Arunthathiyar', 'Caste No Bar']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, religion, caste)
VALUES ('00000000-0000-4000-a000-000000000002', 25, 33, ARRAY['Hindu']::TEXT[], ARRAY['Pillai', 'Caste No Bar']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, religion, caste)
VALUES ('00000000-0000-4000-a000-000000000003', 25, 38, ARRAY['Hindu']::TEXT[], ARRAY['Brahmin - Iyer', 'Caste No Bar']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, religion, caste)
VALUES ('00000000-0000-4000-a000-000000000004', 24, 36, ARRAY['Hindu']::TEXT[], ARRAY['Kallar', 'Caste No Bar']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, religion, caste)
VALUES ('00000000-0000-4000-a000-000000000005', 25, 34, ARRAY['Hindu']::TEXT[], ARRAY['Kallar', 'Caste No Bar']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, religion, caste)
VALUES ('00000000-0000-4000-a000-000000000006', 23, 34, ARRAY['Hindu']::TEXT[], ARRAY['Nadar', 'Caste No Bar']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, religion, caste)
VALUES ('00000000-0000-4000-a000-000000000007', 21, 36, ARRAY['Hindu']::TEXT[], ARRAY['Sengunthar', 'Caste No Bar']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, religion, caste)
VALUES ('00000000-0000-4000-a000-000000000008', 25, 30, ARRAY['Muslim']::TEXT[], ARRAY['Shia Muslim', 'Caste No Bar']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, religion, caste)
VALUES ('00000000-0000-4000-a000-000000000009', 23, 39, ARRAY['Christian']::TEXT[], ARRAY['Nadar Christian', 'Caste No Bar']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, religion, caste)
VALUES ('00000000-0000-4000-a000-00000000000a', 25, 32, ARRAY['Hindu']::TEXT[], ARRAY['Mudaliar', 'Caste No Bar']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, religion, caste)
VALUES ('00000000-0000-4000-a000-00000000000b', 21, 38, ARRAY['Hindu']::TEXT[], ARRAY['Thevar', 'Caste No Bar']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, religion, caste)
VALUES ('00000000-0000-4000-a000-00000000000c', 28, 45, ARRAY['Hindu']::TEXT[], ARRAY['Kallar', 'Caste No Bar']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, religion, caste)
VALUES ('00000000-0000-4000-a000-00000000000d', 28, 44, ARRAY['Christian']::TEXT[], ARRAY['Protestant Christian', 'Caste No Bar']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, religion, caste)
VALUES ('00000000-0000-4000-a000-00000000000e', 23, 32, ARRAY['Hindu']::TEXT[], ARRAY['Mudaliar', 'Caste No Bar']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, religion, caste)
VALUES ('00000000-0000-4000-a000-00000000000f', 25, 36, ARRAY['Hindu']::TEXT[], ARRAY['Vishwakarma', 'Caste No Bar']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, religion, caste)
VALUES ('00000000-0000-4000-a000-000000000010', 23, 44, ARRAY['Hindu']::TEXT[], ARRAY['Naidu', 'Caste No Bar']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, religion, caste)
VALUES ('00000000-0000-4000-a000-000000000011', 25, 39, ARRAY['Hindu']::TEXT[], ARRAY['Naicker', 'Caste No Bar']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, religion, caste)
VALUES ('00000000-0000-4000-a000-000000000012', 21, 41, ARRAY['Hindu']::TEXT[], ARRAY['Devendra Kula Vellalar', 'Caste No Bar']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, religion, caste)
VALUES ('00000000-0000-4000-a000-000000000013', 26, 41, ARRAY['Hindu']::TEXT[], ARRAY['Kallar', 'Caste No Bar']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, religion, caste)
VALUES ('00000000-0000-4000-a000-000000000014', 21, 31, ARRAY['Hindu']::TEXT[], ARRAY['Adi Dravida', 'Caste No Bar']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, religion, caste)
VALUES ('00000000-0000-4000-a000-000000000015', 21, 38, ARRAY['Hindu']::TEXT[], ARRAY['Vanniyar', 'Caste No Bar']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, religion, caste)
VALUES ('00000000-0000-4000-a000-000000000016', 22, 37, ARRAY['Hindu']::TEXT[], ARRAY['Brahmin - Iyengar', 'Caste No Bar']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, religion, caste)
VALUES ('00000000-0000-4000-a000-000000000017', 22, 36, ARRAY['Hindu']::TEXT[], ARRAY['Pillai', 'Caste No Bar']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, religion, caste)
VALUES ('00000000-0000-4000-a000-000000000018', 24, 34, ARRAY['Hindu']::TEXT[], ARRAY['Yadav', 'Caste No Bar']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, religion, caste)
VALUES ('00000000-0000-4000-a000-000000000019', 22, 34, ARRAY['Hindu']::TEXT[], ARRAY['Agamudayar', 'Caste No Bar']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, religion, caste)
VALUES ('00000000-0000-4000-a000-00000000001a', 26, 34, ARRAY['Hindu']::TEXT[], ARRAY['Vishwakarma', 'Caste No Bar']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, religion, caste)
VALUES ('00000000-0000-4000-a000-00000000001b', 23, 30, ARRAY['Hindu']::TEXT[], ARRAY['Pillai', 'Caste No Bar']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, religion, caste)
VALUES ('00000000-0000-4000-a000-00000000001c', 24, 33, ARRAY['Hindu']::TEXT[], ARRAY['Adi Dravida', 'Caste No Bar']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, religion, caste)
VALUES ('00000000-0000-4000-a000-00000000001d', 22, 38, ARRAY['Hindu']::TEXT[], ARRAY['Vishwakarma', 'Caste No Bar']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, religion, caste)
VALUES ('00000000-0000-4000-a000-00000000001e', 21, 33, ARRAY['Hindu']::TEXT[], ARRAY['Agamudayar', 'Caste No Bar']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, religion, caste)
VALUES ('00000000-0000-4000-a000-00000000001f', 28, 45, ARRAY['Hindu']::TEXT[], ARRAY['Maravar', 'Caste No Bar']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, religion, caste)
VALUES ('00000000-0000-4000-a000-000000000020', 24, 45, ARRAY['Hindu']::TEXT[], ARRAY['Mudaliar', 'Caste No Bar']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, religion, caste)
VALUES ('00000000-0000-4000-a000-000000000021', 26, 30, ARRAY['Hindu']::TEXT[], ARRAY['Mudaliar', 'Caste No Bar']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, religion, caste)
VALUES ('00000000-0000-4000-a000-000000000022', 22, 31, ARRAY['Christian']::TEXT[], ARRAY['Protestant Christian', 'Caste No Bar']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, religion, caste)
VALUES ('00000000-0000-4000-a000-000000000023', 27, 30, ARRAY['Hindu']::TEXT[], ARRAY['Naicker', 'Caste No Bar']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, religion, caste)
VALUES ('00000000-0000-4000-a000-000000000024', 26, 45, ARRAY['Hindu']::TEXT[], ARRAY['Naidu', 'Caste No Bar']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, religion, caste)
VALUES ('00000000-0000-4000-a000-000000000025', 23, 42, ARRAY['Hindu']::TEXT[], ARRAY['Adi Dravida', 'Caste No Bar']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, religion, caste)
VALUES ('00000000-0000-4000-a000-000000000026', 26, 30, ARRAY['Hindu']::TEXT[], ARRAY['Vanniyar', 'Caste No Bar']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, religion, caste)
VALUES ('00000000-0000-4000-a000-000000000027', 24, 31, ARRAY['Hindu']::TEXT[], ARRAY['Vanniyar', 'Caste No Bar']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, religion, caste)
VALUES ('00000000-0000-4000-a000-000000000028', 26, 30, ARRAY['Christian']::TEXT[], ARRAY['Nadar Christian', 'Caste No Bar']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, religion, caste)
VALUES ('00000000-0000-4000-a000-000000000029', 24, 35, ARRAY['Hindu']::TEXT[], ARRAY['Nadar', 'Caste No Bar']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, religion, caste)
VALUES ('00000000-0000-4000-a000-00000000002a', 23, 40, ARRAY['Hindu']::TEXT[], ARRAY['Naidu', 'Caste No Bar']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, religion, caste)
VALUES ('00000000-0000-4000-a000-00000000002b', 26, 42, ARRAY['Hindu']::TEXT[], ARRAY['Brahmin - Iyengar', 'Caste No Bar']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, religion, caste)
VALUES ('00000000-0000-4000-a000-00000000002c', 22, 35, ARRAY['Hindu']::TEXT[], ARRAY['Mudaliar', 'Caste No Bar']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, religion, caste)
VALUES ('00000000-0000-4000-a000-00000000002d', 28, 41, ARRAY['Hindu']::TEXT[], ARRAY['Agamudayar', 'Caste No Bar']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, religion, caste)
VALUES ('00000000-0000-4000-a000-00000000002e', 28, 42, ARRAY['Hindu']::TEXT[], ARRAY['Vanniyar', 'Caste No Bar']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, religion, caste)
VALUES ('00000000-0000-4000-a000-00000000002f', 23, 40, ARRAY['Hindu']::TEXT[], ARRAY['Arunthathiyar', 'Caste No Bar']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, religion, caste)
VALUES ('00000000-0000-4000-a000-000000000030', 28, 43, ARRAY['Hindu']::TEXT[], ARRAY['Agamudayar', 'Caste No Bar']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, religion, caste)
VALUES ('00000000-0000-4000-a000-000000000031', 28, 31, ARRAY['Christian']::TEXT[], ARRAY['Protestant Christian', 'Caste No Bar']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, religion, caste)
VALUES ('00000000-0000-4000-a000-000000000032', 21, 34, ARRAY['Hindu']::TEXT[], ARRAY['Sengunthar', 'Caste No Bar']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, religion, caste)
VALUES ('00000000-0000-4000-a000-000000000033', 27, 44, ARRAY['Hindu']::TEXT[], ARRAY['Gounder', 'Caste No Bar']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, religion, caste)
VALUES ('00000000-0000-4000-a000-000000000034', 22, 42, ARRAY['Hindu']::TEXT[], ARRAY['Arunthathiyar', 'Caste No Bar']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, religion, caste)
VALUES ('00000000-0000-4000-a000-000000000035', 27, 40, ARRAY['Hindu']::TEXT[], ARRAY['Brahmin - Iyer', 'Caste No Bar']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, religion, caste)
VALUES ('00000000-0000-4000-a000-000000000036', 24, 38, ARRAY['Christian']::TEXT[], ARRAY['Protestant Christian', 'Caste No Bar']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, religion, caste)
VALUES ('00000000-0000-4000-a000-000000000037', 23, 37, ARRAY['Christian']::TEXT[], ARRAY['Nadar Christian', 'Caste No Bar']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, religion, caste)
VALUES ('00000000-0000-4000-a000-000000000038', 28, 44, ARRAY['Hindu']::TEXT[], ARRAY['Agamudayar', 'Caste No Bar']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, religion, caste)
VALUES ('00000000-0000-4000-a000-000000000039', 27, 44, ARRAY['Hindu']::TEXT[], ARRAY['Gounder', 'Caste No Bar']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, religion, caste)
VALUES ('00000000-0000-4000-a000-00000000003a', 28, 44, ARRAY['Muslim']::TEXT[], ARRAY['Labbai', 'Caste No Bar']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, religion, caste)
VALUES ('00000000-0000-4000-a000-00000000003b', 25, 35, ARRAY['Hindu']::TEXT[], ARRAY['Naicker', 'Caste No Bar']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, religion, caste)
VALUES ('00000000-0000-4000-a000-00000000003c', 28, 32, ARRAY['Hindu']::TEXT[], ARRAY['Gounder', 'Caste No Bar']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, religion, caste)
VALUES ('00000000-0000-4000-a000-00000000003d', 27, 41, ARRAY['Hindu']::TEXT[], ARRAY['Vellalar', 'Caste No Bar']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, religion, caste)
VALUES ('00000000-0000-4000-a000-00000000003e', 27, 34, ARRAY['Christian']::TEXT[], ARRAY['Protestant Christian', 'Caste No Bar']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, religion, caste)
VALUES ('00000000-0000-4000-a000-00000000003f', 24, 39, ARRAY['Hindu']::TEXT[], ARRAY['Yadav', 'Caste No Bar']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, religion, caste)
VALUES ('00000000-0000-4000-a000-000000000040', 23, 30, ARRAY['Hindu']::TEXT[], ARRAY['Naidu', 'Caste No Bar']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, religion, caste)
VALUES ('00000000-0000-4000-a000-000000000041', 26, 36, ARRAY['Hindu']::TEXT[], ARRAY['Vellalar', 'Caste No Bar']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, religion, caste)
VALUES ('00000000-0000-4000-a000-000000000042', 25, 43, ARRAY['Hindu']::TEXT[], ARRAY['Maravar', 'Caste No Bar']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, religion, caste)
VALUES ('00000000-0000-4000-a000-000000000043', 21, 40, ARRAY['Hindu']::TEXT[], ARRAY['Sengunthar', 'Caste No Bar']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, religion, caste)
VALUES ('00000000-0000-4000-a000-000000000044', 27, 37, ARRAY['Hindu']::TEXT[], ARRAY['Vishwakarma', 'Caste No Bar']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, religion, caste)
VALUES ('00000000-0000-4000-a000-000000000045', 22, 36, ARRAY['Hindu']::TEXT[], ARRAY['Nadar', 'Caste No Bar']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, religion, caste)
VALUES ('00000000-0000-4000-a000-000000000046', 27, 44, ARRAY['Hindu']::TEXT[], ARRAY['Thevar', 'Caste No Bar']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, religion, caste)
VALUES ('00000000-0000-4000-a000-000000000047', 24, 41, ARRAY['Hindu']::TEXT[], ARRAY['Vanniyar', 'Caste No Bar']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, religion, caste)
VALUES ('00000000-0000-4000-a000-000000000048', 28, 44, ARRAY['Hindu']::TEXT[], ARRAY['Adi Dravida', 'Caste No Bar']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, religion, caste)
VALUES ('00000000-0000-4000-a000-000000000049', 27, 45, ARRAY['Hindu']::TEXT[], ARRAY['Arunthathiyar', 'Caste No Bar']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, religion, caste)
VALUES ('00000000-0000-4000-a000-00000000004a', 22, 36, ARRAY['Christian']::TEXT[], ARRAY['RC Christian', 'Caste No Bar']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, religion, caste)
VALUES ('00000000-0000-4000-a000-00000000004b', 27, 35, ARRAY['Hindu']::TEXT[], ARRAY['Naidu', 'Caste No Bar']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, religion, caste)
VALUES ('00000000-0000-4000-a000-00000000004c', 27, 35, ARRAY['Hindu']::TEXT[], ARRAY['Adi Dravida', 'Caste No Bar']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, religion, caste)
VALUES ('00000000-0000-4000-a000-00000000004d', 25, 41, ARRAY['Hindu']::TEXT[], ARRAY['Agamudayar', 'Caste No Bar']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, religion, caste)
VALUES ('00000000-0000-4000-a000-00000000004e', 21, 33, ARRAY['Hindu']::TEXT[], ARRAY['Naidu', 'Caste No Bar']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, religion, caste)
VALUES ('00000000-0000-4000-a000-00000000004f', 21, 43, ARRAY['Hindu']::TEXT[], ARRAY['Maravar', 'Caste No Bar']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, religion, caste)
VALUES ('00000000-0000-4000-a000-000000000050', 28, 35, ARRAY['Hindu']::TEXT[], ARRAY['Agamudayar', 'Caste No Bar']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, religion, caste)
VALUES ('00000000-0000-4000-a000-000000000051', 27, 45, ARRAY['Hindu']::TEXT[], ARRAY['Mudaliar', 'Caste No Bar']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, religion, caste)
VALUES ('00000000-0000-4000-a000-000000000052', 26, 36, ARRAY['Hindu']::TEXT[], ARRAY['Naidu', 'Caste No Bar']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, religion, caste)
VALUES ('00000000-0000-4000-a000-000000000053', 25, 38, ARRAY['Muslim']::TEXT[], ARRAY['Labbai', 'Caste No Bar']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, religion, caste)
VALUES ('00000000-0000-4000-a000-000000000054', 28, 31, ARRAY['Hindu']::TEXT[], ARRAY['Pillai', 'Caste No Bar']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, religion, caste)
VALUES ('00000000-0000-4000-a000-000000000055', 22, 43, ARRAY['Muslim']::TEXT[], ARRAY['Sunni Muslim', 'Caste No Bar']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, religion, caste)
VALUES ('00000000-0000-4000-a000-000000000056', 26, 41, ARRAY['Muslim']::TEXT[], ARRAY['Marakayar', 'Caste No Bar']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, religion, caste)
VALUES ('00000000-0000-4000-a000-000000000057', 26, 31, ARRAY['Hindu']::TEXT[], ARRAY['Vellalar', 'Caste No Bar']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, religion, caste)
VALUES ('00000000-0000-4000-a000-000000000058', 27, 32, ARRAY['Hindu']::TEXT[], ARRAY['Vanniyar', 'Caste No Bar']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, religion, caste)
VALUES ('00000000-0000-4000-a000-000000000059', 28, 32, ARRAY['Hindu']::TEXT[], ARRAY['Nadar', 'Caste No Bar']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, religion, caste)
VALUES ('00000000-0000-4000-a000-00000000005a', 26, 42, ARRAY['Hindu']::TEXT[], ARRAY['Chettiar', 'Caste No Bar']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, religion, caste)
VALUES ('00000000-0000-4000-a000-00000000005b', 24, 40, ARRAY['Hindu']::TEXT[], ARRAY['Vishwakarma', 'Caste No Bar']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, religion, caste)
VALUES ('00000000-0000-4000-a000-00000000005c', 21, 37, ARRAY['Hindu']::TEXT[], ARRAY['Vellalar', 'Caste No Bar']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, religion, caste)
VALUES ('00000000-0000-4000-a000-00000000005d', 22, 33, ARRAY['Hindu']::TEXT[], ARRAY['Vanniyar', 'Caste No Bar']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, religion, caste)
VALUES ('00000000-0000-4000-a000-00000000005e', 25, 44, ARRAY['Hindu']::TEXT[], ARRAY['Arunthathiyar', 'Caste No Bar']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, religion, caste)
VALUES ('00000000-0000-4000-a000-00000000005f', 28, 37, ARRAY['Hindu']::TEXT[], ARRAY['Agamudayar', 'Caste No Bar']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, religion, caste)
VALUES ('00000000-0000-4000-a000-000000000060', 22, 31, ARRAY['Hindu']::TEXT[], ARRAY['Vishwakarma', 'Caste No Bar']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, religion, caste)
VALUES ('00000000-0000-4000-a000-000000000061', 24, 36, ARRAY['Christian']::TEXT[], ARRAY['Nadar Christian', 'Caste No Bar']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, religion, caste)
VALUES ('00000000-0000-4000-a000-000000000062', 23, 43, ARRAY['Hindu']::TEXT[], ARRAY['Yadav', 'Caste No Bar']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, religion, caste)
VALUES ('00000000-0000-4000-a000-000000000063', 24, 32, ARRAY['Hindu']::TEXT[], ARRAY['Chettiar', 'Caste No Bar']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, religion, caste)
VALUES ('00000000-0000-4000-a000-000000000064', 27, 34, ARRAY['Hindu']::TEXT[], ARRAY['Kallar', 'Caste No Bar']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, religion, caste)
VALUES ('00000000-0000-4000-a000-000000000065', 21, 39, ARRAY['Hindu']::TEXT[], ARRAY['Naicker', 'Caste No Bar']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, religion, caste)
VALUES ('00000000-0000-4000-a000-000000000066', 24, 30, ARRAY['Hindu']::TEXT[], ARRAY['Nadar', 'Caste No Bar']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, religion, caste)
VALUES ('00000000-0000-4000-a000-000000000067', 27, 33, ARRAY['Hindu']::TEXT[], ARRAY['Brahmin - Iyer', 'Caste No Bar']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, religion, caste)
VALUES ('00000000-0000-4000-a000-000000000068', 22, 40, ARRAY['Hindu']::TEXT[], ARRAY['Devendra Kula Vellalar', 'Caste No Bar']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, religion, caste)
VALUES ('00000000-0000-4000-a000-000000000069', 25, 30, ARRAY['Christian']::TEXT[], ARRAY['Pentecostal', 'Caste No Bar']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, religion, caste)
VALUES ('00000000-0000-4000-a000-00000000006a', 25, 42, ARRAY['Hindu']::TEXT[], ARRAY['Agamudayar', 'Caste No Bar']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, religion, caste)
VALUES ('00000000-0000-4000-a000-00000000006b', 22, 43, ARRAY['Christian']::TEXT[], ARRAY['Vellalar Christian', 'Caste No Bar']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, religion, caste)
VALUES ('00000000-0000-4000-a000-00000000006c', 28, 37, ARRAY['Hindu']::TEXT[], ARRAY['Sengunthar', 'Caste No Bar']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, religion, caste)
VALUES ('00000000-0000-4000-a000-00000000006d', 22, 32, ARRAY['Hindu']::TEXT[], ARRAY['Sengunthar', 'Caste No Bar']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, religion, caste)
VALUES ('00000000-0000-4000-a000-00000000006e', 24, 31, ARRAY['Hindu']::TEXT[], ARRAY['Chettiar', 'Caste No Bar']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, religion, caste)
VALUES ('00000000-0000-4000-a000-00000000006f', 28, 45, ARRAY['Hindu']::TEXT[], ARRAY['Naidu', 'Caste No Bar']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, religion, caste)
VALUES ('00000000-0000-4000-a000-000000000070', 22, 43, ARRAY['Hindu']::TEXT[], ARRAY['Chettiar', 'Caste No Bar']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, religion, caste)
VALUES ('00000000-0000-4000-a000-000000000071', 27, 41, ARRAY['Christian']::TEXT[], ARRAY['Protestant Christian', 'Caste No Bar']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, religion, caste)
VALUES ('00000000-0000-4000-a000-000000000072', 24, 34, ARRAY['Hindu']::TEXT[], ARRAY['Vanniyar', 'Caste No Bar']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, religion, caste)
VALUES ('00000000-0000-4000-a000-000000000073', 24, 40, ARRAY['Hindu']::TEXT[], ARRAY['Vellalar', 'Caste No Bar']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, religion, caste)
VALUES ('00000000-0000-4000-a000-000000000074', 24, 37, ARRAY['Hindu']::TEXT[], ARRAY['Pillai', 'Caste No Bar']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, religion, caste)
VALUES ('00000000-0000-4000-a000-000000000075', 25, 30, ARRAY['Hindu']::TEXT[], ARRAY['Naicker', 'Caste No Bar']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, religion, caste)
VALUES ('00000000-0000-4000-a000-000000000076', 24, 38, ARRAY['Hindu']::TEXT[], ARRAY['Naicker', 'Caste No Bar']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, religion, caste)
VALUES ('00000000-0000-4000-a000-000000000077', 26, 42, ARRAY['Hindu']::TEXT[], ARRAY['Devendra Kula Vellalar', 'Caste No Bar']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, religion, caste)
VALUES ('00000000-0000-4000-a000-000000000078', 25, 37, ARRAY['Hindu']::TEXT[], ARRAY['Brahmin - Iyengar', 'Caste No Bar']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, religion, caste)
VALUES ('00000000-0000-4000-a000-000000000079', 23, 38, ARRAY['Hindu']::TEXT[], ARRAY['Mudaliar', 'Caste No Bar']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, religion, caste)
VALUES ('00000000-0000-4000-a000-00000000007a', 27, 41, ARRAY['Hindu']::TEXT[], ARRAY['Nadar', 'Caste No Bar']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, religion, caste)
VALUES ('00000000-0000-4000-a000-00000000007b', 28, 37, ARRAY['Hindu']::TEXT[], ARRAY['Mudaliar', 'Caste No Bar']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, religion, caste)
VALUES ('00000000-0000-4000-a000-00000000007c', 26, 40, ARRAY['Christian']::TEXT[], ARRAY['Nadar Christian', 'Caste No Bar']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, religion, caste)
VALUES ('00000000-0000-4000-a000-00000000007d', 25, 45, ARRAY['Hindu']::TEXT[], ARRAY['Kallar', 'Caste No Bar']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, religion, caste)
VALUES ('00000000-0000-4000-a000-00000000007e', 28, 41, ARRAY['Muslim']::TEXT[], ARRAY['Labbai', 'Caste No Bar']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, religion, caste)
VALUES ('00000000-0000-4000-a000-00000000007f', 24, 30, ARRAY['Hindu']::TEXT[], ARRAY['Pillai', 'Caste No Bar']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, religion, caste)
VALUES ('00000000-0000-4000-a000-000000000080', 24, 44, ARRAY['Hindu']::TEXT[], ARRAY['Vishwakarma', 'Caste No Bar']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, religion, caste)
VALUES ('00000000-0000-4000-a000-000000000081', 25, 40, ARRAY['Hindu']::TEXT[], ARRAY['Devendra Kula Vellalar', 'Caste No Bar']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, religion, caste)
VALUES ('00000000-0000-4000-a000-000000000082', 28, 33, ARRAY['Hindu']::TEXT[], ARRAY['Pillai', 'Caste No Bar']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, religion, caste)
VALUES ('00000000-0000-4000-a000-000000000083', 25, 40, ARRAY['Hindu']::TEXT[], ARRAY['Pillai', 'Caste No Bar']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, religion, caste)
VALUES ('00000000-0000-4000-a000-000000000084', 21, 35, ARRAY['Hindu']::TEXT[], ARRAY['Kallar', 'Caste No Bar']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, religion, caste)
VALUES ('00000000-0000-4000-a000-000000000085', 26, 36, ARRAY['Hindu']::TEXT[], ARRAY['Maravar', 'Caste No Bar']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, religion, caste)
VALUES ('00000000-0000-4000-a000-000000000086', 22, 38, ARRAY['Hindu']::TEXT[], ARRAY['Chettiar', 'Caste No Bar']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, religion, caste)
VALUES ('00000000-0000-4000-a000-000000000087', 27, 45, ARRAY['Christian']::TEXT[], ARRAY['Protestant Christian', 'Caste No Bar']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, religion, caste)
VALUES ('00000000-0000-4000-a000-000000000088', 27, 31, ARRAY['Hindu']::TEXT[], ARRAY['Vanniyar', 'Caste No Bar']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, religion, caste)
VALUES ('00000000-0000-4000-a000-000000000089', 27, 35, ARRAY['Hindu']::TEXT[], ARRAY['Gounder', 'Caste No Bar']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, religion, caste)
VALUES ('00000000-0000-4000-a000-00000000008a', 23, 41, ARRAY['Hindu']::TEXT[], ARRAY['Devendra Kula Vellalar', 'Caste No Bar']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, religion, caste)
VALUES ('00000000-0000-4000-a000-00000000008b', 24, 38, ARRAY['Hindu']::TEXT[], ARRAY['Brahmin - Iyengar', 'Caste No Bar']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, religion, caste)
VALUES ('00000000-0000-4000-a000-00000000008c', 24, 32, ARRAY['Hindu']::TEXT[], ARRAY['Yadav', 'Caste No Bar']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, religion, caste)
VALUES ('00000000-0000-4000-a000-00000000008d', 24, 37, ARRAY['Hindu']::TEXT[], ARRAY['Maravar', 'Caste No Bar']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, religion, caste)
VALUES ('00000000-0000-4000-a000-00000000008e', 24, 30, ARRAY['Hindu']::TEXT[], ARRAY['Maravar', 'Caste No Bar']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, religion, caste)
VALUES ('00000000-0000-4000-a000-00000000008f', 22, 34, ARRAY['Hindu']::TEXT[], ARRAY['Agamudayar', 'Caste No Bar']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, religion, caste)
VALUES ('00000000-0000-4000-a000-000000000090', 27, 39, ARRAY['Hindu']::TEXT[], ARRAY['Vanniyar', 'Caste No Bar']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, religion, caste)
VALUES ('00000000-0000-4000-a000-000000000091', 25, 33, ARRAY['Hindu']::TEXT[], ARRAY['Brahmin - Iyer', 'Caste No Bar']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, religion, caste)
VALUES ('00000000-0000-4000-a000-000000000092', 28, 32, ARRAY['Hindu']::TEXT[], ARRAY['Vishwakarma', 'Caste No Bar']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, religion, caste)
VALUES ('00000000-0000-4000-a000-000000000093', 25, 33, ARRAY['Hindu']::TEXT[], ARRAY['Pillai', 'Caste No Bar']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, religion, caste)
VALUES ('00000000-0000-4000-a000-000000000094', 28, 45, ARRAY['Hindu']::TEXT[], ARRAY['Kallar', 'Caste No Bar']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, religion, caste)
VALUES ('00000000-0000-4000-a000-000000000095', 26, 31, ARRAY['Christian']::TEXT[], ARRAY['RC Christian', 'Caste No Bar']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, religion, caste)
VALUES ('00000000-0000-4000-a000-000000000096', 22, 32, ARRAY['Hindu']::TEXT[], ARRAY['Sengunthar', 'Caste No Bar']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, religion, caste)
VALUES ('00000000-0000-4000-a000-000000000097', 24, 42, ARRAY['Hindu']::TEXT[], ARRAY['Brahmin - Iyer', 'Caste No Bar']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, religion, caste)
VALUES ('00000000-0000-4000-a000-000000000098', 25, 31, ARRAY['Hindu']::TEXT[], ARRAY['Naidu', 'Caste No Bar']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, religion, caste)
VALUES ('00000000-0000-4000-a000-000000000099', 22, 45, ARRAY['Hindu']::TEXT[], ARRAY['Vanniyar', 'Caste No Bar']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, religion, caste)
VALUES ('00000000-0000-4000-a000-00000000009a', 22, 35, ARRAY['Hindu']::TEXT[], ARRAY['Vishwakarma', 'Caste No Bar']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, religion, caste)
VALUES ('00000000-0000-4000-a000-00000000009b', 26, 43, ARRAY['Hindu']::TEXT[], ARRAY['Kallar', 'Caste No Bar']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, religion, caste)
VALUES ('00000000-0000-4000-a000-00000000009c', 28, 45, ARRAY['Hindu']::TEXT[], ARRAY['Gounder', 'Caste No Bar']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, religion, caste)
VALUES ('00000000-0000-4000-a000-00000000009d', 22, 43, ARRAY['Muslim']::TEXT[], ARRAY['Rawther', 'Caste No Bar']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, religion, caste)
VALUES ('00000000-0000-4000-a000-00000000009e', 23, 41, ARRAY['Christian']::TEXT[], ARRAY['Pentecostal', 'Caste No Bar']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, religion, caste)
VALUES ('00000000-0000-4000-a000-00000000009f', 28, 32, ARRAY['Muslim']::TEXT[], ARRAY['Sunni Muslim', 'Caste No Bar']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, religion, caste)
VALUES ('00000000-0000-4000-a000-0000000000a0', 27, 41, ARRAY['Hindu']::TEXT[], ARRAY['Naicker', 'Caste No Bar']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, religion, caste)
VALUES ('00000000-0000-4000-a000-0000000000a1', 25, 35, ARRAY['Muslim']::TEXT[], ARRAY['Shia Muslim', 'Caste No Bar']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, religion, caste)
VALUES ('00000000-0000-4000-a000-0000000000a2', 26, 41, ARRAY['Hindu']::TEXT[], ARRAY['Brahmin - Iyer', 'Caste No Bar']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, religion, caste)
VALUES ('00000000-0000-4000-a000-0000000000a3', 21, 43, ARRAY['Hindu']::TEXT[], ARRAY['Gounder', 'Caste No Bar']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, religion, caste)
VALUES ('00000000-0000-4000-a000-0000000000a4', 25, 45, ARRAY['Hindu']::TEXT[], ARRAY['Vishwakarma', 'Caste No Bar']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, religion, caste)
VALUES ('00000000-0000-4000-a000-0000000000a5', 27, 40, ARRAY['Christian']::TEXT[], ARRAY['RC Christian', 'Caste No Bar']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, religion, caste)
VALUES ('00000000-0000-4000-a000-0000000000a6', 21, 33, ARRAY['Hindu']::TEXT[], ARRAY['Kallar', 'Caste No Bar']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, religion, caste)
VALUES ('00000000-0000-4000-a000-0000000000a7', 28, 40, ARRAY['Hindu']::TEXT[], ARRAY['Mudaliar', 'Caste No Bar']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, religion, caste)
VALUES ('00000000-0000-4000-a000-0000000000a8', 28, 38, ARRAY['Hindu']::TEXT[], ARRAY['Kallar', 'Caste No Bar']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, religion, caste)
VALUES ('00000000-0000-4000-a000-0000000000a9', 28, 36, ARRAY['Hindu']::TEXT[], ARRAY['Chettiar', 'Caste No Bar']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, religion, caste)
VALUES ('00000000-0000-4000-a000-0000000000aa', 21, 40, ARRAY['Hindu']::TEXT[], ARRAY['Kallar', 'Caste No Bar']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste;

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
