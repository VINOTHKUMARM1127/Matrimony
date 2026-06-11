-- ============================================================
-- Tamil Matrimony — Seeding Ecosystem (Part 3)
-- ============================================================

CREATE EXTENSION IF NOT EXISTS pgcrypto;

BEGIN;

-- 1. AUTH USERS INSERTIONS
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-000000000155', 'tamiluser341@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Shankar Krishnan"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-000000000156', 'tamiluser342@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Nivedha Naicker"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-000000000157', 'tamiluser343@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Ramesh Selvan"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-000000000158', 'tamiluser344@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Anitha Balan"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-000000000159', 'tamiluser345@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Shankar Devan"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-00000000015a', 'tamiluser346@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Rekha Moorthy"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-00000000015b', 'tamiluser347@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Thirumal Nathan"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-00000000015c', 'tamiluser348@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Harini Moorthy"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-00000000015d', 'tamiluser349@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Chinnasamy Moorthy"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-00000000015e', 'tamiluser350@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Harini Velan"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-00000000015f', 'tamiluser351@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Ramesh Moorthy"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-000000000160', 'tamiluser352@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Chitra Raj"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-000000000161', 'tamiluser353@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Madhavan Gopal"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-000000000162', 'tamiluser354@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Priya Kumar"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-000000000163', 'tamiluser355@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Shankar Raj"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-000000000164', 'tamiluser356@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Swetha Kumar"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-000000000165', 'tamiluser357@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Deepak Lingam"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-000000000166', 'tamiluser358@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Malathi Mani"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-000000000167', 'tamiluser359@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Naveen Lingam"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-000000000168', 'tamiluser360@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Divya Swamy"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-000000000169', 'tamiluser361@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Muthu Lingam"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-00000000016a', 'tamiluser362@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Megala Mani"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-00000000016b', 'tamiluser363@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Selvam Shankar"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-00000000016c', 'tamiluser364@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Pooja Swamy"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-00000000016d', 'tamiluser365@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Bala Pandian"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-00000000016e', 'tamiluser366@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Gowri Pandian"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-00000000016f', 'tamiluser367@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Ramesh Naicker"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-000000000170', 'tamiluser368@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Megala Naicker"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-000000000171', 'tamiluser369@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Siddharth Devan"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-000000000172', 'tamiluser370@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Janani Samy"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-000000000173', 'tamiluser371@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Sakthi Raman"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-000000000174', 'tamiluser372@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Radha Gopal"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-000000000175', 'tamiluser373@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Kabilan Raj"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-000000000176', 'tamiluser374@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Yazhini Mani"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-000000000177', 'tamiluser375@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Siva Pandian"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-000000000178', 'tamiluser376@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Malathi Nathan"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-000000000179', 'tamiluser377@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Ajith Raman"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-00000000017a', 'tamiluser378@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Rekha Selvan"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-00000000017b', 'tamiluser379@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Sundar Swamy"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-00000000017c', 'tamiluser380@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Gowri Gopal"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-00000000017d', 'tamiluser381@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Chinnasamy Balan"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-00000000017e', 'tamiluser382@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Geetha Moorthy"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-00000000017f', 'tamiluser383@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Arun Nathan"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-000000000180', 'tamiluser384@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Vidya Selvan"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-000000000181', 'tamiluser385@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Rajesh Naicker"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-000000000182', 'tamiluser386@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Malarvizhi Gopal"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-000000000183', 'tamiluser387@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Jeeva Nathan"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-000000000184', 'tamiluser388@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Geetha Gopal"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-000000000185', 'tamiluser389@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Muthu Moorthy"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-000000000186', 'tamiluser390@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Radha Moorthy"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-000000000187', 'tamiluser391@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Selvam Velan"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-000000000188', 'tamiluser392@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Sowmya Naicker"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-000000000189', 'tamiluser393@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Murugan Samy"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-00000000018a', 'tamiluser394@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Anitha Selvan"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-00000000018b', 'tamiluser395@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Anbarasan Moorthy"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-00000000018c', 'tamiluser396@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Priya Samy"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-00000000018d', 'tamiluser397@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Dinesh Nathan"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-00000000018e', 'tamiluser398@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Divya Moorthy"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-00000000018f', 'tamiluser399@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Viswanathan Murthy"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-000000000190', 'tamiluser400@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Keerthana Velan"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-000000000191', 'tamiluser401@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Deepak Moorthy"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-000000000192', 'tamiluser402@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Shanthi Gopal"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-000000000193', 'tamiluser403@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Mohan Raman"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-000000000194', 'tamiluser404@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Archana Kumar"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-000000000195', 'tamiluser405@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Naveen Mani"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-000000000196', 'tamiluser406@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Uma Samy"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-000000000197', 'tamiluser407@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Prabhu Mani"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-000000000198', 'tamiluser408@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Parvathi Raj"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-000000000199', 'tamiluser409@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Sathish Naicker"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-00000000019a', 'tamiluser410@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Radha Lingam"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-00000000019b', 'tamiluser411@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Ramesh Pandian"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-00000000019c', 'tamiluser412@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Rekha Naicker"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-00000000019d', 'tamiluser413@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Madhavan Swamy"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-00000000019e', 'tamiluser414@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Pooja Gopal"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-00000000019f', 'tamiluser415@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Madhavan Sundaram"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-0000000001a0', 'tamiluser416@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Uma Raj"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-0000000001a1', 'tamiluser417@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Karthik Sundaram"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-0000000001a2', 'tamiluser418@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Kayalvizhi Shankar"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-0000000001a3', 'tamiluser419@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Jeeva Sundaram"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-0000000001a4', 'tamiluser420@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Uma Murthy"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-0000000001a5', 'tamiluser421@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Vinoth Balan"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-0000000001a6', 'tamiluser422@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Preethi Naicker"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-0000000001a7', 'tamiluser423@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Senthil Samy"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-0000000001a8', 'tamiluser424@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Uma Nathan"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-0000000001a9', 'tamiluser425@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Aravind Swamy"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-0000000001aa', 'tamiluser426@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Radha Pandian"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-0000000001ab', 'tamiluser427@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Senthil Lingam"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-0000000001ac', 'tamiluser428@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Janani Pandian"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-0000000001ad', 'tamiluser429@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Vinoth Murthy"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-0000000001ae', 'tamiluser430@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Sowmya Sundaram"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-0000000001af', 'tamiluser431@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Surya Balan"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-0000000001b0', 'tamiluser432@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Preethi Sundaram"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-0000000001b1', 'tamiluser433@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Jeeva Krishnan"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-0000000001b2', 'tamiluser434@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Deepa Gopal"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-0000000001b3', 'tamiluser435@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Selvam Raj"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-0000000001b4', 'tamiluser436@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Pavithra Pandian"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-0000000001b5', 'tamiluser437@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Suresh Balan"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-0000000001b6', 'tamiluser438@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Sandhya Lingam"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-0000000001b7', 'tamiluser439@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Vetrivel Kumar"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-0000000001b8', 'tamiluser440@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Nivedha Pandian"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-0000000001b9', 'tamiluser441@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Srinivasan Sundaram"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-0000000001ba', 'tamiluser442@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Megala Murthy"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-0000000001bb', 'tamiluser443@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Madhavan Selvan"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-0000000001bc', 'tamiluser444@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Ponmani Lingam"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-0000000001bd', 'tamiluser445@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Srinivasan Shankar"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-0000000001be', 'tamiluser446@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Sandhya Krishnan"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-0000000001bf', 'tamiluser447@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Shankar Murthy"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-0000000001c0', 'tamiluser448@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Anitha Sundaram"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-0000000001c1', 'tamiluser449@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Vinoth Naicker"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-0000000001c2', 'tamiluser450@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Harini Krishnan"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-0000000001c3', 'tamiluser451@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Manikandan Murthy"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-0000000001c4', 'tamiluser452@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Nandhini Swamy"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-0000000001c5', 'tamiluser453@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Naveen Sundaram"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-0000000001c6', 'tamiluser454@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Banumathi Sundaram"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-0000000001c7', 'tamiluser455@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Srinivasan Naicker"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-0000000001c8', 'tamiluser456@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Chitra Kumar"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-0000000001c9', 'tamiluser457@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Jeeva Shankar"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-0000000001ca', 'tamiluser458@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Gayathri Shankar"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-0000000001cb', 'tamiluser459@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Ajith Shankar"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-0000000001cc', 'tamiluser460@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Kokila Sundaram"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-0000000001cd', 'tamiluser461@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Senthil Krishnan"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-0000000001ce', 'tamiluser462@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Vijaya Devan"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-0000000001cf', 'tamiluser463@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Karthik Nathan"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-0000000001d0', 'tamiluser464@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Parvathi Sundaram"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-0000000001d1', 'tamiluser465@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Suresh Krishnan"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-0000000001d2', 'tamiluser466@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Malarvizhi Selvan"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-0000000001d3', 'tamiluser467@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Kabilan Velan"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-0000000001d4', 'tamiluser468@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Vidya Raman"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-0000000001d5', 'tamiluser469@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Vignesh Raman"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-0000000001d6', 'tamiluser470@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Divya Murthy"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-0000000001d7', 'tamiluser471@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Muthu Selvan"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-0000000001d8', 'tamiluser472@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Divya Balan"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-0000000001d9', 'tamiluser473@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Murugan Balan"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-0000000001da', 'tamiluser474@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Deepa Velan"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-0000000001db', 'tamiluser475@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Muthu Sundaram"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-0000000001dc', 'tamiluser476@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Saraswathi Nathan"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-0000000001dd', 'tamiluser477@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Chinnasamy Balan"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-0000000001de', 'tamiluser478@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Ramani Gopal"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-0000000001df', 'tamiluser479@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Bala Shankar"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-0000000001e0', 'tamiluser480@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Nivedha Velan"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-0000000001e1', 'tamiluser481@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Naveen Murthy"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-0000000001e2', 'tamiluser482@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Preethi Mani"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-0000000001e3', 'tamiluser483@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Siva Krishnan"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-0000000001e4', 'tamiluser484@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Preethi Velan"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-0000000001e5', 'tamiluser485@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Ganesan Lingam"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-0000000001e6', 'tamiluser486@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Uma Balan"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-0000000001e7', 'tamiluser487@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Sundar Moorthy"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-0000000001e8', 'tamiluser488@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Oviya Moorthy"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-0000000001e9', 'tamiluser489@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Velmurugan Murthy"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-0000000001ea', 'tamiluser490@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Shanthi Naicker"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-0000000001eb', 'tamiluser491@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Manikandan Mani"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-0000000001ec', 'tamiluser492@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Vidya Kumar"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-0000000001ed', 'tamiluser493@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Rajesh Naicker"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-0000000001ee', 'tamiluser494@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Preethi Nathan"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-0000000001ef', 'tamiluser495@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Bala Swamy"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-0000000001f0', 'tamiluser496@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Divya Mani"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-0000000001f1', 'tamiluser497@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Praveen Raman"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-0000000001f2', 'tamiluser498@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Nandhini Kumar"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-0000000001f3', 'tamiluser499@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Ajith Samy"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-0000000001f4', 'tamiluser500@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Kokila Nathan"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;

-- 2. PUBLIC PROFILES INSERTIONS
INSERT INTO public.profiles (id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, father_occupation, mother_occupation, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at)
VALUES ('00000000-0000-4000-a000-000000000155', 'TM000341', 'Shankar Krishnan', 'male', '2005-11-12', 185, 'never_married', 'Hindu', 'Brahmin - Iyengar', 'Brahmin - Iyengar subcaste', 'yes', 'Ph.D', 'Ph.D Graduate', 'Architect', 'Architect Details', '₹20 Lakhs+', 'Private Practice', 'Madurai', 'Madurai', 'Hi, I am Shankar. I have completed my Ph.D and am currently working as a Architect at Private Practice in Madurai. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'joint', 'upper_middle_class', 'Retired Employee', 'Homemaker', true, false, true, 100, NOW() - INTERVAL '10 days')
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
VALUES ('00000000-0000-4000-a000-000000000156', 'TM000342', 'Nivedha Naicker', 'female', '2001-10-16', 168, 'never_married', 'Hindu', 'Kallar', NULL, 'yes', 'M.Com', 'M.Com Graduate', 'Advocate', 'Advocate Details', '₹15 Lakhs - ₹20 Lakhs', 'Accenture', 'Tiruppur', 'Tiruppur', 'Hi, I am Nivedha. I have completed my M.Com and am currently working as a Advocate at Accenture in Tiruppur. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'joint', 'upper_middle_class', 'Retired Employee', 'Homemaker', true, false, true, 100, NOW() - INTERVAL '10 days')
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
VALUES ('00000000-0000-4000-a000-000000000157', 'TM000343', 'Ramesh Selvan', 'male', '2004-02-19', 166, 'divorced', 'Hindu', 'Kallar', 'Kallar subcaste', 'no', 'M.B.A', 'M.B.A Graduate', 'Civil Engineer', 'Civil Engineer Details', '₹20 Lakhs+', 'Private Practice', 'Erode', 'Erode', 'Hi, I am Ramesh. I have completed my M.B.A and am currently working as a Civil Engineer at Private Practice in Erode. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'rich', 'Retired Employee', 'Homemaker', true, false, true, 100, NOW() - INTERVAL '6 days')
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
VALUES ('00000000-0000-4000-a000-000000000158', 'TM000344', 'Anitha Balan', 'female', '1990-02-11', 155, 'never_married', 'Christian', 'Pentecostal', NULL, 'no', 'M.B.B.S', 'M.B.B.S Graduate', 'Civil Engineer', 'Civil Engineer Details', '₹3 Lakhs - ₹5 Lakhs', 'Accenture', 'Erode', 'Erode', 'Hi, I am Anitha. I have completed my M.B.B.S and am currently working as a Civil Engineer at Accenture in Erode. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'joint', 'middle_class', 'Retired Employee', 'Homemaker', true, false, true, 100, NOW() - INTERVAL '0 days')
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
VALUES ('00000000-0000-4000-a000-000000000159', 'TM000345', 'Shankar Devan', 'male', '1994-09-01', 181, 'never_married', 'Hindu', 'Adi Dravida', NULL, 'no', 'B.Sc', 'B.Sc Graduate', 'Mechanical Engineer', 'Mechanical Engineer Details', '₹10 Lakhs - ₹15 Lakhs', 'Infosys', 'Vellore', 'Vellore', 'Hi, I am Shankar. I have completed my B.Sc and am currently working as a Mechanical Engineer at Infosys in Vellore. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'joint', 'middle_class', 'Retired Employee', 'Homemaker', true, true, true, 100, NOW() - INTERVAL '3 days')
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
VALUES ('00000000-0000-4000-a000-00000000015a', 'TM000346', 'Rekha Moorthy', 'female', '2005-07-28', 162, 'never_married', 'Hindu', 'Maravar', 'Maravar subcaste', 'no', 'B.Com', 'B.Com Graduate', 'Auditor', 'Auditor Details', '₹5 Lakhs - ₹7 Lakhs', 'Government Service', 'Salem', 'Salem', 'Hi, I am Rekha. I have completed my B.Com and am currently working as a Auditor at Government Service in Salem. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'joint', 'rich', 'Retired Employee', 'Homemaker', true, false, true, 100, NOW() - INTERVAL '2 days')
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
VALUES ('00000000-0000-4000-a000-00000000015b', 'TM000347', 'Thirumal Nathan', 'male', '2003-09-10', 167, 'never_married', 'Hindu', 'Vanniyar', 'Vanniyar subcaste', 'no', 'Ph.D', 'Ph.D Graduate', 'Advocate', 'Advocate Details', '₹5 Lakhs - ₹7 Lakhs', 'Self Employed', 'Chennai', 'Chennai', 'Hi, I am Thirumal. I have completed my Ph.D and am currently working as a Advocate at Self Employed in Chennai. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'upper_middle_class', 'Retired Employee', 'Homemaker', true, false, true, 100, NOW() - INTERVAL '1 days')
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
VALUES ('00000000-0000-4000-a000-00000000015c', 'TM000348', 'Harini Moorthy', 'female', '1989-01-10', 161, 'never_married', 'Hindu', 'Brahmin - Iyer', NULL, 'no', 'M.A', 'M.A Graduate', 'Dentist', 'Dentist Details', '₹15 Lakhs - ₹20 Lakhs', 'Wipro', 'Thoothukudi', 'Tuticorin', 'Hi, I am Harini. I have completed my M.A and am currently working as a Dentist at Wipro in Thoothukudi. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'upper_middle_class', 'Retired Employee', 'Homemaker', true, false, true, 100, NOW() - INTERVAL '8 days')
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
VALUES ('00000000-0000-4000-a000-00000000015d', 'TM000349', 'Chinnasamy Moorthy', 'male', '2003-12-26', 171, 'never_married', 'Hindu', 'Arunthathiyar', 'Arunthathiyar subcaste', 'no', 'M.C.A', 'M.C.A Graduate', 'Advocate', 'Advocate Details', '₹15 Lakhs - ₹20 Lakhs', 'Wipro', 'Chennai', 'Chennai', 'Hi, I am Chinnasamy. I have completed my M.C.A and am currently working as a Advocate at Wipro in Chennai. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'rich', 'Retired Employee', 'Homemaker', false, false, true, 100, NOW() - INTERVAL '7 days')
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
VALUES ('00000000-0000-4000-a000-00000000015e', 'TM000350', 'Harini Velan', 'female', '1992-02-07', 165, 'never_married', 'Christian', 'Pentecostal', 'Pentecostal subcaste', 'yes', 'M.B.A', 'M.B.A Graduate', 'Government Officer', 'Government Officer Details', '₹3 Lakhs - ₹5 Lakhs', 'TCS', 'Kanchipuram', 'Kanchipuram', 'Hi, I am Harini. I have completed my M.B.A and am currently working as a Government Officer at TCS in Kanchipuram. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'middle_class', 'Retired Employee', 'Homemaker', true, false, true, 100, NOW() - INTERVAL '0 days')
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
VALUES ('00000000-0000-4000-a000-00000000015f', 'TM000351', 'Ramesh Moorthy', 'male', '1996-07-24', 162, 'never_married', 'Hindu', 'Vishwakarma', NULL, 'no', 'M.Sc', 'M.Sc Graduate', 'Mechanical Engineer', 'Mechanical Engineer Details', '₹7 Lakhs - ₹10 Lakhs', 'Zoho', 'Salem', 'Salem', 'Hi, I am Ramesh. I have completed my M.Sc and am currently working as a Mechanical Engineer at Zoho in Salem. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'middle_class', 'Retired Employee', 'Homemaker', true, true, true, 100, NOW() - INTERVAL '8 days')
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
VALUES ('00000000-0000-4000-a000-000000000160', 'TM000352', 'Chitra Raj', 'female', '1994-11-16', 173, 'never_married', 'Hindu', 'Thevar', 'Thevar subcaste', 'no', 'B.Sc', 'B.Sc Graduate', 'Software Engineer', 'Software Engineer Details', '₹5 Lakhs - ₹7 Lakhs', 'Infosys', 'Madurai', 'Madurai', 'Hi, I am Chitra. I have completed my B.Sc and am currently working as a Software Engineer at Infosys in Madurai. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'rich', 'Retired Employee', 'Homemaker', true, false, true, 100, NOW() - INTERVAL '2 days')
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
VALUES ('00000000-0000-4000-a000-000000000161', 'TM000353', 'Madhavan Gopal', 'male', '2001-05-12', 165, 'never_married', 'Hindu', 'Naicker', NULL, 'no', 'M.C.A', 'M.C.A Graduate', 'Mechanical Engineer', 'Mechanical Engineer Details', '₹7 Lakhs - ₹10 Lakhs', 'Cognizant', 'Coimbatore', 'Coimbatore', 'Hi, I am Madhavan. I have completed my M.C.A and am currently working as a Mechanical Engineer at Cognizant in Coimbatore. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'joint', 'upper_middle_class', 'Retired Employee', 'Homemaker', false, true, true, 100, NOW() - INTERVAL '10 days')
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
VALUES ('00000000-0000-4000-a000-000000000162', 'TM000354', 'Priya Kumar', 'female', '2001-12-09', 173, 'never_married', 'Hindu', 'Adi Dravida', NULL, 'yes', 'Ph.D', 'Ph.D Graduate', 'Mechanical Engineer', 'Mechanical Engineer Details', '₹7 Lakhs - ₹10 Lakhs', 'Private Practice', 'Kanchipuram', 'Kanchipuram', 'Hi, I am Priya. I have completed my Ph.D and am currently working as a Mechanical Engineer at Private Practice in Kanchipuram. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'joint', 'rich', 'Retired Employee', 'Homemaker', true, false, true, 100, NOW() - INTERVAL '9 days')
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
VALUES ('00000000-0000-4000-a000-000000000163', 'TM000355', 'Shankar Raj', 'male', '2002-02-10', 186, 'never_married', 'Christian', 'Protestant Christian', 'Protestant Christian subcaste', 'yes', 'B.E. / B.Tech', 'B.E. / B.Tech Graduate', 'College Professor', 'College Professor Details', '₹3 Lakhs - ₹5 Lakhs', 'Infosys', 'Coimbatore', 'Coimbatore', 'Hi, I am Shankar. I have completed my B.E. / B.Tech and am currently working as a College Professor at Infosys in Coimbatore. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'upper_middle_class', 'Retired Employee', 'Homemaker', true, true, true, 100, NOW() - INTERVAL '2 days')
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
VALUES ('00000000-0000-4000-a000-000000000164', 'TM000356', 'Swetha Kumar', 'female', '2003-01-16', 170, 'never_married', 'Hindu', 'Nadar', NULL, 'no', 'M.Sc', 'M.Sc Graduate', 'Dentist', 'Dentist Details', '₹7 Lakhs - ₹10 Lakhs', 'Self Employed', 'Thanjavur', 'Thanjavur', 'Hi, I am Swetha. I have completed my M.Sc and am currently working as a Dentist at Self Employed in Thanjavur. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'middle_class', 'Retired Employee', 'Homemaker', true, true, true, 100, NOW() - INTERVAL '3 days')
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
VALUES ('00000000-0000-4000-a000-000000000165', 'TM000357', 'Deepak Lingam', 'male', '1998-05-22', 171, 'divorced', 'Hindu', 'Mudaliar', 'Mudaliar subcaste', 'no', 'M.B.A', 'M.B.A Graduate', 'School Teacher', 'School Teacher Details', '₹7 Lakhs - ₹10 Lakhs', 'Cognizant', 'Tirunelveli', 'Tirunelveli', 'Hi, I am Deepak. I have completed my M.B.A and am currently working as a School Teacher at Cognizant in Tirunelveli. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'rich', 'Retired Employee', 'Homemaker', false, false, true, 100, NOW() - INTERVAL '5 days')
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
VALUES ('00000000-0000-4000-a000-000000000166', 'TM000358', 'Malathi Mani', 'female', '2001-08-05', 154, 'never_married', 'Hindu', 'Devendra Kula Vellalar', 'Devendra Kula Vellalar subcaste', 'no', 'M.B.B.S', 'M.B.B.S Graduate', 'Doctor', 'Doctor Details', '₹10 Lakhs - ₹15 Lakhs', 'HCL', 'Tirunelveli', 'Tirunelveli', 'Hi, I am Malathi. I have completed my M.B.B.S and am currently working as a Doctor at HCL in Tirunelveli. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'middle_class', 'Retired Employee', 'Homemaker', true, false, true, 100, NOW() - INTERVAL '2 days')
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
VALUES ('00000000-0000-4000-a000-000000000167', 'TM000359', 'Naveen Lingam', 'male', '1994-04-18', 187, 'divorced', 'Christian', 'Vellalar Christian', 'Vellalar Christian subcaste', 'no', 'B.Com', 'B.Com Graduate', 'Advocate', 'Advocate Details', '₹20 Lakhs+', 'Government Service', 'Thanjavur', 'Thanjavur', 'Hi, I am Naveen. I have completed my B.Com and am currently working as a Advocate at Government Service in Thanjavur. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'upper_middle_class', 'Retired Employee', 'Homemaker', false, true, true, 100, NOW() - INTERVAL '3 days')
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
VALUES ('00000000-0000-4000-a000-000000000168', 'TM000360', 'Divya Swamy', 'female', '1989-10-02', 158, 'never_married', 'Hindu', 'Yadav', NULL, 'yes', 'B.Ed', 'B.Ed Graduate', 'Pharmacist', 'Pharmacist Details', '₹3 Lakhs - ₹5 Lakhs', 'Self Employed', 'Madurai', 'Madurai', 'Hi, I am Divya. I have completed my B.Ed and am currently working as a Pharmacist at Self Employed in Madurai. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'upper_middle_class', 'Retired Employee', 'Homemaker', true, false, true, 100, NOW() - INTERVAL '6 days')
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
VALUES ('00000000-0000-4000-a000-000000000169', 'TM000361', 'Muthu Lingam', 'male', '2004-09-17', 170, 'never_married', 'Hindu', 'Vanniyar', NULL, 'no', 'M.Sc', 'M.Sc Graduate', 'Software Engineer', 'Software Engineer Details', '₹7 Lakhs - ₹10 Lakhs', 'Cognizant', 'Madurai', 'Madurai', 'Hi, I am Muthu. I have completed my M.Sc and am currently working as a Software Engineer at Cognizant in Madurai. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'joint', 'rich', 'Retired Employee', 'Homemaker', false, true, true, 100, NOW() - INTERVAL '6 days')
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
VALUES ('00000000-0000-4000-a000-00000000016a', 'TM000362', 'Megala Mani', 'female', '1995-02-05', 157, 'never_married', 'Muslim', 'Shia Muslim', 'Shia Muslim subcaste', 'yes', 'B.E. / B.Tech', 'B.E. / B.Tech Graduate', 'Police Officer', 'Police Officer Details', '₹20 Lakhs+', 'Zoho', 'Kanchipuram', 'Kanchipuram', 'Hi, I am Megala. I have completed my B.E. / B.Tech and am currently working as a Police Officer at Zoho in Kanchipuram. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'upper_middle_class', 'Retired Employee', 'Homemaker', true, true, true, 100, NOW() - INTERVAL '2 days')
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
VALUES ('00000000-0000-4000-a000-00000000016b', 'TM000363', 'Selvam Shankar', 'male', '2003-03-11', 184, 'never_married', 'Hindu', 'Naicker', NULL, 'no', 'B.Sc', 'B.Sc Graduate', 'HR Specialist', 'HR Specialist Details', '₹10 Lakhs - ₹15 Lakhs', 'Wipro', 'Tirunelveli', 'Tirunelveli', 'Hi, I am Selvam. I have completed my B.Sc and am currently working as a HR Specialist at Wipro in Tirunelveli. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'upper_middle_class', 'Retired Employee', 'Homemaker', true, false, true, 100, NOW() - INTERVAL '3 days')
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
VALUES ('00000000-0000-4000-a000-00000000016c', 'TM000364', 'Pooja Swamy', 'female', '2001-07-23', 169, 'never_married', 'Hindu', 'Mudaliar', 'Mudaliar subcaste', 'yes', 'B.E. / B.Tech', 'B.E. / B.Tech Graduate', 'Dentist', 'Dentist Details', '₹7 Lakhs - ₹10 Lakhs', 'TCS', 'Tiruchirappalli', 'Trichy', 'Hi, I am Pooja. I have completed my B.E. / B.Tech and am currently working as a Dentist at TCS in Tiruchirappalli. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'rich', 'Retired Employee', 'Homemaker', false, false, true, 100, NOW() - INTERVAL '0 days')
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
VALUES ('00000000-0000-4000-a000-00000000016d', 'TM000365', 'Bala Pandian', 'male', '2003-10-09', 179, 'never_married', 'Hindu', 'Vishwakarma', NULL, 'no', 'B.Sc', 'B.Sc Graduate', 'School Teacher', 'School Teacher Details', '₹10 Lakhs - ₹15 Lakhs', 'Government Service', 'Tirunelveli', 'Tirunelveli', 'Hi, I am Bala. I have completed my B.Sc and am currently working as a School Teacher at Government Service in Tirunelveli. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'middle_class', 'Retired Employee', 'Homemaker', true, false, true, 100, NOW() - INTERVAL '9 days')
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
VALUES ('00000000-0000-4000-a000-00000000016e', 'TM000366', 'Gowri Pandian', 'female', '1992-03-05', 161, 'never_married', 'Hindu', 'Vellalar', 'Vellalar subcaste', 'no', 'M.C.A', 'M.C.A Graduate', 'Mechanical Engineer', 'Mechanical Engineer Details', '₹3 Lakhs - ₹5 Lakhs', 'Infosys', 'Kanchipuram', 'Kanchipuram', 'Hi, I am Gowri. I have completed my M.C.A and am currently working as a Mechanical Engineer at Infosys in Kanchipuram. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'joint', 'rich', 'Retired Employee', 'Homemaker', false, false, true, 100, NOW() - INTERVAL '8 days')
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
VALUES ('00000000-0000-4000-a000-00000000016f', 'TM000367', 'Ramesh Naicker', 'male', '1989-09-22', 181, 'never_married', 'Muslim', 'Rawther', 'Rawther subcaste', 'no', 'Ph.D', 'Ph.D Graduate', 'Mechanical Engineer', 'Mechanical Engineer Details', '₹20 Lakhs+', 'Self Employed', 'Thoothukudi', 'Tuticorin', 'Hi, I am Ramesh. I have completed my Ph.D and am currently working as a Mechanical Engineer at Self Employed in Thoothukudi. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'rich', 'Retired Employee', 'Homemaker', false, false, true, 100, NOW() - INTERVAL '1 days')
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
VALUES ('00000000-0000-4000-a000-000000000170', 'TM000368', 'Megala Naicker', 'female', '1996-06-25', 154, 'never_married', 'Hindu', 'Gounder', 'Gounder subcaste', 'no', 'M.Sc', 'M.Sc Graduate', 'Doctor', 'Doctor Details', '₹7 Lakhs - ₹10 Lakhs', 'Government Service', 'Tirunelveli', 'Tirunelveli', 'Hi, I am Megala. I have completed my M.Sc and am currently working as a Doctor at Government Service in Tirunelveli. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'joint', 'middle_class', 'Retired Employee', 'Homemaker', false, false, true, 100, NOW() - INTERVAL '1 days')
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
VALUES ('00000000-0000-4000-a000-000000000171', 'TM000369', 'Siddharth Devan', 'male', '1990-01-10', 166, 'divorced', 'Hindu', 'Naicker', NULL, 'no', 'M.A', 'M.A Graduate', 'Auditor', 'Auditor Details', '₹15 Lakhs - ₹20 Lakhs', 'Government Service', 'Tiruppur', 'Tiruppur', 'Hi, I am Siddharth. I have completed my M.A and am currently working as a Auditor at Government Service in Tiruppur. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'joint', 'upper_middle_class', 'Retired Employee', 'Homemaker', true, false, true, 100, NOW() - INTERVAL '1 days')
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
VALUES ('00000000-0000-4000-a000-000000000172', 'TM000370', 'Janani Samy', 'female', '1991-08-18', 173, 'never_married', 'Hindu', 'Brahmin - Iyengar', NULL, 'no', 'B.Sc', 'B.Sc Graduate', 'Pharmacist', 'Pharmacist Details', '₹3 Lakhs - ₹5 Lakhs', 'Accenture', 'Tirunelveli', 'Tirunelveli', 'Hi, I am Janani. I have completed my B.Sc and am currently working as a Pharmacist at Accenture in Tirunelveli. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'upper_middle_class', 'Retired Employee', 'Homemaker', false, false, true, 100, NOW() - INTERVAL '1 days')
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
VALUES ('00000000-0000-4000-a000-000000000173', 'TM000371', 'Sakthi Raman', 'male', '1997-04-16', 172, 'never_married', 'Hindu', 'Vanniyar', 'Vanniyar subcaste', 'yes', 'M.A', 'M.A Graduate', 'Architect', 'Architect Details', '₹10 Lakhs - ₹15 Lakhs', 'Private Practice', 'Madurai', 'Madurai', 'Hi, I am Sakthi. I have completed my M.A and am currently working as a Architect at Private Practice in Madurai. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'upper_middle_class', 'Retired Employee', 'Homemaker', true, true, true, 100, NOW() - INTERVAL '1 days')
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
VALUES ('00000000-0000-4000-a000-000000000174', 'TM000372', 'Radha Gopal', 'female', '2001-06-21', 155, 'never_married', 'Hindu', 'Pillai', 'Pillai subcaste', 'no', 'B.A', 'B.A Graduate', 'Pharmacist', 'Pharmacist Details', '₹10 Lakhs - ₹15 Lakhs', 'Self Employed', 'Madurai', 'Madurai', 'Hi, I am Radha. I have completed my B.A and am currently working as a Pharmacist at Self Employed in Madurai. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'joint', 'middle_class', 'Retired Employee', 'Homemaker', true, false, true, 100, NOW() - INTERVAL '4 days')
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
VALUES ('00000000-0000-4000-a000-000000000175', 'TM000373', 'Kabilan Raj', 'male', '1993-06-17', 164, 'never_married', 'Christian', 'Vellalar Christian', NULL, 'no', 'M.B.A', 'M.B.A Graduate', 'Mechanical Engineer', 'Mechanical Engineer Details', '₹20 Lakhs+', 'Government Service', 'Thanjavur', 'Thanjavur', 'Hi, I am Kabilan. I have completed my M.B.A and am currently working as a Mechanical Engineer at Government Service in Thanjavur. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'rich', 'Retired Employee', 'Homemaker', true, false, true, 100, NOW() - INTERVAL '10 days')
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
VALUES ('00000000-0000-4000-a000-000000000176', 'TM000374', 'Yazhini Mani', 'female', '2004-04-05', 153, 'never_married', 'Muslim', 'Rawther', 'Rawther subcaste', 'yes', 'B.Ed', 'B.Ed Graduate', 'Advocate', 'Advocate Details', '₹20 Lakhs+', 'Private Practice', 'Kanchipuram', 'Kanchipuram', 'Hi, I am Yazhini. I have completed my B.Ed and am currently working as a Advocate at Private Practice in Kanchipuram. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'middle_class', 'Retired Employee', 'Homemaker', true, false, true, 100, NOW() - INTERVAL '0 days')
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
VALUES ('00000000-0000-4000-a000-000000000177', 'TM000375', 'Siva Pandian', 'male', '1989-01-24', 184, 'never_married', 'Hindu', 'Adi Dravida', 'Adi Dravida subcaste', 'no', 'B.Sc', 'B.Sc Graduate', 'Government Officer', 'Government Officer Details', '₹3 Lakhs - ₹5 Lakhs', 'Self Employed', 'Tiruppur', 'Tiruppur', 'Hi, I am Siva. I have completed my B.Sc and am currently working as a Government Officer at Self Employed in Tiruppur. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'joint', 'upper_middle_class', 'Retired Employee', 'Homemaker', true, false, true, 100, NOW() - INTERVAL '6 days')
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
VALUES ('00000000-0000-4000-a000-000000000178', 'TM000376', 'Malathi Nathan', 'female', '1988-02-08', 155, 'divorced', 'Hindu', 'Chettiar', NULL, 'yes', 'M.B.A', 'M.B.A Graduate', 'HR Specialist', 'HR Specialist Details', '₹3 Lakhs - ₹5 Lakhs', 'Accenture', 'Coimbatore', 'Coimbatore', 'Hi, I am Malathi. I have completed my M.B.A and am currently working as a HR Specialist at Accenture in Coimbatore. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'joint', 'rich', 'Retired Employee', 'Homemaker', false, true, true, 100, NOW() - INTERVAL '9 days')
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
VALUES ('00000000-0000-4000-a000-000000000179', 'TM000377', 'Ajith Raman', 'male', '1998-07-27', 170, 'divorced', 'Hindu', 'Devendra Kula Vellalar', 'Devendra Kula Vellalar subcaste', 'no', 'Ph.D', 'Ph.D Graduate', 'College Professor', 'College Professor Details', '₹15 Lakhs - ₹20 Lakhs', 'Government Service', 'Kanchipuram', 'Kanchipuram', 'Hi, I am Ajith. I have completed my Ph.D and am currently working as a College Professor at Government Service in Kanchipuram. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'upper_middle_class', 'Retired Employee', 'Homemaker', false, false, true, 100, NOW() - INTERVAL '8 days')
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
VALUES ('00000000-0000-4000-a000-00000000017a', 'TM000378', 'Rekha Selvan', 'female', '1992-06-09', 163, 'never_married', 'Muslim', 'Labbai', NULL, 'yes', 'M.B.B.S', 'M.B.B.S Graduate', 'Police Officer', 'Police Officer Details', '₹5 Lakhs - ₹7 Lakhs', 'Government Service', 'Thanjavur', 'Thanjavur', 'Hi, I am Rekha. I have completed my M.B.B.S and am currently working as a Police Officer at Government Service in Thanjavur. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'joint', 'rich', 'Retired Employee', 'Homemaker', false, false, true, 100, NOW() - INTERVAL '10 days')
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
VALUES ('00000000-0000-4000-a000-00000000017b', 'TM000379', 'Sundar Swamy', 'male', '1997-11-22', 170, 'never_married', 'Hindu', 'Chettiar', 'Chettiar subcaste', 'yes', 'M.Sc', 'M.Sc Graduate', 'Pharmacist', 'Pharmacist Details', '₹10 Lakhs - ₹15 Lakhs', 'TCS', 'Tiruchirappalli', 'Trichy', 'Hi, I am Sundar. I have completed my M.Sc and am currently working as a Pharmacist at TCS in Tiruchirappalli. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'rich', 'Retired Employee', 'Homemaker', false, true, true, 100, NOW() - INTERVAL '8 days')
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
VALUES ('00000000-0000-4000-a000-00000000017c', 'TM000380', 'Gowri Gopal', 'female', '2001-11-11', 172, 'never_married', 'Hindu', 'Agamudayar', 'Agamudayar subcaste', 'no', 'B.A', 'B.A Graduate', 'College Professor', 'College Professor Details', '₹3 Lakhs - ₹5 Lakhs', 'Infosys', 'Thoothukudi', 'Tuticorin', 'Hi, I am Gowri. I have completed my B.A and am currently working as a College Professor at Infosys in Thoothukudi. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'joint', 'upper_middle_class', 'Retired Employee', 'Homemaker', true, false, true, 100, NOW() - INTERVAL '1 days')
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
VALUES ('00000000-0000-4000-a000-00000000017d', 'TM000381', 'Chinnasamy Balan', 'male', '2003-09-17', 180, 'never_married', 'Hindu', 'Vanniyar', 'Vanniyar subcaste', 'no', 'M.C.A', 'M.C.A Graduate', 'Advocate', 'Advocate Details', '₹7 Lakhs - ₹10 Lakhs', 'Infosys', 'Tiruppur', 'Tiruppur', 'Hi, I am Chinnasamy. I have completed my M.C.A and am currently working as a Advocate at Infosys in Tiruppur. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'joint', 'middle_class', 'Retired Employee', 'Homemaker', true, true, true, 100, NOW() - INTERVAL '4 days')
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
VALUES ('00000000-0000-4000-a000-00000000017e', 'TM000382', 'Geetha Moorthy', 'female', '2002-12-12', 168, 'never_married', 'Hindu', 'Gounder', NULL, 'no', 'M.Sc', 'M.Sc Graduate', 'Government Officer', 'Government Officer Details', '₹10 Lakhs - ₹15 Lakhs', 'Government Service', 'Tiruchirappalli', 'Trichy', 'Hi, I am Geetha. I have completed my M.Sc and am currently working as a Government Officer at Government Service in Tiruchirappalli. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'joint', 'upper_middle_class', 'Retired Employee', 'Homemaker', true, true, true, 100, NOW() - INTERVAL '4 days')
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
VALUES ('00000000-0000-4000-a000-00000000017f', 'TM000383', 'Arun Nathan', 'male', '1995-10-27', 188, 'never_married', 'Hindu', 'Kallar', NULL, 'yes', 'M.Com', 'M.Com Graduate', 'Dentist', 'Dentist Details', '₹7 Lakhs - ₹10 Lakhs', 'Infosys', 'Vellore', 'Vellore', 'Hi, I am Arun. I have completed my M.Com and am currently working as a Dentist at Infosys in Vellore. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'upper_middle_class', 'Retired Employee', 'Homemaker', false, false, true, 100, NOW() - INTERVAL '2 days')
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
VALUES ('00000000-0000-4000-a000-000000000180', 'TM000384', 'Vidya Selvan', 'female', '1989-05-21', 157, 'divorced', 'Hindu', 'Kallar', NULL, 'yes', 'M.C.A', 'M.C.A Graduate', 'Mechanical Engineer', 'Mechanical Engineer Details', '₹5 Lakhs - ₹7 Lakhs', 'Zoho', 'Kanchipuram', 'Kanchipuram', 'Hi, I am Vidya. I have completed my M.C.A and am currently working as a Mechanical Engineer at Zoho in Kanchipuram. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'joint', 'middle_class', 'Retired Employee', 'Homemaker', true, true, true, 100, NOW() - INTERVAL '6 days')
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
VALUES ('00000000-0000-4000-a000-000000000181', 'TM000385', 'Rajesh Naicker', 'male', '1992-05-03', 163, 'never_married', 'Hindu', 'Pillai', NULL, 'no', 'M.A', 'M.A Graduate', 'Architect', 'Architect Details', '₹15 Lakhs - ₹20 Lakhs', 'Self Employed', 'Chennai', 'Chennai', 'Hi, I am Rajesh. I have completed my M.A and am currently working as a Architect at Self Employed in Chennai. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'rich', 'Retired Employee', 'Homemaker', false, false, true, 100, NOW() - INTERVAL '2 days')
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
VALUES ('00000000-0000-4000-a000-000000000182', 'TM000386', 'Malarvizhi Gopal', 'female', '1992-04-03', 175, 'never_married', 'Hindu', 'Naidu', 'Naidu subcaste', 'no', 'B.Ed', 'B.Ed Graduate', 'Bank Manager', 'Bank Manager Details', '₹20 Lakhs+', 'Cognizant', 'Madurai', 'Madurai', 'Hi, I am Malarvizhi. I have completed my B.Ed and am currently working as a Bank Manager at Cognizant in Madurai. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'rich', 'Retired Employee', 'Homemaker', true, false, true, 100, NOW() - INTERVAL '4 days')
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
VALUES ('00000000-0000-4000-a000-000000000183', 'TM000387', 'Jeeva Nathan', 'male', '2004-01-24', 170, 'never_married', 'Hindu', 'Devendra Kula Vellalar', NULL, 'no', 'M.A', 'M.A Graduate', 'School Teacher', 'School Teacher Details', '₹7 Lakhs - ₹10 Lakhs', 'Self Employed', 'Salem', 'Salem', 'Hi, I am Jeeva. I have completed my M.A and am currently working as a School Teacher at Self Employed in Salem. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'rich', 'Retired Employee', 'Homemaker', false, true, true, 100, NOW() - INTERVAL '5 days')
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
VALUES ('00000000-0000-4000-a000-000000000184', 'TM000388', 'Geetha Gopal', 'female', '1996-05-13', 151, 'divorced', 'Hindu', 'Gounder', 'Gounder subcaste', 'no', 'M.Com', 'M.Com Graduate', 'Pharmacist', 'Pharmacist Details', '₹15 Lakhs - ₹20 Lakhs', 'Accenture', 'Chennai', 'Chennai', 'Hi, I am Geetha. I have completed my M.Com and am currently working as a Pharmacist at Accenture in Chennai. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'middle_class', 'Retired Employee', 'Homemaker', true, false, true, 100, NOW() - INTERVAL '5 days')
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
VALUES ('00000000-0000-4000-a000-000000000185', 'TM000389', 'Muthu Moorthy', 'male', '1998-12-03', 174, 'never_married', 'Hindu', 'Chettiar', NULL, 'no', 'Ph.D', 'Ph.D Graduate', 'College Professor', 'College Professor Details', '₹20 Lakhs+', 'Infosys', 'Tirunelveli', 'Tirunelveli', 'Hi, I am Muthu. I have completed my Ph.D and am currently working as a College Professor at Infosys in Tirunelveli. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'rich', 'Retired Employee', 'Homemaker', true, true, true, 100, NOW() - INTERVAL '3 days')
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
VALUES ('00000000-0000-4000-a000-000000000186', 'TM000390', 'Radha Moorthy', 'female', '2002-05-06', 162, 'never_married', 'Hindu', 'Vanniyar', NULL, 'no', 'M.B.B.S', 'M.B.B.S Graduate', 'Police Officer', 'Police Officer Details', '₹10 Lakhs - ₹15 Lakhs', 'Zoho', 'Salem', 'Salem', 'Hi, I am Radha. I have completed my M.B.B.S and am currently working as a Police Officer at Zoho in Salem. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'upper_middle_class', 'Retired Employee', 'Homemaker', true, true, true, 100, NOW() - INTERVAL '0 days')
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
VALUES ('00000000-0000-4000-a000-000000000187', 'TM000391', 'Selvam Velan', 'male', '1998-09-06', 188, 'never_married', 'Hindu', 'Naicker', 'Naicker subcaste', 'no', 'B.A', 'B.A Graduate', 'HR Specialist', 'HR Specialist Details', '₹10 Lakhs - ₹15 Lakhs', 'Accenture', 'Tiruppur', 'Tiruppur', 'Hi, I am Selvam. I have completed my B.A and am currently working as a HR Specialist at Accenture in Tiruppur. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'middle_class', 'Retired Employee', 'Homemaker', true, false, true, 100, NOW() - INTERVAL '2 days')
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
VALUES ('00000000-0000-4000-a000-000000000188', 'TM000392', 'Sowmya Naicker', 'female', '2002-03-14', 150, 'never_married', 'Hindu', 'Vanniyar', 'Vanniyar subcaste', 'no', 'B.E. / B.Tech', 'B.E. / B.Tech Graduate', 'School Teacher', 'School Teacher Details', '₹15 Lakhs - ₹20 Lakhs', 'Cognizant', 'Tiruppur', 'Tiruppur', 'Hi, I am Sowmya. I have completed my B.E. / B.Tech and am currently working as a School Teacher at Cognizant in Tiruppur. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'joint', 'middle_class', 'Retired Employee', 'Homemaker', false, false, true, 100, NOW() - INTERVAL '7 days')
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
VALUES ('00000000-0000-4000-a000-000000000189', 'TM000393', 'Murugan Samy', 'male', '2005-09-14', 177, 'never_married', 'Hindu', 'Adi Dravida', NULL, 'no', 'M.Com', 'M.Com Graduate', 'Police Officer', 'Police Officer Details', '₹10 Lakhs - ₹15 Lakhs', 'Zoho', 'Coimbatore', 'Coimbatore', 'Hi, I am Murugan. I have completed my M.Com and am currently working as a Police Officer at Zoho in Coimbatore. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'rich', 'Retired Employee', 'Homemaker', true, false, true, 100, NOW() - INTERVAL '2 days')
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
VALUES ('00000000-0000-4000-a000-00000000018a', 'TM000394', 'Anitha Selvan', 'female', '1998-11-01', 168, 'never_married', 'Muslim', 'Shia Muslim', 'Shia Muslim subcaste', 'no', 'M.B.B.S', 'M.B.B.S Graduate', 'Auditor', 'Auditor Details', '₹3 Lakhs - ₹5 Lakhs', 'Accenture', 'Erode', 'Erode', 'Hi, I am Anitha. I have completed my M.B.B.S and am currently working as a Auditor at Accenture in Erode. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'joint', 'upper_middle_class', 'Retired Employee', 'Homemaker', false, true, true, 100, NOW() - INTERVAL '7 days')
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
VALUES ('00000000-0000-4000-a000-00000000018b', 'TM000395', 'Anbarasan Moorthy', 'male', '2004-03-09', 168, 'divorced', 'Hindu', 'Sengunthar', NULL, 'yes', 'B.Ed', 'B.Ed Graduate', 'Government Officer', 'Government Officer Details', '₹7 Lakhs - ₹10 Lakhs', 'Government Service', 'Coimbatore', 'Coimbatore', 'Hi, I am Anbarasan. I have completed my B.Ed and am currently working as a Government Officer at Government Service in Coimbatore. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'middle_class', 'Retired Employee', 'Homemaker', true, true, true, 100, NOW() - INTERVAL '8 days')
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
VALUES ('00000000-0000-4000-a000-00000000018c', 'TM000396', 'Priya Samy', 'female', '1992-11-06', 159, 'never_married', 'Hindu', 'Mudaliar', NULL, 'no', 'B.Com', 'B.Com Graduate', 'Dentist', 'Dentist Details', '₹15 Lakhs - ₹20 Lakhs', 'Wipro', 'Chennai', 'Chennai', 'Hi, I am Priya. I have completed my B.Com and am currently working as a Dentist at Wipro in Chennai. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'upper_middle_class', 'Retired Employee', 'Homemaker', true, false, true, 100, NOW() - INTERVAL '8 days')
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
VALUES ('00000000-0000-4000-a000-00000000018d', 'TM000397', 'Dinesh Nathan', 'male', '1991-02-12', 185, 'never_married', 'Hindu', 'Vishwakarma', NULL, 'no', 'B.Ed', 'B.Ed Graduate', 'Bank Manager', 'Bank Manager Details', '₹7 Lakhs - ₹10 Lakhs', 'TCS', 'Chennai', 'Chennai', 'Hi, I am Dinesh. I have completed my B.Ed and am currently working as a Bank Manager at TCS in Chennai. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'rich', 'Retired Employee', 'Homemaker', true, false, true, 100, NOW() - INTERVAL '3 days')
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
VALUES ('00000000-0000-4000-a000-00000000018e', 'TM000398', 'Divya Moorthy', 'female', '2004-11-15', 165, 'never_married', 'Hindu', 'Vishwakarma', NULL, 'no', 'B.Com', 'B.Com Graduate', 'HR Specialist', 'HR Specialist Details', '₹3 Lakhs - ₹5 Lakhs', 'TCS', 'Thoothukudi', 'Tuticorin', 'Hi, I am Divya. I have completed my B.Com and am currently working as a HR Specialist at TCS in Thoothukudi. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'rich', 'Retired Employee', 'Homemaker', true, true, true, 100, NOW() - INTERVAL '0 days')
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
VALUES ('00000000-0000-4000-a000-00000000018f', 'TM000399', 'Viswanathan Murthy', 'male', '1988-06-05', 170, 'never_married', 'Hindu', 'Naidu', 'Naidu subcaste', 'no', 'B.Sc', 'B.Sc Graduate', 'Doctor', 'Doctor Details', '₹15 Lakhs - ₹20 Lakhs', 'Cognizant', 'Thanjavur', 'Thanjavur', 'Hi, I am Viswanathan. I have completed my B.Sc and am currently working as a Doctor at Cognizant in Thanjavur. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'upper_middle_class', 'Retired Employee', 'Homemaker', true, false, true, 100, NOW() - INTERVAL '10 days')
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
VALUES ('00000000-0000-4000-a000-000000000190', 'TM000400', 'Keerthana Velan', 'female', '1989-03-12', 174, 'never_married', 'Hindu', 'Agamudayar', NULL, 'no', 'B.E. / B.Tech', 'B.E. / B.Tech Graduate', 'HR Specialist', 'HR Specialist Details', '₹3 Lakhs - ₹5 Lakhs', 'Cognizant', 'Chennai', 'Chennai', 'Hi, I am Keerthana. I have completed my B.E. / B.Tech and am currently working as a HR Specialist at Cognizant in Chennai. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'rich', 'Retired Employee', 'Homemaker', true, false, true, 100, NOW() - INTERVAL '2 days')
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
VALUES ('00000000-0000-4000-a000-000000000191', 'TM000401', 'Deepak Moorthy', 'male', '1993-09-21', 178, 'divorced', 'Muslim', 'Marakayar', 'Marakayar subcaste', 'no', 'B.A', 'B.A Graduate', 'Civil Engineer', 'Civil Engineer Details', '₹3 Lakhs - ₹5 Lakhs', 'HCL', 'Tiruppur', 'Tiruppur', 'Hi, I am Deepak. I have completed my B.A and am currently working as a Civil Engineer at HCL in Tiruppur. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'middle_class', 'Retired Employee', 'Homemaker', true, false, true, 100, NOW() - INTERVAL '6 days')
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
VALUES ('00000000-0000-4000-a000-000000000192', 'TM000402', 'Shanthi Gopal', 'female', '2003-08-14', 164, 'never_married', 'Hindu', 'Adi Dravida', NULL, 'no', 'B.Sc', 'B.Sc Graduate', 'Software Engineer', 'Software Engineer Details', '₹7 Lakhs - ₹10 Lakhs', 'Accenture', 'Tiruchirappalli', 'Trichy', 'Hi, I am Shanthi. I have completed my B.Sc and am currently working as a Software Engineer at Accenture in Tiruchirappalli. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'rich', 'Retired Employee', 'Homemaker', false, false, true, 100, NOW() - INTERVAL '3 days')
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
VALUES ('00000000-0000-4000-a000-000000000193', 'TM000403', 'Mohan Raman', 'male', '2005-09-03', 167, 'never_married', 'Hindu', 'Vellalar', 'Vellalar subcaste', 'no', 'B.E. / B.Tech', 'B.E. / B.Tech Graduate', 'Doctor', 'Doctor Details', '₹5 Lakhs - ₹7 Lakhs', 'Accenture', 'Salem', 'Salem', 'Hi, I am Mohan. I have completed my B.E. / B.Tech and am currently working as a Doctor at Accenture in Salem. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'middle_class', 'Retired Employee', 'Homemaker', true, false, true, 100, NOW() - INTERVAL '1 days')
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
VALUES ('00000000-0000-4000-a000-000000000194', 'TM000404', 'Archana Kumar', 'female', '1991-07-03', 175, 'never_married', 'Hindu', 'Nadar', NULL, 'no', 'M.C.A', 'M.C.A Graduate', 'Mechanical Engineer', 'Mechanical Engineer Details', '₹3 Lakhs - ₹5 Lakhs', 'Government Service', 'Tiruchirappalli', 'Trichy', 'Hi, I am Archana. I have completed my M.C.A and am currently working as a Mechanical Engineer at Government Service in Tiruchirappalli. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'middle_class', 'Retired Employee', 'Homemaker', false, false, true, 100, NOW() - INTERVAL '2 days')
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
VALUES ('00000000-0000-4000-a000-000000000195', 'TM000405', 'Naveen Mani', 'male', '2005-09-17', 171, 'never_married', 'Hindu', 'Arunthathiyar', NULL, 'no', 'B.Ed', 'B.Ed Graduate', 'Auditor', 'Auditor Details', '₹10 Lakhs - ₹15 Lakhs', 'Zoho', 'Kanchipuram', 'Kanchipuram', 'Hi, I am Naveen. I have completed my B.Ed and am currently working as a Auditor at Zoho in Kanchipuram. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'rich', 'Retired Employee', 'Homemaker', true, false, true, 100, NOW() - INTERVAL '4 days')
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
VALUES ('00000000-0000-4000-a000-000000000196', 'TM000406', 'Uma Samy', 'female', '1989-08-16', 154, 'never_married', 'Hindu', 'Gounder', 'Gounder subcaste', 'no', 'B.Com', 'B.Com Graduate', 'School Teacher', 'School Teacher Details', '₹3 Lakhs - ₹5 Lakhs', 'HCL', 'Chennai', 'Chennai', 'Hi, I am Uma. I have completed my B.Com and am currently working as a School Teacher at HCL in Chennai. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'middle_class', 'Retired Employee', 'Homemaker', true, false, true, 100, NOW() - INTERVAL '1 days')
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
VALUES ('00000000-0000-4000-a000-000000000197', 'TM000407', 'Prabhu Mani', 'male', '1998-08-16', 171, 'divorced', 'Hindu', 'Maravar', NULL, 'no', 'M.B.B.S', 'M.B.B.S Graduate', 'Police Officer', 'Police Officer Details', '₹10 Lakhs - ₹15 Lakhs', 'Zoho', 'Thanjavur', 'Thanjavur', 'Hi, I am Prabhu. I have completed my M.B.B.S and am currently working as a Police Officer at Zoho in Thanjavur. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'joint', 'rich', 'Retired Employee', 'Homemaker', false, true, true, 100, NOW() - INTERVAL '0 days')
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
VALUES ('00000000-0000-4000-a000-000000000198', 'TM000408', 'Parvathi Raj', 'female', '2003-07-07', 169, 'never_married', 'Hindu', 'Naicker', 'Naicker subcaste', 'no', 'B.Com', 'B.Com Graduate', 'Software Engineer', 'Software Engineer Details', '₹5 Lakhs - ₹7 Lakhs', 'Wipro', 'Tiruchirappalli', 'Trichy', 'Hi, I am Parvathi. I have completed my B.Com and am currently working as a Software Engineer at Wipro in Tiruchirappalli. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'upper_middle_class', 'Retired Employee', 'Homemaker', true, false, true, 100, NOW() - INTERVAL '9 days')
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
VALUES ('00000000-0000-4000-a000-000000000199', 'TM000409', 'Sathish Naicker', 'male', '1998-06-26', 179, 'never_married', 'Hindu', 'Naicker', NULL, 'no', 'B.E. / B.Tech', 'B.E. / B.Tech Graduate', 'Mechanical Engineer', 'Mechanical Engineer Details', '₹3 Lakhs - ₹5 Lakhs', 'Zoho', 'Erode', 'Erode', 'Hi, I am Sathish. I have completed my B.E. / B.Tech and am currently working as a Mechanical Engineer at Zoho in Erode. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'rich', 'Retired Employee', 'Homemaker', false, true, true, 100, NOW() - INTERVAL '10 days')
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
VALUES ('00000000-0000-4000-a000-00000000019a', 'TM000410', 'Radha Lingam', 'female', '2004-08-10', 152, 'never_married', 'Hindu', 'Gounder', NULL, 'yes', 'M.A', 'M.A Graduate', 'Auditor', 'Auditor Details', '₹7 Lakhs - ₹10 Lakhs', 'Accenture', 'Tiruppur', 'Tiruppur', 'Hi, I am Radha. I have completed my M.A and am currently working as a Auditor at Accenture in Tiruppur. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'rich', 'Retired Employee', 'Homemaker', true, true, true, 100, NOW() - INTERVAL '5 days')
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
VALUES ('00000000-0000-4000-a000-00000000019b', 'TM000411', 'Ramesh Pandian', 'male', '1993-11-24', 165, 'never_married', 'Christian', 'Pentecostal', NULL, 'no', 'B.Ed', 'B.Ed Graduate', 'Bank Manager', 'Bank Manager Details', '₹5 Lakhs - ₹7 Lakhs', 'Wipro', 'Chennai', 'Chennai', 'Hi, I am Ramesh. I have completed my B.Ed and am currently working as a Bank Manager at Wipro in Chennai. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'upper_middle_class', 'Retired Employee', 'Homemaker', true, true, true, 100, NOW() - INTERVAL '6 days')
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
VALUES ('00000000-0000-4000-a000-00000000019c', 'TM000412', 'Rekha Naicker', 'female', '1990-11-10', 154, 'divorced', 'Hindu', 'Brahmin - Iyengar', NULL, 'no', 'M.Sc', 'M.Sc Graduate', 'Architect', 'Architect Details', '₹20 Lakhs+', 'Private Practice', 'Thanjavur', 'Thanjavur', 'Hi, I am Rekha. I have completed my M.Sc and am currently working as a Architect at Private Practice in Thanjavur. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'joint', 'middle_class', 'Retired Employee', 'Homemaker', true, false, true, 100, NOW() - INTERVAL '0 days')
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
VALUES ('00000000-0000-4000-a000-00000000019d', 'TM000413', 'Madhavan Swamy', 'male', '2000-04-09', 175, 'divorced', 'Hindu', 'Vishwakarma', 'Vishwakarma subcaste', 'no', 'M.Sc', 'M.Sc Graduate', 'Civil Engineer', 'Civil Engineer Details', '₹7 Lakhs - ₹10 Lakhs', 'Wipro', 'Madurai', 'Madurai', 'Hi, I am Madhavan. I have completed my M.Sc and am currently working as a Civil Engineer at Wipro in Madurai. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'upper_middle_class', 'Retired Employee', 'Homemaker', false, true, true, 100, NOW() - INTERVAL '4 days')
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
VALUES ('00000000-0000-4000-a000-00000000019e', 'TM000414', 'Pooja Gopal', 'female', '2000-04-17', 159, 'never_married', 'Hindu', 'Mudaliar', NULL, 'no', 'M.A', 'M.A Graduate', 'Police Officer', 'Police Officer Details', '₹10 Lakhs - ₹15 Lakhs', 'Zoho', 'Madurai', 'Madurai', 'Hi, I am Pooja. I have completed my M.A and am currently working as a Police Officer at Zoho in Madurai. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'joint', 'middle_class', 'Retired Employee', 'Homemaker', false, false, true, 100, NOW() - INTERVAL '7 days')
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
VALUES ('00000000-0000-4000-a000-00000000019f', 'TM000415', 'Madhavan Sundaram', 'male', '1990-03-01', 184, 'divorced', 'Hindu', 'Maravar', 'Maravar subcaste', 'no', 'M.Sc', 'M.Sc Graduate', 'Mechanical Engineer', 'Mechanical Engineer Details', '₹3 Lakhs - ₹5 Lakhs', 'HCL', 'Coimbatore', 'Coimbatore', 'Hi, I am Madhavan. I have completed my M.Sc and am currently working as a Mechanical Engineer at HCL in Coimbatore. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'middle_class', 'Retired Employee', 'Homemaker', true, false, true, 100, NOW() - INTERVAL '5 days')
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
VALUES ('00000000-0000-4000-a000-0000000001a0', 'TM000416', 'Uma Raj', 'female', '1996-12-12', 172, 'never_married', 'Hindu', 'Arunthathiyar', 'Arunthathiyar subcaste', 'no', 'M.A', 'M.A Graduate', 'HR Specialist', 'HR Specialist Details', '₹5 Lakhs - ₹7 Lakhs', 'Accenture', 'Madurai', 'Madurai', 'Hi, I am Uma. I have completed my M.A and am currently working as a HR Specialist at Accenture in Madurai. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'upper_middle_class', 'Retired Employee', 'Homemaker', false, true, true, 100, NOW() - INTERVAL '7 days')
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
VALUES ('00000000-0000-4000-a000-0000000001a1', 'TM000417', 'Karthik Sundaram', 'male', '1997-07-01', 164, 'never_married', 'Hindu', 'Brahmin - Iyer', NULL, 'no', 'B.Sc', 'B.Sc Graduate', 'Doctor', 'Doctor Details', '₹3 Lakhs - ₹5 Lakhs', 'Private Practice', 'Thoothukudi', 'Tuticorin', 'Hi, I am Karthik. I have completed my B.Sc and am currently working as a Doctor at Private Practice in Thoothukudi. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'middle_class', 'Retired Employee', 'Homemaker', true, false, true, 100, NOW() - INTERVAL '0 days')
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
VALUES ('00000000-0000-4000-a000-0000000001a2', 'TM000418', 'Kayalvizhi Shankar', 'female', '2003-10-22', 166, 'divorced', 'Hindu', 'Mudaliar', NULL, 'no', 'B.E. / B.Tech', 'B.E. / B.Tech Graduate', 'Mechanical Engineer', 'Mechanical Engineer Details', '₹10 Lakhs - ₹15 Lakhs', 'Accenture', 'Madurai', 'Madurai', 'Hi, I am Kayalvizhi. I have completed my B.E. / B.Tech and am currently working as a Mechanical Engineer at Accenture in Madurai. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'upper_middle_class', 'Retired Employee', 'Homemaker', false, false, true, 100, NOW() - INTERVAL '2 days')
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
VALUES ('00000000-0000-4000-a000-0000000001a3', 'TM000419', 'Jeeva Sundaram', 'male', '1989-07-17', 182, 'never_married', 'Hindu', 'Mudaliar', NULL, 'yes', 'B.Ed', 'B.Ed Graduate', 'Pharmacist', 'Pharmacist Details', '₹3 Lakhs - ₹5 Lakhs', 'HCL', 'Kanchipuram', 'Kanchipuram', 'Hi, I am Jeeva. I have completed my B.Ed and am currently working as a Pharmacist at HCL in Kanchipuram. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'joint', 'rich', 'Retired Employee', 'Homemaker', true, false, true, 100, NOW() - INTERVAL '10 days')
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
VALUES ('00000000-0000-4000-a000-0000000001a4', 'TM000420', 'Uma Murthy', 'female', '1998-06-07', 151, 'never_married', 'Hindu', 'Arunthathiyar', 'Arunthathiyar subcaste', 'no', 'B.Sc', 'B.Sc Graduate', 'HR Specialist', 'HR Specialist Details', '₹15 Lakhs - ₹20 Lakhs', 'Private Practice', 'Madurai', 'Madurai', 'Hi, I am Uma. I have completed my B.Sc and am currently working as a HR Specialist at Private Practice in Madurai. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'upper_middle_class', 'Retired Employee', 'Homemaker', true, false, true, 100, NOW() - INTERVAL '3 days')
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
VALUES ('00000000-0000-4000-a000-0000000001a5', 'TM000421', 'Vinoth Balan', 'male', '1991-01-25', 184, 'never_married', 'Hindu', 'Agamudayar', 'Agamudayar subcaste', 'no', 'B.Ed', 'B.Ed Graduate', 'Bank Manager', 'Bank Manager Details', '₹5 Lakhs - ₹7 Lakhs', 'Accenture', 'Coimbatore', 'Coimbatore', 'Hi, I am Vinoth. I have completed my B.Ed and am currently working as a Bank Manager at Accenture in Coimbatore. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'upper_middle_class', 'Retired Employee', 'Homemaker', false, false, true, 100, NOW() - INTERVAL '9 days')
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
VALUES ('00000000-0000-4000-a000-0000000001a6', 'TM000422', 'Preethi Naicker', 'female', '1989-04-13', 172, 'never_married', 'Muslim', 'Marakayar', 'Marakayar subcaste', 'no', 'B.Ed', 'B.Ed Graduate', 'Dentist', 'Dentist Details', '₹5 Lakhs - ₹7 Lakhs', 'HCL', 'Madurai', 'Madurai', 'Hi, I am Preethi. I have completed my B.Ed and am currently working as a Dentist at HCL in Madurai. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'middle_class', 'Retired Employee', 'Homemaker', false, true, true, 100, NOW() - INTERVAL '8 days')
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
VALUES ('00000000-0000-4000-a000-0000000001a7', 'TM000423', 'Senthil Samy', 'male', '2002-02-02', 165, 'never_married', 'Hindu', 'Vishwakarma', NULL, 'no', 'M.A', 'M.A Graduate', 'Civil Engineer', 'Civil Engineer Details', '₹15 Lakhs - ₹20 Lakhs', 'Infosys', 'Vellore', 'Vellore', 'Hi, I am Senthil. I have completed my M.A and am currently working as a Civil Engineer at Infosys in Vellore. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'rich', 'Retired Employee', 'Homemaker', true, true, true, 100, NOW() - INTERVAL '3 days')
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
VALUES ('00000000-0000-4000-a000-0000000001a8', 'TM000424', 'Uma Nathan', 'female', '2004-11-22', 161, 'never_married', 'Hindu', 'Thevar', 'Thevar subcaste', 'no', 'Ph.D', 'Ph.D Graduate', 'Mechanical Engineer', 'Mechanical Engineer Details', '₹20 Lakhs+', 'HCL', 'Madurai', 'Madurai', 'Hi, I am Uma. I have completed my Ph.D and am currently working as a Mechanical Engineer at HCL in Madurai. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'rich', 'Retired Employee', 'Homemaker', true, false, true, 100, NOW() - INTERVAL '0 days')
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
VALUES ('00000000-0000-4000-a000-0000000001a9', 'TM000425', 'Aravind Swamy', 'male', '1997-09-12', 163, 'never_married', 'Hindu', 'Vellalar', 'Vellalar subcaste', 'no', 'M.Com', 'M.Com Graduate', 'School Teacher', 'School Teacher Details', '₹3 Lakhs - ₹5 Lakhs', 'TCS', 'Vellore', 'Vellore', 'Hi, I am Aravind. I have completed my M.Com and am currently working as a School Teacher at TCS in Vellore. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'joint', 'rich', 'Retired Employee', 'Homemaker', true, true, true, 100, NOW() - INTERVAL '8 days')
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
VALUES ('00000000-0000-4000-a000-0000000001aa', 'TM000426', 'Radha Pandian', 'female', '1993-01-19', 168, 'never_married', 'Hindu', 'Mudaliar', NULL, 'no', 'B.Com', 'B.Com Graduate', 'School Teacher', 'School Teacher Details', '₹10 Lakhs - ₹15 Lakhs', 'Private Practice', 'Erode', 'Erode', 'Hi, I am Radha. I have completed my B.Com and am currently working as a School Teacher at Private Practice in Erode. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'upper_middle_class', 'Retired Employee', 'Homemaker', true, false, true, 100, NOW() - INTERVAL '4 days')
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
VALUES ('00000000-0000-4000-a000-0000000001ab', 'TM000427', 'Senthil Lingam', 'male', '2004-01-24', 186, 'never_married', 'Muslim', 'Rawther', 'Rawther subcaste', 'yes', 'B.E. / B.Tech', 'B.E. / B.Tech Graduate', 'HR Specialist', 'HR Specialist Details', '₹3 Lakhs - ₹5 Lakhs', 'Accenture', 'Coimbatore', 'Coimbatore', 'Hi, I am Senthil. I have completed my B.E. / B.Tech and am currently working as a HR Specialist at Accenture in Coimbatore. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'upper_middle_class', 'Retired Employee', 'Homemaker', true, true, true, 100, NOW() - INTERVAL '10 days')
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
VALUES ('00000000-0000-4000-a000-0000000001ac', 'TM000428', 'Janani Pandian', 'female', '1996-08-12', 158, 'divorced', 'Christian', 'Vellalar Christian', NULL, 'no', 'Ph.D', 'Ph.D Graduate', 'Dentist', 'Dentist Details', '₹7 Lakhs - ₹10 Lakhs', 'Self Employed', 'Vellore', 'Vellore', 'Hi, I am Janani. I have completed my Ph.D and am currently working as a Dentist at Self Employed in Vellore. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'rich', 'Retired Employee', 'Homemaker', true, false, true, 100, NOW() - INTERVAL '5 days')
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
VALUES ('00000000-0000-4000-a000-0000000001ad', 'TM000429', 'Vinoth Murthy', 'male', '1992-01-23', 171, 'divorced', 'Hindu', 'Gounder', 'Gounder subcaste', 'yes', 'B.A', 'B.A Graduate', 'Software Engineer', 'Software Engineer Details', '₹7 Lakhs - ₹10 Lakhs', 'Self Employed', 'Erode', 'Erode', 'Hi, I am Vinoth. I have completed my B.A and am currently working as a Software Engineer at Self Employed in Erode. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'joint', 'rich', 'Retired Employee', 'Homemaker', true, true, true, 100, NOW() - INTERVAL '3 days')
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
VALUES ('00000000-0000-4000-a000-0000000001ae', 'TM000430', 'Sowmya Sundaram', 'female', '1992-07-16', 159, 'never_married', 'Muslim', 'Shia Muslim', NULL, 'no', 'B.Ed', 'B.Ed Graduate', 'Architect', 'Architect Details', '₹3 Lakhs - ₹5 Lakhs', 'Government Service', 'Thanjavur', 'Thanjavur', 'Hi, I am Sowmya. I have completed my B.Ed and am currently working as a Architect at Government Service in Thanjavur. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'middle_class', 'Retired Employee', 'Homemaker', true, false, true, 100, NOW() - INTERVAL '3 days')
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
VALUES ('00000000-0000-4000-a000-0000000001af', 'TM000431', 'Surya Balan', 'male', '2005-09-24', 180, 'never_married', 'Hindu', 'Pillai', NULL, 'no', 'M.B.A', 'M.B.A Graduate', 'Doctor', 'Doctor Details', '₹15 Lakhs - ₹20 Lakhs', 'TCS', 'Salem', 'Salem', 'Hi, I am Surya. I have completed my M.B.A and am currently working as a Doctor at TCS in Salem. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'middle_class', 'Retired Employee', 'Homemaker', true, false, true, 100, NOW() - INTERVAL '9 days')
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
VALUES ('00000000-0000-4000-a000-0000000001b0', 'TM000432', 'Preethi Sundaram', 'female', '1995-08-18', 158, 'never_married', 'Muslim', 'Shia Muslim', NULL, 'no', 'M.B.A', 'M.B.A Graduate', 'School Teacher', 'School Teacher Details', '₹7 Lakhs - ₹10 Lakhs', 'Self Employed', 'Thanjavur', 'Thanjavur', 'Hi, I am Preethi. I have completed my M.B.A and am currently working as a School Teacher at Self Employed in Thanjavur. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'rich', 'Retired Employee', 'Homemaker', false, false, true, 100, NOW() - INTERVAL '0 days')
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
VALUES ('00000000-0000-4000-a000-0000000001b1', 'TM000433', 'Jeeva Krishnan', 'male', '1993-02-13', 186, 'never_married', 'Muslim', 'Sunni Muslim', NULL, 'no', 'M.B.B.S', 'M.B.B.S Graduate', 'Advocate', 'Advocate Details', '₹5 Lakhs - ₹7 Lakhs', 'Accenture', 'Erode', 'Erode', 'Hi, I am Jeeva. I have completed my M.B.B.S and am currently working as a Advocate at Accenture in Erode. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'joint', 'upper_middle_class', 'Retired Employee', 'Homemaker', true, false, true, 100, NOW() - INTERVAL '5 days')
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
VALUES ('00000000-0000-4000-a000-0000000001b2', 'TM000434', 'Deepa Gopal', 'female', '1991-09-21', 159, 'never_married', 'Hindu', 'Nadar', NULL, 'no', 'Ph.D', 'Ph.D Graduate', 'Police Officer', 'Police Officer Details', '₹20 Lakhs+', 'Zoho', 'Erode', 'Erode', 'Hi, I am Deepa. I have completed my Ph.D and am currently working as a Police Officer at Zoho in Erode. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'rich', 'Retired Employee', 'Homemaker', true, true, true, 100, NOW() - INTERVAL '10 days')
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
VALUES ('00000000-0000-4000-a000-0000000001b3', 'TM000435', 'Selvam Raj', 'male', '1999-10-07', 178, 'never_married', 'Hindu', 'Naicker', NULL, 'no', 'B.Sc', 'B.Sc Graduate', 'HR Specialist', 'HR Specialist Details', '₹5 Lakhs - ₹7 Lakhs', 'Self Employed', 'Coimbatore', 'Coimbatore', 'Hi, I am Selvam. I have completed my B.Sc and am currently working as a HR Specialist at Self Employed in Coimbatore. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'rich', 'Retired Employee', 'Homemaker', true, true, true, 100, NOW() - INTERVAL '6 days')
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
VALUES ('00000000-0000-4000-a000-0000000001b4', 'TM000436', 'Pavithra Pandian', 'female', '1992-01-06', 159, 'never_married', 'Hindu', 'Vanniyar', 'Vanniyar subcaste', 'yes', 'B.E. / B.Tech', 'B.E. / B.Tech Graduate', 'Doctor', 'Doctor Details', '₹10 Lakhs - ₹15 Lakhs', 'Cognizant', 'Erode', 'Erode', 'Hi, I am Pavithra. I have completed my B.E. / B.Tech and am currently working as a Doctor at Cognizant in Erode. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'joint', 'middle_class', 'Retired Employee', 'Homemaker', false, false, true, 100, NOW() - INTERVAL '7 days')
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
VALUES ('00000000-0000-4000-a000-0000000001b5', 'TM000437', 'Suresh Balan', 'male', '2002-04-13', 174, 'never_married', 'Hindu', 'Chettiar', 'Chettiar subcaste', 'yes', 'M.B.A', 'M.B.A Graduate', 'Mechanical Engineer', 'Mechanical Engineer Details', '₹20 Lakhs+', 'Private Practice', 'Tirunelveli', 'Tirunelveli', 'Hi, I am Suresh. I have completed my M.B.A and am currently working as a Mechanical Engineer at Private Practice in Tirunelveli. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'middle_class', 'Retired Employee', 'Homemaker', false, true, true, 100, NOW() - INTERVAL '4 days')
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
VALUES ('00000000-0000-4000-a000-0000000001b6', 'TM000438', 'Sandhya Lingam', 'female', '1995-03-05', 171, 'never_married', 'Hindu', 'Maravar', 'Maravar subcaste', 'no', 'M.B.A', 'M.B.A Graduate', 'HR Specialist', 'HR Specialist Details', '₹5 Lakhs - ₹7 Lakhs', 'Wipro', 'Thanjavur', 'Thanjavur', 'Hi, I am Sandhya. I have completed my M.B.A and am currently working as a HR Specialist at Wipro in Thanjavur. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'rich', 'Retired Employee', 'Homemaker', false, false, true, 100, NOW() - INTERVAL '4 days')
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
VALUES ('00000000-0000-4000-a000-0000000001b7', 'TM000439', 'Vetrivel Kumar', 'male', '1997-07-15', 175, 'divorced', 'Christian', 'Nadar Christian', 'Nadar Christian subcaste', 'no', 'B.Sc', 'B.Sc Graduate', 'Government Officer', 'Government Officer Details', '₹20 Lakhs+', 'Cognizant', 'Thanjavur', 'Thanjavur', 'Hi, I am Vetrivel. I have completed my B.Sc and am currently working as a Government Officer at Cognizant in Thanjavur. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'middle_class', 'Retired Employee', 'Homemaker', true, false, true, 100, NOW() - INTERVAL '5 days')
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
VALUES ('00000000-0000-4000-a000-0000000001b8', 'TM000440', 'Nivedha Pandian', 'female', '2001-07-28', 162, 'never_married', 'Hindu', 'Sengunthar', 'Sengunthar subcaste', 'yes', 'M.C.A', 'M.C.A Graduate', 'Civil Engineer', 'Civil Engineer Details', '₹3 Lakhs - ₹5 Lakhs', 'Cognizant', 'Kanchipuram', 'Kanchipuram', 'Hi, I am Nivedha. I have completed my M.C.A and am currently working as a Civil Engineer at Cognizant in Kanchipuram. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'joint', 'upper_middle_class', 'Retired Employee', 'Homemaker', false, true, true, 100, NOW() - INTERVAL '3 days')
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
VALUES ('00000000-0000-4000-a000-0000000001b9', 'TM000441', 'Srinivasan Sundaram', 'male', '1992-08-27', 164, 'never_married', 'Christian', 'CSI Christian', 'CSI Christian subcaste', 'no', 'B.A', 'B.A Graduate', 'Pharmacist', 'Pharmacist Details', '₹15 Lakhs - ₹20 Lakhs', 'Accenture', 'Tirunelveli', 'Tirunelveli', 'Hi, I am Srinivasan. I have completed my B.A and am currently working as a Pharmacist at Accenture in Tirunelveli. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'rich', 'Retired Employee', 'Homemaker', true, false, true, 100, NOW() - INTERVAL '3 days')
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
VALUES ('00000000-0000-4000-a000-0000000001ba', 'TM000442', 'Megala Murthy', 'female', '2003-08-11', 160, 'never_married', 'Hindu', 'Kallar', NULL, 'yes', 'M.B.B.S', 'M.B.B.S Graduate', 'Auditor', 'Auditor Details', '₹15 Lakhs - ₹20 Lakhs', 'Private Practice', 'Coimbatore', 'Coimbatore', 'Hi, I am Megala. I have completed my M.B.B.S and am currently working as a Auditor at Private Practice in Coimbatore. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'upper_middle_class', 'Retired Employee', 'Homemaker', false, false, true, 100, NOW() - INTERVAL '7 days')
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
VALUES ('00000000-0000-4000-a000-0000000001bb', 'TM000443', 'Madhavan Selvan', 'male', '1988-10-19', 183, 'divorced', 'Muslim', 'Sunni Muslim', 'Sunni Muslim subcaste', 'no', 'M.A', 'M.A Graduate', 'Police Officer', 'Police Officer Details', '₹7 Lakhs - ₹10 Lakhs', 'Infosys', 'Tirunelveli', 'Tirunelveli', 'Hi, I am Madhavan. I have completed my M.A and am currently working as a Police Officer at Infosys in Tirunelveli. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'middle_class', 'Retired Employee', 'Homemaker', true, false, true, 100, NOW() - INTERVAL '1 days')
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
VALUES ('00000000-0000-4000-a000-0000000001bc', 'TM000444', 'Ponmani Lingam', 'female', '1990-05-02', 173, 'never_married', 'Hindu', 'Yadav', 'Yadav subcaste', 'yes', 'M.A', 'M.A Graduate', 'Doctor', 'Doctor Details', '₹3 Lakhs - ₹5 Lakhs', 'Cognizant', 'Tiruppur', 'Tiruppur', 'Hi, I am Ponmani. I have completed my M.A and am currently working as a Doctor at Cognizant in Tiruppur. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'rich', 'Retired Employee', 'Homemaker', true, false, true, 100, NOW() - INTERVAL '7 days')
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
VALUES ('00000000-0000-4000-a000-0000000001bd', 'TM000445', 'Srinivasan Shankar', 'male', '2005-09-21', 188, 'never_married', 'Hindu', 'Yadav', NULL, 'no', 'M.Sc', 'M.Sc Graduate', 'Civil Engineer', 'Civil Engineer Details', '₹3 Lakhs - ₹5 Lakhs', 'Wipro', 'Chennai', 'Chennai', 'Hi, I am Srinivasan. I have completed my M.Sc and am currently working as a Civil Engineer at Wipro in Chennai. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'middle_class', 'Retired Employee', 'Homemaker', true, false, true, 100, NOW() - INTERVAL '2 days')
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
VALUES ('00000000-0000-4000-a000-0000000001be', 'TM000446', 'Sandhya Krishnan', 'female', '1996-01-10', 166, 'divorced', 'Hindu', 'Vanniyar', 'Vanniyar subcaste', 'no', 'M.B.A', 'M.B.A Graduate', 'School Teacher', 'School Teacher Details', '₹7 Lakhs - ₹10 Lakhs', 'HCL', 'Thanjavur', 'Thanjavur', 'Hi, I am Sandhya. I have completed my M.B.A and am currently working as a School Teacher at HCL in Thanjavur. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'upper_middle_class', 'Retired Employee', 'Homemaker', true, false, true, 100, NOW() - INTERVAL '8 days')
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
VALUES ('00000000-0000-4000-a000-0000000001bf', 'TM000447', 'Shankar Murthy', 'male', '1994-11-24', 188, 'divorced', 'Hindu', 'Nadar', 'Nadar subcaste', 'no', 'M.Com', 'M.Com Graduate', 'Government Officer', 'Government Officer Details', '₹20 Lakhs+', 'TCS', 'Thanjavur', 'Thanjavur', 'Hi, I am Shankar. I have completed my M.Com and am currently working as a Government Officer at TCS in Thanjavur. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'rich', 'Retired Employee', 'Homemaker', false, false, true, 100, NOW() - INTERVAL '2 days')
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
VALUES ('00000000-0000-4000-a000-0000000001c0', 'TM000448', 'Anitha Sundaram', 'female', '1999-02-26', 167, 'never_married', 'Hindu', 'Thevar', NULL, 'yes', 'M.B.B.S', 'M.B.B.S Graduate', 'Bank Manager', 'Bank Manager Details', '₹10 Lakhs - ₹15 Lakhs', 'Government Service', 'Erode', 'Erode', 'Hi, I am Anitha. I have completed my M.B.B.S and am currently working as a Bank Manager at Government Service in Erode. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'joint', 'rich', 'Retired Employee', 'Homemaker', true, false, true, 100, NOW() - INTERVAL '0 days')
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
VALUES ('00000000-0000-4000-a000-0000000001c1', 'TM000449', 'Vinoth Naicker', 'male', '1996-05-28', 186, 'never_married', 'Hindu', 'Pillai', NULL, 'no', 'B.A', 'B.A Graduate', 'Auditor', 'Auditor Details', '₹3 Lakhs - ₹5 Lakhs', 'HCL', 'Chennai', 'Chennai', 'Hi, I am Vinoth. I have completed my B.A and am currently working as a Auditor at HCL in Chennai. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'joint', 'rich', 'Retired Employee', 'Homemaker', true, false, true, 100, NOW() - INTERVAL '6 days')
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
VALUES ('00000000-0000-4000-a000-0000000001c2', 'TM000450', 'Harini Krishnan', 'female', '2004-02-24', 154, 'never_married', 'Hindu', 'Brahmin - Iyer', 'Brahmin - Iyer subcaste', 'no', 'M.B.A', 'M.B.A Graduate', 'Advocate', 'Advocate Details', '₹10 Lakhs - ₹15 Lakhs', 'HCL', 'Coimbatore', 'Coimbatore', 'Hi, I am Harini. I have completed my M.B.A and am currently working as a Advocate at HCL in Coimbatore. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'upper_middle_class', 'Retired Employee', 'Homemaker', true, false, true, 100, NOW() - INTERVAL '2 days')
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
VALUES ('00000000-0000-4000-a000-0000000001c3', 'TM000451', 'Manikandan Murthy', 'male', '1996-04-11', 167, 'never_married', 'Hindu', 'Yadav', 'Yadav subcaste', 'no', 'Ph.D', 'Ph.D Graduate', 'Software Engineer', 'Software Engineer Details', '₹7 Lakhs - ₹10 Lakhs', 'Cognizant', 'Chennai', 'Chennai', 'Hi, I am Manikandan. I have completed my Ph.D and am currently working as a Software Engineer at Cognizant in Chennai. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'middle_class', 'Retired Employee', 'Homemaker', false, false, true, 100, NOW() - INTERVAL '8 days')
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
VALUES ('00000000-0000-4000-a000-0000000001c4', 'TM000452', 'Nandhini Swamy', 'female', '1996-01-01', 165, 'never_married', 'Hindu', 'Kallar', 'Kallar subcaste', 'no', 'B.Ed', 'B.Ed Graduate', 'College Professor', 'College Professor Details', '₹20 Lakhs+', 'HCL', 'Thanjavur', 'Thanjavur', 'Hi, I am Nandhini. I have completed my B.Ed and am currently working as a College Professor at HCL in Thanjavur. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'upper_middle_class', 'Retired Employee', 'Homemaker', false, false, true, 100, NOW() - INTERVAL '2 days')
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
VALUES ('00000000-0000-4000-a000-0000000001c5', 'TM000453', 'Naveen Sundaram', 'male', '1998-09-14', 166, 'never_married', 'Hindu', 'Brahmin - Iyer', 'Brahmin - Iyer subcaste', 'no', 'B.E. / B.Tech', 'B.E. / B.Tech Graduate', 'Dentist', 'Dentist Details', '₹10 Lakhs - ₹15 Lakhs', 'Government Service', 'Tiruppur', 'Tiruppur', 'Hi, I am Naveen. I have completed my B.E. / B.Tech and am currently working as a Dentist at Government Service in Tiruppur. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'upper_middle_class', 'Retired Employee', 'Homemaker', true, false, true, 100, NOW() - INTERVAL '8 days')
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
VALUES ('00000000-0000-4000-a000-0000000001c6', 'TM000454', 'Banumathi Sundaram', 'female', '2005-07-02', 161, 'never_married', 'Hindu', 'Arunthathiyar', 'Arunthathiyar subcaste', 'no', 'Ph.D', 'Ph.D Graduate', 'Government Officer', 'Government Officer Details', '₹15 Lakhs - ₹20 Lakhs', 'Government Service', 'Vellore', 'Vellore', 'Hi, I am Banumathi. I have completed my Ph.D and am currently working as a Government Officer at Government Service in Vellore. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'upper_middle_class', 'Retired Employee', 'Homemaker', true, false, true, 100, NOW() - INTERVAL '4 days')
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
VALUES ('00000000-0000-4000-a000-0000000001c7', 'TM000455', 'Srinivasan Naicker', 'male', '1993-12-05', 173, 'never_married', 'Hindu', 'Yadav', NULL, 'no', 'M.C.A', 'M.C.A Graduate', 'Civil Engineer', 'Civil Engineer Details', '₹7 Lakhs - ₹10 Lakhs', 'Infosys', 'Chennai', 'Chennai', 'Hi, I am Srinivasan. I have completed my M.C.A and am currently working as a Civil Engineer at Infosys in Chennai. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'upper_middle_class', 'Retired Employee', 'Homemaker', true, false, true, 100, NOW() - INTERVAL '7 days')
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
VALUES ('00000000-0000-4000-a000-0000000001c8', 'TM000456', 'Chitra Kumar', 'female', '1993-08-12', 152, 'never_married', 'Hindu', 'Vellalar', 'Vellalar subcaste', 'no', 'B.Com', 'B.Com Graduate', 'Mechanical Engineer', 'Mechanical Engineer Details', '₹10 Lakhs - ₹15 Lakhs', 'Accenture', 'Salem', 'Salem', 'Hi, I am Chitra. I have completed my B.Com and am currently working as a Mechanical Engineer at Accenture in Salem. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'joint', 'rich', 'Retired Employee', 'Homemaker', true, false, true, 100, NOW() - INTERVAL '1 days')
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
VALUES ('00000000-0000-4000-a000-0000000001c9', 'TM000457', 'Jeeva Shankar', 'male', '2000-10-02', 180, 'never_married', 'Hindu', 'Yadav', 'Yadav subcaste', 'no', 'M.B.A', 'M.B.A Graduate', 'Doctor', 'Doctor Details', '₹15 Lakhs - ₹20 Lakhs', 'Private Practice', 'Tirunelveli', 'Tirunelveli', 'Hi, I am Jeeva. I have completed my M.B.A and am currently working as a Doctor at Private Practice in Tirunelveli. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'upper_middle_class', 'Retired Employee', 'Homemaker', true, false, true, 100, NOW() - INTERVAL '6 days')
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
VALUES ('00000000-0000-4000-a000-0000000001ca', 'TM000458', 'Gayathri Shankar', 'female', '2002-01-20', 161, 'never_married', 'Hindu', 'Sengunthar', NULL, 'no', 'B.Ed', 'B.Ed Graduate', 'Mechanical Engineer', 'Mechanical Engineer Details', '₹7 Lakhs - ₹10 Lakhs', 'Wipro', 'Madurai', 'Madurai', 'Hi, I am Gayathri. I have completed my B.Ed and am currently working as a Mechanical Engineer at Wipro in Madurai. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'rich', 'Retired Employee', 'Homemaker', true, false, true, 100, NOW() - INTERVAL '2 days')
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
VALUES ('00000000-0000-4000-a000-0000000001cb', 'TM000459', 'Ajith Shankar', 'male', '1988-01-11', 187, 'never_married', 'Hindu', 'Sengunthar', 'Sengunthar subcaste', 'yes', 'M.A', 'M.A Graduate', 'College Professor', 'College Professor Details', '₹3 Lakhs - ₹5 Lakhs', 'Private Practice', 'Madurai', 'Madurai', 'Hi, I am Ajith. I have completed my M.A and am currently working as a College Professor at Private Practice in Madurai. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'upper_middle_class', 'Retired Employee', 'Homemaker', true, false, true, 100, NOW() - INTERVAL '8 days')
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
VALUES ('00000000-0000-4000-a000-0000000001cc', 'TM000460', 'Kokila Sundaram', 'female', '1999-10-28', 157, 'divorced', 'Hindu', 'Pillai', 'Pillai subcaste', 'yes', 'M.B.B.S', 'M.B.B.S Graduate', 'Mechanical Engineer', 'Mechanical Engineer Details', '₹20 Lakhs+', 'Accenture', 'Thanjavur', 'Thanjavur', 'Hi, I am Kokila. I have completed my M.B.B.S and am currently working as a Mechanical Engineer at Accenture in Thanjavur. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'middle_class', 'Retired Employee', 'Homemaker', true, false, true, 100, NOW() - INTERVAL '8 days')
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
VALUES ('00000000-0000-4000-a000-0000000001cd', 'TM000461', 'Senthil Krishnan', 'male', '1995-06-18', 174, 'never_married', 'Christian', 'Protestant Christian', 'Protestant Christian subcaste', 'no', 'M.B.A', 'M.B.A Graduate', 'Bank Manager', 'Bank Manager Details', '₹15 Lakhs - ₹20 Lakhs', 'TCS', 'Coimbatore', 'Coimbatore', 'Hi, I am Senthil. I have completed my M.B.A and am currently working as a Bank Manager at TCS in Coimbatore. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'rich', 'Retired Employee', 'Homemaker', true, false, true, 100, NOW() - INTERVAL '10 days')
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
VALUES ('00000000-0000-4000-a000-0000000001ce', 'TM000462', 'Vijaya Devan', 'female', '1989-02-25', 163, 'never_married', 'Muslim', 'Shia Muslim', NULL, 'yes', 'M.C.A', 'M.C.A Graduate', 'Advocate', 'Advocate Details', '₹15 Lakhs - ₹20 Lakhs', 'Accenture', 'Chennai', 'Chennai', 'Hi, I am Vijaya. I have completed my M.C.A and am currently working as a Advocate at Accenture in Chennai. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'joint', 'upper_middle_class', 'Retired Employee', 'Homemaker', true, false, true, 100, NOW() - INTERVAL '1 days')
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
VALUES ('00000000-0000-4000-a000-0000000001cf', 'TM000463', 'Karthik Nathan', 'male', '1999-06-10', 183, 'never_married', 'Hindu', 'Vanniyar', 'Vanniyar subcaste', 'no', 'M.Sc', 'M.Sc Graduate', 'Software Engineer', 'Software Engineer Details', '₹7 Lakhs - ₹10 Lakhs', 'Wipro', 'Madurai', 'Madurai', 'Hi, I am Karthik. I have completed my M.Sc and am currently working as a Software Engineer at Wipro in Madurai. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'joint', 'middle_class', 'Retired Employee', 'Homemaker', false, false, true, 100, NOW() - INTERVAL '7 days')
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
VALUES ('00000000-0000-4000-a000-0000000001d0', 'TM000464', 'Parvathi Sundaram', 'female', '1996-09-18', 162, 'never_married', 'Hindu', 'Sengunthar', NULL, 'no', 'M.A', 'M.A Graduate', 'School Teacher', 'School Teacher Details', '₹15 Lakhs - ₹20 Lakhs', 'Government Service', 'Vellore', 'Vellore', 'Hi, I am Parvathi. I have completed my M.A and am currently working as a School Teacher at Government Service in Vellore. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'middle_class', 'Retired Employee', 'Homemaker', true, false, true, 100, NOW() - INTERVAL '4 days')
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
VALUES ('00000000-0000-4000-a000-0000000001d1', 'TM000465', 'Suresh Krishnan', 'male', '1994-09-27', 169, 'never_married', 'Hindu', 'Chettiar', 'Chettiar subcaste', 'no', 'B.A', 'B.A Graduate', 'Mechanical Engineer', 'Mechanical Engineer Details', '₹3 Lakhs - ₹5 Lakhs', 'TCS', 'Salem', 'Salem', 'Hi, I am Suresh. I have completed my B.A and am currently working as a Mechanical Engineer at TCS in Salem. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'joint', 'middle_class', 'Retired Employee', 'Homemaker', true, false, true, 100, NOW() - INTERVAL '9 days')
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
VALUES ('00000000-0000-4000-a000-0000000001d2', 'TM000466', 'Malarvizhi Selvan', 'female', '1990-06-01', 155, 'divorced', 'Hindu', 'Chettiar', NULL, 'no', 'B.Ed', 'B.Ed Graduate', 'Architect', 'Architect Details', '₹5 Lakhs - ₹7 Lakhs', 'Private Practice', 'Kanchipuram', 'Kanchipuram', 'Hi, I am Malarvizhi. I have completed my B.Ed and am currently working as a Architect at Private Practice in Kanchipuram. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'middle_class', 'Retired Employee', 'Homemaker', true, true, true, 100, NOW() - INTERVAL '10 days')
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
VALUES ('00000000-0000-4000-a000-0000000001d3', 'TM000467', 'Kabilan Velan', 'male', '2005-06-18', 162, 'never_married', 'Muslim', 'Marakayar', 'Marakayar subcaste', 'no', 'M.A', 'M.A Graduate', 'School Teacher', 'School Teacher Details', '₹3 Lakhs - ₹5 Lakhs', 'Government Service', 'Kanchipuram', 'Kanchipuram', 'Hi, I am Kabilan. I have completed my M.A and am currently working as a School Teacher at Government Service in Kanchipuram. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'upper_middle_class', 'Retired Employee', 'Homemaker', true, false, true, 100, NOW() - INTERVAL '10 days')
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
VALUES ('00000000-0000-4000-a000-0000000001d4', 'TM000468', 'Vidya Raman', 'female', '2000-03-07', 153, 'never_married', 'Hindu', 'Pillai', 'Pillai subcaste', 'no', 'B.A', 'B.A Graduate', 'HR Specialist', 'HR Specialist Details', '₹5 Lakhs - ₹7 Lakhs', 'Government Service', 'Coimbatore', 'Coimbatore', 'Hi, I am Vidya. I have completed my B.A and am currently working as a HR Specialist at Government Service in Coimbatore. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'rich', 'Retired Employee', 'Homemaker', false, false, true, 100, NOW() - INTERVAL '2 days')
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
VALUES ('00000000-0000-4000-a000-0000000001d5', 'TM000469', 'Vignesh Raman', 'male', '1988-06-01', 180, 'never_married', 'Hindu', 'Nadar', NULL, 'no', 'B.Com', 'B.Com Graduate', 'Bank Manager', 'Bank Manager Details', '₹7 Lakhs - ₹10 Lakhs', 'Wipro', 'Chennai', 'Chennai', 'Hi, I am Vignesh. I have completed my B.Com and am currently working as a Bank Manager at Wipro in Chennai. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'rich', 'Retired Employee', 'Homemaker', true, true, true, 100, NOW() - INTERVAL '2 days')
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
VALUES ('00000000-0000-4000-a000-0000000001d6', 'TM000470', 'Divya Murthy', 'female', '2004-08-04', 158, 'never_married', 'Hindu', 'Brahmin - Iyengar', 'Brahmin - Iyengar subcaste', 'yes', 'M.Com', 'M.Com Graduate', 'Architect', 'Architect Details', '₹10 Lakhs - ₹15 Lakhs', 'Cognizant', 'Salem', 'Salem', 'Hi, I am Divya. I have completed my M.Com and am currently working as a Architect at Cognizant in Salem. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'rich', 'Retired Employee', 'Homemaker', true, false, true, 100, NOW() - INTERVAL '1 days')
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
VALUES ('00000000-0000-4000-a000-0000000001d7', 'TM000471', 'Muthu Selvan', 'male', '2002-08-02', 175, 'never_married', 'Hindu', 'Adi Dravida', 'Adi Dravida subcaste', 'no', 'M.B.B.S', 'M.B.B.S Graduate', 'Police Officer', 'Police Officer Details', '₹20 Lakhs+', 'Accenture', 'Madurai', 'Madurai', 'Hi, I am Muthu. I have completed my M.B.B.S and am currently working as a Police Officer at Accenture in Madurai. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'middle_class', 'Retired Employee', 'Homemaker', false, false, true, 100, NOW() - INTERVAL '9 days')
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
VALUES ('00000000-0000-4000-a000-0000000001d8', 'TM000472', 'Divya Balan', 'female', '2002-05-01', 173, 'never_married', 'Muslim', 'Marakayar', 'Marakayar subcaste', 'no', 'Ph.D', 'Ph.D Graduate', 'Police Officer', 'Police Officer Details', '₹20 Lakhs+', 'Zoho', 'Kanchipuram', 'Kanchipuram', 'Hi, I am Divya. I have completed my Ph.D and am currently working as a Police Officer at Zoho in Kanchipuram. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'joint', 'middle_class', 'Retired Employee', 'Homemaker', true, false, true, 100, NOW() - INTERVAL '3 days')
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
VALUES ('00000000-0000-4000-a000-0000000001d9', 'TM000473', 'Murugan Balan', 'male', '2000-05-28', 182, 'never_married', 'Hindu', 'Chettiar', NULL, 'no', 'B.E. / B.Tech', 'B.E. / B.Tech Graduate', 'HR Specialist', 'HR Specialist Details', '₹10 Lakhs - ₹15 Lakhs', 'Accenture', 'Coimbatore', 'Coimbatore', 'Hi, I am Murugan. I have completed my B.E. / B.Tech and am currently working as a HR Specialist at Accenture in Coimbatore. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'middle_class', 'Retired Employee', 'Homemaker', true, false, true, 100, NOW() - INTERVAL '5 days')
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
VALUES ('00000000-0000-4000-a000-0000000001da', 'TM000474', 'Deepa Velan', 'female', '2004-02-05', 163, 'never_married', 'Hindu', 'Agamudayar', 'Agamudayar subcaste', 'yes', 'M.B.B.S', 'M.B.B.S Graduate', 'Advocate', 'Advocate Details', '₹10 Lakhs - ₹15 Lakhs', 'HCL', 'Chennai', 'Chennai', 'Hi, I am Deepa. I have completed my M.B.B.S and am currently working as a Advocate at HCL in Chennai. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'rich', 'Retired Employee', 'Homemaker', false, true, true, 100, NOW() - INTERVAL '0 days')
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
VALUES ('00000000-0000-4000-a000-0000000001db', 'TM000475', 'Muthu Sundaram', 'male', '1994-10-16', 171, 'never_married', 'Hindu', 'Vanniyar', 'Vanniyar subcaste', 'yes', 'M.Sc', 'M.Sc Graduate', 'HR Specialist', 'HR Specialist Details', '₹3 Lakhs - ₹5 Lakhs', 'Cognizant', 'Salem', 'Salem', 'Hi, I am Muthu. I have completed my M.Sc and am currently working as a HR Specialist at Cognizant in Salem. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'rich', 'Retired Employee', 'Homemaker', true, false, true, 100, NOW() - INTERVAL '8 days')
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
VALUES ('00000000-0000-4000-a000-0000000001dc', 'TM000476', 'Saraswathi Nathan', 'female', '2000-05-03', 151, 'never_married', 'Muslim', 'Sunni Muslim', 'Sunni Muslim subcaste', 'yes', 'B.Com', 'B.Com Graduate', 'Business Owner', 'Business Owner Details', '₹5 Lakhs - ₹7 Lakhs', 'Private Practice', 'Chennai', 'Chennai', 'Hi, I am Saraswathi. I have completed my B.Com and am currently working as a Business Owner at Private Practice in Chennai. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'rich', 'Retired Employee', 'Homemaker', true, false, true, 100, NOW() - INTERVAL '3 days')
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
VALUES ('00000000-0000-4000-a000-0000000001dd', 'TM000477', 'Chinnasamy Balan', 'male', '2001-07-01', 178, 'never_married', 'Hindu', 'Brahmin - Iyer', NULL, 'no', 'M.Com', 'M.Com Graduate', 'Dentist', 'Dentist Details', '₹10 Lakhs - ₹15 Lakhs', 'Accenture', 'Thanjavur', 'Thanjavur', 'Hi, I am Chinnasamy. I have completed my M.Com and am currently working as a Dentist at Accenture in Thanjavur. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'upper_middle_class', 'Retired Employee', 'Homemaker', true, true, true, 100, NOW() - INTERVAL '3 days')
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
VALUES ('00000000-0000-4000-a000-0000000001de', 'TM000478', 'Ramani Gopal', 'female', '1996-02-07', 174, 'divorced', 'Hindu', 'Naicker', NULL, 'yes', 'M.B.A', 'M.B.A Graduate', 'College Professor', 'College Professor Details', '₹3 Lakhs - ₹5 Lakhs', 'Self Employed', 'Kanchipuram', 'Kanchipuram', 'Hi, I am Ramani. I have completed my M.B.A and am currently working as a College Professor at Self Employed in Kanchipuram. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'middle_class', 'Retired Employee', 'Homemaker', true, true, true, 100, NOW() - INTERVAL '4 days')
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
VALUES ('00000000-0000-4000-a000-0000000001df', 'TM000479', 'Bala Shankar', 'male', '2001-09-24', 164, 'never_married', 'Hindu', 'Vanniyar', 'Vanniyar subcaste', 'no', 'M.Sc', 'M.Sc Graduate', 'Police Officer', 'Police Officer Details', '₹15 Lakhs - ₹20 Lakhs', 'Wipro', 'Tiruchirappalli', 'Trichy', 'Hi, I am Bala. I have completed my M.Sc and am currently working as a Police Officer at Wipro in Tiruchirappalli. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'joint', 'upper_middle_class', 'Retired Employee', 'Homemaker', false, false, true, 100, NOW() - INTERVAL '7 days')
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
VALUES ('00000000-0000-4000-a000-0000000001e0', 'TM000480', 'Nivedha Velan', 'female', '2003-02-23', 166, 'never_married', 'Muslim', 'Marakayar', 'Marakayar subcaste', 'no', 'M.Com', 'M.Com Graduate', 'Software Engineer', 'Software Engineer Details', '₹7 Lakhs - ₹10 Lakhs', 'Infosys', 'Coimbatore', 'Coimbatore', 'Hi, I am Nivedha. I have completed my M.Com and am currently working as a Software Engineer at Infosys in Coimbatore. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'joint', 'rich', 'Retired Employee', 'Homemaker', true, true, true, 100, NOW() - INTERVAL '1 days')
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
VALUES ('00000000-0000-4000-a000-0000000001e1', 'TM000481', 'Naveen Murthy', 'male', '1994-03-23', 171, 'never_married', 'Hindu', 'Vishwakarma', 'Vishwakarma subcaste', 'no', 'M.Com', 'M.Com Graduate', 'Government Officer', 'Government Officer Details', '₹7 Lakhs - ₹10 Lakhs', 'Wipro', 'Vellore', 'Vellore', 'Hi, I am Naveen. I have completed my M.Com and am currently working as a Government Officer at Wipro in Vellore. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'rich', 'Retired Employee', 'Homemaker', false, false, true, 100, NOW() - INTERVAL '3 days')
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
VALUES ('00000000-0000-4000-a000-0000000001e2', 'TM000482', 'Preethi Mani', 'female', '1988-09-20', 170, 'never_married', 'Hindu', 'Naicker', 'Naicker subcaste', 'no', 'M.B.A', 'M.B.A Graduate', 'Business Owner', 'Business Owner Details', '₹3 Lakhs - ₹5 Lakhs', 'Zoho', 'Madurai', 'Madurai', 'Hi, I am Preethi. I have completed my M.B.A and am currently working as a Business Owner at Zoho in Madurai. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'joint', 'middle_class', 'Retired Employee', 'Homemaker', true, false, true, 100, NOW() - INTERVAL '9 days')
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
VALUES ('00000000-0000-4000-a000-0000000001e3', 'TM000483', 'Siva Krishnan', 'male', '2004-10-23', 169, 'never_married', 'Hindu', 'Mudaliar', 'Mudaliar subcaste', 'no', 'M.Com', 'M.Com Graduate', 'Government Officer', 'Government Officer Details', '₹15 Lakhs - ₹20 Lakhs', 'TCS', 'Thoothukudi', 'Tuticorin', 'Hi, I am Siva. I have completed my M.Com and am currently working as a Government Officer at TCS in Thoothukudi. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'joint', 'rich', 'Retired Employee', 'Homemaker', true, false, true, 100, NOW() - INTERVAL '6 days')
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
VALUES ('00000000-0000-4000-a000-0000000001e4', 'TM000484', 'Preethi Velan', 'female', '1995-04-18', 158, 'never_married', 'Hindu', 'Vishwakarma', 'Vishwakarma subcaste', 'yes', 'M.A', 'M.A Graduate', 'Government Officer', 'Government Officer Details', '₹5 Lakhs - ₹7 Lakhs', 'Self Employed', 'Thoothukudi', 'Tuticorin', 'Hi, I am Preethi. I have completed my M.A and am currently working as a Government Officer at Self Employed in Thoothukudi. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'rich', 'Retired Employee', 'Homemaker', true, false, true, 100, NOW() - INTERVAL '4 days')
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
VALUES ('00000000-0000-4000-a000-0000000001e5', 'TM000485', 'Ganesan Lingam', 'male', '1990-12-09', 172, 'never_married', 'Hindu', 'Pillai', 'Pillai subcaste', 'no', 'M.Com', 'M.Com Graduate', 'Dentist', 'Dentist Details', '₹3 Lakhs - ₹5 Lakhs', 'Zoho', 'Kanchipuram', 'Kanchipuram', 'Hi, I am Ganesan. I have completed my M.Com and am currently working as a Dentist at Zoho in Kanchipuram. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'joint', 'upper_middle_class', 'Retired Employee', 'Homemaker', true, true, true, 100, NOW() - INTERVAL '3 days')
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
VALUES ('00000000-0000-4000-a000-0000000001e6', 'TM000486', 'Uma Balan', 'female', '1994-03-11', 174, 'never_married', 'Hindu', 'Sengunthar', NULL, 'no', 'B.A', 'B.A Graduate', 'Business Owner', 'Business Owner Details', '₹15 Lakhs - ₹20 Lakhs', 'Self Employed', 'Tiruppur', 'Tiruppur', 'Hi, I am Uma. I have completed my B.A and am currently working as a Business Owner at Self Employed in Tiruppur. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'middle_class', 'Retired Employee', 'Homemaker', false, true, true, 100, NOW() - INTERVAL '4 days')
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
VALUES ('00000000-0000-4000-a000-0000000001e7', 'TM000487', 'Sundar Moorthy', 'male', '1988-12-09', 177, 'never_married', 'Hindu', 'Naicker', 'Naicker subcaste', 'no', 'B.Com', 'B.Com Graduate', 'Software Engineer', 'Software Engineer Details', '₹15 Lakhs - ₹20 Lakhs', 'Infosys', 'Tiruchirappalli', 'Trichy', 'Hi, I am Sundar. I have completed my B.Com and am currently working as a Software Engineer at Infosys in Tiruchirappalli. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'middle_class', 'Retired Employee', 'Homemaker', true, true, true, 100, NOW() - INTERVAL '0 days')
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
VALUES ('00000000-0000-4000-a000-0000000001e8', 'TM000488', 'Oviya Moorthy', 'female', '2001-05-14', 165, 'divorced', 'Hindu', 'Arunthathiyar', 'Arunthathiyar subcaste', 'no', 'M.B.A', 'M.B.A Graduate', 'College Professor', 'College Professor Details', '₹15 Lakhs - ₹20 Lakhs', 'Private Practice', 'Tiruchirappalli', 'Trichy', 'Hi, I am Oviya. I have completed my M.B.A and am currently working as a College Professor at Private Practice in Tiruchirappalli. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'middle_class', 'Retired Employee', 'Homemaker', false, false, true, 100, NOW() - INTERVAL '10 days')
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
VALUES ('00000000-0000-4000-a000-0000000001e9', 'TM000489', 'Velmurugan Murthy', 'male', '2004-03-19', 182, 'never_married', 'Hindu', 'Yadav', NULL, 'no', 'B.Com', 'B.Com Graduate', 'Bank Manager', 'Bank Manager Details', '₹20 Lakhs+', 'Wipro', 'Tirunelveli', 'Tirunelveli', 'Hi, I am Velmurugan. I have completed my B.Com and am currently working as a Bank Manager at Wipro in Tirunelveli. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'joint', 'middle_class', 'Retired Employee', 'Homemaker', false, false, true, 100, NOW() - INTERVAL '0 days')
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
VALUES ('00000000-0000-4000-a000-0000000001ea', 'TM000490', 'Shanthi Naicker', 'female', '2001-05-28', 157, 'never_married', 'Hindu', 'Arunthathiyar', NULL, 'no', 'B.Com', 'B.Com Graduate', 'Doctor', 'Doctor Details', '₹5 Lakhs - ₹7 Lakhs', 'Wipro', 'Chennai', 'Chennai', 'Hi, I am Shanthi. I have completed my B.Com and am currently working as a Doctor at Wipro in Chennai. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'rich', 'Retired Employee', 'Homemaker', true, false, true, 100, NOW() - INTERVAL '3 days')
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
VALUES ('00000000-0000-4000-a000-0000000001eb', 'TM000491', 'Manikandan Mani', 'male', '1989-08-28', 179, 'never_married', 'Christian', 'Vellalar Christian', NULL, 'no', 'B.Ed', 'B.Ed Graduate', 'Architect', 'Architect Details', '₹3 Lakhs - ₹5 Lakhs', 'Wipro', 'Madurai', 'Madurai', 'Hi, I am Manikandan. I have completed my B.Ed and am currently working as a Architect at Wipro in Madurai. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'rich', 'Retired Employee', 'Homemaker', false, false, true, 100, NOW() - INTERVAL '9 days')
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
VALUES ('00000000-0000-4000-a000-0000000001ec', 'TM000492', 'Vidya Kumar', 'female', '2003-10-12', 152, 'never_married', 'Hindu', 'Devendra Kula Vellalar', 'Devendra Kula Vellalar subcaste', 'no', 'B.Com', 'B.Com Graduate', 'Dentist', 'Dentist Details', '₹10 Lakhs - ₹15 Lakhs', 'Infosys', 'Erode', 'Erode', 'Hi, I am Vidya. I have completed my B.Com and am currently working as a Dentist at Infosys in Erode. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'rich', 'Retired Employee', 'Homemaker', true, false, true, 100, NOW() - INTERVAL '3 days')
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
VALUES ('00000000-0000-4000-a000-0000000001ed', 'TM000493', 'Rajesh Naicker', 'male', '1989-12-24', 164, 'never_married', 'Hindu', 'Brahmin - Iyengar', 'Brahmin - Iyengar subcaste', 'no', 'B.Com', 'B.Com Graduate', 'Auditor', 'Auditor Details', '₹20 Lakhs+', 'TCS', 'Madurai', 'Madurai', 'Hi, I am Rajesh. I have completed my B.Com and am currently working as a Auditor at TCS in Madurai. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'joint', 'middle_class', 'Retired Employee', 'Homemaker', true, false, true, 100, NOW() - INTERVAL '7 days')
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
VALUES ('00000000-0000-4000-a000-0000000001ee', 'TM000494', 'Preethi Nathan', 'female', '1990-05-19', 166, 'never_married', 'Muslim', 'Rawther', NULL, 'no', 'M.Com', 'M.Com Graduate', 'Dentist', 'Dentist Details', '₹5 Lakhs - ₹7 Lakhs', 'Cognizant', 'Vellore', 'Vellore', 'Hi, I am Preethi. I have completed my M.Com and am currently working as a Dentist at Cognizant in Vellore. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'upper_middle_class', 'Retired Employee', 'Homemaker', true, false, true, 100, NOW() - INTERVAL '3 days')
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
VALUES ('00000000-0000-4000-a000-0000000001ef', 'TM000495', 'Bala Swamy', 'male', '2002-07-13', 180, 'never_married', 'Hindu', 'Agamudayar', NULL, 'yes', 'B.A', 'B.A Graduate', 'Civil Engineer', 'Civil Engineer Details', '₹15 Lakhs - ₹20 Lakhs', 'Self Employed', 'Kanchipuram', 'Kanchipuram', 'Hi, I am Bala. I have completed my B.A and am currently working as a Civil Engineer at Self Employed in Kanchipuram. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'joint', 'rich', 'Retired Employee', 'Homemaker', false, false, true, 100, NOW() - INTERVAL '9 days')
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
VALUES ('00000000-0000-4000-a000-0000000001f0', 'TM000496', 'Divya Mani', 'female', '1994-08-14', 153, 'never_married', 'Hindu', 'Vishwakarma', NULL, 'no', 'Ph.D', 'Ph.D Graduate', 'Doctor', 'Doctor Details', '₹20 Lakhs+', 'Zoho', 'Coimbatore', 'Coimbatore', 'Hi, I am Divya. I have completed my Ph.D and am currently working as a Doctor at Zoho in Coimbatore. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'upper_middle_class', 'Retired Employee', 'Homemaker', true, false, true, 100, NOW() - INTERVAL '5 days')
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
VALUES ('00000000-0000-4000-a000-0000000001f1', 'TM000497', 'Praveen Raman', 'male', '2002-08-10', 188, 'never_married', 'Hindu', 'Kallar', 'Kallar subcaste', 'no', 'B.Ed', 'B.Ed Graduate', 'School Teacher', 'School Teacher Details', '₹3 Lakhs - ₹5 Lakhs', 'Accenture', 'Thanjavur', 'Thanjavur', 'Hi, I am Praveen. I have completed my B.Ed and am currently working as a School Teacher at Accenture in Thanjavur. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'rich', 'Retired Employee', 'Homemaker', false, true, true, 100, NOW() - INTERVAL '10 days')
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
VALUES ('00000000-0000-4000-a000-0000000001f2', 'TM000498', 'Nandhini Kumar', 'female', '1993-07-17', 156, 'never_married', 'Hindu', 'Naicker', NULL, 'no', 'M.A', 'M.A Graduate', 'Pharmacist', 'Pharmacist Details', '₹10 Lakhs - ₹15 Lakhs', 'Accenture', 'Chennai', 'Chennai', 'Hi, I am Nandhini. I have completed my M.A and am currently working as a Pharmacist at Accenture in Chennai. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'upper_middle_class', 'Retired Employee', 'Homemaker', true, true, true, 100, NOW() - INTERVAL '4 days')
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
VALUES ('00000000-0000-4000-a000-0000000001f3', 'TM000499', 'Ajith Samy', 'male', '2000-11-27', 174, 'never_married', 'Muslim', 'Shia Muslim', 'Shia Muslim subcaste', 'yes', 'M.B.A', 'M.B.A Graduate', 'HR Specialist', 'HR Specialist Details', '₹3 Lakhs - ₹5 Lakhs', 'Zoho', 'Erode', 'Erode', 'Hi, I am Ajith. I have completed my M.B.A and am currently working as a HR Specialist at Zoho in Erode. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'rich', 'Retired Employee', 'Homemaker', true, false, true, 100, NOW() - INTERVAL '9 days')
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
VALUES ('00000000-0000-4000-a000-0000000001f4', 'TM000500', 'Kokila Nathan', 'female', '1988-02-20', 165, 'never_married', 'Hindu', 'Thevar', 'Thevar subcaste', 'no', 'Ph.D', 'Ph.D Graduate', 'Doctor', 'Doctor Details', '₹20 Lakhs+', 'TCS', 'Madurai', 'Madurai', 'Hi, I am Kokila. I have completed my Ph.D and am currently working as a Doctor at TCS in Madurai. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'rich', 'Retired Employee', 'Homemaker', true, true, true, 100, NOW() - INTERVAL '7 days')
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
VALUES ('00000000-0000-4000-a000-000000000155', 'Aslesha', 'Kumbam', 'Kumbam', 'Agastya', 'no')
ON CONFLICT (user_id) DO UPDATE SET
  star = EXCLUDED.star,
  raasi = EXCLUDED.raasi,
  lagnam = EXCLUDED.lagnam,
  gothram = EXCLUDED.gothram,
  manglik = EXCLUDED.manglik;
INSERT INTO public.horoscope_details (user_id, star, raasi, lagnam, gothram, manglik)
VALUES ('00000000-0000-4000-a000-000000000156', 'Uttarabhadrapada', 'Meenam', 'Mesham', 'Bharadwaj', 'no')
ON CONFLICT (user_id) DO UPDATE SET
  star = EXCLUDED.star,
  raasi = EXCLUDED.raasi,
  lagnam = EXCLUDED.lagnam,
  gothram = EXCLUDED.gothram,
  manglik = EXCLUDED.manglik;
INSERT INTO public.horoscope_details (user_id, star, raasi, lagnam, gothram, manglik)
VALUES ('00000000-0000-4000-a000-000000000157', 'Mirgashira', 'Kumbam', 'Mesham', 'Angirasa', 'no')
ON CONFLICT (user_id) DO UPDATE SET
  star = EXCLUDED.star,
  raasi = EXCLUDED.raasi,
  lagnam = EXCLUDED.lagnam,
  gothram = EXCLUDED.gothram,
  manglik = EXCLUDED.manglik;
INSERT INTO public.horoscope_details (user_id, star, raasi, lagnam, gothram, manglik)
VALUES ('00000000-0000-4000-a000-000000000158', 'Poorvashadha', 'Rishabam', 'Dhanusu', 'Murugan', 'no')
ON CONFLICT (user_id) DO UPDATE SET
  star = EXCLUDED.star,
  raasi = EXCLUDED.raasi,
  lagnam = EXCLUDED.lagnam,
  gothram = EXCLUDED.gothram,
  manglik = EXCLUDED.manglik;
INSERT INTO public.horoscope_details (user_id, star, raasi, lagnam, gothram, manglik)
VALUES ('00000000-0000-4000-a000-000000000159', 'Uttarachadha', 'Viruchigam', 'Viruchigam', 'Atri', 'no')
ON CONFLICT (user_id) DO UPDATE SET
  star = EXCLUDED.star,
  raasi = EXCLUDED.raasi,
  lagnam = EXCLUDED.lagnam,
  gothram = EXCLUDED.gothram,
  manglik = EXCLUDED.manglik;
INSERT INTO public.horoscope_details (user_id, star, raasi, lagnam, gothram, manglik)
VALUES ('00000000-0000-4000-a000-00000000015a', 'Jyeshta', 'Simham', 'Magaram', 'Bharadwaj', 'no')
ON CONFLICT (user_id) DO UPDATE SET
  star = EXCLUDED.star,
  raasi = EXCLUDED.raasi,
  lagnam = EXCLUDED.lagnam,
  gothram = EXCLUDED.gothram,
  manglik = EXCLUDED.manglik;
INSERT INTO public.horoscope_details (user_id, star, raasi, lagnam, gothram, manglik)
VALUES ('00000000-0000-4000-a000-00000000015b', 'Jyeshta', 'Viruchigam', 'Kadagam', 'Viswamitra', 'no')
ON CONFLICT (user_id) DO UPDATE SET
  star = EXCLUDED.star,
  raasi = EXCLUDED.raasi,
  lagnam = EXCLUDED.lagnam,
  gothram = EXCLUDED.gothram,
  manglik = EXCLUDED.manglik;
INSERT INTO public.horoscope_details (user_id, star, raasi, lagnam, gothram, manglik)
VALUES ('00000000-0000-4000-a000-00000000015c', 'Krittika', 'Kumbam', 'Mesham', 'Murugan', 'yes')
ON CONFLICT (user_id) DO UPDATE SET
  star = EXCLUDED.star,
  raasi = EXCLUDED.raasi,
  lagnam = EXCLUDED.lagnam,
  gothram = EXCLUDED.gothram,
  manglik = EXCLUDED.manglik;
INSERT INTO public.horoscope_details (user_id, star, raasi, lagnam, gothram, manglik)
VALUES ('00000000-0000-4000-a000-00000000015d', 'Mirgashira', 'Simham', 'Rishabam', 'Atri', 'yes')
ON CONFLICT (user_id) DO UPDATE SET
  star = EXCLUDED.star,
  raasi = EXCLUDED.raasi,
  lagnam = EXCLUDED.lagnam,
  gothram = EXCLUDED.gothram,
  manglik = EXCLUDED.manglik;
INSERT INTO public.horoscope_details (user_id, star, raasi, lagnam, gothram, manglik)
VALUES ('00000000-0000-4000-a000-00000000015e', 'Moola', 'Kumbam', 'Mesham', 'Harita', 'yes')
ON CONFLICT (user_id) DO UPDATE SET
  star = EXCLUDED.star,
  raasi = EXCLUDED.raasi,
  lagnam = EXCLUDED.lagnam,
  gothram = EXCLUDED.gothram,
  manglik = EXCLUDED.manglik;
INSERT INTO public.horoscope_details (user_id, star, raasi, lagnam, gothram, manglik)
VALUES ('00000000-0000-4000-a000-00000000015f', 'Uttaraphalguni', 'Mithunam', 'Viruchigam', 'Murugan', 'yes')
ON CONFLICT (user_id) DO UPDATE SET
  star = EXCLUDED.star,
  raasi = EXCLUDED.raasi,
  lagnam = EXCLUDED.lagnam,
  gothram = EXCLUDED.gothram,
  manglik = EXCLUDED.manglik;
INSERT INTO public.horoscope_details (user_id, star, raasi, lagnam, gothram, manglik)
VALUES ('00000000-0000-4000-a000-000000000160', 'Krittika', 'Magaram', 'Viruchigam', 'Murugan', 'no')
ON CONFLICT (user_id) DO UPDATE SET
  star = EXCLUDED.star,
  raasi = EXCLUDED.raasi,
  lagnam = EXCLUDED.lagnam,
  gothram = EXCLUDED.gothram,
  manglik = EXCLUDED.manglik;
INSERT INTO public.horoscope_details (user_id, star, raasi, lagnam, gothram, manglik)
VALUES ('00000000-0000-4000-a000-000000000161', 'Mirgashira', 'Mithunam', 'Magaram', 'Vashishta', 'no')
ON CONFLICT (user_id) DO UPDATE SET
  star = EXCLUDED.star,
  raasi = EXCLUDED.raasi,
  lagnam = EXCLUDED.lagnam,
  gothram = EXCLUDED.gothram,
  manglik = EXCLUDED.manglik;
INSERT INTO public.horoscope_details (user_id, star, raasi, lagnam, gothram, manglik)
VALUES ('00000000-0000-4000-a000-000000000162', 'Uttarachadha', 'Dhanusu', 'Magaram', 'Agastya', 'no')
ON CONFLICT (user_id) DO UPDATE SET
  star = EXCLUDED.star,
  raasi = EXCLUDED.raasi,
  lagnam = EXCLUDED.lagnam,
  gothram = EXCLUDED.gothram,
  manglik = EXCLUDED.manglik;
INSERT INTO public.horoscope_details (user_id, star, raasi, lagnam, gothram, manglik)
VALUES ('00000000-0000-4000-a000-000000000163', 'Aslesha', 'Rishabam', 'Rishabam', 'Atri', 'no')
ON CONFLICT (user_id) DO UPDATE SET
  star = EXCLUDED.star,
  raasi = EXCLUDED.raasi,
  lagnam = EXCLUDED.lagnam,
  gothram = EXCLUDED.gothram,
  manglik = EXCLUDED.manglik;
INSERT INTO public.horoscope_details (user_id, star, raasi, lagnam, gothram, manglik)
VALUES ('00000000-0000-4000-a000-000000000164', 'Magha', 'Mithunam', 'Dhanusu', 'Harita', 'no')
ON CONFLICT (user_id) DO UPDATE SET
  star = EXCLUDED.star,
  raasi = EXCLUDED.raasi,
  lagnam = EXCLUDED.lagnam,
  gothram = EXCLUDED.gothram,
  manglik = EXCLUDED.manglik;
INSERT INTO public.horoscope_details (user_id, star, raasi, lagnam, gothram, manglik)
VALUES ('00000000-0000-4000-a000-000000000165', 'Shravana', 'Magaram', 'Kadagam', 'Bharadwaj', 'no')
ON CONFLICT (user_id) DO UPDATE SET
  star = EXCLUDED.star,
  raasi = EXCLUDED.raasi,
  lagnam = EXCLUDED.lagnam,
  gothram = EXCLUDED.gothram,
  manglik = EXCLUDED.manglik;
INSERT INTO public.horoscope_details (user_id, star, raasi, lagnam, gothram, manglik)
VALUES ('00000000-0000-4000-a000-000000000166', 'Revati', 'Kadagam', 'Meenam', 'Gautama', 'no')
ON CONFLICT (user_id) DO UPDATE SET
  star = EXCLUDED.star,
  raasi = EXCLUDED.raasi,
  lagnam = EXCLUDED.lagnam,
  gothram = EXCLUDED.gothram,
  manglik = EXCLUDED.manglik;
INSERT INTO public.horoscope_details (user_id, star, raasi, lagnam, gothram, manglik)
VALUES ('00000000-0000-4000-a000-000000000167', 'Moola', 'Mithunam', 'Meenam', 'Atri', 'no')
ON CONFLICT (user_id) DO UPDATE SET
  star = EXCLUDED.star,
  raasi = EXCLUDED.raasi,
  lagnam = EXCLUDED.lagnam,
  gothram = EXCLUDED.gothram,
  manglik = EXCLUDED.manglik;
INSERT INTO public.horoscope_details (user_id, star, raasi, lagnam, gothram, manglik)
VALUES ('00000000-0000-4000-a000-000000000168', 'Uttarabhadrapada', 'Meenam', 'Meenam', 'Vishnu', 'no')
ON CONFLICT (user_id) DO UPDATE SET
  star = EXCLUDED.star,
  raasi = EXCLUDED.raasi,
  lagnam = EXCLUDED.lagnam,
  gothram = EXCLUDED.gothram,
  manglik = EXCLUDED.manglik;
INSERT INTO public.horoscope_details (user_id, star, raasi, lagnam, gothram, manglik)
VALUES ('00000000-0000-4000-a000-000000000169', 'Ashwini', 'Kadagam', 'Kadagam', 'Viswamitra', 'yes')
ON CONFLICT (user_id) DO UPDATE SET
  star = EXCLUDED.star,
  raasi = EXCLUDED.raasi,
  lagnam = EXCLUDED.lagnam,
  gothram = EXCLUDED.gothram,
  manglik = EXCLUDED.manglik;
INSERT INTO public.horoscope_details (user_id, star, raasi, lagnam, gothram, manglik)
VALUES ('00000000-0000-4000-a000-00000000016a', 'Poorvabhadrapada', 'Meenam', 'Magaram', 'Agastya', 'no')
ON CONFLICT (user_id) DO UPDATE SET
  star = EXCLUDED.star,
  raasi = EXCLUDED.raasi,
  lagnam = EXCLUDED.lagnam,
  gothram = EXCLUDED.gothram,
  manglik = EXCLUDED.manglik;
INSERT INTO public.horoscope_details (user_id, star, raasi, lagnam, gothram, manglik)
VALUES ('00000000-0000-4000-a000-00000000016b', 'Magha', 'Thulaam', 'Kanni', 'Atri', 'no')
ON CONFLICT (user_id) DO UPDATE SET
  star = EXCLUDED.star,
  raasi = EXCLUDED.raasi,
  lagnam = EXCLUDED.lagnam,
  gothram = EXCLUDED.gothram,
  manglik = EXCLUDED.manglik;
INSERT INTO public.horoscope_details (user_id, star, raasi, lagnam, gothram, manglik)
VALUES ('00000000-0000-4000-a000-00000000016c', 'Moola', 'Mesham', 'Meenam', 'Harita', 'no')
ON CONFLICT (user_id) DO UPDATE SET
  star = EXCLUDED.star,
  raasi = EXCLUDED.raasi,
  lagnam = EXCLUDED.lagnam,
  gothram = EXCLUDED.gothram,
  manglik = EXCLUDED.manglik;
INSERT INTO public.horoscope_details (user_id, star, raasi, lagnam, gothram, manglik)
VALUES ('00000000-0000-4000-a000-00000000016d', 'Aslesha', 'Viruchigam', 'Magaram', 'Gautama', 'no')
ON CONFLICT (user_id) DO UPDATE SET
  star = EXCLUDED.star,
  raasi = EXCLUDED.raasi,
  lagnam = EXCLUDED.lagnam,
  gothram = EXCLUDED.gothram,
  manglik = EXCLUDED.manglik;
INSERT INTO public.horoscope_details (user_id, star, raasi, lagnam, gothram, manglik)
VALUES ('00000000-0000-4000-a000-00000000016e', 'Magha', 'Mesham', 'Mithunam', 'Atri', 'no')
ON CONFLICT (user_id) DO UPDATE SET
  star = EXCLUDED.star,
  raasi = EXCLUDED.raasi,
  lagnam = EXCLUDED.lagnam,
  gothram = EXCLUDED.gothram,
  manglik = EXCLUDED.manglik;
INSERT INTO public.horoscope_details (user_id, star, raasi, lagnam, gothram, manglik)
VALUES ('00000000-0000-4000-a000-00000000016f', 'Shravana', 'Kumbam', 'Rishabam', 'Bharadwaj', 'no')
ON CONFLICT (user_id) DO UPDATE SET
  star = EXCLUDED.star,
  raasi = EXCLUDED.raasi,
  lagnam = EXCLUDED.lagnam,
  gothram = EXCLUDED.gothram,
  manglik = EXCLUDED.manglik;
INSERT INTO public.horoscope_details (user_id, star, raasi, lagnam, gothram, manglik)
VALUES ('00000000-0000-4000-a000-000000000170', 'Chitra', 'Mithunam', 'Dhanusu', 'Kasyapa', 'yes')
ON CONFLICT (user_id) DO UPDATE SET
  star = EXCLUDED.star,
  raasi = EXCLUDED.raasi,
  lagnam = EXCLUDED.lagnam,
  gothram = EXCLUDED.gothram,
  manglik = EXCLUDED.manglik;
INSERT INTO public.horoscope_details (user_id, star, raasi, lagnam, gothram, manglik)
VALUES ('00000000-0000-4000-a000-000000000171', 'Hasta', 'Thulaam', 'Mesham', 'Atri', 'no')
ON CONFLICT (user_id) DO UPDATE SET
  star = EXCLUDED.star,
  raasi = EXCLUDED.raasi,
  lagnam = EXCLUDED.lagnam,
  gothram = EXCLUDED.gothram,
  manglik = EXCLUDED.manglik;
INSERT INTO public.horoscope_details (user_id, star, raasi, lagnam, gothram, manglik)
VALUES ('00000000-0000-4000-a000-000000000172', 'Krittika', 'Kanni', 'Rishabam', 'Kasyapa', 'no')
ON CONFLICT (user_id) DO UPDATE SET
  star = EXCLUDED.star,
  raasi = EXCLUDED.raasi,
  lagnam = EXCLUDED.lagnam,
  gothram = EXCLUDED.gothram,
  manglik = EXCLUDED.manglik;
INSERT INTO public.horoscope_details (user_id, star, raasi, lagnam, gothram, manglik)
VALUES ('00000000-0000-4000-a000-000000000173', 'Anuradha', 'Dhanusu', 'Rishabam', 'Siva', 'no')
ON CONFLICT (user_id) DO UPDATE SET
  star = EXCLUDED.star,
  raasi = EXCLUDED.raasi,
  lagnam = EXCLUDED.lagnam,
  gothram = EXCLUDED.gothram,
  manglik = EXCLUDED.manglik;
INSERT INTO public.horoscope_details (user_id, star, raasi, lagnam, gothram, manglik)
VALUES ('00000000-0000-4000-a000-000000000174', 'Krittika', 'Kanni', 'Mithunam', 'Vashishta', 'no')
ON CONFLICT (user_id) DO UPDATE SET
  star = EXCLUDED.star,
  raasi = EXCLUDED.raasi,
  lagnam = EXCLUDED.lagnam,
  gothram = EXCLUDED.gothram,
  manglik = EXCLUDED.manglik;
INSERT INTO public.horoscope_details (user_id, star, raasi, lagnam, gothram, manglik)
VALUES ('00000000-0000-4000-a000-000000000175', 'Anuradha', 'Mesham', 'Kadagam', 'Atri', 'no')
ON CONFLICT (user_id) DO UPDATE SET
  star = EXCLUDED.star,
  raasi = EXCLUDED.raasi,
  lagnam = EXCLUDED.lagnam,
  gothram = EXCLUDED.gothram,
  manglik = EXCLUDED.manglik;
INSERT INTO public.horoscope_details (user_id, star, raasi, lagnam, gothram, manglik)
VALUES ('00000000-0000-4000-a000-000000000176', 'Rohini', 'Kumbam', 'Viruchigam', 'Agastya', 'no')
ON CONFLICT (user_id) DO UPDATE SET
  star = EXCLUDED.star,
  raasi = EXCLUDED.raasi,
  lagnam = EXCLUDED.lagnam,
  gothram = EXCLUDED.gothram,
  manglik = EXCLUDED.manglik;
INSERT INTO public.horoscope_details (user_id, star, raasi, lagnam, gothram, manglik)
VALUES ('00000000-0000-4000-a000-000000000177', 'Vishakha', 'Mithunam', 'Rishabam', 'Vashishta', 'no')
ON CONFLICT (user_id) DO UPDATE SET
  star = EXCLUDED.star,
  raasi = EXCLUDED.raasi,
  lagnam = EXCLUDED.lagnam,
  gothram = EXCLUDED.gothram,
  manglik = EXCLUDED.manglik;
INSERT INTO public.horoscope_details (user_id, star, raasi, lagnam, gothram, manglik)
VALUES ('00000000-0000-4000-a000-000000000178', 'Bharani', 'Thulaam', 'Rishabam', 'Agastya', 'no')
ON CONFLICT (user_id) DO UPDATE SET
  star = EXCLUDED.star,
  raasi = EXCLUDED.raasi,
  lagnam = EXCLUDED.lagnam,
  gothram = EXCLUDED.gothram,
  manglik = EXCLUDED.manglik;
INSERT INTO public.horoscope_details (user_id, star, raasi, lagnam, gothram, manglik)
VALUES ('00000000-0000-4000-a000-000000000179', 'Chitra', 'Mithunam', 'Kumbam', 'Atri', 'no')
ON CONFLICT (user_id) DO UPDATE SET
  star = EXCLUDED.star,
  raasi = EXCLUDED.raasi,
  lagnam = EXCLUDED.lagnam,
  gothram = EXCLUDED.gothram,
  manglik = EXCLUDED.manglik;
INSERT INTO public.horoscope_details (user_id, star, raasi, lagnam, gothram, manglik)
VALUES ('00000000-0000-4000-a000-00000000017a', 'Uttarachadha', 'Meenam', 'Viruchigam', 'Gautama', 'no')
ON CONFLICT (user_id) DO UPDATE SET
  star = EXCLUDED.star,
  raasi = EXCLUDED.raasi,
  lagnam = EXCLUDED.lagnam,
  gothram = EXCLUDED.gothram,
  manglik = EXCLUDED.manglik;
INSERT INTO public.horoscope_details (user_id, star, raasi, lagnam, gothram, manglik)
VALUES ('00000000-0000-4000-a000-00000000017b', 'Krittika', 'Thulaam', 'Kanni', 'Agastya', 'no')
ON CONFLICT (user_id) DO UPDATE SET
  star = EXCLUDED.star,
  raasi = EXCLUDED.raasi,
  lagnam = EXCLUDED.lagnam,
  gothram = EXCLUDED.gothram,
  manglik = EXCLUDED.manglik;
INSERT INTO public.horoscope_details (user_id, star, raasi, lagnam, gothram, manglik)
VALUES ('00000000-0000-4000-a000-00000000017c', 'Arudra', 'Mithunam', 'Meenam', 'Kasyapa', 'no')
ON CONFLICT (user_id) DO UPDATE SET
  star = EXCLUDED.star,
  raasi = EXCLUDED.raasi,
  lagnam = EXCLUDED.lagnam,
  gothram = EXCLUDED.gothram,
  manglik = EXCLUDED.manglik;
INSERT INTO public.horoscope_details (user_id, star, raasi, lagnam, gothram, manglik)
VALUES ('00000000-0000-4000-a000-00000000017d', 'Mirgashira', 'Thulaam', 'Rishabam', 'Gautama', 'no')
ON CONFLICT (user_id) DO UPDATE SET
  star = EXCLUDED.star,
  raasi = EXCLUDED.raasi,
  lagnam = EXCLUDED.lagnam,
  gothram = EXCLUDED.gothram,
  manglik = EXCLUDED.manglik;
INSERT INTO public.horoscope_details (user_id, star, raasi, lagnam, gothram, manglik)
VALUES ('00000000-0000-4000-a000-00000000017e', 'Vishakha', 'Rishabam', 'Mithunam', 'Vashishta', 'no')
ON CONFLICT (user_id) DO UPDATE SET
  star = EXCLUDED.star,
  raasi = EXCLUDED.raasi,
  lagnam = EXCLUDED.lagnam,
  gothram = EXCLUDED.gothram,
  manglik = EXCLUDED.manglik;
INSERT INTO public.horoscope_details (user_id, star, raasi, lagnam, gothram, manglik)
VALUES ('00000000-0000-4000-a000-00000000017f', 'Aslesha', 'Mesham', 'Mesham', 'Siva', 'no')
ON CONFLICT (user_id) DO UPDATE SET
  star = EXCLUDED.star,
  raasi = EXCLUDED.raasi,
  lagnam = EXCLUDED.lagnam,
  gothram = EXCLUDED.gothram,
  manglik = EXCLUDED.manglik;
INSERT INTO public.horoscope_details (user_id, star, raasi, lagnam, gothram, manglik)
VALUES ('00000000-0000-4000-a000-000000000180', 'Arudra', 'Mesham', 'Thulaam', 'Gautama', 'no')
ON CONFLICT (user_id) DO UPDATE SET
  star = EXCLUDED.star,
  raasi = EXCLUDED.raasi,
  lagnam = EXCLUDED.lagnam,
  gothram = EXCLUDED.gothram,
  manglik = EXCLUDED.manglik;
INSERT INTO public.horoscope_details (user_id, star, raasi, lagnam, gothram, manglik)
VALUES ('00000000-0000-4000-a000-000000000181', 'Mirgashira', 'Thulaam', 'Rishabam', 'Kasyapa', 'no')
ON CONFLICT (user_id) DO UPDATE SET
  star = EXCLUDED.star,
  raasi = EXCLUDED.raasi,
  lagnam = EXCLUDED.lagnam,
  gothram = EXCLUDED.gothram,
  manglik = EXCLUDED.manglik;
INSERT INTO public.horoscope_details (user_id, star, raasi, lagnam, gothram, manglik)
VALUES ('00000000-0000-4000-a000-000000000182', 'Poorvabhadrapada', 'Thulaam', 'Magaram', 'Siva', 'no')
ON CONFLICT (user_id) DO UPDATE SET
  star = EXCLUDED.star,
  raasi = EXCLUDED.raasi,
  lagnam = EXCLUDED.lagnam,
  gothram = EXCLUDED.gothram,
  manglik = EXCLUDED.manglik;
INSERT INTO public.horoscope_details (user_id, star, raasi, lagnam, gothram, manglik)
VALUES ('00000000-0000-4000-a000-000000000183', 'Hasta', 'Kanni', 'Rishabam', 'Vishnu', 'no')
ON CONFLICT (user_id) DO UPDATE SET
  star = EXCLUDED.star,
  raasi = EXCLUDED.raasi,
  lagnam = EXCLUDED.lagnam,
  gothram = EXCLUDED.gothram,
  manglik = EXCLUDED.manglik;
INSERT INTO public.horoscope_details (user_id, star, raasi, lagnam, gothram, manglik)
VALUES ('00000000-0000-4000-a000-000000000184', 'Dhanishta', 'Mesham', 'Meenam', 'Harita', 'no')
ON CONFLICT (user_id) DO UPDATE SET
  star = EXCLUDED.star,
  raasi = EXCLUDED.raasi,
  lagnam = EXCLUDED.lagnam,
  gothram = EXCLUDED.gothram,
  manglik = EXCLUDED.manglik;
INSERT INTO public.horoscope_details (user_id, star, raasi, lagnam, gothram, manglik)
VALUES ('00000000-0000-4000-a000-000000000185', 'Uttarabhadrapada', 'Thulaam', 'Rishabam', 'Atri', 'no')
ON CONFLICT (user_id) DO UPDATE SET
  star = EXCLUDED.star,
  raasi = EXCLUDED.raasi,
  lagnam = EXCLUDED.lagnam,
  gothram = EXCLUDED.gothram,
  manglik = EXCLUDED.manglik;
INSERT INTO public.horoscope_details (user_id, star, raasi, lagnam, gothram, manglik)
VALUES ('00000000-0000-4000-a000-000000000186', 'Bharani', 'Thulaam', 'Dhanusu', 'Atri', 'no')
ON CONFLICT (user_id) DO UPDATE SET
  star = EXCLUDED.star,
  raasi = EXCLUDED.raasi,
  lagnam = EXCLUDED.lagnam,
  gothram = EXCLUDED.gothram,
  manglik = EXCLUDED.manglik;
INSERT INTO public.horoscope_details (user_id, star, raasi, lagnam, gothram, manglik)
VALUES ('00000000-0000-4000-a000-000000000187', 'Moola', 'Viruchigam', 'Rishabam', 'Vashishta', 'no')
ON CONFLICT (user_id) DO UPDATE SET
  star = EXCLUDED.star,
  raasi = EXCLUDED.raasi,
  lagnam = EXCLUDED.lagnam,
  gothram = EXCLUDED.gothram,
  manglik = EXCLUDED.manglik;
INSERT INTO public.horoscope_details (user_id, star, raasi, lagnam, gothram, manglik)
VALUES ('00000000-0000-4000-a000-000000000188', 'Jyeshta', 'Simham', 'Kumbam', 'Angirasa', 'no')
ON CONFLICT (user_id) DO UPDATE SET
  star = EXCLUDED.star,
  raasi = EXCLUDED.raasi,
  lagnam = EXCLUDED.lagnam,
  gothram = EXCLUDED.gothram,
  manglik = EXCLUDED.manglik;
INSERT INTO public.horoscope_details (user_id, star, raasi, lagnam, gothram, manglik)
VALUES ('00000000-0000-4000-a000-000000000189', 'Uttarachadha', 'Dhanusu', 'Meenam', 'Atri', 'no')
ON CONFLICT (user_id) DO UPDATE SET
  star = EXCLUDED.star,
  raasi = EXCLUDED.raasi,
  lagnam = EXCLUDED.lagnam,
  gothram = EXCLUDED.gothram,
  manglik = EXCLUDED.manglik;
INSERT INTO public.horoscope_details (user_id, star, raasi, lagnam, gothram, manglik)
VALUES ('00000000-0000-4000-a000-00000000018a', 'Jyeshta', 'Magaram', 'Mesham', 'Bharadwaj', 'no')
ON CONFLICT (user_id) DO UPDATE SET
  star = EXCLUDED.star,
  raasi = EXCLUDED.raasi,
  lagnam = EXCLUDED.lagnam,
  gothram = EXCLUDED.gothram,
  manglik = EXCLUDED.manglik;
INSERT INTO public.horoscope_details (user_id, star, raasi, lagnam, gothram, manglik)
VALUES ('00000000-0000-4000-a000-00000000018b', 'Vishakha', 'Thulaam', 'Meenam', 'Vishnu', 'no')
ON CONFLICT (user_id) DO UPDATE SET
  star = EXCLUDED.star,
  raasi = EXCLUDED.raasi,
  lagnam = EXCLUDED.lagnam,
  gothram = EXCLUDED.gothram,
  manglik = EXCLUDED.manglik;
INSERT INTO public.horoscope_details (user_id, star, raasi, lagnam, gothram, manglik)
VALUES ('00000000-0000-4000-a000-00000000018c', 'Arudra', 'Meenam', 'Viruchigam', 'Atri', 'no')
ON CONFLICT (user_id) DO UPDATE SET
  star = EXCLUDED.star,
  raasi = EXCLUDED.raasi,
  lagnam = EXCLUDED.lagnam,
  gothram = EXCLUDED.gothram,
  manglik = EXCLUDED.manglik;
INSERT INTO public.horoscope_details (user_id, star, raasi, lagnam, gothram, manglik)
VALUES ('00000000-0000-4000-a000-00000000018d', 'Poorvaphalguni', 'Rishabam', 'Thulaam', 'Kasyapa', 'no')
ON CONFLICT (user_id) DO UPDATE SET
  star = EXCLUDED.star,
  raasi = EXCLUDED.raasi,
  lagnam = EXCLUDED.lagnam,
  gothram = EXCLUDED.gothram,
  manglik = EXCLUDED.manglik;
INSERT INTO public.horoscope_details (user_id, star, raasi, lagnam, gothram, manglik)
VALUES ('00000000-0000-4000-a000-00000000018e', 'Hasta', 'Kumbam', 'Mesham', 'Kasyapa', 'no')
ON CONFLICT (user_id) DO UPDATE SET
  star = EXCLUDED.star,
  raasi = EXCLUDED.raasi,
  lagnam = EXCLUDED.lagnam,
  gothram = EXCLUDED.gothram,
  manglik = EXCLUDED.manglik;
INSERT INTO public.horoscope_details (user_id, star, raasi, lagnam, gothram, manglik)
VALUES ('00000000-0000-4000-a000-00000000018f', 'Hasta', 'Simham', 'Rishabam', 'Vashishta', 'no')
ON CONFLICT (user_id) DO UPDATE SET
  star = EXCLUDED.star,
  raasi = EXCLUDED.raasi,
  lagnam = EXCLUDED.lagnam,
  gothram = EXCLUDED.gothram,
  manglik = EXCLUDED.manglik;
INSERT INTO public.horoscope_details (user_id, star, raasi, lagnam, gothram, manglik)
VALUES ('00000000-0000-4000-a000-000000000190', 'Krittika', 'Dhanusu', 'Mesham', 'Atri', 'no')
ON CONFLICT (user_id) DO UPDATE SET
  star = EXCLUDED.star,
  raasi = EXCLUDED.raasi,
  lagnam = EXCLUDED.lagnam,
  gothram = EXCLUDED.gothram,
  manglik = EXCLUDED.manglik;
INSERT INTO public.horoscope_details (user_id, star, raasi, lagnam, gothram, manglik)
VALUES ('00000000-0000-4000-a000-000000000191', 'Krittika', 'Magaram', 'Kumbam', 'Vashishta', 'no')
ON CONFLICT (user_id) DO UPDATE SET
  star = EXCLUDED.star,
  raasi = EXCLUDED.raasi,
  lagnam = EXCLUDED.lagnam,
  gothram = EXCLUDED.gothram,
  manglik = EXCLUDED.manglik;
INSERT INTO public.horoscope_details (user_id, star, raasi, lagnam, gothram, manglik)
VALUES ('00000000-0000-4000-a000-000000000192', 'Arudra', 'Mesham', 'Kadagam', 'Harita', 'yes')
ON CONFLICT (user_id) DO UPDATE SET
  star = EXCLUDED.star,
  raasi = EXCLUDED.raasi,
  lagnam = EXCLUDED.lagnam,
  gothram = EXCLUDED.gothram,
  manglik = EXCLUDED.manglik;
INSERT INTO public.horoscope_details (user_id, star, raasi, lagnam, gothram, manglik)
VALUES ('00000000-0000-4000-a000-000000000193', 'Pushya', 'Kadagam', 'Dhanusu', 'Kasyapa', 'no')
ON CONFLICT (user_id) DO UPDATE SET
  star = EXCLUDED.star,
  raasi = EXCLUDED.raasi,
  lagnam = EXCLUDED.lagnam,
  gothram = EXCLUDED.gothram,
  manglik = EXCLUDED.manglik;
INSERT INTO public.horoscope_details (user_id, star, raasi, lagnam, gothram, manglik)
VALUES ('00000000-0000-4000-a000-000000000194', 'Poorvashadha', 'Rishabam', 'Magaram', 'Murugan', 'yes')
ON CONFLICT (user_id) DO UPDATE SET
  star = EXCLUDED.star,
  raasi = EXCLUDED.raasi,
  lagnam = EXCLUDED.lagnam,
  gothram = EXCLUDED.gothram,
  manglik = EXCLUDED.manglik;
INSERT INTO public.horoscope_details (user_id, star, raasi, lagnam, gothram, manglik)
VALUES ('00000000-0000-4000-a000-000000000195', 'Aslesha', 'Mesham', 'Thulaam', 'Kasyapa', 'no')
ON CONFLICT (user_id) DO UPDATE SET
  star = EXCLUDED.star,
  raasi = EXCLUDED.raasi,
  lagnam = EXCLUDED.lagnam,
  gothram = EXCLUDED.gothram,
  manglik = EXCLUDED.manglik;
INSERT INTO public.horoscope_details (user_id, star, raasi, lagnam, gothram, manglik)
VALUES ('00000000-0000-4000-a000-000000000196', 'Rohini', 'Meenam', 'Viruchigam', 'Siva', 'no')
ON CONFLICT (user_id) DO UPDATE SET
  star = EXCLUDED.star,
  raasi = EXCLUDED.raasi,
  lagnam = EXCLUDED.lagnam,
  gothram = EXCLUDED.gothram,
  manglik = EXCLUDED.manglik;
INSERT INTO public.horoscope_details (user_id, star, raasi, lagnam, gothram, manglik)
VALUES ('00000000-0000-4000-a000-000000000197', 'Uttarabhadrapada', 'Meenam', 'Thulaam', 'Viswamitra', 'no')
ON CONFLICT (user_id) DO UPDATE SET
  star = EXCLUDED.star,
  raasi = EXCLUDED.raasi,
  lagnam = EXCLUDED.lagnam,
  gothram = EXCLUDED.gothram,
  manglik = EXCLUDED.manglik;
INSERT INTO public.horoscope_details (user_id, star, raasi, lagnam, gothram, manglik)
VALUES ('00000000-0000-4000-a000-000000000198', 'Uttaraphalguni', 'Thulaam', 'Dhanusu', 'Gautama', 'no')
ON CONFLICT (user_id) DO UPDATE SET
  star = EXCLUDED.star,
  raasi = EXCLUDED.raasi,
  lagnam = EXCLUDED.lagnam,
  gothram = EXCLUDED.gothram,
  manglik = EXCLUDED.manglik;
INSERT INTO public.horoscope_details (user_id, star, raasi, lagnam, gothram, manglik)
VALUES ('00000000-0000-4000-a000-000000000199', 'Jyeshta', 'Kanni', 'Magaram', 'Harita', 'no')
ON CONFLICT (user_id) DO UPDATE SET
  star = EXCLUDED.star,
  raasi = EXCLUDED.raasi,
  lagnam = EXCLUDED.lagnam,
  gothram = EXCLUDED.gothram,
  manglik = EXCLUDED.manglik;
INSERT INTO public.horoscope_details (user_id, star, raasi, lagnam, gothram, manglik)
VALUES ('00000000-0000-4000-a000-00000000019a', 'Punarvasu', 'Viruchigam', 'Dhanusu', 'Harita', 'no')
ON CONFLICT (user_id) DO UPDATE SET
  star = EXCLUDED.star,
  raasi = EXCLUDED.raasi,
  lagnam = EXCLUDED.lagnam,
  gothram = EXCLUDED.gothram,
  manglik = EXCLUDED.manglik;
INSERT INTO public.horoscope_details (user_id, star, raasi, lagnam, gothram, manglik)
VALUES ('00000000-0000-4000-a000-00000000019b', 'Pushya', 'Simham', 'Dhanusu', 'Kasyapa', 'no')
ON CONFLICT (user_id) DO UPDATE SET
  star = EXCLUDED.star,
  raasi = EXCLUDED.raasi,
  lagnam = EXCLUDED.lagnam,
  gothram = EXCLUDED.gothram,
  manglik = EXCLUDED.manglik;
INSERT INTO public.horoscope_details (user_id, star, raasi, lagnam, gothram, manglik)
VALUES ('00000000-0000-4000-a000-00000000019c', 'Punarvasu', 'Magaram', 'Magaram', 'Gautama', 'no')
ON CONFLICT (user_id) DO UPDATE SET
  star = EXCLUDED.star,
  raasi = EXCLUDED.raasi,
  lagnam = EXCLUDED.lagnam,
  gothram = EXCLUDED.gothram,
  manglik = EXCLUDED.manglik;
INSERT INTO public.horoscope_details (user_id, star, raasi, lagnam, gothram, manglik)
VALUES ('00000000-0000-4000-a000-00000000019d', 'Ashwini', 'Kumbam', 'Kanni', 'Vishnu', 'yes')
ON CONFLICT (user_id) DO UPDATE SET
  star = EXCLUDED.star,
  raasi = EXCLUDED.raasi,
  lagnam = EXCLUDED.lagnam,
  gothram = EXCLUDED.gothram,
  manglik = EXCLUDED.manglik;
INSERT INTO public.horoscope_details (user_id, star, raasi, lagnam, gothram, manglik)
VALUES ('00000000-0000-4000-a000-00000000019e', 'Revati', 'Mithunam', 'Magaram', 'Angirasa', 'no')
ON CONFLICT (user_id) DO UPDATE SET
  star = EXCLUDED.star,
  raasi = EXCLUDED.raasi,
  lagnam = EXCLUDED.lagnam,
  gothram = EXCLUDED.gothram,
  manglik = EXCLUDED.manglik;
INSERT INTO public.horoscope_details (user_id, star, raasi, lagnam, gothram, manglik)
VALUES ('00000000-0000-4000-a000-00000000019f', 'Dhanishta', 'Thulaam', 'Simham', 'Murugan', 'no')
ON CONFLICT (user_id) DO UPDATE SET
  star = EXCLUDED.star,
  raasi = EXCLUDED.raasi,
  lagnam = EXCLUDED.lagnam,
  gothram = EXCLUDED.gothram,
  manglik = EXCLUDED.manglik;
INSERT INTO public.horoscope_details (user_id, star, raasi, lagnam, gothram, manglik)
VALUES ('00000000-0000-4000-a000-0000000001a0', 'Krittika', 'Kumbam', 'Mesham', 'Vashishta', 'no')
ON CONFLICT (user_id) DO UPDATE SET
  star = EXCLUDED.star,
  raasi = EXCLUDED.raasi,
  lagnam = EXCLUDED.lagnam,
  gothram = EXCLUDED.gothram,
  manglik = EXCLUDED.manglik;
INSERT INTO public.horoscope_details (user_id, star, raasi, lagnam, gothram, manglik)
VALUES ('00000000-0000-4000-a000-0000000001a1', 'Ashwini', 'Rishabam', 'Kadagam', 'Siva', 'no')
ON CONFLICT (user_id) DO UPDATE SET
  star = EXCLUDED.star,
  raasi = EXCLUDED.raasi,
  lagnam = EXCLUDED.lagnam,
  gothram = EXCLUDED.gothram,
  manglik = EXCLUDED.manglik;
INSERT INTO public.horoscope_details (user_id, star, raasi, lagnam, gothram, manglik)
VALUES ('00000000-0000-4000-a000-0000000001a2', 'Dhanishta', 'Thulaam', 'Magaram', 'Kasyapa', 'no')
ON CONFLICT (user_id) DO UPDATE SET
  star = EXCLUDED.star,
  raasi = EXCLUDED.raasi,
  lagnam = EXCLUDED.lagnam,
  gothram = EXCLUDED.gothram,
  manglik = EXCLUDED.manglik;
INSERT INTO public.horoscope_details (user_id, star, raasi, lagnam, gothram, manglik)
VALUES ('00000000-0000-4000-a000-0000000001a3', 'Uttarabhadrapada', 'Kanni', 'Dhanusu', 'Harita', 'no')
ON CONFLICT (user_id) DO UPDATE SET
  star = EXCLUDED.star,
  raasi = EXCLUDED.raasi,
  lagnam = EXCLUDED.lagnam,
  gothram = EXCLUDED.gothram,
  manglik = EXCLUDED.manglik;
INSERT INTO public.horoscope_details (user_id, star, raasi, lagnam, gothram, manglik)
VALUES ('00000000-0000-4000-a000-0000000001a4', 'Mirgashira', 'Rishabam', 'Kumbam', 'Murugan', 'no')
ON CONFLICT (user_id) DO UPDATE SET
  star = EXCLUDED.star,
  raasi = EXCLUDED.raasi,
  lagnam = EXCLUDED.lagnam,
  gothram = EXCLUDED.gothram,
  manglik = EXCLUDED.manglik;
INSERT INTO public.horoscope_details (user_id, star, raasi, lagnam, gothram, manglik)
VALUES ('00000000-0000-4000-a000-0000000001a5', 'Punarvasu', 'Kanni', 'Mithunam', 'Vishnu', 'no')
ON CONFLICT (user_id) DO UPDATE SET
  star = EXCLUDED.star,
  raasi = EXCLUDED.raasi,
  lagnam = EXCLUDED.lagnam,
  gothram = EXCLUDED.gothram,
  manglik = EXCLUDED.manglik;
INSERT INTO public.horoscope_details (user_id, star, raasi, lagnam, gothram, manglik)
VALUES ('00000000-0000-4000-a000-0000000001a6', 'Revati', 'Thulaam', 'Simham', 'Gautama', 'no')
ON CONFLICT (user_id) DO UPDATE SET
  star = EXCLUDED.star,
  raasi = EXCLUDED.raasi,
  lagnam = EXCLUDED.lagnam,
  gothram = EXCLUDED.gothram,
  manglik = EXCLUDED.manglik;
INSERT INTO public.horoscope_details (user_id, star, raasi, lagnam, gothram, manglik)
VALUES ('00000000-0000-4000-a000-0000000001a7', 'Jyeshta', 'Viruchigam', 'Kadagam', 'Vashishta', 'no')
ON CONFLICT (user_id) DO UPDATE SET
  star = EXCLUDED.star,
  raasi = EXCLUDED.raasi,
  lagnam = EXCLUDED.lagnam,
  gothram = EXCLUDED.gothram,
  manglik = EXCLUDED.manglik;
INSERT INTO public.horoscope_details (user_id, star, raasi, lagnam, gothram, manglik)
VALUES ('00000000-0000-4000-a000-0000000001a8', 'Aslesha', 'Viruchigam', 'Kumbam', 'Gautama', 'yes')
ON CONFLICT (user_id) DO UPDATE SET
  star = EXCLUDED.star,
  raasi = EXCLUDED.raasi,
  lagnam = EXCLUDED.lagnam,
  gothram = EXCLUDED.gothram,
  manglik = EXCLUDED.manglik;
INSERT INTO public.horoscope_details (user_id, star, raasi, lagnam, gothram, manglik)
VALUES ('00000000-0000-4000-a000-0000000001a9', 'Shatabhisha', 'Kadagam', 'Kumbam', 'Gautama', 'yes')
ON CONFLICT (user_id) DO UPDATE SET
  star = EXCLUDED.star,
  raasi = EXCLUDED.raasi,
  lagnam = EXCLUDED.lagnam,
  gothram = EXCLUDED.gothram,
  manglik = EXCLUDED.manglik;
INSERT INTO public.horoscope_details (user_id, star, raasi, lagnam, gothram, manglik)
VALUES ('00000000-0000-4000-a000-0000000001aa', 'Swati', 'Mesham', 'Kadagam', 'Gautama', 'no')
ON CONFLICT (user_id) DO UPDATE SET
  star = EXCLUDED.star,
  raasi = EXCLUDED.raasi,
  lagnam = EXCLUDED.lagnam,
  gothram = EXCLUDED.gothram,
  manglik = EXCLUDED.manglik;
INSERT INTO public.horoscope_details (user_id, star, raasi, lagnam, gothram, manglik)
VALUES ('00000000-0000-4000-a000-0000000001ab', 'Punarvasu', 'Viruchigam', 'Meenam', 'Bharadwaj', 'no')
ON CONFLICT (user_id) DO UPDATE SET
  star = EXCLUDED.star,
  raasi = EXCLUDED.raasi,
  lagnam = EXCLUDED.lagnam,
  gothram = EXCLUDED.gothram,
  manglik = EXCLUDED.manglik;
INSERT INTO public.horoscope_details (user_id, star, raasi, lagnam, gothram, manglik)
VALUES ('00000000-0000-4000-a000-0000000001ac', 'Vishakha', 'Kumbam', 'Kadagam', 'Angirasa', 'no')
ON CONFLICT (user_id) DO UPDATE SET
  star = EXCLUDED.star,
  raasi = EXCLUDED.raasi,
  lagnam = EXCLUDED.lagnam,
  gothram = EXCLUDED.gothram,
  manglik = EXCLUDED.manglik;
INSERT INTO public.horoscope_details (user_id, star, raasi, lagnam, gothram, manglik)
VALUES ('00000000-0000-4000-a000-0000000001ad', 'Ashwini', 'Viruchigam', 'Kumbam', 'Siva', 'no')
ON CONFLICT (user_id) DO UPDATE SET
  star = EXCLUDED.star,
  raasi = EXCLUDED.raasi,
  lagnam = EXCLUDED.lagnam,
  gothram = EXCLUDED.gothram,
  manglik = EXCLUDED.manglik;
INSERT INTO public.horoscope_details (user_id, star, raasi, lagnam, gothram, manglik)
VALUES ('00000000-0000-4000-a000-0000000001ae', 'Jyeshta', 'Magaram', 'Mithunam', 'Harita', 'yes')
ON CONFLICT (user_id) DO UPDATE SET
  star = EXCLUDED.star,
  raasi = EXCLUDED.raasi,
  lagnam = EXCLUDED.lagnam,
  gothram = EXCLUDED.gothram,
  manglik = EXCLUDED.manglik;
INSERT INTO public.horoscope_details (user_id, star, raasi, lagnam, gothram, manglik)
VALUES ('00000000-0000-4000-a000-0000000001af', 'Shravana', 'Viruchigam', 'Viruchigam', 'Gautama', 'yes')
ON CONFLICT (user_id) DO UPDATE SET
  star = EXCLUDED.star,
  raasi = EXCLUDED.raasi,
  lagnam = EXCLUDED.lagnam,
  gothram = EXCLUDED.gothram,
  manglik = EXCLUDED.manglik;
INSERT INTO public.horoscope_details (user_id, star, raasi, lagnam, gothram, manglik)
VALUES ('00000000-0000-4000-a000-0000000001b0', 'Dhanishta', 'Kadagam', 'Meenam', 'Harita', 'no')
ON CONFLICT (user_id) DO UPDATE SET
  star = EXCLUDED.star,
  raasi = EXCLUDED.raasi,
  lagnam = EXCLUDED.lagnam,
  gothram = EXCLUDED.gothram,
  manglik = EXCLUDED.manglik;
INSERT INTO public.horoscope_details (user_id, star, raasi, lagnam, gothram, manglik)
VALUES ('00000000-0000-4000-a000-0000000001b1', 'Arudra', 'Kumbam', 'Rishabam', 'Kasyapa', 'no')
ON CONFLICT (user_id) DO UPDATE SET
  star = EXCLUDED.star,
  raasi = EXCLUDED.raasi,
  lagnam = EXCLUDED.lagnam,
  gothram = EXCLUDED.gothram,
  manglik = EXCLUDED.manglik;
INSERT INTO public.horoscope_details (user_id, star, raasi, lagnam, gothram, manglik)
VALUES ('00000000-0000-4000-a000-0000000001b2', 'Revati', 'Rishabam', 'Kadagam', 'Harita', 'no')
ON CONFLICT (user_id) DO UPDATE SET
  star = EXCLUDED.star,
  raasi = EXCLUDED.raasi,
  lagnam = EXCLUDED.lagnam,
  gothram = EXCLUDED.gothram,
  manglik = EXCLUDED.manglik;
INSERT INTO public.horoscope_details (user_id, star, raasi, lagnam, gothram, manglik)
VALUES ('00000000-0000-4000-a000-0000000001b3', 'Uttarabhadrapada', 'Viruchigam', 'Magaram', 'Siva', 'no')
ON CONFLICT (user_id) DO UPDATE SET
  star = EXCLUDED.star,
  raasi = EXCLUDED.raasi,
  lagnam = EXCLUDED.lagnam,
  gothram = EXCLUDED.gothram,
  manglik = EXCLUDED.manglik;
INSERT INTO public.horoscope_details (user_id, star, raasi, lagnam, gothram, manglik)
VALUES ('00000000-0000-4000-a000-0000000001b4', 'Shravana', 'Meenam', 'Meenam', 'Vishnu', 'no')
ON CONFLICT (user_id) DO UPDATE SET
  star = EXCLUDED.star,
  raasi = EXCLUDED.raasi,
  lagnam = EXCLUDED.lagnam,
  gothram = EXCLUDED.gothram,
  manglik = EXCLUDED.manglik;
INSERT INTO public.horoscope_details (user_id, star, raasi, lagnam, gothram, manglik)
VALUES ('00000000-0000-4000-a000-0000000001b5', 'Shatabhisha', 'Dhanusu', 'Rishabam', 'Harita', 'no')
ON CONFLICT (user_id) DO UPDATE SET
  star = EXCLUDED.star,
  raasi = EXCLUDED.raasi,
  lagnam = EXCLUDED.lagnam,
  gothram = EXCLUDED.gothram,
  manglik = EXCLUDED.manglik;
INSERT INTO public.horoscope_details (user_id, star, raasi, lagnam, gothram, manglik)
VALUES ('00000000-0000-4000-a000-0000000001b6', 'Uttarachadha', 'Dhanusu', 'Viruchigam', 'Bharadwaj', 'no')
ON CONFLICT (user_id) DO UPDATE SET
  star = EXCLUDED.star,
  raasi = EXCLUDED.raasi,
  lagnam = EXCLUDED.lagnam,
  gothram = EXCLUDED.gothram,
  manglik = EXCLUDED.manglik;
INSERT INTO public.horoscope_details (user_id, star, raasi, lagnam, gothram, manglik)
VALUES ('00000000-0000-4000-a000-0000000001b7', 'Arudra', 'Simham', 'Meenam', 'Bharadwaj', 'no')
ON CONFLICT (user_id) DO UPDATE SET
  star = EXCLUDED.star,
  raasi = EXCLUDED.raasi,
  lagnam = EXCLUDED.lagnam,
  gothram = EXCLUDED.gothram,
  manglik = EXCLUDED.manglik;
INSERT INTO public.horoscope_details (user_id, star, raasi, lagnam, gothram, manglik)
VALUES ('00000000-0000-4000-a000-0000000001b8', 'Uttarachadha', 'Viruchigam', 'Meenam', 'Agastya', 'no')
ON CONFLICT (user_id) DO UPDATE SET
  star = EXCLUDED.star,
  raasi = EXCLUDED.raasi,
  lagnam = EXCLUDED.lagnam,
  gothram = EXCLUDED.gothram,
  manglik = EXCLUDED.manglik;
INSERT INTO public.horoscope_details (user_id, star, raasi, lagnam, gothram, manglik)
VALUES ('00000000-0000-4000-a000-0000000001b9', 'Dhanishta', 'Kumbam', 'Viruchigam', 'Atri', 'no')
ON CONFLICT (user_id) DO UPDATE SET
  star = EXCLUDED.star,
  raasi = EXCLUDED.raasi,
  lagnam = EXCLUDED.lagnam,
  gothram = EXCLUDED.gothram,
  manglik = EXCLUDED.manglik;
INSERT INTO public.horoscope_details (user_id, star, raasi, lagnam, gothram, manglik)
VALUES ('00000000-0000-4000-a000-0000000001ba', 'Magha', 'Viruchigam', 'Dhanusu', 'Murugan', 'no')
ON CONFLICT (user_id) DO UPDATE SET
  star = EXCLUDED.star,
  raasi = EXCLUDED.raasi,
  lagnam = EXCLUDED.lagnam,
  gothram = EXCLUDED.gothram,
  manglik = EXCLUDED.manglik;
INSERT INTO public.horoscope_details (user_id, star, raasi, lagnam, gothram, manglik)
VALUES ('00000000-0000-4000-a000-0000000001bb', 'Krittika', 'Meenam', 'Viruchigam', 'Angirasa', 'no')
ON CONFLICT (user_id) DO UPDATE SET
  star = EXCLUDED.star,
  raasi = EXCLUDED.raasi,
  lagnam = EXCLUDED.lagnam,
  gothram = EXCLUDED.gothram,
  manglik = EXCLUDED.manglik;
INSERT INTO public.horoscope_details (user_id, star, raasi, lagnam, gothram, manglik)
VALUES ('00000000-0000-4000-a000-0000000001bc', 'Pushya', 'Rishabam', 'Rishabam', 'Siva', 'yes')
ON CONFLICT (user_id) DO UPDATE SET
  star = EXCLUDED.star,
  raasi = EXCLUDED.raasi,
  lagnam = EXCLUDED.lagnam,
  gothram = EXCLUDED.gothram,
  manglik = EXCLUDED.manglik;
INSERT INTO public.horoscope_details (user_id, star, raasi, lagnam, gothram, manglik)
VALUES ('00000000-0000-4000-a000-0000000001bd', 'Uttarachadha', 'Simham', 'Rishabam', 'Vashishta', 'no')
ON CONFLICT (user_id) DO UPDATE SET
  star = EXCLUDED.star,
  raasi = EXCLUDED.raasi,
  lagnam = EXCLUDED.lagnam,
  gothram = EXCLUDED.gothram,
  manglik = EXCLUDED.manglik;
INSERT INTO public.horoscope_details (user_id, star, raasi, lagnam, gothram, manglik)
VALUES ('00000000-0000-4000-a000-0000000001be', 'Punarvasu', 'Mithunam', 'Magaram', 'Agastya', 'no')
ON CONFLICT (user_id) DO UPDATE SET
  star = EXCLUDED.star,
  raasi = EXCLUDED.raasi,
  lagnam = EXCLUDED.lagnam,
  gothram = EXCLUDED.gothram,
  manglik = EXCLUDED.manglik;
INSERT INTO public.horoscope_details (user_id, star, raasi, lagnam, gothram, manglik)
VALUES ('00000000-0000-4000-a000-0000000001bf', 'Jyeshta', 'Meenam', 'Kadagam', 'Angirasa', 'no')
ON CONFLICT (user_id) DO UPDATE SET
  star = EXCLUDED.star,
  raasi = EXCLUDED.raasi,
  lagnam = EXCLUDED.lagnam,
  gothram = EXCLUDED.gothram,
  manglik = EXCLUDED.manglik;
INSERT INTO public.horoscope_details (user_id, star, raasi, lagnam, gothram, manglik)
VALUES ('00000000-0000-4000-a000-0000000001c0', 'Uttaraphalguni', 'Magaram', 'Kumbam', 'Kasyapa', 'no')
ON CONFLICT (user_id) DO UPDATE SET
  star = EXCLUDED.star,
  raasi = EXCLUDED.raasi,
  lagnam = EXCLUDED.lagnam,
  gothram = EXCLUDED.gothram,
  manglik = EXCLUDED.manglik;
INSERT INTO public.horoscope_details (user_id, star, raasi, lagnam, gothram, manglik)
VALUES ('00000000-0000-4000-a000-0000000001c1', 'Poorvashadha', 'Mesham', 'Magaram', 'Gautama', 'no')
ON CONFLICT (user_id) DO UPDATE SET
  star = EXCLUDED.star,
  raasi = EXCLUDED.raasi,
  lagnam = EXCLUDED.lagnam,
  gothram = EXCLUDED.gothram,
  manglik = EXCLUDED.manglik;
INSERT INTO public.horoscope_details (user_id, star, raasi, lagnam, gothram, manglik)
VALUES ('00000000-0000-4000-a000-0000000001c2', 'Shravana', 'Simham', 'Kumbam', 'Gautama', 'no')
ON CONFLICT (user_id) DO UPDATE SET
  star = EXCLUDED.star,
  raasi = EXCLUDED.raasi,
  lagnam = EXCLUDED.lagnam,
  gothram = EXCLUDED.gothram,
  manglik = EXCLUDED.manglik;
INSERT INTO public.horoscope_details (user_id, star, raasi, lagnam, gothram, manglik)
VALUES ('00000000-0000-4000-a000-0000000001c3', 'Dhanishta', 'Mithunam', 'Kumbam', 'Siva', 'no')
ON CONFLICT (user_id) DO UPDATE SET
  star = EXCLUDED.star,
  raasi = EXCLUDED.raasi,
  lagnam = EXCLUDED.lagnam,
  gothram = EXCLUDED.gothram,
  manglik = EXCLUDED.manglik;
INSERT INTO public.horoscope_details (user_id, star, raasi, lagnam, gothram, manglik)
VALUES ('00000000-0000-4000-a000-0000000001c4', 'Vishakha', 'Mesham', 'Viruchigam', 'Harita', 'no')
ON CONFLICT (user_id) DO UPDATE SET
  star = EXCLUDED.star,
  raasi = EXCLUDED.raasi,
  lagnam = EXCLUDED.lagnam,
  gothram = EXCLUDED.gothram,
  manglik = EXCLUDED.manglik;
INSERT INTO public.horoscope_details (user_id, star, raasi, lagnam, gothram, manglik)
VALUES ('00000000-0000-4000-a000-0000000001c5', 'Poorvashadha', 'Mithunam', 'Magaram', 'Gautama', 'yes')
ON CONFLICT (user_id) DO UPDATE SET
  star = EXCLUDED.star,
  raasi = EXCLUDED.raasi,
  lagnam = EXCLUDED.lagnam,
  gothram = EXCLUDED.gothram,
  manglik = EXCLUDED.manglik;
INSERT INTO public.horoscope_details (user_id, star, raasi, lagnam, gothram, manglik)
VALUES ('00000000-0000-4000-a000-0000000001c6', 'Ashwini', 'Viruchigam', 'Kanni', 'Siva', 'no')
ON CONFLICT (user_id) DO UPDATE SET
  star = EXCLUDED.star,
  raasi = EXCLUDED.raasi,
  lagnam = EXCLUDED.lagnam,
  gothram = EXCLUDED.gothram,
  manglik = EXCLUDED.manglik;
INSERT INTO public.horoscope_details (user_id, star, raasi, lagnam, gothram, manglik)
VALUES ('00000000-0000-4000-a000-0000000001c7', 'Krittika', 'Viruchigam', 'Mesham', 'Kasyapa', 'no')
ON CONFLICT (user_id) DO UPDATE SET
  star = EXCLUDED.star,
  raasi = EXCLUDED.raasi,
  lagnam = EXCLUDED.lagnam,
  gothram = EXCLUDED.gothram,
  manglik = EXCLUDED.manglik;
INSERT INTO public.horoscope_details (user_id, star, raasi, lagnam, gothram, manglik)
VALUES ('00000000-0000-4000-a000-0000000001c8', 'Jyeshta', 'Kanni', 'Viruchigam', 'Vashishta', 'no')
ON CONFLICT (user_id) DO UPDATE SET
  star = EXCLUDED.star,
  raasi = EXCLUDED.raasi,
  lagnam = EXCLUDED.lagnam,
  gothram = EXCLUDED.gothram,
  manglik = EXCLUDED.manglik;
INSERT INTO public.horoscope_details (user_id, star, raasi, lagnam, gothram, manglik)
VALUES ('00000000-0000-4000-a000-0000000001c9', 'Revati', 'Dhanusu', 'Mithunam', 'Harita', 'yes')
ON CONFLICT (user_id) DO UPDATE SET
  star = EXCLUDED.star,
  raasi = EXCLUDED.raasi,
  lagnam = EXCLUDED.lagnam,
  gothram = EXCLUDED.gothram,
  manglik = EXCLUDED.manglik;
INSERT INTO public.horoscope_details (user_id, star, raasi, lagnam, gothram, manglik)
VALUES ('00000000-0000-4000-a000-0000000001ca', 'Uttarachadha', 'Mithunam', 'Viruchigam', 'Atri', 'no')
ON CONFLICT (user_id) DO UPDATE SET
  star = EXCLUDED.star,
  raasi = EXCLUDED.raasi,
  lagnam = EXCLUDED.lagnam,
  gothram = EXCLUDED.gothram,
  manglik = EXCLUDED.manglik;
INSERT INTO public.horoscope_details (user_id, star, raasi, lagnam, gothram, manglik)
VALUES ('00000000-0000-4000-a000-0000000001cb', 'Vishakha', 'Meenam', 'Meenam', 'Murugan', 'no')
ON CONFLICT (user_id) DO UPDATE SET
  star = EXCLUDED.star,
  raasi = EXCLUDED.raasi,
  lagnam = EXCLUDED.lagnam,
  gothram = EXCLUDED.gothram,
  manglik = EXCLUDED.manglik;
INSERT INTO public.horoscope_details (user_id, star, raasi, lagnam, gothram, manglik)
VALUES ('00000000-0000-4000-a000-0000000001cc', 'Revati', 'Thulaam', 'Kadagam', 'Viswamitra', 'no')
ON CONFLICT (user_id) DO UPDATE SET
  star = EXCLUDED.star,
  raasi = EXCLUDED.raasi,
  lagnam = EXCLUDED.lagnam,
  gothram = EXCLUDED.gothram,
  manglik = EXCLUDED.manglik;
INSERT INTO public.horoscope_details (user_id, star, raasi, lagnam, gothram, manglik)
VALUES ('00000000-0000-4000-a000-0000000001cd', 'Dhanishta', 'Magaram', 'Meenam', 'Murugan', 'yes')
ON CONFLICT (user_id) DO UPDATE SET
  star = EXCLUDED.star,
  raasi = EXCLUDED.raasi,
  lagnam = EXCLUDED.lagnam,
  gothram = EXCLUDED.gothram,
  manglik = EXCLUDED.manglik;
INSERT INTO public.horoscope_details (user_id, star, raasi, lagnam, gothram, manglik)
VALUES ('00000000-0000-4000-a000-0000000001ce', 'Poorvabhadrapada', 'Kanni', 'Rishabam', 'Viswamitra', 'no')
ON CONFLICT (user_id) DO UPDATE SET
  star = EXCLUDED.star,
  raasi = EXCLUDED.raasi,
  lagnam = EXCLUDED.lagnam,
  gothram = EXCLUDED.gothram,
  manglik = EXCLUDED.manglik;
INSERT INTO public.horoscope_details (user_id, star, raasi, lagnam, gothram, manglik)
VALUES ('00000000-0000-4000-a000-0000000001cf', 'Arudra', 'Simham', 'Kumbam', 'Viswamitra', 'yes')
ON CONFLICT (user_id) DO UPDATE SET
  star = EXCLUDED.star,
  raasi = EXCLUDED.raasi,
  lagnam = EXCLUDED.lagnam,
  gothram = EXCLUDED.gothram,
  manglik = EXCLUDED.manglik;
INSERT INTO public.horoscope_details (user_id, star, raasi, lagnam, gothram, manglik)
VALUES ('00000000-0000-4000-a000-0000000001d0', 'Shravana', 'Kumbam', 'Mithunam', 'Vishnu', 'no')
ON CONFLICT (user_id) DO UPDATE SET
  star = EXCLUDED.star,
  raasi = EXCLUDED.raasi,
  lagnam = EXCLUDED.lagnam,
  gothram = EXCLUDED.gothram,
  manglik = EXCLUDED.manglik;
INSERT INTO public.horoscope_details (user_id, star, raasi, lagnam, gothram, manglik)
VALUES ('00000000-0000-4000-a000-0000000001d1', 'Revati', 'Mithunam', 'Rishabam', 'Atri', 'yes')
ON CONFLICT (user_id) DO UPDATE SET
  star = EXCLUDED.star,
  raasi = EXCLUDED.raasi,
  lagnam = EXCLUDED.lagnam,
  gothram = EXCLUDED.gothram,
  manglik = EXCLUDED.manglik;
INSERT INTO public.horoscope_details (user_id, star, raasi, lagnam, gothram, manglik)
VALUES ('00000000-0000-4000-a000-0000000001d2', 'Uttaraphalguni', 'Mesham', 'Mesham', 'Siva', 'no')
ON CONFLICT (user_id) DO UPDATE SET
  star = EXCLUDED.star,
  raasi = EXCLUDED.raasi,
  lagnam = EXCLUDED.lagnam,
  gothram = EXCLUDED.gothram,
  manglik = EXCLUDED.manglik;
INSERT INTO public.horoscope_details (user_id, star, raasi, lagnam, gothram, manglik)
VALUES ('00000000-0000-4000-a000-0000000001d3', 'Uttarabhadrapada', 'Kadagam', 'Viruchigam', 'Kasyapa', 'no')
ON CONFLICT (user_id) DO UPDATE SET
  star = EXCLUDED.star,
  raasi = EXCLUDED.raasi,
  lagnam = EXCLUDED.lagnam,
  gothram = EXCLUDED.gothram,
  manglik = EXCLUDED.manglik;
INSERT INTO public.horoscope_details (user_id, star, raasi, lagnam, gothram, manglik)
VALUES ('00000000-0000-4000-a000-0000000001d4', 'Rohini', 'Mesham', 'Kanni', 'Angirasa', 'no')
ON CONFLICT (user_id) DO UPDATE SET
  star = EXCLUDED.star,
  raasi = EXCLUDED.raasi,
  lagnam = EXCLUDED.lagnam,
  gothram = EXCLUDED.gothram,
  manglik = EXCLUDED.manglik;
INSERT INTO public.horoscope_details (user_id, star, raasi, lagnam, gothram, manglik)
VALUES ('00000000-0000-4000-a000-0000000001d5', 'Poorvaphalguni', 'Magaram', 'Magaram', 'Viswamitra', 'no')
ON CONFLICT (user_id) DO UPDATE SET
  star = EXCLUDED.star,
  raasi = EXCLUDED.raasi,
  lagnam = EXCLUDED.lagnam,
  gothram = EXCLUDED.gothram,
  manglik = EXCLUDED.manglik;
INSERT INTO public.horoscope_details (user_id, star, raasi, lagnam, gothram, manglik)
VALUES ('00000000-0000-4000-a000-0000000001d6', 'Dhanishta', 'Kanni', 'Magaram', 'Agastya', 'no')
ON CONFLICT (user_id) DO UPDATE SET
  star = EXCLUDED.star,
  raasi = EXCLUDED.raasi,
  lagnam = EXCLUDED.lagnam,
  gothram = EXCLUDED.gothram,
  manglik = EXCLUDED.manglik;
INSERT INTO public.horoscope_details (user_id, star, raasi, lagnam, gothram, manglik)
VALUES ('00000000-0000-4000-a000-0000000001d7', 'Vishakha', 'Meenam', 'Dhanusu', 'Viswamitra', 'no')
ON CONFLICT (user_id) DO UPDATE SET
  star = EXCLUDED.star,
  raasi = EXCLUDED.raasi,
  lagnam = EXCLUDED.lagnam,
  gothram = EXCLUDED.gothram,
  manglik = EXCLUDED.manglik;
INSERT INTO public.horoscope_details (user_id, star, raasi, lagnam, gothram, manglik)
VALUES ('00000000-0000-4000-a000-0000000001d8', 'Magha', 'Magaram', 'Simham', 'Atri', 'yes')
ON CONFLICT (user_id) DO UPDATE SET
  star = EXCLUDED.star,
  raasi = EXCLUDED.raasi,
  lagnam = EXCLUDED.lagnam,
  gothram = EXCLUDED.gothram,
  manglik = EXCLUDED.manglik;
INSERT INTO public.horoscope_details (user_id, star, raasi, lagnam, gothram, manglik)
VALUES ('00000000-0000-4000-a000-0000000001d9', 'Moola', 'Rishabam', 'Dhanusu', 'Viswamitra', 'no')
ON CONFLICT (user_id) DO UPDATE SET
  star = EXCLUDED.star,
  raasi = EXCLUDED.raasi,
  lagnam = EXCLUDED.lagnam,
  gothram = EXCLUDED.gothram,
  manglik = EXCLUDED.manglik;
INSERT INTO public.horoscope_details (user_id, star, raasi, lagnam, gothram, manglik)
VALUES ('00000000-0000-4000-a000-0000000001da', 'Krittika', 'Dhanusu', 'Kumbam', 'Murugan', 'no')
ON CONFLICT (user_id) DO UPDATE SET
  star = EXCLUDED.star,
  raasi = EXCLUDED.raasi,
  lagnam = EXCLUDED.lagnam,
  gothram = EXCLUDED.gothram,
  manglik = EXCLUDED.manglik;
INSERT INTO public.horoscope_details (user_id, star, raasi, lagnam, gothram, manglik)
VALUES ('00000000-0000-4000-a000-0000000001db', 'Chitra', 'Kadagam', 'Magaram', 'Agastya', 'no')
ON CONFLICT (user_id) DO UPDATE SET
  star = EXCLUDED.star,
  raasi = EXCLUDED.raasi,
  lagnam = EXCLUDED.lagnam,
  gothram = EXCLUDED.gothram,
  manglik = EXCLUDED.manglik;
INSERT INTO public.horoscope_details (user_id, star, raasi, lagnam, gothram, manglik)
VALUES ('00000000-0000-4000-a000-0000000001dc', 'Pushya', 'Simham', 'Thulaam', 'Gautama', 'no')
ON CONFLICT (user_id) DO UPDATE SET
  star = EXCLUDED.star,
  raasi = EXCLUDED.raasi,
  lagnam = EXCLUDED.lagnam,
  gothram = EXCLUDED.gothram,
  manglik = EXCLUDED.manglik;
INSERT INTO public.horoscope_details (user_id, star, raasi, lagnam, gothram, manglik)
VALUES ('00000000-0000-4000-a000-0000000001dd', 'Pushya', 'Kumbam', 'Kadagam', 'Atri', 'no')
ON CONFLICT (user_id) DO UPDATE SET
  star = EXCLUDED.star,
  raasi = EXCLUDED.raasi,
  lagnam = EXCLUDED.lagnam,
  gothram = EXCLUDED.gothram,
  manglik = EXCLUDED.manglik;
INSERT INTO public.horoscope_details (user_id, star, raasi, lagnam, gothram, manglik)
VALUES ('00000000-0000-4000-a000-0000000001de', 'Chitra', 'Kanni', 'Magaram', 'Harita', 'yes')
ON CONFLICT (user_id) DO UPDATE SET
  star = EXCLUDED.star,
  raasi = EXCLUDED.raasi,
  lagnam = EXCLUDED.lagnam,
  gothram = EXCLUDED.gothram,
  manglik = EXCLUDED.manglik;
INSERT INTO public.horoscope_details (user_id, star, raasi, lagnam, gothram, manglik)
VALUES ('00000000-0000-4000-a000-0000000001df', 'Shravana', 'Kanni', 'Rishabam', 'Harita', 'yes')
ON CONFLICT (user_id) DO UPDATE SET
  star = EXCLUDED.star,
  raasi = EXCLUDED.raasi,
  lagnam = EXCLUDED.lagnam,
  gothram = EXCLUDED.gothram,
  manglik = EXCLUDED.manglik;
INSERT INTO public.horoscope_details (user_id, star, raasi, lagnam, gothram, manglik)
VALUES ('00000000-0000-4000-a000-0000000001e0', 'Poorvaphalguni', 'Kanni', 'Meenam', 'Murugan', 'no')
ON CONFLICT (user_id) DO UPDATE SET
  star = EXCLUDED.star,
  raasi = EXCLUDED.raasi,
  lagnam = EXCLUDED.lagnam,
  gothram = EXCLUDED.gothram,
  manglik = EXCLUDED.manglik;
INSERT INTO public.horoscope_details (user_id, star, raasi, lagnam, gothram, manglik)
VALUES ('00000000-0000-4000-a000-0000000001e1', 'Uttaraphalguni', 'Simham', 'Kumbam', 'Atri', 'yes')
ON CONFLICT (user_id) DO UPDATE SET
  star = EXCLUDED.star,
  raasi = EXCLUDED.raasi,
  lagnam = EXCLUDED.lagnam,
  gothram = EXCLUDED.gothram,
  manglik = EXCLUDED.manglik;
INSERT INTO public.horoscope_details (user_id, star, raasi, lagnam, gothram, manglik)
VALUES ('00000000-0000-4000-a000-0000000001e2', 'Aslesha', 'Simham', 'Kumbam', 'Agastya', 'no')
ON CONFLICT (user_id) DO UPDATE SET
  star = EXCLUDED.star,
  raasi = EXCLUDED.raasi,
  lagnam = EXCLUDED.lagnam,
  gothram = EXCLUDED.gothram,
  manglik = EXCLUDED.manglik;
INSERT INTO public.horoscope_details (user_id, star, raasi, lagnam, gothram, manglik)
VALUES ('00000000-0000-4000-a000-0000000001e3', 'Swati', 'Kadagam', 'Kumbam', 'Angirasa', 'yes')
ON CONFLICT (user_id) DO UPDATE SET
  star = EXCLUDED.star,
  raasi = EXCLUDED.raasi,
  lagnam = EXCLUDED.lagnam,
  gothram = EXCLUDED.gothram,
  manglik = EXCLUDED.manglik;
INSERT INTO public.horoscope_details (user_id, star, raasi, lagnam, gothram, manglik)
VALUES ('00000000-0000-4000-a000-0000000001e4', 'Shravana', 'Mithunam', 'Dhanusu', 'Vishnu', 'no')
ON CONFLICT (user_id) DO UPDATE SET
  star = EXCLUDED.star,
  raasi = EXCLUDED.raasi,
  lagnam = EXCLUDED.lagnam,
  gothram = EXCLUDED.gothram,
  manglik = EXCLUDED.manglik;
INSERT INTO public.horoscope_details (user_id, star, raasi, lagnam, gothram, manglik)
VALUES ('00000000-0000-4000-a000-0000000001e5', 'Swati', 'Rishabam', 'Mesham', 'Angirasa', 'no')
ON CONFLICT (user_id) DO UPDATE SET
  star = EXCLUDED.star,
  raasi = EXCLUDED.raasi,
  lagnam = EXCLUDED.lagnam,
  gothram = EXCLUDED.gothram,
  manglik = EXCLUDED.manglik;
INSERT INTO public.horoscope_details (user_id, star, raasi, lagnam, gothram, manglik)
VALUES ('00000000-0000-4000-a000-0000000001e6', 'Swati', 'Simham', 'Viruchigam', 'Siva', 'no')
ON CONFLICT (user_id) DO UPDATE SET
  star = EXCLUDED.star,
  raasi = EXCLUDED.raasi,
  lagnam = EXCLUDED.lagnam,
  gothram = EXCLUDED.gothram,
  manglik = EXCLUDED.manglik;
INSERT INTO public.horoscope_details (user_id, star, raasi, lagnam, gothram, manglik)
VALUES ('00000000-0000-4000-a000-0000000001e7', 'Moola', 'Kanni', 'Magaram', 'Vishnu', 'no')
ON CONFLICT (user_id) DO UPDATE SET
  star = EXCLUDED.star,
  raasi = EXCLUDED.raasi,
  lagnam = EXCLUDED.lagnam,
  gothram = EXCLUDED.gothram,
  manglik = EXCLUDED.manglik;
INSERT INTO public.horoscope_details (user_id, star, raasi, lagnam, gothram, manglik)
VALUES ('00000000-0000-4000-a000-0000000001e8', 'Magha', 'Kumbam', 'Thulaam', 'Vashishta', 'no')
ON CONFLICT (user_id) DO UPDATE SET
  star = EXCLUDED.star,
  raasi = EXCLUDED.raasi,
  lagnam = EXCLUDED.lagnam,
  gothram = EXCLUDED.gothram,
  manglik = EXCLUDED.manglik;
INSERT INTO public.horoscope_details (user_id, star, raasi, lagnam, gothram, manglik)
VALUES ('00000000-0000-4000-a000-0000000001e9', 'Poorvaphalguni', 'Viruchigam', 'Magaram', 'Gautama', 'yes')
ON CONFLICT (user_id) DO UPDATE SET
  star = EXCLUDED.star,
  raasi = EXCLUDED.raasi,
  lagnam = EXCLUDED.lagnam,
  gothram = EXCLUDED.gothram,
  manglik = EXCLUDED.manglik;
INSERT INTO public.horoscope_details (user_id, star, raasi, lagnam, gothram, manglik)
VALUES ('00000000-0000-4000-a000-0000000001ea', 'Arudra', 'Mithunam', 'Kanni', 'Angirasa', 'no')
ON CONFLICT (user_id) DO UPDATE SET
  star = EXCLUDED.star,
  raasi = EXCLUDED.raasi,
  lagnam = EXCLUDED.lagnam,
  gothram = EXCLUDED.gothram,
  manglik = EXCLUDED.manglik;
INSERT INTO public.horoscope_details (user_id, star, raasi, lagnam, gothram, manglik)
VALUES ('00000000-0000-4000-a000-0000000001eb', 'Aslesha', 'Meenam', 'Mesham', 'Atri', 'no')
ON CONFLICT (user_id) DO UPDATE SET
  star = EXCLUDED.star,
  raasi = EXCLUDED.raasi,
  lagnam = EXCLUDED.lagnam,
  gothram = EXCLUDED.gothram,
  manglik = EXCLUDED.manglik;
INSERT INTO public.horoscope_details (user_id, star, raasi, lagnam, gothram, manglik)
VALUES ('00000000-0000-4000-a000-0000000001ec', 'Arudra', 'Mithunam', 'Mesham', 'Agastya', 'no')
ON CONFLICT (user_id) DO UPDATE SET
  star = EXCLUDED.star,
  raasi = EXCLUDED.raasi,
  lagnam = EXCLUDED.lagnam,
  gothram = EXCLUDED.gothram,
  manglik = EXCLUDED.manglik;
INSERT INTO public.horoscope_details (user_id, star, raasi, lagnam, gothram, manglik)
VALUES ('00000000-0000-4000-a000-0000000001ed', 'Shatabhisha', 'Mesham', 'Kumbam', 'Agastya', 'no')
ON CONFLICT (user_id) DO UPDATE SET
  star = EXCLUDED.star,
  raasi = EXCLUDED.raasi,
  lagnam = EXCLUDED.lagnam,
  gothram = EXCLUDED.gothram,
  manglik = EXCLUDED.manglik;
INSERT INTO public.horoscope_details (user_id, star, raasi, lagnam, gothram, manglik)
VALUES ('00000000-0000-4000-a000-0000000001ee', 'Chitra', 'Magaram', 'Dhanusu', 'Angirasa', 'no')
ON CONFLICT (user_id) DO UPDATE SET
  star = EXCLUDED.star,
  raasi = EXCLUDED.raasi,
  lagnam = EXCLUDED.lagnam,
  gothram = EXCLUDED.gothram,
  manglik = EXCLUDED.manglik;
INSERT INTO public.horoscope_details (user_id, star, raasi, lagnam, gothram, manglik)
VALUES ('00000000-0000-4000-a000-0000000001ef', 'Vishakha', 'Kumbam', 'Kanni', 'Viswamitra', 'no')
ON CONFLICT (user_id) DO UPDATE SET
  star = EXCLUDED.star,
  raasi = EXCLUDED.raasi,
  lagnam = EXCLUDED.lagnam,
  gothram = EXCLUDED.gothram,
  manglik = EXCLUDED.manglik;
INSERT INTO public.horoscope_details (user_id, star, raasi, lagnam, gothram, manglik)
VALUES ('00000000-0000-4000-a000-0000000001f0', 'Moola', 'Meenam', 'Kanni', 'Murugan', 'yes')
ON CONFLICT (user_id) DO UPDATE SET
  star = EXCLUDED.star,
  raasi = EXCLUDED.raasi,
  lagnam = EXCLUDED.lagnam,
  gothram = EXCLUDED.gothram,
  manglik = EXCLUDED.manglik;
INSERT INTO public.horoscope_details (user_id, star, raasi, lagnam, gothram, manglik)
VALUES ('00000000-0000-4000-a000-0000000001f1', 'Poorvashadha', 'Mesham', 'Mesham', 'Angirasa', 'yes')
ON CONFLICT (user_id) DO UPDATE SET
  star = EXCLUDED.star,
  raasi = EXCLUDED.raasi,
  lagnam = EXCLUDED.lagnam,
  gothram = EXCLUDED.gothram,
  manglik = EXCLUDED.manglik;
INSERT INTO public.horoscope_details (user_id, star, raasi, lagnam, gothram, manglik)
VALUES ('00000000-0000-4000-a000-0000000001f2', 'Uttarabhadrapada', 'Meenam', 'Kumbam', 'Siva', 'no')
ON CONFLICT (user_id) DO UPDATE SET
  star = EXCLUDED.star,
  raasi = EXCLUDED.raasi,
  lagnam = EXCLUDED.lagnam,
  gothram = EXCLUDED.gothram,
  manglik = EXCLUDED.manglik;
INSERT INTO public.horoscope_details (user_id, star, raasi, lagnam, gothram, manglik)
VALUES ('00000000-0000-4000-a000-0000000001f3', 'Chitra', 'Dhanusu', 'Dhanusu', 'Gautama', 'no')
ON CONFLICT (user_id) DO UPDATE SET
  star = EXCLUDED.star,
  raasi = EXCLUDED.raasi,
  lagnam = EXCLUDED.lagnam,
  gothram = EXCLUDED.gothram,
  manglik = EXCLUDED.manglik;
INSERT INTO public.horoscope_details (user_id, star, raasi, lagnam, gothram, manglik)
VALUES ('00000000-0000-4000-a000-0000000001f4', 'Anuradha', 'Mithunam', 'Kanni', 'Agastya', 'no')
ON CONFLICT (user_id) DO UPDATE SET
  star = EXCLUDED.star,
  raasi = EXCLUDED.raasi,
  lagnam = EXCLUDED.lagnam,
  gothram = EXCLUDED.gothram,
  manglik = EXCLUDED.manglik;

-- 4. PARTNER PREFERENCES INSERTIONS
INSERT INTO public.partner_preferences (user_id, age_min, age_max, height_min, height_max, marital_status, religion, caste, education, occupation, food_habit)
VALUES ('00000000-0000-4000-a000-000000000155', 23, 37, 170, 185, ARRAY['never_married']::TEXT[], ARRAY['Hindu']::TEXT[], ARRAY['Brahmin - Iyengar', 'Caste No Bar']::TEXT[], ARRAY['Ph.D', 'No Education Bar']::TEXT[], ARRAY['Architect']::TEXT[], ARRAY['vegetarian','non_vegetarian']::TEXT[])
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
VALUES ('00000000-0000-4000-a000-000000000156', 23, 41, 153, 168, ARRAY['never_married']::TEXT[], ARRAY['Hindu']::TEXT[], ARRAY['Kallar', 'Caste No Bar']::TEXT[], ARRAY['M.Com', 'No Education Bar']::TEXT[], ARRAY['Advocate']::TEXT[], ARRAY['vegetarian','non_vegetarian']::TEXT[])
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
VALUES ('00000000-0000-4000-a000-000000000157', 27, 32, 151, 166, ARRAY['never_married']::TEXT[], ARRAY['Hindu']::TEXT[], ARRAY['Kallar', 'Caste No Bar']::TEXT[], ARRAY['M.B.A', 'No Education Bar']::TEXT[], ARRAY['Civil Engineer']::TEXT[], ARRAY['vegetarian','non_vegetarian']::TEXT[])
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
VALUES ('00000000-0000-4000-a000-000000000158', 21, 45, 140, 155, ARRAY['never_married']::TEXT[], ARRAY['Christian']::TEXT[], ARRAY['Pentecostal', 'Caste No Bar']::TEXT[], ARRAY['M.B.B.S', 'No Education Bar']::TEXT[], ARRAY['Civil Engineer']::TEXT[], ARRAY['vegetarian','non_vegetarian']::TEXT[])
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
VALUES ('00000000-0000-4000-a000-000000000159', 24, 38, 166, 181, ARRAY['never_married']::TEXT[], ARRAY['Hindu']::TEXT[], ARRAY['Adi Dravida', 'Caste No Bar']::TEXT[], ARRAY['B.Sc', 'No Education Bar']::TEXT[], ARRAY['Mechanical Engineer']::TEXT[], ARRAY['vegetarian','non_vegetarian']::TEXT[])
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
VALUES ('00000000-0000-4000-a000-00000000015a', 26, 45, 147, 162, ARRAY['never_married']::TEXT[], ARRAY['Hindu']::TEXT[], ARRAY['Maravar', 'Caste No Bar']::TEXT[], ARRAY['B.Com', 'No Education Bar']::TEXT[], ARRAY['Auditor']::TEXT[], ARRAY['vegetarian','non_vegetarian']::TEXT[])
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
VALUES ('00000000-0000-4000-a000-00000000015b', 21, 38, 152, 167, ARRAY['never_married']::TEXT[], ARRAY['Hindu']::TEXT[], ARRAY['Vanniyar', 'Caste No Bar']::TEXT[], ARRAY['Ph.D', 'No Education Bar']::TEXT[], ARRAY['Advocate']::TEXT[], ARRAY['vegetarian','non_vegetarian']::TEXT[])
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
VALUES ('00000000-0000-4000-a000-00000000015c', 27, 30, 146, 161, ARRAY['never_married']::TEXT[], ARRAY['Hindu']::TEXT[], ARRAY['Brahmin - Iyer', 'Caste No Bar']::TEXT[], ARRAY['M.A', 'No Education Bar']::TEXT[], ARRAY['Dentist']::TEXT[], ARRAY['vegetarian','non_vegetarian']::TEXT[])
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
VALUES ('00000000-0000-4000-a000-00000000015d', 22, 33, 156, 171, ARRAY['never_married']::TEXT[], ARRAY['Hindu']::TEXT[], ARRAY['Arunthathiyar', 'Caste No Bar']::TEXT[], ARRAY['M.C.A', 'No Education Bar']::TEXT[], ARRAY['Advocate']::TEXT[], ARRAY['vegetarian','non_vegetarian']::TEXT[])
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
VALUES ('00000000-0000-4000-a000-00000000015e', 27, 37, 150, 165, ARRAY['never_married']::TEXT[], ARRAY['Christian']::TEXT[], ARRAY['Pentecostal', 'Caste No Bar']::TEXT[], ARRAY['M.B.A', 'No Education Bar']::TEXT[], ARRAY['Government Officer']::TEXT[], ARRAY['vegetarian','non_vegetarian']::TEXT[])
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
VALUES ('00000000-0000-4000-a000-00000000015f', 27, 44, 147, 162, ARRAY['never_married']::TEXT[], ARRAY['Hindu']::TEXT[], ARRAY['Vishwakarma', 'Caste No Bar']::TEXT[], ARRAY['M.Sc', 'No Education Bar']::TEXT[], ARRAY['Mechanical Engineer']::TEXT[], ARRAY['vegetarian','non_vegetarian']::TEXT[])
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
VALUES ('00000000-0000-4000-a000-000000000160', 25, 38, 158, 173, ARRAY['never_married']::TEXT[], ARRAY['Hindu']::TEXT[], ARRAY['Thevar', 'Caste No Bar']::TEXT[], ARRAY['B.Sc', 'No Education Bar']::TEXT[], ARRAY['Software Engineer']::TEXT[], ARRAY['vegetarian','non_vegetarian']::TEXT[])
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
VALUES ('00000000-0000-4000-a000-000000000161', 21, 35, 150, 165, ARRAY['never_married']::TEXT[], ARRAY['Hindu']::TEXT[], ARRAY['Naicker', 'Caste No Bar']::TEXT[], ARRAY['M.C.A', 'No Education Bar']::TEXT[], ARRAY['Mechanical Engineer']::TEXT[], ARRAY['vegetarian','non_vegetarian']::TEXT[])
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
VALUES ('00000000-0000-4000-a000-000000000162', 26, 32, 158, 173, ARRAY['never_married']::TEXT[], ARRAY['Hindu']::TEXT[], ARRAY['Adi Dravida', 'Caste No Bar']::TEXT[], ARRAY['Ph.D', 'No Education Bar']::TEXT[], ARRAY['Mechanical Engineer']::TEXT[], ARRAY['vegetarian','non_vegetarian']::TEXT[])
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
VALUES ('00000000-0000-4000-a000-000000000163', 27, 33, 171, 186, ARRAY['never_married']::TEXT[], ARRAY['Christian']::TEXT[], ARRAY['Protestant Christian', 'Caste No Bar']::TEXT[], ARRAY['B.E. / B.Tech', 'No Education Bar']::TEXT[], ARRAY['College Professor']::TEXT[], ARRAY['vegetarian','non_vegetarian']::TEXT[])
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
VALUES ('00000000-0000-4000-a000-000000000164', 26, 38, 155, 170, ARRAY['never_married']::TEXT[], ARRAY['Hindu']::TEXT[], ARRAY['Nadar', 'Caste No Bar']::TEXT[], ARRAY['M.Sc', 'No Education Bar']::TEXT[], ARRAY['Dentist']::TEXT[], ARRAY['vegetarian','non_vegetarian']::TEXT[])
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
VALUES ('00000000-0000-4000-a000-000000000165', 22, 34, 156, 171, ARRAY['never_married']::TEXT[], ARRAY['Hindu']::TEXT[], ARRAY['Mudaliar', 'Caste No Bar']::TEXT[], ARRAY['M.B.A', 'No Education Bar']::TEXT[], ARRAY['School Teacher']::TEXT[], ARRAY['vegetarian','non_vegetarian']::TEXT[])
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
VALUES ('00000000-0000-4000-a000-000000000166', 21, 44, 139, 154, ARRAY['never_married']::TEXT[], ARRAY['Hindu']::TEXT[], ARRAY['Devendra Kula Vellalar', 'Caste No Bar']::TEXT[], ARRAY['M.B.B.S', 'No Education Bar']::TEXT[], ARRAY['Doctor']::TEXT[], ARRAY['vegetarian','non_vegetarian']::TEXT[])
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
VALUES ('00000000-0000-4000-a000-000000000167', 24, 33, 172, 187, ARRAY['never_married']::TEXT[], ARRAY['Christian']::TEXT[], ARRAY['Vellalar Christian', 'Caste No Bar']::TEXT[], ARRAY['B.Com', 'No Education Bar']::TEXT[], ARRAY['Advocate']::TEXT[], ARRAY['vegetarian','non_vegetarian']::TEXT[])
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
VALUES ('00000000-0000-4000-a000-000000000168', 21, 32, 143, 158, ARRAY['never_married']::TEXT[], ARRAY['Hindu']::TEXT[], ARRAY['Yadav', 'Caste No Bar']::TEXT[], ARRAY['B.Ed', 'No Education Bar']::TEXT[], ARRAY['Pharmacist']::TEXT[], ARRAY['vegetarian','non_vegetarian']::TEXT[])
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
VALUES ('00000000-0000-4000-a000-000000000169', 23, 40, 155, 170, ARRAY['never_married']::TEXT[], ARRAY['Hindu']::TEXT[], ARRAY['Vanniyar', 'Caste No Bar']::TEXT[], ARRAY['M.Sc', 'No Education Bar']::TEXT[], ARRAY['Software Engineer']::TEXT[], ARRAY['vegetarian','non_vegetarian']::TEXT[])
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
VALUES ('00000000-0000-4000-a000-00000000016a', 27, 30, 142, 157, ARRAY['never_married']::TEXT[], ARRAY['Muslim']::TEXT[], ARRAY['Shia Muslim', 'Caste No Bar']::TEXT[], ARRAY['B.E. / B.Tech', 'No Education Bar']::TEXT[], ARRAY['Police Officer']::TEXT[], ARRAY['vegetarian','non_vegetarian']::TEXT[])
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
VALUES ('00000000-0000-4000-a000-00000000016b', 21, 36, 169, 184, ARRAY['never_married']::TEXT[], ARRAY['Hindu']::TEXT[], ARRAY['Naicker', 'Caste No Bar']::TEXT[], ARRAY['B.Sc', 'No Education Bar']::TEXT[], ARRAY['HR Specialist']::TEXT[], ARRAY['vegetarian','non_vegetarian']::TEXT[])
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
VALUES ('00000000-0000-4000-a000-00000000016c', 24, 41, 154, 169, ARRAY['never_married']::TEXT[], ARRAY['Hindu']::TEXT[], ARRAY['Mudaliar', 'Caste No Bar']::TEXT[], ARRAY['B.E. / B.Tech', 'No Education Bar']::TEXT[], ARRAY['Dentist']::TEXT[], ARRAY['vegetarian','non_vegetarian']::TEXT[])
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
VALUES ('00000000-0000-4000-a000-00000000016d', 26, 42, 164, 179, ARRAY['never_married']::TEXT[], ARRAY['Hindu']::TEXT[], ARRAY['Vishwakarma', 'Caste No Bar']::TEXT[], ARRAY['B.Sc', 'No Education Bar']::TEXT[], ARRAY['School Teacher']::TEXT[], ARRAY['vegetarian','non_vegetarian']::TEXT[])
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
VALUES ('00000000-0000-4000-a000-00000000016e', 23, 30, 146, 161, ARRAY['never_married']::TEXT[], ARRAY['Hindu']::TEXT[], ARRAY['Vellalar', 'Caste No Bar']::TEXT[], ARRAY['M.C.A', 'No Education Bar']::TEXT[], ARRAY['Mechanical Engineer']::TEXT[], ARRAY['vegetarian','non_vegetarian']::TEXT[])
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
VALUES ('00000000-0000-4000-a000-00000000016f', 28, 38, 166, 181, ARRAY['never_married']::TEXT[], ARRAY['Muslim']::TEXT[], ARRAY['Rawther', 'Caste No Bar']::TEXT[], ARRAY['Ph.D', 'No Education Bar']::TEXT[], ARRAY['Mechanical Engineer']::TEXT[], ARRAY['vegetarian','non_vegetarian']::TEXT[])
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
VALUES ('00000000-0000-4000-a000-000000000170', 27, 33, 139, 154, ARRAY['never_married']::TEXT[], ARRAY['Hindu']::TEXT[], ARRAY['Gounder', 'Caste No Bar']::TEXT[], ARRAY['M.Sc', 'No Education Bar']::TEXT[], ARRAY['Doctor']::TEXT[], ARRAY['vegetarian','non_vegetarian']::TEXT[])
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
VALUES ('00000000-0000-4000-a000-000000000171', 22, 40, 151, 166, ARRAY['never_married']::TEXT[], ARRAY['Hindu']::TEXT[], ARRAY['Naicker', 'Caste No Bar']::TEXT[], ARRAY['M.A', 'No Education Bar']::TEXT[], ARRAY['Auditor']::TEXT[], ARRAY['vegetarian','non_vegetarian']::TEXT[])
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
VALUES ('00000000-0000-4000-a000-000000000172', 27, 38, 158, 173, ARRAY['never_married']::TEXT[], ARRAY['Hindu']::TEXT[], ARRAY['Brahmin - Iyengar', 'Caste No Bar']::TEXT[], ARRAY['B.Sc', 'No Education Bar']::TEXT[], ARRAY['Pharmacist']::TEXT[], ARRAY['vegetarian','non_vegetarian']::TEXT[])
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
VALUES ('00000000-0000-4000-a000-000000000173', 26, 35, 157, 172, ARRAY['never_married']::TEXT[], ARRAY['Hindu']::TEXT[], ARRAY['Vanniyar', 'Caste No Bar']::TEXT[], ARRAY['M.A', 'No Education Bar']::TEXT[], ARRAY['Architect']::TEXT[], ARRAY['vegetarian','non_vegetarian']::TEXT[])
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
VALUES ('00000000-0000-4000-a000-000000000174', 22, 43, 140, 155, ARRAY['never_married']::TEXT[], ARRAY['Hindu']::TEXT[], ARRAY['Pillai', 'Caste No Bar']::TEXT[], ARRAY['B.A', 'No Education Bar']::TEXT[], ARRAY['Pharmacist']::TEXT[], ARRAY['vegetarian','non_vegetarian']::TEXT[])
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
VALUES ('00000000-0000-4000-a000-000000000175', 27, 30, 149, 164, ARRAY['never_married']::TEXT[], ARRAY['Christian']::TEXT[], ARRAY['Vellalar Christian', 'Caste No Bar']::TEXT[], ARRAY['M.B.A', 'No Education Bar']::TEXT[], ARRAY['Mechanical Engineer']::TEXT[], ARRAY['vegetarian','non_vegetarian']::TEXT[])
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
VALUES ('00000000-0000-4000-a000-000000000176', 27, 41, 138, 153, ARRAY['never_married']::TEXT[], ARRAY['Muslim']::TEXT[], ARRAY['Rawther', 'Caste No Bar']::TEXT[], ARRAY['B.Ed', 'No Education Bar']::TEXT[], ARRAY['Advocate']::TEXT[], ARRAY['vegetarian','non_vegetarian']::TEXT[])
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
VALUES ('00000000-0000-4000-a000-000000000177', 26, 33, 169, 184, ARRAY['never_married']::TEXT[], ARRAY['Hindu']::TEXT[], ARRAY['Adi Dravida', 'Caste No Bar']::TEXT[], ARRAY['B.Sc', 'No Education Bar']::TEXT[], ARRAY['Government Officer']::TEXT[], ARRAY['vegetarian','non_vegetarian']::TEXT[])
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
VALUES ('00000000-0000-4000-a000-000000000178', 22, 41, 140, 155, ARRAY['never_married']::TEXT[], ARRAY['Hindu']::TEXT[], ARRAY['Chettiar', 'Caste No Bar']::TEXT[], ARRAY['M.B.A', 'No Education Bar']::TEXT[], ARRAY['HR Specialist']::TEXT[], ARRAY['vegetarian','non_vegetarian']::TEXT[])
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
VALUES ('00000000-0000-4000-a000-000000000179', 22, 32, 155, 170, ARRAY['never_married']::TEXT[], ARRAY['Hindu']::TEXT[], ARRAY['Devendra Kula Vellalar', 'Caste No Bar']::TEXT[], ARRAY['Ph.D', 'No Education Bar']::TEXT[], ARRAY['College Professor']::TEXT[], ARRAY['vegetarian','non_vegetarian']::TEXT[])
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
VALUES ('00000000-0000-4000-a000-00000000017a', 24, 35, 148, 163, ARRAY['never_married']::TEXT[], ARRAY['Muslim']::TEXT[], ARRAY['Labbai', 'Caste No Bar']::TEXT[], ARRAY['M.B.B.S', 'No Education Bar']::TEXT[], ARRAY['Police Officer']::TEXT[], ARRAY['vegetarian','non_vegetarian']::TEXT[])
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
VALUES ('00000000-0000-4000-a000-00000000017b', 28, 40, 155, 170, ARRAY['never_married']::TEXT[], ARRAY['Hindu']::TEXT[], ARRAY['Chettiar', 'Caste No Bar']::TEXT[], ARRAY['M.Sc', 'No Education Bar']::TEXT[], ARRAY['Pharmacist']::TEXT[], ARRAY['vegetarian','non_vegetarian']::TEXT[])
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
VALUES ('00000000-0000-4000-a000-00000000017c', 22, 33, 157, 172, ARRAY['never_married']::TEXT[], ARRAY['Hindu']::TEXT[], ARRAY['Agamudayar', 'Caste No Bar']::TEXT[], ARRAY['B.A', 'No Education Bar']::TEXT[], ARRAY['College Professor']::TEXT[], ARRAY['vegetarian','non_vegetarian']::TEXT[])
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
VALUES ('00000000-0000-4000-a000-00000000017d', 26, 38, 165, 180, ARRAY['never_married']::TEXT[], ARRAY['Hindu']::TEXT[], ARRAY['Vanniyar', 'Caste No Bar']::TEXT[], ARRAY['M.C.A', 'No Education Bar']::TEXT[], ARRAY['Advocate']::TEXT[], ARRAY['vegetarian','non_vegetarian']::TEXT[])
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
VALUES ('00000000-0000-4000-a000-00000000017e', 27, 44, 153, 168, ARRAY['never_married']::TEXT[], ARRAY['Hindu']::TEXT[], ARRAY['Gounder', 'Caste No Bar']::TEXT[], ARRAY['M.Sc', 'No Education Bar']::TEXT[], ARRAY['Government Officer']::TEXT[], ARRAY['vegetarian','non_vegetarian']::TEXT[])
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
VALUES ('00000000-0000-4000-a000-00000000017f', 23, 30, 173, 188, ARRAY['never_married']::TEXT[], ARRAY['Hindu']::TEXT[], ARRAY['Kallar', 'Caste No Bar']::TEXT[], ARRAY['M.Com', 'No Education Bar']::TEXT[], ARRAY['Dentist']::TEXT[], ARRAY['vegetarian','non_vegetarian']::TEXT[])
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
VALUES ('00000000-0000-4000-a000-000000000180', 26, 36, 142, 157, ARRAY['never_married']::TEXT[], ARRAY['Hindu']::TEXT[], ARRAY['Kallar', 'Caste No Bar']::TEXT[], ARRAY['M.C.A', 'No Education Bar']::TEXT[], ARRAY['Mechanical Engineer']::TEXT[], ARRAY['vegetarian','non_vegetarian']::TEXT[])
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
VALUES ('00000000-0000-4000-a000-000000000181', 23, 43, 148, 163, ARRAY['never_married']::TEXT[], ARRAY['Hindu']::TEXT[], ARRAY['Pillai', 'Caste No Bar']::TEXT[], ARRAY['M.A', 'No Education Bar']::TEXT[], ARRAY['Architect']::TEXT[], ARRAY['vegetarian','non_vegetarian']::TEXT[])
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
VALUES ('00000000-0000-4000-a000-000000000182', 22, 32, 160, 175, ARRAY['never_married']::TEXT[], ARRAY['Hindu']::TEXT[], ARRAY['Naidu', 'Caste No Bar']::TEXT[], ARRAY['B.Ed', 'No Education Bar']::TEXT[], ARRAY['Bank Manager']::TEXT[], ARRAY['vegetarian','non_vegetarian']::TEXT[])
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
VALUES ('00000000-0000-4000-a000-000000000183', 23, 42, 155, 170, ARRAY['never_married']::TEXT[], ARRAY['Hindu']::TEXT[], ARRAY['Devendra Kula Vellalar', 'Caste No Bar']::TEXT[], ARRAY['M.A', 'No Education Bar']::TEXT[], ARRAY['School Teacher']::TEXT[], ARRAY['vegetarian','non_vegetarian']::TEXT[])
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
VALUES ('00000000-0000-4000-a000-000000000184', 22, 38, 136, 151, ARRAY['never_married']::TEXT[], ARRAY['Hindu']::TEXT[], ARRAY['Gounder', 'Caste No Bar']::TEXT[], ARRAY['M.Com', 'No Education Bar']::TEXT[], ARRAY['Pharmacist']::TEXT[], ARRAY['vegetarian','non_vegetarian']::TEXT[])
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
VALUES ('00000000-0000-4000-a000-000000000185', 26, 39, 159, 174, ARRAY['never_married']::TEXT[], ARRAY['Hindu']::TEXT[], ARRAY['Chettiar', 'Caste No Bar']::TEXT[], ARRAY['Ph.D', 'No Education Bar']::TEXT[], ARRAY['College Professor']::TEXT[], ARRAY['vegetarian','non_vegetarian']::TEXT[])
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
VALUES ('00000000-0000-4000-a000-000000000186', 23, 43, 147, 162, ARRAY['never_married']::TEXT[], ARRAY['Hindu']::TEXT[], ARRAY['Vanniyar', 'Caste No Bar']::TEXT[], ARRAY['M.B.B.S', 'No Education Bar']::TEXT[], ARRAY['Police Officer']::TEXT[], ARRAY['vegetarian','non_vegetarian']::TEXT[])
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
VALUES ('00000000-0000-4000-a000-000000000187', 27, 39, 173, 188, ARRAY['never_married']::TEXT[], ARRAY['Hindu']::TEXT[], ARRAY['Naicker', 'Caste No Bar']::TEXT[], ARRAY['B.A', 'No Education Bar']::TEXT[], ARRAY['HR Specialist']::TEXT[], ARRAY['vegetarian','non_vegetarian']::TEXT[])
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
VALUES ('00000000-0000-4000-a000-000000000188', 25, 40, 135, 150, ARRAY['never_married']::TEXT[], ARRAY['Hindu']::TEXT[], ARRAY['Vanniyar', 'Caste No Bar']::TEXT[], ARRAY['B.E. / B.Tech', 'No Education Bar']::TEXT[], ARRAY['School Teacher']::TEXT[], ARRAY['vegetarian','non_vegetarian']::TEXT[])
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
VALUES ('00000000-0000-4000-a000-000000000189', 27, 35, 162, 177, ARRAY['never_married']::TEXT[], ARRAY['Hindu']::TEXT[], ARRAY['Adi Dravida', 'Caste No Bar']::TEXT[], ARRAY['M.Com', 'No Education Bar']::TEXT[], ARRAY['Police Officer']::TEXT[], ARRAY['vegetarian','non_vegetarian']::TEXT[])
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
VALUES ('00000000-0000-4000-a000-00000000018a', 28, 36, 153, 168, ARRAY['never_married']::TEXT[], ARRAY['Muslim']::TEXT[], ARRAY['Shia Muslim', 'Caste No Bar']::TEXT[], ARRAY['M.B.B.S', 'No Education Bar']::TEXT[], ARRAY['Auditor']::TEXT[], ARRAY['vegetarian','non_vegetarian']::TEXT[])
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
VALUES ('00000000-0000-4000-a000-00000000018b', 21, 34, 153, 168, ARRAY['never_married']::TEXT[], ARRAY['Hindu']::TEXT[], ARRAY['Sengunthar', 'Caste No Bar']::TEXT[], ARRAY['B.Ed', 'No Education Bar']::TEXT[], ARRAY['Government Officer']::TEXT[], ARRAY['vegetarian','non_vegetarian']::TEXT[])
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
VALUES ('00000000-0000-4000-a000-00000000018c', 28, 42, 144, 159, ARRAY['never_married']::TEXT[], ARRAY['Hindu']::TEXT[], ARRAY['Mudaliar', 'Caste No Bar']::TEXT[], ARRAY['B.Com', 'No Education Bar']::TEXT[], ARRAY['Dentist']::TEXT[], ARRAY['vegetarian','non_vegetarian']::TEXT[])
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
VALUES ('00000000-0000-4000-a000-00000000018d', 26, 31, 170, 185, ARRAY['never_married']::TEXT[], ARRAY['Hindu']::TEXT[], ARRAY['Vishwakarma', 'Caste No Bar']::TEXT[], ARRAY['B.Ed', 'No Education Bar']::TEXT[], ARRAY['Bank Manager']::TEXT[], ARRAY['vegetarian','non_vegetarian']::TEXT[])
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
VALUES ('00000000-0000-4000-a000-00000000018e', 27, 45, 150, 165, ARRAY['never_married']::TEXT[], ARRAY['Hindu']::TEXT[], ARRAY['Vishwakarma', 'Caste No Bar']::TEXT[], ARRAY['B.Com', 'No Education Bar']::TEXT[], ARRAY['HR Specialist']::TEXT[], ARRAY['vegetarian','non_vegetarian']::TEXT[])
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
VALUES ('00000000-0000-4000-a000-00000000018f', 27, 42, 155, 170, ARRAY['never_married']::TEXT[], ARRAY['Hindu']::TEXT[], ARRAY['Naidu', 'Caste No Bar']::TEXT[], ARRAY['B.Sc', 'No Education Bar']::TEXT[], ARRAY['Doctor']::TEXT[], ARRAY['vegetarian','non_vegetarian']::TEXT[])
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
VALUES ('00000000-0000-4000-a000-000000000190', 25, 41, 159, 174, ARRAY['never_married']::TEXT[], ARRAY['Hindu']::TEXT[], ARRAY['Agamudayar', 'Caste No Bar']::TEXT[], ARRAY['B.E. / B.Tech', 'No Education Bar']::TEXT[], ARRAY['HR Specialist']::TEXT[], ARRAY['vegetarian','non_vegetarian']::TEXT[])
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
VALUES ('00000000-0000-4000-a000-000000000191', 27, 37, 163, 178, ARRAY['never_married']::TEXT[], ARRAY['Muslim']::TEXT[], ARRAY['Marakayar', 'Caste No Bar']::TEXT[], ARRAY['B.A', 'No Education Bar']::TEXT[], ARRAY['Civil Engineer']::TEXT[], ARRAY['vegetarian','non_vegetarian']::TEXT[])
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
VALUES ('00000000-0000-4000-a000-000000000192', 22, 35, 149, 164, ARRAY['never_married']::TEXT[], ARRAY['Hindu']::TEXT[], ARRAY['Adi Dravida', 'Caste No Bar']::TEXT[], ARRAY['B.Sc', 'No Education Bar']::TEXT[], ARRAY['Software Engineer']::TEXT[], ARRAY['vegetarian','non_vegetarian']::TEXT[])
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
VALUES ('00000000-0000-4000-a000-000000000193', 23, 40, 152, 167, ARRAY['never_married']::TEXT[], ARRAY['Hindu']::TEXT[], ARRAY['Vellalar', 'Caste No Bar']::TEXT[], ARRAY['B.E. / B.Tech', 'No Education Bar']::TEXT[], ARRAY['Doctor']::TEXT[], ARRAY['vegetarian','non_vegetarian']::TEXT[])
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
VALUES ('00000000-0000-4000-a000-000000000194', 22, 33, 160, 175, ARRAY['never_married']::TEXT[], ARRAY['Hindu']::TEXT[], ARRAY['Nadar', 'Caste No Bar']::TEXT[], ARRAY['M.C.A', 'No Education Bar']::TEXT[], ARRAY['Mechanical Engineer']::TEXT[], ARRAY['vegetarian','non_vegetarian']::TEXT[])
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
VALUES ('00000000-0000-4000-a000-000000000195', 24, 32, 156, 171, ARRAY['never_married']::TEXT[], ARRAY['Hindu']::TEXT[], ARRAY['Arunthathiyar', 'Caste No Bar']::TEXT[], ARRAY['B.Ed', 'No Education Bar']::TEXT[], ARRAY['Auditor']::TEXT[], ARRAY['vegetarian','non_vegetarian']::TEXT[])
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
VALUES ('00000000-0000-4000-a000-000000000196', 25, 36, 139, 154, ARRAY['never_married']::TEXT[], ARRAY['Hindu']::TEXT[], ARRAY['Gounder', 'Caste No Bar']::TEXT[], ARRAY['B.Com', 'No Education Bar']::TEXT[], ARRAY['School Teacher']::TEXT[], ARRAY['vegetarian','non_vegetarian']::TEXT[])
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
VALUES ('00000000-0000-4000-a000-000000000197', 25, 43, 156, 171, ARRAY['never_married']::TEXT[], ARRAY['Hindu']::TEXT[], ARRAY['Maravar', 'Caste No Bar']::TEXT[], ARRAY['M.B.B.S', 'No Education Bar']::TEXT[], ARRAY['Police Officer']::TEXT[], ARRAY['vegetarian','non_vegetarian']::TEXT[])
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
VALUES ('00000000-0000-4000-a000-000000000198', 26, 35, 154, 169, ARRAY['never_married']::TEXT[], ARRAY['Hindu']::TEXT[], ARRAY['Naicker', 'Caste No Bar']::TEXT[], ARRAY['B.Com', 'No Education Bar']::TEXT[], ARRAY['Software Engineer']::TEXT[], ARRAY['vegetarian','non_vegetarian']::TEXT[])
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
VALUES ('00000000-0000-4000-a000-000000000199', 23, 30, 164, 179, ARRAY['never_married']::TEXT[], ARRAY['Hindu']::TEXT[], ARRAY['Naicker', 'Caste No Bar']::TEXT[], ARRAY['B.E. / B.Tech', 'No Education Bar']::TEXT[], ARRAY['Mechanical Engineer']::TEXT[], ARRAY['vegetarian','non_vegetarian']::TEXT[])
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
VALUES ('00000000-0000-4000-a000-00000000019a', 23, 38, 137, 152, ARRAY['never_married']::TEXT[], ARRAY['Hindu']::TEXT[], ARRAY['Gounder', 'Caste No Bar']::TEXT[], ARRAY['M.A', 'No Education Bar']::TEXT[], ARRAY['Auditor']::TEXT[], ARRAY['vegetarian','non_vegetarian']::TEXT[])
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
VALUES ('00000000-0000-4000-a000-00000000019b', 22, 36, 150, 165, ARRAY['never_married']::TEXT[], ARRAY['Christian']::TEXT[], ARRAY['Pentecostal', 'Caste No Bar']::TEXT[], ARRAY['B.Ed', 'No Education Bar']::TEXT[], ARRAY['Bank Manager']::TEXT[], ARRAY['vegetarian','non_vegetarian']::TEXT[])
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
VALUES ('00000000-0000-4000-a000-00000000019c', 26, 42, 139, 154, ARRAY['never_married']::TEXT[], ARRAY['Hindu']::TEXT[], ARRAY['Brahmin - Iyengar', 'Caste No Bar']::TEXT[], ARRAY['M.Sc', 'No Education Bar']::TEXT[], ARRAY['Architect']::TEXT[], ARRAY['vegetarian','non_vegetarian']::TEXT[])
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
VALUES ('00000000-0000-4000-a000-00000000019d', 26, 43, 160, 175, ARRAY['never_married']::TEXT[], ARRAY['Hindu']::TEXT[], ARRAY['Vishwakarma', 'Caste No Bar']::TEXT[], ARRAY['M.Sc', 'No Education Bar']::TEXT[], ARRAY['Civil Engineer']::TEXT[], ARRAY['vegetarian','non_vegetarian']::TEXT[])
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
VALUES ('00000000-0000-4000-a000-00000000019e', 25, 34, 144, 159, ARRAY['never_married']::TEXT[], ARRAY['Hindu']::TEXT[], ARRAY['Mudaliar', 'Caste No Bar']::TEXT[], ARRAY['M.A', 'No Education Bar']::TEXT[], ARRAY['Police Officer']::TEXT[], ARRAY['vegetarian','non_vegetarian']::TEXT[])
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
VALUES ('00000000-0000-4000-a000-00000000019f', 24, 39, 169, 184, ARRAY['never_married']::TEXT[], ARRAY['Hindu']::TEXT[], ARRAY['Maravar', 'Caste No Bar']::TEXT[], ARRAY['M.Sc', 'No Education Bar']::TEXT[], ARRAY['Mechanical Engineer']::TEXT[], ARRAY['vegetarian','non_vegetarian']::TEXT[])
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
VALUES ('00000000-0000-4000-a000-0000000001a0', 24, 35, 157, 172, ARRAY['never_married']::TEXT[], ARRAY['Hindu']::TEXT[], ARRAY['Arunthathiyar', 'Caste No Bar']::TEXT[], ARRAY['M.A', 'No Education Bar']::TEXT[], ARRAY['HR Specialist']::TEXT[], ARRAY['vegetarian','non_vegetarian']::TEXT[])
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
VALUES ('00000000-0000-4000-a000-0000000001a1', 23, 32, 149, 164, ARRAY['never_married']::TEXT[], ARRAY['Hindu']::TEXT[], ARRAY['Brahmin - Iyer', 'Caste No Bar']::TEXT[], ARRAY['B.Sc', 'No Education Bar']::TEXT[], ARRAY['Doctor']::TEXT[], ARRAY['vegetarian','non_vegetarian']::TEXT[])
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
VALUES ('00000000-0000-4000-a000-0000000001a2', 24, 40, 151, 166, ARRAY['never_married']::TEXT[], ARRAY['Hindu']::TEXT[], ARRAY['Mudaliar', 'Caste No Bar']::TEXT[], ARRAY['B.E. / B.Tech', 'No Education Bar']::TEXT[], ARRAY['Mechanical Engineer']::TEXT[], ARRAY['vegetarian','non_vegetarian']::TEXT[])
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
VALUES ('00000000-0000-4000-a000-0000000001a3', 22, 30, 167, 182, ARRAY['never_married']::TEXT[], ARRAY['Hindu']::TEXT[], ARRAY['Mudaliar', 'Caste No Bar']::TEXT[], ARRAY['B.Ed', 'No Education Bar']::TEXT[], ARRAY['Pharmacist']::TEXT[], ARRAY['vegetarian','non_vegetarian']::TEXT[])
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
VALUES ('00000000-0000-4000-a000-0000000001a4', 25, 44, 136, 151, ARRAY['never_married']::TEXT[], ARRAY['Hindu']::TEXT[], ARRAY['Arunthathiyar', 'Caste No Bar']::TEXT[], ARRAY['B.Sc', 'No Education Bar']::TEXT[], ARRAY['HR Specialist']::TEXT[], ARRAY['vegetarian','non_vegetarian']::TEXT[])
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
VALUES ('00000000-0000-4000-a000-0000000001a5', 21, 33, 169, 184, ARRAY['never_married']::TEXT[], ARRAY['Hindu']::TEXT[], ARRAY['Agamudayar', 'Caste No Bar']::TEXT[], ARRAY['B.Ed', 'No Education Bar']::TEXT[], ARRAY['Bank Manager']::TEXT[], ARRAY['vegetarian','non_vegetarian']::TEXT[])
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
VALUES ('00000000-0000-4000-a000-0000000001a6', 21, 40, 157, 172, ARRAY['never_married']::TEXT[], ARRAY['Muslim']::TEXT[], ARRAY['Marakayar', 'Caste No Bar']::TEXT[], ARRAY['B.Ed', 'No Education Bar']::TEXT[], ARRAY['Dentist']::TEXT[], ARRAY['vegetarian','non_vegetarian']::TEXT[])
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
VALUES ('00000000-0000-4000-a000-0000000001a7', 25, 30, 150, 165, ARRAY['never_married']::TEXT[], ARRAY['Hindu']::TEXT[], ARRAY['Vishwakarma', 'Caste No Bar']::TEXT[], ARRAY['M.A', 'No Education Bar']::TEXT[], ARRAY['Civil Engineer']::TEXT[], ARRAY['vegetarian','non_vegetarian']::TEXT[])
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
VALUES ('00000000-0000-4000-a000-0000000001a8', 24, 33, 146, 161, ARRAY['never_married']::TEXT[], ARRAY['Hindu']::TEXT[], ARRAY['Thevar', 'Caste No Bar']::TEXT[], ARRAY['Ph.D', 'No Education Bar']::TEXT[], ARRAY['Mechanical Engineer']::TEXT[], ARRAY['vegetarian','non_vegetarian']::TEXT[])
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
VALUES ('00000000-0000-4000-a000-0000000001a9', 28, 34, 148, 163, ARRAY['never_married']::TEXT[], ARRAY['Hindu']::TEXT[], ARRAY['Vellalar', 'Caste No Bar']::TEXT[], ARRAY['M.Com', 'No Education Bar']::TEXT[], ARRAY['School Teacher']::TEXT[], ARRAY['vegetarian','non_vegetarian']::TEXT[])
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
VALUES ('00000000-0000-4000-a000-0000000001aa', 25, 41, 153, 168, ARRAY['never_married']::TEXT[], ARRAY['Hindu']::TEXT[], ARRAY['Mudaliar', 'Caste No Bar']::TEXT[], ARRAY['B.Com', 'No Education Bar']::TEXT[], ARRAY['School Teacher']::TEXT[], ARRAY['vegetarian','non_vegetarian']::TEXT[])
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
VALUES ('00000000-0000-4000-a000-0000000001ab', 21, 45, 171, 186, ARRAY['never_married']::TEXT[], ARRAY['Muslim']::TEXT[], ARRAY['Rawther', 'Caste No Bar']::TEXT[], ARRAY['B.E. / B.Tech', 'No Education Bar']::TEXT[], ARRAY['HR Specialist']::TEXT[], ARRAY['vegetarian','non_vegetarian']::TEXT[])
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
VALUES ('00000000-0000-4000-a000-0000000001ac', 26, 40, 143, 158, ARRAY['never_married']::TEXT[], ARRAY['Christian']::TEXT[], ARRAY['Vellalar Christian', 'Caste No Bar']::TEXT[], ARRAY['Ph.D', 'No Education Bar']::TEXT[], ARRAY['Dentist']::TEXT[], ARRAY['vegetarian','non_vegetarian']::TEXT[])
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
VALUES ('00000000-0000-4000-a000-0000000001ad', 23, 30, 156, 171, ARRAY['never_married']::TEXT[], ARRAY['Hindu']::TEXT[], ARRAY['Gounder', 'Caste No Bar']::TEXT[], ARRAY['B.A', 'No Education Bar']::TEXT[], ARRAY['Software Engineer']::TEXT[], ARRAY['vegetarian','non_vegetarian']::TEXT[])
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
VALUES ('00000000-0000-4000-a000-0000000001ae', 25, 33, 144, 159, ARRAY['never_married']::TEXT[], ARRAY['Muslim']::TEXT[], ARRAY['Shia Muslim', 'Caste No Bar']::TEXT[], ARRAY['B.Ed', 'No Education Bar']::TEXT[], ARRAY['Architect']::TEXT[], ARRAY['vegetarian','non_vegetarian']::TEXT[])
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
VALUES ('00000000-0000-4000-a000-0000000001af', 26, 44, 165, 180, ARRAY['never_married']::TEXT[], ARRAY['Hindu']::TEXT[], ARRAY['Pillai', 'Caste No Bar']::TEXT[], ARRAY['M.B.A', 'No Education Bar']::TEXT[], ARRAY['Doctor']::TEXT[], ARRAY['vegetarian','non_vegetarian']::TEXT[])
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
VALUES ('00000000-0000-4000-a000-0000000001b0', 26, 40, 143, 158, ARRAY['never_married']::TEXT[], ARRAY['Muslim']::TEXT[], ARRAY['Shia Muslim', 'Caste No Bar']::TEXT[], ARRAY['M.B.A', 'No Education Bar']::TEXT[], ARRAY['School Teacher']::TEXT[], ARRAY['vegetarian','non_vegetarian']::TEXT[])
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
VALUES ('00000000-0000-4000-a000-0000000001b1', 27, 32, 171, 186, ARRAY['never_married']::TEXT[], ARRAY['Muslim']::TEXT[], ARRAY['Sunni Muslim', 'Caste No Bar']::TEXT[], ARRAY['M.B.B.S', 'No Education Bar']::TEXT[], ARRAY['Advocate']::TEXT[], ARRAY['vegetarian','non_vegetarian']::TEXT[])
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
VALUES ('00000000-0000-4000-a000-0000000001b2', 27, 33, 144, 159, ARRAY['never_married']::TEXT[], ARRAY['Hindu']::TEXT[], ARRAY['Nadar', 'Caste No Bar']::TEXT[], ARRAY['Ph.D', 'No Education Bar']::TEXT[], ARRAY['Police Officer']::TEXT[], ARRAY['vegetarian','non_vegetarian']::TEXT[])
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
VALUES ('00000000-0000-4000-a000-0000000001b3', 22, 32, 163, 178, ARRAY['never_married']::TEXT[], ARRAY['Hindu']::TEXT[], ARRAY['Naicker', 'Caste No Bar']::TEXT[], ARRAY['B.Sc', 'No Education Bar']::TEXT[], ARRAY['HR Specialist']::TEXT[], ARRAY['vegetarian','non_vegetarian']::TEXT[])
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
VALUES ('00000000-0000-4000-a000-0000000001b4', 24, 41, 144, 159, ARRAY['never_married']::TEXT[], ARRAY['Hindu']::TEXT[], ARRAY['Vanniyar', 'Caste No Bar']::TEXT[], ARRAY['B.E. / B.Tech', 'No Education Bar']::TEXT[], ARRAY['Doctor']::TEXT[], ARRAY['vegetarian','non_vegetarian']::TEXT[])
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
VALUES ('00000000-0000-4000-a000-0000000001b5', 22, 34, 159, 174, ARRAY['never_married']::TEXT[], ARRAY['Hindu']::TEXT[], ARRAY['Chettiar', 'Caste No Bar']::TEXT[], ARRAY['M.B.A', 'No Education Bar']::TEXT[], ARRAY['Mechanical Engineer']::TEXT[], ARRAY['vegetarian','non_vegetarian']::TEXT[])
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
VALUES ('00000000-0000-4000-a000-0000000001b6', 23, 34, 156, 171, ARRAY['never_married']::TEXT[], ARRAY['Hindu']::TEXT[], ARRAY['Maravar', 'Caste No Bar']::TEXT[], ARRAY['M.B.A', 'No Education Bar']::TEXT[], ARRAY['HR Specialist']::TEXT[], ARRAY['vegetarian','non_vegetarian']::TEXT[])
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
VALUES ('00000000-0000-4000-a000-0000000001b7', 24, 41, 160, 175, ARRAY['never_married']::TEXT[], ARRAY['Christian']::TEXT[], ARRAY['Nadar Christian', 'Caste No Bar']::TEXT[], ARRAY['B.Sc', 'No Education Bar']::TEXT[], ARRAY['Government Officer']::TEXT[], ARRAY['vegetarian','non_vegetarian']::TEXT[])
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
VALUES ('00000000-0000-4000-a000-0000000001b8', 28, 34, 147, 162, ARRAY['never_married']::TEXT[], ARRAY['Hindu']::TEXT[], ARRAY['Sengunthar', 'Caste No Bar']::TEXT[], ARRAY['M.C.A', 'No Education Bar']::TEXT[], ARRAY['Civil Engineer']::TEXT[], ARRAY['vegetarian','non_vegetarian']::TEXT[])
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
VALUES ('00000000-0000-4000-a000-0000000001b9', 25, 42, 149, 164, ARRAY['never_married']::TEXT[], ARRAY['Christian']::TEXT[], ARRAY['CSI Christian', 'Caste No Bar']::TEXT[], ARRAY['B.A', 'No Education Bar']::TEXT[], ARRAY['Pharmacist']::TEXT[], ARRAY['vegetarian','non_vegetarian']::TEXT[])
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
VALUES ('00000000-0000-4000-a000-0000000001ba', 21, 36, 145, 160, ARRAY['never_married']::TEXT[], ARRAY['Hindu']::TEXT[], ARRAY['Kallar', 'Caste No Bar']::TEXT[], ARRAY['M.B.B.S', 'No Education Bar']::TEXT[], ARRAY['Auditor']::TEXT[], ARRAY['vegetarian','non_vegetarian']::TEXT[])
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
VALUES ('00000000-0000-4000-a000-0000000001bb', 21, 30, 168, 183, ARRAY['never_married']::TEXT[], ARRAY['Muslim']::TEXT[], ARRAY['Sunni Muslim', 'Caste No Bar']::TEXT[], ARRAY['M.A', 'No Education Bar']::TEXT[], ARRAY['Police Officer']::TEXT[], ARRAY['vegetarian','non_vegetarian']::TEXT[])
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
VALUES ('00000000-0000-4000-a000-0000000001bc', 26, 44, 158, 173, ARRAY['never_married']::TEXT[], ARRAY['Hindu']::TEXT[], ARRAY['Yadav', 'Caste No Bar']::TEXT[], ARRAY['M.A', 'No Education Bar']::TEXT[], ARRAY['Doctor']::TEXT[], ARRAY['vegetarian','non_vegetarian']::TEXT[])
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
VALUES ('00000000-0000-4000-a000-0000000001bd', 25, 30, 173, 188, ARRAY['never_married']::TEXT[], ARRAY['Hindu']::TEXT[], ARRAY['Yadav', 'Caste No Bar']::TEXT[], ARRAY['M.Sc', 'No Education Bar']::TEXT[], ARRAY['Civil Engineer']::TEXT[], ARRAY['vegetarian','non_vegetarian']::TEXT[])
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
VALUES ('00000000-0000-4000-a000-0000000001be', 21, 43, 151, 166, ARRAY['never_married']::TEXT[], ARRAY['Hindu']::TEXT[], ARRAY['Vanniyar', 'Caste No Bar']::TEXT[], ARRAY['M.B.A', 'No Education Bar']::TEXT[], ARRAY['School Teacher']::TEXT[], ARRAY['vegetarian','non_vegetarian']::TEXT[])
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
VALUES ('00000000-0000-4000-a000-0000000001bf', 27, 37, 173, 188, ARRAY['never_married']::TEXT[], ARRAY['Hindu']::TEXT[], ARRAY['Nadar', 'Caste No Bar']::TEXT[], ARRAY['M.Com', 'No Education Bar']::TEXT[], ARRAY['Government Officer']::TEXT[], ARRAY['vegetarian','non_vegetarian']::TEXT[])
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
VALUES ('00000000-0000-4000-a000-0000000001c0', 25, 40, 152, 167, ARRAY['never_married']::TEXT[], ARRAY['Hindu']::TEXT[], ARRAY['Thevar', 'Caste No Bar']::TEXT[], ARRAY['M.B.B.S', 'No Education Bar']::TEXT[], ARRAY['Bank Manager']::TEXT[], ARRAY['vegetarian','non_vegetarian']::TEXT[])
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
VALUES ('00000000-0000-4000-a000-0000000001c1', 27, 30, 171, 186, ARRAY['never_married']::TEXT[], ARRAY['Hindu']::TEXT[], ARRAY['Pillai', 'Caste No Bar']::TEXT[], ARRAY['B.A', 'No Education Bar']::TEXT[], ARRAY['Auditor']::TEXT[], ARRAY['vegetarian','non_vegetarian']::TEXT[])
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
VALUES ('00000000-0000-4000-a000-0000000001c2', 21, 34, 139, 154, ARRAY['never_married']::TEXT[], ARRAY['Hindu']::TEXT[], ARRAY['Brahmin - Iyer', 'Caste No Bar']::TEXT[], ARRAY['M.B.A', 'No Education Bar']::TEXT[], ARRAY['Advocate']::TEXT[], ARRAY['vegetarian','non_vegetarian']::TEXT[])
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
VALUES ('00000000-0000-4000-a000-0000000001c3', 21, 32, 152, 167, ARRAY['never_married']::TEXT[], ARRAY['Hindu']::TEXT[], ARRAY['Yadav', 'Caste No Bar']::TEXT[], ARRAY['Ph.D', 'No Education Bar']::TEXT[], ARRAY['Software Engineer']::TEXT[], ARRAY['vegetarian','non_vegetarian']::TEXT[])
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
VALUES ('00000000-0000-4000-a000-0000000001c4', 25, 43, 150, 165, ARRAY['never_married']::TEXT[], ARRAY['Hindu']::TEXT[], ARRAY['Kallar', 'Caste No Bar']::TEXT[], ARRAY['B.Ed', 'No Education Bar']::TEXT[], ARRAY['College Professor']::TEXT[], ARRAY['vegetarian','non_vegetarian']::TEXT[])
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
VALUES ('00000000-0000-4000-a000-0000000001c5', 27, 31, 151, 166, ARRAY['never_married']::TEXT[], ARRAY['Hindu']::TEXT[], ARRAY['Brahmin - Iyer', 'Caste No Bar']::TEXT[], ARRAY['B.E. / B.Tech', 'No Education Bar']::TEXT[], ARRAY['Dentist']::TEXT[], ARRAY['vegetarian','non_vegetarian']::TEXT[])
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
VALUES ('00000000-0000-4000-a000-0000000001c6', 22, 38, 146, 161, ARRAY['never_married']::TEXT[], ARRAY['Hindu']::TEXT[], ARRAY['Arunthathiyar', 'Caste No Bar']::TEXT[], ARRAY['Ph.D', 'No Education Bar']::TEXT[], ARRAY['Government Officer']::TEXT[], ARRAY['vegetarian','non_vegetarian']::TEXT[])
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
VALUES ('00000000-0000-4000-a000-0000000001c7', 25, 35, 158, 173, ARRAY['never_married']::TEXT[], ARRAY['Hindu']::TEXT[], ARRAY['Yadav', 'Caste No Bar']::TEXT[], ARRAY['M.C.A', 'No Education Bar']::TEXT[], ARRAY['Civil Engineer']::TEXT[], ARRAY['vegetarian','non_vegetarian']::TEXT[])
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
VALUES ('00000000-0000-4000-a000-0000000001c8', 21, 38, 137, 152, ARRAY['never_married']::TEXT[], ARRAY['Hindu']::TEXT[], ARRAY['Vellalar', 'Caste No Bar']::TEXT[], ARRAY['B.Com', 'No Education Bar']::TEXT[], ARRAY['Mechanical Engineer']::TEXT[], ARRAY['vegetarian','non_vegetarian']::TEXT[])
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
VALUES ('00000000-0000-4000-a000-0000000001c9', 27, 33, 165, 180, ARRAY['never_married']::TEXT[], ARRAY['Hindu']::TEXT[], ARRAY['Yadav', 'Caste No Bar']::TEXT[], ARRAY['M.B.A', 'No Education Bar']::TEXT[], ARRAY['Doctor']::TEXT[], ARRAY['vegetarian','non_vegetarian']::TEXT[])
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
VALUES ('00000000-0000-4000-a000-0000000001ca', 25, 35, 146, 161, ARRAY['never_married']::TEXT[], ARRAY['Hindu']::TEXT[], ARRAY['Sengunthar', 'Caste No Bar']::TEXT[], ARRAY['B.Ed', 'No Education Bar']::TEXT[], ARRAY['Mechanical Engineer']::TEXT[], ARRAY['vegetarian','non_vegetarian']::TEXT[])
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
VALUES ('00000000-0000-4000-a000-0000000001cb', 27, 38, 172, 187, ARRAY['never_married']::TEXT[], ARRAY['Hindu']::TEXT[], ARRAY['Sengunthar', 'Caste No Bar']::TEXT[], ARRAY['M.A', 'No Education Bar']::TEXT[], ARRAY['College Professor']::TEXT[], ARRAY['vegetarian','non_vegetarian']::TEXT[])
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
VALUES ('00000000-0000-4000-a000-0000000001cc', 28, 44, 142, 157, ARRAY['never_married']::TEXT[], ARRAY['Hindu']::TEXT[], ARRAY['Pillai', 'Caste No Bar']::TEXT[], ARRAY['M.B.B.S', 'No Education Bar']::TEXT[], ARRAY['Mechanical Engineer']::TEXT[], ARRAY['vegetarian','non_vegetarian']::TEXT[])
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
VALUES ('00000000-0000-4000-a000-0000000001cd', 27, 45, 159, 174, ARRAY['never_married']::TEXT[], ARRAY['Christian']::TEXT[], ARRAY['Protestant Christian', 'Caste No Bar']::TEXT[], ARRAY['M.B.A', 'No Education Bar']::TEXT[], ARRAY['Bank Manager']::TEXT[], ARRAY['vegetarian','non_vegetarian']::TEXT[])
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
VALUES ('00000000-0000-4000-a000-0000000001ce', 27, 30, 148, 163, ARRAY['never_married']::TEXT[], ARRAY['Muslim']::TEXT[], ARRAY['Shia Muslim', 'Caste No Bar']::TEXT[], ARRAY['M.C.A', 'No Education Bar']::TEXT[], ARRAY['Advocate']::TEXT[], ARRAY['vegetarian','non_vegetarian']::TEXT[])
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
VALUES ('00000000-0000-4000-a000-0000000001cf', 24, 33, 168, 183, ARRAY['never_married']::TEXT[], ARRAY['Hindu']::TEXT[], ARRAY['Vanniyar', 'Caste No Bar']::TEXT[], ARRAY['M.Sc', 'No Education Bar']::TEXT[], ARRAY['Software Engineer']::TEXT[], ARRAY['vegetarian','non_vegetarian']::TEXT[])
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
VALUES ('00000000-0000-4000-a000-0000000001d0', 24, 31, 147, 162, ARRAY['never_married']::TEXT[], ARRAY['Hindu']::TEXT[], ARRAY['Sengunthar', 'Caste No Bar']::TEXT[], ARRAY['M.A', 'No Education Bar']::TEXT[], ARRAY['School Teacher']::TEXT[], ARRAY['vegetarian','non_vegetarian']::TEXT[])
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
VALUES ('00000000-0000-4000-a000-0000000001d1', 23, 30, 154, 169, ARRAY['never_married']::TEXT[], ARRAY['Hindu']::TEXT[], ARRAY['Chettiar', 'Caste No Bar']::TEXT[], ARRAY['B.A', 'No Education Bar']::TEXT[], ARRAY['Mechanical Engineer']::TEXT[], ARRAY['vegetarian','non_vegetarian']::TEXT[])
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
VALUES ('00000000-0000-4000-a000-0000000001d2', 25, 42, 140, 155, ARRAY['never_married']::TEXT[], ARRAY['Hindu']::TEXT[], ARRAY['Chettiar', 'Caste No Bar']::TEXT[], ARRAY['B.Ed', 'No Education Bar']::TEXT[], ARRAY['Architect']::TEXT[], ARRAY['vegetarian','non_vegetarian']::TEXT[])
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
VALUES ('00000000-0000-4000-a000-0000000001d3', 22, 32, 147, 162, ARRAY['never_married']::TEXT[], ARRAY['Muslim']::TEXT[], ARRAY['Marakayar', 'Caste No Bar']::TEXT[], ARRAY['M.A', 'No Education Bar']::TEXT[], ARRAY['School Teacher']::TEXT[], ARRAY['vegetarian','non_vegetarian']::TEXT[])
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
VALUES ('00000000-0000-4000-a000-0000000001d4', 27, 40, 138, 153, ARRAY['never_married']::TEXT[], ARRAY['Hindu']::TEXT[], ARRAY['Pillai', 'Caste No Bar']::TEXT[], ARRAY['B.A', 'No Education Bar']::TEXT[], ARRAY['HR Specialist']::TEXT[], ARRAY['vegetarian','non_vegetarian']::TEXT[])
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
VALUES ('00000000-0000-4000-a000-0000000001d5', 25, 43, 165, 180, ARRAY['never_married']::TEXT[], ARRAY['Hindu']::TEXT[], ARRAY['Nadar', 'Caste No Bar']::TEXT[], ARRAY['B.Com', 'No Education Bar']::TEXT[], ARRAY['Bank Manager']::TEXT[], ARRAY['vegetarian','non_vegetarian']::TEXT[])
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
VALUES ('00000000-0000-4000-a000-0000000001d6', 28, 44, 143, 158, ARRAY['never_married']::TEXT[], ARRAY['Hindu']::TEXT[], ARRAY['Brahmin - Iyengar', 'Caste No Bar']::TEXT[], ARRAY['M.Com', 'No Education Bar']::TEXT[], ARRAY['Architect']::TEXT[], ARRAY['vegetarian','non_vegetarian']::TEXT[])
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
VALUES ('00000000-0000-4000-a000-0000000001d7', 25, 41, 160, 175, ARRAY['never_married']::TEXT[], ARRAY['Hindu']::TEXT[], ARRAY['Adi Dravida', 'Caste No Bar']::TEXT[], ARRAY['M.B.B.S', 'No Education Bar']::TEXT[], ARRAY['Police Officer']::TEXT[], ARRAY['vegetarian','non_vegetarian']::TEXT[])
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
VALUES ('00000000-0000-4000-a000-0000000001d8', 26, 32, 158, 173, ARRAY['never_married']::TEXT[], ARRAY['Muslim']::TEXT[], ARRAY['Marakayar', 'Caste No Bar']::TEXT[], ARRAY['Ph.D', 'No Education Bar']::TEXT[], ARRAY['Police Officer']::TEXT[], ARRAY['vegetarian','non_vegetarian']::TEXT[])
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
VALUES ('00000000-0000-4000-a000-0000000001d9', 26, 45, 167, 182, ARRAY['never_married']::TEXT[], ARRAY['Hindu']::TEXT[], ARRAY['Chettiar', 'Caste No Bar']::TEXT[], ARRAY['B.E. / B.Tech', 'No Education Bar']::TEXT[], ARRAY['HR Specialist']::TEXT[], ARRAY['vegetarian','non_vegetarian']::TEXT[])
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
VALUES ('00000000-0000-4000-a000-0000000001da', 23, 31, 148, 163, ARRAY['never_married']::TEXT[], ARRAY['Hindu']::TEXT[], ARRAY['Agamudayar', 'Caste No Bar']::TEXT[], ARRAY['M.B.B.S', 'No Education Bar']::TEXT[], ARRAY['Advocate']::TEXT[], ARRAY['vegetarian','non_vegetarian']::TEXT[])
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
VALUES ('00000000-0000-4000-a000-0000000001db', 24, 33, 156, 171, ARRAY['never_married']::TEXT[], ARRAY['Hindu']::TEXT[], ARRAY['Vanniyar', 'Caste No Bar']::TEXT[], ARRAY['M.Sc', 'No Education Bar']::TEXT[], ARRAY['HR Specialist']::TEXT[], ARRAY['vegetarian','non_vegetarian']::TEXT[])
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
VALUES ('00000000-0000-4000-a000-0000000001dc', 27, 40, 136, 151, ARRAY['never_married']::TEXT[], ARRAY['Muslim']::TEXT[], ARRAY['Sunni Muslim', 'Caste No Bar']::TEXT[], ARRAY['B.Com', 'No Education Bar']::TEXT[], ARRAY['Business Owner']::TEXT[], ARRAY['vegetarian','non_vegetarian']::TEXT[])
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
VALUES ('00000000-0000-4000-a000-0000000001dd', 22, 36, 163, 178, ARRAY['never_married']::TEXT[], ARRAY['Hindu']::TEXT[], ARRAY['Brahmin - Iyer', 'Caste No Bar']::TEXT[], ARRAY['M.Com', 'No Education Bar']::TEXT[], ARRAY['Dentist']::TEXT[], ARRAY['vegetarian','non_vegetarian']::TEXT[])
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
VALUES ('00000000-0000-4000-a000-0000000001de', 21, 44, 159, 174, ARRAY['never_married']::TEXT[], ARRAY['Hindu']::TEXT[], ARRAY['Naicker', 'Caste No Bar']::TEXT[], ARRAY['M.B.A', 'No Education Bar']::TEXT[], ARRAY['College Professor']::TEXT[], ARRAY['vegetarian','non_vegetarian']::TEXT[])
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
VALUES ('00000000-0000-4000-a000-0000000001df', 22, 33, 149, 164, ARRAY['never_married']::TEXT[], ARRAY['Hindu']::TEXT[], ARRAY['Vanniyar', 'Caste No Bar']::TEXT[], ARRAY['M.Sc', 'No Education Bar']::TEXT[], ARRAY['Police Officer']::TEXT[], ARRAY['vegetarian','non_vegetarian']::TEXT[])
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
VALUES ('00000000-0000-4000-a000-0000000001e0', 28, 34, 151, 166, ARRAY['never_married']::TEXT[], ARRAY['Muslim']::TEXT[], ARRAY['Marakayar', 'Caste No Bar']::TEXT[], ARRAY['M.Com', 'No Education Bar']::TEXT[], ARRAY['Software Engineer']::TEXT[], ARRAY['vegetarian','non_vegetarian']::TEXT[])
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
VALUES ('00000000-0000-4000-a000-0000000001e1', 25, 35, 156, 171, ARRAY['never_married']::TEXT[], ARRAY['Hindu']::TEXT[], ARRAY['Vishwakarma', 'Caste No Bar']::TEXT[], ARRAY['M.Com', 'No Education Bar']::TEXT[], ARRAY['Government Officer']::TEXT[], ARRAY['vegetarian','non_vegetarian']::TEXT[])
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
VALUES ('00000000-0000-4000-a000-0000000001e2', 26, 42, 155, 170, ARRAY['never_married']::TEXT[], ARRAY['Hindu']::TEXT[], ARRAY['Naicker', 'Caste No Bar']::TEXT[], ARRAY['M.B.A', 'No Education Bar']::TEXT[], ARRAY['Business Owner']::TEXT[], ARRAY['vegetarian','non_vegetarian']::TEXT[])
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
VALUES ('00000000-0000-4000-a000-0000000001e3', 24, 37, 154, 169, ARRAY['never_married']::TEXT[], ARRAY['Hindu']::TEXT[], ARRAY['Mudaliar', 'Caste No Bar']::TEXT[], ARRAY['M.Com', 'No Education Bar']::TEXT[], ARRAY['Government Officer']::TEXT[], ARRAY['vegetarian','non_vegetarian']::TEXT[])
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
VALUES ('00000000-0000-4000-a000-0000000001e4', 25, 43, 143, 158, ARRAY['never_married']::TEXT[], ARRAY['Hindu']::TEXT[], ARRAY['Vishwakarma', 'Caste No Bar']::TEXT[], ARRAY['M.A', 'No Education Bar']::TEXT[], ARRAY['Government Officer']::TEXT[], ARRAY['vegetarian','non_vegetarian']::TEXT[])
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
VALUES ('00000000-0000-4000-a000-0000000001e5', 21, 39, 157, 172, ARRAY['never_married']::TEXT[], ARRAY['Hindu']::TEXT[], ARRAY['Pillai', 'Caste No Bar']::TEXT[], ARRAY['M.Com', 'No Education Bar']::TEXT[], ARRAY['Dentist']::TEXT[], ARRAY['vegetarian','non_vegetarian']::TEXT[])
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
VALUES ('00000000-0000-4000-a000-0000000001e6', 28, 44, 159, 174, ARRAY['never_married']::TEXT[], ARRAY['Hindu']::TEXT[], ARRAY['Sengunthar', 'Caste No Bar']::TEXT[], ARRAY['B.A', 'No Education Bar']::TEXT[], ARRAY['Business Owner']::TEXT[], ARRAY['vegetarian','non_vegetarian']::TEXT[])
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
VALUES ('00000000-0000-4000-a000-0000000001e7', 27, 44, 162, 177, ARRAY['never_married']::TEXT[], ARRAY['Hindu']::TEXT[], ARRAY['Naicker', 'Caste No Bar']::TEXT[], ARRAY['B.Com', 'No Education Bar']::TEXT[], ARRAY['Software Engineer']::TEXT[], ARRAY['vegetarian','non_vegetarian']::TEXT[])
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
VALUES ('00000000-0000-4000-a000-0000000001e8', 28, 40, 150, 165, ARRAY['never_married']::TEXT[], ARRAY['Hindu']::TEXT[], ARRAY['Arunthathiyar', 'Caste No Bar']::TEXT[], ARRAY['M.B.A', 'No Education Bar']::TEXT[], ARRAY['College Professor']::TEXT[], ARRAY['vegetarian','non_vegetarian']::TEXT[])
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
VALUES ('00000000-0000-4000-a000-0000000001e9', 25, 39, 167, 182, ARRAY['never_married']::TEXT[], ARRAY['Hindu']::TEXT[], ARRAY['Yadav', 'Caste No Bar']::TEXT[], ARRAY['B.Com', 'No Education Bar']::TEXT[], ARRAY['Bank Manager']::TEXT[], ARRAY['vegetarian','non_vegetarian']::TEXT[])
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
VALUES ('00000000-0000-4000-a000-0000000001ea', 23, 32, 142, 157, ARRAY['never_married']::TEXT[], ARRAY['Hindu']::TEXT[], ARRAY['Arunthathiyar', 'Caste No Bar']::TEXT[], ARRAY['B.Com', 'No Education Bar']::TEXT[], ARRAY['Doctor']::TEXT[], ARRAY['vegetarian','non_vegetarian']::TEXT[])
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
VALUES ('00000000-0000-4000-a000-0000000001eb', 26, 42, 164, 179, ARRAY['never_married']::TEXT[], ARRAY['Christian']::TEXT[], ARRAY['Vellalar Christian', 'Caste No Bar']::TEXT[], ARRAY['B.Ed', 'No Education Bar']::TEXT[], ARRAY['Architect']::TEXT[], ARRAY['vegetarian','non_vegetarian']::TEXT[])
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
VALUES ('00000000-0000-4000-a000-0000000001ec', 28, 45, 137, 152, ARRAY['never_married']::TEXT[], ARRAY['Hindu']::TEXT[], ARRAY['Devendra Kula Vellalar', 'Caste No Bar']::TEXT[], ARRAY['B.Com', 'No Education Bar']::TEXT[], ARRAY['Dentist']::TEXT[], ARRAY['vegetarian','non_vegetarian']::TEXT[])
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
VALUES ('00000000-0000-4000-a000-0000000001ed', 21, 38, 149, 164, ARRAY['never_married']::TEXT[], ARRAY['Hindu']::TEXT[], ARRAY['Brahmin - Iyengar', 'Caste No Bar']::TEXT[], ARRAY['B.Com', 'No Education Bar']::TEXT[], ARRAY['Auditor']::TEXT[], ARRAY['vegetarian','non_vegetarian']::TEXT[])
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
VALUES ('00000000-0000-4000-a000-0000000001ee', 22, 43, 151, 166, ARRAY['never_married']::TEXT[], ARRAY['Muslim']::TEXT[], ARRAY['Rawther', 'Caste No Bar']::TEXT[], ARRAY['M.Com', 'No Education Bar']::TEXT[], ARRAY['Dentist']::TEXT[], ARRAY['vegetarian','non_vegetarian']::TEXT[])
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
VALUES ('00000000-0000-4000-a000-0000000001ef', 26, 33, 165, 180, ARRAY['never_married']::TEXT[], ARRAY['Hindu']::TEXT[], ARRAY['Agamudayar', 'Caste No Bar']::TEXT[], ARRAY['B.A', 'No Education Bar']::TEXT[], ARRAY['Civil Engineer']::TEXT[], ARRAY['vegetarian','non_vegetarian']::TEXT[])
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
VALUES ('00000000-0000-4000-a000-0000000001f0', 26, 30, 138, 153, ARRAY['never_married']::TEXT[], ARRAY['Hindu']::TEXT[], ARRAY['Vishwakarma', 'Caste No Bar']::TEXT[], ARRAY['Ph.D', 'No Education Bar']::TEXT[], ARRAY['Doctor']::TEXT[], ARRAY['vegetarian','non_vegetarian']::TEXT[])
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
VALUES ('00000000-0000-4000-a000-0000000001f1', 24, 36, 173, 188, ARRAY['never_married']::TEXT[], ARRAY['Hindu']::TEXT[], ARRAY['Kallar', 'Caste No Bar']::TEXT[], ARRAY['B.Ed', 'No Education Bar']::TEXT[], ARRAY['School Teacher']::TEXT[], ARRAY['vegetarian','non_vegetarian']::TEXT[])
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
VALUES ('00000000-0000-4000-a000-0000000001f2', 27, 39, 141, 156, ARRAY['never_married']::TEXT[], ARRAY['Hindu']::TEXT[], ARRAY['Naicker', 'Caste No Bar']::TEXT[], ARRAY['M.A', 'No Education Bar']::TEXT[], ARRAY['Pharmacist']::TEXT[], ARRAY['vegetarian','non_vegetarian']::TEXT[])
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
VALUES ('00000000-0000-4000-a000-0000000001f3', 23, 41, 159, 174, ARRAY['never_married']::TEXT[], ARRAY['Muslim']::TEXT[], ARRAY['Shia Muslim', 'Caste No Bar']::TEXT[], ARRAY['M.B.A', 'No Education Bar']::TEXT[], ARRAY['HR Specialist']::TEXT[], ARRAY['vegetarian','non_vegetarian']::TEXT[])
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
VALUES ('00000000-0000-4000-a000-0000000001f4', 27, 45, 150, 165, ARRAY['never_married']::TEXT[], ARRAY['Hindu']::TEXT[], ARRAY['Thevar', 'Caste No Bar']::TEXT[], ARRAY['Ph.D', 'No Education Bar']::TEXT[], ARRAY['Doctor']::TEXT[], ARRAY['vegetarian','non_vegetarian']::TEXT[])
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
VALUES ('00000000-0000-4000-a000-000000000155', 'https://randomuser.me/api/portraits/men/45.jpg', 'https://randomuser.me/api/portraits/men/45.jpg', true, true)
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.photos (user_id, storage_path, thumbnail_path, is_primary, is_approved)
VALUES ('00000000-0000-4000-a000-000000000156', 'https://randomuser.me/api/portraits/women/46.jpg', 'https://randomuser.me/api/portraits/women/46.jpg', true, true)
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.photos (user_id, storage_path, thumbnail_path, is_primary, is_approved)
VALUES ('00000000-0000-4000-a000-000000000157', 'https://randomuser.me/api/portraits/men/47.jpg', 'https://randomuser.me/api/portraits/men/47.jpg', true, true)
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.photos (user_id, storage_path, thumbnail_path, is_primary, is_approved)
VALUES ('00000000-0000-4000-a000-000000000158', 'https://randomuser.me/api/portraits/women/48.jpg', 'https://randomuser.me/api/portraits/women/48.jpg', true, true)
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.photos (user_id, storage_path, thumbnail_path, is_primary, is_approved)
VALUES ('00000000-0000-4000-a000-000000000159', 'https://randomuser.me/api/portraits/men/49.jpg', 'https://randomuser.me/api/portraits/men/49.jpg', true, true)
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.photos (user_id, storage_path, thumbnail_path, is_primary, is_approved)
VALUES ('00000000-0000-4000-a000-00000000015a', 'https://randomuser.me/api/portraits/women/50.jpg', 'https://randomuser.me/api/portraits/women/50.jpg', true, true)
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.photos (user_id, storage_path, thumbnail_path, is_primary, is_approved)
VALUES ('00000000-0000-4000-a000-00000000015b', 'https://randomuser.me/api/portraits/men/51.jpg', 'https://randomuser.me/api/portraits/men/51.jpg', true, true)
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.photos (user_id, storage_path, thumbnail_path, is_primary, is_approved)
VALUES ('00000000-0000-4000-a000-00000000015c', 'https://randomuser.me/api/portraits/women/52.jpg', 'https://randomuser.me/api/portraits/women/52.jpg', true, true)
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.photos (user_id, storage_path, thumbnail_path, is_primary, is_approved)
VALUES ('00000000-0000-4000-a000-00000000015d', 'https://randomuser.me/api/portraits/men/53.jpg', 'https://randomuser.me/api/portraits/men/53.jpg', true, true)
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.photos (user_id, storage_path, thumbnail_path, is_primary, is_approved)
VALUES ('00000000-0000-4000-a000-00000000015e', 'https://randomuser.me/api/portraits/women/54.jpg', 'https://randomuser.me/api/portraits/women/54.jpg', true, true)
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.photos (user_id, storage_path, thumbnail_path, is_primary, is_approved)
VALUES ('00000000-0000-4000-a000-00000000015f', 'https://randomuser.me/api/portraits/men/55.jpg', 'https://randomuser.me/api/portraits/men/55.jpg', true, true)
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.photos (user_id, storage_path, thumbnail_path, is_primary, is_approved)
VALUES ('00000000-0000-4000-a000-000000000160', 'https://randomuser.me/api/portraits/women/56.jpg', 'https://randomuser.me/api/portraits/women/56.jpg', true, true)
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.photos (user_id, storage_path, thumbnail_path, is_primary, is_approved)
VALUES ('00000000-0000-4000-a000-000000000161', 'https://randomuser.me/api/portraits/men/57.jpg', 'https://randomuser.me/api/portraits/men/57.jpg', true, true)
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.photos (user_id, storage_path, thumbnail_path, is_primary, is_approved)
VALUES ('00000000-0000-4000-a000-000000000162', 'https://randomuser.me/api/portraits/women/58.jpg', 'https://randomuser.me/api/portraits/women/58.jpg', true, true)
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.photos (user_id, storage_path, thumbnail_path, is_primary, is_approved)
VALUES ('00000000-0000-4000-a000-000000000163', 'https://randomuser.me/api/portraits/men/59.jpg', 'https://randomuser.me/api/portraits/men/59.jpg', true, true)
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.photos (user_id, storage_path, thumbnail_path, is_primary, is_approved)
VALUES ('00000000-0000-4000-a000-000000000164', 'https://randomuser.me/api/portraits/women/60.jpg', 'https://randomuser.me/api/portraits/women/60.jpg', true, true)
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.photos (user_id, storage_path, thumbnail_path, is_primary, is_approved)
VALUES ('00000000-0000-4000-a000-000000000165', 'https://randomuser.me/api/portraits/men/61.jpg', 'https://randomuser.me/api/portraits/men/61.jpg', true, true)
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.photos (user_id, storage_path, thumbnail_path, is_primary, is_approved)
VALUES ('00000000-0000-4000-a000-000000000166', 'https://randomuser.me/api/portraits/women/62.jpg', 'https://randomuser.me/api/portraits/women/62.jpg', true, true)
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.photos (user_id, storage_path, thumbnail_path, is_primary, is_approved)
VALUES ('00000000-0000-4000-a000-000000000167', 'https://randomuser.me/api/portraits/men/63.jpg', 'https://randomuser.me/api/portraits/men/63.jpg', true, true)
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.photos (user_id, storage_path, thumbnail_path, is_primary, is_approved)
VALUES ('00000000-0000-4000-a000-000000000168', 'https://randomuser.me/api/portraits/women/64.jpg', 'https://randomuser.me/api/portraits/women/64.jpg', true, true)
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.photos (user_id, storage_path, thumbnail_path, is_primary, is_approved)
VALUES ('00000000-0000-4000-a000-000000000169', 'https://randomuser.me/api/portraits/men/65.jpg', 'https://randomuser.me/api/portraits/men/65.jpg', true, true)
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.photos (user_id, storage_path, thumbnail_path, is_primary, is_approved)
VALUES ('00000000-0000-4000-a000-00000000016a', 'https://randomuser.me/api/portraits/women/66.jpg', 'https://randomuser.me/api/portraits/women/66.jpg', true, true)
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.photos (user_id, storage_path, thumbnail_path, is_primary, is_approved)
VALUES ('00000000-0000-4000-a000-00000000016b', 'https://randomuser.me/api/portraits/men/67.jpg', 'https://randomuser.me/api/portraits/men/67.jpg', true, true)
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.photos (user_id, storage_path, thumbnail_path, is_primary, is_approved)
VALUES ('00000000-0000-4000-a000-00000000016c', 'https://randomuser.me/api/portraits/women/68.jpg', 'https://randomuser.me/api/portraits/women/68.jpg', true, true)
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.photos (user_id, storage_path, thumbnail_path, is_primary, is_approved)
VALUES ('00000000-0000-4000-a000-00000000016d', 'https://randomuser.me/api/portraits/men/69.jpg', 'https://randomuser.me/api/portraits/men/69.jpg', true, true)
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.photos (user_id, storage_path, thumbnail_path, is_primary, is_approved)
VALUES ('00000000-0000-4000-a000-00000000016e', 'https://randomuser.me/api/portraits/women/70.jpg', 'https://randomuser.me/api/portraits/women/70.jpg', true, true)
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.photos (user_id, storage_path, thumbnail_path, is_primary, is_approved)
VALUES ('00000000-0000-4000-a000-00000000016f', 'https://randomuser.me/api/portraits/men/71.jpg', 'https://randomuser.me/api/portraits/men/71.jpg', true, true)
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.photos (user_id, storage_path, thumbnail_path, is_primary, is_approved)
VALUES ('00000000-0000-4000-a000-000000000170', 'https://randomuser.me/api/portraits/women/72.jpg', 'https://randomuser.me/api/portraits/women/72.jpg', true, true)
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.photos (user_id, storage_path, thumbnail_path, is_primary, is_approved)
VALUES ('00000000-0000-4000-a000-000000000171', 'https://randomuser.me/api/portraits/men/73.jpg', 'https://randomuser.me/api/portraits/men/73.jpg', true, true)
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.photos (user_id, storage_path, thumbnail_path, is_primary, is_approved)
VALUES ('00000000-0000-4000-a000-000000000172', 'https://randomuser.me/api/portraits/women/74.jpg', 'https://randomuser.me/api/portraits/women/74.jpg', true, true)
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.photos (user_id, storage_path, thumbnail_path, is_primary, is_approved)
VALUES ('00000000-0000-4000-a000-000000000173', 'https://randomuser.me/api/portraits/men/75.jpg', 'https://randomuser.me/api/portraits/men/75.jpg', true, true)
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.photos (user_id, storage_path, thumbnail_path, is_primary, is_approved)
VALUES ('00000000-0000-4000-a000-000000000174', 'https://randomuser.me/api/portraits/women/76.jpg', 'https://randomuser.me/api/portraits/women/76.jpg', true, true)
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.photos (user_id, storage_path, thumbnail_path, is_primary, is_approved)
VALUES ('00000000-0000-4000-a000-000000000175', 'https://randomuser.me/api/portraits/men/77.jpg', 'https://randomuser.me/api/portraits/men/77.jpg', true, true)
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.photos (user_id, storage_path, thumbnail_path, is_primary, is_approved)
VALUES ('00000000-0000-4000-a000-000000000176', 'https://randomuser.me/api/portraits/women/78.jpg', 'https://randomuser.me/api/portraits/women/78.jpg', true, true)
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.photos (user_id, storage_path, thumbnail_path, is_primary, is_approved)
VALUES ('00000000-0000-4000-a000-000000000177', 'https://randomuser.me/api/portraits/men/79.jpg', 'https://randomuser.me/api/portraits/men/79.jpg', true, true)
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.photos (user_id, storage_path, thumbnail_path, is_primary, is_approved)
VALUES ('00000000-0000-4000-a000-000000000178', 'https://randomuser.me/api/portraits/women/80.jpg', 'https://randomuser.me/api/portraits/women/80.jpg', true, true)
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.photos (user_id, storage_path, thumbnail_path, is_primary, is_approved)
VALUES ('00000000-0000-4000-a000-000000000179', 'https://randomuser.me/api/portraits/men/81.jpg', 'https://randomuser.me/api/portraits/men/81.jpg', true, true)
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.photos (user_id, storage_path, thumbnail_path, is_primary, is_approved)
VALUES ('00000000-0000-4000-a000-00000000017a', 'https://randomuser.me/api/portraits/women/82.jpg', 'https://randomuser.me/api/portraits/women/82.jpg', true, true)
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.photos (user_id, storage_path, thumbnail_path, is_primary, is_approved)
VALUES ('00000000-0000-4000-a000-00000000017b', 'https://randomuser.me/api/portraits/men/83.jpg', 'https://randomuser.me/api/portraits/men/83.jpg', true, true)
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.photos (user_id, storage_path, thumbnail_path, is_primary, is_approved)
VALUES ('00000000-0000-4000-a000-00000000017c', 'https://randomuser.me/api/portraits/women/84.jpg', 'https://randomuser.me/api/portraits/women/84.jpg', true, true)
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.photos (user_id, storage_path, thumbnail_path, is_primary, is_approved)
VALUES ('00000000-0000-4000-a000-00000000017d', 'https://randomuser.me/api/portraits/men/85.jpg', 'https://randomuser.me/api/portraits/men/85.jpg', true, true)
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.photos (user_id, storage_path, thumbnail_path, is_primary, is_approved)
VALUES ('00000000-0000-4000-a000-00000000017e', 'https://randomuser.me/api/portraits/women/86.jpg', 'https://randomuser.me/api/portraits/women/86.jpg', true, true)
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.photos (user_id, storage_path, thumbnail_path, is_primary, is_approved)
VALUES ('00000000-0000-4000-a000-00000000017f', 'https://randomuser.me/api/portraits/men/87.jpg', 'https://randomuser.me/api/portraits/men/87.jpg', true, true)
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.photos (user_id, storage_path, thumbnail_path, is_primary, is_approved)
VALUES ('00000000-0000-4000-a000-000000000180', 'https://randomuser.me/api/portraits/women/88.jpg', 'https://randomuser.me/api/portraits/women/88.jpg', true, true)
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.photos (user_id, storage_path, thumbnail_path, is_primary, is_approved)
VALUES ('00000000-0000-4000-a000-000000000181', 'https://randomuser.me/api/portraits/men/89.jpg', 'https://randomuser.me/api/portraits/men/89.jpg', true, true)
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.photos (user_id, storage_path, thumbnail_path, is_primary, is_approved)
VALUES ('00000000-0000-4000-a000-000000000182', 'https://randomuser.me/api/portraits/women/90.jpg', 'https://randomuser.me/api/portraits/women/90.jpg', true, true)
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.photos (user_id, storage_path, thumbnail_path, is_primary, is_approved)
VALUES ('00000000-0000-4000-a000-000000000183', 'https://randomuser.me/api/portraits/men/91.jpg', 'https://randomuser.me/api/portraits/men/91.jpg', true, true)
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.photos (user_id, storage_path, thumbnail_path, is_primary, is_approved)
VALUES ('00000000-0000-4000-a000-000000000184', 'https://randomuser.me/api/portraits/women/92.jpg', 'https://randomuser.me/api/portraits/women/92.jpg', true, true)
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.photos (user_id, storage_path, thumbnail_path, is_primary, is_approved)
VALUES ('00000000-0000-4000-a000-000000000185', 'https://randomuser.me/api/portraits/men/93.jpg', 'https://randomuser.me/api/portraits/men/93.jpg', true, true)
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.photos (user_id, storage_path, thumbnail_path, is_primary, is_approved)
VALUES ('00000000-0000-4000-a000-000000000186', 'https://randomuser.me/api/portraits/women/94.jpg', 'https://randomuser.me/api/portraits/women/94.jpg', true, true)
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.photos (user_id, storage_path, thumbnail_path, is_primary, is_approved)
VALUES ('00000000-0000-4000-a000-000000000187', 'https://randomuser.me/api/portraits/men/95.jpg', 'https://randomuser.me/api/portraits/men/95.jpg', true, true)
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.photos (user_id, storage_path, thumbnail_path, is_primary, is_approved)
VALUES ('00000000-0000-4000-a000-000000000188', 'https://randomuser.me/api/portraits/women/96.jpg', 'https://randomuser.me/api/portraits/women/96.jpg', true, true)
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.photos (user_id, storage_path, thumbnail_path, is_primary, is_approved)
VALUES ('00000000-0000-4000-a000-000000000189', 'https://randomuser.me/api/portraits/men/97.jpg', 'https://randomuser.me/api/portraits/men/97.jpg', true, true)
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.photos (user_id, storage_path, thumbnail_path, is_primary, is_approved)
VALUES ('00000000-0000-4000-a000-00000000018a', 'https://randomuser.me/api/portraits/women/98.jpg', 'https://randomuser.me/api/portraits/women/98.jpg', true, true)
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.photos (user_id, storage_path, thumbnail_path, is_primary, is_approved)
VALUES ('00000000-0000-4000-a000-00000000018b', 'https://randomuser.me/api/portraits/men/99.jpg', 'https://randomuser.me/api/portraits/men/99.jpg', true, true)
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.photos (user_id, storage_path, thumbnail_path, is_primary, is_approved)
VALUES ('00000000-0000-4000-a000-00000000018c', 'https://randomuser.me/api/portraits/women/1.jpg', 'https://randomuser.me/api/portraits/women/1.jpg', true, true)
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.photos (user_id, storage_path, thumbnail_path, is_primary, is_approved)
VALUES ('00000000-0000-4000-a000-00000000018d', 'https://randomuser.me/api/portraits/men/2.jpg', 'https://randomuser.me/api/portraits/men/2.jpg', true, true)
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.photos (user_id, storage_path, thumbnail_path, is_primary, is_approved)
VALUES ('00000000-0000-4000-a000-00000000018e', 'https://randomuser.me/api/portraits/women/3.jpg', 'https://randomuser.me/api/portraits/women/3.jpg', true, true)
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.photos (user_id, storage_path, thumbnail_path, is_primary, is_approved)
VALUES ('00000000-0000-4000-a000-00000000018f', 'https://randomuser.me/api/portraits/men/4.jpg', 'https://randomuser.me/api/portraits/men/4.jpg', true, true)
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.photos (user_id, storage_path, thumbnail_path, is_primary, is_approved)
VALUES ('00000000-0000-4000-a000-000000000190', 'https://randomuser.me/api/portraits/women/5.jpg', 'https://randomuser.me/api/portraits/women/5.jpg', true, true)
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.photos (user_id, storage_path, thumbnail_path, is_primary, is_approved)
VALUES ('00000000-0000-4000-a000-000000000191', 'https://randomuser.me/api/portraits/men/6.jpg', 'https://randomuser.me/api/portraits/men/6.jpg', true, true)
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.photos (user_id, storage_path, thumbnail_path, is_primary, is_approved)
VALUES ('00000000-0000-4000-a000-000000000192', 'https://randomuser.me/api/portraits/women/7.jpg', 'https://randomuser.me/api/portraits/women/7.jpg', true, true)
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.photos (user_id, storage_path, thumbnail_path, is_primary, is_approved)
VALUES ('00000000-0000-4000-a000-000000000193', 'https://randomuser.me/api/portraits/men/8.jpg', 'https://randomuser.me/api/portraits/men/8.jpg', true, true)
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.photos (user_id, storage_path, thumbnail_path, is_primary, is_approved)
VALUES ('00000000-0000-4000-a000-000000000194', 'https://randomuser.me/api/portraits/women/9.jpg', 'https://randomuser.me/api/portraits/women/9.jpg', true, true)
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.photos (user_id, storage_path, thumbnail_path, is_primary, is_approved)
VALUES ('00000000-0000-4000-a000-000000000195', 'https://randomuser.me/api/portraits/men/10.jpg', 'https://randomuser.me/api/portraits/men/10.jpg', true, true)
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.photos (user_id, storage_path, thumbnail_path, is_primary, is_approved)
VALUES ('00000000-0000-4000-a000-000000000196', 'https://randomuser.me/api/portraits/women/11.jpg', 'https://randomuser.me/api/portraits/women/11.jpg', true, true)
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.photos (user_id, storage_path, thumbnail_path, is_primary, is_approved)
VALUES ('00000000-0000-4000-a000-000000000197', 'https://randomuser.me/api/portraits/men/12.jpg', 'https://randomuser.me/api/portraits/men/12.jpg', true, true)
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.photos (user_id, storage_path, thumbnail_path, is_primary, is_approved)
VALUES ('00000000-0000-4000-a000-000000000198', 'https://randomuser.me/api/portraits/women/13.jpg', 'https://randomuser.me/api/portraits/women/13.jpg', true, true)
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.photos (user_id, storage_path, thumbnail_path, is_primary, is_approved)
VALUES ('00000000-0000-4000-a000-000000000199', 'https://randomuser.me/api/portraits/men/14.jpg', 'https://randomuser.me/api/portraits/men/14.jpg', true, true)
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.photos (user_id, storage_path, thumbnail_path, is_primary, is_approved)
VALUES ('00000000-0000-4000-a000-00000000019a', 'https://randomuser.me/api/portraits/women/15.jpg', 'https://randomuser.me/api/portraits/women/15.jpg', true, true)
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.photos (user_id, storage_path, thumbnail_path, is_primary, is_approved)
VALUES ('00000000-0000-4000-a000-00000000019b', 'https://randomuser.me/api/portraits/men/16.jpg', 'https://randomuser.me/api/portraits/men/16.jpg', true, true)
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.photos (user_id, storage_path, thumbnail_path, is_primary, is_approved)
VALUES ('00000000-0000-4000-a000-00000000019c', 'https://randomuser.me/api/portraits/women/17.jpg', 'https://randomuser.me/api/portraits/women/17.jpg', true, true)
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.photos (user_id, storage_path, thumbnail_path, is_primary, is_approved)
VALUES ('00000000-0000-4000-a000-00000000019d', 'https://randomuser.me/api/portraits/men/18.jpg', 'https://randomuser.me/api/portraits/men/18.jpg', true, true)
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.photos (user_id, storage_path, thumbnail_path, is_primary, is_approved)
VALUES ('00000000-0000-4000-a000-00000000019e', 'https://randomuser.me/api/portraits/women/19.jpg', 'https://randomuser.me/api/portraits/women/19.jpg', true, true)
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.photos (user_id, storage_path, thumbnail_path, is_primary, is_approved)
VALUES ('00000000-0000-4000-a000-00000000019f', 'https://randomuser.me/api/portraits/men/20.jpg', 'https://randomuser.me/api/portraits/men/20.jpg', true, true)
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.photos (user_id, storage_path, thumbnail_path, is_primary, is_approved)
VALUES ('00000000-0000-4000-a000-0000000001a0', 'https://randomuser.me/api/portraits/women/21.jpg', 'https://randomuser.me/api/portraits/women/21.jpg', true, true)
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.photos (user_id, storage_path, thumbnail_path, is_primary, is_approved)
VALUES ('00000000-0000-4000-a000-0000000001a1', 'https://randomuser.me/api/portraits/men/22.jpg', 'https://randomuser.me/api/portraits/men/22.jpg', true, true)
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.photos (user_id, storage_path, thumbnail_path, is_primary, is_approved)
VALUES ('00000000-0000-4000-a000-0000000001a2', 'https://randomuser.me/api/portraits/women/23.jpg', 'https://randomuser.me/api/portraits/women/23.jpg', true, true)
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.photos (user_id, storage_path, thumbnail_path, is_primary, is_approved)
VALUES ('00000000-0000-4000-a000-0000000001a3', 'https://randomuser.me/api/portraits/men/24.jpg', 'https://randomuser.me/api/portraits/men/24.jpg', true, true)
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.photos (user_id, storage_path, thumbnail_path, is_primary, is_approved)
VALUES ('00000000-0000-4000-a000-0000000001a4', 'https://randomuser.me/api/portraits/women/25.jpg', 'https://randomuser.me/api/portraits/women/25.jpg', true, true)
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.photos (user_id, storage_path, thumbnail_path, is_primary, is_approved)
VALUES ('00000000-0000-4000-a000-0000000001a5', 'https://randomuser.me/api/portraits/men/26.jpg', 'https://randomuser.me/api/portraits/men/26.jpg', true, true)
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.photos (user_id, storage_path, thumbnail_path, is_primary, is_approved)
VALUES ('00000000-0000-4000-a000-0000000001a6', 'https://randomuser.me/api/portraits/women/27.jpg', 'https://randomuser.me/api/portraits/women/27.jpg', true, true)
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.photos (user_id, storage_path, thumbnail_path, is_primary, is_approved)
VALUES ('00000000-0000-4000-a000-0000000001a7', 'https://randomuser.me/api/portraits/men/28.jpg', 'https://randomuser.me/api/portraits/men/28.jpg', true, true)
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.photos (user_id, storage_path, thumbnail_path, is_primary, is_approved)
VALUES ('00000000-0000-4000-a000-0000000001a8', 'https://randomuser.me/api/portraits/women/29.jpg', 'https://randomuser.me/api/portraits/women/29.jpg', true, true)
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.photos (user_id, storage_path, thumbnail_path, is_primary, is_approved)
VALUES ('00000000-0000-4000-a000-0000000001a9', 'https://randomuser.me/api/portraits/men/30.jpg', 'https://randomuser.me/api/portraits/men/30.jpg', true, true)
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.photos (user_id, storage_path, thumbnail_path, is_primary, is_approved)
VALUES ('00000000-0000-4000-a000-0000000001aa', 'https://randomuser.me/api/portraits/women/31.jpg', 'https://randomuser.me/api/portraits/women/31.jpg', true, true)
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.photos (user_id, storage_path, thumbnail_path, is_primary, is_approved)
VALUES ('00000000-0000-4000-a000-0000000001ab', 'https://randomuser.me/api/portraits/men/32.jpg', 'https://randomuser.me/api/portraits/men/32.jpg', true, true)
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.photos (user_id, storage_path, thumbnail_path, is_primary, is_approved)
VALUES ('00000000-0000-4000-a000-0000000001ac', 'https://randomuser.me/api/portraits/women/33.jpg', 'https://randomuser.me/api/portraits/women/33.jpg', true, true)
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.photos (user_id, storage_path, thumbnail_path, is_primary, is_approved)
VALUES ('00000000-0000-4000-a000-0000000001ad', 'https://randomuser.me/api/portraits/men/34.jpg', 'https://randomuser.me/api/portraits/men/34.jpg', true, true)
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.photos (user_id, storage_path, thumbnail_path, is_primary, is_approved)
VALUES ('00000000-0000-4000-a000-0000000001ae', 'https://randomuser.me/api/portraits/women/35.jpg', 'https://randomuser.me/api/portraits/women/35.jpg', true, true)
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.photos (user_id, storage_path, thumbnail_path, is_primary, is_approved)
VALUES ('00000000-0000-4000-a000-0000000001af', 'https://randomuser.me/api/portraits/men/36.jpg', 'https://randomuser.me/api/portraits/men/36.jpg', true, true)
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.photos (user_id, storage_path, thumbnail_path, is_primary, is_approved)
VALUES ('00000000-0000-4000-a000-0000000001b0', 'https://randomuser.me/api/portraits/women/37.jpg', 'https://randomuser.me/api/portraits/women/37.jpg', true, true)
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.photos (user_id, storage_path, thumbnail_path, is_primary, is_approved)
VALUES ('00000000-0000-4000-a000-0000000001b1', 'https://randomuser.me/api/portraits/men/38.jpg', 'https://randomuser.me/api/portraits/men/38.jpg', true, true)
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.photos (user_id, storage_path, thumbnail_path, is_primary, is_approved)
VALUES ('00000000-0000-4000-a000-0000000001b2', 'https://randomuser.me/api/portraits/women/39.jpg', 'https://randomuser.me/api/portraits/women/39.jpg', true, true)
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.photos (user_id, storage_path, thumbnail_path, is_primary, is_approved)
VALUES ('00000000-0000-4000-a000-0000000001b3', 'https://randomuser.me/api/portraits/men/40.jpg', 'https://randomuser.me/api/portraits/men/40.jpg', true, true)
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.photos (user_id, storage_path, thumbnail_path, is_primary, is_approved)
VALUES ('00000000-0000-4000-a000-0000000001b4', 'https://randomuser.me/api/portraits/women/41.jpg', 'https://randomuser.me/api/portraits/women/41.jpg', true, true)
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.photos (user_id, storage_path, thumbnail_path, is_primary, is_approved)
VALUES ('00000000-0000-4000-a000-0000000001b5', 'https://randomuser.me/api/portraits/men/42.jpg', 'https://randomuser.me/api/portraits/men/42.jpg', true, true)
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.photos (user_id, storage_path, thumbnail_path, is_primary, is_approved)
VALUES ('00000000-0000-4000-a000-0000000001b6', 'https://randomuser.me/api/portraits/women/43.jpg', 'https://randomuser.me/api/portraits/women/43.jpg', true, true)
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.photos (user_id, storage_path, thumbnail_path, is_primary, is_approved)
VALUES ('00000000-0000-4000-a000-0000000001b7', 'https://randomuser.me/api/portraits/men/44.jpg', 'https://randomuser.me/api/portraits/men/44.jpg', true, true)
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.photos (user_id, storage_path, thumbnail_path, is_primary, is_approved)
VALUES ('00000000-0000-4000-a000-0000000001b8', 'https://randomuser.me/api/portraits/women/45.jpg', 'https://randomuser.me/api/portraits/women/45.jpg', true, true)
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.photos (user_id, storage_path, thumbnail_path, is_primary, is_approved)
VALUES ('00000000-0000-4000-a000-0000000001b9', 'https://randomuser.me/api/portraits/men/46.jpg', 'https://randomuser.me/api/portraits/men/46.jpg', true, true)
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.photos (user_id, storage_path, thumbnail_path, is_primary, is_approved)
VALUES ('00000000-0000-4000-a000-0000000001ba', 'https://randomuser.me/api/portraits/women/47.jpg', 'https://randomuser.me/api/portraits/women/47.jpg', true, true)
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.photos (user_id, storage_path, thumbnail_path, is_primary, is_approved)
VALUES ('00000000-0000-4000-a000-0000000001bb', 'https://randomuser.me/api/portraits/men/48.jpg', 'https://randomuser.me/api/portraits/men/48.jpg', true, true)
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.photos (user_id, storage_path, thumbnail_path, is_primary, is_approved)
VALUES ('00000000-0000-4000-a000-0000000001bc', 'https://randomuser.me/api/portraits/women/49.jpg', 'https://randomuser.me/api/portraits/women/49.jpg', true, true)
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.photos (user_id, storage_path, thumbnail_path, is_primary, is_approved)
VALUES ('00000000-0000-4000-a000-0000000001bd', 'https://randomuser.me/api/portraits/men/50.jpg', 'https://randomuser.me/api/portraits/men/50.jpg', true, true)
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.photos (user_id, storage_path, thumbnail_path, is_primary, is_approved)
VALUES ('00000000-0000-4000-a000-0000000001be', 'https://randomuser.me/api/portraits/women/51.jpg', 'https://randomuser.me/api/portraits/women/51.jpg', true, true)
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.photos (user_id, storage_path, thumbnail_path, is_primary, is_approved)
VALUES ('00000000-0000-4000-a000-0000000001bf', 'https://randomuser.me/api/portraits/men/52.jpg', 'https://randomuser.me/api/portraits/men/52.jpg', true, true)
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.photos (user_id, storage_path, thumbnail_path, is_primary, is_approved)
VALUES ('00000000-0000-4000-a000-0000000001c0', 'https://randomuser.me/api/portraits/women/53.jpg', 'https://randomuser.me/api/portraits/women/53.jpg', true, true)
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.photos (user_id, storage_path, thumbnail_path, is_primary, is_approved)
VALUES ('00000000-0000-4000-a000-0000000001c1', 'https://randomuser.me/api/portraits/men/54.jpg', 'https://randomuser.me/api/portraits/men/54.jpg', true, true)
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.photos (user_id, storage_path, thumbnail_path, is_primary, is_approved)
VALUES ('00000000-0000-4000-a000-0000000001c2', 'https://randomuser.me/api/portraits/women/55.jpg', 'https://randomuser.me/api/portraits/women/55.jpg', true, true)
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.photos (user_id, storage_path, thumbnail_path, is_primary, is_approved)
VALUES ('00000000-0000-4000-a000-0000000001c3', 'https://randomuser.me/api/portraits/men/56.jpg', 'https://randomuser.me/api/portraits/men/56.jpg', true, true)
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.photos (user_id, storage_path, thumbnail_path, is_primary, is_approved)
VALUES ('00000000-0000-4000-a000-0000000001c4', 'https://randomuser.me/api/portraits/women/57.jpg', 'https://randomuser.me/api/portraits/women/57.jpg', true, true)
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.photos (user_id, storage_path, thumbnail_path, is_primary, is_approved)
VALUES ('00000000-0000-4000-a000-0000000001c5', 'https://randomuser.me/api/portraits/men/58.jpg', 'https://randomuser.me/api/portraits/men/58.jpg', true, true)
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.photos (user_id, storage_path, thumbnail_path, is_primary, is_approved)
VALUES ('00000000-0000-4000-a000-0000000001c6', 'https://randomuser.me/api/portraits/women/59.jpg', 'https://randomuser.me/api/portraits/women/59.jpg', true, true)
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.photos (user_id, storage_path, thumbnail_path, is_primary, is_approved)
VALUES ('00000000-0000-4000-a000-0000000001c7', 'https://randomuser.me/api/portraits/men/60.jpg', 'https://randomuser.me/api/portraits/men/60.jpg', true, true)
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.photos (user_id, storage_path, thumbnail_path, is_primary, is_approved)
VALUES ('00000000-0000-4000-a000-0000000001c8', 'https://randomuser.me/api/portraits/women/61.jpg', 'https://randomuser.me/api/portraits/women/61.jpg', true, true)
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.photos (user_id, storage_path, thumbnail_path, is_primary, is_approved)
VALUES ('00000000-0000-4000-a000-0000000001c9', 'https://randomuser.me/api/portraits/men/62.jpg', 'https://randomuser.me/api/portraits/men/62.jpg', true, true)
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.photos (user_id, storage_path, thumbnail_path, is_primary, is_approved)
VALUES ('00000000-0000-4000-a000-0000000001ca', 'https://randomuser.me/api/portraits/women/63.jpg', 'https://randomuser.me/api/portraits/women/63.jpg', true, true)
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.photos (user_id, storage_path, thumbnail_path, is_primary, is_approved)
VALUES ('00000000-0000-4000-a000-0000000001cb', 'https://randomuser.me/api/portraits/men/64.jpg', 'https://randomuser.me/api/portraits/men/64.jpg', true, true)
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.photos (user_id, storage_path, thumbnail_path, is_primary, is_approved)
VALUES ('00000000-0000-4000-a000-0000000001cc', 'https://randomuser.me/api/portraits/women/65.jpg', 'https://randomuser.me/api/portraits/women/65.jpg', true, true)
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.photos (user_id, storage_path, thumbnail_path, is_primary, is_approved)
VALUES ('00000000-0000-4000-a000-0000000001cd', 'https://randomuser.me/api/portraits/men/66.jpg', 'https://randomuser.me/api/portraits/men/66.jpg', true, true)
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.photos (user_id, storage_path, thumbnail_path, is_primary, is_approved)
VALUES ('00000000-0000-4000-a000-0000000001ce', 'https://randomuser.me/api/portraits/women/67.jpg', 'https://randomuser.me/api/portraits/women/67.jpg', true, true)
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.photos (user_id, storage_path, thumbnail_path, is_primary, is_approved)
VALUES ('00000000-0000-4000-a000-0000000001cf', 'https://randomuser.me/api/portraits/men/68.jpg', 'https://randomuser.me/api/portraits/men/68.jpg', true, true)
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.photos (user_id, storage_path, thumbnail_path, is_primary, is_approved)
VALUES ('00000000-0000-4000-a000-0000000001d0', 'https://randomuser.me/api/portraits/women/69.jpg', 'https://randomuser.me/api/portraits/women/69.jpg', true, true)
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.photos (user_id, storage_path, thumbnail_path, is_primary, is_approved)
VALUES ('00000000-0000-4000-a000-0000000001d1', 'https://randomuser.me/api/portraits/men/70.jpg', 'https://randomuser.me/api/portraits/men/70.jpg', true, true)
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.photos (user_id, storage_path, thumbnail_path, is_primary, is_approved)
VALUES ('00000000-0000-4000-a000-0000000001d2', 'https://randomuser.me/api/portraits/women/71.jpg', 'https://randomuser.me/api/portraits/women/71.jpg', true, true)
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.photos (user_id, storage_path, thumbnail_path, is_primary, is_approved)
VALUES ('00000000-0000-4000-a000-0000000001d3', 'https://randomuser.me/api/portraits/men/72.jpg', 'https://randomuser.me/api/portraits/men/72.jpg', true, true)
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.photos (user_id, storage_path, thumbnail_path, is_primary, is_approved)
VALUES ('00000000-0000-4000-a000-0000000001d4', 'https://randomuser.me/api/portraits/women/73.jpg', 'https://randomuser.me/api/portraits/women/73.jpg', true, true)
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.photos (user_id, storage_path, thumbnail_path, is_primary, is_approved)
VALUES ('00000000-0000-4000-a000-0000000001d5', 'https://randomuser.me/api/portraits/men/74.jpg', 'https://randomuser.me/api/portraits/men/74.jpg', true, true)
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.photos (user_id, storage_path, thumbnail_path, is_primary, is_approved)
VALUES ('00000000-0000-4000-a000-0000000001d6', 'https://randomuser.me/api/portraits/women/75.jpg', 'https://randomuser.me/api/portraits/women/75.jpg', true, true)
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.photos (user_id, storage_path, thumbnail_path, is_primary, is_approved)
VALUES ('00000000-0000-4000-a000-0000000001d7', 'https://randomuser.me/api/portraits/men/76.jpg', 'https://randomuser.me/api/portraits/men/76.jpg', true, true)
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.photos (user_id, storage_path, thumbnail_path, is_primary, is_approved)
VALUES ('00000000-0000-4000-a000-0000000001d8', 'https://randomuser.me/api/portraits/women/77.jpg', 'https://randomuser.me/api/portraits/women/77.jpg', true, true)
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.photos (user_id, storage_path, thumbnail_path, is_primary, is_approved)
VALUES ('00000000-0000-4000-a000-0000000001d9', 'https://randomuser.me/api/portraits/men/78.jpg', 'https://randomuser.me/api/portraits/men/78.jpg', true, true)
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.photos (user_id, storage_path, thumbnail_path, is_primary, is_approved)
VALUES ('00000000-0000-4000-a000-0000000001da', 'https://randomuser.me/api/portraits/women/79.jpg', 'https://randomuser.me/api/portraits/women/79.jpg', true, true)
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.photos (user_id, storage_path, thumbnail_path, is_primary, is_approved)
VALUES ('00000000-0000-4000-a000-0000000001db', 'https://randomuser.me/api/portraits/men/80.jpg', 'https://randomuser.me/api/portraits/men/80.jpg', true, true)
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.photos (user_id, storage_path, thumbnail_path, is_primary, is_approved)
VALUES ('00000000-0000-4000-a000-0000000001dc', 'https://randomuser.me/api/portraits/women/81.jpg', 'https://randomuser.me/api/portraits/women/81.jpg', true, true)
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.photos (user_id, storage_path, thumbnail_path, is_primary, is_approved)
VALUES ('00000000-0000-4000-a000-0000000001dd', 'https://randomuser.me/api/portraits/men/82.jpg', 'https://randomuser.me/api/portraits/men/82.jpg', true, true)
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.photos (user_id, storage_path, thumbnail_path, is_primary, is_approved)
VALUES ('00000000-0000-4000-a000-0000000001de', 'https://randomuser.me/api/portraits/women/83.jpg', 'https://randomuser.me/api/portraits/women/83.jpg', true, true)
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.photos (user_id, storage_path, thumbnail_path, is_primary, is_approved)
VALUES ('00000000-0000-4000-a000-0000000001df', 'https://randomuser.me/api/portraits/men/84.jpg', 'https://randomuser.me/api/portraits/men/84.jpg', true, true)
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.photos (user_id, storage_path, thumbnail_path, is_primary, is_approved)
VALUES ('00000000-0000-4000-a000-0000000001e0', 'https://randomuser.me/api/portraits/women/85.jpg', 'https://randomuser.me/api/portraits/women/85.jpg', true, true)
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.photos (user_id, storage_path, thumbnail_path, is_primary, is_approved)
VALUES ('00000000-0000-4000-a000-0000000001e1', 'https://randomuser.me/api/portraits/men/86.jpg', 'https://randomuser.me/api/portraits/men/86.jpg', true, true)
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.photos (user_id, storage_path, thumbnail_path, is_primary, is_approved)
VALUES ('00000000-0000-4000-a000-0000000001e2', 'https://randomuser.me/api/portraits/women/87.jpg', 'https://randomuser.me/api/portraits/women/87.jpg', true, true)
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.photos (user_id, storage_path, thumbnail_path, is_primary, is_approved)
VALUES ('00000000-0000-4000-a000-0000000001e3', 'https://randomuser.me/api/portraits/men/88.jpg', 'https://randomuser.me/api/portraits/men/88.jpg', true, true)
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.photos (user_id, storage_path, thumbnail_path, is_primary, is_approved)
VALUES ('00000000-0000-4000-a000-0000000001e4', 'https://randomuser.me/api/portraits/women/89.jpg', 'https://randomuser.me/api/portraits/women/89.jpg', true, true)
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.photos (user_id, storage_path, thumbnail_path, is_primary, is_approved)
VALUES ('00000000-0000-4000-a000-0000000001e5', 'https://randomuser.me/api/portraits/men/90.jpg', 'https://randomuser.me/api/portraits/men/90.jpg', true, true)
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.photos (user_id, storage_path, thumbnail_path, is_primary, is_approved)
VALUES ('00000000-0000-4000-a000-0000000001e6', 'https://randomuser.me/api/portraits/women/91.jpg', 'https://randomuser.me/api/portraits/women/91.jpg', true, true)
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.photos (user_id, storage_path, thumbnail_path, is_primary, is_approved)
VALUES ('00000000-0000-4000-a000-0000000001e7', 'https://randomuser.me/api/portraits/men/92.jpg', 'https://randomuser.me/api/portraits/men/92.jpg', true, true)
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.photos (user_id, storage_path, thumbnail_path, is_primary, is_approved)
VALUES ('00000000-0000-4000-a000-0000000001e8', 'https://randomuser.me/api/portraits/women/93.jpg', 'https://randomuser.me/api/portraits/women/93.jpg', true, true)
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.photos (user_id, storage_path, thumbnail_path, is_primary, is_approved)
VALUES ('00000000-0000-4000-a000-0000000001e9', 'https://randomuser.me/api/portraits/men/94.jpg', 'https://randomuser.me/api/portraits/men/94.jpg', true, true)
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.photos (user_id, storage_path, thumbnail_path, is_primary, is_approved)
VALUES ('00000000-0000-4000-a000-0000000001ea', 'https://randomuser.me/api/portraits/women/95.jpg', 'https://randomuser.me/api/portraits/women/95.jpg', true, true)
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.photos (user_id, storage_path, thumbnail_path, is_primary, is_approved)
VALUES ('00000000-0000-4000-a000-0000000001eb', 'https://randomuser.me/api/portraits/men/96.jpg', 'https://randomuser.me/api/portraits/men/96.jpg', true, true)
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.photos (user_id, storage_path, thumbnail_path, is_primary, is_approved)
VALUES ('00000000-0000-4000-a000-0000000001ec', 'https://randomuser.me/api/portraits/women/97.jpg', 'https://randomuser.me/api/portraits/women/97.jpg', true, true)
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.photos (user_id, storage_path, thumbnail_path, is_primary, is_approved)
VALUES ('00000000-0000-4000-a000-0000000001ed', 'https://randomuser.me/api/portraits/men/98.jpg', 'https://randomuser.me/api/portraits/men/98.jpg', true, true)
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.photos (user_id, storage_path, thumbnail_path, is_primary, is_approved)
VALUES ('00000000-0000-4000-a000-0000000001ee', 'https://randomuser.me/api/portraits/women/99.jpg', 'https://randomuser.me/api/portraits/women/99.jpg', true, true)
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.photos (user_id, storage_path, thumbnail_path, is_primary, is_approved)
VALUES ('00000000-0000-4000-a000-0000000001ef', 'https://randomuser.me/api/portraits/men/1.jpg', 'https://randomuser.me/api/portraits/men/1.jpg', true, true)
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.photos (user_id, storage_path, thumbnail_path, is_primary, is_approved)
VALUES ('00000000-0000-4000-a000-0000000001f0', 'https://randomuser.me/api/portraits/women/2.jpg', 'https://randomuser.me/api/portraits/women/2.jpg', true, true)
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.photos (user_id, storage_path, thumbnail_path, is_primary, is_approved)
VALUES ('00000000-0000-4000-a000-0000000001f1', 'https://randomuser.me/api/portraits/men/3.jpg', 'https://randomuser.me/api/portraits/men/3.jpg', true, true)
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.photos (user_id, storage_path, thumbnail_path, is_primary, is_approved)
VALUES ('00000000-0000-4000-a000-0000000001f2', 'https://randomuser.me/api/portraits/women/4.jpg', 'https://randomuser.me/api/portraits/women/4.jpg', true, true)
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.photos (user_id, storage_path, thumbnail_path, is_primary, is_approved)
VALUES ('00000000-0000-4000-a000-0000000001f3', 'https://randomuser.me/api/portraits/men/5.jpg', 'https://randomuser.me/api/portraits/men/5.jpg', true, true)
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.photos (user_id, storage_path, thumbnail_path, is_primary, is_approved)
VALUES ('00000000-0000-4000-a000-0000000001f4', 'https://randomuser.me/api/portraits/women/6.jpg', 'https://randomuser.me/api/portraits/women/6.jpg', true, true)
ON CONFLICT (id) DO NOTHING;

-- 6. SUBSCRIPTIONS INSERTIONS
INSERT INTO public.subscriptions (user_id, plan_type, razorpay_payment_id, status, amount, starts_at, expires_at)
VALUES ('00000000-0000-4000-a000-000000000159', 'prime_gold', 'pay_mock_1779606267694_1', 'active', 999, NOW() - INTERVAL '5 days', NOW() + INTERVAL '1 month')
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.subscriptions (user_id, plan_type, razorpay_payment_id, status, amount, starts_at, expires_at)
VALUES ('00000000-0000-4000-a000-00000000015f', 'till_u_marry', 'pay_mock_1779606267694_2', 'active', 2499, NOW() - INTERVAL '5 days', NOW() + INTERVAL '6 month')
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.subscriptions (user_id, plan_type, razorpay_payment_id, status, amount, starts_at, expires_at)
VALUES ('00000000-0000-4000-a000-000000000161', 'till_u_marry', 'pay_mock_1779606267694_3', 'active', 2499, NOW() - INTERVAL '5 days', NOW() + INTERVAL '6 month')
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.subscriptions (user_id, plan_type, razorpay_payment_id, status, amount, starts_at, expires_at)
VALUES ('00000000-0000-4000-a000-000000000163', 'till_u_marry', 'pay_mock_1779606267694_4', 'active', 2499, NOW() - INTERVAL '5 days', NOW() + INTERVAL '6 month')
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.subscriptions (user_id, plan_type, razorpay_payment_id, status, amount, starts_at, expires_at)
VALUES ('00000000-0000-4000-a000-000000000164', 'till_u_marry', 'pay_mock_1779606267694_5', 'active', 2499, NOW() - INTERVAL '5 days', NOW() + INTERVAL '6 month')
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.subscriptions (user_id, plan_type, razorpay_payment_id, status, amount, starts_at, expires_at)
VALUES ('00000000-0000-4000-a000-000000000167', 'prime_gold', 'pay_mock_1779606267694_6', 'active', 999, NOW() - INTERVAL '5 days', NOW() + INTERVAL '1 month')
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.subscriptions (user_id, plan_type, razorpay_payment_id, status, amount, starts_at, expires_at)
VALUES ('00000000-0000-4000-a000-000000000169', 'till_u_marry', 'pay_mock_1779606267694_7', 'active', 2499, NOW() - INTERVAL '5 days', NOW() + INTERVAL '6 month')
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.subscriptions (user_id, plan_type, razorpay_payment_id, status, amount, starts_at, expires_at)
VALUES ('00000000-0000-4000-a000-00000000016a', 'prime_gold', 'pay_mock_1779606267694_8', 'active', 999, NOW() - INTERVAL '5 days', NOW() + INTERVAL '1 month')
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.subscriptions (user_id, plan_type, razorpay_payment_id, status, amount, starts_at, expires_at)
VALUES ('00000000-0000-4000-a000-000000000173', 'gold', 'pay_mock_1779606267694_9', 'active', 499, NOW() - INTERVAL '5 days', NOW() + INTERVAL '1 month')
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.subscriptions (user_id, plan_type, razorpay_payment_id, status, amount, starts_at, expires_at)
VALUES ('00000000-0000-4000-a000-000000000178', 'prime_gold', 'pay_mock_1779606267694_10', 'active', 999, NOW() - INTERVAL '5 days', NOW() + INTERVAL '1 month')
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.subscriptions (user_id, plan_type, razorpay_payment_id, status, amount, starts_at, expires_at)
VALUES ('00000000-0000-4000-a000-00000000017b', 'prime_gold', 'pay_mock_1779606267694_11', 'active', 999, NOW() - INTERVAL '5 days', NOW() + INTERVAL '1 month')
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.subscriptions (user_id, plan_type, razorpay_payment_id, status, amount, starts_at, expires_at)
VALUES ('00000000-0000-4000-a000-00000000017d', 'prime_gold', 'pay_mock_1779606267694_12', 'active', 999, NOW() - INTERVAL '5 days', NOW() + INTERVAL '1 month')
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.subscriptions (user_id, plan_type, razorpay_payment_id, status, amount, starts_at, expires_at)
VALUES ('00000000-0000-4000-a000-00000000017e', 'prime_gold', 'pay_mock_1779606267694_13', 'active', 999, NOW() - INTERVAL '5 days', NOW() + INTERVAL '1 month')
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.subscriptions (user_id, plan_type, razorpay_payment_id, status, amount, starts_at, expires_at)
VALUES ('00000000-0000-4000-a000-000000000180', 'gold', 'pay_mock_1779606267694_14', 'active', 499, NOW() - INTERVAL '5 days', NOW() + INTERVAL '1 month')
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.subscriptions (user_id, plan_type, razorpay_payment_id, status, amount, starts_at, expires_at)
VALUES ('00000000-0000-4000-a000-000000000183', 'till_u_marry', 'pay_mock_1779606267694_15', 'active', 2499, NOW() - INTERVAL '5 days', NOW() + INTERVAL '6 month')
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.subscriptions (user_id, plan_type, razorpay_payment_id, status, amount, starts_at, expires_at)
VALUES ('00000000-0000-4000-a000-000000000185', 'prime_gold', 'pay_mock_1779606267694_16', 'active', 999, NOW() - INTERVAL '5 days', NOW() + INTERVAL '1 month')
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.subscriptions (user_id, plan_type, razorpay_payment_id, status, amount, starts_at, expires_at)
VALUES ('00000000-0000-4000-a000-000000000186', 'till_u_marry', 'pay_mock_1779606267694_17', 'active', 2499, NOW() - INTERVAL '5 days', NOW() + INTERVAL '6 month')
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.subscriptions (user_id, plan_type, razorpay_payment_id, status, amount, starts_at, expires_at)
VALUES ('00000000-0000-4000-a000-00000000018a', 'prime_gold', 'pay_mock_1779606267694_18', 'active', 999, NOW() - INTERVAL '5 days', NOW() + INTERVAL '1 month')
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.subscriptions (user_id, plan_type, razorpay_payment_id, status, amount, starts_at, expires_at)
VALUES ('00000000-0000-4000-a000-00000000018b', 'till_u_marry', 'pay_mock_1779606267694_19', 'active', 2499, NOW() - INTERVAL '5 days', NOW() + INTERVAL '6 month')
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.subscriptions (user_id, plan_type, razorpay_payment_id, status, amount, starts_at, expires_at)
VALUES ('00000000-0000-4000-a000-00000000018e', 'gold', 'pay_mock_1779606267694_20', 'active', 499, NOW() - INTERVAL '5 days', NOW() + INTERVAL '1 month')
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.subscriptions (user_id, plan_type, razorpay_payment_id, status, amount, starts_at, expires_at)
VALUES ('00000000-0000-4000-a000-000000000197', 'till_u_marry', 'pay_mock_1779606267694_21', 'active', 2499, NOW() - INTERVAL '5 days', NOW() + INTERVAL '6 month')
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.subscriptions (user_id, plan_type, razorpay_payment_id, status, amount, starts_at, expires_at)
VALUES ('00000000-0000-4000-a000-000000000199', 'gold', 'pay_mock_1779606267694_22', 'active', 499, NOW() - INTERVAL '5 days', NOW() + INTERVAL '1 month')
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.subscriptions (user_id, plan_type, razorpay_payment_id, status, amount, starts_at, expires_at)
VALUES ('00000000-0000-4000-a000-00000000019a', 'prime_gold', 'pay_mock_1779606267694_23', 'active', 999, NOW() - INTERVAL '5 days', NOW() + INTERVAL '1 month')
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.subscriptions (user_id, plan_type, razorpay_payment_id, status, amount, starts_at, expires_at)
VALUES ('00000000-0000-4000-a000-00000000019b', 'prime_gold', 'pay_mock_1779606267694_24', 'active', 999, NOW() - INTERVAL '5 days', NOW() + INTERVAL '1 month')
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.subscriptions (user_id, plan_type, razorpay_payment_id, status, amount, starts_at, expires_at)
VALUES ('00000000-0000-4000-a000-00000000019d', 'gold', 'pay_mock_1779606267694_25', 'active', 499, NOW() - INTERVAL '5 days', NOW() + INTERVAL '1 month')
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.subscriptions (user_id, plan_type, razorpay_payment_id, status, amount, starts_at, expires_at)
VALUES ('00000000-0000-4000-a000-0000000001a0', 'prime_gold', 'pay_mock_1779606267694_26', 'active', 999, NOW() - INTERVAL '5 days', NOW() + INTERVAL '1 month')
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.subscriptions (user_id, plan_type, razorpay_payment_id, status, amount, starts_at, expires_at)
VALUES ('00000000-0000-4000-a000-0000000001a6', 'till_u_marry', 'pay_mock_1779606267694_27', 'active', 2499, NOW() - INTERVAL '5 days', NOW() + INTERVAL '6 month')
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.subscriptions (user_id, plan_type, razorpay_payment_id, status, amount, starts_at, expires_at)
VALUES ('00000000-0000-4000-a000-0000000001a7', 'prime_gold', 'pay_mock_1779606267694_28', 'active', 999, NOW() - INTERVAL '5 days', NOW() + INTERVAL '1 month')
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.subscriptions (user_id, plan_type, razorpay_payment_id, status, amount, starts_at, expires_at)
VALUES ('00000000-0000-4000-a000-0000000001a9', 'prime_gold', 'pay_mock_1779606267694_29', 'active', 999, NOW() - INTERVAL '5 days', NOW() + INTERVAL '1 month')
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.subscriptions (user_id, plan_type, razorpay_payment_id, status, amount, starts_at, expires_at)
VALUES ('00000000-0000-4000-a000-0000000001ab', 'till_u_marry', 'pay_mock_1779606267694_30', 'active', 2499, NOW() - INTERVAL '5 days', NOW() + INTERVAL '6 month')
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.subscriptions (user_id, plan_type, razorpay_payment_id, status, amount, starts_at, expires_at)
VALUES ('00000000-0000-4000-a000-0000000001ad', 'prime_gold', 'pay_mock_1779606267694_31', 'active', 999, NOW() - INTERVAL '5 days', NOW() + INTERVAL '1 month')
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.subscriptions (user_id, plan_type, razorpay_payment_id, status, amount, starts_at, expires_at)
VALUES ('00000000-0000-4000-a000-0000000001b2', 'till_u_marry', 'pay_mock_1779606267694_32', 'active', 2499, NOW() - INTERVAL '5 days', NOW() + INTERVAL '6 month')
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.subscriptions (user_id, plan_type, razorpay_payment_id, status, amount, starts_at, expires_at)
VALUES ('00000000-0000-4000-a000-0000000001b3', 'till_u_marry', 'pay_mock_1779606267694_33', 'active', 2499, NOW() - INTERVAL '5 days', NOW() + INTERVAL '6 month')
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.subscriptions (user_id, plan_type, razorpay_payment_id, status, amount, starts_at, expires_at)
VALUES ('00000000-0000-4000-a000-0000000001b5', 'prime_gold', 'pay_mock_1779606267694_34', 'active', 999, NOW() - INTERVAL '5 days', NOW() + INTERVAL '1 month')
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.subscriptions (user_id, plan_type, razorpay_payment_id, status, amount, starts_at, expires_at)
VALUES ('00000000-0000-4000-a000-0000000001b8', 'till_u_marry', 'pay_mock_1779606267694_35', 'active', 2499, NOW() - INTERVAL '5 days', NOW() + INTERVAL '6 month')
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.subscriptions (user_id, plan_type, razorpay_payment_id, status, amount, starts_at, expires_at)
VALUES ('00000000-0000-4000-a000-0000000001d2', 'till_u_marry', 'pay_mock_1779606267694_36', 'active', 2499, NOW() - INTERVAL '5 days', NOW() + INTERVAL '6 month')
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.subscriptions (user_id, plan_type, razorpay_payment_id, status, amount, starts_at, expires_at)
VALUES ('00000000-0000-4000-a000-0000000001d5', 'gold', 'pay_mock_1779606267694_37', 'active', 499, NOW() - INTERVAL '5 days', NOW() + INTERVAL '1 month')
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.subscriptions (user_id, plan_type, razorpay_payment_id, status, amount, starts_at, expires_at)
VALUES ('00000000-0000-4000-a000-0000000001da', 'gold', 'pay_mock_1779606267694_38', 'active', 499, NOW() - INTERVAL '5 days', NOW() + INTERVAL '1 month')
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.subscriptions (user_id, plan_type, razorpay_payment_id, status, amount, starts_at, expires_at)
VALUES ('00000000-0000-4000-a000-0000000001dd', 'gold', 'pay_mock_1779606267694_39', 'active', 499, NOW() - INTERVAL '5 days', NOW() + INTERVAL '1 month')
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.subscriptions (user_id, plan_type, razorpay_payment_id, status, amount, starts_at, expires_at)
VALUES ('00000000-0000-4000-a000-0000000001de', 'prime_gold', 'pay_mock_1779606267694_40', 'active', 999, NOW() - INTERVAL '5 days', NOW() + INTERVAL '1 month')
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.subscriptions (user_id, plan_type, razorpay_payment_id, status, amount, starts_at, expires_at)
VALUES ('00000000-0000-4000-a000-0000000001e0', 'gold', 'pay_mock_1779606267694_41', 'active', 499, NOW() - INTERVAL '5 days', NOW() + INTERVAL '1 month')
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.subscriptions (user_id, plan_type, razorpay_payment_id, status, amount, starts_at, expires_at)
VALUES ('00000000-0000-4000-a000-0000000001e5', 'gold', 'pay_mock_1779606267694_42', 'active', 499, NOW() - INTERVAL '5 days', NOW() + INTERVAL '1 month')
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.subscriptions (user_id, plan_type, razorpay_payment_id, status, amount, starts_at, expires_at)
VALUES ('00000000-0000-4000-a000-0000000001e6', 'gold', 'pay_mock_1779606267694_43', 'active', 499, NOW() - INTERVAL '5 days', NOW() + INTERVAL '1 month')
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.subscriptions (user_id, plan_type, razorpay_payment_id, status, amount, starts_at, expires_at)
VALUES ('00000000-0000-4000-a000-0000000001e7', 'gold', 'pay_mock_1779606267694_44', 'active', 499, NOW() - INTERVAL '5 days', NOW() + INTERVAL '1 month')
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.subscriptions (user_id, plan_type, razorpay_payment_id, status, amount, starts_at, expires_at)
VALUES ('00000000-0000-4000-a000-0000000001f1', 'gold', 'pay_mock_1779606267694_45', 'active', 499, NOW() - INTERVAL '5 days', NOW() + INTERVAL '1 month')
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.subscriptions (user_id, plan_type, razorpay_payment_id, status, amount, starts_at, expires_at)
VALUES ('00000000-0000-4000-a000-0000000001f2', 'gold', 'pay_mock_1779606267694_46', 'active', 499, NOW() - INTERVAL '5 days', NOW() + INTERVAL '1 month')
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.subscriptions (user_id, plan_type, razorpay_payment_id, status, amount, starts_at, expires_at)
VALUES ('00000000-0000-4000-a000-0000000001f4', 'till_u_marry', 'pay_mock_1779606267694_47', 'active', 2499, NOW() - INTERVAL '5 days', NOW() + INTERVAL '6 month')
ON CONFLICT (id) DO NOTHING;

-- 7. MUTUAL INTERESTS INSERTIONS
INSERT INTO public.interests (sender_id, receiver_id, status, message)
VALUES ('00000000-0000-4000-a000-000000000183', '00000000-0000-4000-a000-0000000001e2', 'pending', 'Hi, I found your profile matching my preferences. Let us connect!')
ON CONFLICT (sender_id, receiver_id) DO NOTHING;
INSERT INTO public.interests (sender_id, receiver_id, status, message)
VALUES ('00000000-0000-4000-a000-0000000001c5', '00000000-0000-4000-a000-0000000001c6', 'pending', 'Hi, I found your profile matching my preferences. Let us connect!')
ON CONFLICT (sender_id, receiver_id) DO NOTHING;
INSERT INTO public.interests (sender_id, receiver_id, status, message)
VALUES ('00000000-0000-4000-a000-000000000169', '00000000-0000-4000-a000-0000000001ac', 'pending', 'Hi, I found your profile matching my preferences. Let us connect!')
ON CONFLICT (sender_id, receiver_id) DO NOTHING;
INSERT INTO public.interests (sender_id, receiver_id, status, message)
VALUES ('00000000-0000-4000-a000-0000000001bd', '00000000-0000-4000-a000-0000000001e8', 'pending', 'Hi, I found your profile matching my preferences. Let us connect!')
ON CONFLICT (sender_id, receiver_id) DO NOTHING;
INSERT INTO public.interests (sender_id, receiver_id, status, message)
VALUES ('00000000-0000-4000-a000-0000000001e3', '00000000-0000-4000-a000-00000000019c', 'pending', 'Hi, I found your profile matching my preferences. Let us connect!')
ON CONFLICT (sender_id, receiver_id) DO NOTHING;
INSERT INTO public.interests (sender_id, receiver_id, status, message)
VALUES ('00000000-0000-4000-a000-000000000197', '00000000-0000-4000-a000-000000000190', 'pending', 'Hi, I found your profile matching my preferences. Let us connect!')
ON CONFLICT (sender_id, receiver_id) DO NOTHING;
INSERT INTO public.interests (sender_id, receiver_id, status, message)
VALUES ('00000000-0000-4000-a000-00000000018d', '00000000-0000-4000-a000-00000000019c', 'pending', 'Hi, I found your profile matching my preferences. Let us connect!')
ON CONFLICT (sender_id, receiver_id) DO NOTHING;
INSERT INTO public.interests (sender_id, receiver_id, status, message)
VALUES ('00000000-0000-4000-a000-0000000001c9', '00000000-0000-4000-a000-0000000001e0', 'pending', 'Hi, I found your profile matching my preferences. Let us connect!')
ON CONFLICT (sender_id, receiver_id) DO NOTHING;
INSERT INTO public.interests (sender_id, receiver_id, status, message)
VALUES ('00000000-0000-4000-a000-000000000193', '00000000-0000-4000-a000-000000000174', 'pending', 'Hi, I found your profile matching my preferences. Let us connect!')
ON CONFLICT (sender_id, receiver_id) DO NOTHING;
INSERT INTO public.interests (sender_id, receiver_id, status, message)
VALUES ('00000000-0000-4000-a000-00000000017f', '00000000-0000-4000-a000-0000000001f4', 'pending', 'Hi, I found your profile matching my preferences. Let us connect!')
ON CONFLICT (sender_id, receiver_id) DO NOTHING;
INSERT INTO public.interests (sender_id, receiver_id, status, message)
VALUES ('00000000-0000-4000-a000-0000000001c1', '00000000-0000-4000-a000-00000000015a', 'pending', 'Hi, I found your profile matching my preferences. Let us connect!')
ON CONFLICT (sender_id, receiver_id) DO NOTHING;
INSERT INTO public.interests (sender_id, receiver_id, status, message)
VALUES ('00000000-0000-4000-a000-0000000001d9', '00000000-0000-4000-a000-0000000001f2', 'pending', 'Hi, I found your profile matching my preferences. Let us connect!')
ON CONFLICT (sender_id, receiver_id) DO NOTHING;
INSERT INTO public.interests (sender_id, receiver_id, status, message)
VALUES ('00000000-0000-4000-a000-000000000157', '00000000-0000-4000-a000-000000000160', 'pending', 'Hi, I found your profile matching my preferences. Let us connect!')
ON CONFLICT (sender_id, receiver_id) DO NOTHING;
INSERT INTO public.interests (sender_id, receiver_id, status, message)
VALUES ('00000000-0000-4000-a000-0000000001cb', '00000000-0000-4000-a000-000000000198', 'pending', 'Hi, I found your profile matching my preferences. Let us connect!')
ON CONFLICT (sender_id, receiver_id) DO NOTHING;
INSERT INTO public.interests (sender_id, receiver_id, status, message)
VALUES ('00000000-0000-4000-a000-0000000001df', '00000000-0000-4000-a000-000000000182', 'pending', 'Hi, I found your profile matching my preferences. Let us connect!')
ON CONFLICT (sender_id, receiver_id) DO NOTHING;
INSERT INTO public.interests (sender_id, receiver_id, status, message)
VALUES ('00000000-0000-4000-a000-0000000001ab', '00000000-0000-4000-a000-000000000192', 'pending', 'Hi, I found your profile matching my preferences. Let us connect!')
ON CONFLICT (sender_id, receiver_id) DO NOTHING;
INSERT INTO public.interests (sender_id, receiver_id, status, message)
VALUES ('00000000-0000-4000-a000-0000000001d3', '00000000-0000-4000-a000-00000000019e', 'pending', 'Hi, I found your profile matching my preferences. Let us connect!')
ON CONFLICT (sender_id, receiver_id) DO NOTHING;
INSERT INTO public.interests (sender_id, receiver_id, status, message)
VALUES ('00000000-0000-4000-a000-00000000017f', '00000000-0000-4000-a000-000000000170', 'pending', 'Hi, I found your profile matching my preferences. Let us connect!')
ON CONFLICT (sender_id, receiver_id) DO NOTHING;
INSERT INTO public.interests (sender_id, receiver_id, status, message)
VALUES ('00000000-0000-4000-a000-000000000185', '00000000-0000-4000-a000-000000000196', 'pending', 'Hi, I found your profile matching my preferences. Let us connect!')
ON CONFLICT (sender_id, receiver_id) DO NOTHING;
INSERT INTO public.interests (sender_id, receiver_id, status, message)
VALUES ('00000000-0000-4000-a000-000000000181', '00000000-0000-4000-a000-0000000001ee', 'pending', 'Hi, I found your profile matching my preferences. Let us connect!')
ON CONFLICT (sender_id, receiver_id) DO NOTHING;
INSERT INTO public.interests (sender_id, receiver_id, status, message)
VALUES ('00000000-0000-4000-a000-0000000001e3', '00000000-0000-4000-a000-0000000001c2', 'pending', 'Hi, I found your profile matching my preferences. Let us connect!')
ON CONFLICT (sender_id, receiver_id) DO NOTHING;
INSERT INTO public.interests (sender_id, receiver_id, status, message)
VALUES ('00000000-0000-4000-a000-0000000001c9', '00000000-0000-4000-a000-0000000001e8', 'pending', 'Hi, I found your profile matching my preferences. Let us connect!')
ON CONFLICT (sender_id, receiver_id) DO NOTHING;
INSERT INTO public.interests (sender_id, receiver_id, status, message)
VALUES ('00000000-0000-4000-a000-000000000199', '00000000-0000-4000-a000-0000000001f4', 'pending', 'Hi, I found your profile matching my preferences. Let us connect!')
ON CONFLICT (sender_id, receiver_id) DO NOTHING;
INSERT INTO public.interests (sender_id, receiver_id, status, message)
VALUES ('00000000-0000-4000-a000-0000000001db', '00000000-0000-4000-a000-0000000001b0', 'pending', 'Hi, I found your profile matching my preferences. Let us connect!')
ON CONFLICT (sender_id, receiver_id) DO NOTHING;
INSERT INTO public.interests (sender_id, receiver_id, status, message)
VALUES ('00000000-0000-4000-a000-00000000015d', '00000000-0000-4000-a000-000000000160', 'pending', 'Hi, I found your profile matching my preferences. Let us connect!')
ON CONFLICT (sender_id, receiver_id) DO NOTHING;
INSERT INTO public.interests (sender_id, receiver_id, status, message)
VALUES ('00000000-0000-4000-a000-0000000001a9', '00000000-0000-4000-a000-000000000156', 'pending', 'Hi, I found your profile matching my preferences. Let us connect!')
ON CONFLICT (sender_id, receiver_id) DO NOTHING;
INSERT INTO public.interests (sender_id, receiver_id, status, message)
VALUES ('00000000-0000-4000-a000-0000000001ad', '00000000-0000-4000-a000-0000000001da', 'pending', 'Hi, I found your profile matching my preferences. Let us connect!')
ON CONFLICT (sender_id, receiver_id) DO NOTHING;
INSERT INTO public.interests (sender_id, receiver_id, status, message)
VALUES ('00000000-0000-4000-a000-0000000001b7', '00000000-0000-4000-a000-0000000001e6', 'pending', 'Hi, I found your profile matching my preferences. Let us connect!')
ON CONFLICT (sender_id, receiver_id) DO NOTHING;
INSERT INTO public.interests (sender_id, receiver_id, status, message)
VALUES ('00000000-0000-4000-a000-00000000017f', '00000000-0000-4000-a000-000000000190', 'pending', 'Hi, I found your profile matching my preferences. Let us connect!')
ON CONFLICT (sender_id, receiver_id) DO NOTHING;
INSERT INTO public.interests (sender_id, receiver_id, status, message)
VALUES ('00000000-0000-4000-a000-0000000001f1', '00000000-0000-4000-a000-0000000001b0', 'pending', 'Hi, I found your profile matching my preferences. Let us connect!')
ON CONFLICT (sender_id, receiver_id) DO NOTHING;
INSERT INTO public.interests (sender_id, receiver_id, status, message)
VALUES ('00000000-0000-4000-a000-0000000001b3', '00000000-0000-4000-a000-000000000174', 'pending', 'Hi, I found your profile matching my preferences. Let us connect!')
ON CONFLICT (sender_id, receiver_id) DO NOTHING;
INSERT INTO public.interests (sender_id, receiver_id, status, message)
VALUES ('00000000-0000-4000-a000-0000000001ef', '00000000-0000-4000-a000-0000000001c4', 'pending', 'Hi, I found your profile matching my preferences. Let us connect!')
ON CONFLICT (sender_id, receiver_id) DO NOTHING;
INSERT INTO public.interests (sender_id, receiver_id, status, message)
VALUES ('00000000-0000-4000-a000-0000000001eb', '00000000-0000-4000-a000-0000000001ce', 'pending', 'Hi, I found your profile matching my preferences. Let us connect!')
ON CONFLICT (sender_id, receiver_id) DO NOTHING;
INSERT INTO public.interests (sender_id, receiver_id, status, message)
VALUES ('00000000-0000-4000-a000-000000000185', '00000000-0000-4000-a000-0000000001e6', 'pending', 'Hi, I found your profile matching my preferences. Let us connect!')
ON CONFLICT (sender_id, receiver_id) DO NOTHING;
INSERT INTO public.interests (sender_id, receiver_id, status, message)
VALUES ('00000000-0000-4000-a000-00000000015b', '00000000-0000-4000-a000-000000000194', 'pending', 'Hi, I found your profile matching my preferences. Let us connect!')
ON CONFLICT (sender_id, receiver_id) DO NOTHING;
INSERT INTO public.interests (sender_id, receiver_id, status, message)
VALUES ('00000000-0000-4000-a000-0000000001d9', '00000000-0000-4000-a000-000000000156', 'pending', 'Hi, I found your profile matching my preferences. Let us connect!')
ON CONFLICT (sender_id, receiver_id) DO NOTHING;
INSERT INTO public.interests (sender_id, receiver_id, status, message)
VALUES ('00000000-0000-4000-a000-0000000001ef', '00000000-0000-4000-a000-0000000001d2', 'pending', 'Hi, I found your profile matching my preferences. Let us connect!')
ON CONFLICT (sender_id, receiver_id) DO NOTHING;
INSERT INTO public.interests (sender_id, receiver_id, status, message)
VALUES ('00000000-0000-4000-a000-0000000001b9', '00000000-0000-4000-a000-0000000001b0', 'pending', 'Hi, I found your profile matching my preferences. Let us connect!')
ON CONFLICT (sender_id, receiver_id) DO NOTHING;
INSERT INTO public.interests (sender_id, receiver_id, status, message)
VALUES ('00000000-0000-4000-a000-0000000001c1', '00000000-0000-4000-a000-000000000174', 'pending', 'Hi, I found your profile matching my preferences. Let us connect!')
ON CONFLICT (sender_id, receiver_id) DO NOTHING;
INSERT INTO public.interests (sender_id, receiver_id, status, message)
VALUES ('00000000-0000-4000-a000-00000000018d', '00000000-0000-4000-a000-0000000001b4', 'pending', 'Hi, I found your profile matching my preferences. Let us connect!')
ON CONFLICT (sender_id, receiver_id) DO NOTHING;
INSERT INTO public.interests (sender_id, receiver_id, status, message)
VALUES ('00000000-0000-4000-a000-000000000159', '00000000-0000-4000-a000-000000000184', 'pending', 'Hi, I found your profile matching my preferences. Let us connect!')
ON CONFLICT (sender_id, receiver_id) DO NOTHING;
INSERT INTO public.interests (sender_id, receiver_id, status, message)
VALUES ('00000000-0000-4000-a000-000000000197', '00000000-0000-4000-a000-0000000001da', 'pending', 'Hi, I found your profile matching my preferences. Let us connect!')
ON CONFLICT (sender_id, receiver_id) DO NOTHING;
INSERT INTO public.interests (sender_id, receiver_id, status, message)
VALUES ('00000000-0000-4000-a000-000000000155', '00000000-0000-4000-a000-000000000170', 'pending', 'Hi, I found your profile matching my preferences. Let us connect!')
ON CONFLICT (sender_id, receiver_id) DO NOTHING;
INSERT INTO public.interests (sender_id, receiver_id, status, message)
VALUES ('00000000-0000-4000-a000-000000000173', '00000000-0000-4000-a000-0000000001ee', 'pending', 'Hi, I found your profile matching my preferences. Let us connect!')
ON CONFLICT (sender_id, receiver_id) DO NOTHING;
INSERT INTO public.interests (sender_id, receiver_id, status, message)
VALUES ('00000000-0000-4000-a000-0000000001d1', '00000000-0000-4000-a000-0000000001f2', 'pending', 'Hi, I found your profile matching my preferences. Let us connect!')
ON CONFLICT (sender_id, receiver_id) DO NOTHING;
INSERT INTO public.interests (sender_id, receiver_id, status, message)
VALUES ('00000000-0000-4000-a000-000000000183', '00000000-0000-4000-a000-0000000001d8', 'pending', 'Hi, I found your profile matching my preferences. Let us connect!')
ON CONFLICT (sender_id, receiver_id) DO NOTHING;
INSERT INTO public.interests (sender_id, receiver_id, status, message)
VALUES ('00000000-0000-4000-a000-0000000001d7', '00000000-0000-4000-a000-00000000016c', 'pending', 'Hi, I found your profile matching my preferences. Let us connect!')
ON CONFLICT (sender_id, receiver_id) DO NOTHING;
INSERT INTO public.interests (sender_id, receiver_id, status, message)
VALUES ('00000000-0000-4000-a000-0000000001dd', '00000000-0000-4000-a000-0000000001dc', 'pending', 'Hi, I found your profile matching my preferences. Let us connect!')
ON CONFLICT (sender_id, receiver_id) DO NOTHING;
INSERT INTO public.interests (sender_id, receiver_id, status, message)
VALUES ('00000000-0000-4000-a000-0000000001ad', '00000000-0000-4000-a000-000000000170', 'pending', 'Hi, I found your profile matching my preferences. Let us connect!')
ON CONFLICT (sender_id, receiver_id) DO NOTHING;
INSERT INTO public.interests (sender_id, receiver_id, status, message)
VALUES ('00000000-0000-4000-a000-000000000189', '00000000-0000-4000-a000-0000000001d2', 'pending', 'Hi, I found your profile matching my preferences. Let us connect!')
ON CONFLICT (sender_id, receiver_id) DO NOTHING;
INSERT INTO public.interests (sender_id, receiver_id, status, message)
VALUES ('00000000-0000-4000-a000-000000000165', '00000000-0000-4000-a000-0000000001a0', 'pending', 'Hi, I found your profile matching my preferences. Let us connect!')
ON CONFLICT (sender_id, receiver_id) DO NOTHING;
INSERT INTO public.interests (sender_id, receiver_id, status, message)
VALUES ('00000000-0000-4000-a000-00000000015d', '00000000-0000-4000-a000-0000000001a4', 'pending', 'Hi, I found your profile matching my preferences. Let us connect!')
ON CONFLICT (sender_id, receiver_id) DO NOTHING;
INSERT INTO public.interests (sender_id, receiver_id, status, message)
VALUES ('00000000-0000-4000-a000-0000000001d9', '00000000-0000-4000-a000-000000000162', 'pending', 'Hi, I found your profile matching my preferences. Let us connect!')
ON CONFLICT (sender_id, receiver_id) DO NOTHING;
INSERT INTO public.interests (sender_id, receiver_id, status, message)
VALUES ('00000000-0000-4000-a000-000000000169', '00000000-0000-4000-a000-00000000018a', 'pending', 'Hi, I found your profile matching my preferences. Let us connect!')
ON CONFLICT (sender_id, receiver_id) DO NOTHING;
INSERT INTO public.interests (sender_id, receiver_id, status, message)
VALUES ('00000000-0000-4000-a000-000000000159', '00000000-0000-4000-a000-000000000178', 'pending', 'Hi, I found your profile matching my preferences. Let us connect!')
ON CONFLICT (sender_id, receiver_id) DO NOTHING;
INSERT INTO public.interests (sender_id, receiver_id, status, message)
VALUES ('00000000-0000-4000-a000-0000000001a3', '00000000-0000-4000-a000-00000000015e', 'pending', 'Hi, I found your profile matching my preferences. Let us connect!')
ON CONFLICT (sender_id, receiver_id) DO NOTHING;
INSERT INTO public.interests (sender_id, receiver_id, status, message)
VALUES ('00000000-0000-4000-a000-0000000001d3', '00000000-0000-4000-a000-0000000001ae', 'pending', 'Hi, I found your profile matching my preferences. Let us connect!')
ON CONFLICT (sender_id, receiver_id) DO NOTHING;
INSERT INTO public.interests (sender_id, receiver_id, status, message)
VALUES ('00000000-0000-4000-a000-0000000001c7', '00000000-0000-4000-a000-0000000001bc', 'pending', 'Hi, I found your profile matching my preferences. Let us connect!')
ON CONFLICT (sender_id, receiver_id) DO NOTHING;
INSERT INTO public.interests (sender_id, receiver_id, status, message)
VALUES ('00000000-0000-4000-a000-000000000155', '00000000-0000-4000-a000-000000000162', 'pending', 'Hi, I found your profile matching my preferences. Let us connect!')
ON CONFLICT (sender_id, receiver_id) DO NOTHING;
INSERT INTO public.interests (sender_id, receiver_id, status, message)
VALUES ('00000000-0000-4000-a000-0000000001e3', '00000000-0000-4000-a000-00000000017e', 'pending', 'Hi, I found your profile matching my preferences. Let us connect!')
ON CONFLICT (sender_id, receiver_id) DO NOTHING;

-- 8. MOCK COMPLETED REPORTS
INSERT INTO public.reports (reporter_id, reported_user_id, reason, status)
VALUES ('00000000-0000-4000-a000-0000000001a9', '00000000-0000-4000-a000-0000000001a2', 'Profile pictures appear to be static placeholders.', 'pending')
ON CONFLICT DO NOTHING;
INSERT INTO public.reports (reporter_id, reported_user_id, reason, status)
VALUES ('00000000-0000-4000-a000-000000000179', '00000000-0000-4000-a000-000000000164', 'Profile pictures appear to be static placeholders.', 'pending')
ON CONFLICT DO NOTHING;
INSERT INTO public.reports (reporter_id, reported_user_id, reason, status)
VALUES ('00000000-0000-4000-a000-00000000017d', '00000000-0000-4000-a000-00000000019c', 'Profile pictures appear to be static placeholders.', 'pending')
ON CONFLICT DO NOTHING;
INSERT INTO public.reports (reporter_id, reported_user_id, reason, status)
VALUES ('00000000-0000-4000-a000-0000000001d7', '00000000-0000-4000-a000-00000000018a', 'Profile pictures appear to be static placeholders.', 'pending')
ON CONFLICT DO NOTHING;
INSERT INTO public.reports (reporter_id, reported_user_id, reason, status)
VALUES ('00000000-0000-4000-a000-0000000001cd', '00000000-0000-4000-a000-0000000001d4', 'Profile pictures appear to be static placeholders.', 'pending')
ON CONFLICT DO NOTHING;
INSERT INTO public.reports (reporter_id, reported_user_id, reason, status)
VALUES ('00000000-0000-4000-a000-0000000001bf', '00000000-0000-4000-a000-00000000015e', 'Profile pictures appear to be static placeholders.', 'pending')
ON CONFLICT DO NOTHING;
INSERT INTO public.reports (reporter_id, reported_user_id, reason, status)
VALUES ('00000000-0000-4000-a000-000000000173', '00000000-0000-4000-a000-000000000194', 'Profile pictures appear to be static placeholders.', 'pending')
ON CONFLICT DO NOTHING;
INSERT INTO public.reports (reporter_id, reported_user_id, reason, status)
VALUES ('00000000-0000-4000-a000-00000000018b', '00000000-0000-4000-a000-0000000001ee', 'Profile pictures appear to be static placeholders.', 'pending')
ON CONFLICT DO NOTHING;
INSERT INTO public.reports (reporter_id, reported_user_id, reason, status)
VALUES ('00000000-0000-4000-a000-0000000001c9', '00000000-0000-4000-a000-0000000001b4', 'Profile pictures appear to be static placeholders.', 'pending')
ON CONFLICT DO NOTHING;
INSERT INTO public.reports (reporter_id, reported_user_id, reason, status)
VALUES ('00000000-0000-4000-a000-000000000197', '00000000-0000-4000-a000-0000000001c8', 'Profile pictures appear to be static placeholders.', 'pending')
ON CONFLICT DO NOTHING;

COMMIT;
