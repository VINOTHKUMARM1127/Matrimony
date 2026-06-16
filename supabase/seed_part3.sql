-- ============================================================
-- Wedring Matrimony — Seeding Ecosystem (Part 3)
-- ============================================================

CREATE EXTENSION IF NOT EXISTS pgcrypto;

BEGIN;

-- 1. AUTH USERS INSERTIONS
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-000000000155', 'tamiluser341@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Hari Moorthy"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-000000000156', 'tamiluser342@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Kayalvizhi Kumar"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-000000000157', 'tamiluser343@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Mohan Samy"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-000000000158', 'tamiluser344@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Dharshini Lingam"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-000000000159', 'tamiluser345@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Siva Moorthy"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-00000000015a', 'tamiluser346@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Divya Balan"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-00000000015b', 'tamiluser347@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Ramakrishnan Krishnan"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-00000000015c', 'tamiluser348@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Rekha Nathan"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-00000000015d', 'tamiluser349@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Anbarasan Lingam"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-00000000015e', 'tamiluser350@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Rajeshwari Shankar"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-00000000015f', 'tamiluser351@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Jayakumar Murthy"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-000000000160', 'tamiluser352@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Chitra Lingam"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-000000000161', 'tamiluser353@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Vijay Pandian"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-000000000162', 'tamiluser354@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Rajeshwari Lingam"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-000000000163', 'tamiluser355@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Prakash Raman"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-000000000164', 'tamiluser356@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Dharshini Raman"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-000000000165', 'tamiluser357@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Madhavan Devan"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-000000000166', 'tamiluser358@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Rajeshwari Moorthy"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-000000000167', 'tamiluser359@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Mohan Moorthy"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-000000000168', 'tamiluser360@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Ramani Shankar"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-000000000169', 'tamiluser361@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Thirumal Swamy"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-00000000016a', 'tamiluser362@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Pooja Mani"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-00000000016b', 'tamiluser363@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Siddharth Mani"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-00000000016c', 'tamiluser364@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Pavithra Swamy"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-00000000016d', 'tamiluser365@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Kannan Mani"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-00000000016e', 'tamiluser366@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Pooja Sundaram"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-00000000016f', 'tamiluser367@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Viswanathan Naicker"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-000000000170', 'tamiluser368@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Sneha Mani"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-000000000171', 'tamiluser369@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Murugan Mani"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-000000000172', 'tamiluser370@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Banumathi Kumar"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-000000000173', 'tamiluser371@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Ranjith Moorthy"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-000000000174', 'tamiluser372@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Yazhini Selvan"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-000000000175', 'tamiluser373@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Chinnasamy Krishnan"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-000000000176', 'tamiluser374@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Gowri Velan"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-000000000177', 'tamiluser375@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Muthu Nathan"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-000000000178', 'tamiluser376@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Swetha Pandian"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-000000000179', 'tamiluser377@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Sakthi Selvan"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-00000000017a', 'tamiluser378@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Chitra Lingam"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-00000000017b', 'tamiluser379@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Vignesh Selvan"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-00000000017c', 'tamiluser380@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Kokila Samy"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-00000000017d', 'tamiluser381@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Hari Krishnan"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-00000000017e', 'tamiluser382@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Janani Samy"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-00000000017f', 'tamiluser383@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Ramesh Nathan"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-000000000180', 'tamiluser384@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Gayathri Balan"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-000000000181', 'tamiluser385@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Kabilan Murthy"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-000000000182', 'tamiluser386@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Abirami Murthy"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-000000000183', 'tamiluser387@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Ramesh Mani"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-000000000184', 'tamiluser388@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Oviya Sundaram"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-000000000185', 'tamiluser389@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Sundar Samy"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-000000000186', 'tamiluser390@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Rekha Sundaram"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-000000000187', 'tamiluser391@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Thirumal Shankar"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-000000000188', 'tamiluser392@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Nandhini Naicker"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-000000000189', 'tamiluser393@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Manikandan Moorthy"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-00000000018a', 'tamiluser394@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Rajeshwari Raman"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-00000000018b', 'tamiluser395@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Muthu Lingam"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-00000000018c', 'tamiluser396@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Rekha Lingam"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-00000000018d', 'tamiluser397@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Karthik Lingam"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-00000000018e', 'tamiluser398@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Preethi Naicker"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-00000000018f', 'tamiluser399@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Gautham Raman"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-000000000190', 'tamiluser400@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Deepa Moorthy"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-000000000191', 'tamiluser401@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Hari Lingam"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-000000000192', 'tamiluser402@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Nandhini Pandian"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-000000000193', 'tamiluser403@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Senthil Krishnan"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-000000000194', 'tamiluser404@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Indhumathi Moorthy"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-000000000195', 'tamiluser405@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Chinnasamy Raman"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-000000000196', 'tamiluser406@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Parvathi Sundaram"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-000000000197', 'tamiluser407@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Anand Krishnan"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-000000000198', 'tamiluser408@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Sneha Selvan"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-000000000199', 'tamiluser409@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Murugan Sundaram"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-00000000019a', 'tamiluser410@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Ramya Krishnan"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-00000000019b', 'tamiluser411@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Karthik Raj"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-00000000019c', 'tamiluser412@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Dharshini Lingam"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-00000000019d', 'tamiluser413@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Chinnasamy Samy"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-00000000019e', 'tamiluser414@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Shanthi Shankar"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-00000000019f', 'tamiluser415@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Praveen Sundaram"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-0000000001a0', 'tamiluser416@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Kayalvizhi Lingam"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-0000000001a1', 'tamiluser417@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Ganesan Krishnan"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-0000000001a2', 'tamiluser418@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Sandhya Krishnan"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-0000000001a3', 'tamiluser419@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Ranjith Samy"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-0000000001a4', 'tamiluser420@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Radha Velan"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-0000000001a5', 'tamiluser421@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Muthu Raj"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-0000000001a6', 'tamiluser422@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Sowmya Gopal"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-0000000001a7', 'tamiluser423@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Muthu Mani"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-0000000001a8', 'tamiluser424@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Anitha Lingam"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-0000000001a9', 'tamiluser425@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Gautham Murthy"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-0000000001aa', 'tamiluser426@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Sowmya Gopal"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-0000000001ab', 'tamiluser427@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Srinivasan Raj"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-0000000001ac', 'tamiluser428@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Uma Mani"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-0000000001ad', 'tamiluser429@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Senthil Sundaram"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-0000000001ae', 'tamiluser430@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Abirami Krishnan"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-0000000001af', 'tamiluser431@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Bala Moorthy"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-0000000001b0', 'tamiluser432@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Anitha Selvan"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-0000000001b1', 'tamiluser433@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Senthil Naicker"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-0000000001b2', 'tamiluser434@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Uma Nathan"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-0000000001b3', 'tamiluser435@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Mohan Nathan"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-0000000001b4', 'tamiluser436@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Meenakshi Nathan"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-0000000001b5', 'tamiluser437@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Siddharth Swamy"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-0000000001b6', 'tamiluser438@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Deepa Swamy"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-0000000001b7', 'tamiluser439@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Thirumal Krishnan"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-0000000001b8', 'tamiluser440@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Vijaya Naicker"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-0000000001b9', 'tamiluser441@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Naveen Pandian"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-0000000001ba', 'tamiluser442@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Vanitha Raj"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-0000000001bb', 'tamiluser443@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Dinesh Krishnan"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-0000000001bc', 'tamiluser444@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Yazhini Pandian"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-0000000001bd', 'tamiluser445@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Saravanan Pandian"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-0000000001be', 'tamiluser446@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Harini Nathan"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-0000000001bf', 'tamiluser447@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Ganesan Velan"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-0000000001c0', 'tamiluser448@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Soundarya Raman"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-0000000001c1', 'tamiluser449@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Suresh Krishnan"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-0000000001c2', 'tamiluser450@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Dharshini Balan"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-0000000001c3', 'tamiluser451@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Hari Velan"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-0000000001c4', 'tamiluser452@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Kayalvizhi Raman"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-0000000001c5', 'tamiluser453@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Kabilan Shankar"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-0000000001c6', 'tamiluser454@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Ramya Murthy"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-0000000001c7', 'tamiluser455@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Ramesh Selvan"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-0000000001c8', 'tamiluser456@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Yazhini Murthy"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-0000000001c9', 'tamiluser457@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Vinoth Shankar"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-0000000001ca', 'tamiluser458@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Parvathi Kumar"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-0000000001cb', 'tamiluser459@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Mohan Pandian"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-0000000001cc', 'tamiluser460@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Nivedha Raj"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-0000000001cd', 'tamiluser461@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Siva Devan"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-0000000001ce', 'tamiluser462@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Janani Balan"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-0000000001cf', 'tamiluser463@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Ranjith Swamy"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-0000000001d0', 'tamiluser464@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Shalini Raj"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-0000000001d1', 'tamiluser465@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Naveen Kumar"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-0000000001d2', 'tamiluser466@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Harini Moorthy"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-0000000001d3', 'tamiluser467@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Suresh Krishnan"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-0000000001d4', 'tamiluser468@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Ponmani Devan"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-0000000001d5', 'tamiluser469@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Hari Nathan"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-0000000001d6', 'tamiluser470@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Gowri Swamy"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-0000000001d7', 'tamiluser471@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Arun Pandian"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-0000000001d8', 'tamiluser472@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Ramya Sundaram"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-0000000001d9', 'tamiluser473@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Madhavan Samy"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-0000000001da', 'tamiluser474@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Ramani Sundaram"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-0000000001db', 'tamiluser475@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Chinnasamy Lingam"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-0000000001dc', 'tamiluser476@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Abirami Shankar"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-0000000001dd', 'tamiluser477@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Vetrivel Sundaram"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-0000000001de', 'tamiluser478@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Harini Balan"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-0000000001df', 'tamiluser479@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Vignesh Nathan"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-0000000001e0', 'tamiluser480@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Malarvizhi Krishnan"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-0000000001e1', 'tamiluser481@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Karthik Pandian"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-0000000001e2', 'tamiluser482@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Ponmani Raj"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-0000000001e3', 'tamiluser483@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Jayakumar Mani"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-0000000001e4', 'tamiluser484@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Shanthi Mani"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-0000000001e5', 'tamiluser485@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Kabilan Selvan"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-0000000001e6', 'tamiluser486@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Janani Samy"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-0000000001e7', 'tamiluser487@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Kannan Nathan"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-0000000001e8', 'tamiluser488@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Shalini Kumar"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-0000000001e9', 'tamiluser489@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Deepak Moorthy"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-0000000001ea', 'tamiluser490@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Archana Shankar"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-0000000001eb', 'tamiluser491@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Siva Selvan"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-0000000001ec', 'tamiluser492@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Malarvizhi Murthy"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-0000000001ed', 'tamiluser493@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Mohan Balan"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-0000000001ee', 'tamiluser494@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Harini Swamy"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-0000000001ef', 'tamiluser495@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Senthil Sundaram"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-0000000001f0', 'tamiluser496@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Sowmya Shankar"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-0000000001f1', 'tamiluser497@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Dinesh Kumar"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-0000000001f2', 'tamiluser498@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Saraswathi Velan"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-0000000001f3', 'tamiluser499@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Sakthi Devan"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-0000000001f4', 'tamiluser500@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Lakshmi Samy"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;

