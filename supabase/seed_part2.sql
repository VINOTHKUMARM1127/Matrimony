-- ============================================================
-- Wedring Matrimony — Seeding Ecosystem (Part 2)
-- ============================================================

CREATE EXTENSION IF NOT EXISTS pgcrypto;

BEGIN;

-- 1. AUTH USERS INSERTIONS
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-0000000000ab', 'tamiluser171@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Ajith Gopal"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-0000000000ac', 'tamiluser172@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Kayalvizhi Murthy"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-0000000000ad', 'tamiluser173@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Murugan Naicker"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-0000000000ae', 'tamiluser174@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Kavitha Nathan"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-0000000000af', 'tamiluser175@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Murugan Gopal"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-0000000000b0', 'tamiluser176@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Indhumathi Balan"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-0000000000b1', 'tamiluser177@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Sundar Velan"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-0000000000b2', 'tamiluser178@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Sowmya Selvan"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-0000000000b3', 'tamiluser179@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Gautham Gopal"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-0000000000b4', 'tamiluser180@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Rajeshwari Raj"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-0000000000b5', 'tamiluser181@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Ganesan Mani"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-0000000000b6', 'tamiluser182@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Vijaya Velan"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-0000000000b7', 'tamiluser183@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Aravind Sundaram"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-0000000000b8', 'tamiluser184@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Malathi Nathan"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-0000000000b9', 'tamiluser185@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Suresh Samy"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-0000000000ba', 'tamiluser186@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Ramya Sundaram"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-0000000000bb', 'tamiluser187@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Naveen Nathan"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-0000000000bc', 'tamiluser188@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Gowri Lingam"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-0000000000bd', 'tamiluser189@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Ajith Balan"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-0000000000be', 'tamiluser190@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Deepa Selvan"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-0000000000bf', 'tamiluser191@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Manikandan Devan"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-0000000000c0', 'tamiluser192@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Divya Krishnan"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-0000000000c1', 'tamiluser193@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Murugan Kumar"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-0000000000c2', 'tamiluser194@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Archana Gopal"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-0000000000c3', 'tamiluser195@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Ramesh Nathan"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-0000000000c4', 'tamiluser196@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Abirami Shankar"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-0000000000c5', 'tamiluser197@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Jayakumar Raj"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-0000000000c6', 'tamiluser198@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Nivedha Kumar"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-0000000000c7', 'tamiluser199@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Saravanan Nathan"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-0000000000c8', 'tamiluser200@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Vanitha Moorthy"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-0000000000c9', 'tamiluser201@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Srinivasan Krishnan"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-0000000000ca', 'tamiluser202@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Gowri Swamy"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-0000000000cb', 'tamiluser203@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Naveen Selvan"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-0000000000cc', 'tamiluser204@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Vijaya Raj"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-0000000000cd', 'tamiluser205@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Naveen Raman"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-0000000000ce', 'tamiluser206@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Ramya Kumar"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-0000000000cf', 'tamiluser207@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Selvam Krishnan"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-0000000000d0', 'tamiluser208@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Preethi Devan"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-0000000000d1', 'tamiluser209@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Rajesh Moorthy"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-0000000000d2', 'tamiluser210@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Indhumathi Nathan"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-0000000000d3', 'tamiluser211@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Srinivasan Lingam"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-0000000000d4', 'tamiluser212@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Priya Lingam"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-0000000000d5', 'tamiluser213@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Dinesh Gopal"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-0000000000d6', 'tamiluser214@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Kayalvizhi Naicker"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-0000000000d7', 'tamiluser215@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Aravind Raman"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-0000000000d8', 'tamiluser216@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Meenakshi Velan"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-0000000000d9', 'tamiluser217@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Prakash Selvan"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-0000000000da', 'tamiluser218@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Chitra Balan"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-0000000000db', 'tamiluser219@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Manikandan Kumar"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-0000000000dc', 'tamiluser220@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Sowmya Gopal"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-0000000000dd', 'tamiluser221@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Chinnasamy Selvan"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-0000000000de', 'tamiluser222@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Gayathri Kumar"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-0000000000df', 'tamiluser223@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Deepak Kumar"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-0000000000e0', 'tamiluser224@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Abirami Mani"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-0000000000e1', 'tamiluser225@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Thirumal Lingam"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-0000000000e2', 'tamiluser226@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Pavithra Swamy"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-0000000000e3', 'tamiluser227@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Madhavan Krishnan"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-0000000000e4', 'tamiluser228@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Uma Murthy"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-0000000000e5', 'tamiluser229@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Ganesan Naicker"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-0000000000e6', 'tamiluser230@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Ponmani Kumar"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-0000000000e7', 'tamiluser231@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Prabhu Selvan"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-0000000000e8', 'tamiluser232@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Rekha Samy"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-0000000000e9', 'tamiluser233@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Senthil Devan"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-0000000000ea', 'tamiluser234@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Anitha Raman"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-0000000000eb', 'tamiluser235@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Arun Selvan"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-0000000000ec', 'tamiluser236@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Archana Shankar"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-0000000000ed', 'tamiluser237@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Elango Murthy"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-0000000000ee', 'tamiluser238@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Yazhini Lingam"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-0000000000ef', 'tamiluser239@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Thirumal Pandian"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-0000000000f0', 'tamiluser240@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Kavitha Balan"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-0000000000f1', 'tamiluser241@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Madhavan Sundaram"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-0000000000f2', 'tamiluser242@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Sowmya Gopal"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-0000000000f3', 'tamiluser243@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Ranjith Shankar"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-0000000000f4', 'tamiluser244@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Vidya Selvan"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-0000000000f5', 'tamiluser245@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Rajesh Selvan"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-0000000000f6', 'tamiluser246@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Vijaya Raman"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-0000000000f7', 'tamiluser247@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Rajesh Kumar"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-0000000000f8', 'tamiluser248@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Malarvizhi Pandian"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-0000000000f9', 'tamiluser249@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Madhavan Krishnan"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-0000000000fa', 'tamiluser250@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Deepa Raman"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-0000000000fb', 'tamiluser251@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Karthik Velan"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-0000000000fc', 'tamiluser252@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Shalini Devan"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-0000000000fd', 'tamiluser253@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Vignesh Moorthy"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-0000000000fe', 'tamiluser254@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Kavitha Lingam"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-0000000000ff', 'tamiluser255@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Ajith Velan"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-000000000100', 'tamiluser256@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Chitra Lingam"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-000000000101', 'tamiluser257@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Senthil Swamy"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-000000000102', 'tamiluser258@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Ramya Devan"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-000000000103', 'tamiluser259@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Ramakrishnan Swamy"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-000000000104', 'tamiluser260@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Oviya Mani"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-000000000105', 'tamiluser261@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Vetrivel Krishnan"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-000000000106', 'tamiluser262@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Nandhini Kumar"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-000000000107', 'tamiluser263@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Praveen Krishnan"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-000000000108', 'tamiluser264@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Sneha Mani"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-000000000109', 'tamiluser265@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Thirumal Gopal"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-00000000010a', 'tamiluser266@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Chitra Velan"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-00000000010b', 'tamiluser267@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Madhavan Raman"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-00000000010c', 'tamiluser268@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Priya Kumar"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-00000000010d', 'tamiluser269@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Vijay Swamy"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-00000000010e', 'tamiluser270@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Archana Samy"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-00000000010f', 'tamiluser271@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Jeeva Nathan"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-000000000110', 'tamiluser272@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Geetha Samy"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-000000000111', 'tamiluser273@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Ramakrishnan Kumar"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-000000000112', 'tamiluser274@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Vanitha Pandian"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-000000000113', 'tamiluser275@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Jayakumar Selvan"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-000000000114', 'tamiluser276@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Radha Lingam"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-000000000115', 'tamiluser277@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Ramesh Velan"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-000000000116', 'tamiluser278@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Malathi Gopal"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-000000000117', 'tamiluser279@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Thirumal Lingam"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-000000000118', 'tamiluser280@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Parvathi Naicker"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-000000000119', 'tamiluser281@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Murugan Swamy"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-00000000011a', 'tamiluser282@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Abirami Pandian"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-00000000011b', 'tamiluser283@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Murugan Lingam"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-00000000011c', 'tamiluser284@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Shanthi Raman"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-00000000011d', 'tamiluser285@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Naveen Velan"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-00000000011e', 'tamiluser286@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Ramya Samy"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-00000000011f', 'tamiluser287@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Murugan Kumar"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-000000000120', 'tamiluser288@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Archana Devan"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-000000000121', 'tamiluser289@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Kannan Selvan"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-000000000122', 'tamiluser290@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Sandhya Samy"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-000000000123', 'tamiluser291@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Prabhu Murthy"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-000000000124', 'tamiluser292@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Radha Samy"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-000000000125', 'tamiluser293@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Rajesh Sundaram"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-000000000126', 'tamiluser294@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Megala Shankar"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-000000000127', 'tamiluser295@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Kabilan Pandian"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-000000000128', 'tamiluser296@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Shanthi Nathan"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-000000000129', 'tamiluser297@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Anand Mani"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-00000000012a', 'tamiluser298@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Keerthana Naicker"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-00000000012b', 'tamiluser299@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Karthik Balan"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-00000000012c', 'tamiluser300@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Rekha Gopal"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-00000000012d', 'tamiluser301@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Sakthi Balan"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-00000000012e', 'tamiluser302@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Ponmani Moorthy"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-00000000012f', 'tamiluser303@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Kannan Shankar"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-000000000130', 'tamiluser304@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Deepa Moorthy"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-000000000131', 'tamiluser305@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Manikandan Mani"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-000000000132', 'tamiluser306@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Indhumathi Pandian"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-000000000133', 'tamiluser307@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Hari Devan"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-000000000134', 'tamiluser308@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Sowmya Selvan"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-000000000135', 'tamiluser309@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Surya Murthy"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-000000000136', 'tamiluser310@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Archana Lingam"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-000000000137', 'tamiluser311@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Jayakumar Balan"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-000000000138', 'tamiluser312@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Pooja Samy"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-000000000139', 'tamiluser313@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Vignesh Swamy"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-00000000013a', 'tamiluser314@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Archana Sundaram"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-00000000013b', 'tamiluser315@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Ganesan Murthy"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-00000000013c', 'tamiluser316@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Vijaya Kumar"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-00000000013d', 'tamiluser317@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Bala Swamy"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-00000000013e', 'tamiluser318@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Ramani Velan"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-00000000013f', 'tamiluser319@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Bala Balan"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-000000000140', 'tamiluser320@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Yazhini Gopal"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-000000000141', 'tamiluser321@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Manikandan Lingam"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-000000000142', 'tamiluser322@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Janani Samy"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-000000000143', 'tamiluser323@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Jayakumar Pandian"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-000000000144', 'tamiluser324@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Harini Mani"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-000000000145', 'tamiluser325@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Sundar Selvan"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-000000000146', 'tamiluser326@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Saraswathi Kumar"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-000000000147', 'tamiluser327@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Prakash Swamy"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-000000000148', 'tamiluser328@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Nandhini Murthy"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-000000000149', 'tamiluser329@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Senthil Sundaram"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-00000000014a', 'tamiluser330@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Radha Kumar"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-00000000014b', 'tamiluser331@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Senthil Raman"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-00000000014c', 'tamiluser332@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Shalini Shankar"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-00000000014d', 'tamiluser333@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Velmurugan Krishnan"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-00000000014e', 'tamiluser334@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Nandhini Devan"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-00000000014f', 'tamiluser335@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Saravanan Swamy"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-000000000150', 'tamiluser336@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Swetha Kumar"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-000000000151', 'tamiluser337@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Ramesh Pandian"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-000000000152', 'tamiluser338@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Rekha Gopal"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-000000000153', 'tamiluser339@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Velmurugan Velan"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-000000000154', 'tamiluser340@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Uma Mani"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;

-- 2. PUBLIC PROFILES INSERTIONS
INSERT INTO public.profiles (
      id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at, star, raasi, lagnam, gothram, tier, contacts_remaining, interests_remaining, food_habit, smoking, drinking
    ) VALUES (
      '00000000-0000-4000-a000-0000000000ab', 'TM000171', 'Ajith Gopal', 'male', '2000-11-12', 188, 'never_married', 'Hindu', 'Adi Dravida', 'Adi Dravida subcaste', 'yes', 'M.B.B.S', 'M.B.B.S Graduate', 'Government Officer', 'Government Officer Details', '₹5 Lakhs - ₹7 Lakhs', 'Zoho', 'Madurai', 'Madurai', 'Hi, I am Ajith. I have completed my M.B.B.S and am currently working as a Government Officer at Zoho in Madurai. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'middle_class', true, false, true, 100, NOW() - INTERVAL '6 days', 'Ashwini', 'Mesham', 'Simham', 'Atri', 'free', 5, 5, 'vegetarian', 'no', 'no'
    ) ON CONFLICT (id) DO UPDATE SET
      profile_id = EXCLUDED.profile_id,
      display_name = EXCLUDED.display_name,
      gender = EXCLUDED.gender,
      date_of_birth = EXCLUDED.date_of_birth,
      height_cm = EXCLUDED.height_cm,
      marital_status = EXCLUDED.marital_status,
      religion = EXCLUDED.religion,
      caste = EXCLUDED.caste,
      subcaste = EXCLUDED.subcaste,
      dosham = EXCLUDED.dosham,
      education = EXCLUDED.education,
      education_detail = EXCLUDED.education_detail,
      occupation = EXCLUDED.occupation,
      occupation_detail = EXCLUDED.occupation_detail,
      annual_income = EXCLUDED.annual_income,
      company_name = EXCLUDED.company_name,
      city = EXCLUDED.city,
      district = EXCLUDED.district,
      about_me = EXCLUDED.about_me,
      family_type = EXCLUDED.family_type,
      family_status = EXCLUDED.family_status,
      is_verified = EXCLUDED.is_verified,
      is_premium = EXCLUDED.is_premium,
      is_profile_complete = EXCLUDED.is_profile_complete,
      profile_completion_percent = EXCLUDED.profile_completion_percent,
      last_active_at = EXCLUDED.last_active_at,
      star = EXCLUDED.star,
      raasi = EXCLUDED.raasi,
      lagnam = EXCLUDED.lagnam,
      gothram = EXCLUDED.gothram,
      tier = EXCLUDED.tier,
      contacts_remaining = EXCLUDED.contacts_remaining,
      interests_remaining = EXCLUDED.interests_remaining,
      food_habit = EXCLUDED.food_habit,
      smoking = EXCLUDED.smoking,
      drinking = EXCLUDED.drinking;
INSERT INTO public.profiles (
      id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at, star, raasi, lagnam, gothram, tier, contacts_remaining, interests_remaining, food_habit, smoking, drinking
    ) VALUES (
      '00000000-0000-4000-a000-0000000000ac', 'TM000172', 'Kayalvizhi Murthy', 'female', '1997-01-17', 165, 'never_married', 'Hindu', 'Arunthathiyar', 'Arunthathiyar subcaste', 'no', 'B.Sc', 'B.Sc Graduate', 'Software Engineer', 'Software Engineer Details', '₹10 Lakhs - ₹15 Lakhs', 'Accenture', 'Salem', 'Salem', 'Hi, I am Kayalvizhi. I have completed my B.Sc and am currently working as a Software Engineer at Accenture in Salem. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'upper_middle_class', true, false, true, 100, NOW() - INTERVAL '5 days', 'Shatabhisha', 'Kanni', 'Viruchigam', 'Viswamitra', 'free', 5, 5, 'vegetarian', 'no', 'no'
    ) ON CONFLICT (id) DO UPDATE SET
      profile_id = EXCLUDED.profile_id,
      display_name = EXCLUDED.display_name,
      gender = EXCLUDED.gender,
      date_of_birth = EXCLUDED.date_of_birth,
      height_cm = EXCLUDED.height_cm,
      marital_status = EXCLUDED.marital_status,
      religion = EXCLUDED.religion,
      caste = EXCLUDED.caste,
      subcaste = EXCLUDED.subcaste,
      dosham = EXCLUDED.dosham,
      education = EXCLUDED.education,
      education_detail = EXCLUDED.education_detail,
      occupation = EXCLUDED.occupation,
      occupation_detail = EXCLUDED.occupation_detail,
      annual_income = EXCLUDED.annual_income,
      company_name = EXCLUDED.company_name,
      city = EXCLUDED.city,
      district = EXCLUDED.district,
      about_me = EXCLUDED.about_me,
      family_type = EXCLUDED.family_type,
      family_status = EXCLUDED.family_status,
      is_verified = EXCLUDED.is_verified,
      is_premium = EXCLUDED.is_premium,
      is_profile_complete = EXCLUDED.is_profile_complete,
      profile_completion_percent = EXCLUDED.profile_completion_percent,
      last_active_at = EXCLUDED.last_active_at,
      star = EXCLUDED.star,
      raasi = EXCLUDED.raasi,
      lagnam = EXCLUDED.lagnam,
      gothram = EXCLUDED.gothram,
      tier = EXCLUDED.tier,
      contacts_remaining = EXCLUDED.contacts_remaining,
      interests_remaining = EXCLUDED.interests_remaining,
      food_habit = EXCLUDED.food_habit,
      smoking = EXCLUDED.smoking,
      drinking = EXCLUDED.drinking;
INSERT INTO public.profiles (
      id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at, star, raasi, lagnam, gothram, tier, contacts_remaining, interests_remaining, food_habit, smoking, drinking
    ) VALUES (
      '00000000-0000-4000-a000-0000000000ad', 'TM000173', 'Murugan Naicker', 'male', '2004-03-02', 176, 'never_married', 'Hindu', 'Nadar', 'Nadar subcaste', 'no', 'B.E. / B.Tech', 'B.E. / B.Tech Graduate', 'Software Engineer', 'Software Engineer Details', '₹20 Lakhs+', 'Accenture', 'Tiruppur', 'Tiruppur', 'Hi, I am Murugan. I have completed my B.E. / B.Tech and am currently working as a Software Engineer at Accenture in Tiruppur. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'joint', 'upper_middle_class', true, true, true, 100, NOW() - INTERVAL '5 days', 'Aslesha', 'Kadagam', 'Viruchigam', 'Viswamitra', 'gold', 50, 100, 'vegetarian', 'no', 'no'
    ) ON CONFLICT (id) DO UPDATE SET
      profile_id = EXCLUDED.profile_id,
      display_name = EXCLUDED.display_name,
      gender = EXCLUDED.gender,
      date_of_birth = EXCLUDED.date_of_birth,
      height_cm = EXCLUDED.height_cm,
      marital_status = EXCLUDED.marital_status,
      religion = EXCLUDED.religion,
      caste = EXCLUDED.caste,
      subcaste = EXCLUDED.subcaste,
      dosham = EXCLUDED.dosham,
      education = EXCLUDED.education,
      education_detail = EXCLUDED.education_detail,
      occupation = EXCLUDED.occupation,
      occupation_detail = EXCLUDED.occupation_detail,
      annual_income = EXCLUDED.annual_income,
      company_name = EXCLUDED.company_name,
      city = EXCLUDED.city,
      district = EXCLUDED.district,
      about_me = EXCLUDED.about_me,
      family_type = EXCLUDED.family_type,
      family_status = EXCLUDED.family_status,
      is_verified = EXCLUDED.is_verified,
      is_premium = EXCLUDED.is_premium,
      is_profile_complete = EXCLUDED.is_profile_complete,
      profile_completion_percent = EXCLUDED.profile_completion_percent,
      last_active_at = EXCLUDED.last_active_at,
      star = EXCLUDED.star,
      raasi = EXCLUDED.raasi,
      lagnam = EXCLUDED.lagnam,
      gothram = EXCLUDED.gothram,
      tier = EXCLUDED.tier,
      contacts_remaining = EXCLUDED.contacts_remaining,
      interests_remaining = EXCLUDED.interests_remaining,
      food_habit = EXCLUDED.food_habit,
      smoking = EXCLUDED.smoking,
      drinking = EXCLUDED.drinking;
INSERT INTO public.profiles (
      id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at, star, raasi, lagnam, gothram, tier, contacts_remaining, interests_remaining, food_habit, smoking, drinking
    ) VALUES (
      '00000000-0000-4000-a000-0000000000ae', 'TM000174', 'Kavitha Nathan', 'female', '1993-02-06', 152, 'divorced', 'Hindu', 'Naidu', 'Naidu subcaste', 'no', 'B.E. / B.Tech', 'B.E. / B.Tech Graduate', 'Doctor', 'Doctor Details', '₹10 Lakhs - ₹15 Lakhs', 'Accenture', 'Erode', 'Erode', 'Hi, I am Kavitha. I have completed my B.E. / B.Tech and am currently working as a Doctor at Accenture in Erode. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'middle_class', false, true, true, 100, NOW() - INTERVAL '7 days', 'Poorvaphalguni', 'Mithunam', 'Kumbam', 'Bharadwaj', 'gold', 50, 100, 'vegetarian', 'no', 'no'
    ) ON CONFLICT (id) DO UPDATE SET
      profile_id = EXCLUDED.profile_id,
      display_name = EXCLUDED.display_name,
      gender = EXCLUDED.gender,
      date_of_birth = EXCLUDED.date_of_birth,
      height_cm = EXCLUDED.height_cm,
      marital_status = EXCLUDED.marital_status,
      religion = EXCLUDED.religion,
      caste = EXCLUDED.caste,
      subcaste = EXCLUDED.subcaste,
      dosham = EXCLUDED.dosham,
      education = EXCLUDED.education,
      education_detail = EXCLUDED.education_detail,
      occupation = EXCLUDED.occupation,
      occupation_detail = EXCLUDED.occupation_detail,
      annual_income = EXCLUDED.annual_income,
      company_name = EXCLUDED.company_name,
      city = EXCLUDED.city,
      district = EXCLUDED.district,
      about_me = EXCLUDED.about_me,
      family_type = EXCLUDED.family_type,
      family_status = EXCLUDED.family_status,
      is_verified = EXCLUDED.is_verified,
      is_premium = EXCLUDED.is_premium,
      is_profile_complete = EXCLUDED.is_profile_complete,
      profile_completion_percent = EXCLUDED.profile_completion_percent,
      last_active_at = EXCLUDED.last_active_at,
      star = EXCLUDED.star,
      raasi = EXCLUDED.raasi,
      lagnam = EXCLUDED.lagnam,
      gothram = EXCLUDED.gothram,
      tier = EXCLUDED.tier,
      contacts_remaining = EXCLUDED.contacts_remaining,
      interests_remaining = EXCLUDED.interests_remaining,
      food_habit = EXCLUDED.food_habit,
      smoking = EXCLUDED.smoking,
      drinking = EXCLUDED.drinking;
INSERT INTO public.profiles (
      id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at, star, raasi, lagnam, gothram, tier, contacts_remaining, interests_remaining, food_habit, smoking, drinking
    ) VALUES (
      '00000000-0000-4000-a000-0000000000af', 'TM000175', 'Murugan Gopal', 'male', '1996-05-07', 174, 'never_married', 'Hindu', 'Pillai', 'Pillai subcaste', 'yes', 'B.E. / B.Tech', 'B.E. / B.Tech Graduate', 'Bank Manager', 'Bank Manager Details', '₹10 Lakhs - ₹15 Lakhs', 'Government Service', 'Vellore', 'Vellore', 'Hi, I am Murugan. I have completed my B.E. / B.Tech and am currently working as a Bank Manager at Government Service in Vellore. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'rich', false, true, true, 100, NOW() - INTERVAL '8 days', 'Uttarabhadrapada', 'Rishabam', 'Dhanusu', 'Harita', 'gold', 50, 100, 'vegetarian', 'no', 'no'
    ) ON CONFLICT (id) DO UPDATE SET
      profile_id = EXCLUDED.profile_id,
      display_name = EXCLUDED.display_name,
      gender = EXCLUDED.gender,
      date_of_birth = EXCLUDED.date_of_birth,
      height_cm = EXCLUDED.height_cm,
      marital_status = EXCLUDED.marital_status,
      religion = EXCLUDED.religion,
      caste = EXCLUDED.caste,
      subcaste = EXCLUDED.subcaste,
      dosham = EXCLUDED.dosham,
      education = EXCLUDED.education,
      education_detail = EXCLUDED.education_detail,
      occupation = EXCLUDED.occupation,
      occupation_detail = EXCLUDED.occupation_detail,
      annual_income = EXCLUDED.annual_income,
      company_name = EXCLUDED.company_name,
      city = EXCLUDED.city,
      district = EXCLUDED.district,
      about_me = EXCLUDED.about_me,
      family_type = EXCLUDED.family_type,
      family_status = EXCLUDED.family_status,
      is_verified = EXCLUDED.is_verified,
      is_premium = EXCLUDED.is_premium,
      is_profile_complete = EXCLUDED.is_profile_complete,
      profile_completion_percent = EXCLUDED.profile_completion_percent,
      last_active_at = EXCLUDED.last_active_at,
      star = EXCLUDED.star,
      raasi = EXCLUDED.raasi,
      lagnam = EXCLUDED.lagnam,
      gothram = EXCLUDED.gothram,
      tier = EXCLUDED.tier,
      contacts_remaining = EXCLUDED.contacts_remaining,
      interests_remaining = EXCLUDED.interests_remaining,
      food_habit = EXCLUDED.food_habit,
      smoking = EXCLUDED.smoking,
      drinking = EXCLUDED.drinking;
INSERT INTO public.profiles (
      id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at, star, raasi, lagnam, gothram, tier, contacts_remaining, interests_remaining, food_habit, smoking, drinking
    ) VALUES (
      '00000000-0000-4000-a000-0000000000b0', 'TM000176', 'Indhumathi Balan', 'female', '1996-07-21', 152, 'never_married', 'Hindu', 'Yadav', NULL, 'no', 'Ph.D', 'Ph.D Graduate', 'Architect', 'Architect Details', '₹7 Lakhs - ₹10 Lakhs', 'Government Service', 'Tiruchirappalli', 'Trichy', 'Hi, I am Indhumathi. I have completed my Ph.D and am currently working as a Architect at Government Service in Tiruchirappalli. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'middle_class', true, false, true, 100, NOW() - INTERVAL '9 days', 'Pushya', 'Viruchigam', 'Mesham', 'Gautama', 'free', 5, 5, 'vegetarian', 'no', 'no'
    ) ON CONFLICT (id) DO UPDATE SET
      profile_id = EXCLUDED.profile_id,
      display_name = EXCLUDED.display_name,
      gender = EXCLUDED.gender,
      date_of_birth = EXCLUDED.date_of_birth,
      height_cm = EXCLUDED.height_cm,
      marital_status = EXCLUDED.marital_status,
      religion = EXCLUDED.religion,
      caste = EXCLUDED.caste,
      subcaste = EXCLUDED.subcaste,
      dosham = EXCLUDED.dosham,
      education = EXCLUDED.education,
      education_detail = EXCLUDED.education_detail,
      occupation = EXCLUDED.occupation,
      occupation_detail = EXCLUDED.occupation_detail,
      annual_income = EXCLUDED.annual_income,
      company_name = EXCLUDED.company_name,
      city = EXCLUDED.city,
      district = EXCLUDED.district,
      about_me = EXCLUDED.about_me,
      family_type = EXCLUDED.family_type,
      family_status = EXCLUDED.family_status,
      is_verified = EXCLUDED.is_verified,
      is_premium = EXCLUDED.is_premium,
      is_profile_complete = EXCLUDED.is_profile_complete,
      profile_completion_percent = EXCLUDED.profile_completion_percent,
      last_active_at = EXCLUDED.last_active_at,
      star = EXCLUDED.star,
      raasi = EXCLUDED.raasi,
      lagnam = EXCLUDED.lagnam,
      gothram = EXCLUDED.gothram,
      tier = EXCLUDED.tier,
      contacts_remaining = EXCLUDED.contacts_remaining,
      interests_remaining = EXCLUDED.interests_remaining,
      food_habit = EXCLUDED.food_habit,
      smoking = EXCLUDED.smoking,
      drinking = EXCLUDED.drinking;
INSERT INTO public.profiles (
      id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at, star, raasi, lagnam, gothram, tier, contacts_remaining, interests_remaining, food_habit, smoking, drinking
    ) VALUES (
      '00000000-0000-4000-a000-0000000000b1', 'TM000177', 'Sundar Velan', 'male', '1991-04-25', 163, 'never_married', 'Christian', 'Protestant Christian', NULL, 'no', 'B.E. / B.Tech', 'B.E. / B.Tech Graduate', 'Doctor', 'Doctor Details', '₹20 Lakhs+', 'Wipro', 'Vellore', 'Vellore', 'Hi, I am Sundar. I have completed my B.E. / B.Tech and am currently working as a Doctor at Wipro in Vellore. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'middle_class', true, true, true, 100, NOW() - INTERVAL '9 days', 'Uttarabhadrapada', 'Mesham', 'Kanni', 'Angirasa', 'gold', 50, 100, 'vegetarian', 'no', 'no'
    ) ON CONFLICT (id) DO UPDATE SET
      profile_id = EXCLUDED.profile_id,
      display_name = EXCLUDED.display_name,
      gender = EXCLUDED.gender,
      date_of_birth = EXCLUDED.date_of_birth,
      height_cm = EXCLUDED.height_cm,
      marital_status = EXCLUDED.marital_status,
      religion = EXCLUDED.religion,
      caste = EXCLUDED.caste,
      subcaste = EXCLUDED.subcaste,
      dosham = EXCLUDED.dosham,
      education = EXCLUDED.education,
      education_detail = EXCLUDED.education_detail,
      occupation = EXCLUDED.occupation,
      occupation_detail = EXCLUDED.occupation_detail,
      annual_income = EXCLUDED.annual_income,
      company_name = EXCLUDED.company_name,
      city = EXCLUDED.city,
      district = EXCLUDED.district,
      about_me = EXCLUDED.about_me,
      family_type = EXCLUDED.family_type,
      family_status = EXCLUDED.family_status,
      is_verified = EXCLUDED.is_verified,
      is_premium = EXCLUDED.is_premium,
      is_profile_complete = EXCLUDED.is_profile_complete,
      profile_completion_percent = EXCLUDED.profile_completion_percent,
      last_active_at = EXCLUDED.last_active_at,
      star = EXCLUDED.star,
      raasi = EXCLUDED.raasi,
      lagnam = EXCLUDED.lagnam,
      gothram = EXCLUDED.gothram,
      tier = EXCLUDED.tier,
      contacts_remaining = EXCLUDED.contacts_remaining,
      interests_remaining = EXCLUDED.interests_remaining,
      food_habit = EXCLUDED.food_habit,
      smoking = EXCLUDED.smoking,
      drinking = EXCLUDED.drinking;
INSERT INTO public.profiles (
      id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at, star, raasi, lagnam, gothram, tier, contacts_remaining, interests_remaining, food_habit, smoking, drinking
    ) VALUES (
      '00000000-0000-4000-a000-0000000000b2', 'TM000178', 'Sowmya Selvan', 'female', '1989-01-19', 159, 'never_married', 'Hindu', 'Nadar', 'Nadar subcaste', 'no', 'B.E. / B.Tech', 'B.E. / B.Tech Graduate', 'Advocate', 'Advocate Details', '₹10 Lakhs - ₹15 Lakhs', 'Infosys', 'Kanchipuram', 'Kanchipuram', 'Hi, I am Sowmya. I have completed my B.E. / B.Tech and am currently working as a Advocate at Infosys in Kanchipuram. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'rich', true, true, true, 100, NOW() - INTERVAL '6 days', 'Jyeshta', 'Kanni', 'Kumbam', 'Harita', 'gold', 50, 100, 'vegetarian', 'no', 'no'
    ) ON CONFLICT (id) DO UPDATE SET
      profile_id = EXCLUDED.profile_id,
      display_name = EXCLUDED.display_name,
      gender = EXCLUDED.gender,
      date_of_birth = EXCLUDED.date_of_birth,
      height_cm = EXCLUDED.height_cm,
      marital_status = EXCLUDED.marital_status,
      religion = EXCLUDED.religion,
      caste = EXCLUDED.caste,
      subcaste = EXCLUDED.subcaste,
      dosham = EXCLUDED.dosham,
      education = EXCLUDED.education,
      education_detail = EXCLUDED.education_detail,
      occupation = EXCLUDED.occupation,
      occupation_detail = EXCLUDED.occupation_detail,
      annual_income = EXCLUDED.annual_income,
      company_name = EXCLUDED.company_name,
      city = EXCLUDED.city,
      district = EXCLUDED.district,
      about_me = EXCLUDED.about_me,
      family_type = EXCLUDED.family_type,
      family_status = EXCLUDED.family_status,
      is_verified = EXCLUDED.is_verified,
      is_premium = EXCLUDED.is_premium,
      is_profile_complete = EXCLUDED.is_profile_complete,
      profile_completion_percent = EXCLUDED.profile_completion_percent,
      last_active_at = EXCLUDED.last_active_at,
      star = EXCLUDED.star,
      raasi = EXCLUDED.raasi,
      lagnam = EXCLUDED.lagnam,
      gothram = EXCLUDED.gothram,
      tier = EXCLUDED.tier,
      contacts_remaining = EXCLUDED.contacts_remaining,
      interests_remaining = EXCLUDED.interests_remaining,
      food_habit = EXCLUDED.food_habit,
      smoking = EXCLUDED.smoking,
      drinking = EXCLUDED.drinking;
INSERT INTO public.profiles (
      id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at, star, raasi, lagnam, gothram, tier, contacts_remaining, interests_remaining, food_habit, smoking, drinking
    ) VALUES (
      '00000000-0000-4000-a000-0000000000b3', 'TM000179', 'Gautham Gopal', 'male', '2003-06-20', 182, 'never_married', 'Hindu', 'Brahmin - Iyer', 'Brahmin - Iyer subcaste', 'yes', 'M.C.A', 'M.C.A Graduate', 'College Professor', 'College Professor Details', '₹20 Lakhs+', 'HCL', 'Thoothukudi', 'Tuticorin', 'Hi, I am Gautham. I have completed my M.C.A and am currently working as a College Professor at HCL in Thoothukudi. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'middle_class', true, false, true, 100, NOW() - INTERVAL '3 days', 'Poorvashadha', 'Magaram', 'Dhanusu', 'Siva', 'free', 5, 5, 'vegetarian', 'no', 'no'
    ) ON CONFLICT (id) DO UPDATE SET
      profile_id = EXCLUDED.profile_id,
      display_name = EXCLUDED.display_name,
      gender = EXCLUDED.gender,
      date_of_birth = EXCLUDED.date_of_birth,
      height_cm = EXCLUDED.height_cm,
      marital_status = EXCLUDED.marital_status,
      religion = EXCLUDED.religion,
      caste = EXCLUDED.caste,
      subcaste = EXCLUDED.subcaste,
      dosham = EXCLUDED.dosham,
      education = EXCLUDED.education,
      education_detail = EXCLUDED.education_detail,
      occupation = EXCLUDED.occupation,
      occupation_detail = EXCLUDED.occupation_detail,
      annual_income = EXCLUDED.annual_income,
      company_name = EXCLUDED.company_name,
      city = EXCLUDED.city,
      district = EXCLUDED.district,
      about_me = EXCLUDED.about_me,
      family_type = EXCLUDED.family_type,
      family_status = EXCLUDED.family_status,
      is_verified = EXCLUDED.is_verified,
      is_premium = EXCLUDED.is_premium,
      is_profile_complete = EXCLUDED.is_profile_complete,
      profile_completion_percent = EXCLUDED.profile_completion_percent,
      last_active_at = EXCLUDED.last_active_at,
      star = EXCLUDED.star,
      raasi = EXCLUDED.raasi,
      lagnam = EXCLUDED.lagnam,
      gothram = EXCLUDED.gothram,
      tier = EXCLUDED.tier,
      contacts_remaining = EXCLUDED.contacts_remaining,
      interests_remaining = EXCLUDED.interests_remaining,
      food_habit = EXCLUDED.food_habit,
      smoking = EXCLUDED.smoking,
      drinking = EXCLUDED.drinking;
INSERT INTO public.profiles (
      id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at, star, raasi, lagnam, gothram, tier, contacts_remaining, interests_remaining, food_habit, smoking, drinking
    ) VALUES (
      '00000000-0000-4000-a000-0000000000b4', 'TM000180', 'Rajeshwari Raj', 'female', '1994-06-03', 160, 'never_married', 'Hindu', 'Brahmin - Iyer', 'Brahmin - Iyer subcaste', 'no', 'B.Com', 'B.Com Graduate', 'Bank Manager', 'Bank Manager Details', '₹7 Lakhs - ₹10 Lakhs', 'Accenture', 'Madurai', 'Madurai', 'Hi, I am Rajeshwari. I have completed my B.Com and am currently working as a Bank Manager at Accenture in Madurai. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'middle_class', true, false, true, 100, NOW() - INTERVAL '7 days', 'Punarvasu', 'Simham', 'Mesham', 'Vashishta', 'free', 5, 5, 'vegetarian', 'no', 'no'
    ) ON CONFLICT (id) DO UPDATE SET
      profile_id = EXCLUDED.profile_id,
      display_name = EXCLUDED.display_name,
      gender = EXCLUDED.gender,
      date_of_birth = EXCLUDED.date_of_birth,
      height_cm = EXCLUDED.height_cm,
      marital_status = EXCLUDED.marital_status,
      religion = EXCLUDED.religion,
      caste = EXCLUDED.caste,
      subcaste = EXCLUDED.subcaste,
      dosham = EXCLUDED.dosham,
      education = EXCLUDED.education,
      education_detail = EXCLUDED.education_detail,
      occupation = EXCLUDED.occupation,
      occupation_detail = EXCLUDED.occupation_detail,
      annual_income = EXCLUDED.annual_income,
      company_name = EXCLUDED.company_name,
      city = EXCLUDED.city,
      district = EXCLUDED.district,
      about_me = EXCLUDED.about_me,
      family_type = EXCLUDED.family_type,
      family_status = EXCLUDED.family_status,
      is_verified = EXCLUDED.is_verified,
      is_premium = EXCLUDED.is_premium,
      is_profile_complete = EXCLUDED.is_profile_complete,
      profile_completion_percent = EXCLUDED.profile_completion_percent,
      last_active_at = EXCLUDED.last_active_at,
      star = EXCLUDED.star,
      raasi = EXCLUDED.raasi,
      lagnam = EXCLUDED.lagnam,
      gothram = EXCLUDED.gothram,
      tier = EXCLUDED.tier,
      contacts_remaining = EXCLUDED.contacts_remaining,
      interests_remaining = EXCLUDED.interests_remaining,
      food_habit = EXCLUDED.food_habit,
      smoking = EXCLUDED.smoking,
      drinking = EXCLUDED.drinking;
INSERT INTO public.profiles (
      id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at, star, raasi, lagnam, gothram, tier, contacts_remaining, interests_remaining, food_habit, smoking, drinking
    ) VALUES (
      '00000000-0000-4000-a000-0000000000b5', 'TM000181', 'Ganesan Mani', 'male', '1991-01-20', 172, 'never_married', 'Muslim', 'Rawther', 'Rawther subcaste', 'yes', 'M.Com', 'M.Com Graduate', 'Civil Engineer', 'Civil Engineer Details', '₹20 Lakhs+', 'Government Service', 'Kanchipuram', 'Kanchipuram', 'Hi, I am Ganesan. I have completed my M.Com and am currently working as a Civil Engineer at Government Service in Kanchipuram. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'upper_middle_class', true, false, true, 100, NOW() - INTERVAL '9 days', 'Krittika', 'Mesham', 'Thulaam', 'Bharadwaj', 'free', 5, 5, 'vegetarian', 'no', 'no'
    ) ON CONFLICT (id) DO UPDATE SET
      profile_id = EXCLUDED.profile_id,
      display_name = EXCLUDED.display_name,
      gender = EXCLUDED.gender,
      date_of_birth = EXCLUDED.date_of_birth,
      height_cm = EXCLUDED.height_cm,
      marital_status = EXCLUDED.marital_status,
      religion = EXCLUDED.religion,
      caste = EXCLUDED.caste,
      subcaste = EXCLUDED.subcaste,
      dosham = EXCLUDED.dosham,
      education = EXCLUDED.education,
      education_detail = EXCLUDED.education_detail,
      occupation = EXCLUDED.occupation,
      occupation_detail = EXCLUDED.occupation_detail,
      annual_income = EXCLUDED.annual_income,
      company_name = EXCLUDED.company_name,
      city = EXCLUDED.city,
      district = EXCLUDED.district,
      about_me = EXCLUDED.about_me,
      family_type = EXCLUDED.family_type,
      family_status = EXCLUDED.family_status,
      is_verified = EXCLUDED.is_verified,
      is_premium = EXCLUDED.is_premium,
      is_profile_complete = EXCLUDED.is_profile_complete,
      profile_completion_percent = EXCLUDED.profile_completion_percent,
      last_active_at = EXCLUDED.last_active_at,
      star = EXCLUDED.star,
      raasi = EXCLUDED.raasi,
      lagnam = EXCLUDED.lagnam,
      gothram = EXCLUDED.gothram,
      tier = EXCLUDED.tier,
      contacts_remaining = EXCLUDED.contacts_remaining,
      interests_remaining = EXCLUDED.interests_remaining,
      food_habit = EXCLUDED.food_habit,
      smoking = EXCLUDED.smoking,
      drinking = EXCLUDED.drinking;
INSERT INTO public.profiles (
      id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at, star, raasi, lagnam, gothram, tier, contacts_remaining, interests_remaining, food_habit, smoking, drinking
    ) VALUES (
      '00000000-0000-4000-a000-0000000000b6', 'TM000182', 'Vijaya Velan', 'female', '2000-03-24', 159, 'never_married', 'Hindu', 'Naidu', NULL, 'no', 'B.A', 'B.A Graduate', 'Auditor', 'Auditor Details', '₹10 Lakhs - ₹15 Lakhs', 'Accenture', 'Tiruppur', 'Tiruppur', 'Hi, I am Vijaya. I have completed my B.A and am currently working as a Auditor at Accenture in Tiruppur. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'joint', 'rich', true, true, true, 100, NOW() - INTERVAL '8 days', 'Moola', 'Kumbam', 'Kadagam', 'Murugan', 'gold', 50, 100, 'vegetarian', 'no', 'no'
    ) ON CONFLICT (id) DO UPDATE SET
      profile_id = EXCLUDED.profile_id,
      display_name = EXCLUDED.display_name,
      gender = EXCLUDED.gender,
      date_of_birth = EXCLUDED.date_of_birth,
      height_cm = EXCLUDED.height_cm,
      marital_status = EXCLUDED.marital_status,
      religion = EXCLUDED.religion,
      caste = EXCLUDED.caste,
      subcaste = EXCLUDED.subcaste,
      dosham = EXCLUDED.dosham,
      education = EXCLUDED.education,
      education_detail = EXCLUDED.education_detail,
      occupation = EXCLUDED.occupation,
      occupation_detail = EXCLUDED.occupation_detail,
      annual_income = EXCLUDED.annual_income,
      company_name = EXCLUDED.company_name,
      city = EXCLUDED.city,
      district = EXCLUDED.district,
      about_me = EXCLUDED.about_me,
      family_type = EXCLUDED.family_type,
      family_status = EXCLUDED.family_status,
      is_verified = EXCLUDED.is_verified,
      is_premium = EXCLUDED.is_premium,
      is_profile_complete = EXCLUDED.is_profile_complete,
      profile_completion_percent = EXCLUDED.profile_completion_percent,
      last_active_at = EXCLUDED.last_active_at,
      star = EXCLUDED.star,
      raasi = EXCLUDED.raasi,
      lagnam = EXCLUDED.lagnam,
      gothram = EXCLUDED.gothram,
      tier = EXCLUDED.tier,
      contacts_remaining = EXCLUDED.contacts_remaining,
      interests_remaining = EXCLUDED.interests_remaining,
      food_habit = EXCLUDED.food_habit,
      smoking = EXCLUDED.smoking,
      drinking = EXCLUDED.drinking;
INSERT INTO public.profiles (
      id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at, star, raasi, lagnam, gothram, tier, contacts_remaining, interests_remaining, food_habit, smoking, drinking
    ) VALUES (
      '00000000-0000-4000-a000-0000000000b7', 'TM000183', 'Aravind Sundaram', 'male', '1999-06-05', 174, 'divorced', 'Hindu', 'Chettiar', NULL, 'yes', 'Ph.D', 'Ph.D Graduate', 'Bank Manager', 'Bank Manager Details', '₹3 Lakhs - ₹5 Lakhs', 'Wipro', 'Madurai', 'Madurai', 'Hi, I am Aravind. I have completed my Ph.D and am currently working as a Bank Manager at Wipro in Madurai. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'rich', true, false, true, 100, NOW() - INTERVAL '6 days', 'Dhanishta', 'Magaram', 'Thulaam', 'Angirasa', 'free', 5, 5, 'vegetarian', 'no', 'no'
    ) ON CONFLICT (id) DO UPDATE SET
      profile_id = EXCLUDED.profile_id,
      display_name = EXCLUDED.display_name,
      gender = EXCLUDED.gender,
      date_of_birth = EXCLUDED.date_of_birth,
      height_cm = EXCLUDED.height_cm,
      marital_status = EXCLUDED.marital_status,
      religion = EXCLUDED.religion,
      caste = EXCLUDED.caste,
      subcaste = EXCLUDED.subcaste,
      dosham = EXCLUDED.dosham,
      education = EXCLUDED.education,
      education_detail = EXCLUDED.education_detail,
      occupation = EXCLUDED.occupation,
      occupation_detail = EXCLUDED.occupation_detail,
      annual_income = EXCLUDED.annual_income,
      company_name = EXCLUDED.company_name,
      city = EXCLUDED.city,
      district = EXCLUDED.district,
      about_me = EXCLUDED.about_me,
      family_type = EXCLUDED.family_type,
      family_status = EXCLUDED.family_status,
      is_verified = EXCLUDED.is_verified,
      is_premium = EXCLUDED.is_premium,
      is_profile_complete = EXCLUDED.is_profile_complete,
      profile_completion_percent = EXCLUDED.profile_completion_percent,
      last_active_at = EXCLUDED.last_active_at,
      star = EXCLUDED.star,
      raasi = EXCLUDED.raasi,
      lagnam = EXCLUDED.lagnam,
      gothram = EXCLUDED.gothram,
      tier = EXCLUDED.tier,
      contacts_remaining = EXCLUDED.contacts_remaining,
      interests_remaining = EXCLUDED.interests_remaining,
      food_habit = EXCLUDED.food_habit,
      smoking = EXCLUDED.smoking,
      drinking = EXCLUDED.drinking;
INSERT INTO public.profiles (
      id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at, star, raasi, lagnam, gothram, tier, contacts_remaining, interests_remaining, food_habit, smoking, drinking
    ) VALUES (
      '00000000-0000-4000-a000-0000000000b8', 'TM000184', 'Malathi Nathan', 'female', '2001-02-18', 152, 'never_married', 'Hindu', 'Maravar', 'Maravar subcaste', 'no', 'B.Ed', 'B.Ed Graduate', 'Dentist', 'Dentist Details', '₹20 Lakhs+', 'Government Service', 'Erode', 'Erode', 'Hi, I am Malathi. I have completed my B.Ed and am currently working as a Dentist at Government Service in Erode. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'joint', 'upper_middle_class', false, false, true, 100, NOW() - INTERVAL '7 days', 'Krittika', 'Kadagam', 'Meenam', 'Viswamitra', 'free', 5, 5, 'vegetarian', 'no', 'no'
    ) ON CONFLICT (id) DO UPDATE SET
      profile_id = EXCLUDED.profile_id,
      display_name = EXCLUDED.display_name,
      gender = EXCLUDED.gender,
      date_of_birth = EXCLUDED.date_of_birth,
      height_cm = EXCLUDED.height_cm,
      marital_status = EXCLUDED.marital_status,
      religion = EXCLUDED.religion,
      caste = EXCLUDED.caste,
      subcaste = EXCLUDED.subcaste,
      dosham = EXCLUDED.dosham,
      education = EXCLUDED.education,
      education_detail = EXCLUDED.education_detail,
      occupation = EXCLUDED.occupation,
      occupation_detail = EXCLUDED.occupation_detail,
      annual_income = EXCLUDED.annual_income,
      company_name = EXCLUDED.company_name,
      city = EXCLUDED.city,
      district = EXCLUDED.district,
      about_me = EXCLUDED.about_me,
      family_type = EXCLUDED.family_type,
      family_status = EXCLUDED.family_status,
      is_verified = EXCLUDED.is_verified,
      is_premium = EXCLUDED.is_premium,
      is_profile_complete = EXCLUDED.is_profile_complete,
      profile_completion_percent = EXCLUDED.profile_completion_percent,
      last_active_at = EXCLUDED.last_active_at,
      star = EXCLUDED.star,
      raasi = EXCLUDED.raasi,
      lagnam = EXCLUDED.lagnam,
      gothram = EXCLUDED.gothram,
      tier = EXCLUDED.tier,
      contacts_remaining = EXCLUDED.contacts_remaining,
      interests_remaining = EXCLUDED.interests_remaining,
      food_habit = EXCLUDED.food_habit,
      smoking = EXCLUDED.smoking,
      drinking = EXCLUDED.drinking;
INSERT INTO public.profiles (
      id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at, star, raasi, lagnam, gothram, tier, contacts_remaining, interests_remaining, food_habit, smoking, drinking
    ) VALUES (
      '00000000-0000-4000-a000-0000000000b9', 'TM000185', 'Suresh Samy', 'male', '1992-11-28', 177, 'divorced', 'Hindu', 'Vanniyar', 'Vanniyar subcaste', 'no', 'B.Ed', 'B.Ed Graduate', 'Auditor', 'Auditor Details', '₹7 Lakhs - ₹10 Lakhs', 'Zoho', 'Vellore', 'Vellore', 'Hi, I am Suresh. I have completed my B.Ed and am currently working as a Auditor at Zoho in Vellore. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'middle_class', true, false, true, 100, NOW() - INTERVAL '3 days', 'Jyeshta', 'Simham', 'Meenam', 'Gautama', 'free', 5, 5, 'vegetarian', 'no', 'no'
    ) ON CONFLICT (id) DO UPDATE SET
      profile_id = EXCLUDED.profile_id,
      display_name = EXCLUDED.display_name,
      gender = EXCLUDED.gender,
      date_of_birth = EXCLUDED.date_of_birth,
      height_cm = EXCLUDED.height_cm,
      marital_status = EXCLUDED.marital_status,
      religion = EXCLUDED.religion,
      caste = EXCLUDED.caste,
      subcaste = EXCLUDED.subcaste,
      dosham = EXCLUDED.dosham,
      education = EXCLUDED.education,
      education_detail = EXCLUDED.education_detail,
      occupation = EXCLUDED.occupation,
      occupation_detail = EXCLUDED.occupation_detail,
      annual_income = EXCLUDED.annual_income,
      company_name = EXCLUDED.company_name,
      city = EXCLUDED.city,
      district = EXCLUDED.district,
      about_me = EXCLUDED.about_me,
      family_type = EXCLUDED.family_type,
      family_status = EXCLUDED.family_status,
      is_verified = EXCLUDED.is_verified,
      is_premium = EXCLUDED.is_premium,
      is_profile_complete = EXCLUDED.is_profile_complete,
      profile_completion_percent = EXCLUDED.profile_completion_percent,
      last_active_at = EXCLUDED.last_active_at,
      star = EXCLUDED.star,
      raasi = EXCLUDED.raasi,
      lagnam = EXCLUDED.lagnam,
      gothram = EXCLUDED.gothram,
      tier = EXCLUDED.tier,
      contacts_remaining = EXCLUDED.contacts_remaining,
      interests_remaining = EXCLUDED.interests_remaining,
      food_habit = EXCLUDED.food_habit,
      smoking = EXCLUDED.smoking,
      drinking = EXCLUDED.drinking;
INSERT INTO public.profiles (
      id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at, star, raasi, lagnam, gothram, tier, contacts_remaining, interests_remaining, food_habit, smoking, drinking
    ) VALUES (
      '00000000-0000-4000-a000-0000000000ba', 'TM000186', 'Ramya Sundaram', 'female', '1989-03-20', 155, 'never_married', 'Hindu', 'Vishwakarma', NULL, 'no', 'M.B.B.S', 'M.B.B.S Graduate', 'Business Owner', 'Business Owner Details', '₹7 Lakhs - ₹10 Lakhs', 'Self Employed', 'Tirunelveli', 'Tirunelveli', 'Hi, I am Ramya. I have completed my M.B.B.S and am currently working as a Business Owner at Self Employed in Tirunelveli. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'joint', 'rich', true, false, true, 100, NOW() - INTERVAL '9 days', 'Magha', 'Kadagam', 'Mesham', 'Murugan', 'free', 5, 5, 'vegetarian', 'no', 'no'
    ) ON CONFLICT (id) DO UPDATE SET
      profile_id = EXCLUDED.profile_id,
      display_name = EXCLUDED.display_name,
      gender = EXCLUDED.gender,
      date_of_birth = EXCLUDED.date_of_birth,
      height_cm = EXCLUDED.height_cm,
      marital_status = EXCLUDED.marital_status,
      religion = EXCLUDED.religion,
      caste = EXCLUDED.caste,
      subcaste = EXCLUDED.subcaste,
      dosham = EXCLUDED.dosham,
      education = EXCLUDED.education,
      education_detail = EXCLUDED.education_detail,
      occupation = EXCLUDED.occupation,
      occupation_detail = EXCLUDED.occupation_detail,
      annual_income = EXCLUDED.annual_income,
      company_name = EXCLUDED.company_name,
      city = EXCLUDED.city,
      district = EXCLUDED.district,
      about_me = EXCLUDED.about_me,
      family_type = EXCLUDED.family_type,
      family_status = EXCLUDED.family_status,
      is_verified = EXCLUDED.is_verified,
      is_premium = EXCLUDED.is_premium,
      is_profile_complete = EXCLUDED.is_profile_complete,
      profile_completion_percent = EXCLUDED.profile_completion_percent,
      last_active_at = EXCLUDED.last_active_at,
      star = EXCLUDED.star,
      raasi = EXCLUDED.raasi,
      lagnam = EXCLUDED.lagnam,
      gothram = EXCLUDED.gothram,
      tier = EXCLUDED.tier,
      contacts_remaining = EXCLUDED.contacts_remaining,
      interests_remaining = EXCLUDED.interests_remaining,
      food_habit = EXCLUDED.food_habit,
      smoking = EXCLUDED.smoking,
      drinking = EXCLUDED.drinking;
INSERT INTO public.profiles (
      id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at, star, raasi, lagnam, gothram, tier, contacts_remaining, interests_remaining, food_habit, smoking, drinking
    ) VALUES (
      '00000000-0000-4000-a000-0000000000bb', 'TM000187', 'Naveen Nathan', 'male', '1988-09-15', 180, 'never_married', 'Hindu', 'Agamudayar', NULL, 'no', 'M.Com', 'M.Com Graduate', 'Business Owner', 'Business Owner Details', '₹7 Lakhs - ₹10 Lakhs', 'Infosys', 'Chennai', 'Chennai', 'Hi, I am Naveen. I have completed my M.Com and am currently working as a Business Owner at Infosys in Chennai. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'joint', 'upper_middle_class', true, true, true, 100, NOW() - INTERVAL '4 days', 'Shravana', 'Thulaam', 'Rishabam', 'Siva', 'gold', 50, 100, 'vegetarian', 'no', 'no'
    ) ON CONFLICT (id) DO UPDATE SET
      profile_id = EXCLUDED.profile_id,
      display_name = EXCLUDED.display_name,
      gender = EXCLUDED.gender,
      date_of_birth = EXCLUDED.date_of_birth,
      height_cm = EXCLUDED.height_cm,
      marital_status = EXCLUDED.marital_status,
      religion = EXCLUDED.religion,
      caste = EXCLUDED.caste,
      subcaste = EXCLUDED.subcaste,
      dosham = EXCLUDED.dosham,
      education = EXCLUDED.education,
      education_detail = EXCLUDED.education_detail,
      occupation = EXCLUDED.occupation,
      occupation_detail = EXCLUDED.occupation_detail,
      annual_income = EXCLUDED.annual_income,
      company_name = EXCLUDED.company_name,
      city = EXCLUDED.city,
      district = EXCLUDED.district,
      about_me = EXCLUDED.about_me,
      family_type = EXCLUDED.family_type,
      family_status = EXCLUDED.family_status,
      is_verified = EXCLUDED.is_verified,
      is_premium = EXCLUDED.is_premium,
      is_profile_complete = EXCLUDED.is_profile_complete,
      profile_completion_percent = EXCLUDED.profile_completion_percent,
      last_active_at = EXCLUDED.last_active_at,
      star = EXCLUDED.star,
      raasi = EXCLUDED.raasi,
      lagnam = EXCLUDED.lagnam,
      gothram = EXCLUDED.gothram,
      tier = EXCLUDED.tier,
      contacts_remaining = EXCLUDED.contacts_remaining,
      interests_remaining = EXCLUDED.interests_remaining,
      food_habit = EXCLUDED.food_habit,
      smoking = EXCLUDED.smoking,
      drinking = EXCLUDED.drinking;
INSERT INTO public.profiles (
      id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at, star, raasi, lagnam, gothram, tier, contacts_remaining, interests_remaining, food_habit, smoking, drinking
    ) VALUES (
      '00000000-0000-4000-a000-0000000000bc', 'TM000188', 'Gowri Lingam', 'female', '2000-04-25', 168, 'divorced', 'Muslim', 'Rawther', NULL, 'no', 'B.E. / B.Tech', 'B.E. / B.Tech Graduate', 'Auditor', 'Auditor Details', '₹7 Lakhs - ₹10 Lakhs', 'Wipro', 'Thanjavur', 'Thanjavur', 'Hi, I am Gowri. I have completed my B.E. / B.Tech and am currently working as a Auditor at Wipro in Thanjavur. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'joint', 'rich', false, false, true, 100, NOW() - INTERVAL '0 days', 'Poorvashadha', 'Mesham', 'Viruchigam', 'Viswamitra', 'free', 5, 5, 'vegetarian', 'no', 'no'
    ) ON CONFLICT (id) DO UPDATE SET
      profile_id = EXCLUDED.profile_id,
      display_name = EXCLUDED.display_name,
      gender = EXCLUDED.gender,
      date_of_birth = EXCLUDED.date_of_birth,
      height_cm = EXCLUDED.height_cm,
      marital_status = EXCLUDED.marital_status,
      religion = EXCLUDED.religion,
      caste = EXCLUDED.caste,
      subcaste = EXCLUDED.subcaste,
      dosham = EXCLUDED.dosham,
      education = EXCLUDED.education,
      education_detail = EXCLUDED.education_detail,
      occupation = EXCLUDED.occupation,
      occupation_detail = EXCLUDED.occupation_detail,
      annual_income = EXCLUDED.annual_income,
      company_name = EXCLUDED.company_name,
      city = EXCLUDED.city,
      district = EXCLUDED.district,
      about_me = EXCLUDED.about_me,
      family_type = EXCLUDED.family_type,
      family_status = EXCLUDED.family_status,
      is_verified = EXCLUDED.is_verified,
      is_premium = EXCLUDED.is_premium,
      is_profile_complete = EXCLUDED.is_profile_complete,
      profile_completion_percent = EXCLUDED.profile_completion_percent,
      last_active_at = EXCLUDED.last_active_at,
      star = EXCLUDED.star,
      raasi = EXCLUDED.raasi,
      lagnam = EXCLUDED.lagnam,
      gothram = EXCLUDED.gothram,
      tier = EXCLUDED.tier,
      contacts_remaining = EXCLUDED.contacts_remaining,
      interests_remaining = EXCLUDED.interests_remaining,
      food_habit = EXCLUDED.food_habit,
      smoking = EXCLUDED.smoking,
      drinking = EXCLUDED.drinking;
INSERT INTO public.profiles (
      id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at, star, raasi, lagnam, gothram, tier, contacts_remaining, interests_remaining, food_habit, smoking, drinking
    ) VALUES (
      '00000000-0000-4000-a000-0000000000bd', 'TM000189', 'Ajith Balan', 'male', '2004-06-23', 180, 'never_married', 'Hindu', 'Pillai', NULL, 'no', 'M.A', 'M.A Graduate', 'Civil Engineer', 'Civil Engineer Details', '₹5 Lakhs - ₹7 Lakhs', 'Infosys', 'Tiruppur', 'Tiruppur', 'Hi, I am Ajith. I have completed my M.A and am currently working as a Civil Engineer at Infosys in Tiruppur. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'rich', true, false, true, 100, NOW() - INTERVAL '7 days', 'Anuradha', 'Simham', 'Viruchigam', 'Gautama', 'free', 5, 5, 'vegetarian', 'no', 'no'
    ) ON CONFLICT (id) DO UPDATE SET
      profile_id = EXCLUDED.profile_id,
      display_name = EXCLUDED.display_name,
      gender = EXCLUDED.gender,
      date_of_birth = EXCLUDED.date_of_birth,
      height_cm = EXCLUDED.height_cm,
      marital_status = EXCLUDED.marital_status,
      religion = EXCLUDED.religion,
      caste = EXCLUDED.caste,
      subcaste = EXCLUDED.subcaste,
      dosham = EXCLUDED.dosham,
      education = EXCLUDED.education,
      education_detail = EXCLUDED.education_detail,
      occupation = EXCLUDED.occupation,
      occupation_detail = EXCLUDED.occupation_detail,
      annual_income = EXCLUDED.annual_income,
      company_name = EXCLUDED.company_name,
      city = EXCLUDED.city,
      district = EXCLUDED.district,
      about_me = EXCLUDED.about_me,
      family_type = EXCLUDED.family_type,
      family_status = EXCLUDED.family_status,
      is_verified = EXCLUDED.is_verified,
      is_premium = EXCLUDED.is_premium,
      is_profile_complete = EXCLUDED.is_profile_complete,
      profile_completion_percent = EXCLUDED.profile_completion_percent,
      last_active_at = EXCLUDED.last_active_at,
      star = EXCLUDED.star,
      raasi = EXCLUDED.raasi,
      lagnam = EXCLUDED.lagnam,
      gothram = EXCLUDED.gothram,
      tier = EXCLUDED.tier,
      contacts_remaining = EXCLUDED.contacts_remaining,
      interests_remaining = EXCLUDED.interests_remaining,
      food_habit = EXCLUDED.food_habit,
      smoking = EXCLUDED.smoking,
      drinking = EXCLUDED.drinking;
INSERT INTO public.profiles (
      id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at, star, raasi, lagnam, gothram, tier, contacts_remaining, interests_remaining, food_habit, smoking, drinking
    ) VALUES (
      '00000000-0000-4000-a000-0000000000be', 'TM000190', 'Deepa Selvan', 'female', '2001-08-08', 164, 'never_married', 'Hindu', 'Devendra Kula Vellalar', 'Devendra Kula Vellalar subcaste', 'yes', 'Ph.D', 'Ph.D Graduate', 'Auditor', 'Auditor Details', '₹5 Lakhs - ₹7 Lakhs', 'Infosys', 'Salem', 'Salem', 'Hi, I am Deepa. I have completed my Ph.D and am currently working as a Auditor at Infosys in Salem. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'middle_class', true, true, true, 100, NOW() - INTERVAL '3 days', 'Hasta', 'Kumbam', 'Kanni', 'Gautama', 'gold', 50, 100, 'vegetarian', 'no', 'no'
    ) ON CONFLICT (id) DO UPDATE SET
      profile_id = EXCLUDED.profile_id,
      display_name = EXCLUDED.display_name,
      gender = EXCLUDED.gender,
      date_of_birth = EXCLUDED.date_of_birth,
      height_cm = EXCLUDED.height_cm,
      marital_status = EXCLUDED.marital_status,
      religion = EXCLUDED.religion,
      caste = EXCLUDED.caste,
      subcaste = EXCLUDED.subcaste,
      dosham = EXCLUDED.dosham,
      education = EXCLUDED.education,
      education_detail = EXCLUDED.education_detail,
      occupation = EXCLUDED.occupation,
      occupation_detail = EXCLUDED.occupation_detail,
      annual_income = EXCLUDED.annual_income,
      company_name = EXCLUDED.company_name,
      city = EXCLUDED.city,
      district = EXCLUDED.district,
      about_me = EXCLUDED.about_me,
      family_type = EXCLUDED.family_type,
      family_status = EXCLUDED.family_status,
      is_verified = EXCLUDED.is_verified,
      is_premium = EXCLUDED.is_premium,
      is_profile_complete = EXCLUDED.is_profile_complete,
      profile_completion_percent = EXCLUDED.profile_completion_percent,
      last_active_at = EXCLUDED.last_active_at,
      star = EXCLUDED.star,
      raasi = EXCLUDED.raasi,
      lagnam = EXCLUDED.lagnam,
      gothram = EXCLUDED.gothram,
      tier = EXCLUDED.tier,
      contacts_remaining = EXCLUDED.contacts_remaining,
      interests_remaining = EXCLUDED.interests_remaining,
      food_habit = EXCLUDED.food_habit,
      smoking = EXCLUDED.smoking,
      drinking = EXCLUDED.drinking;
INSERT INTO public.profiles (
      id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at, star, raasi, lagnam, gothram, tier, contacts_remaining, interests_remaining, food_habit, smoking, drinking
    ) VALUES (
      '00000000-0000-4000-a000-0000000000bf', 'TM000191', 'Manikandan Devan', 'male', '1991-06-20', 163, 'never_married', 'Hindu', 'Adi Dravida', 'Adi Dravida subcaste', 'no', 'Ph.D', 'Ph.D Graduate', 'Mechanical Engineer', 'Mechanical Engineer Details', '₹7 Lakhs - ₹10 Lakhs', 'Wipro', 'Vellore', 'Vellore', 'Hi, I am Manikandan. I have completed my Ph.D and am currently working as a Mechanical Engineer at Wipro in Vellore. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'middle_class', true, false, true, 100, NOW() - INTERVAL '5 days', 'Moola', 'Kanni', 'Kumbam', 'Agastya', 'free', 5, 5, 'vegetarian', 'no', 'no'
    ) ON CONFLICT (id) DO UPDATE SET
      profile_id = EXCLUDED.profile_id,
      display_name = EXCLUDED.display_name,
      gender = EXCLUDED.gender,
      date_of_birth = EXCLUDED.date_of_birth,
      height_cm = EXCLUDED.height_cm,
      marital_status = EXCLUDED.marital_status,
      religion = EXCLUDED.religion,
      caste = EXCLUDED.caste,
      subcaste = EXCLUDED.subcaste,
      dosham = EXCLUDED.dosham,
      education = EXCLUDED.education,
      education_detail = EXCLUDED.education_detail,
      occupation = EXCLUDED.occupation,
      occupation_detail = EXCLUDED.occupation_detail,
      annual_income = EXCLUDED.annual_income,
      company_name = EXCLUDED.company_name,
      city = EXCLUDED.city,
      district = EXCLUDED.district,
      about_me = EXCLUDED.about_me,
      family_type = EXCLUDED.family_type,
      family_status = EXCLUDED.family_status,
      is_verified = EXCLUDED.is_verified,
      is_premium = EXCLUDED.is_premium,
      is_profile_complete = EXCLUDED.is_profile_complete,
      profile_completion_percent = EXCLUDED.profile_completion_percent,
      last_active_at = EXCLUDED.last_active_at,
      star = EXCLUDED.star,
      raasi = EXCLUDED.raasi,
      lagnam = EXCLUDED.lagnam,
      gothram = EXCLUDED.gothram,
      tier = EXCLUDED.tier,
      contacts_remaining = EXCLUDED.contacts_remaining,
      interests_remaining = EXCLUDED.interests_remaining,
      food_habit = EXCLUDED.food_habit,
      smoking = EXCLUDED.smoking,
      drinking = EXCLUDED.drinking;
INSERT INTO public.profiles (
      id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at, star, raasi, lagnam, gothram, tier, contacts_remaining, interests_remaining, food_habit, smoking, drinking
    ) VALUES (
      '00000000-0000-4000-a000-0000000000c0', 'TM000192', 'Divya Krishnan', 'female', '2002-12-01', 171, 'never_married', 'Hindu', 'Maravar', NULL, 'no', 'M.B.A', 'M.B.A Graduate', 'HR Specialist', 'HR Specialist Details', '₹15 Lakhs - ₹20 Lakhs', 'Wipro', 'Chennai', 'Chennai', 'Hi, I am Divya. I have completed my M.B.A and am currently working as a HR Specialist at Wipro in Chennai. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'middle_class', true, false, true, 100, NOW() - INTERVAL '4 days', 'Hasta', 'Kanni', 'Thulaam', 'Agastya', 'free', 5, 5, 'vegetarian', 'no', 'no'
    ) ON CONFLICT (id) DO UPDATE SET
      profile_id = EXCLUDED.profile_id,
      display_name = EXCLUDED.display_name,
      gender = EXCLUDED.gender,
      date_of_birth = EXCLUDED.date_of_birth,
      height_cm = EXCLUDED.height_cm,
      marital_status = EXCLUDED.marital_status,
      religion = EXCLUDED.religion,
      caste = EXCLUDED.caste,
      subcaste = EXCLUDED.subcaste,
      dosham = EXCLUDED.dosham,
      education = EXCLUDED.education,
      education_detail = EXCLUDED.education_detail,
      occupation = EXCLUDED.occupation,
      occupation_detail = EXCLUDED.occupation_detail,
      annual_income = EXCLUDED.annual_income,
      company_name = EXCLUDED.company_name,
      city = EXCLUDED.city,
      district = EXCLUDED.district,
      about_me = EXCLUDED.about_me,
      family_type = EXCLUDED.family_type,
      family_status = EXCLUDED.family_status,
      is_verified = EXCLUDED.is_verified,
      is_premium = EXCLUDED.is_premium,
      is_profile_complete = EXCLUDED.is_profile_complete,
      profile_completion_percent = EXCLUDED.profile_completion_percent,
      last_active_at = EXCLUDED.last_active_at,
      star = EXCLUDED.star,
      raasi = EXCLUDED.raasi,
      lagnam = EXCLUDED.lagnam,
      gothram = EXCLUDED.gothram,
      tier = EXCLUDED.tier,
      contacts_remaining = EXCLUDED.contacts_remaining,
      interests_remaining = EXCLUDED.interests_remaining,
      food_habit = EXCLUDED.food_habit,
      smoking = EXCLUDED.smoking,
      drinking = EXCLUDED.drinking;
INSERT INTO public.profiles (
      id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at, star, raasi, lagnam, gothram, tier, contacts_remaining, interests_remaining, food_habit, smoking, drinking
    ) VALUES (
      '00000000-0000-4000-a000-0000000000c1', 'TM000193', 'Murugan Kumar', 'male', '1988-06-06', 174, 'divorced', 'Hindu', 'Pillai', 'Pillai subcaste', 'no', 'M.B.B.S', 'M.B.B.S Graduate', 'Doctor', 'Doctor Details', '₹5 Lakhs - ₹7 Lakhs', 'Zoho', 'Thoothukudi', 'Tuticorin', 'Hi, I am Murugan. I have completed my M.B.B.S and am currently working as a Doctor at Zoho in Thoothukudi. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'rich', true, true, true, 100, NOW() - INTERVAL '7 days', 'Punarvasu', 'Meenam', 'Mithunam', 'Siva', 'gold', 50, 100, 'vegetarian', 'no', 'no'
    ) ON CONFLICT (id) DO UPDATE SET
      profile_id = EXCLUDED.profile_id,
      display_name = EXCLUDED.display_name,
      gender = EXCLUDED.gender,
      date_of_birth = EXCLUDED.date_of_birth,
      height_cm = EXCLUDED.height_cm,
      marital_status = EXCLUDED.marital_status,
      religion = EXCLUDED.religion,
      caste = EXCLUDED.caste,
      subcaste = EXCLUDED.subcaste,
      dosham = EXCLUDED.dosham,
      education = EXCLUDED.education,
      education_detail = EXCLUDED.education_detail,
      occupation = EXCLUDED.occupation,
      occupation_detail = EXCLUDED.occupation_detail,
      annual_income = EXCLUDED.annual_income,
      company_name = EXCLUDED.company_name,
      city = EXCLUDED.city,
      district = EXCLUDED.district,
      about_me = EXCLUDED.about_me,
      family_type = EXCLUDED.family_type,
      family_status = EXCLUDED.family_status,
      is_verified = EXCLUDED.is_verified,
      is_premium = EXCLUDED.is_premium,
      is_profile_complete = EXCLUDED.is_profile_complete,
      profile_completion_percent = EXCLUDED.profile_completion_percent,
      last_active_at = EXCLUDED.last_active_at,
      star = EXCLUDED.star,
      raasi = EXCLUDED.raasi,
      lagnam = EXCLUDED.lagnam,
      gothram = EXCLUDED.gothram,
      tier = EXCLUDED.tier,
      contacts_remaining = EXCLUDED.contacts_remaining,
      interests_remaining = EXCLUDED.interests_remaining,
      food_habit = EXCLUDED.food_habit,
      smoking = EXCLUDED.smoking,
      drinking = EXCLUDED.drinking;
INSERT INTO public.profiles (
      id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at, star, raasi, lagnam, gothram, tier, contacts_remaining, interests_remaining, food_habit, smoking, drinking
    ) VALUES (
      '00000000-0000-4000-a000-0000000000c2', 'TM000194', 'Archana Gopal', 'female', '1993-03-17', 162, 'never_married', 'Hindu', 'Mudaliar', NULL, 'no', 'B.Ed', 'B.Ed Graduate', 'Architect', 'Architect Details', '₹7 Lakhs - ₹10 Lakhs', 'Private Practice', 'Tiruppur', 'Tiruppur', 'Hi, I am Archana. I have completed my B.Ed and am currently working as a Architect at Private Practice in Tiruppur. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'rich', true, false, true, 100, NOW() - INTERVAL '4 days', 'Dhanishta', 'Thulaam', 'Dhanusu', 'Vishnu', 'free', 5, 5, 'vegetarian', 'no', 'no'
    ) ON CONFLICT (id) DO UPDATE SET
      profile_id = EXCLUDED.profile_id,
      display_name = EXCLUDED.display_name,
      gender = EXCLUDED.gender,
      date_of_birth = EXCLUDED.date_of_birth,
      height_cm = EXCLUDED.height_cm,
      marital_status = EXCLUDED.marital_status,
      religion = EXCLUDED.religion,
      caste = EXCLUDED.caste,
      subcaste = EXCLUDED.subcaste,
      dosham = EXCLUDED.dosham,
      education = EXCLUDED.education,
      education_detail = EXCLUDED.education_detail,
      occupation = EXCLUDED.occupation,
      occupation_detail = EXCLUDED.occupation_detail,
      annual_income = EXCLUDED.annual_income,
      company_name = EXCLUDED.company_name,
      city = EXCLUDED.city,
      district = EXCLUDED.district,
      about_me = EXCLUDED.about_me,
      family_type = EXCLUDED.family_type,
      family_status = EXCLUDED.family_status,
      is_verified = EXCLUDED.is_verified,
      is_premium = EXCLUDED.is_premium,
      is_profile_complete = EXCLUDED.is_profile_complete,
      profile_completion_percent = EXCLUDED.profile_completion_percent,
      last_active_at = EXCLUDED.last_active_at,
      star = EXCLUDED.star,
      raasi = EXCLUDED.raasi,
      lagnam = EXCLUDED.lagnam,
      gothram = EXCLUDED.gothram,
      tier = EXCLUDED.tier,
      contacts_remaining = EXCLUDED.contacts_remaining,
      interests_remaining = EXCLUDED.interests_remaining,
      food_habit = EXCLUDED.food_habit,
      smoking = EXCLUDED.smoking,
      drinking = EXCLUDED.drinking;
INSERT INTO public.profiles (
      id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at, star, raasi, lagnam, gothram, tier, contacts_remaining, interests_remaining, food_habit, smoking, drinking
    ) VALUES (
      '00000000-0000-4000-a000-0000000000c3', 'TM000195', 'Ramesh Nathan', 'male', '1993-07-08', 176, 'never_married', 'Hindu', 'Naidu', 'Naidu subcaste', 'no', 'B.Com', 'B.Com Graduate', 'HR Specialist', 'HR Specialist Details', '₹3 Lakhs - ₹5 Lakhs', 'TCS', 'Vellore', 'Vellore', 'Hi, I am Ramesh. I have completed my B.Com and am currently working as a HR Specialist at TCS in Vellore. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'middle_class', false, true, true, 100, NOW() - INTERVAL '3 days', 'Arudra', 'Magaram', 'Thulaam', 'Gautama', 'gold', 50, 100, 'vegetarian', 'no', 'no'
    ) ON CONFLICT (id) DO UPDATE SET
      profile_id = EXCLUDED.profile_id,
      display_name = EXCLUDED.display_name,
      gender = EXCLUDED.gender,
      date_of_birth = EXCLUDED.date_of_birth,
      height_cm = EXCLUDED.height_cm,
      marital_status = EXCLUDED.marital_status,
      religion = EXCLUDED.religion,
      caste = EXCLUDED.caste,
      subcaste = EXCLUDED.subcaste,
      dosham = EXCLUDED.dosham,
      education = EXCLUDED.education,
      education_detail = EXCLUDED.education_detail,
      occupation = EXCLUDED.occupation,
      occupation_detail = EXCLUDED.occupation_detail,
      annual_income = EXCLUDED.annual_income,
      company_name = EXCLUDED.company_name,
      city = EXCLUDED.city,
      district = EXCLUDED.district,
      about_me = EXCLUDED.about_me,
      family_type = EXCLUDED.family_type,
      family_status = EXCLUDED.family_status,
      is_verified = EXCLUDED.is_verified,
      is_premium = EXCLUDED.is_premium,
      is_profile_complete = EXCLUDED.is_profile_complete,
      profile_completion_percent = EXCLUDED.profile_completion_percent,
      last_active_at = EXCLUDED.last_active_at,
      star = EXCLUDED.star,
      raasi = EXCLUDED.raasi,
      lagnam = EXCLUDED.lagnam,
      gothram = EXCLUDED.gothram,
      tier = EXCLUDED.tier,
      contacts_remaining = EXCLUDED.contacts_remaining,
      interests_remaining = EXCLUDED.interests_remaining,
      food_habit = EXCLUDED.food_habit,
      smoking = EXCLUDED.smoking,
      drinking = EXCLUDED.drinking;
INSERT INTO public.profiles (
      id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at, star, raasi, lagnam, gothram, tier, contacts_remaining, interests_remaining, food_habit, smoking, drinking
    ) VALUES (
      '00000000-0000-4000-a000-0000000000c4', 'TM000196', 'Abirami Shankar', 'female', '1993-04-07', 171, 'never_married', 'Hindu', 'Naicker', 'Naicker subcaste', 'yes', 'M.Com', 'M.Com Graduate', 'Civil Engineer', 'Civil Engineer Details', '₹7 Lakhs - ₹10 Lakhs', 'Government Service', 'Salem', 'Salem', 'Hi, I am Abirami. I have completed my M.Com and am currently working as a Civil Engineer at Government Service in Salem. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'middle_class', true, false, true, 100, NOW() - INTERVAL '6 days', 'Rohini', 'Rishabam', 'Simham', 'Agastya', 'free', 5, 5, 'vegetarian', 'no', 'no'
    ) ON CONFLICT (id) DO UPDATE SET
      profile_id = EXCLUDED.profile_id,
      display_name = EXCLUDED.display_name,
      gender = EXCLUDED.gender,
      date_of_birth = EXCLUDED.date_of_birth,
      height_cm = EXCLUDED.height_cm,
      marital_status = EXCLUDED.marital_status,
      religion = EXCLUDED.religion,
      caste = EXCLUDED.caste,
      subcaste = EXCLUDED.subcaste,
      dosham = EXCLUDED.dosham,
      education = EXCLUDED.education,
      education_detail = EXCLUDED.education_detail,
      occupation = EXCLUDED.occupation,
      occupation_detail = EXCLUDED.occupation_detail,
      annual_income = EXCLUDED.annual_income,
      company_name = EXCLUDED.company_name,
      city = EXCLUDED.city,
      district = EXCLUDED.district,
      about_me = EXCLUDED.about_me,
      family_type = EXCLUDED.family_type,
      family_status = EXCLUDED.family_status,
      is_verified = EXCLUDED.is_verified,
      is_premium = EXCLUDED.is_premium,
      is_profile_complete = EXCLUDED.is_profile_complete,
      profile_completion_percent = EXCLUDED.profile_completion_percent,
      last_active_at = EXCLUDED.last_active_at,
      star = EXCLUDED.star,
      raasi = EXCLUDED.raasi,
      lagnam = EXCLUDED.lagnam,
      gothram = EXCLUDED.gothram,
      tier = EXCLUDED.tier,
      contacts_remaining = EXCLUDED.contacts_remaining,
      interests_remaining = EXCLUDED.interests_remaining,
      food_habit = EXCLUDED.food_habit,
      smoking = EXCLUDED.smoking,
      drinking = EXCLUDED.drinking;
INSERT INTO public.profiles (
      id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at, star, raasi, lagnam, gothram, tier, contacts_remaining, interests_remaining, food_habit, smoking, drinking
    ) VALUES (
      '00000000-0000-4000-a000-0000000000c5', 'TM000197', 'Jayakumar Raj', 'male', '1990-03-10', 165, 'never_married', 'Hindu', 'Agamudayar', 'Agamudayar subcaste', 'yes', 'B.Com', 'B.Com Graduate', 'Civil Engineer', 'Civil Engineer Details', '₹10 Lakhs - ₹15 Lakhs', 'HCL', 'Tiruchirappalli', 'Trichy', 'Hi, I am Jayakumar. I have completed my B.Com and am currently working as a Civil Engineer at HCL in Tiruchirappalli. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'upper_middle_class', true, false, true, 100, NOW() - INTERVAL '7 days', 'Revati', 'Dhanusu', 'Dhanusu', 'Harita', 'free', 5, 5, 'vegetarian', 'no', 'no'
    ) ON CONFLICT (id) DO UPDATE SET
      profile_id = EXCLUDED.profile_id,
      display_name = EXCLUDED.display_name,
      gender = EXCLUDED.gender,
      date_of_birth = EXCLUDED.date_of_birth,
      height_cm = EXCLUDED.height_cm,
      marital_status = EXCLUDED.marital_status,
      religion = EXCLUDED.religion,
      caste = EXCLUDED.caste,
      subcaste = EXCLUDED.subcaste,
      dosham = EXCLUDED.dosham,
      education = EXCLUDED.education,
      education_detail = EXCLUDED.education_detail,
      occupation = EXCLUDED.occupation,
      occupation_detail = EXCLUDED.occupation_detail,
      annual_income = EXCLUDED.annual_income,
      company_name = EXCLUDED.company_name,
      city = EXCLUDED.city,
      district = EXCLUDED.district,
      about_me = EXCLUDED.about_me,
      family_type = EXCLUDED.family_type,
      family_status = EXCLUDED.family_status,
      is_verified = EXCLUDED.is_verified,
      is_premium = EXCLUDED.is_premium,
      is_profile_complete = EXCLUDED.is_profile_complete,
      profile_completion_percent = EXCLUDED.profile_completion_percent,
      last_active_at = EXCLUDED.last_active_at,
      star = EXCLUDED.star,
      raasi = EXCLUDED.raasi,
      lagnam = EXCLUDED.lagnam,
      gothram = EXCLUDED.gothram,
      tier = EXCLUDED.tier,
      contacts_remaining = EXCLUDED.contacts_remaining,
      interests_remaining = EXCLUDED.interests_remaining,
      food_habit = EXCLUDED.food_habit,
      smoking = EXCLUDED.smoking,
      drinking = EXCLUDED.drinking;
INSERT INTO public.profiles (
      id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at, star, raasi, lagnam, gothram, tier, contacts_remaining, interests_remaining, food_habit, smoking, drinking
    ) VALUES (
      '00000000-0000-4000-a000-0000000000c6', 'TM000198', 'Nivedha Kumar', 'female', '2002-12-21', 159, 'never_married', 'Hindu', 'Adi Dravida', NULL, 'no', 'M.Com', 'M.Com Graduate', 'Business Owner', 'Business Owner Details', '₹20 Lakhs+', 'TCS', 'Thoothukudi', 'Tuticorin', 'Hi, I am Nivedha. I have completed my M.Com and am currently working as a Business Owner at TCS in Thoothukudi. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'middle_class', true, false, true, 100, NOW() - INTERVAL '0 days', 'Poorvabhadrapada', 'Thulaam', 'Dhanusu', 'Gautama', 'free', 5, 5, 'vegetarian', 'no', 'no'
    ) ON CONFLICT (id) DO UPDATE SET
      profile_id = EXCLUDED.profile_id,
      display_name = EXCLUDED.display_name,
      gender = EXCLUDED.gender,
      date_of_birth = EXCLUDED.date_of_birth,
      height_cm = EXCLUDED.height_cm,
      marital_status = EXCLUDED.marital_status,
      religion = EXCLUDED.religion,
      caste = EXCLUDED.caste,
      subcaste = EXCLUDED.subcaste,
      dosham = EXCLUDED.dosham,
      education = EXCLUDED.education,
      education_detail = EXCLUDED.education_detail,
      occupation = EXCLUDED.occupation,
      occupation_detail = EXCLUDED.occupation_detail,
      annual_income = EXCLUDED.annual_income,
      company_name = EXCLUDED.company_name,
      city = EXCLUDED.city,
      district = EXCLUDED.district,
      about_me = EXCLUDED.about_me,
      family_type = EXCLUDED.family_type,
      family_status = EXCLUDED.family_status,
      is_verified = EXCLUDED.is_verified,
      is_premium = EXCLUDED.is_premium,
      is_profile_complete = EXCLUDED.is_profile_complete,
      profile_completion_percent = EXCLUDED.profile_completion_percent,
      last_active_at = EXCLUDED.last_active_at,
      star = EXCLUDED.star,
      raasi = EXCLUDED.raasi,
      lagnam = EXCLUDED.lagnam,
      gothram = EXCLUDED.gothram,
      tier = EXCLUDED.tier,
      contacts_remaining = EXCLUDED.contacts_remaining,
      interests_remaining = EXCLUDED.interests_remaining,
      food_habit = EXCLUDED.food_habit,
      smoking = EXCLUDED.smoking,
      drinking = EXCLUDED.drinking;
INSERT INTO public.profiles (
      id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at, star, raasi, lagnam, gothram, tier, contacts_remaining, interests_remaining, food_habit, smoking, drinking
    ) VALUES (
      '00000000-0000-4000-a000-0000000000c7', 'TM000199', 'Saravanan Nathan', 'male', '2000-02-25', 164, 'never_married', 'Muslim', 'Rawther', NULL, 'no', 'M.Sc', 'M.Sc Graduate', 'Mechanical Engineer', 'Mechanical Engineer Details', '₹3 Lakhs - ₹5 Lakhs', 'Private Practice', 'Tiruppur', 'Tiruppur', 'Hi, I am Saravanan. I have completed my M.Sc and am currently working as a Mechanical Engineer at Private Practice in Tiruppur. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'joint', 'middle_class', false, false, true, 100, NOW() - INTERVAL '10 days', 'Mirgashira', 'Kumbam', 'Kadagam', 'Gautama', 'free', 5, 5, 'vegetarian', 'no', 'no'
    ) ON CONFLICT (id) DO UPDATE SET
      profile_id = EXCLUDED.profile_id,
      display_name = EXCLUDED.display_name,
      gender = EXCLUDED.gender,
      date_of_birth = EXCLUDED.date_of_birth,
      height_cm = EXCLUDED.height_cm,
      marital_status = EXCLUDED.marital_status,
      religion = EXCLUDED.religion,
      caste = EXCLUDED.caste,
      subcaste = EXCLUDED.subcaste,
      dosham = EXCLUDED.dosham,
      education = EXCLUDED.education,
      education_detail = EXCLUDED.education_detail,
      occupation = EXCLUDED.occupation,
      occupation_detail = EXCLUDED.occupation_detail,
      annual_income = EXCLUDED.annual_income,
      company_name = EXCLUDED.company_name,
      city = EXCLUDED.city,
      district = EXCLUDED.district,
      about_me = EXCLUDED.about_me,
      family_type = EXCLUDED.family_type,
      family_status = EXCLUDED.family_status,
      is_verified = EXCLUDED.is_verified,
      is_premium = EXCLUDED.is_premium,
      is_profile_complete = EXCLUDED.is_profile_complete,
      profile_completion_percent = EXCLUDED.profile_completion_percent,
      last_active_at = EXCLUDED.last_active_at,
      star = EXCLUDED.star,
      raasi = EXCLUDED.raasi,
      lagnam = EXCLUDED.lagnam,
      gothram = EXCLUDED.gothram,
      tier = EXCLUDED.tier,
      contacts_remaining = EXCLUDED.contacts_remaining,
      interests_remaining = EXCLUDED.interests_remaining,
      food_habit = EXCLUDED.food_habit,
      smoking = EXCLUDED.smoking,
      drinking = EXCLUDED.drinking;
INSERT INTO public.profiles (
      id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at, star, raasi, lagnam, gothram, tier, contacts_remaining, interests_remaining, food_habit, smoking, drinking
    ) VALUES (
      '00000000-0000-4000-a000-0000000000c8', 'TM000200', 'Vanitha Moorthy', 'female', '2002-02-07', 162, 'never_married', 'Hindu', 'Brahmin - Iyer', NULL, 'no', 'B.Com', 'B.Com Graduate', 'Dentist', 'Dentist Details', '₹20 Lakhs+', 'Cognizant', 'Kanchipuram', 'Kanchipuram', 'Hi, I am Vanitha. I have completed my B.Com and am currently working as a Dentist at Cognizant in Kanchipuram. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'rich', true, true, true, 100, NOW() - INTERVAL '6 days', 'Poorvashadha', 'Thulaam', 'Kadagam', 'Agastya', 'gold', 50, 100, 'vegetarian', 'no', 'no'
    ) ON CONFLICT (id) DO UPDATE SET
      profile_id = EXCLUDED.profile_id,
      display_name = EXCLUDED.display_name,
      gender = EXCLUDED.gender,
      date_of_birth = EXCLUDED.date_of_birth,
      height_cm = EXCLUDED.height_cm,
      marital_status = EXCLUDED.marital_status,
      religion = EXCLUDED.religion,
      caste = EXCLUDED.caste,
      subcaste = EXCLUDED.subcaste,
      dosham = EXCLUDED.dosham,
      education = EXCLUDED.education,
      education_detail = EXCLUDED.education_detail,
      occupation = EXCLUDED.occupation,
      occupation_detail = EXCLUDED.occupation_detail,
      annual_income = EXCLUDED.annual_income,
      company_name = EXCLUDED.company_name,
      city = EXCLUDED.city,
      district = EXCLUDED.district,
      about_me = EXCLUDED.about_me,
      family_type = EXCLUDED.family_type,
      family_status = EXCLUDED.family_status,
      is_verified = EXCLUDED.is_verified,
      is_premium = EXCLUDED.is_premium,
      is_profile_complete = EXCLUDED.is_profile_complete,
      profile_completion_percent = EXCLUDED.profile_completion_percent,
      last_active_at = EXCLUDED.last_active_at,
      star = EXCLUDED.star,
      raasi = EXCLUDED.raasi,
      lagnam = EXCLUDED.lagnam,
      gothram = EXCLUDED.gothram,
      tier = EXCLUDED.tier,
      contacts_remaining = EXCLUDED.contacts_remaining,
      interests_remaining = EXCLUDED.interests_remaining,
      food_habit = EXCLUDED.food_habit,
      smoking = EXCLUDED.smoking,
      drinking = EXCLUDED.drinking;
INSERT INTO public.profiles (
      id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at, star, raasi, lagnam, gothram, tier, contacts_remaining, interests_remaining, food_habit, smoking, drinking
    ) VALUES (
      '00000000-0000-4000-a000-0000000000c9', 'TM000201', 'Srinivasan Krishnan', 'male', '2001-12-01', 175, 'never_married', 'Hindu', 'Agamudayar', 'Agamudayar subcaste', 'no', 'B.E. / B.Tech', 'B.E. / B.Tech Graduate', 'Mechanical Engineer', 'Mechanical Engineer Details', '₹20 Lakhs+', 'Infosys', 'Salem', 'Salem', 'Hi, I am Srinivasan. I have completed my B.E. / B.Tech and am currently working as a Mechanical Engineer at Infosys in Salem. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'middle_class', false, false, true, 100, NOW() - INTERVAL '4 days', 'Aslesha', 'Meenam', 'Meenam', 'Atri', 'free', 5, 5, 'vegetarian', 'no', 'no'
    ) ON CONFLICT (id) DO UPDATE SET
      profile_id = EXCLUDED.profile_id,
      display_name = EXCLUDED.display_name,
      gender = EXCLUDED.gender,
      date_of_birth = EXCLUDED.date_of_birth,
      height_cm = EXCLUDED.height_cm,
      marital_status = EXCLUDED.marital_status,
      religion = EXCLUDED.religion,
      caste = EXCLUDED.caste,
      subcaste = EXCLUDED.subcaste,
      dosham = EXCLUDED.dosham,
      education = EXCLUDED.education,
      education_detail = EXCLUDED.education_detail,
      occupation = EXCLUDED.occupation,
      occupation_detail = EXCLUDED.occupation_detail,
      annual_income = EXCLUDED.annual_income,
      company_name = EXCLUDED.company_name,
      city = EXCLUDED.city,
      district = EXCLUDED.district,
      about_me = EXCLUDED.about_me,
      family_type = EXCLUDED.family_type,
      family_status = EXCLUDED.family_status,
      is_verified = EXCLUDED.is_verified,
      is_premium = EXCLUDED.is_premium,
      is_profile_complete = EXCLUDED.is_profile_complete,
      profile_completion_percent = EXCLUDED.profile_completion_percent,
      last_active_at = EXCLUDED.last_active_at,
      star = EXCLUDED.star,
      raasi = EXCLUDED.raasi,
      lagnam = EXCLUDED.lagnam,
      gothram = EXCLUDED.gothram,
      tier = EXCLUDED.tier,
      contacts_remaining = EXCLUDED.contacts_remaining,
      interests_remaining = EXCLUDED.interests_remaining,
      food_habit = EXCLUDED.food_habit,
      smoking = EXCLUDED.smoking,
      drinking = EXCLUDED.drinking;
INSERT INTO public.profiles (
      id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at, star, raasi, lagnam, gothram, tier, contacts_remaining, interests_remaining, food_habit, smoking, drinking
    ) VALUES (
      '00000000-0000-4000-a000-0000000000ca', 'TM000202', 'Gowri Swamy', 'female', '1991-07-01', 153, 'never_married', 'Hindu', 'Brahmin - Iyer', 'Brahmin - Iyer subcaste', 'yes', 'B.A', 'B.A Graduate', 'Bank Manager', 'Bank Manager Details', '₹5 Lakhs - ₹7 Lakhs', 'Self Employed', 'Thoothukudi', 'Tuticorin', 'Hi, I am Gowri. I have completed my B.A and am currently working as a Bank Manager at Self Employed in Thoothukudi. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'middle_class', true, false, true, 100, NOW() - INTERVAL '6 days', 'Bharani', 'Mesham', 'Kanni', 'Viswamitra', 'free', 5, 5, 'vegetarian', 'no', 'no'
    ) ON CONFLICT (id) DO UPDATE SET
      profile_id = EXCLUDED.profile_id,
      display_name = EXCLUDED.display_name,
      gender = EXCLUDED.gender,
      date_of_birth = EXCLUDED.date_of_birth,
      height_cm = EXCLUDED.height_cm,
      marital_status = EXCLUDED.marital_status,
      religion = EXCLUDED.religion,
      caste = EXCLUDED.caste,
      subcaste = EXCLUDED.subcaste,
      dosham = EXCLUDED.dosham,
      education = EXCLUDED.education,
      education_detail = EXCLUDED.education_detail,
      occupation = EXCLUDED.occupation,
      occupation_detail = EXCLUDED.occupation_detail,
      annual_income = EXCLUDED.annual_income,
      company_name = EXCLUDED.company_name,
      city = EXCLUDED.city,
      district = EXCLUDED.district,
      about_me = EXCLUDED.about_me,
      family_type = EXCLUDED.family_type,
      family_status = EXCLUDED.family_status,
      is_verified = EXCLUDED.is_verified,
      is_premium = EXCLUDED.is_premium,
      is_profile_complete = EXCLUDED.is_profile_complete,
      profile_completion_percent = EXCLUDED.profile_completion_percent,
      last_active_at = EXCLUDED.last_active_at,
      star = EXCLUDED.star,
      raasi = EXCLUDED.raasi,
      lagnam = EXCLUDED.lagnam,
      gothram = EXCLUDED.gothram,
      tier = EXCLUDED.tier,
      contacts_remaining = EXCLUDED.contacts_remaining,
      interests_remaining = EXCLUDED.interests_remaining,
      food_habit = EXCLUDED.food_habit,
      smoking = EXCLUDED.smoking,
      drinking = EXCLUDED.drinking;
INSERT INTO public.profiles (
      id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at, star, raasi, lagnam, gothram, tier, contacts_remaining, interests_remaining, food_habit, smoking, drinking
    ) VALUES (
      '00000000-0000-4000-a000-0000000000cb', 'TM000203', 'Naveen Selvan', 'male', '2001-02-02', 188, 'never_married', 'Christian', 'RC Christian', 'RC Christian subcaste', 'no', 'M.A', 'M.A Graduate', 'School Teacher', 'School Teacher Details', '₹10 Lakhs - ₹15 Lakhs', 'Private Practice', 'Tiruchirappalli', 'Trichy', 'Hi, I am Naveen. I have completed my M.A and am currently working as a School Teacher at Private Practice in Tiruchirappalli. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'middle_class', true, false, true, 100, NOW() - INTERVAL '9 days', 'Uttarachadha', 'Viruchigam', 'Kanni', 'Vishnu', 'free', 5, 5, 'vegetarian', 'no', 'no'
    ) ON CONFLICT (id) DO UPDATE SET
      profile_id = EXCLUDED.profile_id,
      display_name = EXCLUDED.display_name,
      gender = EXCLUDED.gender,
      date_of_birth = EXCLUDED.date_of_birth,
      height_cm = EXCLUDED.height_cm,
      marital_status = EXCLUDED.marital_status,
      religion = EXCLUDED.religion,
      caste = EXCLUDED.caste,
      subcaste = EXCLUDED.subcaste,
      dosham = EXCLUDED.dosham,
      education = EXCLUDED.education,
      education_detail = EXCLUDED.education_detail,
      occupation = EXCLUDED.occupation,
      occupation_detail = EXCLUDED.occupation_detail,
      annual_income = EXCLUDED.annual_income,
      company_name = EXCLUDED.company_name,
      city = EXCLUDED.city,
      district = EXCLUDED.district,
      about_me = EXCLUDED.about_me,
      family_type = EXCLUDED.family_type,
      family_status = EXCLUDED.family_status,
      is_verified = EXCLUDED.is_verified,
      is_premium = EXCLUDED.is_premium,
      is_profile_complete = EXCLUDED.is_profile_complete,
      profile_completion_percent = EXCLUDED.profile_completion_percent,
      last_active_at = EXCLUDED.last_active_at,
      star = EXCLUDED.star,
      raasi = EXCLUDED.raasi,
      lagnam = EXCLUDED.lagnam,
      gothram = EXCLUDED.gothram,
      tier = EXCLUDED.tier,
      contacts_remaining = EXCLUDED.contacts_remaining,
      interests_remaining = EXCLUDED.interests_remaining,
      food_habit = EXCLUDED.food_habit,
      smoking = EXCLUDED.smoking,
      drinking = EXCLUDED.drinking;
INSERT INTO public.profiles (
      id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at, star, raasi, lagnam, gothram, tier, contacts_remaining, interests_remaining, food_habit, smoking, drinking
    ) VALUES (
      '00000000-0000-4000-a000-0000000000cc', 'TM000204', 'Vijaya Raj', 'female', '1989-06-18', 158, 'never_married', 'Hindu', 'Brahmin - Iyer', 'Brahmin - Iyer subcaste', 'yes', 'B.Sc', 'B.Sc Graduate', 'Pharmacist', 'Pharmacist Details', '₹10 Lakhs - ₹15 Lakhs', 'Zoho', 'Chennai', 'Chennai', 'Hi, I am Vijaya. I have completed my B.Sc and am currently working as a Pharmacist at Zoho in Chennai. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'middle_class', false, false, true, 100, NOW() - INTERVAL '6 days', 'Shatabhisha', 'Simham', 'Rishabam', 'Vashishta', 'free', 5, 5, 'vegetarian', 'no', 'no'
    ) ON CONFLICT (id) DO UPDATE SET
      profile_id = EXCLUDED.profile_id,
      display_name = EXCLUDED.display_name,
      gender = EXCLUDED.gender,
      date_of_birth = EXCLUDED.date_of_birth,
      height_cm = EXCLUDED.height_cm,
      marital_status = EXCLUDED.marital_status,
      religion = EXCLUDED.religion,
      caste = EXCLUDED.caste,
      subcaste = EXCLUDED.subcaste,
      dosham = EXCLUDED.dosham,
      education = EXCLUDED.education,
      education_detail = EXCLUDED.education_detail,
      occupation = EXCLUDED.occupation,
      occupation_detail = EXCLUDED.occupation_detail,
      annual_income = EXCLUDED.annual_income,
      company_name = EXCLUDED.company_name,
      city = EXCLUDED.city,
      district = EXCLUDED.district,
      about_me = EXCLUDED.about_me,
      family_type = EXCLUDED.family_type,
      family_status = EXCLUDED.family_status,
      is_verified = EXCLUDED.is_verified,
      is_premium = EXCLUDED.is_premium,
      is_profile_complete = EXCLUDED.is_profile_complete,
      profile_completion_percent = EXCLUDED.profile_completion_percent,
      last_active_at = EXCLUDED.last_active_at,
      star = EXCLUDED.star,
      raasi = EXCLUDED.raasi,
      lagnam = EXCLUDED.lagnam,
      gothram = EXCLUDED.gothram,
      tier = EXCLUDED.tier,
      contacts_remaining = EXCLUDED.contacts_remaining,
      interests_remaining = EXCLUDED.interests_remaining,
      food_habit = EXCLUDED.food_habit,
      smoking = EXCLUDED.smoking,
      drinking = EXCLUDED.drinking;
INSERT INTO public.profiles (
      id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at, star, raasi, lagnam, gothram, tier, contacts_remaining, interests_remaining, food_habit, smoking, drinking
    ) VALUES (
      '00000000-0000-4000-a000-0000000000cd', 'TM000205', 'Naveen Raman', 'male', '2003-04-20', 185, 'never_married', 'Hindu', 'Arunthathiyar', 'Arunthathiyar subcaste', 'yes', 'B.A', 'B.A Graduate', 'School Teacher', 'School Teacher Details', '₹3 Lakhs - ₹5 Lakhs', 'Infosys', 'Tiruppur', 'Tiruppur', 'Hi, I am Naveen. I have completed my B.A and am currently working as a School Teacher at Infosys in Tiruppur. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'upper_middle_class', true, false, true, 100, NOW() - INTERVAL '6 days', 'Hasta', 'Viruchigam', 'Mithunam', 'Murugan', 'free', 5, 5, 'vegetarian', 'no', 'no'
    ) ON CONFLICT (id) DO UPDATE SET
      profile_id = EXCLUDED.profile_id,
      display_name = EXCLUDED.display_name,
      gender = EXCLUDED.gender,
      date_of_birth = EXCLUDED.date_of_birth,
      height_cm = EXCLUDED.height_cm,
      marital_status = EXCLUDED.marital_status,
      religion = EXCLUDED.religion,
      caste = EXCLUDED.caste,
      subcaste = EXCLUDED.subcaste,
      dosham = EXCLUDED.dosham,
      education = EXCLUDED.education,
      education_detail = EXCLUDED.education_detail,
      occupation = EXCLUDED.occupation,
      occupation_detail = EXCLUDED.occupation_detail,
      annual_income = EXCLUDED.annual_income,
      company_name = EXCLUDED.company_name,
      city = EXCLUDED.city,
      district = EXCLUDED.district,
      about_me = EXCLUDED.about_me,
      family_type = EXCLUDED.family_type,
      family_status = EXCLUDED.family_status,
      is_verified = EXCLUDED.is_verified,
      is_premium = EXCLUDED.is_premium,
      is_profile_complete = EXCLUDED.is_profile_complete,
      profile_completion_percent = EXCLUDED.profile_completion_percent,
      last_active_at = EXCLUDED.last_active_at,
      star = EXCLUDED.star,
      raasi = EXCLUDED.raasi,
      lagnam = EXCLUDED.lagnam,
      gothram = EXCLUDED.gothram,
      tier = EXCLUDED.tier,
      contacts_remaining = EXCLUDED.contacts_remaining,
      interests_remaining = EXCLUDED.interests_remaining,
      food_habit = EXCLUDED.food_habit,
      smoking = EXCLUDED.smoking,
      drinking = EXCLUDED.drinking;
INSERT INTO public.profiles (
      id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at, star, raasi, lagnam, gothram, tier, contacts_remaining, interests_remaining, food_habit, smoking, drinking
    ) VALUES (
      '00000000-0000-4000-a000-0000000000ce', 'TM000206', 'Ramya Kumar', 'female', '1997-07-12', 175, 'divorced', 'Hindu', 'Adi Dravida', 'Adi Dravida subcaste', 'no', 'B.E. / B.Tech', 'B.E. / B.Tech Graduate', 'Auditor', 'Auditor Details', '₹20 Lakhs+', 'Wipro', 'Erode', 'Erode', 'Hi, I am Ramya. I have completed my B.E. / B.Tech and am currently working as a Auditor at Wipro in Erode. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'middle_class', true, true, true, 100, NOW() - INTERVAL '5 days', 'Uttarachadha', 'Thulaam', 'Mithunam', 'Siva', 'gold', 50, 100, 'vegetarian', 'no', 'no'
    ) ON CONFLICT (id) DO UPDATE SET
      profile_id = EXCLUDED.profile_id,
      display_name = EXCLUDED.display_name,
      gender = EXCLUDED.gender,
      date_of_birth = EXCLUDED.date_of_birth,
      height_cm = EXCLUDED.height_cm,
      marital_status = EXCLUDED.marital_status,
      religion = EXCLUDED.religion,
      caste = EXCLUDED.caste,
      subcaste = EXCLUDED.subcaste,
      dosham = EXCLUDED.dosham,
      education = EXCLUDED.education,
      education_detail = EXCLUDED.education_detail,
      occupation = EXCLUDED.occupation,
      occupation_detail = EXCLUDED.occupation_detail,
      annual_income = EXCLUDED.annual_income,
      company_name = EXCLUDED.company_name,
      city = EXCLUDED.city,
      district = EXCLUDED.district,
      about_me = EXCLUDED.about_me,
      family_type = EXCLUDED.family_type,
      family_status = EXCLUDED.family_status,
      is_verified = EXCLUDED.is_verified,
      is_premium = EXCLUDED.is_premium,
      is_profile_complete = EXCLUDED.is_profile_complete,
      profile_completion_percent = EXCLUDED.profile_completion_percent,
      last_active_at = EXCLUDED.last_active_at,
      star = EXCLUDED.star,
      raasi = EXCLUDED.raasi,
      lagnam = EXCLUDED.lagnam,
      gothram = EXCLUDED.gothram,
      tier = EXCLUDED.tier,
      contacts_remaining = EXCLUDED.contacts_remaining,
      interests_remaining = EXCLUDED.interests_remaining,
      food_habit = EXCLUDED.food_habit,
      smoking = EXCLUDED.smoking,
      drinking = EXCLUDED.drinking;
INSERT INTO public.profiles (
      id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at, star, raasi, lagnam, gothram, tier, contacts_remaining, interests_remaining, food_habit, smoking, drinking
    ) VALUES (
      '00000000-0000-4000-a000-0000000000cf', 'TM000207', 'Selvam Krishnan', 'male', '2001-05-22', 163, 'divorced', 'Muslim', 'Shia Muslim', 'Shia Muslim subcaste', 'no', 'M.Com', 'M.Com Graduate', 'Pharmacist', 'Pharmacist Details', '₹5 Lakhs - ₹7 Lakhs', 'Accenture', 'Erode', 'Erode', 'Hi, I am Selvam. I have completed my M.Com and am currently working as a Pharmacist at Accenture in Erode. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'upper_middle_class', false, false, true, 100, NOW() - INTERVAL '8 days', 'Poorvaphalguni', 'Mithunam', 'Kadagam', 'Harita', 'free', 5, 5, 'vegetarian', 'no', 'no'
    ) ON CONFLICT (id) DO UPDATE SET
      profile_id = EXCLUDED.profile_id,
      display_name = EXCLUDED.display_name,
      gender = EXCLUDED.gender,
      date_of_birth = EXCLUDED.date_of_birth,
      height_cm = EXCLUDED.height_cm,
      marital_status = EXCLUDED.marital_status,
      religion = EXCLUDED.religion,
      caste = EXCLUDED.caste,
      subcaste = EXCLUDED.subcaste,
      dosham = EXCLUDED.dosham,
      education = EXCLUDED.education,
      education_detail = EXCLUDED.education_detail,
      occupation = EXCLUDED.occupation,
      occupation_detail = EXCLUDED.occupation_detail,
      annual_income = EXCLUDED.annual_income,
      company_name = EXCLUDED.company_name,
      city = EXCLUDED.city,
      district = EXCLUDED.district,
      about_me = EXCLUDED.about_me,
      family_type = EXCLUDED.family_type,
      family_status = EXCLUDED.family_status,
      is_verified = EXCLUDED.is_verified,
      is_premium = EXCLUDED.is_premium,
      is_profile_complete = EXCLUDED.is_profile_complete,
      profile_completion_percent = EXCLUDED.profile_completion_percent,
      last_active_at = EXCLUDED.last_active_at,
      star = EXCLUDED.star,
      raasi = EXCLUDED.raasi,
      lagnam = EXCLUDED.lagnam,
      gothram = EXCLUDED.gothram,
      tier = EXCLUDED.tier,
      contacts_remaining = EXCLUDED.contacts_remaining,
      interests_remaining = EXCLUDED.interests_remaining,
      food_habit = EXCLUDED.food_habit,
      smoking = EXCLUDED.smoking,
      drinking = EXCLUDED.drinking;
INSERT INTO public.profiles (
      id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at, star, raasi, lagnam, gothram, tier, contacts_remaining, interests_remaining, food_habit, smoking, drinking
    ) VALUES (
      '00000000-0000-4000-a000-0000000000d0', 'TM000208', 'Preethi Devan', 'female', '1989-12-16', 156, 'never_married', 'Hindu', 'Nadar', 'Nadar subcaste', 'yes', 'B.Com', 'B.Com Graduate', 'Bank Manager', 'Bank Manager Details', '₹3 Lakhs - ₹5 Lakhs', 'Private Practice', 'Madurai', 'Madurai', 'Hi, I am Preethi. I have completed my B.Com and am currently working as a Bank Manager at Private Practice in Madurai. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'middle_class', true, true, true, 100, NOW() - INTERVAL '1 days', 'Poorvabhadrapada', 'Kanni', 'Mithunam', 'Vashishta', 'gold', 50, 100, 'vegetarian', 'no', 'no'
    ) ON CONFLICT (id) DO UPDATE SET
      profile_id = EXCLUDED.profile_id,
      display_name = EXCLUDED.display_name,
      gender = EXCLUDED.gender,
      date_of_birth = EXCLUDED.date_of_birth,
      height_cm = EXCLUDED.height_cm,
      marital_status = EXCLUDED.marital_status,
      religion = EXCLUDED.religion,
      caste = EXCLUDED.caste,
      subcaste = EXCLUDED.subcaste,
      dosham = EXCLUDED.dosham,
      education = EXCLUDED.education,
      education_detail = EXCLUDED.education_detail,
      occupation = EXCLUDED.occupation,
      occupation_detail = EXCLUDED.occupation_detail,
      annual_income = EXCLUDED.annual_income,
      company_name = EXCLUDED.company_name,
      city = EXCLUDED.city,
      district = EXCLUDED.district,
      about_me = EXCLUDED.about_me,
      family_type = EXCLUDED.family_type,
      family_status = EXCLUDED.family_status,
      is_verified = EXCLUDED.is_verified,
      is_premium = EXCLUDED.is_premium,
      is_profile_complete = EXCLUDED.is_profile_complete,
      profile_completion_percent = EXCLUDED.profile_completion_percent,
      last_active_at = EXCLUDED.last_active_at,
      star = EXCLUDED.star,
      raasi = EXCLUDED.raasi,
      lagnam = EXCLUDED.lagnam,
      gothram = EXCLUDED.gothram,
      tier = EXCLUDED.tier,
      contacts_remaining = EXCLUDED.contacts_remaining,
      interests_remaining = EXCLUDED.interests_remaining,
      food_habit = EXCLUDED.food_habit,
      smoking = EXCLUDED.smoking,
      drinking = EXCLUDED.drinking;
INSERT INTO public.profiles (
      id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at, star, raasi, lagnam, gothram, tier, contacts_remaining, interests_remaining, food_habit, smoking, drinking
    ) VALUES (
      '00000000-0000-4000-a000-0000000000d1', 'TM000209', 'Rajesh Moorthy', 'male', '2002-01-19', 187, 'never_married', 'Hindu', 'Maravar', NULL, 'no', 'M.C.A', 'M.C.A Graduate', 'Dentist', 'Dentist Details', '₹3 Lakhs - ₹5 Lakhs', 'TCS', 'Thanjavur', 'Thanjavur', 'Hi, I am Rajesh. I have completed my M.C.A and am currently working as a Dentist at TCS in Thanjavur. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'joint', 'middle_class', false, false, true, 100, NOW() - INTERVAL '10 days', 'Pushya', 'Kadagam', 'Magaram', 'Siva', 'free', 5, 5, 'vegetarian', 'no', 'no'
    ) ON CONFLICT (id) DO UPDATE SET
      profile_id = EXCLUDED.profile_id,
      display_name = EXCLUDED.display_name,
      gender = EXCLUDED.gender,
      date_of_birth = EXCLUDED.date_of_birth,
      height_cm = EXCLUDED.height_cm,
      marital_status = EXCLUDED.marital_status,
      religion = EXCLUDED.religion,
      caste = EXCLUDED.caste,
      subcaste = EXCLUDED.subcaste,
      dosham = EXCLUDED.dosham,
      education = EXCLUDED.education,
      education_detail = EXCLUDED.education_detail,
      occupation = EXCLUDED.occupation,
      occupation_detail = EXCLUDED.occupation_detail,
      annual_income = EXCLUDED.annual_income,
      company_name = EXCLUDED.company_name,
      city = EXCLUDED.city,
      district = EXCLUDED.district,
      about_me = EXCLUDED.about_me,
      family_type = EXCLUDED.family_type,
      family_status = EXCLUDED.family_status,
      is_verified = EXCLUDED.is_verified,
      is_premium = EXCLUDED.is_premium,
      is_profile_complete = EXCLUDED.is_profile_complete,
      profile_completion_percent = EXCLUDED.profile_completion_percent,
      last_active_at = EXCLUDED.last_active_at,
      star = EXCLUDED.star,
      raasi = EXCLUDED.raasi,
      lagnam = EXCLUDED.lagnam,
      gothram = EXCLUDED.gothram,
      tier = EXCLUDED.tier,
      contacts_remaining = EXCLUDED.contacts_remaining,
      interests_remaining = EXCLUDED.interests_remaining,
      food_habit = EXCLUDED.food_habit,
      smoking = EXCLUDED.smoking,
      drinking = EXCLUDED.drinking;
INSERT INTO public.profiles (
      id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at, star, raasi, lagnam, gothram, tier, contacts_remaining, interests_remaining, food_habit, smoking, drinking
    ) VALUES (
      '00000000-0000-4000-a000-0000000000d2', 'TM000210', 'Indhumathi Nathan', 'female', '1990-09-17', 167, 'never_married', 'Hindu', 'Brahmin - Iyer', 'Brahmin - Iyer subcaste', 'no', 'B.Ed', 'B.Ed Graduate', 'Advocate', 'Advocate Details', '₹5 Lakhs - ₹7 Lakhs', 'Zoho', 'Salem', 'Salem', 'Hi, I am Indhumathi. I have completed my B.Ed and am currently working as a Advocate at Zoho in Salem. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'joint', 'rich', true, true, true, 100, NOW() - INTERVAL '4 days', 'Poorvabhadrapada', 'Magaram', 'Rishabam', 'Gautama', 'gold', 50, 100, 'vegetarian', 'no', 'no'
    ) ON CONFLICT (id) DO UPDATE SET
      profile_id = EXCLUDED.profile_id,
      display_name = EXCLUDED.display_name,
      gender = EXCLUDED.gender,
      date_of_birth = EXCLUDED.date_of_birth,
      height_cm = EXCLUDED.height_cm,
      marital_status = EXCLUDED.marital_status,
      religion = EXCLUDED.religion,
      caste = EXCLUDED.caste,
      subcaste = EXCLUDED.subcaste,
      dosham = EXCLUDED.dosham,
      education = EXCLUDED.education,
      education_detail = EXCLUDED.education_detail,
      occupation = EXCLUDED.occupation,
      occupation_detail = EXCLUDED.occupation_detail,
      annual_income = EXCLUDED.annual_income,
      company_name = EXCLUDED.company_name,
      city = EXCLUDED.city,
      district = EXCLUDED.district,
      about_me = EXCLUDED.about_me,
      family_type = EXCLUDED.family_type,
      family_status = EXCLUDED.family_status,
      is_verified = EXCLUDED.is_verified,
      is_premium = EXCLUDED.is_premium,
      is_profile_complete = EXCLUDED.is_profile_complete,
      profile_completion_percent = EXCLUDED.profile_completion_percent,
      last_active_at = EXCLUDED.last_active_at,
      star = EXCLUDED.star,
      raasi = EXCLUDED.raasi,
      lagnam = EXCLUDED.lagnam,
      gothram = EXCLUDED.gothram,
      tier = EXCLUDED.tier,
      contacts_remaining = EXCLUDED.contacts_remaining,
      interests_remaining = EXCLUDED.interests_remaining,
      food_habit = EXCLUDED.food_habit,
      smoking = EXCLUDED.smoking,
      drinking = EXCLUDED.drinking;
INSERT INTO public.profiles (
      id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at, star, raasi, lagnam, gothram, tier, contacts_remaining, interests_remaining, food_habit, smoking, drinking
    ) VALUES (
      '00000000-0000-4000-a000-0000000000d3', 'TM000211', 'Srinivasan Lingam', 'male', '2000-08-10', 166, 'never_married', 'Hindu', 'Kallar', NULL, 'yes', 'B.A', 'B.A Graduate', 'Bank Manager', 'Bank Manager Details', '₹5 Lakhs - ₹7 Lakhs', 'Accenture', 'Kanchipuram', 'Kanchipuram', 'Hi, I am Srinivasan. I have completed my B.A and am currently working as a Bank Manager at Accenture in Kanchipuram. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'joint', 'upper_middle_class', true, true, true, 100, NOW() - INTERVAL '10 days', 'Mirgashira', 'Meenam', 'Magaram', 'Viswamitra', 'gold', 50, 100, 'vegetarian', 'no', 'no'
    ) ON CONFLICT (id) DO UPDATE SET
      profile_id = EXCLUDED.profile_id,
      display_name = EXCLUDED.display_name,
      gender = EXCLUDED.gender,
      date_of_birth = EXCLUDED.date_of_birth,
      height_cm = EXCLUDED.height_cm,
      marital_status = EXCLUDED.marital_status,
      religion = EXCLUDED.religion,
      caste = EXCLUDED.caste,
      subcaste = EXCLUDED.subcaste,
      dosham = EXCLUDED.dosham,
      education = EXCLUDED.education,
      education_detail = EXCLUDED.education_detail,
      occupation = EXCLUDED.occupation,
      occupation_detail = EXCLUDED.occupation_detail,
      annual_income = EXCLUDED.annual_income,
      company_name = EXCLUDED.company_name,
      city = EXCLUDED.city,
      district = EXCLUDED.district,
      about_me = EXCLUDED.about_me,
      family_type = EXCLUDED.family_type,
      family_status = EXCLUDED.family_status,
      is_verified = EXCLUDED.is_verified,
      is_premium = EXCLUDED.is_premium,
      is_profile_complete = EXCLUDED.is_profile_complete,
      profile_completion_percent = EXCLUDED.profile_completion_percent,
      last_active_at = EXCLUDED.last_active_at,
      star = EXCLUDED.star,
      raasi = EXCLUDED.raasi,
      lagnam = EXCLUDED.lagnam,
      gothram = EXCLUDED.gothram,
      tier = EXCLUDED.tier,
      contacts_remaining = EXCLUDED.contacts_remaining,
      interests_remaining = EXCLUDED.interests_remaining,
      food_habit = EXCLUDED.food_habit,
      smoking = EXCLUDED.smoking,
      drinking = EXCLUDED.drinking;
INSERT INTO public.profiles (
      id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at, star, raasi, lagnam, gothram, tier, contacts_remaining, interests_remaining, food_habit, smoking, drinking
    ) VALUES (
      '00000000-0000-4000-a000-0000000000d4', 'TM000212', 'Priya Lingam', 'female', '2001-04-20', 170, 'never_married', 'Hindu', 'Gounder', 'Gounder subcaste', 'no', 'B.A', 'B.A Graduate', 'Auditor', 'Auditor Details', '₹10 Lakhs - ₹15 Lakhs', 'Zoho', 'Madurai', 'Madurai', 'Hi, I am Priya. I have completed my B.A and am currently working as a Auditor at Zoho in Madurai. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'joint', 'upper_middle_class', true, false, true, 100, NOW() - INTERVAL '2 days', 'Shravana', 'Dhanusu', 'Meenam', 'Siva', 'free', 5, 5, 'vegetarian', 'no', 'no'
    ) ON CONFLICT (id) DO UPDATE SET
      profile_id = EXCLUDED.profile_id,
      display_name = EXCLUDED.display_name,
      gender = EXCLUDED.gender,
      date_of_birth = EXCLUDED.date_of_birth,
      height_cm = EXCLUDED.height_cm,
      marital_status = EXCLUDED.marital_status,
      religion = EXCLUDED.religion,
      caste = EXCLUDED.caste,
      subcaste = EXCLUDED.subcaste,
      dosham = EXCLUDED.dosham,
      education = EXCLUDED.education,
      education_detail = EXCLUDED.education_detail,
      occupation = EXCLUDED.occupation,
      occupation_detail = EXCLUDED.occupation_detail,
      annual_income = EXCLUDED.annual_income,
      company_name = EXCLUDED.company_name,
      city = EXCLUDED.city,
      district = EXCLUDED.district,
      about_me = EXCLUDED.about_me,
      family_type = EXCLUDED.family_type,
      family_status = EXCLUDED.family_status,
      is_verified = EXCLUDED.is_verified,
      is_premium = EXCLUDED.is_premium,
      is_profile_complete = EXCLUDED.is_profile_complete,
      profile_completion_percent = EXCLUDED.profile_completion_percent,
      last_active_at = EXCLUDED.last_active_at,
      star = EXCLUDED.star,
      raasi = EXCLUDED.raasi,
      lagnam = EXCLUDED.lagnam,
      gothram = EXCLUDED.gothram,
      tier = EXCLUDED.tier,
      contacts_remaining = EXCLUDED.contacts_remaining,
      interests_remaining = EXCLUDED.interests_remaining,
      food_habit = EXCLUDED.food_habit,
      smoking = EXCLUDED.smoking,
      drinking = EXCLUDED.drinking;
INSERT INTO public.profiles (
      id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at, star, raasi, lagnam, gothram, tier, contacts_remaining, interests_remaining, food_habit, smoking, drinking
    ) VALUES (
      '00000000-0000-4000-a000-0000000000d5', 'TM000213', 'Dinesh Gopal', 'male', '2004-09-08', 168, 'never_married', 'Hindu', 'Arunthathiyar', 'Arunthathiyar subcaste', 'no', 'M.C.A', 'M.C.A Graduate', 'Auditor', 'Auditor Details', '₹10 Lakhs - ₹15 Lakhs', 'Wipro', 'Madurai', 'Madurai', 'Hi, I am Dinesh. I have completed my M.C.A and am currently working as a Auditor at Wipro in Madurai. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'joint', 'middle_class', true, false, true, 100, NOW() - INTERVAL '1 days', 'Aslesha', 'Kanni', 'Simham', 'Agastya', 'free', 5, 5, 'vegetarian', 'no', 'no'
    ) ON CONFLICT (id) DO UPDATE SET
      profile_id = EXCLUDED.profile_id,
      display_name = EXCLUDED.display_name,
      gender = EXCLUDED.gender,
      date_of_birth = EXCLUDED.date_of_birth,
      height_cm = EXCLUDED.height_cm,
      marital_status = EXCLUDED.marital_status,
      religion = EXCLUDED.religion,
      caste = EXCLUDED.caste,
      subcaste = EXCLUDED.subcaste,
      dosham = EXCLUDED.dosham,
      education = EXCLUDED.education,
      education_detail = EXCLUDED.education_detail,
      occupation = EXCLUDED.occupation,
      occupation_detail = EXCLUDED.occupation_detail,
      annual_income = EXCLUDED.annual_income,
      company_name = EXCLUDED.company_name,
      city = EXCLUDED.city,
      district = EXCLUDED.district,
      about_me = EXCLUDED.about_me,
      family_type = EXCLUDED.family_type,
      family_status = EXCLUDED.family_status,
      is_verified = EXCLUDED.is_verified,
      is_premium = EXCLUDED.is_premium,
      is_profile_complete = EXCLUDED.is_profile_complete,
      profile_completion_percent = EXCLUDED.profile_completion_percent,
      last_active_at = EXCLUDED.last_active_at,
      star = EXCLUDED.star,
      raasi = EXCLUDED.raasi,
      lagnam = EXCLUDED.lagnam,
      gothram = EXCLUDED.gothram,
      tier = EXCLUDED.tier,
      contacts_remaining = EXCLUDED.contacts_remaining,
      interests_remaining = EXCLUDED.interests_remaining,
      food_habit = EXCLUDED.food_habit,
      smoking = EXCLUDED.smoking,
      drinking = EXCLUDED.drinking;
INSERT INTO public.profiles (
      id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at, star, raasi, lagnam, gothram, tier, contacts_remaining, interests_remaining, food_habit, smoking, drinking
    ) VALUES (
      '00000000-0000-4000-a000-0000000000d6', 'TM000214', 'Kayalvizhi Naicker', 'female', '1996-11-04', 156, 'divorced', 'Christian', 'Pentecostal', NULL, 'no', 'M.A', 'M.A Graduate', 'Police Officer', 'Police Officer Details', '₹5 Lakhs - ₹7 Lakhs', 'Cognizant', 'Salem', 'Salem', 'Hi, I am Kayalvizhi. I have completed my M.A and am currently working as a Police Officer at Cognizant in Salem. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'joint', 'middle_class', true, false, true, 100, NOW() - INTERVAL '5 days', 'Poorvaphalguni', 'Viruchigam', 'Mithunam', 'Vishnu', 'free', 5, 5, 'vegetarian', 'no', 'no'
    ) ON CONFLICT (id) DO UPDATE SET
      profile_id = EXCLUDED.profile_id,
      display_name = EXCLUDED.display_name,
      gender = EXCLUDED.gender,
      date_of_birth = EXCLUDED.date_of_birth,
      height_cm = EXCLUDED.height_cm,
      marital_status = EXCLUDED.marital_status,
      religion = EXCLUDED.religion,
      caste = EXCLUDED.caste,
      subcaste = EXCLUDED.subcaste,
      dosham = EXCLUDED.dosham,
      education = EXCLUDED.education,
      education_detail = EXCLUDED.education_detail,
      occupation = EXCLUDED.occupation,
      occupation_detail = EXCLUDED.occupation_detail,
      annual_income = EXCLUDED.annual_income,
      company_name = EXCLUDED.company_name,
      city = EXCLUDED.city,
      district = EXCLUDED.district,
      about_me = EXCLUDED.about_me,
      family_type = EXCLUDED.family_type,
      family_status = EXCLUDED.family_status,
      is_verified = EXCLUDED.is_verified,
      is_premium = EXCLUDED.is_premium,
      is_profile_complete = EXCLUDED.is_profile_complete,
      profile_completion_percent = EXCLUDED.profile_completion_percent,
      last_active_at = EXCLUDED.last_active_at,
      star = EXCLUDED.star,
      raasi = EXCLUDED.raasi,
      lagnam = EXCLUDED.lagnam,
      gothram = EXCLUDED.gothram,
      tier = EXCLUDED.tier,
      contacts_remaining = EXCLUDED.contacts_remaining,
      interests_remaining = EXCLUDED.interests_remaining,
      food_habit = EXCLUDED.food_habit,
      smoking = EXCLUDED.smoking,
      drinking = EXCLUDED.drinking;
INSERT INTO public.profiles (
      id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at, star, raasi, lagnam, gothram, tier, contacts_remaining, interests_remaining, food_habit, smoking, drinking
    ) VALUES (
      '00000000-0000-4000-a000-0000000000d7', 'TM000215', 'Aravind Raman', 'male', '1992-06-21', 164, 'never_married', 'Hindu', 'Devendra Kula Vellalar', NULL, 'no', 'M.Com', 'M.Com Graduate', 'Doctor', 'Doctor Details', '₹3 Lakhs - ₹5 Lakhs', 'Infosys', 'Vellore', 'Vellore', 'Hi, I am Aravind. I have completed my M.Com and am currently working as a Doctor at Infosys in Vellore. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'joint', 'upper_middle_class', false, false, true, 100, NOW() - INTERVAL '5 days', 'Krittika', 'Kumbam', 'Kadagam', 'Vishnu', 'free', 5, 5, 'vegetarian', 'no', 'no'
    ) ON CONFLICT (id) DO UPDATE SET
      profile_id = EXCLUDED.profile_id,
      display_name = EXCLUDED.display_name,
      gender = EXCLUDED.gender,
      date_of_birth = EXCLUDED.date_of_birth,
      height_cm = EXCLUDED.height_cm,
      marital_status = EXCLUDED.marital_status,
      religion = EXCLUDED.religion,
      caste = EXCLUDED.caste,
      subcaste = EXCLUDED.subcaste,
      dosham = EXCLUDED.dosham,
      education = EXCLUDED.education,
      education_detail = EXCLUDED.education_detail,
      occupation = EXCLUDED.occupation,
      occupation_detail = EXCLUDED.occupation_detail,
      annual_income = EXCLUDED.annual_income,
      company_name = EXCLUDED.company_name,
      city = EXCLUDED.city,
      district = EXCLUDED.district,
      about_me = EXCLUDED.about_me,
      family_type = EXCLUDED.family_type,
      family_status = EXCLUDED.family_status,
      is_verified = EXCLUDED.is_verified,
      is_premium = EXCLUDED.is_premium,
      is_profile_complete = EXCLUDED.is_profile_complete,
      profile_completion_percent = EXCLUDED.profile_completion_percent,
      last_active_at = EXCLUDED.last_active_at,
      star = EXCLUDED.star,
      raasi = EXCLUDED.raasi,
      lagnam = EXCLUDED.lagnam,
      gothram = EXCLUDED.gothram,
      tier = EXCLUDED.tier,
      contacts_remaining = EXCLUDED.contacts_remaining,
      interests_remaining = EXCLUDED.interests_remaining,
      food_habit = EXCLUDED.food_habit,
      smoking = EXCLUDED.smoking,
      drinking = EXCLUDED.drinking;
INSERT INTO public.profiles (
      id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at, star, raasi, lagnam, gothram, tier, contacts_remaining, interests_remaining, food_habit, smoking, drinking
    ) VALUES (
      '00000000-0000-4000-a000-0000000000d8', 'TM000216', 'Meenakshi Velan', 'female', '1992-02-04', 165, 'never_married', 'Hindu', 'Adi Dravida', NULL, 'no', 'Ph.D', 'Ph.D Graduate', 'Dentist', 'Dentist Details', '₹7 Lakhs - ₹10 Lakhs', 'HCL', 'Tiruchirappalli', 'Trichy', 'Hi, I am Meenakshi. I have completed my Ph.D and am currently working as a Dentist at HCL in Tiruchirappalli. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'middle_class', true, false, true, 100, NOW() - INTERVAL '9 days', 'Dhanishta', 'Simham', 'Simham', 'Angirasa', 'free', 5, 5, 'vegetarian', 'no', 'no'
    ) ON CONFLICT (id) DO UPDATE SET
      profile_id = EXCLUDED.profile_id,
      display_name = EXCLUDED.display_name,
      gender = EXCLUDED.gender,
      date_of_birth = EXCLUDED.date_of_birth,
      height_cm = EXCLUDED.height_cm,
      marital_status = EXCLUDED.marital_status,
      religion = EXCLUDED.religion,
      caste = EXCLUDED.caste,
      subcaste = EXCLUDED.subcaste,
      dosham = EXCLUDED.dosham,
      education = EXCLUDED.education,
      education_detail = EXCLUDED.education_detail,
      occupation = EXCLUDED.occupation,
      occupation_detail = EXCLUDED.occupation_detail,
      annual_income = EXCLUDED.annual_income,
      company_name = EXCLUDED.company_name,
      city = EXCLUDED.city,
      district = EXCLUDED.district,
      about_me = EXCLUDED.about_me,
      family_type = EXCLUDED.family_type,
      family_status = EXCLUDED.family_status,
      is_verified = EXCLUDED.is_verified,
      is_premium = EXCLUDED.is_premium,
      is_profile_complete = EXCLUDED.is_profile_complete,
      profile_completion_percent = EXCLUDED.profile_completion_percent,
      last_active_at = EXCLUDED.last_active_at,
      star = EXCLUDED.star,
      raasi = EXCLUDED.raasi,
      lagnam = EXCLUDED.lagnam,
      gothram = EXCLUDED.gothram,
      tier = EXCLUDED.tier,
      contacts_remaining = EXCLUDED.contacts_remaining,
      interests_remaining = EXCLUDED.interests_remaining,
      food_habit = EXCLUDED.food_habit,
      smoking = EXCLUDED.smoking,
      drinking = EXCLUDED.drinking;
INSERT INTO public.profiles (
      id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at, star, raasi, lagnam, gothram, tier, contacts_remaining, interests_remaining, food_habit, smoking, drinking
    ) VALUES (
      '00000000-0000-4000-a000-0000000000d9', 'TM000217', 'Prakash Selvan', 'male', '1995-08-08', 168, 'never_married', 'Hindu', 'Brahmin - Iyer', 'Brahmin - Iyer subcaste', 'no', 'M.Com', 'M.Com Graduate', 'Business Owner', 'Business Owner Details', '₹5 Lakhs - ₹7 Lakhs', 'Wipro', 'Tirunelveli', 'Tirunelveli', 'Hi, I am Prakash. I have completed my M.Com and am currently working as a Business Owner at Wipro in Tirunelveli. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'joint', 'middle_class', false, true, true, 100, NOW() - INTERVAL '5 days', 'Uttarabhadrapada', 'Mesham', 'Kumbam', 'Bharadwaj', 'gold', 50, 100, 'vegetarian', 'no', 'no'
    ) ON CONFLICT (id) DO UPDATE SET
      profile_id = EXCLUDED.profile_id,
      display_name = EXCLUDED.display_name,
      gender = EXCLUDED.gender,
      date_of_birth = EXCLUDED.date_of_birth,
      height_cm = EXCLUDED.height_cm,
      marital_status = EXCLUDED.marital_status,
      religion = EXCLUDED.religion,
      caste = EXCLUDED.caste,
      subcaste = EXCLUDED.subcaste,
      dosham = EXCLUDED.dosham,
      education = EXCLUDED.education,
      education_detail = EXCLUDED.education_detail,
      occupation = EXCLUDED.occupation,
      occupation_detail = EXCLUDED.occupation_detail,
      annual_income = EXCLUDED.annual_income,
      company_name = EXCLUDED.company_name,
      city = EXCLUDED.city,
      district = EXCLUDED.district,
      about_me = EXCLUDED.about_me,
      family_type = EXCLUDED.family_type,
      family_status = EXCLUDED.family_status,
      is_verified = EXCLUDED.is_verified,
      is_premium = EXCLUDED.is_premium,
      is_profile_complete = EXCLUDED.is_profile_complete,
      profile_completion_percent = EXCLUDED.profile_completion_percent,
      last_active_at = EXCLUDED.last_active_at,
      star = EXCLUDED.star,
      raasi = EXCLUDED.raasi,
      lagnam = EXCLUDED.lagnam,
      gothram = EXCLUDED.gothram,
      tier = EXCLUDED.tier,
      contacts_remaining = EXCLUDED.contacts_remaining,
      interests_remaining = EXCLUDED.interests_remaining,
      food_habit = EXCLUDED.food_habit,
      smoking = EXCLUDED.smoking,
      drinking = EXCLUDED.drinking;
INSERT INTO public.profiles (
      id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at, star, raasi, lagnam, gothram, tier, contacts_remaining, interests_remaining, food_habit, smoking, drinking
    ) VALUES (
      '00000000-0000-4000-a000-0000000000da', 'TM000218', 'Chitra Balan', 'female', '1992-07-15', 168, 'never_married', 'Hindu', 'Devendra Kula Vellalar', 'Devendra Kula Vellalar subcaste', 'yes', 'B.E. / B.Tech', 'B.E. / B.Tech Graduate', 'Bank Manager', 'Bank Manager Details', '₹15 Lakhs - ₹20 Lakhs', 'Accenture', 'Vellore', 'Vellore', 'Hi, I am Chitra. I have completed my B.E. / B.Tech and am currently working as a Bank Manager at Accenture in Vellore. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'rich', true, false, true, 100, NOW() - INTERVAL '9 days', 'Aslesha', 'Meenam', 'Magaram', 'Kasyapa', 'free', 5, 5, 'vegetarian', 'no', 'no'
    ) ON CONFLICT (id) DO UPDATE SET
      profile_id = EXCLUDED.profile_id,
      display_name = EXCLUDED.display_name,
      gender = EXCLUDED.gender,
      date_of_birth = EXCLUDED.date_of_birth,
      height_cm = EXCLUDED.height_cm,
      marital_status = EXCLUDED.marital_status,
      religion = EXCLUDED.religion,
      caste = EXCLUDED.caste,
      subcaste = EXCLUDED.subcaste,
      dosham = EXCLUDED.dosham,
      education = EXCLUDED.education,
      education_detail = EXCLUDED.education_detail,
      occupation = EXCLUDED.occupation,
      occupation_detail = EXCLUDED.occupation_detail,
      annual_income = EXCLUDED.annual_income,
      company_name = EXCLUDED.company_name,
      city = EXCLUDED.city,
      district = EXCLUDED.district,
      about_me = EXCLUDED.about_me,
      family_type = EXCLUDED.family_type,
      family_status = EXCLUDED.family_status,
      is_verified = EXCLUDED.is_verified,
      is_premium = EXCLUDED.is_premium,
      is_profile_complete = EXCLUDED.is_profile_complete,
      profile_completion_percent = EXCLUDED.profile_completion_percent,
      last_active_at = EXCLUDED.last_active_at,
      star = EXCLUDED.star,
      raasi = EXCLUDED.raasi,
      lagnam = EXCLUDED.lagnam,
      gothram = EXCLUDED.gothram,
      tier = EXCLUDED.tier,
      contacts_remaining = EXCLUDED.contacts_remaining,
      interests_remaining = EXCLUDED.interests_remaining,
      food_habit = EXCLUDED.food_habit,
      smoking = EXCLUDED.smoking,
      drinking = EXCLUDED.drinking;
INSERT INTO public.profiles (
      id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at, star, raasi, lagnam, gothram, tier, contacts_remaining, interests_remaining, food_habit, smoking, drinking
    ) VALUES (
      '00000000-0000-4000-a000-0000000000db', 'TM000219', 'Manikandan Kumar', 'male', '1993-09-20', 183, 'never_married', 'Hindu', 'Sengunthar', NULL, 'no', 'B.Com', 'B.Com Graduate', 'HR Specialist', 'HR Specialist Details', '₹10 Lakhs - ₹15 Lakhs', 'HCL', 'Salem', 'Salem', 'Hi, I am Manikandan. I have completed my B.Com and am currently working as a HR Specialist at HCL in Salem. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'middle_class', false, false, true, 100, NOW() - INTERVAL '7 days', 'Poorvashadha', 'Mithunam', 'Kadagam', 'Atri', 'free', 5, 5, 'vegetarian', 'no', 'no'
    ) ON CONFLICT (id) DO UPDATE SET
      profile_id = EXCLUDED.profile_id,
      display_name = EXCLUDED.display_name,
      gender = EXCLUDED.gender,
      date_of_birth = EXCLUDED.date_of_birth,
      height_cm = EXCLUDED.height_cm,
      marital_status = EXCLUDED.marital_status,
      religion = EXCLUDED.religion,
      caste = EXCLUDED.caste,
      subcaste = EXCLUDED.subcaste,
      dosham = EXCLUDED.dosham,
      education = EXCLUDED.education,
      education_detail = EXCLUDED.education_detail,
      occupation = EXCLUDED.occupation,
      occupation_detail = EXCLUDED.occupation_detail,
      annual_income = EXCLUDED.annual_income,
      company_name = EXCLUDED.company_name,
      city = EXCLUDED.city,
      district = EXCLUDED.district,
      about_me = EXCLUDED.about_me,
      family_type = EXCLUDED.family_type,
      family_status = EXCLUDED.family_status,
      is_verified = EXCLUDED.is_verified,
      is_premium = EXCLUDED.is_premium,
      is_profile_complete = EXCLUDED.is_profile_complete,
      profile_completion_percent = EXCLUDED.profile_completion_percent,
      last_active_at = EXCLUDED.last_active_at,
      star = EXCLUDED.star,
      raasi = EXCLUDED.raasi,
      lagnam = EXCLUDED.lagnam,
      gothram = EXCLUDED.gothram,
      tier = EXCLUDED.tier,
      contacts_remaining = EXCLUDED.contacts_remaining,
      interests_remaining = EXCLUDED.interests_remaining,
      food_habit = EXCLUDED.food_habit,
      smoking = EXCLUDED.smoking,
      drinking = EXCLUDED.drinking;
INSERT INTO public.profiles (
      id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at, star, raasi, lagnam, gothram, tier, contacts_remaining, interests_remaining, food_habit, smoking, drinking
    ) VALUES (
      '00000000-0000-4000-a000-0000000000dc', 'TM000220', 'Sowmya Gopal', 'female', '2002-10-01', 151, 'divorced', 'Hindu', 'Devendra Kula Vellalar', NULL, 'no', 'B.Ed', 'B.Ed Graduate', 'Software Engineer', 'Software Engineer Details', '₹5 Lakhs - ₹7 Lakhs', 'Zoho', 'Chennai', 'Chennai', 'Hi, I am Sowmya. I have completed my B.Ed and am currently working as a Software Engineer at Zoho in Chennai. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'upper_middle_class', true, false, true, 100, NOW() - INTERVAL '6 days', 'Pushya', 'Magaram', 'Viruchigam', 'Kasyapa', 'free', 5, 5, 'vegetarian', 'no', 'no'
    ) ON CONFLICT (id) DO UPDATE SET
      profile_id = EXCLUDED.profile_id,
      display_name = EXCLUDED.display_name,
      gender = EXCLUDED.gender,
      date_of_birth = EXCLUDED.date_of_birth,
      height_cm = EXCLUDED.height_cm,
      marital_status = EXCLUDED.marital_status,
      religion = EXCLUDED.religion,
      caste = EXCLUDED.caste,
      subcaste = EXCLUDED.subcaste,
      dosham = EXCLUDED.dosham,
      education = EXCLUDED.education,
      education_detail = EXCLUDED.education_detail,
      occupation = EXCLUDED.occupation,
      occupation_detail = EXCLUDED.occupation_detail,
      annual_income = EXCLUDED.annual_income,
      company_name = EXCLUDED.company_name,
      city = EXCLUDED.city,
      district = EXCLUDED.district,
      about_me = EXCLUDED.about_me,
      family_type = EXCLUDED.family_type,
      family_status = EXCLUDED.family_status,
      is_verified = EXCLUDED.is_verified,
      is_premium = EXCLUDED.is_premium,
      is_profile_complete = EXCLUDED.is_profile_complete,
      profile_completion_percent = EXCLUDED.profile_completion_percent,
      last_active_at = EXCLUDED.last_active_at,
      star = EXCLUDED.star,
      raasi = EXCLUDED.raasi,
      lagnam = EXCLUDED.lagnam,
      gothram = EXCLUDED.gothram,
      tier = EXCLUDED.tier,
      contacts_remaining = EXCLUDED.contacts_remaining,
      interests_remaining = EXCLUDED.interests_remaining,
      food_habit = EXCLUDED.food_habit,
      smoking = EXCLUDED.smoking,
      drinking = EXCLUDED.drinking;
INSERT INTO public.profiles (
      id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at, star, raasi, lagnam, gothram, tier, contacts_remaining, interests_remaining, food_habit, smoking, drinking
    ) VALUES (
      '00000000-0000-4000-a000-0000000000dd', 'TM000221', 'Chinnasamy Selvan', 'male', '1997-04-16', 178, 'never_married', 'Hindu', 'Kallar', NULL, 'no', 'M.Sc', 'M.Sc Graduate', 'Pharmacist', 'Pharmacist Details', '₹7 Lakhs - ₹10 Lakhs', 'HCL', 'Tiruchirappalli', 'Trichy', 'Hi, I am Chinnasamy. I have completed my M.Sc and am currently working as a Pharmacist at HCL in Tiruchirappalli. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'middle_class', true, false, true, 100, NOW() - INTERVAL '7 days', 'Uttaraphalguni', 'Viruchigam', 'Mesham', 'Kasyapa', 'free', 5, 5, 'vegetarian', 'no', 'no'
    ) ON CONFLICT (id) DO UPDATE SET
      profile_id = EXCLUDED.profile_id,
      display_name = EXCLUDED.display_name,
      gender = EXCLUDED.gender,
      date_of_birth = EXCLUDED.date_of_birth,
      height_cm = EXCLUDED.height_cm,
      marital_status = EXCLUDED.marital_status,
      religion = EXCLUDED.religion,
      caste = EXCLUDED.caste,
      subcaste = EXCLUDED.subcaste,
      dosham = EXCLUDED.dosham,
      education = EXCLUDED.education,
      education_detail = EXCLUDED.education_detail,
      occupation = EXCLUDED.occupation,
      occupation_detail = EXCLUDED.occupation_detail,
      annual_income = EXCLUDED.annual_income,
      company_name = EXCLUDED.company_name,
      city = EXCLUDED.city,
      district = EXCLUDED.district,
      about_me = EXCLUDED.about_me,
      family_type = EXCLUDED.family_type,
      family_status = EXCLUDED.family_status,
      is_verified = EXCLUDED.is_verified,
      is_premium = EXCLUDED.is_premium,
      is_profile_complete = EXCLUDED.is_profile_complete,
      profile_completion_percent = EXCLUDED.profile_completion_percent,
      last_active_at = EXCLUDED.last_active_at,
      star = EXCLUDED.star,
      raasi = EXCLUDED.raasi,
      lagnam = EXCLUDED.lagnam,
      gothram = EXCLUDED.gothram,
      tier = EXCLUDED.tier,
      contacts_remaining = EXCLUDED.contacts_remaining,
      interests_remaining = EXCLUDED.interests_remaining,
      food_habit = EXCLUDED.food_habit,
      smoking = EXCLUDED.smoking,
      drinking = EXCLUDED.drinking;
INSERT INTO public.profiles (
      id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at, star, raasi, lagnam, gothram, tier, contacts_remaining, interests_remaining, food_habit, smoking, drinking
    ) VALUES (
      '00000000-0000-4000-a000-0000000000de', 'TM000222', 'Gayathri Kumar', 'female', '2003-09-22', 155, 'divorced', 'Christian', 'Vellalar Christian', 'Vellalar Christian subcaste', 'no', 'M.B.B.S', 'M.B.B.S Graduate', 'Advocate', 'Advocate Details', '₹20 Lakhs+', 'Self Employed', 'Vellore', 'Vellore', 'Hi, I am Gayathri. I have completed my M.B.B.S and am currently working as a Advocate at Self Employed in Vellore. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'upper_middle_class', true, true, true, 100, NOW() - INTERVAL '4 days', 'Arudra', 'Rishabam', 'Kadagam', 'Siva', 'gold', 50, 100, 'vegetarian', 'no', 'no'
    ) ON CONFLICT (id) DO UPDATE SET
      profile_id = EXCLUDED.profile_id,
      display_name = EXCLUDED.display_name,
      gender = EXCLUDED.gender,
      date_of_birth = EXCLUDED.date_of_birth,
      height_cm = EXCLUDED.height_cm,
      marital_status = EXCLUDED.marital_status,
      religion = EXCLUDED.religion,
      caste = EXCLUDED.caste,
      subcaste = EXCLUDED.subcaste,
      dosham = EXCLUDED.dosham,
      education = EXCLUDED.education,
      education_detail = EXCLUDED.education_detail,
      occupation = EXCLUDED.occupation,
      occupation_detail = EXCLUDED.occupation_detail,
      annual_income = EXCLUDED.annual_income,
      company_name = EXCLUDED.company_name,
      city = EXCLUDED.city,
      district = EXCLUDED.district,
      about_me = EXCLUDED.about_me,
      family_type = EXCLUDED.family_type,
      family_status = EXCLUDED.family_status,
      is_verified = EXCLUDED.is_verified,
      is_premium = EXCLUDED.is_premium,
      is_profile_complete = EXCLUDED.is_profile_complete,
      profile_completion_percent = EXCLUDED.profile_completion_percent,
      last_active_at = EXCLUDED.last_active_at,
      star = EXCLUDED.star,
      raasi = EXCLUDED.raasi,
      lagnam = EXCLUDED.lagnam,
      gothram = EXCLUDED.gothram,
      tier = EXCLUDED.tier,
      contacts_remaining = EXCLUDED.contacts_remaining,
      interests_remaining = EXCLUDED.interests_remaining,
      food_habit = EXCLUDED.food_habit,
      smoking = EXCLUDED.smoking,
      drinking = EXCLUDED.drinking;
INSERT INTO public.profiles (
      id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at, star, raasi, lagnam, gothram, tier, contacts_remaining, interests_remaining, food_habit, smoking, drinking
    ) VALUES (
      '00000000-0000-4000-a000-0000000000df', 'TM000223', 'Deepak Kumar', 'male', '1996-12-02', 169, 'never_married', 'Hindu', 'Nadar', NULL, 'yes', 'B.Com', 'B.Com Graduate', 'Pharmacist', 'Pharmacist Details', '₹7 Lakhs - ₹10 Lakhs', 'Infosys', 'Erode', 'Erode', 'Hi, I am Deepak. I have completed my B.Com and am currently working as a Pharmacist at Infosys in Erode. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'upper_middle_class', true, false, true, 100, NOW() - INTERVAL '7 days', 'Chitra', 'Simham', 'Dhanusu', 'Siva', 'free', 5, 5, 'vegetarian', 'no', 'no'
    ) ON CONFLICT (id) DO UPDATE SET
      profile_id = EXCLUDED.profile_id,
      display_name = EXCLUDED.display_name,
      gender = EXCLUDED.gender,
      date_of_birth = EXCLUDED.date_of_birth,
      height_cm = EXCLUDED.height_cm,
      marital_status = EXCLUDED.marital_status,
      religion = EXCLUDED.religion,
      caste = EXCLUDED.caste,
      subcaste = EXCLUDED.subcaste,
      dosham = EXCLUDED.dosham,
      education = EXCLUDED.education,
      education_detail = EXCLUDED.education_detail,
      occupation = EXCLUDED.occupation,
      occupation_detail = EXCLUDED.occupation_detail,
      annual_income = EXCLUDED.annual_income,
      company_name = EXCLUDED.company_name,
      city = EXCLUDED.city,
      district = EXCLUDED.district,
      about_me = EXCLUDED.about_me,
      family_type = EXCLUDED.family_type,
      family_status = EXCLUDED.family_status,
      is_verified = EXCLUDED.is_verified,
      is_premium = EXCLUDED.is_premium,
      is_profile_complete = EXCLUDED.is_profile_complete,
      profile_completion_percent = EXCLUDED.profile_completion_percent,
      last_active_at = EXCLUDED.last_active_at,
      star = EXCLUDED.star,
      raasi = EXCLUDED.raasi,
      lagnam = EXCLUDED.lagnam,
      gothram = EXCLUDED.gothram,
      tier = EXCLUDED.tier,
      contacts_remaining = EXCLUDED.contacts_remaining,
      interests_remaining = EXCLUDED.interests_remaining,
      food_habit = EXCLUDED.food_habit,
      smoking = EXCLUDED.smoking,
      drinking = EXCLUDED.drinking;
INSERT INTO public.profiles (
      id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at, star, raasi, lagnam, gothram, tier, contacts_remaining, interests_remaining, food_habit, smoking, drinking
    ) VALUES (
      '00000000-0000-4000-a000-0000000000e0', 'TM000224', 'Abirami Mani', 'female', '1994-03-28', 157, 'never_married', 'Hindu', 'Arunthathiyar', 'Arunthathiyar subcaste', 'no', 'M.C.A', 'M.C.A Graduate', 'Mechanical Engineer', 'Mechanical Engineer Details', '₹10 Lakhs - ₹15 Lakhs', 'Zoho', 'Coimbatore', 'Coimbatore', 'Hi, I am Abirami. I have completed my M.C.A and am currently working as a Mechanical Engineer at Zoho in Coimbatore. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'rich', true, true, true, 100, NOW() - INTERVAL '1 days', 'Chitra', 'Mesham', 'Mithunam', 'Murugan', 'gold', 50, 100, 'vegetarian', 'no', 'no'
    ) ON CONFLICT (id) DO UPDATE SET
      profile_id = EXCLUDED.profile_id,
      display_name = EXCLUDED.display_name,
      gender = EXCLUDED.gender,
      date_of_birth = EXCLUDED.date_of_birth,
      height_cm = EXCLUDED.height_cm,
      marital_status = EXCLUDED.marital_status,
      religion = EXCLUDED.religion,
      caste = EXCLUDED.caste,
      subcaste = EXCLUDED.subcaste,
      dosham = EXCLUDED.dosham,
      education = EXCLUDED.education,
      education_detail = EXCLUDED.education_detail,
      occupation = EXCLUDED.occupation,
      occupation_detail = EXCLUDED.occupation_detail,
      annual_income = EXCLUDED.annual_income,
      company_name = EXCLUDED.company_name,
      city = EXCLUDED.city,
      district = EXCLUDED.district,
      about_me = EXCLUDED.about_me,
      family_type = EXCLUDED.family_type,
      family_status = EXCLUDED.family_status,
      is_verified = EXCLUDED.is_verified,
      is_premium = EXCLUDED.is_premium,
      is_profile_complete = EXCLUDED.is_profile_complete,
      profile_completion_percent = EXCLUDED.profile_completion_percent,
      last_active_at = EXCLUDED.last_active_at,
      star = EXCLUDED.star,
      raasi = EXCLUDED.raasi,
      lagnam = EXCLUDED.lagnam,
      gothram = EXCLUDED.gothram,
      tier = EXCLUDED.tier,
      contacts_remaining = EXCLUDED.contacts_remaining,
      interests_remaining = EXCLUDED.interests_remaining,
      food_habit = EXCLUDED.food_habit,
      smoking = EXCLUDED.smoking,
      drinking = EXCLUDED.drinking;
INSERT INTO public.profiles (
      id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at, star, raasi, lagnam, gothram, tier, contacts_remaining, interests_remaining, food_habit, smoking, drinking
    ) VALUES (
      '00000000-0000-4000-a000-0000000000e1', 'TM000225', 'Thirumal Lingam', 'male', '1995-07-04', 167, 'never_married', 'Hindu', 'Sengunthar', NULL, 'no', 'B.Ed', 'B.Ed Graduate', 'School Teacher', 'School Teacher Details', '₹5 Lakhs - ₹7 Lakhs', 'Infosys', 'Thoothukudi', 'Tuticorin', 'Hi, I am Thirumal. I have completed my B.Ed and am currently working as a School Teacher at Infosys in Thoothukudi. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'rich', true, false, true, 100, NOW() - INTERVAL '1 days', 'Punarvasu', 'Kadagam', 'Mithunam', 'Angirasa', 'free', 5, 5, 'vegetarian', 'no', 'no'
    ) ON CONFLICT (id) DO UPDATE SET
      profile_id = EXCLUDED.profile_id,
      display_name = EXCLUDED.display_name,
      gender = EXCLUDED.gender,
      date_of_birth = EXCLUDED.date_of_birth,
      height_cm = EXCLUDED.height_cm,
      marital_status = EXCLUDED.marital_status,
      religion = EXCLUDED.religion,
      caste = EXCLUDED.caste,
      subcaste = EXCLUDED.subcaste,
      dosham = EXCLUDED.dosham,
      education = EXCLUDED.education,
      education_detail = EXCLUDED.education_detail,
      occupation = EXCLUDED.occupation,
      occupation_detail = EXCLUDED.occupation_detail,
      annual_income = EXCLUDED.annual_income,
      company_name = EXCLUDED.company_name,
      city = EXCLUDED.city,
      district = EXCLUDED.district,
      about_me = EXCLUDED.about_me,
      family_type = EXCLUDED.family_type,
      family_status = EXCLUDED.family_status,
      is_verified = EXCLUDED.is_verified,
      is_premium = EXCLUDED.is_premium,
      is_profile_complete = EXCLUDED.is_profile_complete,
      profile_completion_percent = EXCLUDED.profile_completion_percent,
      last_active_at = EXCLUDED.last_active_at,
      star = EXCLUDED.star,
      raasi = EXCLUDED.raasi,
      lagnam = EXCLUDED.lagnam,
      gothram = EXCLUDED.gothram,
      tier = EXCLUDED.tier,
      contacts_remaining = EXCLUDED.contacts_remaining,
      interests_remaining = EXCLUDED.interests_remaining,
      food_habit = EXCLUDED.food_habit,
      smoking = EXCLUDED.smoking,
      drinking = EXCLUDED.drinking;
INSERT INTO public.profiles (
      id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at, star, raasi, lagnam, gothram, tier, contacts_remaining, interests_remaining, food_habit, smoking, drinking
    ) VALUES (
      '00000000-0000-4000-a000-0000000000e2', 'TM000226', 'Pavithra Swamy', 'female', '1999-07-21', 159, 'never_married', 'Hindu', 'Naidu', 'Naidu subcaste', 'no', 'Ph.D', 'Ph.D Graduate', 'Architect', 'Architect Details', '₹20 Lakhs+', 'Self Employed', 'Tirunelveli', 'Tirunelveli', 'Hi, I am Pavithra. I have completed my Ph.D and am currently working as a Architect at Self Employed in Tirunelveli. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'rich', false, false, true, 100, NOW() - INTERVAL '0 days', 'Poorvabhadrapada', 'Dhanusu', 'Simham', 'Atri', 'free', 5, 5, 'vegetarian', 'no', 'no'
    ) ON CONFLICT (id) DO UPDATE SET
      profile_id = EXCLUDED.profile_id,
      display_name = EXCLUDED.display_name,
      gender = EXCLUDED.gender,
      date_of_birth = EXCLUDED.date_of_birth,
      height_cm = EXCLUDED.height_cm,
      marital_status = EXCLUDED.marital_status,
      religion = EXCLUDED.religion,
      caste = EXCLUDED.caste,
      subcaste = EXCLUDED.subcaste,
      dosham = EXCLUDED.dosham,
      education = EXCLUDED.education,
      education_detail = EXCLUDED.education_detail,
      occupation = EXCLUDED.occupation,
      occupation_detail = EXCLUDED.occupation_detail,
      annual_income = EXCLUDED.annual_income,
      company_name = EXCLUDED.company_name,
      city = EXCLUDED.city,
      district = EXCLUDED.district,
      about_me = EXCLUDED.about_me,
      family_type = EXCLUDED.family_type,
      family_status = EXCLUDED.family_status,
      is_verified = EXCLUDED.is_verified,
      is_premium = EXCLUDED.is_premium,
      is_profile_complete = EXCLUDED.is_profile_complete,
      profile_completion_percent = EXCLUDED.profile_completion_percent,
      last_active_at = EXCLUDED.last_active_at,
      star = EXCLUDED.star,
      raasi = EXCLUDED.raasi,
      lagnam = EXCLUDED.lagnam,
      gothram = EXCLUDED.gothram,
      tier = EXCLUDED.tier,
      contacts_remaining = EXCLUDED.contacts_remaining,
      interests_remaining = EXCLUDED.interests_remaining,
      food_habit = EXCLUDED.food_habit,
      smoking = EXCLUDED.smoking,
      drinking = EXCLUDED.drinking;
INSERT INTO public.profiles (
      id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at, star, raasi, lagnam, gothram, tier, contacts_remaining, interests_remaining, food_habit, smoking, drinking
    ) VALUES (
      '00000000-0000-4000-a000-0000000000e3', 'TM000227', 'Madhavan Krishnan', 'male', '1994-06-18', 178, 'never_married', 'Hindu', 'Adi Dravida', NULL, 'no', 'M.B.A', 'M.B.A Graduate', 'Auditor', 'Auditor Details', '₹7 Lakhs - ₹10 Lakhs', 'HCL', 'Erode', 'Erode', 'Hi, I am Madhavan. I have completed my M.B.A and am currently working as a Auditor at HCL in Erode. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'upper_middle_class', true, true, true, 100, NOW() - INTERVAL '8 days', 'Jyeshta', 'Kadagam', 'Mesham', 'Agastya', 'gold', 50, 100, 'vegetarian', 'no', 'no'
    ) ON CONFLICT (id) DO UPDATE SET
      profile_id = EXCLUDED.profile_id,
      display_name = EXCLUDED.display_name,
      gender = EXCLUDED.gender,
      date_of_birth = EXCLUDED.date_of_birth,
      height_cm = EXCLUDED.height_cm,
      marital_status = EXCLUDED.marital_status,
      religion = EXCLUDED.religion,
      caste = EXCLUDED.caste,
      subcaste = EXCLUDED.subcaste,
      dosham = EXCLUDED.dosham,
      education = EXCLUDED.education,
      education_detail = EXCLUDED.education_detail,
      occupation = EXCLUDED.occupation,
      occupation_detail = EXCLUDED.occupation_detail,
      annual_income = EXCLUDED.annual_income,
      company_name = EXCLUDED.company_name,
      city = EXCLUDED.city,
      district = EXCLUDED.district,
      about_me = EXCLUDED.about_me,
      family_type = EXCLUDED.family_type,
      family_status = EXCLUDED.family_status,
      is_verified = EXCLUDED.is_verified,
      is_premium = EXCLUDED.is_premium,
      is_profile_complete = EXCLUDED.is_profile_complete,
      profile_completion_percent = EXCLUDED.profile_completion_percent,
      last_active_at = EXCLUDED.last_active_at,
      star = EXCLUDED.star,
      raasi = EXCLUDED.raasi,
      lagnam = EXCLUDED.lagnam,
      gothram = EXCLUDED.gothram,
      tier = EXCLUDED.tier,
      contacts_remaining = EXCLUDED.contacts_remaining,
      interests_remaining = EXCLUDED.interests_remaining,
      food_habit = EXCLUDED.food_habit,
      smoking = EXCLUDED.smoking,
      drinking = EXCLUDED.drinking;
INSERT INTO public.profiles (
      id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at, star, raasi, lagnam, gothram, tier, contacts_remaining, interests_remaining, food_habit, smoking, drinking
    ) VALUES (
      '00000000-0000-4000-a000-0000000000e4', 'TM000228', 'Uma Murthy', 'female', '1999-05-07', 161, 'never_married', 'Hindu', 'Sengunthar', 'Sengunthar subcaste', 'no', 'M.B.A', 'M.B.A Graduate', 'Mechanical Engineer', 'Mechanical Engineer Details', '₹5 Lakhs - ₹7 Lakhs', 'Accenture', 'Chennai', 'Chennai', 'Hi, I am Uma. I have completed my M.B.A and am currently working as a Mechanical Engineer at Accenture in Chennai. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'middle_class', true, true, true, 100, NOW() - INTERVAL '5 days', 'Uttarabhadrapada', 'Thulaam', 'Thulaam', 'Murugan', 'gold', 50, 100, 'vegetarian', 'no', 'no'
    ) ON CONFLICT (id) DO UPDATE SET
      profile_id = EXCLUDED.profile_id,
      display_name = EXCLUDED.display_name,
      gender = EXCLUDED.gender,
      date_of_birth = EXCLUDED.date_of_birth,
      height_cm = EXCLUDED.height_cm,
      marital_status = EXCLUDED.marital_status,
      religion = EXCLUDED.religion,
      caste = EXCLUDED.caste,
      subcaste = EXCLUDED.subcaste,
      dosham = EXCLUDED.dosham,
      education = EXCLUDED.education,
      education_detail = EXCLUDED.education_detail,
      occupation = EXCLUDED.occupation,
      occupation_detail = EXCLUDED.occupation_detail,
      annual_income = EXCLUDED.annual_income,
      company_name = EXCLUDED.company_name,
      city = EXCLUDED.city,
      district = EXCLUDED.district,
      about_me = EXCLUDED.about_me,
      family_type = EXCLUDED.family_type,
      family_status = EXCLUDED.family_status,
      is_verified = EXCLUDED.is_verified,
      is_premium = EXCLUDED.is_premium,
      is_profile_complete = EXCLUDED.is_profile_complete,
      profile_completion_percent = EXCLUDED.profile_completion_percent,
      last_active_at = EXCLUDED.last_active_at,
      star = EXCLUDED.star,
      raasi = EXCLUDED.raasi,
      lagnam = EXCLUDED.lagnam,
      gothram = EXCLUDED.gothram,
      tier = EXCLUDED.tier,
      contacts_remaining = EXCLUDED.contacts_remaining,
      interests_remaining = EXCLUDED.interests_remaining,
      food_habit = EXCLUDED.food_habit,
      smoking = EXCLUDED.smoking,
      drinking = EXCLUDED.drinking;
INSERT INTO public.profiles (
      id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at, star, raasi, lagnam, gothram, tier, contacts_remaining, interests_remaining, food_habit, smoking, drinking
    ) VALUES (
      '00000000-0000-4000-a000-0000000000e5', 'TM000229', 'Ganesan Naicker', 'male', '2002-05-20', 170, 'divorced', 'Hindu', 'Gounder', NULL, 'no', 'B.Ed', 'B.Ed Graduate', 'Business Owner', 'Business Owner Details', '₹3 Lakhs - ₹5 Lakhs', 'Zoho', 'Vellore', 'Vellore', 'Hi, I am Ganesan. I have completed my B.Ed and am currently working as a Business Owner at Zoho in Vellore. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'joint', 'upper_middle_class', true, false, true, 100, NOW() - INTERVAL '7 days', 'Magha', 'Magaram', 'Simham', 'Siva', 'free', 5, 5, 'vegetarian', 'no', 'no'
    ) ON CONFLICT (id) DO UPDATE SET
      profile_id = EXCLUDED.profile_id,
      display_name = EXCLUDED.display_name,
      gender = EXCLUDED.gender,
      date_of_birth = EXCLUDED.date_of_birth,
      height_cm = EXCLUDED.height_cm,
      marital_status = EXCLUDED.marital_status,
      religion = EXCLUDED.religion,
      caste = EXCLUDED.caste,
      subcaste = EXCLUDED.subcaste,
      dosham = EXCLUDED.dosham,
      education = EXCLUDED.education,
      education_detail = EXCLUDED.education_detail,
      occupation = EXCLUDED.occupation,
      occupation_detail = EXCLUDED.occupation_detail,
      annual_income = EXCLUDED.annual_income,
      company_name = EXCLUDED.company_name,
      city = EXCLUDED.city,
      district = EXCLUDED.district,
      about_me = EXCLUDED.about_me,
      family_type = EXCLUDED.family_type,
      family_status = EXCLUDED.family_status,
      is_verified = EXCLUDED.is_verified,
      is_premium = EXCLUDED.is_premium,
      is_profile_complete = EXCLUDED.is_profile_complete,
      profile_completion_percent = EXCLUDED.profile_completion_percent,
      last_active_at = EXCLUDED.last_active_at,
      star = EXCLUDED.star,
      raasi = EXCLUDED.raasi,
      lagnam = EXCLUDED.lagnam,
      gothram = EXCLUDED.gothram,
      tier = EXCLUDED.tier,
      contacts_remaining = EXCLUDED.contacts_remaining,
      interests_remaining = EXCLUDED.interests_remaining,
      food_habit = EXCLUDED.food_habit,
      smoking = EXCLUDED.smoking,
      drinking = EXCLUDED.drinking;
INSERT INTO public.profiles (
      id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at, star, raasi, lagnam, gothram, tier, contacts_remaining, interests_remaining, food_habit, smoking, drinking
    ) VALUES (
      '00000000-0000-4000-a000-0000000000e6', 'TM000230', 'Ponmani Kumar', 'female', '2001-08-22', 167, 'never_married', 'Hindu', 'Brahmin - Iyengar', NULL, 'no', 'M.C.A', 'M.C.A Graduate', 'Doctor', 'Doctor Details', '₹5 Lakhs - ₹7 Lakhs', 'Wipro', 'Thanjavur', 'Thanjavur', 'Hi, I am Ponmani. I have completed my M.C.A and am currently working as a Doctor at Wipro in Thanjavur. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'rich', false, false, true, 100, NOW() - INTERVAL '4 days', 'Uttarabhadrapada', 'Magaram', 'Mesham', 'Atri', 'free', 5, 5, 'vegetarian', 'no', 'no'
    ) ON CONFLICT (id) DO UPDATE SET
      profile_id = EXCLUDED.profile_id,
      display_name = EXCLUDED.display_name,
      gender = EXCLUDED.gender,
      date_of_birth = EXCLUDED.date_of_birth,
      height_cm = EXCLUDED.height_cm,
      marital_status = EXCLUDED.marital_status,
      religion = EXCLUDED.religion,
      caste = EXCLUDED.caste,
      subcaste = EXCLUDED.subcaste,
      dosham = EXCLUDED.dosham,
      education = EXCLUDED.education,
      education_detail = EXCLUDED.education_detail,
      occupation = EXCLUDED.occupation,
      occupation_detail = EXCLUDED.occupation_detail,
      annual_income = EXCLUDED.annual_income,
      company_name = EXCLUDED.company_name,
      city = EXCLUDED.city,
      district = EXCLUDED.district,
      about_me = EXCLUDED.about_me,
      family_type = EXCLUDED.family_type,
      family_status = EXCLUDED.family_status,
      is_verified = EXCLUDED.is_verified,
      is_premium = EXCLUDED.is_premium,
      is_profile_complete = EXCLUDED.is_profile_complete,
      profile_completion_percent = EXCLUDED.profile_completion_percent,
      last_active_at = EXCLUDED.last_active_at,
      star = EXCLUDED.star,
      raasi = EXCLUDED.raasi,
      lagnam = EXCLUDED.lagnam,
      gothram = EXCLUDED.gothram,
      tier = EXCLUDED.tier,
      contacts_remaining = EXCLUDED.contacts_remaining,
      interests_remaining = EXCLUDED.interests_remaining,
      food_habit = EXCLUDED.food_habit,
      smoking = EXCLUDED.smoking,
      drinking = EXCLUDED.drinking;
INSERT INTO public.profiles (
      id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at, star, raasi, lagnam, gothram, tier, contacts_remaining, interests_remaining, food_habit, smoking, drinking
    ) VALUES (
      '00000000-0000-4000-a000-0000000000e7', 'TM000231', 'Prabhu Selvan', 'male', '2002-10-18', 165, 'never_married', 'Hindu', 'Brahmin - Iyengar', 'Brahmin - Iyengar subcaste', 'no', 'B.Ed', 'B.Ed Graduate', 'Architect', 'Architect Details', '₹3 Lakhs - ₹5 Lakhs', 'Infosys', 'Salem', 'Salem', 'Hi, I am Prabhu. I have completed my B.Ed and am currently working as a Architect at Infosys in Salem. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'rich', true, false, true, 100, NOW() - INTERVAL '1 days', 'Swati', 'Kanni', 'Simham', 'Viswamitra', 'free', 5, 5, 'vegetarian', 'no', 'no'
    ) ON CONFLICT (id) DO UPDATE SET
      profile_id = EXCLUDED.profile_id,
      display_name = EXCLUDED.display_name,
      gender = EXCLUDED.gender,
      date_of_birth = EXCLUDED.date_of_birth,
      height_cm = EXCLUDED.height_cm,
      marital_status = EXCLUDED.marital_status,
      religion = EXCLUDED.religion,
      caste = EXCLUDED.caste,
      subcaste = EXCLUDED.subcaste,
      dosham = EXCLUDED.dosham,
      education = EXCLUDED.education,
      education_detail = EXCLUDED.education_detail,
      occupation = EXCLUDED.occupation,
      occupation_detail = EXCLUDED.occupation_detail,
      annual_income = EXCLUDED.annual_income,
      company_name = EXCLUDED.company_name,
      city = EXCLUDED.city,
      district = EXCLUDED.district,
      about_me = EXCLUDED.about_me,
      family_type = EXCLUDED.family_type,
      family_status = EXCLUDED.family_status,
      is_verified = EXCLUDED.is_verified,
      is_premium = EXCLUDED.is_premium,
      is_profile_complete = EXCLUDED.is_profile_complete,
      profile_completion_percent = EXCLUDED.profile_completion_percent,
      last_active_at = EXCLUDED.last_active_at,
      star = EXCLUDED.star,
      raasi = EXCLUDED.raasi,
      lagnam = EXCLUDED.lagnam,
      gothram = EXCLUDED.gothram,
      tier = EXCLUDED.tier,
      contacts_remaining = EXCLUDED.contacts_remaining,
      interests_remaining = EXCLUDED.interests_remaining,
      food_habit = EXCLUDED.food_habit,
      smoking = EXCLUDED.smoking,
      drinking = EXCLUDED.drinking;
INSERT INTO public.profiles (
      id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at, star, raasi, lagnam, gothram, tier, contacts_remaining, interests_remaining, food_habit, smoking, drinking
    ) VALUES (
      '00000000-0000-4000-a000-0000000000e8', 'TM000232', 'Rekha Samy', 'female', '1999-07-14', 156, 'never_married', 'Hindu', 'Mudaliar', 'Mudaliar subcaste', 'no', 'M.Com', 'M.Com Graduate', 'Police Officer', 'Police Officer Details', '₹10 Lakhs - ₹15 Lakhs', 'Cognizant', 'Thanjavur', 'Thanjavur', 'Hi, I am Rekha. I have completed my M.Com and am currently working as a Police Officer at Cognizant in Thanjavur. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'middle_class', true, false, true, 100, NOW() - INTERVAL '9 days', 'Swati', 'Viruchigam', 'Magaram', 'Vashishta', 'free', 5, 5, 'vegetarian', 'no', 'no'
    ) ON CONFLICT (id) DO UPDATE SET
      profile_id = EXCLUDED.profile_id,
      display_name = EXCLUDED.display_name,
      gender = EXCLUDED.gender,
      date_of_birth = EXCLUDED.date_of_birth,
      height_cm = EXCLUDED.height_cm,
      marital_status = EXCLUDED.marital_status,
      religion = EXCLUDED.religion,
      caste = EXCLUDED.caste,
      subcaste = EXCLUDED.subcaste,
      dosham = EXCLUDED.dosham,
      education = EXCLUDED.education,
      education_detail = EXCLUDED.education_detail,
      occupation = EXCLUDED.occupation,
      occupation_detail = EXCLUDED.occupation_detail,
      annual_income = EXCLUDED.annual_income,
      company_name = EXCLUDED.company_name,
      city = EXCLUDED.city,
      district = EXCLUDED.district,
      about_me = EXCLUDED.about_me,
      family_type = EXCLUDED.family_type,
      family_status = EXCLUDED.family_status,
      is_verified = EXCLUDED.is_verified,
      is_premium = EXCLUDED.is_premium,
      is_profile_complete = EXCLUDED.is_profile_complete,
      profile_completion_percent = EXCLUDED.profile_completion_percent,
      last_active_at = EXCLUDED.last_active_at,
      star = EXCLUDED.star,
      raasi = EXCLUDED.raasi,
      lagnam = EXCLUDED.lagnam,
      gothram = EXCLUDED.gothram,
      tier = EXCLUDED.tier,
      contacts_remaining = EXCLUDED.contacts_remaining,
      interests_remaining = EXCLUDED.interests_remaining,
      food_habit = EXCLUDED.food_habit,
      smoking = EXCLUDED.smoking,
      drinking = EXCLUDED.drinking;
INSERT INTO public.profiles (
      id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at, star, raasi, lagnam, gothram, tier, contacts_remaining, interests_remaining, food_habit, smoking, drinking
    ) VALUES (
      '00000000-0000-4000-a000-0000000000e9', 'TM000233', 'Senthil Devan', 'male', '1992-02-13', 163, 'divorced', 'Hindu', 'Naicker', 'Naicker subcaste', 'no', 'B.A', 'B.A Graduate', 'Civil Engineer', 'Civil Engineer Details', '₹10 Lakhs - ₹15 Lakhs', 'TCS', 'Vellore', 'Vellore', 'Hi, I am Senthil. I have completed my B.A and am currently working as a Civil Engineer at TCS in Vellore. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'joint', 'middle_class', true, false, true, 100, NOW() - INTERVAL '9 days', 'Swati', 'Magaram', 'Dhanusu', 'Vishnu', 'free', 5, 5, 'vegetarian', 'no', 'no'
    ) ON CONFLICT (id) DO UPDATE SET
      profile_id = EXCLUDED.profile_id,
      display_name = EXCLUDED.display_name,
      gender = EXCLUDED.gender,
      date_of_birth = EXCLUDED.date_of_birth,
      height_cm = EXCLUDED.height_cm,
      marital_status = EXCLUDED.marital_status,
      religion = EXCLUDED.religion,
      caste = EXCLUDED.caste,
      subcaste = EXCLUDED.subcaste,
      dosham = EXCLUDED.dosham,
      education = EXCLUDED.education,
      education_detail = EXCLUDED.education_detail,
      occupation = EXCLUDED.occupation,
      occupation_detail = EXCLUDED.occupation_detail,
      annual_income = EXCLUDED.annual_income,
      company_name = EXCLUDED.company_name,
      city = EXCLUDED.city,
      district = EXCLUDED.district,
      about_me = EXCLUDED.about_me,
      family_type = EXCLUDED.family_type,
      family_status = EXCLUDED.family_status,
      is_verified = EXCLUDED.is_verified,
      is_premium = EXCLUDED.is_premium,
      is_profile_complete = EXCLUDED.is_profile_complete,
      profile_completion_percent = EXCLUDED.profile_completion_percent,
      last_active_at = EXCLUDED.last_active_at,
      star = EXCLUDED.star,
      raasi = EXCLUDED.raasi,
      lagnam = EXCLUDED.lagnam,
      gothram = EXCLUDED.gothram,
      tier = EXCLUDED.tier,
      contacts_remaining = EXCLUDED.contacts_remaining,
      interests_remaining = EXCLUDED.interests_remaining,
      food_habit = EXCLUDED.food_habit,
      smoking = EXCLUDED.smoking,
      drinking = EXCLUDED.drinking;
INSERT INTO public.profiles (
      id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at, star, raasi, lagnam, gothram, tier, contacts_remaining, interests_remaining, food_habit, smoking, drinking
    ) VALUES (
      '00000000-0000-4000-a000-0000000000ea', 'TM000234', 'Anitha Raman', 'female', '2002-04-24', 150, 'never_married', 'Hindu', 'Yadav', NULL, 'no', 'M.C.A', 'M.C.A Graduate', 'HR Specialist', 'HR Specialist Details', '₹15 Lakhs - ₹20 Lakhs', 'Private Practice', 'Kanchipuram', 'Kanchipuram', 'Hi, I am Anitha. I have completed my M.C.A and am currently working as a HR Specialist at Private Practice in Kanchipuram. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'rich', true, false, true, 100, NOW() - INTERVAL '10 days', 'Poorvabhadrapada', 'Magaram', 'Dhanusu', 'Agastya', 'free', 5, 5, 'vegetarian', 'no', 'no'
    ) ON CONFLICT (id) DO UPDATE SET
      profile_id = EXCLUDED.profile_id,
      display_name = EXCLUDED.display_name,
      gender = EXCLUDED.gender,
      date_of_birth = EXCLUDED.date_of_birth,
      height_cm = EXCLUDED.height_cm,
      marital_status = EXCLUDED.marital_status,
      religion = EXCLUDED.religion,
      caste = EXCLUDED.caste,
      subcaste = EXCLUDED.subcaste,
      dosham = EXCLUDED.dosham,
      education = EXCLUDED.education,
      education_detail = EXCLUDED.education_detail,
      occupation = EXCLUDED.occupation,
      occupation_detail = EXCLUDED.occupation_detail,
      annual_income = EXCLUDED.annual_income,
      company_name = EXCLUDED.company_name,
      city = EXCLUDED.city,
      district = EXCLUDED.district,
      about_me = EXCLUDED.about_me,
      family_type = EXCLUDED.family_type,
      family_status = EXCLUDED.family_status,
      is_verified = EXCLUDED.is_verified,
      is_premium = EXCLUDED.is_premium,
      is_profile_complete = EXCLUDED.is_profile_complete,
      profile_completion_percent = EXCLUDED.profile_completion_percent,
      last_active_at = EXCLUDED.last_active_at,
      star = EXCLUDED.star,
      raasi = EXCLUDED.raasi,
      lagnam = EXCLUDED.lagnam,
      gothram = EXCLUDED.gothram,
      tier = EXCLUDED.tier,
      contacts_remaining = EXCLUDED.contacts_remaining,
      interests_remaining = EXCLUDED.interests_remaining,
      food_habit = EXCLUDED.food_habit,
      smoking = EXCLUDED.smoking,
      drinking = EXCLUDED.drinking;
INSERT INTO public.profiles (
      id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at, star, raasi, lagnam, gothram, tier, contacts_remaining, interests_remaining, food_habit, smoking, drinking
    ) VALUES (
      '00000000-0000-4000-a000-0000000000eb', 'TM000235', 'Arun Selvan', 'male', '1994-07-05', 186, 'never_married', 'Hindu', 'Maravar', 'Maravar subcaste', 'yes', 'M.B.B.S', 'M.B.B.S Graduate', 'Advocate', 'Advocate Details', '₹5 Lakhs - ₹7 Lakhs', 'HCL', 'Thoothukudi', 'Tuticorin', 'Hi, I am Arun. I have completed my M.B.B.S and am currently working as a Advocate at HCL in Thoothukudi. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'upper_middle_class', true, false, true, 100, NOW() - INTERVAL '2 days', 'Poorvabhadrapada', 'Viruchigam', 'Viruchigam', 'Agastya', 'free', 5, 5, 'vegetarian', 'no', 'no'
    ) ON CONFLICT (id) DO UPDATE SET
      profile_id = EXCLUDED.profile_id,
      display_name = EXCLUDED.display_name,
      gender = EXCLUDED.gender,
      date_of_birth = EXCLUDED.date_of_birth,
      height_cm = EXCLUDED.height_cm,
      marital_status = EXCLUDED.marital_status,
      religion = EXCLUDED.religion,
      caste = EXCLUDED.caste,
      subcaste = EXCLUDED.subcaste,
      dosham = EXCLUDED.dosham,
      education = EXCLUDED.education,
      education_detail = EXCLUDED.education_detail,
      occupation = EXCLUDED.occupation,
      occupation_detail = EXCLUDED.occupation_detail,
      annual_income = EXCLUDED.annual_income,
      company_name = EXCLUDED.company_name,
      city = EXCLUDED.city,
      district = EXCLUDED.district,
      about_me = EXCLUDED.about_me,
      family_type = EXCLUDED.family_type,
      family_status = EXCLUDED.family_status,
      is_verified = EXCLUDED.is_verified,
      is_premium = EXCLUDED.is_premium,
      is_profile_complete = EXCLUDED.is_profile_complete,
      profile_completion_percent = EXCLUDED.profile_completion_percent,
      last_active_at = EXCLUDED.last_active_at,
      star = EXCLUDED.star,
      raasi = EXCLUDED.raasi,
      lagnam = EXCLUDED.lagnam,
      gothram = EXCLUDED.gothram,
      tier = EXCLUDED.tier,
      contacts_remaining = EXCLUDED.contacts_remaining,
      interests_remaining = EXCLUDED.interests_remaining,
      food_habit = EXCLUDED.food_habit,
      smoking = EXCLUDED.smoking,
      drinking = EXCLUDED.drinking;
INSERT INTO public.profiles (
      id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at, star, raasi, lagnam, gothram, tier, contacts_remaining, interests_remaining, food_habit, smoking, drinking
    ) VALUES (
      '00000000-0000-4000-a000-0000000000ec', 'TM000236', 'Archana Shankar', 'female', '1998-11-03', 164, 'divorced', 'Muslim', 'Labbai', 'Labbai subcaste', 'no', 'M.Com', 'M.Com Graduate', 'College Professor', 'College Professor Details', '₹20 Lakhs+', 'Accenture', 'Tiruppur', 'Tiruppur', 'Hi, I am Archana. I have completed my M.Com and am currently working as a College Professor at Accenture in Tiruppur. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'joint', 'upper_middle_class', true, false, true, 100, NOW() - INTERVAL '10 days', 'Poorvashadha', 'Kumbam', 'Magaram', 'Gautama', 'free', 5, 5, 'vegetarian', 'no', 'no'
    ) ON CONFLICT (id) DO UPDATE SET
      profile_id = EXCLUDED.profile_id,
      display_name = EXCLUDED.display_name,
      gender = EXCLUDED.gender,
      date_of_birth = EXCLUDED.date_of_birth,
      height_cm = EXCLUDED.height_cm,
      marital_status = EXCLUDED.marital_status,
      religion = EXCLUDED.religion,
      caste = EXCLUDED.caste,
      subcaste = EXCLUDED.subcaste,
      dosham = EXCLUDED.dosham,
      education = EXCLUDED.education,
      education_detail = EXCLUDED.education_detail,
      occupation = EXCLUDED.occupation,
      occupation_detail = EXCLUDED.occupation_detail,
      annual_income = EXCLUDED.annual_income,
      company_name = EXCLUDED.company_name,
      city = EXCLUDED.city,
      district = EXCLUDED.district,
      about_me = EXCLUDED.about_me,
      family_type = EXCLUDED.family_type,
      family_status = EXCLUDED.family_status,
      is_verified = EXCLUDED.is_verified,
      is_premium = EXCLUDED.is_premium,
      is_profile_complete = EXCLUDED.is_profile_complete,
      profile_completion_percent = EXCLUDED.profile_completion_percent,
      last_active_at = EXCLUDED.last_active_at,
      star = EXCLUDED.star,
      raasi = EXCLUDED.raasi,
      lagnam = EXCLUDED.lagnam,
      gothram = EXCLUDED.gothram,
      tier = EXCLUDED.tier,
      contacts_remaining = EXCLUDED.contacts_remaining,
      interests_remaining = EXCLUDED.interests_remaining,
      food_habit = EXCLUDED.food_habit,
      smoking = EXCLUDED.smoking,
      drinking = EXCLUDED.drinking;
INSERT INTO public.profiles (
      id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at, star, raasi, lagnam, gothram, tier, contacts_remaining, interests_remaining, food_habit, smoking, drinking
    ) VALUES (
      '00000000-0000-4000-a000-0000000000ed', 'TM000237', 'Elango Murthy', 'male', '2004-07-25', 178, 'never_married', 'Hindu', 'Mudaliar', NULL, 'no', 'M.A', 'M.A Graduate', 'Architect', 'Architect Details', '₹3 Lakhs - ₹5 Lakhs', 'HCL', 'Salem', 'Salem', 'Hi, I am Elango. I have completed my M.A and am currently working as a Architect at HCL in Salem. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'middle_class', false, false, true, 100, NOW() - INTERVAL '4 days', 'Uttarachadha', 'Thulaam', 'Kadagam', 'Vashishta', 'free', 5, 5, 'vegetarian', 'no', 'no'
    ) ON CONFLICT (id) DO UPDATE SET
      profile_id = EXCLUDED.profile_id,
      display_name = EXCLUDED.display_name,
      gender = EXCLUDED.gender,
      date_of_birth = EXCLUDED.date_of_birth,
      height_cm = EXCLUDED.height_cm,
      marital_status = EXCLUDED.marital_status,
      religion = EXCLUDED.religion,
      caste = EXCLUDED.caste,
      subcaste = EXCLUDED.subcaste,
      dosham = EXCLUDED.dosham,
      education = EXCLUDED.education,
      education_detail = EXCLUDED.education_detail,
      occupation = EXCLUDED.occupation,
      occupation_detail = EXCLUDED.occupation_detail,
      annual_income = EXCLUDED.annual_income,
      company_name = EXCLUDED.company_name,
      city = EXCLUDED.city,
      district = EXCLUDED.district,
      about_me = EXCLUDED.about_me,
      family_type = EXCLUDED.family_type,
      family_status = EXCLUDED.family_status,
      is_verified = EXCLUDED.is_verified,
      is_premium = EXCLUDED.is_premium,
      is_profile_complete = EXCLUDED.is_profile_complete,
      profile_completion_percent = EXCLUDED.profile_completion_percent,
      last_active_at = EXCLUDED.last_active_at,
      star = EXCLUDED.star,
      raasi = EXCLUDED.raasi,
      lagnam = EXCLUDED.lagnam,
      gothram = EXCLUDED.gothram,
      tier = EXCLUDED.tier,
      contacts_remaining = EXCLUDED.contacts_remaining,
      interests_remaining = EXCLUDED.interests_remaining,
      food_habit = EXCLUDED.food_habit,
      smoking = EXCLUDED.smoking,
      drinking = EXCLUDED.drinking;
INSERT INTO public.profiles (
      id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at, star, raasi, lagnam, gothram, tier, contacts_remaining, interests_remaining, food_habit, smoking, drinking
    ) VALUES (
      '00000000-0000-4000-a000-0000000000ee', 'TM000238', 'Yazhini Lingam', 'female', '1989-02-06', 165, 'never_married', 'Hindu', 'Maravar', NULL, 'no', 'M.Com', 'M.Com Graduate', 'Software Engineer', 'Software Engineer Details', '₹10 Lakhs - ₹15 Lakhs', 'Infosys', 'Thoothukudi', 'Tuticorin', 'Hi, I am Yazhini. I have completed my M.Com and am currently working as a Software Engineer at Infosys in Thoothukudi. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'middle_class', true, false, true, 100, NOW() - INTERVAL '6 days', 'Mirgashira', 'Thulaam', 'Dhanusu', 'Bharadwaj', 'free', 5, 5, 'vegetarian', 'no', 'no'
    ) ON CONFLICT (id) DO UPDATE SET
      profile_id = EXCLUDED.profile_id,
      display_name = EXCLUDED.display_name,
      gender = EXCLUDED.gender,
      date_of_birth = EXCLUDED.date_of_birth,
      height_cm = EXCLUDED.height_cm,
      marital_status = EXCLUDED.marital_status,
      religion = EXCLUDED.religion,
      caste = EXCLUDED.caste,
      subcaste = EXCLUDED.subcaste,
      dosham = EXCLUDED.dosham,
      education = EXCLUDED.education,
      education_detail = EXCLUDED.education_detail,
      occupation = EXCLUDED.occupation,
      occupation_detail = EXCLUDED.occupation_detail,
      annual_income = EXCLUDED.annual_income,
      company_name = EXCLUDED.company_name,
      city = EXCLUDED.city,
      district = EXCLUDED.district,
      about_me = EXCLUDED.about_me,
      family_type = EXCLUDED.family_type,
      family_status = EXCLUDED.family_status,
      is_verified = EXCLUDED.is_verified,
      is_premium = EXCLUDED.is_premium,
      is_profile_complete = EXCLUDED.is_profile_complete,
      profile_completion_percent = EXCLUDED.profile_completion_percent,
      last_active_at = EXCLUDED.last_active_at,
      star = EXCLUDED.star,
      raasi = EXCLUDED.raasi,
      lagnam = EXCLUDED.lagnam,
      gothram = EXCLUDED.gothram,
      tier = EXCLUDED.tier,
      contacts_remaining = EXCLUDED.contacts_remaining,
      interests_remaining = EXCLUDED.interests_remaining,
      food_habit = EXCLUDED.food_habit,
      smoking = EXCLUDED.smoking,
      drinking = EXCLUDED.drinking;
INSERT INTO public.profiles (
      id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at, star, raasi, lagnam, gothram, tier, contacts_remaining, interests_remaining, food_habit, smoking, drinking
    ) VALUES (
      '00000000-0000-4000-a000-0000000000ef', 'TM000239', 'Thirumal Pandian', 'male', '1996-07-16', 170, 'never_married', 'Hindu', 'Brahmin - Iyengar', 'Brahmin - Iyengar subcaste', 'no', 'M.Sc', 'M.Sc Graduate', 'College Professor', 'College Professor Details', '₹7 Lakhs - ₹10 Lakhs', 'Government Service', 'Tiruchirappalli', 'Trichy', 'Hi, I am Thirumal. I have completed my M.Sc and am currently working as a College Professor at Government Service in Tiruchirappalli. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'rich', true, true, true, 100, NOW() - INTERVAL '8 days', 'Uttaraphalguni', 'Mithunam', 'Kanni', 'Viswamitra', 'gold', 50, 100, 'vegetarian', 'no', 'no'
    ) ON CONFLICT (id) DO UPDATE SET
      profile_id = EXCLUDED.profile_id,
      display_name = EXCLUDED.display_name,
      gender = EXCLUDED.gender,
      date_of_birth = EXCLUDED.date_of_birth,
      height_cm = EXCLUDED.height_cm,
      marital_status = EXCLUDED.marital_status,
      religion = EXCLUDED.religion,
      caste = EXCLUDED.caste,
      subcaste = EXCLUDED.subcaste,
      dosham = EXCLUDED.dosham,
      education = EXCLUDED.education,
      education_detail = EXCLUDED.education_detail,
      occupation = EXCLUDED.occupation,
      occupation_detail = EXCLUDED.occupation_detail,
      annual_income = EXCLUDED.annual_income,
      company_name = EXCLUDED.company_name,
      city = EXCLUDED.city,
      district = EXCLUDED.district,
      about_me = EXCLUDED.about_me,
      family_type = EXCLUDED.family_type,
      family_status = EXCLUDED.family_status,
      is_verified = EXCLUDED.is_verified,
      is_premium = EXCLUDED.is_premium,
      is_profile_complete = EXCLUDED.is_profile_complete,
      profile_completion_percent = EXCLUDED.profile_completion_percent,
      last_active_at = EXCLUDED.last_active_at,
      star = EXCLUDED.star,
      raasi = EXCLUDED.raasi,
      lagnam = EXCLUDED.lagnam,
      gothram = EXCLUDED.gothram,
      tier = EXCLUDED.tier,
      contacts_remaining = EXCLUDED.contacts_remaining,
      interests_remaining = EXCLUDED.interests_remaining,
      food_habit = EXCLUDED.food_habit,
      smoking = EXCLUDED.smoking,
      drinking = EXCLUDED.drinking;
INSERT INTO public.profiles (
      id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at, star, raasi, lagnam, gothram, tier, contacts_remaining, interests_remaining, food_habit, smoking, drinking
    ) VALUES (
      '00000000-0000-4000-a000-0000000000f0', 'TM000240', 'Kavitha Balan', 'female', '2000-08-01', 171, 'never_married', 'Hindu', 'Vellalar', NULL, 'no', 'M.Sc', 'M.Sc Graduate', 'Business Owner', 'Business Owner Details', '₹15 Lakhs - ₹20 Lakhs', 'TCS', 'Vellore', 'Vellore', 'Hi, I am Kavitha. I have completed my M.Sc and am currently working as a Business Owner at TCS in Vellore. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'joint', 'upper_middle_class', true, false, true, 100, NOW() - INTERVAL '0 days', 'Bharani', 'Mithunam', 'Kumbam', 'Kasyapa', 'free', 5, 5, 'vegetarian', 'no', 'no'
    ) ON CONFLICT (id) DO UPDATE SET
      profile_id = EXCLUDED.profile_id,
      display_name = EXCLUDED.display_name,
      gender = EXCLUDED.gender,
      date_of_birth = EXCLUDED.date_of_birth,
      height_cm = EXCLUDED.height_cm,
      marital_status = EXCLUDED.marital_status,
      religion = EXCLUDED.religion,
      caste = EXCLUDED.caste,
      subcaste = EXCLUDED.subcaste,
      dosham = EXCLUDED.dosham,
      education = EXCLUDED.education,
      education_detail = EXCLUDED.education_detail,
      occupation = EXCLUDED.occupation,
      occupation_detail = EXCLUDED.occupation_detail,
      annual_income = EXCLUDED.annual_income,
      company_name = EXCLUDED.company_name,
      city = EXCLUDED.city,
      district = EXCLUDED.district,
      about_me = EXCLUDED.about_me,
      family_type = EXCLUDED.family_type,
      family_status = EXCLUDED.family_status,
      is_verified = EXCLUDED.is_verified,
      is_premium = EXCLUDED.is_premium,
      is_profile_complete = EXCLUDED.is_profile_complete,
      profile_completion_percent = EXCLUDED.profile_completion_percent,
      last_active_at = EXCLUDED.last_active_at,
      star = EXCLUDED.star,
      raasi = EXCLUDED.raasi,
      lagnam = EXCLUDED.lagnam,
      gothram = EXCLUDED.gothram,
      tier = EXCLUDED.tier,
      contacts_remaining = EXCLUDED.contacts_remaining,
      interests_remaining = EXCLUDED.interests_remaining,
      food_habit = EXCLUDED.food_habit,
      smoking = EXCLUDED.smoking,
      drinking = EXCLUDED.drinking;
INSERT INTO public.profiles (
      id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at, star, raasi, lagnam, gothram, tier, contacts_remaining, interests_remaining, food_habit, smoking, drinking
    ) VALUES (
      '00000000-0000-4000-a000-0000000000f1', 'TM000241', 'Madhavan Sundaram', 'male', '1997-10-26', 164, 'never_married', 'Muslim', 'Sunni Muslim', NULL, 'no', 'B.Com', 'B.Com Graduate', 'College Professor', 'College Professor Details', '₹20 Lakhs+', 'Cognizant', 'Thoothukudi', 'Tuticorin', 'Hi, I am Madhavan. I have completed my B.Com and am currently working as a College Professor at Cognizant in Thoothukudi. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'joint', 'middle_class', false, false, true, 100, NOW() - INTERVAL '9 days', 'Shravana', 'Simham', 'Thulaam', 'Vishnu', 'free', 5, 5, 'vegetarian', 'no', 'no'
    ) ON CONFLICT (id) DO UPDATE SET
      profile_id = EXCLUDED.profile_id,
      display_name = EXCLUDED.display_name,
      gender = EXCLUDED.gender,
      date_of_birth = EXCLUDED.date_of_birth,
      height_cm = EXCLUDED.height_cm,
      marital_status = EXCLUDED.marital_status,
      religion = EXCLUDED.religion,
      caste = EXCLUDED.caste,
      subcaste = EXCLUDED.subcaste,
      dosham = EXCLUDED.dosham,
      education = EXCLUDED.education,
      education_detail = EXCLUDED.education_detail,
      occupation = EXCLUDED.occupation,
      occupation_detail = EXCLUDED.occupation_detail,
      annual_income = EXCLUDED.annual_income,
      company_name = EXCLUDED.company_name,
      city = EXCLUDED.city,
      district = EXCLUDED.district,
      about_me = EXCLUDED.about_me,
      family_type = EXCLUDED.family_type,
      family_status = EXCLUDED.family_status,
      is_verified = EXCLUDED.is_verified,
      is_premium = EXCLUDED.is_premium,
      is_profile_complete = EXCLUDED.is_profile_complete,
      profile_completion_percent = EXCLUDED.profile_completion_percent,
      last_active_at = EXCLUDED.last_active_at,
      star = EXCLUDED.star,
      raasi = EXCLUDED.raasi,
      lagnam = EXCLUDED.lagnam,
      gothram = EXCLUDED.gothram,
      tier = EXCLUDED.tier,
      contacts_remaining = EXCLUDED.contacts_remaining,
      interests_remaining = EXCLUDED.interests_remaining,
      food_habit = EXCLUDED.food_habit,
      smoking = EXCLUDED.smoking,
      drinking = EXCLUDED.drinking;
INSERT INTO public.profiles (
      id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at, star, raasi, lagnam, gothram, tier, contacts_remaining, interests_remaining, food_habit, smoking, drinking
    ) VALUES (
      '00000000-0000-4000-a000-0000000000f2', 'TM000242', 'Sowmya Gopal', 'female', '1990-03-24', 150, 'never_married', 'Hindu', 'Devendra Kula Vellalar', NULL, 'no', 'M.C.A', 'M.C.A Graduate', 'HR Specialist', 'HR Specialist Details', '₹20 Lakhs+', 'Government Service', 'Thanjavur', 'Thanjavur', 'Hi, I am Sowmya. I have completed my M.C.A and am currently working as a HR Specialist at Government Service in Thanjavur. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'upper_middle_class', true, false, true, 100, NOW() - INTERVAL '0 days', 'Mirgashira', 'Kumbam', 'Viruchigam', 'Angirasa', 'free', 5, 5, 'vegetarian', 'no', 'no'
    ) ON CONFLICT (id) DO UPDATE SET
      profile_id = EXCLUDED.profile_id,
      display_name = EXCLUDED.display_name,
      gender = EXCLUDED.gender,
      date_of_birth = EXCLUDED.date_of_birth,
      height_cm = EXCLUDED.height_cm,
      marital_status = EXCLUDED.marital_status,
      religion = EXCLUDED.religion,
      caste = EXCLUDED.caste,
      subcaste = EXCLUDED.subcaste,
      dosham = EXCLUDED.dosham,
      education = EXCLUDED.education,
      education_detail = EXCLUDED.education_detail,
      occupation = EXCLUDED.occupation,
      occupation_detail = EXCLUDED.occupation_detail,
      annual_income = EXCLUDED.annual_income,
      company_name = EXCLUDED.company_name,
      city = EXCLUDED.city,
      district = EXCLUDED.district,
      about_me = EXCLUDED.about_me,
      family_type = EXCLUDED.family_type,
      family_status = EXCLUDED.family_status,
      is_verified = EXCLUDED.is_verified,
      is_premium = EXCLUDED.is_premium,
      is_profile_complete = EXCLUDED.is_profile_complete,
      profile_completion_percent = EXCLUDED.profile_completion_percent,
      last_active_at = EXCLUDED.last_active_at,
      star = EXCLUDED.star,
      raasi = EXCLUDED.raasi,
      lagnam = EXCLUDED.lagnam,
      gothram = EXCLUDED.gothram,
      tier = EXCLUDED.tier,
      contacts_remaining = EXCLUDED.contacts_remaining,
      interests_remaining = EXCLUDED.interests_remaining,
      food_habit = EXCLUDED.food_habit,
      smoking = EXCLUDED.smoking,
      drinking = EXCLUDED.drinking;
INSERT INTO public.profiles (
      id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at, star, raasi, lagnam, gothram, tier, contacts_remaining, interests_remaining, food_habit, smoking, drinking
    ) VALUES (
      '00000000-0000-4000-a000-0000000000f3', 'TM000243', 'Ranjith Shankar', 'male', '1999-02-22', 163, 'never_married', 'Hindu', 'Chettiar', NULL, 'no', 'M.A', 'M.A Graduate', 'HR Specialist', 'HR Specialist Details', '₹3 Lakhs - ₹5 Lakhs', 'HCL', 'Tiruppur', 'Tiruppur', 'Hi, I am Ranjith. I have completed my M.A and am currently working as a HR Specialist at HCL in Tiruppur. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'joint', 'middle_class', true, false, true, 100, NOW() - INTERVAL '3 days', 'Moola', 'Rishabam', 'Mesham', 'Bharadwaj', 'free', 5, 5, 'vegetarian', 'no', 'no'
    ) ON CONFLICT (id) DO UPDATE SET
      profile_id = EXCLUDED.profile_id,
      display_name = EXCLUDED.display_name,
      gender = EXCLUDED.gender,
      date_of_birth = EXCLUDED.date_of_birth,
      height_cm = EXCLUDED.height_cm,
      marital_status = EXCLUDED.marital_status,
      religion = EXCLUDED.religion,
      caste = EXCLUDED.caste,
      subcaste = EXCLUDED.subcaste,
      dosham = EXCLUDED.dosham,
      education = EXCLUDED.education,
      education_detail = EXCLUDED.education_detail,
      occupation = EXCLUDED.occupation,
      occupation_detail = EXCLUDED.occupation_detail,
      annual_income = EXCLUDED.annual_income,
      company_name = EXCLUDED.company_name,
      city = EXCLUDED.city,
      district = EXCLUDED.district,
      about_me = EXCLUDED.about_me,
      family_type = EXCLUDED.family_type,
      family_status = EXCLUDED.family_status,
      is_verified = EXCLUDED.is_verified,
      is_premium = EXCLUDED.is_premium,
      is_profile_complete = EXCLUDED.is_profile_complete,
      profile_completion_percent = EXCLUDED.profile_completion_percent,
      last_active_at = EXCLUDED.last_active_at,
      star = EXCLUDED.star,
      raasi = EXCLUDED.raasi,
      lagnam = EXCLUDED.lagnam,
      gothram = EXCLUDED.gothram,
      tier = EXCLUDED.tier,
      contacts_remaining = EXCLUDED.contacts_remaining,
      interests_remaining = EXCLUDED.interests_remaining,
      food_habit = EXCLUDED.food_habit,
      smoking = EXCLUDED.smoking,
      drinking = EXCLUDED.drinking;
INSERT INTO public.profiles (
      id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at, star, raasi, lagnam, gothram, tier, contacts_remaining, interests_remaining, food_habit, smoking, drinking
    ) VALUES (
      '00000000-0000-4000-a000-0000000000f4', 'TM000244', 'Vidya Selvan', 'female', '1989-02-26', 168, 'never_married', 'Hindu', 'Kallar', 'Kallar subcaste', 'no', 'M.B.A', 'M.B.A Graduate', 'College Professor', 'College Professor Details', '₹5 Lakhs - ₹7 Lakhs', 'Self Employed', 'Tirunelveli', 'Tirunelveli', 'Hi, I am Vidya. I have completed my M.B.A and am currently working as a College Professor at Self Employed in Tirunelveli. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'upper_middle_class', true, false, true, 100, NOW() - INTERVAL '5 days', 'Swati', 'Mithunam', 'Meenam', 'Vashishta', 'free', 5, 5, 'vegetarian', 'no', 'no'
    ) ON CONFLICT (id) DO UPDATE SET
      profile_id = EXCLUDED.profile_id,
      display_name = EXCLUDED.display_name,
      gender = EXCLUDED.gender,
      date_of_birth = EXCLUDED.date_of_birth,
      height_cm = EXCLUDED.height_cm,
      marital_status = EXCLUDED.marital_status,
      religion = EXCLUDED.religion,
      caste = EXCLUDED.caste,
      subcaste = EXCLUDED.subcaste,
      dosham = EXCLUDED.dosham,
      education = EXCLUDED.education,
      education_detail = EXCLUDED.education_detail,
      occupation = EXCLUDED.occupation,
      occupation_detail = EXCLUDED.occupation_detail,
      annual_income = EXCLUDED.annual_income,
      company_name = EXCLUDED.company_name,
      city = EXCLUDED.city,
      district = EXCLUDED.district,
      about_me = EXCLUDED.about_me,
      family_type = EXCLUDED.family_type,
      family_status = EXCLUDED.family_status,
      is_verified = EXCLUDED.is_verified,
      is_premium = EXCLUDED.is_premium,
      is_profile_complete = EXCLUDED.is_profile_complete,
      profile_completion_percent = EXCLUDED.profile_completion_percent,
      last_active_at = EXCLUDED.last_active_at,
      star = EXCLUDED.star,
      raasi = EXCLUDED.raasi,
      lagnam = EXCLUDED.lagnam,
      gothram = EXCLUDED.gothram,
      tier = EXCLUDED.tier,
      contacts_remaining = EXCLUDED.contacts_remaining,
      interests_remaining = EXCLUDED.interests_remaining,
      food_habit = EXCLUDED.food_habit,
      smoking = EXCLUDED.smoking,
      drinking = EXCLUDED.drinking;
INSERT INTO public.profiles (
      id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at, star, raasi, lagnam, gothram, tier, contacts_remaining, interests_remaining, food_habit, smoking, drinking
    ) VALUES (
      '00000000-0000-4000-a000-0000000000f5', 'TM000245', 'Rajesh Selvan', 'male', '2001-07-14', 173, 'never_married', 'Hindu', 'Kallar', 'Kallar subcaste', 'no', 'B.E. / B.Tech', 'B.E. / B.Tech Graduate', 'Mechanical Engineer', 'Mechanical Engineer Details', '₹20 Lakhs+', 'Self Employed', 'Kanchipuram', 'Kanchipuram', 'Hi, I am Rajesh. I have completed my B.E. / B.Tech and am currently working as a Mechanical Engineer at Self Employed in Kanchipuram. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'upper_middle_class', true, false, true, 100, NOW() - INTERVAL '0 days', 'Ashwini', 'Dhanusu', 'Dhanusu', 'Murugan', 'free', 5, 5, 'vegetarian', 'no', 'no'
    ) ON CONFLICT (id) DO UPDATE SET
      profile_id = EXCLUDED.profile_id,
      display_name = EXCLUDED.display_name,
      gender = EXCLUDED.gender,
      date_of_birth = EXCLUDED.date_of_birth,
      height_cm = EXCLUDED.height_cm,
      marital_status = EXCLUDED.marital_status,
      religion = EXCLUDED.religion,
      caste = EXCLUDED.caste,
      subcaste = EXCLUDED.subcaste,
      dosham = EXCLUDED.dosham,
      education = EXCLUDED.education,
      education_detail = EXCLUDED.education_detail,
      occupation = EXCLUDED.occupation,
      occupation_detail = EXCLUDED.occupation_detail,
      annual_income = EXCLUDED.annual_income,
      company_name = EXCLUDED.company_name,
      city = EXCLUDED.city,
      district = EXCLUDED.district,
      about_me = EXCLUDED.about_me,
      family_type = EXCLUDED.family_type,
      family_status = EXCLUDED.family_status,
      is_verified = EXCLUDED.is_verified,
      is_premium = EXCLUDED.is_premium,
      is_profile_complete = EXCLUDED.is_profile_complete,
      profile_completion_percent = EXCLUDED.profile_completion_percent,
      last_active_at = EXCLUDED.last_active_at,
      star = EXCLUDED.star,
      raasi = EXCLUDED.raasi,
      lagnam = EXCLUDED.lagnam,
      gothram = EXCLUDED.gothram,
      tier = EXCLUDED.tier,
      contacts_remaining = EXCLUDED.contacts_remaining,
      interests_remaining = EXCLUDED.interests_remaining,
      food_habit = EXCLUDED.food_habit,
      smoking = EXCLUDED.smoking,
      drinking = EXCLUDED.drinking;
INSERT INTO public.profiles (
      id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at, star, raasi, lagnam, gothram, tier, contacts_remaining, interests_remaining, food_habit, smoking, drinking
    ) VALUES (
      '00000000-0000-4000-a000-0000000000f6', 'TM000246', 'Vijaya Raman', 'female', '1995-09-03', 171, 'never_married', 'Hindu', 'Brahmin - Iyengar', NULL, 'no', 'B.Sc', 'B.Sc Graduate', 'Dentist', 'Dentist Details', '₹3 Lakhs - ₹5 Lakhs', 'Private Practice', 'Erode', 'Erode', 'Hi, I am Vijaya. I have completed my B.Sc and am currently working as a Dentist at Private Practice in Erode. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'middle_class', true, true, true, 100, NOW() - INTERVAL '0 days', 'Ashwini', 'Rishabam', 'Rishabam', 'Bharadwaj', 'gold', 50, 100, 'vegetarian', 'no', 'no'
    ) ON CONFLICT (id) DO UPDATE SET
      profile_id = EXCLUDED.profile_id,
      display_name = EXCLUDED.display_name,
      gender = EXCLUDED.gender,
      date_of_birth = EXCLUDED.date_of_birth,
      height_cm = EXCLUDED.height_cm,
      marital_status = EXCLUDED.marital_status,
      religion = EXCLUDED.religion,
      caste = EXCLUDED.caste,
      subcaste = EXCLUDED.subcaste,
      dosham = EXCLUDED.dosham,
      education = EXCLUDED.education,
      education_detail = EXCLUDED.education_detail,
      occupation = EXCLUDED.occupation,
      occupation_detail = EXCLUDED.occupation_detail,
      annual_income = EXCLUDED.annual_income,
      company_name = EXCLUDED.company_name,
      city = EXCLUDED.city,
      district = EXCLUDED.district,
      about_me = EXCLUDED.about_me,
      family_type = EXCLUDED.family_type,
      family_status = EXCLUDED.family_status,
      is_verified = EXCLUDED.is_verified,
      is_premium = EXCLUDED.is_premium,
      is_profile_complete = EXCLUDED.is_profile_complete,
      profile_completion_percent = EXCLUDED.profile_completion_percent,
      last_active_at = EXCLUDED.last_active_at,
      star = EXCLUDED.star,
      raasi = EXCLUDED.raasi,
      lagnam = EXCLUDED.lagnam,
      gothram = EXCLUDED.gothram,
      tier = EXCLUDED.tier,
      contacts_remaining = EXCLUDED.contacts_remaining,
      interests_remaining = EXCLUDED.interests_remaining,
      food_habit = EXCLUDED.food_habit,
      smoking = EXCLUDED.smoking,
      drinking = EXCLUDED.drinking;
INSERT INTO public.profiles (
      id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at, star, raasi, lagnam, gothram, tier, contacts_remaining, interests_remaining, food_habit, smoking, drinking
    ) VALUES (
      '00000000-0000-4000-a000-0000000000f7', 'TM000247', 'Rajesh Kumar', 'male', '1991-05-12', 166, 'never_married', 'Hindu', 'Naidu', 'Naidu subcaste', 'no', 'B.E. / B.Tech', 'B.E. / B.Tech Graduate', 'Mechanical Engineer', 'Mechanical Engineer Details', '₹3 Lakhs - ₹5 Lakhs', 'Self Employed', 'Thanjavur', 'Thanjavur', 'Hi, I am Rajesh. I have completed my B.E. / B.Tech and am currently working as a Mechanical Engineer at Self Employed in Thanjavur. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'rich', false, false, true, 100, NOW() - INTERVAL '5 days', 'Jyeshta', 'Thulaam', 'Kanni', 'Agastya', 'free', 5, 5, 'vegetarian', 'no', 'no'
    ) ON CONFLICT (id) DO UPDATE SET
      profile_id = EXCLUDED.profile_id,
      display_name = EXCLUDED.display_name,
      gender = EXCLUDED.gender,
      date_of_birth = EXCLUDED.date_of_birth,
      height_cm = EXCLUDED.height_cm,
      marital_status = EXCLUDED.marital_status,
      religion = EXCLUDED.religion,
      caste = EXCLUDED.caste,
      subcaste = EXCLUDED.subcaste,
      dosham = EXCLUDED.dosham,
      education = EXCLUDED.education,
      education_detail = EXCLUDED.education_detail,
      occupation = EXCLUDED.occupation,
      occupation_detail = EXCLUDED.occupation_detail,
      annual_income = EXCLUDED.annual_income,
      company_name = EXCLUDED.company_name,
      city = EXCLUDED.city,
      district = EXCLUDED.district,
      about_me = EXCLUDED.about_me,
      family_type = EXCLUDED.family_type,
      family_status = EXCLUDED.family_status,
      is_verified = EXCLUDED.is_verified,
      is_premium = EXCLUDED.is_premium,
      is_profile_complete = EXCLUDED.is_profile_complete,
      profile_completion_percent = EXCLUDED.profile_completion_percent,
      last_active_at = EXCLUDED.last_active_at,
      star = EXCLUDED.star,
      raasi = EXCLUDED.raasi,
      lagnam = EXCLUDED.lagnam,
      gothram = EXCLUDED.gothram,
      tier = EXCLUDED.tier,
      contacts_remaining = EXCLUDED.contacts_remaining,
      interests_remaining = EXCLUDED.interests_remaining,
      food_habit = EXCLUDED.food_habit,
      smoking = EXCLUDED.smoking,
      drinking = EXCLUDED.drinking;
INSERT INTO public.profiles (
      id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at, star, raasi, lagnam, gothram, tier, contacts_remaining, interests_remaining, food_habit, smoking, drinking
    ) VALUES (
      '00000000-0000-4000-a000-0000000000f8', 'TM000248', 'Malarvizhi Pandian', 'female', '2000-06-12', 166, 'never_married', 'Hindu', 'Maravar', NULL, 'yes', 'B.E. / B.Tech', 'B.E. / B.Tech Graduate', 'Dentist', 'Dentist Details', '₹7 Lakhs - ₹10 Lakhs', 'Cognizant', 'Salem', 'Salem', 'Hi, I am Malarvizhi. I have completed my B.E. / B.Tech and am currently working as a Dentist at Cognizant in Salem. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'upper_middle_class', true, false, true, 100, NOW() - INTERVAL '7 days', 'Mirgashira', 'Meenam', 'Meenam', 'Gautama', 'free', 5, 5, 'vegetarian', 'no', 'no'
    ) ON CONFLICT (id) DO UPDATE SET
      profile_id = EXCLUDED.profile_id,
      display_name = EXCLUDED.display_name,
      gender = EXCLUDED.gender,
      date_of_birth = EXCLUDED.date_of_birth,
      height_cm = EXCLUDED.height_cm,
      marital_status = EXCLUDED.marital_status,
      religion = EXCLUDED.religion,
      caste = EXCLUDED.caste,
      subcaste = EXCLUDED.subcaste,
      dosham = EXCLUDED.dosham,
      education = EXCLUDED.education,
      education_detail = EXCLUDED.education_detail,
      occupation = EXCLUDED.occupation,
      occupation_detail = EXCLUDED.occupation_detail,
      annual_income = EXCLUDED.annual_income,
      company_name = EXCLUDED.company_name,
      city = EXCLUDED.city,
      district = EXCLUDED.district,
      about_me = EXCLUDED.about_me,
      family_type = EXCLUDED.family_type,
      family_status = EXCLUDED.family_status,
      is_verified = EXCLUDED.is_verified,
      is_premium = EXCLUDED.is_premium,
      is_profile_complete = EXCLUDED.is_profile_complete,
      profile_completion_percent = EXCLUDED.profile_completion_percent,
      last_active_at = EXCLUDED.last_active_at,
      star = EXCLUDED.star,
      raasi = EXCLUDED.raasi,
      lagnam = EXCLUDED.lagnam,
      gothram = EXCLUDED.gothram,
      tier = EXCLUDED.tier,
      contacts_remaining = EXCLUDED.contacts_remaining,
      interests_remaining = EXCLUDED.interests_remaining,
      food_habit = EXCLUDED.food_habit,
      smoking = EXCLUDED.smoking,
      drinking = EXCLUDED.drinking;
INSERT INTO public.profiles (
      id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at, star, raasi, lagnam, gothram, tier, contacts_remaining, interests_remaining, food_habit, smoking, drinking
    ) VALUES (
      '00000000-0000-4000-a000-0000000000f9', 'TM000249', 'Madhavan Krishnan', 'male', '1999-02-09', 179, 'never_married', 'Hindu', 'Naidu', NULL, 'no', 'B.Sc', 'B.Sc Graduate', 'Doctor', 'Doctor Details', '₹15 Lakhs - ₹20 Lakhs', 'Self Employed', 'Kanchipuram', 'Kanchipuram', 'Hi, I am Madhavan. I have completed my B.Sc and am currently working as a Doctor at Self Employed in Kanchipuram. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'middle_class', true, false, true, 100, NOW() - INTERVAL '9 days', 'Bharani', 'Kadagam', 'Dhanusu', 'Harita', 'free', 5, 5, 'vegetarian', 'no', 'no'
    ) ON CONFLICT (id) DO UPDATE SET
      profile_id = EXCLUDED.profile_id,
      display_name = EXCLUDED.display_name,
      gender = EXCLUDED.gender,
      date_of_birth = EXCLUDED.date_of_birth,
      height_cm = EXCLUDED.height_cm,
      marital_status = EXCLUDED.marital_status,
      religion = EXCLUDED.religion,
      caste = EXCLUDED.caste,
      subcaste = EXCLUDED.subcaste,
      dosham = EXCLUDED.dosham,
      education = EXCLUDED.education,
      education_detail = EXCLUDED.education_detail,
      occupation = EXCLUDED.occupation,
      occupation_detail = EXCLUDED.occupation_detail,
      annual_income = EXCLUDED.annual_income,
      company_name = EXCLUDED.company_name,
      city = EXCLUDED.city,
      district = EXCLUDED.district,
      about_me = EXCLUDED.about_me,
      family_type = EXCLUDED.family_type,
      family_status = EXCLUDED.family_status,
      is_verified = EXCLUDED.is_verified,
      is_premium = EXCLUDED.is_premium,
      is_profile_complete = EXCLUDED.is_profile_complete,
      profile_completion_percent = EXCLUDED.profile_completion_percent,
      last_active_at = EXCLUDED.last_active_at,
      star = EXCLUDED.star,
      raasi = EXCLUDED.raasi,
      lagnam = EXCLUDED.lagnam,
      gothram = EXCLUDED.gothram,
      tier = EXCLUDED.tier,
      contacts_remaining = EXCLUDED.contacts_remaining,
      interests_remaining = EXCLUDED.interests_remaining,
      food_habit = EXCLUDED.food_habit,
      smoking = EXCLUDED.smoking,
      drinking = EXCLUDED.drinking;
INSERT INTO public.profiles (
      id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at, star, raasi, lagnam, gothram, tier, contacts_remaining, interests_remaining, food_habit, smoking, drinking
    ) VALUES (
      '00000000-0000-4000-a000-0000000000fa', 'TM000250', 'Deepa Raman', 'female', '2000-05-02', 169, 'never_married', 'Hindu', 'Naicker', 'Naicker subcaste', 'no', 'B.Com', 'B.Com Graduate', 'Police Officer', 'Police Officer Details', '₹10 Lakhs - ₹15 Lakhs', 'Self Employed', 'Thoothukudi', 'Tuticorin', 'Hi, I am Deepa. I have completed my B.Com and am currently working as a Police Officer at Self Employed in Thoothukudi. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'rich', true, false, true, 100, NOW() - INTERVAL '1 days', 'Arudra', 'Rishabam', 'Kanni', 'Atri', 'free', 5, 5, 'vegetarian', 'no', 'no'
    ) ON CONFLICT (id) DO UPDATE SET
      profile_id = EXCLUDED.profile_id,
      display_name = EXCLUDED.display_name,
      gender = EXCLUDED.gender,
      date_of_birth = EXCLUDED.date_of_birth,
      height_cm = EXCLUDED.height_cm,
      marital_status = EXCLUDED.marital_status,
      religion = EXCLUDED.religion,
      caste = EXCLUDED.caste,
      subcaste = EXCLUDED.subcaste,
      dosham = EXCLUDED.dosham,
      education = EXCLUDED.education,
      education_detail = EXCLUDED.education_detail,
      occupation = EXCLUDED.occupation,
      occupation_detail = EXCLUDED.occupation_detail,
      annual_income = EXCLUDED.annual_income,
      company_name = EXCLUDED.company_name,
      city = EXCLUDED.city,
      district = EXCLUDED.district,
      about_me = EXCLUDED.about_me,
      family_type = EXCLUDED.family_type,
      family_status = EXCLUDED.family_status,
      is_verified = EXCLUDED.is_verified,
      is_premium = EXCLUDED.is_premium,
      is_profile_complete = EXCLUDED.is_profile_complete,
      profile_completion_percent = EXCLUDED.profile_completion_percent,
      last_active_at = EXCLUDED.last_active_at,
      star = EXCLUDED.star,
      raasi = EXCLUDED.raasi,
      lagnam = EXCLUDED.lagnam,
      gothram = EXCLUDED.gothram,
      tier = EXCLUDED.tier,
      contacts_remaining = EXCLUDED.contacts_remaining,
      interests_remaining = EXCLUDED.interests_remaining,
      food_habit = EXCLUDED.food_habit,
      smoking = EXCLUDED.smoking,
      drinking = EXCLUDED.drinking;
INSERT INTO public.profiles (
      id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at, star, raasi, lagnam, gothram, tier, contacts_remaining, interests_remaining, food_habit, smoking, drinking
    ) VALUES (
      '00000000-0000-4000-a000-0000000000fb', 'TM000251', 'Karthik Velan', 'male', '1994-04-08', 168, 'never_married', 'Hindu', 'Mudaliar', NULL, 'yes', 'B.Com', 'B.Com Graduate', 'College Professor', 'College Professor Details', '₹20 Lakhs+', 'Private Practice', 'Tiruchirappalli', 'Trichy', 'Hi, I am Karthik. I have completed my B.Com and am currently working as a College Professor at Private Practice in Tiruchirappalli. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'rich', false, false, true, 100, NOW() - INTERVAL '6 days', 'Krittika', 'Kumbam', 'Kadagam', 'Kasyapa', 'free', 5, 5, 'vegetarian', 'no', 'no'
    ) ON CONFLICT (id) DO UPDATE SET
      profile_id = EXCLUDED.profile_id,
      display_name = EXCLUDED.display_name,
      gender = EXCLUDED.gender,
      date_of_birth = EXCLUDED.date_of_birth,
      height_cm = EXCLUDED.height_cm,
      marital_status = EXCLUDED.marital_status,
      religion = EXCLUDED.religion,
      caste = EXCLUDED.caste,
      subcaste = EXCLUDED.subcaste,
      dosham = EXCLUDED.dosham,
      education = EXCLUDED.education,
      education_detail = EXCLUDED.education_detail,
      occupation = EXCLUDED.occupation,
      occupation_detail = EXCLUDED.occupation_detail,
      annual_income = EXCLUDED.annual_income,
      company_name = EXCLUDED.company_name,
      city = EXCLUDED.city,
      district = EXCLUDED.district,
      about_me = EXCLUDED.about_me,
      family_type = EXCLUDED.family_type,
      family_status = EXCLUDED.family_status,
      is_verified = EXCLUDED.is_verified,
      is_premium = EXCLUDED.is_premium,
      is_profile_complete = EXCLUDED.is_profile_complete,
      profile_completion_percent = EXCLUDED.profile_completion_percent,
      last_active_at = EXCLUDED.last_active_at,
      star = EXCLUDED.star,
      raasi = EXCLUDED.raasi,
      lagnam = EXCLUDED.lagnam,
      gothram = EXCLUDED.gothram,
      tier = EXCLUDED.tier,
      contacts_remaining = EXCLUDED.contacts_remaining,
      interests_remaining = EXCLUDED.interests_remaining,
      food_habit = EXCLUDED.food_habit,
      smoking = EXCLUDED.smoking,
      drinking = EXCLUDED.drinking;
INSERT INTO public.profiles (
      id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at, star, raasi, lagnam, gothram, tier, contacts_remaining, interests_remaining, food_habit, smoking, drinking
    ) VALUES (
      '00000000-0000-4000-a000-0000000000fc', 'TM000252', 'Shalini Devan', 'female', '1990-03-03', 171, 'never_married', 'Hindu', 'Adi Dravida', 'Adi Dravida subcaste', 'no', 'B.Com', 'B.Com Graduate', 'Software Engineer', 'Software Engineer Details', '₹5 Lakhs - ₹7 Lakhs', 'Self Employed', 'Tiruchirappalli', 'Trichy', 'Hi, I am Shalini. I have completed my B.Com and am currently working as a Software Engineer at Self Employed in Tiruchirappalli. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'rich', true, false, true, 100, NOW() - INTERVAL '7 days', 'Shatabhisha', 'Simham', 'Rishabam', 'Viswamitra', 'free', 5, 5, 'vegetarian', 'no', 'no'
    ) ON CONFLICT (id) DO UPDATE SET
      profile_id = EXCLUDED.profile_id,
      display_name = EXCLUDED.display_name,
      gender = EXCLUDED.gender,
      date_of_birth = EXCLUDED.date_of_birth,
      height_cm = EXCLUDED.height_cm,
      marital_status = EXCLUDED.marital_status,
      religion = EXCLUDED.religion,
      caste = EXCLUDED.caste,
      subcaste = EXCLUDED.subcaste,
      dosham = EXCLUDED.dosham,
      education = EXCLUDED.education,
      education_detail = EXCLUDED.education_detail,
      occupation = EXCLUDED.occupation,
      occupation_detail = EXCLUDED.occupation_detail,
      annual_income = EXCLUDED.annual_income,
      company_name = EXCLUDED.company_name,
      city = EXCLUDED.city,
      district = EXCLUDED.district,
      about_me = EXCLUDED.about_me,
      family_type = EXCLUDED.family_type,
      family_status = EXCLUDED.family_status,
      is_verified = EXCLUDED.is_verified,
      is_premium = EXCLUDED.is_premium,
      is_profile_complete = EXCLUDED.is_profile_complete,
      profile_completion_percent = EXCLUDED.profile_completion_percent,
      last_active_at = EXCLUDED.last_active_at,
      star = EXCLUDED.star,
      raasi = EXCLUDED.raasi,
      lagnam = EXCLUDED.lagnam,
      gothram = EXCLUDED.gothram,
      tier = EXCLUDED.tier,
      contacts_remaining = EXCLUDED.contacts_remaining,
      interests_remaining = EXCLUDED.interests_remaining,
      food_habit = EXCLUDED.food_habit,
      smoking = EXCLUDED.smoking,
      drinking = EXCLUDED.drinking;
INSERT INTO public.profiles (
      id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at, star, raasi, lagnam, gothram, tier, contacts_remaining, interests_remaining, food_habit, smoking, drinking
    ) VALUES (
      '00000000-0000-4000-a000-0000000000fd', 'TM000253', 'Vignesh Moorthy', 'male', '2001-01-28', 175, 'never_married', 'Hindu', 'Devendra Kula Vellalar', NULL, 'no', 'B.Ed', 'B.Ed Graduate', 'Advocate', 'Advocate Details', '₹3 Lakhs - ₹5 Lakhs', 'Self Employed', 'Erode', 'Erode', 'Hi, I am Vignesh. I have completed my B.Ed and am currently working as a Advocate at Self Employed in Erode. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'joint', 'upper_middle_class', true, false, true, 100, NOW() - INTERVAL '10 days', 'Punarvasu', 'Dhanusu', 'Dhanusu', 'Vishnu', 'free', 5, 5, 'vegetarian', 'no', 'no'
    ) ON CONFLICT (id) DO UPDATE SET
      profile_id = EXCLUDED.profile_id,
      display_name = EXCLUDED.display_name,
      gender = EXCLUDED.gender,
      date_of_birth = EXCLUDED.date_of_birth,
      height_cm = EXCLUDED.height_cm,
      marital_status = EXCLUDED.marital_status,
      religion = EXCLUDED.religion,
      caste = EXCLUDED.caste,
      subcaste = EXCLUDED.subcaste,
      dosham = EXCLUDED.dosham,
      education = EXCLUDED.education,
      education_detail = EXCLUDED.education_detail,
      occupation = EXCLUDED.occupation,
      occupation_detail = EXCLUDED.occupation_detail,
      annual_income = EXCLUDED.annual_income,
      company_name = EXCLUDED.company_name,
      city = EXCLUDED.city,
      district = EXCLUDED.district,
      about_me = EXCLUDED.about_me,
      family_type = EXCLUDED.family_type,
      family_status = EXCLUDED.family_status,
      is_verified = EXCLUDED.is_verified,
      is_premium = EXCLUDED.is_premium,
      is_profile_complete = EXCLUDED.is_profile_complete,
      profile_completion_percent = EXCLUDED.profile_completion_percent,
      last_active_at = EXCLUDED.last_active_at,
      star = EXCLUDED.star,
      raasi = EXCLUDED.raasi,
      lagnam = EXCLUDED.lagnam,
      gothram = EXCLUDED.gothram,
      tier = EXCLUDED.tier,
      contacts_remaining = EXCLUDED.contacts_remaining,
      interests_remaining = EXCLUDED.interests_remaining,
      food_habit = EXCLUDED.food_habit,
      smoking = EXCLUDED.smoking,
      drinking = EXCLUDED.drinking;
INSERT INTO public.profiles (
      id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at, star, raasi, lagnam, gothram, tier, contacts_remaining, interests_remaining, food_habit, smoking, drinking
    ) VALUES (
      '00000000-0000-4000-a000-0000000000fe', 'TM000254', 'Kavitha Lingam', 'female', '1999-08-25', 163, 'never_married', 'Hindu', 'Arunthathiyar', 'Arunthathiyar subcaste', 'yes', 'M.Sc', 'M.Sc Graduate', 'Software Engineer', 'Software Engineer Details', '₹5 Lakhs - ₹7 Lakhs', 'Wipro', 'Tirunelveli', 'Tirunelveli', 'Hi, I am Kavitha. I have completed my M.Sc and am currently working as a Software Engineer at Wipro in Tirunelveli. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'rich', true, true, true, 100, NOW() - INTERVAL '3 days', 'Punarvasu', 'Viruchigam', 'Viruchigam', 'Angirasa', 'gold', 50, 100, 'vegetarian', 'no', 'no'
    ) ON CONFLICT (id) DO UPDATE SET
      profile_id = EXCLUDED.profile_id,
      display_name = EXCLUDED.display_name,
      gender = EXCLUDED.gender,
      date_of_birth = EXCLUDED.date_of_birth,
      height_cm = EXCLUDED.height_cm,
      marital_status = EXCLUDED.marital_status,
      religion = EXCLUDED.religion,
      caste = EXCLUDED.caste,
      subcaste = EXCLUDED.subcaste,
      dosham = EXCLUDED.dosham,
      education = EXCLUDED.education,
      education_detail = EXCLUDED.education_detail,
      occupation = EXCLUDED.occupation,
      occupation_detail = EXCLUDED.occupation_detail,
      annual_income = EXCLUDED.annual_income,
      company_name = EXCLUDED.company_name,
      city = EXCLUDED.city,
      district = EXCLUDED.district,
      about_me = EXCLUDED.about_me,
      family_type = EXCLUDED.family_type,
      family_status = EXCLUDED.family_status,
      is_verified = EXCLUDED.is_verified,
      is_premium = EXCLUDED.is_premium,
      is_profile_complete = EXCLUDED.is_profile_complete,
      profile_completion_percent = EXCLUDED.profile_completion_percent,
      last_active_at = EXCLUDED.last_active_at,
      star = EXCLUDED.star,
      raasi = EXCLUDED.raasi,
      lagnam = EXCLUDED.lagnam,
      gothram = EXCLUDED.gothram,
      tier = EXCLUDED.tier,
      contacts_remaining = EXCLUDED.contacts_remaining,
      interests_remaining = EXCLUDED.interests_remaining,
      food_habit = EXCLUDED.food_habit,
      smoking = EXCLUDED.smoking,
      drinking = EXCLUDED.drinking;
INSERT INTO public.profiles (
      id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at, star, raasi, lagnam, gothram, tier, contacts_remaining, interests_remaining, food_habit, smoking, drinking
    ) VALUES (
      '00000000-0000-4000-a000-0000000000ff', 'TM000255', 'Ajith Velan', 'male', '1996-03-11', 169, 'never_married', 'Hindu', 'Naicker', 'Naicker subcaste', 'no', 'M.B.A', 'M.B.A Graduate', 'Architect', 'Architect Details', '₹10 Lakhs - ₹15 Lakhs', 'Cognizant', 'Madurai', 'Madurai', 'Hi, I am Ajith. I have completed my M.B.A and am currently working as a Architect at Cognizant in Madurai. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'middle_class', true, true, true, 100, NOW() - INTERVAL '1 days', 'Shravana', 'Viruchigam', 'Rishabam', 'Harita', 'gold', 50, 100, 'vegetarian', 'no', 'no'
    ) ON CONFLICT (id) DO UPDATE SET
      profile_id = EXCLUDED.profile_id,
      display_name = EXCLUDED.display_name,
      gender = EXCLUDED.gender,
      date_of_birth = EXCLUDED.date_of_birth,
      height_cm = EXCLUDED.height_cm,
      marital_status = EXCLUDED.marital_status,
      religion = EXCLUDED.religion,
      caste = EXCLUDED.caste,
      subcaste = EXCLUDED.subcaste,
      dosham = EXCLUDED.dosham,
      education = EXCLUDED.education,
      education_detail = EXCLUDED.education_detail,
      occupation = EXCLUDED.occupation,
      occupation_detail = EXCLUDED.occupation_detail,
      annual_income = EXCLUDED.annual_income,
      company_name = EXCLUDED.company_name,
      city = EXCLUDED.city,
      district = EXCLUDED.district,
      about_me = EXCLUDED.about_me,
      family_type = EXCLUDED.family_type,
      family_status = EXCLUDED.family_status,
      is_verified = EXCLUDED.is_verified,
      is_premium = EXCLUDED.is_premium,
      is_profile_complete = EXCLUDED.is_profile_complete,
      profile_completion_percent = EXCLUDED.profile_completion_percent,
      last_active_at = EXCLUDED.last_active_at,
      star = EXCLUDED.star,
      raasi = EXCLUDED.raasi,
      lagnam = EXCLUDED.lagnam,
      gothram = EXCLUDED.gothram,
      tier = EXCLUDED.tier,
      contacts_remaining = EXCLUDED.contacts_remaining,
      interests_remaining = EXCLUDED.interests_remaining,
      food_habit = EXCLUDED.food_habit,
      smoking = EXCLUDED.smoking,
      drinking = EXCLUDED.drinking;
INSERT INTO public.profiles (
      id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at, star, raasi, lagnam, gothram, tier, contacts_remaining, interests_remaining, food_habit, smoking, drinking
    ) VALUES (
      '00000000-0000-4000-a000-000000000100', 'TM000256', 'Chitra Lingam', 'female', '1999-05-09', 152, 'never_married', 'Hindu', 'Pillai', 'Pillai subcaste', 'no', 'B.E. / B.Tech', 'B.E. / B.Tech Graduate', 'Police Officer', 'Police Officer Details', '₹15 Lakhs - ₹20 Lakhs', 'Wipro', 'Kanchipuram', 'Kanchipuram', 'Hi, I am Chitra. I have completed my B.E. / B.Tech and am currently working as a Police Officer at Wipro in Kanchipuram. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'joint', 'middle_class', true, false, true, 100, NOW() - INTERVAL '4 days', 'Jyeshta', 'Rishabam', 'Simham', 'Bharadwaj', 'free', 5, 5, 'vegetarian', 'no', 'no'
    ) ON CONFLICT (id) DO UPDATE SET
      profile_id = EXCLUDED.profile_id,
      display_name = EXCLUDED.display_name,
      gender = EXCLUDED.gender,
      date_of_birth = EXCLUDED.date_of_birth,
      height_cm = EXCLUDED.height_cm,
      marital_status = EXCLUDED.marital_status,
      religion = EXCLUDED.religion,
      caste = EXCLUDED.caste,
      subcaste = EXCLUDED.subcaste,
      dosham = EXCLUDED.dosham,
      education = EXCLUDED.education,
      education_detail = EXCLUDED.education_detail,
      occupation = EXCLUDED.occupation,
      occupation_detail = EXCLUDED.occupation_detail,
      annual_income = EXCLUDED.annual_income,
      company_name = EXCLUDED.company_name,
      city = EXCLUDED.city,
      district = EXCLUDED.district,
      about_me = EXCLUDED.about_me,
      family_type = EXCLUDED.family_type,
      family_status = EXCLUDED.family_status,
      is_verified = EXCLUDED.is_verified,
      is_premium = EXCLUDED.is_premium,
      is_profile_complete = EXCLUDED.is_profile_complete,
      profile_completion_percent = EXCLUDED.profile_completion_percent,
      last_active_at = EXCLUDED.last_active_at,
      star = EXCLUDED.star,
      raasi = EXCLUDED.raasi,
      lagnam = EXCLUDED.lagnam,
      gothram = EXCLUDED.gothram,
      tier = EXCLUDED.tier,
      contacts_remaining = EXCLUDED.contacts_remaining,
      interests_remaining = EXCLUDED.interests_remaining,
      food_habit = EXCLUDED.food_habit,
      smoking = EXCLUDED.smoking,
      drinking = EXCLUDED.drinking;
INSERT INTO public.profiles (
      id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at, star, raasi, lagnam, gothram, tier, contacts_remaining, interests_remaining, food_habit, smoking, drinking
    ) VALUES (
      '00000000-0000-4000-a000-000000000101', 'TM000257', 'Senthil Swamy', 'male', '1992-05-09', 168, 'never_married', 'Hindu', 'Devendra Kula Vellalar', 'Devendra Kula Vellalar subcaste', 'no', 'M.A', 'M.A Graduate', 'Mechanical Engineer', 'Mechanical Engineer Details', '₹3 Lakhs - ₹5 Lakhs', 'TCS', 'Chennai', 'Chennai', 'Hi, I am Senthil. I have completed my M.A and am currently working as a Mechanical Engineer at TCS in Chennai. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'rich', true, true, true, 100, NOW() - INTERVAL '6 days', 'Vishakha', 'Dhanusu', 'Rishabam', 'Angirasa', 'gold', 50, 100, 'vegetarian', 'no', 'no'
    ) ON CONFLICT (id) DO UPDATE SET
      profile_id = EXCLUDED.profile_id,
      display_name = EXCLUDED.display_name,
      gender = EXCLUDED.gender,
      date_of_birth = EXCLUDED.date_of_birth,
      height_cm = EXCLUDED.height_cm,
      marital_status = EXCLUDED.marital_status,
      religion = EXCLUDED.religion,
      caste = EXCLUDED.caste,
      subcaste = EXCLUDED.subcaste,
      dosham = EXCLUDED.dosham,
      education = EXCLUDED.education,
      education_detail = EXCLUDED.education_detail,
      occupation = EXCLUDED.occupation,
      occupation_detail = EXCLUDED.occupation_detail,
      annual_income = EXCLUDED.annual_income,
      company_name = EXCLUDED.company_name,
      city = EXCLUDED.city,
      district = EXCLUDED.district,
      about_me = EXCLUDED.about_me,
      family_type = EXCLUDED.family_type,
      family_status = EXCLUDED.family_status,
      is_verified = EXCLUDED.is_verified,
      is_premium = EXCLUDED.is_premium,
      is_profile_complete = EXCLUDED.is_profile_complete,
      profile_completion_percent = EXCLUDED.profile_completion_percent,
      last_active_at = EXCLUDED.last_active_at,
      star = EXCLUDED.star,
      raasi = EXCLUDED.raasi,
      lagnam = EXCLUDED.lagnam,
      gothram = EXCLUDED.gothram,
      tier = EXCLUDED.tier,
      contacts_remaining = EXCLUDED.contacts_remaining,
      interests_remaining = EXCLUDED.interests_remaining,
      food_habit = EXCLUDED.food_habit,
      smoking = EXCLUDED.smoking,
      drinking = EXCLUDED.drinking;
INSERT INTO public.profiles (
      id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at, star, raasi, lagnam, gothram, tier, contacts_remaining, interests_remaining, food_habit, smoking, drinking
    ) VALUES (
      '00000000-0000-4000-a000-000000000102', 'TM000258', 'Ramya Devan', 'female', '2001-07-13', 158, 'never_married', 'Hindu', 'Pillai', NULL, 'yes', 'M.B.A', 'M.B.A Graduate', 'Architect', 'Architect Details', '₹15 Lakhs - ₹20 Lakhs', 'TCS', 'Vellore', 'Vellore', 'Hi, I am Ramya. I have completed my M.B.A and am currently working as a Architect at TCS in Vellore. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'rich', true, true, true, 100, NOW() - INTERVAL '7 days', 'Vishakha', 'Magaram', 'Simham', 'Siva', 'gold', 50, 100, 'vegetarian', 'no', 'no'
    ) ON CONFLICT (id) DO UPDATE SET
      profile_id = EXCLUDED.profile_id,
      display_name = EXCLUDED.display_name,
      gender = EXCLUDED.gender,
      date_of_birth = EXCLUDED.date_of_birth,
      height_cm = EXCLUDED.height_cm,
      marital_status = EXCLUDED.marital_status,
      religion = EXCLUDED.religion,
      caste = EXCLUDED.caste,
      subcaste = EXCLUDED.subcaste,
      dosham = EXCLUDED.dosham,
      education = EXCLUDED.education,
      education_detail = EXCLUDED.education_detail,
      occupation = EXCLUDED.occupation,
      occupation_detail = EXCLUDED.occupation_detail,
      annual_income = EXCLUDED.annual_income,
      company_name = EXCLUDED.company_name,
      city = EXCLUDED.city,
      district = EXCLUDED.district,
      about_me = EXCLUDED.about_me,
      family_type = EXCLUDED.family_type,
      family_status = EXCLUDED.family_status,
      is_verified = EXCLUDED.is_verified,
      is_premium = EXCLUDED.is_premium,
      is_profile_complete = EXCLUDED.is_profile_complete,
      profile_completion_percent = EXCLUDED.profile_completion_percent,
      last_active_at = EXCLUDED.last_active_at,
      star = EXCLUDED.star,
      raasi = EXCLUDED.raasi,
      lagnam = EXCLUDED.lagnam,
      gothram = EXCLUDED.gothram,
      tier = EXCLUDED.tier,
      contacts_remaining = EXCLUDED.contacts_remaining,
      interests_remaining = EXCLUDED.interests_remaining,
      food_habit = EXCLUDED.food_habit,
      smoking = EXCLUDED.smoking,
      drinking = EXCLUDED.drinking;
INSERT INTO public.profiles (
      id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at, star, raasi, lagnam, gothram, tier, contacts_remaining, interests_remaining, food_habit, smoking, drinking
    ) VALUES (
      '00000000-0000-4000-a000-000000000103', 'TM000259', 'Ramakrishnan Swamy', 'male', '1993-03-23', 165, 'never_married', 'Hindu', 'Vishwakarma', 'Vishwakarma subcaste', 'yes', 'M.Sc', 'M.Sc Graduate', 'Auditor', 'Auditor Details', '₹15 Lakhs - ₹20 Lakhs', 'HCL', 'Thoothukudi', 'Tuticorin', 'Hi, I am Ramakrishnan. I have completed my M.Sc and am currently working as a Auditor at HCL in Thoothukudi. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'rich', true, false, true, 100, NOW() - INTERVAL '5 days', 'Poorvashadha', 'Kanni', 'Mesham', 'Gautama', 'free', 5, 5, 'vegetarian', 'no', 'no'
    ) ON CONFLICT (id) DO UPDATE SET
      profile_id = EXCLUDED.profile_id,
      display_name = EXCLUDED.display_name,
      gender = EXCLUDED.gender,
      date_of_birth = EXCLUDED.date_of_birth,
      height_cm = EXCLUDED.height_cm,
      marital_status = EXCLUDED.marital_status,
      religion = EXCLUDED.religion,
      caste = EXCLUDED.caste,
      subcaste = EXCLUDED.subcaste,
      dosham = EXCLUDED.dosham,
      education = EXCLUDED.education,
      education_detail = EXCLUDED.education_detail,
      occupation = EXCLUDED.occupation,
      occupation_detail = EXCLUDED.occupation_detail,
      annual_income = EXCLUDED.annual_income,
      company_name = EXCLUDED.company_name,
      city = EXCLUDED.city,
      district = EXCLUDED.district,
      about_me = EXCLUDED.about_me,
      family_type = EXCLUDED.family_type,
      family_status = EXCLUDED.family_status,
      is_verified = EXCLUDED.is_verified,
      is_premium = EXCLUDED.is_premium,
      is_profile_complete = EXCLUDED.is_profile_complete,
      profile_completion_percent = EXCLUDED.profile_completion_percent,
      last_active_at = EXCLUDED.last_active_at,
      star = EXCLUDED.star,
      raasi = EXCLUDED.raasi,
      lagnam = EXCLUDED.lagnam,
      gothram = EXCLUDED.gothram,
      tier = EXCLUDED.tier,
      contacts_remaining = EXCLUDED.contacts_remaining,
      interests_remaining = EXCLUDED.interests_remaining,
      food_habit = EXCLUDED.food_habit,
      smoking = EXCLUDED.smoking,
      drinking = EXCLUDED.drinking;
INSERT INTO public.profiles (
      id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at, star, raasi, lagnam, gothram, tier, contacts_remaining, interests_remaining, food_habit, smoking, drinking
    ) VALUES (
      '00000000-0000-4000-a000-000000000104', 'TM000260', 'Oviya Mani', 'female', '1991-08-13', 162, 'never_married', 'Hindu', 'Vanniyar', 'Vanniyar subcaste', 'no', 'M.A', 'M.A Graduate', 'Mechanical Engineer', 'Mechanical Engineer Details', '₹20 Lakhs+', 'Infosys', 'Thanjavur', 'Thanjavur', 'Hi, I am Oviya. I have completed my M.A and am currently working as a Mechanical Engineer at Infosys in Thanjavur. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'rich', true, false, true, 100, NOW() - INTERVAL '1 days', 'Vishakha', 'Rishabam', 'Meenam', 'Viswamitra', 'free', 5, 5, 'vegetarian', 'no', 'no'
    ) ON CONFLICT (id) DO UPDATE SET
      profile_id = EXCLUDED.profile_id,
      display_name = EXCLUDED.display_name,
      gender = EXCLUDED.gender,
      date_of_birth = EXCLUDED.date_of_birth,
      height_cm = EXCLUDED.height_cm,
      marital_status = EXCLUDED.marital_status,
      religion = EXCLUDED.religion,
      caste = EXCLUDED.caste,
      subcaste = EXCLUDED.subcaste,
      dosham = EXCLUDED.dosham,
      education = EXCLUDED.education,
      education_detail = EXCLUDED.education_detail,
      occupation = EXCLUDED.occupation,
      occupation_detail = EXCLUDED.occupation_detail,
      annual_income = EXCLUDED.annual_income,
      company_name = EXCLUDED.company_name,
      city = EXCLUDED.city,
      district = EXCLUDED.district,
      about_me = EXCLUDED.about_me,
      family_type = EXCLUDED.family_type,
      family_status = EXCLUDED.family_status,
      is_verified = EXCLUDED.is_verified,
      is_premium = EXCLUDED.is_premium,
      is_profile_complete = EXCLUDED.is_profile_complete,
      profile_completion_percent = EXCLUDED.profile_completion_percent,
      last_active_at = EXCLUDED.last_active_at,
      star = EXCLUDED.star,
      raasi = EXCLUDED.raasi,
      lagnam = EXCLUDED.lagnam,
      gothram = EXCLUDED.gothram,
      tier = EXCLUDED.tier,
      contacts_remaining = EXCLUDED.contacts_remaining,
      interests_remaining = EXCLUDED.interests_remaining,
      food_habit = EXCLUDED.food_habit,
      smoking = EXCLUDED.smoking,
      drinking = EXCLUDED.drinking;
INSERT INTO public.profiles (
      id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at, star, raasi, lagnam, gothram, tier, contacts_remaining, interests_remaining, food_habit, smoking, drinking
    ) VALUES (
      '00000000-0000-4000-a000-000000000105', 'TM000261', 'Vetrivel Krishnan', 'male', '1998-03-01', 164, 'never_married', 'Hindu', 'Kallar', NULL, 'no', 'M.B.B.S', 'M.B.B.S Graduate', 'Civil Engineer', 'Civil Engineer Details', '₹3 Lakhs - ₹5 Lakhs', 'Zoho', 'Salem', 'Salem', 'Hi, I am Vetrivel. I have completed my M.B.B.S and am currently working as a Civil Engineer at Zoho in Salem. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'upper_middle_class', true, false, true, 100, NOW() - INTERVAL '3 days', 'Revati', 'Mesham', 'Kumbam', 'Viswamitra', 'free', 5, 5, 'vegetarian', 'no', 'no'
    ) ON CONFLICT (id) DO UPDATE SET
      profile_id = EXCLUDED.profile_id,
      display_name = EXCLUDED.display_name,
      gender = EXCLUDED.gender,
      date_of_birth = EXCLUDED.date_of_birth,
      height_cm = EXCLUDED.height_cm,
      marital_status = EXCLUDED.marital_status,
      religion = EXCLUDED.religion,
      caste = EXCLUDED.caste,
      subcaste = EXCLUDED.subcaste,
      dosham = EXCLUDED.dosham,
      education = EXCLUDED.education,
      education_detail = EXCLUDED.education_detail,
      occupation = EXCLUDED.occupation,
      occupation_detail = EXCLUDED.occupation_detail,
      annual_income = EXCLUDED.annual_income,
      company_name = EXCLUDED.company_name,
      city = EXCLUDED.city,
      district = EXCLUDED.district,
      about_me = EXCLUDED.about_me,
      family_type = EXCLUDED.family_type,
      family_status = EXCLUDED.family_status,
      is_verified = EXCLUDED.is_verified,
      is_premium = EXCLUDED.is_premium,
      is_profile_complete = EXCLUDED.is_profile_complete,
      profile_completion_percent = EXCLUDED.profile_completion_percent,
      last_active_at = EXCLUDED.last_active_at,
      star = EXCLUDED.star,
      raasi = EXCLUDED.raasi,
      lagnam = EXCLUDED.lagnam,
      gothram = EXCLUDED.gothram,
      tier = EXCLUDED.tier,
      contacts_remaining = EXCLUDED.contacts_remaining,
      interests_remaining = EXCLUDED.interests_remaining,
      food_habit = EXCLUDED.food_habit,
      smoking = EXCLUDED.smoking,
      drinking = EXCLUDED.drinking;
INSERT INTO public.profiles (
      id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at, star, raasi, lagnam, gothram, tier, contacts_remaining, interests_remaining, food_habit, smoking, drinking
    ) VALUES (
      '00000000-0000-4000-a000-000000000106', 'TM000262', 'Nandhini Kumar', 'female', '1998-08-05', 158, 'never_married', 'Hindu', 'Naidu', 'Naidu subcaste', 'no', 'B.A', 'B.A Graduate', 'Advocate', 'Advocate Details', '₹5 Lakhs - ₹7 Lakhs', 'Cognizant', 'Thanjavur', 'Thanjavur', 'Hi, I am Nandhini. I have completed my B.A and am currently working as a Advocate at Cognizant in Thanjavur. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'joint', 'upper_middle_class', false, false, true, 100, NOW() - INTERVAL '10 days', 'Bharani', 'Simham', 'Kumbam', 'Bharadwaj', 'free', 5, 5, 'vegetarian', 'no', 'no'
    ) ON CONFLICT (id) DO UPDATE SET
      profile_id = EXCLUDED.profile_id,
      display_name = EXCLUDED.display_name,
      gender = EXCLUDED.gender,
      date_of_birth = EXCLUDED.date_of_birth,
      height_cm = EXCLUDED.height_cm,
      marital_status = EXCLUDED.marital_status,
      religion = EXCLUDED.religion,
      caste = EXCLUDED.caste,
      subcaste = EXCLUDED.subcaste,
      dosham = EXCLUDED.dosham,
      education = EXCLUDED.education,
      education_detail = EXCLUDED.education_detail,
      occupation = EXCLUDED.occupation,
      occupation_detail = EXCLUDED.occupation_detail,
      annual_income = EXCLUDED.annual_income,
      company_name = EXCLUDED.company_name,
      city = EXCLUDED.city,
      district = EXCLUDED.district,
      about_me = EXCLUDED.about_me,
      family_type = EXCLUDED.family_type,
      family_status = EXCLUDED.family_status,
      is_verified = EXCLUDED.is_verified,
      is_premium = EXCLUDED.is_premium,
      is_profile_complete = EXCLUDED.is_profile_complete,
      profile_completion_percent = EXCLUDED.profile_completion_percent,
      last_active_at = EXCLUDED.last_active_at,
      star = EXCLUDED.star,
      raasi = EXCLUDED.raasi,
      lagnam = EXCLUDED.lagnam,
      gothram = EXCLUDED.gothram,
      tier = EXCLUDED.tier,
      contacts_remaining = EXCLUDED.contacts_remaining,
      interests_remaining = EXCLUDED.interests_remaining,
      food_habit = EXCLUDED.food_habit,
      smoking = EXCLUDED.smoking,
      drinking = EXCLUDED.drinking;
INSERT INTO public.profiles (
      id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at, star, raasi, lagnam, gothram, tier, contacts_remaining, interests_remaining, food_habit, smoking, drinking
    ) VALUES (
      '00000000-0000-4000-a000-000000000107', 'TM000263', 'Praveen Krishnan', 'male', '1990-04-10', 168, 'never_married', 'Hindu', 'Chettiar', 'Chettiar subcaste', 'no', 'B.Sc', 'B.Sc Graduate', 'Software Engineer', 'Software Engineer Details', '₹15 Lakhs - ₹20 Lakhs', 'Cognizant', 'Tiruchirappalli', 'Trichy', 'Hi, I am Praveen. I have completed my B.Sc and am currently working as a Software Engineer at Cognizant in Tiruchirappalli. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'upper_middle_class', false, false, true, 100, NOW() - INTERVAL '10 days', 'Poorvabhadrapada', 'Thulaam', 'Kumbam', 'Siva', 'free', 5, 5, 'vegetarian', 'no', 'no'
    ) ON CONFLICT (id) DO UPDATE SET
      profile_id = EXCLUDED.profile_id,
      display_name = EXCLUDED.display_name,
      gender = EXCLUDED.gender,
      date_of_birth = EXCLUDED.date_of_birth,
      height_cm = EXCLUDED.height_cm,
      marital_status = EXCLUDED.marital_status,
      religion = EXCLUDED.religion,
      caste = EXCLUDED.caste,
      subcaste = EXCLUDED.subcaste,
      dosham = EXCLUDED.dosham,
      education = EXCLUDED.education,
      education_detail = EXCLUDED.education_detail,
      occupation = EXCLUDED.occupation,
      occupation_detail = EXCLUDED.occupation_detail,
      annual_income = EXCLUDED.annual_income,
      company_name = EXCLUDED.company_name,
      city = EXCLUDED.city,
      district = EXCLUDED.district,
      about_me = EXCLUDED.about_me,
      family_type = EXCLUDED.family_type,
      family_status = EXCLUDED.family_status,
      is_verified = EXCLUDED.is_verified,
      is_premium = EXCLUDED.is_premium,
      is_profile_complete = EXCLUDED.is_profile_complete,
      profile_completion_percent = EXCLUDED.profile_completion_percent,
      last_active_at = EXCLUDED.last_active_at,
      star = EXCLUDED.star,
      raasi = EXCLUDED.raasi,
      lagnam = EXCLUDED.lagnam,
      gothram = EXCLUDED.gothram,
      tier = EXCLUDED.tier,
      contacts_remaining = EXCLUDED.contacts_remaining,
      interests_remaining = EXCLUDED.interests_remaining,
      food_habit = EXCLUDED.food_habit,
      smoking = EXCLUDED.smoking,
      drinking = EXCLUDED.drinking;
INSERT INTO public.profiles (
      id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at, star, raasi, lagnam, gothram, tier, contacts_remaining, interests_remaining, food_habit, smoking, drinking
    ) VALUES (
      '00000000-0000-4000-a000-000000000108', 'TM000264', 'Sneha Mani', 'female', '2000-05-23', 170, 'never_married', 'Hindu', 'Kallar', NULL, 'no', 'M.A', 'M.A Graduate', 'Mechanical Engineer', 'Mechanical Engineer Details', '₹20 Lakhs+', 'Zoho', 'Tiruchirappalli', 'Trichy', 'Hi, I am Sneha. I have completed my M.A and am currently working as a Mechanical Engineer at Zoho in Tiruchirappalli. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'joint', 'rich', true, true, true, 100, NOW() - INTERVAL '7 days', 'Anuradha', 'Viruchigam', 'Kumbam', 'Harita', 'gold', 50, 100, 'vegetarian', 'no', 'no'
    ) ON CONFLICT (id) DO UPDATE SET
      profile_id = EXCLUDED.profile_id,
      display_name = EXCLUDED.display_name,
      gender = EXCLUDED.gender,
      date_of_birth = EXCLUDED.date_of_birth,
      height_cm = EXCLUDED.height_cm,
      marital_status = EXCLUDED.marital_status,
      religion = EXCLUDED.religion,
      caste = EXCLUDED.caste,
      subcaste = EXCLUDED.subcaste,
      dosham = EXCLUDED.dosham,
      education = EXCLUDED.education,
      education_detail = EXCLUDED.education_detail,
      occupation = EXCLUDED.occupation,
      occupation_detail = EXCLUDED.occupation_detail,
      annual_income = EXCLUDED.annual_income,
      company_name = EXCLUDED.company_name,
      city = EXCLUDED.city,
      district = EXCLUDED.district,
      about_me = EXCLUDED.about_me,
      family_type = EXCLUDED.family_type,
      family_status = EXCLUDED.family_status,
      is_verified = EXCLUDED.is_verified,
      is_premium = EXCLUDED.is_premium,
      is_profile_complete = EXCLUDED.is_profile_complete,
      profile_completion_percent = EXCLUDED.profile_completion_percent,
      last_active_at = EXCLUDED.last_active_at,
      star = EXCLUDED.star,
      raasi = EXCLUDED.raasi,
      lagnam = EXCLUDED.lagnam,
      gothram = EXCLUDED.gothram,
      tier = EXCLUDED.tier,
      contacts_remaining = EXCLUDED.contacts_remaining,
      interests_remaining = EXCLUDED.interests_remaining,
      food_habit = EXCLUDED.food_habit,
      smoking = EXCLUDED.smoking,
      drinking = EXCLUDED.drinking;
INSERT INTO public.profiles (
      id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at, star, raasi, lagnam, gothram, tier, contacts_remaining, interests_remaining, food_habit, smoking, drinking
    ) VALUES (
      '00000000-0000-4000-a000-000000000109', 'TM000265', 'Thirumal Gopal', 'male', '2000-04-28', 180, 'never_married', 'Hindu', 'Devendra Kula Vellalar', 'Devendra Kula Vellalar subcaste', 'no', 'M.A', 'M.A Graduate', 'Police Officer', 'Police Officer Details', '₹3 Lakhs - ₹5 Lakhs', 'HCL', 'Thanjavur', 'Thanjavur', 'Hi, I am Thirumal. I have completed my M.A and am currently working as a Police Officer at HCL in Thanjavur. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'joint', 'upper_middle_class', true, false, true, 100, NOW() - INTERVAL '10 days', 'Bharani', 'Meenam', 'Kanni', 'Vashishta', 'free', 5, 5, 'vegetarian', 'no', 'no'
    ) ON CONFLICT (id) DO UPDATE SET
      profile_id = EXCLUDED.profile_id,
      display_name = EXCLUDED.display_name,
      gender = EXCLUDED.gender,
      date_of_birth = EXCLUDED.date_of_birth,
      height_cm = EXCLUDED.height_cm,
      marital_status = EXCLUDED.marital_status,
      religion = EXCLUDED.religion,
      caste = EXCLUDED.caste,
      subcaste = EXCLUDED.subcaste,
      dosham = EXCLUDED.dosham,
      education = EXCLUDED.education,
      education_detail = EXCLUDED.education_detail,
      occupation = EXCLUDED.occupation,
      occupation_detail = EXCLUDED.occupation_detail,
      annual_income = EXCLUDED.annual_income,
      company_name = EXCLUDED.company_name,
      city = EXCLUDED.city,
      district = EXCLUDED.district,
      about_me = EXCLUDED.about_me,
      family_type = EXCLUDED.family_type,
      family_status = EXCLUDED.family_status,
      is_verified = EXCLUDED.is_verified,
      is_premium = EXCLUDED.is_premium,
      is_profile_complete = EXCLUDED.is_profile_complete,
      profile_completion_percent = EXCLUDED.profile_completion_percent,
      last_active_at = EXCLUDED.last_active_at,
      star = EXCLUDED.star,
      raasi = EXCLUDED.raasi,
      lagnam = EXCLUDED.lagnam,
      gothram = EXCLUDED.gothram,
      tier = EXCLUDED.tier,
      contacts_remaining = EXCLUDED.contacts_remaining,
      interests_remaining = EXCLUDED.interests_remaining,
      food_habit = EXCLUDED.food_habit,
      smoking = EXCLUDED.smoking,
      drinking = EXCLUDED.drinking;
INSERT INTO public.profiles (
      id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at, star, raasi, lagnam, gothram, tier, contacts_remaining, interests_remaining, food_habit, smoking, drinking
    ) VALUES (
      '00000000-0000-4000-a000-00000000010a', 'TM000266', 'Chitra Velan', 'female', '1996-02-21', 158, 'never_married', 'Hindu', 'Devendra Kula Vellalar', NULL, 'yes', 'M.Sc', 'M.Sc Graduate', 'HR Specialist', 'HR Specialist Details', '₹10 Lakhs - ₹15 Lakhs', 'TCS', 'Salem', 'Salem', 'Hi, I am Chitra. I have completed my M.Sc and am currently working as a HR Specialist at TCS in Salem. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'middle_class', false, false, true, 100, NOW() - INTERVAL '5 days', 'Ashwini', 'Magaram', 'Mesham', 'Agastya', 'free', 5, 5, 'vegetarian', 'no', 'no'
    ) ON CONFLICT (id) DO UPDATE SET
      profile_id = EXCLUDED.profile_id,
      display_name = EXCLUDED.display_name,
      gender = EXCLUDED.gender,
      date_of_birth = EXCLUDED.date_of_birth,
      height_cm = EXCLUDED.height_cm,
      marital_status = EXCLUDED.marital_status,
      religion = EXCLUDED.religion,
      caste = EXCLUDED.caste,
      subcaste = EXCLUDED.subcaste,
      dosham = EXCLUDED.dosham,
      education = EXCLUDED.education,
      education_detail = EXCLUDED.education_detail,
      occupation = EXCLUDED.occupation,
      occupation_detail = EXCLUDED.occupation_detail,
      annual_income = EXCLUDED.annual_income,
      company_name = EXCLUDED.company_name,
      city = EXCLUDED.city,
      district = EXCLUDED.district,
      about_me = EXCLUDED.about_me,
      family_type = EXCLUDED.family_type,
      family_status = EXCLUDED.family_status,
      is_verified = EXCLUDED.is_verified,
      is_premium = EXCLUDED.is_premium,
      is_profile_complete = EXCLUDED.is_profile_complete,
      profile_completion_percent = EXCLUDED.profile_completion_percent,
      last_active_at = EXCLUDED.last_active_at,
      star = EXCLUDED.star,
      raasi = EXCLUDED.raasi,
      lagnam = EXCLUDED.lagnam,
      gothram = EXCLUDED.gothram,
      tier = EXCLUDED.tier,
      contacts_remaining = EXCLUDED.contacts_remaining,
      interests_remaining = EXCLUDED.interests_remaining,
      food_habit = EXCLUDED.food_habit,
      smoking = EXCLUDED.smoking,
      drinking = EXCLUDED.drinking;
INSERT INTO public.profiles (
      id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at, star, raasi, lagnam, gothram, tier, contacts_remaining, interests_remaining, food_habit, smoking, drinking
    ) VALUES (
      '00000000-0000-4000-a000-00000000010b', 'TM000267', 'Madhavan Raman', 'male', '1997-08-17', 186, 'never_married', 'Hindu', 'Brahmin - Iyer', NULL, 'no', 'Ph.D', 'Ph.D Graduate', 'Mechanical Engineer', 'Mechanical Engineer Details', '₹5 Lakhs - ₹7 Lakhs', 'Infosys', 'Vellore', 'Vellore', 'Hi, I am Madhavan. I have completed my Ph.D and am currently working as a Mechanical Engineer at Infosys in Vellore. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'joint', 'middle_class', false, true, true, 100, NOW() - INTERVAL '2 days', 'Mirgashira', 'Kanni', 'Dhanusu', 'Harita', 'gold', 50, 100, 'vegetarian', 'no', 'no'
    ) ON CONFLICT (id) DO UPDATE SET
      profile_id = EXCLUDED.profile_id,
      display_name = EXCLUDED.display_name,
      gender = EXCLUDED.gender,
      date_of_birth = EXCLUDED.date_of_birth,
      height_cm = EXCLUDED.height_cm,
      marital_status = EXCLUDED.marital_status,
      religion = EXCLUDED.religion,
      caste = EXCLUDED.caste,
      subcaste = EXCLUDED.subcaste,
      dosham = EXCLUDED.dosham,
      education = EXCLUDED.education,
      education_detail = EXCLUDED.education_detail,
      occupation = EXCLUDED.occupation,
      occupation_detail = EXCLUDED.occupation_detail,
      annual_income = EXCLUDED.annual_income,
      company_name = EXCLUDED.company_name,
      city = EXCLUDED.city,
      district = EXCLUDED.district,
      about_me = EXCLUDED.about_me,
      family_type = EXCLUDED.family_type,
      family_status = EXCLUDED.family_status,
      is_verified = EXCLUDED.is_verified,
      is_premium = EXCLUDED.is_premium,
      is_profile_complete = EXCLUDED.is_profile_complete,
      profile_completion_percent = EXCLUDED.profile_completion_percent,
      last_active_at = EXCLUDED.last_active_at,
      star = EXCLUDED.star,
      raasi = EXCLUDED.raasi,
      lagnam = EXCLUDED.lagnam,
      gothram = EXCLUDED.gothram,
      tier = EXCLUDED.tier,
      contacts_remaining = EXCLUDED.contacts_remaining,
      interests_remaining = EXCLUDED.interests_remaining,
      food_habit = EXCLUDED.food_habit,
      smoking = EXCLUDED.smoking,
      drinking = EXCLUDED.drinking;
INSERT INTO public.profiles (
      id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at, star, raasi, lagnam, gothram, tier, contacts_remaining, interests_remaining, food_habit, smoking, drinking
    ) VALUES (
      '00000000-0000-4000-a000-00000000010c', 'TM000268', 'Priya Kumar', 'female', '2001-06-24', 167, 'never_married', 'Hindu', 'Brahmin - Iyer', NULL, 'yes', 'M.Com', 'M.Com Graduate', 'HR Specialist', 'HR Specialist Details', '₹10 Lakhs - ₹15 Lakhs', 'Government Service', 'Salem', 'Salem', 'Hi, I am Priya. I have completed my M.Com and am currently working as a HR Specialist at Government Service in Salem. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'middle_class', true, false, true, 100, NOW() - INTERVAL '6 days', 'Krittika', 'Mesham', 'Viruchigam', 'Agastya', 'free', 5, 5, 'vegetarian', 'no', 'no'
    ) ON CONFLICT (id) DO UPDATE SET
      profile_id = EXCLUDED.profile_id,
      display_name = EXCLUDED.display_name,
      gender = EXCLUDED.gender,
      date_of_birth = EXCLUDED.date_of_birth,
      height_cm = EXCLUDED.height_cm,
      marital_status = EXCLUDED.marital_status,
      religion = EXCLUDED.religion,
      caste = EXCLUDED.caste,
      subcaste = EXCLUDED.subcaste,
      dosham = EXCLUDED.dosham,
      education = EXCLUDED.education,
      education_detail = EXCLUDED.education_detail,
      occupation = EXCLUDED.occupation,
      occupation_detail = EXCLUDED.occupation_detail,
      annual_income = EXCLUDED.annual_income,
      company_name = EXCLUDED.company_name,
      city = EXCLUDED.city,
      district = EXCLUDED.district,
      about_me = EXCLUDED.about_me,
      family_type = EXCLUDED.family_type,
      family_status = EXCLUDED.family_status,
      is_verified = EXCLUDED.is_verified,
      is_premium = EXCLUDED.is_premium,
      is_profile_complete = EXCLUDED.is_profile_complete,
      profile_completion_percent = EXCLUDED.profile_completion_percent,
      last_active_at = EXCLUDED.last_active_at,
      star = EXCLUDED.star,
      raasi = EXCLUDED.raasi,
      lagnam = EXCLUDED.lagnam,
      gothram = EXCLUDED.gothram,
      tier = EXCLUDED.tier,
      contacts_remaining = EXCLUDED.contacts_remaining,
      interests_remaining = EXCLUDED.interests_remaining,
      food_habit = EXCLUDED.food_habit,
      smoking = EXCLUDED.smoking,
      drinking = EXCLUDED.drinking;
INSERT INTO public.profiles (
      id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at, star, raasi, lagnam, gothram, tier, contacts_remaining, interests_remaining, food_habit, smoking, drinking
    ) VALUES (
      '00000000-0000-4000-a000-00000000010d', 'TM000269', 'Vijay Swamy', 'male', '1988-05-24', 186, 'never_married', 'Hindu', 'Maravar', NULL, 'no', 'Ph.D', 'Ph.D Graduate', 'HR Specialist', 'HR Specialist Details', '₹3 Lakhs - ₹5 Lakhs', 'TCS', 'Thoothukudi', 'Tuticorin', 'Hi, I am Vijay. I have completed my Ph.D and am currently working as a HR Specialist at TCS in Thoothukudi. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'joint', 'rich', false, false, true, 100, NOW() - INTERVAL '7 days', 'Uttaraphalguni', 'Thulaam', 'Kadagam', 'Vashishta', 'free', 5, 5, 'vegetarian', 'no', 'no'
    ) ON CONFLICT (id) DO UPDATE SET
      profile_id = EXCLUDED.profile_id,
      display_name = EXCLUDED.display_name,
      gender = EXCLUDED.gender,
      date_of_birth = EXCLUDED.date_of_birth,
      height_cm = EXCLUDED.height_cm,
      marital_status = EXCLUDED.marital_status,
      religion = EXCLUDED.religion,
      caste = EXCLUDED.caste,
      subcaste = EXCLUDED.subcaste,
      dosham = EXCLUDED.dosham,
      education = EXCLUDED.education,
      education_detail = EXCLUDED.education_detail,
      occupation = EXCLUDED.occupation,
      occupation_detail = EXCLUDED.occupation_detail,
      annual_income = EXCLUDED.annual_income,
      company_name = EXCLUDED.company_name,
      city = EXCLUDED.city,
      district = EXCLUDED.district,
      about_me = EXCLUDED.about_me,
      family_type = EXCLUDED.family_type,
      family_status = EXCLUDED.family_status,
      is_verified = EXCLUDED.is_verified,
      is_premium = EXCLUDED.is_premium,
      is_profile_complete = EXCLUDED.is_profile_complete,
      profile_completion_percent = EXCLUDED.profile_completion_percent,
      last_active_at = EXCLUDED.last_active_at,
      star = EXCLUDED.star,
      raasi = EXCLUDED.raasi,
      lagnam = EXCLUDED.lagnam,
      gothram = EXCLUDED.gothram,
      tier = EXCLUDED.tier,
      contacts_remaining = EXCLUDED.contacts_remaining,
      interests_remaining = EXCLUDED.interests_remaining,
      food_habit = EXCLUDED.food_habit,
      smoking = EXCLUDED.smoking,
      drinking = EXCLUDED.drinking;
INSERT INTO public.profiles (
      id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at, star, raasi, lagnam, gothram, tier, contacts_remaining, interests_remaining, food_habit, smoking, drinking
    ) VALUES (
      '00000000-0000-4000-a000-00000000010e', 'TM000270', 'Archana Samy', 'female', '1995-06-19', 151, 'never_married', 'Hindu', 'Sengunthar', NULL, 'yes', 'M.B.B.S', 'M.B.B.S Graduate', 'Advocate', 'Advocate Details', '₹3 Lakhs - ₹5 Lakhs', 'Private Practice', 'Madurai', 'Madurai', 'Hi, I am Archana. I have completed my M.B.B.S and am currently working as a Advocate at Private Practice in Madurai. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'rich', false, false, true, 100, NOW() - INTERVAL '4 days', 'Bharani', 'Kadagam', 'Kadagam', 'Gautama', 'free', 5, 5, 'vegetarian', 'no', 'no'
    ) ON CONFLICT (id) DO UPDATE SET
      profile_id = EXCLUDED.profile_id,
      display_name = EXCLUDED.display_name,
      gender = EXCLUDED.gender,
      date_of_birth = EXCLUDED.date_of_birth,
      height_cm = EXCLUDED.height_cm,
      marital_status = EXCLUDED.marital_status,
      religion = EXCLUDED.religion,
      caste = EXCLUDED.caste,
      subcaste = EXCLUDED.subcaste,
      dosham = EXCLUDED.dosham,
      education = EXCLUDED.education,
      education_detail = EXCLUDED.education_detail,
      occupation = EXCLUDED.occupation,
      occupation_detail = EXCLUDED.occupation_detail,
      annual_income = EXCLUDED.annual_income,
      company_name = EXCLUDED.company_name,
      city = EXCLUDED.city,
      district = EXCLUDED.district,
      about_me = EXCLUDED.about_me,
      family_type = EXCLUDED.family_type,
      family_status = EXCLUDED.family_status,
      is_verified = EXCLUDED.is_verified,
      is_premium = EXCLUDED.is_premium,
      is_profile_complete = EXCLUDED.is_profile_complete,
      profile_completion_percent = EXCLUDED.profile_completion_percent,
      last_active_at = EXCLUDED.last_active_at,
      star = EXCLUDED.star,
      raasi = EXCLUDED.raasi,
      lagnam = EXCLUDED.lagnam,
      gothram = EXCLUDED.gothram,
      tier = EXCLUDED.tier,
      contacts_remaining = EXCLUDED.contacts_remaining,
      interests_remaining = EXCLUDED.interests_remaining,
      food_habit = EXCLUDED.food_habit,
      smoking = EXCLUDED.smoking,
      drinking = EXCLUDED.drinking;
INSERT INTO public.profiles (
      id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at, star, raasi, lagnam, gothram, tier, contacts_remaining, interests_remaining, food_habit, smoking, drinking
    ) VALUES (
      '00000000-0000-4000-a000-00000000010f', 'TM000271', 'Jeeva Nathan', 'male', '1990-02-03', 174, 'never_married', 'Hindu', 'Maravar', 'Maravar subcaste', 'yes', 'B.Sc', 'B.Sc Graduate', 'Police Officer', 'Police Officer Details', '₹7 Lakhs - ₹10 Lakhs', 'Infosys', 'Salem', 'Salem', 'Hi, I am Jeeva. I have completed my B.Sc and am currently working as a Police Officer at Infosys in Salem. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'rich', true, false, true, 100, NOW() - INTERVAL '9 days', 'Uttarabhadrapada', 'Magaram', 'Kumbam', 'Siva', 'free', 5, 5, 'vegetarian', 'no', 'no'
    ) ON CONFLICT (id) DO UPDATE SET
      profile_id = EXCLUDED.profile_id,
      display_name = EXCLUDED.display_name,
      gender = EXCLUDED.gender,
      date_of_birth = EXCLUDED.date_of_birth,
      height_cm = EXCLUDED.height_cm,
      marital_status = EXCLUDED.marital_status,
      religion = EXCLUDED.religion,
      caste = EXCLUDED.caste,
      subcaste = EXCLUDED.subcaste,
      dosham = EXCLUDED.dosham,
      education = EXCLUDED.education,
      education_detail = EXCLUDED.education_detail,
      occupation = EXCLUDED.occupation,
      occupation_detail = EXCLUDED.occupation_detail,
      annual_income = EXCLUDED.annual_income,
      company_name = EXCLUDED.company_name,
      city = EXCLUDED.city,
      district = EXCLUDED.district,
      about_me = EXCLUDED.about_me,
      family_type = EXCLUDED.family_type,
      family_status = EXCLUDED.family_status,
      is_verified = EXCLUDED.is_verified,
      is_premium = EXCLUDED.is_premium,
      is_profile_complete = EXCLUDED.is_profile_complete,
      profile_completion_percent = EXCLUDED.profile_completion_percent,
      last_active_at = EXCLUDED.last_active_at,
      star = EXCLUDED.star,
      raasi = EXCLUDED.raasi,
      lagnam = EXCLUDED.lagnam,
      gothram = EXCLUDED.gothram,
      tier = EXCLUDED.tier,
      contacts_remaining = EXCLUDED.contacts_remaining,
      interests_remaining = EXCLUDED.interests_remaining,
      food_habit = EXCLUDED.food_habit,
      smoking = EXCLUDED.smoking,
      drinking = EXCLUDED.drinking;
INSERT INTO public.profiles (
      id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at, star, raasi, lagnam, gothram, tier, contacts_remaining, interests_remaining, food_habit, smoking, drinking
    ) VALUES (
      '00000000-0000-4000-a000-000000000110', 'TM000272', 'Geetha Samy', 'female', '1999-12-22', 174, 'never_married', 'Hindu', 'Brahmin - Iyengar', 'Brahmin - Iyengar subcaste', 'no', 'M.A', 'M.A Graduate', 'Bank Manager', 'Bank Manager Details', '₹7 Lakhs - ₹10 Lakhs', 'Cognizant', 'Coimbatore', 'Coimbatore', 'Hi, I am Geetha. I have completed my M.A and am currently working as a Bank Manager at Cognizant in Coimbatore. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'upper_middle_class', false, false, true, 100, NOW() - INTERVAL '1 days', 'Poorvashadha', 'Meenam', 'Dhanusu', 'Murugan', 'free', 5, 5, 'vegetarian', 'no', 'no'
    ) ON CONFLICT (id) DO UPDATE SET
      profile_id = EXCLUDED.profile_id,
      display_name = EXCLUDED.display_name,
      gender = EXCLUDED.gender,
      date_of_birth = EXCLUDED.date_of_birth,
      height_cm = EXCLUDED.height_cm,
      marital_status = EXCLUDED.marital_status,
      religion = EXCLUDED.religion,
      caste = EXCLUDED.caste,
      subcaste = EXCLUDED.subcaste,
      dosham = EXCLUDED.dosham,
      education = EXCLUDED.education,
      education_detail = EXCLUDED.education_detail,
      occupation = EXCLUDED.occupation,
      occupation_detail = EXCLUDED.occupation_detail,
      annual_income = EXCLUDED.annual_income,
      company_name = EXCLUDED.company_name,
      city = EXCLUDED.city,
      district = EXCLUDED.district,
      about_me = EXCLUDED.about_me,
      family_type = EXCLUDED.family_type,
      family_status = EXCLUDED.family_status,
      is_verified = EXCLUDED.is_verified,
      is_premium = EXCLUDED.is_premium,
      is_profile_complete = EXCLUDED.is_profile_complete,
      profile_completion_percent = EXCLUDED.profile_completion_percent,
      last_active_at = EXCLUDED.last_active_at,
      star = EXCLUDED.star,
      raasi = EXCLUDED.raasi,
      lagnam = EXCLUDED.lagnam,
      gothram = EXCLUDED.gothram,
      tier = EXCLUDED.tier,
      contacts_remaining = EXCLUDED.contacts_remaining,
      interests_remaining = EXCLUDED.interests_remaining,
      food_habit = EXCLUDED.food_habit,
      smoking = EXCLUDED.smoking,
      drinking = EXCLUDED.drinking;
INSERT INTO public.profiles (
      id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at, star, raasi, lagnam, gothram, tier, contacts_remaining, interests_remaining, food_habit, smoking, drinking
    ) VALUES (
      '00000000-0000-4000-a000-000000000111', 'TM000273', 'Ramakrishnan Kumar', 'male', '1994-12-11', 166, 'never_married', 'Hindu', 'Yadav', 'Yadav subcaste', 'no', 'M.Com', 'M.Com Graduate', 'Software Engineer', 'Software Engineer Details', '₹20 Lakhs+', 'Infosys', 'Salem', 'Salem', 'Hi, I am Ramakrishnan. I have completed my M.Com and am currently working as a Software Engineer at Infosys in Salem. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'joint', 'upper_middle_class', false, false, true, 100, NOW() - INTERVAL '7 days', 'Uttarabhadrapada', 'Rishabam', 'Magaram', 'Bharadwaj', 'free', 5, 5, 'vegetarian', 'no', 'no'
    ) ON CONFLICT (id) DO UPDATE SET
      profile_id = EXCLUDED.profile_id,
      display_name = EXCLUDED.display_name,
      gender = EXCLUDED.gender,
      date_of_birth = EXCLUDED.date_of_birth,
      height_cm = EXCLUDED.height_cm,
      marital_status = EXCLUDED.marital_status,
      religion = EXCLUDED.religion,
      caste = EXCLUDED.caste,
      subcaste = EXCLUDED.subcaste,
      dosham = EXCLUDED.dosham,
      education = EXCLUDED.education,
      education_detail = EXCLUDED.education_detail,
      occupation = EXCLUDED.occupation,
      occupation_detail = EXCLUDED.occupation_detail,
      annual_income = EXCLUDED.annual_income,
      company_name = EXCLUDED.company_name,
      city = EXCLUDED.city,
      district = EXCLUDED.district,
      about_me = EXCLUDED.about_me,
      family_type = EXCLUDED.family_type,
      family_status = EXCLUDED.family_status,
      is_verified = EXCLUDED.is_verified,
      is_premium = EXCLUDED.is_premium,
      is_profile_complete = EXCLUDED.is_profile_complete,
      profile_completion_percent = EXCLUDED.profile_completion_percent,
      last_active_at = EXCLUDED.last_active_at,
      star = EXCLUDED.star,
      raasi = EXCLUDED.raasi,
      lagnam = EXCLUDED.lagnam,
      gothram = EXCLUDED.gothram,
      tier = EXCLUDED.tier,
      contacts_remaining = EXCLUDED.contacts_remaining,
      interests_remaining = EXCLUDED.interests_remaining,
      food_habit = EXCLUDED.food_habit,
      smoking = EXCLUDED.smoking,
      drinking = EXCLUDED.drinking;
INSERT INTO public.profiles (
      id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at, star, raasi, lagnam, gothram, tier, contacts_remaining, interests_remaining, food_habit, smoking, drinking
    ) VALUES (
      '00000000-0000-4000-a000-000000000112', 'TM000274', 'Vanitha Pandian', 'female', '1988-08-08', 166, 'never_married', 'Christian', 'Vellalar Christian', 'Vellalar Christian subcaste', 'no', 'M.C.A', 'M.C.A Graduate', 'Mechanical Engineer', 'Mechanical Engineer Details', '₹15 Lakhs - ₹20 Lakhs', 'Zoho', 'Chennai', 'Chennai', 'Hi, I am Vanitha. I have completed my M.C.A and am currently working as a Mechanical Engineer at Zoho in Chennai. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'joint', 'middle_class', false, false, true, 100, NOW() - INTERVAL '2 days', 'Vishakha', 'Thulaam', 'Viruchigam', 'Vishnu', 'free', 5, 5, 'vegetarian', 'no', 'no'
    ) ON CONFLICT (id) DO UPDATE SET
      profile_id = EXCLUDED.profile_id,
      display_name = EXCLUDED.display_name,
      gender = EXCLUDED.gender,
      date_of_birth = EXCLUDED.date_of_birth,
      height_cm = EXCLUDED.height_cm,
      marital_status = EXCLUDED.marital_status,
      religion = EXCLUDED.religion,
      caste = EXCLUDED.caste,
      subcaste = EXCLUDED.subcaste,
      dosham = EXCLUDED.dosham,
      education = EXCLUDED.education,
      education_detail = EXCLUDED.education_detail,
      occupation = EXCLUDED.occupation,
      occupation_detail = EXCLUDED.occupation_detail,
      annual_income = EXCLUDED.annual_income,
      company_name = EXCLUDED.company_name,
      city = EXCLUDED.city,
      district = EXCLUDED.district,
      about_me = EXCLUDED.about_me,
      family_type = EXCLUDED.family_type,
      family_status = EXCLUDED.family_status,
      is_verified = EXCLUDED.is_verified,
      is_premium = EXCLUDED.is_premium,
      is_profile_complete = EXCLUDED.is_profile_complete,
      profile_completion_percent = EXCLUDED.profile_completion_percent,
      last_active_at = EXCLUDED.last_active_at,
      star = EXCLUDED.star,
      raasi = EXCLUDED.raasi,
      lagnam = EXCLUDED.lagnam,
      gothram = EXCLUDED.gothram,
      tier = EXCLUDED.tier,
      contacts_remaining = EXCLUDED.contacts_remaining,
      interests_remaining = EXCLUDED.interests_remaining,
      food_habit = EXCLUDED.food_habit,
      smoking = EXCLUDED.smoking,
      drinking = EXCLUDED.drinking;
INSERT INTO public.profiles (
      id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at, star, raasi, lagnam, gothram, tier, contacts_remaining, interests_remaining, food_habit, smoking, drinking
    ) VALUES (
      '00000000-0000-4000-a000-000000000113', 'TM000275', 'Jayakumar Selvan', 'male', '1999-02-11', 171, 'never_married', 'Hindu', 'Vellalar', NULL, 'no', 'B.Sc', 'B.Sc Graduate', 'School Teacher', 'School Teacher Details', '₹7 Lakhs - ₹10 Lakhs', 'HCL', 'Kanchipuram', 'Kanchipuram', 'Hi, I am Jayakumar. I have completed my B.Sc and am currently working as a School Teacher at HCL in Kanchipuram. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'joint', 'middle_class', true, true, true, 100, NOW() - INTERVAL '6 days', 'Magha', 'Kumbam', 'Kumbam', 'Siva', 'gold', 50, 100, 'vegetarian', 'no', 'no'
    ) ON CONFLICT (id) DO UPDATE SET
      profile_id = EXCLUDED.profile_id,
      display_name = EXCLUDED.display_name,
      gender = EXCLUDED.gender,
      date_of_birth = EXCLUDED.date_of_birth,
      height_cm = EXCLUDED.height_cm,
      marital_status = EXCLUDED.marital_status,
      religion = EXCLUDED.religion,
      caste = EXCLUDED.caste,
      subcaste = EXCLUDED.subcaste,
      dosham = EXCLUDED.dosham,
      education = EXCLUDED.education,
      education_detail = EXCLUDED.education_detail,
      occupation = EXCLUDED.occupation,
      occupation_detail = EXCLUDED.occupation_detail,
      annual_income = EXCLUDED.annual_income,
      company_name = EXCLUDED.company_name,
      city = EXCLUDED.city,
      district = EXCLUDED.district,
      about_me = EXCLUDED.about_me,
      family_type = EXCLUDED.family_type,
      family_status = EXCLUDED.family_status,
      is_verified = EXCLUDED.is_verified,
      is_premium = EXCLUDED.is_premium,
      is_profile_complete = EXCLUDED.is_profile_complete,
      profile_completion_percent = EXCLUDED.profile_completion_percent,
      last_active_at = EXCLUDED.last_active_at,
      star = EXCLUDED.star,
      raasi = EXCLUDED.raasi,
      lagnam = EXCLUDED.lagnam,
      gothram = EXCLUDED.gothram,
      tier = EXCLUDED.tier,
      contacts_remaining = EXCLUDED.contacts_remaining,
      interests_remaining = EXCLUDED.interests_remaining,
      food_habit = EXCLUDED.food_habit,
      smoking = EXCLUDED.smoking,
      drinking = EXCLUDED.drinking;
INSERT INTO public.profiles (
      id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at, star, raasi, lagnam, gothram, tier, contacts_remaining, interests_remaining, food_habit, smoking, drinking
    ) VALUES (
      '00000000-0000-4000-a000-000000000114', 'TM000276', 'Radha Lingam', 'female', '1999-07-20', 154, 'never_married', 'Hindu', 'Maravar', NULL, 'no', 'M.Com', 'M.Com Graduate', 'School Teacher', 'School Teacher Details', '₹10 Lakhs - ₹15 Lakhs', 'HCL', 'Madurai', 'Madurai', 'Hi, I am Radha. I have completed my M.Com and am currently working as a School Teacher at HCL in Madurai. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'upper_middle_class', true, true, true, 100, NOW() - INTERVAL '7 days', 'Pushya', 'Viruchigam', 'Magaram', 'Viswamitra', 'gold', 50, 100, 'vegetarian', 'no', 'no'
    ) ON CONFLICT (id) DO UPDATE SET
      profile_id = EXCLUDED.profile_id,
      display_name = EXCLUDED.display_name,
      gender = EXCLUDED.gender,
      date_of_birth = EXCLUDED.date_of_birth,
      height_cm = EXCLUDED.height_cm,
      marital_status = EXCLUDED.marital_status,
      religion = EXCLUDED.religion,
      caste = EXCLUDED.caste,
      subcaste = EXCLUDED.subcaste,
      dosham = EXCLUDED.dosham,
      education = EXCLUDED.education,
      education_detail = EXCLUDED.education_detail,
      occupation = EXCLUDED.occupation,
      occupation_detail = EXCLUDED.occupation_detail,
      annual_income = EXCLUDED.annual_income,
      company_name = EXCLUDED.company_name,
      city = EXCLUDED.city,
      district = EXCLUDED.district,
      about_me = EXCLUDED.about_me,
      family_type = EXCLUDED.family_type,
      family_status = EXCLUDED.family_status,
      is_verified = EXCLUDED.is_verified,
      is_premium = EXCLUDED.is_premium,
      is_profile_complete = EXCLUDED.is_profile_complete,
      profile_completion_percent = EXCLUDED.profile_completion_percent,
      last_active_at = EXCLUDED.last_active_at,
      star = EXCLUDED.star,
      raasi = EXCLUDED.raasi,
      lagnam = EXCLUDED.lagnam,
      gothram = EXCLUDED.gothram,
      tier = EXCLUDED.tier,
      contacts_remaining = EXCLUDED.contacts_remaining,
      interests_remaining = EXCLUDED.interests_remaining,
      food_habit = EXCLUDED.food_habit,
      smoking = EXCLUDED.smoking,
      drinking = EXCLUDED.drinking;
INSERT INTO public.profiles (
      id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at, star, raasi, lagnam, gothram, tier, contacts_remaining, interests_remaining, food_habit, smoking, drinking
    ) VALUES (
      '00000000-0000-4000-a000-000000000115', 'TM000277', 'Ramesh Velan', 'male', '2005-08-11', 171, 'never_married', 'Hindu', 'Sengunthar', 'Sengunthar subcaste', 'no', 'B.E. / B.Tech', 'B.E. / B.Tech Graduate', 'HR Specialist', 'HR Specialist Details', '₹7 Lakhs - ₹10 Lakhs', 'Infosys', 'Thanjavur', 'Thanjavur', 'Hi, I am Ramesh. I have completed my B.E. / B.Tech and am currently working as a HR Specialist at Infosys in Thanjavur. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'joint', 'middle_class', true, false, true, 100, NOW() - INTERVAL '3 days', 'Dhanishta', 'Kumbam', 'Rishabam', 'Murugan', 'free', 5, 5, 'vegetarian', 'no', 'no'
    ) ON CONFLICT (id) DO UPDATE SET
      profile_id = EXCLUDED.profile_id,
      display_name = EXCLUDED.display_name,
      gender = EXCLUDED.gender,
      date_of_birth = EXCLUDED.date_of_birth,
      height_cm = EXCLUDED.height_cm,
      marital_status = EXCLUDED.marital_status,
      religion = EXCLUDED.religion,
      caste = EXCLUDED.caste,
      subcaste = EXCLUDED.subcaste,
      dosham = EXCLUDED.dosham,
      education = EXCLUDED.education,
      education_detail = EXCLUDED.education_detail,
      occupation = EXCLUDED.occupation,
      occupation_detail = EXCLUDED.occupation_detail,
      annual_income = EXCLUDED.annual_income,
      company_name = EXCLUDED.company_name,
      city = EXCLUDED.city,
      district = EXCLUDED.district,
      about_me = EXCLUDED.about_me,
      family_type = EXCLUDED.family_type,
      family_status = EXCLUDED.family_status,
      is_verified = EXCLUDED.is_verified,
      is_premium = EXCLUDED.is_premium,
      is_profile_complete = EXCLUDED.is_profile_complete,
      profile_completion_percent = EXCLUDED.profile_completion_percent,
      last_active_at = EXCLUDED.last_active_at,
      star = EXCLUDED.star,
      raasi = EXCLUDED.raasi,
      lagnam = EXCLUDED.lagnam,
      gothram = EXCLUDED.gothram,
      tier = EXCLUDED.tier,
      contacts_remaining = EXCLUDED.contacts_remaining,
      interests_remaining = EXCLUDED.interests_remaining,
      food_habit = EXCLUDED.food_habit,
      smoking = EXCLUDED.smoking,
      drinking = EXCLUDED.drinking;
INSERT INTO public.profiles (
      id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at, star, raasi, lagnam, gothram, tier, contacts_remaining, interests_remaining, food_habit, smoking, drinking
    ) VALUES (
      '00000000-0000-4000-a000-000000000116', 'TM000278', 'Malathi Gopal', 'female', '1999-06-05', 174, 'divorced', 'Hindu', 'Sengunthar', NULL, 'no', 'B.E. / B.Tech', 'B.E. / B.Tech Graduate', 'Dentist', 'Dentist Details', '₹10 Lakhs - ₹15 Lakhs', 'Cognizant', 'Vellore', 'Vellore', 'Hi, I am Malathi. I have completed my B.E. / B.Tech and am currently working as a Dentist at Cognizant in Vellore. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'joint', 'rich', true, true, true, 100, NOW() - INTERVAL '3 days', 'Chitra', 'Kadagam', 'Mithunam', 'Viswamitra', 'gold', 50, 100, 'vegetarian', 'no', 'no'
    ) ON CONFLICT (id) DO UPDATE SET
      profile_id = EXCLUDED.profile_id,
      display_name = EXCLUDED.display_name,
      gender = EXCLUDED.gender,
      date_of_birth = EXCLUDED.date_of_birth,
      height_cm = EXCLUDED.height_cm,
      marital_status = EXCLUDED.marital_status,
      religion = EXCLUDED.religion,
      caste = EXCLUDED.caste,
      subcaste = EXCLUDED.subcaste,
      dosham = EXCLUDED.dosham,
      education = EXCLUDED.education,
      education_detail = EXCLUDED.education_detail,
      occupation = EXCLUDED.occupation,
      occupation_detail = EXCLUDED.occupation_detail,
      annual_income = EXCLUDED.annual_income,
      company_name = EXCLUDED.company_name,
      city = EXCLUDED.city,
      district = EXCLUDED.district,
      about_me = EXCLUDED.about_me,
      family_type = EXCLUDED.family_type,
      family_status = EXCLUDED.family_status,
      is_verified = EXCLUDED.is_verified,
      is_premium = EXCLUDED.is_premium,
      is_profile_complete = EXCLUDED.is_profile_complete,
      profile_completion_percent = EXCLUDED.profile_completion_percent,
      last_active_at = EXCLUDED.last_active_at,
      star = EXCLUDED.star,
      raasi = EXCLUDED.raasi,
      lagnam = EXCLUDED.lagnam,
      gothram = EXCLUDED.gothram,
      tier = EXCLUDED.tier,
      contacts_remaining = EXCLUDED.contacts_remaining,
      interests_remaining = EXCLUDED.interests_remaining,
      food_habit = EXCLUDED.food_habit,
      smoking = EXCLUDED.smoking,
      drinking = EXCLUDED.drinking;
INSERT INTO public.profiles (
      id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at, star, raasi, lagnam, gothram, tier, contacts_remaining, interests_remaining, food_habit, smoking, drinking
    ) VALUES (
      '00000000-0000-4000-a000-000000000117', 'TM000279', 'Thirumal Lingam', 'male', '1999-01-07', 166, 'never_married', 'Hindu', 'Arunthathiyar', 'Arunthathiyar subcaste', 'no', 'B.Sc', 'B.Sc Graduate', 'Auditor', 'Auditor Details', '₹7 Lakhs - ₹10 Lakhs', 'Private Practice', 'Kanchipuram', 'Kanchipuram', 'Hi, I am Thirumal. I have completed my B.Sc and am currently working as a Auditor at Private Practice in Kanchipuram. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'upper_middle_class', true, true, true, 100, NOW() - INTERVAL '6 days', 'Dhanishta', 'Rishabam', 'Viruchigam', 'Murugan', 'gold', 50, 100, 'vegetarian', 'no', 'no'
    ) ON CONFLICT (id) DO UPDATE SET
      profile_id = EXCLUDED.profile_id,
      display_name = EXCLUDED.display_name,
      gender = EXCLUDED.gender,
      date_of_birth = EXCLUDED.date_of_birth,
      height_cm = EXCLUDED.height_cm,
      marital_status = EXCLUDED.marital_status,
      religion = EXCLUDED.religion,
      caste = EXCLUDED.caste,
      subcaste = EXCLUDED.subcaste,
      dosham = EXCLUDED.dosham,
      education = EXCLUDED.education,
      education_detail = EXCLUDED.education_detail,
      occupation = EXCLUDED.occupation,
      occupation_detail = EXCLUDED.occupation_detail,
      annual_income = EXCLUDED.annual_income,
      company_name = EXCLUDED.company_name,
      city = EXCLUDED.city,
      district = EXCLUDED.district,
      about_me = EXCLUDED.about_me,
      family_type = EXCLUDED.family_type,
      family_status = EXCLUDED.family_status,
      is_verified = EXCLUDED.is_verified,
      is_premium = EXCLUDED.is_premium,
      is_profile_complete = EXCLUDED.is_profile_complete,
      profile_completion_percent = EXCLUDED.profile_completion_percent,
      last_active_at = EXCLUDED.last_active_at,
      star = EXCLUDED.star,
      raasi = EXCLUDED.raasi,
      lagnam = EXCLUDED.lagnam,
      gothram = EXCLUDED.gothram,
      tier = EXCLUDED.tier,
      contacts_remaining = EXCLUDED.contacts_remaining,
      interests_remaining = EXCLUDED.interests_remaining,
      food_habit = EXCLUDED.food_habit,
      smoking = EXCLUDED.smoking,
      drinking = EXCLUDED.drinking;
INSERT INTO public.profiles (
      id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at, star, raasi, lagnam, gothram, tier, contacts_remaining, interests_remaining, food_habit, smoking, drinking
    ) VALUES (
      '00000000-0000-4000-a000-000000000118', 'TM000280', 'Parvathi Naicker', 'female', '2002-01-25', 166, 'never_married', 'Hindu', 'Brahmin - Iyer', NULL, 'no', 'B.E. / B.Tech', 'B.E. / B.Tech Graduate', 'Mechanical Engineer', 'Mechanical Engineer Details', '₹5 Lakhs - ₹7 Lakhs', 'Cognizant', 'Tiruppur', 'Tiruppur', 'Hi, I am Parvathi. I have completed my B.E. / B.Tech and am currently working as a Mechanical Engineer at Cognizant in Tiruppur. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'joint', 'upper_middle_class', false, false, true, 100, NOW() - INTERVAL '4 days', 'Rohini', 'Simham', 'Rishabam', 'Siva', 'free', 5, 5, 'vegetarian', 'no', 'no'
    ) ON CONFLICT (id) DO UPDATE SET
      profile_id = EXCLUDED.profile_id,
      display_name = EXCLUDED.display_name,
      gender = EXCLUDED.gender,
      date_of_birth = EXCLUDED.date_of_birth,
      height_cm = EXCLUDED.height_cm,
      marital_status = EXCLUDED.marital_status,
      religion = EXCLUDED.religion,
      caste = EXCLUDED.caste,
      subcaste = EXCLUDED.subcaste,
      dosham = EXCLUDED.dosham,
      education = EXCLUDED.education,
      education_detail = EXCLUDED.education_detail,
      occupation = EXCLUDED.occupation,
      occupation_detail = EXCLUDED.occupation_detail,
      annual_income = EXCLUDED.annual_income,
      company_name = EXCLUDED.company_name,
      city = EXCLUDED.city,
      district = EXCLUDED.district,
      about_me = EXCLUDED.about_me,
      family_type = EXCLUDED.family_type,
      family_status = EXCLUDED.family_status,
      is_verified = EXCLUDED.is_verified,
      is_premium = EXCLUDED.is_premium,
      is_profile_complete = EXCLUDED.is_profile_complete,
      profile_completion_percent = EXCLUDED.profile_completion_percent,
      last_active_at = EXCLUDED.last_active_at,
      star = EXCLUDED.star,
      raasi = EXCLUDED.raasi,
      lagnam = EXCLUDED.lagnam,
      gothram = EXCLUDED.gothram,
      tier = EXCLUDED.tier,
      contacts_remaining = EXCLUDED.contacts_remaining,
      interests_remaining = EXCLUDED.interests_remaining,
      food_habit = EXCLUDED.food_habit,
      smoking = EXCLUDED.smoking,
      drinking = EXCLUDED.drinking;
INSERT INTO public.profiles (
      id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at, star, raasi, lagnam, gothram, tier, contacts_remaining, interests_remaining, food_habit, smoking, drinking
    ) VALUES (
      '00000000-0000-4000-a000-000000000119', 'TM000281', 'Murugan Swamy', 'male', '1994-07-17', 184, 'never_married', 'Hindu', 'Maravar', NULL, 'no', 'M.B.B.S', 'M.B.B.S Graduate', 'Architect', 'Architect Details', '₹7 Lakhs - ₹10 Lakhs', 'Wipro', 'Vellore', 'Vellore', 'Hi, I am Murugan. I have completed my M.B.B.S and am currently working as a Architect at Wipro in Vellore. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'middle_class', true, false, true, 100, NOW() - INTERVAL '3 days', 'Poorvashadha', 'Kadagam', 'Simham', 'Kasyapa', 'free', 5, 5, 'vegetarian', 'no', 'no'
    ) ON CONFLICT (id) DO UPDATE SET
      profile_id = EXCLUDED.profile_id,
      display_name = EXCLUDED.display_name,
      gender = EXCLUDED.gender,
      date_of_birth = EXCLUDED.date_of_birth,
      height_cm = EXCLUDED.height_cm,
      marital_status = EXCLUDED.marital_status,
      religion = EXCLUDED.religion,
      caste = EXCLUDED.caste,
      subcaste = EXCLUDED.subcaste,
      dosham = EXCLUDED.dosham,
      education = EXCLUDED.education,
      education_detail = EXCLUDED.education_detail,
      occupation = EXCLUDED.occupation,
      occupation_detail = EXCLUDED.occupation_detail,
      annual_income = EXCLUDED.annual_income,
      company_name = EXCLUDED.company_name,
      city = EXCLUDED.city,
      district = EXCLUDED.district,
      about_me = EXCLUDED.about_me,
      family_type = EXCLUDED.family_type,
      family_status = EXCLUDED.family_status,
      is_verified = EXCLUDED.is_verified,
      is_premium = EXCLUDED.is_premium,
      is_profile_complete = EXCLUDED.is_profile_complete,
      profile_completion_percent = EXCLUDED.profile_completion_percent,
      last_active_at = EXCLUDED.last_active_at,
      star = EXCLUDED.star,
      raasi = EXCLUDED.raasi,
      lagnam = EXCLUDED.lagnam,
      gothram = EXCLUDED.gothram,
      tier = EXCLUDED.tier,
      contacts_remaining = EXCLUDED.contacts_remaining,
      interests_remaining = EXCLUDED.interests_remaining,
      food_habit = EXCLUDED.food_habit,
      smoking = EXCLUDED.smoking,
      drinking = EXCLUDED.drinking;
INSERT INTO public.profiles (
      id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at, star, raasi, lagnam, gothram, tier, contacts_remaining, interests_remaining, food_habit, smoking, drinking
    ) VALUES (
      '00000000-0000-4000-a000-00000000011a', 'TM000282', 'Abirami Pandian', 'female', '1989-07-19', 152, 'never_married', 'Muslim', 'Marakayar', NULL, 'no', 'M.B.B.S', 'M.B.B.S Graduate', 'Government Officer', 'Government Officer Details', '₹7 Lakhs - ₹10 Lakhs', 'Infosys', 'Thoothukudi', 'Tuticorin', 'Hi, I am Abirami. I have completed my M.B.B.S and am currently working as a Government Officer at Infosys in Thoothukudi. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'joint', 'upper_middle_class', true, false, true, 100, NOW() - INTERVAL '4 days', 'Bharani', 'Rishabam', 'Magaram', 'Harita', 'free', 5, 5, 'vegetarian', 'no', 'no'
    ) ON CONFLICT (id) DO UPDATE SET
      profile_id = EXCLUDED.profile_id,
      display_name = EXCLUDED.display_name,
      gender = EXCLUDED.gender,
      date_of_birth = EXCLUDED.date_of_birth,
      height_cm = EXCLUDED.height_cm,
      marital_status = EXCLUDED.marital_status,
      religion = EXCLUDED.religion,
      caste = EXCLUDED.caste,
      subcaste = EXCLUDED.subcaste,
      dosham = EXCLUDED.dosham,
      education = EXCLUDED.education,
      education_detail = EXCLUDED.education_detail,
      occupation = EXCLUDED.occupation,
      occupation_detail = EXCLUDED.occupation_detail,
      annual_income = EXCLUDED.annual_income,
      company_name = EXCLUDED.company_name,
      city = EXCLUDED.city,
      district = EXCLUDED.district,
      about_me = EXCLUDED.about_me,
      family_type = EXCLUDED.family_type,
      family_status = EXCLUDED.family_status,
      is_verified = EXCLUDED.is_verified,
      is_premium = EXCLUDED.is_premium,
      is_profile_complete = EXCLUDED.is_profile_complete,
      profile_completion_percent = EXCLUDED.profile_completion_percent,
      last_active_at = EXCLUDED.last_active_at,
      star = EXCLUDED.star,
      raasi = EXCLUDED.raasi,
      lagnam = EXCLUDED.lagnam,
      gothram = EXCLUDED.gothram,
      tier = EXCLUDED.tier,
      contacts_remaining = EXCLUDED.contacts_remaining,
      interests_remaining = EXCLUDED.interests_remaining,
      food_habit = EXCLUDED.food_habit,
      smoking = EXCLUDED.smoking,
      drinking = EXCLUDED.drinking;
INSERT INTO public.profiles (
      id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at, star, raasi, lagnam, gothram, tier, contacts_remaining, interests_remaining, food_habit, smoking, drinking
    ) VALUES (
      '00000000-0000-4000-a000-00000000011b', 'TM000283', 'Murugan Lingam', 'male', '2001-11-11', 182, 'never_married', 'Muslim', 'Marakayar', NULL, 'no', 'B.Ed', 'B.Ed Graduate', 'Architect', 'Architect Details', '₹7 Lakhs - ₹10 Lakhs', 'Wipro', 'Vellore', 'Vellore', 'Hi, I am Murugan. I have completed my B.Ed and am currently working as a Architect at Wipro in Vellore. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'rich', false, false, true, 100, NOW() - INTERVAL '2 days', 'Uttaraphalguni', 'Kadagam', 'Magaram', 'Siva', 'free', 5, 5, 'vegetarian', 'no', 'no'
    ) ON CONFLICT (id) DO UPDATE SET
      profile_id = EXCLUDED.profile_id,
      display_name = EXCLUDED.display_name,
      gender = EXCLUDED.gender,
      date_of_birth = EXCLUDED.date_of_birth,
      height_cm = EXCLUDED.height_cm,
      marital_status = EXCLUDED.marital_status,
      religion = EXCLUDED.religion,
      caste = EXCLUDED.caste,
      subcaste = EXCLUDED.subcaste,
      dosham = EXCLUDED.dosham,
      education = EXCLUDED.education,
      education_detail = EXCLUDED.education_detail,
      occupation = EXCLUDED.occupation,
      occupation_detail = EXCLUDED.occupation_detail,
      annual_income = EXCLUDED.annual_income,
      company_name = EXCLUDED.company_name,
      city = EXCLUDED.city,
      district = EXCLUDED.district,
      about_me = EXCLUDED.about_me,
      family_type = EXCLUDED.family_type,
      family_status = EXCLUDED.family_status,
      is_verified = EXCLUDED.is_verified,
      is_premium = EXCLUDED.is_premium,
      is_profile_complete = EXCLUDED.is_profile_complete,
      profile_completion_percent = EXCLUDED.profile_completion_percent,
      last_active_at = EXCLUDED.last_active_at,
      star = EXCLUDED.star,
      raasi = EXCLUDED.raasi,
      lagnam = EXCLUDED.lagnam,
      gothram = EXCLUDED.gothram,
      tier = EXCLUDED.tier,
      contacts_remaining = EXCLUDED.contacts_remaining,
      interests_remaining = EXCLUDED.interests_remaining,
      food_habit = EXCLUDED.food_habit,
      smoking = EXCLUDED.smoking,
      drinking = EXCLUDED.drinking;
INSERT INTO public.profiles (
      id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at, star, raasi, lagnam, gothram, tier, contacts_remaining, interests_remaining, food_habit, smoking, drinking
    ) VALUES (
      '00000000-0000-4000-a000-00000000011c', 'TM000284', 'Shanthi Raman', 'female', '1990-01-10', 171, 'never_married', 'Hindu', 'Agamudayar', 'Agamudayar subcaste', 'no', 'B.Ed', 'B.Ed Graduate', 'Civil Engineer', 'Civil Engineer Details', '₹7 Lakhs - ₹10 Lakhs', 'HCL', 'Tiruchirappalli', 'Trichy', 'Hi, I am Shanthi. I have completed my B.Ed and am currently working as a Civil Engineer at HCL in Tiruchirappalli. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'rich', true, false, true, 100, NOW() - INTERVAL '6 days', 'Punarvasu', 'Rishabam', 'Kadagam', 'Murugan', 'free', 5, 5, 'vegetarian', 'no', 'no'
    ) ON CONFLICT (id) DO UPDATE SET
      profile_id = EXCLUDED.profile_id,
      display_name = EXCLUDED.display_name,
      gender = EXCLUDED.gender,
      date_of_birth = EXCLUDED.date_of_birth,
      height_cm = EXCLUDED.height_cm,
      marital_status = EXCLUDED.marital_status,
      religion = EXCLUDED.religion,
      caste = EXCLUDED.caste,
      subcaste = EXCLUDED.subcaste,
      dosham = EXCLUDED.dosham,
      education = EXCLUDED.education,
      education_detail = EXCLUDED.education_detail,
      occupation = EXCLUDED.occupation,
      occupation_detail = EXCLUDED.occupation_detail,
      annual_income = EXCLUDED.annual_income,
      company_name = EXCLUDED.company_name,
      city = EXCLUDED.city,
      district = EXCLUDED.district,
      about_me = EXCLUDED.about_me,
      family_type = EXCLUDED.family_type,
      family_status = EXCLUDED.family_status,
      is_verified = EXCLUDED.is_verified,
      is_premium = EXCLUDED.is_premium,
      is_profile_complete = EXCLUDED.is_profile_complete,
      profile_completion_percent = EXCLUDED.profile_completion_percent,
      last_active_at = EXCLUDED.last_active_at,
      star = EXCLUDED.star,
      raasi = EXCLUDED.raasi,
      lagnam = EXCLUDED.lagnam,
      gothram = EXCLUDED.gothram,
      tier = EXCLUDED.tier,
      contacts_remaining = EXCLUDED.contacts_remaining,
      interests_remaining = EXCLUDED.interests_remaining,
      food_habit = EXCLUDED.food_habit,
      smoking = EXCLUDED.smoking,
      drinking = EXCLUDED.drinking;
INSERT INTO public.profiles (
      id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at, star, raasi, lagnam, gothram, tier, contacts_remaining, interests_remaining, food_habit, smoking, drinking
    ) VALUES (
      '00000000-0000-4000-a000-00000000011d', 'TM000285', 'Naveen Velan', 'male', '1997-07-08', 167, 'never_married', 'Hindu', 'Gounder', 'Gounder subcaste', 'no', 'B.A', 'B.A Graduate', 'Auditor', 'Auditor Details', '₹20 Lakhs+', 'Cognizant', 'Thanjavur', 'Thanjavur', 'Hi, I am Naveen. I have completed my B.A and am currently working as a Auditor at Cognizant in Thanjavur. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'rich', false, false, true, 100, NOW() - INTERVAL '9 days', 'Bharani', 'Simham', 'Kadagam', 'Vashishta', 'free', 5, 5, 'vegetarian', 'no', 'no'
    ) ON CONFLICT (id) DO UPDATE SET
      profile_id = EXCLUDED.profile_id,
      display_name = EXCLUDED.display_name,
      gender = EXCLUDED.gender,
      date_of_birth = EXCLUDED.date_of_birth,
      height_cm = EXCLUDED.height_cm,
      marital_status = EXCLUDED.marital_status,
      religion = EXCLUDED.religion,
      caste = EXCLUDED.caste,
      subcaste = EXCLUDED.subcaste,
      dosham = EXCLUDED.dosham,
      education = EXCLUDED.education,
      education_detail = EXCLUDED.education_detail,
      occupation = EXCLUDED.occupation,
      occupation_detail = EXCLUDED.occupation_detail,
      annual_income = EXCLUDED.annual_income,
      company_name = EXCLUDED.company_name,
      city = EXCLUDED.city,
      district = EXCLUDED.district,
      about_me = EXCLUDED.about_me,
      family_type = EXCLUDED.family_type,
      family_status = EXCLUDED.family_status,
      is_verified = EXCLUDED.is_verified,
      is_premium = EXCLUDED.is_premium,
      is_profile_complete = EXCLUDED.is_profile_complete,
      profile_completion_percent = EXCLUDED.profile_completion_percent,
      last_active_at = EXCLUDED.last_active_at,
      star = EXCLUDED.star,
      raasi = EXCLUDED.raasi,
      lagnam = EXCLUDED.lagnam,
      gothram = EXCLUDED.gothram,
      tier = EXCLUDED.tier,
      contacts_remaining = EXCLUDED.contacts_remaining,
      interests_remaining = EXCLUDED.interests_remaining,
      food_habit = EXCLUDED.food_habit,
      smoking = EXCLUDED.smoking,
      drinking = EXCLUDED.drinking;
INSERT INTO public.profiles (
      id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at, star, raasi, lagnam, gothram, tier, contacts_remaining, interests_remaining, food_habit, smoking, drinking
    ) VALUES (
      '00000000-0000-4000-a000-00000000011e', 'TM000286', 'Ramya Samy', 'female', '1997-12-28', 165, 'never_married', 'Hindu', 'Adi Dravida', 'Adi Dravida subcaste', 'no', 'B.Com', 'B.Com Graduate', 'Software Engineer', 'Software Engineer Details', '₹20 Lakhs+', 'Accenture', 'Chennai', 'Chennai', 'Hi, I am Ramya. I have completed my B.Com and am currently working as a Software Engineer at Accenture in Chennai. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'upper_middle_class', true, false, true, 100, NOW() - INTERVAL '2 days', 'Shatabhisha', 'Kumbam', 'Kanni', 'Vashishta', 'free', 5, 5, 'vegetarian', 'no', 'no'
    ) ON CONFLICT (id) DO UPDATE SET
      profile_id = EXCLUDED.profile_id,
      display_name = EXCLUDED.display_name,
      gender = EXCLUDED.gender,
      date_of_birth = EXCLUDED.date_of_birth,
      height_cm = EXCLUDED.height_cm,
      marital_status = EXCLUDED.marital_status,
      religion = EXCLUDED.religion,
      caste = EXCLUDED.caste,
      subcaste = EXCLUDED.subcaste,
      dosham = EXCLUDED.dosham,
      education = EXCLUDED.education,
      education_detail = EXCLUDED.education_detail,
      occupation = EXCLUDED.occupation,
      occupation_detail = EXCLUDED.occupation_detail,
      annual_income = EXCLUDED.annual_income,
      company_name = EXCLUDED.company_name,
      city = EXCLUDED.city,
      district = EXCLUDED.district,
      about_me = EXCLUDED.about_me,
      family_type = EXCLUDED.family_type,
      family_status = EXCLUDED.family_status,
      is_verified = EXCLUDED.is_verified,
      is_premium = EXCLUDED.is_premium,
      is_profile_complete = EXCLUDED.is_profile_complete,
      profile_completion_percent = EXCLUDED.profile_completion_percent,
      last_active_at = EXCLUDED.last_active_at,
      star = EXCLUDED.star,
      raasi = EXCLUDED.raasi,
      lagnam = EXCLUDED.lagnam,
      gothram = EXCLUDED.gothram,
      tier = EXCLUDED.tier,
      contacts_remaining = EXCLUDED.contacts_remaining,
      interests_remaining = EXCLUDED.interests_remaining,
      food_habit = EXCLUDED.food_habit,
      smoking = EXCLUDED.smoking,
      drinking = EXCLUDED.drinking;
INSERT INTO public.profiles (
      id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at, star, raasi, lagnam, gothram, tier, contacts_remaining, interests_remaining, food_habit, smoking, drinking
    ) VALUES (
      '00000000-0000-4000-a000-00000000011f', 'TM000287', 'Murugan Kumar', 'male', '1990-06-03', 182, 'never_married', 'Hindu', 'Mudaliar', NULL, 'yes', 'B.E. / B.Tech', 'B.E. / B.Tech Graduate', 'Doctor', 'Doctor Details', '₹3 Lakhs - ₹5 Lakhs', 'Zoho', 'Erode', 'Erode', 'Hi, I am Murugan. I have completed my B.E. / B.Tech and am currently working as a Doctor at Zoho in Erode. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'joint', 'rich', false, false, true, 100, NOW() - INTERVAL '7 days', 'Poorvabhadrapada', 'Kadagam', 'Rishabam', 'Agastya', 'free', 5, 5, 'vegetarian', 'no', 'no'
    ) ON CONFLICT (id) DO UPDATE SET
      profile_id = EXCLUDED.profile_id,
      display_name = EXCLUDED.display_name,
      gender = EXCLUDED.gender,
      date_of_birth = EXCLUDED.date_of_birth,
      height_cm = EXCLUDED.height_cm,
      marital_status = EXCLUDED.marital_status,
      religion = EXCLUDED.religion,
      caste = EXCLUDED.caste,
      subcaste = EXCLUDED.subcaste,
      dosham = EXCLUDED.dosham,
      education = EXCLUDED.education,
      education_detail = EXCLUDED.education_detail,
      occupation = EXCLUDED.occupation,
      occupation_detail = EXCLUDED.occupation_detail,
      annual_income = EXCLUDED.annual_income,
      company_name = EXCLUDED.company_name,
      city = EXCLUDED.city,
      district = EXCLUDED.district,
      about_me = EXCLUDED.about_me,
      family_type = EXCLUDED.family_type,
      family_status = EXCLUDED.family_status,
      is_verified = EXCLUDED.is_verified,
      is_premium = EXCLUDED.is_premium,
      is_profile_complete = EXCLUDED.is_profile_complete,
      profile_completion_percent = EXCLUDED.profile_completion_percent,
      last_active_at = EXCLUDED.last_active_at,
      star = EXCLUDED.star,
      raasi = EXCLUDED.raasi,
      lagnam = EXCLUDED.lagnam,
      gothram = EXCLUDED.gothram,
      tier = EXCLUDED.tier,
      contacts_remaining = EXCLUDED.contacts_remaining,
      interests_remaining = EXCLUDED.interests_remaining,
      food_habit = EXCLUDED.food_habit,
      smoking = EXCLUDED.smoking,
      drinking = EXCLUDED.drinking;
INSERT INTO public.profiles (
      id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at, star, raasi, lagnam, gothram, tier, contacts_remaining, interests_remaining, food_habit, smoking, drinking
    ) VALUES (
      '00000000-0000-4000-a000-000000000120', 'TM000288', 'Archana Devan', 'female', '2004-05-04', 167, 'divorced', 'Hindu', 'Devendra Kula Vellalar', 'Devendra Kula Vellalar subcaste', 'no', 'M.C.A', 'M.C.A Graduate', 'Pharmacist', 'Pharmacist Details', '₹20 Lakhs+', 'Government Service', 'Coimbatore', 'Coimbatore', 'Hi, I am Archana. I have completed my M.C.A and am currently working as a Pharmacist at Government Service in Coimbatore. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'middle_class', false, false, true, 100, NOW() - INTERVAL '9 days', 'Ashwini', 'Kumbam', 'Meenam', 'Siva', 'free', 5, 5, 'vegetarian', 'no', 'no'
    ) ON CONFLICT (id) DO UPDATE SET
      profile_id = EXCLUDED.profile_id,
      display_name = EXCLUDED.display_name,
      gender = EXCLUDED.gender,
      date_of_birth = EXCLUDED.date_of_birth,
      height_cm = EXCLUDED.height_cm,
      marital_status = EXCLUDED.marital_status,
      religion = EXCLUDED.religion,
      caste = EXCLUDED.caste,
      subcaste = EXCLUDED.subcaste,
      dosham = EXCLUDED.dosham,
      education = EXCLUDED.education,
      education_detail = EXCLUDED.education_detail,
      occupation = EXCLUDED.occupation,
      occupation_detail = EXCLUDED.occupation_detail,
      annual_income = EXCLUDED.annual_income,
      company_name = EXCLUDED.company_name,
      city = EXCLUDED.city,
      district = EXCLUDED.district,
      about_me = EXCLUDED.about_me,
      family_type = EXCLUDED.family_type,
      family_status = EXCLUDED.family_status,
      is_verified = EXCLUDED.is_verified,
      is_premium = EXCLUDED.is_premium,
      is_profile_complete = EXCLUDED.is_profile_complete,
      profile_completion_percent = EXCLUDED.profile_completion_percent,
      last_active_at = EXCLUDED.last_active_at,
      star = EXCLUDED.star,
      raasi = EXCLUDED.raasi,
      lagnam = EXCLUDED.lagnam,
      gothram = EXCLUDED.gothram,
      tier = EXCLUDED.tier,
      contacts_remaining = EXCLUDED.contacts_remaining,
      interests_remaining = EXCLUDED.interests_remaining,
      food_habit = EXCLUDED.food_habit,
      smoking = EXCLUDED.smoking,
      drinking = EXCLUDED.drinking;
INSERT INTO public.profiles (
      id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at, star, raasi, lagnam, gothram, tier, contacts_remaining, interests_remaining, food_habit, smoking, drinking
    ) VALUES (
      '00000000-0000-4000-a000-000000000121', 'TM000289', 'Kannan Selvan', 'male', '1991-08-07', 184, 'never_married', 'Hindu', 'Yadav', NULL, 'no', 'M.C.A', 'M.C.A Graduate', 'Pharmacist', 'Pharmacist Details', '₹7 Lakhs - ₹10 Lakhs', 'Private Practice', 'Salem', 'Salem', 'Hi, I am Kannan. I have completed my M.C.A and am currently working as a Pharmacist at Private Practice in Salem. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'joint', 'middle_class', false, false, true, 100, NOW() - INTERVAL '7 days', 'Mirgashira', 'Kadagam', 'Simham', 'Viswamitra', 'free', 5, 5, 'vegetarian', 'no', 'no'
    ) ON CONFLICT (id) DO UPDATE SET
      profile_id = EXCLUDED.profile_id,
      display_name = EXCLUDED.display_name,
      gender = EXCLUDED.gender,
      date_of_birth = EXCLUDED.date_of_birth,
      height_cm = EXCLUDED.height_cm,
      marital_status = EXCLUDED.marital_status,
      religion = EXCLUDED.religion,
      caste = EXCLUDED.caste,
      subcaste = EXCLUDED.subcaste,
      dosham = EXCLUDED.dosham,
      education = EXCLUDED.education,
      education_detail = EXCLUDED.education_detail,
      occupation = EXCLUDED.occupation,
      occupation_detail = EXCLUDED.occupation_detail,
      annual_income = EXCLUDED.annual_income,
      company_name = EXCLUDED.company_name,
      city = EXCLUDED.city,
      district = EXCLUDED.district,
      about_me = EXCLUDED.about_me,
      family_type = EXCLUDED.family_type,
      family_status = EXCLUDED.family_status,
      is_verified = EXCLUDED.is_verified,
      is_premium = EXCLUDED.is_premium,
      is_profile_complete = EXCLUDED.is_profile_complete,
      profile_completion_percent = EXCLUDED.profile_completion_percent,
      last_active_at = EXCLUDED.last_active_at,
      star = EXCLUDED.star,
      raasi = EXCLUDED.raasi,
      lagnam = EXCLUDED.lagnam,
      gothram = EXCLUDED.gothram,
      tier = EXCLUDED.tier,
      contacts_remaining = EXCLUDED.contacts_remaining,
      interests_remaining = EXCLUDED.interests_remaining,
      food_habit = EXCLUDED.food_habit,
      smoking = EXCLUDED.smoking,
      drinking = EXCLUDED.drinking;
INSERT INTO public.profiles (
      id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at, star, raasi, lagnam, gothram, tier, contacts_remaining, interests_remaining, food_habit, smoking, drinking
    ) VALUES (
      '00000000-0000-4000-a000-000000000122', 'TM000290', 'Sandhya Samy', 'female', '2004-09-17', 165, 'never_married', 'Hindu', 'Naicker', NULL, 'no', 'M.C.A', 'M.C.A Graduate', 'Civil Engineer', 'Civil Engineer Details', '₹20 Lakhs+', 'HCL', 'Tiruppur', 'Tiruppur', 'Hi, I am Sandhya. I have completed my M.C.A and am currently working as a Civil Engineer at HCL in Tiruppur. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'upper_middle_class', false, false, true, 100, NOW() - INTERVAL '4 days', 'Rohini', 'Dhanusu', 'Mithunam', 'Harita', 'free', 5, 5, 'vegetarian', 'no', 'no'
    ) ON CONFLICT (id) DO UPDATE SET
      profile_id = EXCLUDED.profile_id,
      display_name = EXCLUDED.display_name,
      gender = EXCLUDED.gender,
      date_of_birth = EXCLUDED.date_of_birth,
      height_cm = EXCLUDED.height_cm,
      marital_status = EXCLUDED.marital_status,
      religion = EXCLUDED.religion,
      caste = EXCLUDED.caste,
      subcaste = EXCLUDED.subcaste,
      dosham = EXCLUDED.dosham,
      education = EXCLUDED.education,
      education_detail = EXCLUDED.education_detail,
      occupation = EXCLUDED.occupation,
      occupation_detail = EXCLUDED.occupation_detail,
      annual_income = EXCLUDED.annual_income,
      company_name = EXCLUDED.company_name,
      city = EXCLUDED.city,
      district = EXCLUDED.district,
      about_me = EXCLUDED.about_me,
      family_type = EXCLUDED.family_type,
      family_status = EXCLUDED.family_status,
      is_verified = EXCLUDED.is_verified,
      is_premium = EXCLUDED.is_premium,
      is_profile_complete = EXCLUDED.is_profile_complete,
      profile_completion_percent = EXCLUDED.profile_completion_percent,
      last_active_at = EXCLUDED.last_active_at,
      star = EXCLUDED.star,
      raasi = EXCLUDED.raasi,
      lagnam = EXCLUDED.lagnam,
      gothram = EXCLUDED.gothram,
      tier = EXCLUDED.tier,
      contacts_remaining = EXCLUDED.contacts_remaining,
      interests_remaining = EXCLUDED.interests_remaining,
      food_habit = EXCLUDED.food_habit,
      smoking = EXCLUDED.smoking,
      drinking = EXCLUDED.drinking;
INSERT INTO public.profiles (
      id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at, star, raasi, lagnam, gothram, tier, contacts_remaining, interests_remaining, food_habit, smoking, drinking
    ) VALUES (
      '00000000-0000-4000-a000-000000000123', 'TM000291', 'Prabhu Murthy', 'male', '1995-12-23', 171, 'never_married', 'Hindu', 'Nadar', 'Nadar subcaste', 'yes', 'M.Sc', 'M.Sc Graduate', 'HR Specialist', 'HR Specialist Details', '₹20 Lakhs+', 'TCS', 'Thoothukudi', 'Tuticorin', 'Hi, I am Prabhu. I have completed my M.Sc and am currently working as a HR Specialist at TCS in Thoothukudi. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'middle_class', true, false, true, 100, NOW() - INTERVAL '5 days', 'Uttaraphalguni', 'Magaram', 'Meenam', 'Viswamitra', 'free', 5, 5, 'vegetarian', 'no', 'no'
    ) ON CONFLICT (id) DO UPDATE SET
      profile_id = EXCLUDED.profile_id,
      display_name = EXCLUDED.display_name,
      gender = EXCLUDED.gender,
      date_of_birth = EXCLUDED.date_of_birth,
      height_cm = EXCLUDED.height_cm,
      marital_status = EXCLUDED.marital_status,
      religion = EXCLUDED.religion,
      caste = EXCLUDED.caste,
      subcaste = EXCLUDED.subcaste,
      dosham = EXCLUDED.dosham,
      education = EXCLUDED.education,
      education_detail = EXCLUDED.education_detail,
      occupation = EXCLUDED.occupation,
      occupation_detail = EXCLUDED.occupation_detail,
      annual_income = EXCLUDED.annual_income,
      company_name = EXCLUDED.company_name,
      city = EXCLUDED.city,
      district = EXCLUDED.district,
      about_me = EXCLUDED.about_me,
      family_type = EXCLUDED.family_type,
      family_status = EXCLUDED.family_status,
      is_verified = EXCLUDED.is_verified,
      is_premium = EXCLUDED.is_premium,
      is_profile_complete = EXCLUDED.is_profile_complete,
      profile_completion_percent = EXCLUDED.profile_completion_percent,
      last_active_at = EXCLUDED.last_active_at,
      star = EXCLUDED.star,
      raasi = EXCLUDED.raasi,
      lagnam = EXCLUDED.lagnam,
      gothram = EXCLUDED.gothram,
      tier = EXCLUDED.tier,
      contacts_remaining = EXCLUDED.contacts_remaining,
      interests_remaining = EXCLUDED.interests_remaining,
      food_habit = EXCLUDED.food_habit,
      smoking = EXCLUDED.smoking,
      drinking = EXCLUDED.drinking;
INSERT INTO public.profiles (
      id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at, star, raasi, lagnam, gothram, tier, contacts_remaining, interests_remaining, food_habit, smoking, drinking
    ) VALUES (
      '00000000-0000-4000-a000-000000000124', 'TM000292', 'Radha Samy', 'female', '2003-04-15', 167, 'never_married', 'Christian', 'Protestant Christian', NULL, 'no', 'M.A', 'M.A Graduate', 'Pharmacist', 'Pharmacist Details', '₹3 Lakhs - ₹5 Lakhs', 'Zoho', 'Coimbatore', 'Coimbatore', 'Hi, I am Radha. I have completed my M.A and am currently working as a Pharmacist at Zoho in Coimbatore. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'upper_middle_class', true, false, true, 100, NOW() - INTERVAL '6 days', 'Uttarabhadrapada', 'Magaram', 'Meenam', 'Vishnu', 'free', 5, 5, 'vegetarian', 'no', 'no'
    ) ON CONFLICT (id) DO UPDATE SET
      profile_id = EXCLUDED.profile_id,
      display_name = EXCLUDED.display_name,
      gender = EXCLUDED.gender,
      date_of_birth = EXCLUDED.date_of_birth,
      height_cm = EXCLUDED.height_cm,
      marital_status = EXCLUDED.marital_status,
      religion = EXCLUDED.religion,
      caste = EXCLUDED.caste,
      subcaste = EXCLUDED.subcaste,
      dosham = EXCLUDED.dosham,
      education = EXCLUDED.education,
      education_detail = EXCLUDED.education_detail,
      occupation = EXCLUDED.occupation,
      occupation_detail = EXCLUDED.occupation_detail,
      annual_income = EXCLUDED.annual_income,
      company_name = EXCLUDED.company_name,
      city = EXCLUDED.city,
      district = EXCLUDED.district,
      about_me = EXCLUDED.about_me,
      family_type = EXCLUDED.family_type,
      family_status = EXCLUDED.family_status,
      is_verified = EXCLUDED.is_verified,
      is_premium = EXCLUDED.is_premium,
      is_profile_complete = EXCLUDED.is_profile_complete,
      profile_completion_percent = EXCLUDED.profile_completion_percent,
      last_active_at = EXCLUDED.last_active_at,
      star = EXCLUDED.star,
      raasi = EXCLUDED.raasi,
      lagnam = EXCLUDED.lagnam,
      gothram = EXCLUDED.gothram,
      tier = EXCLUDED.tier,
      contacts_remaining = EXCLUDED.contacts_remaining,
      interests_remaining = EXCLUDED.interests_remaining,
      food_habit = EXCLUDED.food_habit,
      smoking = EXCLUDED.smoking,
      drinking = EXCLUDED.drinking;
INSERT INTO public.profiles (
      id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at, star, raasi, lagnam, gothram, tier, contacts_remaining, interests_remaining, food_habit, smoking, drinking
    ) VALUES (
      '00000000-0000-4000-a000-000000000125', 'TM000293', 'Rajesh Sundaram', 'male', '2005-08-21', 181, 'never_married', 'Hindu', 'Gounder', 'Gounder subcaste', 'yes', 'B.Ed', 'B.Ed Graduate', 'Software Engineer', 'Software Engineer Details', '₹3 Lakhs - ₹5 Lakhs', 'Accenture', 'Tiruchirappalli', 'Trichy', 'Hi, I am Rajesh. I have completed my B.Ed and am currently working as a Software Engineer at Accenture in Tiruchirappalli. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'joint', 'rich', true, false, true, 100, NOW() - INTERVAL '6 days', 'Punarvasu', 'Viruchigam', 'Kumbam', 'Siva', 'free', 5, 5, 'vegetarian', 'no', 'no'
    ) ON CONFLICT (id) DO UPDATE SET
      profile_id = EXCLUDED.profile_id,
      display_name = EXCLUDED.display_name,
      gender = EXCLUDED.gender,
      date_of_birth = EXCLUDED.date_of_birth,
      height_cm = EXCLUDED.height_cm,
      marital_status = EXCLUDED.marital_status,
      religion = EXCLUDED.religion,
      caste = EXCLUDED.caste,
      subcaste = EXCLUDED.subcaste,
      dosham = EXCLUDED.dosham,
      education = EXCLUDED.education,
      education_detail = EXCLUDED.education_detail,
      occupation = EXCLUDED.occupation,
      occupation_detail = EXCLUDED.occupation_detail,
      annual_income = EXCLUDED.annual_income,
      company_name = EXCLUDED.company_name,
      city = EXCLUDED.city,
      district = EXCLUDED.district,
      about_me = EXCLUDED.about_me,
      family_type = EXCLUDED.family_type,
      family_status = EXCLUDED.family_status,
      is_verified = EXCLUDED.is_verified,
      is_premium = EXCLUDED.is_premium,
      is_profile_complete = EXCLUDED.is_profile_complete,
      profile_completion_percent = EXCLUDED.profile_completion_percent,
      last_active_at = EXCLUDED.last_active_at,
      star = EXCLUDED.star,
      raasi = EXCLUDED.raasi,
      lagnam = EXCLUDED.lagnam,
      gothram = EXCLUDED.gothram,
      tier = EXCLUDED.tier,
      contacts_remaining = EXCLUDED.contacts_remaining,
      interests_remaining = EXCLUDED.interests_remaining,
      food_habit = EXCLUDED.food_habit,
      smoking = EXCLUDED.smoking,
      drinking = EXCLUDED.drinking;
INSERT INTO public.profiles (
      id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at, star, raasi, lagnam, gothram, tier, contacts_remaining, interests_remaining, food_habit, smoking, drinking
    ) VALUES (
      '00000000-0000-4000-a000-000000000126', 'TM000294', 'Megala Shankar', 'female', '1999-10-04', 153, 'never_married', 'Hindu', 'Mudaliar', 'Mudaliar subcaste', 'no', 'M.Com', 'M.Com Graduate', 'Pharmacist', 'Pharmacist Details', '₹20 Lakhs+', 'Private Practice', 'Thoothukudi', 'Tuticorin', 'Hi, I am Megala. I have completed my M.Com and am currently working as a Pharmacist at Private Practice in Thoothukudi. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'joint', 'middle_class', false, false, true, 100, NOW() - INTERVAL '8 days', 'Revati', 'Viruchigam', 'Simham', 'Siva', 'free', 5, 5, 'vegetarian', 'no', 'no'
    ) ON CONFLICT (id) DO UPDATE SET
      profile_id = EXCLUDED.profile_id,
      display_name = EXCLUDED.display_name,
      gender = EXCLUDED.gender,
      date_of_birth = EXCLUDED.date_of_birth,
      height_cm = EXCLUDED.height_cm,
      marital_status = EXCLUDED.marital_status,
      religion = EXCLUDED.religion,
      caste = EXCLUDED.caste,
      subcaste = EXCLUDED.subcaste,
      dosham = EXCLUDED.dosham,
      education = EXCLUDED.education,
      education_detail = EXCLUDED.education_detail,
      occupation = EXCLUDED.occupation,
      occupation_detail = EXCLUDED.occupation_detail,
      annual_income = EXCLUDED.annual_income,
      company_name = EXCLUDED.company_name,
      city = EXCLUDED.city,
      district = EXCLUDED.district,
      about_me = EXCLUDED.about_me,
      family_type = EXCLUDED.family_type,
      family_status = EXCLUDED.family_status,
      is_verified = EXCLUDED.is_verified,
      is_premium = EXCLUDED.is_premium,
      is_profile_complete = EXCLUDED.is_profile_complete,
      profile_completion_percent = EXCLUDED.profile_completion_percent,
      last_active_at = EXCLUDED.last_active_at,
      star = EXCLUDED.star,
      raasi = EXCLUDED.raasi,
      lagnam = EXCLUDED.lagnam,
      gothram = EXCLUDED.gothram,
      tier = EXCLUDED.tier,
      contacts_remaining = EXCLUDED.contacts_remaining,
      interests_remaining = EXCLUDED.interests_remaining,
      food_habit = EXCLUDED.food_habit,
      smoking = EXCLUDED.smoking,
      drinking = EXCLUDED.drinking;
INSERT INTO public.profiles (
      id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at, star, raasi, lagnam, gothram, tier, contacts_remaining, interests_remaining, food_habit, smoking, drinking
    ) VALUES (
      '00000000-0000-4000-a000-000000000127', 'TM000295', 'Kabilan Pandian', 'male', '1993-12-17', 164, 'never_married', 'Hindu', 'Vishwakarma', NULL, 'no', 'M.B.A', 'M.B.A Graduate', 'HR Specialist', 'HR Specialist Details', '₹10 Lakhs - ₹15 Lakhs', 'Private Practice', 'Tiruppur', 'Tiruppur', 'Hi, I am Kabilan. I have completed my M.B.A and am currently working as a HR Specialist at Private Practice in Tiruppur. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'upper_middle_class', true, false, true, 100, NOW() - INTERVAL '10 days', 'Poorvaphalguni', 'Dhanusu', 'Dhanusu', 'Atri', 'free', 5, 5, 'vegetarian', 'no', 'no'
    ) ON CONFLICT (id) DO UPDATE SET
      profile_id = EXCLUDED.profile_id,
      display_name = EXCLUDED.display_name,
      gender = EXCLUDED.gender,
      date_of_birth = EXCLUDED.date_of_birth,
      height_cm = EXCLUDED.height_cm,
      marital_status = EXCLUDED.marital_status,
      religion = EXCLUDED.religion,
      caste = EXCLUDED.caste,
      subcaste = EXCLUDED.subcaste,
      dosham = EXCLUDED.dosham,
      education = EXCLUDED.education,
      education_detail = EXCLUDED.education_detail,
      occupation = EXCLUDED.occupation,
      occupation_detail = EXCLUDED.occupation_detail,
      annual_income = EXCLUDED.annual_income,
      company_name = EXCLUDED.company_name,
      city = EXCLUDED.city,
      district = EXCLUDED.district,
      about_me = EXCLUDED.about_me,
      family_type = EXCLUDED.family_type,
      family_status = EXCLUDED.family_status,
      is_verified = EXCLUDED.is_verified,
      is_premium = EXCLUDED.is_premium,
      is_profile_complete = EXCLUDED.is_profile_complete,
      profile_completion_percent = EXCLUDED.profile_completion_percent,
      last_active_at = EXCLUDED.last_active_at,
      star = EXCLUDED.star,
      raasi = EXCLUDED.raasi,
      lagnam = EXCLUDED.lagnam,
      gothram = EXCLUDED.gothram,
      tier = EXCLUDED.tier,
      contacts_remaining = EXCLUDED.contacts_remaining,
      interests_remaining = EXCLUDED.interests_remaining,
      food_habit = EXCLUDED.food_habit,
      smoking = EXCLUDED.smoking,
      drinking = EXCLUDED.drinking;
INSERT INTO public.profiles (
      id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at, star, raasi, lagnam, gothram, tier, contacts_remaining, interests_remaining, food_habit, smoking, drinking
    ) VALUES (
      '00000000-0000-4000-a000-000000000128', 'TM000296', 'Shanthi Nathan', 'female', '2000-01-10', 168, 'never_married', 'Hindu', 'Mudaliar', NULL, 'no', 'M.A', 'M.A Graduate', 'Bank Manager', 'Bank Manager Details', '₹7 Lakhs - ₹10 Lakhs', 'Zoho', 'Salem', 'Salem', 'Hi, I am Shanthi. I have completed my M.A and am currently working as a Bank Manager at Zoho in Salem. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'middle_class', true, false, true, 100, NOW() - INTERVAL '5 days', 'Punarvasu', 'Mesham', 'Kadagam', 'Vashishta', 'free', 5, 5, 'vegetarian', 'no', 'no'
    ) ON CONFLICT (id) DO UPDATE SET
      profile_id = EXCLUDED.profile_id,
      display_name = EXCLUDED.display_name,
      gender = EXCLUDED.gender,
      date_of_birth = EXCLUDED.date_of_birth,
      height_cm = EXCLUDED.height_cm,
      marital_status = EXCLUDED.marital_status,
      religion = EXCLUDED.religion,
      caste = EXCLUDED.caste,
      subcaste = EXCLUDED.subcaste,
      dosham = EXCLUDED.dosham,
      education = EXCLUDED.education,
      education_detail = EXCLUDED.education_detail,
      occupation = EXCLUDED.occupation,
      occupation_detail = EXCLUDED.occupation_detail,
      annual_income = EXCLUDED.annual_income,
      company_name = EXCLUDED.company_name,
      city = EXCLUDED.city,
      district = EXCLUDED.district,
      about_me = EXCLUDED.about_me,
      family_type = EXCLUDED.family_type,
      family_status = EXCLUDED.family_status,
      is_verified = EXCLUDED.is_verified,
      is_premium = EXCLUDED.is_premium,
      is_profile_complete = EXCLUDED.is_profile_complete,
      profile_completion_percent = EXCLUDED.profile_completion_percent,
      last_active_at = EXCLUDED.last_active_at,
      star = EXCLUDED.star,
      raasi = EXCLUDED.raasi,
      lagnam = EXCLUDED.lagnam,
      gothram = EXCLUDED.gothram,
      tier = EXCLUDED.tier,
      contacts_remaining = EXCLUDED.contacts_remaining,
      interests_remaining = EXCLUDED.interests_remaining,
      food_habit = EXCLUDED.food_habit,
      smoking = EXCLUDED.smoking,
      drinking = EXCLUDED.drinking;
INSERT INTO public.profiles (
      id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at, star, raasi, lagnam, gothram, tier, contacts_remaining, interests_remaining, food_habit, smoking, drinking
    ) VALUES (
      '00000000-0000-4000-a000-000000000129', 'TM000297', 'Anand Mani', 'male', '2002-09-11', 178, 'never_married', 'Hindu', 'Devendra Kula Vellalar', NULL, 'no', 'B.Sc', 'B.Sc Graduate', 'Architect', 'Architect Details', '₹20 Lakhs+', 'Self Employed', 'Vellore', 'Vellore', 'Hi, I am Anand. I have completed my B.Sc and am currently working as a Architect at Self Employed in Vellore. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'middle_class', true, false, true, 100, NOW() - INTERVAL '9 days', 'Poorvashadha', 'Kanni', 'Dhanusu', 'Vashishta', 'free', 5, 5, 'vegetarian', 'no', 'no'
    ) ON CONFLICT (id) DO UPDATE SET
      profile_id = EXCLUDED.profile_id,
      display_name = EXCLUDED.display_name,
      gender = EXCLUDED.gender,
      date_of_birth = EXCLUDED.date_of_birth,
      height_cm = EXCLUDED.height_cm,
      marital_status = EXCLUDED.marital_status,
      religion = EXCLUDED.religion,
      caste = EXCLUDED.caste,
      subcaste = EXCLUDED.subcaste,
      dosham = EXCLUDED.dosham,
      education = EXCLUDED.education,
      education_detail = EXCLUDED.education_detail,
      occupation = EXCLUDED.occupation,
      occupation_detail = EXCLUDED.occupation_detail,
      annual_income = EXCLUDED.annual_income,
      company_name = EXCLUDED.company_name,
      city = EXCLUDED.city,
      district = EXCLUDED.district,
      about_me = EXCLUDED.about_me,
      family_type = EXCLUDED.family_type,
      family_status = EXCLUDED.family_status,
      is_verified = EXCLUDED.is_verified,
      is_premium = EXCLUDED.is_premium,
      is_profile_complete = EXCLUDED.is_profile_complete,
      profile_completion_percent = EXCLUDED.profile_completion_percent,
      last_active_at = EXCLUDED.last_active_at,
      star = EXCLUDED.star,
      raasi = EXCLUDED.raasi,
      lagnam = EXCLUDED.lagnam,
      gothram = EXCLUDED.gothram,
      tier = EXCLUDED.tier,
      contacts_remaining = EXCLUDED.contacts_remaining,
      interests_remaining = EXCLUDED.interests_remaining,
      food_habit = EXCLUDED.food_habit,
      smoking = EXCLUDED.smoking,
      drinking = EXCLUDED.drinking;
INSERT INTO public.profiles (
      id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at, star, raasi, lagnam, gothram, tier, contacts_remaining, interests_remaining, food_habit, smoking, drinking
    ) VALUES (
      '00000000-0000-4000-a000-00000000012a', 'TM000298', 'Keerthana Naicker', 'female', '2005-01-14', 164, 'never_married', 'Hindu', 'Brahmin - Iyer', NULL, 'yes', 'B.Com', 'B.Com Graduate', 'School Teacher', 'School Teacher Details', '₹20 Lakhs+', 'Infosys', 'Thoothukudi', 'Tuticorin', 'Hi, I am Keerthana. I have completed my B.Com and am currently working as a School Teacher at Infosys in Thoothukudi. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'middle_class', true, true, true, 100, NOW() - INTERVAL '5 days', 'Magha', 'Kadagam', 'Magaram', 'Atri', 'gold', 50, 100, 'vegetarian', 'no', 'no'
    ) ON CONFLICT (id) DO UPDATE SET
      profile_id = EXCLUDED.profile_id,
      display_name = EXCLUDED.display_name,
      gender = EXCLUDED.gender,
      date_of_birth = EXCLUDED.date_of_birth,
      height_cm = EXCLUDED.height_cm,
      marital_status = EXCLUDED.marital_status,
      religion = EXCLUDED.religion,
      caste = EXCLUDED.caste,
      subcaste = EXCLUDED.subcaste,
      dosham = EXCLUDED.dosham,
      education = EXCLUDED.education,
      education_detail = EXCLUDED.education_detail,
      occupation = EXCLUDED.occupation,
      occupation_detail = EXCLUDED.occupation_detail,
      annual_income = EXCLUDED.annual_income,
      company_name = EXCLUDED.company_name,
      city = EXCLUDED.city,
      district = EXCLUDED.district,
      about_me = EXCLUDED.about_me,
      family_type = EXCLUDED.family_type,
      family_status = EXCLUDED.family_status,
      is_verified = EXCLUDED.is_verified,
      is_premium = EXCLUDED.is_premium,
      is_profile_complete = EXCLUDED.is_profile_complete,
      profile_completion_percent = EXCLUDED.profile_completion_percent,
      last_active_at = EXCLUDED.last_active_at,
      star = EXCLUDED.star,
      raasi = EXCLUDED.raasi,
      lagnam = EXCLUDED.lagnam,
      gothram = EXCLUDED.gothram,
      tier = EXCLUDED.tier,
      contacts_remaining = EXCLUDED.contacts_remaining,
      interests_remaining = EXCLUDED.interests_remaining,
      food_habit = EXCLUDED.food_habit,
      smoking = EXCLUDED.smoking,
      drinking = EXCLUDED.drinking;
INSERT INTO public.profiles (
      id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at, star, raasi, lagnam, gothram, tier, contacts_remaining, interests_remaining, food_habit, smoking, drinking
    ) VALUES (
      '00000000-0000-4000-a000-00000000012b', 'TM000299', 'Karthik Balan', 'male', '1988-02-17', 174, 'never_married', 'Hindu', 'Thevar', 'Thevar subcaste', 'no', 'M.Com', 'M.Com Graduate', 'Police Officer', 'Police Officer Details', '₹5 Lakhs - ₹7 Lakhs', 'Accenture', 'Vellore', 'Vellore', 'Hi, I am Karthik. I have completed my M.Com and am currently working as a Police Officer at Accenture in Vellore. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'middle_class', true, false, true, 100, NOW() - INTERVAL '8 days', 'Poorvaphalguni', 'Rishabam', 'Magaram', 'Vishnu', 'free', 5, 5, 'vegetarian', 'no', 'no'
    ) ON CONFLICT (id) DO UPDATE SET
      profile_id = EXCLUDED.profile_id,
      display_name = EXCLUDED.display_name,
      gender = EXCLUDED.gender,
      date_of_birth = EXCLUDED.date_of_birth,
      height_cm = EXCLUDED.height_cm,
      marital_status = EXCLUDED.marital_status,
      religion = EXCLUDED.religion,
      caste = EXCLUDED.caste,
      subcaste = EXCLUDED.subcaste,
      dosham = EXCLUDED.dosham,
      education = EXCLUDED.education,
      education_detail = EXCLUDED.education_detail,
      occupation = EXCLUDED.occupation,
      occupation_detail = EXCLUDED.occupation_detail,
      annual_income = EXCLUDED.annual_income,
      company_name = EXCLUDED.company_name,
      city = EXCLUDED.city,
      district = EXCLUDED.district,
      about_me = EXCLUDED.about_me,
      family_type = EXCLUDED.family_type,
      family_status = EXCLUDED.family_status,
      is_verified = EXCLUDED.is_verified,
      is_premium = EXCLUDED.is_premium,
      is_profile_complete = EXCLUDED.is_profile_complete,
      profile_completion_percent = EXCLUDED.profile_completion_percent,
      last_active_at = EXCLUDED.last_active_at,
      star = EXCLUDED.star,
      raasi = EXCLUDED.raasi,
      lagnam = EXCLUDED.lagnam,
      gothram = EXCLUDED.gothram,
      tier = EXCLUDED.tier,
      contacts_remaining = EXCLUDED.contacts_remaining,
      interests_remaining = EXCLUDED.interests_remaining,
      food_habit = EXCLUDED.food_habit,
      smoking = EXCLUDED.smoking,
      drinking = EXCLUDED.drinking;
INSERT INTO public.profiles (
      id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at, star, raasi, lagnam, gothram, tier, contacts_remaining, interests_remaining, food_habit, smoking, drinking
    ) VALUES (
      '00000000-0000-4000-a000-00000000012c', 'TM000300', 'Rekha Gopal', 'female', '1997-06-13', 152, 'never_married', 'Hindu', 'Nadar', 'Nadar subcaste', 'no', 'M.A', 'M.A Graduate', 'Doctor', 'Doctor Details', '₹20 Lakhs+', 'Wipro', 'Kanchipuram', 'Kanchipuram', 'Hi, I am Rekha. I have completed my M.A and am currently working as a Doctor at Wipro in Kanchipuram. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'joint', 'middle_class', true, false, true, 100, NOW() - INTERVAL '7 days', 'Poorvashadha', 'Kadagam', 'Kanni', 'Harita', 'free', 5, 5, 'vegetarian', 'no', 'no'
    ) ON CONFLICT (id) DO UPDATE SET
      profile_id = EXCLUDED.profile_id,
      display_name = EXCLUDED.display_name,
      gender = EXCLUDED.gender,
      date_of_birth = EXCLUDED.date_of_birth,
      height_cm = EXCLUDED.height_cm,
      marital_status = EXCLUDED.marital_status,
      religion = EXCLUDED.religion,
      caste = EXCLUDED.caste,
      subcaste = EXCLUDED.subcaste,
      dosham = EXCLUDED.dosham,
      education = EXCLUDED.education,
      education_detail = EXCLUDED.education_detail,
      occupation = EXCLUDED.occupation,
      occupation_detail = EXCLUDED.occupation_detail,
      annual_income = EXCLUDED.annual_income,
      company_name = EXCLUDED.company_name,
      city = EXCLUDED.city,
      district = EXCLUDED.district,
      about_me = EXCLUDED.about_me,
      family_type = EXCLUDED.family_type,
      family_status = EXCLUDED.family_status,
      is_verified = EXCLUDED.is_verified,
      is_premium = EXCLUDED.is_premium,
      is_profile_complete = EXCLUDED.is_profile_complete,
      profile_completion_percent = EXCLUDED.profile_completion_percent,
      last_active_at = EXCLUDED.last_active_at,
      star = EXCLUDED.star,
      raasi = EXCLUDED.raasi,
      lagnam = EXCLUDED.lagnam,
      gothram = EXCLUDED.gothram,
      tier = EXCLUDED.tier,
      contacts_remaining = EXCLUDED.contacts_remaining,
      interests_remaining = EXCLUDED.interests_remaining,
      food_habit = EXCLUDED.food_habit,
      smoking = EXCLUDED.smoking,
      drinking = EXCLUDED.drinking;
INSERT INTO public.profiles (
      id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at, star, raasi, lagnam, gothram, tier, contacts_remaining, interests_remaining, food_habit, smoking, drinking
    ) VALUES (
      '00000000-0000-4000-a000-00000000012d', 'TM000301', 'Sakthi Balan', 'male', '2005-11-11', 184, 'never_married', 'Hindu', 'Vishwakarma', 'Vishwakarma subcaste', 'yes', 'M.B.B.S', 'M.B.B.S Graduate', 'Bank Manager', 'Bank Manager Details', '₹3 Lakhs - ₹5 Lakhs', 'TCS', 'Kanchipuram', 'Kanchipuram', 'Hi, I am Sakthi. I have completed my M.B.B.S and am currently working as a Bank Manager at TCS in Kanchipuram. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'middle_class', true, false, true, 100, NOW() - INTERVAL '1 days', 'Poorvashadha', 'Mesham', 'Viruchigam', 'Atri', 'free', 5, 5, 'vegetarian', 'no', 'no'
    ) ON CONFLICT (id) DO UPDATE SET
      profile_id = EXCLUDED.profile_id,
      display_name = EXCLUDED.display_name,
      gender = EXCLUDED.gender,
      date_of_birth = EXCLUDED.date_of_birth,
      height_cm = EXCLUDED.height_cm,
      marital_status = EXCLUDED.marital_status,
      religion = EXCLUDED.religion,
      caste = EXCLUDED.caste,
      subcaste = EXCLUDED.subcaste,
      dosham = EXCLUDED.dosham,
      education = EXCLUDED.education,
      education_detail = EXCLUDED.education_detail,
      occupation = EXCLUDED.occupation,
      occupation_detail = EXCLUDED.occupation_detail,
      annual_income = EXCLUDED.annual_income,
      company_name = EXCLUDED.company_name,
      city = EXCLUDED.city,
      district = EXCLUDED.district,
      about_me = EXCLUDED.about_me,
      family_type = EXCLUDED.family_type,
      family_status = EXCLUDED.family_status,
      is_verified = EXCLUDED.is_verified,
      is_premium = EXCLUDED.is_premium,
      is_profile_complete = EXCLUDED.is_profile_complete,
      profile_completion_percent = EXCLUDED.profile_completion_percent,
      last_active_at = EXCLUDED.last_active_at,
      star = EXCLUDED.star,
      raasi = EXCLUDED.raasi,
      lagnam = EXCLUDED.lagnam,
      gothram = EXCLUDED.gothram,
      tier = EXCLUDED.tier,
      contacts_remaining = EXCLUDED.contacts_remaining,
      interests_remaining = EXCLUDED.interests_remaining,
      food_habit = EXCLUDED.food_habit,
      smoking = EXCLUDED.smoking,
      drinking = EXCLUDED.drinking;
INSERT INTO public.profiles (
      id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at, star, raasi, lagnam, gothram, tier, contacts_remaining, interests_remaining, food_habit, smoking, drinking
    ) VALUES (
      '00000000-0000-4000-a000-00000000012e', 'TM000302', 'Ponmani Moorthy', 'female', '2003-07-20', 159, 'never_married', 'Hindu', 'Thevar', NULL, 'no', 'M.Com', 'M.Com Graduate', 'Police Officer', 'Police Officer Details', '₹7 Lakhs - ₹10 Lakhs', 'Zoho', 'Kanchipuram', 'Kanchipuram', 'Hi, I am Ponmani. I have completed my M.Com and am currently working as a Police Officer at Zoho in Kanchipuram. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'middle_class', true, true, true, 100, NOW() - INTERVAL '5 days', 'Bharani', 'Viruchigam', 'Viruchigam', 'Gautama', 'gold', 50, 100, 'vegetarian', 'no', 'no'
    ) ON CONFLICT (id) DO UPDATE SET
      profile_id = EXCLUDED.profile_id,
      display_name = EXCLUDED.display_name,
      gender = EXCLUDED.gender,
      date_of_birth = EXCLUDED.date_of_birth,
      height_cm = EXCLUDED.height_cm,
      marital_status = EXCLUDED.marital_status,
      religion = EXCLUDED.religion,
      caste = EXCLUDED.caste,
      subcaste = EXCLUDED.subcaste,
      dosham = EXCLUDED.dosham,
      education = EXCLUDED.education,
      education_detail = EXCLUDED.education_detail,
      occupation = EXCLUDED.occupation,
      occupation_detail = EXCLUDED.occupation_detail,
      annual_income = EXCLUDED.annual_income,
      company_name = EXCLUDED.company_name,
      city = EXCLUDED.city,
      district = EXCLUDED.district,
      about_me = EXCLUDED.about_me,
      family_type = EXCLUDED.family_type,
      family_status = EXCLUDED.family_status,
      is_verified = EXCLUDED.is_verified,
      is_premium = EXCLUDED.is_premium,
      is_profile_complete = EXCLUDED.is_profile_complete,
      profile_completion_percent = EXCLUDED.profile_completion_percent,
      last_active_at = EXCLUDED.last_active_at,
      star = EXCLUDED.star,
      raasi = EXCLUDED.raasi,
      lagnam = EXCLUDED.lagnam,
      gothram = EXCLUDED.gothram,
      tier = EXCLUDED.tier,
      contacts_remaining = EXCLUDED.contacts_remaining,
      interests_remaining = EXCLUDED.interests_remaining,
      food_habit = EXCLUDED.food_habit,
      smoking = EXCLUDED.smoking,
      drinking = EXCLUDED.drinking;
INSERT INTO public.profiles (
      id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at, star, raasi, lagnam, gothram, tier, contacts_remaining, interests_remaining, food_habit, smoking, drinking
    ) VALUES (
      '00000000-0000-4000-a000-00000000012f', 'TM000303', 'Kannan Shankar', 'male', '1994-10-08', 166, 'never_married', 'Hindu', 'Devendra Kula Vellalar', NULL, 'no', 'B.Sc', 'B.Sc Graduate', 'Government Officer', 'Government Officer Details', '₹20 Lakhs+', 'Zoho', 'Tirunelveli', 'Tirunelveli', 'Hi, I am Kannan. I have completed my B.Sc and am currently working as a Government Officer at Zoho in Tirunelveli. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'joint', 'upper_middle_class', false, false, true, 100, NOW() - INTERVAL '4 days', 'Arudra', 'Simham', 'Kumbam', 'Kasyapa', 'free', 5, 5, 'vegetarian', 'no', 'no'
    ) ON CONFLICT (id) DO UPDATE SET
      profile_id = EXCLUDED.profile_id,
      display_name = EXCLUDED.display_name,
      gender = EXCLUDED.gender,
      date_of_birth = EXCLUDED.date_of_birth,
      height_cm = EXCLUDED.height_cm,
      marital_status = EXCLUDED.marital_status,
      religion = EXCLUDED.religion,
      caste = EXCLUDED.caste,
      subcaste = EXCLUDED.subcaste,
      dosham = EXCLUDED.dosham,
      education = EXCLUDED.education,
      education_detail = EXCLUDED.education_detail,
      occupation = EXCLUDED.occupation,
      occupation_detail = EXCLUDED.occupation_detail,
      annual_income = EXCLUDED.annual_income,
      company_name = EXCLUDED.company_name,
      city = EXCLUDED.city,
      district = EXCLUDED.district,
      about_me = EXCLUDED.about_me,
      family_type = EXCLUDED.family_type,
      family_status = EXCLUDED.family_status,
      is_verified = EXCLUDED.is_verified,
      is_premium = EXCLUDED.is_premium,
      is_profile_complete = EXCLUDED.is_profile_complete,
      profile_completion_percent = EXCLUDED.profile_completion_percent,
      last_active_at = EXCLUDED.last_active_at,
      star = EXCLUDED.star,
      raasi = EXCLUDED.raasi,
      lagnam = EXCLUDED.lagnam,
      gothram = EXCLUDED.gothram,
      tier = EXCLUDED.tier,
      contacts_remaining = EXCLUDED.contacts_remaining,
      interests_remaining = EXCLUDED.interests_remaining,
      food_habit = EXCLUDED.food_habit,
      smoking = EXCLUDED.smoking,
      drinking = EXCLUDED.drinking;
INSERT INTO public.profiles (
      id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at, star, raasi, lagnam, gothram, tier, contacts_remaining, interests_remaining, food_habit, smoking, drinking
    ) VALUES (
      '00000000-0000-4000-a000-000000000130', 'TM000304', 'Deepa Moorthy', 'female', '1988-05-11', 172, 'never_married', 'Hindu', 'Nadar', 'Nadar subcaste', 'no', 'M.Com', 'M.Com Graduate', 'Pharmacist', 'Pharmacist Details', '₹20 Lakhs+', 'Accenture', 'Kanchipuram', 'Kanchipuram', 'Hi, I am Deepa. I have completed my M.Com and am currently working as a Pharmacist at Accenture in Kanchipuram. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'joint', 'rich', true, false, true, 100, NOW() - INTERVAL '7 days', 'Uttaraphalguni', 'Thulaam', 'Dhanusu', 'Bharadwaj', 'free', 5, 5, 'vegetarian', 'no', 'no'
    ) ON CONFLICT (id) DO UPDATE SET
      profile_id = EXCLUDED.profile_id,
      display_name = EXCLUDED.display_name,
      gender = EXCLUDED.gender,
      date_of_birth = EXCLUDED.date_of_birth,
      height_cm = EXCLUDED.height_cm,
      marital_status = EXCLUDED.marital_status,
      religion = EXCLUDED.religion,
      caste = EXCLUDED.caste,
      subcaste = EXCLUDED.subcaste,
      dosham = EXCLUDED.dosham,
      education = EXCLUDED.education,
      education_detail = EXCLUDED.education_detail,
      occupation = EXCLUDED.occupation,
      occupation_detail = EXCLUDED.occupation_detail,
      annual_income = EXCLUDED.annual_income,
      company_name = EXCLUDED.company_name,
      city = EXCLUDED.city,
      district = EXCLUDED.district,
      about_me = EXCLUDED.about_me,
      family_type = EXCLUDED.family_type,
      family_status = EXCLUDED.family_status,
      is_verified = EXCLUDED.is_verified,
      is_premium = EXCLUDED.is_premium,
      is_profile_complete = EXCLUDED.is_profile_complete,
      profile_completion_percent = EXCLUDED.profile_completion_percent,
      last_active_at = EXCLUDED.last_active_at,
      star = EXCLUDED.star,
      raasi = EXCLUDED.raasi,
      lagnam = EXCLUDED.lagnam,
      gothram = EXCLUDED.gothram,
      tier = EXCLUDED.tier,
      contacts_remaining = EXCLUDED.contacts_remaining,
      interests_remaining = EXCLUDED.interests_remaining,
      food_habit = EXCLUDED.food_habit,
      smoking = EXCLUDED.smoking,
      drinking = EXCLUDED.drinking;
INSERT INTO public.profiles (
      id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at, star, raasi, lagnam, gothram, tier, contacts_remaining, interests_remaining, food_habit, smoking, drinking
    ) VALUES (
      '00000000-0000-4000-a000-000000000131', 'TM000305', 'Manikandan Mani', 'male', '2000-07-20', 162, 'divorced', 'Hindu', 'Vellalar', NULL, 'no', 'B.Sc', 'B.Sc Graduate', 'Architect', 'Architect Details', '₹7 Lakhs - ₹10 Lakhs', 'TCS', 'Chennai', 'Chennai', 'Hi, I am Manikandan. I have completed my B.Sc and am currently working as a Architect at TCS in Chennai. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'upper_middle_class', true, true, true, 100, NOW() - INTERVAL '8 days', 'Moola', 'Dhanusu', 'Simham', 'Murugan', 'gold', 50, 100, 'vegetarian', 'no', 'no'
    ) ON CONFLICT (id) DO UPDATE SET
      profile_id = EXCLUDED.profile_id,
      display_name = EXCLUDED.display_name,
      gender = EXCLUDED.gender,
      date_of_birth = EXCLUDED.date_of_birth,
      height_cm = EXCLUDED.height_cm,
      marital_status = EXCLUDED.marital_status,
      religion = EXCLUDED.religion,
      caste = EXCLUDED.caste,
      subcaste = EXCLUDED.subcaste,
      dosham = EXCLUDED.dosham,
      education = EXCLUDED.education,
      education_detail = EXCLUDED.education_detail,
      occupation = EXCLUDED.occupation,
      occupation_detail = EXCLUDED.occupation_detail,
      annual_income = EXCLUDED.annual_income,
      company_name = EXCLUDED.company_name,
      city = EXCLUDED.city,
      district = EXCLUDED.district,
      about_me = EXCLUDED.about_me,
      family_type = EXCLUDED.family_type,
      family_status = EXCLUDED.family_status,
      is_verified = EXCLUDED.is_verified,
      is_premium = EXCLUDED.is_premium,
      is_profile_complete = EXCLUDED.is_profile_complete,
      profile_completion_percent = EXCLUDED.profile_completion_percent,
      last_active_at = EXCLUDED.last_active_at,
      star = EXCLUDED.star,
      raasi = EXCLUDED.raasi,
      lagnam = EXCLUDED.lagnam,
      gothram = EXCLUDED.gothram,
      tier = EXCLUDED.tier,
      contacts_remaining = EXCLUDED.contacts_remaining,
      interests_remaining = EXCLUDED.interests_remaining,
      food_habit = EXCLUDED.food_habit,
      smoking = EXCLUDED.smoking,
      drinking = EXCLUDED.drinking;
INSERT INTO public.profiles (
      id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at, star, raasi, lagnam, gothram, tier, contacts_remaining, interests_remaining, food_habit, smoking, drinking
    ) VALUES (
      '00000000-0000-4000-a000-000000000132', 'TM000306', 'Indhumathi Pandian', 'female', '2002-04-01', 165, 'never_married', 'Hindu', 'Pillai', NULL, 'no', 'M.C.A', 'M.C.A Graduate', 'Bank Manager', 'Bank Manager Details', '₹10 Lakhs - ₹15 Lakhs', 'Private Practice', 'Thoothukudi', 'Tuticorin', 'Hi, I am Indhumathi. I have completed my M.C.A and am currently working as a Bank Manager at Private Practice in Thoothukudi. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'middle_class', true, false, true, 100, NOW() - INTERVAL '5 days', 'Magha', 'Viruchigam', 'Magaram', 'Kasyapa', 'free', 5, 5, 'vegetarian', 'no', 'no'
    ) ON CONFLICT (id) DO UPDATE SET
      profile_id = EXCLUDED.profile_id,
      display_name = EXCLUDED.display_name,
      gender = EXCLUDED.gender,
      date_of_birth = EXCLUDED.date_of_birth,
      height_cm = EXCLUDED.height_cm,
      marital_status = EXCLUDED.marital_status,
      religion = EXCLUDED.religion,
      caste = EXCLUDED.caste,
      subcaste = EXCLUDED.subcaste,
      dosham = EXCLUDED.dosham,
      education = EXCLUDED.education,
      education_detail = EXCLUDED.education_detail,
      occupation = EXCLUDED.occupation,
      occupation_detail = EXCLUDED.occupation_detail,
      annual_income = EXCLUDED.annual_income,
      company_name = EXCLUDED.company_name,
      city = EXCLUDED.city,
      district = EXCLUDED.district,
      about_me = EXCLUDED.about_me,
      family_type = EXCLUDED.family_type,
      family_status = EXCLUDED.family_status,
      is_verified = EXCLUDED.is_verified,
      is_premium = EXCLUDED.is_premium,
      is_profile_complete = EXCLUDED.is_profile_complete,
      profile_completion_percent = EXCLUDED.profile_completion_percent,
      last_active_at = EXCLUDED.last_active_at,
      star = EXCLUDED.star,
      raasi = EXCLUDED.raasi,
      lagnam = EXCLUDED.lagnam,
      gothram = EXCLUDED.gothram,
      tier = EXCLUDED.tier,
      contacts_remaining = EXCLUDED.contacts_remaining,
      interests_remaining = EXCLUDED.interests_remaining,
      food_habit = EXCLUDED.food_habit,
      smoking = EXCLUDED.smoking,
      drinking = EXCLUDED.drinking;
INSERT INTO public.profiles (
      id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at, star, raasi, lagnam, gothram, tier, contacts_remaining, interests_remaining, food_habit, smoking, drinking
    ) VALUES (
      '00000000-0000-4000-a000-000000000133', 'TM000307', 'Hari Devan', 'male', '1997-06-03', 169, 'never_married', 'Hindu', 'Maravar', NULL, 'yes', 'M.Com', 'M.Com Graduate', 'College Professor', 'College Professor Details', '₹20 Lakhs+', 'HCL', 'Kanchipuram', 'Kanchipuram', 'Hi, I am Hari. I have completed my M.Com and am currently working as a College Professor at HCL in Kanchipuram. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'middle_class', true, false, true, 100, NOW() - INTERVAL '8 days', 'Uttarabhadrapada', 'Kadagam', 'Mesham', 'Atri', 'free', 5, 5, 'vegetarian', 'no', 'no'
    ) ON CONFLICT (id) DO UPDATE SET
      profile_id = EXCLUDED.profile_id,
      display_name = EXCLUDED.display_name,
      gender = EXCLUDED.gender,
      date_of_birth = EXCLUDED.date_of_birth,
      height_cm = EXCLUDED.height_cm,
      marital_status = EXCLUDED.marital_status,
      religion = EXCLUDED.religion,
      caste = EXCLUDED.caste,
      subcaste = EXCLUDED.subcaste,
      dosham = EXCLUDED.dosham,
      education = EXCLUDED.education,
      education_detail = EXCLUDED.education_detail,
      occupation = EXCLUDED.occupation,
      occupation_detail = EXCLUDED.occupation_detail,
      annual_income = EXCLUDED.annual_income,
      company_name = EXCLUDED.company_name,
      city = EXCLUDED.city,
      district = EXCLUDED.district,
      about_me = EXCLUDED.about_me,
      family_type = EXCLUDED.family_type,
      family_status = EXCLUDED.family_status,
      is_verified = EXCLUDED.is_verified,
      is_premium = EXCLUDED.is_premium,
      is_profile_complete = EXCLUDED.is_profile_complete,
      profile_completion_percent = EXCLUDED.profile_completion_percent,
      last_active_at = EXCLUDED.last_active_at,
      star = EXCLUDED.star,
      raasi = EXCLUDED.raasi,
      lagnam = EXCLUDED.lagnam,
      gothram = EXCLUDED.gothram,
      tier = EXCLUDED.tier,
      contacts_remaining = EXCLUDED.contacts_remaining,
      interests_remaining = EXCLUDED.interests_remaining,
      food_habit = EXCLUDED.food_habit,
      smoking = EXCLUDED.smoking,
      drinking = EXCLUDED.drinking;
INSERT INTO public.profiles (
      id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at, star, raasi, lagnam, gothram, tier, contacts_remaining, interests_remaining, food_habit, smoking, drinking
    ) VALUES (
      '00000000-0000-4000-a000-000000000134', 'TM000308', 'Sowmya Selvan', 'female', '2005-09-02', 165, 'never_married', 'Hindu', 'Gounder', NULL, 'no', 'B.Com', 'B.Com Graduate', 'Pharmacist', 'Pharmacist Details', '₹5 Lakhs - ₹7 Lakhs', 'Accenture', 'Coimbatore', 'Coimbatore', 'Hi, I am Sowmya. I have completed my B.Com and am currently working as a Pharmacist at Accenture in Coimbatore. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'joint', 'upper_middle_class', true, false, true, 100, NOW() - INTERVAL '2 days', 'Magha', 'Meenam', 'Simham', 'Harita', 'free', 5, 5, 'vegetarian', 'no', 'no'
    ) ON CONFLICT (id) DO UPDATE SET
      profile_id = EXCLUDED.profile_id,
      display_name = EXCLUDED.display_name,
      gender = EXCLUDED.gender,
      date_of_birth = EXCLUDED.date_of_birth,
      height_cm = EXCLUDED.height_cm,
      marital_status = EXCLUDED.marital_status,
      religion = EXCLUDED.religion,
      caste = EXCLUDED.caste,
      subcaste = EXCLUDED.subcaste,
      dosham = EXCLUDED.dosham,
      education = EXCLUDED.education,
      education_detail = EXCLUDED.education_detail,
      occupation = EXCLUDED.occupation,
      occupation_detail = EXCLUDED.occupation_detail,
      annual_income = EXCLUDED.annual_income,
      company_name = EXCLUDED.company_name,
      city = EXCLUDED.city,
      district = EXCLUDED.district,
      about_me = EXCLUDED.about_me,
      family_type = EXCLUDED.family_type,
      family_status = EXCLUDED.family_status,
      is_verified = EXCLUDED.is_verified,
      is_premium = EXCLUDED.is_premium,
      is_profile_complete = EXCLUDED.is_profile_complete,
      profile_completion_percent = EXCLUDED.profile_completion_percent,
      last_active_at = EXCLUDED.last_active_at,
      star = EXCLUDED.star,
      raasi = EXCLUDED.raasi,
      lagnam = EXCLUDED.lagnam,
      gothram = EXCLUDED.gothram,
      tier = EXCLUDED.tier,
      contacts_remaining = EXCLUDED.contacts_remaining,
      interests_remaining = EXCLUDED.interests_remaining,
      food_habit = EXCLUDED.food_habit,
      smoking = EXCLUDED.smoking,
      drinking = EXCLUDED.drinking;
INSERT INTO public.profiles (
      id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at, star, raasi, lagnam, gothram, tier, contacts_remaining, interests_remaining, food_habit, smoking, drinking
    ) VALUES (
      '00000000-0000-4000-a000-000000000135', 'TM000309', 'Surya Murthy', 'male', '1991-10-02', 165, 'never_married', 'Hindu', 'Vellalar', NULL, 'no', 'M.Sc', 'M.Sc Graduate', 'Government Officer', 'Government Officer Details', '₹15 Lakhs - ₹20 Lakhs', 'Self Employed', 'Madurai', 'Madurai', 'Hi, I am Surya. I have completed my M.Sc and am currently working as a Government Officer at Self Employed in Madurai. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'joint', 'upper_middle_class', true, true, true, 100, NOW() - INTERVAL '6 days', 'Shatabhisha', 'Dhanusu', 'Kumbam', 'Atri', 'gold', 50, 100, 'vegetarian', 'no', 'no'
    ) ON CONFLICT (id) DO UPDATE SET
      profile_id = EXCLUDED.profile_id,
      display_name = EXCLUDED.display_name,
      gender = EXCLUDED.gender,
      date_of_birth = EXCLUDED.date_of_birth,
      height_cm = EXCLUDED.height_cm,
      marital_status = EXCLUDED.marital_status,
      religion = EXCLUDED.religion,
      caste = EXCLUDED.caste,
      subcaste = EXCLUDED.subcaste,
      dosham = EXCLUDED.dosham,
      education = EXCLUDED.education,
      education_detail = EXCLUDED.education_detail,
      occupation = EXCLUDED.occupation,
      occupation_detail = EXCLUDED.occupation_detail,
      annual_income = EXCLUDED.annual_income,
      company_name = EXCLUDED.company_name,
      city = EXCLUDED.city,
      district = EXCLUDED.district,
      about_me = EXCLUDED.about_me,
      family_type = EXCLUDED.family_type,
      family_status = EXCLUDED.family_status,
      is_verified = EXCLUDED.is_verified,
      is_premium = EXCLUDED.is_premium,
      is_profile_complete = EXCLUDED.is_profile_complete,
      profile_completion_percent = EXCLUDED.profile_completion_percent,
      last_active_at = EXCLUDED.last_active_at,
      star = EXCLUDED.star,
      raasi = EXCLUDED.raasi,
      lagnam = EXCLUDED.lagnam,
      gothram = EXCLUDED.gothram,
      tier = EXCLUDED.tier,
      contacts_remaining = EXCLUDED.contacts_remaining,
      interests_remaining = EXCLUDED.interests_remaining,
      food_habit = EXCLUDED.food_habit,
      smoking = EXCLUDED.smoking,
      drinking = EXCLUDED.drinking;
INSERT INTO public.profiles (
      id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at, star, raasi, lagnam, gothram, tier, contacts_remaining, interests_remaining, food_habit, smoking, drinking
    ) VALUES (
      '00000000-0000-4000-a000-000000000136', 'TM000310', 'Archana Lingam', 'female', '1993-11-16', 173, 'never_married', 'Hindu', 'Chettiar', 'Chettiar subcaste', 'no', 'B.Ed', 'B.Ed Graduate', 'Police Officer', 'Police Officer Details', '₹20 Lakhs+', 'Cognizant', 'Thoothukudi', 'Tuticorin', 'Hi, I am Archana. I have completed my B.Ed and am currently working as a Police Officer at Cognizant in Thoothukudi. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'middle_class', true, false, true, 100, NOW() - INTERVAL '9 days', 'Chitra', 'Kanni', 'Thulaam', 'Agastya', 'free', 5, 5, 'vegetarian', 'no', 'no'
    ) ON CONFLICT (id) DO UPDATE SET
      profile_id = EXCLUDED.profile_id,
      display_name = EXCLUDED.display_name,
      gender = EXCLUDED.gender,
      date_of_birth = EXCLUDED.date_of_birth,
      height_cm = EXCLUDED.height_cm,
      marital_status = EXCLUDED.marital_status,
      religion = EXCLUDED.religion,
      caste = EXCLUDED.caste,
      subcaste = EXCLUDED.subcaste,
      dosham = EXCLUDED.dosham,
      education = EXCLUDED.education,
      education_detail = EXCLUDED.education_detail,
      occupation = EXCLUDED.occupation,
      occupation_detail = EXCLUDED.occupation_detail,
      annual_income = EXCLUDED.annual_income,
      company_name = EXCLUDED.company_name,
      city = EXCLUDED.city,
      district = EXCLUDED.district,
      about_me = EXCLUDED.about_me,
      family_type = EXCLUDED.family_type,
      family_status = EXCLUDED.family_status,
      is_verified = EXCLUDED.is_verified,
      is_premium = EXCLUDED.is_premium,
      is_profile_complete = EXCLUDED.is_profile_complete,
      profile_completion_percent = EXCLUDED.profile_completion_percent,
      last_active_at = EXCLUDED.last_active_at,
      star = EXCLUDED.star,
      raasi = EXCLUDED.raasi,
      lagnam = EXCLUDED.lagnam,
      gothram = EXCLUDED.gothram,
      tier = EXCLUDED.tier,
      contacts_remaining = EXCLUDED.contacts_remaining,
      interests_remaining = EXCLUDED.interests_remaining,
      food_habit = EXCLUDED.food_habit,
      smoking = EXCLUDED.smoking,
      drinking = EXCLUDED.drinking;
INSERT INTO public.profiles (
      id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at, star, raasi, lagnam, gothram, tier, contacts_remaining, interests_remaining, food_habit, smoking, drinking
    ) VALUES (
      '00000000-0000-4000-a000-000000000137', 'TM000311', 'Jayakumar Balan', 'male', '1992-05-02', 164, 'never_married', 'Hindu', 'Maravar', NULL, 'no', 'B.Sc', 'B.Sc Graduate', 'Civil Engineer', 'Civil Engineer Details', '₹3 Lakhs - ₹5 Lakhs', 'Cognizant', 'Tirunelveli', 'Tirunelveli', 'Hi, I am Jayakumar. I have completed my B.Sc and am currently working as a Civil Engineer at Cognizant in Tirunelveli. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'rich', true, true, true, 100, NOW() - INTERVAL '2 days', 'Vishakha', 'Viruchigam', 'Simham', 'Harita', 'gold', 50, 100, 'vegetarian', 'no', 'no'
    ) ON CONFLICT (id) DO UPDATE SET
      profile_id = EXCLUDED.profile_id,
      display_name = EXCLUDED.display_name,
      gender = EXCLUDED.gender,
      date_of_birth = EXCLUDED.date_of_birth,
      height_cm = EXCLUDED.height_cm,
      marital_status = EXCLUDED.marital_status,
      religion = EXCLUDED.religion,
      caste = EXCLUDED.caste,
      subcaste = EXCLUDED.subcaste,
      dosham = EXCLUDED.dosham,
      education = EXCLUDED.education,
      education_detail = EXCLUDED.education_detail,
      occupation = EXCLUDED.occupation,
      occupation_detail = EXCLUDED.occupation_detail,
      annual_income = EXCLUDED.annual_income,
      company_name = EXCLUDED.company_name,
      city = EXCLUDED.city,
      district = EXCLUDED.district,
      about_me = EXCLUDED.about_me,
      family_type = EXCLUDED.family_type,
      family_status = EXCLUDED.family_status,
      is_verified = EXCLUDED.is_verified,
      is_premium = EXCLUDED.is_premium,
      is_profile_complete = EXCLUDED.is_profile_complete,
      profile_completion_percent = EXCLUDED.profile_completion_percent,
      last_active_at = EXCLUDED.last_active_at,
      star = EXCLUDED.star,
      raasi = EXCLUDED.raasi,
      lagnam = EXCLUDED.lagnam,
      gothram = EXCLUDED.gothram,
      tier = EXCLUDED.tier,
      contacts_remaining = EXCLUDED.contacts_remaining,
      interests_remaining = EXCLUDED.interests_remaining,
      food_habit = EXCLUDED.food_habit,
      smoking = EXCLUDED.smoking,
      drinking = EXCLUDED.drinking;
INSERT INTO public.profiles (
      id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at, star, raasi, lagnam, gothram, tier, contacts_remaining, interests_remaining, food_habit, smoking, drinking
    ) VALUES (
      '00000000-0000-4000-a000-000000000138', 'TM000312', 'Pooja Samy', 'female', '1999-09-02', 173, 'never_married', 'Hindu', 'Vishwakarma', NULL, 'no', 'B.Com', 'B.Com Graduate', 'Government Officer', 'Government Officer Details', '₹3 Lakhs - ₹5 Lakhs', 'Self Employed', 'Vellore', 'Vellore', 'Hi, I am Pooja. I have completed my B.Com and am currently working as a Government Officer at Self Employed in Vellore. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'middle_class', true, false, true, 100, NOW() - INTERVAL '4 days', 'Poorvashadha', 'Mesham', 'Kumbam', 'Vishnu', 'free', 5, 5, 'vegetarian', 'no', 'no'
    ) ON CONFLICT (id) DO UPDATE SET
      profile_id = EXCLUDED.profile_id,
      display_name = EXCLUDED.display_name,
      gender = EXCLUDED.gender,
      date_of_birth = EXCLUDED.date_of_birth,
      height_cm = EXCLUDED.height_cm,
      marital_status = EXCLUDED.marital_status,
      religion = EXCLUDED.religion,
      caste = EXCLUDED.caste,
      subcaste = EXCLUDED.subcaste,
      dosham = EXCLUDED.dosham,
      education = EXCLUDED.education,
      education_detail = EXCLUDED.education_detail,
      occupation = EXCLUDED.occupation,
      occupation_detail = EXCLUDED.occupation_detail,
      annual_income = EXCLUDED.annual_income,
      company_name = EXCLUDED.company_name,
      city = EXCLUDED.city,
      district = EXCLUDED.district,
      about_me = EXCLUDED.about_me,
      family_type = EXCLUDED.family_type,
      family_status = EXCLUDED.family_status,
      is_verified = EXCLUDED.is_verified,
      is_premium = EXCLUDED.is_premium,
      is_profile_complete = EXCLUDED.is_profile_complete,
      profile_completion_percent = EXCLUDED.profile_completion_percent,
      last_active_at = EXCLUDED.last_active_at,
      star = EXCLUDED.star,
      raasi = EXCLUDED.raasi,
      lagnam = EXCLUDED.lagnam,
      gothram = EXCLUDED.gothram,
      tier = EXCLUDED.tier,
      contacts_remaining = EXCLUDED.contacts_remaining,
      interests_remaining = EXCLUDED.interests_remaining,
      food_habit = EXCLUDED.food_habit,
      smoking = EXCLUDED.smoking,
      drinking = EXCLUDED.drinking;
INSERT INTO public.profiles (
      id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at, star, raasi, lagnam, gothram, tier, contacts_remaining, interests_remaining, food_habit, smoking, drinking
    ) VALUES (
      '00000000-0000-4000-a000-000000000139', 'TM000313', 'Vignesh Swamy', 'male', '1990-06-22', 165, 'divorced', 'Hindu', 'Vellalar', NULL, 'no', 'B.A', 'B.A Graduate', 'Software Engineer', 'Software Engineer Details', '₹3 Lakhs - ₹5 Lakhs', 'Zoho', 'Vellore', 'Vellore', 'Hi, I am Vignesh. I have completed my B.A and am currently working as a Software Engineer at Zoho in Vellore. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'joint', 'middle_class', true, false, true, 100, NOW() - INTERVAL '7 days', 'Uttaraphalguni', 'Kumbam', 'Mesham', 'Bharadwaj', 'free', 5, 5, 'vegetarian', 'no', 'no'
    ) ON CONFLICT (id) DO UPDATE SET
      profile_id = EXCLUDED.profile_id,
      display_name = EXCLUDED.display_name,
      gender = EXCLUDED.gender,
      date_of_birth = EXCLUDED.date_of_birth,
      height_cm = EXCLUDED.height_cm,
      marital_status = EXCLUDED.marital_status,
      religion = EXCLUDED.religion,
      caste = EXCLUDED.caste,
      subcaste = EXCLUDED.subcaste,
      dosham = EXCLUDED.dosham,
      education = EXCLUDED.education,
      education_detail = EXCLUDED.education_detail,
      occupation = EXCLUDED.occupation,
      occupation_detail = EXCLUDED.occupation_detail,
      annual_income = EXCLUDED.annual_income,
      company_name = EXCLUDED.company_name,
      city = EXCLUDED.city,
      district = EXCLUDED.district,
      about_me = EXCLUDED.about_me,
      family_type = EXCLUDED.family_type,
      family_status = EXCLUDED.family_status,
      is_verified = EXCLUDED.is_verified,
      is_premium = EXCLUDED.is_premium,
      is_profile_complete = EXCLUDED.is_profile_complete,
      profile_completion_percent = EXCLUDED.profile_completion_percent,
      last_active_at = EXCLUDED.last_active_at,
      star = EXCLUDED.star,
      raasi = EXCLUDED.raasi,
      lagnam = EXCLUDED.lagnam,
      gothram = EXCLUDED.gothram,
      tier = EXCLUDED.tier,
      contacts_remaining = EXCLUDED.contacts_remaining,
      interests_remaining = EXCLUDED.interests_remaining,
      food_habit = EXCLUDED.food_habit,
      smoking = EXCLUDED.smoking,
      drinking = EXCLUDED.drinking;
INSERT INTO public.profiles (
      id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at, star, raasi, lagnam, gothram, tier, contacts_remaining, interests_remaining, food_habit, smoking, drinking
    ) VALUES (
      '00000000-0000-4000-a000-00000000013a', 'TM000314', 'Archana Sundaram', 'female', '1992-07-25', 174, 'never_married', 'Hindu', 'Chettiar', 'Chettiar subcaste', 'yes', 'M.A', 'M.A Graduate', 'Bank Manager', 'Bank Manager Details', '₹15 Lakhs - ₹20 Lakhs', 'Accenture', 'Kanchipuram', 'Kanchipuram', 'Hi, I am Archana. I have completed my M.A and am currently working as a Bank Manager at Accenture in Kanchipuram. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'joint', 'rich', true, false, true, 100, NOW() - INTERVAL '9 days', 'Bharani', 'Mesham', 'Dhanusu', 'Harita', 'free', 5, 5, 'vegetarian', 'no', 'no'
    ) ON CONFLICT (id) DO UPDATE SET
      profile_id = EXCLUDED.profile_id,
      display_name = EXCLUDED.display_name,
      gender = EXCLUDED.gender,
      date_of_birth = EXCLUDED.date_of_birth,
      height_cm = EXCLUDED.height_cm,
      marital_status = EXCLUDED.marital_status,
      religion = EXCLUDED.religion,
      caste = EXCLUDED.caste,
      subcaste = EXCLUDED.subcaste,
      dosham = EXCLUDED.dosham,
      education = EXCLUDED.education,
      education_detail = EXCLUDED.education_detail,
      occupation = EXCLUDED.occupation,
      occupation_detail = EXCLUDED.occupation_detail,
      annual_income = EXCLUDED.annual_income,
      company_name = EXCLUDED.company_name,
      city = EXCLUDED.city,
      district = EXCLUDED.district,
      about_me = EXCLUDED.about_me,
      family_type = EXCLUDED.family_type,
      family_status = EXCLUDED.family_status,
      is_verified = EXCLUDED.is_verified,
      is_premium = EXCLUDED.is_premium,
      is_profile_complete = EXCLUDED.is_profile_complete,
      profile_completion_percent = EXCLUDED.profile_completion_percent,
      last_active_at = EXCLUDED.last_active_at,
      star = EXCLUDED.star,
      raasi = EXCLUDED.raasi,
      lagnam = EXCLUDED.lagnam,
      gothram = EXCLUDED.gothram,
      tier = EXCLUDED.tier,
      contacts_remaining = EXCLUDED.contacts_remaining,
      interests_remaining = EXCLUDED.interests_remaining,
      food_habit = EXCLUDED.food_habit,
      smoking = EXCLUDED.smoking,
      drinking = EXCLUDED.drinking;
INSERT INTO public.profiles (
      id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at, star, raasi, lagnam, gothram, tier, contacts_remaining, interests_remaining, food_habit, smoking, drinking
    ) VALUES (
      '00000000-0000-4000-a000-00000000013b', 'TM000315', 'Ganesan Murthy', 'male', '2000-09-04', 170, 'never_married', 'Hindu', 'Yadav', 'Yadav subcaste', 'no', 'B.E. / B.Tech', 'B.E. / B.Tech Graduate', 'Police Officer', 'Police Officer Details', '₹15 Lakhs - ₹20 Lakhs', 'TCS', 'Tiruppur', 'Tiruppur', 'Hi, I am Ganesan. I have completed my B.E. / B.Tech and am currently working as a Police Officer at TCS in Tiruppur. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'joint', 'rich', true, false, true, 100, NOW() - INTERVAL '9 days', 'Shatabhisha', 'Kumbam', 'Kanni', 'Kasyapa', 'free', 5, 5, 'vegetarian', 'no', 'no'
    ) ON CONFLICT (id) DO UPDATE SET
      profile_id = EXCLUDED.profile_id,
      display_name = EXCLUDED.display_name,
      gender = EXCLUDED.gender,
      date_of_birth = EXCLUDED.date_of_birth,
      height_cm = EXCLUDED.height_cm,
      marital_status = EXCLUDED.marital_status,
      religion = EXCLUDED.religion,
      caste = EXCLUDED.caste,
      subcaste = EXCLUDED.subcaste,
      dosham = EXCLUDED.dosham,
      education = EXCLUDED.education,
      education_detail = EXCLUDED.education_detail,
      occupation = EXCLUDED.occupation,
      occupation_detail = EXCLUDED.occupation_detail,
      annual_income = EXCLUDED.annual_income,
      company_name = EXCLUDED.company_name,
      city = EXCLUDED.city,
      district = EXCLUDED.district,
      about_me = EXCLUDED.about_me,
      family_type = EXCLUDED.family_type,
      family_status = EXCLUDED.family_status,
      is_verified = EXCLUDED.is_verified,
      is_premium = EXCLUDED.is_premium,
      is_profile_complete = EXCLUDED.is_profile_complete,
      profile_completion_percent = EXCLUDED.profile_completion_percent,
      last_active_at = EXCLUDED.last_active_at,
      star = EXCLUDED.star,
      raasi = EXCLUDED.raasi,
      lagnam = EXCLUDED.lagnam,
      gothram = EXCLUDED.gothram,
      tier = EXCLUDED.tier,
      contacts_remaining = EXCLUDED.contacts_remaining,
      interests_remaining = EXCLUDED.interests_remaining,
      food_habit = EXCLUDED.food_habit,
      smoking = EXCLUDED.smoking,
      drinking = EXCLUDED.drinking;
INSERT INTO public.profiles (
      id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at, star, raasi, lagnam, gothram, tier, contacts_remaining, interests_remaining, food_habit, smoking, drinking
    ) VALUES (
      '00000000-0000-4000-a000-00000000013c', 'TM000316', 'Vijaya Kumar', 'female', '1998-02-01', 167, 'never_married', 'Christian', 'Nadar Christian', 'Nadar Christian subcaste', 'no', 'M.B.B.S', 'M.B.B.S Graduate', 'Civil Engineer', 'Civil Engineer Details', '₹5 Lakhs - ₹7 Lakhs', 'Wipro', 'Madurai', 'Madurai', 'Hi, I am Vijaya. I have completed my M.B.B.S and am currently working as a Civil Engineer at Wipro in Madurai. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'middle_class', true, false, true, 100, NOW() - INTERVAL '4 days', 'Poorvashadha', 'Mesham', 'Dhanusu', 'Siva', 'free', 5, 5, 'vegetarian', 'no', 'no'
    ) ON CONFLICT (id) DO UPDATE SET
      profile_id = EXCLUDED.profile_id,
      display_name = EXCLUDED.display_name,
      gender = EXCLUDED.gender,
      date_of_birth = EXCLUDED.date_of_birth,
      height_cm = EXCLUDED.height_cm,
      marital_status = EXCLUDED.marital_status,
      religion = EXCLUDED.religion,
      caste = EXCLUDED.caste,
      subcaste = EXCLUDED.subcaste,
      dosham = EXCLUDED.dosham,
      education = EXCLUDED.education,
      education_detail = EXCLUDED.education_detail,
      occupation = EXCLUDED.occupation,
      occupation_detail = EXCLUDED.occupation_detail,
      annual_income = EXCLUDED.annual_income,
      company_name = EXCLUDED.company_name,
      city = EXCLUDED.city,
      district = EXCLUDED.district,
      about_me = EXCLUDED.about_me,
      family_type = EXCLUDED.family_type,
      family_status = EXCLUDED.family_status,
      is_verified = EXCLUDED.is_verified,
      is_premium = EXCLUDED.is_premium,
      is_profile_complete = EXCLUDED.is_profile_complete,
      profile_completion_percent = EXCLUDED.profile_completion_percent,
      last_active_at = EXCLUDED.last_active_at,
      star = EXCLUDED.star,
      raasi = EXCLUDED.raasi,
      lagnam = EXCLUDED.lagnam,
      gothram = EXCLUDED.gothram,
      tier = EXCLUDED.tier,
      contacts_remaining = EXCLUDED.contacts_remaining,
      interests_remaining = EXCLUDED.interests_remaining,
      food_habit = EXCLUDED.food_habit,
      smoking = EXCLUDED.smoking,
      drinking = EXCLUDED.drinking;
INSERT INTO public.profiles (
      id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at, star, raasi, lagnam, gothram, tier, contacts_remaining, interests_remaining, food_habit, smoking, drinking
    ) VALUES (
      '00000000-0000-4000-a000-00000000013d', 'TM000317', 'Bala Swamy', 'male', '1990-10-26', 170, 'never_married', 'Hindu', 'Mudaliar', 'Mudaliar subcaste', 'yes', 'B.A', 'B.A Graduate', 'HR Specialist', 'HR Specialist Details', '₹20 Lakhs+', 'Government Service', 'Tiruppur', 'Tiruppur', 'Hi, I am Bala. I have completed my B.A and am currently working as a HR Specialist at Government Service in Tiruppur. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'joint', 'upper_middle_class', true, true, true, 100, NOW() - INTERVAL '1 days', 'Poorvabhadrapada', 'Simham', 'Kumbam', 'Angirasa', 'gold', 50, 100, 'vegetarian', 'no', 'no'
    ) ON CONFLICT (id) DO UPDATE SET
      profile_id = EXCLUDED.profile_id,
      display_name = EXCLUDED.display_name,
      gender = EXCLUDED.gender,
      date_of_birth = EXCLUDED.date_of_birth,
      height_cm = EXCLUDED.height_cm,
      marital_status = EXCLUDED.marital_status,
      religion = EXCLUDED.religion,
      caste = EXCLUDED.caste,
      subcaste = EXCLUDED.subcaste,
      dosham = EXCLUDED.dosham,
      education = EXCLUDED.education,
      education_detail = EXCLUDED.education_detail,
      occupation = EXCLUDED.occupation,
      occupation_detail = EXCLUDED.occupation_detail,
      annual_income = EXCLUDED.annual_income,
      company_name = EXCLUDED.company_name,
      city = EXCLUDED.city,
      district = EXCLUDED.district,
      about_me = EXCLUDED.about_me,
      family_type = EXCLUDED.family_type,
      family_status = EXCLUDED.family_status,
      is_verified = EXCLUDED.is_verified,
      is_premium = EXCLUDED.is_premium,
      is_profile_complete = EXCLUDED.is_profile_complete,
      profile_completion_percent = EXCLUDED.profile_completion_percent,
      last_active_at = EXCLUDED.last_active_at,
      star = EXCLUDED.star,
      raasi = EXCLUDED.raasi,
      lagnam = EXCLUDED.lagnam,
      gothram = EXCLUDED.gothram,
      tier = EXCLUDED.tier,
      contacts_remaining = EXCLUDED.contacts_remaining,
      interests_remaining = EXCLUDED.interests_remaining,
      food_habit = EXCLUDED.food_habit,
      smoking = EXCLUDED.smoking,
      drinking = EXCLUDED.drinking;
INSERT INTO public.profiles (
      id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at, star, raasi, lagnam, gothram, tier, contacts_remaining, interests_remaining, food_habit, smoking, drinking
    ) VALUES (
      '00000000-0000-4000-a000-00000000013e', 'TM000318', 'Ramani Velan', 'female', '1993-02-10', 159, 'never_married', 'Hindu', 'Vishwakarma', NULL, 'yes', 'B.Com', 'B.Com Graduate', 'Doctor', 'Doctor Details', '₹5 Lakhs - ₹7 Lakhs', 'Self Employed', 'Tirunelveli', 'Tirunelveli', 'Hi, I am Ramani. I have completed my B.Com and am currently working as a Doctor at Self Employed in Tirunelveli. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'middle_class', true, false, true, 100, NOW() - INTERVAL '4 days', 'Aslesha', 'Kanni', 'Kumbam', 'Murugan', 'free', 5, 5, 'vegetarian', 'no', 'no'
    ) ON CONFLICT (id) DO UPDATE SET
      profile_id = EXCLUDED.profile_id,
      display_name = EXCLUDED.display_name,
      gender = EXCLUDED.gender,
      date_of_birth = EXCLUDED.date_of_birth,
      height_cm = EXCLUDED.height_cm,
      marital_status = EXCLUDED.marital_status,
      religion = EXCLUDED.religion,
      caste = EXCLUDED.caste,
      subcaste = EXCLUDED.subcaste,
      dosham = EXCLUDED.dosham,
      education = EXCLUDED.education,
      education_detail = EXCLUDED.education_detail,
      occupation = EXCLUDED.occupation,
      occupation_detail = EXCLUDED.occupation_detail,
      annual_income = EXCLUDED.annual_income,
      company_name = EXCLUDED.company_name,
      city = EXCLUDED.city,
      district = EXCLUDED.district,
      about_me = EXCLUDED.about_me,
      family_type = EXCLUDED.family_type,
      family_status = EXCLUDED.family_status,
      is_verified = EXCLUDED.is_verified,
      is_premium = EXCLUDED.is_premium,
      is_profile_complete = EXCLUDED.is_profile_complete,
      profile_completion_percent = EXCLUDED.profile_completion_percent,
      last_active_at = EXCLUDED.last_active_at,
      star = EXCLUDED.star,
      raasi = EXCLUDED.raasi,
      lagnam = EXCLUDED.lagnam,
      gothram = EXCLUDED.gothram,
      tier = EXCLUDED.tier,
      contacts_remaining = EXCLUDED.contacts_remaining,
      interests_remaining = EXCLUDED.interests_remaining,
      food_habit = EXCLUDED.food_habit,
      smoking = EXCLUDED.smoking,
      drinking = EXCLUDED.drinking;
INSERT INTO public.profiles (
      id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at, star, raasi, lagnam, gothram, tier, contacts_remaining, interests_remaining, food_habit, smoking, drinking
    ) VALUES (
      '00000000-0000-4000-a000-00000000013f', 'TM000319', 'Bala Balan', 'male', '1991-04-03', 173, 'never_married', 'Hindu', 'Arunthathiyar', NULL, 'no', 'M.B.B.S', 'M.B.B.S Graduate', 'Software Engineer', 'Software Engineer Details', '₹15 Lakhs - ₹20 Lakhs', 'Self Employed', 'Madurai', 'Madurai', 'Hi, I am Bala. I have completed my M.B.B.S and am currently working as a Software Engineer at Self Employed in Madurai. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'middle_class', true, true, true, 100, NOW() - INTERVAL '10 days', 'Chitra', 'Simham', 'Kanni', 'Vishnu', 'gold', 50, 100, 'vegetarian', 'no', 'no'
    ) ON CONFLICT (id) DO UPDATE SET
      profile_id = EXCLUDED.profile_id,
      display_name = EXCLUDED.display_name,
      gender = EXCLUDED.gender,
      date_of_birth = EXCLUDED.date_of_birth,
      height_cm = EXCLUDED.height_cm,
      marital_status = EXCLUDED.marital_status,
      religion = EXCLUDED.religion,
      caste = EXCLUDED.caste,
      subcaste = EXCLUDED.subcaste,
      dosham = EXCLUDED.dosham,
      education = EXCLUDED.education,
      education_detail = EXCLUDED.education_detail,
      occupation = EXCLUDED.occupation,
      occupation_detail = EXCLUDED.occupation_detail,
      annual_income = EXCLUDED.annual_income,
      company_name = EXCLUDED.company_name,
      city = EXCLUDED.city,
      district = EXCLUDED.district,
      about_me = EXCLUDED.about_me,
      family_type = EXCLUDED.family_type,
      family_status = EXCLUDED.family_status,
      is_verified = EXCLUDED.is_verified,
      is_premium = EXCLUDED.is_premium,
      is_profile_complete = EXCLUDED.is_profile_complete,
      profile_completion_percent = EXCLUDED.profile_completion_percent,
      last_active_at = EXCLUDED.last_active_at,
      star = EXCLUDED.star,
      raasi = EXCLUDED.raasi,
      lagnam = EXCLUDED.lagnam,
      gothram = EXCLUDED.gothram,
      tier = EXCLUDED.tier,
      contacts_remaining = EXCLUDED.contacts_remaining,
      interests_remaining = EXCLUDED.interests_remaining,
      food_habit = EXCLUDED.food_habit,
      smoking = EXCLUDED.smoking,
      drinking = EXCLUDED.drinking;
INSERT INTO public.profiles (
      id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at, star, raasi, lagnam, gothram, tier, contacts_remaining, interests_remaining, food_habit, smoking, drinking
    ) VALUES (
      '00000000-0000-4000-a000-000000000140', 'TM000320', 'Yazhini Gopal', 'female', '1993-06-10', 172, 'divorced', 'Hindu', 'Brahmin - Iyer', 'Brahmin - Iyer subcaste', 'no', 'M.Sc', 'M.Sc Graduate', 'Business Owner', 'Business Owner Details', '₹20 Lakhs+', 'Self Employed', 'Madurai', 'Madurai', 'Hi, I am Yazhini. I have completed my M.Sc and am currently working as a Business Owner at Self Employed in Madurai. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'rich', true, false, true, 100, NOW() - INTERVAL '4 days', 'Anuradha', 'Meenam', 'Mesham', 'Vishnu', 'free', 5, 5, 'vegetarian', 'no', 'no'
    ) ON CONFLICT (id) DO UPDATE SET
      profile_id = EXCLUDED.profile_id,
      display_name = EXCLUDED.display_name,
      gender = EXCLUDED.gender,
      date_of_birth = EXCLUDED.date_of_birth,
      height_cm = EXCLUDED.height_cm,
      marital_status = EXCLUDED.marital_status,
      religion = EXCLUDED.religion,
      caste = EXCLUDED.caste,
      subcaste = EXCLUDED.subcaste,
      dosham = EXCLUDED.dosham,
      education = EXCLUDED.education,
      education_detail = EXCLUDED.education_detail,
      occupation = EXCLUDED.occupation,
      occupation_detail = EXCLUDED.occupation_detail,
      annual_income = EXCLUDED.annual_income,
      company_name = EXCLUDED.company_name,
      city = EXCLUDED.city,
      district = EXCLUDED.district,
      about_me = EXCLUDED.about_me,
      family_type = EXCLUDED.family_type,
      family_status = EXCLUDED.family_status,
      is_verified = EXCLUDED.is_verified,
      is_premium = EXCLUDED.is_premium,
      is_profile_complete = EXCLUDED.is_profile_complete,
      profile_completion_percent = EXCLUDED.profile_completion_percent,
      last_active_at = EXCLUDED.last_active_at,
      star = EXCLUDED.star,
      raasi = EXCLUDED.raasi,
      lagnam = EXCLUDED.lagnam,
      gothram = EXCLUDED.gothram,
      tier = EXCLUDED.tier,
      contacts_remaining = EXCLUDED.contacts_remaining,
      interests_remaining = EXCLUDED.interests_remaining,
      food_habit = EXCLUDED.food_habit,
      smoking = EXCLUDED.smoking,
      drinking = EXCLUDED.drinking;
INSERT INTO public.profiles (
      id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at, star, raasi, lagnam, gothram, tier, contacts_remaining, interests_remaining, food_habit, smoking, drinking
    ) VALUES (
      '00000000-0000-4000-a000-000000000141', 'TM000321', 'Manikandan Lingam', 'male', '2000-04-21', 186, 'never_married', 'Hindu', 'Naicker', 'Naicker subcaste', 'no', 'M.B.B.S', 'M.B.B.S Graduate', 'Software Engineer', 'Software Engineer Details', '₹10 Lakhs - ₹15 Lakhs', 'Government Service', 'Coimbatore', 'Coimbatore', 'Hi, I am Manikandan. I have completed my M.B.B.S and am currently working as a Software Engineer at Government Service in Coimbatore. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'joint', 'rich', true, true, true, 100, NOW() - INTERVAL '4 days', 'Hasta', 'Simham', 'Thulaam', 'Atri', 'gold', 50, 100, 'vegetarian', 'no', 'no'
    ) ON CONFLICT (id) DO UPDATE SET
      profile_id = EXCLUDED.profile_id,
      display_name = EXCLUDED.display_name,
      gender = EXCLUDED.gender,
      date_of_birth = EXCLUDED.date_of_birth,
      height_cm = EXCLUDED.height_cm,
      marital_status = EXCLUDED.marital_status,
      religion = EXCLUDED.religion,
      caste = EXCLUDED.caste,
      subcaste = EXCLUDED.subcaste,
      dosham = EXCLUDED.dosham,
      education = EXCLUDED.education,
      education_detail = EXCLUDED.education_detail,
      occupation = EXCLUDED.occupation,
      occupation_detail = EXCLUDED.occupation_detail,
      annual_income = EXCLUDED.annual_income,
      company_name = EXCLUDED.company_name,
      city = EXCLUDED.city,
      district = EXCLUDED.district,
      about_me = EXCLUDED.about_me,
      family_type = EXCLUDED.family_type,
      family_status = EXCLUDED.family_status,
      is_verified = EXCLUDED.is_verified,
      is_premium = EXCLUDED.is_premium,
      is_profile_complete = EXCLUDED.is_profile_complete,
      profile_completion_percent = EXCLUDED.profile_completion_percent,
      last_active_at = EXCLUDED.last_active_at,
      star = EXCLUDED.star,
      raasi = EXCLUDED.raasi,
      lagnam = EXCLUDED.lagnam,
      gothram = EXCLUDED.gothram,
      tier = EXCLUDED.tier,
      contacts_remaining = EXCLUDED.contacts_remaining,
      interests_remaining = EXCLUDED.interests_remaining,
      food_habit = EXCLUDED.food_habit,
      smoking = EXCLUDED.smoking,
      drinking = EXCLUDED.drinking;
INSERT INTO public.profiles (
      id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at, star, raasi, lagnam, gothram, tier, contacts_remaining, interests_remaining, food_habit, smoking, drinking
    ) VALUES (
      '00000000-0000-4000-a000-000000000142', 'TM000322', 'Janani Samy', 'female', '1997-07-16', 161, 'never_married', 'Hindu', 'Arunthathiyar', NULL, 'no', 'Ph.D', 'Ph.D Graduate', 'Advocate', 'Advocate Details', '₹10 Lakhs - ₹15 Lakhs', 'Accenture', 'Erode', 'Erode', 'Hi, I am Janani. I have completed my Ph.D and am currently working as a Advocate at Accenture in Erode. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'upper_middle_class', true, true, true, 100, NOW() - INTERVAL '2 days', 'Poorvaphalguni', 'Kumbam', 'Mesham', 'Agastya', 'gold', 50, 100, 'vegetarian', 'no', 'no'
    ) ON CONFLICT (id) DO UPDATE SET
      profile_id = EXCLUDED.profile_id,
      display_name = EXCLUDED.display_name,
      gender = EXCLUDED.gender,
      date_of_birth = EXCLUDED.date_of_birth,
      height_cm = EXCLUDED.height_cm,
      marital_status = EXCLUDED.marital_status,
      religion = EXCLUDED.religion,
      caste = EXCLUDED.caste,
      subcaste = EXCLUDED.subcaste,
      dosham = EXCLUDED.dosham,
      education = EXCLUDED.education,
      education_detail = EXCLUDED.education_detail,
      occupation = EXCLUDED.occupation,
      occupation_detail = EXCLUDED.occupation_detail,
      annual_income = EXCLUDED.annual_income,
      company_name = EXCLUDED.company_name,
      city = EXCLUDED.city,
      district = EXCLUDED.district,
      about_me = EXCLUDED.about_me,
      family_type = EXCLUDED.family_type,
      family_status = EXCLUDED.family_status,
      is_verified = EXCLUDED.is_verified,
      is_premium = EXCLUDED.is_premium,
      is_profile_complete = EXCLUDED.is_profile_complete,
      profile_completion_percent = EXCLUDED.profile_completion_percent,
      last_active_at = EXCLUDED.last_active_at,
      star = EXCLUDED.star,
      raasi = EXCLUDED.raasi,
      lagnam = EXCLUDED.lagnam,
      gothram = EXCLUDED.gothram,
      tier = EXCLUDED.tier,
      contacts_remaining = EXCLUDED.contacts_remaining,
      interests_remaining = EXCLUDED.interests_remaining,
      food_habit = EXCLUDED.food_habit,
      smoking = EXCLUDED.smoking,
      drinking = EXCLUDED.drinking;
INSERT INTO public.profiles (
      id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at, star, raasi, lagnam, gothram, tier, contacts_remaining, interests_remaining, food_habit, smoking, drinking
    ) VALUES (
      '00000000-0000-4000-a000-000000000143', 'TM000323', 'Jayakumar Pandian', 'male', '1992-09-25', 169, 'never_married', 'Hindu', 'Maravar', NULL, 'no', 'M.B.A', 'M.B.A Graduate', 'Architect', 'Architect Details', '₹20 Lakhs+', 'Infosys', 'Tiruchirappalli', 'Trichy', 'Hi, I am Jayakumar. I have completed my M.B.A and am currently working as a Architect at Infosys in Tiruchirappalli. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'middle_class', true, true, true, 100, NOW() - INTERVAL '1 days', 'Anuradha', 'Rishabam', 'Kumbam', 'Siva', 'gold', 50, 100, 'vegetarian', 'no', 'no'
    ) ON CONFLICT (id) DO UPDATE SET
      profile_id = EXCLUDED.profile_id,
      display_name = EXCLUDED.display_name,
      gender = EXCLUDED.gender,
      date_of_birth = EXCLUDED.date_of_birth,
      height_cm = EXCLUDED.height_cm,
      marital_status = EXCLUDED.marital_status,
      religion = EXCLUDED.religion,
      caste = EXCLUDED.caste,
      subcaste = EXCLUDED.subcaste,
      dosham = EXCLUDED.dosham,
      education = EXCLUDED.education,
      education_detail = EXCLUDED.education_detail,
      occupation = EXCLUDED.occupation,
      occupation_detail = EXCLUDED.occupation_detail,
      annual_income = EXCLUDED.annual_income,
      company_name = EXCLUDED.company_name,
      city = EXCLUDED.city,
      district = EXCLUDED.district,
      about_me = EXCLUDED.about_me,
      family_type = EXCLUDED.family_type,
      family_status = EXCLUDED.family_status,
      is_verified = EXCLUDED.is_verified,
      is_premium = EXCLUDED.is_premium,
      is_profile_complete = EXCLUDED.is_profile_complete,
      profile_completion_percent = EXCLUDED.profile_completion_percent,
      last_active_at = EXCLUDED.last_active_at,
      star = EXCLUDED.star,
      raasi = EXCLUDED.raasi,
      lagnam = EXCLUDED.lagnam,
      gothram = EXCLUDED.gothram,
      tier = EXCLUDED.tier,
      contacts_remaining = EXCLUDED.contacts_remaining,
      interests_remaining = EXCLUDED.interests_remaining,
      food_habit = EXCLUDED.food_habit,
      smoking = EXCLUDED.smoking,
      drinking = EXCLUDED.drinking;
INSERT INTO public.profiles (
      id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at, star, raasi, lagnam, gothram, tier, contacts_remaining, interests_remaining, food_habit, smoking, drinking
    ) VALUES (
      '00000000-0000-4000-a000-000000000144', 'TM000324', 'Harini Mani', 'female', '2000-04-24', 158, 'never_married', 'Hindu', 'Agamudayar', NULL, 'no', 'Ph.D', 'Ph.D Graduate', 'Bank Manager', 'Bank Manager Details', '₹5 Lakhs - ₹7 Lakhs', 'Wipro', 'Chennai', 'Chennai', 'Hi, I am Harini. I have completed my Ph.D and am currently working as a Bank Manager at Wipro in Chennai. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'rich', true, false, true, 100, NOW() - INTERVAL '6 days', 'Uttarabhadrapada', 'Dhanusu', 'Kanni', 'Harita', 'free', 5, 5, 'vegetarian', 'no', 'no'
    ) ON CONFLICT (id) DO UPDATE SET
      profile_id = EXCLUDED.profile_id,
      display_name = EXCLUDED.display_name,
      gender = EXCLUDED.gender,
      date_of_birth = EXCLUDED.date_of_birth,
      height_cm = EXCLUDED.height_cm,
      marital_status = EXCLUDED.marital_status,
      religion = EXCLUDED.religion,
      caste = EXCLUDED.caste,
      subcaste = EXCLUDED.subcaste,
      dosham = EXCLUDED.dosham,
      education = EXCLUDED.education,
      education_detail = EXCLUDED.education_detail,
      occupation = EXCLUDED.occupation,
      occupation_detail = EXCLUDED.occupation_detail,
      annual_income = EXCLUDED.annual_income,
      company_name = EXCLUDED.company_name,
      city = EXCLUDED.city,
      district = EXCLUDED.district,
      about_me = EXCLUDED.about_me,
      family_type = EXCLUDED.family_type,
      family_status = EXCLUDED.family_status,
      is_verified = EXCLUDED.is_verified,
      is_premium = EXCLUDED.is_premium,
      is_profile_complete = EXCLUDED.is_profile_complete,
      profile_completion_percent = EXCLUDED.profile_completion_percent,
      last_active_at = EXCLUDED.last_active_at,
      star = EXCLUDED.star,
      raasi = EXCLUDED.raasi,
      lagnam = EXCLUDED.lagnam,
      gothram = EXCLUDED.gothram,
      tier = EXCLUDED.tier,
      contacts_remaining = EXCLUDED.contacts_remaining,
      interests_remaining = EXCLUDED.interests_remaining,
      food_habit = EXCLUDED.food_habit,
      smoking = EXCLUDED.smoking,
      drinking = EXCLUDED.drinking;
INSERT INTO public.profiles (
      id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at, star, raasi, lagnam, gothram, tier, contacts_remaining, interests_remaining, food_habit, smoking, drinking
    ) VALUES (
      '00000000-0000-4000-a000-000000000145', 'TM000325', 'Sundar Selvan', 'male', '1992-09-12', 188, 'never_married', 'Christian', 'Vellalar Christian', 'Vellalar Christian subcaste', 'yes', 'M.Com', 'M.Com Graduate', 'Civil Engineer', 'Civil Engineer Details', '₹7 Lakhs - ₹10 Lakhs', 'Zoho', 'Madurai', 'Madurai', 'Hi, I am Sundar. I have completed my M.Com and am currently working as a Civil Engineer at Zoho in Madurai. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'middle_class', false, false, true, 100, NOW() - INTERVAL '0 days', 'Anuradha', 'Thulaam', 'Kanni', 'Murugan', 'free', 5, 5, 'vegetarian', 'no', 'no'
    ) ON CONFLICT (id) DO UPDATE SET
      profile_id = EXCLUDED.profile_id,
      display_name = EXCLUDED.display_name,
      gender = EXCLUDED.gender,
      date_of_birth = EXCLUDED.date_of_birth,
      height_cm = EXCLUDED.height_cm,
      marital_status = EXCLUDED.marital_status,
      religion = EXCLUDED.religion,
      caste = EXCLUDED.caste,
      subcaste = EXCLUDED.subcaste,
      dosham = EXCLUDED.dosham,
      education = EXCLUDED.education,
      education_detail = EXCLUDED.education_detail,
      occupation = EXCLUDED.occupation,
      occupation_detail = EXCLUDED.occupation_detail,
      annual_income = EXCLUDED.annual_income,
      company_name = EXCLUDED.company_name,
      city = EXCLUDED.city,
      district = EXCLUDED.district,
      about_me = EXCLUDED.about_me,
      family_type = EXCLUDED.family_type,
      family_status = EXCLUDED.family_status,
      is_verified = EXCLUDED.is_verified,
      is_premium = EXCLUDED.is_premium,
      is_profile_complete = EXCLUDED.is_profile_complete,
      profile_completion_percent = EXCLUDED.profile_completion_percent,
      last_active_at = EXCLUDED.last_active_at,
      star = EXCLUDED.star,
      raasi = EXCLUDED.raasi,
      lagnam = EXCLUDED.lagnam,
      gothram = EXCLUDED.gothram,
      tier = EXCLUDED.tier,
      contacts_remaining = EXCLUDED.contacts_remaining,
      interests_remaining = EXCLUDED.interests_remaining,
      food_habit = EXCLUDED.food_habit,
      smoking = EXCLUDED.smoking,
      drinking = EXCLUDED.drinking;
INSERT INTO public.profiles (
      id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at, star, raasi, lagnam, gothram, tier, contacts_remaining, interests_remaining, food_habit, smoking, drinking
    ) VALUES (
      '00000000-0000-4000-a000-000000000146', 'TM000326', 'Saraswathi Kumar', 'female', '1991-10-16', 158, 'never_married', 'Muslim', 'Shia Muslim', NULL, 'no', 'B.A', 'B.A Graduate', 'Police Officer', 'Police Officer Details', '₹5 Lakhs - ₹7 Lakhs', 'Zoho', 'Chennai', 'Chennai', 'Hi, I am Saraswathi. I have completed my B.A and am currently working as a Police Officer at Zoho in Chennai. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'upper_middle_class', true, true, true, 100, NOW() - INTERVAL '2 days', 'Shravana', 'Rishabam', 'Mesham', 'Gautama', 'gold', 50, 100, 'vegetarian', 'no', 'no'
    ) ON CONFLICT (id) DO UPDATE SET
      profile_id = EXCLUDED.profile_id,
      display_name = EXCLUDED.display_name,
      gender = EXCLUDED.gender,
      date_of_birth = EXCLUDED.date_of_birth,
      height_cm = EXCLUDED.height_cm,
      marital_status = EXCLUDED.marital_status,
      religion = EXCLUDED.religion,
      caste = EXCLUDED.caste,
      subcaste = EXCLUDED.subcaste,
      dosham = EXCLUDED.dosham,
      education = EXCLUDED.education,
      education_detail = EXCLUDED.education_detail,
      occupation = EXCLUDED.occupation,
      occupation_detail = EXCLUDED.occupation_detail,
      annual_income = EXCLUDED.annual_income,
      company_name = EXCLUDED.company_name,
      city = EXCLUDED.city,
      district = EXCLUDED.district,
      about_me = EXCLUDED.about_me,
      family_type = EXCLUDED.family_type,
      family_status = EXCLUDED.family_status,
      is_verified = EXCLUDED.is_verified,
      is_premium = EXCLUDED.is_premium,
      is_profile_complete = EXCLUDED.is_profile_complete,
      profile_completion_percent = EXCLUDED.profile_completion_percent,
      last_active_at = EXCLUDED.last_active_at,
      star = EXCLUDED.star,
      raasi = EXCLUDED.raasi,
      lagnam = EXCLUDED.lagnam,
      gothram = EXCLUDED.gothram,
      tier = EXCLUDED.tier,
      contacts_remaining = EXCLUDED.contacts_remaining,
      interests_remaining = EXCLUDED.interests_remaining,
      food_habit = EXCLUDED.food_habit,
      smoking = EXCLUDED.smoking,
      drinking = EXCLUDED.drinking;
INSERT INTO public.profiles (
      id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at, star, raasi, lagnam, gothram, tier, contacts_remaining, interests_remaining, food_habit, smoking, drinking
    ) VALUES (
      '00000000-0000-4000-a000-000000000147', 'TM000327', 'Prakash Swamy', 'male', '1994-12-05', 172, 'never_married', 'Hindu', 'Pillai', NULL, 'no', 'B.A', 'B.A Graduate', 'Dentist', 'Dentist Details', '₹7 Lakhs - ₹10 Lakhs', 'Infosys', 'Tiruppur', 'Tiruppur', 'Hi, I am Prakash. I have completed my B.A and am currently working as a Dentist at Infosys in Tiruppur. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'middle_class', true, false, true, 100, NOW() - INTERVAL '7 days', 'Bharani', 'Kanni', 'Mesham', 'Angirasa', 'free', 5, 5, 'vegetarian', 'no', 'no'
    ) ON CONFLICT (id) DO UPDATE SET
      profile_id = EXCLUDED.profile_id,
      display_name = EXCLUDED.display_name,
      gender = EXCLUDED.gender,
      date_of_birth = EXCLUDED.date_of_birth,
      height_cm = EXCLUDED.height_cm,
      marital_status = EXCLUDED.marital_status,
      religion = EXCLUDED.religion,
      caste = EXCLUDED.caste,
      subcaste = EXCLUDED.subcaste,
      dosham = EXCLUDED.dosham,
      education = EXCLUDED.education,
      education_detail = EXCLUDED.education_detail,
      occupation = EXCLUDED.occupation,
      occupation_detail = EXCLUDED.occupation_detail,
      annual_income = EXCLUDED.annual_income,
      company_name = EXCLUDED.company_name,
      city = EXCLUDED.city,
      district = EXCLUDED.district,
      about_me = EXCLUDED.about_me,
      family_type = EXCLUDED.family_type,
      family_status = EXCLUDED.family_status,
      is_verified = EXCLUDED.is_verified,
      is_premium = EXCLUDED.is_premium,
      is_profile_complete = EXCLUDED.is_profile_complete,
      profile_completion_percent = EXCLUDED.profile_completion_percent,
      last_active_at = EXCLUDED.last_active_at,
      star = EXCLUDED.star,
      raasi = EXCLUDED.raasi,
      lagnam = EXCLUDED.lagnam,
      gothram = EXCLUDED.gothram,
      tier = EXCLUDED.tier,
      contacts_remaining = EXCLUDED.contacts_remaining,
      interests_remaining = EXCLUDED.interests_remaining,
      food_habit = EXCLUDED.food_habit,
      smoking = EXCLUDED.smoking,
      drinking = EXCLUDED.drinking;
INSERT INTO public.profiles (
      id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at, star, raasi, lagnam, gothram, tier, contacts_remaining, interests_remaining, food_habit, smoking, drinking
    ) VALUES (
      '00000000-0000-4000-a000-000000000148', 'TM000328', 'Nandhini Murthy', 'female', '1989-10-20', 163, 'never_married', 'Hindu', 'Pillai', 'Pillai subcaste', 'no', 'M.B.B.S', 'M.B.B.S Graduate', 'Auditor', 'Auditor Details', '₹20 Lakhs+', 'Infosys', 'Thoothukudi', 'Tuticorin', 'Hi, I am Nandhini. I have completed my M.B.B.S and am currently working as a Auditor at Infosys in Thoothukudi. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'upper_middle_class', true, false, true, 100, NOW() - INTERVAL '2 days', 'Poorvabhadrapada', 'Simham', 'Kanni', 'Murugan', 'free', 5, 5, 'vegetarian', 'no', 'no'
    ) ON CONFLICT (id) DO UPDATE SET
      profile_id = EXCLUDED.profile_id,
      display_name = EXCLUDED.display_name,
      gender = EXCLUDED.gender,
      date_of_birth = EXCLUDED.date_of_birth,
      height_cm = EXCLUDED.height_cm,
      marital_status = EXCLUDED.marital_status,
      religion = EXCLUDED.religion,
      caste = EXCLUDED.caste,
      subcaste = EXCLUDED.subcaste,
      dosham = EXCLUDED.dosham,
      education = EXCLUDED.education,
      education_detail = EXCLUDED.education_detail,
      occupation = EXCLUDED.occupation,
      occupation_detail = EXCLUDED.occupation_detail,
      annual_income = EXCLUDED.annual_income,
      company_name = EXCLUDED.company_name,
      city = EXCLUDED.city,
      district = EXCLUDED.district,
      about_me = EXCLUDED.about_me,
      family_type = EXCLUDED.family_type,
      family_status = EXCLUDED.family_status,
      is_verified = EXCLUDED.is_verified,
      is_premium = EXCLUDED.is_premium,
      is_profile_complete = EXCLUDED.is_profile_complete,
      profile_completion_percent = EXCLUDED.profile_completion_percent,
      last_active_at = EXCLUDED.last_active_at,
      star = EXCLUDED.star,
      raasi = EXCLUDED.raasi,
      lagnam = EXCLUDED.lagnam,
      gothram = EXCLUDED.gothram,
      tier = EXCLUDED.tier,
      contacts_remaining = EXCLUDED.contacts_remaining,
      interests_remaining = EXCLUDED.interests_remaining,
      food_habit = EXCLUDED.food_habit,
      smoking = EXCLUDED.smoking,
      drinking = EXCLUDED.drinking;
INSERT INTO public.profiles (
      id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at, star, raasi, lagnam, gothram, tier, contacts_remaining, interests_remaining, food_habit, smoking, drinking
    ) VALUES (
      '00000000-0000-4000-a000-000000000149', 'TM000329', 'Senthil Sundaram', 'male', '2001-06-08', 181, 'never_married', 'Hindu', 'Gounder', NULL, 'no', 'M.B.B.S', 'M.B.B.S Graduate', 'College Professor', 'College Professor Details', '₹5 Lakhs - ₹7 Lakhs', 'Government Service', 'Tiruchirappalli', 'Trichy', 'Hi, I am Senthil. I have completed my M.B.B.S and am currently working as a College Professor at Government Service in Tiruchirappalli. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'joint', 'middle_class', true, false, true, 100, NOW() - INTERVAL '1 days', 'Chitra', 'Magaram', 'Kadagam', 'Kasyapa', 'free', 5, 5, 'vegetarian', 'no', 'no'
    ) ON CONFLICT (id) DO UPDATE SET
      profile_id = EXCLUDED.profile_id,
      display_name = EXCLUDED.display_name,
      gender = EXCLUDED.gender,
      date_of_birth = EXCLUDED.date_of_birth,
      height_cm = EXCLUDED.height_cm,
      marital_status = EXCLUDED.marital_status,
      religion = EXCLUDED.religion,
      caste = EXCLUDED.caste,
      subcaste = EXCLUDED.subcaste,
      dosham = EXCLUDED.dosham,
      education = EXCLUDED.education,
      education_detail = EXCLUDED.education_detail,
      occupation = EXCLUDED.occupation,
      occupation_detail = EXCLUDED.occupation_detail,
      annual_income = EXCLUDED.annual_income,
      company_name = EXCLUDED.company_name,
      city = EXCLUDED.city,
      district = EXCLUDED.district,
      about_me = EXCLUDED.about_me,
      family_type = EXCLUDED.family_type,
      family_status = EXCLUDED.family_status,
      is_verified = EXCLUDED.is_verified,
      is_premium = EXCLUDED.is_premium,
      is_profile_complete = EXCLUDED.is_profile_complete,
      profile_completion_percent = EXCLUDED.profile_completion_percent,
      last_active_at = EXCLUDED.last_active_at,
      star = EXCLUDED.star,
      raasi = EXCLUDED.raasi,
      lagnam = EXCLUDED.lagnam,
      gothram = EXCLUDED.gothram,
      tier = EXCLUDED.tier,
      contacts_remaining = EXCLUDED.contacts_remaining,
      interests_remaining = EXCLUDED.interests_remaining,
      food_habit = EXCLUDED.food_habit,
      smoking = EXCLUDED.smoking,
      drinking = EXCLUDED.drinking;
INSERT INTO public.profiles (
      id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at, star, raasi, lagnam, gothram, tier, contacts_remaining, interests_remaining, food_habit, smoking, drinking
    ) VALUES (
      '00000000-0000-4000-a000-00000000014a', 'TM000330', 'Radha Kumar', 'female', '1996-12-08', 152, 'never_married', 'Hindu', 'Vishwakarma', NULL, 'yes', 'M.B.A', 'M.B.A Graduate', 'Business Owner', 'Business Owner Details', '₹10 Lakhs - ₹15 Lakhs', 'Government Service', 'Madurai', 'Madurai', 'Hi, I am Radha. I have completed my M.B.A and am currently working as a Business Owner at Government Service in Madurai. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'rich', false, false, true, 100, NOW() - INTERVAL '1 days', 'Krittika', 'Magaram', 'Dhanusu', 'Atri', 'free', 5, 5, 'vegetarian', 'no', 'no'
    ) ON CONFLICT (id) DO UPDATE SET
      profile_id = EXCLUDED.profile_id,
      display_name = EXCLUDED.display_name,
      gender = EXCLUDED.gender,
      date_of_birth = EXCLUDED.date_of_birth,
      height_cm = EXCLUDED.height_cm,
      marital_status = EXCLUDED.marital_status,
      religion = EXCLUDED.religion,
      caste = EXCLUDED.caste,
      subcaste = EXCLUDED.subcaste,
      dosham = EXCLUDED.dosham,
      education = EXCLUDED.education,
      education_detail = EXCLUDED.education_detail,
      occupation = EXCLUDED.occupation,
      occupation_detail = EXCLUDED.occupation_detail,
      annual_income = EXCLUDED.annual_income,
      company_name = EXCLUDED.company_name,
      city = EXCLUDED.city,
      district = EXCLUDED.district,
      about_me = EXCLUDED.about_me,
      family_type = EXCLUDED.family_type,
      family_status = EXCLUDED.family_status,
      is_verified = EXCLUDED.is_verified,
      is_premium = EXCLUDED.is_premium,
      is_profile_complete = EXCLUDED.is_profile_complete,
      profile_completion_percent = EXCLUDED.profile_completion_percent,
      last_active_at = EXCLUDED.last_active_at,
      star = EXCLUDED.star,
      raasi = EXCLUDED.raasi,
      lagnam = EXCLUDED.lagnam,
      gothram = EXCLUDED.gothram,
      tier = EXCLUDED.tier,
      contacts_remaining = EXCLUDED.contacts_remaining,
      interests_remaining = EXCLUDED.interests_remaining,
      food_habit = EXCLUDED.food_habit,
      smoking = EXCLUDED.smoking,
      drinking = EXCLUDED.drinking;
INSERT INTO public.profiles (
      id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at, star, raasi, lagnam, gothram, tier, contacts_remaining, interests_remaining, food_habit, smoking, drinking
    ) VALUES (
      '00000000-0000-4000-a000-00000000014b', 'TM000331', 'Senthil Raman', 'male', '2000-06-27', 171, 'never_married', 'Hindu', 'Brahmin - Iyer', NULL, 'no', 'M.A', 'M.A Graduate', 'Software Engineer', 'Software Engineer Details', '₹15 Lakhs - ₹20 Lakhs', 'TCS', 'Erode', 'Erode', 'Hi, I am Senthil. I have completed my M.A and am currently working as a Software Engineer at TCS in Erode. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'upper_middle_class', false, false, true, 100, NOW() - INTERVAL '10 days', 'Aslesha', 'Dhanusu', 'Dhanusu', 'Bharadwaj', 'free', 5, 5, 'vegetarian', 'no', 'no'
    ) ON CONFLICT (id) DO UPDATE SET
      profile_id = EXCLUDED.profile_id,
      display_name = EXCLUDED.display_name,
      gender = EXCLUDED.gender,
      date_of_birth = EXCLUDED.date_of_birth,
      height_cm = EXCLUDED.height_cm,
      marital_status = EXCLUDED.marital_status,
      religion = EXCLUDED.religion,
      caste = EXCLUDED.caste,
      subcaste = EXCLUDED.subcaste,
      dosham = EXCLUDED.dosham,
      education = EXCLUDED.education,
      education_detail = EXCLUDED.education_detail,
      occupation = EXCLUDED.occupation,
      occupation_detail = EXCLUDED.occupation_detail,
      annual_income = EXCLUDED.annual_income,
      company_name = EXCLUDED.company_name,
      city = EXCLUDED.city,
      district = EXCLUDED.district,
      about_me = EXCLUDED.about_me,
      family_type = EXCLUDED.family_type,
      family_status = EXCLUDED.family_status,
      is_verified = EXCLUDED.is_verified,
      is_premium = EXCLUDED.is_premium,
      is_profile_complete = EXCLUDED.is_profile_complete,
      profile_completion_percent = EXCLUDED.profile_completion_percent,
      last_active_at = EXCLUDED.last_active_at,
      star = EXCLUDED.star,
      raasi = EXCLUDED.raasi,
      lagnam = EXCLUDED.lagnam,
      gothram = EXCLUDED.gothram,
      tier = EXCLUDED.tier,
      contacts_remaining = EXCLUDED.contacts_remaining,
      interests_remaining = EXCLUDED.interests_remaining,
      food_habit = EXCLUDED.food_habit,
      smoking = EXCLUDED.smoking,
      drinking = EXCLUDED.drinking;
INSERT INTO public.profiles (
      id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at, star, raasi, lagnam, gothram, tier, contacts_remaining, interests_remaining, food_habit, smoking, drinking
    ) VALUES (
      '00000000-0000-4000-a000-00000000014c', 'TM000332', 'Shalini Shankar', 'female', '2005-02-25', 156, 'never_married', 'Hindu', 'Brahmin - Iyer', NULL, 'no', 'M.B.B.S', 'M.B.B.S Graduate', 'Dentist', 'Dentist Details', '₹15 Lakhs - ₹20 Lakhs', 'Wipro', 'Tirunelveli', 'Tirunelveli', 'Hi, I am Shalini. I have completed my M.B.B.S and am currently working as a Dentist at Wipro in Tirunelveli. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'rich', false, true, true, 100, NOW() - INTERVAL '9 days', 'Bharani', 'Dhanusu', 'Mithunam', 'Agastya', 'gold', 50, 100, 'vegetarian', 'no', 'no'
    ) ON CONFLICT (id) DO UPDATE SET
      profile_id = EXCLUDED.profile_id,
      display_name = EXCLUDED.display_name,
      gender = EXCLUDED.gender,
      date_of_birth = EXCLUDED.date_of_birth,
      height_cm = EXCLUDED.height_cm,
      marital_status = EXCLUDED.marital_status,
      religion = EXCLUDED.religion,
      caste = EXCLUDED.caste,
      subcaste = EXCLUDED.subcaste,
      dosham = EXCLUDED.dosham,
      education = EXCLUDED.education,
      education_detail = EXCLUDED.education_detail,
      occupation = EXCLUDED.occupation,
      occupation_detail = EXCLUDED.occupation_detail,
      annual_income = EXCLUDED.annual_income,
      company_name = EXCLUDED.company_name,
      city = EXCLUDED.city,
      district = EXCLUDED.district,
      about_me = EXCLUDED.about_me,
      family_type = EXCLUDED.family_type,
      family_status = EXCLUDED.family_status,
      is_verified = EXCLUDED.is_verified,
      is_premium = EXCLUDED.is_premium,
      is_profile_complete = EXCLUDED.is_profile_complete,
      profile_completion_percent = EXCLUDED.profile_completion_percent,
      last_active_at = EXCLUDED.last_active_at,
      star = EXCLUDED.star,
      raasi = EXCLUDED.raasi,
      lagnam = EXCLUDED.lagnam,
      gothram = EXCLUDED.gothram,
      tier = EXCLUDED.tier,
      contacts_remaining = EXCLUDED.contacts_remaining,
      interests_remaining = EXCLUDED.interests_remaining,
      food_habit = EXCLUDED.food_habit,
      smoking = EXCLUDED.smoking,
      drinking = EXCLUDED.drinking;
INSERT INTO public.profiles (
      id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at, star, raasi, lagnam, gothram, tier, contacts_remaining, interests_remaining, food_habit, smoking, drinking
    ) VALUES (
      '00000000-0000-4000-a000-00000000014d', 'TM000333', 'Velmurugan Krishnan', 'male', '1991-03-23', 172, 'divorced', 'Christian', 'Nadar Christian', NULL, 'no', 'B.Sc', 'B.Sc Graduate', 'Doctor', 'Doctor Details', '₹15 Lakhs - ₹20 Lakhs', 'Government Service', 'Chennai', 'Chennai', 'Hi, I am Velmurugan. I have completed my B.Sc and am currently working as a Doctor at Government Service in Chennai. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'middle_class', true, true, true, 100, NOW() - INTERVAL '3 days', 'Uttarachadha', 'Magaram', 'Kumbam', 'Bharadwaj', 'gold', 50, 100, 'vegetarian', 'no', 'no'
    ) ON CONFLICT (id) DO UPDATE SET
      profile_id = EXCLUDED.profile_id,
      display_name = EXCLUDED.display_name,
      gender = EXCLUDED.gender,
      date_of_birth = EXCLUDED.date_of_birth,
      height_cm = EXCLUDED.height_cm,
      marital_status = EXCLUDED.marital_status,
      religion = EXCLUDED.religion,
      caste = EXCLUDED.caste,
      subcaste = EXCLUDED.subcaste,
      dosham = EXCLUDED.dosham,
      education = EXCLUDED.education,
      education_detail = EXCLUDED.education_detail,
      occupation = EXCLUDED.occupation,
      occupation_detail = EXCLUDED.occupation_detail,
      annual_income = EXCLUDED.annual_income,
      company_name = EXCLUDED.company_name,
      city = EXCLUDED.city,
      district = EXCLUDED.district,
      about_me = EXCLUDED.about_me,
      family_type = EXCLUDED.family_type,
      family_status = EXCLUDED.family_status,
      is_verified = EXCLUDED.is_verified,
      is_premium = EXCLUDED.is_premium,
      is_profile_complete = EXCLUDED.is_profile_complete,
      profile_completion_percent = EXCLUDED.profile_completion_percent,
      last_active_at = EXCLUDED.last_active_at,
      star = EXCLUDED.star,
      raasi = EXCLUDED.raasi,
      lagnam = EXCLUDED.lagnam,
      gothram = EXCLUDED.gothram,
      tier = EXCLUDED.tier,
      contacts_remaining = EXCLUDED.contacts_remaining,
      interests_remaining = EXCLUDED.interests_remaining,
      food_habit = EXCLUDED.food_habit,
      smoking = EXCLUDED.smoking,
      drinking = EXCLUDED.drinking;
INSERT INTO public.profiles (
      id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at, star, raasi, lagnam, gothram, tier, contacts_remaining, interests_remaining, food_habit, smoking, drinking
    ) VALUES (
      '00000000-0000-4000-a000-00000000014e', 'TM000334', 'Nandhini Devan', 'female', '1997-08-27', 154, 'never_married', 'Hindu', 'Kallar', NULL, 'no', 'B.Com', 'B.Com Graduate', 'Police Officer', 'Police Officer Details', '₹10 Lakhs - ₹15 Lakhs', 'Cognizant', 'Chennai', 'Chennai', 'Hi, I am Nandhini. I have completed my B.Com and am currently working as a Police Officer at Cognizant in Chennai. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'middle_class', true, false, true, 100, NOW() - INTERVAL '0 days', 'Mirgashira', 'Kanni', 'Thulaam', 'Murugan', 'free', 5, 5, 'vegetarian', 'no', 'no'
    ) ON CONFLICT (id) DO UPDATE SET
      profile_id = EXCLUDED.profile_id,
      display_name = EXCLUDED.display_name,
      gender = EXCLUDED.gender,
      date_of_birth = EXCLUDED.date_of_birth,
      height_cm = EXCLUDED.height_cm,
      marital_status = EXCLUDED.marital_status,
      religion = EXCLUDED.religion,
      caste = EXCLUDED.caste,
      subcaste = EXCLUDED.subcaste,
      dosham = EXCLUDED.dosham,
      education = EXCLUDED.education,
      education_detail = EXCLUDED.education_detail,
      occupation = EXCLUDED.occupation,
      occupation_detail = EXCLUDED.occupation_detail,
      annual_income = EXCLUDED.annual_income,
      company_name = EXCLUDED.company_name,
      city = EXCLUDED.city,
      district = EXCLUDED.district,
      about_me = EXCLUDED.about_me,
      family_type = EXCLUDED.family_type,
      family_status = EXCLUDED.family_status,
      is_verified = EXCLUDED.is_verified,
      is_premium = EXCLUDED.is_premium,
      is_profile_complete = EXCLUDED.is_profile_complete,
      profile_completion_percent = EXCLUDED.profile_completion_percent,
      last_active_at = EXCLUDED.last_active_at,
      star = EXCLUDED.star,
      raasi = EXCLUDED.raasi,
      lagnam = EXCLUDED.lagnam,
      gothram = EXCLUDED.gothram,
      tier = EXCLUDED.tier,
      contacts_remaining = EXCLUDED.contacts_remaining,
      interests_remaining = EXCLUDED.interests_remaining,
      food_habit = EXCLUDED.food_habit,
      smoking = EXCLUDED.smoking,
      drinking = EXCLUDED.drinking;
INSERT INTO public.profiles (
      id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at, star, raasi, lagnam, gothram, tier, contacts_remaining, interests_remaining, food_habit, smoking, drinking
    ) VALUES (
      '00000000-0000-4000-a000-00000000014f', 'TM000335', 'Saravanan Swamy', 'male', '2000-10-07', 184, 'never_married', 'Hindu', 'Nadar', NULL, 'no', 'B.Com', 'B.Com Graduate', 'HR Specialist', 'HR Specialist Details', '₹15 Lakhs - ₹20 Lakhs', 'Government Service', 'Salem', 'Salem', 'Hi, I am Saravanan. I have completed my B.Com and am currently working as a HR Specialist at Government Service in Salem. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'joint', 'upper_middle_class', false, false, true, 100, NOW() - INTERVAL '4 days', 'Poorvabhadrapada', 'Meenam', 'Simham', 'Viswamitra', 'free', 5, 5, 'vegetarian', 'no', 'no'
    ) ON CONFLICT (id) DO UPDATE SET
      profile_id = EXCLUDED.profile_id,
      display_name = EXCLUDED.display_name,
      gender = EXCLUDED.gender,
      date_of_birth = EXCLUDED.date_of_birth,
      height_cm = EXCLUDED.height_cm,
      marital_status = EXCLUDED.marital_status,
      religion = EXCLUDED.religion,
      caste = EXCLUDED.caste,
      subcaste = EXCLUDED.subcaste,
      dosham = EXCLUDED.dosham,
      education = EXCLUDED.education,
      education_detail = EXCLUDED.education_detail,
      occupation = EXCLUDED.occupation,
      occupation_detail = EXCLUDED.occupation_detail,
      annual_income = EXCLUDED.annual_income,
      company_name = EXCLUDED.company_name,
      city = EXCLUDED.city,
      district = EXCLUDED.district,
      about_me = EXCLUDED.about_me,
      family_type = EXCLUDED.family_type,
      family_status = EXCLUDED.family_status,
      is_verified = EXCLUDED.is_verified,
      is_premium = EXCLUDED.is_premium,
      is_profile_complete = EXCLUDED.is_profile_complete,
      profile_completion_percent = EXCLUDED.profile_completion_percent,
      last_active_at = EXCLUDED.last_active_at,
      star = EXCLUDED.star,
      raasi = EXCLUDED.raasi,
      lagnam = EXCLUDED.lagnam,
      gothram = EXCLUDED.gothram,
      tier = EXCLUDED.tier,
      contacts_remaining = EXCLUDED.contacts_remaining,
      interests_remaining = EXCLUDED.interests_remaining,
      food_habit = EXCLUDED.food_habit,
      smoking = EXCLUDED.smoking,
      drinking = EXCLUDED.drinking;
INSERT INTO public.profiles (
      id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at, star, raasi, lagnam, gothram, tier, contacts_remaining, interests_remaining, food_habit, smoking, drinking
    ) VALUES (
      '00000000-0000-4000-a000-000000000150', 'TM000336', 'Swetha Kumar', 'female', '1995-06-06', 153, 'never_married', 'Muslim', 'Shia Muslim', 'Shia Muslim subcaste', 'no', 'B.Sc', 'B.Sc Graduate', 'Government Officer', 'Government Officer Details', '₹7 Lakhs - ₹10 Lakhs', 'Accenture', 'Kanchipuram', 'Kanchipuram', 'Hi, I am Swetha. I have completed my B.Sc and am currently working as a Government Officer at Accenture in Kanchipuram. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'middle_class', true, false, true, 100, NOW() - INTERVAL '2 days', 'Swati', 'Kumbam', 'Thulaam', 'Viswamitra', 'free', 5, 5, 'vegetarian', 'no', 'no'
    ) ON CONFLICT (id) DO UPDATE SET
      profile_id = EXCLUDED.profile_id,
      display_name = EXCLUDED.display_name,
      gender = EXCLUDED.gender,
      date_of_birth = EXCLUDED.date_of_birth,
      height_cm = EXCLUDED.height_cm,
      marital_status = EXCLUDED.marital_status,
      religion = EXCLUDED.religion,
      caste = EXCLUDED.caste,
      subcaste = EXCLUDED.subcaste,
      dosham = EXCLUDED.dosham,
      education = EXCLUDED.education,
      education_detail = EXCLUDED.education_detail,
      occupation = EXCLUDED.occupation,
      occupation_detail = EXCLUDED.occupation_detail,
      annual_income = EXCLUDED.annual_income,
      company_name = EXCLUDED.company_name,
      city = EXCLUDED.city,
      district = EXCLUDED.district,
      about_me = EXCLUDED.about_me,
      family_type = EXCLUDED.family_type,
      family_status = EXCLUDED.family_status,
      is_verified = EXCLUDED.is_verified,
      is_premium = EXCLUDED.is_premium,
      is_profile_complete = EXCLUDED.is_profile_complete,
      profile_completion_percent = EXCLUDED.profile_completion_percent,
      last_active_at = EXCLUDED.last_active_at,
      star = EXCLUDED.star,
      raasi = EXCLUDED.raasi,
      lagnam = EXCLUDED.lagnam,
      gothram = EXCLUDED.gothram,
      tier = EXCLUDED.tier,
      contacts_remaining = EXCLUDED.contacts_remaining,
      interests_remaining = EXCLUDED.interests_remaining,
      food_habit = EXCLUDED.food_habit,
      smoking = EXCLUDED.smoking,
      drinking = EXCLUDED.drinking;
INSERT INTO public.profiles (
      id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at, star, raasi, lagnam, gothram, tier, contacts_remaining, interests_remaining, food_habit, smoking, drinking
    ) VALUES (
      '00000000-0000-4000-a000-000000000151', 'TM000337', 'Ramesh Pandian', 'male', '2005-05-23', 178, 'never_married', 'Hindu', 'Pillai', NULL, 'no', 'M.B.A', 'M.B.A Graduate', 'School Teacher', 'School Teacher Details', '₹7 Lakhs - ₹10 Lakhs', 'Zoho', 'Tiruppur', 'Tiruppur', 'Hi, I am Ramesh. I have completed my M.B.A and am currently working as a School Teacher at Zoho in Tiruppur. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'joint', 'upper_middle_class', false, false, true, 100, NOW() - INTERVAL '2 days', 'Revati', 'Rishabam', 'Kumbam', 'Agastya', 'free', 5, 5, 'vegetarian', 'no', 'no'
    ) ON CONFLICT (id) DO UPDATE SET
      profile_id = EXCLUDED.profile_id,
      display_name = EXCLUDED.display_name,
      gender = EXCLUDED.gender,
      date_of_birth = EXCLUDED.date_of_birth,
      height_cm = EXCLUDED.height_cm,
      marital_status = EXCLUDED.marital_status,
      religion = EXCLUDED.religion,
      caste = EXCLUDED.caste,
      subcaste = EXCLUDED.subcaste,
      dosham = EXCLUDED.dosham,
      education = EXCLUDED.education,
      education_detail = EXCLUDED.education_detail,
      occupation = EXCLUDED.occupation,
      occupation_detail = EXCLUDED.occupation_detail,
      annual_income = EXCLUDED.annual_income,
      company_name = EXCLUDED.company_name,
      city = EXCLUDED.city,
      district = EXCLUDED.district,
      about_me = EXCLUDED.about_me,
      family_type = EXCLUDED.family_type,
      family_status = EXCLUDED.family_status,
      is_verified = EXCLUDED.is_verified,
      is_premium = EXCLUDED.is_premium,
      is_profile_complete = EXCLUDED.is_profile_complete,
      profile_completion_percent = EXCLUDED.profile_completion_percent,
      last_active_at = EXCLUDED.last_active_at,
      star = EXCLUDED.star,
      raasi = EXCLUDED.raasi,
      lagnam = EXCLUDED.lagnam,
      gothram = EXCLUDED.gothram,
      tier = EXCLUDED.tier,
      contacts_remaining = EXCLUDED.contacts_remaining,
      interests_remaining = EXCLUDED.interests_remaining,
      food_habit = EXCLUDED.food_habit,
      smoking = EXCLUDED.smoking,
      drinking = EXCLUDED.drinking;
INSERT INTO public.profiles (
      id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at, star, raasi, lagnam, gothram, tier, contacts_remaining, interests_remaining, food_habit, smoking, drinking
    ) VALUES (
      '00000000-0000-4000-a000-000000000152', 'TM000338', 'Rekha Gopal', 'female', '1988-11-24', 171, 'never_married', 'Muslim', 'Marakayar', 'Marakayar subcaste', 'no', 'B.Com', 'B.Com Graduate', 'College Professor', 'College Professor Details', '₹20 Lakhs+', 'TCS', 'Tirunelveli', 'Tirunelveli', 'Hi, I am Rekha. I have completed my B.Com and am currently working as a College Professor at TCS in Tirunelveli. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'upper_middle_class', true, false, true, 100, NOW() - INTERVAL '0 days', 'Aslesha', 'Kumbam', 'Mithunam', 'Kasyapa', 'free', 5, 5, 'vegetarian', 'no', 'no'
    ) ON CONFLICT (id) DO UPDATE SET
      profile_id = EXCLUDED.profile_id,
      display_name = EXCLUDED.display_name,
      gender = EXCLUDED.gender,
      date_of_birth = EXCLUDED.date_of_birth,
      height_cm = EXCLUDED.height_cm,
      marital_status = EXCLUDED.marital_status,
      religion = EXCLUDED.religion,
      caste = EXCLUDED.caste,
      subcaste = EXCLUDED.subcaste,
      dosham = EXCLUDED.dosham,
      education = EXCLUDED.education,
      education_detail = EXCLUDED.education_detail,
      occupation = EXCLUDED.occupation,
      occupation_detail = EXCLUDED.occupation_detail,
      annual_income = EXCLUDED.annual_income,
      company_name = EXCLUDED.company_name,
      city = EXCLUDED.city,
      district = EXCLUDED.district,
      about_me = EXCLUDED.about_me,
      family_type = EXCLUDED.family_type,
      family_status = EXCLUDED.family_status,
      is_verified = EXCLUDED.is_verified,
      is_premium = EXCLUDED.is_premium,
      is_profile_complete = EXCLUDED.is_profile_complete,
      profile_completion_percent = EXCLUDED.profile_completion_percent,
      last_active_at = EXCLUDED.last_active_at,
      star = EXCLUDED.star,
      raasi = EXCLUDED.raasi,
      lagnam = EXCLUDED.lagnam,
      gothram = EXCLUDED.gothram,
      tier = EXCLUDED.tier,
      contacts_remaining = EXCLUDED.contacts_remaining,
      interests_remaining = EXCLUDED.interests_remaining,
      food_habit = EXCLUDED.food_habit,
      smoking = EXCLUDED.smoking,
      drinking = EXCLUDED.drinking;
INSERT INTO public.profiles (
      id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at, star, raasi, lagnam, gothram, tier, contacts_remaining, interests_remaining, food_habit, smoking, drinking
    ) VALUES (
      '00000000-0000-4000-a000-000000000153', 'TM000339', 'Velmurugan Velan', 'male', '1989-03-11', 163, 'never_married', 'Muslim', 'Shia Muslim', NULL, 'yes', 'B.Sc', 'B.Sc Graduate', 'Police Officer', 'Police Officer Details', '₹5 Lakhs - ₹7 Lakhs', 'Self Employed', 'Thoothukudi', 'Tuticorin', 'Hi, I am Velmurugan. I have completed my B.Sc and am currently working as a Police Officer at Self Employed in Thoothukudi. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'rich', true, false, true, 100, NOW() - INTERVAL '6 days', 'Moola', 'Magaram', 'Dhanusu', 'Harita', 'free', 5, 5, 'vegetarian', 'no', 'no'
    ) ON CONFLICT (id) DO UPDATE SET
      profile_id = EXCLUDED.profile_id,
      display_name = EXCLUDED.display_name,
      gender = EXCLUDED.gender,
      date_of_birth = EXCLUDED.date_of_birth,
      height_cm = EXCLUDED.height_cm,
      marital_status = EXCLUDED.marital_status,
      religion = EXCLUDED.religion,
      caste = EXCLUDED.caste,
      subcaste = EXCLUDED.subcaste,
      dosham = EXCLUDED.dosham,
      education = EXCLUDED.education,
      education_detail = EXCLUDED.education_detail,
      occupation = EXCLUDED.occupation,
      occupation_detail = EXCLUDED.occupation_detail,
      annual_income = EXCLUDED.annual_income,
      company_name = EXCLUDED.company_name,
      city = EXCLUDED.city,
      district = EXCLUDED.district,
      about_me = EXCLUDED.about_me,
      family_type = EXCLUDED.family_type,
      family_status = EXCLUDED.family_status,
      is_verified = EXCLUDED.is_verified,
      is_premium = EXCLUDED.is_premium,
      is_profile_complete = EXCLUDED.is_profile_complete,
      profile_completion_percent = EXCLUDED.profile_completion_percent,
      last_active_at = EXCLUDED.last_active_at,
      star = EXCLUDED.star,
      raasi = EXCLUDED.raasi,
      lagnam = EXCLUDED.lagnam,
      gothram = EXCLUDED.gothram,
      tier = EXCLUDED.tier,
      contacts_remaining = EXCLUDED.contacts_remaining,
      interests_remaining = EXCLUDED.interests_remaining,
      food_habit = EXCLUDED.food_habit,
      smoking = EXCLUDED.smoking,
      drinking = EXCLUDED.drinking;
INSERT INTO public.profiles (
      id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at, star, raasi, lagnam, gothram, tier, contacts_remaining, interests_remaining, food_habit, smoking, drinking
    ) VALUES (
      '00000000-0000-4000-a000-000000000154', 'TM000340', 'Uma Mani', 'female', '2005-12-12', 152, 'never_married', 'Hindu', 'Agamudayar', 'Agamudayar subcaste', 'no', 'M.Sc', 'M.Sc Graduate', 'Architect', 'Architect Details', '₹3 Lakhs - ₹5 Lakhs', 'Government Service', 'Tirunelveli', 'Tirunelveli', 'Hi, I am Uma. I have completed my M.Sc and am currently working as a Architect at Government Service in Tirunelveli. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'upper_middle_class', false, false, true, 100, NOW() - INTERVAL '2 days', 'Arudra', 'Meenam', 'Meenam', 'Gautama', 'free', 5, 5, 'vegetarian', 'no', 'no'
    ) ON CONFLICT (id) DO UPDATE SET
      profile_id = EXCLUDED.profile_id,
      display_name = EXCLUDED.display_name,
      gender = EXCLUDED.gender,
      date_of_birth = EXCLUDED.date_of_birth,
      height_cm = EXCLUDED.height_cm,
      marital_status = EXCLUDED.marital_status,
      religion = EXCLUDED.religion,
      caste = EXCLUDED.caste,
      subcaste = EXCLUDED.subcaste,
      dosham = EXCLUDED.dosham,
      education = EXCLUDED.education,
      education_detail = EXCLUDED.education_detail,
      occupation = EXCLUDED.occupation,
      occupation_detail = EXCLUDED.occupation_detail,
      annual_income = EXCLUDED.annual_income,
      company_name = EXCLUDED.company_name,
      city = EXCLUDED.city,
      district = EXCLUDED.district,
      about_me = EXCLUDED.about_me,
      family_type = EXCLUDED.family_type,
      family_status = EXCLUDED.family_status,
      is_verified = EXCLUDED.is_verified,
      is_premium = EXCLUDED.is_premium,
      is_profile_complete = EXCLUDED.is_profile_complete,
      profile_completion_percent = EXCLUDED.profile_completion_percent,
      last_active_at = EXCLUDED.last_active_at,
      star = EXCLUDED.star,
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
VALUES ('00000000-0000-4000-a000-0000000000ab', 21, 31, ARRAY['Hindu']::TEXT[], ARRAY['Adi Dravida', 'Caste No Bar']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, religion, caste)
VALUES ('00000000-0000-4000-a000-0000000000ac', 26, 40, ARRAY['Hindu']::TEXT[], ARRAY['Arunthathiyar', 'Caste No Bar']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, religion, caste)
VALUES ('00000000-0000-4000-a000-0000000000ad', 23, 33, ARRAY['Hindu']::TEXT[], ARRAY['Nadar', 'Caste No Bar']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, religion, caste)
VALUES ('00000000-0000-4000-a000-0000000000ae', 28, 44, ARRAY['Hindu']::TEXT[], ARRAY['Naidu', 'Caste No Bar']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, religion, caste)
VALUES ('00000000-0000-4000-a000-0000000000af', 27, 30, ARRAY['Hindu']::TEXT[], ARRAY['Pillai', 'Caste No Bar']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, religion, caste)
VALUES ('00000000-0000-4000-a000-0000000000b0', 22, 30, ARRAY['Hindu']::TEXT[], ARRAY['Yadav', 'Caste No Bar']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, religion, caste)
VALUES ('00000000-0000-4000-a000-0000000000b1', 23, 31, ARRAY['Christian']::TEXT[], ARRAY['Protestant Christian', 'Caste No Bar']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, religion, caste)
VALUES ('00000000-0000-4000-a000-0000000000b2', 26, 33, ARRAY['Hindu']::TEXT[], ARRAY['Nadar', 'Caste No Bar']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, religion, caste)
VALUES ('00000000-0000-4000-a000-0000000000b3', 23, 45, ARRAY['Hindu']::TEXT[], ARRAY['Brahmin - Iyer', 'Caste No Bar']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, religion, caste)
VALUES ('00000000-0000-4000-a000-0000000000b4', 27, 31, ARRAY['Hindu']::TEXT[], ARRAY['Brahmin - Iyer', 'Caste No Bar']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, religion, caste)
VALUES ('00000000-0000-4000-a000-0000000000b5', 28, 41, ARRAY['Muslim']::TEXT[], ARRAY['Rawther', 'Caste No Bar']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, religion, caste)
VALUES ('00000000-0000-4000-a000-0000000000b6', 28, 45, ARRAY['Hindu']::TEXT[], ARRAY['Naidu', 'Caste No Bar']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, religion, caste)
VALUES ('00000000-0000-4000-a000-0000000000b7', 28, 45, ARRAY['Hindu']::TEXT[], ARRAY['Chettiar', 'Caste No Bar']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, religion, caste)
VALUES ('00000000-0000-4000-a000-0000000000b8', 27, 44, ARRAY['Hindu']::TEXT[], ARRAY['Maravar', 'Caste No Bar']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, religion, caste)
VALUES ('00000000-0000-4000-a000-0000000000b9', 27, 33, ARRAY['Hindu']::TEXT[], ARRAY['Vanniyar', 'Caste No Bar']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, religion, caste)
VALUES ('00000000-0000-4000-a000-0000000000ba', 27, 45, ARRAY['Hindu']::TEXT[], ARRAY['Vishwakarma', 'Caste No Bar']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, religion, caste)
VALUES ('00000000-0000-4000-a000-0000000000bb', 25, 38, ARRAY['Hindu']::TEXT[], ARRAY['Agamudayar', 'Caste No Bar']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, religion, caste)
VALUES ('00000000-0000-4000-a000-0000000000bc', 21, 30, ARRAY['Muslim']::TEXT[], ARRAY['Rawther', 'Caste No Bar']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, religion, caste)
VALUES ('00000000-0000-4000-a000-0000000000bd', 25, 32, ARRAY['Hindu']::TEXT[], ARRAY['Pillai', 'Caste No Bar']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, religion, caste)
VALUES ('00000000-0000-4000-a000-0000000000be', 28, 35, ARRAY['Hindu']::TEXT[], ARRAY['Devendra Kula Vellalar', 'Caste No Bar']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, religion, caste)
VALUES ('00000000-0000-4000-a000-0000000000bf', 22, 32, ARRAY['Hindu']::TEXT[], ARRAY['Adi Dravida', 'Caste No Bar']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, religion, caste)
VALUES ('00000000-0000-4000-a000-0000000000c0', 21, 35, ARRAY['Hindu']::TEXT[], ARRAY['Maravar', 'Caste No Bar']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, religion, caste)
VALUES ('00000000-0000-4000-a000-0000000000c1', 22, 40, ARRAY['Hindu']::TEXT[], ARRAY['Pillai', 'Caste No Bar']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, religion, caste)
VALUES ('00000000-0000-4000-a000-0000000000c2', 25, 42, ARRAY['Hindu']::TEXT[], ARRAY['Mudaliar', 'Caste No Bar']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, religion, caste)
VALUES ('00000000-0000-4000-a000-0000000000c3', 21, 40, ARRAY['Hindu']::TEXT[], ARRAY['Naidu', 'Caste No Bar']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, religion, caste)
VALUES ('00000000-0000-4000-a000-0000000000c4', 23, 38, ARRAY['Hindu']::TEXT[], ARRAY['Naicker', 'Caste No Bar']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, religion, caste)
VALUES ('00000000-0000-4000-a000-0000000000c5', 25, 32, ARRAY['Hindu']::TEXT[], ARRAY['Agamudayar', 'Caste No Bar']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, religion, caste)
VALUES ('00000000-0000-4000-a000-0000000000c6', 23, 31, ARRAY['Hindu']::TEXT[], ARRAY['Adi Dravida', 'Caste No Bar']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, religion, caste)
VALUES ('00000000-0000-4000-a000-0000000000c7', 26, 38, ARRAY['Muslim']::TEXT[], ARRAY['Rawther', 'Caste No Bar']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, religion, caste)
VALUES ('00000000-0000-4000-a000-0000000000c8', 22, 34, ARRAY['Hindu']::TEXT[], ARRAY['Brahmin - Iyer', 'Caste No Bar']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, religion, caste)
VALUES ('00000000-0000-4000-a000-0000000000c9', 21, 34, ARRAY['Hindu']::TEXT[], ARRAY['Agamudayar', 'Caste No Bar']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, religion, caste)
VALUES ('00000000-0000-4000-a000-0000000000ca', 25, 42, ARRAY['Hindu']::TEXT[], ARRAY['Brahmin - Iyer', 'Caste No Bar']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, religion, caste)
VALUES ('00000000-0000-4000-a000-0000000000cb', 22, 44, ARRAY['Christian']::TEXT[], ARRAY['RC Christian', 'Caste No Bar']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, religion, caste)
VALUES ('00000000-0000-4000-a000-0000000000cc', 23, 43, ARRAY['Hindu']::TEXT[], ARRAY['Brahmin - Iyer', 'Caste No Bar']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, religion, caste)
VALUES ('00000000-0000-4000-a000-0000000000cd', 22, 32, ARRAY['Hindu']::TEXT[], ARRAY['Arunthathiyar', 'Caste No Bar']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, religion, caste)
VALUES ('00000000-0000-4000-a000-0000000000ce', 22, 34, ARRAY['Hindu']::TEXT[], ARRAY['Adi Dravida', 'Caste No Bar']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, religion, caste)
VALUES ('00000000-0000-4000-a000-0000000000cf', 24, 37, ARRAY['Muslim']::TEXT[], ARRAY['Shia Muslim', 'Caste No Bar']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, religion, caste)
VALUES ('00000000-0000-4000-a000-0000000000d0', 27, 40, ARRAY['Hindu']::TEXT[], ARRAY['Nadar', 'Caste No Bar']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, religion, caste)
VALUES ('00000000-0000-4000-a000-0000000000d1', 27, 40, ARRAY['Hindu']::TEXT[], ARRAY['Maravar', 'Caste No Bar']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, religion, caste)
VALUES ('00000000-0000-4000-a000-0000000000d2', 23, 33, ARRAY['Hindu']::TEXT[], ARRAY['Brahmin - Iyer', 'Caste No Bar']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, religion, caste)
VALUES ('00000000-0000-4000-a000-0000000000d3', 24, 39, ARRAY['Hindu']::TEXT[], ARRAY['Kallar', 'Caste No Bar']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, religion, caste)
VALUES ('00000000-0000-4000-a000-0000000000d4', 24, 33, ARRAY['Hindu']::TEXT[], ARRAY['Gounder', 'Caste No Bar']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, religion, caste)
VALUES ('00000000-0000-4000-a000-0000000000d5', 28, 38, ARRAY['Hindu']::TEXT[], ARRAY['Arunthathiyar', 'Caste No Bar']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, religion, caste)
VALUES ('00000000-0000-4000-a000-0000000000d6', 27, 39, ARRAY['Christian']::TEXT[], ARRAY['Pentecostal', 'Caste No Bar']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, religion, caste)
VALUES ('00000000-0000-4000-a000-0000000000d7', 27, 33, ARRAY['Hindu']::TEXT[], ARRAY['Devendra Kula Vellalar', 'Caste No Bar']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, religion, caste)
VALUES ('00000000-0000-4000-a000-0000000000d8', 26, 35, ARRAY['Hindu']::TEXT[], ARRAY['Adi Dravida', 'Caste No Bar']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, religion, caste)
VALUES ('00000000-0000-4000-a000-0000000000d9', 25, 45, ARRAY['Hindu']::TEXT[], ARRAY['Brahmin - Iyer', 'Caste No Bar']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, religion, caste)
VALUES ('00000000-0000-4000-a000-0000000000da', 27, 35, ARRAY['Hindu']::TEXT[], ARRAY['Devendra Kula Vellalar', 'Caste No Bar']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, religion, caste)
VALUES ('00000000-0000-4000-a000-0000000000db', 28, 42, ARRAY['Hindu']::TEXT[], ARRAY['Sengunthar', 'Caste No Bar']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, religion, caste)
VALUES ('00000000-0000-4000-a000-0000000000dc', 21, 43, ARRAY['Hindu']::TEXT[], ARRAY['Devendra Kula Vellalar', 'Caste No Bar']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, religion, caste)
VALUES ('00000000-0000-4000-a000-0000000000dd', 21, 39, ARRAY['Hindu']::TEXT[], ARRAY['Kallar', 'Caste No Bar']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, religion, caste)
VALUES ('00000000-0000-4000-a000-0000000000de', 21, 32, ARRAY['Christian']::TEXT[], ARRAY['Vellalar Christian', 'Caste No Bar']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, religion, caste)
VALUES ('00000000-0000-4000-a000-0000000000df', 27, 42, ARRAY['Hindu']::TEXT[], ARRAY['Nadar', 'Caste No Bar']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, religion, caste)
VALUES ('00000000-0000-4000-a000-0000000000e0', 25, 34, ARRAY['Hindu']::TEXT[], ARRAY['Arunthathiyar', 'Caste No Bar']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, religion, caste)
VALUES ('00000000-0000-4000-a000-0000000000e1', 26, 32, ARRAY['Hindu']::TEXT[], ARRAY['Sengunthar', 'Caste No Bar']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, religion, caste)
VALUES ('00000000-0000-4000-a000-0000000000e2', 26, 30, ARRAY['Hindu']::TEXT[], ARRAY['Naidu', 'Caste No Bar']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, religion, caste)
VALUES ('00000000-0000-4000-a000-0000000000e3', 25, 36, ARRAY['Hindu']::TEXT[], ARRAY['Adi Dravida', 'Caste No Bar']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, religion, caste)
VALUES ('00000000-0000-4000-a000-0000000000e4', 23, 36, ARRAY['Hindu']::TEXT[], ARRAY['Sengunthar', 'Caste No Bar']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, religion, caste)
VALUES ('00000000-0000-4000-a000-0000000000e5', 25, 35, ARRAY['Hindu']::TEXT[], ARRAY['Gounder', 'Caste No Bar']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, religion, caste)
VALUES ('00000000-0000-4000-a000-0000000000e6', 26, 34, ARRAY['Hindu']::TEXT[], ARRAY['Brahmin - Iyengar', 'Caste No Bar']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, religion, caste)
VALUES ('00000000-0000-4000-a000-0000000000e7', 27, 42, ARRAY['Hindu']::TEXT[], ARRAY['Brahmin - Iyengar', 'Caste No Bar']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, religion, caste)
VALUES ('00000000-0000-4000-a000-0000000000e8', 27, 42, ARRAY['Hindu']::TEXT[], ARRAY['Mudaliar', 'Caste No Bar']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, religion, caste)
VALUES ('00000000-0000-4000-a000-0000000000e9', 21, 34, ARRAY['Hindu']::TEXT[], ARRAY['Naicker', 'Caste No Bar']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, religion, caste)
VALUES ('00000000-0000-4000-a000-0000000000ea', 25, 35, ARRAY['Hindu']::TEXT[], ARRAY['Yadav', 'Caste No Bar']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, religion, caste)
VALUES ('00000000-0000-4000-a000-0000000000eb', 22, 38, ARRAY['Hindu']::TEXT[], ARRAY['Maravar', 'Caste No Bar']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, religion, caste)
VALUES ('00000000-0000-4000-a000-0000000000ec', 26, 45, ARRAY['Muslim']::TEXT[], ARRAY['Labbai', 'Caste No Bar']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, religion, caste)
VALUES ('00000000-0000-4000-a000-0000000000ed', 21, 39, ARRAY['Hindu']::TEXT[], ARRAY['Mudaliar', 'Caste No Bar']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, religion, caste)
VALUES ('00000000-0000-4000-a000-0000000000ee', 25, 35, ARRAY['Hindu']::TEXT[], ARRAY['Maravar', 'Caste No Bar']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, religion, caste)
VALUES ('00000000-0000-4000-a000-0000000000ef', 26, 41, ARRAY['Hindu']::TEXT[], ARRAY['Brahmin - Iyengar', 'Caste No Bar']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, religion, caste)
VALUES ('00000000-0000-4000-a000-0000000000f0', 26, 44, ARRAY['Hindu']::TEXT[], ARRAY['Vellalar', 'Caste No Bar']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, religion, caste)
VALUES ('00000000-0000-4000-a000-0000000000f1', 27, 42, ARRAY['Muslim']::TEXT[], ARRAY['Sunni Muslim', 'Caste No Bar']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, religion, caste)
VALUES ('00000000-0000-4000-a000-0000000000f2', 21, 38, ARRAY['Hindu']::TEXT[], ARRAY['Devendra Kula Vellalar', 'Caste No Bar']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, religion, caste)
VALUES ('00000000-0000-4000-a000-0000000000f3', 27, 42, ARRAY['Hindu']::TEXT[], ARRAY['Chettiar', 'Caste No Bar']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, religion, caste)
VALUES ('00000000-0000-4000-a000-0000000000f4', 24, 38, ARRAY['Hindu']::TEXT[], ARRAY['Kallar', 'Caste No Bar']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, religion, caste)
VALUES ('00000000-0000-4000-a000-0000000000f5', 21, 39, ARRAY['Hindu']::TEXT[], ARRAY['Kallar', 'Caste No Bar']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, religion, caste)
VALUES ('00000000-0000-4000-a000-0000000000f6', 26, 40, ARRAY['Hindu']::TEXT[], ARRAY['Brahmin - Iyengar', 'Caste No Bar']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, religion, caste)
VALUES ('00000000-0000-4000-a000-0000000000f7', 25, 40, ARRAY['Hindu']::TEXT[], ARRAY['Naidu', 'Caste No Bar']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, religion, caste)
VALUES ('00000000-0000-4000-a000-0000000000f8', 28, 35, ARRAY['Hindu']::TEXT[], ARRAY['Maravar', 'Caste No Bar']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, religion, caste)
VALUES ('00000000-0000-4000-a000-0000000000f9', 21, 30, ARRAY['Hindu']::TEXT[], ARRAY['Naidu', 'Caste No Bar']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, religion, caste)
VALUES ('00000000-0000-4000-a000-0000000000fa', 23, 40, ARRAY['Hindu']::TEXT[], ARRAY['Naicker', 'Caste No Bar']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, religion, caste)
VALUES ('00000000-0000-4000-a000-0000000000fb', 25, 43, ARRAY['Hindu']::TEXT[], ARRAY['Mudaliar', 'Caste No Bar']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, religion, caste)
VALUES ('00000000-0000-4000-a000-0000000000fc', 23, 41, ARRAY['Hindu']::TEXT[], ARRAY['Adi Dravida', 'Caste No Bar']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, religion, caste)
VALUES ('00000000-0000-4000-a000-0000000000fd', 28, 40, ARRAY['Hindu']::TEXT[], ARRAY['Devendra Kula Vellalar', 'Caste No Bar']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, religion, caste)
VALUES ('00000000-0000-4000-a000-0000000000fe', 26, 41, ARRAY['Hindu']::TEXT[], ARRAY['Arunthathiyar', 'Caste No Bar']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, religion, caste)
VALUES ('00000000-0000-4000-a000-0000000000ff', 25, 44, ARRAY['Hindu']::TEXT[], ARRAY['Naicker', 'Caste No Bar']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, religion, caste)
VALUES ('00000000-0000-4000-a000-000000000100', 21, 33, ARRAY['Hindu']::TEXT[], ARRAY['Pillai', 'Caste No Bar']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, religion, caste)
VALUES ('00000000-0000-4000-a000-000000000101', 21, 35, ARRAY['Hindu']::TEXT[], ARRAY['Devendra Kula Vellalar', 'Caste No Bar']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, religion, caste)
VALUES ('00000000-0000-4000-a000-000000000102', 23, 30, ARRAY['Hindu']::TEXT[], ARRAY['Pillai', 'Caste No Bar']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, religion, caste)
VALUES ('00000000-0000-4000-a000-000000000103', 22, 41, ARRAY['Hindu']::TEXT[], ARRAY['Vishwakarma', 'Caste No Bar']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, religion, caste)
VALUES ('00000000-0000-4000-a000-000000000104', 22, 44, ARRAY['Hindu']::TEXT[], ARRAY['Vanniyar', 'Caste No Bar']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, religion, caste)
VALUES ('00000000-0000-4000-a000-000000000105', 24, 38, ARRAY['Hindu']::TEXT[], ARRAY['Kallar', 'Caste No Bar']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, religion, caste)
VALUES ('00000000-0000-4000-a000-000000000106', 27, 41, ARRAY['Hindu']::TEXT[], ARRAY['Naidu', 'Caste No Bar']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, religion, caste)
VALUES ('00000000-0000-4000-a000-000000000107', 22, 33, ARRAY['Hindu']::TEXT[], ARRAY['Chettiar', 'Caste No Bar']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, religion, caste)
VALUES ('00000000-0000-4000-a000-000000000108', 27, 31, ARRAY['Hindu']::TEXT[], ARRAY['Kallar', 'Caste No Bar']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, religion, caste)
VALUES ('00000000-0000-4000-a000-000000000109', 27, 39, ARRAY['Hindu']::TEXT[], ARRAY['Devendra Kula Vellalar', 'Caste No Bar']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, religion, caste)
VALUES ('00000000-0000-4000-a000-00000000010a', 28, 40, ARRAY['Hindu']::TEXT[], ARRAY['Devendra Kula Vellalar', 'Caste No Bar']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, religion, caste)
VALUES ('00000000-0000-4000-a000-00000000010b', 28, 33, ARRAY['Hindu']::TEXT[], ARRAY['Brahmin - Iyer', 'Caste No Bar']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, religion, caste)
VALUES ('00000000-0000-4000-a000-00000000010c', 22, 32, ARRAY['Hindu']::TEXT[], ARRAY['Brahmin - Iyer', 'Caste No Bar']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, religion, caste)
VALUES ('00000000-0000-4000-a000-00000000010d', 24, 31, ARRAY['Hindu']::TEXT[], ARRAY['Maravar', 'Caste No Bar']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, religion, caste)
VALUES ('00000000-0000-4000-a000-00000000010e', 26, 41, ARRAY['Hindu']::TEXT[], ARRAY['Sengunthar', 'Caste No Bar']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, religion, caste)
VALUES ('00000000-0000-4000-a000-00000000010f', 22, 37, ARRAY['Hindu']::TEXT[], ARRAY['Maravar', 'Caste No Bar']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, religion, caste)
VALUES ('00000000-0000-4000-a000-000000000110', 22, 35, ARRAY['Hindu']::TEXT[], ARRAY['Brahmin - Iyengar', 'Caste No Bar']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, religion, caste)
VALUES ('00000000-0000-4000-a000-000000000111', 23, 37, ARRAY['Hindu']::TEXT[], ARRAY['Yadav', 'Caste No Bar']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, religion, caste)
VALUES ('00000000-0000-4000-a000-000000000112', 25, 35, ARRAY['Christian']::TEXT[], ARRAY['Vellalar Christian', 'Caste No Bar']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, religion, caste)
VALUES ('00000000-0000-4000-a000-000000000113', 27, 45, ARRAY['Hindu']::TEXT[], ARRAY['Vellalar', 'Caste No Bar']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, religion, caste)
VALUES ('00000000-0000-4000-a000-000000000114', 27, 40, ARRAY['Hindu']::TEXT[], ARRAY['Maravar', 'Caste No Bar']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, religion, caste)
VALUES ('00000000-0000-4000-a000-000000000115', 25, 43, ARRAY['Hindu']::TEXT[], ARRAY['Sengunthar', 'Caste No Bar']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, religion, caste)
VALUES ('00000000-0000-4000-a000-000000000116', 23, 33, ARRAY['Hindu']::TEXT[], ARRAY['Sengunthar', 'Caste No Bar']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, religion, caste)
VALUES ('00000000-0000-4000-a000-000000000117', 22, 30, ARRAY['Hindu']::TEXT[], ARRAY['Arunthathiyar', 'Caste No Bar']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, religion, caste)
VALUES ('00000000-0000-4000-a000-000000000118', 25, 40, ARRAY['Hindu']::TEXT[], ARRAY['Brahmin - Iyer', 'Caste No Bar']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, religion, caste)
VALUES ('00000000-0000-4000-a000-000000000119', 21, 44, ARRAY['Hindu']::TEXT[], ARRAY['Maravar', 'Caste No Bar']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, religion, caste)
VALUES ('00000000-0000-4000-a000-00000000011a', 27, 35, ARRAY['Muslim']::TEXT[], ARRAY['Marakayar', 'Caste No Bar']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, religion, caste)
VALUES ('00000000-0000-4000-a000-00000000011b', 21, 32, ARRAY['Muslim']::TEXT[], ARRAY['Marakayar', 'Caste No Bar']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, religion, caste)
VALUES ('00000000-0000-4000-a000-00000000011c', 26, 43, ARRAY['Hindu']::TEXT[], ARRAY['Agamudayar', 'Caste No Bar']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, religion, caste)
VALUES ('00000000-0000-4000-a000-00000000011d', 26, 37, ARRAY['Hindu']::TEXT[], ARRAY['Gounder', 'Caste No Bar']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, religion, caste)
VALUES ('00000000-0000-4000-a000-00000000011e', 25, 35, ARRAY['Hindu']::TEXT[], ARRAY['Adi Dravida', 'Caste No Bar']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, religion, caste)
VALUES ('00000000-0000-4000-a000-00000000011f', 25, 33, ARRAY['Hindu']::TEXT[], ARRAY['Mudaliar', 'Caste No Bar']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, religion, caste)
VALUES ('00000000-0000-4000-a000-000000000120', 23, 38, ARRAY['Hindu']::TEXT[], ARRAY['Devendra Kula Vellalar', 'Caste No Bar']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, religion, caste)
VALUES ('00000000-0000-4000-a000-000000000121', 21, 35, ARRAY['Hindu']::TEXT[], ARRAY['Yadav', 'Caste No Bar']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, religion, caste)
VALUES ('00000000-0000-4000-a000-000000000122', 25, 43, ARRAY['Hindu']::TEXT[], ARRAY['Naicker', 'Caste No Bar']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, religion, caste)
VALUES ('00000000-0000-4000-a000-000000000123', 27, 33, ARRAY['Hindu']::TEXT[], ARRAY['Nadar', 'Caste No Bar']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, religion, caste)
VALUES ('00000000-0000-4000-a000-000000000124', 23, 42, ARRAY['Christian']::TEXT[], ARRAY['Protestant Christian', 'Caste No Bar']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, religion, caste)
VALUES ('00000000-0000-4000-a000-000000000125', 23, 40, ARRAY['Hindu']::TEXT[], ARRAY['Gounder', 'Caste No Bar']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, religion, caste)
VALUES ('00000000-0000-4000-a000-000000000126', 24, 32, ARRAY['Hindu']::TEXT[], ARRAY['Mudaliar', 'Caste No Bar']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, religion, caste)
VALUES ('00000000-0000-4000-a000-000000000127', 27, 41, ARRAY['Hindu']::TEXT[], ARRAY['Vishwakarma', 'Caste No Bar']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, religion, caste)
VALUES ('00000000-0000-4000-a000-000000000128', 21, 42, ARRAY['Hindu']::TEXT[], ARRAY['Mudaliar', 'Caste No Bar']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, religion, caste)
VALUES ('00000000-0000-4000-a000-000000000129', 28, 42, ARRAY['Hindu']::TEXT[], ARRAY['Devendra Kula Vellalar', 'Caste No Bar']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, religion, caste)
VALUES ('00000000-0000-4000-a000-00000000012a', 26, 33, ARRAY['Hindu']::TEXT[], ARRAY['Brahmin - Iyer', 'Caste No Bar']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, religion, caste)
VALUES ('00000000-0000-4000-a000-00000000012b', 22, 38, ARRAY['Hindu']::TEXT[], ARRAY['Thevar', 'Caste No Bar']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, religion, caste)
VALUES ('00000000-0000-4000-a000-00000000012c', 28, 38, ARRAY['Hindu']::TEXT[], ARRAY['Nadar', 'Caste No Bar']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, religion, caste)
VALUES ('00000000-0000-4000-a000-00000000012d', 23, 42, ARRAY['Hindu']::TEXT[], ARRAY['Vishwakarma', 'Caste No Bar']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, religion, caste)
VALUES ('00000000-0000-4000-a000-00000000012e', 22, 44, ARRAY['Hindu']::TEXT[], ARRAY['Thevar', 'Caste No Bar']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, religion, caste)
VALUES ('00000000-0000-4000-a000-00000000012f', 26, 38, ARRAY['Hindu']::TEXT[], ARRAY['Devendra Kula Vellalar', 'Caste No Bar']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, religion, caste)
VALUES ('00000000-0000-4000-a000-000000000130', 21, 35, ARRAY['Hindu']::TEXT[], ARRAY['Nadar', 'Caste No Bar']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, religion, caste)
VALUES ('00000000-0000-4000-a000-000000000131', 27, 32, ARRAY['Hindu']::TEXT[], ARRAY['Vellalar', 'Caste No Bar']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, religion, caste)
VALUES ('00000000-0000-4000-a000-000000000132', 27, 40, ARRAY['Hindu']::TEXT[], ARRAY['Pillai', 'Caste No Bar']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, religion, caste)
VALUES ('00000000-0000-4000-a000-000000000133', 27, 41, ARRAY['Hindu']::TEXT[], ARRAY['Maravar', 'Caste No Bar']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, religion, caste)
VALUES ('00000000-0000-4000-a000-000000000134', 22, 32, ARRAY['Hindu']::TEXT[], ARRAY['Gounder', 'Caste No Bar']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, religion, caste)
VALUES ('00000000-0000-4000-a000-000000000135', 24, 39, ARRAY['Hindu']::TEXT[], ARRAY['Vellalar', 'Caste No Bar']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, religion, caste)
VALUES ('00000000-0000-4000-a000-000000000136', 27, 34, ARRAY['Hindu']::TEXT[], ARRAY['Chettiar', 'Caste No Bar']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, religion, caste)
VALUES ('00000000-0000-4000-a000-000000000137', 28, 30, ARRAY['Hindu']::TEXT[], ARRAY['Maravar', 'Caste No Bar']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, religion, caste)
VALUES ('00000000-0000-4000-a000-000000000138', 27, 39, ARRAY['Hindu']::TEXT[], ARRAY['Vishwakarma', 'Caste No Bar']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, religion, caste)
VALUES ('00000000-0000-4000-a000-000000000139', 24, 37, ARRAY['Hindu']::TEXT[], ARRAY['Vellalar', 'Caste No Bar']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, religion, caste)
VALUES ('00000000-0000-4000-a000-00000000013a', 21, 30, ARRAY['Hindu']::TEXT[], ARRAY['Chettiar', 'Caste No Bar']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, religion, caste)
VALUES ('00000000-0000-4000-a000-00000000013b', 25, 30, ARRAY['Hindu']::TEXT[], ARRAY['Yadav', 'Caste No Bar']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, religion, caste)
VALUES ('00000000-0000-4000-a000-00000000013c', 21, 32, ARRAY['Christian']::TEXT[], ARRAY['Nadar Christian', 'Caste No Bar']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, religion, caste)
VALUES ('00000000-0000-4000-a000-00000000013d', 24, 41, ARRAY['Hindu']::TEXT[], ARRAY['Mudaliar', 'Caste No Bar']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, religion, caste)
VALUES ('00000000-0000-4000-a000-00000000013e', 27, 42, ARRAY['Hindu']::TEXT[], ARRAY['Vishwakarma', 'Caste No Bar']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, religion, caste)
VALUES ('00000000-0000-4000-a000-00000000013f', 23, 32, ARRAY['Hindu']::TEXT[], ARRAY['Arunthathiyar', 'Caste No Bar']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, religion, caste)
VALUES ('00000000-0000-4000-a000-000000000140', 24, 33, ARRAY['Hindu']::TEXT[], ARRAY['Brahmin - Iyer', 'Caste No Bar']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, religion, caste)
VALUES ('00000000-0000-4000-a000-000000000141', 23, 43, ARRAY['Hindu']::TEXT[], ARRAY['Naicker', 'Caste No Bar']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, religion, caste)
VALUES ('00000000-0000-4000-a000-000000000142', 22, 32, ARRAY['Hindu']::TEXT[], ARRAY['Arunthathiyar', 'Caste No Bar']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, religion, caste)
VALUES ('00000000-0000-4000-a000-000000000143', 26, 36, ARRAY['Hindu']::TEXT[], ARRAY['Maravar', 'Caste No Bar']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, religion, caste)
VALUES ('00000000-0000-4000-a000-000000000144', 21, 31, ARRAY['Hindu']::TEXT[], ARRAY['Agamudayar', 'Caste No Bar']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, religion, caste)
VALUES ('00000000-0000-4000-a000-000000000145', 21, 31, ARRAY['Christian']::TEXT[], ARRAY['Vellalar Christian', 'Caste No Bar']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, religion, caste)
VALUES ('00000000-0000-4000-a000-000000000146', 22, 30, ARRAY['Muslim']::TEXT[], ARRAY['Shia Muslim', 'Caste No Bar']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, religion, caste)
VALUES ('00000000-0000-4000-a000-000000000147', 23, 44, ARRAY['Hindu']::TEXT[], ARRAY['Pillai', 'Caste No Bar']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, religion, caste)
VALUES ('00000000-0000-4000-a000-000000000148', 27, 41, ARRAY['Hindu']::TEXT[], ARRAY['Pillai', 'Caste No Bar']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, religion, caste)
VALUES ('00000000-0000-4000-a000-000000000149', 24, 38, ARRAY['Hindu']::TEXT[], ARRAY['Gounder', 'Caste No Bar']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, religion, caste)
VALUES ('00000000-0000-4000-a000-00000000014a', 23, 41, ARRAY['Hindu']::TEXT[], ARRAY['Vishwakarma', 'Caste No Bar']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, religion, caste)
VALUES ('00000000-0000-4000-a000-00000000014b', 22, 37, ARRAY['Hindu']::TEXT[], ARRAY['Brahmin - Iyer', 'Caste No Bar']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, religion, caste)
VALUES ('00000000-0000-4000-a000-00000000014c', 28, 44, ARRAY['Hindu']::TEXT[], ARRAY['Brahmin - Iyer', 'Caste No Bar']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, religion, caste)
VALUES ('00000000-0000-4000-a000-00000000014d', 21, 41, ARRAY['Christian']::TEXT[], ARRAY['Nadar Christian', 'Caste No Bar']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, religion, caste)
VALUES ('00000000-0000-4000-a000-00000000014e', 26, 37, ARRAY['Hindu']::TEXT[], ARRAY['Kallar', 'Caste No Bar']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, religion, caste)
VALUES ('00000000-0000-4000-a000-00000000014f', 22, 36, ARRAY['Hindu']::TEXT[], ARRAY['Nadar', 'Caste No Bar']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, religion, caste)
VALUES ('00000000-0000-4000-a000-000000000150', 24, 44, ARRAY['Muslim']::TEXT[], ARRAY['Shia Muslim', 'Caste No Bar']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, religion, caste)
VALUES ('00000000-0000-4000-a000-000000000151', 25, 37, ARRAY['Hindu']::TEXT[], ARRAY['Pillai', 'Caste No Bar']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, religion, caste)
VALUES ('00000000-0000-4000-a000-000000000152', 23, 45, ARRAY['Muslim']::TEXT[], ARRAY['Marakayar', 'Caste No Bar']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, religion, caste)
VALUES ('00000000-0000-4000-a000-000000000153', 24, 45, ARRAY['Muslim']::TEXT[], ARRAY['Shia Muslim', 'Caste No Bar']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, religion, caste)
VALUES ('00000000-0000-4000-a000-000000000154', 22, 43, ARRAY['Hindu']::TEXT[], ARRAY['Agamudayar', 'Caste No Bar']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste;

-- 5. PHOTOS INSERTIONS (Lightweight URL)
INSERT INTO public.photos (user_id, storage_path, thumbnail_path, is_primary, is_approved)
VALUES ('00000000-0000-4000-a000-0000000000ab', 'https://randomuser.me/api/portraits/men/73.jpg', 'https://randomuser.me/api/portraits/men/73.jpg', true, true)
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.photos (user_id, storage_path, thumbnail_path, is_primary, is_approved)
VALUES ('00000000-0000-4000-a000-0000000000ac', 'https://randomuser.me/api/portraits/women/74.jpg', 'https://randomuser.me/api/portraits/women/74.jpg', true, true)
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.photos (user_id, storage_path, thumbnail_path, is_primary, is_approved)
VALUES ('00000000-0000-4000-a000-0000000000ad', 'https://randomuser.me/api/portraits/men/75.jpg', 'https://randomuser.me/api/portraits/men/75.jpg', true, true)
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.photos (user_id, storage_path, thumbnail_path, is_primary, is_approved)
VALUES ('00000000-0000-4000-a000-0000000000ae', 'https://randomuser.me/api/portraits/women/76.jpg', 'https://randomuser.me/api/portraits/women/76.jpg', true, true)
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.photos (user_id, storage_path, thumbnail_path, is_primary, is_approved)
VALUES ('00000000-0000-4000-a000-0000000000af', 'https://randomuser.me/api/portraits/men/77.jpg', 'https://randomuser.me/api/portraits/men/77.jpg', true, true)
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.photos (user_id, storage_path, thumbnail_path, is_primary, is_approved)
VALUES ('00000000-0000-4000-a000-0000000000b0', 'https://randomuser.me/api/portraits/women/78.jpg', 'https://randomuser.me/api/portraits/women/78.jpg', true, true)
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.photos (user_id, storage_path, thumbnail_path, is_primary, is_approved)
VALUES ('00000000-0000-4000-a000-0000000000b1', 'https://randomuser.me/api/portraits/men/79.jpg', 'https://randomuser.me/api/portraits/men/79.jpg', true, true)
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.photos (user_id, storage_path, thumbnail_path, is_primary, is_approved)
VALUES ('00000000-0000-4000-a000-0000000000b2', 'https://randomuser.me/api/portraits/women/80.jpg', 'https://randomuser.me/api/portraits/women/80.jpg', true, true)
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.photos (user_id, storage_path, thumbnail_path, is_primary, is_approved)
VALUES ('00000000-0000-4000-a000-0000000000b3', 'https://randomuser.me/api/portraits/men/81.jpg', 'https://randomuser.me/api/portraits/men/81.jpg', true, true)
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.photos (user_id, storage_path, thumbnail_path, is_primary, is_approved)
VALUES ('00000000-0000-4000-a000-0000000000b4', 'https://randomuser.me/api/portraits/women/82.jpg', 'https://randomuser.me/api/portraits/women/82.jpg', true, true)
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.photos (user_id, storage_path, thumbnail_path, is_primary, is_approved)
VALUES ('00000000-0000-4000-a000-0000000000b5', 'https://randomuser.me/api/portraits/men/83.jpg', 'https://randomuser.me/api/portraits/men/83.jpg', true, true)
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.photos (user_id, storage_path, thumbnail_path, is_primary, is_approved)
VALUES ('00000000-0000-4000-a000-0000000000b6', 'https://randomuser.me/api/portraits/women/84.jpg', 'https://randomuser.me/api/portraits/women/84.jpg', true, true)
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.photos (user_id, storage_path, thumbnail_path, is_primary, is_approved)
VALUES ('00000000-0000-4000-a000-0000000000b7', 'https://randomuser.me/api/portraits/men/85.jpg', 'https://randomuser.me/api/portraits/men/85.jpg', true, true)
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.photos (user_id, storage_path, thumbnail_path, is_primary, is_approved)
VALUES ('00000000-0000-4000-a000-0000000000b8', 'https://randomuser.me/api/portraits/women/86.jpg', 'https://randomuser.me/api/portraits/women/86.jpg', true, true)
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.photos (user_id, storage_path, thumbnail_path, is_primary, is_approved)
VALUES ('00000000-0000-4000-a000-0000000000b9', 'https://randomuser.me/api/portraits/men/87.jpg', 'https://randomuser.me/api/portraits/men/87.jpg', true, true)
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.photos (user_id, storage_path, thumbnail_path, is_primary, is_approved)
VALUES ('00000000-0000-4000-a000-0000000000ba', 'https://randomuser.me/api/portraits/women/88.jpg', 'https://randomuser.me/api/portraits/women/88.jpg', true, true)
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.photos (user_id, storage_path, thumbnail_path, is_primary, is_approved)
VALUES ('00000000-0000-4000-a000-0000000000bb', 'https://randomuser.me/api/portraits/men/89.jpg', 'https://randomuser.me/api/portraits/men/89.jpg', true, true)
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.photos (user_id, storage_path, thumbnail_path, is_primary, is_approved)
VALUES ('00000000-0000-4000-a000-0000000000bc', 'https://randomuser.me/api/portraits/women/90.jpg', 'https://randomuser.me/api/portraits/women/90.jpg', true, true)
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.photos (user_id, storage_path, thumbnail_path, is_primary, is_approved)
VALUES ('00000000-0000-4000-a000-0000000000bd', 'https://randomuser.me/api/portraits/men/91.jpg', 'https://randomuser.me/api/portraits/men/91.jpg', true, true)
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.photos (user_id, storage_path, thumbnail_path, is_primary, is_approved)
VALUES ('00000000-0000-4000-a000-0000000000be', 'https://randomuser.me/api/portraits/women/92.jpg', 'https://randomuser.me/api/portraits/women/92.jpg', true, true)
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.photos (user_id, storage_path, thumbnail_path, is_primary, is_approved)
VALUES ('00000000-0000-4000-a000-0000000000bf', 'https://randomuser.me/api/portraits/men/93.jpg', 'https://randomuser.me/api/portraits/men/93.jpg', true, true)
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.photos (user_id, storage_path, thumbnail_path, is_primary, is_approved)
VALUES ('00000000-0000-4000-a000-0000000000c0', 'https://randomuser.me/api/portraits/women/94.jpg', 'https://randomuser.me/api/portraits/women/94.jpg', true, true)
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.photos (user_id, storage_path, thumbnail_path, is_primary, is_approved)
VALUES ('00000000-0000-4000-a000-0000000000c1', 'https://randomuser.me/api/portraits/men/95.jpg', 'https://randomuser.me/api/portraits/men/95.jpg', true, true)
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.photos (user_id, storage_path, thumbnail_path, is_primary, is_approved)
VALUES ('00000000-0000-4000-a000-0000000000c2', 'https://randomuser.me/api/portraits/women/96.jpg', 'https://randomuser.me/api/portraits/women/96.jpg', true, true)
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.photos (user_id, storage_path, thumbnail_path, is_primary, is_approved)
VALUES ('00000000-0000-4000-a000-0000000000c3', 'https://randomuser.me/api/portraits/men/97.jpg', 'https://randomuser.me/api/portraits/men/97.jpg', true, true)
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.photos (user_id, storage_path, thumbnail_path, is_primary, is_approved)
VALUES ('00000000-0000-4000-a000-0000000000c4', 'https://randomuser.me/api/portraits/women/98.jpg', 'https://randomuser.me/api/portraits/women/98.jpg', true, true)
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.photos (user_id, storage_path, thumbnail_path, is_primary, is_approved)
VALUES ('00000000-0000-4000-a000-0000000000c5', 'https://randomuser.me/api/portraits/men/99.jpg', 'https://randomuser.me/api/portraits/men/99.jpg', true, true)
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.photos (user_id, storage_path, thumbnail_path, is_primary, is_approved)
VALUES ('00000000-0000-4000-a000-0000000000c6', 'https://randomuser.me/api/portraits/women/1.jpg', 'https://randomuser.me/api/portraits/women/1.jpg', true, true)
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.photos (user_id, storage_path, thumbnail_path, is_primary, is_approved)
VALUES ('00000000-0000-4000-a000-0000000000c7', 'https://randomuser.me/api/portraits/men/2.jpg', 'https://randomuser.me/api/portraits/men/2.jpg', true, true)
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.photos (user_id, storage_path, thumbnail_path, is_primary, is_approved)
VALUES ('00000000-0000-4000-a000-0000000000c8', 'https://randomuser.me/api/portraits/women/3.jpg', 'https://randomuser.me/api/portraits/women/3.jpg', true, true)
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.photos (user_id, storage_path, thumbnail_path, is_primary, is_approved)
VALUES ('00000000-0000-4000-a000-0000000000c9', 'https://randomuser.me/api/portraits/men/4.jpg', 'https://randomuser.me/api/portraits/men/4.jpg', true, true)
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.photos (user_id, storage_path, thumbnail_path, is_primary, is_approved)
VALUES ('00000000-0000-4000-a000-0000000000ca', 'https://randomuser.me/api/portraits/women/5.jpg', 'https://randomuser.me/api/portraits/women/5.jpg', true, true)
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.photos (user_id, storage_path, thumbnail_path, is_primary, is_approved)
VALUES ('00000000-0000-4000-a000-0000000000cb', 'https://randomuser.me/api/portraits/men/6.jpg', 'https://randomuser.me/api/portraits/men/6.jpg', true, true)
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.photos (user_id, storage_path, thumbnail_path, is_primary, is_approved)
VALUES ('00000000-0000-4000-a000-0000000000cc', 'https://randomuser.me/api/portraits/women/7.jpg', 'https://randomuser.me/api/portraits/women/7.jpg', true, true)
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.photos (user_id, storage_path, thumbnail_path, is_primary, is_approved)
VALUES ('00000000-0000-4000-a000-0000000000cd', 'https://randomuser.me/api/portraits/men/8.jpg', 'https://randomuser.me/api/portraits/men/8.jpg', true, true)
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.photos (user_id, storage_path, thumbnail_path, is_primary, is_approved)
VALUES ('00000000-0000-4000-a000-0000000000ce', 'https://randomuser.me/api/portraits/women/9.jpg', 'https://randomuser.me/api/portraits/women/9.jpg', true, true)
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.photos (user_id, storage_path, thumbnail_path, is_primary, is_approved)
VALUES ('00000000-0000-4000-a000-0000000000cf', 'https://randomuser.me/api/portraits/men/10.jpg', 'https://randomuser.me/api/portraits/men/10.jpg', true, true)
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.photos (user_id, storage_path, thumbnail_path, is_primary, is_approved)
VALUES ('00000000-0000-4000-a000-0000000000d0', 'https://randomuser.me/api/portraits/women/11.jpg', 'https://randomuser.me/api/portraits/women/11.jpg', true, true)
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.photos (user_id, storage_path, thumbnail_path, is_primary, is_approved)
VALUES ('00000000-0000-4000-a000-0000000000d1', 'https://randomuser.me/api/portraits/men/12.jpg', 'https://randomuser.me/api/portraits/men/12.jpg', true, true)
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.photos (user_id, storage_path, thumbnail_path, is_primary, is_approved)
VALUES ('00000000-0000-4000-a000-0000000000d2', 'https://randomuser.me/api/portraits/women/13.jpg', 'https://randomuser.me/api/portraits/women/13.jpg', true, true)
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.photos (user_id, storage_path, thumbnail_path, is_primary, is_approved)
VALUES ('00000000-0000-4000-a000-0000000000d3', 'https://randomuser.me/api/portraits/men/14.jpg', 'https://randomuser.me/api/portraits/men/14.jpg', true, true)
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.photos (user_id, storage_path, thumbnail_path, is_primary, is_approved)
VALUES ('00000000-0000-4000-a000-0000000000d4', 'https://randomuser.me/api/portraits/women/15.jpg', 'https://randomuser.me/api/portraits/women/15.jpg', true, true)
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.photos (user_id, storage_path, thumbnail_path, is_primary, is_approved)
VALUES ('00000000-0000-4000-a000-0000000000d5', 'https://randomuser.me/api/portraits/men/16.jpg', 'https://randomuser.me/api/portraits/men/16.jpg', true, true)
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.photos (user_id, storage_path, thumbnail_path, is_primary, is_approved)
VALUES ('00000000-0000-4000-a000-0000000000d6', 'https://randomuser.me/api/portraits/women/17.jpg', 'https://randomuser.me/api/portraits/women/17.jpg', true, true)
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.photos (user_id, storage_path, thumbnail_path, is_primary, is_approved)
VALUES ('00000000-0000-4000-a000-0000000000d7', 'https://randomuser.me/api/portraits/men/18.jpg', 'https://randomuser.me/api/portraits/men/18.jpg', true, true)
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.photos (user_id, storage_path, thumbnail_path, is_primary, is_approved)
VALUES ('00000000-0000-4000-a000-0000000000d8', 'https://randomuser.me/api/portraits/women/19.jpg', 'https://randomuser.me/api/portraits/women/19.jpg', true, true)
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.photos (user_id, storage_path, thumbnail_path, is_primary, is_approved)
VALUES ('00000000-0000-4000-a000-0000000000d9', 'https://randomuser.me/api/portraits/men/20.jpg', 'https://randomuser.me/api/portraits/men/20.jpg', true, true)
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.photos (user_id, storage_path, thumbnail_path, is_primary, is_approved)
VALUES ('00000000-0000-4000-a000-0000000000da', 'https://randomuser.me/api/portraits/women/21.jpg', 'https://randomuser.me/api/portraits/women/21.jpg', true, true)
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.photos (user_id, storage_path, thumbnail_path, is_primary, is_approved)
VALUES ('00000000-0000-4000-a000-0000000000db', 'https://randomuser.me/api/portraits/men/22.jpg', 'https://randomuser.me/api/portraits/men/22.jpg', true, true)
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.photos (user_id, storage_path, thumbnail_path, is_primary, is_approved)
VALUES ('00000000-0000-4000-a000-0000000000dc', 'https://randomuser.me/api/portraits/women/23.jpg', 'https://randomuser.me/api/portraits/women/23.jpg', true, true)
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.photos (user_id, storage_path, thumbnail_path, is_primary, is_approved)
VALUES ('00000000-0000-4000-a000-0000000000dd', 'https://randomuser.me/api/portraits/men/24.jpg', 'https://randomuser.me/api/portraits/men/24.jpg', true, true)
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.photos (user_id, storage_path, thumbnail_path, is_primary, is_approved)
VALUES ('00000000-0000-4000-a000-0000000000de', 'https://randomuser.me/api/portraits/women/25.jpg', 'https://randomuser.me/api/portraits/women/25.jpg', true, true)
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.photos (user_id, storage_path, thumbnail_path, is_primary, is_approved)
VALUES ('00000000-0000-4000-a000-0000000000df', 'https://randomuser.me/api/portraits/men/26.jpg', 'https://randomuser.me/api/portraits/men/26.jpg', true, true)
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.photos (user_id, storage_path, thumbnail_path, is_primary, is_approved)
VALUES ('00000000-0000-4000-a000-0000000000e0', 'https://randomuser.me/api/portraits/women/27.jpg', 'https://randomuser.me/api/portraits/women/27.jpg', true, true)
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.photos (user_id, storage_path, thumbnail_path, is_primary, is_approved)
VALUES ('00000000-0000-4000-a000-0000000000e1', 'https://randomuser.me/api/portraits/men/28.jpg', 'https://randomuser.me/api/portraits/men/28.jpg', true, true)
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.photos (user_id, storage_path, thumbnail_path, is_primary, is_approved)
VALUES ('00000000-0000-4000-a000-0000000000e2', 'https://randomuser.me/api/portraits/women/29.jpg', 'https://randomuser.me/api/portraits/women/29.jpg', true, true)
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.photos (user_id, storage_path, thumbnail_path, is_primary, is_approved)
VALUES ('00000000-0000-4000-a000-0000000000e3', 'https://randomuser.me/api/portraits/men/30.jpg', 'https://randomuser.me/api/portraits/men/30.jpg', true, true)
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.photos (user_id, storage_path, thumbnail_path, is_primary, is_approved)
VALUES ('00000000-0000-4000-a000-0000000000e4', 'https://randomuser.me/api/portraits/women/31.jpg', 'https://randomuser.me/api/portraits/women/31.jpg', true, true)
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.photos (user_id, storage_path, thumbnail_path, is_primary, is_approved)
VALUES ('00000000-0000-4000-a000-0000000000e5', 'https://randomuser.me/api/portraits/men/32.jpg', 'https://randomuser.me/api/portraits/men/32.jpg', true, true)
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.photos (user_id, storage_path, thumbnail_path, is_primary, is_approved)
VALUES ('00000000-0000-4000-a000-0000000000e6', 'https://randomuser.me/api/portraits/women/33.jpg', 'https://randomuser.me/api/portraits/women/33.jpg', true, true)
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.photos (user_id, storage_path, thumbnail_path, is_primary, is_approved)
VALUES ('00000000-0000-4000-a000-0000000000e7', 'https://randomuser.me/api/portraits/men/34.jpg', 'https://randomuser.me/api/portraits/men/34.jpg', true, true)
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.photos (user_id, storage_path, thumbnail_path, is_primary, is_approved)
VALUES ('00000000-0000-4000-a000-0000000000e8', 'https://randomuser.me/api/portraits/women/35.jpg', 'https://randomuser.me/api/portraits/women/35.jpg', true, true)
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.photos (user_id, storage_path, thumbnail_path, is_primary, is_approved)
VALUES ('00000000-0000-4000-a000-0000000000e9', 'https://randomuser.me/api/portraits/men/36.jpg', 'https://randomuser.me/api/portraits/men/36.jpg', true, true)
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.photos (user_id, storage_path, thumbnail_path, is_primary, is_approved)
VALUES ('00000000-0000-4000-a000-0000000000ea', 'https://randomuser.me/api/portraits/women/37.jpg', 'https://randomuser.me/api/portraits/women/37.jpg', true, true)
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.photos (user_id, storage_path, thumbnail_path, is_primary, is_approved)
VALUES ('00000000-0000-4000-a000-0000000000eb', 'https://randomuser.me/api/portraits/men/38.jpg', 'https://randomuser.me/api/portraits/men/38.jpg', true, true)
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.photos (user_id, storage_path, thumbnail_path, is_primary, is_approved)
VALUES ('00000000-0000-4000-a000-0000000000ec', 'https://randomuser.me/api/portraits/women/39.jpg', 'https://randomuser.me/api/portraits/women/39.jpg', true, true)
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.photos (user_id, storage_path, thumbnail_path, is_primary, is_approved)
VALUES ('00000000-0000-4000-a000-0000000000ed', 'https://randomuser.me/api/portraits/men/40.jpg', 'https://randomuser.me/api/portraits/men/40.jpg', true, true)
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.photos (user_id, storage_path, thumbnail_path, is_primary, is_approved)
VALUES ('00000000-0000-4000-a000-0000000000ee', 'https://randomuser.me/api/portraits/women/41.jpg', 'https://randomuser.me/api/portraits/women/41.jpg', true, true)
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.photos (user_id, storage_path, thumbnail_path, is_primary, is_approved)
VALUES ('00000000-0000-4000-a000-0000000000ef', 'https://randomuser.me/api/portraits/men/42.jpg', 'https://randomuser.me/api/portraits/men/42.jpg', true, true)
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.photos (user_id, storage_path, thumbnail_path, is_primary, is_approved)
VALUES ('00000000-0000-4000-a000-0000000000f0', 'https://randomuser.me/api/portraits/women/43.jpg', 'https://randomuser.me/api/portraits/women/43.jpg', true, true)
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.photos (user_id, storage_path, thumbnail_path, is_primary, is_approved)
VALUES ('00000000-0000-4000-a000-0000000000f1', 'https://randomuser.me/api/portraits/men/44.jpg', 'https://randomuser.me/api/portraits/men/44.jpg', true, true)
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.photos (user_id, storage_path, thumbnail_path, is_primary, is_approved)
VALUES ('00000000-0000-4000-a000-0000000000f2', 'https://randomuser.me/api/portraits/women/45.jpg', 'https://randomuser.me/api/portraits/women/45.jpg', true, true)
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.photos (user_id, storage_path, thumbnail_path, is_primary, is_approved)
VALUES ('00000000-0000-4000-a000-0000000000f3', 'https://randomuser.me/api/portraits/men/46.jpg', 'https://randomuser.me/api/portraits/men/46.jpg', true, true)
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.photos (user_id, storage_path, thumbnail_path, is_primary, is_approved)
VALUES ('00000000-0000-4000-a000-0000000000f4', 'https://randomuser.me/api/portraits/women/47.jpg', 'https://randomuser.me/api/portraits/women/47.jpg', true, true)
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.photos (user_id, storage_path, thumbnail_path, is_primary, is_approved)
VALUES ('00000000-0000-4000-a000-0000000000f5', 'https://randomuser.me/api/portraits/men/48.jpg', 'https://randomuser.me/api/portraits/men/48.jpg', true, true)
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.photos (user_id, storage_path, thumbnail_path, is_primary, is_approved)
VALUES ('00000000-0000-4000-a000-0000000000f6', 'https://randomuser.me/api/portraits/women/49.jpg', 'https://randomuser.me/api/portraits/women/49.jpg', true, true)
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.photos (user_id, storage_path, thumbnail_path, is_primary, is_approved)
VALUES ('00000000-0000-4000-a000-0000000000f7', 'https://randomuser.me/api/portraits/men/50.jpg', 'https://randomuser.me/api/portraits/men/50.jpg', true, true)
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.photos (user_id, storage_path, thumbnail_path, is_primary, is_approved)
VALUES ('00000000-0000-4000-a000-0000000000f8', 'https://randomuser.me/api/portraits/women/51.jpg', 'https://randomuser.me/api/portraits/women/51.jpg', true, true)
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.photos (user_id, storage_path, thumbnail_path, is_primary, is_approved)
VALUES ('00000000-0000-4000-a000-0000000000f9', 'https://randomuser.me/api/portraits/men/52.jpg', 'https://randomuser.me/api/portraits/men/52.jpg', true, true)
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.photos (user_id, storage_path, thumbnail_path, is_primary, is_approved)
VALUES ('00000000-0000-4000-a000-0000000000fa', 'https://randomuser.me/api/portraits/women/53.jpg', 'https://randomuser.me/api/portraits/women/53.jpg', true, true)
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.photos (user_id, storage_path, thumbnail_path, is_primary, is_approved)
VALUES ('00000000-0000-4000-a000-0000000000fb', 'https://randomuser.me/api/portraits/men/54.jpg', 'https://randomuser.me/api/portraits/men/54.jpg', true, true)
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.photos (user_id, storage_path, thumbnail_path, is_primary, is_approved)
VALUES ('00000000-0000-4000-a000-0000000000fc', 'https://randomuser.me/api/portraits/women/55.jpg', 'https://randomuser.me/api/portraits/women/55.jpg', true, true)
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.photos (user_id, storage_path, thumbnail_path, is_primary, is_approved)
VALUES ('00000000-0000-4000-a000-0000000000fd', 'https://randomuser.me/api/portraits/men/56.jpg', 'https://randomuser.me/api/portraits/men/56.jpg', true, true)
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.photos (user_id, storage_path, thumbnail_path, is_primary, is_approved)
VALUES ('00000000-0000-4000-a000-0000000000fe', 'https://randomuser.me/api/portraits/women/57.jpg', 'https://randomuser.me/api/portraits/women/57.jpg', true, true)
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.photos (user_id, storage_path, thumbnail_path, is_primary, is_approved)
VALUES ('00000000-0000-4000-a000-0000000000ff', 'https://randomuser.me/api/portraits/men/58.jpg', 'https://randomuser.me/api/portraits/men/58.jpg', true, true)
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.photos (user_id, storage_path, thumbnail_path, is_primary, is_approved)
VALUES ('00000000-0000-4000-a000-000000000100', 'https://randomuser.me/api/portraits/women/59.jpg', 'https://randomuser.me/api/portraits/women/59.jpg', true, true)
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.photos (user_id, storage_path, thumbnail_path, is_primary, is_approved)
VALUES ('00000000-0000-4000-a000-000000000101', 'https://randomuser.me/api/portraits/men/60.jpg', 'https://randomuser.me/api/portraits/men/60.jpg', true, true)
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.photos (user_id, storage_path, thumbnail_path, is_primary, is_approved)
VALUES ('00000000-0000-4000-a000-000000000102', 'https://randomuser.me/api/portraits/women/61.jpg', 'https://randomuser.me/api/portraits/women/61.jpg', true, true)
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.photos (user_id, storage_path, thumbnail_path, is_primary, is_approved)
VALUES ('00000000-0000-4000-a000-000000000103', 'https://randomuser.me/api/portraits/men/62.jpg', 'https://randomuser.me/api/portraits/men/62.jpg', true, true)
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.photos (user_id, storage_path, thumbnail_path, is_primary, is_approved)
VALUES ('00000000-0000-4000-a000-000000000104', 'https://randomuser.me/api/portraits/women/63.jpg', 'https://randomuser.me/api/portraits/women/63.jpg', true, true)
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.photos (user_id, storage_path, thumbnail_path, is_primary, is_approved)
VALUES ('00000000-0000-4000-a000-000000000105', 'https://randomuser.me/api/portraits/men/64.jpg', 'https://randomuser.me/api/portraits/men/64.jpg', true, true)
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.photos (user_id, storage_path, thumbnail_path, is_primary, is_approved)
VALUES ('00000000-0000-4000-a000-000000000106', 'https://randomuser.me/api/portraits/women/65.jpg', 'https://randomuser.me/api/portraits/women/65.jpg', true, true)
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.photos (user_id, storage_path, thumbnail_path, is_primary, is_approved)
VALUES ('00000000-0000-4000-a000-000000000107', 'https://randomuser.me/api/portraits/men/66.jpg', 'https://randomuser.me/api/portraits/men/66.jpg', true, true)
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.photos (user_id, storage_path, thumbnail_path, is_primary, is_approved)
VALUES ('00000000-0000-4000-a000-000000000108', 'https://randomuser.me/api/portraits/women/67.jpg', 'https://randomuser.me/api/portraits/women/67.jpg', true, true)
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.photos (user_id, storage_path, thumbnail_path, is_primary, is_approved)
VALUES ('00000000-0000-4000-a000-000000000109', 'https://randomuser.me/api/portraits/men/68.jpg', 'https://randomuser.me/api/portraits/men/68.jpg', true, true)
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.photos (user_id, storage_path, thumbnail_path, is_primary, is_approved)
VALUES ('00000000-0000-4000-a000-00000000010a', 'https://randomuser.me/api/portraits/women/69.jpg', 'https://randomuser.me/api/portraits/women/69.jpg', true, true)
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.photos (user_id, storage_path, thumbnail_path, is_primary, is_approved)
VALUES ('00000000-0000-4000-a000-00000000010b', 'https://randomuser.me/api/portraits/men/70.jpg', 'https://randomuser.me/api/portraits/men/70.jpg', true, true)
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.photos (user_id, storage_path, thumbnail_path, is_primary, is_approved)
VALUES ('00000000-0000-4000-a000-00000000010c', 'https://randomuser.me/api/portraits/women/71.jpg', 'https://randomuser.me/api/portraits/women/71.jpg', true, true)
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.photos (user_id, storage_path, thumbnail_path, is_primary, is_approved)
VALUES ('00000000-0000-4000-a000-00000000010d', 'https://randomuser.me/api/portraits/men/72.jpg', 'https://randomuser.me/api/portraits/men/72.jpg', true, true)
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.photos (user_id, storage_path, thumbnail_path, is_primary, is_approved)
VALUES ('00000000-0000-4000-a000-00000000010e', 'https://randomuser.me/api/portraits/women/73.jpg', 'https://randomuser.me/api/portraits/women/73.jpg', true, true)
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.photos (user_id, storage_path, thumbnail_path, is_primary, is_approved)
VALUES ('00000000-0000-4000-a000-00000000010f', 'https://randomuser.me/api/portraits/men/74.jpg', 'https://randomuser.me/api/portraits/men/74.jpg', true, true)
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.photos (user_id, storage_path, thumbnail_path, is_primary, is_approved)
VALUES ('00000000-0000-4000-a000-000000000110', 'https://randomuser.me/api/portraits/women/75.jpg', 'https://randomuser.me/api/portraits/women/75.jpg', true, true)
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.photos (user_id, storage_path, thumbnail_path, is_primary, is_approved)
VALUES ('00000000-0000-4000-a000-000000000111', 'https://randomuser.me/api/portraits/men/76.jpg', 'https://randomuser.me/api/portraits/men/76.jpg', true, true)
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.photos (user_id, storage_path, thumbnail_path, is_primary, is_approved)
VALUES ('00000000-0000-4000-a000-000000000112', 'https://randomuser.me/api/portraits/women/77.jpg', 'https://randomuser.me/api/portraits/women/77.jpg', true, true)
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.photos (user_id, storage_path, thumbnail_path, is_primary, is_approved)
VALUES ('00000000-0000-4000-a000-000000000113', 'https://randomuser.me/api/portraits/men/78.jpg', 'https://randomuser.me/api/portraits/men/78.jpg', true, true)
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.photos (user_id, storage_path, thumbnail_path, is_primary, is_approved)
VALUES ('00000000-0000-4000-a000-000000000114', 'https://randomuser.me/api/portraits/women/79.jpg', 'https://randomuser.me/api/portraits/women/79.jpg', true, true)
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.photos (user_id, storage_path, thumbnail_path, is_primary, is_approved)
VALUES ('00000000-0000-4000-a000-000000000115', 'https://randomuser.me/api/portraits/men/80.jpg', 'https://randomuser.me/api/portraits/men/80.jpg', true, true)
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.photos (user_id, storage_path, thumbnail_path, is_primary, is_approved)
VALUES ('00000000-0000-4000-a000-000000000116', 'https://randomuser.me/api/portraits/women/81.jpg', 'https://randomuser.me/api/portraits/women/81.jpg', true, true)
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.photos (user_id, storage_path, thumbnail_path, is_primary, is_approved)
VALUES ('00000000-0000-4000-a000-000000000117', 'https://randomuser.me/api/portraits/men/82.jpg', 'https://randomuser.me/api/portraits/men/82.jpg', true, true)
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.photos (user_id, storage_path, thumbnail_path, is_primary, is_approved)
VALUES ('00000000-0000-4000-a000-000000000118', 'https://randomuser.me/api/portraits/women/83.jpg', 'https://randomuser.me/api/portraits/women/83.jpg', true, true)
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.photos (user_id, storage_path, thumbnail_path, is_primary, is_approved)
VALUES ('00000000-0000-4000-a000-000000000119', 'https://randomuser.me/api/portraits/men/84.jpg', 'https://randomuser.me/api/portraits/men/84.jpg', true, true)
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.photos (user_id, storage_path, thumbnail_path, is_primary, is_approved)
VALUES ('00000000-0000-4000-a000-00000000011a', 'https://randomuser.me/api/portraits/women/85.jpg', 'https://randomuser.me/api/portraits/women/85.jpg', true, true)
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.photos (user_id, storage_path, thumbnail_path, is_primary, is_approved)
VALUES ('00000000-0000-4000-a000-00000000011b', 'https://randomuser.me/api/portraits/men/86.jpg', 'https://randomuser.me/api/portraits/men/86.jpg', true, true)
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.photos (user_id, storage_path, thumbnail_path, is_primary, is_approved)
VALUES ('00000000-0000-4000-a000-00000000011c', 'https://randomuser.me/api/portraits/women/87.jpg', 'https://randomuser.me/api/portraits/women/87.jpg', true, true)
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.photos (user_id, storage_path, thumbnail_path, is_primary, is_approved)
VALUES ('00000000-0000-4000-a000-00000000011d', 'https://randomuser.me/api/portraits/men/88.jpg', 'https://randomuser.me/api/portraits/men/88.jpg', true, true)
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.photos (user_id, storage_path, thumbnail_path, is_primary, is_approved)
VALUES ('00000000-0000-4000-a000-00000000011e', 'https://randomuser.me/api/portraits/women/89.jpg', 'https://randomuser.me/api/portraits/women/89.jpg', true, true)
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.photos (user_id, storage_path, thumbnail_path, is_primary, is_approved)
VALUES ('00000000-0000-4000-a000-00000000011f', 'https://randomuser.me/api/portraits/men/90.jpg', 'https://randomuser.me/api/portraits/men/90.jpg', true, true)
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.photos (user_id, storage_path, thumbnail_path, is_primary, is_approved)
VALUES ('00000000-0000-4000-a000-000000000120', 'https://randomuser.me/api/portraits/women/91.jpg', 'https://randomuser.me/api/portraits/women/91.jpg', true, true)
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.photos (user_id, storage_path, thumbnail_path, is_primary, is_approved)
VALUES ('00000000-0000-4000-a000-000000000121', 'https://randomuser.me/api/portraits/men/92.jpg', 'https://randomuser.me/api/portraits/men/92.jpg', true, true)
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.photos (user_id, storage_path, thumbnail_path, is_primary, is_approved)
VALUES ('00000000-0000-4000-a000-000000000122', 'https://randomuser.me/api/portraits/women/93.jpg', 'https://randomuser.me/api/portraits/women/93.jpg', true, true)
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.photos (user_id, storage_path, thumbnail_path, is_primary, is_approved)
VALUES ('00000000-0000-4000-a000-000000000123', 'https://randomuser.me/api/portraits/men/94.jpg', 'https://randomuser.me/api/portraits/men/94.jpg', true, true)
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.photos (user_id, storage_path, thumbnail_path, is_primary, is_approved)
VALUES ('00000000-0000-4000-a000-000000000124', 'https://randomuser.me/api/portraits/women/95.jpg', 'https://randomuser.me/api/portraits/women/95.jpg', true, true)
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.photos (user_id, storage_path, thumbnail_path, is_primary, is_approved)
VALUES ('00000000-0000-4000-a000-000000000125', 'https://randomuser.me/api/portraits/men/96.jpg', 'https://randomuser.me/api/portraits/men/96.jpg', true, true)
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.photos (user_id, storage_path, thumbnail_path, is_primary, is_approved)
VALUES ('00000000-0000-4000-a000-000000000126', 'https://randomuser.me/api/portraits/women/97.jpg', 'https://randomuser.me/api/portraits/women/97.jpg', true, true)
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.photos (user_id, storage_path, thumbnail_path, is_primary, is_approved)
VALUES ('00000000-0000-4000-a000-000000000127', 'https://randomuser.me/api/portraits/men/98.jpg', 'https://randomuser.me/api/portraits/men/98.jpg', true, true)
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.photos (user_id, storage_path, thumbnail_path, is_primary, is_approved)
VALUES ('00000000-0000-4000-a000-000000000128', 'https://randomuser.me/api/portraits/women/99.jpg', 'https://randomuser.me/api/portraits/women/99.jpg', true, true)
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.photos (user_id, storage_path, thumbnail_path, is_primary, is_approved)
VALUES ('00000000-0000-4000-a000-000000000129', 'https://randomuser.me/api/portraits/men/1.jpg', 'https://randomuser.me/api/portraits/men/1.jpg', true, true)
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.photos (user_id, storage_path, thumbnail_path, is_primary, is_approved)
VALUES ('00000000-0000-4000-a000-00000000012a', 'https://randomuser.me/api/portraits/women/2.jpg', 'https://randomuser.me/api/portraits/women/2.jpg', true, true)
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.photos (user_id, storage_path, thumbnail_path, is_primary, is_approved)
VALUES ('00000000-0000-4000-a000-00000000012b', 'https://randomuser.me/api/portraits/men/3.jpg', 'https://randomuser.me/api/portraits/men/3.jpg', true, true)
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.photos (user_id, storage_path, thumbnail_path, is_primary, is_approved)
VALUES ('00000000-0000-4000-a000-00000000012c', 'https://randomuser.me/api/portraits/women/4.jpg', 'https://randomuser.me/api/portraits/women/4.jpg', true, true)
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.photos (user_id, storage_path, thumbnail_path, is_primary, is_approved)
VALUES ('00000000-0000-4000-a000-00000000012d', 'https://randomuser.me/api/portraits/men/5.jpg', 'https://randomuser.me/api/portraits/men/5.jpg', true, true)
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.photos (user_id, storage_path, thumbnail_path, is_primary, is_approved)
VALUES ('00000000-0000-4000-a000-00000000012e', 'https://randomuser.me/api/portraits/women/6.jpg', 'https://randomuser.me/api/portraits/women/6.jpg', true, true)
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.photos (user_id, storage_path, thumbnail_path, is_primary, is_approved)
VALUES ('00000000-0000-4000-a000-00000000012f', 'https://randomuser.me/api/portraits/men/7.jpg', 'https://randomuser.me/api/portraits/men/7.jpg', true, true)
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.photos (user_id, storage_path, thumbnail_path, is_primary, is_approved)
VALUES ('00000000-0000-4000-a000-000000000130', 'https://randomuser.me/api/portraits/women/8.jpg', 'https://randomuser.me/api/portraits/women/8.jpg', true, true)
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.photos (user_id, storage_path, thumbnail_path, is_primary, is_approved)
VALUES ('00000000-0000-4000-a000-000000000131', 'https://randomuser.me/api/portraits/men/9.jpg', 'https://randomuser.me/api/portraits/men/9.jpg', true, true)
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.photos (user_id, storage_path, thumbnail_path, is_primary, is_approved)
VALUES ('00000000-0000-4000-a000-000000000132', 'https://randomuser.me/api/portraits/women/10.jpg', 'https://randomuser.me/api/portraits/women/10.jpg', true, true)
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.photos (user_id, storage_path, thumbnail_path, is_primary, is_approved)
VALUES ('00000000-0000-4000-a000-000000000133', 'https://randomuser.me/api/portraits/men/11.jpg', 'https://randomuser.me/api/portraits/men/11.jpg', true, true)
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.photos (user_id, storage_path, thumbnail_path, is_primary, is_approved)
VALUES ('00000000-0000-4000-a000-000000000134', 'https://randomuser.me/api/portraits/women/12.jpg', 'https://randomuser.me/api/portraits/women/12.jpg', true, true)
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.photos (user_id, storage_path, thumbnail_path, is_primary, is_approved)
VALUES ('00000000-0000-4000-a000-000000000135', 'https://randomuser.me/api/portraits/men/13.jpg', 'https://randomuser.me/api/portraits/men/13.jpg', true, true)
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.photos (user_id, storage_path, thumbnail_path, is_primary, is_approved)
VALUES ('00000000-0000-4000-a000-000000000136', 'https://randomuser.me/api/portraits/women/14.jpg', 'https://randomuser.me/api/portraits/women/14.jpg', true, true)
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.photos (user_id, storage_path, thumbnail_path, is_primary, is_approved)
VALUES ('00000000-0000-4000-a000-000000000137', 'https://randomuser.me/api/portraits/men/15.jpg', 'https://randomuser.me/api/portraits/men/15.jpg', true, true)
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.photos (user_id, storage_path, thumbnail_path, is_primary, is_approved)
VALUES ('00000000-0000-4000-a000-000000000138', 'https://randomuser.me/api/portraits/women/16.jpg', 'https://randomuser.me/api/portraits/women/16.jpg', true, true)
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.photos (user_id, storage_path, thumbnail_path, is_primary, is_approved)
VALUES ('00000000-0000-4000-a000-000000000139', 'https://randomuser.me/api/portraits/men/17.jpg', 'https://randomuser.me/api/portraits/men/17.jpg', true, true)
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.photos (user_id, storage_path, thumbnail_path, is_primary, is_approved)
VALUES ('00000000-0000-4000-a000-00000000013a', 'https://randomuser.me/api/portraits/women/18.jpg', 'https://randomuser.me/api/portraits/women/18.jpg', true, true)
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.photos (user_id, storage_path, thumbnail_path, is_primary, is_approved)
VALUES ('00000000-0000-4000-a000-00000000013b', 'https://randomuser.me/api/portraits/men/19.jpg', 'https://randomuser.me/api/portraits/men/19.jpg', true, true)
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.photos (user_id, storage_path, thumbnail_path, is_primary, is_approved)
VALUES ('00000000-0000-4000-a000-00000000013c', 'https://randomuser.me/api/portraits/women/20.jpg', 'https://randomuser.me/api/portraits/women/20.jpg', true, true)
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.photos (user_id, storage_path, thumbnail_path, is_primary, is_approved)
VALUES ('00000000-0000-4000-a000-00000000013d', 'https://randomuser.me/api/portraits/men/21.jpg', 'https://randomuser.me/api/portraits/men/21.jpg', true, true)
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.photos (user_id, storage_path, thumbnail_path, is_primary, is_approved)
VALUES ('00000000-0000-4000-a000-00000000013e', 'https://randomuser.me/api/portraits/women/22.jpg', 'https://randomuser.me/api/portraits/women/22.jpg', true, true)
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.photos (user_id, storage_path, thumbnail_path, is_primary, is_approved)
VALUES ('00000000-0000-4000-a000-00000000013f', 'https://randomuser.me/api/portraits/men/23.jpg', 'https://randomuser.me/api/portraits/men/23.jpg', true, true)
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.photos (user_id, storage_path, thumbnail_path, is_primary, is_approved)
VALUES ('00000000-0000-4000-a000-000000000140', 'https://randomuser.me/api/portraits/women/24.jpg', 'https://randomuser.me/api/portraits/women/24.jpg', true, true)
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.photos (user_id, storage_path, thumbnail_path, is_primary, is_approved)
VALUES ('00000000-0000-4000-a000-000000000141', 'https://randomuser.me/api/portraits/men/25.jpg', 'https://randomuser.me/api/portraits/men/25.jpg', true, true)
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.photos (user_id, storage_path, thumbnail_path, is_primary, is_approved)
VALUES ('00000000-0000-4000-a000-000000000142', 'https://randomuser.me/api/portraits/women/26.jpg', 'https://randomuser.me/api/portraits/women/26.jpg', true, true)
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.photos (user_id, storage_path, thumbnail_path, is_primary, is_approved)
VALUES ('00000000-0000-4000-a000-000000000143', 'https://randomuser.me/api/portraits/men/27.jpg', 'https://randomuser.me/api/portraits/men/27.jpg', true, true)
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.photos (user_id, storage_path, thumbnail_path, is_primary, is_approved)
VALUES ('00000000-0000-4000-a000-000000000144', 'https://randomuser.me/api/portraits/women/28.jpg', 'https://randomuser.me/api/portraits/women/28.jpg', true, true)
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.photos (user_id, storage_path, thumbnail_path, is_primary, is_approved)
VALUES ('00000000-0000-4000-a000-000000000145', 'https://randomuser.me/api/portraits/men/29.jpg', 'https://randomuser.me/api/portraits/men/29.jpg', true, true)
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.photos (user_id, storage_path, thumbnail_path, is_primary, is_approved)
VALUES ('00000000-0000-4000-a000-000000000146', 'https://randomuser.me/api/portraits/women/30.jpg', 'https://randomuser.me/api/portraits/women/30.jpg', true, true)
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.photos (user_id, storage_path, thumbnail_path, is_primary, is_approved)
VALUES ('00000000-0000-4000-a000-000000000147', 'https://randomuser.me/api/portraits/men/31.jpg', 'https://randomuser.me/api/portraits/men/31.jpg', true, true)
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.photos (user_id, storage_path, thumbnail_path, is_primary, is_approved)
VALUES ('00000000-0000-4000-a000-000000000148', 'https://randomuser.me/api/portraits/women/32.jpg', 'https://randomuser.me/api/portraits/women/32.jpg', true, true)
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.photos (user_id, storage_path, thumbnail_path, is_primary, is_approved)
VALUES ('00000000-0000-4000-a000-000000000149', 'https://randomuser.me/api/portraits/men/33.jpg', 'https://randomuser.me/api/portraits/men/33.jpg', true, true)
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.photos (user_id, storage_path, thumbnail_path, is_primary, is_approved)
VALUES ('00000000-0000-4000-a000-00000000014a', 'https://randomuser.me/api/portraits/women/34.jpg', 'https://randomuser.me/api/portraits/women/34.jpg', true, true)
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.photos (user_id, storage_path, thumbnail_path, is_primary, is_approved)
VALUES ('00000000-0000-4000-a000-00000000014b', 'https://randomuser.me/api/portraits/men/35.jpg', 'https://randomuser.me/api/portraits/men/35.jpg', true, true)
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.photos (user_id, storage_path, thumbnail_path, is_primary, is_approved)
VALUES ('00000000-0000-4000-a000-00000000014c', 'https://randomuser.me/api/portraits/women/36.jpg', 'https://randomuser.me/api/portraits/women/36.jpg', true, true)
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.photos (user_id, storage_path, thumbnail_path, is_primary, is_approved)
VALUES ('00000000-0000-4000-a000-00000000014d', 'https://randomuser.me/api/portraits/men/37.jpg', 'https://randomuser.me/api/portraits/men/37.jpg', true, true)
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.photos (user_id, storage_path, thumbnail_path, is_primary, is_approved)
VALUES ('00000000-0000-4000-a000-00000000014e', 'https://randomuser.me/api/portraits/women/38.jpg', 'https://randomuser.me/api/portraits/women/38.jpg', true, true)
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.photos (user_id, storage_path, thumbnail_path, is_primary, is_approved)
VALUES ('00000000-0000-4000-a000-00000000014f', 'https://randomuser.me/api/portraits/men/39.jpg', 'https://randomuser.me/api/portraits/men/39.jpg', true, true)
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.photos (user_id, storage_path, thumbnail_path, is_primary, is_approved)
VALUES ('00000000-0000-4000-a000-000000000150', 'https://randomuser.me/api/portraits/women/40.jpg', 'https://randomuser.me/api/portraits/women/40.jpg', true, true)
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.photos (user_id, storage_path, thumbnail_path, is_primary, is_approved)
VALUES ('00000000-0000-4000-a000-000000000151', 'https://randomuser.me/api/portraits/men/41.jpg', 'https://randomuser.me/api/portraits/men/41.jpg', true, true)
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.photos (user_id, storage_path, thumbnail_path, is_primary, is_approved)
VALUES ('00000000-0000-4000-a000-000000000152', 'https://randomuser.me/api/portraits/women/42.jpg', 'https://randomuser.me/api/portraits/women/42.jpg', true, true)
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.photos (user_id, storage_path, thumbnail_path, is_primary, is_approved)
VALUES ('00000000-0000-4000-a000-000000000153', 'https://randomuser.me/api/portraits/men/43.jpg', 'https://randomuser.me/api/portraits/men/43.jpg', true, true)
ON CONFLICT (id) DO NOTHING;
INSERT INTO public.photos (user_id, storage_path, thumbnail_path, is_primary, is_approved)
VALUES ('00000000-0000-4000-a000-000000000154', 'https://randomuser.me/api/portraits/women/44.jpg', 'https://randomuser.me/api/portraits/women/44.jpg', true, true)
ON CONFLICT (id) DO NOTHING;

COMMIT;