-- 2. PUBLIC PROFILES INSERTIONS
INSERT INTO public.profiles (
      id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at, star, raasi, lagnam, gothram, tier, contacts_remaining, interests_remaining, food_habit, smoking, drinking
    ) VALUES (
      '00000000-0000-4000-a000-000000000155', 'TM000341', 'Hari Moorthy', 'male', '1996-02-15', 163, 'never_married', 'Hindu', 'Nadar', NULL, 'no', 'M.Sc', 'M.Sc Graduate', 'Police Officer', 'Police Officer Details', '₹10 Lakhs - ₹15 Lakhs', 'Self Employed', 'Erode', 'Erode', 'Hi, I am Hari. I have completed my M.Sc and am currently working as a Police Officer at Self Employed in Erode. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'joint', 'rich', true, false, true, 100, NOW() - INTERVAL '7 days', 'Rohini', 'Thulaam', 'Thulaam', 'Siva', 'free', 5, 5, 'vegetarian', 'no', 'no'
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
      '00000000-0000-4000-a000-000000000156', 'TM000342', 'Kayalvizhi Kumar', 'female', '1990-09-26', 159, 'divorced', 'Hindu', 'Adi Dravida', 'Adi Dravida subcaste', 'no', 'M.C.A', 'M.C.A Graduate', 'Dentist', 'Dentist Details', '₹15 Lakhs - ₹20 Lakhs', 'Infosys', 'Tiruppur', 'Tiruppur', 'Hi, I am Kayalvizhi. I have completed my M.C.A and am currently working as a Dentist at Infosys in Tiruppur. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'middle_class', true, false, true, 100, NOW() - INTERVAL '8 days', 'Bharani', 'Viruchigam', 'Kumbam', 'Atri', 'free', 5, 5, 'vegetarian', 'no', 'no'
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
      '00000000-0000-4000-a000-000000000157', 'TM000343', 'Mohan Samy', 'male', '1991-12-13', 180, 'never_married', 'Muslim', 'Rawther', 'Rawther subcaste', 'no', 'M.A', 'M.A Graduate', 'Auditor', 'Auditor Details', '₹15 Lakhs - ₹20 Lakhs', 'Wipro', 'Tiruppur', 'Tiruppur', 'Hi, I am Mohan. I have completed my M.A and am currently working as a Auditor at Wipro in Tiruppur. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'middle_class', false, false, true, 100, NOW() - INTERVAL '10 days', 'Chitra', 'Mesham', 'Kanni', 'Vashishta', 'free', 5, 5, 'vegetarian', 'no', 'no'
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
      '00000000-0000-4000-a000-000000000158', 'TM000344', 'Dharshini Lingam', 'female', '2004-12-13', 171, 'never_married', 'Hindu', 'Brahmin - Iyengar', 'Brahmin - Iyengar subcaste', 'no', 'M.Com', 'M.Com Graduate', 'Pharmacist', 'Pharmacist Details', '₹7 Lakhs - ₹10 Lakhs', 'TCS', 'Thoothukudi', 'Tuticorin', 'Hi, I am Dharshini. I have completed my M.Com and am currently working as a Pharmacist at TCS in Thoothukudi. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'middle_class', true, true, true, 100, NOW() - INTERVAL '5 days', 'Poorvashadha', 'Kumbam', 'Simham', 'Atri', 'gold', 50, 100, 'vegetarian', 'no', 'no'
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
      '00000000-0000-4000-a000-000000000159', 'TM000345', 'Siva Moorthy', 'male', '1995-12-07', 174, 'divorced', 'Hindu', 'Adi Dravida', NULL, 'yes', 'B.Com', 'B.Com Graduate', 'College Professor', 'College Professor Details', '₹15 Lakhs - ₹20 Lakhs', 'Self Employed', 'Vellore', 'Vellore', 'Hi, I am Siva. I have completed my B.Com and am currently working as a College Professor at Self Employed in Vellore. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'middle_class', true, false, true, 100, NOW() - INTERVAL '0 days', 'Pushya', 'Kumbam', 'Mithunam', 'Kasyapa', 'free', 5, 5, 'vegetarian', 'no', 'no'
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
      '00000000-0000-4000-a000-00000000015a', 'TM000346', 'Divya Balan', 'female', '2005-07-07', 165, 'divorced', 'Hindu', 'Vishwakarma', NULL, 'no', 'M.B.B.S', 'M.B.B.S Graduate', 'Bank Manager', 'Bank Manager Details', '₹3 Lakhs - ₹5 Lakhs', 'Zoho', 'Coimbatore', 'Coimbatore', 'Hi, I am Divya. I have completed my M.B.B.S and am currently working as a Bank Manager at Zoho in Coimbatore. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'upper_middle_class', true, true, true, 100, NOW() - INTERVAL '0 days', 'Arudra', 'Rishabam', 'Thulaam', 'Vishnu', 'gold', 50, 100, 'vegetarian', 'no', 'no'
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
      '00000000-0000-4000-a000-00000000015b', 'TM000347', 'Ramakrishnan Krishnan', 'male', '1993-05-20', 182, 'never_married', 'Christian', 'Protestant Christian', 'Protestant Christian subcaste', 'yes', 'B.Sc', 'B.Sc Graduate', 'Doctor', 'Doctor Details', '₹7 Lakhs - ₹10 Lakhs', 'Accenture', 'Tirunelveli', 'Tirunelveli', 'Hi, I am Ramakrishnan. I have completed my B.Sc and am currently working as a Doctor at Accenture in Tirunelveli. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'middle_class', false, true, true, 100, NOW() - INTERVAL '5 days', 'Uttaraphalguni', 'Dhanusu', 'Thulaam', 'Gautama', 'gold', 50, 100, 'vegetarian', 'no', 'no'
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
      '00000000-0000-4000-a000-00000000015c', 'TM000348', 'Rekha Nathan', 'female', '1996-10-11', 151, 'never_married', 'Hindu', 'Brahmin - Iyer', NULL, 'yes', 'Ph.D', 'Ph.D Graduate', 'Mechanical Engineer', 'Mechanical Engineer Details', '₹5 Lakhs - ₹7 Lakhs', 'Wipro', 'Erode', 'Erode', 'Hi, I am Rekha. I have completed my Ph.D and am currently working as a Mechanical Engineer at Wipro in Erode. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'upper_middle_class', false, false, true, 100, NOW() - INTERVAL '6 days', 'Shravana', 'Kadagam', 'Kadagam', 'Atri', 'free', 5, 5, 'vegetarian', 'no', 'no'
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
      '00000000-0000-4000-a000-00000000015d', 'TM000349', 'Anbarasan Lingam', 'male', '1995-12-13', 175, 'never_married', 'Hindu', 'Gounder', 'Gounder subcaste', 'no', 'M.Com', 'M.Com Graduate', 'Government Officer', 'Government Officer Details', '₹5 Lakhs - ₹7 Lakhs', 'TCS', 'Madurai', 'Madurai', 'Hi, I am Anbarasan. I have completed my M.Com and am currently working as a Government Officer at TCS in Madurai. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'middle_class', true, false, true, 100, NOW() - INTERVAL '5 days', 'Uttarabhadrapada', 'Dhanusu', 'Simham', 'Vishnu', 'free', 5, 5, 'vegetarian', 'no', 'no'
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
      '00000000-0000-4000-a000-00000000015e', 'TM000350', 'Rajeshwari Shankar', 'female', '1995-10-07', 160, 'divorced', 'Hindu', 'Vellalar', 'Vellalar subcaste', 'no', 'Ph.D', 'Ph.D Graduate', 'Police Officer', 'Police Officer Details', '₹5 Lakhs - ₹7 Lakhs', 'Government Service', 'Kanchipuram', 'Kanchipuram', 'Hi, I am Rajeshwari. I have completed my Ph.D and am currently working as a Police Officer at Government Service in Kanchipuram. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'upper_middle_class', true, false, true, 100, NOW() - INTERVAL '4 days', 'Hasta', 'Viruchigam', 'Meenam', 'Bharadwaj', 'free', 5, 5, 'vegetarian', 'no', 'no'
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
      '00000000-0000-4000-a000-00000000015f', 'TM000351', 'Jayakumar Murthy', 'male', '1989-07-16', 179, 'divorced', 'Hindu', 'Naidu', 'Naidu subcaste', 'yes', 'Ph.D', 'Ph.D Graduate', 'Doctor', 'Doctor Details', '₹10 Lakhs - ₹15 Lakhs', 'Self Employed', 'Coimbatore', 'Coimbatore', 'Hi, I am Jayakumar. I have completed my Ph.D and am currently working as a Doctor at Self Employed in Coimbatore. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'upper_middle_class', false, true, true, 100, NOW() - INTERVAL '2 days', 'Moola', 'Rishabam', 'Rishabam', 'Atri', 'gold', 50, 100, 'vegetarian', 'no', 'no'
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
      '00000000-0000-4000-a000-000000000160', 'TM000352', 'Chitra Lingam', 'female', '1988-03-21', 153, 'never_married', 'Hindu', 'Kallar', 'Kallar subcaste', 'no', 'Ph.D', 'Ph.D Graduate', 'Doctor', 'Doctor Details', '₹20 Lakhs+', 'Accenture', 'Erode', 'Erode', 'Hi, I am Chitra. I have completed my Ph.D and am currently working as a Doctor at Accenture in Erode. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'upper_middle_class', true, false, true, 100, NOW() - INTERVAL '1 days', 'Poorvaphalguni', 'Magaram', 'Viruchigam', 'Siva', 'free', 5, 5, 'vegetarian', 'no', 'no'
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
      '00000000-0000-4000-a000-000000000161', 'TM000353', 'Vijay Pandian', 'male', '1998-05-06', 180, 'never_married', 'Hindu', 'Maravar', 'Maravar subcaste', 'no', 'M.A', 'M.A Graduate', 'Bank Manager', 'Bank Manager Details', '₹20 Lakhs+', 'HCL', 'Tiruppur', 'Tiruppur', 'Hi, I am Vijay. I have completed my M.A and am currently working as a Bank Manager at HCL in Tiruppur. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'joint', 'middle_class', true, false, true, 100, NOW() - INTERVAL '2 days', 'Poorvaphalguni', 'Kanni', 'Viruchigam', 'Gautama', 'free', 5, 5, 'vegetarian', 'no', 'no'
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
      '00000000-0000-4000-a000-000000000162', 'TM000354', 'Rajeshwari Lingam', 'female', '1989-04-02', 163, 'never_married', 'Hindu', 'Chettiar', 'Chettiar subcaste', 'no', 'M.C.A', 'M.C.A Graduate', 'Business Owner', 'Business Owner Details', '₹10 Lakhs - ₹15 Lakhs', 'Cognizant', 'Tiruppur', 'Tiruppur', 'Hi, I am Rajeshwari. I have completed my M.C.A and am currently working as a Business Owner at Cognizant in Tiruppur. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'upper_middle_class', true, false, true, 100, NOW() - INTERVAL '5 days', 'Chitra', 'Mesham', 'Mesham', 'Viswamitra', 'free', 5, 5, 'vegetarian', 'no', 'no'
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
      '00000000-0000-4000-a000-000000000163', 'TM000355', 'Prakash Raman', 'male', '1993-11-23', 170, 'never_married', 'Hindu', 'Sengunthar', 'Sengunthar subcaste', 'no', 'B.Sc', 'B.Sc Graduate', 'Civil Engineer', 'Civil Engineer Details', '₹3 Lakhs - ₹5 Lakhs', 'Wipro', 'Tirunelveli', 'Tirunelveli', 'Hi, I am Prakash. I have completed my B.Sc and am currently working as a Civil Engineer at Wipro in Tirunelveli. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'joint', 'middle_class', true, true, true, 100, NOW() - INTERVAL '2 days', 'Punarvasu', 'Dhanusu', 'Dhanusu', 'Gautama', 'gold', 50, 100, 'vegetarian', 'no', 'no'
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
      '00000000-0000-4000-a000-000000000164', 'TM000356', 'Dharshini Raman', 'female', '1988-07-20', 157, 'never_married', 'Hindu', 'Arunthathiyar', 'Arunthathiyar subcaste', 'no', 'B.E. / B.Tech', 'B.E. / B.Tech Graduate', 'School Teacher', 'School Teacher Details', '₹15 Lakhs - ₹20 Lakhs', 'Infosys', 'Salem', 'Salem', 'Hi, I am Dharshini. I have completed my B.E. / B.Tech and am currently working as a School Teacher at Infosys in Salem. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'upper_middle_class', true, false, true, 100, NOW() - INTERVAL '5 days', 'Punarvasu', 'Simham', 'Kumbam', 'Siva', 'free', 5, 5, 'vegetarian', 'no', 'no'
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
      '00000000-0000-4000-a000-000000000165', 'TM000357', 'Madhavan Devan', 'male', '1994-05-18', 168, 'divorced', 'Hindu', 'Arunthathiyar', 'Arunthathiyar subcaste', 'no', 'Ph.D', 'Ph.D Graduate', 'Architect', 'Architect Details', '₹7 Lakhs - ₹10 Lakhs', 'Private Practice', 'Tiruchirappalli', 'Trichy', 'Hi, I am Madhavan. I have completed my Ph.D and am currently working as a Architect at Private Practice in Tiruchirappalli. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'joint', 'middle_class', true, true, true, 100, NOW() - INTERVAL '6 days', 'Jyeshta', 'Thulaam', 'Dhanusu', 'Kasyapa', 'gold', 50, 100, 'vegetarian', 'no', 'no'
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
      '00000000-0000-4000-a000-000000000166', 'TM000358', 'Rajeshwari Moorthy', 'female', '1995-08-03', 161, 'never_married', 'Hindu', 'Chettiar', 'Chettiar subcaste', 'no', 'M.Com', 'M.Com Graduate', 'Pharmacist', 'Pharmacist Details', '₹15 Lakhs - ₹20 Lakhs', 'Wipro', 'Kanchipuram', 'Kanchipuram', 'Hi, I am Rajeshwari. I have completed my M.Com and am currently working as a Pharmacist at Wipro in Kanchipuram. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'rich', true, false, true, 100, NOW() - INTERVAL '1 days', 'Rohini', 'Mesham', 'Kanni', 'Gautama', 'free', 5, 5, 'vegetarian', 'no', 'no'
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
      '00000000-0000-4000-a000-000000000167', 'TM000359', 'Mohan Moorthy', 'male', '2005-04-24', 172, 'divorced', 'Muslim', 'Marakayar', 'Marakayar subcaste', 'no', 'M.Com', 'M.Com Graduate', 'College Professor', 'College Professor Details', '₹3 Lakhs - ₹5 Lakhs', 'Infosys', 'Vellore', 'Vellore', 'Hi, I am Mohan. I have completed my M.Com and am currently working as a College Professor at Infosys in Vellore. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'joint', 'upper_middle_class', false, false, true, 100, NOW() - INTERVAL '8 days', 'Swati', 'Mesham', 'Mesham', 'Siva', 'free', 5, 5, 'vegetarian', 'no', 'no'
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
      '00000000-0000-4000-a000-000000000168', 'TM000360', 'Ramani Shankar', 'female', '2002-02-15', 163, 'never_married', 'Hindu', 'Chettiar', NULL, 'no', 'B.Sc', 'B.Sc Graduate', 'Mechanical Engineer', 'Mechanical Engineer Details', '₹7 Lakhs - ₹10 Lakhs', 'HCL', 'Vellore', 'Vellore', 'Hi, I am Ramani. I have completed my B.Sc and am currently working as a Mechanical Engineer at HCL in Vellore. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'joint', 'middle_class', true, false, true, 100, NOW() - INTERVAL '8 days', 'Pushya', 'Rishabam', 'Mithunam', 'Agastya', 'free', 5, 5, 'vegetarian', 'no', 'no'
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
      '00000000-0000-4000-a000-000000000169', 'TM000361', 'Thirumal Swamy', 'male', '2002-05-22', 173, 'never_married', 'Hindu', 'Thevar', NULL, 'no', 'B.Sc', 'B.Sc Graduate', 'Auditor', 'Auditor Details', '₹20 Lakhs+', 'Private Practice', 'Tiruchirappalli', 'Trichy', 'Hi, I am Thirumal. I have completed my B.Sc and am currently working as a Auditor at Private Practice in Tiruchirappalli. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'upper_middle_class', true, false, true, 100, NOW() - INTERVAL '1 days', 'Anuradha', 'Magaram', 'Kumbam', 'Atri', 'free', 5, 5, 'vegetarian', 'no', 'no'
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
      '00000000-0000-4000-a000-00000000016a', 'TM000362', 'Pooja Mani', 'female', '1988-06-27', 163, 'never_married', 'Christian', 'Protestant Christian', 'Protestant Christian subcaste', 'no', 'B.Ed', 'B.Ed Graduate', 'School Teacher', 'School Teacher Details', '₹20 Lakhs+', 'Government Service', 'Vellore', 'Vellore', 'Hi, I am Pooja. I have completed my B.Ed and am currently working as a School Teacher at Government Service in Vellore. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'joint', 'middle_class', true, true, true, 100, NOW() - INTERVAL '2 days', 'Bharani', 'Viruchigam', 'Magaram', 'Kasyapa', 'gold', 50, 100, 'vegetarian', 'no', 'no'
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
      '00000000-0000-4000-a000-00000000016b', 'TM000363', 'Siddharth Mani', 'male', '1993-09-12', 179, 'never_married', 'Hindu', 'Sengunthar', 'Sengunthar subcaste', 'no', 'M.B.B.S', 'M.B.B.S Graduate', 'Advocate', 'Advocate Details', '₹20 Lakhs+', 'Private Practice', 'Tirunelveli', 'Tirunelveli', 'Hi, I am Siddharth. I have completed my M.B.B.S and am currently working as a Advocate at Private Practice in Tirunelveli. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'joint', 'middle_class', true, true, true, 100, NOW() - INTERVAL '10 days', 'Poorvaphalguni', 'Kadagam', 'Kanni', 'Vishnu', 'gold', 50, 100, 'vegetarian', 'no', 'no'
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
      '00000000-0000-4000-a000-00000000016c', 'TM000364', 'Pavithra Swamy', 'female', '1997-10-18', 156, 'never_married', 'Muslim', 'Sunni Muslim', 'Sunni Muslim subcaste', 'no', 'B.E. / B.Tech', 'B.E. / B.Tech Graduate', 'Software Engineer', 'Software Engineer Details', '₹7 Lakhs - ₹10 Lakhs', 'Wipro', 'Chennai', 'Chennai', 'Hi, I am Pavithra. I have completed my B.E. / B.Tech and am currently working as a Software Engineer at Wipro in Chennai. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'joint', 'upper_middle_class', true, false, true, 100, NOW() - INTERVAL '4 days', 'Arudra', 'Dhanusu', 'Meenam', 'Bharadwaj', 'free', 5, 5, 'vegetarian', 'no', 'no'
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
      '00000000-0000-4000-a000-00000000016d', 'TM000365', 'Kannan Mani', 'male', '1996-10-10', 176, 'never_married', 'Hindu', 'Pillai', 'Pillai subcaste', 'no', 'B.Sc', 'B.Sc Graduate', 'Auditor', 'Auditor Details', '₹15 Lakhs - ₹20 Lakhs', 'Private Practice', 'Tirunelveli', 'Tirunelveli', 'Hi, I am Kannan. I have completed my B.Sc and am currently working as a Auditor at Private Practice in Tirunelveli. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'rich', false, false, true, 100, NOW() - INTERVAL '8 days', 'Mirgashira', 'Dhanusu', 'Mesham', 'Angirasa', 'free', 5, 5, 'vegetarian', 'no', 'no'
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
      '00000000-0000-4000-a000-00000000016e', 'TM000366', 'Pooja Sundaram', 'female', '1992-04-12', 159, 'never_married', 'Hindu', 'Brahmin - Iyengar', NULL, 'yes', 'B.A', 'B.A Graduate', 'School Teacher', 'School Teacher Details', '₹5 Lakhs - ₹7 Lakhs', 'Accenture', 'Vellore', 'Vellore', 'Hi, I am Pooja. I have completed my B.A and am currently working as a School Teacher at Accenture in Vellore. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'upper_middle_class', true, true, true, 100, NOW() - INTERVAL '5 days', 'Mirgashira', 'Meenam', 'Mithunam', 'Atri', 'gold', 50, 100, 'vegetarian', 'no', 'no'
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
      '00000000-0000-4000-a000-00000000016f', 'TM000367', 'Viswanathan Naicker', 'male', '1993-03-04', 187, 'never_married', 'Hindu', 'Arunthathiyar', 'Arunthathiyar subcaste', 'no', 'M.A', 'M.A Graduate', 'Business Owner', 'Business Owner Details', '₹15 Lakhs - ₹20 Lakhs', 'Private Practice', 'Tiruppur', 'Tiruppur', 'Hi, I am Viswanathan. I have completed my M.A and am currently working as a Business Owner at Private Practice in Tiruppur. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'middle_class', true, false, true, 100, NOW() - INTERVAL '3 days', 'Poorvaphalguni', 'Mithunam', 'Dhanusu', 'Vashishta', 'free', 5, 5, 'vegetarian', 'no', 'no'
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
      '00000000-0000-4000-a000-000000000170', 'TM000368', 'Sneha Mani', 'female', '2001-04-18', 174, 'never_married', 'Hindu', 'Devendra Kula Vellalar', NULL, 'no', 'M.Sc', 'M.Sc Graduate', 'Software Engineer', 'Software Engineer Details', '₹10 Lakhs - ₹15 Lakhs', 'Government Service', 'Kanchipuram', 'Kanchipuram', 'Hi, I am Sneha. I have completed my M.Sc and am currently working as a Software Engineer at Government Service in Kanchipuram. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'joint', 'upper_middle_class', false, false, true, 100, NOW() - INTERVAL '9 days', 'Aslesha', 'Meenam', 'Dhanusu', 'Viswamitra', 'free', 5, 5, 'vegetarian', 'no', 'no'
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
      '00000000-0000-4000-a000-000000000171', 'TM000369', 'Murugan Mani', 'male', '1989-06-01', 188, 'never_married', 'Hindu', 'Vishwakarma', NULL, 'no', 'M.A', 'M.A Graduate', 'Advocate', 'Advocate Details', '₹20 Lakhs+', 'Government Service', 'Erode', 'Erode', 'Hi, I am Murugan. I have completed my M.A and am currently working as a Advocate at Government Service in Erode. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'middle_class', false, true, true, 100, NOW() - INTERVAL '0 days', 'Shravana', 'Rishabam', 'Meenam', 'Viswamitra', 'gold', 50, 100, 'vegetarian', 'no', 'no'
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
      '00000000-0000-4000-a000-000000000172', 'TM000370', 'Banumathi Kumar', 'female', '1999-09-20', 164, 'never_married', 'Hindu', 'Mudaliar', NULL, 'no', 'B.Com', 'B.Com Graduate', 'Mechanical Engineer', 'Mechanical Engineer Details', '₹15 Lakhs - ₹20 Lakhs', 'Cognizant', 'Thoothukudi', 'Tuticorin', 'Hi, I am Banumathi. I have completed my B.Com and am currently working as a Mechanical Engineer at Cognizant in Thoothukudi. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'joint', 'upper_middle_class', true, false, true, 100, NOW() - INTERVAL '8 days', 'Krittika', 'Mesham', 'Mithunam', 'Agastya', 'free', 5, 5, 'vegetarian', 'no', 'no'
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
      '00000000-0000-4000-a000-000000000173', 'TM000371', 'Ranjith Moorthy', 'male', '1988-08-05', 180, 'never_married', 'Christian', 'Protestant Christian', NULL, 'no', 'M.Com', 'M.Com Graduate', 'Business Owner', 'Business Owner Details', '₹20 Lakhs+', 'Infosys', 'Madurai', 'Madurai', 'Hi, I am Ranjith. I have completed my M.Com and am currently working as a Business Owner at Infosys in Madurai. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'upper_middle_class', true, false, true, 100, NOW() - INTERVAL '8 days', 'Revati', 'Simham', 'Magaram', 'Vashishta', 'free', 5, 5, 'vegetarian', 'no', 'no'
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
      '00000000-0000-4000-a000-000000000174', 'TM000372', 'Yazhini Selvan', 'female', '1994-05-08', 168, 'never_married', 'Hindu', 'Nadar', NULL, 'no', 'B.E. / B.Tech', 'B.E. / B.Tech Graduate', 'Advocate', 'Advocate Details', '₹3 Lakhs - ₹5 Lakhs', 'Infosys', 'Tiruchirappalli', 'Trichy', 'Hi, I am Yazhini. I have completed my B.E. / B.Tech and am currently working as a Advocate at Infosys in Tiruchirappalli. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'upper_middle_class', true, true, true, 100, NOW() - INTERVAL '1 days', 'Punarvasu', 'Mesham', 'Meenam', 'Vishnu', 'gold', 50, 100, 'vegetarian', 'no', 'no'
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
      '00000000-0000-4000-a000-000000000175', 'TM000373', 'Chinnasamy Krishnan', 'male', '1994-12-27', 169, 'never_married', 'Hindu', 'Pillai', 'Pillai subcaste', 'no', 'M.A', 'M.A Graduate', 'Bank Manager', 'Bank Manager Details', '₹15 Lakhs - ₹20 Lakhs', 'Cognizant', 'Kanchipuram', 'Kanchipuram', 'Hi, I am Chinnasamy. I have completed my M.A and am currently working as a Bank Manager at Cognizant in Kanchipuram. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'joint', 'middle_class', true, false, true, 100, NOW() - INTERVAL '5 days', 'Chitra', 'Meenam', 'Kadagam', 'Viswamitra', 'free', 5, 5, 'vegetarian', 'no', 'no'
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
      '00000000-0000-4000-a000-000000000176', 'TM000374', 'Gowri Velan', 'female', '1992-11-08', 171, 'never_married', 'Muslim', 'Sunni Muslim', NULL, 'no', 'M.B.B.S', 'M.B.B.S Graduate', 'Doctor', 'Doctor Details', '₹10 Lakhs - ₹15 Lakhs', 'Cognizant', 'Salem', 'Salem', 'Hi, I am Gowri. I have completed my M.B.B.S and am currently working as a Doctor at Cognizant in Salem. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'upper_middle_class', true, false, true, 100, NOW() - INTERVAL '5 days', 'Moola', 'Meenam', 'Mithunam', 'Kasyapa', 'free', 5, 5, 'vegetarian', 'no', 'no'
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
      '00000000-0000-4000-a000-000000000177', 'TM000375', 'Muthu Nathan', 'male', '2000-03-19', 163, 'divorced', 'Hindu', 'Arunthathiyar', 'Arunthathiyar subcaste', 'yes', 'M.A', 'M.A Graduate', 'Architect', 'Architect Details', '₹20 Lakhs+', 'Self Employed', 'Tiruppur', 'Tiruppur', 'Hi, I am Muthu. I have completed my M.A and am currently working as a Architect at Self Employed in Tiruppur. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'rich', false, false, true, 100, NOW() - INTERVAL '1 days', 'Revati', 'Meenam', 'Kadagam', 'Vishnu', 'free', 5, 5, 'vegetarian', 'no', 'no'
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
      '00000000-0000-4000-a000-000000000178', 'TM000376', 'Swetha Pandian', 'female', '2005-03-13', 159, 'never_married', 'Hindu', 'Vanniyar', NULL, 'yes', 'B.Com', 'B.Com Graduate', 'Software Engineer', 'Software Engineer Details', '₹10 Lakhs - ₹15 Lakhs', 'TCS', 'Vellore', 'Vellore', 'Hi, I am Swetha. I have completed my B.Com and am currently working as a Software Engineer at TCS in Vellore. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'middle_class', false, true, true, 100, NOW() - INTERVAL '5 days', 'Anuradha', 'Kumbam', 'Mithunam', 'Viswamitra', 'gold', 50, 100, 'vegetarian', 'no', 'no'
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
      '00000000-0000-4000-a000-000000000179', 'TM000377', 'Sakthi Selvan', 'male', '1994-07-22', 183, 'divorced', 'Hindu', 'Nadar', NULL, 'yes', 'Ph.D', 'Ph.D Graduate', 'Pharmacist', 'Pharmacist Details', '₹3 Lakhs - ₹5 Lakhs', 'Self Employed', 'Kanchipuram', 'Kanchipuram', 'Hi, I am Sakthi. I have completed my Ph.D and am currently working as a Pharmacist at Self Employed in Kanchipuram. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'upper_middle_class', true, false, true, 100, NOW() - INTERVAL '3 days', 'Chitra', 'Viruchigam', 'Magaram', 'Viswamitra', 'free', 5, 5, 'vegetarian', 'no', 'no'
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
      '00000000-0000-4000-a000-00000000017a', 'TM000378', 'Chitra Lingam', 'female', '1988-04-02', 158, 'never_married', 'Hindu', 'Brahmin - Iyer', 'Brahmin - Iyer subcaste', 'no', 'B.Ed', 'B.Ed Graduate', 'Doctor', 'Doctor Details', '₹15 Lakhs - ₹20 Lakhs', 'Private Practice', 'Madurai', 'Madurai', 'Hi, I am Chitra. I have completed my B.Ed and am currently working as a Doctor at Private Practice in Madurai. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'rich', false, false, true, 100, NOW() - INTERVAL '5 days', 'Rohini', 'Viruchigam', 'Viruchigam', 'Angirasa', 'free', 5, 5, 'vegetarian', 'no', 'no'
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
      '00000000-0000-4000-a000-00000000017b', 'TM000379', 'Vignesh Selvan', 'male', '1990-05-05', 183, 'never_married', 'Hindu', 'Chettiar', 'Chettiar subcaste', 'yes', 'Ph.D', 'Ph.D Graduate', 'Dentist', 'Dentist Details', '₹5 Lakhs - ₹7 Lakhs', 'Zoho', 'Tiruchirappalli', 'Trichy', 'Hi, I am Vignesh. I have completed my Ph.D and am currently working as a Dentist at Zoho in Tiruchirappalli. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'joint', 'rich', true, false, true, 100, NOW() - INTERVAL '3 days', 'Shatabhisha', 'Thulaam', 'Magaram', 'Kasyapa', 'free', 5, 5, 'vegetarian', 'no', 'no'
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
      '00000000-0000-4000-a000-00000000017c', 'TM000380', 'Kokila Samy', 'female', '1997-05-06', 153, 'divorced', 'Hindu', 'Kallar', NULL, 'no', 'Ph.D', 'Ph.D Graduate', 'Bank Manager', 'Bank Manager Details', '₹20 Lakhs+', 'Self Employed', 'Coimbatore', 'Coimbatore', 'Hi, I am Kokila. I have completed my Ph.D and am currently working as a Bank Manager at Self Employed in Coimbatore. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'rich', true, false, true, 100, NOW() - INTERVAL '4 days', 'Moola', 'Viruchigam', 'Kumbam', 'Harita', 'free', 5, 5, 'vegetarian', 'no', 'no'
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
      '00000000-0000-4000-a000-00000000017d', 'TM000381', 'Hari Krishnan', 'male', '1993-01-16', 162, 'never_married', 'Hindu', 'Vellalar', 'Vellalar subcaste', 'no', 'B.A', 'B.A Graduate', 'Government Officer', 'Government Officer Details', '₹20 Lakhs+', 'TCS', 'Tirunelveli', 'Tirunelveli', 'Hi, I am Hari. I have completed my B.A and am currently working as a Government Officer at TCS in Tirunelveli. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'middle_class', false, false, true, 100, NOW() - INTERVAL '1 days', 'Uttarabhadrapada', 'Mithunam', 'Viruchigam', 'Agastya', 'free', 5, 5, 'vegetarian', 'no', 'no'
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
      '00000000-0000-4000-a000-00000000017e', 'TM000382', 'Janani Samy', 'female', '1992-05-27', 154, 'never_married', 'Hindu', 'Sengunthar', 'Sengunthar subcaste', 'no', 'M.B.A', 'M.B.A Graduate', 'College Professor', 'College Professor Details', '₹20 Lakhs+', 'Infosys', 'Erode', 'Erode', 'Hi, I am Janani. I have completed my M.B.A and am currently working as a College Professor at Infosys in Erode. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'upper_middle_class', false, false, true, 100, NOW() - INTERVAL '6 days', 'Vishakha', 'Thulaam', 'Mithunam', 'Agastya', 'free', 5, 5, 'vegetarian', 'no', 'no'
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
      '00000000-0000-4000-a000-00000000017f', 'TM000383', 'Ramesh Nathan', 'male', '1998-12-17', 166, 'never_married', 'Hindu', 'Devendra Kula Vellalar', NULL, 'yes', 'B.A', 'B.A Graduate', 'Government Officer', 'Government Officer Details', '₹7 Lakhs - ₹10 Lakhs', 'Infosys', 'Thanjavur', 'Thanjavur', 'Hi, I am Ramesh. I have completed my B.A and am currently working as a Government Officer at Infosys in Thanjavur. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'middle_class', false, false, true, 100, NOW() - INTERVAL '6 days', 'Poorvabhadrapada', 'Simham', 'Mesham', 'Siva', 'free', 5, 5, 'vegetarian', 'no', 'no'
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
      '00000000-0000-4000-a000-000000000180', 'TM000384', 'Gayathri Balan', 'female', '1991-12-28', 171, 'never_married', 'Hindu', 'Arunthathiyar', 'Arunthathiyar subcaste', 'no', 'M.C.A', 'M.C.A Graduate', 'Advocate', 'Advocate Details', '₹5 Lakhs - ₹7 Lakhs', 'HCL', 'Coimbatore', 'Coimbatore', 'Hi, I am Gayathri. I have completed my M.C.A and am currently working as a Advocate at HCL in Coimbatore. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'middle_class', true, false, true, 100, NOW() - INTERVAL '6 days', 'Poorvabhadrapada', 'Kanni', 'Dhanusu', 'Viswamitra', 'free', 5, 5, 'vegetarian', 'no', 'no'
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
      '00000000-0000-4000-a000-000000000181', 'TM000385', 'Kabilan Murthy', 'male', '1990-01-22', 179, 'never_married', 'Hindu', 'Yadav', 'Yadav subcaste', 'yes', 'M.Com', 'M.Com Graduate', 'Government Officer', 'Government Officer Details', '₹3 Lakhs - ₹5 Lakhs', 'Self Employed', 'Thanjavur', 'Thanjavur', 'Hi, I am Kabilan. I have completed my M.Com and am currently working as a Government Officer at Self Employed in Thanjavur. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'joint', 'rich', true, false, true, 100, NOW() - INTERVAL '10 days', 'Vishakha', 'Kumbam', 'Mithunam', 'Bharadwaj', 'free', 5, 5, 'vegetarian', 'no', 'no'
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
      '00000000-0000-4000-a000-000000000182', 'TM000386', 'Abirami Murthy', 'female', '1988-04-26', 161, 'never_married', 'Muslim', 'Marakayar', NULL, 'yes', 'B.Com', 'B.Com Graduate', 'Auditor', 'Auditor Details', '₹5 Lakhs - ₹7 Lakhs', 'Private Practice', 'Vellore', 'Vellore', 'Hi, I am Abirami. I have completed my B.Com and am currently working as a Auditor at Private Practice in Vellore. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'middle_class', false, false, true, 100, NOW() - INTERVAL '9 days', 'Vishakha', 'Kadagam', 'Kumbam', 'Atri', 'free', 5, 5, 'vegetarian', 'no', 'no'
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
      '00000000-0000-4000-a000-000000000183', 'TM000387', 'Ramesh Mani', 'male', '2005-12-24', 165, 'never_married', 'Hindu', 'Vellalar', 'Vellalar subcaste', 'no', 'Ph.D', 'Ph.D Graduate', 'Bank Manager', 'Bank Manager Details', '₹15 Lakhs - ₹20 Lakhs', 'Zoho', 'Vellore', 'Vellore', 'Hi, I am Ramesh. I have completed my Ph.D and am currently working as a Bank Manager at Zoho in Vellore. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'middle_class', true, false, true, 100, NOW() - INTERVAL '7 days', 'Pushya', 'Dhanusu', 'Viruchigam', 'Kasyapa', 'free', 5, 5, 'vegetarian', 'no', 'no'
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
      '00000000-0000-4000-a000-000000000184', 'TM000388', 'Oviya Sundaram', 'female', '2002-03-24', 150, 'divorced', 'Hindu', 'Naicker', NULL, 'no', 'M.Sc', 'M.Sc Graduate', 'Dentist', 'Dentist Details', '₹5 Lakhs - ₹7 Lakhs', 'Government Service', 'Tirunelveli', 'Tirunelveli', 'Hi, I am Oviya. I have completed my M.Sc and am currently working as a Dentist at Government Service in Tirunelveli. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'middle_class', true, false, true, 100, NOW() - INTERVAL '4 days', 'Mirgashira', 'Dhanusu', 'Magaram', 'Harita', 'free', 5, 5, 'vegetarian', 'no', 'no'
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
      '00000000-0000-4000-a000-000000000185', 'TM000389', 'Sundar Samy', 'male', '1998-11-15', 180, 'never_married', 'Hindu', 'Pillai', 'Pillai subcaste', 'no', 'M.B.B.S', 'M.B.B.S Graduate', 'Pharmacist', 'Pharmacist Details', '₹5 Lakhs - ₹7 Lakhs', 'Accenture', 'Thoothukudi', 'Tuticorin', 'Hi, I am Sundar. I have completed my M.B.B.S and am currently working as a Pharmacist at Accenture in Thoothukudi. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'joint', 'middle_class', true, false, true, 100, NOW() - INTERVAL '4 days', 'Poorvaphalguni', 'Simham', 'Thulaam', 'Angirasa', 'free', 5, 5, 'vegetarian', 'no', 'no'
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
      '00000000-0000-4000-a000-000000000186', 'TM000390', 'Rekha Sundaram', 'female', '2004-02-02', 151, 'never_married', 'Hindu', 'Maravar', 'Maravar subcaste', 'yes', 'M.C.A', 'M.C.A Graduate', 'Dentist', 'Dentist Details', '₹5 Lakhs - ₹7 Lakhs', 'Accenture', 'Tiruchirappalli', 'Trichy', 'Hi, I am Rekha. I have completed my M.C.A and am currently working as a Dentist at Accenture in Tiruchirappalli. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'joint', 'middle_class', true, true, true, 100, NOW() - INTERVAL '8 days', 'Mirgashira', 'Mesham', 'Kadagam', 'Murugan', 'gold', 50, 100, 'vegetarian', 'no', 'no'
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
      '00000000-0000-4000-a000-000000000187', 'TM000391', 'Thirumal Shankar', 'male', '1999-07-21', 179, 'divorced', 'Hindu', 'Nadar', NULL, 'no', 'M.B.B.S', 'M.B.B.S Graduate', 'HR Specialist', 'HR Specialist Details', '₹3 Lakhs - ₹5 Lakhs', 'Self Employed', 'Coimbatore', 'Coimbatore', 'Hi, I am Thirumal. I have completed my M.B.B.S and am currently working as a HR Specialist at Self Employed in Coimbatore. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'upper_middle_class', true, false, true, 100, NOW() - INTERVAL '8 days', 'Uttarachadha', 'Mesham', 'Mesham', 'Vishnu', 'free', 5, 5, 'vegetarian', 'no', 'no'
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
      '00000000-0000-4000-a000-000000000188', 'TM000392', 'Nandhini Naicker', 'female', '2004-06-15', 169, 'never_married', 'Christian', 'RC Christian', 'RC Christian subcaste', 'no', 'B.Ed', 'B.Ed Graduate', 'Business Owner', 'Business Owner Details', '₹15 Lakhs - ₹20 Lakhs', 'Government Service', 'Thoothukudi', 'Tuticorin', 'Hi, I am Nandhini. I have completed my B.Ed and am currently working as a Business Owner at Government Service in Thoothukudi. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'joint', 'rich', true, false, true, 100, NOW() - INTERVAL '6 days', 'Chitra', 'Dhanusu', 'Magaram', 'Murugan', 'free', 5, 5, 'vegetarian', 'no', 'no'
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
      '00000000-0000-4000-a000-000000000189', 'TM000393', 'Manikandan Moorthy', 'male', '2002-04-21', 169, 'never_married', 'Hindu', 'Adi Dravida', NULL, 'no', 'B.Ed', 'B.Ed Graduate', 'College Professor', 'College Professor Details', '₹7 Lakhs - ₹10 Lakhs', 'Infosys', 'Tirunelveli', 'Tirunelveli', 'Hi, I am Manikandan. I have completed my B.Ed and am currently working as a College Professor at Infosys in Tirunelveli. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'middle_class', true, false, true, 100, NOW() - INTERVAL '5 days', 'Krittika', 'Mesham', 'Meenam', 'Agastya', 'free', 5, 5, 'vegetarian', 'no', 'no'
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
      '00000000-0000-4000-a000-00000000018a', 'TM000394', 'Rajeshwari Raman', 'female', '1990-05-25', 163, 'never_married', 'Hindu', 'Thevar', 'Thevar subcaste', 'no', 'Ph.D', 'Ph.D Graduate', 'HR Specialist', 'HR Specialist Details', '₹3 Lakhs - ₹5 Lakhs', 'Government Service', 'Madurai', 'Madurai', 'Hi, I am Rajeshwari. I have completed my Ph.D and am currently working as a HR Specialist at Government Service in Madurai. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'rich', true, false, true, 100, NOW() - INTERVAL '8 days', 'Pushya', 'Rishabam', 'Magaram', 'Gautama', 'free', 5, 5, 'vegetarian', 'no', 'no'
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
      '00000000-0000-4000-a000-00000000018b', 'TM000395', 'Muthu Lingam', 'male', '1989-02-07', 163, 'never_married', 'Hindu', 'Chettiar', 'Chettiar subcaste', 'no', 'M.C.A', 'M.C.A Graduate', 'HR Specialist', 'HR Specialist Details', '₹7 Lakhs - ₹10 Lakhs', 'Wipro', 'Vellore', 'Vellore', 'Hi, I am Muthu. I have completed my M.C.A and am currently working as a HR Specialist at Wipro in Vellore. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'upper_middle_class', true, false, true, 100, NOW() - INTERVAL '3 days', 'Mirgashira', 'Kadagam', 'Mesham', 'Atri', 'free', 5, 5, 'vegetarian', 'no', 'no'
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
      '00000000-0000-4000-a000-00000000018c', 'TM000396', 'Rekha Lingam', 'female', '2002-05-21', 158, 'divorced', 'Hindu', 'Thevar', 'Thevar subcaste', 'no', 'M.Com', 'M.Com Graduate', 'College Professor', 'College Professor Details', '₹3 Lakhs - ₹5 Lakhs', 'Infosys', 'Thoothukudi', 'Tuticorin', 'Hi, I am Rekha. I have completed my M.Com and am currently working as a College Professor at Infosys in Thoothukudi. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'joint', 'middle_class', true, true, true, 100, NOW() - INTERVAL '6 days', 'Chitra', 'Kadagam', 'Simham', 'Siva', 'gold', 50, 100, 'vegetarian', 'no', 'no'
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
      '00000000-0000-4000-a000-00000000018d', 'TM000397', 'Karthik Lingam', 'male', '1994-01-24', 167, 'never_married', 'Hindu', 'Thevar', NULL, 'no', 'B.Ed', 'B.Ed Graduate', 'Advocate', 'Advocate Details', '₹3 Lakhs - ₹5 Lakhs', 'Government Service', 'Thanjavur', 'Thanjavur', 'Hi, I am Karthik. I have completed my B.Ed and am currently working as a Advocate at Government Service in Thanjavur. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'rich', true, false, true, 100, NOW() - INTERVAL '8 days', 'Vishakha', 'Magaram', 'Kumbam', 'Murugan', 'free', 5, 5, 'vegetarian', 'no', 'no'
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
      '00000000-0000-4000-a000-00000000018e', 'TM000398', 'Preethi Naicker', 'female', '1999-04-18', 168, 'never_married', 'Hindu', 'Naicker', NULL, 'no', 'B.Com', 'B.Com Graduate', 'Civil Engineer', 'Civil Engineer Details', '₹15 Lakhs - ₹20 Lakhs', 'Self Employed', 'Thanjavur', 'Thanjavur', 'Hi, I am Preethi. I have completed my B.Com and am currently working as a Civil Engineer at Self Employed in Thanjavur. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'joint', 'rich', true, false, true, 100, NOW() - INTERVAL '4 days', 'Poorvashadha', 'Viruchigam', 'Rishabam', 'Viswamitra', 'free', 5, 5, 'vegetarian', 'no', 'no'
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
      '00000000-0000-4000-a000-00000000018f', 'TM000399', 'Gautham Raman', 'male', '1991-08-09', 165, 'never_married', 'Hindu', 'Naidu', 'Naidu subcaste', 'no', 'B.E. / B.Tech', 'B.E. / B.Tech Graduate', 'Architect', 'Architect Details', '₹10 Lakhs - ₹15 Lakhs', 'Infosys', 'Tiruchirappalli', 'Trichy', 'Hi, I am Gautham. I have completed my B.E. / B.Tech and am currently working as a Architect at Infosys in Tiruchirappalli. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'upper_middle_class', true, false, true, 100, NOW() - INTERVAL '0 days', 'Mirgashira', 'Kumbam', 'Magaram', 'Agastya', 'free', 5, 5, 'vegetarian', 'no', 'no'
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
      '00000000-0000-4000-a000-000000000190', 'TM000400', 'Deepa Moorthy', 'female', '2002-08-08', 171, 'divorced', 'Hindu', 'Chettiar', 'Chettiar subcaste', 'no', 'B.Sc', 'B.Sc Graduate', 'School Teacher', 'School Teacher Details', '₹5 Lakhs - ₹7 Lakhs', 'HCL', 'Chennai', 'Chennai', 'Hi, I am Deepa. I have completed my B.Sc and am currently working as a School Teacher at HCL in Chennai. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'upper_middle_class', true, false, true, 100, NOW() - INTERVAL '5 days', 'Uttaraphalguni', 'Mithunam', 'Rishabam', 'Harita', 'free', 5, 5, 'vegetarian', 'no', 'no'
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
      '00000000-0000-4000-a000-000000000191', 'TM000401', 'Hari Lingam', 'male', '2003-03-08', 181, 'never_married', 'Hindu', 'Devendra Kula Vellalar', NULL, 'no', 'Ph.D', 'Ph.D Graduate', 'College Professor', 'College Professor Details', '₹5 Lakhs - ₹7 Lakhs', 'Private Practice', 'Salem', 'Salem', 'Hi, I am Hari. I have completed my Ph.D and am currently working as a College Professor at Private Practice in Salem. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'joint', 'middle_class', false, true, true, 100, NOW() - INTERVAL '8 days', 'Arudra', 'Viruchigam', 'Kumbam', 'Agastya', 'gold', 50, 100, 'vegetarian', 'no', 'no'
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
      '00000000-0000-4000-a000-000000000192', 'TM000402', 'Nandhini Pandian', 'female', '2004-03-12', 159, 'never_married', 'Christian', 'Nadar Christian', NULL, 'no', 'B.Com', 'B.Com Graduate', 'Civil Engineer', 'Civil Engineer Details', '₹15 Lakhs - ₹20 Lakhs', 'HCL', 'Tiruchirappalli', 'Trichy', 'Hi, I am Nandhini. I have completed my B.Com and am currently working as a Civil Engineer at HCL in Tiruchirappalli. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'upper_middle_class', false, true, true, 100, NOW() - INTERVAL '9 days', 'Moola', 'Kanni', 'Mithunam', 'Angirasa', 'gold', 50, 100, 'vegetarian', 'no', 'no'
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
      '00000000-0000-4000-a000-000000000193', 'TM000403', 'Senthil Krishnan', 'male', '1988-04-11', 185, 'never_married', 'Hindu', 'Nadar', NULL, 'no', 'M.B.A', 'M.B.A Graduate', 'Doctor', 'Doctor Details', '₹20 Lakhs+', 'Self Employed', 'Tirunelveli', 'Tirunelveli', 'Hi, I am Senthil. I have completed my M.B.A and am currently working as a Doctor at Self Employed in Tirunelveli. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'upper_middle_class', true, true, true, 100, NOW() - INTERVAL '0 days', 'Uttaraphalguni', 'Mithunam', 'Kanni', 'Murugan', 'gold', 50, 100, 'vegetarian', 'no', 'no'
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
      '00000000-0000-4000-a000-000000000194', 'TM000404', 'Indhumathi Moorthy', 'female', '1988-10-06', 158, 'never_married', 'Christian', 'Pentecostal', 'Pentecostal subcaste', 'no', 'M.Com', 'M.Com Graduate', 'HR Specialist', 'HR Specialist Details', '₹10 Lakhs - ₹15 Lakhs', 'Self Employed', 'Tirunelveli', 'Tirunelveli', 'Hi, I am Indhumathi. I have completed my M.Com and am currently working as a HR Specialist at Self Employed in Tirunelveli. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'joint', 'middle_class', true, false, true, 100, NOW() - INTERVAL '8 days', 'Aslesha', 'Rishabam', 'Kadagam', 'Gautama', 'free', 5, 5, 'vegetarian', 'no', 'no'
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
      '00000000-0000-4000-a000-000000000195', 'TM000405', 'Chinnasamy Raman', 'male', '1990-07-15', 164, 'never_married', 'Muslim', 'Rawther', 'Rawther subcaste', 'no', 'B.A', 'B.A Graduate', 'Bank Manager', 'Bank Manager Details', '₹5 Lakhs - ₹7 Lakhs', 'Wipro', 'Tiruchirappalli', 'Trichy', 'Hi, I am Chinnasamy. I have completed my B.A and am currently working as a Bank Manager at Wipro in Tiruchirappalli. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'joint', 'rich', true, false, true, 100, NOW() - INTERVAL '2 days', 'Bharani', 'Magaram', 'Simham', 'Siva', 'free', 5, 5, 'vegetarian', 'no', 'no'
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
      '00000000-0000-4000-a000-000000000196', 'TM000406', 'Parvathi Sundaram', 'female', '2005-07-27', 172, 'never_married', 'Hindu', 'Kallar', 'Kallar subcaste', 'no', 'B.E. / B.Tech', 'B.E. / B.Tech Graduate', 'Civil Engineer', 'Civil Engineer Details', '₹3 Lakhs - ₹5 Lakhs', 'TCS', 'Tirunelveli', 'Tirunelveli', 'Hi, I am Parvathi. I have completed my B.E. / B.Tech and am currently working as a Civil Engineer at TCS in Tirunelveli. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'middle_class', true, true, true, 100, NOW() - INTERVAL '4 days', 'Vishakha', 'Dhanusu', 'Thulaam', 'Murugan', 'gold', 50, 100, 'vegetarian', 'no', 'no'
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
      '00000000-0000-4000-a000-000000000197', 'TM000407', 'Anand Krishnan', 'male', '2004-09-22', 176, 'never_married', 'Hindu', 'Naicker', NULL, 'no', 'B.Ed', 'B.Ed Graduate', 'Dentist', 'Dentist Details', '₹10 Lakhs - ₹15 Lakhs', 'Wipro', 'Thoothukudi', 'Tuticorin', 'Hi, I am Anand. I have completed my B.Ed and am currently working as a Dentist at Wipro in Thoothukudi. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'joint', 'middle_class', true, false, true, 100, NOW() - INTERVAL '2 days', 'Aslesha', 'Rishabam', 'Dhanusu', 'Kasyapa', 'free', 5, 5, 'vegetarian', 'no', 'no'
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
      '00000000-0000-4000-a000-000000000198', 'TM000408', 'Sneha Selvan', 'female', '1988-12-25', 169, 'never_married', 'Hindu', 'Devendra Kula Vellalar', 'Devendra Kula Vellalar subcaste', 'no', 'M.Sc', 'M.Sc Graduate', 'Advocate', 'Advocate Details', '₹15 Lakhs - ₹20 Lakhs', 'Self Employed', 'Chennai', 'Chennai', 'Hi, I am Sneha. I have completed my M.Sc and am currently working as a Advocate at Self Employed in Chennai. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'joint', 'middle_class', true, false, true, 100, NOW() - INTERVAL '1 days', 'Anuradha', 'Rishabam', 'Rishabam', 'Gautama', 'free', 5, 5, 'vegetarian', 'no', 'no'
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
      '00000000-0000-4000-a000-000000000199', 'TM000409', 'Murugan Sundaram', 'male', '1991-03-23', 185, 'never_married', 'Hindu', 'Kallar', NULL, 'no', 'B.E. / B.Tech', 'B.E. / B.Tech Graduate', 'Doctor', 'Doctor Details', '₹10 Lakhs - ₹15 Lakhs', 'Government Service', 'Coimbatore', 'Coimbatore', 'Hi, I am Murugan. I have completed my B.E. / B.Tech and am currently working as a Doctor at Government Service in Coimbatore. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'joint', 'upper_middle_class', false, false, true, 100, NOW() - INTERVAL '2 days', 'Shatabhisha', 'Thulaam', 'Kadagam', 'Atri', 'free', 5, 5, 'vegetarian', 'no', 'no'
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
      '00000000-0000-4000-a000-00000000019a', 'TM000410', 'Ramya Krishnan', 'female', '1990-08-14', 161, 'never_married', 'Hindu', 'Sengunthar', NULL, 'no', 'Ph.D', 'Ph.D Graduate', 'College Professor', 'College Professor Details', '₹3 Lakhs - ₹5 Lakhs', 'Wipro', 'Thoothukudi', 'Tuticorin', 'Hi, I am Ramya. I have completed my Ph.D and am currently working as a College Professor at Wipro in Thoothukudi. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'rich', true, false, true, 100, NOW() - INTERVAL '2 days', 'Jyeshta', 'Simham', 'Meenam', 'Gautama', 'free', 5, 5, 'vegetarian', 'no', 'no'
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
      '00000000-0000-4000-a000-00000000019b', 'TM000411', 'Karthik Raj', 'male', '1994-08-18', 181, 'divorced', 'Hindu', 'Naicker', 'Naicker subcaste', 'no', 'M.B.B.S', 'M.B.B.S Graduate', 'Doctor', 'Doctor Details', '₹7 Lakhs - ₹10 Lakhs', 'Self Employed', 'Kanchipuram', 'Kanchipuram', 'Hi, I am Karthik. I have completed my M.B.B.S and am currently working as a Doctor at Self Employed in Kanchipuram. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'joint', 'rich', false, false, true, 100, NOW() - INTERVAL '1 days', 'Ashwini', 'Meenam', 'Simham', 'Kasyapa', 'free', 5, 5, 'vegetarian', 'no', 'no'
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
      '00000000-0000-4000-a000-00000000019c', 'TM000412', 'Dharshini Lingam', 'female', '2005-09-18', 155, 'never_married', 'Hindu', 'Arunthathiyar', 'Arunthathiyar subcaste', 'yes', 'M.Com', 'M.Com Graduate', 'Software Engineer', 'Software Engineer Details', '₹10 Lakhs - ₹15 Lakhs', 'Zoho', 'Tiruchirappalli', 'Trichy', 'Hi, I am Dharshini. I have completed my M.Com and am currently working as a Software Engineer at Zoho in Tiruchirappalli. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'middle_class', false, false, true, 100, NOW() - INTERVAL '5 days', 'Uttarachadha', 'Meenam', 'Mesham', 'Siva', 'free', 5, 5, 'vegetarian', 'no', 'no'
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
      '00000000-0000-4000-a000-00000000019d', 'TM000413', 'Chinnasamy Samy', 'male', '1998-08-23', 169, 'never_married', 'Christian', 'CSI Christian', 'CSI Christian subcaste', 'no', 'M.B.B.S', 'M.B.B.S Graduate', 'Doctor', 'Doctor Details', '₹3 Lakhs - ₹5 Lakhs', 'Self Employed', 'Tiruppur', 'Tiruppur', 'Hi, I am Chinnasamy. I have completed my M.B.B.S and am currently working as a Doctor at Self Employed in Tiruppur. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'middle_class', false, true, true, 100, NOW() - INTERVAL '10 days', 'Bharani', 'Mesham', 'Dhanusu', 'Viswamitra', 'gold', 50, 100, 'vegetarian', 'no', 'no'
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
      '00000000-0000-4000-a000-00000000019e', 'TM000414', 'Shanthi Shankar', 'female', '2003-09-13', 173, 'never_married', 'Hindu', 'Yadav', 'Yadav subcaste', 'no', 'B.E. / B.Tech', 'B.E. / B.Tech Graduate', 'Advocate', 'Advocate Details', '₹10 Lakhs - ₹15 Lakhs', 'Private Practice', 'Erode', 'Erode', 'Hi, I am Shanthi. I have completed my B.E. / B.Tech and am currently working as a Advocate at Private Practice in Erode. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'joint', 'rich', true, false, true, 100, NOW() - INTERVAL '2 days', 'Swati', 'Thulaam', 'Magaram', 'Atri', 'free', 5, 5, 'vegetarian', 'no', 'no'
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
      '00000000-0000-4000-a000-00000000019f', 'TM000415', 'Praveen Sundaram', 'male', '1998-12-04', 182, 'divorced', 'Hindu', 'Adi Dravida', NULL, 'no', 'B.A', 'B.A Graduate', 'Pharmacist', 'Pharmacist Details', '₹10 Lakhs - ₹15 Lakhs', 'Private Practice', 'Tiruchirappalli', 'Trichy', 'Hi, I am Praveen. I have completed my B.A and am currently working as a Pharmacist at Private Practice in Tiruchirappalli. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'middle_class', false, true, true, 100, NOW() - INTERVAL '2 days', 'Hasta', 'Kanni', 'Kanni', 'Gautama', 'gold', 50, 100, 'vegetarian', 'no', 'no'
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
      '00000000-0000-4000-a000-0000000001a0', 'TM000416', 'Kayalvizhi Lingam', 'female', '2002-04-17', 166, 'never_married', 'Hindu', 'Kallar', 'Kallar subcaste', 'no', 'M.Sc', 'M.Sc Graduate', 'Auditor', 'Auditor Details', '₹15 Lakhs - ₹20 Lakhs', 'Private Practice', 'Salem', 'Salem', 'Hi, I am Kayalvizhi. I have completed my M.Sc and am currently working as a Auditor at Private Practice in Salem. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'upper_middle_class', false, false, true, 100, NOW() - INTERVAL '1 days', 'Shatabhisha', 'Kadagam', 'Kumbam', 'Murugan', 'free', 5, 5, 'vegetarian', 'no', 'no'
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
      '00000000-0000-4000-a000-0000000001a1', 'TM000417', 'Ganesan Krishnan', 'male', '1991-03-27', 169, 'never_married', 'Hindu', 'Vishwakarma', 'Vishwakarma subcaste', 'no', 'M.A', 'M.A Graduate', 'Bank Manager', 'Bank Manager Details', '₹7 Lakhs - ₹10 Lakhs', 'Self Employed', 'Vellore', 'Vellore', 'Hi, I am Ganesan. I have completed my M.A and am currently working as a Bank Manager at Self Employed in Vellore. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'middle_class', false, false, true, 100, NOW() - INTERVAL '2 days', 'Poorvabhadrapada', 'Thulaam', 'Kadagam', 'Vishnu', 'free', 5, 5, 'vegetarian', 'no', 'no'
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
      '00000000-0000-4000-a000-0000000001a2', 'TM000418', 'Sandhya Krishnan', 'female', '1988-05-18', 152, 'never_married', 'Hindu', 'Chettiar', NULL, 'no', 'M.Sc', 'M.Sc Graduate', 'HR Specialist', 'HR Specialist Details', '₹10 Lakhs - ₹15 Lakhs', 'Zoho', 'Tiruppur', 'Tiruppur', 'Hi, I am Sandhya. I have completed my M.Sc and am currently working as a HR Specialist at Zoho in Tiruppur. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'upper_middle_class', true, true, true, 100, NOW() - INTERVAL '10 days', 'Krittika', 'Simham', 'Simham', 'Vishnu', 'gold', 50, 100, 'vegetarian', 'no', 'no'
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
      '00000000-0000-4000-a000-0000000001a3', 'TM000419', 'Ranjith Samy', 'male', '1992-12-15', 174, 'divorced', 'Hindu', 'Naidu', 'Naidu subcaste', 'no', 'M.Com', 'M.Com Graduate', 'Government Officer', 'Government Officer Details', '₹10 Lakhs - ₹15 Lakhs', 'Self Employed', 'Tiruppur', 'Tiruppur', 'Hi, I am Ranjith. I have completed my M.Com and am currently working as a Government Officer at Self Employed in Tiruppur. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'upper_middle_class', false, true, true, 100, NOW() - INTERVAL '1 days', 'Uttarabhadrapada', 'Mithunam', 'Meenam', 'Gautama', 'gold', 50, 100, 'vegetarian', 'no', 'no'
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
      '00000000-0000-4000-a000-0000000001a4', 'TM000420', 'Radha Velan', 'female', '1992-07-09', 161, 'never_married', 'Muslim', 'Rawther', 'Rawther subcaste', 'no', 'M.B.B.S', 'M.B.B.S Graduate', 'Business Owner', 'Business Owner Details', '₹5 Lakhs - ₹7 Lakhs', 'Accenture', 'Kanchipuram', 'Kanchipuram', 'Hi, I am Radha. I have completed my M.B.B.S and am currently working as a Business Owner at Accenture in Kanchipuram. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'rich', false, false, true, 100, NOW() - INTERVAL '3 days', 'Revati', 'Magaram', 'Kanni', 'Viswamitra', 'free', 5, 5, 'vegetarian', 'no', 'no'
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
      '00000000-0000-4000-a000-0000000001a5', 'TM000421', 'Muthu Raj', 'male', '1991-06-15', 180, 'never_married', 'Hindu', 'Vishwakarma', NULL, 'no', 'M.Com', 'M.Com Graduate', 'Police Officer', 'Police Officer Details', '₹10 Lakhs - ₹15 Lakhs', 'Zoho', 'Erode', 'Erode', 'Hi, I am Muthu. I have completed my M.Com and am currently working as a Police Officer at Zoho in Erode. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'upper_middle_class', false, false, true, 100, NOW() - INTERVAL '1 days', 'Anuradha', 'Meenam', 'Kadagam', 'Angirasa', 'free', 5, 5, 'vegetarian', 'no', 'no'
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
      '00000000-0000-4000-a000-0000000001a6', 'TM000422', 'Sowmya Gopal', 'female', '2000-11-02', 172, 'divorced', 'Hindu', 'Chettiar', 'Chettiar subcaste', 'no', 'M.Sc', 'M.Sc Graduate', 'Software Engineer', 'Software Engineer Details', '₹15 Lakhs - ₹20 Lakhs', 'Self Employed', 'Tiruchirappalli', 'Trichy', 'Hi, I am Sowmya. I have completed my M.Sc and am currently working as a Software Engineer at Self Employed in Tiruchirappalli. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'upper_middle_class', true, false, true, 100, NOW() - INTERVAL '7 days', 'Pushya', 'Thulaam', 'Viruchigam', 'Harita', 'free', 5, 5, 'vegetarian', 'no', 'no'
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
      '00000000-0000-4000-a000-0000000001a7', 'TM000423', 'Muthu Mani', 'male', '2003-01-25', 185, 'never_married', 'Hindu', 'Kallar', 'Kallar subcaste', 'yes', 'M.B.A', 'M.B.A Graduate', 'Dentist', 'Dentist Details', '₹15 Lakhs - ₹20 Lakhs', 'Wipro', 'Erode', 'Erode', 'Hi, I am Muthu. I have completed my M.B.A and am currently working as a Dentist at Wipro in Erode. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'middle_class', true, true, true, 100, NOW() - INTERVAL '10 days', 'Anuradha', 'Viruchigam', 'Simham', 'Vishnu', 'gold', 50, 100, 'vegetarian', 'no', 'no'
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
      '00000000-0000-4000-a000-0000000001a8', 'TM000424', 'Anitha Lingam', 'female', '2002-03-26', 166, 'never_married', 'Hindu', 'Brahmin - Iyengar', NULL, 'no', 'M.B.B.S', 'M.B.B.S Graduate', 'Government Officer', 'Government Officer Details', '₹3 Lakhs - ₹5 Lakhs', 'Self Employed', 'Chennai', 'Chennai', 'Hi, I am Anitha. I have completed my M.B.B.S and am currently working as a Government Officer at Self Employed in Chennai. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'middle_class', true, false, true, 100, NOW() - INTERVAL '4 days', 'Swati', 'Viruchigam', 'Thulaam', 'Gautama', 'free', 5, 5, 'vegetarian', 'no', 'no'
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
      '00000000-0000-4000-a000-0000000001a9', 'TM000425', 'Gautham Murthy', 'male', '1988-07-11', 178, 'never_married', 'Hindu', 'Naidu', 'Naidu subcaste', 'no', 'B.Com', 'B.Com Graduate', 'College Professor', 'College Professor Details', '₹7 Lakhs - ₹10 Lakhs', 'Infosys', 'Kanchipuram', 'Kanchipuram', 'Hi, I am Gautham. I have completed my B.Com and am currently working as a College Professor at Infosys in Kanchipuram. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'rich', true, false, true, 100, NOW() - INTERVAL '8 days', 'Revati', 'Viruchigam', 'Dhanusu', 'Vashishta', 'free', 5, 5, 'vegetarian', 'no', 'no'
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
      '00000000-0000-4000-a000-0000000001aa', 'TM000426', 'Sowmya Gopal', 'female', '1997-06-18', 174, 'never_married', 'Hindu', 'Devendra Kula Vellalar', NULL, 'no', 'B.Com', 'B.Com Graduate', 'Police Officer', 'Police Officer Details', '₹10 Lakhs - ₹15 Lakhs', 'Government Service', 'Salem', 'Salem', 'Hi, I am Sowmya. I have completed my B.Com and am currently working as a Police Officer at Government Service in Salem. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'joint', 'upper_middle_class', false, false, true, 100, NOW() - INTERVAL '3 days', 'Magha', 'Simham', 'Thulaam', 'Vishnu', 'free', 5, 5, 'vegetarian', 'no', 'no'
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
      '00000000-0000-4000-a000-0000000001ab', 'TM000427', 'Srinivasan Raj', 'male', '2000-11-14', 167, 'never_married', 'Hindu', 'Vellalar', 'Vellalar subcaste', 'no', 'M.Sc', 'M.Sc Graduate', 'Civil Engineer', 'Civil Engineer Details', '₹10 Lakhs - ₹15 Lakhs', 'HCL', 'Thanjavur', 'Thanjavur', 'Hi, I am Srinivasan. I have completed my M.Sc and am currently working as a Civil Engineer at HCL in Thanjavur. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'joint', 'upper_middle_class', true, true, true, 100, NOW() - INTERVAL '5 days', 'Uttarachadha', 'Thulaam', 'Simham', 'Kasyapa', 'gold', 50, 100, 'vegetarian', 'no', 'no'
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
      '00000000-0000-4000-a000-0000000001ac', 'TM000428', 'Uma Mani', 'female', '1998-03-16', 170, 'divorced', 'Hindu', 'Chettiar', 'Chettiar subcaste', 'yes', 'B.Sc', 'B.Sc Graduate', 'Auditor', 'Auditor Details', '₹5 Lakhs - ₹7 Lakhs', 'Wipro', 'Salem', 'Salem', 'Hi, I am Uma. I have completed my B.Sc and am currently working as a Auditor at Wipro in Salem. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'middle_class', true, false, true, 100, NOW() - INTERVAL '9 days', 'Ashwini', 'Rishabam', 'Thulaam', 'Angirasa', 'free', 5, 5, 'vegetarian', 'no', 'no'
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
      '00000000-0000-4000-a000-0000000001ad', 'TM000429', 'Senthil Sundaram', 'male', '1989-03-11', 164, 'never_married', 'Hindu', 'Vellalar', 'Vellalar subcaste', 'no', 'B.E. / B.Tech', 'B.E. / B.Tech Graduate', 'Advocate', 'Advocate Details', '₹10 Lakhs - ₹15 Lakhs', 'HCL', 'Tiruchirappalli', 'Trichy', 'Hi, I am Senthil. I have completed my B.E. / B.Tech and am currently working as a Advocate at HCL in Tiruchirappalli. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'joint', 'upper_middle_class', true, false, true, 100, NOW() - INTERVAL '6 days', 'Ashwini', 'Rishabam', 'Mithunam', 'Bharadwaj', 'free', 5, 5, 'vegetarian', 'no', 'no'
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
      '00000000-0000-4000-a000-0000000001ae', 'TM000430', 'Abirami Krishnan', 'female', '2004-07-06', 158, 'never_married', 'Christian', 'Protestant Christian', 'Protestant Christian subcaste', 'no', 'M.Sc', 'M.Sc Graduate', 'Bank Manager', 'Bank Manager Details', '₹5 Lakhs - ₹7 Lakhs', 'Wipro', 'Tirunelveli', 'Tirunelveli', 'Hi, I am Abirami. I have completed my M.Sc and am currently working as a Bank Manager at Wipro in Tirunelveli. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'middle_class', true, false, true, 100, NOW() - INTERVAL '5 days', 'Poorvashadha', 'Mithunam', 'Kadagam', 'Gautama', 'free', 5, 5, 'vegetarian', 'no', 'no'
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
      '00000000-0000-4000-a000-0000000001af', 'TM000431', 'Bala Moorthy', 'male', '2002-10-05', 176, 'never_married', 'Hindu', 'Brahmin - Iyengar', NULL, 'no', 'Ph.D', 'Ph.D Graduate', 'Dentist', 'Dentist Details', '₹20 Lakhs+', 'Zoho', 'Chennai', 'Chennai', 'Hi, I am Bala. I have completed my Ph.D and am currently working as a Dentist at Zoho in Chennai. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'middle_class', true, true, true, 100, NOW() - INTERVAL '7 days', 'Swati', 'Simham', 'Viruchigam', 'Siva', 'gold', 50, 100, 'vegetarian', 'no', 'no'
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
      '00000000-0000-4000-a000-0000000001b0', 'TM000432', 'Anitha Selvan', 'female', '1995-04-13', 162, 'never_married', 'Hindu', 'Maravar', 'Maravar subcaste', 'no', 'M.Com', 'M.Com Graduate', 'College Professor', 'College Professor Details', '₹20 Lakhs+', 'TCS', 'Erode', 'Erode', 'Hi, I am Anitha. I have completed my M.Com and am currently working as a College Professor at TCS in Erode. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'joint', 'upper_middle_class', true, true, true, 100, NOW() - INTERVAL '5 days', 'Poorvashadha', 'Magaram', 'Mesham', 'Angirasa', 'gold', 50, 100, 'vegetarian', 'no', 'no'
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
      '00000000-0000-4000-a000-0000000001b1', 'TM000433', 'Senthil Naicker', 'male', '1988-08-27', 162, 'never_married', 'Hindu', 'Vanniyar', 'Vanniyar subcaste', 'no', 'B.Sc', 'B.Sc Graduate', 'Bank Manager', 'Bank Manager Details', '₹5 Lakhs - ₹7 Lakhs', 'Private Practice', 'Thoothukudi', 'Tuticorin', 'Hi, I am Senthil. I have completed my B.Sc and am currently working as a Bank Manager at Private Practice in Thoothukudi. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'upper_middle_class', true, true, true, 100, NOW() - INTERVAL '6 days', 'Uttarachadha', 'Magaram', 'Rishabam', 'Harita', 'gold', 50, 100, 'vegetarian', 'no', 'no'
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
      '00000000-0000-4000-a000-0000000001b2', 'TM000434', 'Uma Nathan', 'female', '1989-12-20', 162, 'never_married', 'Christian', 'Pentecostal', 'Pentecostal subcaste', 'no', 'M.B.A', 'M.B.A Graduate', 'Advocate', 'Advocate Details', '₹10 Lakhs - ₹15 Lakhs', 'Cognizant', 'Vellore', 'Vellore', 'Hi, I am Uma. I have completed my M.B.A and am currently working as a Advocate at Cognizant in Vellore. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'upper_middle_class', true, true, true, 100, NOW() - INTERVAL '0 days', 'Swati', 'Kumbam', 'Kanni', 'Bharadwaj', 'gold', 50, 100, 'vegetarian', 'no', 'no'
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
      '00000000-0000-4000-a000-0000000001b3', 'TM000435', 'Mohan Nathan', 'male', '2002-09-23', 178, 'never_married', 'Christian', 'CSI Christian', 'CSI Christian subcaste', 'no', 'B.A', 'B.A Graduate', 'College Professor', 'College Professor Details', '₹20 Lakhs+', 'Wipro', 'Chennai', 'Chennai', 'Hi, I am Mohan. I have completed my B.A and am currently working as a College Professor at Wipro in Chennai. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'upper_middle_class', true, true, true, 100, NOW() - INTERVAL '8 days', 'Revati', 'Dhanusu', 'Rishabam', 'Vishnu', 'gold', 50, 100, 'vegetarian', 'no', 'no'
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
      '00000000-0000-4000-a000-0000000001b4', 'TM000436', 'Meenakshi Nathan', 'female', '2000-04-07', 174, 'never_married', 'Hindu', 'Agamudayar', 'Agamudayar subcaste', 'no', 'B.Ed', 'B.Ed Graduate', 'HR Specialist', 'HR Specialist Details', '₹3 Lakhs - ₹5 Lakhs', 'Cognizant', 'Kanchipuram', 'Kanchipuram', 'Hi, I am Meenakshi. I have completed my B.Ed and am currently working as a HR Specialist at Cognizant in Kanchipuram. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'upper_middle_class', true, false, true, 100, NOW() - INTERVAL '7 days', 'Dhanishta', 'Simham', 'Kumbam', 'Siva', 'free', 5, 5, 'vegetarian', 'no', 'no'
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
      '00000000-0000-4000-a000-0000000001b5', 'TM000437', 'Siddharth Swamy', 'male', '2000-10-25', 172, 'never_married', 'Muslim', 'Sunni Muslim', NULL, 'no', 'M.Sc', 'M.Sc Graduate', 'Software Engineer', 'Software Engineer Details', '₹7 Lakhs - ₹10 Lakhs', 'Government Service', 'Erode', 'Erode', 'Hi, I am Siddharth. I have completed my M.Sc and am currently working as a Software Engineer at Government Service in Erode. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'rich', true, false, true, 100, NOW() - INTERVAL '0 days', 'Anuradha', 'Meenam', 'Viruchigam', 'Bharadwaj', 'free', 5, 5, 'vegetarian', 'no', 'no'
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
      '00000000-0000-4000-a000-0000000001b6', 'TM000438', 'Deepa Swamy', 'female', '1992-07-19', 166, 'divorced', 'Hindu', 'Gounder', 'Gounder subcaste', 'no', 'B.Com', 'B.Com Graduate', 'Dentist', 'Dentist Details', '₹5 Lakhs - ₹7 Lakhs', 'Zoho', 'Thanjavur', 'Thanjavur', 'Hi, I am Deepa. I have completed my B.Com and am currently working as a Dentist at Zoho in Thanjavur. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'middle_class', false, false, true, 100, NOW() - INTERVAL '5 days', 'Poorvaphalguni', 'Thulaam', 'Dhanusu', 'Agastya', 'free', 5, 5, 'vegetarian', 'no', 'no'
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
      '00000000-0000-4000-a000-0000000001b7', 'TM000439', 'Thirumal Krishnan', 'male', '1988-06-03', 168, 'never_married', 'Hindu', 'Vishwakarma', 'Vishwakarma subcaste', 'no', 'B.Sc', 'B.Sc Graduate', 'Pharmacist', 'Pharmacist Details', '₹20 Lakhs+', 'Government Service', 'Erode', 'Erode', 'Hi, I am Thirumal. I have completed my B.Sc and am currently working as a Pharmacist at Government Service in Erode. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'middle_class', false, false, true, 100, NOW() - INTERVAL '10 days', 'Vishakha', 'Simham', 'Simham', 'Vishnu', 'free', 5, 5, 'vegetarian', 'no', 'no'
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
      '00000000-0000-4000-a000-0000000001b8', 'TM000440', 'Vijaya Naicker', 'female', '1998-08-14', 151, 'never_married', 'Hindu', 'Brahmin - Iyer', 'Brahmin - Iyer subcaste', 'no', 'B.A', 'B.A Graduate', 'HR Specialist', 'HR Specialist Details', '₹15 Lakhs - ₹20 Lakhs', 'Accenture', 'Tiruppur', 'Tiruppur', 'Hi, I am Vijaya. I have completed my B.A and am currently working as a HR Specialist at Accenture in Tiruppur. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'upper_middle_class', false, true, true, 100, NOW() - INTERVAL '7 days', 'Jyeshta', 'Simham', 'Kanni', 'Siva', 'gold', 50, 100, 'vegetarian', 'no', 'no'
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
      '00000000-0000-4000-a000-0000000001b9', 'TM000441', 'Naveen Pandian', 'male', '1989-10-03', 170, 'never_married', 'Hindu', 'Thevar', 'Thevar subcaste', 'no', 'B.Sc', 'B.Sc Graduate', 'Pharmacist', 'Pharmacist Details', '₹10 Lakhs - ₹15 Lakhs', 'Zoho', 'Tiruppur', 'Tiruppur', 'Hi, I am Naveen. I have completed my B.Sc and am currently working as a Pharmacist at Zoho in Tiruppur. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'rich', true, true, true, 100, NOW() - INTERVAL '9 days', 'Swati', 'Mesham', 'Simham', 'Gautama', 'gold', 50, 100, 'vegetarian', 'no', 'no'
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
      '00000000-0000-4000-a000-0000000001ba', 'TM000442', 'Vanitha Raj', 'female', '1993-06-03', 158, 'never_married', 'Hindu', 'Sengunthar', NULL, 'no', 'B.Ed', 'B.Ed Graduate', 'Advocate', 'Advocate Details', '₹5 Lakhs - ₹7 Lakhs', 'Accenture', 'Erode', 'Erode', 'Hi, I am Vanitha. I have completed my B.Ed and am currently working as a Advocate at Accenture in Erode. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'upper_middle_class', true, true, true, 100, NOW() - INTERVAL '1 days', 'Punarvasu', 'Viruchigam', 'Viruchigam', 'Agastya', 'gold', 50, 100, 'vegetarian', 'no', 'no'
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
      '00000000-0000-4000-a000-0000000001bb', 'TM000443', 'Dinesh Krishnan', 'male', '2000-08-02', 164, 'divorced', 'Muslim', 'Shia Muslim', 'Shia Muslim subcaste', 'no', 'M.B.B.S', 'M.B.B.S Graduate', 'Bank Manager', 'Bank Manager Details', '₹20 Lakhs+', 'Private Practice', 'Tiruchirappalli', 'Trichy', 'Hi, I am Dinesh. I have completed my M.B.B.S and am currently working as a Bank Manager at Private Practice in Tiruchirappalli. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'joint', 'rich', false, true, true, 100, NOW() - INTERVAL '4 days', 'Jyeshta', 'Thulaam', 'Dhanusu', 'Vashishta', 'gold', 50, 100, 'vegetarian', 'no', 'no'
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
      '00000000-0000-4000-a000-0000000001bc', 'TM000444', 'Yazhini Pandian', 'female', '2000-10-13', 159, 'never_married', 'Hindu', 'Naicker', NULL, 'no', 'B.Sc', 'B.Sc Graduate', 'Business Owner', 'Business Owner Details', '₹20 Lakhs+', 'Self Employed', 'Thoothukudi', 'Tuticorin', 'Hi, I am Yazhini. I have completed my B.Sc and am currently working as a Business Owner at Self Employed in Thoothukudi. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'rich', false, true, true, 100, NOW() - INTERVAL '9 days', 'Pushya', 'Viruchigam', 'Dhanusu', 'Agastya', 'gold', 50, 100, 'vegetarian', 'no', 'no'
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
      '00000000-0000-4000-a000-0000000001bd', 'TM000445', 'Saravanan Pandian', 'male', '1998-03-19', 164, 'never_married', 'Hindu', 'Brahmin - Iyer', 'Brahmin - Iyer subcaste', 'no', 'M.C.A', 'M.C.A Graduate', 'HR Specialist', 'HR Specialist Details', '₹7 Lakhs - ₹10 Lakhs', 'Government Service', 'Salem', 'Salem', 'Hi, I am Saravanan. I have completed my M.C.A and am currently working as a HR Specialist at Government Service in Salem. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'upper_middle_class', true, false, true, 100, NOW() - INTERVAL '10 days', 'Uttaraphalguni', 'Kanni', 'Rishabam', 'Vashishta', 'free', 5, 5, 'vegetarian', 'no', 'no'
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
      '00000000-0000-4000-a000-0000000001be', 'TM000446', 'Harini Nathan', 'female', '1996-09-09', 157, 'divorced', 'Hindu', 'Brahmin - Iyer', NULL, 'no', 'M.B.A', 'M.B.A Graduate', 'Mechanical Engineer', 'Mechanical Engineer Details', '₹7 Lakhs - ₹10 Lakhs', 'Private Practice', 'Chennai', 'Chennai', 'Hi, I am Harini. I have completed my M.B.A and am currently working as a Mechanical Engineer at Private Practice in Chennai. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'middle_class', true, false, true, 100, NOW() - INTERVAL '9 days', 'Uttarabhadrapada', 'Kadagam', 'Simham', 'Angirasa', 'free', 5, 5, 'vegetarian', 'no', 'no'
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
      '00000000-0000-4000-a000-0000000001bf', 'TM000447', 'Ganesan Velan', 'male', '1996-07-18', 176, 'never_married', 'Hindu', 'Gounder', 'Gounder subcaste', 'no', 'Ph.D', 'Ph.D Graduate', 'Pharmacist', 'Pharmacist Details', '₹15 Lakhs - ₹20 Lakhs', 'Accenture', 'Tiruppur', 'Tiruppur', 'Hi, I am Ganesan. I have completed my Ph.D and am currently working as a Pharmacist at Accenture in Tiruppur. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'joint', 'rich', true, false, true, 100, NOW() - INTERVAL '4 days', 'Krittika', 'Mithunam', 'Meenam', 'Kasyapa', 'free', 5, 5, 'vegetarian', 'no', 'no'
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
      '00000000-0000-4000-a000-0000000001c0', 'TM000448', 'Soundarya Raman', 'female', '2002-06-28', 175, 'never_married', 'Hindu', 'Yadav', NULL, 'no', 'M.A', 'M.A Graduate', 'Auditor', 'Auditor Details', '₹10 Lakhs - ₹15 Lakhs', 'HCL', 'Thanjavur', 'Thanjavur', 'Hi, I am Soundarya. I have completed my M.A and am currently working as a Auditor at HCL in Thanjavur. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'joint', 'middle_class', true, false, true, 100, NOW() - INTERVAL '3 days', 'Hasta', 'Meenam', 'Mithunam', 'Harita', 'free', 5, 5, 'vegetarian', 'no', 'no'
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
      '00000000-0000-4000-a000-0000000001c1', 'TM000449', 'Suresh Krishnan', 'male', '1991-07-18', 176, 'never_married', 'Hindu', 'Vanniyar', 'Vanniyar subcaste', 'yes', 'M.Sc', 'M.Sc Graduate', 'Auditor', 'Auditor Details', '₹3 Lakhs - ₹5 Lakhs', 'HCL', 'Chennai', 'Chennai', 'Hi, I am Suresh. I have completed my M.Sc and am currently working as a Auditor at HCL in Chennai. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'middle_class', true, false, true, 100, NOW() - INTERVAL '7 days', 'Uttarachadha', 'Rishabam', 'Simham', 'Atri', 'free', 5, 5, 'vegetarian', 'no', 'no'
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
      '00000000-0000-4000-a000-0000000001c2', 'TM000450', 'Dharshini Balan', 'female', '2004-03-04', 155, 'never_married', 'Hindu', 'Brahmin - Iyer', 'Brahmin - Iyer subcaste', 'no', 'B.E. / B.Tech', 'B.E. / B.Tech Graduate', 'Mechanical Engineer', 'Mechanical Engineer Details', '₹3 Lakhs - ₹5 Lakhs', 'Infosys', 'Kanchipuram', 'Kanchipuram', 'Hi, I am Dharshini. I have completed my B.E. / B.Tech and am currently working as a Mechanical Engineer at Infosys in Kanchipuram. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'middle_class', false, false, true, 100, NOW() - INTERVAL '10 days', 'Punarvasu', 'Meenam', 'Kumbam', 'Gautama', 'free', 5, 5, 'vegetarian', 'no', 'no'
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
      '00000000-0000-4000-a000-0000000001c3', 'TM000451', 'Hari Velan', 'male', '1996-09-04', 184, 'never_married', 'Hindu', 'Brahmin - Iyer', 'Brahmin - Iyer subcaste', 'no', 'M.Com', 'M.Com Graduate', 'School Teacher', 'School Teacher Details', '₹5 Lakhs - ₹7 Lakhs', 'Government Service', 'Kanchipuram', 'Kanchipuram', 'Hi, I am Hari. I have completed my M.Com and am currently working as a School Teacher at Government Service in Kanchipuram. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'upper_middle_class', true, false, true, 100, NOW() - INTERVAL '5 days', 'Moola', 'Kadagam', 'Rishabam', 'Vishnu', 'free', 5, 5, 'vegetarian', 'no', 'no'
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
      '00000000-0000-4000-a000-0000000001c4', 'TM000452', 'Kayalvizhi Raman', 'female', '1990-01-07', 153, 'never_married', 'Hindu', 'Vishwakarma', 'Vishwakarma subcaste', 'no', 'B.Sc', 'B.Sc Graduate', 'Business Owner', 'Business Owner Details', '₹15 Lakhs - ₹20 Lakhs', 'Self Employed', 'Chennai', 'Chennai', 'Hi, I am Kayalvizhi. I have completed my B.Sc and am currently working as a Business Owner at Self Employed in Chennai. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'joint', 'middle_class', true, true, true, 100, NOW() - INTERVAL '2 days', 'Uttarabhadrapada', 'Dhanusu', 'Rishabam', 'Siva', 'gold', 50, 100, 'vegetarian', 'no', 'no'
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
      '00000000-0000-4000-a000-0000000001c5', 'TM000453', 'Kabilan Shankar', 'male', '2003-07-02', 184, 'never_married', 'Hindu', 'Yadav', NULL, 'no', 'M.B.B.S', 'M.B.B.S Graduate', 'Auditor', 'Auditor Details', '₹3 Lakhs - ₹5 Lakhs', 'Zoho', 'Tiruppur', 'Tiruppur', 'Hi, I am Kabilan. I have completed my M.B.B.S and am currently working as a Auditor at Zoho in Tiruppur. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'rich', true, true, true, 100, NOW() - INTERVAL '3 days', 'Jyeshta', 'Dhanusu', 'Magaram', 'Viswamitra', 'gold', 50, 100, 'vegetarian', 'no', 'no'
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
      '00000000-0000-4000-a000-0000000001c6', 'TM000454', 'Ramya Murthy', 'female', '1997-09-06', 163, 'never_married', 'Hindu', 'Vishwakarma', NULL, 'yes', 'Ph.D', 'Ph.D Graduate', 'Doctor', 'Doctor Details', '₹20 Lakhs+', 'Accenture', 'Erode', 'Erode', 'Hi, I am Ramya. I have completed my Ph.D and am currently working as a Doctor at Accenture in Erode. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'joint', 'middle_class', false, false, true, 100, NOW() - INTERVAL '2 days', 'Uttaraphalguni', 'Kumbam', 'Simham', 'Harita', 'free', 5, 5, 'vegetarian', 'no', 'no'
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
      '00000000-0000-4000-a000-0000000001c7', 'TM000455', 'Ramesh Selvan', 'male', '1992-08-23', 166, 'never_married', 'Hindu', 'Kallar', NULL, 'no', 'B.E. / B.Tech', 'B.E. / B.Tech Graduate', 'HR Specialist', 'HR Specialist Details', '₹3 Lakhs - ₹5 Lakhs', 'TCS', 'Tiruchirappalli', 'Trichy', 'Hi, I am Ramesh. I have completed my B.E. / B.Tech and am currently working as a HR Specialist at TCS in Tiruchirappalli. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'middle_class', true, false, true, 100, NOW() - INTERVAL '4 days', 'Krittika', 'Mesham', 'Mithunam', 'Vishnu', 'free', 5, 5, 'vegetarian', 'no', 'no'
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
      '00000000-0000-4000-a000-0000000001c8', 'TM000456', 'Yazhini Murthy', 'female', '2000-03-04', 154, 'never_married', 'Hindu', 'Kallar', 'Kallar subcaste', 'no', 'M.B.A', 'M.B.A Graduate', 'HR Specialist', 'HR Specialist Details', '₹10 Lakhs - ₹15 Lakhs', 'Government Service', 'Thoothukudi', 'Tuticorin', 'Hi, I am Yazhini. I have completed my M.B.A and am currently working as a HR Specialist at Government Service in Thoothukudi. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'middle_class', true, false, true, 100, NOW() - INTERVAL '1 days', 'Dhanishta', 'Kadagam', 'Mithunam', 'Murugan', 'free', 5, 5, 'vegetarian', 'no', 'no'
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
      '00000000-0000-4000-a000-0000000001c9', 'TM000457', 'Vinoth Shankar', 'male', '1988-04-02', 167, 'never_married', 'Hindu', 'Gounder', 'Gounder subcaste', 'no', 'B.Ed', 'B.Ed Graduate', 'College Professor', 'College Professor Details', '₹7 Lakhs - ₹10 Lakhs', 'Self Employed', 'Madurai', 'Madurai', 'Hi, I am Vinoth. I have completed my B.Ed and am currently working as a College Professor at Self Employed in Madurai. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'rich', true, true, true, 100, NOW() - INTERVAL '3 days', 'Poorvashadha', 'Rishabam', 'Viruchigam', 'Vashishta', 'gold', 50, 100, 'vegetarian', 'no', 'no'
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
      '00000000-0000-4000-a000-0000000001ca', 'TM000458', 'Parvathi Kumar', 'female', '2000-09-16', 173, 'never_married', 'Hindu', 'Gounder', 'Gounder subcaste', 'yes', 'M.B.A', 'M.B.A Graduate', 'School Teacher', 'School Teacher Details', '₹15 Lakhs - ₹20 Lakhs', 'Zoho', 'Thoothukudi', 'Tuticorin', 'Hi, I am Parvathi. I have completed my M.B.A and am currently working as a School Teacher at Zoho in Thoothukudi. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'middle_class', true, true, true, 100, NOW() - INTERVAL '5 days', 'Uttarabhadrapada', 'Dhanusu', 'Viruchigam', 'Bharadwaj', 'gold', 50, 100, 'vegetarian', 'no', 'no'
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
      '00000000-0000-4000-a000-0000000001cb', 'TM000459', 'Mohan Pandian', 'male', '1999-02-04', 162, 'never_married', 'Hindu', 'Vellalar', NULL, 'no', 'M.A', 'M.A Graduate', 'College Professor', 'College Professor Details', '₹10 Lakhs - ₹15 Lakhs', 'Private Practice', 'Erode', 'Erode', 'Hi, I am Mohan. I have completed my M.A and am currently working as a College Professor at Private Practice in Erode. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'middle_class', true, false, true, 100, NOW() - INTERVAL '8 days', 'Poorvabhadrapada', 'Kumbam', 'Dhanusu', 'Kasyapa', 'free', 5, 5, 'vegetarian', 'no', 'no'
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
      '00000000-0000-4000-a000-0000000001cc', 'TM000460', 'Nivedha Raj', 'female', '2001-08-25', 171, 'divorced', 'Hindu', 'Kallar', 'Kallar subcaste', 'no', 'M.Com', 'M.Com Graduate', 'Police Officer', 'Police Officer Details', '₹10 Lakhs - ₹15 Lakhs', 'Infosys', 'Kanchipuram', 'Kanchipuram', 'Hi, I am Nivedha. I have completed my M.Com and am currently working as a Police Officer at Infosys in Kanchipuram. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'middle_class', false, false, true, 100, NOW() - INTERVAL '2 days', 'Dhanishta', 'Rishabam', 'Magaram', 'Angirasa', 'free', 5, 5, 'vegetarian', 'no', 'no'
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
      '00000000-0000-4000-a000-0000000001cd', 'TM000461', 'Siva Devan', 'male', '1994-12-28', 162, 'never_married', 'Hindu', 'Mudaliar', 'Mudaliar subcaste', 'no', 'B.E. / B.Tech', 'B.E. / B.Tech Graduate', 'Doctor', 'Doctor Details', '₹3 Lakhs - ₹5 Lakhs', 'TCS', 'Tirunelveli', 'Tirunelveli', 'Hi, I am Siva. I have completed my B.E. / B.Tech and am currently working as a Doctor at TCS in Tirunelveli. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'rich', false, false, true, 100, NOW() - INTERVAL '4 days', 'Punarvasu', 'Mesham', 'Viruchigam', 'Murugan', 'free', 5, 5, 'vegetarian', 'no', 'no'
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
      '00000000-0000-4000-a000-0000000001ce', 'TM000462', 'Janani Balan', 'female', '1988-09-21', 174, 'never_married', 'Hindu', 'Adi Dravida', 'Adi Dravida subcaste', 'no', 'M.B.B.S', 'M.B.B.S Graduate', 'Government Officer', 'Government Officer Details', '₹5 Lakhs - ₹7 Lakhs', 'Government Service', 'Vellore', 'Vellore', 'Hi, I am Janani. I have completed my M.B.B.S and am currently working as a Government Officer at Government Service in Vellore. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'rich', true, false, true, 100, NOW() - INTERVAL '10 days', 'Swati', 'Thulaam', 'Simham', 'Vishnu', 'free', 5, 5, 'vegetarian', 'no', 'no'
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
      '00000000-0000-4000-a000-0000000001cf', 'TM000463', 'Ranjith Swamy', 'male', '1999-11-21', 165, 'never_married', 'Christian', 'Vellalar Christian', 'Vellalar Christian subcaste', 'no', 'B.Com', 'B.Com Graduate', 'Advocate', 'Advocate Details', '₹3 Lakhs - ₹5 Lakhs', 'Private Practice', 'Tiruppur', 'Tiruppur', 'Hi, I am Ranjith. I have completed my B.Com and am currently working as a Advocate at Private Practice in Tiruppur. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'rich', true, false, true, 100, NOW() - INTERVAL '9 days', 'Uttarabhadrapada', 'Mesham', 'Kadagam', 'Vashishta', 'free', 5, 5, 'vegetarian', 'no', 'no'
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
      '00000000-0000-4000-a000-0000000001d0', 'TM000464', 'Shalini Raj', 'female', '2004-01-25', 154, 'never_married', 'Hindu', 'Vellalar', NULL, 'yes', 'Ph.D', 'Ph.D Graduate', 'School Teacher', 'School Teacher Details', '₹5 Lakhs - ₹7 Lakhs', 'Government Service', 'Vellore', 'Vellore', 'Hi, I am Shalini. I have completed my Ph.D and am currently working as a School Teacher at Government Service in Vellore. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'upper_middle_class', true, false, true, 100, NOW() - INTERVAL '0 days', 'Aslesha', 'Mesham', 'Simham', 'Vishnu', 'free', 5, 5, 'vegetarian', 'no', 'no'
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
      '00000000-0000-4000-a000-0000000001d1', 'TM000465', 'Naveen Kumar', 'male', '1992-09-11', 164, 'never_married', 'Muslim', 'Shia Muslim', 'Shia Muslim subcaste', 'no', 'M.C.A', 'M.C.A Graduate', 'HR Specialist', 'HR Specialist Details', '₹15 Lakhs - ₹20 Lakhs', 'Infosys', 'Kanchipuram', 'Kanchipuram', 'Hi, I am Naveen. I have completed my M.C.A and am currently working as a HR Specialist at Infosys in Kanchipuram. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'rich', false, true, true, 100, NOW() - INTERVAL '4 days', 'Punarvasu', 'Dhanusu', 'Mithunam', 'Vashishta', 'gold', 50, 100, 'vegetarian', 'no', 'no'
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
      '00000000-0000-4000-a000-0000000001d2', 'TM000466', 'Harini Moorthy', 'female', '1995-09-23', 174, 'never_married', 'Hindu', 'Vellalar', NULL, 'no', 'M.B.A', 'M.B.A Graduate', 'HR Specialist', 'HR Specialist Details', '₹15 Lakhs - ₹20 Lakhs', 'Private Practice', 'Salem', 'Salem', 'Hi, I am Harini. I have completed my M.B.A and am currently working as a HR Specialist at Private Practice in Salem. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'joint', 'middle_class', false, false, true, 100, NOW() - INTERVAL '5 days', 'Moola', 'Kadagam', 'Thulaam', 'Angirasa', 'free', 5, 5, 'vegetarian', 'no', 'no'
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
      '00000000-0000-4000-a000-0000000001d3', 'TM000467', 'Suresh Krishnan', 'male', '1991-03-25', 183, 'never_married', 'Hindu', 'Kallar', 'Kallar subcaste', 'no', 'B.Sc', 'B.Sc Graduate', 'Pharmacist', 'Pharmacist Details', '₹20 Lakhs+', 'Private Practice', 'Salem', 'Salem', 'Hi, I am Suresh. I have completed my B.Sc and am currently working as a Pharmacist at Private Practice in Salem. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'rich', true, true, true, 100, NOW() - INTERVAL '6 days', 'Anuradha', 'Rishabam', 'Mithunam', 'Agastya', 'gold', 50, 100, 'vegetarian', 'no', 'no'
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
      '00000000-0000-4000-a000-0000000001d4', 'TM000468', 'Ponmani Devan', 'female', '1988-01-16', 175, 'never_married', 'Hindu', 'Vishwakarma', NULL, 'yes', 'M.C.A', 'M.C.A Graduate', 'School Teacher', 'School Teacher Details', '₹3 Lakhs - ₹5 Lakhs', 'TCS', 'Tiruchirappalli', 'Trichy', 'Hi, I am Ponmani. I have completed my M.C.A and am currently working as a School Teacher at TCS in Tiruchirappalli. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'joint', 'middle_class', true, false, true, 100, NOW() - INTERVAL '10 days', 'Uttarachadha', 'Thulaam', 'Magaram', 'Agastya', 'free', 5, 5, 'vegetarian', 'no', 'no'
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
      '00000000-0000-4000-a000-0000000001d5', 'TM000469', 'Hari Nathan', 'male', '2002-06-16', 176, 'never_married', 'Hindu', 'Pillai', 'Pillai subcaste', 'yes', 'Ph.D', 'Ph.D Graduate', 'College Professor', 'College Professor Details', '₹15 Lakhs - ₹20 Lakhs', 'TCS', 'Tiruppur', 'Tiruppur', 'Hi, I am Hari. I have completed my Ph.D and am currently working as a College Professor at TCS in Tiruppur. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'joint', 'upper_middle_class', true, false, true, 100, NOW() - INTERVAL '4 days', 'Swati', 'Magaram', 'Mithunam', 'Harita', 'free', 5, 5, 'vegetarian', 'no', 'no'
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
      '00000000-0000-4000-a000-0000000001d6', 'TM000470', 'Gowri Swamy', 'female', '1991-11-04', 152, 'never_married', 'Hindu', 'Yadav', 'Yadav subcaste', 'no', 'M.Sc', 'M.Sc Graduate', 'Government Officer', 'Government Officer Details', '₹5 Lakhs - ₹7 Lakhs', 'TCS', 'Thoothukudi', 'Tuticorin', 'Hi, I am Gowri. I have completed my M.Sc and am currently working as a Government Officer at TCS in Thoothukudi. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'upper_middle_class', true, false, true, 100, NOW() - INTERVAL '6 days', 'Arudra', 'Meenam', 'Mesham', 'Atri', 'free', 5, 5, 'vegetarian', 'no', 'no'
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
      '00000000-0000-4000-a000-0000000001d7', 'TM000471', 'Arun Pandian', 'male', '2004-02-27', 182, 'never_married', 'Hindu', 'Chettiar', NULL, 'no', 'M.B.A', 'M.B.A Graduate', 'School Teacher', 'School Teacher Details', '₹15 Lakhs - ₹20 Lakhs', 'Zoho', 'Tiruppur', 'Tiruppur', 'Hi, I am Arun. I have completed my M.B.A and am currently working as a School Teacher at Zoho in Tiruppur. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'middle_class', false, false, true, 100, NOW() - INTERVAL '8 days', 'Shatabhisha', 'Mesham', 'Kadagam', 'Vishnu', 'free', 5, 5, 'vegetarian', 'no', 'no'
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
      '00000000-0000-4000-a000-0000000001d8', 'TM000472', 'Ramya Sundaram', 'female', '1989-10-24', 150, 'never_married', 'Hindu', 'Naidu', NULL, 'no', 'M.Com', 'M.Com Graduate', 'Civil Engineer', 'Civil Engineer Details', '₹20 Lakhs+', 'TCS', 'Vellore', 'Vellore', 'Hi, I am Ramya. I have completed my M.Com and am currently working as a Civil Engineer at TCS in Vellore. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'upper_middle_class', true, true, true, 100, NOW() - INTERVAL '7 days', 'Pushya', 'Viruchigam', 'Meenam', 'Gautama', 'gold', 50, 100, 'vegetarian', 'no', 'no'
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
      '00000000-0000-4000-a000-0000000001d9', 'TM000473', 'Madhavan Samy', 'male', '1992-01-24', 188, 'divorced', 'Hindu', 'Maravar', 'Maravar subcaste', 'no', 'M.A', 'M.A Graduate', 'Bank Manager', 'Bank Manager Details', '₹20 Lakhs+', 'TCS', 'Chennai', 'Chennai', 'Hi, I am Madhavan. I have completed my M.A and am currently working as a Bank Manager at TCS in Chennai. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'upper_middle_class', false, false, true, 100, NOW() - INTERVAL '5 days', 'Arudra', 'Rishabam', 'Rishabam', 'Vishnu', 'free', 5, 5, 'vegetarian', 'no', 'no'
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
      '00000000-0000-4000-a000-0000000001da', 'TM000474', 'Ramani Sundaram', 'female', '1994-02-28', 155, 'divorced', 'Muslim', 'Labbai', 'Labbai subcaste', 'no', 'M.C.A', 'M.C.A Graduate', 'School Teacher', 'School Teacher Details', '₹20 Lakhs+', 'HCL', 'Chennai', 'Chennai', 'Hi, I am Ramani. I have completed my M.C.A and am currently working as a School Teacher at HCL in Chennai. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'middle_class', true, false, true, 100, NOW() - INTERVAL '1 days', 'Rohini', 'Dhanusu', 'Kanni', 'Vashishta', 'free', 5, 5, 'vegetarian', 'no', 'no'
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
      '00000000-0000-4000-a000-0000000001db', 'TM000475', 'Chinnasamy Lingam', 'male', '1999-10-15', 167, 'never_married', 'Hindu', 'Kallar', NULL, 'no', 'B.Com', 'B.Com Graduate', 'Pharmacist', 'Pharmacist Details', '₹5 Lakhs - ₹7 Lakhs', 'Cognizant', 'Vellore', 'Vellore', 'Hi, I am Chinnasamy. I have completed my B.Com and am currently working as a Pharmacist at Cognizant in Vellore. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'joint', 'rich', true, false, true, 100, NOW() - INTERVAL '5 days', 'Vishakha', 'Mesham', 'Mesham', 'Atri', 'free', 5, 5, 'vegetarian', 'no', 'no'
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
      '00000000-0000-4000-a000-0000000001dc', 'TM000476', 'Abirami Shankar', 'female', '2002-08-02', 165, 'never_married', 'Hindu', 'Nadar', 'Nadar subcaste', 'no', 'Ph.D', 'Ph.D Graduate', 'Business Owner', 'Business Owner Details', '₹20 Lakhs+', 'Infosys', 'Thoothukudi', 'Tuticorin', 'Hi, I am Abirami. I have completed my Ph.D and am currently working as a Business Owner at Infosys in Thoothukudi. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'rich', false, true, true, 100, NOW() - INTERVAL '10 days', 'Mirgashira', 'Meenam', 'Magaram', 'Bharadwaj', 'gold', 50, 100, 'vegetarian', 'no', 'no'
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
      '00000000-0000-4000-a000-0000000001dd', 'TM000477', 'Vetrivel Sundaram', 'male', '2000-08-21', 170, 'never_married', 'Hindu', 'Mudaliar', NULL, 'no', 'B.Ed', 'B.Ed Graduate', 'Bank Manager', 'Bank Manager Details', '₹15 Lakhs - ₹20 Lakhs', 'Zoho', 'Salem', 'Salem', 'Hi, I am Vetrivel. I have completed my B.Ed and am currently working as a Bank Manager at Zoho in Salem. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'upper_middle_class', false, false, true, 100, NOW() - INTERVAL '3 days', 'Bharani', 'Meenam', 'Viruchigam', 'Kasyapa', 'free', 5, 5, 'vegetarian', 'no', 'no'
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
      '00000000-0000-4000-a000-0000000001de', 'TM000478', 'Harini Balan', 'female', '2003-04-26', 151, 'never_married', 'Hindu', 'Thevar', NULL, 'no', 'B.Sc', 'B.Sc Graduate', 'Architect', 'Architect Details', '₹10 Lakhs - ₹15 Lakhs', 'HCL', 'Salem', 'Salem', 'Hi, I am Harini. I have completed my B.Sc and am currently working as a Architect at HCL in Salem. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'middle_class', true, false, true, 100, NOW() - INTERVAL '9 days', 'Dhanishta', 'Thulaam', 'Kumbam', 'Harita', 'free', 5, 5, 'vegetarian', 'no', 'no'
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
      '00000000-0000-4000-a000-0000000001df', 'TM000479', 'Vignesh Nathan', 'male', '1995-06-03', 164, 'never_married', 'Hindu', 'Chettiar', 'Chettiar subcaste', 'yes', 'M.B.B.S', 'M.B.B.S Graduate', 'Dentist', 'Dentist Details', '₹3 Lakhs - ₹5 Lakhs', 'Zoho', 'Tiruppur', 'Tiruppur', 'Hi, I am Vignesh. I have completed my M.B.B.S and am currently working as a Dentist at Zoho in Tiruppur. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'middle_class', true, false, true, 100, NOW() - INTERVAL '10 days', 'Mirgashira', 'Rishabam', 'Kanni', 'Vashishta', 'free', 5, 5, 'vegetarian', 'no', 'no'
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
      '00000000-0000-4000-a000-0000000001e0', 'TM000480', 'Malarvizhi Krishnan', 'female', '1993-09-06', 175, 'never_married', 'Hindu', 'Brahmin - Iyengar', 'Brahmin - Iyengar subcaste', 'no', 'B.Ed', 'B.Ed Graduate', 'Doctor', 'Doctor Details', '₹10 Lakhs - ₹15 Lakhs', 'HCL', 'Erode', 'Erode', 'Hi, I am Malarvizhi. I have completed my B.Ed and am currently working as a Doctor at HCL in Erode. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'middle_class', false, true, true, 100, NOW() - INTERVAL '6 days', 'Bharani', 'Kadagam', 'Thulaam', 'Siva', 'gold', 50, 100, 'vegetarian', 'no', 'no'
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
      '00000000-0000-4000-a000-0000000001e1', 'TM000481', 'Karthik Pandian', 'male', '1999-05-12', 164, 'never_married', 'Hindu', 'Adi Dravida', 'Adi Dravida subcaste', 'no', 'M.Com', 'M.Com Graduate', 'Architect', 'Architect Details', '₹10 Lakhs - ₹15 Lakhs', 'Infosys', 'Madurai', 'Madurai', 'Hi, I am Karthik. I have completed my M.Com and am currently working as a Architect at Infosys in Madurai. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'rich', false, false, true, 100, NOW() - INTERVAL '0 days', 'Uttaraphalguni', 'Mithunam', 'Kanni', 'Atri', 'free', 5, 5, 'vegetarian', 'no', 'no'
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
      '00000000-0000-4000-a000-0000000001e2', 'TM000482', 'Ponmani Raj', 'female', '1993-06-11', 174, 'never_married', 'Hindu', 'Kallar', 'Kallar subcaste', 'no', 'M.C.A', 'M.C.A Graduate', 'Government Officer', 'Government Officer Details', '₹5 Lakhs - ₹7 Lakhs', 'Wipro', 'Vellore', 'Vellore', 'Hi, I am Ponmani. I have completed my M.C.A and am currently working as a Government Officer at Wipro in Vellore. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'upper_middle_class', false, false, true, 100, NOW() - INTERVAL '6 days', 'Krittika', 'Kumbam', 'Simham', 'Siva', 'free', 5, 5, 'vegetarian', 'no', 'no'
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
      '00000000-0000-4000-a000-0000000001e3', 'TM000483', 'Jayakumar Mani', 'male', '1997-12-22', 180, 'never_married', 'Hindu', 'Adi Dravida', NULL, 'no', 'M.C.A', 'M.C.A Graduate', 'Pharmacist', 'Pharmacist Details', '₹20 Lakhs+', 'Accenture', 'Coimbatore', 'Coimbatore', 'Hi, I am Jayakumar. I have completed my M.C.A and am currently working as a Pharmacist at Accenture in Coimbatore. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'middle_class', false, false, true, 100, NOW() - INTERVAL '7 days', 'Mirgashira', 'Simham', 'Meenam', 'Kasyapa', 'free', 5, 5, 'vegetarian', 'no', 'no'
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
      '00000000-0000-4000-a000-0000000001e4', 'TM000484', 'Shanthi Mani', 'female', '1994-08-08', 175, 'never_married', 'Hindu', 'Vanniyar', NULL, 'yes', 'B.A', 'B.A Graduate', 'Bank Manager', 'Bank Manager Details', '₹20 Lakhs+', 'Accenture', 'Madurai', 'Madurai', 'Hi, I am Shanthi. I have completed my B.A and am currently working as a Bank Manager at Accenture in Madurai. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'upper_middle_class', true, true, true, 100, NOW() - INTERVAL '4 days', 'Shatabhisha', 'Mesham', 'Thulaam', 'Gautama', 'gold', 50, 100, 'vegetarian', 'no', 'no'
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
      '00000000-0000-4000-a000-0000000001e5', 'TM000485', 'Kabilan Selvan', 'male', '1989-11-09', 182, 'never_married', 'Hindu', 'Chettiar', 'Chettiar subcaste', 'no', 'M.B.B.S', 'M.B.B.S Graduate', 'Police Officer', 'Police Officer Details', '₹20 Lakhs+', 'TCS', 'Tiruppur', 'Tiruppur', 'Hi, I am Kabilan. I have completed my M.B.B.S and am currently working as a Police Officer at TCS in Tiruppur. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'rich', true, true, true, 100, NOW() - INTERVAL '5 days', 'Krittika', 'Mesham', 'Viruchigam', 'Angirasa', 'gold', 50, 100, 'vegetarian', 'no', 'no'
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
      '00000000-0000-4000-a000-0000000001e6', 'TM000486', 'Janani Samy', 'female', '2002-02-13', 157, 'never_married', 'Hindu', 'Pillai', NULL, 'no', 'B.Ed', 'B.Ed Graduate', 'Government Officer', 'Government Officer Details', '₹5 Lakhs - ₹7 Lakhs', 'HCL', 'Kanchipuram', 'Kanchipuram', 'Hi, I am Janani. I have completed my B.Ed and am currently working as a Government Officer at HCL in Kanchipuram. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'rich', true, true, true, 100, NOW() - INTERVAL '9 days', 'Uttaraphalguni', 'Magaram', 'Simham', 'Harita', 'gold', 50, 100, 'vegetarian', 'no', 'no'
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
      '00000000-0000-4000-a000-0000000001e7', 'TM000487', 'Kannan Nathan', 'male', '1992-09-27', 188, 'never_married', 'Hindu', 'Agamudayar', NULL, 'no', 'B.Com', 'B.Com Graduate', 'Auditor', 'Auditor Details', '₹10 Lakhs - ₹15 Lakhs', 'HCL', 'Tiruchirappalli', 'Trichy', 'Hi, I am Kannan. I have completed my B.Com and am currently working as a Auditor at HCL in Tiruchirappalli. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'joint', 'middle_class', true, true, true, 100, NOW() - INTERVAL '8 days', 'Ashwini', 'Kanni', 'Dhanusu', 'Kasyapa', 'gold', 50, 100, 'vegetarian', 'no', 'no'
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
      '00000000-0000-4000-a000-0000000001e8', 'TM000488', 'Shalini Kumar', 'female', '1991-03-19', 164, 'divorced', 'Muslim', 'Shia Muslim', NULL, 'yes', 'M.A', 'M.A Graduate', 'Pharmacist', 'Pharmacist Details', '₹3 Lakhs - ₹5 Lakhs', 'TCS', 'Tiruppur', 'Tiruppur', 'Hi, I am Shalini. I have completed my M.A and am currently working as a Pharmacist at TCS in Tiruppur. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'joint', 'rich', false, false, true, 100, NOW() - INTERVAL '7 days', 'Uttarabhadrapada', 'Viruchigam', 'Kanni', 'Bharadwaj', 'free', 5, 5, 'vegetarian', 'no', 'no'
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
      '00000000-0000-4000-a000-0000000001e9', 'TM000489', 'Deepak Moorthy', 'male', '2002-11-07', 188, 'never_married', 'Hindu', 'Chettiar', NULL, 'no', 'B.A', 'B.A Graduate', 'Mechanical Engineer', 'Mechanical Engineer Details', '₹3 Lakhs - ₹5 Lakhs', 'Government Service', 'Salem', 'Salem', 'Hi, I am Deepak. I have completed my B.A and am currently working as a Mechanical Engineer at Government Service in Salem. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'middle_class', true, true, true, 100, NOW() - INTERVAL '6 days', 'Pushya', 'Viruchigam', 'Rishabam', 'Murugan', 'gold', 50, 100, 'vegetarian', 'no', 'no'
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
      '00000000-0000-4000-a000-0000000001ea', 'TM000490', 'Archana Shankar', 'female', '2005-05-01', 152, 'never_married', 'Hindu', 'Brahmin - Iyengar', 'Brahmin - Iyengar subcaste', 'yes', 'M.C.A', 'M.C.A Graduate', 'Dentist', 'Dentist Details', '₹7 Lakhs - ₹10 Lakhs', 'Wipro', 'Salem', 'Salem', 'Hi, I am Archana. I have completed my M.C.A and am currently working as a Dentist at Wipro in Salem. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'joint', 'upper_middle_class', true, true, true, 100, NOW() - INTERVAL '4 days', 'Jyeshta', 'Mesham', 'Kadagam', 'Atri', 'gold', 50, 100, 'vegetarian', 'no', 'no'
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
      '00000000-0000-4000-a000-0000000001eb', 'TM000491', 'Siva Selvan', 'male', '2005-09-01', 184, 'divorced', 'Muslim', 'Sunni Muslim', NULL, 'no', 'Ph.D', 'Ph.D Graduate', 'School Teacher', 'School Teacher Details', '₹15 Lakhs - ₹20 Lakhs', 'Private Practice', 'Tiruppur', 'Tiruppur', 'Hi, I am Siva. I have completed my Ph.D and am currently working as a School Teacher at Private Practice in Tiruppur. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'upper_middle_class', true, false, true, 100, NOW() - INTERVAL '5 days', 'Uttaraphalguni', 'Kanni', 'Kanni', 'Vishnu', 'free', 5, 5, 'vegetarian', 'no', 'no'
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
      '00000000-0000-4000-a000-0000000001ec', 'TM000492', 'Malarvizhi Murthy', 'female', '1995-10-09', 156, 'divorced', 'Hindu', 'Agamudayar', NULL, 'no', 'M.A', 'M.A Graduate', 'HR Specialist', 'HR Specialist Details', '₹5 Lakhs - ₹7 Lakhs', 'HCL', 'Salem', 'Salem', 'Hi, I am Malarvizhi. I have completed my M.A and am currently working as a HR Specialist at HCL in Salem. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'rich', true, false, true, 100, NOW() - INTERVAL '8 days', 'Dhanishta', 'Thulaam', 'Mithunam', 'Murugan', 'free', 5, 5, 'vegetarian', 'no', 'no'
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
      '00000000-0000-4000-a000-0000000001ed', 'TM000493', 'Mohan Balan', 'male', '1994-03-27', 171, 'never_married', 'Hindu', 'Naicker', NULL, 'no', 'B.E. / B.Tech', 'B.E. / B.Tech Graduate', 'Auditor', 'Auditor Details', '₹3 Lakhs - ₹5 Lakhs', 'Accenture', 'Vellore', 'Vellore', 'Hi, I am Mohan. I have completed my B.E. / B.Tech and am currently working as a Auditor at Accenture in Vellore. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'middle_class', true, true, true, 100, NOW() - INTERVAL '3 days', 'Dhanishta', 'Kumbam', 'Viruchigam', 'Gautama', 'gold', 50, 100, 'vegetarian', 'no', 'no'
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
      '00000000-0000-4000-a000-0000000001ee', 'TM000494', 'Harini Swamy', 'female', '2000-07-26', 156, 'never_married', 'Hindu', 'Agamudayar', 'Agamudayar subcaste', 'no', 'M.B.A', 'M.B.A Graduate', 'School Teacher', 'School Teacher Details', '₹5 Lakhs - ₹7 Lakhs', 'Self Employed', 'Madurai', 'Madurai', 'Hi, I am Harini. I have completed my M.B.A and am currently working as a School Teacher at Self Employed in Madurai. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'middle_class', false, false, true, 100, NOW() - INTERVAL '10 days', 'Anuradha', 'Dhanusu', 'Viruchigam', 'Murugan', 'free', 5, 5, 'vegetarian', 'no', 'no'
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
      '00000000-0000-4000-a000-0000000001ef', 'TM000495', 'Senthil Sundaram', 'male', '1991-03-15', 188, 'never_married', 'Christian', 'Pentecostal', 'Pentecostal subcaste', 'no', 'Ph.D', 'Ph.D Graduate', 'School Teacher', 'School Teacher Details', '₹15 Lakhs - ₹20 Lakhs', 'Infosys', 'Vellore', 'Vellore', 'Hi, I am Senthil. I have completed my Ph.D and am currently working as a School Teacher at Infosys in Vellore. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'rich', true, false, true, 100, NOW() - INTERVAL '4 days', 'Ashwini', 'Rishabam', 'Mesham', 'Vishnu', 'free', 5, 5, 'vegetarian', 'no', 'no'
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
      '00000000-0000-4000-a000-0000000001f0', 'TM000496', 'Sowmya Shankar', 'female', '2004-01-21', 164, 'never_married', 'Hindu', 'Arunthathiyar', 'Arunthathiyar subcaste', 'no', 'B.E. / B.Tech', 'B.E. / B.Tech Graduate', 'Doctor', 'Doctor Details', '₹15 Lakhs - ₹20 Lakhs', 'HCL', 'Vellore', 'Vellore', 'Hi, I am Sowmya. I have completed my B.E. / B.Tech and am currently working as a Doctor at HCL in Vellore. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'middle_class', true, false, true, 100, NOW() - INTERVAL '5 days', 'Poorvabhadrapada', 'Mesham', 'Simham', 'Agastya', 'free', 5, 5, 'vegetarian', 'no', 'no'
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
      '00000000-0000-4000-a000-0000000001f1', 'TM000497', 'Dinesh Kumar', 'male', '2000-03-13', 187, 'never_married', 'Hindu', 'Adi Dravida', NULL, 'no', 'Ph.D', 'Ph.D Graduate', 'Mechanical Engineer', 'Mechanical Engineer Details', '₹5 Lakhs - ₹7 Lakhs', 'Cognizant', 'Thanjavur', 'Thanjavur', 'Hi, I am Dinesh. I have completed my Ph.D and am currently working as a Mechanical Engineer at Cognizant in Thanjavur. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'rich', false, false, true, 100, NOW() - INTERVAL '7 days', 'Poorvaphalguni', 'Mesham', 'Thulaam', 'Angirasa', 'free', 5, 5, 'vegetarian', 'no', 'no'
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
      '00000000-0000-4000-a000-0000000001f2', 'TM000498', 'Saraswathi Velan', 'female', '1994-10-15', 162, 'divorced', 'Hindu', 'Naicker', NULL, 'no', 'M.B.B.S', 'M.B.B.S Graduate', 'HR Specialist', 'HR Specialist Details', '₹3 Lakhs - ₹5 Lakhs', 'Cognizant', 'Tirunelveli', 'Tirunelveli', 'Hi, I am Saraswathi. I have completed my M.B.B.S and am currently working as a HR Specialist at Cognizant in Tirunelveli. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'rich', true, false, true, 100, NOW() - INTERVAL '2 days', 'Moola', 'Mesham', 'Magaram', 'Vishnu', 'free', 5, 5, 'vegetarian', 'no', 'no'
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
      '00000000-0000-4000-a000-0000000001f3', 'TM000499', 'Sakthi Devan', 'male', '2005-08-25', 182, 'never_married', 'Hindu', 'Naidu', 'Naidu subcaste', 'no', 'M.B.A', 'M.B.A Graduate', 'Doctor', 'Doctor Details', '₹5 Lakhs - ₹7 Lakhs', 'Accenture', 'Tirunelveli', 'Tirunelveli', 'Hi, I am Sakthi. I have completed my M.B.A and am currently working as a Doctor at Accenture in Tirunelveli. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'middle_class', true, false, true, 100, NOW() - INTERVAL '7 days', 'Hasta', 'Kadagam', 'Magaram', 'Bharadwaj', 'free', 5, 5, 'vegetarian', 'no', 'no'
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
      '00000000-0000-4000-a000-0000000001f4', 'TM000500', 'Lakshmi Samy', 'female', '2004-07-12', 159, 'never_married', 'Hindu', 'Nadar', 'Nadar subcaste', 'no', 'Ph.D', 'Ph.D Graduate', 'Government Officer', 'Government Officer Details', '₹7 Lakhs - ₹10 Lakhs', 'Wipro', 'Chennai', 'Chennai', 'Hi, I am Lakshmi. I have completed my Ph.D and am currently working as a Government Officer at Wipro in Chennai. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'joint', 'upper_middle_class', true, false, true, 100, NOW() - INTERVAL '4 days', 'Mirgashira', 'Mithunam', 'Viruchigam', 'Siva', 'free', 5, 5, 'vegetarian', 'no', 'no'
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
VALUES ('00000000-0000-4000-a000-000000000155', 28, 44, ARRAY['Hindu']::TEXT[], ARRAY['Nadar', 'Caste No Bar']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, religion, caste)
VALUES ('00000000-0000-4000-a000-000000000156', 23, 43, ARRAY['Hindu']::TEXT[], ARRAY['Adi Dravida', 'Caste No Bar']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, religion, caste)
VALUES ('00000000-0000-4000-a000-000000000157', 28, 36, ARRAY['Muslim']::TEXT[], ARRAY['Rawther', 'Caste No Bar']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, religion, caste)
VALUES ('00000000-0000-4000-a000-000000000158', 24, 43, ARRAY['Hindu']::TEXT[], ARRAY['Brahmin - Iyengar', 'Caste No Bar']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, religion, caste)
VALUES ('00000000-0000-4000-a000-000000000159', 28, 44, ARRAY['Hindu']::TEXT[], ARRAY['Adi Dravida', 'Caste No Bar']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, religion, caste)
VALUES ('00000000-0000-4000-a000-00000000015a', 22, 44, ARRAY['Hindu']::TEXT[], ARRAY['Vishwakarma', 'Caste No Bar']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, religion, caste)
VALUES ('00000000-0000-4000-a000-00000000015b', 24, 35, ARRAY['Christian']::TEXT[], ARRAY['Protestant Christian', 'Caste No Bar']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, religion, caste)
VALUES ('00000000-0000-4000-a000-00000000015c', 25, 35, ARRAY['Hindu']::TEXT[], ARRAY['Brahmin - Iyer', 'Caste No Bar']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, religion, caste)
VALUES ('00000000-0000-4000-a000-00000000015d', 28, 45, ARRAY['Hindu']::TEXT[], ARRAY['Gounder', 'Caste No Bar']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, religion, caste)
VALUES ('00000000-0000-4000-a000-00000000015e', 21, 30, ARRAY['Hindu']::TEXT[], ARRAY['Vellalar', 'Caste No Bar']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, religion, caste)
VALUES ('00000000-0000-4000-a000-00000000015f', 27, 32, ARRAY['Hindu']::TEXT[], ARRAY['Naidu', 'Caste No Bar']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, religion, caste)
VALUES ('00000000-0000-4000-a000-000000000160', 27, 38, ARRAY['Hindu']::TEXT[], ARRAY['Kallar', 'Caste No Bar']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, religion, caste)
VALUES ('00000000-0000-4000-a000-000000000161', 21, 30, ARRAY['Hindu']::TEXT[], ARRAY['Maravar', 'Caste No Bar']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, religion, caste)
VALUES ('00000000-0000-4000-a000-000000000162', 23, 44, ARRAY['Hindu']::TEXT[], ARRAY['Chettiar', 'Caste No Bar']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, religion, caste)
VALUES ('00000000-0000-4000-a000-000000000163', 27, 42, ARRAY['Hindu']::TEXT[], ARRAY['Sengunthar', 'Caste No Bar']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, religion, caste)
VALUES ('00000000-0000-4000-a000-000000000164', 22, 39, ARRAY['Hindu']::TEXT[], ARRAY['Arunthathiyar', 'Caste No Bar']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, religion, caste)
VALUES ('00000000-0000-4000-a000-000000000165', 26, 34, ARRAY['Hindu']::TEXT[], ARRAY['Arunthathiyar', 'Caste No Bar']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, religion, caste)
VALUES ('00000000-0000-4000-a000-000000000166', 26, 41, ARRAY['Hindu']::TEXT[], ARRAY['Chettiar', 'Caste No Bar']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, religion, caste)
VALUES ('00000000-0000-4000-a000-000000000167', 27, 44, ARRAY['Muslim']::TEXT[], ARRAY['Marakayar', 'Caste No Bar']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, religion, caste)
VALUES ('00000000-0000-4000-a000-000000000168', 23, 41, ARRAY['Hindu']::TEXT[], ARRAY['Chettiar', 'Caste No Bar']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, religion, caste)
VALUES ('00000000-0000-4000-a000-000000000169', 21, 35, ARRAY['Hindu']::TEXT[], ARRAY['Thevar', 'Caste No Bar']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, religion, caste)
VALUES ('00000000-0000-4000-a000-00000000016a', 24, 39, ARRAY['Christian']::TEXT[], ARRAY['Protestant Christian', 'Caste No Bar']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, religion, caste)
VALUES ('00000000-0000-4000-a000-00000000016b', 23, 45, ARRAY['Hindu']::TEXT[], ARRAY['Sengunthar', 'Caste No Bar']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, religion, caste)
VALUES ('00000000-0000-4000-a000-00000000016c', 26, 35, ARRAY['Muslim']::TEXT[], ARRAY['Sunni Muslim', 'Caste No Bar']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, religion, caste)
VALUES ('00000000-0000-4000-a000-00000000016d', 28, 38, ARRAY['Hindu']::TEXT[], ARRAY['Pillai', 'Caste No Bar']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, religion, caste)
VALUES ('00000000-0000-4000-a000-00000000016e', 22, 36, ARRAY['Hindu']::TEXT[], ARRAY['Brahmin - Iyengar', 'Caste No Bar']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, religion, caste)
VALUES ('00000000-0000-4000-a000-00000000016f', 25, 45, ARRAY['Hindu']::TEXT[], ARRAY['Arunthathiyar', 'Caste No Bar']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, religion, caste)
VALUES ('00000000-0000-4000-a000-000000000170', 23, 44, ARRAY['Hindu']::TEXT[], ARRAY['Devendra Kula Vellalar', 'Caste No Bar']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, religion, caste)
VALUES ('00000000-0000-4000-a000-000000000171', 28, 36, ARRAY['Hindu']::TEXT[], ARRAY['Vishwakarma', 'Caste No Bar']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, religion, caste)
VALUES ('00000000-0000-4000-a000-000000000172', 28, 41, ARRAY['Hindu']::TEXT[], ARRAY['Mudaliar', 'Caste No Bar']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, religion, caste)
VALUES ('00000000-0000-4000-a000-000000000173', 24, 35, ARRAY['Christian']::TEXT[], ARRAY['Protestant Christian', 'Caste No Bar']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, religion, caste)
VALUES ('00000000-0000-4000-a000-000000000174', 22, 30, ARRAY['Hindu']::TEXT[], ARRAY['Nadar', 'Caste No Bar']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, religion, caste)
VALUES ('00000000-0000-4000-a000-000000000175', 21, 33, ARRAY['Hindu']::TEXT[], ARRAY['Pillai', 'Caste No Bar']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, religion, caste)
VALUES ('00000000-0000-4000-a000-000000000176', 27, 32, ARRAY['Muslim']::TEXT[], ARRAY['Sunni Muslim', 'Caste No Bar']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, religion, caste)
VALUES ('00000000-0000-4000-a000-000000000177', 27, 32, ARRAY['Hindu']::TEXT[], ARRAY['Arunthathiyar', 'Caste No Bar']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, religion, caste)
VALUES ('00000000-0000-4000-a000-000000000178', 25, 40, ARRAY['Hindu']::TEXT[], ARRAY['Vanniyar', 'Caste No Bar']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, religion, caste)
VALUES ('00000000-0000-4000-a000-000000000179', 27, 30, ARRAY['Hindu']::TEXT[], ARRAY['Nadar', 'Caste No Bar']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, religion, caste)
VALUES ('00000000-0000-4000-a000-00000000017a', 28, 31, ARRAY['Hindu']::TEXT[], ARRAY['Brahmin - Iyer', 'Caste No Bar']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, religion, caste)
VALUES ('00000000-0000-4000-a000-00000000017b', 27, 32, ARRAY['Hindu']::TEXT[], ARRAY['Chettiar', 'Caste No Bar']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, religion, caste)
VALUES ('00000000-0000-4000-a000-00000000017c', 24, 40, ARRAY['Hindu']::TEXT[], ARRAY['Kallar', 'Caste No Bar']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, religion, caste)
VALUES ('00000000-0000-4000-a000-00000000017d', 27, 35, ARRAY['Hindu']::TEXT[], ARRAY['Vellalar', 'Caste No Bar']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, religion, caste)
VALUES ('00000000-0000-4000-a000-00000000017e', 26, 43, ARRAY['Hindu']::TEXT[], ARRAY['Sengunthar', 'Caste No Bar']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, religion, caste)
VALUES ('00000000-0000-4000-a000-00000000017f', 26, 42, ARRAY['Hindu']::TEXT[], ARRAY['Devendra Kula Vellalar', 'Caste No Bar']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, religion, caste)
VALUES ('00000000-0000-4000-a000-000000000180', 22, 42, ARRAY['Hindu']::TEXT[], ARRAY['Arunthathiyar', 'Caste No Bar']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, religion, caste)
VALUES ('00000000-0000-4000-a000-000000000181', 23, 44, ARRAY['Hindu']::TEXT[], ARRAY['Yadav', 'Caste No Bar']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, religion, caste)
VALUES ('00000000-0000-4000-a000-000000000182', 24, 38, ARRAY['Muslim']::TEXT[], ARRAY['Marakayar', 'Caste No Bar']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, religion, caste)
VALUES ('00000000-0000-4000-a000-000000000183', 27, 34, ARRAY['Hindu']::TEXT[], ARRAY['Vellalar', 'Caste No Bar']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, religion, caste)
VALUES ('00000000-0000-4000-a000-000000000184', 28, 45, ARRAY['Hindu']::TEXT[], ARRAY['Naicker', 'Caste No Bar']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, religion, caste)
VALUES ('00000000-0000-4000-a000-000000000185', 25, 41, ARRAY['Hindu']::TEXT[], ARRAY['Pillai', 'Caste No Bar']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, religion, caste)
VALUES ('00000000-0000-4000-a000-000000000186', 24, 34, ARRAY['Hindu']::TEXT[], ARRAY['Maravar', 'Caste No Bar']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, religion, caste)
VALUES ('00000000-0000-4000-a000-000000000187', 22, 35, ARRAY['Hindu']::TEXT[], ARRAY['Nadar', 'Caste No Bar']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, religion, caste)
VALUES ('00000000-0000-4000-a000-000000000188', 22, 39, ARRAY['Christian']::TEXT[], ARRAY['RC Christian', 'Caste No Bar']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, religion, caste)
VALUES ('00000000-0000-4000-a000-000000000189', 27, 34, ARRAY['Hindu']::TEXT[], ARRAY['Adi Dravida', 'Caste No Bar']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, religion, caste)
VALUES ('00000000-0000-4000-a000-00000000018a', 22, 41, ARRAY['Hindu']::TEXT[], ARRAY['Thevar', 'Caste No Bar']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, religion, caste)
VALUES ('00000000-0000-4000-a000-00000000018b', 25, 39, ARRAY['Hindu']::TEXT[], ARRAY['Chettiar', 'Caste No Bar']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, religion, caste)
VALUES ('00000000-0000-4000-a000-00000000018c', 28, 42, ARRAY['Hindu']::TEXT[], ARRAY['Thevar', 'Caste No Bar']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, religion, caste)
VALUES ('00000000-0000-4000-a000-00000000018d', 27, 38, ARRAY['Hindu']::TEXT[], ARRAY['Thevar', 'Caste No Bar']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, religion, caste)
VALUES ('00000000-0000-4000-a000-00000000018e', 21, 43, ARRAY['Hindu']::TEXT[], ARRAY['Naicker', 'Caste No Bar']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, religion, caste)
VALUES ('00000000-0000-4000-a000-00000000018f', 24, 31, ARRAY['Hindu']::TEXT[], ARRAY['Naidu', 'Caste No Bar']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, religion, caste)
VALUES ('00000000-0000-4000-a000-000000000190', 21, 30, ARRAY['Hindu']::TEXT[], ARRAY['Chettiar', 'Caste No Bar']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, religion, caste)
VALUES ('00000000-0000-4000-a000-000000000191', 21, 38, ARRAY['Hindu']::TEXT[], ARRAY['Devendra Kula Vellalar', 'Caste No Bar']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, religion, caste)
VALUES ('00000000-0000-4000-a000-000000000192', 25, 45, ARRAY['Christian']::TEXT[], ARRAY['Nadar Christian', 'Caste No Bar']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, religion, caste)
VALUES ('00000000-0000-4000-a000-000000000193', 22, 36, ARRAY['Hindu']::TEXT[], ARRAY['Nadar', 'Caste No Bar']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, religion, caste)
VALUES ('00000000-0000-4000-a000-000000000194', 23, 44, ARRAY['Christian']::TEXT[], ARRAY['Pentecostal', 'Caste No Bar']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, religion, caste)
VALUES ('00000000-0000-4000-a000-000000000195', 26, 37, ARRAY['Muslim']::TEXT[], ARRAY['Rawther', 'Caste No Bar']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, religion, caste)
VALUES ('00000000-0000-4000-a000-000000000196', 27, 32, ARRAY['Hindu']::TEXT[], ARRAY['Kallar', 'Caste No Bar']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, religion, caste)
VALUES ('00000000-0000-4000-a000-000000000197', 27, 38, ARRAY['Hindu']::TEXT[], ARRAY['Naicker', 'Caste No Bar']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, religion, caste)
VALUES ('00000000-0000-4000-a000-000000000198', 26, 32, ARRAY['Hindu']::TEXT[], ARRAY['Devendra Kula Vellalar', 'Caste No Bar']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, religion, caste)
VALUES ('00000000-0000-4000-a000-000000000199', 28, 36, ARRAY['Hindu']::TEXT[], ARRAY['Kallar', 'Caste No Bar']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, religion, caste)
VALUES ('00000000-0000-4000-a000-00000000019a', 27, 40, ARRAY['Hindu']::TEXT[], ARRAY['Sengunthar', 'Caste No Bar']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, religion, caste)
VALUES ('00000000-0000-4000-a000-00000000019b', 25, 31, ARRAY['Hindu']::TEXT[], ARRAY['Naicker', 'Caste No Bar']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, religion, caste)
VALUES ('00000000-0000-4000-a000-00000000019c', 26, 38, ARRAY['Hindu']::TEXT[], ARRAY['Arunthathiyar', 'Caste No Bar']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, religion, caste)
VALUES ('00000000-0000-4000-a000-00000000019d', 24, 42, ARRAY['Christian']::TEXT[], ARRAY['CSI Christian', 'Caste No Bar']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, religion, caste)
VALUES ('00000000-0000-4000-a000-00000000019e', 27, 41, ARRAY['Hindu']::TEXT[], ARRAY['Yadav', 'Caste No Bar']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, religion, caste)
VALUES ('00000000-0000-4000-a000-00000000019f', 23, 35, ARRAY['Hindu']::TEXT[], ARRAY['Adi Dravida', 'Caste No Bar']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, religion, caste)
VALUES ('00000000-0000-4000-a000-0000000001a0', 22, 33, ARRAY['Hindu']::TEXT[], ARRAY['Kallar', 'Caste No Bar']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, religion, caste)
VALUES ('00000000-0000-4000-a000-0000000001a1', 27, 35, ARRAY['Hindu']::TEXT[], ARRAY['Vishwakarma', 'Caste No Bar']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, religion, caste)
VALUES ('00000000-0000-4000-a000-0000000001a2', 23, 36, ARRAY['Hindu']::TEXT[], ARRAY['Chettiar', 'Caste No Bar']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, religion, caste)
VALUES ('00000000-0000-4000-a000-0000000001a3', 23, 41, ARRAY['Hindu']::TEXT[], ARRAY['Naidu', 'Caste No Bar']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, religion, caste)
VALUES ('00000000-0000-4000-a000-0000000001a4', 25, 44, ARRAY['Muslim']::TEXT[], ARRAY['Rawther', 'Caste No Bar']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, religion, caste)
VALUES ('00000000-0000-4000-a000-0000000001a5', 24, 31, ARRAY['Hindu']::TEXT[], ARRAY['Vishwakarma', 'Caste No Bar']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, religion, caste)
VALUES ('00000000-0000-4000-a000-0000000001a6', 25, 32, ARRAY['Hindu']::TEXT[], ARRAY['Chettiar', 'Caste No Bar']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, religion, caste)
VALUES ('00000000-0000-4000-a000-0000000001a7', 28, 36, ARRAY['Hindu']::TEXT[], ARRAY['Kallar', 'Caste No Bar']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, religion, caste)
VALUES ('00000000-0000-4000-a000-0000000001a8', 25, 31, ARRAY['Hindu']::TEXT[], ARRAY['Brahmin - Iyengar', 'Caste No Bar']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, religion, caste)
VALUES ('00000000-0000-4000-a000-0000000001a9', 24, 34, ARRAY['Hindu']::TEXT[], ARRAY['Naidu', 'Caste No Bar']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, religion, caste)
VALUES ('00000000-0000-4000-a000-0000000001aa', 23, 43, ARRAY['Hindu']::TEXT[], ARRAY['Devendra Kula Vellalar', 'Caste No Bar']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, religion, caste)
VALUES ('00000000-0000-4000-a000-0000000001ab', 21, 34, ARRAY['Hindu']::TEXT[], ARRAY['Vellalar', 'Caste No Bar']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, religion, caste)
VALUES ('00000000-0000-4000-a000-0000000001ac', 23, 40, ARRAY['Hindu']::TEXT[], ARRAY['Chettiar', 'Caste No Bar']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, religion, caste)
VALUES ('00000000-0000-4000-a000-0000000001ad', 26, 40, ARRAY['Hindu']::TEXT[], ARRAY['Vellalar', 'Caste No Bar']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, religion, caste)
VALUES ('00000000-0000-4000-a000-0000000001ae', 21, 34, ARRAY['Christian']::TEXT[], ARRAY['Protestant Christian', 'Caste No Bar']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, religion, caste)
VALUES ('00000000-0000-4000-a000-0000000001af', 24, 33, ARRAY['Hindu']::TEXT[], ARRAY['Brahmin - Iyengar', 'Caste No Bar']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, religion, caste)
VALUES ('00000000-0000-4000-a000-0000000001b0', 25, 39, ARRAY['Hindu']::TEXT[], ARRAY['Maravar', 'Caste No Bar']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, religion, caste)
VALUES ('00000000-0000-4000-a000-0000000001b1', 24, 37, ARRAY['Hindu']::TEXT[], ARRAY['Vanniyar', 'Caste No Bar']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, religion, caste)
VALUES ('00000000-0000-4000-a000-0000000001b2', 27, 33, ARRAY['Christian']::TEXT[], ARRAY['Pentecostal', 'Caste No Bar']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, religion, caste)
VALUES ('00000000-0000-4000-a000-0000000001b3', 27, 30, ARRAY['Christian']::TEXT[], ARRAY['CSI Christian', 'Caste No Bar']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, religion, caste)
VALUES ('00000000-0000-4000-a000-0000000001b4', 21, 40, ARRAY['Hindu']::TEXT[], ARRAY['Agamudayar', 'Caste No Bar']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, religion, caste)
VALUES ('00000000-0000-4000-a000-0000000001b5', 25, 31, ARRAY['Muslim']::TEXT[], ARRAY['Sunni Muslim', 'Caste No Bar']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, religion, caste)
VALUES ('00000000-0000-4000-a000-0000000001b6', 25, 31, ARRAY['Hindu']::TEXT[], ARRAY['Gounder', 'Caste No Bar']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, religion, caste)
VALUES ('00000000-0000-4000-a000-0000000001b7', 26, 38, ARRAY['Hindu']::TEXT[], ARRAY['Vishwakarma', 'Caste No Bar']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, religion, caste)
VALUES ('00000000-0000-4000-a000-0000000001b8', 21, 38, ARRAY['Hindu']::TEXT[], ARRAY['Brahmin - Iyer', 'Caste No Bar']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, religion, caste)
VALUES ('00000000-0000-4000-a000-0000000001b9', 23, 45, ARRAY['Hindu']::TEXT[], ARRAY['Thevar', 'Caste No Bar']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, religion, caste)
VALUES ('00000000-0000-4000-a000-0000000001ba', 26, 34, ARRAY['Hindu']::TEXT[], ARRAY['Sengunthar', 'Caste No Bar']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, religion, caste)
VALUES ('00000000-0000-4000-a000-0000000001bb', 24, 34, ARRAY['Muslim']::TEXT[], ARRAY['Shia Muslim', 'Caste No Bar']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, religion, caste)
VALUES ('00000000-0000-4000-a000-0000000001bc', 24, 45, ARRAY['Hindu']::TEXT[], ARRAY['Naicker', 'Caste No Bar']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, religion, caste)
VALUES ('00000000-0000-4000-a000-0000000001bd', 24, 33, ARRAY['Hindu']::TEXT[], ARRAY['Brahmin - Iyer', 'Caste No Bar']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, religion, caste)
VALUES ('00000000-0000-4000-a000-0000000001be', 22, 44, ARRAY['Hindu']::TEXT[], ARRAY['Brahmin - Iyer', 'Caste No Bar']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, religion, caste)
VALUES ('00000000-0000-4000-a000-0000000001bf', 26, 31, ARRAY['Hindu']::TEXT[], ARRAY['Gounder', 'Caste No Bar']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, religion, caste)
VALUES ('00000000-0000-4000-a000-0000000001c0', 26, 30, ARRAY['Hindu']::TEXT[], ARRAY['Yadav', 'Caste No Bar']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, religion, caste)
VALUES ('00000000-0000-4000-a000-0000000001c1', 27, 41, ARRAY['Hindu']::TEXT[], ARRAY['Vanniyar', 'Caste No Bar']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, religion, caste)
VALUES ('00000000-0000-4000-a000-0000000001c2', 22, 45, ARRAY['Hindu']::TEXT[], ARRAY['Brahmin - Iyer', 'Caste No Bar']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, religion, caste)
VALUES ('00000000-0000-4000-a000-0000000001c3', 22, 43, ARRAY['Hindu']::TEXT[], ARRAY['Brahmin - Iyer', 'Caste No Bar']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, religion, caste)
VALUES ('00000000-0000-4000-a000-0000000001c4', 23, 45, ARRAY['Hindu']::TEXT[], ARRAY['Vishwakarma', 'Caste No Bar']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, religion, caste)
VALUES ('00000000-0000-4000-a000-0000000001c5', 26, 36, ARRAY['Hindu']::TEXT[], ARRAY['Yadav', 'Caste No Bar']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, religion, caste)
VALUES ('00000000-0000-4000-a000-0000000001c6', 22, 43, ARRAY['Hindu']::TEXT[], ARRAY['Vishwakarma', 'Caste No Bar']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, religion, caste)
VALUES ('00000000-0000-4000-a000-0000000001c7', 24, 44, ARRAY['Hindu']::TEXT[], ARRAY['Kallar', 'Caste No Bar']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, religion, caste)
VALUES ('00000000-0000-4000-a000-0000000001c8', 28, 37, ARRAY['Hindu']::TEXT[], ARRAY['Kallar', 'Caste No Bar']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, religion, caste)
VALUES ('00000000-0000-4000-a000-0000000001c9', 21, 42, ARRAY['Hindu']::TEXT[], ARRAY['Gounder', 'Caste No Bar']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, religion, caste)
VALUES ('00000000-0000-4000-a000-0000000001ca', 24, 30, ARRAY['Hindu']::TEXT[], ARRAY['Gounder', 'Caste No Bar']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, religion, caste)
VALUES ('00000000-0000-4000-a000-0000000001cb', 28, 42, ARRAY['Hindu']::TEXT[], ARRAY['Vellalar', 'Caste No Bar']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, religion, caste)
VALUES ('00000000-0000-4000-a000-0000000001cc', 26, 44, ARRAY['Hindu']::TEXT[], ARRAY['Kallar', 'Caste No Bar']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, religion, caste)
VALUES ('00000000-0000-4000-a000-0000000001cd', 22, 34, ARRAY['Hindu']::TEXT[], ARRAY['Mudaliar', 'Caste No Bar']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, religion, caste)
VALUES ('00000000-0000-4000-a000-0000000001ce', 28, 33, ARRAY['Hindu']::TEXT[], ARRAY['Adi Dravida', 'Caste No Bar']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, religion, caste)
VALUES ('00000000-0000-4000-a000-0000000001cf', 21, 35, ARRAY['Christian']::TEXT[], ARRAY['Vellalar Christian', 'Caste No Bar']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, religion, caste)
VALUES ('00000000-0000-4000-a000-0000000001d0', 26, 32, ARRAY['Hindu']::TEXT[], ARRAY['Vellalar', 'Caste No Bar']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, religion, caste)
VALUES ('00000000-0000-4000-a000-0000000001d1', 28, 35, ARRAY['Muslim']::TEXT[], ARRAY['Shia Muslim', 'Caste No Bar']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, religion, caste)
VALUES ('00000000-0000-4000-a000-0000000001d2', 27, 44, ARRAY['Hindu']::TEXT[], ARRAY['Vellalar', 'Caste No Bar']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, religion, caste)
VALUES ('00000000-0000-4000-a000-0000000001d3', 27, 31, ARRAY['Hindu']::TEXT[], ARRAY['Kallar', 'Caste No Bar']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, religion, caste)
VALUES ('00000000-0000-4000-a000-0000000001d4', 28, 34, ARRAY['Hindu']::TEXT[], ARRAY['Vishwakarma', 'Caste No Bar']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, religion, caste)
VALUES ('00000000-0000-4000-a000-0000000001d5', 22, 40, ARRAY['Hindu']::TEXT[], ARRAY['Pillai', 'Caste No Bar']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, religion, caste)
VALUES ('00000000-0000-4000-a000-0000000001d6', 28, 44, ARRAY['Hindu']::TEXT[], ARRAY['Yadav', 'Caste No Bar']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, religion, caste)
VALUES ('00000000-0000-4000-a000-0000000001d7', 26, 37, ARRAY['Hindu']::TEXT[], ARRAY['Chettiar', 'Caste No Bar']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, religion, caste)
VALUES ('00000000-0000-4000-a000-0000000001d8', 28, 34, ARRAY['Hindu']::TEXT[], ARRAY['Naidu', 'Caste No Bar']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, religion, caste)
VALUES ('00000000-0000-4000-a000-0000000001d9', 27, 44, ARRAY['Hindu']::TEXT[], ARRAY['Maravar', 'Caste No Bar']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, religion, caste)
VALUES ('00000000-0000-4000-a000-0000000001da', 27, 43, ARRAY['Muslim']::TEXT[], ARRAY['Labbai', 'Caste No Bar']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, religion, caste)
VALUES ('00000000-0000-4000-a000-0000000001db', 28, 33, ARRAY['Hindu']::TEXT[], ARRAY['Kallar', 'Caste No Bar']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, religion, caste)
VALUES ('00000000-0000-4000-a000-0000000001dc', 23, 42, ARRAY['Hindu']::TEXT[], ARRAY['Nadar', 'Caste No Bar']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, religion, caste)
VALUES ('00000000-0000-4000-a000-0000000001dd', 21, 32, ARRAY['Hindu']::TEXT[], ARRAY['Mudaliar', 'Caste No Bar']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, religion, caste)
VALUES ('00000000-0000-4000-a000-0000000001de', 24, 37, ARRAY['Hindu']::TEXT[], ARRAY['Thevar', 'Caste No Bar']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, religion, caste)
VALUES ('00000000-0000-4000-a000-0000000001df', 27, 41, ARRAY['Hindu']::TEXT[], ARRAY['Chettiar', 'Caste No Bar']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, religion, caste)
VALUES ('00000000-0000-4000-a000-0000000001e0', 26, 39, ARRAY['Hindu']::TEXT[], ARRAY['Brahmin - Iyengar', 'Caste No Bar']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, religion, caste)
VALUES ('00000000-0000-4000-a000-0000000001e1', 27, 31, ARRAY['Hindu']::TEXT[], ARRAY['Adi Dravida', 'Caste No Bar']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, religion, caste)
VALUES ('00000000-0000-4000-a000-0000000001e2', 25, 30, ARRAY['Hindu']::TEXT[], ARRAY['Kallar', 'Caste No Bar']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, religion, caste)
VALUES ('00000000-0000-4000-a000-0000000001e3', 26, 44, ARRAY['Hindu']::TEXT[], ARRAY['Adi Dravida', 'Caste No Bar']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, religion, caste)
VALUES ('00000000-0000-4000-a000-0000000001e4', 26, 32, ARRAY['Hindu']::TEXT[], ARRAY['Vanniyar', 'Caste No Bar']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, religion, caste)
VALUES ('00000000-0000-4000-a000-0000000001e5', 24, 41, ARRAY['Hindu']::TEXT[], ARRAY['Chettiar', 'Caste No Bar']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, religion, caste)
VALUES ('00000000-0000-4000-a000-0000000001e6', 27, 30, ARRAY['Hindu']::TEXT[], ARRAY['Pillai', 'Caste No Bar']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, religion, caste)
VALUES ('00000000-0000-4000-a000-0000000001e7', 24, 32, ARRAY['Hindu']::TEXT[], ARRAY['Agamudayar', 'Caste No Bar']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, religion, caste)
VALUES ('00000000-0000-4000-a000-0000000001e8', 25, 31, ARRAY['Muslim']::TEXT[], ARRAY['Shia Muslim', 'Caste No Bar']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, religion, caste)
VALUES ('00000000-0000-4000-a000-0000000001e9', 21, 42, ARRAY['Hindu']::TEXT[], ARRAY['Chettiar', 'Caste No Bar']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, religion, caste)
VALUES ('00000000-0000-4000-a000-0000000001ea', 27, 34, ARRAY['Hindu']::TEXT[], ARRAY['Brahmin - Iyengar', 'Caste No Bar']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, religion, caste)
VALUES ('00000000-0000-4000-a000-0000000001eb', 23, 38, ARRAY['Muslim']::TEXT[], ARRAY['Sunni Muslim', 'Caste No Bar']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, religion, caste)
VALUES ('00000000-0000-4000-a000-0000000001ec', 22, 40, ARRAY['Hindu']::TEXT[], ARRAY['Agamudayar', 'Caste No Bar']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, religion, caste)
VALUES ('00000000-0000-4000-a000-0000000001ed', 24, 31, ARRAY['Hindu']::TEXT[], ARRAY['Naicker', 'Caste No Bar']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, religion, caste)
VALUES ('00000000-0000-4000-a000-0000000001ee', 28, 38, ARRAY['Hindu']::TEXT[], ARRAY['Agamudayar', 'Caste No Bar']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, religion, caste)
VALUES ('00000000-0000-4000-a000-0000000001ef', 28, 40, ARRAY['Christian']::TEXT[], ARRAY['Pentecostal', 'Caste No Bar']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, religion, caste)
VALUES ('00000000-0000-4000-a000-0000000001f0', 23, 42, ARRAY['Hindu']::TEXT[], ARRAY['Arunthathiyar', 'Caste No Bar']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, religion, caste)
VALUES ('00000000-0000-4000-a000-0000000001f1', 21, 38, ARRAY['Hindu']::TEXT[], ARRAY['Adi Dravida', 'Caste No Bar']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, religion, caste)
VALUES ('00000000-0000-4000-a000-0000000001f2', 26, 30, ARRAY['Hindu']::TEXT[], ARRAY['Naicker', 'Caste No Bar']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, religion, caste)
VALUES ('00000000-0000-4000-a000-0000000001f3', 25, 31, ARRAY['Hindu']::TEXT[], ARRAY['Naidu', 'Caste No Bar']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, religion, caste)
VALUES ('00000000-0000-4000-a000-0000000001f4', 22, 35, ARRAY['Hindu']::TEXT[], ARRAY['Nadar', 'Caste No Bar']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste;

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
VALUES ('00000000-0000-4000-a000-000000000158', 'till_u_marry', 'pay_mock_1781511300960_1', 'active', 2499, NOW() - INTERVAL '5 days', NOW() + INTERVAL '6 month')
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.subscriptions (user_id, plan_type, razorpay_payment_id, status, amount, starts_at, expires_at)
VALUES ('00000000-0000-4000-a000-00000000015a', 'till_u_marry', 'pay_mock_1781511300960_2', 'active', 2499, NOW() - INTERVAL '5 days', NOW() + INTERVAL '6 month')
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.subscriptions (user_id, plan_type, razorpay_payment_id, status, amount, starts_at, expires_at)
VALUES ('00000000-0000-4000-a000-00000000015b', 'gold', 'pay_mock_1781511300960_3', 'active', 499, NOW() - INTERVAL '5 days', NOW() + INTERVAL '1 month')
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.subscriptions (user_id, plan_type, razorpay_payment_id, status, amount, starts_at, expires_at)
VALUES ('00000000-0000-4000-a000-00000000015f', 'gold', 'pay_mock_1781511300960_4', 'active', 499, NOW() - INTERVAL '5 days', NOW() + INTERVAL '1 month')
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.subscriptions (user_id, plan_type, razorpay_payment_id, status, amount, starts_at, expires_at)
VALUES ('00000000-0000-4000-a000-000000000163', 'prime_gold', 'pay_mock_1781511300960_5', 'active', 999, NOW() - INTERVAL '5 days', NOW() + INTERVAL '1 month')
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.subscriptions (user_id, plan_type, razorpay_payment_id, status, amount, starts_at, expires_at)
VALUES ('00000000-0000-4000-a000-000000000165', 'gold', 'pay_mock_1781511300960_6', 'active', 499, NOW() - INTERVAL '5 days', NOW() + INTERVAL '1 month')
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.subscriptions (user_id, plan_type, razorpay_payment_id, status, amount, starts_at, expires_at)
VALUES ('00000000-0000-4000-a000-00000000016a', 'gold', 'pay_mock_1781511300960_7', 'active', 499, NOW() - INTERVAL '5 days', NOW() + INTERVAL '1 month')
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.subscriptions (user_id, plan_type, razorpay_payment_id, status, amount, starts_at, expires_at)
VALUES ('00000000-0000-4000-a000-00000000016b', 'prime_gold', 'pay_mock_1781511300960_8', 'active', 999, NOW() - INTERVAL '5 days', NOW() + INTERVAL '1 month')
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.subscriptions (user_id, plan_type, razorpay_payment_id, status, amount, starts_at, expires_at)
VALUES ('00000000-0000-4000-a000-00000000016e', 'prime_gold', 'pay_mock_1781511300960_9', 'active', 999, NOW() - INTERVAL '5 days', NOW() + INTERVAL '1 month')
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.subscriptions (user_id, plan_type, razorpay_payment_id, status, amount, starts_at, expires_at)
VALUES ('00000000-0000-4000-a000-000000000171', 'gold', 'pay_mock_1781511300960_10', 'active', 499, NOW() - INTERVAL '5 days', NOW() + INTERVAL '1 month')
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.subscriptions (user_id, plan_type, razorpay_payment_id, status, amount, starts_at, expires_at)
VALUES ('00000000-0000-4000-a000-000000000174', 'gold', 'pay_mock_1781511300960_11', 'active', 499, NOW() - INTERVAL '5 days', NOW() + INTERVAL '1 month')
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.subscriptions (user_id, plan_type, razorpay_payment_id, status, amount, starts_at, expires_at)
VALUES ('00000000-0000-4000-a000-000000000178', 'prime_gold', 'pay_mock_1781511300960_12', 'active', 999, NOW() - INTERVAL '5 days', NOW() + INTERVAL '1 month')
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.subscriptions (user_id, plan_type, razorpay_payment_id, status, amount, starts_at, expires_at)
VALUES ('00000000-0000-4000-a000-000000000186', 'till_u_marry', 'pay_mock_1781511300960_13', 'active', 2499, NOW() - INTERVAL '5 days', NOW() + INTERVAL '6 month')
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.subscriptions (user_id, plan_type, razorpay_payment_id, status, amount, starts_at, expires_at)
VALUES ('00000000-0000-4000-a000-00000000018c', 'prime_gold', 'pay_mock_1781511300960_14', 'active', 999, NOW() - INTERVAL '5 days', NOW() + INTERVAL '1 month')
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.subscriptions (user_id, plan_type, razorpay_payment_id, status, amount, starts_at, expires_at)
VALUES ('00000000-0000-4000-a000-000000000191', 'till_u_marry', 'pay_mock_1781511300960_15', 'active', 2499, NOW() - INTERVAL '5 days', NOW() + INTERVAL '6 month')
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.subscriptions (user_id, plan_type, razorpay_payment_id, status, amount, starts_at, expires_at)
VALUES ('00000000-0000-4000-a000-000000000192', 'till_u_marry', 'pay_mock_1781511300960_16', 'active', 2499, NOW() - INTERVAL '5 days', NOW() + INTERVAL '6 month')
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.subscriptions (user_id, plan_type, razorpay_payment_id, status, amount, starts_at, expires_at)
VALUES ('00000000-0000-4000-a000-000000000193', 'gold', 'pay_mock_1781511300960_17', 'active', 499, NOW() - INTERVAL '5 days', NOW() + INTERVAL '1 month')
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.subscriptions (user_id, plan_type, razorpay_payment_id, status, amount, starts_at, expires_at)
VALUES ('00000000-0000-4000-a000-000000000196', 'gold', 'pay_mock_1781511300960_18', 'active', 499, NOW() - INTERVAL '5 days', NOW() + INTERVAL '1 month')
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.subscriptions (user_id, plan_type, razorpay_payment_id, status, amount, starts_at, expires_at)
VALUES ('00000000-0000-4000-a000-00000000019d', 'gold', 'pay_mock_1781511300960_19', 'active', 499, NOW() - INTERVAL '5 days', NOW() + INTERVAL '1 month')
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.subscriptions (user_id, plan_type, razorpay_payment_id, status, amount, starts_at, expires_at)
VALUES ('00000000-0000-4000-a000-00000000019f', 'prime_gold', 'pay_mock_1781511300960_20', 'active', 999, NOW() - INTERVAL '5 days', NOW() + INTERVAL '1 month')
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.subscriptions (user_id, plan_type, razorpay_payment_id, status, amount, starts_at, expires_at)
VALUES ('00000000-0000-4000-a000-0000000001a2', 'till_u_marry', 'pay_mock_1781511300960_21', 'active', 2499, NOW() - INTERVAL '5 days', NOW() + INTERVAL '6 month')
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.subscriptions (user_id, plan_type, razorpay_payment_id, status, amount, starts_at, expires_at)
VALUES ('00000000-0000-4000-a000-0000000001a3', 'till_u_marry', 'pay_mock_1781511300960_22', 'active', 2499, NOW() - INTERVAL '5 days', NOW() + INTERVAL '6 month')
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.subscriptions (user_id, plan_type, razorpay_payment_id, status, amount, starts_at, expires_at)
VALUES ('00000000-0000-4000-a000-0000000001a7', 'gold', 'pay_mock_1781511300960_23', 'active', 499, NOW() - INTERVAL '5 days', NOW() + INTERVAL '1 month')
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.subscriptions (user_id, plan_type, razorpay_payment_id, status, amount, starts_at, expires_at)
VALUES ('00000000-0000-4000-a000-0000000001ab', 'prime_gold', 'pay_mock_1781511300960_24', 'active', 999, NOW() - INTERVAL '5 days', NOW() + INTERVAL '1 month')
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.subscriptions (user_id, plan_type, razorpay_payment_id, status, amount, starts_at, expires_at)
VALUES ('00000000-0000-4000-a000-0000000001af', 'gold', 'pay_mock_1781511300960_25', 'active', 499, NOW() - INTERVAL '5 days', NOW() + INTERVAL '1 month')
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.subscriptions (user_id, plan_type, razorpay_payment_id, status, amount, starts_at, expires_at)
VALUES ('00000000-0000-4000-a000-0000000001b0', 'prime_gold', 'pay_mock_1781511300960_26', 'active', 999, NOW() - INTERVAL '5 days', NOW() + INTERVAL '1 month')
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.subscriptions (user_id, plan_type, razorpay_payment_id, status, amount, starts_at, expires_at)
VALUES ('00000000-0000-4000-a000-0000000001b1', 'gold', 'pay_mock_1781511300960_27', 'active', 499, NOW() - INTERVAL '5 days', NOW() + INTERVAL '1 month')
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.subscriptions (user_id, plan_type, razorpay_payment_id, status, amount, starts_at, expires_at)
VALUES ('00000000-0000-4000-a000-0000000001b2', 'gold', 'pay_mock_1781511300960_28', 'active', 499, NOW() - INTERVAL '5 days', NOW() + INTERVAL '1 month')
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.subscriptions (user_id, plan_type, razorpay_payment_id, status, amount, starts_at, expires_at)
VALUES ('00000000-0000-4000-a000-0000000001b3', 'gold', 'pay_mock_1781511300960_29', 'active', 499, NOW() - INTERVAL '5 days', NOW() + INTERVAL '1 month')
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.subscriptions (user_id, plan_type, razorpay_payment_id, status, amount, starts_at, expires_at)
VALUES ('00000000-0000-4000-a000-0000000001b8', 'gold', 'pay_mock_1781511300960_30', 'active', 499, NOW() - INTERVAL '5 days', NOW() + INTERVAL '1 month')
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.subscriptions (user_id, plan_type, razorpay_payment_id, status, amount, starts_at, expires_at)
VALUES ('00000000-0000-4000-a000-0000000001b9', 'till_u_marry', 'pay_mock_1781511300960_31', 'active', 2499, NOW() - INTERVAL '5 days', NOW() + INTERVAL '6 month')
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.subscriptions (user_id, plan_type, razorpay_payment_id, status, amount, starts_at, expires_at)
VALUES ('00000000-0000-4000-a000-0000000001ba', 'prime_gold', 'pay_mock_1781511300960_32', 'active', 999, NOW() - INTERVAL '5 days', NOW() + INTERVAL '1 month')
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.subscriptions (user_id, plan_type, razorpay_payment_id, status, amount, starts_at, expires_at)
VALUES ('00000000-0000-4000-a000-0000000001bb', 'gold', 'pay_mock_1781511300960_33', 'active', 499, NOW() - INTERVAL '5 days', NOW() + INTERVAL '1 month')
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.subscriptions (user_id, plan_type, razorpay_payment_id, status, amount, starts_at, expires_at)
VALUES ('00000000-0000-4000-a000-0000000001bc', 'till_u_marry', 'pay_mock_1781511300960_34', 'active', 2499, NOW() - INTERVAL '5 days', NOW() + INTERVAL '6 month')
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.subscriptions (user_id, plan_type, razorpay_payment_id, status, amount, starts_at, expires_at)
VALUES ('00000000-0000-4000-a000-0000000001c4', 'prime_gold', 'pay_mock_1781511300960_35', 'active', 999, NOW() - INTERVAL '5 days', NOW() + INTERVAL '1 month')
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.subscriptions (user_id, plan_type, razorpay_payment_id, status, amount, starts_at, expires_at)
VALUES ('00000000-0000-4000-a000-0000000001c5', 'prime_gold', 'pay_mock_1781511300960_36', 'active', 999, NOW() - INTERVAL '5 days', NOW() + INTERVAL '1 month')
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.subscriptions (user_id, plan_type, razorpay_payment_id, status, amount, starts_at, expires_at)
VALUES ('00000000-0000-4000-a000-0000000001c9', 'till_u_marry', 'pay_mock_1781511300960_37', 'active', 2499, NOW() - INTERVAL '5 days', NOW() + INTERVAL '6 month')
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.subscriptions (user_id, plan_type, razorpay_payment_id, status, amount, starts_at, expires_at)
VALUES ('00000000-0000-4000-a000-0000000001ca', 'gold', 'pay_mock_1781511300960_38', 'active', 499, NOW() - INTERVAL '5 days', NOW() + INTERVAL '1 month')
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.subscriptions (user_id, plan_type, razorpay_payment_id, status, amount, starts_at, expires_at)
VALUES ('00000000-0000-4000-a000-0000000001d1', 'gold', 'pay_mock_1781511300960_39', 'active', 499, NOW() - INTERVAL '5 days', NOW() + INTERVAL '1 month')
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.subscriptions (user_id, plan_type, razorpay_payment_id, status, amount, starts_at, expires_at)
VALUES ('00000000-0000-4000-a000-0000000001d3', 'till_u_marry', 'pay_mock_1781511300960_40', 'active', 2499, NOW() - INTERVAL '5 days', NOW() + INTERVAL '6 month')
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.subscriptions (user_id, plan_type, razorpay_payment_id, status, amount, starts_at, expires_at)
VALUES ('00000000-0000-4000-a000-0000000001d8', 'prime_gold', 'pay_mock_1781511300960_41', 'active', 999, NOW() - INTERVAL '5 days', NOW() + INTERVAL '1 month')
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.subscriptions (user_id, plan_type, razorpay_payment_id, status, amount, starts_at, expires_at)
VALUES ('00000000-0000-4000-a000-0000000001dc', 'prime_gold', 'pay_mock_1781511300960_42', 'active', 999, NOW() - INTERVAL '5 days', NOW() + INTERVAL '1 month')
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.subscriptions (user_id, plan_type, razorpay_payment_id, status, amount, starts_at, expires_at)
VALUES ('00000000-0000-4000-a000-0000000001e0', 'prime_gold', 'pay_mock_1781511300960_43', 'active', 999, NOW() - INTERVAL '5 days', NOW() + INTERVAL '1 month')
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.subscriptions (user_id, plan_type, razorpay_payment_id, status, amount, starts_at, expires_at)
VALUES ('00000000-0000-4000-a000-0000000001e4', 'prime_gold', 'pay_mock_1781511300960_44', 'active', 999, NOW() - INTERVAL '5 days', NOW() + INTERVAL '1 month')
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.subscriptions (user_id, plan_type, razorpay_payment_id, status, amount, starts_at, expires_at)
VALUES ('00000000-0000-4000-a000-0000000001e5', 'prime_gold', 'pay_mock_1781511300960_45', 'active', 999, NOW() - INTERVAL '5 days', NOW() + INTERVAL '1 month')
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.subscriptions (user_id, plan_type, razorpay_payment_id, status, amount, starts_at, expires_at)
VALUES ('00000000-0000-4000-a000-0000000001e6', 'till_u_marry', 'pay_mock_1781511300960_46', 'active', 2499, NOW() - INTERVAL '5 days', NOW() + INTERVAL '6 month')
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.subscriptions (user_id, plan_type, razorpay_payment_id, status, amount, starts_at, expires_at)
VALUES ('00000000-0000-4000-a000-0000000001e7', 'prime_gold', 'pay_mock_1781511300960_47', 'active', 999, NOW() - INTERVAL '5 days', NOW() + INTERVAL '1 month')
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.subscriptions (user_id, plan_type, razorpay_payment_id, status, amount, starts_at, expires_at)
VALUES ('00000000-0000-4000-a000-0000000001e9', 'gold', 'pay_mock_1781511300960_48', 'active', 499, NOW() - INTERVAL '5 days', NOW() + INTERVAL '1 month')
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.subscriptions (user_id, plan_type, razorpay_payment_id, status, amount, starts_at, expires_at)
VALUES ('00000000-0000-4000-a000-0000000001ea', 'till_u_marry', 'pay_mock_1781511300960_49', 'active', 2499, NOW() - INTERVAL '5 days', NOW() + INTERVAL '6 month')
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.subscriptions (user_id, plan_type, razorpay_payment_id, status, amount, starts_at, expires_at)
VALUES ('00000000-0000-4000-a000-0000000001ed', 'till_u_marry', 'pay_mock_1781511300960_50', 'active', 2499, NOW() - INTERVAL '5 days', NOW() + INTERVAL '6 month')
ON CONFLICT (id) DO NOTHING;

-- 7. MUTUAL INTERESTS INSERTIONS
INSERT INTO public.interests (sender_id, receiver_id, status, message)
VALUES ('00000000-0000-4000-a000-0000000001d1', '00000000-0000-4000-a000-0000000001ca', 'pending', 'Hi, I found your profile matching my preferences. Let us connect!')
ON CONFLICT (sender_id, receiver_id) DO NOTHING;
INSERT INTO public.interests (sender_id, receiver_id, status, message)
VALUES ('00000000-0000-4000-a000-0000000001e1', '00000000-0000-4000-a000-000000000168', 'pending', 'Hi, I found your profile matching my preferences. Let us connect!')
ON CONFLICT (sender_id, receiver_id) DO NOTHING;
INSERT INTO public.interests (sender_id, receiver_id, status, message)
VALUES ('00000000-0000-4000-a000-0000000001f3', '00000000-0000-4000-a000-000000000160', 'pending', 'Hi, I found your profile matching my preferences. Let us connect!')
ON CONFLICT (sender_id, receiver_id) DO NOTHING;
INSERT INTO public.interests (sender_id, receiver_id, status, message)
VALUES ('00000000-0000-4000-a000-0000000001bd', '00000000-0000-4000-a000-000000000176', 'pending', 'Hi, I found your profile matching my preferences. Let us connect!')
ON CONFLICT (sender_id, receiver_id) DO NOTHING;
INSERT INTO public.interests (sender_id, receiver_id, status, message)
VALUES ('00000000-0000-4000-a000-00000000015d', '00000000-0000-4000-a000-0000000001c6', 'pending', 'Hi, I found your profile matching my preferences. Let us connect!')
ON CONFLICT (sender_id, receiver_id) DO NOTHING;
INSERT INTO public.interests (sender_id, receiver_id, status, message)
VALUES ('00000000-0000-4000-a000-000000000199', '00000000-0000-4000-a000-0000000001e4', 'pending', 'Hi, I found your profile matching my preferences. Let us connect!')
ON CONFLICT (sender_id, receiver_id) DO NOTHING;
INSERT INTO public.interests (sender_id, receiver_id, status, message)
VALUES ('00000000-0000-4000-a000-000000000159', '00000000-0000-4000-a000-0000000001b4', 'pending', 'Hi, I found your profile matching my preferences. Let us connect!')
ON CONFLICT (sender_id, receiver_id) DO NOTHING;
INSERT INTO public.interests (sender_id, receiver_id, status, message)
VALUES ('00000000-0000-4000-a000-0000000001a5', '00000000-0000-4000-a000-000000000190', 'pending', 'Hi, I found your profile matching my preferences. Let us connect!')
ON CONFLICT (sender_id, receiver_id) DO NOTHING;
INSERT INTO public.interests (sender_id, receiver_id, status, message)
VALUES ('00000000-0000-4000-a000-0000000001c7', '00000000-0000-4000-a000-000000000170', 'pending', 'Hi, I found your profile matching my preferences. Let us connect!')
ON CONFLICT (sender_id, receiver_id) DO NOTHING;
INSERT INTO public.interests (sender_id, receiver_id, status, message)
VALUES ('00000000-0000-4000-a000-000000000197', '00000000-0000-4000-a000-0000000001a2', 'pending', 'Hi, I found your profile matching my preferences. Let us connect!')
ON CONFLICT (sender_id, receiver_id) DO NOTHING;
INSERT INTO public.interests (sender_id, receiver_id, status, message)
VALUES ('00000000-0000-4000-a000-0000000001df', '00000000-0000-4000-a000-0000000001f0', 'pending', 'Hi, I found your profile matching my preferences. Let us connect!')
ON CONFLICT (sender_id, receiver_id) DO NOTHING;
INSERT INTO public.interests (sender_id, receiver_id, status, message)
VALUES ('00000000-0000-4000-a000-00000000019d', '00000000-0000-4000-a000-000000000170', 'pending', 'Hi, I found your profile matching my preferences. Let us connect!')
ON CONFLICT (sender_id, receiver_id) DO NOTHING;
INSERT INTO public.interests (sender_id, receiver_id, status, message)
VALUES ('00000000-0000-4000-a000-000000000185', '00000000-0000-4000-a000-0000000001de', 'pending', 'Hi, I found your profile matching my preferences. Let us connect!')
ON CONFLICT (sender_id, receiver_id) DO NOTHING;
INSERT INTO public.interests (sender_id, receiver_id, status, message)
VALUES ('00000000-0000-4000-a000-0000000001a3', '00000000-0000-4000-a000-00000000017c', 'pending', 'Hi, I found your profile matching my preferences. Let us connect!')
ON CONFLICT (sender_id, receiver_id) DO NOTHING;
INSERT INTO public.interests (sender_id, receiver_id, status, message)
VALUES ('00000000-0000-4000-a000-000000000157', '00000000-0000-4000-a000-00000000016e', 'pending', 'Hi, I found your profile matching my preferences. Let us connect!')
ON CONFLICT (sender_id, receiver_id) DO NOTHING;
INSERT INTO public.interests (sender_id, receiver_id, status, message)
VALUES ('00000000-0000-4000-a000-0000000001a7', '00000000-0000-4000-a000-0000000001c0', 'pending', 'Hi, I found your profile matching my preferences. Let us connect!')
ON CONFLICT (sender_id, receiver_id) DO NOTHING;
INSERT INTO public.interests (sender_id, receiver_id, status, message)
VALUES ('00000000-0000-4000-a000-00000000019f', '00000000-0000-4000-a000-0000000001b0', 'pending', 'Hi, I found your profile matching my preferences. Let us connect!')
ON CONFLICT (sender_id, receiver_id) DO NOTHING;
INSERT INTO public.interests (sender_id, receiver_id, status, message)
VALUES ('00000000-0000-4000-a000-0000000001bb', '00000000-0000-4000-a000-0000000001e6', 'pending', 'Hi, I found your profile matching my preferences. Let us connect!')
ON CONFLICT (sender_id, receiver_id) DO NOTHING;
INSERT INTO public.interests (sender_id, receiver_id, status, message)
VALUES ('00000000-0000-4000-a000-0000000001c1', '00000000-0000-4000-a000-000000000182', 'pending', 'Hi, I found your profile matching my preferences. Let us connect!')
ON CONFLICT (sender_id, receiver_id) DO NOTHING;
INSERT INTO public.interests (sender_id, receiver_id, status, message)
VALUES ('00000000-0000-4000-a000-000000000169', '00000000-0000-4000-a000-000000000180', 'pending', 'Hi, I found your profile matching my preferences. Let us connect!')
ON CONFLICT (sender_id, receiver_id) DO NOTHING;
INSERT INTO public.interests (sender_id, receiver_id, status, message)
VALUES ('00000000-0000-4000-a000-000000000191', '00000000-0000-4000-a000-0000000001be', 'pending', 'Hi, I found your profile matching my preferences. Let us connect!')
ON CONFLICT (sender_id, receiver_id) DO NOTHING;
INSERT INTO public.interests (sender_id, receiver_id, status, message)
VALUES ('00000000-0000-4000-a000-0000000001c7', '00000000-0000-4000-a000-0000000001a8', 'pending', 'Hi, I found your profile matching my preferences. Let us connect!')
ON CONFLICT (sender_id, receiver_id) DO NOTHING;
INSERT INTO public.interests (sender_id, receiver_id, status, message)
VALUES ('00000000-0000-4000-a000-0000000001e1', '00000000-0000-4000-a000-0000000001e4', 'pending', 'Hi, I found your profile matching my preferences. Let us connect!')
ON CONFLICT (sender_id, receiver_id) DO NOTHING;
INSERT INTO public.interests (sender_id, receiver_id, status, message)
VALUES ('00000000-0000-4000-a000-0000000001b3', '00000000-0000-4000-a000-0000000001d6', 'pending', 'Hi, I found your profile matching my preferences. Let us connect!')
ON CONFLICT (sender_id, receiver_id) DO NOTHING;
INSERT INTO public.interests (sender_id, receiver_id, status, message)
VALUES ('00000000-0000-4000-a000-0000000001df', '00000000-0000-4000-a000-00000000017a', 'pending', 'Hi, I found your profile matching my preferences. Let us connect!')
ON CONFLICT (sender_id, receiver_id) DO NOTHING;
INSERT INTO public.interests (sender_id, receiver_id, status, message)
VALUES ('00000000-0000-4000-a000-0000000001e9', '00000000-0000-4000-a000-0000000001f2', 'pending', 'Hi, I found your profile matching my preferences. Let us connect!')
ON CONFLICT (sender_id, receiver_id) DO NOTHING;
INSERT INTO public.interests (sender_id, receiver_id, status, message)
VALUES ('00000000-0000-4000-a000-00000000015f', '00000000-0000-4000-a000-0000000001dc', 'pending', 'Hi, I found your profile matching my preferences. Let us connect!')
ON CONFLICT (sender_id, receiver_id) DO NOTHING;
INSERT INTO public.interests (sender_id, receiver_id, status, message)
VALUES ('00000000-0000-4000-a000-0000000001dd', '00000000-0000-4000-a000-0000000001a2', 'pending', 'Hi, I found your profile matching my preferences. Let us connect!')
ON CONFLICT (sender_id, receiver_id) DO NOTHING;
INSERT INTO public.interests (sender_id, receiver_id, status, message)
VALUES ('00000000-0000-4000-a000-00000000017d', '00000000-0000-4000-a000-000000000188', 'pending', 'Hi, I found your profile matching my preferences. Let us connect!')
ON CONFLICT (sender_id, receiver_id) DO NOTHING;
INSERT INTO public.interests (sender_id, receiver_id, status, message)
VALUES ('00000000-0000-4000-a000-0000000001c3', '00000000-0000-4000-a000-0000000001c2', 'pending', 'Hi, I found your profile matching my preferences. Let us connect!')
ON CONFLICT (sender_id, receiver_id) DO NOTHING;
INSERT INTO public.interests (sender_id, receiver_id, status, message)
VALUES ('00000000-0000-4000-a000-0000000001f3', '00000000-0000-4000-a000-00000000015c', 'pending', 'Hi, I found your profile matching my preferences. Let us connect!')
ON CONFLICT (sender_id, receiver_id) DO NOTHING;
INSERT INTO public.interests (sender_id, receiver_id, status, message)
VALUES ('00000000-0000-4000-a000-0000000001d7', '00000000-0000-4000-a000-0000000001b8', 'pending', 'Hi, I found your profile matching my preferences. Let us connect!')
ON CONFLICT (sender_id, receiver_id) DO NOTHING;
INSERT INTO public.interests (sender_id, receiver_id, status, message)
VALUES ('00000000-0000-4000-a000-0000000001e3', '00000000-0000-4000-a000-0000000001b0', 'pending', 'Hi, I found your profile matching my preferences. Let us connect!')
ON CONFLICT (sender_id, receiver_id) DO NOTHING;
INSERT INTO public.interests (sender_id, receiver_id, status, message)
VALUES ('00000000-0000-4000-a000-00000000015d', '00000000-0000-4000-a000-0000000001e6', 'pending', 'Hi, I found your profile matching my preferences. Let us connect!')
ON CONFLICT (sender_id, receiver_id) DO NOTHING;
INSERT INTO public.interests (sender_id, receiver_id, status, message)
VALUES ('00000000-0000-4000-a000-0000000001f1', '00000000-0000-4000-a000-00000000018c', 'pending', 'Hi, I found your profile matching my preferences. Let us connect!')
ON CONFLICT (sender_id, receiver_id) DO NOTHING;
INSERT INTO public.interests (sender_id, receiver_id, status, message)
VALUES ('00000000-0000-4000-a000-000000000155', '00000000-0000-4000-a000-0000000001b6', 'pending', 'Hi, I found your profile matching my preferences. Let us connect!')
ON CONFLICT (sender_id, receiver_id) DO NOTHING;
INSERT INTO public.interests (sender_id, receiver_id, status, message)
VALUES ('00000000-0000-4000-a000-0000000001c1', '00000000-0000-4000-a000-00000000016a', 'pending', 'Hi, I found your profile matching my preferences. Let us connect!')
ON CONFLICT (sender_id, receiver_id) DO NOTHING;
INSERT INTO public.interests (sender_id, receiver_id, status, message)
VALUES ('00000000-0000-4000-a000-000000000165', '00000000-0000-4000-a000-00000000015c', 'pending', 'Hi, I found your profile matching my preferences. Let us connect!')
ON CONFLICT (sender_id, receiver_id) DO NOTHING;
INSERT INTO public.interests (sender_id, receiver_id, status, message)
VALUES ('00000000-0000-4000-a000-00000000019b', '00000000-0000-4000-a000-000000000160', 'pending', 'Hi, I found your profile matching my preferences. Let us connect!')
ON CONFLICT (sender_id, receiver_id) DO NOTHING;
INSERT INTO public.interests (sender_id, receiver_id, status, message)
VALUES ('00000000-0000-4000-a000-0000000001c3', '00000000-0000-4000-a000-00000000015e', 'pending', 'Hi, I found your profile matching my preferences. Let us connect!')
ON CONFLICT (sender_id, receiver_id) DO NOTHING;
INSERT INTO public.interests (sender_id, receiver_id, status, message)
VALUES ('00000000-0000-4000-a000-000000000185', '00000000-0000-4000-a000-000000000198', 'pending', 'Hi, I found your profile matching my preferences. Let us connect!')
ON CONFLICT (sender_id, receiver_id) DO NOTHING;
INSERT INTO public.interests (sender_id, receiver_id, status, message)
VALUES ('00000000-0000-4000-a000-000000000185', '00000000-0000-4000-a000-00000000017e', 'pending', 'Hi, I found your profile matching my preferences. Let us connect!')
ON CONFLICT (sender_id, receiver_id) DO NOTHING;
INSERT INTO public.interests (sender_id, receiver_id, status, message)
VALUES ('00000000-0000-4000-a000-00000000017f', '00000000-0000-4000-a000-000000000188', 'pending', 'Hi, I found your profile matching my preferences. Let us connect!')
ON CONFLICT (sender_id, receiver_id) DO NOTHING;
INSERT INTO public.interests (sender_id, receiver_id, status, message)
VALUES ('00000000-0000-4000-a000-000000000165', '00000000-0000-4000-a000-000000000176', 'pending', 'Hi, I found your profile matching my preferences. Let us connect!')
ON CONFLICT (sender_id, receiver_id) DO NOTHING;
INSERT INTO public.interests (sender_id, receiver_id, status, message)
VALUES ('00000000-0000-4000-a000-000000000185', '00000000-0000-4000-a000-0000000001ca', 'pending', 'Hi, I found your profile matching my preferences. Let us connect!')
ON CONFLICT (sender_id, receiver_id) DO NOTHING;
INSERT INTO public.interests (sender_id, receiver_id, status, message)
VALUES ('00000000-0000-4000-a000-0000000001f1', '00000000-0000-4000-a000-00000000016e', 'pending', 'Hi, I found your profile matching my preferences. Let us connect!')
ON CONFLICT (sender_id, receiver_id) DO NOTHING;
INSERT INTO public.interests (sender_id, receiver_id, status, message)
VALUES ('00000000-0000-4000-a000-0000000001a7', '00000000-0000-4000-a000-0000000001f0', 'pending', 'Hi, I found your profile matching my preferences. Let us connect!')
ON CONFLICT (sender_id, receiver_id) DO NOTHING;
INSERT INTO public.interests (sender_id, receiver_id, status, message)
VALUES ('00000000-0000-4000-a000-00000000018d', '00000000-0000-4000-a000-00000000018c', 'pending', 'Hi, I found your profile matching my preferences. Let us connect!')
ON CONFLICT (sender_id, receiver_id) DO NOTHING;
INSERT INTO public.interests (sender_id, receiver_id, status, message)
VALUES ('00000000-0000-4000-a000-00000000017d', '00000000-0000-4000-a000-0000000001de', 'pending', 'Hi, I found your profile matching my preferences. Let us connect!')
ON CONFLICT (sender_id, receiver_id) DO NOTHING;
INSERT INTO public.interests (sender_id, receiver_id, status, message)
VALUES ('00000000-0000-4000-a000-0000000001ef', '00000000-0000-4000-a000-00000000019c', 'pending', 'Hi, I found your profile matching my preferences. Let us connect!')
ON CONFLICT (sender_id, receiver_id) DO NOTHING;
INSERT INTO public.interests (sender_id, receiver_id, status, message)
VALUES ('00000000-0000-4000-a000-0000000001a7', '00000000-0000-4000-a000-0000000001a8', 'pending', 'Hi, I found your profile matching my preferences. Let us connect!')
ON CONFLICT (sender_id, receiver_id) DO NOTHING;
INSERT INTO public.interests (sender_id, receiver_id, status, message)
VALUES ('00000000-0000-4000-a000-0000000001df', '00000000-0000-4000-a000-00000000018c', 'pending', 'Hi, I found your profile matching my preferences. Let us connect!')
ON CONFLICT (sender_id, receiver_id) DO NOTHING;
INSERT INTO public.interests (sender_id, receiver_id, status, message)
VALUES ('00000000-0000-4000-a000-000000000169', '00000000-0000-4000-a000-0000000001e2', 'pending', 'Hi, I found your profile matching my preferences. Let us connect!')
ON CONFLICT (sender_id, receiver_id) DO NOTHING;
INSERT INTO public.interests (sender_id, receiver_id, status, message)
VALUES ('00000000-0000-4000-a000-000000000185', '00000000-0000-4000-a000-000000000180', 'pending', 'Hi, I found your profile matching my preferences. Let us connect!')
ON CONFLICT (sender_id, receiver_id) DO NOTHING;
INSERT INTO public.interests (sender_id, receiver_id, status, message)
VALUES ('00000000-0000-4000-a000-00000000018b', '00000000-0000-4000-a000-0000000001e4', 'pending', 'Hi, I found your profile matching my preferences. Let us connect!')
ON CONFLICT (sender_id, receiver_id) DO NOTHING;
INSERT INTO public.interests (sender_id, receiver_id, status, message)
VALUES ('00000000-0000-4000-a000-0000000001e9', '00000000-0000-4000-a000-00000000016c', 'pending', 'Hi, I found your profile matching my preferences. Let us connect!')
ON CONFLICT (sender_id, receiver_id) DO NOTHING;
INSERT INTO public.interests (sender_id, receiver_id, status, message)
VALUES ('00000000-0000-4000-a000-0000000001f1', '00000000-0000-4000-a000-0000000001c0', 'pending', 'Hi, I found your profile matching my preferences. Let us connect!')
ON CONFLICT (sender_id, receiver_id) DO NOTHING;
INSERT INTO public.interests (sender_id, receiver_id, status, message)
VALUES ('00000000-0000-4000-a000-000000000183', '00000000-0000-4000-a000-00000000017c', 'pending', 'Hi, I found your profile matching my preferences. Let us connect!')
ON CONFLICT (sender_id, receiver_id) DO NOTHING;
INSERT INTO public.interests (sender_id, receiver_id, status, message)
VALUES ('00000000-0000-4000-a000-00000000018b', '00000000-0000-4000-a000-000000000176', 'pending', 'Hi, I found your profile matching my preferences. Let us connect!')
ON CONFLICT (sender_id, receiver_id) DO NOTHING;
INSERT INTO public.interests (sender_id, receiver_id, status, message)
VALUES ('00000000-0000-4000-a000-00000000016d', '00000000-0000-4000-a000-00000000019a', 'pending', 'Hi, I found your profile matching my preferences. Let us connect!')
ON CONFLICT (sender_id, receiver_id) DO NOTHING;

COMMIT;
