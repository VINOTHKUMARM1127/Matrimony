-- ============================================================
-- Tamil Matrimony — Seeding Ecosystem (Part 2)
-- ============================================================

CREATE EXTENSION IF NOT EXISTS pgcrypto;

BEGIN;

-- 1. AUTH USERS INSERTIONS
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-0000000000ab', 'tamiluser171@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Ganesan Pandian"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-0000000000ac', 'tamiluser172@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Vidya Naicker"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-0000000000ad', 'tamiluser173@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Mohan Nathan"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-0000000000ae', 'tamiluser174@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Keerthana Swamy"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-0000000000af', 'tamiluser175@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Jayakumar Swamy"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-0000000000b0', 'tamiluser176@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Rajeshwari Murthy"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-0000000000b1', 'tamiluser177@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Srinivasan Selvan"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-0000000000b2', 'tamiluser178@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Nandhini Moorthy"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-0000000000b3', 'tamiluser179@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Murugan Moorthy"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-0000000000b4', 'tamiluser180@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Chitra Raj"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-0000000000b5', 'tamiluser181@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Suresh Nathan"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-0000000000b6', 'tamiluser182@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Malarvizhi Kumar"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-0000000000b7', 'tamiluser183@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Ganesan Devan"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-0000000000b8', 'tamiluser184@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Parvathi Samy"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-0000000000b9', 'tamiluser185@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Selvam Selvan"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-0000000000ba', 'tamiluser186@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Shalini Raman"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-0000000000bb', 'tamiluser187@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Selvam Selvan"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-0000000000bc', 'tamiluser188@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Geetha Selvan"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-0000000000bd', 'tamiluser189@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Senthil Nathan"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-0000000000be', 'tamiluser190@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Pooja Moorthy"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-0000000000bf', 'tamiluser191@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Suresh Devan"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-0000000000c0', 'tamiluser192@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Ramani Velan"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-0000000000c1', 'tamiluser193@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Manikandan Gopal"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-0000000000c2', 'tamiluser194@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Shanthi Shankar"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-0000000000c3', 'tamiluser195@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Anand Moorthy"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-0000000000c4', 'tamiluser196@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Uma Balan"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-0000000000c5', 'tamiluser197@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Vetrivel Gopal"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-0000000000c6', 'tamiluser198@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Chitra Samy"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-0000000000c7', 'tamiluser199@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Viswanathan Velan"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-0000000000c8', 'tamiluser200@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Kokila Lingam"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-0000000000c9', 'tamiluser201@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Mohan Raman"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-0000000000ca', 'tamiluser202@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Gowri Samy"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-0000000000cb', 'tamiluser203@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Ajith Raj"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-0000000000cc', 'tamiluser204@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Kayalvizhi Gopal"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-0000000000cd', 'tamiluser205@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Vignesh Krishnan"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-0000000000ce', 'tamiluser206@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Lakshmi Devan"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-0000000000cf', 'tamiluser207@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Prakash Devan"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-0000000000d0', 'tamiluser208@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Abirami Naicker"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-0000000000d1', 'tamiluser209@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Vijay Nathan"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-0000000000d2', 'tamiluser210@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Kayalvizhi Swamy"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-0000000000d3', 'tamiluser211@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Rajesh Krishnan"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-0000000000d4', 'tamiluser212@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Gayathri Krishnan"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-0000000000d5', 'tamiluser213@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Ramakrishnan Gopal"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-0000000000d6', 'tamiluser214@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Shalini Sundaram"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-0000000000d7', 'tamiluser215@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Jeeva Krishnan"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-0000000000d8', 'tamiluser216@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Banumathi Gopal"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-0000000000d9', 'tamiluser217@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Sundar Sundaram"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-0000000000da', 'tamiluser218@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Archana Samy"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-0000000000db', 'tamiluser219@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Anand Sundaram"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-0000000000dc', 'tamiluser220@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Lakshmi Gopal"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-0000000000dd', 'tamiluser221@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Prabhu Devan"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-0000000000de', 'tamiluser222@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Swetha Samy"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-0000000000df', 'tamiluser223@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Kabilan Sundaram"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-0000000000e0', 'tamiluser224@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Abirami Moorthy"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-0000000000e1', 'tamiluser225@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Ranjith Devan"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-0000000000e2', 'tamiluser226@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Soundarya Krishnan"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-0000000000e3', 'tamiluser227@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Arun Velan"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-0000000000e4', 'tamiluser228@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Nandhini Velan"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-0000000000e5', 'tamiluser229@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Kannan Selvan"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-0000000000e6', 'tamiluser230@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Divya Sundaram"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-0000000000e7', 'tamiluser231@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Hari Balan"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-0000000000e8', 'tamiluser232@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Malarvizhi Gopal"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-0000000000e9', 'tamiluser233@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Murugan Mani"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-0000000000ea', 'tamiluser234@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Pavithra Sundaram"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-0000000000eb', 'tamiluser235@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Ramakrishnan Naicker"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-0000000000ec', 'tamiluser236@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Gowri Sundaram"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-0000000000ed', 'tamiluser237@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Jeeva Samy"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-0000000000ee', 'tamiluser238@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Rajeshwari Sundaram"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-0000000000ef', 'tamiluser239@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Selvam Sundaram"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-0000000000f0', 'tamiluser240@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Vidya Samy"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-0000000000f1', 'tamiluser241@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Kabilan Selvan"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-0000000000f2', 'tamiluser242@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Gayathri Naicker"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-0000000000f3', 'tamiluser243@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Prakash Devan"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-0000000000f4', 'tamiluser244@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Kokila Devan"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-0000000000f5', 'tamiluser245@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Kabilan Gopal"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-0000000000f6', 'tamiluser246@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Janani Mani"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-0000000000f7', 'tamiluser247@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Siddharth Naicker"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-0000000000f8', 'tamiluser248@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Malathi Shankar"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-0000000000f9', 'tamiluser249@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Thirumal Gopal"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-0000000000fa', 'tamiluser250@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Abirami Lingam"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-0000000000fb', 'tamiluser251@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Chinnasamy Moorthy"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-0000000000fc', 'tamiluser252@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Kokila Sundaram"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-0000000000fd', 'tamiluser253@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Karthik Krishnan"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-0000000000fe', 'tamiluser254@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Rajeshwari Murthy"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-0000000000ff', 'tamiluser255@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Senthil Raj"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-000000000100', 'tamiluser256@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Megala Pandian"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-000000000101', 'tamiluser257@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Sundar Naicker"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-000000000102', 'tamiluser258@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Ponmani Gopal"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-000000000103', 'tamiluser259@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Gautham Krishnan"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-000000000104', 'tamiluser260@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Shalini Raj"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-000000000105', 'tamiluser261@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Mohan Balan"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-000000000106', 'tamiluser262@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Harini Devan"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-000000000107', 'tamiluser263@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Srinivasan Krishnan"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-000000000108', 'tamiluser264@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Priya Naicker"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-000000000109', 'tamiluser265@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Karthik Raj"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-00000000010a', 'tamiluser266@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Pooja Balan"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-00000000010b', 'tamiluser267@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Surya Lingam"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-00000000010c', 'tamiluser268@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Ramya Selvan"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-00000000010d', 'tamiluser269@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Hari Mani"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-00000000010e', 'tamiluser270@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Sandhya Sundaram"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-00000000010f', 'tamiluser271@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Mohan Velan"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-000000000110', 'tamiluser272@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Vanitha Devan"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-000000000111', 'tamiluser273@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Mohan Devan"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-000000000112', 'tamiluser274@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Megala Nathan"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-000000000113', 'tamiluser275@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Selvam Swamy"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-000000000114', 'tamiluser276@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Abirami Gopal"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-000000000115', 'tamiluser277@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Madhavan Kumar"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-000000000116', 'tamiluser278@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Pavithra Lingam"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-000000000117', 'tamiluser279@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Jeeva Nathan"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-000000000118', 'tamiluser280@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Chitra Mani"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-000000000119', 'tamiluser281@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Ramakrishnan Murthy"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-00000000011a', 'tamiluser282@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Vidya Samy"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-00000000011b', 'tamiluser283@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Elango Naicker"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-00000000011c', 'tamiluser284@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Vanitha Krishnan"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-00000000011d', 'tamiluser285@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Vetrivel Samy"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-00000000011e', 'tamiluser286@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Geetha Krishnan"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-00000000011f', 'tamiluser287@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Karthik Raman"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-000000000120', 'tamiluser288@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Rajeshwari Lingam"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-000000000121', 'tamiluser289@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Muthu Raman"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-000000000122', 'tamiluser290@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Uma Balan"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-000000000123', 'tamiluser291@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Viswanathan Balan"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-000000000124', 'tamiluser292@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Nandhini Sundaram"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-000000000125', 'tamiluser293@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Ramesh Shankar"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-000000000126', 'tamiluser294@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Saraswathi Nathan"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-000000000127', 'tamiluser295@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Srinivasan Samy"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-000000000128', 'tamiluser296@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Saraswathi Devan"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-000000000129', 'tamiluser297@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Suresh Murthy"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-00000000012a', 'tamiluser298@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Keerthana Raj"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-00000000012b', 'tamiluser299@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Rajesh Selvan"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-00000000012c', 'tamiluser300@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Rajeshwari Kumar"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-00000000012d', 'tamiluser301@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Vinoth Naicker"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-00000000012e', 'tamiluser302@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Shanthi Samy"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-00000000012f', 'tamiluser303@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Vetrivel Naicker"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-000000000130', 'tamiluser304@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Chitra Devan"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-000000000131', 'tamiluser305@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Ganesan Nathan"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-000000000132', 'tamiluser306@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Banumathi Swamy"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-000000000133', 'tamiluser307@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Vinoth Swamy"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-000000000134', 'tamiluser308@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Pooja Devan"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-000000000135', 'tamiluser309@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Ramesh Kumar"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-000000000136', 'tamiluser310@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Malathi Samy"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-000000000137', 'tamiluser311@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Anand Samy"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-000000000138', 'tamiluser312@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Vijaya Kumar"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-000000000139', 'tamiluser313@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Mohan Selvan"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-00000000013a', 'tamiluser314@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Parvathi Devan"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-00000000013b', 'tamiluser315@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Muthu Devan"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-00000000013c', 'tamiluser316@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Pooja Balan"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-00000000013d', 'tamiluser317@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Jayakumar Nathan"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-00000000013e', 'tamiluser318@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Rajeshwari Gopal"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-00000000013f', 'tamiluser319@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Dinesh Murthy"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-000000000140', 'tamiluser320@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Ponmani Murthy"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-000000000141', 'tamiluser321@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Muthu Mani"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-000000000142', 'tamiluser322@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Shanthi Sundaram"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-000000000143', 'tamiluser323@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Naveen Balan"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-000000000144', 'tamiluser324@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Janani Selvan"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-000000000145', 'tamiluser325@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Velmurugan Moorthy"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-000000000146', 'tamiluser326@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Pooja Nathan"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-000000000147', 'tamiluser327@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Velmurugan Devan"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-000000000148', 'tamiluser328@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Lakshmi Kumar"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-000000000149', 'tamiluser329@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Prabhu Sundaram"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-00000000014a', 'tamiluser330@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Geetha Nathan"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-00000000014b', 'tamiluser331@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Vijay Shankar"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-00000000014c', 'tamiluser332@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Yazhini Raj"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-00000000014d', 'tamiluser333@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Ramakrishnan Nathan"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-00000000014e', 'tamiluser334@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Malarvizhi Lingam"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-00000000014f', 'tamiluser335@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Suresh Sundaram"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-000000000150', 'tamiluser336@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Priya Kumar"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-000000000151', 'tamiluser337@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Karthik Lingam"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-000000000152', 'tamiluser338@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Vijaya Lingam"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-000000000153', 'tamiluser339@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Senthil Shankar"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;
INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, created_at, instance_id, aud, role)
VALUES ('00000000-0000-4000-a000-000000000154', 'tamiluser340@matrimonydemo.com', crypt('SecurePassword123', gen_salt('bf')), NOW(), '{"provider":"email","providers":["email"]}', '{"display_name":"Soundarya Shankar"}', NOW(), '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated')
ON CONFLICT (id) DO NOTHING;

-- 2. PUBLIC PROFILES INSERTIONS
INSERT INTO public.profiles (id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, father_occupation, mother_occupation, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at)
VALUES ('00000000-0000-4000-a000-0000000000ab', 'TM000171', 'Ganesan Pandian', 'male', '1993-03-12', 166, 'never_married', 'Hindu', 'Arunthathiyar', 'Arunthathiyar subcaste', 'no', 'B.Com', 'B.Com Graduate', 'Business Owner', 'Business Owner Details', '₹10 Lakhs - ₹15 Lakhs', 'Zoho', 'Tiruppur', 'Tiruppur', 'Hi, I am Ganesan. I have completed my B.Com and am currently working as a Business Owner at Zoho in Tiruppur. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'joint', 'upper_middle_class', 'Retired Employee', 'Homemaker', true, false, true, 100, NOW() - INTERVAL '3 days')
ON CONFLICT (id) DO UPDATE SET
  profile_id = EXCLUDED.profile_id,
  display_name = EXCLUDED.display_name,
  gender = EXCLUDED.gender,
  date_of_birth = EXCLUDED.date_of_birth,
  height_cm = EXCLUDED.height_cm,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  subcaste = EXCLUDED.subcaste,
  dosham = EXCLUDED.dosham,
  education = EXCLUDED.education,
  education_detail = EXCLUDED.education_detail,
  occupation = EXCLUDED.occupation,
  occupation_detail = EXCLUDED.occupation_detail,
  annual_income = EXCLUDED.annual_income,
  company_name = EXCLUDED.company_name,
  city = EXCLUDED.city,
  district = EXCLUDED.district,
  about_me = EXCLUDED.about_me,
  family_type = EXCLUDED.family_type,
  family_status = EXCLUDED.family_status,
  father_occupation = EXCLUDED.father_occupation,
  mother_occupation = EXCLUDED.mother_occupation,
  is_verified = EXCLUDED.is_verified,
  is_premium = EXCLUDED.is_premium,
  is_profile_complete = EXCLUDED.is_profile_complete,
  profile_completion_percent = EXCLUDED.profile_completion_percent,
  last_active_at = EXCLUDED.last_active_at;
INSERT INTO public.profiles (id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, father_occupation, mother_occupation, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at)
VALUES ('00000000-0000-4000-a000-0000000000ac', 'TM000172', 'Vidya Naicker', 'female', '1989-02-26', 165, 'never_married', 'Hindu', 'Naidu', 'Naidu subcaste', 'no', 'B.Ed', 'B.Ed Graduate', 'Civil Engineer', 'Civil Engineer Details', '₹3 Lakhs - ₹5 Lakhs', 'Zoho', 'Chennai', 'Chennai', 'Hi, I am Vidya. I have completed my B.Ed and am currently working as a Civil Engineer at Zoho in Chennai. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'upper_middle_class', 'Retired Employee', 'Homemaker', true, false, true, 100, NOW() - INTERVAL '4 days')
ON CONFLICT (id) DO UPDATE SET
  profile_id = EXCLUDED.profile_id,
  display_name = EXCLUDED.display_name,
  gender = EXCLUDED.gender,
  date_of_birth = EXCLUDED.date_of_birth,
  height_cm = EXCLUDED.height_cm,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  subcaste = EXCLUDED.subcaste,
  dosham = EXCLUDED.dosham,
  education = EXCLUDED.education,
  education_detail = EXCLUDED.education_detail,
  occupation = EXCLUDED.occupation,
  occupation_detail = EXCLUDED.occupation_detail,
  annual_income = EXCLUDED.annual_income,
  company_name = EXCLUDED.company_name,
  city = EXCLUDED.city,
  district = EXCLUDED.district,
  about_me = EXCLUDED.about_me,
  family_type = EXCLUDED.family_type,
  family_status = EXCLUDED.family_status,
  father_occupation = EXCLUDED.father_occupation,
  mother_occupation = EXCLUDED.mother_occupation,
  is_verified = EXCLUDED.is_verified,
  is_premium = EXCLUDED.is_premium,
  is_profile_complete = EXCLUDED.is_profile_complete,
  profile_completion_percent = EXCLUDED.profile_completion_percent,
  last_active_at = EXCLUDED.last_active_at;
INSERT INTO public.profiles (id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, father_occupation, mother_occupation, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at)
VALUES ('00000000-0000-4000-a000-0000000000ad', 'TM000173', 'Mohan Nathan', 'male', '1989-01-19', 169, 'never_married', 'Hindu', 'Gounder', NULL, 'no', 'Ph.D', 'Ph.D Graduate', 'Business Owner', 'Business Owner Details', '₹7 Lakhs - ₹10 Lakhs', 'Infosys', 'Thanjavur', 'Thanjavur', 'Hi, I am Mohan. I have completed my Ph.D and am currently working as a Business Owner at Infosys in Thanjavur. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'rich', 'Retired Employee', 'Homemaker', false, false, true, 100, NOW() - INTERVAL '5 days')
ON CONFLICT (id) DO UPDATE SET
  profile_id = EXCLUDED.profile_id,
  display_name = EXCLUDED.display_name,
  gender = EXCLUDED.gender,
  date_of_birth = EXCLUDED.date_of_birth,
  height_cm = EXCLUDED.height_cm,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  subcaste = EXCLUDED.subcaste,
  dosham = EXCLUDED.dosham,
  education = EXCLUDED.education,
  education_detail = EXCLUDED.education_detail,
  occupation = EXCLUDED.occupation,
  occupation_detail = EXCLUDED.occupation_detail,
  annual_income = EXCLUDED.annual_income,
  company_name = EXCLUDED.company_name,
  city = EXCLUDED.city,
  district = EXCLUDED.district,
  about_me = EXCLUDED.about_me,
  family_type = EXCLUDED.family_type,
  family_status = EXCLUDED.family_status,
  father_occupation = EXCLUDED.father_occupation,
  mother_occupation = EXCLUDED.mother_occupation,
  is_verified = EXCLUDED.is_verified,
  is_premium = EXCLUDED.is_premium,
  is_profile_complete = EXCLUDED.is_profile_complete,
  profile_completion_percent = EXCLUDED.profile_completion_percent,
  last_active_at = EXCLUDED.last_active_at;
INSERT INTO public.profiles (id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, father_occupation, mother_occupation, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at)
VALUES ('00000000-0000-4000-a000-0000000000ae', 'TM000174', 'Keerthana Swamy', 'female', '2003-03-06', 154, 'never_married', 'Hindu', 'Sengunthar', NULL, 'no', 'B.Ed', 'B.Ed Graduate', 'School Teacher', 'School Teacher Details', '₹15 Lakhs - ₹20 Lakhs', 'Accenture', 'Salem', 'Salem', 'Hi, I am Keerthana. I have completed my B.Ed and am currently working as a School Teacher at Accenture in Salem. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'middle_class', 'Retired Employee', 'Homemaker', true, false, true, 100, NOW() - INTERVAL '1 days')
ON CONFLICT (id) DO UPDATE SET
  profile_id = EXCLUDED.profile_id,
  display_name = EXCLUDED.display_name,
  gender = EXCLUDED.gender,
  date_of_birth = EXCLUDED.date_of_birth,
  height_cm = EXCLUDED.height_cm,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  subcaste = EXCLUDED.subcaste,
  dosham = EXCLUDED.dosham,
  education = EXCLUDED.education,
  education_detail = EXCLUDED.education_detail,
  occupation = EXCLUDED.occupation,
  occupation_detail = EXCLUDED.occupation_detail,
  annual_income = EXCLUDED.annual_income,
  company_name = EXCLUDED.company_name,
  city = EXCLUDED.city,
  district = EXCLUDED.district,
  about_me = EXCLUDED.about_me,
  family_type = EXCLUDED.family_type,
  family_status = EXCLUDED.family_status,
  father_occupation = EXCLUDED.father_occupation,
  mother_occupation = EXCLUDED.mother_occupation,
  is_verified = EXCLUDED.is_verified,
  is_premium = EXCLUDED.is_premium,
  is_profile_complete = EXCLUDED.is_profile_complete,
  profile_completion_percent = EXCLUDED.profile_completion_percent,
  last_active_at = EXCLUDED.last_active_at;
INSERT INTO public.profiles (id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, father_occupation, mother_occupation, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at)
VALUES ('00000000-0000-4000-a000-0000000000af', 'TM000175', 'Jayakumar Swamy', 'male', '1990-10-21', 168, 'never_married', 'Hindu', 'Mudaliar', NULL, 'no', 'B.Com', 'B.Com Graduate', 'Business Owner', 'Business Owner Details', '₹7 Lakhs - ₹10 Lakhs', 'Wipro', 'Tiruchirappalli', 'Trichy', 'Hi, I am Jayakumar. I have completed my B.Com and am currently working as a Business Owner at Wipro in Tiruchirappalli. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'rich', 'Retired Employee', 'Homemaker', true, false, true, 100, NOW() - INTERVAL '9 days')
ON CONFLICT (id) DO UPDATE SET
  profile_id = EXCLUDED.profile_id,
  display_name = EXCLUDED.display_name,
  gender = EXCLUDED.gender,
  date_of_birth = EXCLUDED.date_of_birth,
  height_cm = EXCLUDED.height_cm,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  subcaste = EXCLUDED.subcaste,
  dosham = EXCLUDED.dosham,
  education = EXCLUDED.education,
  education_detail = EXCLUDED.education_detail,
  occupation = EXCLUDED.occupation,
  occupation_detail = EXCLUDED.occupation_detail,
  annual_income = EXCLUDED.annual_income,
  company_name = EXCLUDED.company_name,
  city = EXCLUDED.city,
  district = EXCLUDED.district,
  about_me = EXCLUDED.about_me,
  family_type = EXCLUDED.family_type,
  family_status = EXCLUDED.family_status,
  father_occupation = EXCLUDED.father_occupation,
  mother_occupation = EXCLUDED.mother_occupation,
  is_verified = EXCLUDED.is_verified,
  is_premium = EXCLUDED.is_premium,
  is_profile_complete = EXCLUDED.is_profile_complete,
  profile_completion_percent = EXCLUDED.profile_completion_percent,
  last_active_at = EXCLUDED.last_active_at;
INSERT INTO public.profiles (id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, father_occupation, mother_occupation, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at)
VALUES ('00000000-0000-4000-a000-0000000000b0', 'TM000176', 'Rajeshwari Murthy', 'female', '1989-11-03', 165, 'divorced', 'Hindu', 'Arunthathiyar', NULL, 'no', 'M.C.A', 'M.C.A Graduate', 'Business Owner', 'Business Owner Details', '₹15 Lakhs - ₹20 Lakhs', 'Wipro', 'Tiruppur', 'Tiruppur', 'Hi, I am Rajeshwari. I have completed my M.C.A and am currently working as a Business Owner at Wipro in Tiruppur. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'rich', 'Retired Employee', 'Homemaker', true, false, true, 100, NOW() - INTERVAL '9 days')
ON CONFLICT (id) DO UPDATE SET
  profile_id = EXCLUDED.profile_id,
  display_name = EXCLUDED.display_name,
  gender = EXCLUDED.gender,
  date_of_birth = EXCLUDED.date_of_birth,
  height_cm = EXCLUDED.height_cm,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  subcaste = EXCLUDED.subcaste,
  dosham = EXCLUDED.dosham,
  education = EXCLUDED.education,
  education_detail = EXCLUDED.education_detail,
  occupation = EXCLUDED.occupation,
  occupation_detail = EXCLUDED.occupation_detail,
  annual_income = EXCLUDED.annual_income,
  company_name = EXCLUDED.company_name,
  city = EXCLUDED.city,
  district = EXCLUDED.district,
  about_me = EXCLUDED.about_me,
  family_type = EXCLUDED.family_type,
  family_status = EXCLUDED.family_status,
  father_occupation = EXCLUDED.father_occupation,
  mother_occupation = EXCLUDED.mother_occupation,
  is_verified = EXCLUDED.is_verified,
  is_premium = EXCLUDED.is_premium,
  is_profile_complete = EXCLUDED.is_profile_complete,
  profile_completion_percent = EXCLUDED.profile_completion_percent,
  last_active_at = EXCLUDED.last_active_at;
INSERT INTO public.profiles (id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, father_occupation, mother_occupation, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at)
VALUES ('00000000-0000-4000-a000-0000000000b1', 'TM000177', 'Srinivasan Selvan', 'male', '2001-05-15', 175, 'never_married', 'Hindu', 'Maravar', NULL, 'no', 'M.Com', 'M.Com Graduate', 'Bank Manager', 'Bank Manager Details', '₹15 Lakhs - ₹20 Lakhs', 'Wipro', 'Madurai', 'Madurai', 'Hi, I am Srinivasan. I have completed my M.Com and am currently working as a Bank Manager at Wipro in Madurai. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'middle_class', 'Retired Employee', 'Homemaker', false, false, true, 100, NOW() - INTERVAL '6 days')
ON CONFLICT (id) DO UPDATE SET
  profile_id = EXCLUDED.profile_id,
  display_name = EXCLUDED.display_name,
  gender = EXCLUDED.gender,
  date_of_birth = EXCLUDED.date_of_birth,
  height_cm = EXCLUDED.height_cm,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  subcaste = EXCLUDED.subcaste,
  dosham = EXCLUDED.dosham,
  education = EXCLUDED.education,
  education_detail = EXCLUDED.education_detail,
  occupation = EXCLUDED.occupation,
  occupation_detail = EXCLUDED.occupation_detail,
  annual_income = EXCLUDED.annual_income,
  company_name = EXCLUDED.company_name,
  city = EXCLUDED.city,
  district = EXCLUDED.district,
  about_me = EXCLUDED.about_me,
  family_type = EXCLUDED.family_type,
  family_status = EXCLUDED.family_status,
  father_occupation = EXCLUDED.father_occupation,
  mother_occupation = EXCLUDED.mother_occupation,
  is_verified = EXCLUDED.is_verified,
  is_premium = EXCLUDED.is_premium,
  is_profile_complete = EXCLUDED.is_profile_complete,
  profile_completion_percent = EXCLUDED.profile_completion_percent,
  last_active_at = EXCLUDED.last_active_at;
INSERT INTO public.profiles (id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, father_occupation, mother_occupation, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at)
VALUES ('00000000-0000-4000-a000-0000000000b2', 'TM000178', 'Nandhini Moorthy', 'female', '1996-11-07', 155, 'never_married', 'Muslim', 'Shia Muslim', 'Shia Muslim subcaste', 'no', 'Ph.D', 'Ph.D Graduate', 'Doctor', 'Doctor Details', '₹7 Lakhs - ₹10 Lakhs', 'Wipro', 'Coimbatore', 'Coimbatore', 'Hi, I am Nandhini. I have completed my Ph.D and am currently working as a Doctor at Wipro in Coimbatore. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'joint', 'middle_class', 'Retired Employee', 'Homemaker', true, false, true, 100, NOW() - INTERVAL '3 days')
ON CONFLICT (id) DO UPDATE SET
  profile_id = EXCLUDED.profile_id,
  display_name = EXCLUDED.display_name,
  gender = EXCLUDED.gender,
  date_of_birth = EXCLUDED.date_of_birth,
  height_cm = EXCLUDED.height_cm,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  subcaste = EXCLUDED.subcaste,
  dosham = EXCLUDED.dosham,
  education = EXCLUDED.education,
  education_detail = EXCLUDED.education_detail,
  occupation = EXCLUDED.occupation,
  occupation_detail = EXCLUDED.occupation_detail,
  annual_income = EXCLUDED.annual_income,
  company_name = EXCLUDED.company_name,
  city = EXCLUDED.city,
  district = EXCLUDED.district,
  about_me = EXCLUDED.about_me,
  family_type = EXCLUDED.family_type,
  family_status = EXCLUDED.family_status,
  father_occupation = EXCLUDED.father_occupation,
  mother_occupation = EXCLUDED.mother_occupation,
  is_verified = EXCLUDED.is_verified,
  is_premium = EXCLUDED.is_premium,
  is_profile_complete = EXCLUDED.is_profile_complete,
  profile_completion_percent = EXCLUDED.profile_completion_percent,
  last_active_at = EXCLUDED.last_active_at;
INSERT INTO public.profiles (id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, father_occupation, mother_occupation, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at)
VALUES ('00000000-0000-4000-a000-0000000000b3', 'TM000179', 'Murugan Moorthy', 'male', '2002-01-08', 183, 'never_married', 'Hindu', 'Gounder', 'Gounder subcaste', 'no', 'M.Com', 'M.Com Graduate', 'Police Officer', 'Police Officer Details', '₹20 Lakhs+', 'TCS', 'Thanjavur', 'Thanjavur', 'Hi, I am Murugan. I have completed my M.Com and am currently working as a Police Officer at TCS in Thanjavur. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'joint', 'rich', 'Retired Employee', 'Homemaker', true, false, true, 100, NOW() - INTERVAL '10 days')
ON CONFLICT (id) DO UPDATE SET
  profile_id = EXCLUDED.profile_id,
  display_name = EXCLUDED.display_name,
  gender = EXCLUDED.gender,
  date_of_birth = EXCLUDED.date_of_birth,
  height_cm = EXCLUDED.height_cm,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  subcaste = EXCLUDED.subcaste,
  dosham = EXCLUDED.dosham,
  education = EXCLUDED.education,
  education_detail = EXCLUDED.education_detail,
  occupation = EXCLUDED.occupation,
  occupation_detail = EXCLUDED.occupation_detail,
  annual_income = EXCLUDED.annual_income,
  company_name = EXCLUDED.company_name,
  city = EXCLUDED.city,
  district = EXCLUDED.district,
  about_me = EXCLUDED.about_me,
  family_type = EXCLUDED.family_type,
  family_status = EXCLUDED.family_status,
  father_occupation = EXCLUDED.father_occupation,
  mother_occupation = EXCLUDED.mother_occupation,
  is_verified = EXCLUDED.is_verified,
  is_premium = EXCLUDED.is_premium,
  is_profile_complete = EXCLUDED.is_profile_complete,
  profile_completion_percent = EXCLUDED.profile_completion_percent,
  last_active_at = EXCLUDED.last_active_at;
INSERT INTO public.profiles (id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, father_occupation, mother_occupation, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at)
VALUES ('00000000-0000-4000-a000-0000000000b4', 'TM000180', 'Chitra Raj', 'female', '2004-01-28', 173, 'never_married', 'Hindu', 'Gounder', 'Gounder subcaste', 'no', 'M.Com', 'M.Com Graduate', 'Architect', 'Architect Details', '₹5 Lakhs - ₹7 Lakhs', 'Wipro', 'Coimbatore', 'Coimbatore', 'Hi, I am Chitra. I have completed my M.Com and am currently working as a Architect at Wipro in Coimbatore. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'middle_class', 'Retired Employee', 'Homemaker', true, false, true, 100, NOW() - INTERVAL '9 days')
ON CONFLICT (id) DO UPDATE SET
  profile_id = EXCLUDED.profile_id,
  display_name = EXCLUDED.display_name,
  gender = EXCLUDED.gender,
  date_of_birth = EXCLUDED.date_of_birth,
  height_cm = EXCLUDED.height_cm,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  subcaste = EXCLUDED.subcaste,
  dosham = EXCLUDED.dosham,
  education = EXCLUDED.education,
  education_detail = EXCLUDED.education_detail,
  occupation = EXCLUDED.occupation,
  occupation_detail = EXCLUDED.occupation_detail,
  annual_income = EXCLUDED.annual_income,
  company_name = EXCLUDED.company_name,
  city = EXCLUDED.city,
  district = EXCLUDED.district,
  about_me = EXCLUDED.about_me,
  family_type = EXCLUDED.family_type,
  family_status = EXCLUDED.family_status,
  father_occupation = EXCLUDED.father_occupation,
  mother_occupation = EXCLUDED.mother_occupation,
  is_verified = EXCLUDED.is_verified,
  is_premium = EXCLUDED.is_premium,
  is_profile_complete = EXCLUDED.is_profile_complete,
  profile_completion_percent = EXCLUDED.profile_completion_percent,
  last_active_at = EXCLUDED.last_active_at;
INSERT INTO public.profiles (id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, father_occupation, mother_occupation, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at)
VALUES ('00000000-0000-4000-a000-0000000000b5', 'TM000181', 'Suresh Nathan', 'male', '2004-08-12', 174, 'never_married', 'Hindu', 'Brahmin - Iyer', 'Brahmin - Iyer subcaste', 'no', 'B.Ed', 'B.Ed Graduate', 'Doctor', 'Doctor Details', '₹20 Lakhs+', 'TCS', 'Coimbatore', 'Coimbatore', 'Hi, I am Suresh. I have completed my B.Ed and am currently working as a Doctor at TCS in Coimbatore. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'joint', 'middle_class', 'Retired Employee', 'Homemaker', false, false, true, 100, NOW() - INTERVAL '7 days')
ON CONFLICT (id) DO UPDATE SET
  profile_id = EXCLUDED.profile_id,
  display_name = EXCLUDED.display_name,
  gender = EXCLUDED.gender,
  date_of_birth = EXCLUDED.date_of_birth,
  height_cm = EXCLUDED.height_cm,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  subcaste = EXCLUDED.subcaste,
  dosham = EXCLUDED.dosham,
  education = EXCLUDED.education,
  education_detail = EXCLUDED.education_detail,
  occupation = EXCLUDED.occupation,
  occupation_detail = EXCLUDED.occupation_detail,
  annual_income = EXCLUDED.annual_income,
  company_name = EXCLUDED.company_name,
  city = EXCLUDED.city,
  district = EXCLUDED.district,
  about_me = EXCLUDED.about_me,
  family_type = EXCLUDED.family_type,
  family_status = EXCLUDED.family_status,
  father_occupation = EXCLUDED.father_occupation,
  mother_occupation = EXCLUDED.mother_occupation,
  is_verified = EXCLUDED.is_verified,
  is_premium = EXCLUDED.is_premium,
  is_profile_complete = EXCLUDED.is_profile_complete,
  profile_completion_percent = EXCLUDED.profile_completion_percent,
  last_active_at = EXCLUDED.last_active_at;
INSERT INTO public.profiles (id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, father_occupation, mother_occupation, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at)
VALUES ('00000000-0000-4000-a000-0000000000b6', 'TM000182', 'Malarvizhi Kumar', 'female', '2003-09-26', 153, 'never_married', 'Hindu', 'Kallar', 'Kallar subcaste', 'no', 'M.A', 'M.A Graduate', 'Doctor', 'Doctor Details', '₹20 Lakhs+', 'Zoho', 'Tirunelveli', 'Tirunelveli', 'Hi, I am Malarvizhi. I have completed my M.A and am currently working as a Doctor at Zoho in Tirunelveli. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'rich', 'Retired Employee', 'Homemaker', true, false, true, 100, NOW() - INTERVAL '8 days')
ON CONFLICT (id) DO UPDATE SET
  profile_id = EXCLUDED.profile_id,
  display_name = EXCLUDED.display_name,
  gender = EXCLUDED.gender,
  date_of_birth = EXCLUDED.date_of_birth,
  height_cm = EXCLUDED.height_cm,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  subcaste = EXCLUDED.subcaste,
  dosham = EXCLUDED.dosham,
  education = EXCLUDED.education,
  education_detail = EXCLUDED.education_detail,
  occupation = EXCLUDED.occupation,
  occupation_detail = EXCLUDED.occupation_detail,
  annual_income = EXCLUDED.annual_income,
  company_name = EXCLUDED.company_name,
  city = EXCLUDED.city,
  district = EXCLUDED.district,
  about_me = EXCLUDED.about_me,
  family_type = EXCLUDED.family_type,
  family_status = EXCLUDED.family_status,
  father_occupation = EXCLUDED.father_occupation,
  mother_occupation = EXCLUDED.mother_occupation,
  is_verified = EXCLUDED.is_verified,
  is_premium = EXCLUDED.is_premium,
  is_profile_complete = EXCLUDED.is_profile_complete,
  profile_completion_percent = EXCLUDED.profile_completion_percent,
  last_active_at = EXCLUDED.last_active_at;
INSERT INTO public.profiles (id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, father_occupation, mother_occupation, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at)
VALUES ('00000000-0000-4000-a000-0000000000b7', 'TM000183', 'Ganesan Devan', 'male', '1991-10-25', 188, 'never_married', 'Hindu', 'Chettiar', NULL, 'no', 'M.B.A', 'M.B.A Graduate', 'Architect', 'Architect Details', '₹10 Lakhs - ₹15 Lakhs', 'HCL', 'Tirunelveli', 'Tirunelveli', 'Hi, I am Ganesan. I have completed my M.B.A and am currently working as a Architect at HCL in Tirunelveli. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'middle_class', 'Retired Employee', 'Homemaker', true, false, true, 100, NOW() - INTERVAL '3 days')
ON CONFLICT (id) DO UPDATE SET
  profile_id = EXCLUDED.profile_id,
  display_name = EXCLUDED.display_name,
  gender = EXCLUDED.gender,
  date_of_birth = EXCLUDED.date_of_birth,
  height_cm = EXCLUDED.height_cm,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  subcaste = EXCLUDED.subcaste,
  dosham = EXCLUDED.dosham,
  education = EXCLUDED.education,
  education_detail = EXCLUDED.education_detail,
  occupation = EXCLUDED.occupation,
  occupation_detail = EXCLUDED.occupation_detail,
  annual_income = EXCLUDED.annual_income,
  company_name = EXCLUDED.company_name,
  city = EXCLUDED.city,
  district = EXCLUDED.district,
  about_me = EXCLUDED.about_me,
  family_type = EXCLUDED.family_type,
  family_status = EXCLUDED.family_status,
  father_occupation = EXCLUDED.father_occupation,
  mother_occupation = EXCLUDED.mother_occupation,
  is_verified = EXCLUDED.is_verified,
  is_premium = EXCLUDED.is_premium,
  is_profile_complete = EXCLUDED.is_profile_complete,
  profile_completion_percent = EXCLUDED.profile_completion_percent,
  last_active_at = EXCLUDED.last_active_at;
INSERT INTO public.profiles (id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, father_occupation, mother_occupation, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at)
VALUES ('00000000-0000-4000-a000-0000000000b8', 'TM000184', 'Parvathi Samy', 'female', '1994-01-28', 164, 'never_married', 'Hindu', 'Thevar', 'Thevar subcaste', 'no', 'M.C.A', 'M.C.A Graduate', 'Architect', 'Architect Details', '₹15 Lakhs - ₹20 Lakhs', 'Private Practice', 'Kanchipuram', 'Kanchipuram', 'Hi, I am Parvathi. I have completed my M.C.A and am currently working as a Architect at Private Practice in Kanchipuram. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'upper_middle_class', 'Retired Employee', 'Homemaker', true, false, true, 100, NOW() - INTERVAL '5 days')
ON CONFLICT (id) DO UPDATE SET
  profile_id = EXCLUDED.profile_id,
  display_name = EXCLUDED.display_name,
  gender = EXCLUDED.gender,
  date_of_birth = EXCLUDED.date_of_birth,
  height_cm = EXCLUDED.height_cm,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  subcaste = EXCLUDED.subcaste,
  dosham = EXCLUDED.dosham,
  education = EXCLUDED.education,
  education_detail = EXCLUDED.education_detail,
  occupation = EXCLUDED.occupation,
  occupation_detail = EXCLUDED.occupation_detail,
  annual_income = EXCLUDED.annual_income,
  company_name = EXCLUDED.company_name,
  city = EXCLUDED.city,
  district = EXCLUDED.district,
  about_me = EXCLUDED.about_me,
  family_type = EXCLUDED.family_type,
  family_status = EXCLUDED.family_status,
  father_occupation = EXCLUDED.father_occupation,
  mother_occupation = EXCLUDED.mother_occupation,
  is_verified = EXCLUDED.is_verified,
  is_premium = EXCLUDED.is_premium,
  is_profile_complete = EXCLUDED.is_profile_complete,
  profile_completion_percent = EXCLUDED.profile_completion_percent,
  last_active_at = EXCLUDED.last_active_at;
INSERT INTO public.profiles (id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, father_occupation, mother_occupation, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at)
VALUES ('00000000-0000-4000-a000-0000000000b9', 'TM000185', 'Selvam Selvan', 'male', '2004-10-21', 179, 'never_married', 'Hindu', 'Kallar', NULL, 'yes', 'M.B.B.S', 'M.B.B.S Graduate', 'Bank Manager', 'Bank Manager Details', '₹15 Lakhs - ₹20 Lakhs', 'Private Practice', 'Salem', 'Salem', 'Hi, I am Selvam. I have completed my M.B.B.S and am currently working as a Bank Manager at Private Practice in Salem. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'upper_middle_class', 'Retired Employee', 'Homemaker', true, false, true, 100, NOW() - INTERVAL '10 days')
ON CONFLICT (id) DO UPDATE SET
  profile_id = EXCLUDED.profile_id,
  display_name = EXCLUDED.display_name,
  gender = EXCLUDED.gender,
  date_of_birth = EXCLUDED.date_of_birth,
  height_cm = EXCLUDED.height_cm,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  subcaste = EXCLUDED.subcaste,
  dosham = EXCLUDED.dosham,
  education = EXCLUDED.education,
  education_detail = EXCLUDED.education_detail,
  occupation = EXCLUDED.occupation,
  occupation_detail = EXCLUDED.occupation_detail,
  annual_income = EXCLUDED.annual_income,
  company_name = EXCLUDED.company_name,
  city = EXCLUDED.city,
  district = EXCLUDED.district,
  about_me = EXCLUDED.about_me,
  family_type = EXCLUDED.family_type,
  family_status = EXCLUDED.family_status,
  father_occupation = EXCLUDED.father_occupation,
  mother_occupation = EXCLUDED.mother_occupation,
  is_verified = EXCLUDED.is_verified,
  is_premium = EXCLUDED.is_premium,
  is_profile_complete = EXCLUDED.is_profile_complete,
  profile_completion_percent = EXCLUDED.profile_completion_percent,
  last_active_at = EXCLUDED.last_active_at;
INSERT INTO public.profiles (id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, father_occupation, mother_occupation, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at)
VALUES ('00000000-0000-4000-a000-0000000000ba', 'TM000186', 'Shalini Raman', 'female', '1989-03-02', 159, 'never_married', 'Hindu', 'Naidu', NULL, 'no', 'M.A', 'M.A Graduate', 'School Teacher', 'School Teacher Details', '₹3 Lakhs - ₹5 Lakhs', 'HCL', 'Thoothukudi', 'Tuticorin', 'Hi, I am Shalini. I have completed my M.A and am currently working as a School Teacher at HCL in Thoothukudi. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'rich', 'Retired Employee', 'Homemaker', true, false, true, 100, NOW() - INTERVAL '0 days')
ON CONFLICT (id) DO UPDATE SET
  profile_id = EXCLUDED.profile_id,
  display_name = EXCLUDED.display_name,
  gender = EXCLUDED.gender,
  date_of_birth = EXCLUDED.date_of_birth,
  height_cm = EXCLUDED.height_cm,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  subcaste = EXCLUDED.subcaste,
  dosham = EXCLUDED.dosham,
  education = EXCLUDED.education,
  education_detail = EXCLUDED.education_detail,
  occupation = EXCLUDED.occupation,
  occupation_detail = EXCLUDED.occupation_detail,
  annual_income = EXCLUDED.annual_income,
  company_name = EXCLUDED.company_name,
  city = EXCLUDED.city,
  district = EXCLUDED.district,
  about_me = EXCLUDED.about_me,
  family_type = EXCLUDED.family_type,
  family_status = EXCLUDED.family_status,
  father_occupation = EXCLUDED.father_occupation,
  mother_occupation = EXCLUDED.mother_occupation,
  is_verified = EXCLUDED.is_verified,
  is_premium = EXCLUDED.is_premium,
  is_profile_complete = EXCLUDED.is_profile_complete,
  profile_completion_percent = EXCLUDED.profile_completion_percent,
  last_active_at = EXCLUDED.last_active_at;
INSERT INTO public.profiles (id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, father_occupation, mother_occupation, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at)
VALUES ('00000000-0000-4000-a000-0000000000bb', 'TM000187', 'Selvam Selvan', 'male', '2001-02-20', 176, 'never_married', 'Christian', 'RC Christian', 'RC Christian subcaste', 'no', 'M.A', 'M.A Graduate', 'Bank Manager', 'Bank Manager Details', '₹20 Lakhs+', 'TCS', 'Madurai', 'Madurai', 'Hi, I am Selvam. I have completed my M.A and am currently working as a Bank Manager at TCS in Madurai. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'rich', 'Retired Employee', 'Homemaker', true, false, true, 100, NOW() - INTERVAL '4 days')
ON CONFLICT (id) DO UPDATE SET
  profile_id = EXCLUDED.profile_id,
  display_name = EXCLUDED.display_name,
  gender = EXCLUDED.gender,
  date_of_birth = EXCLUDED.date_of_birth,
  height_cm = EXCLUDED.height_cm,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  subcaste = EXCLUDED.subcaste,
  dosham = EXCLUDED.dosham,
  education = EXCLUDED.education,
  education_detail = EXCLUDED.education_detail,
  occupation = EXCLUDED.occupation,
  occupation_detail = EXCLUDED.occupation_detail,
  annual_income = EXCLUDED.annual_income,
  company_name = EXCLUDED.company_name,
  city = EXCLUDED.city,
  district = EXCLUDED.district,
  about_me = EXCLUDED.about_me,
  family_type = EXCLUDED.family_type,
  family_status = EXCLUDED.family_status,
  father_occupation = EXCLUDED.father_occupation,
  mother_occupation = EXCLUDED.mother_occupation,
  is_verified = EXCLUDED.is_verified,
  is_premium = EXCLUDED.is_premium,
  is_profile_complete = EXCLUDED.is_profile_complete,
  profile_completion_percent = EXCLUDED.profile_completion_percent,
  last_active_at = EXCLUDED.last_active_at;
INSERT INTO public.profiles (id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, father_occupation, mother_occupation, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at)
VALUES ('00000000-0000-4000-a000-0000000000bc', 'TM000188', 'Geetha Selvan', 'female', '2001-12-11', 171, 'never_married', 'Christian', 'CSI Christian', NULL, 'no', 'M.Com', 'M.Com Graduate', 'Architect', 'Architect Details', '₹7 Lakhs - ₹10 Lakhs', 'Wipro', 'Madurai', 'Madurai', 'Hi, I am Geetha. I have completed my M.Com and am currently working as a Architect at Wipro in Madurai. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'upper_middle_class', 'Retired Employee', 'Homemaker', true, false, true, 100, NOW() - INTERVAL '2 days')
ON CONFLICT (id) DO UPDATE SET
  profile_id = EXCLUDED.profile_id,
  display_name = EXCLUDED.display_name,
  gender = EXCLUDED.gender,
  date_of_birth = EXCLUDED.date_of_birth,
  height_cm = EXCLUDED.height_cm,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  subcaste = EXCLUDED.subcaste,
  dosham = EXCLUDED.dosham,
  education = EXCLUDED.education,
  education_detail = EXCLUDED.education_detail,
  occupation = EXCLUDED.occupation,
  occupation_detail = EXCLUDED.occupation_detail,
  annual_income = EXCLUDED.annual_income,
  company_name = EXCLUDED.company_name,
  city = EXCLUDED.city,
  district = EXCLUDED.district,
  about_me = EXCLUDED.about_me,
  family_type = EXCLUDED.family_type,
  family_status = EXCLUDED.family_status,
  father_occupation = EXCLUDED.father_occupation,
  mother_occupation = EXCLUDED.mother_occupation,
  is_verified = EXCLUDED.is_verified,
  is_premium = EXCLUDED.is_premium,
  is_profile_complete = EXCLUDED.is_profile_complete,
  profile_completion_percent = EXCLUDED.profile_completion_percent,
  last_active_at = EXCLUDED.last_active_at;
INSERT INTO public.profiles (id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, father_occupation, mother_occupation, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at)
VALUES ('00000000-0000-4000-a000-0000000000bd', 'TM000189', 'Senthil Nathan', 'male', '2001-03-21', 182, 'never_married', 'Hindu', 'Thevar', 'Thevar subcaste', 'yes', 'M.Sc', 'M.Sc Graduate', 'Civil Engineer', 'Civil Engineer Details', '₹3 Lakhs - ₹5 Lakhs', 'Government Service', 'Kanchipuram', 'Kanchipuram', 'Hi, I am Senthil. I have completed my M.Sc and am currently working as a Civil Engineer at Government Service in Kanchipuram. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'upper_middle_class', 'Retired Employee', 'Homemaker', false, false, true, 100, NOW() - INTERVAL '9 days')
ON CONFLICT (id) DO UPDATE SET
  profile_id = EXCLUDED.profile_id,
  display_name = EXCLUDED.display_name,
  gender = EXCLUDED.gender,
  date_of_birth = EXCLUDED.date_of_birth,
  height_cm = EXCLUDED.height_cm,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  subcaste = EXCLUDED.subcaste,
  dosham = EXCLUDED.dosham,
  education = EXCLUDED.education,
  education_detail = EXCLUDED.education_detail,
  occupation = EXCLUDED.occupation,
  occupation_detail = EXCLUDED.occupation_detail,
  annual_income = EXCLUDED.annual_income,
  company_name = EXCLUDED.company_name,
  city = EXCLUDED.city,
  district = EXCLUDED.district,
  about_me = EXCLUDED.about_me,
  family_type = EXCLUDED.family_type,
  family_status = EXCLUDED.family_status,
  father_occupation = EXCLUDED.father_occupation,
  mother_occupation = EXCLUDED.mother_occupation,
  is_verified = EXCLUDED.is_verified,
  is_premium = EXCLUDED.is_premium,
  is_profile_complete = EXCLUDED.is_profile_complete,
  profile_completion_percent = EXCLUDED.profile_completion_percent,
  last_active_at = EXCLUDED.last_active_at;
INSERT INTO public.profiles (id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, father_occupation, mother_occupation, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at)
VALUES ('00000000-0000-4000-a000-0000000000be', 'TM000190', 'Pooja Moorthy', 'female', '1992-05-22', 172, 'divorced', 'Hindu', 'Vellalar', 'Vellalar subcaste', 'no', 'B.E. / B.Tech', 'B.E. / B.Tech Graduate', 'Architect', 'Architect Details', '₹10 Lakhs - ₹15 Lakhs', 'Accenture', 'Kanchipuram', 'Kanchipuram', 'Hi, I am Pooja. I have completed my B.E. / B.Tech and am currently working as a Architect at Accenture in Kanchipuram. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'joint', 'rich', 'Retired Employee', 'Homemaker', true, false, true, 100, NOW() - INTERVAL '9 days')
ON CONFLICT (id) DO UPDATE SET
  profile_id = EXCLUDED.profile_id,
  display_name = EXCLUDED.display_name,
  gender = EXCLUDED.gender,
  date_of_birth = EXCLUDED.date_of_birth,
  height_cm = EXCLUDED.height_cm,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  subcaste = EXCLUDED.subcaste,
  dosham = EXCLUDED.dosham,
  education = EXCLUDED.education,
  education_detail = EXCLUDED.education_detail,
  occupation = EXCLUDED.occupation,
  occupation_detail = EXCLUDED.occupation_detail,
  annual_income = EXCLUDED.annual_income,
  company_name = EXCLUDED.company_name,
  city = EXCLUDED.city,
  district = EXCLUDED.district,
  about_me = EXCLUDED.about_me,
  family_type = EXCLUDED.family_type,
  family_status = EXCLUDED.family_status,
  father_occupation = EXCLUDED.father_occupation,
  mother_occupation = EXCLUDED.mother_occupation,
  is_verified = EXCLUDED.is_verified,
  is_premium = EXCLUDED.is_premium,
  is_profile_complete = EXCLUDED.is_profile_complete,
  profile_completion_percent = EXCLUDED.profile_completion_percent,
  last_active_at = EXCLUDED.last_active_at;
INSERT INTO public.profiles (id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, father_occupation, mother_occupation, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at)
VALUES ('00000000-0000-4000-a000-0000000000bf', 'TM000191', 'Suresh Devan', 'male', '2001-01-19', 172, 'divorced', 'Muslim', 'Shia Muslim', 'Shia Muslim subcaste', 'no', 'M.B.A', 'M.B.A Graduate', 'Pharmacist', 'Pharmacist Details', '₹3 Lakhs - ₹5 Lakhs', 'Private Practice', 'Thoothukudi', 'Tuticorin', 'Hi, I am Suresh. I have completed my M.B.A and am currently working as a Pharmacist at Private Practice in Thoothukudi. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'joint', 'rich', 'Retired Employee', 'Homemaker', true, false, true, 100, NOW() - INTERVAL '8 days')
ON CONFLICT (id) DO UPDATE SET
  profile_id = EXCLUDED.profile_id,
  display_name = EXCLUDED.display_name,
  gender = EXCLUDED.gender,
  date_of_birth = EXCLUDED.date_of_birth,
  height_cm = EXCLUDED.height_cm,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  subcaste = EXCLUDED.subcaste,
  dosham = EXCLUDED.dosham,
  education = EXCLUDED.education,
  education_detail = EXCLUDED.education_detail,
  occupation = EXCLUDED.occupation,
  occupation_detail = EXCLUDED.occupation_detail,
  annual_income = EXCLUDED.annual_income,
  company_name = EXCLUDED.company_name,
  city = EXCLUDED.city,
  district = EXCLUDED.district,
  about_me = EXCLUDED.about_me,
  family_type = EXCLUDED.family_type,
  family_status = EXCLUDED.family_status,
  father_occupation = EXCLUDED.father_occupation,
  mother_occupation = EXCLUDED.mother_occupation,
  is_verified = EXCLUDED.is_verified,
  is_premium = EXCLUDED.is_premium,
  is_profile_complete = EXCLUDED.is_profile_complete,
  profile_completion_percent = EXCLUDED.profile_completion_percent,
  last_active_at = EXCLUDED.last_active_at;
INSERT INTO public.profiles (id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, father_occupation, mother_occupation, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at)
VALUES ('00000000-0000-4000-a000-0000000000c0', 'TM000192', 'Ramani Velan', 'female', '2004-02-03', 150, 'divorced', 'Hindu', 'Brahmin - Iyer', NULL, 'yes', 'Ph.D', 'Ph.D Graduate', 'Doctor', 'Doctor Details', '₹5 Lakhs - ₹7 Lakhs', 'HCL', 'Vellore', 'Vellore', 'Hi, I am Ramani. I have completed my Ph.D and am currently working as a Doctor at HCL in Vellore. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'upper_middle_class', 'Retired Employee', 'Homemaker', true, false, true, 100, NOW() - INTERVAL '8 days')
ON CONFLICT (id) DO UPDATE SET
  profile_id = EXCLUDED.profile_id,
  display_name = EXCLUDED.display_name,
  gender = EXCLUDED.gender,
  date_of_birth = EXCLUDED.date_of_birth,
  height_cm = EXCLUDED.height_cm,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  subcaste = EXCLUDED.subcaste,
  dosham = EXCLUDED.dosham,
  education = EXCLUDED.education,
  education_detail = EXCLUDED.education_detail,
  occupation = EXCLUDED.occupation,
  occupation_detail = EXCLUDED.occupation_detail,
  annual_income = EXCLUDED.annual_income,
  company_name = EXCLUDED.company_name,
  city = EXCLUDED.city,
  district = EXCLUDED.district,
  about_me = EXCLUDED.about_me,
  family_type = EXCLUDED.family_type,
  family_status = EXCLUDED.family_status,
  father_occupation = EXCLUDED.father_occupation,
  mother_occupation = EXCLUDED.mother_occupation,
  is_verified = EXCLUDED.is_verified,
  is_premium = EXCLUDED.is_premium,
  is_profile_complete = EXCLUDED.is_profile_complete,
  profile_completion_percent = EXCLUDED.profile_completion_percent,
  last_active_at = EXCLUDED.last_active_at;
INSERT INTO public.profiles (id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, father_occupation, mother_occupation, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at)
VALUES ('00000000-0000-4000-a000-0000000000c1', 'TM000193', 'Manikandan Gopal', 'male', '2000-04-22', 181, 'divorced', 'Muslim', 'Labbai', 'Labbai subcaste', 'no', 'M.Com', 'M.Com Graduate', 'Software Engineer', 'Software Engineer Details', '₹3 Lakhs - ₹5 Lakhs', 'Wipro', 'Tirunelveli', 'Tirunelveli', 'Hi, I am Manikandan. I have completed my M.Com and am currently working as a Software Engineer at Wipro in Tirunelveli. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'upper_middle_class', 'Retired Employee', 'Homemaker', false, false, true, 100, NOW() - INTERVAL '7 days')
ON CONFLICT (id) DO UPDATE SET
  profile_id = EXCLUDED.profile_id,
  display_name = EXCLUDED.display_name,
  gender = EXCLUDED.gender,
  date_of_birth = EXCLUDED.date_of_birth,
  height_cm = EXCLUDED.height_cm,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  subcaste = EXCLUDED.subcaste,
  dosham = EXCLUDED.dosham,
  education = EXCLUDED.education,
  education_detail = EXCLUDED.education_detail,
  occupation = EXCLUDED.occupation,
  occupation_detail = EXCLUDED.occupation_detail,
  annual_income = EXCLUDED.annual_income,
  company_name = EXCLUDED.company_name,
  city = EXCLUDED.city,
  district = EXCLUDED.district,
  about_me = EXCLUDED.about_me,
  family_type = EXCLUDED.family_type,
  family_status = EXCLUDED.family_status,
  father_occupation = EXCLUDED.father_occupation,
  mother_occupation = EXCLUDED.mother_occupation,
  is_verified = EXCLUDED.is_verified,
  is_premium = EXCLUDED.is_premium,
  is_profile_complete = EXCLUDED.is_profile_complete,
  profile_completion_percent = EXCLUDED.profile_completion_percent,
  last_active_at = EXCLUDED.last_active_at;
INSERT INTO public.profiles (id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, father_occupation, mother_occupation, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at)
VALUES ('00000000-0000-4000-a000-0000000000c2', 'TM000194', 'Shanthi Shankar', 'female', '1999-09-19', 175, 'never_married', 'Hindu', 'Chettiar', NULL, 'no', 'M.C.A', 'M.C.A Graduate', 'Police Officer', 'Police Officer Details', '₹7 Lakhs - ₹10 Lakhs', 'TCS', 'Tirunelveli', 'Tirunelveli', 'Hi, I am Shanthi. I have completed my M.C.A and am currently working as a Police Officer at TCS in Tirunelveli. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'rich', 'Retired Employee', 'Homemaker', true, true, true, 100, NOW() - INTERVAL '9 days')
ON CONFLICT (id) DO UPDATE SET
  profile_id = EXCLUDED.profile_id,
  display_name = EXCLUDED.display_name,
  gender = EXCLUDED.gender,
  date_of_birth = EXCLUDED.date_of_birth,
  height_cm = EXCLUDED.height_cm,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  subcaste = EXCLUDED.subcaste,
  dosham = EXCLUDED.dosham,
  education = EXCLUDED.education,
  education_detail = EXCLUDED.education_detail,
  occupation = EXCLUDED.occupation,
  occupation_detail = EXCLUDED.occupation_detail,
  annual_income = EXCLUDED.annual_income,
  company_name = EXCLUDED.company_name,
  city = EXCLUDED.city,
  district = EXCLUDED.district,
  about_me = EXCLUDED.about_me,
  family_type = EXCLUDED.family_type,
  family_status = EXCLUDED.family_status,
  father_occupation = EXCLUDED.father_occupation,
  mother_occupation = EXCLUDED.mother_occupation,
  is_verified = EXCLUDED.is_verified,
  is_premium = EXCLUDED.is_premium,
  is_profile_complete = EXCLUDED.is_profile_complete,
  profile_completion_percent = EXCLUDED.profile_completion_percent,
  last_active_at = EXCLUDED.last_active_at;
INSERT INTO public.profiles (id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, father_occupation, mother_occupation, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at)
VALUES ('00000000-0000-4000-a000-0000000000c3', 'TM000195', 'Anand Moorthy', 'male', '1991-04-08', 182, 'never_married', 'Hindu', 'Brahmin - Iyer', NULL, 'yes', 'B.Sc', 'B.Sc Graduate', 'Business Owner', 'Business Owner Details', '₹5 Lakhs - ₹7 Lakhs', 'Zoho', 'Thoothukudi', 'Tuticorin', 'Hi, I am Anand. I have completed my B.Sc and am currently working as a Business Owner at Zoho in Thoothukudi. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'joint', 'upper_middle_class', 'Retired Employee', 'Homemaker', true, true, true, 100, NOW() - INTERVAL '9 days')
ON CONFLICT (id) DO UPDATE SET
  profile_id = EXCLUDED.profile_id,
  display_name = EXCLUDED.display_name,
  gender = EXCLUDED.gender,
  date_of_birth = EXCLUDED.date_of_birth,
  height_cm = EXCLUDED.height_cm,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  subcaste = EXCLUDED.subcaste,
  dosham = EXCLUDED.dosham,
  education = EXCLUDED.education,
  education_detail = EXCLUDED.education_detail,
  occupation = EXCLUDED.occupation,
  occupation_detail = EXCLUDED.occupation_detail,
  annual_income = EXCLUDED.annual_income,
  company_name = EXCLUDED.company_name,
  city = EXCLUDED.city,
  district = EXCLUDED.district,
  about_me = EXCLUDED.about_me,
  family_type = EXCLUDED.family_type,
  family_status = EXCLUDED.family_status,
  father_occupation = EXCLUDED.father_occupation,
  mother_occupation = EXCLUDED.mother_occupation,
  is_verified = EXCLUDED.is_verified,
  is_premium = EXCLUDED.is_premium,
  is_profile_complete = EXCLUDED.is_profile_complete,
  profile_completion_percent = EXCLUDED.profile_completion_percent,
  last_active_at = EXCLUDED.last_active_at;
INSERT INTO public.profiles (id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, father_occupation, mother_occupation, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at)
VALUES ('00000000-0000-4000-a000-0000000000c4', 'TM000196', 'Uma Balan', 'female', '1990-04-10', 162, 'never_married', 'Hindu', 'Chettiar', 'Chettiar subcaste', 'no', 'M.Com', 'M.Com Graduate', 'Bank Manager', 'Bank Manager Details', '₹3 Lakhs - ₹5 Lakhs', 'Self Employed', 'Thoothukudi', 'Tuticorin', 'Hi, I am Uma. I have completed my M.Com and am currently working as a Bank Manager at Self Employed in Thoothukudi. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'middle_class', 'Retired Employee', 'Homemaker', false, false, true, 100, NOW() - INTERVAL '6 days')
ON CONFLICT (id) DO UPDATE SET
  profile_id = EXCLUDED.profile_id,
  display_name = EXCLUDED.display_name,
  gender = EXCLUDED.gender,
  date_of_birth = EXCLUDED.date_of_birth,
  height_cm = EXCLUDED.height_cm,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  subcaste = EXCLUDED.subcaste,
  dosham = EXCLUDED.dosham,
  education = EXCLUDED.education,
  education_detail = EXCLUDED.education_detail,
  occupation = EXCLUDED.occupation,
  occupation_detail = EXCLUDED.occupation_detail,
  annual_income = EXCLUDED.annual_income,
  company_name = EXCLUDED.company_name,
  city = EXCLUDED.city,
  district = EXCLUDED.district,
  about_me = EXCLUDED.about_me,
  family_type = EXCLUDED.family_type,
  family_status = EXCLUDED.family_status,
  father_occupation = EXCLUDED.father_occupation,
  mother_occupation = EXCLUDED.mother_occupation,
  is_verified = EXCLUDED.is_verified,
  is_premium = EXCLUDED.is_premium,
  is_profile_complete = EXCLUDED.is_profile_complete,
  profile_completion_percent = EXCLUDED.profile_completion_percent,
  last_active_at = EXCLUDED.last_active_at;
INSERT INTO public.profiles (id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, father_occupation, mother_occupation, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at)
VALUES ('00000000-0000-4000-a000-0000000000c5', 'TM000197', 'Vetrivel Gopal', 'male', '2004-07-24', 165, 'never_married', 'Christian', 'Vellalar Christian', 'Vellalar Christian subcaste', 'yes', 'M.C.A', 'M.C.A Graduate', 'Dentist', 'Dentist Details', '₹7 Lakhs - ₹10 Lakhs', 'Cognizant', 'Thoothukudi', 'Tuticorin', 'Hi, I am Vetrivel. I have completed my M.C.A and am currently working as a Dentist at Cognizant in Thoothukudi. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'rich', 'Retired Employee', 'Homemaker', true, true, true, 100, NOW() - INTERVAL '4 days')
ON CONFLICT (id) DO UPDATE SET
  profile_id = EXCLUDED.profile_id,
  display_name = EXCLUDED.display_name,
  gender = EXCLUDED.gender,
  date_of_birth = EXCLUDED.date_of_birth,
  height_cm = EXCLUDED.height_cm,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  subcaste = EXCLUDED.subcaste,
  dosham = EXCLUDED.dosham,
  education = EXCLUDED.education,
  education_detail = EXCLUDED.education_detail,
  occupation = EXCLUDED.occupation,
  occupation_detail = EXCLUDED.occupation_detail,
  annual_income = EXCLUDED.annual_income,
  company_name = EXCLUDED.company_name,
  city = EXCLUDED.city,
  district = EXCLUDED.district,
  about_me = EXCLUDED.about_me,
  family_type = EXCLUDED.family_type,
  family_status = EXCLUDED.family_status,
  father_occupation = EXCLUDED.father_occupation,
  mother_occupation = EXCLUDED.mother_occupation,
  is_verified = EXCLUDED.is_verified,
  is_premium = EXCLUDED.is_premium,
  is_profile_complete = EXCLUDED.is_profile_complete,
  profile_completion_percent = EXCLUDED.profile_completion_percent,
  last_active_at = EXCLUDED.last_active_at;
INSERT INTO public.profiles (id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, father_occupation, mother_occupation, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at)
VALUES ('00000000-0000-4000-a000-0000000000c6', 'TM000198', 'Chitra Samy', 'female', '2004-07-03', 156, 'never_married', 'Muslim', 'Rawther', 'Rawther subcaste', 'no', 'B.Sc', 'B.Sc Graduate', 'Advocate', 'Advocate Details', '₹7 Lakhs - ₹10 Lakhs', 'Wipro', 'Madurai', 'Madurai', 'Hi, I am Chitra. I have completed my B.Sc and am currently working as a Advocate at Wipro in Madurai. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'upper_middle_class', 'Retired Employee', 'Homemaker', true, false, true, 100, NOW() - INTERVAL '7 days')
ON CONFLICT (id) DO UPDATE SET
  profile_id = EXCLUDED.profile_id,
  display_name = EXCLUDED.display_name,
  gender = EXCLUDED.gender,
  date_of_birth = EXCLUDED.date_of_birth,
  height_cm = EXCLUDED.height_cm,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  subcaste = EXCLUDED.subcaste,
  dosham = EXCLUDED.dosham,
  education = EXCLUDED.education,
  education_detail = EXCLUDED.education_detail,
  occupation = EXCLUDED.occupation,
  occupation_detail = EXCLUDED.occupation_detail,
  annual_income = EXCLUDED.annual_income,
  company_name = EXCLUDED.company_name,
  city = EXCLUDED.city,
  district = EXCLUDED.district,
  about_me = EXCLUDED.about_me,
  family_type = EXCLUDED.family_type,
  family_status = EXCLUDED.family_status,
  father_occupation = EXCLUDED.father_occupation,
  mother_occupation = EXCLUDED.mother_occupation,
  is_verified = EXCLUDED.is_verified,
  is_premium = EXCLUDED.is_premium,
  is_profile_complete = EXCLUDED.is_profile_complete,
  profile_completion_percent = EXCLUDED.profile_completion_percent,
  last_active_at = EXCLUDED.last_active_at;
INSERT INTO public.profiles (id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, father_occupation, mother_occupation, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at)
VALUES ('00000000-0000-4000-a000-0000000000c7', 'TM000199', 'Viswanathan Velan', 'male', '2001-08-07', 184, 'never_married', 'Hindu', 'Arunthathiyar', NULL, 'no', 'Ph.D', 'Ph.D Graduate', 'Software Engineer', 'Software Engineer Details', '₹20 Lakhs+', 'Government Service', 'Tirunelveli', 'Tirunelveli', 'Hi, I am Viswanathan. I have completed my Ph.D and am currently working as a Software Engineer at Government Service in Tirunelveli. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'joint', 'middle_class', 'Retired Employee', 'Homemaker', false, true, true, 100, NOW() - INTERVAL '2 days')
ON CONFLICT (id) DO UPDATE SET
  profile_id = EXCLUDED.profile_id,
  display_name = EXCLUDED.display_name,
  gender = EXCLUDED.gender,
  date_of_birth = EXCLUDED.date_of_birth,
  height_cm = EXCLUDED.height_cm,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  subcaste = EXCLUDED.subcaste,
  dosham = EXCLUDED.dosham,
  education = EXCLUDED.education,
  education_detail = EXCLUDED.education_detail,
  occupation = EXCLUDED.occupation,
  occupation_detail = EXCLUDED.occupation_detail,
  annual_income = EXCLUDED.annual_income,
  company_name = EXCLUDED.company_name,
  city = EXCLUDED.city,
  district = EXCLUDED.district,
  about_me = EXCLUDED.about_me,
  family_type = EXCLUDED.family_type,
  family_status = EXCLUDED.family_status,
  father_occupation = EXCLUDED.father_occupation,
  mother_occupation = EXCLUDED.mother_occupation,
  is_verified = EXCLUDED.is_verified,
  is_premium = EXCLUDED.is_premium,
  is_profile_complete = EXCLUDED.is_profile_complete,
  profile_completion_percent = EXCLUDED.profile_completion_percent,
  last_active_at = EXCLUDED.last_active_at;
INSERT INTO public.profiles (id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, father_occupation, mother_occupation, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at)
VALUES ('00000000-0000-4000-a000-0000000000c8', 'TM000200', 'Kokila Lingam', 'female', '1996-08-23', 173, 'never_married', 'Hindu', 'Sengunthar', 'Sengunthar subcaste', 'no', 'M.B.B.S', 'M.B.B.S Graduate', 'Architect', 'Architect Details', '₹15 Lakhs - ₹20 Lakhs', 'TCS', 'Kanchipuram', 'Kanchipuram', 'Hi, I am Kokila. I have completed my M.B.B.S and am currently working as a Architect at TCS in Kanchipuram. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'rich', 'Retired Employee', 'Homemaker', true, false, true, 100, NOW() - INTERVAL '3 days')
ON CONFLICT (id) DO UPDATE SET
  profile_id = EXCLUDED.profile_id,
  display_name = EXCLUDED.display_name,
  gender = EXCLUDED.gender,
  date_of_birth = EXCLUDED.date_of_birth,
  height_cm = EXCLUDED.height_cm,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  subcaste = EXCLUDED.subcaste,
  dosham = EXCLUDED.dosham,
  education = EXCLUDED.education,
  education_detail = EXCLUDED.education_detail,
  occupation = EXCLUDED.occupation,
  occupation_detail = EXCLUDED.occupation_detail,
  annual_income = EXCLUDED.annual_income,
  company_name = EXCLUDED.company_name,
  city = EXCLUDED.city,
  district = EXCLUDED.district,
  about_me = EXCLUDED.about_me,
  family_type = EXCLUDED.family_type,
  family_status = EXCLUDED.family_status,
  father_occupation = EXCLUDED.father_occupation,
  mother_occupation = EXCLUDED.mother_occupation,
  is_verified = EXCLUDED.is_verified,
  is_premium = EXCLUDED.is_premium,
  is_profile_complete = EXCLUDED.is_profile_complete,
  profile_completion_percent = EXCLUDED.profile_completion_percent,
  last_active_at = EXCLUDED.last_active_at;
INSERT INTO public.profiles (id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, father_occupation, mother_occupation, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at)
VALUES ('00000000-0000-4000-a000-0000000000c9', 'TM000201', 'Mohan Raman', 'male', '1991-04-11', 186, 'never_married', 'Hindu', 'Devendra Kula Vellalar', NULL, 'yes', 'M.Sc', 'M.Sc Graduate', 'Advocate', 'Advocate Details', '₹5 Lakhs - ₹7 Lakhs', 'Zoho', 'Madurai', 'Madurai', 'Hi, I am Mohan. I have completed my M.Sc and am currently working as a Advocate at Zoho in Madurai. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'joint', 'rich', 'Retired Employee', 'Homemaker', true, false, true, 100, NOW() - INTERVAL '6 days')
ON CONFLICT (id) DO UPDATE SET
  profile_id = EXCLUDED.profile_id,
  display_name = EXCLUDED.display_name,
  gender = EXCLUDED.gender,
  date_of_birth = EXCLUDED.date_of_birth,
  height_cm = EXCLUDED.height_cm,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  subcaste = EXCLUDED.subcaste,
  dosham = EXCLUDED.dosham,
  education = EXCLUDED.education,
  education_detail = EXCLUDED.education_detail,
  occupation = EXCLUDED.occupation,
  occupation_detail = EXCLUDED.occupation_detail,
  annual_income = EXCLUDED.annual_income,
  company_name = EXCLUDED.company_name,
  city = EXCLUDED.city,
  district = EXCLUDED.district,
  about_me = EXCLUDED.about_me,
  family_type = EXCLUDED.family_type,
  family_status = EXCLUDED.family_status,
  father_occupation = EXCLUDED.father_occupation,
  mother_occupation = EXCLUDED.mother_occupation,
  is_verified = EXCLUDED.is_verified,
  is_premium = EXCLUDED.is_premium,
  is_profile_complete = EXCLUDED.is_profile_complete,
  profile_completion_percent = EXCLUDED.profile_completion_percent,
  last_active_at = EXCLUDED.last_active_at;
INSERT INTO public.profiles (id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, father_occupation, mother_occupation, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at)
VALUES ('00000000-0000-4000-a000-0000000000ca', 'TM000202', 'Gowri Samy', 'female', '1993-07-06', 172, 'never_married', 'Hindu', 'Gounder', 'Gounder subcaste', 'no', 'B.Ed', 'B.Ed Graduate', 'Software Engineer', 'Software Engineer Details', '₹10 Lakhs - ₹15 Lakhs', 'Accenture', 'Kanchipuram', 'Kanchipuram', 'Hi, I am Gowri. I have completed my B.Ed and am currently working as a Software Engineer at Accenture in Kanchipuram. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'joint', 'rich', 'Retired Employee', 'Homemaker', true, false, true, 100, NOW() - INTERVAL '7 days')
ON CONFLICT (id) DO UPDATE SET
  profile_id = EXCLUDED.profile_id,
  display_name = EXCLUDED.display_name,
  gender = EXCLUDED.gender,
  date_of_birth = EXCLUDED.date_of_birth,
  height_cm = EXCLUDED.height_cm,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  subcaste = EXCLUDED.subcaste,
  dosham = EXCLUDED.dosham,
  education = EXCLUDED.education,
  education_detail = EXCLUDED.education_detail,
  occupation = EXCLUDED.occupation,
  occupation_detail = EXCLUDED.occupation_detail,
  annual_income = EXCLUDED.annual_income,
  company_name = EXCLUDED.company_name,
  city = EXCLUDED.city,
  district = EXCLUDED.district,
  about_me = EXCLUDED.about_me,
  family_type = EXCLUDED.family_type,
  family_status = EXCLUDED.family_status,
  father_occupation = EXCLUDED.father_occupation,
  mother_occupation = EXCLUDED.mother_occupation,
  is_verified = EXCLUDED.is_verified,
  is_premium = EXCLUDED.is_premium,
  is_profile_complete = EXCLUDED.is_profile_complete,
  profile_completion_percent = EXCLUDED.profile_completion_percent,
  last_active_at = EXCLUDED.last_active_at;
INSERT INTO public.profiles (id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, father_occupation, mother_occupation, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at)
VALUES ('00000000-0000-4000-a000-0000000000cb', 'TM000203', 'Ajith Raj', 'male', '2005-09-06', 165, 'never_married', 'Christian', 'Vellalar Christian', 'Vellalar Christian subcaste', 'yes', 'Ph.D', 'Ph.D Graduate', 'Business Owner', 'Business Owner Details', '₹15 Lakhs - ₹20 Lakhs', 'Self Employed', 'Erode', 'Erode', 'Hi, I am Ajith. I have completed my Ph.D and am currently working as a Business Owner at Self Employed in Erode. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'upper_middle_class', 'Retired Employee', 'Homemaker', true, false, true, 100, NOW() - INTERVAL '4 days')
ON CONFLICT (id) DO UPDATE SET
  profile_id = EXCLUDED.profile_id,
  display_name = EXCLUDED.display_name,
  gender = EXCLUDED.gender,
  date_of_birth = EXCLUDED.date_of_birth,
  height_cm = EXCLUDED.height_cm,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  subcaste = EXCLUDED.subcaste,
  dosham = EXCLUDED.dosham,
  education = EXCLUDED.education,
  education_detail = EXCLUDED.education_detail,
  occupation = EXCLUDED.occupation,
  occupation_detail = EXCLUDED.occupation_detail,
  annual_income = EXCLUDED.annual_income,
  company_name = EXCLUDED.company_name,
  city = EXCLUDED.city,
  district = EXCLUDED.district,
  about_me = EXCLUDED.about_me,
  family_type = EXCLUDED.family_type,
  family_status = EXCLUDED.family_status,
  father_occupation = EXCLUDED.father_occupation,
  mother_occupation = EXCLUDED.mother_occupation,
  is_verified = EXCLUDED.is_verified,
  is_premium = EXCLUDED.is_premium,
  is_profile_complete = EXCLUDED.is_profile_complete,
  profile_completion_percent = EXCLUDED.profile_completion_percent,
  last_active_at = EXCLUDED.last_active_at;
INSERT INTO public.profiles (id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, father_occupation, mother_occupation, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at)
VALUES ('00000000-0000-4000-a000-0000000000cc', 'TM000204', 'Kayalvizhi Gopal', 'female', '2005-01-02', 152, 'never_married', 'Hindu', 'Vellalar', 'Vellalar subcaste', 'no', 'M.C.A', 'M.C.A Graduate', 'Software Engineer', 'Software Engineer Details', '₹15 Lakhs - ₹20 Lakhs', 'Self Employed', 'Vellore', 'Vellore', 'Hi, I am Kayalvizhi. I have completed my M.C.A and am currently working as a Software Engineer at Self Employed in Vellore. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'upper_middle_class', 'Retired Employee', 'Homemaker', true, true, true, 100, NOW() - INTERVAL '9 days')
ON CONFLICT (id) DO UPDATE SET
  profile_id = EXCLUDED.profile_id,
  display_name = EXCLUDED.display_name,
  gender = EXCLUDED.gender,
  date_of_birth = EXCLUDED.date_of_birth,
  height_cm = EXCLUDED.height_cm,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  subcaste = EXCLUDED.subcaste,
  dosham = EXCLUDED.dosham,
  education = EXCLUDED.education,
  education_detail = EXCLUDED.education_detail,
  occupation = EXCLUDED.occupation,
  occupation_detail = EXCLUDED.occupation_detail,
  annual_income = EXCLUDED.annual_income,
  company_name = EXCLUDED.company_name,
  city = EXCLUDED.city,
  district = EXCLUDED.district,
  about_me = EXCLUDED.about_me,
  family_type = EXCLUDED.family_type,
  family_status = EXCLUDED.family_status,
  father_occupation = EXCLUDED.father_occupation,
  mother_occupation = EXCLUDED.mother_occupation,
  is_verified = EXCLUDED.is_verified,
  is_premium = EXCLUDED.is_premium,
  is_profile_complete = EXCLUDED.is_profile_complete,
  profile_completion_percent = EXCLUDED.profile_completion_percent,
  last_active_at = EXCLUDED.last_active_at;
INSERT INTO public.profiles (id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, father_occupation, mother_occupation, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at)
VALUES ('00000000-0000-4000-a000-0000000000cd', 'TM000205', 'Vignesh Krishnan', 'male', '1992-12-28', 171, 'never_married', 'Hindu', 'Brahmin - Iyer', 'Brahmin - Iyer subcaste', 'no', 'M.Com', 'M.Com Graduate', 'Police Officer', 'Police Officer Details', '₹15 Lakhs - ₹20 Lakhs', 'Zoho', 'Coimbatore', 'Coimbatore', 'Hi, I am Vignesh. I have completed my M.Com and am currently working as a Police Officer at Zoho in Coimbatore. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'rich', 'Retired Employee', 'Homemaker', true, true, true, 100, NOW() - INTERVAL '6 days')
ON CONFLICT (id) DO UPDATE SET
  profile_id = EXCLUDED.profile_id,
  display_name = EXCLUDED.display_name,
  gender = EXCLUDED.gender,
  date_of_birth = EXCLUDED.date_of_birth,
  height_cm = EXCLUDED.height_cm,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  subcaste = EXCLUDED.subcaste,
  dosham = EXCLUDED.dosham,
  education = EXCLUDED.education,
  education_detail = EXCLUDED.education_detail,
  occupation = EXCLUDED.occupation,
  occupation_detail = EXCLUDED.occupation_detail,
  annual_income = EXCLUDED.annual_income,
  company_name = EXCLUDED.company_name,
  city = EXCLUDED.city,
  district = EXCLUDED.district,
  about_me = EXCLUDED.about_me,
  family_type = EXCLUDED.family_type,
  family_status = EXCLUDED.family_status,
  father_occupation = EXCLUDED.father_occupation,
  mother_occupation = EXCLUDED.mother_occupation,
  is_verified = EXCLUDED.is_verified,
  is_premium = EXCLUDED.is_premium,
  is_profile_complete = EXCLUDED.is_profile_complete,
  profile_completion_percent = EXCLUDED.profile_completion_percent,
  last_active_at = EXCLUDED.last_active_at;
INSERT INTO public.profiles (id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, father_occupation, mother_occupation, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at)
VALUES ('00000000-0000-4000-a000-0000000000ce', 'TM000206', 'Lakshmi Devan', 'female', '1991-08-17', 166, 'never_married', 'Hindu', 'Brahmin - Iyengar', NULL, 'no', 'B.Ed', 'B.Ed Graduate', 'Government Officer', 'Government Officer Details', '₹3 Lakhs - ₹5 Lakhs', 'TCS', 'Erode', 'Erode', 'Hi, I am Lakshmi. I have completed my B.Ed and am currently working as a Government Officer at TCS in Erode. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'middle_class', 'Retired Employee', 'Homemaker', true, false, true, 100, NOW() - INTERVAL '0 days')
ON CONFLICT (id) DO UPDATE SET
  profile_id = EXCLUDED.profile_id,
  display_name = EXCLUDED.display_name,
  gender = EXCLUDED.gender,
  date_of_birth = EXCLUDED.date_of_birth,
  height_cm = EXCLUDED.height_cm,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  subcaste = EXCLUDED.subcaste,
  dosham = EXCLUDED.dosham,
  education = EXCLUDED.education,
  education_detail = EXCLUDED.education_detail,
  occupation = EXCLUDED.occupation,
  occupation_detail = EXCLUDED.occupation_detail,
  annual_income = EXCLUDED.annual_income,
  company_name = EXCLUDED.company_name,
  city = EXCLUDED.city,
  district = EXCLUDED.district,
  about_me = EXCLUDED.about_me,
  family_type = EXCLUDED.family_type,
  family_status = EXCLUDED.family_status,
  father_occupation = EXCLUDED.father_occupation,
  mother_occupation = EXCLUDED.mother_occupation,
  is_verified = EXCLUDED.is_verified,
  is_premium = EXCLUDED.is_premium,
  is_profile_complete = EXCLUDED.is_profile_complete,
  profile_completion_percent = EXCLUDED.profile_completion_percent,
  last_active_at = EXCLUDED.last_active_at;
INSERT INTO public.profiles (id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, father_occupation, mother_occupation, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at)
VALUES ('00000000-0000-4000-a000-0000000000cf', 'TM000207', 'Prakash Devan', 'male', '1993-10-14', 178, 'never_married', 'Hindu', 'Chettiar', NULL, 'no', 'M.B.A', 'M.B.A Graduate', 'Government Officer', 'Government Officer Details', '₹3 Lakhs - ₹5 Lakhs', 'Zoho', 'Thoothukudi', 'Tuticorin', 'Hi, I am Prakash. I have completed my M.B.A and am currently working as a Government Officer at Zoho in Thoothukudi. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'upper_middle_class', 'Retired Employee', 'Homemaker', false, true, true, 100, NOW() - INTERVAL '2 days')
ON CONFLICT (id) DO UPDATE SET
  profile_id = EXCLUDED.profile_id,
  display_name = EXCLUDED.display_name,
  gender = EXCLUDED.gender,
  date_of_birth = EXCLUDED.date_of_birth,
  height_cm = EXCLUDED.height_cm,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  subcaste = EXCLUDED.subcaste,
  dosham = EXCLUDED.dosham,
  education = EXCLUDED.education,
  education_detail = EXCLUDED.education_detail,
  occupation = EXCLUDED.occupation,
  occupation_detail = EXCLUDED.occupation_detail,
  annual_income = EXCLUDED.annual_income,
  company_name = EXCLUDED.company_name,
  city = EXCLUDED.city,
  district = EXCLUDED.district,
  about_me = EXCLUDED.about_me,
  family_type = EXCLUDED.family_type,
  family_status = EXCLUDED.family_status,
  father_occupation = EXCLUDED.father_occupation,
  mother_occupation = EXCLUDED.mother_occupation,
  is_verified = EXCLUDED.is_verified,
  is_premium = EXCLUDED.is_premium,
  is_profile_complete = EXCLUDED.is_profile_complete,
  profile_completion_percent = EXCLUDED.profile_completion_percent,
  last_active_at = EXCLUDED.last_active_at;
INSERT INTO public.profiles (id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, father_occupation, mother_occupation, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at)
VALUES ('00000000-0000-4000-a000-0000000000d0', 'TM000208', 'Abirami Naicker', 'female', '1992-07-26', 172, 'never_married', 'Hindu', 'Adi Dravida', 'Adi Dravida subcaste', 'no', 'B.Ed', 'B.Ed Graduate', 'Civil Engineer', 'Civil Engineer Details', '₹10 Lakhs - ₹15 Lakhs', 'Zoho', 'Kanchipuram', 'Kanchipuram', 'Hi, I am Abirami. I have completed my B.Ed and am currently working as a Civil Engineer at Zoho in Kanchipuram. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'middle_class', 'Retired Employee', 'Homemaker', true, false, true, 100, NOW() - INTERVAL '6 days')
ON CONFLICT (id) DO UPDATE SET
  profile_id = EXCLUDED.profile_id,
  display_name = EXCLUDED.display_name,
  gender = EXCLUDED.gender,
  date_of_birth = EXCLUDED.date_of_birth,
  height_cm = EXCLUDED.height_cm,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  subcaste = EXCLUDED.subcaste,
  dosham = EXCLUDED.dosham,
  education = EXCLUDED.education,
  education_detail = EXCLUDED.education_detail,
  occupation = EXCLUDED.occupation,
  occupation_detail = EXCLUDED.occupation_detail,
  annual_income = EXCLUDED.annual_income,
  company_name = EXCLUDED.company_name,
  city = EXCLUDED.city,
  district = EXCLUDED.district,
  about_me = EXCLUDED.about_me,
  family_type = EXCLUDED.family_type,
  family_status = EXCLUDED.family_status,
  father_occupation = EXCLUDED.father_occupation,
  mother_occupation = EXCLUDED.mother_occupation,
  is_verified = EXCLUDED.is_verified,
  is_premium = EXCLUDED.is_premium,
  is_profile_complete = EXCLUDED.is_profile_complete,
  profile_completion_percent = EXCLUDED.profile_completion_percent,
  last_active_at = EXCLUDED.last_active_at;
INSERT INTO public.profiles (id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, father_occupation, mother_occupation, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at)
VALUES ('00000000-0000-4000-a000-0000000000d1', 'TM000209', 'Vijay Nathan', 'male', '2001-05-02', 188, 'never_married', 'Hindu', 'Brahmin - Iyer', 'Brahmin - Iyer subcaste', 'no', 'M.C.A', 'M.C.A Graduate', 'Pharmacist', 'Pharmacist Details', '₹3 Lakhs - ₹5 Lakhs', 'Infosys', 'Thanjavur', 'Thanjavur', 'Hi, I am Vijay. I have completed my M.C.A and am currently working as a Pharmacist at Infosys in Thanjavur. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'rich', 'Retired Employee', 'Homemaker', false, false, true, 100, NOW() - INTERVAL '2 days')
ON CONFLICT (id) DO UPDATE SET
  profile_id = EXCLUDED.profile_id,
  display_name = EXCLUDED.display_name,
  gender = EXCLUDED.gender,
  date_of_birth = EXCLUDED.date_of_birth,
  height_cm = EXCLUDED.height_cm,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  subcaste = EXCLUDED.subcaste,
  dosham = EXCLUDED.dosham,
  education = EXCLUDED.education,
  education_detail = EXCLUDED.education_detail,
  occupation = EXCLUDED.occupation,
  occupation_detail = EXCLUDED.occupation_detail,
  annual_income = EXCLUDED.annual_income,
  company_name = EXCLUDED.company_name,
  city = EXCLUDED.city,
  district = EXCLUDED.district,
  about_me = EXCLUDED.about_me,
  family_type = EXCLUDED.family_type,
  family_status = EXCLUDED.family_status,
  father_occupation = EXCLUDED.father_occupation,
  mother_occupation = EXCLUDED.mother_occupation,
  is_verified = EXCLUDED.is_verified,
  is_premium = EXCLUDED.is_premium,
  is_profile_complete = EXCLUDED.is_profile_complete,
  profile_completion_percent = EXCLUDED.profile_completion_percent,
  last_active_at = EXCLUDED.last_active_at;
INSERT INTO public.profiles (id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, father_occupation, mother_occupation, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at)
VALUES ('00000000-0000-4000-a000-0000000000d2', 'TM000210', 'Kayalvizhi Swamy', 'female', '2003-02-10', 163, 'never_married', 'Hindu', 'Gounder', 'Gounder subcaste', 'no', 'B.Ed', 'B.Ed Graduate', 'School Teacher', 'School Teacher Details', '₹7 Lakhs - ₹10 Lakhs', 'Private Practice', 'Salem', 'Salem', 'Hi, I am Kayalvizhi. I have completed my B.Ed and am currently working as a School Teacher at Private Practice in Salem. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'middle_class', 'Retired Employee', 'Homemaker', true, false, true, 100, NOW() - INTERVAL '6 days')
ON CONFLICT (id) DO UPDATE SET
  profile_id = EXCLUDED.profile_id,
  display_name = EXCLUDED.display_name,
  gender = EXCLUDED.gender,
  date_of_birth = EXCLUDED.date_of_birth,
  height_cm = EXCLUDED.height_cm,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  subcaste = EXCLUDED.subcaste,
  dosham = EXCLUDED.dosham,
  education = EXCLUDED.education,
  education_detail = EXCLUDED.education_detail,
  occupation = EXCLUDED.occupation,
  occupation_detail = EXCLUDED.occupation_detail,
  annual_income = EXCLUDED.annual_income,
  company_name = EXCLUDED.company_name,
  city = EXCLUDED.city,
  district = EXCLUDED.district,
  about_me = EXCLUDED.about_me,
  family_type = EXCLUDED.family_type,
  family_status = EXCLUDED.family_status,
  father_occupation = EXCLUDED.father_occupation,
  mother_occupation = EXCLUDED.mother_occupation,
  is_verified = EXCLUDED.is_verified,
  is_premium = EXCLUDED.is_premium,
  is_profile_complete = EXCLUDED.is_profile_complete,
  profile_completion_percent = EXCLUDED.profile_completion_percent,
  last_active_at = EXCLUDED.last_active_at;
INSERT INTO public.profiles (id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, father_occupation, mother_occupation, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at)
VALUES ('00000000-0000-4000-a000-0000000000d3', 'TM000211', 'Rajesh Krishnan', 'male', '1989-04-04', 162, 'never_married', 'Hindu', 'Adi Dravida', 'Adi Dravida subcaste', 'yes', 'M.Sc', 'M.Sc Graduate', 'Government Officer', 'Government Officer Details', '₹3 Lakhs - ₹5 Lakhs', 'Self Employed', 'Tirunelveli', 'Tirunelveli', 'Hi, I am Rajesh. I have completed my M.Sc and am currently working as a Government Officer at Self Employed in Tirunelveli. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'middle_class', 'Retired Employee', 'Homemaker', false, false, true, 100, NOW() - INTERVAL '8 days')
ON CONFLICT (id) DO UPDATE SET
  profile_id = EXCLUDED.profile_id,
  display_name = EXCLUDED.display_name,
  gender = EXCLUDED.gender,
  date_of_birth = EXCLUDED.date_of_birth,
  height_cm = EXCLUDED.height_cm,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  subcaste = EXCLUDED.subcaste,
  dosham = EXCLUDED.dosham,
  education = EXCLUDED.education,
  education_detail = EXCLUDED.education_detail,
  occupation = EXCLUDED.occupation,
  occupation_detail = EXCLUDED.occupation_detail,
  annual_income = EXCLUDED.annual_income,
  company_name = EXCLUDED.company_name,
  city = EXCLUDED.city,
  district = EXCLUDED.district,
  about_me = EXCLUDED.about_me,
  family_type = EXCLUDED.family_type,
  family_status = EXCLUDED.family_status,
  father_occupation = EXCLUDED.father_occupation,
  mother_occupation = EXCLUDED.mother_occupation,
  is_verified = EXCLUDED.is_verified,
  is_premium = EXCLUDED.is_premium,
  is_profile_complete = EXCLUDED.is_profile_complete,
  profile_completion_percent = EXCLUDED.profile_completion_percent,
  last_active_at = EXCLUDED.last_active_at;
INSERT INTO public.profiles (id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, father_occupation, mother_occupation, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at)
VALUES ('00000000-0000-4000-a000-0000000000d4', 'TM000212', 'Gayathri Krishnan', 'female', '1994-04-20', 159, 'divorced', 'Hindu', 'Nadar', 'Nadar subcaste', 'yes', 'Ph.D', 'Ph.D Graduate', 'Government Officer', 'Government Officer Details', '₹15 Lakhs - ₹20 Lakhs', 'Self Employed', 'Erode', 'Erode', 'Hi, I am Gayathri. I have completed my Ph.D and am currently working as a Government Officer at Self Employed in Erode. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'upper_middle_class', 'Retired Employee', 'Homemaker', false, false, true, 100, NOW() - INTERVAL '9 days')
ON CONFLICT (id) DO UPDATE SET
  profile_id = EXCLUDED.profile_id,
  display_name = EXCLUDED.display_name,
  gender = EXCLUDED.gender,
  date_of_birth = EXCLUDED.date_of_birth,
  height_cm = EXCLUDED.height_cm,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  subcaste = EXCLUDED.subcaste,
  dosham = EXCLUDED.dosham,
  education = EXCLUDED.education,
  education_detail = EXCLUDED.education_detail,
  occupation = EXCLUDED.occupation,
  occupation_detail = EXCLUDED.occupation_detail,
  annual_income = EXCLUDED.annual_income,
  company_name = EXCLUDED.company_name,
  city = EXCLUDED.city,
  district = EXCLUDED.district,
  about_me = EXCLUDED.about_me,
  family_type = EXCLUDED.family_type,
  family_status = EXCLUDED.family_status,
  father_occupation = EXCLUDED.father_occupation,
  mother_occupation = EXCLUDED.mother_occupation,
  is_verified = EXCLUDED.is_verified,
  is_premium = EXCLUDED.is_premium,
  is_profile_complete = EXCLUDED.is_profile_complete,
  profile_completion_percent = EXCLUDED.profile_completion_percent,
  last_active_at = EXCLUDED.last_active_at;
INSERT INTO public.profiles (id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, father_occupation, mother_occupation, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at)
VALUES ('00000000-0000-4000-a000-0000000000d5', 'TM000213', 'Ramakrishnan Gopal', 'male', '1995-10-13', 183, 'never_married', 'Hindu', 'Vanniyar', 'Vanniyar subcaste', 'no', 'B.Com', 'B.Com Graduate', 'Bank Manager', 'Bank Manager Details', '₹10 Lakhs - ₹15 Lakhs', 'Self Employed', 'Vellore', 'Vellore', 'Hi, I am Ramakrishnan. I have completed my B.Com and am currently working as a Bank Manager at Self Employed in Vellore. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'middle_class', 'Retired Employee', 'Homemaker', true, false, true, 100, NOW() - INTERVAL '9 days')
ON CONFLICT (id) DO UPDATE SET
  profile_id = EXCLUDED.profile_id,
  display_name = EXCLUDED.display_name,
  gender = EXCLUDED.gender,
  date_of_birth = EXCLUDED.date_of_birth,
  height_cm = EXCLUDED.height_cm,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  subcaste = EXCLUDED.subcaste,
  dosham = EXCLUDED.dosham,
  education = EXCLUDED.education,
  education_detail = EXCLUDED.education_detail,
  occupation = EXCLUDED.occupation,
  occupation_detail = EXCLUDED.occupation_detail,
  annual_income = EXCLUDED.annual_income,
  company_name = EXCLUDED.company_name,
  city = EXCLUDED.city,
  district = EXCLUDED.district,
  about_me = EXCLUDED.about_me,
  family_type = EXCLUDED.family_type,
  family_status = EXCLUDED.family_status,
  father_occupation = EXCLUDED.father_occupation,
  mother_occupation = EXCLUDED.mother_occupation,
  is_verified = EXCLUDED.is_verified,
  is_premium = EXCLUDED.is_premium,
  is_profile_complete = EXCLUDED.is_profile_complete,
  profile_completion_percent = EXCLUDED.profile_completion_percent,
  last_active_at = EXCLUDED.last_active_at;
INSERT INTO public.profiles (id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, father_occupation, mother_occupation, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at)
VALUES ('00000000-0000-4000-a000-0000000000d6', 'TM000214', 'Shalini Sundaram', 'female', '2003-06-02', 166, 'divorced', 'Hindu', 'Vishwakarma', 'Vishwakarma subcaste', 'no', 'M.C.A', 'M.C.A Graduate', 'Software Engineer', 'Software Engineer Details', '₹10 Lakhs - ₹15 Lakhs', 'Cognizant', 'Vellore', 'Vellore', 'Hi, I am Shalini. I have completed my M.C.A and am currently working as a Software Engineer at Cognizant in Vellore. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'middle_class', 'Retired Employee', 'Homemaker', false, true, true, 100, NOW() - INTERVAL '10 days')
ON CONFLICT (id) DO UPDATE SET
  profile_id = EXCLUDED.profile_id,
  display_name = EXCLUDED.display_name,
  gender = EXCLUDED.gender,
  date_of_birth = EXCLUDED.date_of_birth,
  height_cm = EXCLUDED.height_cm,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  subcaste = EXCLUDED.subcaste,
  dosham = EXCLUDED.dosham,
  education = EXCLUDED.education,
  education_detail = EXCLUDED.education_detail,
  occupation = EXCLUDED.occupation,
  occupation_detail = EXCLUDED.occupation_detail,
  annual_income = EXCLUDED.annual_income,
  company_name = EXCLUDED.company_name,
  city = EXCLUDED.city,
  district = EXCLUDED.district,
  about_me = EXCLUDED.about_me,
  family_type = EXCLUDED.family_type,
  family_status = EXCLUDED.family_status,
  father_occupation = EXCLUDED.father_occupation,
  mother_occupation = EXCLUDED.mother_occupation,
  is_verified = EXCLUDED.is_verified,
  is_premium = EXCLUDED.is_premium,
  is_profile_complete = EXCLUDED.is_profile_complete,
  profile_completion_percent = EXCLUDED.profile_completion_percent,
  last_active_at = EXCLUDED.last_active_at;
INSERT INTO public.profiles (id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, father_occupation, mother_occupation, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at)
VALUES ('00000000-0000-4000-a000-0000000000d7', 'TM000215', 'Jeeva Krishnan', 'male', '1989-07-06', 188, 'never_married', 'Hindu', 'Adi Dravida', NULL, 'no', 'B.Com', 'B.Com Graduate', 'Advocate', 'Advocate Details', '₹7 Lakhs - ₹10 Lakhs', 'HCL', 'Salem', 'Salem', 'Hi, I am Jeeva. I have completed my B.Com and am currently working as a Advocate at HCL in Salem. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'joint', 'upper_middle_class', 'Retired Employee', 'Homemaker', true, false, true, 100, NOW() - INTERVAL '4 days')
ON CONFLICT (id) DO UPDATE SET
  profile_id = EXCLUDED.profile_id,
  display_name = EXCLUDED.display_name,
  gender = EXCLUDED.gender,
  date_of_birth = EXCLUDED.date_of_birth,
  height_cm = EXCLUDED.height_cm,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  subcaste = EXCLUDED.subcaste,
  dosham = EXCLUDED.dosham,
  education = EXCLUDED.education,
  education_detail = EXCLUDED.education_detail,
  occupation = EXCLUDED.occupation,
  occupation_detail = EXCLUDED.occupation_detail,
  annual_income = EXCLUDED.annual_income,
  company_name = EXCLUDED.company_name,
  city = EXCLUDED.city,
  district = EXCLUDED.district,
  about_me = EXCLUDED.about_me,
  family_type = EXCLUDED.family_type,
  family_status = EXCLUDED.family_status,
  father_occupation = EXCLUDED.father_occupation,
  mother_occupation = EXCLUDED.mother_occupation,
  is_verified = EXCLUDED.is_verified,
  is_premium = EXCLUDED.is_premium,
  is_profile_complete = EXCLUDED.is_profile_complete,
  profile_completion_percent = EXCLUDED.profile_completion_percent,
  last_active_at = EXCLUDED.last_active_at;
INSERT INTO public.profiles (id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, father_occupation, mother_occupation, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at)
VALUES ('00000000-0000-4000-a000-0000000000d8', 'TM000216', 'Banumathi Gopal', 'female', '1998-05-15', 164, 'never_married', 'Muslim', 'Marakayar', NULL, 'no', 'B.E. / B.Tech', 'B.E. / B.Tech Graduate', 'Dentist', 'Dentist Details', '₹15 Lakhs - ₹20 Lakhs', 'Cognizant', 'Coimbatore', 'Coimbatore', 'Hi, I am Banumathi. I have completed my B.E. / B.Tech and am currently working as a Dentist at Cognizant in Coimbatore. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'upper_middle_class', 'Retired Employee', 'Homemaker', true, false, true, 100, NOW() - INTERVAL '3 days')
ON CONFLICT (id) DO UPDATE SET
  profile_id = EXCLUDED.profile_id,
  display_name = EXCLUDED.display_name,
  gender = EXCLUDED.gender,
  date_of_birth = EXCLUDED.date_of_birth,
  height_cm = EXCLUDED.height_cm,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  subcaste = EXCLUDED.subcaste,
  dosham = EXCLUDED.dosham,
  education = EXCLUDED.education,
  education_detail = EXCLUDED.education_detail,
  occupation = EXCLUDED.occupation,
  occupation_detail = EXCLUDED.occupation_detail,
  annual_income = EXCLUDED.annual_income,
  company_name = EXCLUDED.company_name,
  city = EXCLUDED.city,
  district = EXCLUDED.district,
  about_me = EXCLUDED.about_me,
  family_type = EXCLUDED.family_type,
  family_status = EXCLUDED.family_status,
  father_occupation = EXCLUDED.father_occupation,
  mother_occupation = EXCLUDED.mother_occupation,
  is_verified = EXCLUDED.is_verified,
  is_premium = EXCLUDED.is_premium,
  is_profile_complete = EXCLUDED.is_profile_complete,
  profile_completion_percent = EXCLUDED.profile_completion_percent,
  last_active_at = EXCLUDED.last_active_at;
INSERT INTO public.profiles (id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, father_occupation, mother_occupation, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at)
VALUES ('00000000-0000-4000-a000-0000000000d9', 'TM000217', 'Sundar Sundaram', 'male', '1999-09-07', 183, 'never_married', 'Hindu', 'Thevar', 'Thevar subcaste', 'no', 'M.Com', 'M.Com Graduate', 'Bank Manager', 'Bank Manager Details', '₹5 Lakhs - ₹7 Lakhs', 'HCL', 'Tiruppur', 'Tiruppur', 'Hi, I am Sundar. I have completed my M.Com and am currently working as a Bank Manager at HCL in Tiruppur. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'middle_class', 'Retired Employee', 'Homemaker', true, false, true, 100, NOW() - INTERVAL '1 days')
ON CONFLICT (id) DO UPDATE SET
  profile_id = EXCLUDED.profile_id,
  display_name = EXCLUDED.display_name,
  gender = EXCLUDED.gender,
  date_of_birth = EXCLUDED.date_of_birth,
  height_cm = EXCLUDED.height_cm,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  subcaste = EXCLUDED.subcaste,
  dosham = EXCLUDED.dosham,
  education = EXCLUDED.education,
  education_detail = EXCLUDED.education_detail,
  occupation = EXCLUDED.occupation,
  occupation_detail = EXCLUDED.occupation_detail,
  annual_income = EXCLUDED.annual_income,
  company_name = EXCLUDED.company_name,
  city = EXCLUDED.city,
  district = EXCLUDED.district,
  about_me = EXCLUDED.about_me,
  family_type = EXCLUDED.family_type,
  family_status = EXCLUDED.family_status,
  father_occupation = EXCLUDED.father_occupation,
  mother_occupation = EXCLUDED.mother_occupation,
  is_verified = EXCLUDED.is_verified,
  is_premium = EXCLUDED.is_premium,
  is_profile_complete = EXCLUDED.is_profile_complete,
  profile_completion_percent = EXCLUDED.profile_completion_percent,
  last_active_at = EXCLUDED.last_active_at;
INSERT INTO public.profiles (id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, father_occupation, mother_occupation, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at)
VALUES ('00000000-0000-4000-a000-0000000000da', 'TM000218', 'Archana Samy', 'female', '1991-07-14', 167, 'never_married', 'Hindu', 'Vellalar', NULL, 'no', 'M.B.A', 'M.B.A Graduate', 'Civil Engineer', 'Civil Engineer Details', '₹15 Lakhs - ₹20 Lakhs', 'Self Employed', 'Tiruppur', 'Tiruppur', 'Hi, I am Archana. I have completed my M.B.A and am currently working as a Civil Engineer at Self Employed in Tiruppur. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'upper_middle_class', 'Retired Employee', 'Homemaker', true, true, true, 100, NOW() - INTERVAL '4 days')
ON CONFLICT (id) DO UPDATE SET
  profile_id = EXCLUDED.profile_id,
  display_name = EXCLUDED.display_name,
  gender = EXCLUDED.gender,
  date_of_birth = EXCLUDED.date_of_birth,
  height_cm = EXCLUDED.height_cm,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  subcaste = EXCLUDED.subcaste,
  dosham = EXCLUDED.dosham,
  education = EXCLUDED.education,
  education_detail = EXCLUDED.education_detail,
  occupation = EXCLUDED.occupation,
  occupation_detail = EXCLUDED.occupation_detail,
  annual_income = EXCLUDED.annual_income,
  company_name = EXCLUDED.company_name,
  city = EXCLUDED.city,
  district = EXCLUDED.district,
  about_me = EXCLUDED.about_me,
  family_type = EXCLUDED.family_type,
  family_status = EXCLUDED.family_status,
  father_occupation = EXCLUDED.father_occupation,
  mother_occupation = EXCLUDED.mother_occupation,
  is_verified = EXCLUDED.is_verified,
  is_premium = EXCLUDED.is_premium,
  is_profile_complete = EXCLUDED.is_profile_complete,
  profile_completion_percent = EXCLUDED.profile_completion_percent,
  last_active_at = EXCLUDED.last_active_at;
INSERT INTO public.profiles (id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, father_occupation, mother_occupation, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at)
VALUES ('00000000-0000-4000-a000-0000000000db', 'TM000219', 'Anand Sundaram', 'male', '1996-10-21', 178, 'never_married', 'Hindu', 'Vishwakarma', 'Vishwakarma subcaste', 'no', 'B.E. / B.Tech', 'B.E. / B.Tech Graduate', 'Dentist', 'Dentist Details', '₹5 Lakhs - ₹7 Lakhs', 'Wipro', 'Tiruppur', 'Tiruppur', 'Hi, I am Anand. I have completed my B.E. / B.Tech and am currently working as a Dentist at Wipro in Tiruppur. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'middle_class', 'Retired Employee', 'Homemaker', true, false, true, 100, NOW() - INTERVAL '10 days')
ON CONFLICT (id) DO UPDATE SET
  profile_id = EXCLUDED.profile_id,
  display_name = EXCLUDED.display_name,
  gender = EXCLUDED.gender,
  date_of_birth = EXCLUDED.date_of_birth,
  height_cm = EXCLUDED.height_cm,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  subcaste = EXCLUDED.subcaste,
  dosham = EXCLUDED.dosham,
  education = EXCLUDED.education,
  education_detail = EXCLUDED.education_detail,
  occupation = EXCLUDED.occupation,
  occupation_detail = EXCLUDED.occupation_detail,
  annual_income = EXCLUDED.annual_income,
  company_name = EXCLUDED.company_name,
  city = EXCLUDED.city,
  district = EXCLUDED.district,
  about_me = EXCLUDED.about_me,
  family_type = EXCLUDED.family_type,
  family_status = EXCLUDED.family_status,
  father_occupation = EXCLUDED.father_occupation,
  mother_occupation = EXCLUDED.mother_occupation,
  is_verified = EXCLUDED.is_verified,
  is_premium = EXCLUDED.is_premium,
  is_profile_complete = EXCLUDED.is_profile_complete,
  profile_completion_percent = EXCLUDED.profile_completion_percent,
  last_active_at = EXCLUDED.last_active_at;
INSERT INTO public.profiles (id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, father_occupation, mother_occupation, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at)
VALUES ('00000000-0000-4000-a000-0000000000dc', 'TM000220', 'Lakshmi Gopal', 'female', '1990-05-19', 158, 'never_married', 'Hindu', 'Gounder', 'Gounder subcaste', 'no', 'M.Sc', 'M.Sc Graduate', 'Civil Engineer', 'Civil Engineer Details', '₹15 Lakhs - ₹20 Lakhs', 'Wipro', 'Coimbatore', 'Coimbatore', 'Hi, I am Lakshmi. I have completed my M.Sc and am currently working as a Civil Engineer at Wipro in Coimbatore. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'upper_middle_class', 'Retired Employee', 'Homemaker', true, false, true, 100, NOW() - INTERVAL '8 days')
ON CONFLICT (id) DO UPDATE SET
  profile_id = EXCLUDED.profile_id,
  display_name = EXCLUDED.display_name,
  gender = EXCLUDED.gender,
  date_of_birth = EXCLUDED.date_of_birth,
  height_cm = EXCLUDED.height_cm,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  subcaste = EXCLUDED.subcaste,
  dosham = EXCLUDED.dosham,
  education = EXCLUDED.education,
  education_detail = EXCLUDED.education_detail,
  occupation = EXCLUDED.occupation,
  occupation_detail = EXCLUDED.occupation_detail,
  annual_income = EXCLUDED.annual_income,
  company_name = EXCLUDED.company_name,
  city = EXCLUDED.city,
  district = EXCLUDED.district,
  about_me = EXCLUDED.about_me,
  family_type = EXCLUDED.family_type,
  family_status = EXCLUDED.family_status,
  father_occupation = EXCLUDED.father_occupation,
  mother_occupation = EXCLUDED.mother_occupation,
  is_verified = EXCLUDED.is_verified,
  is_premium = EXCLUDED.is_premium,
  is_profile_complete = EXCLUDED.is_profile_complete,
  profile_completion_percent = EXCLUDED.profile_completion_percent,
  last_active_at = EXCLUDED.last_active_at;
INSERT INTO public.profiles (id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, father_occupation, mother_occupation, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at)
VALUES ('00000000-0000-4000-a000-0000000000dd', 'TM000221', 'Prabhu Devan', 'male', '1988-07-09', 171, 'divorced', 'Hindu', 'Yadav', 'Yadav subcaste', 'no', 'M.Com', 'M.Com Graduate', 'Bank Manager', 'Bank Manager Details', '₹15 Lakhs - ₹20 Lakhs', 'Zoho', 'Vellore', 'Vellore', 'Hi, I am Prabhu. I have completed my M.Com and am currently working as a Bank Manager at Zoho in Vellore. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'joint', 'middle_class', 'Retired Employee', 'Homemaker', true, false, true, 100, NOW() - INTERVAL '3 days')
ON CONFLICT (id) DO UPDATE SET
  profile_id = EXCLUDED.profile_id,
  display_name = EXCLUDED.display_name,
  gender = EXCLUDED.gender,
  date_of_birth = EXCLUDED.date_of_birth,
  height_cm = EXCLUDED.height_cm,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  subcaste = EXCLUDED.subcaste,
  dosham = EXCLUDED.dosham,
  education = EXCLUDED.education,
  education_detail = EXCLUDED.education_detail,
  occupation = EXCLUDED.occupation,
  occupation_detail = EXCLUDED.occupation_detail,
  annual_income = EXCLUDED.annual_income,
  company_name = EXCLUDED.company_name,
  city = EXCLUDED.city,
  district = EXCLUDED.district,
  about_me = EXCLUDED.about_me,
  family_type = EXCLUDED.family_type,
  family_status = EXCLUDED.family_status,
  father_occupation = EXCLUDED.father_occupation,
  mother_occupation = EXCLUDED.mother_occupation,
  is_verified = EXCLUDED.is_verified,
  is_premium = EXCLUDED.is_premium,
  is_profile_complete = EXCLUDED.is_profile_complete,
  profile_completion_percent = EXCLUDED.profile_completion_percent,
  last_active_at = EXCLUDED.last_active_at;
INSERT INTO public.profiles (id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, father_occupation, mother_occupation, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at)
VALUES ('00000000-0000-4000-a000-0000000000de', 'TM000222', 'Swetha Samy', 'female', '1999-08-11', 166, 'never_married', 'Hindu', 'Maravar', NULL, 'yes', 'B.E. / B.Tech', 'B.E. / B.Tech Graduate', 'Pharmacist', 'Pharmacist Details', '₹15 Lakhs - ₹20 Lakhs', 'Accenture', 'Thoothukudi', 'Tuticorin', 'Hi, I am Swetha. I have completed my B.E. / B.Tech and am currently working as a Pharmacist at Accenture in Thoothukudi. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'middle_class', 'Retired Employee', 'Homemaker', true, false, true, 100, NOW() - INTERVAL '7 days')
ON CONFLICT (id) DO UPDATE SET
  profile_id = EXCLUDED.profile_id,
  display_name = EXCLUDED.display_name,
  gender = EXCLUDED.gender,
  date_of_birth = EXCLUDED.date_of_birth,
  height_cm = EXCLUDED.height_cm,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  subcaste = EXCLUDED.subcaste,
  dosham = EXCLUDED.dosham,
  education = EXCLUDED.education,
  education_detail = EXCLUDED.education_detail,
  occupation = EXCLUDED.occupation,
  occupation_detail = EXCLUDED.occupation_detail,
  annual_income = EXCLUDED.annual_income,
  company_name = EXCLUDED.company_name,
  city = EXCLUDED.city,
  district = EXCLUDED.district,
  about_me = EXCLUDED.about_me,
  family_type = EXCLUDED.family_type,
  family_status = EXCLUDED.family_status,
  father_occupation = EXCLUDED.father_occupation,
  mother_occupation = EXCLUDED.mother_occupation,
  is_verified = EXCLUDED.is_verified,
  is_premium = EXCLUDED.is_premium,
  is_profile_complete = EXCLUDED.is_profile_complete,
  profile_completion_percent = EXCLUDED.profile_completion_percent,
  last_active_at = EXCLUDED.last_active_at;
INSERT INTO public.profiles (id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, father_occupation, mother_occupation, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at)
VALUES ('00000000-0000-4000-a000-0000000000df', 'TM000223', 'Kabilan Sundaram', 'male', '2005-09-19', 186, 'never_married', 'Hindu', 'Brahmin - Iyer', NULL, 'yes', 'M.Com', 'M.Com Graduate', 'Auditor', 'Auditor Details', '₹15 Lakhs - ₹20 Lakhs', 'Self Employed', 'Tiruppur', 'Tiruppur', 'Hi, I am Kabilan. I have completed my M.Com and am currently working as a Auditor at Self Employed in Tiruppur. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'joint', 'rich', 'Retired Employee', 'Homemaker', true, false, true, 100, NOW() - INTERVAL '4 days')
ON CONFLICT (id) DO UPDATE SET
  profile_id = EXCLUDED.profile_id,
  display_name = EXCLUDED.display_name,
  gender = EXCLUDED.gender,
  date_of_birth = EXCLUDED.date_of_birth,
  height_cm = EXCLUDED.height_cm,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  subcaste = EXCLUDED.subcaste,
  dosham = EXCLUDED.dosham,
  education = EXCLUDED.education,
  education_detail = EXCLUDED.education_detail,
  occupation = EXCLUDED.occupation,
  occupation_detail = EXCLUDED.occupation_detail,
  annual_income = EXCLUDED.annual_income,
  company_name = EXCLUDED.company_name,
  city = EXCLUDED.city,
  district = EXCLUDED.district,
  about_me = EXCLUDED.about_me,
  family_type = EXCLUDED.family_type,
  family_status = EXCLUDED.family_status,
  father_occupation = EXCLUDED.father_occupation,
  mother_occupation = EXCLUDED.mother_occupation,
  is_verified = EXCLUDED.is_verified,
  is_premium = EXCLUDED.is_premium,
  is_profile_complete = EXCLUDED.is_profile_complete,
  profile_completion_percent = EXCLUDED.profile_completion_percent,
  last_active_at = EXCLUDED.last_active_at;
INSERT INTO public.profiles (id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, father_occupation, mother_occupation, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at)
VALUES ('00000000-0000-4000-a000-0000000000e0', 'TM000224', 'Abirami Moorthy', 'female', '1992-06-13', 172, 'never_married', 'Hindu', 'Maravar', NULL, 'yes', 'M.C.A', 'M.C.A Graduate', 'Civil Engineer', 'Civil Engineer Details', '₹20 Lakhs+', 'Self Employed', 'Thoothukudi', 'Tuticorin', 'Hi, I am Abirami. I have completed my M.C.A and am currently working as a Civil Engineer at Self Employed in Thoothukudi. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'middle_class', 'Retired Employee', 'Homemaker', true, false, true, 100, NOW() - INTERVAL '7 days')
ON CONFLICT (id) DO UPDATE SET
  profile_id = EXCLUDED.profile_id,
  display_name = EXCLUDED.display_name,
  gender = EXCLUDED.gender,
  date_of_birth = EXCLUDED.date_of_birth,
  height_cm = EXCLUDED.height_cm,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  subcaste = EXCLUDED.subcaste,
  dosham = EXCLUDED.dosham,
  education = EXCLUDED.education,
  education_detail = EXCLUDED.education_detail,
  occupation = EXCLUDED.occupation,
  occupation_detail = EXCLUDED.occupation_detail,
  annual_income = EXCLUDED.annual_income,
  company_name = EXCLUDED.company_name,
  city = EXCLUDED.city,
  district = EXCLUDED.district,
  about_me = EXCLUDED.about_me,
  family_type = EXCLUDED.family_type,
  family_status = EXCLUDED.family_status,
  father_occupation = EXCLUDED.father_occupation,
  mother_occupation = EXCLUDED.mother_occupation,
  is_verified = EXCLUDED.is_verified,
  is_premium = EXCLUDED.is_premium,
  is_profile_complete = EXCLUDED.is_profile_complete,
  profile_completion_percent = EXCLUDED.profile_completion_percent,
  last_active_at = EXCLUDED.last_active_at;
INSERT INTO public.profiles (id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, father_occupation, mother_occupation, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at)
VALUES ('00000000-0000-4000-a000-0000000000e1', 'TM000225', 'Ranjith Devan', 'male', '1997-06-12', 168, 'divorced', 'Hindu', 'Pillai', NULL, 'yes', 'B.Sc', 'B.Sc Graduate', 'Architect', 'Architect Details', '₹7 Lakhs - ₹10 Lakhs', 'Government Service', 'Salem', 'Salem', 'Hi, I am Ranjith. I have completed my B.Sc and am currently working as a Architect at Government Service in Salem. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'joint', 'rich', 'Retired Employee', 'Homemaker', false, false, true, 100, NOW() - INTERVAL '8 days')
ON CONFLICT (id) DO UPDATE SET
  profile_id = EXCLUDED.profile_id,
  display_name = EXCLUDED.display_name,
  gender = EXCLUDED.gender,
  date_of_birth = EXCLUDED.date_of_birth,
  height_cm = EXCLUDED.height_cm,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  subcaste = EXCLUDED.subcaste,
  dosham = EXCLUDED.dosham,
  education = EXCLUDED.education,
  education_detail = EXCLUDED.education_detail,
  occupation = EXCLUDED.occupation,
  occupation_detail = EXCLUDED.occupation_detail,
  annual_income = EXCLUDED.annual_income,
  company_name = EXCLUDED.company_name,
  city = EXCLUDED.city,
  district = EXCLUDED.district,
  about_me = EXCLUDED.about_me,
  family_type = EXCLUDED.family_type,
  family_status = EXCLUDED.family_status,
  father_occupation = EXCLUDED.father_occupation,
  mother_occupation = EXCLUDED.mother_occupation,
  is_verified = EXCLUDED.is_verified,
  is_premium = EXCLUDED.is_premium,
  is_profile_complete = EXCLUDED.is_profile_complete,
  profile_completion_percent = EXCLUDED.profile_completion_percent,
  last_active_at = EXCLUDED.last_active_at;
INSERT INTO public.profiles (id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, father_occupation, mother_occupation, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at)
VALUES ('00000000-0000-4000-a000-0000000000e2', 'TM000226', 'Soundarya Krishnan', 'female', '2004-01-11', 166, 'never_married', 'Hindu', 'Sengunthar', NULL, 'yes', 'M.B.B.S', 'M.B.B.S Graduate', 'Advocate', 'Advocate Details', '₹3 Lakhs - ₹5 Lakhs', 'Zoho', 'Chennai', 'Chennai', 'Hi, I am Soundarya. I have completed my M.B.B.S and am currently working as a Advocate at Zoho in Chennai. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'middle_class', 'Retired Employee', 'Homemaker', true, false, true, 100, NOW() - INTERVAL '0 days')
ON CONFLICT (id) DO UPDATE SET
  profile_id = EXCLUDED.profile_id,
  display_name = EXCLUDED.display_name,
  gender = EXCLUDED.gender,
  date_of_birth = EXCLUDED.date_of_birth,
  height_cm = EXCLUDED.height_cm,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  subcaste = EXCLUDED.subcaste,
  dosham = EXCLUDED.dosham,
  education = EXCLUDED.education,
  education_detail = EXCLUDED.education_detail,
  occupation = EXCLUDED.occupation,
  occupation_detail = EXCLUDED.occupation_detail,
  annual_income = EXCLUDED.annual_income,
  company_name = EXCLUDED.company_name,
  city = EXCLUDED.city,
  district = EXCLUDED.district,
  about_me = EXCLUDED.about_me,
  family_type = EXCLUDED.family_type,
  family_status = EXCLUDED.family_status,
  father_occupation = EXCLUDED.father_occupation,
  mother_occupation = EXCLUDED.mother_occupation,
  is_verified = EXCLUDED.is_verified,
  is_premium = EXCLUDED.is_premium,
  is_profile_complete = EXCLUDED.is_profile_complete,
  profile_completion_percent = EXCLUDED.profile_completion_percent,
  last_active_at = EXCLUDED.last_active_at;
INSERT INTO public.profiles (id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, father_occupation, mother_occupation, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at)
VALUES ('00000000-0000-4000-a000-0000000000e3', 'TM000227', 'Arun Velan', 'male', '1991-06-02', 188, 'never_married', 'Muslim', 'Rawther', NULL, 'no', 'Ph.D', 'Ph.D Graduate', 'Mechanical Engineer', 'Mechanical Engineer Details', '₹3 Lakhs - ₹5 Lakhs', 'Accenture', 'Thanjavur', 'Thanjavur', 'Hi, I am Arun. I have completed my Ph.D and am currently working as a Mechanical Engineer at Accenture in Thanjavur. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'rich', 'Retired Employee', 'Homemaker', true, false, true, 100, NOW() - INTERVAL '5 days')
ON CONFLICT (id) DO UPDATE SET
  profile_id = EXCLUDED.profile_id,
  display_name = EXCLUDED.display_name,
  gender = EXCLUDED.gender,
  date_of_birth = EXCLUDED.date_of_birth,
  height_cm = EXCLUDED.height_cm,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  subcaste = EXCLUDED.subcaste,
  dosham = EXCLUDED.dosham,
  education = EXCLUDED.education,
  education_detail = EXCLUDED.education_detail,
  occupation = EXCLUDED.occupation,
  occupation_detail = EXCLUDED.occupation_detail,
  annual_income = EXCLUDED.annual_income,
  company_name = EXCLUDED.company_name,
  city = EXCLUDED.city,
  district = EXCLUDED.district,
  about_me = EXCLUDED.about_me,
  family_type = EXCLUDED.family_type,
  family_status = EXCLUDED.family_status,
  father_occupation = EXCLUDED.father_occupation,
  mother_occupation = EXCLUDED.mother_occupation,
  is_verified = EXCLUDED.is_verified,
  is_premium = EXCLUDED.is_premium,
  is_profile_complete = EXCLUDED.is_profile_complete,
  profile_completion_percent = EXCLUDED.profile_completion_percent,
  last_active_at = EXCLUDED.last_active_at;
INSERT INTO public.profiles (id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, father_occupation, mother_occupation, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at)
VALUES ('00000000-0000-4000-a000-0000000000e4', 'TM000228', 'Nandhini Velan', 'female', '1997-11-19', 169, 'never_married', 'Hindu', 'Vishwakarma', 'Vishwakarma subcaste', 'yes', 'M.C.A', 'M.C.A Graduate', 'Government Officer', 'Government Officer Details', '₹5 Lakhs - ₹7 Lakhs', 'Accenture', 'Thanjavur', 'Thanjavur', 'Hi, I am Nandhini. I have completed my M.C.A and am currently working as a Government Officer at Accenture in Thanjavur. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'upper_middle_class', 'Retired Employee', 'Homemaker', true, true, true, 100, NOW() - INTERVAL '4 days')
ON CONFLICT (id) DO UPDATE SET
  profile_id = EXCLUDED.profile_id,
  display_name = EXCLUDED.display_name,
  gender = EXCLUDED.gender,
  date_of_birth = EXCLUDED.date_of_birth,
  height_cm = EXCLUDED.height_cm,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  subcaste = EXCLUDED.subcaste,
  dosham = EXCLUDED.dosham,
  education = EXCLUDED.education,
  education_detail = EXCLUDED.education_detail,
  occupation = EXCLUDED.occupation,
  occupation_detail = EXCLUDED.occupation_detail,
  annual_income = EXCLUDED.annual_income,
  company_name = EXCLUDED.company_name,
  city = EXCLUDED.city,
  district = EXCLUDED.district,
  about_me = EXCLUDED.about_me,
  family_type = EXCLUDED.family_type,
  family_status = EXCLUDED.family_status,
  father_occupation = EXCLUDED.father_occupation,
  mother_occupation = EXCLUDED.mother_occupation,
  is_verified = EXCLUDED.is_verified,
  is_premium = EXCLUDED.is_premium,
  is_profile_complete = EXCLUDED.is_profile_complete,
  profile_completion_percent = EXCLUDED.profile_completion_percent,
  last_active_at = EXCLUDED.last_active_at;
INSERT INTO public.profiles (id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, father_occupation, mother_occupation, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at)
VALUES ('00000000-0000-4000-a000-0000000000e5', 'TM000229', 'Kannan Selvan', 'male', '1999-11-18', 174, 'never_married', 'Hindu', 'Arunthathiyar', 'Arunthathiyar subcaste', 'no', 'M.Sc', 'M.Sc Graduate', 'Bank Manager', 'Bank Manager Details', '₹20 Lakhs+', 'Cognizant', 'Salem', 'Salem', 'Hi, I am Kannan. I have completed my M.Sc and am currently working as a Bank Manager at Cognizant in Salem. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'joint', 'upper_middle_class', 'Retired Employee', 'Homemaker', false, true, true, 100, NOW() - INTERVAL '0 days')
ON CONFLICT (id) DO UPDATE SET
  profile_id = EXCLUDED.profile_id,
  display_name = EXCLUDED.display_name,
  gender = EXCLUDED.gender,
  date_of_birth = EXCLUDED.date_of_birth,
  height_cm = EXCLUDED.height_cm,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  subcaste = EXCLUDED.subcaste,
  dosham = EXCLUDED.dosham,
  education = EXCLUDED.education,
  education_detail = EXCLUDED.education_detail,
  occupation = EXCLUDED.occupation,
  occupation_detail = EXCLUDED.occupation_detail,
  annual_income = EXCLUDED.annual_income,
  company_name = EXCLUDED.company_name,
  city = EXCLUDED.city,
  district = EXCLUDED.district,
  about_me = EXCLUDED.about_me,
  family_type = EXCLUDED.family_type,
  family_status = EXCLUDED.family_status,
  father_occupation = EXCLUDED.father_occupation,
  mother_occupation = EXCLUDED.mother_occupation,
  is_verified = EXCLUDED.is_verified,
  is_premium = EXCLUDED.is_premium,
  is_profile_complete = EXCLUDED.is_profile_complete,
  profile_completion_percent = EXCLUDED.profile_completion_percent,
  last_active_at = EXCLUDED.last_active_at;
INSERT INTO public.profiles (id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, father_occupation, mother_occupation, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at)
VALUES ('00000000-0000-4000-a000-0000000000e6', 'TM000230', 'Divya Sundaram', 'female', '2004-03-23', 160, 'never_married', 'Hindu', 'Vishwakarma', 'Vishwakarma subcaste', 'no', 'M.C.A', 'M.C.A Graduate', 'Software Engineer', 'Software Engineer Details', '₹15 Lakhs - ₹20 Lakhs', 'Cognizant', 'Thanjavur', 'Thanjavur', 'Hi, I am Divya. I have completed my M.C.A and am currently working as a Software Engineer at Cognizant in Thanjavur. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'upper_middle_class', 'Retired Employee', 'Homemaker', true, false, true, 100, NOW() - INTERVAL '5 days')
ON CONFLICT (id) DO UPDATE SET
  profile_id = EXCLUDED.profile_id,
  display_name = EXCLUDED.display_name,
  gender = EXCLUDED.gender,
  date_of_birth = EXCLUDED.date_of_birth,
  height_cm = EXCLUDED.height_cm,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  subcaste = EXCLUDED.subcaste,
  dosham = EXCLUDED.dosham,
  education = EXCLUDED.education,
  education_detail = EXCLUDED.education_detail,
  occupation = EXCLUDED.occupation,
  occupation_detail = EXCLUDED.occupation_detail,
  annual_income = EXCLUDED.annual_income,
  company_name = EXCLUDED.company_name,
  city = EXCLUDED.city,
  district = EXCLUDED.district,
  about_me = EXCLUDED.about_me,
  family_type = EXCLUDED.family_type,
  family_status = EXCLUDED.family_status,
  father_occupation = EXCLUDED.father_occupation,
  mother_occupation = EXCLUDED.mother_occupation,
  is_verified = EXCLUDED.is_verified,
  is_premium = EXCLUDED.is_premium,
  is_profile_complete = EXCLUDED.is_profile_complete,
  profile_completion_percent = EXCLUDED.profile_completion_percent,
  last_active_at = EXCLUDED.last_active_at;
INSERT INTO public.profiles (id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, father_occupation, mother_occupation, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at)
VALUES ('00000000-0000-4000-a000-0000000000e7', 'TM000231', 'Hari Balan', 'male', '1988-02-28', 183, 'never_married', 'Muslim', 'Labbai', 'Labbai subcaste', 'no', 'B.Ed', 'B.Ed Graduate', 'Advocate', 'Advocate Details', '₹10 Lakhs - ₹15 Lakhs', 'Private Practice', 'Tiruppur', 'Tiruppur', 'Hi, I am Hari. I have completed my B.Ed and am currently working as a Advocate at Private Practice in Tiruppur. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'upper_middle_class', 'Retired Employee', 'Homemaker', false, false, true, 100, NOW() - INTERVAL '4 days')
ON CONFLICT (id) DO UPDATE SET
  profile_id = EXCLUDED.profile_id,
  display_name = EXCLUDED.display_name,
  gender = EXCLUDED.gender,
  date_of_birth = EXCLUDED.date_of_birth,
  height_cm = EXCLUDED.height_cm,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  subcaste = EXCLUDED.subcaste,
  dosham = EXCLUDED.dosham,
  education = EXCLUDED.education,
  education_detail = EXCLUDED.education_detail,
  occupation = EXCLUDED.occupation,
  occupation_detail = EXCLUDED.occupation_detail,
  annual_income = EXCLUDED.annual_income,
  company_name = EXCLUDED.company_name,
  city = EXCLUDED.city,
  district = EXCLUDED.district,
  about_me = EXCLUDED.about_me,
  family_type = EXCLUDED.family_type,
  family_status = EXCLUDED.family_status,
  father_occupation = EXCLUDED.father_occupation,
  mother_occupation = EXCLUDED.mother_occupation,
  is_verified = EXCLUDED.is_verified,
  is_premium = EXCLUDED.is_premium,
  is_profile_complete = EXCLUDED.is_profile_complete,
  profile_completion_percent = EXCLUDED.profile_completion_percent,
  last_active_at = EXCLUDED.last_active_at;
INSERT INTO public.profiles (id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, father_occupation, mother_occupation, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at)
VALUES ('00000000-0000-4000-a000-0000000000e8', 'TM000232', 'Malarvizhi Gopal', 'female', '1989-06-15', 150, 'never_married', 'Hindu', 'Vellalar', 'Vellalar subcaste', 'no', 'B.E. / B.Tech', 'B.E. / B.Tech Graduate', 'Civil Engineer', 'Civil Engineer Details', '₹5 Lakhs - ₹7 Lakhs', 'Infosys', 'Thoothukudi', 'Tuticorin', 'Hi, I am Malarvizhi. I have completed my B.E. / B.Tech and am currently working as a Civil Engineer at Infosys in Thoothukudi. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'upper_middle_class', 'Retired Employee', 'Homemaker', true, false, true, 100, NOW() - INTERVAL '1 days')
ON CONFLICT (id) DO UPDATE SET
  profile_id = EXCLUDED.profile_id,
  display_name = EXCLUDED.display_name,
  gender = EXCLUDED.gender,
  date_of_birth = EXCLUDED.date_of_birth,
  height_cm = EXCLUDED.height_cm,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  subcaste = EXCLUDED.subcaste,
  dosham = EXCLUDED.dosham,
  education = EXCLUDED.education,
  education_detail = EXCLUDED.education_detail,
  occupation = EXCLUDED.occupation,
  occupation_detail = EXCLUDED.occupation_detail,
  annual_income = EXCLUDED.annual_income,
  company_name = EXCLUDED.company_name,
  city = EXCLUDED.city,
  district = EXCLUDED.district,
  about_me = EXCLUDED.about_me,
  family_type = EXCLUDED.family_type,
  family_status = EXCLUDED.family_status,
  father_occupation = EXCLUDED.father_occupation,
  mother_occupation = EXCLUDED.mother_occupation,
  is_verified = EXCLUDED.is_verified,
  is_premium = EXCLUDED.is_premium,
  is_profile_complete = EXCLUDED.is_profile_complete,
  profile_completion_percent = EXCLUDED.profile_completion_percent,
  last_active_at = EXCLUDED.last_active_at;
INSERT INTO public.profiles (id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, father_occupation, mother_occupation, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at)
VALUES ('00000000-0000-4000-a000-0000000000e9', 'TM000233', 'Murugan Mani', 'male', '2005-04-01', 183, 'never_married', 'Muslim', 'Marakayar', NULL, 'no', 'M.B.B.S', 'M.B.B.S Graduate', 'College Professor', 'College Professor Details', '₹5 Lakhs - ₹7 Lakhs', 'Wipro', 'Thoothukudi', 'Tuticorin', 'Hi, I am Murugan. I have completed my M.B.B.S and am currently working as a College Professor at Wipro in Thoothukudi. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'joint', 'rich', 'Retired Employee', 'Homemaker', true, true, true, 100, NOW() - INTERVAL '1 days')
ON CONFLICT (id) DO UPDATE SET
  profile_id = EXCLUDED.profile_id,
  display_name = EXCLUDED.display_name,
  gender = EXCLUDED.gender,
  date_of_birth = EXCLUDED.date_of_birth,
  height_cm = EXCLUDED.height_cm,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  subcaste = EXCLUDED.subcaste,
  dosham = EXCLUDED.dosham,
  education = EXCLUDED.education,
  education_detail = EXCLUDED.education_detail,
  occupation = EXCLUDED.occupation,
  occupation_detail = EXCLUDED.occupation_detail,
  annual_income = EXCLUDED.annual_income,
  company_name = EXCLUDED.company_name,
  city = EXCLUDED.city,
  district = EXCLUDED.district,
  about_me = EXCLUDED.about_me,
  family_type = EXCLUDED.family_type,
  family_status = EXCLUDED.family_status,
  father_occupation = EXCLUDED.father_occupation,
  mother_occupation = EXCLUDED.mother_occupation,
  is_verified = EXCLUDED.is_verified,
  is_premium = EXCLUDED.is_premium,
  is_profile_complete = EXCLUDED.is_profile_complete,
  profile_completion_percent = EXCLUDED.profile_completion_percent,
  last_active_at = EXCLUDED.last_active_at;
INSERT INTO public.profiles (id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, father_occupation, mother_occupation, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at)
VALUES ('00000000-0000-4000-a000-0000000000ea', 'TM000234', 'Pavithra Sundaram', 'female', '1993-01-08', 150, 'never_married', 'Hindu', 'Arunthathiyar', 'Arunthathiyar subcaste', 'no', 'M.B.A', 'M.B.A Graduate', 'Civil Engineer', 'Civil Engineer Details', '₹15 Lakhs - ₹20 Lakhs', 'Wipro', 'Thoothukudi', 'Tuticorin', 'Hi, I am Pavithra. I have completed my M.B.A and am currently working as a Civil Engineer at Wipro in Thoothukudi. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'rich', 'Retired Employee', 'Homemaker', false, false, true, 100, NOW() - INTERVAL '5 days')
ON CONFLICT (id) DO UPDATE SET
  profile_id = EXCLUDED.profile_id,
  display_name = EXCLUDED.display_name,
  gender = EXCLUDED.gender,
  date_of_birth = EXCLUDED.date_of_birth,
  height_cm = EXCLUDED.height_cm,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  subcaste = EXCLUDED.subcaste,
  dosham = EXCLUDED.dosham,
  education = EXCLUDED.education,
  education_detail = EXCLUDED.education_detail,
  occupation = EXCLUDED.occupation,
  occupation_detail = EXCLUDED.occupation_detail,
  annual_income = EXCLUDED.annual_income,
  company_name = EXCLUDED.company_name,
  city = EXCLUDED.city,
  district = EXCLUDED.district,
  about_me = EXCLUDED.about_me,
  family_type = EXCLUDED.family_type,
  family_status = EXCLUDED.family_status,
  father_occupation = EXCLUDED.father_occupation,
  mother_occupation = EXCLUDED.mother_occupation,
  is_verified = EXCLUDED.is_verified,
  is_premium = EXCLUDED.is_premium,
  is_profile_complete = EXCLUDED.is_profile_complete,
  profile_completion_percent = EXCLUDED.profile_completion_percent,
  last_active_at = EXCLUDED.last_active_at;
INSERT INTO public.profiles (id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, father_occupation, mother_occupation, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at)
VALUES ('00000000-0000-4000-a000-0000000000eb', 'TM000235', 'Ramakrishnan Naicker', 'male', '2000-01-24', 186, 'never_married', 'Hindu', 'Maravar', NULL, 'yes', 'M.B.B.S', 'M.B.B.S Graduate', 'Architect', 'Architect Details', '₹5 Lakhs - ₹7 Lakhs', 'Government Service', 'Thanjavur', 'Thanjavur', 'Hi, I am Ramakrishnan. I have completed my M.B.B.S and am currently working as a Architect at Government Service in Thanjavur. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'upper_middle_class', 'Retired Employee', 'Homemaker', false, false, true, 100, NOW() - INTERVAL '7 days')
ON CONFLICT (id) DO UPDATE SET
  profile_id = EXCLUDED.profile_id,
  display_name = EXCLUDED.display_name,
  gender = EXCLUDED.gender,
  date_of_birth = EXCLUDED.date_of_birth,
  height_cm = EXCLUDED.height_cm,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  subcaste = EXCLUDED.subcaste,
  dosham = EXCLUDED.dosham,
  education = EXCLUDED.education,
  education_detail = EXCLUDED.education_detail,
  occupation = EXCLUDED.occupation,
  occupation_detail = EXCLUDED.occupation_detail,
  annual_income = EXCLUDED.annual_income,
  company_name = EXCLUDED.company_name,
  city = EXCLUDED.city,
  district = EXCLUDED.district,
  about_me = EXCLUDED.about_me,
  family_type = EXCLUDED.family_type,
  family_status = EXCLUDED.family_status,
  father_occupation = EXCLUDED.father_occupation,
  mother_occupation = EXCLUDED.mother_occupation,
  is_verified = EXCLUDED.is_verified,
  is_premium = EXCLUDED.is_premium,
  is_profile_complete = EXCLUDED.is_profile_complete,
  profile_completion_percent = EXCLUDED.profile_completion_percent,
  last_active_at = EXCLUDED.last_active_at;
INSERT INTO public.profiles (id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, father_occupation, mother_occupation, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at)
VALUES ('00000000-0000-4000-a000-0000000000ec', 'TM000236', 'Gowri Sundaram', 'female', '1989-05-16', 165, 'never_married', 'Hindu', 'Nadar', NULL, 'no', 'M.B.A', 'M.B.A Graduate', 'College Professor', 'College Professor Details', '₹15 Lakhs - ₹20 Lakhs', 'Zoho', 'Thoothukudi', 'Tuticorin', 'Hi, I am Gowri. I have completed my M.B.A and am currently working as a College Professor at Zoho in Thoothukudi. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'rich', 'Retired Employee', 'Homemaker', true, true, true, 100, NOW() - INTERVAL '8 days')
ON CONFLICT (id) DO UPDATE SET
  profile_id = EXCLUDED.profile_id,
  display_name = EXCLUDED.display_name,
  gender = EXCLUDED.gender,
  date_of_birth = EXCLUDED.date_of_birth,
  height_cm = EXCLUDED.height_cm,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  subcaste = EXCLUDED.subcaste,
  dosham = EXCLUDED.dosham,
  education = EXCLUDED.education,
  education_detail = EXCLUDED.education_detail,
  occupation = EXCLUDED.occupation,
  occupation_detail = EXCLUDED.occupation_detail,
  annual_income = EXCLUDED.annual_income,
  company_name = EXCLUDED.company_name,
  city = EXCLUDED.city,
  district = EXCLUDED.district,
  about_me = EXCLUDED.about_me,
  family_type = EXCLUDED.family_type,
  family_status = EXCLUDED.family_status,
  father_occupation = EXCLUDED.father_occupation,
  mother_occupation = EXCLUDED.mother_occupation,
  is_verified = EXCLUDED.is_verified,
  is_premium = EXCLUDED.is_premium,
  is_profile_complete = EXCLUDED.is_profile_complete,
  profile_completion_percent = EXCLUDED.profile_completion_percent,
  last_active_at = EXCLUDED.last_active_at;
INSERT INTO public.profiles (id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, father_occupation, mother_occupation, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at)
VALUES ('00000000-0000-4000-a000-0000000000ed', 'TM000237', 'Jeeva Samy', 'male', '2000-05-05', 185, 'never_married', 'Hindu', 'Yadav', 'Yadav subcaste', 'no', 'M.A', 'M.A Graduate', 'Doctor', 'Doctor Details', '₹15 Lakhs - ₹20 Lakhs', 'Infosys', 'Coimbatore', 'Coimbatore', 'Hi, I am Jeeva. I have completed my M.A and am currently working as a Doctor at Infosys in Coimbatore. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'upper_middle_class', 'Retired Employee', 'Homemaker', true, false, true, 100, NOW() - INTERVAL '9 days')
ON CONFLICT (id) DO UPDATE SET
  profile_id = EXCLUDED.profile_id,
  display_name = EXCLUDED.display_name,
  gender = EXCLUDED.gender,
  date_of_birth = EXCLUDED.date_of_birth,
  height_cm = EXCLUDED.height_cm,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  subcaste = EXCLUDED.subcaste,
  dosham = EXCLUDED.dosham,
  education = EXCLUDED.education,
  education_detail = EXCLUDED.education_detail,
  occupation = EXCLUDED.occupation,
  occupation_detail = EXCLUDED.occupation_detail,
  annual_income = EXCLUDED.annual_income,
  company_name = EXCLUDED.company_name,
  city = EXCLUDED.city,
  district = EXCLUDED.district,
  about_me = EXCLUDED.about_me,
  family_type = EXCLUDED.family_type,
  family_status = EXCLUDED.family_status,
  father_occupation = EXCLUDED.father_occupation,
  mother_occupation = EXCLUDED.mother_occupation,
  is_verified = EXCLUDED.is_verified,
  is_premium = EXCLUDED.is_premium,
  is_profile_complete = EXCLUDED.is_profile_complete,
  profile_completion_percent = EXCLUDED.profile_completion_percent,
  last_active_at = EXCLUDED.last_active_at;
INSERT INTO public.profiles (id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, father_occupation, mother_occupation, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at)
VALUES ('00000000-0000-4000-a000-0000000000ee', 'TM000238', 'Rajeshwari Sundaram', 'female', '2000-01-24', 168, 'divorced', 'Hindu', 'Vellalar', NULL, 'no', 'Ph.D', 'Ph.D Graduate', 'Civil Engineer', 'Civil Engineer Details', '₹10 Lakhs - ₹15 Lakhs', 'Wipro', 'Thoothukudi', 'Tuticorin', 'Hi, I am Rajeshwari. I have completed my Ph.D and am currently working as a Civil Engineer at Wipro in Thoothukudi. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'middle_class', 'Retired Employee', 'Homemaker', true, false, true, 100, NOW() - INTERVAL '9 days')
ON CONFLICT (id) DO UPDATE SET
  profile_id = EXCLUDED.profile_id,
  display_name = EXCLUDED.display_name,
  gender = EXCLUDED.gender,
  date_of_birth = EXCLUDED.date_of_birth,
  height_cm = EXCLUDED.height_cm,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  subcaste = EXCLUDED.subcaste,
  dosham = EXCLUDED.dosham,
  education = EXCLUDED.education,
  education_detail = EXCLUDED.education_detail,
  occupation = EXCLUDED.occupation,
  occupation_detail = EXCLUDED.occupation_detail,
  annual_income = EXCLUDED.annual_income,
  company_name = EXCLUDED.company_name,
  city = EXCLUDED.city,
  district = EXCLUDED.district,
  about_me = EXCLUDED.about_me,
  family_type = EXCLUDED.family_type,
  family_status = EXCLUDED.family_status,
  father_occupation = EXCLUDED.father_occupation,
  mother_occupation = EXCLUDED.mother_occupation,
  is_verified = EXCLUDED.is_verified,
  is_premium = EXCLUDED.is_premium,
  is_profile_complete = EXCLUDED.is_profile_complete,
  profile_completion_percent = EXCLUDED.profile_completion_percent,
  last_active_at = EXCLUDED.last_active_at;
INSERT INTO public.profiles (id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, father_occupation, mother_occupation, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at)
VALUES ('00000000-0000-4000-a000-0000000000ef', 'TM000239', 'Selvam Sundaram', 'male', '2003-12-24', 162, 'never_married', 'Hindu', 'Maravar', 'Maravar subcaste', 'yes', 'B.Com', 'B.Com Graduate', 'Business Owner', 'Business Owner Details', '₹10 Lakhs - ₹15 Lakhs', 'Government Service', 'Thoothukudi', 'Tuticorin', 'Hi, I am Selvam. I have completed my B.Com and am currently working as a Business Owner at Government Service in Thoothukudi. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'middle_class', 'Retired Employee', 'Homemaker', true, false, true, 100, NOW() - INTERVAL '10 days')
ON CONFLICT (id) DO UPDATE SET
  profile_id = EXCLUDED.profile_id,
  display_name = EXCLUDED.display_name,
  gender = EXCLUDED.gender,
  date_of_birth = EXCLUDED.date_of_birth,
  height_cm = EXCLUDED.height_cm,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  subcaste = EXCLUDED.subcaste,
  dosham = EXCLUDED.dosham,
  education = EXCLUDED.education,
  education_detail = EXCLUDED.education_detail,
  occupation = EXCLUDED.occupation,
  occupation_detail = EXCLUDED.occupation_detail,
  annual_income = EXCLUDED.annual_income,
  company_name = EXCLUDED.company_name,
  city = EXCLUDED.city,
  district = EXCLUDED.district,
  about_me = EXCLUDED.about_me,
  family_type = EXCLUDED.family_type,
  family_status = EXCLUDED.family_status,
  father_occupation = EXCLUDED.father_occupation,
  mother_occupation = EXCLUDED.mother_occupation,
  is_verified = EXCLUDED.is_verified,
  is_premium = EXCLUDED.is_premium,
  is_profile_complete = EXCLUDED.is_profile_complete,
  profile_completion_percent = EXCLUDED.profile_completion_percent,
  last_active_at = EXCLUDED.last_active_at;
INSERT INTO public.profiles (id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, father_occupation, mother_occupation, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at)
VALUES ('00000000-0000-4000-a000-0000000000f0', 'TM000240', 'Vidya Samy', 'female', '1992-01-20', 174, 'never_married', 'Hindu', 'Maravar', 'Maravar subcaste', 'no', 'M.B.B.S', 'M.B.B.S Graduate', 'Doctor', 'Doctor Details', '₹20 Lakhs+', 'Accenture', 'Madurai', 'Madurai', 'Hi, I am Vidya. I have completed my M.B.B.S and am currently working as a Doctor at Accenture in Madurai. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'upper_middle_class', 'Retired Employee', 'Homemaker', true, false, true, 100, NOW() - INTERVAL '1 days')
ON CONFLICT (id) DO UPDATE SET
  profile_id = EXCLUDED.profile_id,
  display_name = EXCLUDED.display_name,
  gender = EXCLUDED.gender,
  date_of_birth = EXCLUDED.date_of_birth,
  height_cm = EXCLUDED.height_cm,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  subcaste = EXCLUDED.subcaste,
  dosham = EXCLUDED.dosham,
  education = EXCLUDED.education,
  education_detail = EXCLUDED.education_detail,
  occupation = EXCLUDED.occupation,
  occupation_detail = EXCLUDED.occupation_detail,
  annual_income = EXCLUDED.annual_income,
  company_name = EXCLUDED.company_name,
  city = EXCLUDED.city,
  district = EXCLUDED.district,
  about_me = EXCLUDED.about_me,
  family_type = EXCLUDED.family_type,
  family_status = EXCLUDED.family_status,
  father_occupation = EXCLUDED.father_occupation,
  mother_occupation = EXCLUDED.mother_occupation,
  is_verified = EXCLUDED.is_verified,
  is_premium = EXCLUDED.is_premium,
  is_profile_complete = EXCLUDED.is_profile_complete,
  profile_completion_percent = EXCLUDED.profile_completion_percent,
  last_active_at = EXCLUDED.last_active_at;
INSERT INTO public.profiles (id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, father_occupation, mother_occupation, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at)
VALUES ('00000000-0000-4000-a000-0000000000f1', 'TM000241', 'Kabilan Selvan', 'male', '2000-10-09', 187, 'never_married', 'Hindu', 'Vanniyar', 'Vanniyar subcaste', 'no', 'M.B.A', 'M.B.A Graduate', 'Mechanical Engineer', 'Mechanical Engineer Details', '₹3 Lakhs - ₹5 Lakhs', 'Government Service', 'Coimbatore', 'Coimbatore', 'Hi, I am Kabilan. I have completed my M.B.A and am currently working as a Mechanical Engineer at Government Service in Coimbatore. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'upper_middle_class', 'Retired Employee', 'Homemaker', true, true, true, 100, NOW() - INTERVAL '7 days')
ON CONFLICT (id) DO UPDATE SET
  profile_id = EXCLUDED.profile_id,
  display_name = EXCLUDED.display_name,
  gender = EXCLUDED.gender,
  date_of_birth = EXCLUDED.date_of_birth,
  height_cm = EXCLUDED.height_cm,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  subcaste = EXCLUDED.subcaste,
  dosham = EXCLUDED.dosham,
  education = EXCLUDED.education,
  education_detail = EXCLUDED.education_detail,
  occupation = EXCLUDED.occupation,
  occupation_detail = EXCLUDED.occupation_detail,
  annual_income = EXCLUDED.annual_income,
  company_name = EXCLUDED.company_name,
  city = EXCLUDED.city,
  district = EXCLUDED.district,
  about_me = EXCLUDED.about_me,
  family_type = EXCLUDED.family_type,
  family_status = EXCLUDED.family_status,
  father_occupation = EXCLUDED.father_occupation,
  mother_occupation = EXCLUDED.mother_occupation,
  is_verified = EXCLUDED.is_verified,
  is_premium = EXCLUDED.is_premium,
  is_profile_complete = EXCLUDED.is_profile_complete,
  profile_completion_percent = EXCLUDED.profile_completion_percent,
  last_active_at = EXCLUDED.last_active_at;
INSERT INTO public.profiles (id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, father_occupation, mother_occupation, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at)
VALUES ('00000000-0000-4000-a000-0000000000f2', 'TM000242', 'Gayathri Naicker', 'female', '1996-09-04', 170, 'never_married', 'Muslim', 'Sunni Muslim', NULL, 'no', 'B.Sc', 'B.Sc Graduate', 'Mechanical Engineer', 'Mechanical Engineer Details', '₹10 Lakhs - ₹15 Lakhs', 'Zoho', 'Thanjavur', 'Thanjavur', 'Hi, I am Gayathri. I have completed my B.Sc and am currently working as a Mechanical Engineer at Zoho in Thanjavur. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'upper_middle_class', 'Retired Employee', 'Homemaker', true, true, true, 100, NOW() - INTERVAL '5 days')
ON CONFLICT (id) DO UPDATE SET
  profile_id = EXCLUDED.profile_id,
  display_name = EXCLUDED.display_name,
  gender = EXCLUDED.gender,
  date_of_birth = EXCLUDED.date_of_birth,
  height_cm = EXCLUDED.height_cm,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  subcaste = EXCLUDED.subcaste,
  dosham = EXCLUDED.dosham,
  education = EXCLUDED.education,
  education_detail = EXCLUDED.education_detail,
  occupation = EXCLUDED.occupation,
  occupation_detail = EXCLUDED.occupation_detail,
  annual_income = EXCLUDED.annual_income,
  company_name = EXCLUDED.company_name,
  city = EXCLUDED.city,
  district = EXCLUDED.district,
  about_me = EXCLUDED.about_me,
  family_type = EXCLUDED.family_type,
  family_status = EXCLUDED.family_status,
  father_occupation = EXCLUDED.father_occupation,
  mother_occupation = EXCLUDED.mother_occupation,
  is_verified = EXCLUDED.is_verified,
  is_premium = EXCLUDED.is_premium,
  is_profile_complete = EXCLUDED.is_profile_complete,
  profile_completion_percent = EXCLUDED.profile_completion_percent,
  last_active_at = EXCLUDED.last_active_at;
INSERT INTO public.profiles (id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, father_occupation, mother_occupation, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at)
VALUES ('00000000-0000-4000-a000-0000000000f3', 'TM000243', 'Prakash Devan', 'male', '2001-07-23', 184, 'never_married', 'Hindu', 'Yadav', NULL, 'no', 'B.Com', 'B.Com Graduate', 'Pharmacist', 'Pharmacist Details', '₹20 Lakhs+', 'Infosys', 'Salem', 'Salem', 'Hi, I am Prakash. I have completed my B.Com and am currently working as a Pharmacist at Infosys in Salem. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'middle_class', 'Retired Employee', 'Homemaker', false, true, true, 100, NOW() - INTERVAL '6 days')
ON CONFLICT (id) DO UPDATE SET
  profile_id = EXCLUDED.profile_id,
  display_name = EXCLUDED.display_name,
  gender = EXCLUDED.gender,
  date_of_birth = EXCLUDED.date_of_birth,
  height_cm = EXCLUDED.height_cm,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  subcaste = EXCLUDED.subcaste,
  dosham = EXCLUDED.dosham,
  education = EXCLUDED.education,
  education_detail = EXCLUDED.education_detail,
  occupation = EXCLUDED.occupation,
  occupation_detail = EXCLUDED.occupation_detail,
  annual_income = EXCLUDED.annual_income,
  company_name = EXCLUDED.company_name,
  city = EXCLUDED.city,
  district = EXCLUDED.district,
  about_me = EXCLUDED.about_me,
  family_type = EXCLUDED.family_type,
  family_status = EXCLUDED.family_status,
  father_occupation = EXCLUDED.father_occupation,
  mother_occupation = EXCLUDED.mother_occupation,
  is_verified = EXCLUDED.is_verified,
  is_premium = EXCLUDED.is_premium,
  is_profile_complete = EXCLUDED.is_profile_complete,
  profile_completion_percent = EXCLUDED.profile_completion_percent,
  last_active_at = EXCLUDED.last_active_at;
INSERT INTO public.profiles (id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, father_occupation, mother_occupation, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at)
VALUES ('00000000-0000-4000-a000-0000000000f4', 'TM000244', 'Kokila Devan', 'female', '1996-04-21', 174, 'never_married', 'Hindu', 'Sengunthar', 'Sengunthar subcaste', 'yes', 'M.Com', 'M.Com Graduate', 'Advocate', 'Advocate Details', '₹7 Lakhs - ₹10 Lakhs', 'Self Employed', 'Kanchipuram', 'Kanchipuram', 'Hi, I am Kokila. I have completed my M.Com and am currently working as a Advocate at Self Employed in Kanchipuram. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'joint', 'upper_middle_class', 'Retired Employee', 'Homemaker', true, true, true, 100, NOW() - INTERVAL '0 days')
ON CONFLICT (id) DO UPDATE SET
  profile_id = EXCLUDED.profile_id,
  display_name = EXCLUDED.display_name,
  gender = EXCLUDED.gender,
  date_of_birth = EXCLUDED.date_of_birth,
  height_cm = EXCLUDED.height_cm,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  subcaste = EXCLUDED.subcaste,
  dosham = EXCLUDED.dosham,
  education = EXCLUDED.education,
  education_detail = EXCLUDED.education_detail,
  occupation = EXCLUDED.occupation,
  occupation_detail = EXCLUDED.occupation_detail,
  annual_income = EXCLUDED.annual_income,
  company_name = EXCLUDED.company_name,
  city = EXCLUDED.city,
  district = EXCLUDED.district,
  about_me = EXCLUDED.about_me,
  family_type = EXCLUDED.family_type,
  family_status = EXCLUDED.family_status,
  father_occupation = EXCLUDED.father_occupation,
  mother_occupation = EXCLUDED.mother_occupation,
  is_verified = EXCLUDED.is_verified,
  is_premium = EXCLUDED.is_premium,
  is_profile_complete = EXCLUDED.is_profile_complete,
  profile_completion_percent = EXCLUDED.profile_completion_percent,
  last_active_at = EXCLUDED.last_active_at;
INSERT INTO public.profiles (id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, father_occupation, mother_occupation, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at)
VALUES ('00000000-0000-4000-a000-0000000000f5', 'TM000245', 'Kabilan Gopal', 'male', '1999-04-24', 166, 'never_married', 'Hindu', 'Sengunthar', 'Sengunthar subcaste', 'no', 'M.B.A', 'M.B.A Graduate', 'HR Specialist', 'HR Specialist Details', '₹10 Lakhs - ₹15 Lakhs', 'Accenture', 'Tirunelveli', 'Tirunelveli', 'Hi, I am Kabilan. I have completed my M.B.A and am currently working as a HR Specialist at Accenture in Tirunelveli. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'joint', 'upper_middle_class', 'Retired Employee', 'Homemaker', true, false, true, 100, NOW() - INTERVAL '4 days')
ON CONFLICT (id) DO UPDATE SET
  profile_id = EXCLUDED.profile_id,
  display_name = EXCLUDED.display_name,
  gender = EXCLUDED.gender,
  date_of_birth = EXCLUDED.date_of_birth,
  height_cm = EXCLUDED.height_cm,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  subcaste = EXCLUDED.subcaste,
  dosham = EXCLUDED.dosham,
  education = EXCLUDED.education,
  education_detail = EXCLUDED.education_detail,
  occupation = EXCLUDED.occupation,
  occupation_detail = EXCLUDED.occupation_detail,
  annual_income = EXCLUDED.annual_income,
  company_name = EXCLUDED.company_name,
  city = EXCLUDED.city,
  district = EXCLUDED.district,
  about_me = EXCLUDED.about_me,
  family_type = EXCLUDED.family_type,
  family_status = EXCLUDED.family_status,
  father_occupation = EXCLUDED.father_occupation,
  mother_occupation = EXCLUDED.mother_occupation,
  is_verified = EXCLUDED.is_verified,
  is_premium = EXCLUDED.is_premium,
  is_profile_complete = EXCLUDED.is_profile_complete,
  profile_completion_percent = EXCLUDED.profile_completion_percent,
  last_active_at = EXCLUDED.last_active_at;
INSERT INTO public.profiles (id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, father_occupation, mother_occupation, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at)
VALUES ('00000000-0000-4000-a000-0000000000f6', 'TM000246', 'Janani Mani', 'female', '2004-02-28', 155, 'never_married', 'Hindu', 'Naidu', NULL, 'no', 'M.B.B.S', 'M.B.B.S Graduate', 'Police Officer', 'Police Officer Details', '₹3 Lakhs - ₹5 Lakhs', 'Cognizant', 'Vellore', 'Vellore', 'Hi, I am Janani. I have completed my M.B.B.S and am currently working as a Police Officer at Cognizant in Vellore. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'middle_class', 'Retired Employee', 'Homemaker', true, false, true, 100, NOW() - INTERVAL '2 days')
ON CONFLICT (id) DO UPDATE SET
  profile_id = EXCLUDED.profile_id,
  display_name = EXCLUDED.display_name,
  gender = EXCLUDED.gender,
  date_of_birth = EXCLUDED.date_of_birth,
  height_cm = EXCLUDED.height_cm,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  subcaste = EXCLUDED.subcaste,
  dosham = EXCLUDED.dosham,
  education = EXCLUDED.education,
  education_detail = EXCLUDED.education_detail,
  occupation = EXCLUDED.occupation,
  occupation_detail = EXCLUDED.occupation_detail,
  annual_income = EXCLUDED.annual_income,
  company_name = EXCLUDED.company_name,
  city = EXCLUDED.city,
  district = EXCLUDED.district,
  about_me = EXCLUDED.about_me,
  family_type = EXCLUDED.family_type,
  family_status = EXCLUDED.family_status,
  father_occupation = EXCLUDED.father_occupation,
  mother_occupation = EXCLUDED.mother_occupation,
  is_verified = EXCLUDED.is_verified,
  is_premium = EXCLUDED.is_premium,
  is_profile_complete = EXCLUDED.is_profile_complete,
  profile_completion_percent = EXCLUDED.profile_completion_percent,
  last_active_at = EXCLUDED.last_active_at;
INSERT INTO public.profiles (id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, father_occupation, mother_occupation, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at)
VALUES ('00000000-0000-4000-a000-0000000000f7', 'TM000247', 'Siddharth Naicker', 'male', '1988-04-15', 166, 'never_married', 'Hindu', 'Vellalar', 'Vellalar subcaste', 'yes', 'M.Com', 'M.Com Graduate', 'HR Specialist', 'HR Specialist Details', '₹3 Lakhs - ₹5 Lakhs', 'Government Service', 'Madurai', 'Madurai', 'Hi, I am Siddharth. I have completed my M.Com and am currently working as a HR Specialist at Government Service in Madurai. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'upper_middle_class', 'Retired Employee', 'Homemaker', true, false, true, 100, NOW() - INTERVAL '3 days')
ON CONFLICT (id) DO UPDATE SET
  profile_id = EXCLUDED.profile_id,
  display_name = EXCLUDED.display_name,
  gender = EXCLUDED.gender,
  date_of_birth = EXCLUDED.date_of_birth,
  height_cm = EXCLUDED.height_cm,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  subcaste = EXCLUDED.subcaste,
  dosham = EXCLUDED.dosham,
  education = EXCLUDED.education,
  education_detail = EXCLUDED.education_detail,
  occupation = EXCLUDED.occupation,
  occupation_detail = EXCLUDED.occupation_detail,
  annual_income = EXCLUDED.annual_income,
  company_name = EXCLUDED.company_name,
  city = EXCLUDED.city,
  district = EXCLUDED.district,
  about_me = EXCLUDED.about_me,
  family_type = EXCLUDED.family_type,
  family_status = EXCLUDED.family_status,
  father_occupation = EXCLUDED.father_occupation,
  mother_occupation = EXCLUDED.mother_occupation,
  is_verified = EXCLUDED.is_verified,
  is_premium = EXCLUDED.is_premium,
  is_profile_complete = EXCLUDED.is_profile_complete,
  profile_completion_percent = EXCLUDED.profile_completion_percent,
  last_active_at = EXCLUDED.last_active_at;
INSERT INTO public.profiles (id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, father_occupation, mother_occupation, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at)
VALUES ('00000000-0000-4000-a000-0000000000f8', 'TM000248', 'Malathi Shankar', 'female', '1996-04-09', 157, 'never_married', 'Hindu', 'Sengunthar', NULL, 'no', 'M.C.A', 'M.C.A Graduate', 'Architect', 'Architect Details', '₹5 Lakhs - ₹7 Lakhs', 'Wipro', 'Thanjavur', 'Thanjavur', 'Hi, I am Malathi. I have completed my M.C.A and am currently working as a Architect at Wipro in Thanjavur. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'joint', 'rich', 'Retired Employee', 'Homemaker', false, false, true, 100, NOW() - INTERVAL '7 days')
ON CONFLICT (id) DO UPDATE SET
  profile_id = EXCLUDED.profile_id,
  display_name = EXCLUDED.display_name,
  gender = EXCLUDED.gender,
  date_of_birth = EXCLUDED.date_of_birth,
  height_cm = EXCLUDED.height_cm,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  subcaste = EXCLUDED.subcaste,
  dosham = EXCLUDED.dosham,
  education = EXCLUDED.education,
  education_detail = EXCLUDED.education_detail,
  occupation = EXCLUDED.occupation,
  occupation_detail = EXCLUDED.occupation_detail,
  annual_income = EXCLUDED.annual_income,
  company_name = EXCLUDED.company_name,
  city = EXCLUDED.city,
  district = EXCLUDED.district,
  about_me = EXCLUDED.about_me,
  family_type = EXCLUDED.family_type,
  family_status = EXCLUDED.family_status,
  father_occupation = EXCLUDED.father_occupation,
  mother_occupation = EXCLUDED.mother_occupation,
  is_verified = EXCLUDED.is_verified,
  is_premium = EXCLUDED.is_premium,
  is_profile_complete = EXCLUDED.is_profile_complete,
  profile_completion_percent = EXCLUDED.profile_completion_percent,
  last_active_at = EXCLUDED.last_active_at;
INSERT INTO public.profiles (id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, father_occupation, mother_occupation, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at)
VALUES ('00000000-0000-4000-a000-0000000000f9', 'TM000249', 'Thirumal Gopal', 'male', '2004-06-20', 177, 'never_married', 'Hindu', 'Devendra Kula Vellalar', 'Devendra Kula Vellalar subcaste', 'yes', 'M.Com', 'M.Com Graduate', 'Architect', 'Architect Details', '₹10 Lakhs - ₹15 Lakhs', 'Government Service', 'Kanchipuram', 'Kanchipuram', 'Hi, I am Thirumal. I have completed my M.Com and am currently working as a Architect at Government Service in Kanchipuram. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'rich', 'Retired Employee', 'Homemaker', true, false, true, 100, NOW() - INTERVAL '4 days')
ON CONFLICT (id) DO UPDATE SET
  profile_id = EXCLUDED.profile_id,
  display_name = EXCLUDED.display_name,
  gender = EXCLUDED.gender,
  date_of_birth = EXCLUDED.date_of_birth,
  height_cm = EXCLUDED.height_cm,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  subcaste = EXCLUDED.subcaste,
  dosham = EXCLUDED.dosham,
  education = EXCLUDED.education,
  education_detail = EXCLUDED.education_detail,
  occupation = EXCLUDED.occupation,
  occupation_detail = EXCLUDED.occupation_detail,
  annual_income = EXCLUDED.annual_income,
  company_name = EXCLUDED.company_name,
  city = EXCLUDED.city,
  district = EXCLUDED.district,
  about_me = EXCLUDED.about_me,
  family_type = EXCLUDED.family_type,
  family_status = EXCLUDED.family_status,
  father_occupation = EXCLUDED.father_occupation,
  mother_occupation = EXCLUDED.mother_occupation,
  is_verified = EXCLUDED.is_verified,
  is_premium = EXCLUDED.is_premium,
  is_profile_complete = EXCLUDED.is_profile_complete,
  profile_completion_percent = EXCLUDED.profile_completion_percent,
  last_active_at = EXCLUDED.last_active_at;
INSERT INTO public.profiles (id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, father_occupation, mother_occupation, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at)
VALUES ('00000000-0000-4000-a000-0000000000fa', 'TM000250', 'Abirami Lingam', 'female', '2003-12-16', 159, 'never_married', 'Hindu', 'Naidu', NULL, 'no', 'B.A', 'B.A Graduate', 'College Professor', 'College Professor Details', '₹10 Lakhs - ₹15 Lakhs', 'TCS', 'Tirunelveli', 'Tirunelveli', 'Hi, I am Abirami. I have completed my B.A and am currently working as a College Professor at TCS in Tirunelveli. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'joint', 'upper_middle_class', 'Retired Employee', 'Homemaker', true, false, true, 100, NOW() - INTERVAL '1 days')
ON CONFLICT (id) DO UPDATE SET
  profile_id = EXCLUDED.profile_id,
  display_name = EXCLUDED.display_name,
  gender = EXCLUDED.gender,
  date_of_birth = EXCLUDED.date_of_birth,
  height_cm = EXCLUDED.height_cm,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  subcaste = EXCLUDED.subcaste,
  dosham = EXCLUDED.dosham,
  education = EXCLUDED.education,
  education_detail = EXCLUDED.education_detail,
  occupation = EXCLUDED.occupation,
  occupation_detail = EXCLUDED.occupation_detail,
  annual_income = EXCLUDED.annual_income,
  company_name = EXCLUDED.company_name,
  city = EXCLUDED.city,
  district = EXCLUDED.district,
  about_me = EXCLUDED.about_me,
  family_type = EXCLUDED.family_type,
  family_status = EXCLUDED.family_status,
  father_occupation = EXCLUDED.father_occupation,
  mother_occupation = EXCLUDED.mother_occupation,
  is_verified = EXCLUDED.is_verified,
  is_premium = EXCLUDED.is_premium,
  is_profile_complete = EXCLUDED.is_profile_complete,
  profile_completion_percent = EXCLUDED.profile_completion_percent,
  last_active_at = EXCLUDED.last_active_at;
INSERT INTO public.profiles (id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, father_occupation, mother_occupation, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at)
VALUES ('00000000-0000-4000-a000-0000000000fb', 'TM000251', 'Chinnasamy Moorthy', 'male', '2003-08-05', 187, 'never_married', 'Hindu', 'Brahmin - Iyengar', NULL, 'no', 'M.A', 'M.A Graduate', 'Advocate', 'Advocate Details', '₹15 Lakhs - ₹20 Lakhs', 'Cognizant', 'Thoothukudi', 'Tuticorin', 'Hi, I am Chinnasamy. I have completed my M.A and am currently working as a Advocate at Cognizant in Thoothukudi. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'rich', 'Retired Employee', 'Homemaker', false, false, true, 100, NOW() - INTERVAL '2 days')
ON CONFLICT (id) DO UPDATE SET
  profile_id = EXCLUDED.profile_id,
  display_name = EXCLUDED.display_name,
  gender = EXCLUDED.gender,
  date_of_birth = EXCLUDED.date_of_birth,
  height_cm = EXCLUDED.height_cm,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  subcaste = EXCLUDED.subcaste,
  dosham = EXCLUDED.dosham,
  education = EXCLUDED.education,
  education_detail = EXCLUDED.education_detail,
  occupation = EXCLUDED.occupation,
  occupation_detail = EXCLUDED.occupation_detail,
  annual_income = EXCLUDED.annual_income,
  company_name = EXCLUDED.company_name,
  city = EXCLUDED.city,
  district = EXCLUDED.district,
  about_me = EXCLUDED.about_me,
  family_type = EXCLUDED.family_type,
  family_status = EXCLUDED.family_status,
  father_occupation = EXCLUDED.father_occupation,
  mother_occupation = EXCLUDED.mother_occupation,
  is_verified = EXCLUDED.is_verified,
  is_premium = EXCLUDED.is_premium,
  is_profile_complete = EXCLUDED.is_profile_complete,
  profile_completion_percent = EXCLUDED.profile_completion_percent,
  last_active_at = EXCLUDED.last_active_at;
INSERT INTO public.profiles (id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, father_occupation, mother_occupation, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at)
VALUES ('00000000-0000-4000-a000-0000000000fc', 'TM000252', 'Kokila Sundaram', 'female', '2000-06-25', 157, 'divorced', 'Hindu', 'Devendra Kula Vellalar', NULL, 'no', 'M.A', 'M.A Graduate', 'Government Officer', 'Government Officer Details', '₹3 Lakhs - ₹5 Lakhs', 'Self Employed', 'Tiruchirappalli', 'Trichy', 'Hi, I am Kokila. I have completed my M.A and am currently working as a Government Officer at Self Employed in Tiruchirappalli. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'middle_class', 'Retired Employee', 'Homemaker', true, false, true, 100, NOW() - INTERVAL '8 days')
ON CONFLICT (id) DO UPDATE SET
  profile_id = EXCLUDED.profile_id,
  display_name = EXCLUDED.display_name,
  gender = EXCLUDED.gender,
  date_of_birth = EXCLUDED.date_of_birth,
  height_cm = EXCLUDED.height_cm,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  subcaste = EXCLUDED.subcaste,
  dosham = EXCLUDED.dosham,
  education = EXCLUDED.education,
  education_detail = EXCLUDED.education_detail,
  occupation = EXCLUDED.occupation,
  occupation_detail = EXCLUDED.occupation_detail,
  annual_income = EXCLUDED.annual_income,
  company_name = EXCLUDED.company_name,
  city = EXCLUDED.city,
  district = EXCLUDED.district,
  about_me = EXCLUDED.about_me,
  family_type = EXCLUDED.family_type,
  family_status = EXCLUDED.family_status,
  father_occupation = EXCLUDED.father_occupation,
  mother_occupation = EXCLUDED.mother_occupation,
  is_verified = EXCLUDED.is_verified,
  is_premium = EXCLUDED.is_premium,
  is_profile_complete = EXCLUDED.is_profile_complete,
  profile_completion_percent = EXCLUDED.profile_completion_percent,
  last_active_at = EXCLUDED.last_active_at;
INSERT INTO public.profiles (id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, father_occupation, mother_occupation, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at)
VALUES ('00000000-0000-4000-a000-0000000000fd', 'TM000253', 'Karthik Krishnan', 'male', '2004-05-05', 170, 'never_married', 'Hindu', 'Vellalar', NULL, 'no', 'M.Sc', 'M.Sc Graduate', 'HR Specialist', 'HR Specialist Details', '₹3 Lakhs - ₹5 Lakhs', 'TCS', 'Tirunelveli', 'Tirunelveli', 'Hi, I am Karthik. I have completed my M.Sc and am currently working as a HR Specialist at TCS in Tirunelveli. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'rich', 'Retired Employee', 'Homemaker', true, false, true, 100, NOW() - INTERVAL '10 days')
ON CONFLICT (id) DO UPDATE SET
  profile_id = EXCLUDED.profile_id,
  display_name = EXCLUDED.display_name,
  gender = EXCLUDED.gender,
  date_of_birth = EXCLUDED.date_of_birth,
  height_cm = EXCLUDED.height_cm,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  subcaste = EXCLUDED.subcaste,
  dosham = EXCLUDED.dosham,
  education = EXCLUDED.education,
  education_detail = EXCLUDED.education_detail,
  occupation = EXCLUDED.occupation,
  occupation_detail = EXCLUDED.occupation_detail,
  annual_income = EXCLUDED.annual_income,
  company_name = EXCLUDED.company_name,
  city = EXCLUDED.city,
  district = EXCLUDED.district,
  about_me = EXCLUDED.about_me,
  family_type = EXCLUDED.family_type,
  family_status = EXCLUDED.family_status,
  father_occupation = EXCLUDED.father_occupation,
  mother_occupation = EXCLUDED.mother_occupation,
  is_verified = EXCLUDED.is_verified,
  is_premium = EXCLUDED.is_premium,
  is_profile_complete = EXCLUDED.is_profile_complete,
  profile_completion_percent = EXCLUDED.profile_completion_percent,
  last_active_at = EXCLUDED.last_active_at;
INSERT INTO public.profiles (id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, father_occupation, mother_occupation, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at)
VALUES ('00000000-0000-4000-a000-0000000000fe', 'TM000254', 'Rajeshwari Murthy', 'female', '1989-01-27', 165, 'never_married', 'Hindu', 'Adi Dravida', NULL, 'no', 'B.Com', 'B.Com Graduate', 'Architect', 'Architect Details', '₹5 Lakhs - ₹7 Lakhs', 'TCS', 'Madurai', 'Madurai', 'Hi, I am Rajeshwari. I have completed my B.Com and am currently working as a Architect at TCS in Madurai. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'joint', 'upper_middle_class', 'Retired Employee', 'Homemaker', false, false, true, 100, NOW() - INTERVAL '10 days')
ON CONFLICT (id) DO UPDATE SET
  profile_id = EXCLUDED.profile_id,
  display_name = EXCLUDED.display_name,
  gender = EXCLUDED.gender,
  date_of_birth = EXCLUDED.date_of_birth,
  height_cm = EXCLUDED.height_cm,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  subcaste = EXCLUDED.subcaste,
  dosham = EXCLUDED.dosham,
  education = EXCLUDED.education,
  education_detail = EXCLUDED.education_detail,
  occupation = EXCLUDED.occupation,
  occupation_detail = EXCLUDED.occupation_detail,
  annual_income = EXCLUDED.annual_income,
  company_name = EXCLUDED.company_name,
  city = EXCLUDED.city,
  district = EXCLUDED.district,
  about_me = EXCLUDED.about_me,
  family_type = EXCLUDED.family_type,
  family_status = EXCLUDED.family_status,
  father_occupation = EXCLUDED.father_occupation,
  mother_occupation = EXCLUDED.mother_occupation,
  is_verified = EXCLUDED.is_verified,
  is_premium = EXCLUDED.is_premium,
  is_profile_complete = EXCLUDED.is_profile_complete,
  profile_completion_percent = EXCLUDED.profile_completion_percent,
  last_active_at = EXCLUDED.last_active_at;
INSERT INTO public.profiles (id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, father_occupation, mother_occupation, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at)
VALUES ('00000000-0000-4000-a000-0000000000ff', 'TM000255', 'Senthil Raj', 'male', '2002-10-25', 167, 'never_married', 'Hindu', 'Brahmin - Iyengar', 'Brahmin - Iyengar subcaste', 'no', 'M.C.A', 'M.C.A Graduate', 'HR Specialist', 'HR Specialist Details', '₹15 Lakhs - ₹20 Lakhs', 'Wipro', 'Salem', 'Salem', 'Hi, I am Senthil. I have completed my M.C.A and am currently working as a HR Specialist at Wipro in Salem. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'upper_middle_class', 'Retired Employee', 'Homemaker', true, false, true, 100, NOW() - INTERVAL '0 days')
ON CONFLICT (id) DO UPDATE SET
  profile_id = EXCLUDED.profile_id,
  display_name = EXCLUDED.display_name,
  gender = EXCLUDED.gender,
  date_of_birth = EXCLUDED.date_of_birth,
  height_cm = EXCLUDED.height_cm,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  subcaste = EXCLUDED.subcaste,
  dosham = EXCLUDED.dosham,
  education = EXCLUDED.education,
  education_detail = EXCLUDED.education_detail,
  occupation = EXCLUDED.occupation,
  occupation_detail = EXCLUDED.occupation_detail,
  annual_income = EXCLUDED.annual_income,
  company_name = EXCLUDED.company_name,
  city = EXCLUDED.city,
  district = EXCLUDED.district,
  about_me = EXCLUDED.about_me,
  family_type = EXCLUDED.family_type,
  family_status = EXCLUDED.family_status,
  father_occupation = EXCLUDED.father_occupation,
  mother_occupation = EXCLUDED.mother_occupation,
  is_verified = EXCLUDED.is_verified,
  is_premium = EXCLUDED.is_premium,
  is_profile_complete = EXCLUDED.is_profile_complete,
  profile_completion_percent = EXCLUDED.profile_completion_percent,
  last_active_at = EXCLUDED.last_active_at;
INSERT INTO public.profiles (id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, father_occupation, mother_occupation, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at)
VALUES ('00000000-0000-4000-a000-000000000100', 'TM000256', 'Megala Pandian', 'female', '1999-03-21', 150, 'divorced', 'Hindu', 'Arunthathiyar', NULL, 'no', 'M.B.B.S', 'M.B.B.S Graduate', 'Dentist', 'Dentist Details', '₹7 Lakhs - ₹10 Lakhs', 'Private Practice', 'Salem', 'Salem', 'Hi, I am Megala. I have completed my M.B.B.S and am currently working as a Dentist at Private Practice in Salem. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'joint', 'upper_middle_class', 'Retired Employee', 'Homemaker', true, false, true, 100, NOW() - INTERVAL '2 days')
ON CONFLICT (id) DO UPDATE SET
  profile_id = EXCLUDED.profile_id,
  display_name = EXCLUDED.display_name,
  gender = EXCLUDED.gender,
  date_of_birth = EXCLUDED.date_of_birth,
  height_cm = EXCLUDED.height_cm,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  subcaste = EXCLUDED.subcaste,
  dosham = EXCLUDED.dosham,
  education = EXCLUDED.education,
  education_detail = EXCLUDED.education_detail,
  occupation = EXCLUDED.occupation,
  occupation_detail = EXCLUDED.occupation_detail,
  annual_income = EXCLUDED.annual_income,
  company_name = EXCLUDED.company_name,
  city = EXCLUDED.city,
  district = EXCLUDED.district,
  about_me = EXCLUDED.about_me,
  family_type = EXCLUDED.family_type,
  family_status = EXCLUDED.family_status,
  father_occupation = EXCLUDED.father_occupation,
  mother_occupation = EXCLUDED.mother_occupation,
  is_verified = EXCLUDED.is_verified,
  is_premium = EXCLUDED.is_premium,
  is_profile_complete = EXCLUDED.is_profile_complete,
  profile_completion_percent = EXCLUDED.profile_completion_percent,
  last_active_at = EXCLUDED.last_active_at;
INSERT INTO public.profiles (id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, father_occupation, mother_occupation, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at)
VALUES ('00000000-0000-4000-a000-000000000101', 'TM000257', 'Sundar Naicker', 'male', '1993-07-19', 168, 'never_married', 'Hindu', 'Adi Dravida', 'Adi Dravida subcaste', 'no', 'B.E. / B.Tech', 'B.E. / B.Tech Graduate', 'Doctor', 'Doctor Details', '₹15 Lakhs - ₹20 Lakhs', 'Zoho', 'Coimbatore', 'Coimbatore', 'Hi, I am Sundar. I have completed my B.E. / B.Tech and am currently working as a Doctor at Zoho in Coimbatore. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'joint', 'rich', 'Retired Employee', 'Homemaker', true, false, true, 100, NOW() - INTERVAL '8 days')
ON CONFLICT (id) DO UPDATE SET
  profile_id = EXCLUDED.profile_id,
  display_name = EXCLUDED.display_name,
  gender = EXCLUDED.gender,
  date_of_birth = EXCLUDED.date_of_birth,
  height_cm = EXCLUDED.height_cm,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  subcaste = EXCLUDED.subcaste,
  dosham = EXCLUDED.dosham,
  education = EXCLUDED.education,
  education_detail = EXCLUDED.education_detail,
  occupation = EXCLUDED.occupation,
  occupation_detail = EXCLUDED.occupation_detail,
  annual_income = EXCLUDED.annual_income,
  company_name = EXCLUDED.company_name,
  city = EXCLUDED.city,
  district = EXCLUDED.district,
  about_me = EXCLUDED.about_me,
  family_type = EXCLUDED.family_type,
  family_status = EXCLUDED.family_status,
  father_occupation = EXCLUDED.father_occupation,
  mother_occupation = EXCLUDED.mother_occupation,
  is_verified = EXCLUDED.is_verified,
  is_premium = EXCLUDED.is_premium,
  is_profile_complete = EXCLUDED.is_profile_complete,
  profile_completion_percent = EXCLUDED.profile_completion_percent,
  last_active_at = EXCLUDED.last_active_at;
INSERT INTO public.profiles (id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, father_occupation, mother_occupation, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at)
VALUES ('00000000-0000-4000-a000-000000000102', 'TM000258', 'Ponmani Gopal', 'female', '2003-03-21', 164, 'divorced', 'Hindu', 'Vanniyar', NULL, 'no', 'B.Sc', 'B.Sc Graduate', 'Business Owner', 'Business Owner Details', '₹20 Lakhs+', 'Accenture', 'Chennai', 'Chennai', 'Hi, I am Ponmani. I have completed my B.Sc and am currently working as a Business Owner at Accenture in Chennai. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'middle_class', 'Retired Employee', 'Homemaker', true, false, true, 100, NOW() - INTERVAL '7 days')
ON CONFLICT (id) DO UPDATE SET
  profile_id = EXCLUDED.profile_id,
  display_name = EXCLUDED.display_name,
  gender = EXCLUDED.gender,
  date_of_birth = EXCLUDED.date_of_birth,
  height_cm = EXCLUDED.height_cm,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  subcaste = EXCLUDED.subcaste,
  dosham = EXCLUDED.dosham,
  education = EXCLUDED.education,
  education_detail = EXCLUDED.education_detail,
  occupation = EXCLUDED.occupation,
  occupation_detail = EXCLUDED.occupation_detail,
  annual_income = EXCLUDED.annual_income,
  company_name = EXCLUDED.company_name,
  city = EXCLUDED.city,
  district = EXCLUDED.district,
  about_me = EXCLUDED.about_me,
  family_type = EXCLUDED.family_type,
  family_status = EXCLUDED.family_status,
  father_occupation = EXCLUDED.father_occupation,
  mother_occupation = EXCLUDED.mother_occupation,
  is_verified = EXCLUDED.is_verified,
  is_premium = EXCLUDED.is_premium,
  is_profile_complete = EXCLUDED.is_profile_complete,
  profile_completion_percent = EXCLUDED.profile_completion_percent,
  last_active_at = EXCLUDED.last_active_at;
INSERT INTO public.profiles (id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, father_occupation, mother_occupation, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at)
VALUES ('00000000-0000-4000-a000-000000000103', 'TM000259', 'Gautham Krishnan', 'male', '1995-05-17', 163, 'never_married', 'Hindu', 'Chettiar', 'Chettiar subcaste', 'yes', 'M.A', 'M.A Graduate', 'Civil Engineer', 'Civil Engineer Details', '₹15 Lakhs - ₹20 Lakhs', 'Zoho', 'Erode', 'Erode', 'Hi, I am Gautham. I have completed my M.A and am currently working as a Civil Engineer at Zoho in Erode. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'joint', 'rich', 'Retired Employee', 'Homemaker', true, false, true, 100, NOW() - INTERVAL '1 days')
ON CONFLICT (id) DO UPDATE SET
  profile_id = EXCLUDED.profile_id,
  display_name = EXCLUDED.display_name,
  gender = EXCLUDED.gender,
  date_of_birth = EXCLUDED.date_of_birth,
  height_cm = EXCLUDED.height_cm,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  subcaste = EXCLUDED.subcaste,
  dosham = EXCLUDED.dosham,
  education = EXCLUDED.education,
  education_detail = EXCLUDED.education_detail,
  occupation = EXCLUDED.occupation,
  occupation_detail = EXCLUDED.occupation_detail,
  annual_income = EXCLUDED.annual_income,
  company_name = EXCLUDED.company_name,
  city = EXCLUDED.city,
  district = EXCLUDED.district,
  about_me = EXCLUDED.about_me,
  family_type = EXCLUDED.family_type,
  family_status = EXCLUDED.family_status,
  father_occupation = EXCLUDED.father_occupation,
  mother_occupation = EXCLUDED.mother_occupation,
  is_verified = EXCLUDED.is_verified,
  is_premium = EXCLUDED.is_premium,
  is_profile_complete = EXCLUDED.is_profile_complete,
  profile_completion_percent = EXCLUDED.profile_completion_percent,
  last_active_at = EXCLUDED.last_active_at;
INSERT INTO public.profiles (id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, father_occupation, mother_occupation, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at)
VALUES ('00000000-0000-4000-a000-000000000104', 'TM000260', 'Shalini Raj', 'female', '2001-06-02', 164, 'never_married', 'Christian', 'Vellalar Christian', NULL, 'no', 'M.B.A', 'M.B.A Graduate', 'College Professor', 'College Professor Details', '₹5 Lakhs - ₹7 Lakhs', 'TCS', 'Kanchipuram', 'Kanchipuram', 'Hi, I am Shalini. I have completed my M.B.A and am currently working as a College Professor at TCS in Kanchipuram. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'middle_class', 'Retired Employee', 'Homemaker', true, true, true, 100, NOW() - INTERVAL '9 days')
ON CONFLICT (id) DO UPDATE SET
  profile_id = EXCLUDED.profile_id,
  display_name = EXCLUDED.display_name,
  gender = EXCLUDED.gender,
  date_of_birth = EXCLUDED.date_of_birth,
  height_cm = EXCLUDED.height_cm,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  subcaste = EXCLUDED.subcaste,
  dosham = EXCLUDED.dosham,
  education = EXCLUDED.education,
  education_detail = EXCLUDED.education_detail,
  occupation = EXCLUDED.occupation,
  occupation_detail = EXCLUDED.occupation_detail,
  annual_income = EXCLUDED.annual_income,
  company_name = EXCLUDED.company_name,
  city = EXCLUDED.city,
  district = EXCLUDED.district,
  about_me = EXCLUDED.about_me,
  family_type = EXCLUDED.family_type,
  family_status = EXCLUDED.family_status,
  father_occupation = EXCLUDED.father_occupation,
  mother_occupation = EXCLUDED.mother_occupation,
  is_verified = EXCLUDED.is_verified,
  is_premium = EXCLUDED.is_premium,
  is_profile_complete = EXCLUDED.is_profile_complete,
  profile_completion_percent = EXCLUDED.profile_completion_percent,
  last_active_at = EXCLUDED.last_active_at;
INSERT INTO public.profiles (id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, father_occupation, mother_occupation, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at)
VALUES ('00000000-0000-4000-a000-000000000105', 'TM000261', 'Mohan Balan', 'male', '2005-10-02', 177, 'never_married', 'Hindu', 'Vanniyar', 'Vanniyar subcaste', 'no', 'M.C.A', 'M.C.A Graduate', 'Mechanical Engineer', 'Mechanical Engineer Details', '₹5 Lakhs - ₹7 Lakhs', 'Infosys', 'Tiruppur', 'Tiruppur', 'Hi, I am Mohan. I have completed my M.C.A and am currently working as a Mechanical Engineer at Infosys in Tiruppur. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'middle_class', 'Retired Employee', 'Homemaker', false, false, true, 100, NOW() - INTERVAL '1 days')
ON CONFLICT (id) DO UPDATE SET
  profile_id = EXCLUDED.profile_id,
  display_name = EXCLUDED.display_name,
  gender = EXCLUDED.gender,
  date_of_birth = EXCLUDED.date_of_birth,
  height_cm = EXCLUDED.height_cm,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  subcaste = EXCLUDED.subcaste,
  dosham = EXCLUDED.dosham,
  education = EXCLUDED.education,
  education_detail = EXCLUDED.education_detail,
  occupation = EXCLUDED.occupation,
  occupation_detail = EXCLUDED.occupation_detail,
  annual_income = EXCLUDED.annual_income,
  company_name = EXCLUDED.company_name,
  city = EXCLUDED.city,
  district = EXCLUDED.district,
  about_me = EXCLUDED.about_me,
  family_type = EXCLUDED.family_type,
  family_status = EXCLUDED.family_status,
  father_occupation = EXCLUDED.father_occupation,
  mother_occupation = EXCLUDED.mother_occupation,
  is_verified = EXCLUDED.is_verified,
  is_premium = EXCLUDED.is_premium,
  is_profile_complete = EXCLUDED.is_profile_complete,
  profile_completion_percent = EXCLUDED.profile_completion_percent,
  last_active_at = EXCLUDED.last_active_at;
INSERT INTO public.profiles (id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, father_occupation, mother_occupation, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at)
VALUES ('00000000-0000-4000-a000-000000000106', 'TM000262', 'Harini Devan', 'female', '1995-04-14', 161, 'divorced', 'Hindu', 'Kallar', NULL, 'no', 'B.E. / B.Tech', 'B.E. / B.Tech Graduate', 'Advocate', 'Advocate Details', '₹20 Lakhs+', 'Wipro', 'Erode', 'Erode', 'Hi, I am Harini. I have completed my B.E. / B.Tech and am currently working as a Advocate at Wipro in Erode. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'joint', 'rich', 'Retired Employee', 'Homemaker', true, true, true, 100, NOW() - INTERVAL '1 days')
ON CONFLICT (id) DO UPDATE SET
  profile_id = EXCLUDED.profile_id,
  display_name = EXCLUDED.display_name,
  gender = EXCLUDED.gender,
  date_of_birth = EXCLUDED.date_of_birth,
  height_cm = EXCLUDED.height_cm,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  subcaste = EXCLUDED.subcaste,
  dosham = EXCLUDED.dosham,
  education = EXCLUDED.education,
  education_detail = EXCLUDED.education_detail,
  occupation = EXCLUDED.occupation,
  occupation_detail = EXCLUDED.occupation_detail,
  annual_income = EXCLUDED.annual_income,
  company_name = EXCLUDED.company_name,
  city = EXCLUDED.city,
  district = EXCLUDED.district,
  about_me = EXCLUDED.about_me,
  family_type = EXCLUDED.family_type,
  family_status = EXCLUDED.family_status,
  father_occupation = EXCLUDED.father_occupation,
  mother_occupation = EXCLUDED.mother_occupation,
  is_verified = EXCLUDED.is_verified,
  is_premium = EXCLUDED.is_premium,
  is_profile_complete = EXCLUDED.is_profile_complete,
  profile_completion_percent = EXCLUDED.profile_completion_percent,
  last_active_at = EXCLUDED.last_active_at;
INSERT INTO public.profiles (id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, father_occupation, mother_occupation, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at)
VALUES ('00000000-0000-4000-a000-000000000107', 'TM000263', 'Srinivasan Krishnan', 'male', '1996-05-04', 174, 'never_married', 'Hindu', 'Mudaliar', NULL, 'no', 'M.B.A', 'M.B.A Graduate', 'Bank Manager', 'Bank Manager Details', '₹10 Lakhs - ₹15 Lakhs', 'TCS', 'Thoothukudi', 'Tuticorin', 'Hi, I am Srinivasan. I have completed my M.B.A and am currently working as a Bank Manager at TCS in Thoothukudi. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'middle_class', 'Retired Employee', 'Homemaker', false, false, true, 100, NOW() - INTERVAL '6 days')
ON CONFLICT (id) DO UPDATE SET
  profile_id = EXCLUDED.profile_id,
  display_name = EXCLUDED.display_name,
  gender = EXCLUDED.gender,
  date_of_birth = EXCLUDED.date_of_birth,
  height_cm = EXCLUDED.height_cm,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  subcaste = EXCLUDED.subcaste,
  dosham = EXCLUDED.dosham,
  education = EXCLUDED.education,
  education_detail = EXCLUDED.education_detail,
  occupation = EXCLUDED.occupation,
  occupation_detail = EXCLUDED.occupation_detail,
  annual_income = EXCLUDED.annual_income,
  company_name = EXCLUDED.company_name,
  city = EXCLUDED.city,
  district = EXCLUDED.district,
  about_me = EXCLUDED.about_me,
  family_type = EXCLUDED.family_type,
  family_status = EXCLUDED.family_status,
  father_occupation = EXCLUDED.father_occupation,
  mother_occupation = EXCLUDED.mother_occupation,
  is_verified = EXCLUDED.is_verified,
  is_premium = EXCLUDED.is_premium,
  is_profile_complete = EXCLUDED.is_profile_complete,
  profile_completion_percent = EXCLUDED.profile_completion_percent,
  last_active_at = EXCLUDED.last_active_at;
INSERT INTO public.profiles (id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, father_occupation, mother_occupation, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at)
VALUES ('00000000-0000-4000-a000-000000000108', 'TM000264', 'Priya Naicker', 'female', '1994-07-06', 167, 'never_married', 'Hindu', 'Vanniyar', NULL, 'no', 'M.B.A', 'M.B.A Graduate', 'Architect', 'Architect Details', '₹15 Lakhs - ₹20 Lakhs', 'Wipro', 'Tiruchirappalli', 'Trichy', 'Hi, I am Priya. I have completed my M.B.A and am currently working as a Architect at Wipro in Tiruchirappalli. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'upper_middle_class', 'Retired Employee', 'Homemaker', false, false, true, 100, NOW() - INTERVAL '8 days')
ON CONFLICT (id) DO UPDATE SET
  profile_id = EXCLUDED.profile_id,
  display_name = EXCLUDED.display_name,
  gender = EXCLUDED.gender,
  date_of_birth = EXCLUDED.date_of_birth,
  height_cm = EXCLUDED.height_cm,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  subcaste = EXCLUDED.subcaste,
  dosham = EXCLUDED.dosham,
  education = EXCLUDED.education,
  education_detail = EXCLUDED.education_detail,
  occupation = EXCLUDED.occupation,
  occupation_detail = EXCLUDED.occupation_detail,
  annual_income = EXCLUDED.annual_income,
  company_name = EXCLUDED.company_name,
  city = EXCLUDED.city,
  district = EXCLUDED.district,
  about_me = EXCLUDED.about_me,
  family_type = EXCLUDED.family_type,
  family_status = EXCLUDED.family_status,
  father_occupation = EXCLUDED.father_occupation,
  mother_occupation = EXCLUDED.mother_occupation,
  is_verified = EXCLUDED.is_verified,
  is_premium = EXCLUDED.is_premium,
  is_profile_complete = EXCLUDED.is_profile_complete,
  profile_completion_percent = EXCLUDED.profile_completion_percent,
  last_active_at = EXCLUDED.last_active_at;
INSERT INTO public.profiles (id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, father_occupation, mother_occupation, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at)
VALUES ('00000000-0000-4000-a000-000000000109', 'TM000265', 'Karthik Raj', 'male', '2004-10-18', 163, 'never_married', 'Hindu', 'Naidu', 'Naidu subcaste', 'yes', 'B.Ed', 'B.Ed Graduate', 'School Teacher', 'School Teacher Details', '₹20 Lakhs+', 'TCS', 'Kanchipuram', 'Kanchipuram', 'Hi, I am Karthik. I have completed my B.Ed and am currently working as a School Teacher at TCS in Kanchipuram. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'rich', 'Retired Employee', 'Homemaker', true, false, true, 100, NOW() - INTERVAL '8 days')
ON CONFLICT (id) DO UPDATE SET
  profile_id = EXCLUDED.profile_id,
  display_name = EXCLUDED.display_name,
  gender = EXCLUDED.gender,
  date_of_birth = EXCLUDED.date_of_birth,
  height_cm = EXCLUDED.height_cm,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  subcaste = EXCLUDED.subcaste,
  dosham = EXCLUDED.dosham,
  education = EXCLUDED.education,
  education_detail = EXCLUDED.education_detail,
  occupation = EXCLUDED.occupation,
  occupation_detail = EXCLUDED.occupation_detail,
  annual_income = EXCLUDED.annual_income,
  company_name = EXCLUDED.company_name,
  city = EXCLUDED.city,
  district = EXCLUDED.district,
  about_me = EXCLUDED.about_me,
  family_type = EXCLUDED.family_type,
  family_status = EXCLUDED.family_status,
  father_occupation = EXCLUDED.father_occupation,
  mother_occupation = EXCLUDED.mother_occupation,
  is_verified = EXCLUDED.is_verified,
  is_premium = EXCLUDED.is_premium,
  is_profile_complete = EXCLUDED.is_profile_complete,
  profile_completion_percent = EXCLUDED.profile_completion_percent,
  last_active_at = EXCLUDED.last_active_at;
INSERT INTO public.profiles (id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, father_occupation, mother_occupation, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at)
VALUES ('00000000-0000-4000-a000-00000000010a', 'TM000266', 'Pooja Balan', 'female', '1998-09-13', 151, 'never_married', 'Hindu', 'Yadav', NULL, 'no', 'B.Com', 'B.Com Graduate', 'Auditor', 'Auditor Details', '₹10 Lakhs - ₹15 Lakhs', 'Government Service', 'Salem', 'Salem', 'Hi, I am Pooja. I have completed my B.Com and am currently working as a Auditor at Government Service in Salem. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'upper_middle_class', 'Retired Employee', 'Homemaker', false, true, true, 100, NOW() - INTERVAL '2 days')
ON CONFLICT (id) DO UPDATE SET
  profile_id = EXCLUDED.profile_id,
  display_name = EXCLUDED.display_name,
  gender = EXCLUDED.gender,
  date_of_birth = EXCLUDED.date_of_birth,
  height_cm = EXCLUDED.height_cm,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  subcaste = EXCLUDED.subcaste,
  dosham = EXCLUDED.dosham,
  education = EXCLUDED.education,
  education_detail = EXCLUDED.education_detail,
  occupation = EXCLUDED.occupation,
  occupation_detail = EXCLUDED.occupation_detail,
  annual_income = EXCLUDED.annual_income,
  company_name = EXCLUDED.company_name,
  city = EXCLUDED.city,
  district = EXCLUDED.district,
  about_me = EXCLUDED.about_me,
  family_type = EXCLUDED.family_type,
  family_status = EXCLUDED.family_status,
  father_occupation = EXCLUDED.father_occupation,
  mother_occupation = EXCLUDED.mother_occupation,
  is_verified = EXCLUDED.is_verified,
  is_premium = EXCLUDED.is_premium,
  is_profile_complete = EXCLUDED.is_profile_complete,
  profile_completion_percent = EXCLUDED.profile_completion_percent,
  last_active_at = EXCLUDED.last_active_at;
INSERT INTO public.profiles (id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, father_occupation, mother_occupation, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at)
VALUES ('00000000-0000-4000-a000-00000000010b', 'TM000267', 'Surya Lingam', 'male', '1991-01-07', 177, 'never_married', 'Hindu', 'Adi Dravida', 'Adi Dravida subcaste', 'no', 'B.Ed', 'B.Ed Graduate', 'Civil Engineer', 'Civil Engineer Details', '₹5 Lakhs - ₹7 Lakhs', 'HCL', 'Salem', 'Salem', 'Hi, I am Surya. I have completed my B.Ed and am currently working as a Civil Engineer at HCL in Salem. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'middle_class', 'Retired Employee', 'Homemaker', true, false, true, 100, NOW() - INTERVAL '10 days')
ON CONFLICT (id) DO UPDATE SET
  profile_id = EXCLUDED.profile_id,
  display_name = EXCLUDED.display_name,
  gender = EXCLUDED.gender,
  date_of_birth = EXCLUDED.date_of_birth,
  height_cm = EXCLUDED.height_cm,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  subcaste = EXCLUDED.subcaste,
  dosham = EXCLUDED.dosham,
  education = EXCLUDED.education,
  education_detail = EXCLUDED.education_detail,
  occupation = EXCLUDED.occupation,
  occupation_detail = EXCLUDED.occupation_detail,
  annual_income = EXCLUDED.annual_income,
  company_name = EXCLUDED.company_name,
  city = EXCLUDED.city,
  district = EXCLUDED.district,
  about_me = EXCLUDED.about_me,
  family_type = EXCLUDED.family_type,
  family_status = EXCLUDED.family_status,
  father_occupation = EXCLUDED.father_occupation,
  mother_occupation = EXCLUDED.mother_occupation,
  is_verified = EXCLUDED.is_verified,
  is_premium = EXCLUDED.is_premium,
  is_profile_complete = EXCLUDED.is_profile_complete,
  profile_completion_percent = EXCLUDED.profile_completion_percent,
  last_active_at = EXCLUDED.last_active_at;
INSERT INTO public.profiles (id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, father_occupation, mother_occupation, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at)
VALUES ('00000000-0000-4000-a000-00000000010c', 'TM000268', 'Ramya Selvan', 'female', '1994-05-24', 169, 'divorced', 'Hindu', 'Vellalar', NULL, 'no', 'B.Com', 'B.Com Graduate', 'Business Owner', 'Business Owner Details', '₹3 Lakhs - ₹5 Lakhs', 'TCS', 'Tiruchirappalli', 'Trichy', 'Hi, I am Ramya. I have completed my B.Com and am currently working as a Business Owner at TCS in Tiruchirappalli. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'upper_middle_class', 'Retired Employee', 'Homemaker', true, true, true, 100, NOW() - INTERVAL '2 days')
ON CONFLICT (id) DO UPDATE SET
  profile_id = EXCLUDED.profile_id,
  display_name = EXCLUDED.display_name,
  gender = EXCLUDED.gender,
  date_of_birth = EXCLUDED.date_of_birth,
  height_cm = EXCLUDED.height_cm,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  subcaste = EXCLUDED.subcaste,
  dosham = EXCLUDED.dosham,
  education = EXCLUDED.education,
  education_detail = EXCLUDED.education_detail,
  occupation = EXCLUDED.occupation,
  occupation_detail = EXCLUDED.occupation_detail,
  annual_income = EXCLUDED.annual_income,
  company_name = EXCLUDED.company_name,
  city = EXCLUDED.city,
  district = EXCLUDED.district,
  about_me = EXCLUDED.about_me,
  family_type = EXCLUDED.family_type,
  family_status = EXCLUDED.family_status,
  father_occupation = EXCLUDED.father_occupation,
  mother_occupation = EXCLUDED.mother_occupation,
  is_verified = EXCLUDED.is_verified,
  is_premium = EXCLUDED.is_premium,
  is_profile_complete = EXCLUDED.is_profile_complete,
  profile_completion_percent = EXCLUDED.profile_completion_percent,
  last_active_at = EXCLUDED.last_active_at;
INSERT INTO public.profiles (id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, father_occupation, mother_occupation, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at)
VALUES ('00000000-0000-4000-a000-00000000010d', 'TM000269', 'Hari Mani', 'male', '2000-08-20', 181, 'never_married', 'Hindu', 'Adi Dravida', 'Adi Dravida subcaste', 'no', 'Ph.D', 'Ph.D Graduate', 'Architect', 'Architect Details', '₹7 Lakhs - ₹10 Lakhs', 'Government Service', 'Coimbatore', 'Coimbatore', 'Hi, I am Hari. I have completed my Ph.D and am currently working as a Architect at Government Service in Coimbatore. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'middle_class', 'Retired Employee', 'Homemaker', true, true, true, 100, NOW() - INTERVAL '4 days')
ON CONFLICT (id) DO UPDATE SET
  profile_id = EXCLUDED.profile_id,
  display_name = EXCLUDED.display_name,
  gender = EXCLUDED.gender,
  date_of_birth = EXCLUDED.date_of_birth,
  height_cm = EXCLUDED.height_cm,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  subcaste = EXCLUDED.subcaste,
  dosham = EXCLUDED.dosham,
  education = EXCLUDED.education,
  education_detail = EXCLUDED.education_detail,
  occupation = EXCLUDED.occupation,
  occupation_detail = EXCLUDED.occupation_detail,
  annual_income = EXCLUDED.annual_income,
  company_name = EXCLUDED.company_name,
  city = EXCLUDED.city,
  district = EXCLUDED.district,
  about_me = EXCLUDED.about_me,
  family_type = EXCLUDED.family_type,
  family_status = EXCLUDED.family_status,
  father_occupation = EXCLUDED.father_occupation,
  mother_occupation = EXCLUDED.mother_occupation,
  is_verified = EXCLUDED.is_verified,
  is_premium = EXCLUDED.is_premium,
  is_profile_complete = EXCLUDED.is_profile_complete,
  profile_completion_percent = EXCLUDED.profile_completion_percent,
  last_active_at = EXCLUDED.last_active_at;
INSERT INTO public.profiles (id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, father_occupation, mother_occupation, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at)
VALUES ('00000000-0000-4000-a000-00000000010e', 'TM000270', 'Sandhya Sundaram', 'female', '2005-08-01', 165, 'never_married', 'Hindu', 'Kallar', 'Kallar subcaste', 'no', 'M.B.B.S', 'M.B.B.S Graduate', 'Doctor', 'Doctor Details', '₹5 Lakhs - ₹7 Lakhs', 'Infosys', 'Tirunelveli', 'Tirunelveli', 'Hi, I am Sandhya. I have completed my M.B.B.S and am currently working as a Doctor at Infosys in Tirunelveli. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'joint', 'middle_class', 'Retired Employee', 'Homemaker', true, false, true, 100, NOW() - INTERVAL '6 days')
ON CONFLICT (id) DO UPDATE SET
  profile_id = EXCLUDED.profile_id,
  display_name = EXCLUDED.display_name,
  gender = EXCLUDED.gender,
  date_of_birth = EXCLUDED.date_of_birth,
  height_cm = EXCLUDED.height_cm,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  subcaste = EXCLUDED.subcaste,
  dosham = EXCLUDED.dosham,
  education = EXCLUDED.education,
  education_detail = EXCLUDED.education_detail,
  occupation = EXCLUDED.occupation,
  occupation_detail = EXCLUDED.occupation_detail,
  annual_income = EXCLUDED.annual_income,
  company_name = EXCLUDED.company_name,
  city = EXCLUDED.city,
  district = EXCLUDED.district,
  about_me = EXCLUDED.about_me,
  family_type = EXCLUDED.family_type,
  family_status = EXCLUDED.family_status,
  father_occupation = EXCLUDED.father_occupation,
  mother_occupation = EXCLUDED.mother_occupation,
  is_verified = EXCLUDED.is_verified,
  is_premium = EXCLUDED.is_premium,
  is_profile_complete = EXCLUDED.is_profile_complete,
  profile_completion_percent = EXCLUDED.profile_completion_percent,
  last_active_at = EXCLUDED.last_active_at;
INSERT INTO public.profiles (id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, father_occupation, mother_occupation, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at)
VALUES ('00000000-0000-4000-a000-00000000010f', 'TM000271', 'Mohan Velan', 'male', '1999-12-20', 185, 'never_married', 'Hindu', 'Pillai', 'Pillai subcaste', 'no', 'M.C.A', 'M.C.A Graduate', 'Police Officer', 'Police Officer Details', '₹5 Lakhs - ₹7 Lakhs', 'Infosys', 'Tirunelveli', 'Tirunelveli', 'Hi, I am Mohan. I have completed my M.C.A and am currently working as a Police Officer at Infosys in Tirunelveli. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'joint', 'middle_class', 'Retired Employee', 'Homemaker', true, false, true, 100, NOW() - INTERVAL '9 days')
ON CONFLICT (id) DO UPDATE SET
  profile_id = EXCLUDED.profile_id,
  display_name = EXCLUDED.display_name,
  gender = EXCLUDED.gender,
  date_of_birth = EXCLUDED.date_of_birth,
  height_cm = EXCLUDED.height_cm,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  subcaste = EXCLUDED.subcaste,
  dosham = EXCLUDED.dosham,
  education = EXCLUDED.education,
  education_detail = EXCLUDED.education_detail,
  occupation = EXCLUDED.occupation,
  occupation_detail = EXCLUDED.occupation_detail,
  annual_income = EXCLUDED.annual_income,
  company_name = EXCLUDED.company_name,
  city = EXCLUDED.city,
  district = EXCLUDED.district,
  about_me = EXCLUDED.about_me,
  family_type = EXCLUDED.family_type,
  family_status = EXCLUDED.family_status,
  father_occupation = EXCLUDED.father_occupation,
  mother_occupation = EXCLUDED.mother_occupation,
  is_verified = EXCLUDED.is_verified,
  is_premium = EXCLUDED.is_premium,
  is_profile_complete = EXCLUDED.is_profile_complete,
  profile_completion_percent = EXCLUDED.profile_completion_percent,
  last_active_at = EXCLUDED.last_active_at;
INSERT INTO public.profiles (id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, father_occupation, mother_occupation, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at)
VALUES ('00000000-0000-4000-a000-000000000110', 'TM000272', 'Vanitha Devan', 'female', '1997-09-05', 155, 'never_married', 'Hindu', 'Chettiar', NULL, 'no', 'B.Com', 'B.Com Graduate', 'College Professor', 'College Professor Details', '₹15 Lakhs - ₹20 Lakhs', 'Zoho', 'Madurai', 'Madurai', 'Hi, I am Vanitha. I have completed my B.Com and am currently working as a College Professor at Zoho in Madurai. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'middle_class', 'Retired Employee', 'Homemaker', true, true, true, 100, NOW() - INTERVAL '5 days')
ON CONFLICT (id) DO UPDATE SET
  profile_id = EXCLUDED.profile_id,
  display_name = EXCLUDED.display_name,
  gender = EXCLUDED.gender,
  date_of_birth = EXCLUDED.date_of_birth,
  height_cm = EXCLUDED.height_cm,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  subcaste = EXCLUDED.subcaste,
  dosham = EXCLUDED.dosham,
  education = EXCLUDED.education,
  education_detail = EXCLUDED.education_detail,
  occupation = EXCLUDED.occupation,
  occupation_detail = EXCLUDED.occupation_detail,
  annual_income = EXCLUDED.annual_income,
  company_name = EXCLUDED.company_name,
  city = EXCLUDED.city,
  district = EXCLUDED.district,
  about_me = EXCLUDED.about_me,
  family_type = EXCLUDED.family_type,
  family_status = EXCLUDED.family_status,
  father_occupation = EXCLUDED.father_occupation,
  mother_occupation = EXCLUDED.mother_occupation,
  is_verified = EXCLUDED.is_verified,
  is_premium = EXCLUDED.is_premium,
  is_profile_complete = EXCLUDED.is_profile_complete,
  profile_completion_percent = EXCLUDED.profile_completion_percent,
  last_active_at = EXCLUDED.last_active_at;
INSERT INTO public.profiles (id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, father_occupation, mother_occupation, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at)
VALUES ('00000000-0000-4000-a000-000000000111', 'TM000273', 'Mohan Devan', 'male', '1999-01-14', 171, 'never_married', 'Hindu', 'Chettiar', NULL, 'no', 'M.A', 'M.A Graduate', 'Bank Manager', 'Bank Manager Details', '₹3 Lakhs - ₹5 Lakhs', 'Infosys', 'Vellore', 'Vellore', 'Hi, I am Mohan. I have completed my M.A and am currently working as a Bank Manager at Infosys in Vellore. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'rich', 'Retired Employee', 'Homemaker', true, false, true, 100, NOW() - INTERVAL '3 days')
ON CONFLICT (id) DO UPDATE SET
  profile_id = EXCLUDED.profile_id,
  display_name = EXCLUDED.display_name,
  gender = EXCLUDED.gender,
  date_of_birth = EXCLUDED.date_of_birth,
  height_cm = EXCLUDED.height_cm,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  subcaste = EXCLUDED.subcaste,
  dosham = EXCLUDED.dosham,
  education = EXCLUDED.education,
  education_detail = EXCLUDED.education_detail,
  occupation = EXCLUDED.occupation,
  occupation_detail = EXCLUDED.occupation_detail,
  annual_income = EXCLUDED.annual_income,
  company_name = EXCLUDED.company_name,
  city = EXCLUDED.city,
  district = EXCLUDED.district,
  about_me = EXCLUDED.about_me,
  family_type = EXCLUDED.family_type,
  family_status = EXCLUDED.family_status,
  father_occupation = EXCLUDED.father_occupation,
  mother_occupation = EXCLUDED.mother_occupation,
  is_verified = EXCLUDED.is_verified,
  is_premium = EXCLUDED.is_premium,
  is_profile_complete = EXCLUDED.is_profile_complete,
  profile_completion_percent = EXCLUDED.profile_completion_percent,
  last_active_at = EXCLUDED.last_active_at;
INSERT INTO public.profiles (id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, father_occupation, mother_occupation, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at)
VALUES ('00000000-0000-4000-a000-000000000112', 'TM000274', 'Megala Nathan', 'female', '1992-09-28', 167, 'never_married', 'Hindu', 'Nadar', NULL, 'no', 'M.C.A', 'M.C.A Graduate', 'Auditor', 'Auditor Details', '₹3 Lakhs - ₹5 Lakhs', 'Government Service', 'Kanchipuram', 'Kanchipuram', 'Hi, I am Megala. I have completed my M.C.A and am currently working as a Auditor at Government Service in Kanchipuram. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'upper_middle_class', 'Retired Employee', 'Homemaker', true, false, true, 100, NOW() - INTERVAL '6 days')
ON CONFLICT (id) DO UPDATE SET
  profile_id = EXCLUDED.profile_id,
  display_name = EXCLUDED.display_name,
  gender = EXCLUDED.gender,
  date_of_birth = EXCLUDED.date_of_birth,
  height_cm = EXCLUDED.height_cm,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  subcaste = EXCLUDED.subcaste,
  dosham = EXCLUDED.dosham,
  education = EXCLUDED.education,
  education_detail = EXCLUDED.education_detail,
  occupation = EXCLUDED.occupation,
  occupation_detail = EXCLUDED.occupation_detail,
  annual_income = EXCLUDED.annual_income,
  company_name = EXCLUDED.company_name,
  city = EXCLUDED.city,
  district = EXCLUDED.district,
  about_me = EXCLUDED.about_me,
  family_type = EXCLUDED.family_type,
  family_status = EXCLUDED.family_status,
  father_occupation = EXCLUDED.father_occupation,
  mother_occupation = EXCLUDED.mother_occupation,
  is_verified = EXCLUDED.is_verified,
  is_premium = EXCLUDED.is_premium,
  is_profile_complete = EXCLUDED.is_profile_complete,
  profile_completion_percent = EXCLUDED.profile_completion_percent,
  last_active_at = EXCLUDED.last_active_at;
INSERT INTO public.profiles (id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, father_occupation, mother_occupation, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at)
VALUES ('00000000-0000-4000-a000-000000000113', 'TM000275', 'Selvam Swamy', 'male', '1992-07-11', 164, 'divorced', 'Hindu', 'Arunthathiyar', 'Arunthathiyar subcaste', 'yes', 'B.Com', 'B.Com Graduate', 'Architect', 'Architect Details', '₹7 Lakhs - ₹10 Lakhs', 'Cognizant', 'Madurai', 'Madurai', 'Hi, I am Selvam. I have completed my B.Com and am currently working as a Architect at Cognizant in Madurai. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'upper_middle_class', 'Retired Employee', 'Homemaker', true, false, true, 100, NOW() - INTERVAL '7 days')
ON CONFLICT (id) DO UPDATE SET
  profile_id = EXCLUDED.profile_id,
  display_name = EXCLUDED.display_name,
  gender = EXCLUDED.gender,
  date_of_birth = EXCLUDED.date_of_birth,
  height_cm = EXCLUDED.height_cm,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  subcaste = EXCLUDED.subcaste,
  dosham = EXCLUDED.dosham,
  education = EXCLUDED.education,
  education_detail = EXCLUDED.education_detail,
  occupation = EXCLUDED.occupation,
  occupation_detail = EXCLUDED.occupation_detail,
  annual_income = EXCLUDED.annual_income,
  company_name = EXCLUDED.company_name,
  city = EXCLUDED.city,
  district = EXCLUDED.district,
  about_me = EXCLUDED.about_me,
  family_type = EXCLUDED.family_type,
  family_status = EXCLUDED.family_status,
  father_occupation = EXCLUDED.father_occupation,
  mother_occupation = EXCLUDED.mother_occupation,
  is_verified = EXCLUDED.is_verified,
  is_premium = EXCLUDED.is_premium,
  is_profile_complete = EXCLUDED.is_profile_complete,
  profile_completion_percent = EXCLUDED.profile_completion_percent,
  last_active_at = EXCLUDED.last_active_at;
INSERT INTO public.profiles (id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, father_occupation, mother_occupation, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at)
VALUES ('00000000-0000-4000-a000-000000000114', 'TM000276', 'Abirami Gopal', 'female', '1999-05-15', 165, 'never_married', 'Hindu', 'Arunthathiyar', NULL, 'no', 'M.B.A', 'M.B.A Graduate', 'College Professor', 'College Professor Details', '₹7 Lakhs - ₹10 Lakhs', 'Private Practice', 'Coimbatore', 'Coimbatore', 'Hi, I am Abirami. I have completed my M.B.A and am currently working as a College Professor at Private Practice in Coimbatore. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'rich', 'Retired Employee', 'Homemaker', false, false, true, 100, NOW() - INTERVAL '5 days')
ON CONFLICT (id) DO UPDATE SET
  profile_id = EXCLUDED.profile_id,
  display_name = EXCLUDED.display_name,
  gender = EXCLUDED.gender,
  date_of_birth = EXCLUDED.date_of_birth,
  height_cm = EXCLUDED.height_cm,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  subcaste = EXCLUDED.subcaste,
  dosham = EXCLUDED.dosham,
  education = EXCLUDED.education,
  education_detail = EXCLUDED.education_detail,
  occupation = EXCLUDED.occupation,
  occupation_detail = EXCLUDED.occupation_detail,
  annual_income = EXCLUDED.annual_income,
  company_name = EXCLUDED.company_name,
  city = EXCLUDED.city,
  district = EXCLUDED.district,
  about_me = EXCLUDED.about_me,
  family_type = EXCLUDED.family_type,
  family_status = EXCLUDED.family_status,
  father_occupation = EXCLUDED.father_occupation,
  mother_occupation = EXCLUDED.mother_occupation,
  is_verified = EXCLUDED.is_verified,
  is_premium = EXCLUDED.is_premium,
  is_profile_complete = EXCLUDED.is_profile_complete,
  profile_completion_percent = EXCLUDED.profile_completion_percent,
  last_active_at = EXCLUDED.last_active_at;
INSERT INTO public.profiles (id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, father_occupation, mother_occupation, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at)
VALUES ('00000000-0000-4000-a000-000000000115', 'TM000277', 'Madhavan Kumar', 'male', '1998-09-03', 186, 'never_married', 'Hindu', 'Adi Dravida', NULL, 'yes', 'M.Sc', 'M.Sc Graduate', 'College Professor', 'College Professor Details', '₹7 Lakhs - ₹10 Lakhs', 'Wipro', 'Erode', 'Erode', 'Hi, I am Madhavan. I have completed my M.Sc and am currently working as a College Professor at Wipro in Erode. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'joint', 'upper_middle_class', 'Retired Employee', 'Homemaker', false, true, true, 100, NOW() - INTERVAL '5 days')
ON CONFLICT (id) DO UPDATE SET
  profile_id = EXCLUDED.profile_id,
  display_name = EXCLUDED.display_name,
  gender = EXCLUDED.gender,
  date_of_birth = EXCLUDED.date_of_birth,
  height_cm = EXCLUDED.height_cm,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  subcaste = EXCLUDED.subcaste,
  dosham = EXCLUDED.dosham,
  education = EXCLUDED.education,
  education_detail = EXCLUDED.education_detail,
  occupation = EXCLUDED.occupation,
  occupation_detail = EXCLUDED.occupation_detail,
  annual_income = EXCLUDED.annual_income,
  company_name = EXCLUDED.company_name,
  city = EXCLUDED.city,
  district = EXCLUDED.district,
  about_me = EXCLUDED.about_me,
  family_type = EXCLUDED.family_type,
  family_status = EXCLUDED.family_status,
  father_occupation = EXCLUDED.father_occupation,
  mother_occupation = EXCLUDED.mother_occupation,
  is_verified = EXCLUDED.is_verified,
  is_premium = EXCLUDED.is_premium,
  is_profile_complete = EXCLUDED.is_profile_complete,
  profile_completion_percent = EXCLUDED.profile_completion_percent,
  last_active_at = EXCLUDED.last_active_at;
INSERT INTO public.profiles (id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, father_occupation, mother_occupation, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at)
VALUES ('00000000-0000-4000-a000-000000000116', 'TM000278', 'Pavithra Lingam', 'female', '2004-08-13', 170, 'never_married', 'Christian', 'RC Christian', NULL, 'no', 'B.A', 'B.A Graduate', 'Bank Manager', 'Bank Manager Details', '₹10 Lakhs - ₹15 Lakhs', 'Self Employed', 'Salem', 'Salem', 'Hi, I am Pavithra. I have completed my B.A and am currently working as a Bank Manager at Self Employed in Salem. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'upper_middle_class', 'Retired Employee', 'Homemaker', true, true, true, 100, NOW() - INTERVAL '10 days')
ON CONFLICT (id) DO UPDATE SET
  profile_id = EXCLUDED.profile_id,
  display_name = EXCLUDED.display_name,
  gender = EXCLUDED.gender,
  date_of_birth = EXCLUDED.date_of_birth,
  height_cm = EXCLUDED.height_cm,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  subcaste = EXCLUDED.subcaste,
  dosham = EXCLUDED.dosham,
  education = EXCLUDED.education,
  education_detail = EXCLUDED.education_detail,
  occupation = EXCLUDED.occupation,
  occupation_detail = EXCLUDED.occupation_detail,
  annual_income = EXCLUDED.annual_income,
  company_name = EXCLUDED.company_name,
  city = EXCLUDED.city,
  district = EXCLUDED.district,
  about_me = EXCLUDED.about_me,
  family_type = EXCLUDED.family_type,
  family_status = EXCLUDED.family_status,
  father_occupation = EXCLUDED.father_occupation,
  mother_occupation = EXCLUDED.mother_occupation,
  is_verified = EXCLUDED.is_verified,
  is_premium = EXCLUDED.is_premium,
  is_profile_complete = EXCLUDED.is_profile_complete,
  profile_completion_percent = EXCLUDED.profile_completion_percent,
  last_active_at = EXCLUDED.last_active_at;
INSERT INTO public.profiles (id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, father_occupation, mother_occupation, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at)
VALUES ('00000000-0000-4000-a000-000000000117', 'TM000279', 'Jeeva Nathan', 'male', '1988-03-23', 169, 'divorced', 'Hindu', 'Sengunthar', 'Sengunthar subcaste', 'no', 'B.Ed', 'B.Ed Graduate', 'Government Officer', 'Government Officer Details', '₹5 Lakhs - ₹7 Lakhs', 'Government Service', 'Kanchipuram', 'Kanchipuram', 'Hi, I am Jeeva. I have completed my B.Ed and am currently working as a Government Officer at Government Service in Kanchipuram. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'rich', 'Retired Employee', 'Homemaker', false, false, true, 100, NOW() - INTERVAL '2 days')
ON CONFLICT (id) DO UPDATE SET
  profile_id = EXCLUDED.profile_id,
  display_name = EXCLUDED.display_name,
  gender = EXCLUDED.gender,
  date_of_birth = EXCLUDED.date_of_birth,
  height_cm = EXCLUDED.height_cm,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  subcaste = EXCLUDED.subcaste,
  dosham = EXCLUDED.dosham,
  education = EXCLUDED.education,
  education_detail = EXCLUDED.education_detail,
  occupation = EXCLUDED.occupation,
  occupation_detail = EXCLUDED.occupation_detail,
  annual_income = EXCLUDED.annual_income,
  company_name = EXCLUDED.company_name,
  city = EXCLUDED.city,
  district = EXCLUDED.district,
  about_me = EXCLUDED.about_me,
  family_type = EXCLUDED.family_type,
  family_status = EXCLUDED.family_status,
  father_occupation = EXCLUDED.father_occupation,
  mother_occupation = EXCLUDED.mother_occupation,
  is_verified = EXCLUDED.is_verified,
  is_premium = EXCLUDED.is_premium,
  is_profile_complete = EXCLUDED.is_profile_complete,
  profile_completion_percent = EXCLUDED.profile_completion_percent,
  last_active_at = EXCLUDED.last_active_at;
INSERT INTO public.profiles (id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, father_occupation, mother_occupation, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at)
VALUES ('00000000-0000-4000-a000-000000000118', 'TM000280', 'Chitra Mani', 'female', '1992-04-04', 168, 'never_married', 'Hindu', 'Naicker', 'Naicker subcaste', 'no', 'B.E. / B.Tech', 'B.E. / B.Tech Graduate', 'Mechanical Engineer', 'Mechanical Engineer Details', '₹3 Lakhs - ₹5 Lakhs', 'Accenture', 'Thoothukudi', 'Tuticorin', 'Hi, I am Chitra. I have completed my B.E. / B.Tech and am currently working as a Mechanical Engineer at Accenture in Thoothukudi. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'rich', 'Retired Employee', 'Homemaker', true, true, true, 100, NOW() - INTERVAL '6 days')
ON CONFLICT (id) DO UPDATE SET
  profile_id = EXCLUDED.profile_id,
  display_name = EXCLUDED.display_name,
  gender = EXCLUDED.gender,
  date_of_birth = EXCLUDED.date_of_birth,
  height_cm = EXCLUDED.height_cm,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  subcaste = EXCLUDED.subcaste,
  dosham = EXCLUDED.dosham,
  education = EXCLUDED.education,
  education_detail = EXCLUDED.education_detail,
  occupation = EXCLUDED.occupation,
  occupation_detail = EXCLUDED.occupation_detail,
  annual_income = EXCLUDED.annual_income,
  company_name = EXCLUDED.company_name,
  city = EXCLUDED.city,
  district = EXCLUDED.district,
  about_me = EXCLUDED.about_me,
  family_type = EXCLUDED.family_type,
  family_status = EXCLUDED.family_status,
  father_occupation = EXCLUDED.father_occupation,
  mother_occupation = EXCLUDED.mother_occupation,
  is_verified = EXCLUDED.is_verified,
  is_premium = EXCLUDED.is_premium,
  is_profile_complete = EXCLUDED.is_profile_complete,
  profile_completion_percent = EXCLUDED.profile_completion_percent,
  last_active_at = EXCLUDED.last_active_at;
INSERT INTO public.profiles (id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, father_occupation, mother_occupation, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at)
VALUES ('00000000-0000-4000-a000-000000000119', 'TM000281', 'Ramakrishnan Murthy', 'male', '2003-10-13', 178, 'never_married', 'Muslim', 'Rawther', NULL, 'no', 'M.C.A', 'M.C.A Graduate', 'Auditor', 'Auditor Details', '₹15 Lakhs - ₹20 Lakhs', 'HCL', 'Vellore', 'Vellore', 'Hi, I am Ramakrishnan. I have completed my M.C.A and am currently working as a Auditor at HCL in Vellore. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'upper_middle_class', 'Retired Employee', 'Homemaker', true, false, true, 100, NOW() - INTERVAL '4 days')
ON CONFLICT (id) DO UPDATE SET
  profile_id = EXCLUDED.profile_id,
  display_name = EXCLUDED.display_name,
  gender = EXCLUDED.gender,
  date_of_birth = EXCLUDED.date_of_birth,
  height_cm = EXCLUDED.height_cm,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  subcaste = EXCLUDED.subcaste,
  dosham = EXCLUDED.dosham,
  education = EXCLUDED.education,
  education_detail = EXCLUDED.education_detail,
  occupation = EXCLUDED.occupation,
  occupation_detail = EXCLUDED.occupation_detail,
  annual_income = EXCLUDED.annual_income,
  company_name = EXCLUDED.company_name,
  city = EXCLUDED.city,
  district = EXCLUDED.district,
  about_me = EXCLUDED.about_me,
  family_type = EXCLUDED.family_type,
  family_status = EXCLUDED.family_status,
  father_occupation = EXCLUDED.father_occupation,
  mother_occupation = EXCLUDED.mother_occupation,
  is_verified = EXCLUDED.is_verified,
  is_premium = EXCLUDED.is_premium,
  is_profile_complete = EXCLUDED.is_profile_complete,
  profile_completion_percent = EXCLUDED.profile_completion_percent,
  last_active_at = EXCLUDED.last_active_at;
INSERT INTO public.profiles (id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, father_occupation, mother_occupation, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at)
VALUES ('00000000-0000-4000-a000-00000000011a', 'TM000282', 'Vidya Samy', 'female', '1991-05-08', 175, 'never_married', 'Hindu', 'Naidu', 'Naidu subcaste', 'no', 'M.B.B.S', 'M.B.B.S Graduate', 'HR Specialist', 'HR Specialist Details', '₹5 Lakhs - ₹7 Lakhs', 'Government Service', 'Erode', 'Erode', 'Hi, I am Vidya. I have completed my M.B.B.S and am currently working as a HR Specialist at Government Service in Erode. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'middle_class', 'Retired Employee', 'Homemaker', true, true, true, 100, NOW() - INTERVAL '1 days')
ON CONFLICT (id) DO UPDATE SET
  profile_id = EXCLUDED.profile_id,
  display_name = EXCLUDED.display_name,
  gender = EXCLUDED.gender,
  date_of_birth = EXCLUDED.date_of_birth,
  height_cm = EXCLUDED.height_cm,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  subcaste = EXCLUDED.subcaste,
  dosham = EXCLUDED.dosham,
  education = EXCLUDED.education,
  education_detail = EXCLUDED.education_detail,
  occupation = EXCLUDED.occupation,
  occupation_detail = EXCLUDED.occupation_detail,
  annual_income = EXCLUDED.annual_income,
  company_name = EXCLUDED.company_name,
  city = EXCLUDED.city,
  district = EXCLUDED.district,
  about_me = EXCLUDED.about_me,
  family_type = EXCLUDED.family_type,
  family_status = EXCLUDED.family_status,
  father_occupation = EXCLUDED.father_occupation,
  mother_occupation = EXCLUDED.mother_occupation,
  is_verified = EXCLUDED.is_verified,
  is_premium = EXCLUDED.is_premium,
  is_profile_complete = EXCLUDED.is_profile_complete,
  profile_completion_percent = EXCLUDED.profile_completion_percent,
  last_active_at = EXCLUDED.last_active_at;
INSERT INTO public.profiles (id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, father_occupation, mother_occupation, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at)
VALUES ('00000000-0000-4000-a000-00000000011b', 'TM000283', 'Elango Naicker', 'male', '1988-09-26', 178, 'never_married', 'Hindu', 'Naidu', NULL, 'no', 'B.Ed', 'B.Ed Graduate', 'Software Engineer', 'Software Engineer Details', '₹3 Lakhs - ₹5 Lakhs', 'Wipro', 'Tirunelveli', 'Tirunelveli', 'Hi, I am Elango. I have completed my B.Ed and am currently working as a Software Engineer at Wipro in Tirunelveli. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'rich', 'Retired Employee', 'Homemaker', true, true, true, 100, NOW() - INTERVAL '6 days')
ON CONFLICT (id) DO UPDATE SET
  profile_id = EXCLUDED.profile_id,
  display_name = EXCLUDED.display_name,
  gender = EXCLUDED.gender,
  date_of_birth = EXCLUDED.date_of_birth,
  height_cm = EXCLUDED.height_cm,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  subcaste = EXCLUDED.subcaste,
  dosham = EXCLUDED.dosham,
  education = EXCLUDED.education,
  education_detail = EXCLUDED.education_detail,
  occupation = EXCLUDED.occupation,
  occupation_detail = EXCLUDED.occupation_detail,
  annual_income = EXCLUDED.annual_income,
  company_name = EXCLUDED.company_name,
  city = EXCLUDED.city,
  district = EXCLUDED.district,
  about_me = EXCLUDED.about_me,
  family_type = EXCLUDED.family_type,
  family_status = EXCLUDED.family_status,
  father_occupation = EXCLUDED.father_occupation,
  mother_occupation = EXCLUDED.mother_occupation,
  is_verified = EXCLUDED.is_verified,
  is_premium = EXCLUDED.is_premium,
  is_profile_complete = EXCLUDED.is_profile_complete,
  profile_completion_percent = EXCLUDED.profile_completion_percent,
  last_active_at = EXCLUDED.last_active_at;
INSERT INTO public.profiles (id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, father_occupation, mother_occupation, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at)
VALUES ('00000000-0000-4000-a000-00000000011c', 'TM000284', 'Vanitha Krishnan', 'female', '1991-03-23', 154, 'never_married', 'Hindu', 'Sengunthar', 'Sengunthar subcaste', 'no', 'M.A', 'M.A Graduate', 'Police Officer', 'Police Officer Details', '₹15 Lakhs - ₹20 Lakhs', 'Accenture', 'Chennai', 'Chennai', 'Hi, I am Vanitha. I have completed my M.A and am currently working as a Police Officer at Accenture in Chennai. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'upper_middle_class', 'Retired Employee', 'Homemaker', true, false, true, 100, NOW() - INTERVAL '2 days')
ON CONFLICT (id) DO UPDATE SET
  profile_id = EXCLUDED.profile_id,
  display_name = EXCLUDED.display_name,
  gender = EXCLUDED.gender,
  date_of_birth = EXCLUDED.date_of_birth,
  height_cm = EXCLUDED.height_cm,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  subcaste = EXCLUDED.subcaste,
  dosham = EXCLUDED.dosham,
  education = EXCLUDED.education,
  education_detail = EXCLUDED.education_detail,
  occupation = EXCLUDED.occupation,
  occupation_detail = EXCLUDED.occupation_detail,
  annual_income = EXCLUDED.annual_income,
  company_name = EXCLUDED.company_name,
  city = EXCLUDED.city,
  district = EXCLUDED.district,
  about_me = EXCLUDED.about_me,
  family_type = EXCLUDED.family_type,
  family_status = EXCLUDED.family_status,
  father_occupation = EXCLUDED.father_occupation,
  mother_occupation = EXCLUDED.mother_occupation,
  is_verified = EXCLUDED.is_verified,
  is_premium = EXCLUDED.is_premium,
  is_profile_complete = EXCLUDED.is_profile_complete,
  profile_completion_percent = EXCLUDED.profile_completion_percent,
  last_active_at = EXCLUDED.last_active_at;
INSERT INTO public.profiles (id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, father_occupation, mother_occupation, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at)
VALUES ('00000000-0000-4000-a000-00000000011d', 'TM000285', 'Vetrivel Samy', 'male', '1988-12-14', 183, 'never_married', 'Hindu', 'Naidu', NULL, 'no', 'B.Com', 'B.Com Graduate', 'Auditor', 'Auditor Details', '₹20 Lakhs+', 'Private Practice', 'Tiruchirappalli', 'Trichy', 'Hi, I am Vetrivel. I have completed my B.Com and am currently working as a Auditor at Private Practice in Tiruchirappalli. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'upper_middle_class', 'Retired Employee', 'Homemaker', true, false, true, 100, NOW() - INTERVAL '6 days')
ON CONFLICT (id) DO UPDATE SET
  profile_id = EXCLUDED.profile_id,
  display_name = EXCLUDED.display_name,
  gender = EXCLUDED.gender,
  date_of_birth = EXCLUDED.date_of_birth,
  height_cm = EXCLUDED.height_cm,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  subcaste = EXCLUDED.subcaste,
  dosham = EXCLUDED.dosham,
  education = EXCLUDED.education,
  education_detail = EXCLUDED.education_detail,
  occupation = EXCLUDED.occupation,
  occupation_detail = EXCLUDED.occupation_detail,
  annual_income = EXCLUDED.annual_income,
  company_name = EXCLUDED.company_name,
  city = EXCLUDED.city,
  district = EXCLUDED.district,
  about_me = EXCLUDED.about_me,
  family_type = EXCLUDED.family_type,
  family_status = EXCLUDED.family_status,
  father_occupation = EXCLUDED.father_occupation,
  mother_occupation = EXCLUDED.mother_occupation,
  is_verified = EXCLUDED.is_verified,
  is_premium = EXCLUDED.is_premium,
  is_profile_complete = EXCLUDED.is_profile_complete,
  profile_completion_percent = EXCLUDED.profile_completion_percent,
  last_active_at = EXCLUDED.last_active_at;
INSERT INTO public.profiles (id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, father_occupation, mother_occupation, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at)
VALUES ('00000000-0000-4000-a000-00000000011e', 'TM000286', 'Geetha Krishnan', 'female', '1998-04-14', 163, 'never_married', 'Hindu', 'Agamudayar', 'Agamudayar subcaste', 'no', 'B.A', 'B.A Graduate', 'College Professor', 'College Professor Details', '₹5 Lakhs - ₹7 Lakhs', 'Wipro', 'Salem', 'Salem', 'Hi, I am Geetha. I have completed my B.A and am currently working as a College Professor at Wipro in Salem. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'rich', 'Retired Employee', 'Homemaker', false, true, true, 100, NOW() - INTERVAL '2 days')
ON CONFLICT (id) DO UPDATE SET
  profile_id = EXCLUDED.profile_id,
  display_name = EXCLUDED.display_name,
  gender = EXCLUDED.gender,
  date_of_birth = EXCLUDED.date_of_birth,
  height_cm = EXCLUDED.height_cm,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  subcaste = EXCLUDED.subcaste,
  dosham = EXCLUDED.dosham,
  education = EXCLUDED.education,
  education_detail = EXCLUDED.education_detail,
  occupation = EXCLUDED.occupation,
  occupation_detail = EXCLUDED.occupation_detail,
  annual_income = EXCLUDED.annual_income,
  company_name = EXCLUDED.company_name,
  city = EXCLUDED.city,
  district = EXCLUDED.district,
  about_me = EXCLUDED.about_me,
  family_type = EXCLUDED.family_type,
  family_status = EXCLUDED.family_status,
  father_occupation = EXCLUDED.father_occupation,
  mother_occupation = EXCLUDED.mother_occupation,
  is_verified = EXCLUDED.is_verified,
  is_premium = EXCLUDED.is_premium,
  is_profile_complete = EXCLUDED.is_profile_complete,
  profile_completion_percent = EXCLUDED.profile_completion_percent,
  last_active_at = EXCLUDED.last_active_at;
INSERT INTO public.profiles (id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, father_occupation, mother_occupation, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at)
VALUES ('00000000-0000-4000-a000-00000000011f', 'TM000287', 'Karthik Raman', 'male', '2000-01-10', 185, 'never_married', 'Hindu', 'Chettiar', NULL, 'no', 'Ph.D', 'Ph.D Graduate', 'Police Officer', 'Police Officer Details', '₹3 Lakhs - ₹5 Lakhs', 'Zoho', 'Thanjavur', 'Thanjavur', 'Hi, I am Karthik. I have completed my Ph.D and am currently working as a Police Officer at Zoho in Thanjavur. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'middle_class', 'Retired Employee', 'Homemaker', true, false, true, 100, NOW() - INTERVAL '0 days')
ON CONFLICT (id) DO UPDATE SET
  profile_id = EXCLUDED.profile_id,
  display_name = EXCLUDED.display_name,
  gender = EXCLUDED.gender,
  date_of_birth = EXCLUDED.date_of_birth,
  height_cm = EXCLUDED.height_cm,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  subcaste = EXCLUDED.subcaste,
  dosham = EXCLUDED.dosham,
  education = EXCLUDED.education,
  education_detail = EXCLUDED.education_detail,
  occupation = EXCLUDED.occupation,
  occupation_detail = EXCLUDED.occupation_detail,
  annual_income = EXCLUDED.annual_income,
  company_name = EXCLUDED.company_name,
  city = EXCLUDED.city,
  district = EXCLUDED.district,
  about_me = EXCLUDED.about_me,
  family_type = EXCLUDED.family_type,
  family_status = EXCLUDED.family_status,
  father_occupation = EXCLUDED.father_occupation,
  mother_occupation = EXCLUDED.mother_occupation,
  is_verified = EXCLUDED.is_verified,
  is_premium = EXCLUDED.is_premium,
  is_profile_complete = EXCLUDED.is_profile_complete,
  profile_completion_percent = EXCLUDED.profile_completion_percent,
  last_active_at = EXCLUDED.last_active_at;
INSERT INTO public.profiles (id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, father_occupation, mother_occupation, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at)
VALUES ('00000000-0000-4000-a000-000000000120', 'TM000288', 'Rajeshwari Lingam', 'female', '2001-02-15', 155, 'divorced', 'Hindu', 'Pillai', NULL, 'no', 'M.C.A', 'M.C.A Graduate', 'Dentist', 'Dentist Details', '₹10 Lakhs - ₹15 Lakhs', 'TCS', 'Madurai', 'Madurai', 'Hi, I am Rajeshwari. I have completed my M.C.A and am currently working as a Dentist at TCS in Madurai. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'upper_middle_class', 'Retired Employee', 'Homemaker', true, false, true, 100, NOW() - INTERVAL '3 days')
ON CONFLICT (id) DO UPDATE SET
  profile_id = EXCLUDED.profile_id,
  display_name = EXCLUDED.display_name,
  gender = EXCLUDED.gender,
  date_of_birth = EXCLUDED.date_of_birth,
  height_cm = EXCLUDED.height_cm,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  subcaste = EXCLUDED.subcaste,
  dosham = EXCLUDED.dosham,
  education = EXCLUDED.education,
  education_detail = EXCLUDED.education_detail,
  occupation = EXCLUDED.occupation,
  occupation_detail = EXCLUDED.occupation_detail,
  annual_income = EXCLUDED.annual_income,
  company_name = EXCLUDED.company_name,
  city = EXCLUDED.city,
  district = EXCLUDED.district,
  about_me = EXCLUDED.about_me,
  family_type = EXCLUDED.family_type,
  family_status = EXCLUDED.family_status,
  father_occupation = EXCLUDED.father_occupation,
  mother_occupation = EXCLUDED.mother_occupation,
  is_verified = EXCLUDED.is_verified,
  is_premium = EXCLUDED.is_premium,
  is_profile_complete = EXCLUDED.is_profile_complete,
  profile_completion_percent = EXCLUDED.profile_completion_percent,
  last_active_at = EXCLUDED.last_active_at;
INSERT INTO public.profiles (id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, father_occupation, mother_occupation, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at)
VALUES ('00000000-0000-4000-a000-000000000121', 'TM000289', 'Muthu Raman', 'male', '2003-04-20', 165, 'never_married', 'Hindu', 'Naidu', 'Naidu subcaste', 'no', 'M.B.B.S', 'M.B.B.S Graduate', 'Civil Engineer', 'Civil Engineer Details', '₹20 Lakhs+', 'Zoho', 'Madurai', 'Madurai', 'Hi, I am Muthu. I have completed my M.B.B.S and am currently working as a Civil Engineer at Zoho in Madurai. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'joint', 'upper_middle_class', 'Retired Employee', 'Homemaker', true, false, true, 100, NOW() - INTERVAL '1 days')
ON CONFLICT (id) DO UPDATE SET
  profile_id = EXCLUDED.profile_id,
  display_name = EXCLUDED.display_name,
  gender = EXCLUDED.gender,
  date_of_birth = EXCLUDED.date_of_birth,
  height_cm = EXCLUDED.height_cm,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  subcaste = EXCLUDED.subcaste,
  dosham = EXCLUDED.dosham,
  education = EXCLUDED.education,
  education_detail = EXCLUDED.education_detail,
  occupation = EXCLUDED.occupation,
  occupation_detail = EXCLUDED.occupation_detail,
  annual_income = EXCLUDED.annual_income,
  company_name = EXCLUDED.company_name,
  city = EXCLUDED.city,
  district = EXCLUDED.district,
  about_me = EXCLUDED.about_me,
  family_type = EXCLUDED.family_type,
  family_status = EXCLUDED.family_status,
  father_occupation = EXCLUDED.father_occupation,
  mother_occupation = EXCLUDED.mother_occupation,
  is_verified = EXCLUDED.is_verified,
  is_premium = EXCLUDED.is_premium,
  is_profile_complete = EXCLUDED.is_profile_complete,
  profile_completion_percent = EXCLUDED.profile_completion_percent,
  last_active_at = EXCLUDED.last_active_at;
INSERT INTO public.profiles (id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, father_occupation, mother_occupation, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at)
VALUES ('00000000-0000-4000-a000-000000000122', 'TM000290', 'Uma Balan', 'female', '1989-07-04', 156, 'never_married', 'Hindu', 'Yadav', 'Yadav subcaste', 'yes', 'B.Com', 'B.Com Graduate', 'Police Officer', 'Police Officer Details', '₹15 Lakhs - ₹20 Lakhs', 'TCS', 'Vellore', 'Vellore', 'Hi, I am Uma. I have completed my B.Com and am currently working as a Police Officer at TCS in Vellore. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'rich', 'Retired Employee', 'Homemaker', false, false, true, 100, NOW() - INTERVAL '1 days')
ON CONFLICT (id) DO UPDATE SET
  profile_id = EXCLUDED.profile_id,
  display_name = EXCLUDED.display_name,
  gender = EXCLUDED.gender,
  date_of_birth = EXCLUDED.date_of_birth,
  height_cm = EXCLUDED.height_cm,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  subcaste = EXCLUDED.subcaste,
  dosham = EXCLUDED.dosham,
  education = EXCLUDED.education,
  education_detail = EXCLUDED.education_detail,
  occupation = EXCLUDED.occupation,
  occupation_detail = EXCLUDED.occupation_detail,
  annual_income = EXCLUDED.annual_income,
  company_name = EXCLUDED.company_name,
  city = EXCLUDED.city,
  district = EXCLUDED.district,
  about_me = EXCLUDED.about_me,
  family_type = EXCLUDED.family_type,
  family_status = EXCLUDED.family_status,
  father_occupation = EXCLUDED.father_occupation,
  mother_occupation = EXCLUDED.mother_occupation,
  is_verified = EXCLUDED.is_verified,
  is_premium = EXCLUDED.is_premium,
  is_profile_complete = EXCLUDED.is_profile_complete,
  profile_completion_percent = EXCLUDED.profile_completion_percent,
  last_active_at = EXCLUDED.last_active_at;
INSERT INTO public.profiles (id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, father_occupation, mother_occupation, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at)
VALUES ('00000000-0000-4000-a000-000000000123', 'TM000291', 'Viswanathan Balan', 'male', '1993-09-18', 184, 'divorced', 'Hindu', 'Adi Dravida', 'Adi Dravida subcaste', 'no', 'M.Com', 'M.Com Graduate', 'College Professor', 'College Professor Details', '₹20 Lakhs+', 'Self Employed', 'Vellore', 'Vellore', 'Hi, I am Viswanathan. I have completed my M.Com and am currently working as a College Professor at Self Employed in Vellore. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'joint', 'rich', 'Retired Employee', 'Homemaker', true, false, true, 100, NOW() - INTERVAL '8 days')
ON CONFLICT (id) DO UPDATE SET
  profile_id = EXCLUDED.profile_id,
  display_name = EXCLUDED.display_name,
  gender = EXCLUDED.gender,
  date_of_birth = EXCLUDED.date_of_birth,
  height_cm = EXCLUDED.height_cm,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  subcaste = EXCLUDED.subcaste,
  dosham = EXCLUDED.dosham,
  education = EXCLUDED.education,
  education_detail = EXCLUDED.education_detail,
  occupation = EXCLUDED.occupation,
  occupation_detail = EXCLUDED.occupation_detail,
  annual_income = EXCLUDED.annual_income,
  company_name = EXCLUDED.company_name,
  city = EXCLUDED.city,
  district = EXCLUDED.district,
  about_me = EXCLUDED.about_me,
  family_type = EXCLUDED.family_type,
  family_status = EXCLUDED.family_status,
  father_occupation = EXCLUDED.father_occupation,
  mother_occupation = EXCLUDED.mother_occupation,
  is_verified = EXCLUDED.is_verified,
  is_premium = EXCLUDED.is_premium,
  is_profile_complete = EXCLUDED.is_profile_complete,
  profile_completion_percent = EXCLUDED.profile_completion_percent,
  last_active_at = EXCLUDED.last_active_at;
INSERT INTO public.profiles (id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, father_occupation, mother_occupation, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at)
VALUES ('00000000-0000-4000-a000-000000000124', 'TM000292', 'Nandhini Sundaram', 'female', '2004-08-19', 166, 'never_married', 'Hindu', 'Agamudayar', 'Agamudayar subcaste', 'no', 'B.E. / B.Tech', 'B.E. / B.Tech Graduate', 'Police Officer', 'Police Officer Details', '₹5 Lakhs - ₹7 Lakhs', 'Wipro', 'Tiruppur', 'Tiruppur', 'Hi, I am Nandhini. I have completed my B.E. / B.Tech and am currently working as a Police Officer at Wipro in Tiruppur. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'joint', 'middle_class', 'Retired Employee', 'Homemaker', true, false, true, 100, NOW() - INTERVAL '9 days')
ON CONFLICT (id) DO UPDATE SET
  profile_id = EXCLUDED.profile_id,
  display_name = EXCLUDED.display_name,
  gender = EXCLUDED.gender,
  date_of_birth = EXCLUDED.date_of_birth,
  height_cm = EXCLUDED.height_cm,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  subcaste = EXCLUDED.subcaste,
  dosham = EXCLUDED.dosham,
  education = EXCLUDED.education,
  education_detail = EXCLUDED.education_detail,
  occupation = EXCLUDED.occupation,
  occupation_detail = EXCLUDED.occupation_detail,
  annual_income = EXCLUDED.annual_income,
  company_name = EXCLUDED.company_name,
  city = EXCLUDED.city,
  district = EXCLUDED.district,
  about_me = EXCLUDED.about_me,
  family_type = EXCLUDED.family_type,
  family_status = EXCLUDED.family_status,
  father_occupation = EXCLUDED.father_occupation,
  mother_occupation = EXCLUDED.mother_occupation,
  is_verified = EXCLUDED.is_verified,
  is_premium = EXCLUDED.is_premium,
  is_profile_complete = EXCLUDED.is_profile_complete,
  profile_completion_percent = EXCLUDED.profile_completion_percent,
  last_active_at = EXCLUDED.last_active_at;
INSERT INTO public.profiles (id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, father_occupation, mother_occupation, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at)
VALUES ('00000000-0000-4000-a000-000000000125', 'TM000293', 'Ramesh Shankar', 'male', '2002-09-07', 185, 'divorced', 'Muslim', 'Marakayar', 'Marakayar subcaste', 'no', 'B.Com', 'B.Com Graduate', 'Government Officer', 'Government Officer Details', '₹7 Lakhs - ₹10 Lakhs', 'Cognizant', 'Vellore', 'Vellore', 'Hi, I am Ramesh. I have completed my B.Com and am currently working as a Government Officer at Cognizant in Vellore. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'middle_class', 'Retired Employee', 'Homemaker', true, false, true, 100, NOW() - INTERVAL '2 days')
ON CONFLICT (id) DO UPDATE SET
  profile_id = EXCLUDED.profile_id,
  display_name = EXCLUDED.display_name,
  gender = EXCLUDED.gender,
  date_of_birth = EXCLUDED.date_of_birth,
  height_cm = EXCLUDED.height_cm,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  subcaste = EXCLUDED.subcaste,
  dosham = EXCLUDED.dosham,
  education = EXCLUDED.education,
  education_detail = EXCLUDED.education_detail,
  occupation = EXCLUDED.occupation,
  occupation_detail = EXCLUDED.occupation_detail,
  annual_income = EXCLUDED.annual_income,
  company_name = EXCLUDED.company_name,
  city = EXCLUDED.city,
  district = EXCLUDED.district,
  about_me = EXCLUDED.about_me,
  family_type = EXCLUDED.family_type,
  family_status = EXCLUDED.family_status,
  father_occupation = EXCLUDED.father_occupation,
  mother_occupation = EXCLUDED.mother_occupation,
  is_verified = EXCLUDED.is_verified,
  is_premium = EXCLUDED.is_premium,
  is_profile_complete = EXCLUDED.is_profile_complete,
  profile_completion_percent = EXCLUDED.profile_completion_percent,
  last_active_at = EXCLUDED.last_active_at;
INSERT INTO public.profiles (id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, father_occupation, mother_occupation, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at)
VALUES ('00000000-0000-4000-a000-000000000126', 'TM000294', 'Saraswathi Nathan', 'female', '2005-08-15', 154, 'never_married', 'Muslim', 'Labbai', NULL, 'no', 'B.Sc', 'B.Sc Graduate', 'Police Officer', 'Police Officer Details', '₹10 Lakhs - ₹15 Lakhs', 'Private Practice', 'Erode', 'Erode', 'Hi, I am Saraswathi. I have completed my B.Sc and am currently working as a Police Officer at Private Practice in Erode. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'upper_middle_class', 'Retired Employee', 'Homemaker', true, false, true, 100, NOW() - INTERVAL '10 days')
ON CONFLICT (id) DO UPDATE SET
  profile_id = EXCLUDED.profile_id,
  display_name = EXCLUDED.display_name,
  gender = EXCLUDED.gender,
  date_of_birth = EXCLUDED.date_of_birth,
  height_cm = EXCLUDED.height_cm,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  subcaste = EXCLUDED.subcaste,
  dosham = EXCLUDED.dosham,
  education = EXCLUDED.education,
  education_detail = EXCLUDED.education_detail,
  occupation = EXCLUDED.occupation,
  occupation_detail = EXCLUDED.occupation_detail,
  annual_income = EXCLUDED.annual_income,
  company_name = EXCLUDED.company_name,
  city = EXCLUDED.city,
  district = EXCLUDED.district,
  about_me = EXCLUDED.about_me,
  family_type = EXCLUDED.family_type,
  family_status = EXCLUDED.family_status,
  father_occupation = EXCLUDED.father_occupation,
  mother_occupation = EXCLUDED.mother_occupation,
  is_verified = EXCLUDED.is_verified,
  is_premium = EXCLUDED.is_premium,
  is_profile_complete = EXCLUDED.is_profile_complete,
  profile_completion_percent = EXCLUDED.profile_completion_percent,
  last_active_at = EXCLUDED.last_active_at;
INSERT INTO public.profiles (id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, father_occupation, mother_occupation, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at)
VALUES ('00000000-0000-4000-a000-000000000127', 'TM000295', 'Srinivasan Samy', 'male', '1993-07-20', 173, 'never_married', 'Hindu', 'Arunthathiyar', 'Arunthathiyar subcaste', 'no', 'Ph.D', 'Ph.D Graduate', 'Doctor', 'Doctor Details', '₹7 Lakhs - ₹10 Lakhs', 'Cognizant', 'Kanchipuram', 'Kanchipuram', 'Hi, I am Srinivasan. I have completed my Ph.D and am currently working as a Doctor at Cognizant in Kanchipuram. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'upper_middle_class', 'Retired Employee', 'Homemaker', false, false, true, 100, NOW() - INTERVAL '10 days')
ON CONFLICT (id) DO UPDATE SET
  profile_id = EXCLUDED.profile_id,
  display_name = EXCLUDED.display_name,
  gender = EXCLUDED.gender,
  date_of_birth = EXCLUDED.date_of_birth,
  height_cm = EXCLUDED.height_cm,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  subcaste = EXCLUDED.subcaste,
  dosham = EXCLUDED.dosham,
  education = EXCLUDED.education,
  education_detail = EXCLUDED.education_detail,
  occupation = EXCLUDED.occupation,
  occupation_detail = EXCLUDED.occupation_detail,
  annual_income = EXCLUDED.annual_income,
  company_name = EXCLUDED.company_name,
  city = EXCLUDED.city,
  district = EXCLUDED.district,
  about_me = EXCLUDED.about_me,
  family_type = EXCLUDED.family_type,
  family_status = EXCLUDED.family_status,
  father_occupation = EXCLUDED.father_occupation,
  mother_occupation = EXCLUDED.mother_occupation,
  is_verified = EXCLUDED.is_verified,
  is_premium = EXCLUDED.is_premium,
  is_profile_complete = EXCLUDED.is_profile_complete,
  profile_completion_percent = EXCLUDED.profile_completion_percent,
  last_active_at = EXCLUDED.last_active_at;
INSERT INTO public.profiles (id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, father_occupation, mother_occupation, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at)
VALUES ('00000000-0000-4000-a000-000000000128', 'TM000296', 'Saraswathi Devan', 'female', '1996-07-12', 165, 'never_married', 'Christian', 'CSI Christian', 'CSI Christian subcaste', 'no', 'B.Com', 'B.Com Graduate', 'School Teacher', 'School Teacher Details', '₹20 Lakhs+', 'HCL', 'Salem', 'Salem', 'Hi, I am Saraswathi. I have completed my B.Com and am currently working as a School Teacher at HCL in Salem. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'middle_class', 'Retired Employee', 'Homemaker', false, false, true, 100, NOW() - INTERVAL '3 days')
ON CONFLICT (id) DO UPDATE SET
  profile_id = EXCLUDED.profile_id,
  display_name = EXCLUDED.display_name,
  gender = EXCLUDED.gender,
  date_of_birth = EXCLUDED.date_of_birth,
  height_cm = EXCLUDED.height_cm,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  subcaste = EXCLUDED.subcaste,
  dosham = EXCLUDED.dosham,
  education = EXCLUDED.education,
  education_detail = EXCLUDED.education_detail,
  occupation = EXCLUDED.occupation,
  occupation_detail = EXCLUDED.occupation_detail,
  annual_income = EXCLUDED.annual_income,
  company_name = EXCLUDED.company_name,
  city = EXCLUDED.city,
  district = EXCLUDED.district,
  about_me = EXCLUDED.about_me,
  family_type = EXCLUDED.family_type,
  family_status = EXCLUDED.family_status,
  father_occupation = EXCLUDED.father_occupation,
  mother_occupation = EXCLUDED.mother_occupation,
  is_verified = EXCLUDED.is_verified,
  is_premium = EXCLUDED.is_premium,
  is_profile_complete = EXCLUDED.is_profile_complete,
  profile_completion_percent = EXCLUDED.profile_completion_percent,
  last_active_at = EXCLUDED.last_active_at;
INSERT INTO public.profiles (id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, father_occupation, mother_occupation, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at)
VALUES ('00000000-0000-4000-a000-000000000129', 'TM000297', 'Suresh Murthy', 'male', '2003-08-22', 166, 'never_married', 'Hindu', 'Gounder', 'Gounder subcaste', 'no', 'B.Sc', 'B.Sc Graduate', 'College Professor', 'College Professor Details', '₹15 Lakhs - ₹20 Lakhs', 'Wipro', 'Coimbatore', 'Coimbatore', 'Hi, I am Suresh. I have completed my B.Sc and am currently working as a College Professor at Wipro in Coimbatore. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'upper_middle_class', 'Retired Employee', 'Homemaker', true, false, true, 100, NOW() - INTERVAL '4 days')
ON CONFLICT (id) DO UPDATE SET
  profile_id = EXCLUDED.profile_id,
  display_name = EXCLUDED.display_name,
  gender = EXCLUDED.gender,
  date_of_birth = EXCLUDED.date_of_birth,
  height_cm = EXCLUDED.height_cm,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  subcaste = EXCLUDED.subcaste,
  dosham = EXCLUDED.dosham,
  education = EXCLUDED.education,
  education_detail = EXCLUDED.education_detail,
  occupation = EXCLUDED.occupation,
  occupation_detail = EXCLUDED.occupation_detail,
  annual_income = EXCLUDED.annual_income,
  company_name = EXCLUDED.company_name,
  city = EXCLUDED.city,
  district = EXCLUDED.district,
  about_me = EXCLUDED.about_me,
  family_type = EXCLUDED.family_type,
  family_status = EXCLUDED.family_status,
  father_occupation = EXCLUDED.father_occupation,
  mother_occupation = EXCLUDED.mother_occupation,
  is_verified = EXCLUDED.is_verified,
  is_premium = EXCLUDED.is_premium,
  is_profile_complete = EXCLUDED.is_profile_complete,
  profile_completion_percent = EXCLUDED.profile_completion_percent,
  last_active_at = EXCLUDED.last_active_at;
INSERT INTO public.profiles (id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, father_occupation, mother_occupation, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at)
VALUES ('00000000-0000-4000-a000-00000000012a', 'TM000298', 'Keerthana Raj', 'female', '2005-04-13', 165, 'divorced', 'Hindu', 'Nadar', NULL, 'no', 'Ph.D', 'Ph.D Graduate', 'Software Engineer', 'Software Engineer Details', '₹7 Lakhs - ₹10 Lakhs', 'Zoho', 'Kanchipuram', 'Kanchipuram', 'Hi, I am Keerthana. I have completed my Ph.D and am currently working as a Software Engineer at Zoho in Kanchipuram. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'rich', 'Retired Employee', 'Homemaker', true, true, true, 100, NOW() - INTERVAL '6 days')
ON CONFLICT (id) DO UPDATE SET
  profile_id = EXCLUDED.profile_id,
  display_name = EXCLUDED.display_name,
  gender = EXCLUDED.gender,
  date_of_birth = EXCLUDED.date_of_birth,
  height_cm = EXCLUDED.height_cm,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  subcaste = EXCLUDED.subcaste,
  dosham = EXCLUDED.dosham,
  education = EXCLUDED.education,
  education_detail = EXCLUDED.education_detail,
  occupation = EXCLUDED.occupation,
  occupation_detail = EXCLUDED.occupation_detail,
  annual_income = EXCLUDED.annual_income,
  company_name = EXCLUDED.company_name,
  city = EXCLUDED.city,
  district = EXCLUDED.district,
  about_me = EXCLUDED.about_me,
  family_type = EXCLUDED.family_type,
  family_status = EXCLUDED.family_status,
  father_occupation = EXCLUDED.father_occupation,
  mother_occupation = EXCLUDED.mother_occupation,
  is_verified = EXCLUDED.is_verified,
  is_premium = EXCLUDED.is_premium,
  is_profile_complete = EXCLUDED.is_profile_complete,
  profile_completion_percent = EXCLUDED.profile_completion_percent,
  last_active_at = EXCLUDED.last_active_at;
INSERT INTO public.profiles (id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, father_occupation, mother_occupation, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at)
VALUES ('00000000-0000-4000-a000-00000000012b', 'TM000299', 'Rajesh Selvan', 'male', '1998-08-08', 178, 'never_married', 'Hindu', 'Kallar', 'Kallar subcaste', 'no', 'M.A', 'M.A Graduate', 'Government Officer', 'Government Officer Details', '₹20 Lakhs+', 'TCS', 'Madurai', 'Madurai', 'Hi, I am Rajesh. I have completed my M.A and am currently working as a Government Officer at TCS in Madurai. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'rich', 'Retired Employee', 'Homemaker', true, false, true, 100, NOW() - INTERVAL '0 days')
ON CONFLICT (id) DO UPDATE SET
  profile_id = EXCLUDED.profile_id,
  display_name = EXCLUDED.display_name,
  gender = EXCLUDED.gender,
  date_of_birth = EXCLUDED.date_of_birth,
  height_cm = EXCLUDED.height_cm,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  subcaste = EXCLUDED.subcaste,
  dosham = EXCLUDED.dosham,
  education = EXCLUDED.education,
  education_detail = EXCLUDED.education_detail,
  occupation = EXCLUDED.occupation,
  occupation_detail = EXCLUDED.occupation_detail,
  annual_income = EXCLUDED.annual_income,
  company_name = EXCLUDED.company_name,
  city = EXCLUDED.city,
  district = EXCLUDED.district,
  about_me = EXCLUDED.about_me,
  family_type = EXCLUDED.family_type,
  family_status = EXCLUDED.family_status,
  father_occupation = EXCLUDED.father_occupation,
  mother_occupation = EXCLUDED.mother_occupation,
  is_verified = EXCLUDED.is_verified,
  is_premium = EXCLUDED.is_premium,
  is_profile_complete = EXCLUDED.is_profile_complete,
  profile_completion_percent = EXCLUDED.profile_completion_percent,
  last_active_at = EXCLUDED.last_active_at;
INSERT INTO public.profiles (id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, father_occupation, mother_occupation, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at)
VALUES ('00000000-0000-4000-a000-00000000012c', 'TM000300', 'Rajeshwari Kumar', 'female', '1997-01-26', 152, 'never_married', 'Hindu', 'Vishwakarma', NULL, 'no', 'M.C.A', 'M.C.A Graduate', 'School Teacher', 'School Teacher Details', '₹3 Lakhs - ₹5 Lakhs', 'Cognizant', 'Tiruppur', 'Tiruppur', 'Hi, I am Rajeshwari. I have completed my M.C.A and am currently working as a School Teacher at Cognizant in Tiruppur. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'middle_class', 'Retired Employee', 'Homemaker', true, false, true, 100, NOW() - INTERVAL '6 days')
ON CONFLICT (id) DO UPDATE SET
  profile_id = EXCLUDED.profile_id,
  display_name = EXCLUDED.display_name,
  gender = EXCLUDED.gender,
  date_of_birth = EXCLUDED.date_of_birth,
  height_cm = EXCLUDED.height_cm,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  subcaste = EXCLUDED.subcaste,
  dosham = EXCLUDED.dosham,
  education = EXCLUDED.education,
  education_detail = EXCLUDED.education_detail,
  occupation = EXCLUDED.occupation,
  occupation_detail = EXCLUDED.occupation_detail,
  annual_income = EXCLUDED.annual_income,
  company_name = EXCLUDED.company_name,
  city = EXCLUDED.city,
  district = EXCLUDED.district,
  about_me = EXCLUDED.about_me,
  family_type = EXCLUDED.family_type,
  family_status = EXCLUDED.family_status,
  father_occupation = EXCLUDED.father_occupation,
  mother_occupation = EXCLUDED.mother_occupation,
  is_verified = EXCLUDED.is_verified,
  is_premium = EXCLUDED.is_premium,
  is_profile_complete = EXCLUDED.is_profile_complete,
  profile_completion_percent = EXCLUDED.profile_completion_percent,
  last_active_at = EXCLUDED.last_active_at;
INSERT INTO public.profiles (id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, father_occupation, mother_occupation, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at)
VALUES ('00000000-0000-4000-a000-00000000012d', 'TM000301', 'Vinoth Naicker', 'male', '1998-01-16', 167, 'divorced', 'Hindu', 'Kallar', 'Kallar subcaste', 'yes', 'B.Ed', 'B.Ed Graduate', 'Architect', 'Architect Details', '₹20 Lakhs+', 'TCS', 'Thanjavur', 'Thanjavur', 'Hi, I am Vinoth. I have completed my B.Ed and am currently working as a Architect at TCS in Thanjavur. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'joint', 'middle_class', 'Retired Employee', 'Homemaker', true, false, true, 100, NOW() - INTERVAL '5 days')
ON CONFLICT (id) DO UPDATE SET
  profile_id = EXCLUDED.profile_id,
  display_name = EXCLUDED.display_name,
  gender = EXCLUDED.gender,
  date_of_birth = EXCLUDED.date_of_birth,
  height_cm = EXCLUDED.height_cm,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  subcaste = EXCLUDED.subcaste,
  dosham = EXCLUDED.dosham,
  education = EXCLUDED.education,
  education_detail = EXCLUDED.education_detail,
  occupation = EXCLUDED.occupation,
  occupation_detail = EXCLUDED.occupation_detail,
  annual_income = EXCLUDED.annual_income,
  company_name = EXCLUDED.company_name,
  city = EXCLUDED.city,
  district = EXCLUDED.district,
  about_me = EXCLUDED.about_me,
  family_type = EXCLUDED.family_type,
  family_status = EXCLUDED.family_status,
  father_occupation = EXCLUDED.father_occupation,
  mother_occupation = EXCLUDED.mother_occupation,
  is_verified = EXCLUDED.is_verified,
  is_premium = EXCLUDED.is_premium,
  is_profile_complete = EXCLUDED.is_profile_complete,
  profile_completion_percent = EXCLUDED.profile_completion_percent,
  last_active_at = EXCLUDED.last_active_at;
INSERT INTO public.profiles (id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, father_occupation, mother_occupation, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at)
VALUES ('00000000-0000-4000-a000-00000000012e', 'TM000302', 'Shanthi Samy', 'female', '1990-08-14', 157, 'divorced', 'Hindu', 'Mudaliar', NULL, 'no', 'B.A', 'B.A Graduate', 'Architect', 'Architect Details', '₹3 Lakhs - ₹5 Lakhs', 'HCL', 'Erode', 'Erode', 'Hi, I am Shanthi. I have completed my B.A and am currently working as a Architect at HCL in Erode. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'rich', 'Retired Employee', 'Homemaker', false, false, true, 100, NOW() - INTERVAL '0 days')
ON CONFLICT (id) DO UPDATE SET
  profile_id = EXCLUDED.profile_id,
  display_name = EXCLUDED.display_name,
  gender = EXCLUDED.gender,
  date_of_birth = EXCLUDED.date_of_birth,
  height_cm = EXCLUDED.height_cm,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  subcaste = EXCLUDED.subcaste,
  dosham = EXCLUDED.dosham,
  education = EXCLUDED.education,
  education_detail = EXCLUDED.education_detail,
  occupation = EXCLUDED.occupation,
  occupation_detail = EXCLUDED.occupation_detail,
  annual_income = EXCLUDED.annual_income,
  company_name = EXCLUDED.company_name,
  city = EXCLUDED.city,
  district = EXCLUDED.district,
  about_me = EXCLUDED.about_me,
  family_type = EXCLUDED.family_type,
  family_status = EXCLUDED.family_status,
  father_occupation = EXCLUDED.father_occupation,
  mother_occupation = EXCLUDED.mother_occupation,
  is_verified = EXCLUDED.is_verified,
  is_premium = EXCLUDED.is_premium,
  is_profile_complete = EXCLUDED.is_profile_complete,
  profile_completion_percent = EXCLUDED.profile_completion_percent,
  last_active_at = EXCLUDED.last_active_at;
INSERT INTO public.profiles (id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, father_occupation, mother_occupation, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at)
VALUES ('00000000-0000-4000-a000-00000000012f', 'TM000303', 'Vetrivel Naicker', 'male', '1996-02-07', 163, 'never_married', 'Hindu', 'Nadar', NULL, 'no', 'B.A', 'B.A Graduate', 'HR Specialist', 'HR Specialist Details', '₹15 Lakhs - ₹20 Lakhs', 'Zoho', 'Kanchipuram', 'Kanchipuram', 'Hi, I am Vetrivel. I have completed my B.A and am currently working as a HR Specialist at Zoho in Kanchipuram. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'upper_middle_class', 'Retired Employee', 'Homemaker', false, false, true, 100, NOW() - INTERVAL '4 days')
ON CONFLICT (id) DO UPDATE SET
  profile_id = EXCLUDED.profile_id,
  display_name = EXCLUDED.display_name,
  gender = EXCLUDED.gender,
  date_of_birth = EXCLUDED.date_of_birth,
  height_cm = EXCLUDED.height_cm,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  subcaste = EXCLUDED.subcaste,
  dosham = EXCLUDED.dosham,
  education = EXCLUDED.education,
  education_detail = EXCLUDED.education_detail,
  occupation = EXCLUDED.occupation,
  occupation_detail = EXCLUDED.occupation_detail,
  annual_income = EXCLUDED.annual_income,
  company_name = EXCLUDED.company_name,
  city = EXCLUDED.city,
  district = EXCLUDED.district,
  about_me = EXCLUDED.about_me,
  family_type = EXCLUDED.family_type,
  family_status = EXCLUDED.family_status,
  father_occupation = EXCLUDED.father_occupation,
  mother_occupation = EXCLUDED.mother_occupation,
  is_verified = EXCLUDED.is_verified,
  is_premium = EXCLUDED.is_premium,
  is_profile_complete = EXCLUDED.is_profile_complete,
  profile_completion_percent = EXCLUDED.profile_completion_percent,
  last_active_at = EXCLUDED.last_active_at;
INSERT INTO public.profiles (id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, father_occupation, mother_occupation, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at)
VALUES ('00000000-0000-4000-a000-000000000130', 'TM000304', 'Chitra Devan', 'female', '1990-04-03', 154, 'never_married', 'Hindu', 'Gounder', NULL, 'no', 'B.Com', 'B.Com Graduate', 'Business Owner', 'Business Owner Details', '₹5 Lakhs - ₹7 Lakhs', 'Government Service', 'Tiruppur', 'Tiruppur', 'Hi, I am Chitra. I have completed my B.Com and am currently working as a Business Owner at Government Service in Tiruppur. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'upper_middle_class', 'Retired Employee', 'Homemaker', true, false, true, 100, NOW() - INTERVAL '0 days')
ON CONFLICT (id) DO UPDATE SET
  profile_id = EXCLUDED.profile_id,
  display_name = EXCLUDED.display_name,
  gender = EXCLUDED.gender,
  date_of_birth = EXCLUDED.date_of_birth,
  height_cm = EXCLUDED.height_cm,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  subcaste = EXCLUDED.subcaste,
  dosham = EXCLUDED.dosham,
  education = EXCLUDED.education,
  education_detail = EXCLUDED.education_detail,
  occupation = EXCLUDED.occupation,
  occupation_detail = EXCLUDED.occupation_detail,
  annual_income = EXCLUDED.annual_income,
  company_name = EXCLUDED.company_name,
  city = EXCLUDED.city,
  district = EXCLUDED.district,
  about_me = EXCLUDED.about_me,
  family_type = EXCLUDED.family_type,
  family_status = EXCLUDED.family_status,
  father_occupation = EXCLUDED.father_occupation,
  mother_occupation = EXCLUDED.mother_occupation,
  is_verified = EXCLUDED.is_verified,
  is_premium = EXCLUDED.is_premium,
  is_profile_complete = EXCLUDED.is_profile_complete,
  profile_completion_percent = EXCLUDED.profile_completion_percent,
  last_active_at = EXCLUDED.last_active_at;
INSERT INTO public.profiles (id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, father_occupation, mother_occupation, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at)
VALUES ('00000000-0000-4000-a000-000000000131', 'TM000305', 'Ganesan Nathan', 'male', '1990-08-17', 187, 'never_married', 'Muslim', 'Rawther', NULL, 'no', 'B.A', 'B.A Graduate', 'Civil Engineer', 'Civil Engineer Details', '₹15 Lakhs - ₹20 Lakhs', 'Cognizant', 'Erode', 'Erode', 'Hi, I am Ganesan. I have completed my B.A and am currently working as a Civil Engineer at Cognizant in Erode. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'joint', 'middle_class', 'Retired Employee', 'Homemaker', true, false, true, 100, NOW() - INTERVAL '2 days')
ON CONFLICT (id) DO UPDATE SET
  profile_id = EXCLUDED.profile_id,
  display_name = EXCLUDED.display_name,
  gender = EXCLUDED.gender,
  date_of_birth = EXCLUDED.date_of_birth,
  height_cm = EXCLUDED.height_cm,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  subcaste = EXCLUDED.subcaste,
  dosham = EXCLUDED.dosham,
  education = EXCLUDED.education,
  education_detail = EXCLUDED.education_detail,
  occupation = EXCLUDED.occupation,
  occupation_detail = EXCLUDED.occupation_detail,
  annual_income = EXCLUDED.annual_income,
  company_name = EXCLUDED.company_name,
  city = EXCLUDED.city,
  district = EXCLUDED.district,
  about_me = EXCLUDED.about_me,
  family_type = EXCLUDED.family_type,
  family_status = EXCLUDED.family_status,
  father_occupation = EXCLUDED.father_occupation,
  mother_occupation = EXCLUDED.mother_occupation,
  is_verified = EXCLUDED.is_verified,
  is_premium = EXCLUDED.is_premium,
  is_profile_complete = EXCLUDED.is_profile_complete,
  profile_completion_percent = EXCLUDED.profile_completion_percent,
  last_active_at = EXCLUDED.last_active_at;
INSERT INTO public.profiles (id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, father_occupation, mother_occupation, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at)
VALUES ('00000000-0000-4000-a000-000000000132', 'TM000306', 'Banumathi Swamy', 'female', '2004-11-09', 155, 'divorced', 'Hindu', 'Sengunthar', 'Sengunthar subcaste', 'no', 'M.Com', 'M.Com Graduate', 'Government Officer', 'Government Officer Details', '₹15 Lakhs - ₹20 Lakhs', 'HCL', 'Erode', 'Erode', 'Hi, I am Banumathi. I have completed my M.Com and am currently working as a Government Officer at HCL in Erode. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'upper_middle_class', 'Retired Employee', 'Homemaker', true, true, true, 100, NOW() - INTERVAL '9 days')
ON CONFLICT (id) DO UPDATE SET
  profile_id = EXCLUDED.profile_id,
  display_name = EXCLUDED.display_name,
  gender = EXCLUDED.gender,
  date_of_birth = EXCLUDED.date_of_birth,
  height_cm = EXCLUDED.height_cm,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  subcaste = EXCLUDED.subcaste,
  dosham = EXCLUDED.dosham,
  education = EXCLUDED.education,
  education_detail = EXCLUDED.education_detail,
  occupation = EXCLUDED.occupation,
  occupation_detail = EXCLUDED.occupation_detail,
  annual_income = EXCLUDED.annual_income,
  company_name = EXCLUDED.company_name,
  city = EXCLUDED.city,
  district = EXCLUDED.district,
  about_me = EXCLUDED.about_me,
  family_type = EXCLUDED.family_type,
  family_status = EXCLUDED.family_status,
  father_occupation = EXCLUDED.father_occupation,
  mother_occupation = EXCLUDED.mother_occupation,
  is_verified = EXCLUDED.is_verified,
  is_premium = EXCLUDED.is_premium,
  is_profile_complete = EXCLUDED.is_profile_complete,
  profile_completion_percent = EXCLUDED.profile_completion_percent,
  last_active_at = EXCLUDED.last_active_at;
INSERT INTO public.profiles (id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, father_occupation, mother_occupation, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at)
VALUES ('00000000-0000-4000-a000-000000000133', 'TM000307', 'Vinoth Swamy', 'male', '2003-09-25', 175, 'divorced', 'Hindu', 'Sengunthar', 'Sengunthar subcaste', 'no', 'M.B.A', 'M.B.A Graduate', 'Auditor', 'Auditor Details', '₹7 Lakhs - ₹10 Lakhs', 'Accenture', 'Coimbatore', 'Coimbatore', 'Hi, I am Vinoth. I have completed my M.B.A and am currently working as a Auditor at Accenture in Coimbatore. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'rich', 'Retired Employee', 'Homemaker', false, true, true, 100, NOW() - INTERVAL '6 days')
ON CONFLICT (id) DO UPDATE SET
  profile_id = EXCLUDED.profile_id,
  display_name = EXCLUDED.display_name,
  gender = EXCLUDED.gender,
  date_of_birth = EXCLUDED.date_of_birth,
  height_cm = EXCLUDED.height_cm,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  subcaste = EXCLUDED.subcaste,
  dosham = EXCLUDED.dosham,
  education = EXCLUDED.education,
  education_detail = EXCLUDED.education_detail,
  occupation = EXCLUDED.occupation,
  occupation_detail = EXCLUDED.occupation_detail,
  annual_income = EXCLUDED.annual_income,
  company_name = EXCLUDED.company_name,
  city = EXCLUDED.city,
  district = EXCLUDED.district,
  about_me = EXCLUDED.about_me,
  family_type = EXCLUDED.family_type,
  family_status = EXCLUDED.family_status,
  father_occupation = EXCLUDED.father_occupation,
  mother_occupation = EXCLUDED.mother_occupation,
  is_verified = EXCLUDED.is_verified,
  is_premium = EXCLUDED.is_premium,
  is_profile_complete = EXCLUDED.is_profile_complete,
  profile_completion_percent = EXCLUDED.profile_completion_percent,
  last_active_at = EXCLUDED.last_active_at;
INSERT INTO public.profiles (id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, father_occupation, mother_occupation, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at)
VALUES ('00000000-0000-4000-a000-000000000134', 'TM000308', 'Pooja Devan', 'female', '1993-09-26', 166, 'never_married', 'Hindu', 'Pillai', 'Pillai subcaste', 'no', 'Ph.D', 'Ph.D Graduate', 'School Teacher', 'School Teacher Details', '₹20 Lakhs+', 'Zoho', 'Thoothukudi', 'Tuticorin', 'Hi, I am Pooja. I have completed my Ph.D and am currently working as a School Teacher at Zoho in Thoothukudi. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'upper_middle_class', 'Retired Employee', 'Homemaker', true, false, true, 100, NOW() - INTERVAL '2 days')
ON CONFLICT (id) DO UPDATE SET
  profile_id = EXCLUDED.profile_id,
  display_name = EXCLUDED.display_name,
  gender = EXCLUDED.gender,
  date_of_birth = EXCLUDED.date_of_birth,
  height_cm = EXCLUDED.height_cm,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  subcaste = EXCLUDED.subcaste,
  dosham = EXCLUDED.dosham,
  education = EXCLUDED.education,
  education_detail = EXCLUDED.education_detail,
  occupation = EXCLUDED.occupation,
  occupation_detail = EXCLUDED.occupation_detail,
  annual_income = EXCLUDED.annual_income,
  company_name = EXCLUDED.company_name,
  city = EXCLUDED.city,
  district = EXCLUDED.district,
  about_me = EXCLUDED.about_me,
  family_type = EXCLUDED.family_type,
  family_status = EXCLUDED.family_status,
  father_occupation = EXCLUDED.father_occupation,
  mother_occupation = EXCLUDED.mother_occupation,
  is_verified = EXCLUDED.is_verified,
  is_premium = EXCLUDED.is_premium,
  is_profile_complete = EXCLUDED.is_profile_complete,
  profile_completion_percent = EXCLUDED.profile_completion_percent,
  last_active_at = EXCLUDED.last_active_at;
INSERT INTO public.profiles (id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, father_occupation, mother_occupation, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at)
VALUES ('00000000-0000-4000-a000-000000000135', 'TM000309', 'Ramesh Kumar', 'male', '2001-06-08', 183, 'never_married', 'Hindu', 'Adi Dravida', NULL, 'yes', 'M.Com', 'M.Com Graduate', 'Police Officer', 'Police Officer Details', '₹10 Lakhs - ₹15 Lakhs', 'Accenture', 'Erode', 'Erode', 'Hi, I am Ramesh. I have completed my M.Com and am currently working as a Police Officer at Accenture in Erode. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'joint', 'rich', 'Retired Employee', 'Homemaker', true, true, true, 100, NOW() - INTERVAL '2 days')
ON CONFLICT (id) DO UPDATE SET
  profile_id = EXCLUDED.profile_id,
  display_name = EXCLUDED.display_name,
  gender = EXCLUDED.gender,
  date_of_birth = EXCLUDED.date_of_birth,
  height_cm = EXCLUDED.height_cm,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  subcaste = EXCLUDED.subcaste,
  dosham = EXCLUDED.dosham,
  education = EXCLUDED.education,
  education_detail = EXCLUDED.education_detail,
  occupation = EXCLUDED.occupation,
  occupation_detail = EXCLUDED.occupation_detail,
  annual_income = EXCLUDED.annual_income,
  company_name = EXCLUDED.company_name,
  city = EXCLUDED.city,
  district = EXCLUDED.district,
  about_me = EXCLUDED.about_me,
  family_type = EXCLUDED.family_type,
  family_status = EXCLUDED.family_status,
  father_occupation = EXCLUDED.father_occupation,
  mother_occupation = EXCLUDED.mother_occupation,
  is_verified = EXCLUDED.is_verified,
  is_premium = EXCLUDED.is_premium,
  is_profile_complete = EXCLUDED.is_profile_complete,
  profile_completion_percent = EXCLUDED.profile_completion_percent,
  last_active_at = EXCLUDED.last_active_at;
INSERT INTO public.profiles (id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, father_occupation, mother_occupation, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at)
VALUES ('00000000-0000-4000-a000-000000000136', 'TM000310', 'Malathi Samy', 'female', '1989-01-01', 174, 'never_married', 'Hindu', 'Adi Dravida', NULL, 'yes', 'M.A', 'M.A Graduate', 'School Teacher', 'School Teacher Details', '₹3 Lakhs - ₹5 Lakhs', 'Cognizant', 'Tiruppur', 'Tiruppur', 'Hi, I am Malathi. I have completed my M.A and am currently working as a School Teacher at Cognizant in Tiruppur. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'joint', 'middle_class', 'Retired Employee', 'Homemaker', true, false, true, 100, NOW() - INTERVAL '0 days')
ON CONFLICT (id) DO UPDATE SET
  profile_id = EXCLUDED.profile_id,
  display_name = EXCLUDED.display_name,
  gender = EXCLUDED.gender,
  date_of_birth = EXCLUDED.date_of_birth,
  height_cm = EXCLUDED.height_cm,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  subcaste = EXCLUDED.subcaste,
  dosham = EXCLUDED.dosham,
  education = EXCLUDED.education,
  education_detail = EXCLUDED.education_detail,
  occupation = EXCLUDED.occupation,
  occupation_detail = EXCLUDED.occupation_detail,
  annual_income = EXCLUDED.annual_income,
  company_name = EXCLUDED.company_name,
  city = EXCLUDED.city,
  district = EXCLUDED.district,
  about_me = EXCLUDED.about_me,
  family_type = EXCLUDED.family_type,
  family_status = EXCLUDED.family_status,
  father_occupation = EXCLUDED.father_occupation,
  mother_occupation = EXCLUDED.mother_occupation,
  is_verified = EXCLUDED.is_verified,
  is_premium = EXCLUDED.is_premium,
  is_profile_complete = EXCLUDED.is_profile_complete,
  profile_completion_percent = EXCLUDED.profile_completion_percent,
  last_active_at = EXCLUDED.last_active_at;
INSERT INTO public.profiles (id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, father_occupation, mother_occupation, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at)
VALUES ('00000000-0000-4000-a000-000000000137', 'TM000311', 'Anand Samy', 'male', '1997-02-06', 185, 'never_married', 'Hindu', 'Naicker', NULL, 'yes', 'M.C.A', 'M.C.A Graduate', 'Auditor', 'Auditor Details', '₹7 Lakhs - ₹10 Lakhs', 'Cognizant', 'Chennai', 'Chennai', 'Hi, I am Anand. I have completed my M.C.A and am currently working as a Auditor at Cognizant in Chennai. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'joint', 'rich', 'Retired Employee', 'Homemaker', true, false, true, 100, NOW() - INTERVAL '7 days')
ON CONFLICT (id) DO UPDATE SET
  profile_id = EXCLUDED.profile_id,
  display_name = EXCLUDED.display_name,
  gender = EXCLUDED.gender,
  date_of_birth = EXCLUDED.date_of_birth,
  height_cm = EXCLUDED.height_cm,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  subcaste = EXCLUDED.subcaste,
  dosham = EXCLUDED.dosham,
  education = EXCLUDED.education,
  education_detail = EXCLUDED.education_detail,
  occupation = EXCLUDED.occupation,
  occupation_detail = EXCLUDED.occupation_detail,
  annual_income = EXCLUDED.annual_income,
  company_name = EXCLUDED.company_name,
  city = EXCLUDED.city,
  district = EXCLUDED.district,
  about_me = EXCLUDED.about_me,
  family_type = EXCLUDED.family_type,
  family_status = EXCLUDED.family_status,
  father_occupation = EXCLUDED.father_occupation,
  mother_occupation = EXCLUDED.mother_occupation,
  is_verified = EXCLUDED.is_verified,
  is_premium = EXCLUDED.is_premium,
  is_profile_complete = EXCLUDED.is_profile_complete,
  profile_completion_percent = EXCLUDED.profile_completion_percent,
  last_active_at = EXCLUDED.last_active_at;
INSERT INTO public.profiles (id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, father_occupation, mother_occupation, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at)
VALUES ('00000000-0000-4000-a000-000000000138', 'TM000312', 'Vijaya Kumar', 'female', '1988-07-21', 158, 'never_married', 'Hindu', 'Mudaliar', 'Mudaliar subcaste', 'no', 'B.Ed', 'B.Ed Graduate', 'Auditor', 'Auditor Details', '₹15 Lakhs - ₹20 Lakhs', 'Government Service', 'Kanchipuram', 'Kanchipuram', 'Hi, I am Vijaya. I have completed my B.Ed and am currently working as a Auditor at Government Service in Kanchipuram. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'rich', 'Retired Employee', 'Homemaker', true, false, true, 100, NOW() - INTERVAL '8 days')
ON CONFLICT (id) DO UPDATE SET
  profile_id = EXCLUDED.profile_id,
  display_name = EXCLUDED.display_name,
  gender = EXCLUDED.gender,
  date_of_birth = EXCLUDED.date_of_birth,
  height_cm = EXCLUDED.height_cm,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  subcaste = EXCLUDED.subcaste,
  dosham = EXCLUDED.dosham,
  education = EXCLUDED.education,
  education_detail = EXCLUDED.education_detail,
  occupation = EXCLUDED.occupation,
  occupation_detail = EXCLUDED.occupation_detail,
  annual_income = EXCLUDED.annual_income,
  company_name = EXCLUDED.company_name,
  city = EXCLUDED.city,
  district = EXCLUDED.district,
  about_me = EXCLUDED.about_me,
  family_type = EXCLUDED.family_type,
  family_status = EXCLUDED.family_status,
  father_occupation = EXCLUDED.father_occupation,
  mother_occupation = EXCLUDED.mother_occupation,
  is_verified = EXCLUDED.is_verified,
  is_premium = EXCLUDED.is_premium,
  is_profile_complete = EXCLUDED.is_profile_complete,
  profile_completion_percent = EXCLUDED.profile_completion_percent,
  last_active_at = EXCLUDED.last_active_at;
INSERT INTO public.profiles (id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, father_occupation, mother_occupation, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at)
VALUES ('00000000-0000-4000-a000-000000000139', 'TM000313', 'Mohan Selvan', 'male', '1990-05-08', 184, 'never_married', 'Muslim', 'Labbai', NULL, 'no', 'M.C.A', 'M.C.A Graduate', 'Advocate', 'Advocate Details', '₹5 Lakhs - ₹7 Lakhs', 'Zoho', 'Thoothukudi', 'Tuticorin', 'Hi, I am Mohan. I have completed my M.C.A and am currently working as a Advocate at Zoho in Thoothukudi. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'rich', 'Retired Employee', 'Homemaker', false, false, true, 100, NOW() - INTERVAL '5 days')
ON CONFLICT (id) DO UPDATE SET
  profile_id = EXCLUDED.profile_id,
  display_name = EXCLUDED.display_name,
  gender = EXCLUDED.gender,
  date_of_birth = EXCLUDED.date_of_birth,
  height_cm = EXCLUDED.height_cm,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  subcaste = EXCLUDED.subcaste,
  dosham = EXCLUDED.dosham,
  education = EXCLUDED.education,
  education_detail = EXCLUDED.education_detail,
  occupation = EXCLUDED.occupation,
  occupation_detail = EXCLUDED.occupation_detail,
  annual_income = EXCLUDED.annual_income,
  company_name = EXCLUDED.company_name,
  city = EXCLUDED.city,
  district = EXCLUDED.district,
  about_me = EXCLUDED.about_me,
  family_type = EXCLUDED.family_type,
  family_status = EXCLUDED.family_status,
  father_occupation = EXCLUDED.father_occupation,
  mother_occupation = EXCLUDED.mother_occupation,
  is_verified = EXCLUDED.is_verified,
  is_premium = EXCLUDED.is_premium,
  is_profile_complete = EXCLUDED.is_profile_complete,
  profile_completion_percent = EXCLUDED.profile_completion_percent,
  last_active_at = EXCLUDED.last_active_at;
INSERT INTO public.profiles (id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, father_occupation, mother_occupation, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at)
VALUES ('00000000-0000-4000-a000-00000000013a', 'TM000314', 'Parvathi Devan', 'female', '1988-07-02', 165, 'divorced', 'Hindu', 'Thevar', NULL, 'yes', 'M.C.A', 'M.C.A Graduate', 'Software Engineer', 'Software Engineer Details', '₹10 Lakhs - ₹15 Lakhs', 'Self Employed', 'Kanchipuram', 'Kanchipuram', 'Hi, I am Parvathi. I have completed my M.C.A and am currently working as a Software Engineer at Self Employed in Kanchipuram. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'rich', 'Retired Employee', 'Homemaker', true, false, true, 100, NOW() - INTERVAL '5 days')
ON CONFLICT (id) DO UPDATE SET
  profile_id = EXCLUDED.profile_id,
  display_name = EXCLUDED.display_name,
  gender = EXCLUDED.gender,
  date_of_birth = EXCLUDED.date_of_birth,
  height_cm = EXCLUDED.height_cm,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  subcaste = EXCLUDED.subcaste,
  dosham = EXCLUDED.dosham,
  education = EXCLUDED.education,
  education_detail = EXCLUDED.education_detail,
  occupation = EXCLUDED.occupation,
  occupation_detail = EXCLUDED.occupation_detail,
  annual_income = EXCLUDED.annual_income,
  company_name = EXCLUDED.company_name,
  city = EXCLUDED.city,
  district = EXCLUDED.district,
  about_me = EXCLUDED.about_me,
  family_type = EXCLUDED.family_type,
  family_status = EXCLUDED.family_status,
  father_occupation = EXCLUDED.father_occupation,
  mother_occupation = EXCLUDED.mother_occupation,
  is_verified = EXCLUDED.is_verified,
  is_premium = EXCLUDED.is_premium,
  is_profile_complete = EXCLUDED.is_profile_complete,
  profile_completion_percent = EXCLUDED.profile_completion_percent,
  last_active_at = EXCLUDED.last_active_at;
INSERT INTO public.profiles (id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, father_occupation, mother_occupation, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at)
VALUES ('00000000-0000-4000-a000-00000000013b', 'TM000315', 'Muthu Devan', 'male', '1996-05-23', 164, 'never_married', 'Hindu', 'Pillai', 'Pillai subcaste', 'yes', 'B.Sc', 'B.Sc Graduate', 'Advocate', 'Advocate Details', '₹15 Lakhs - ₹20 Lakhs', 'Private Practice', 'Madurai', 'Madurai', 'Hi, I am Muthu. I have completed my B.Sc and am currently working as a Advocate at Private Practice in Madurai. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'upper_middle_class', 'Retired Employee', 'Homemaker', true, false, true, 100, NOW() - INTERVAL '6 days')
ON CONFLICT (id) DO UPDATE SET
  profile_id = EXCLUDED.profile_id,
  display_name = EXCLUDED.display_name,
  gender = EXCLUDED.gender,
  date_of_birth = EXCLUDED.date_of_birth,
  height_cm = EXCLUDED.height_cm,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  subcaste = EXCLUDED.subcaste,
  dosham = EXCLUDED.dosham,
  education = EXCLUDED.education,
  education_detail = EXCLUDED.education_detail,
  occupation = EXCLUDED.occupation,
  occupation_detail = EXCLUDED.occupation_detail,
  annual_income = EXCLUDED.annual_income,
  company_name = EXCLUDED.company_name,
  city = EXCLUDED.city,
  district = EXCLUDED.district,
  about_me = EXCLUDED.about_me,
  family_type = EXCLUDED.family_type,
  family_status = EXCLUDED.family_status,
  father_occupation = EXCLUDED.father_occupation,
  mother_occupation = EXCLUDED.mother_occupation,
  is_verified = EXCLUDED.is_verified,
  is_premium = EXCLUDED.is_premium,
  is_profile_complete = EXCLUDED.is_profile_complete,
  profile_completion_percent = EXCLUDED.profile_completion_percent,
  last_active_at = EXCLUDED.last_active_at;
INSERT INTO public.profiles (id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, father_occupation, mother_occupation, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at)
VALUES ('00000000-0000-4000-a000-00000000013c', 'TM000316', 'Pooja Balan', 'female', '1999-07-24', 165, 'divorced', 'Hindu', 'Naidu', 'Naidu subcaste', 'no', 'M.B.B.S', 'M.B.B.S Graduate', 'School Teacher', 'School Teacher Details', '₹15 Lakhs - ₹20 Lakhs', 'Private Practice', 'Chennai', 'Chennai', 'Hi, I am Pooja. I have completed my M.B.B.S and am currently working as a School Teacher at Private Practice in Chennai. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'middle_class', 'Retired Employee', 'Homemaker', true, false, true, 100, NOW() - INTERVAL '9 days')
ON CONFLICT (id) DO UPDATE SET
  profile_id = EXCLUDED.profile_id,
  display_name = EXCLUDED.display_name,
  gender = EXCLUDED.gender,
  date_of_birth = EXCLUDED.date_of_birth,
  height_cm = EXCLUDED.height_cm,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  subcaste = EXCLUDED.subcaste,
  dosham = EXCLUDED.dosham,
  education = EXCLUDED.education,
  education_detail = EXCLUDED.education_detail,
  occupation = EXCLUDED.occupation,
  occupation_detail = EXCLUDED.occupation_detail,
  annual_income = EXCLUDED.annual_income,
  company_name = EXCLUDED.company_name,
  city = EXCLUDED.city,
  district = EXCLUDED.district,
  about_me = EXCLUDED.about_me,
  family_type = EXCLUDED.family_type,
  family_status = EXCLUDED.family_status,
  father_occupation = EXCLUDED.father_occupation,
  mother_occupation = EXCLUDED.mother_occupation,
  is_verified = EXCLUDED.is_verified,
  is_premium = EXCLUDED.is_premium,
  is_profile_complete = EXCLUDED.is_profile_complete,
  profile_completion_percent = EXCLUDED.profile_completion_percent,
  last_active_at = EXCLUDED.last_active_at;
INSERT INTO public.profiles (id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, father_occupation, mother_occupation, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at)
VALUES ('00000000-0000-4000-a000-00000000013d', 'TM000317', 'Jayakumar Nathan', 'male', '1995-08-22', 180, 'never_married', 'Christian', 'RC Christian', NULL, 'no', 'B.Com', 'B.Com Graduate', 'Business Owner', 'Business Owner Details', '₹7 Lakhs - ₹10 Lakhs', 'HCL', 'Coimbatore', 'Coimbatore', 'Hi, I am Jayakumar. I have completed my B.Com and am currently working as a Business Owner at HCL in Coimbatore. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'joint', 'rich', 'Retired Employee', 'Homemaker', true, false, true, 100, NOW() - INTERVAL '6 days')
ON CONFLICT (id) DO UPDATE SET
  profile_id = EXCLUDED.profile_id,
  display_name = EXCLUDED.display_name,
  gender = EXCLUDED.gender,
  date_of_birth = EXCLUDED.date_of_birth,
  height_cm = EXCLUDED.height_cm,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  subcaste = EXCLUDED.subcaste,
  dosham = EXCLUDED.dosham,
  education = EXCLUDED.education,
  education_detail = EXCLUDED.education_detail,
  occupation = EXCLUDED.occupation,
  occupation_detail = EXCLUDED.occupation_detail,
  annual_income = EXCLUDED.annual_income,
  company_name = EXCLUDED.company_name,
  city = EXCLUDED.city,
  district = EXCLUDED.district,
  about_me = EXCLUDED.about_me,
  family_type = EXCLUDED.family_type,
  family_status = EXCLUDED.family_status,
  father_occupation = EXCLUDED.father_occupation,
  mother_occupation = EXCLUDED.mother_occupation,
  is_verified = EXCLUDED.is_verified,
  is_premium = EXCLUDED.is_premium,
  is_profile_complete = EXCLUDED.is_profile_complete,
  profile_completion_percent = EXCLUDED.profile_completion_percent,
  last_active_at = EXCLUDED.last_active_at;
INSERT INTO public.profiles (id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, father_occupation, mother_occupation, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at)
VALUES ('00000000-0000-4000-a000-00000000013e', 'TM000318', 'Rajeshwari Gopal', 'female', '1991-05-28', 157, 'never_married', 'Hindu', 'Yadav', NULL, 'yes', 'B.A', 'B.A Graduate', 'Government Officer', 'Government Officer Details', '₹5 Lakhs - ₹7 Lakhs', 'HCL', 'Madurai', 'Madurai', 'Hi, I am Rajeshwari. I have completed my B.A and am currently working as a Government Officer at HCL in Madurai. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'rich', 'Retired Employee', 'Homemaker', true, false, true, 100, NOW() - INTERVAL '6 days')
ON CONFLICT (id) DO UPDATE SET
  profile_id = EXCLUDED.profile_id,
  display_name = EXCLUDED.display_name,
  gender = EXCLUDED.gender,
  date_of_birth = EXCLUDED.date_of_birth,
  height_cm = EXCLUDED.height_cm,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  subcaste = EXCLUDED.subcaste,
  dosham = EXCLUDED.dosham,
  education = EXCLUDED.education,
  education_detail = EXCLUDED.education_detail,
  occupation = EXCLUDED.occupation,
  occupation_detail = EXCLUDED.occupation_detail,
  annual_income = EXCLUDED.annual_income,
  company_name = EXCLUDED.company_name,
  city = EXCLUDED.city,
  district = EXCLUDED.district,
  about_me = EXCLUDED.about_me,
  family_type = EXCLUDED.family_type,
  family_status = EXCLUDED.family_status,
  father_occupation = EXCLUDED.father_occupation,
  mother_occupation = EXCLUDED.mother_occupation,
  is_verified = EXCLUDED.is_verified,
  is_premium = EXCLUDED.is_premium,
  is_profile_complete = EXCLUDED.is_profile_complete,
  profile_completion_percent = EXCLUDED.profile_completion_percent,
  last_active_at = EXCLUDED.last_active_at;
INSERT INTO public.profiles (id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, father_occupation, mother_occupation, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at)
VALUES ('00000000-0000-4000-a000-00000000013f', 'TM000319', 'Dinesh Murthy', 'male', '1993-05-26', 163, 'never_married', 'Hindu', 'Devendra Kula Vellalar', 'Devendra Kula Vellalar subcaste', 'no', 'B.Ed', 'B.Ed Graduate', 'Dentist', 'Dentist Details', '₹20 Lakhs+', 'HCL', 'Salem', 'Salem', 'Hi, I am Dinesh. I have completed my B.Ed and am currently working as a Dentist at HCL in Salem. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'joint', 'rich', 'Retired Employee', 'Homemaker', true, false, true, 100, NOW() - INTERVAL '8 days')
ON CONFLICT (id) DO UPDATE SET
  profile_id = EXCLUDED.profile_id,
  display_name = EXCLUDED.display_name,
  gender = EXCLUDED.gender,
  date_of_birth = EXCLUDED.date_of_birth,
  height_cm = EXCLUDED.height_cm,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  subcaste = EXCLUDED.subcaste,
  dosham = EXCLUDED.dosham,
  education = EXCLUDED.education,
  education_detail = EXCLUDED.education_detail,
  occupation = EXCLUDED.occupation,
  occupation_detail = EXCLUDED.occupation_detail,
  annual_income = EXCLUDED.annual_income,
  company_name = EXCLUDED.company_name,
  city = EXCLUDED.city,
  district = EXCLUDED.district,
  about_me = EXCLUDED.about_me,
  family_type = EXCLUDED.family_type,
  family_status = EXCLUDED.family_status,
  father_occupation = EXCLUDED.father_occupation,
  mother_occupation = EXCLUDED.mother_occupation,
  is_verified = EXCLUDED.is_verified,
  is_premium = EXCLUDED.is_premium,
  is_profile_complete = EXCLUDED.is_profile_complete,
  profile_completion_percent = EXCLUDED.profile_completion_percent,
  last_active_at = EXCLUDED.last_active_at;
INSERT INTO public.profiles (id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, father_occupation, mother_occupation, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at)
VALUES ('00000000-0000-4000-a000-000000000140', 'TM000320', 'Ponmani Murthy', 'female', '1998-03-19', 162, 'never_married', 'Hindu', 'Vishwakarma', NULL, 'no', 'M.Com', 'M.Com Graduate', 'Mechanical Engineer', 'Mechanical Engineer Details', '₹15 Lakhs - ₹20 Lakhs', 'TCS', 'Chennai', 'Chennai', 'Hi, I am Ponmani. I have completed my M.Com and am currently working as a Mechanical Engineer at TCS in Chennai. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'joint', 'upper_middle_class', 'Retired Employee', 'Homemaker', true, false, true, 100, NOW() - INTERVAL '8 days')
ON CONFLICT (id) DO UPDATE SET
  profile_id = EXCLUDED.profile_id,
  display_name = EXCLUDED.display_name,
  gender = EXCLUDED.gender,
  date_of_birth = EXCLUDED.date_of_birth,
  height_cm = EXCLUDED.height_cm,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  subcaste = EXCLUDED.subcaste,
  dosham = EXCLUDED.dosham,
  education = EXCLUDED.education,
  education_detail = EXCLUDED.education_detail,
  occupation = EXCLUDED.occupation,
  occupation_detail = EXCLUDED.occupation_detail,
  annual_income = EXCLUDED.annual_income,
  company_name = EXCLUDED.company_name,
  city = EXCLUDED.city,
  district = EXCLUDED.district,
  about_me = EXCLUDED.about_me,
  family_type = EXCLUDED.family_type,
  family_status = EXCLUDED.family_status,
  father_occupation = EXCLUDED.father_occupation,
  mother_occupation = EXCLUDED.mother_occupation,
  is_verified = EXCLUDED.is_verified,
  is_premium = EXCLUDED.is_premium,
  is_profile_complete = EXCLUDED.is_profile_complete,
  profile_completion_percent = EXCLUDED.profile_completion_percent,
  last_active_at = EXCLUDED.last_active_at;
INSERT INTO public.profiles (id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, father_occupation, mother_occupation, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at)
VALUES ('00000000-0000-4000-a000-000000000141', 'TM000321', 'Muthu Mani', 'male', '1996-05-23', 169, 'never_married', 'Christian', 'RC Christian', 'RC Christian subcaste', 'no', 'M.Com', 'M.Com Graduate', 'Auditor', 'Auditor Details', '₹20 Lakhs+', 'HCL', 'Coimbatore', 'Coimbatore', 'Hi, I am Muthu. I have completed my M.Com and am currently working as a Auditor at HCL in Coimbatore. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'upper_middle_class', 'Retired Employee', 'Homemaker', true, false, true, 100, NOW() - INTERVAL '6 days')
ON CONFLICT (id) DO UPDATE SET
  profile_id = EXCLUDED.profile_id,
  display_name = EXCLUDED.display_name,
  gender = EXCLUDED.gender,
  date_of_birth = EXCLUDED.date_of_birth,
  height_cm = EXCLUDED.height_cm,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  subcaste = EXCLUDED.subcaste,
  dosham = EXCLUDED.dosham,
  education = EXCLUDED.education,
  education_detail = EXCLUDED.education_detail,
  occupation = EXCLUDED.occupation,
  occupation_detail = EXCLUDED.occupation_detail,
  annual_income = EXCLUDED.annual_income,
  company_name = EXCLUDED.company_name,
  city = EXCLUDED.city,
  district = EXCLUDED.district,
  about_me = EXCLUDED.about_me,
  family_type = EXCLUDED.family_type,
  family_status = EXCLUDED.family_status,
  father_occupation = EXCLUDED.father_occupation,
  mother_occupation = EXCLUDED.mother_occupation,
  is_verified = EXCLUDED.is_verified,
  is_premium = EXCLUDED.is_premium,
  is_profile_complete = EXCLUDED.is_profile_complete,
  profile_completion_percent = EXCLUDED.profile_completion_percent,
  last_active_at = EXCLUDED.last_active_at;
INSERT INTO public.profiles (id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, father_occupation, mother_occupation, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at)
VALUES ('00000000-0000-4000-a000-000000000142', 'TM000322', 'Shanthi Sundaram', 'female', '1989-01-02', 173, 'never_married', 'Hindu', 'Adi Dravida', 'Adi Dravida subcaste', 'no', 'B.Ed', 'B.Ed Graduate', 'Government Officer', 'Government Officer Details', '₹7 Lakhs - ₹10 Lakhs', 'Government Service', 'Thanjavur', 'Thanjavur', 'Hi, I am Shanthi. I have completed my B.Ed and am currently working as a Government Officer at Government Service in Thanjavur. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'joint', 'rich', 'Retired Employee', 'Homemaker', false, true, true, 100, NOW() - INTERVAL '10 days')
ON CONFLICT (id) DO UPDATE SET
  profile_id = EXCLUDED.profile_id,
  display_name = EXCLUDED.display_name,
  gender = EXCLUDED.gender,
  date_of_birth = EXCLUDED.date_of_birth,
  height_cm = EXCLUDED.height_cm,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  subcaste = EXCLUDED.subcaste,
  dosham = EXCLUDED.dosham,
  education = EXCLUDED.education,
  education_detail = EXCLUDED.education_detail,
  occupation = EXCLUDED.occupation,
  occupation_detail = EXCLUDED.occupation_detail,
  annual_income = EXCLUDED.annual_income,
  company_name = EXCLUDED.company_name,
  city = EXCLUDED.city,
  district = EXCLUDED.district,
  about_me = EXCLUDED.about_me,
  family_type = EXCLUDED.family_type,
  family_status = EXCLUDED.family_status,
  father_occupation = EXCLUDED.father_occupation,
  mother_occupation = EXCLUDED.mother_occupation,
  is_verified = EXCLUDED.is_verified,
  is_premium = EXCLUDED.is_premium,
  is_profile_complete = EXCLUDED.is_profile_complete,
  profile_completion_percent = EXCLUDED.profile_completion_percent,
  last_active_at = EXCLUDED.last_active_at;
INSERT INTO public.profiles (id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, father_occupation, mother_occupation, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at)
VALUES ('00000000-0000-4000-a000-000000000143', 'TM000323', 'Naveen Balan', 'male', '2000-01-16', 182, 'never_married', 'Hindu', 'Naidu', 'Naidu subcaste', 'no', 'M.B.A', 'M.B.A Graduate', 'Government Officer', 'Government Officer Details', '₹3 Lakhs - ₹5 Lakhs', 'Accenture', 'Chennai', 'Chennai', 'Hi, I am Naveen. I have completed my M.B.A and am currently working as a Government Officer at Accenture in Chennai. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'upper_middle_class', 'Retired Employee', 'Homemaker', true, false, true, 100, NOW() - INTERVAL '6 days')
ON CONFLICT (id) DO UPDATE SET
  profile_id = EXCLUDED.profile_id,
  display_name = EXCLUDED.display_name,
  gender = EXCLUDED.gender,
  date_of_birth = EXCLUDED.date_of_birth,
  height_cm = EXCLUDED.height_cm,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  subcaste = EXCLUDED.subcaste,
  dosham = EXCLUDED.dosham,
  education = EXCLUDED.education,
  education_detail = EXCLUDED.education_detail,
  occupation = EXCLUDED.occupation,
  occupation_detail = EXCLUDED.occupation_detail,
  annual_income = EXCLUDED.annual_income,
  company_name = EXCLUDED.company_name,
  city = EXCLUDED.city,
  district = EXCLUDED.district,
  about_me = EXCLUDED.about_me,
  family_type = EXCLUDED.family_type,
  family_status = EXCLUDED.family_status,
  father_occupation = EXCLUDED.father_occupation,
  mother_occupation = EXCLUDED.mother_occupation,
  is_verified = EXCLUDED.is_verified,
  is_premium = EXCLUDED.is_premium,
  is_profile_complete = EXCLUDED.is_profile_complete,
  profile_completion_percent = EXCLUDED.profile_completion_percent,
  last_active_at = EXCLUDED.last_active_at;
INSERT INTO public.profiles (id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, father_occupation, mother_occupation, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at)
VALUES ('00000000-0000-4000-a000-000000000144', 'TM000324', 'Janani Selvan', 'female', '1992-08-13', 170, 'divorced', 'Hindu', 'Brahmin - Iyer', 'Brahmin - Iyer subcaste', 'no', 'B.Com', 'B.Com Graduate', 'Civil Engineer', 'Civil Engineer Details', '₹10 Lakhs - ₹15 Lakhs', 'Private Practice', 'Tiruppur', 'Tiruppur', 'Hi, I am Janani. I have completed my B.Com and am currently working as a Civil Engineer at Private Practice in Tiruppur. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'rich', 'Retired Employee', 'Homemaker', true, true, true, 100, NOW() - INTERVAL '3 days')
ON CONFLICT (id) DO UPDATE SET
  profile_id = EXCLUDED.profile_id,
  display_name = EXCLUDED.display_name,
  gender = EXCLUDED.gender,
  date_of_birth = EXCLUDED.date_of_birth,
  height_cm = EXCLUDED.height_cm,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  subcaste = EXCLUDED.subcaste,
  dosham = EXCLUDED.dosham,
  education = EXCLUDED.education,
  education_detail = EXCLUDED.education_detail,
  occupation = EXCLUDED.occupation,
  occupation_detail = EXCLUDED.occupation_detail,
  annual_income = EXCLUDED.annual_income,
  company_name = EXCLUDED.company_name,
  city = EXCLUDED.city,
  district = EXCLUDED.district,
  about_me = EXCLUDED.about_me,
  family_type = EXCLUDED.family_type,
  family_status = EXCLUDED.family_status,
  father_occupation = EXCLUDED.father_occupation,
  mother_occupation = EXCLUDED.mother_occupation,
  is_verified = EXCLUDED.is_verified,
  is_premium = EXCLUDED.is_premium,
  is_profile_complete = EXCLUDED.is_profile_complete,
  profile_completion_percent = EXCLUDED.profile_completion_percent,
  last_active_at = EXCLUDED.last_active_at;
INSERT INTO public.profiles (id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, father_occupation, mother_occupation, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at)
VALUES ('00000000-0000-4000-a000-000000000145', 'TM000325', 'Velmurugan Moorthy', 'male', '2002-07-10', 185, 'never_married', 'Hindu', 'Maravar', 'Maravar subcaste', 'no', 'Ph.D', 'Ph.D Graduate', 'Civil Engineer', 'Civil Engineer Details', '₹15 Lakhs - ₹20 Lakhs', 'Zoho', 'Coimbatore', 'Coimbatore', 'Hi, I am Velmurugan. I have completed my Ph.D and am currently working as a Civil Engineer at Zoho in Coimbatore. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'joint', 'middle_class', 'Retired Employee', 'Homemaker', false, false, true, 100, NOW() - INTERVAL '9 days')
ON CONFLICT (id) DO UPDATE SET
  profile_id = EXCLUDED.profile_id,
  display_name = EXCLUDED.display_name,
  gender = EXCLUDED.gender,
  date_of_birth = EXCLUDED.date_of_birth,
  height_cm = EXCLUDED.height_cm,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  subcaste = EXCLUDED.subcaste,
  dosham = EXCLUDED.dosham,
  education = EXCLUDED.education,
  education_detail = EXCLUDED.education_detail,
  occupation = EXCLUDED.occupation,
  occupation_detail = EXCLUDED.occupation_detail,
  annual_income = EXCLUDED.annual_income,
  company_name = EXCLUDED.company_name,
  city = EXCLUDED.city,
  district = EXCLUDED.district,
  about_me = EXCLUDED.about_me,
  family_type = EXCLUDED.family_type,
  family_status = EXCLUDED.family_status,
  father_occupation = EXCLUDED.father_occupation,
  mother_occupation = EXCLUDED.mother_occupation,
  is_verified = EXCLUDED.is_verified,
  is_premium = EXCLUDED.is_premium,
  is_profile_complete = EXCLUDED.is_profile_complete,
  profile_completion_percent = EXCLUDED.profile_completion_percent,
  last_active_at = EXCLUDED.last_active_at;
INSERT INTO public.profiles (id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, father_occupation, mother_occupation, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at)
VALUES ('00000000-0000-4000-a000-000000000146', 'TM000326', 'Pooja Nathan', 'female', '2004-02-25', 160, 'never_married', 'Hindu', 'Brahmin - Iyer', 'Brahmin - Iyer subcaste', 'no', 'B.Sc', 'B.Sc Graduate', 'Mechanical Engineer', 'Mechanical Engineer Details', '₹5 Lakhs - ₹7 Lakhs', 'Cognizant', 'Tiruppur', 'Tiruppur', 'Hi, I am Pooja. I have completed my B.Sc and am currently working as a Mechanical Engineer at Cognizant in Tiruppur. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'joint', 'middle_class', 'Retired Employee', 'Homemaker', true, false, true, 100, NOW() - INTERVAL '8 days')
ON CONFLICT (id) DO UPDATE SET
  profile_id = EXCLUDED.profile_id,
  display_name = EXCLUDED.display_name,
  gender = EXCLUDED.gender,
  date_of_birth = EXCLUDED.date_of_birth,
  height_cm = EXCLUDED.height_cm,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  subcaste = EXCLUDED.subcaste,
  dosham = EXCLUDED.dosham,
  education = EXCLUDED.education,
  education_detail = EXCLUDED.education_detail,
  occupation = EXCLUDED.occupation,
  occupation_detail = EXCLUDED.occupation_detail,
  annual_income = EXCLUDED.annual_income,
  company_name = EXCLUDED.company_name,
  city = EXCLUDED.city,
  district = EXCLUDED.district,
  about_me = EXCLUDED.about_me,
  family_type = EXCLUDED.family_type,
  family_status = EXCLUDED.family_status,
  father_occupation = EXCLUDED.father_occupation,
  mother_occupation = EXCLUDED.mother_occupation,
  is_verified = EXCLUDED.is_verified,
  is_premium = EXCLUDED.is_premium,
  is_profile_complete = EXCLUDED.is_profile_complete,
  profile_completion_percent = EXCLUDED.profile_completion_percent,
  last_active_at = EXCLUDED.last_active_at;
INSERT INTO public.profiles (id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, father_occupation, mother_occupation, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at)
VALUES ('00000000-0000-4000-a000-000000000147', 'TM000327', 'Velmurugan Devan', 'male', '1988-10-11', 163, 'never_married', 'Hindu', 'Mudaliar', 'Mudaliar subcaste', 'no', 'M.B.A', 'M.B.A Graduate', 'Advocate', 'Advocate Details', '₹7 Lakhs - ₹10 Lakhs', 'Private Practice', 'Salem', 'Salem', 'Hi, I am Velmurugan. I have completed my M.B.A and am currently working as a Advocate at Private Practice in Salem. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'middle_class', 'Retired Employee', 'Homemaker', false, false, true, 100, NOW() - INTERVAL '4 days')
ON CONFLICT (id) DO UPDATE SET
  profile_id = EXCLUDED.profile_id,
  display_name = EXCLUDED.display_name,
  gender = EXCLUDED.gender,
  date_of_birth = EXCLUDED.date_of_birth,
  height_cm = EXCLUDED.height_cm,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  subcaste = EXCLUDED.subcaste,
  dosham = EXCLUDED.dosham,
  education = EXCLUDED.education,
  education_detail = EXCLUDED.education_detail,
  occupation = EXCLUDED.occupation,
  occupation_detail = EXCLUDED.occupation_detail,
  annual_income = EXCLUDED.annual_income,
  company_name = EXCLUDED.company_name,
  city = EXCLUDED.city,
  district = EXCLUDED.district,
  about_me = EXCLUDED.about_me,
  family_type = EXCLUDED.family_type,
  family_status = EXCLUDED.family_status,
  father_occupation = EXCLUDED.father_occupation,
  mother_occupation = EXCLUDED.mother_occupation,
  is_verified = EXCLUDED.is_verified,
  is_premium = EXCLUDED.is_premium,
  is_profile_complete = EXCLUDED.is_profile_complete,
  profile_completion_percent = EXCLUDED.profile_completion_percent,
  last_active_at = EXCLUDED.last_active_at;
INSERT INTO public.profiles (id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, father_occupation, mother_occupation, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at)
VALUES ('00000000-0000-4000-a000-000000000148', 'TM000328', 'Lakshmi Kumar', 'female', '2000-10-07', 161, 'never_married', 'Hindu', 'Brahmin - Iyengar', NULL, 'no', 'B.E. / B.Tech', 'B.E. / B.Tech Graduate', 'Police Officer', 'Police Officer Details', '₹3 Lakhs - ₹5 Lakhs', 'Government Service', 'Thanjavur', 'Thanjavur', 'Hi, I am Lakshmi. I have completed my B.E. / B.Tech and am currently working as a Police Officer at Government Service in Thanjavur. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'rich', 'Retired Employee', 'Homemaker', false, false, true, 100, NOW() - INTERVAL '5 days')
ON CONFLICT (id) DO UPDATE SET
  profile_id = EXCLUDED.profile_id,
  display_name = EXCLUDED.display_name,
  gender = EXCLUDED.gender,
  date_of_birth = EXCLUDED.date_of_birth,
  height_cm = EXCLUDED.height_cm,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  subcaste = EXCLUDED.subcaste,
  dosham = EXCLUDED.dosham,
  education = EXCLUDED.education,
  education_detail = EXCLUDED.education_detail,
  occupation = EXCLUDED.occupation,
  occupation_detail = EXCLUDED.occupation_detail,
  annual_income = EXCLUDED.annual_income,
  company_name = EXCLUDED.company_name,
  city = EXCLUDED.city,
  district = EXCLUDED.district,
  about_me = EXCLUDED.about_me,
  family_type = EXCLUDED.family_type,
  family_status = EXCLUDED.family_status,
  father_occupation = EXCLUDED.father_occupation,
  mother_occupation = EXCLUDED.mother_occupation,
  is_verified = EXCLUDED.is_verified,
  is_premium = EXCLUDED.is_premium,
  is_profile_complete = EXCLUDED.is_profile_complete,
  profile_completion_percent = EXCLUDED.profile_completion_percent,
  last_active_at = EXCLUDED.last_active_at;
INSERT INTO public.profiles (id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, father_occupation, mother_occupation, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at)
VALUES ('00000000-0000-4000-a000-000000000149', 'TM000329', 'Prabhu Sundaram', 'male', '1999-01-15', 172, 'never_married', 'Hindu', 'Nadar', NULL, 'no', 'Ph.D', 'Ph.D Graduate', 'Police Officer', 'Police Officer Details', '₹15 Lakhs - ₹20 Lakhs', 'Self Employed', 'Kanchipuram', 'Kanchipuram', 'Hi, I am Prabhu. I have completed my Ph.D and am currently working as a Police Officer at Self Employed in Kanchipuram. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'joint', 'upper_middle_class', 'Retired Employee', 'Homemaker', true, false, true, 100, NOW() - INTERVAL '8 days')
ON CONFLICT (id) DO UPDATE SET
  profile_id = EXCLUDED.profile_id,
  display_name = EXCLUDED.display_name,
  gender = EXCLUDED.gender,
  date_of_birth = EXCLUDED.date_of_birth,
  height_cm = EXCLUDED.height_cm,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  subcaste = EXCLUDED.subcaste,
  dosham = EXCLUDED.dosham,
  education = EXCLUDED.education,
  education_detail = EXCLUDED.education_detail,
  occupation = EXCLUDED.occupation,
  occupation_detail = EXCLUDED.occupation_detail,
  annual_income = EXCLUDED.annual_income,
  company_name = EXCLUDED.company_name,
  city = EXCLUDED.city,
  district = EXCLUDED.district,
  about_me = EXCLUDED.about_me,
  family_type = EXCLUDED.family_type,
  family_status = EXCLUDED.family_status,
  father_occupation = EXCLUDED.father_occupation,
  mother_occupation = EXCLUDED.mother_occupation,
  is_verified = EXCLUDED.is_verified,
  is_premium = EXCLUDED.is_premium,
  is_profile_complete = EXCLUDED.is_profile_complete,
  profile_completion_percent = EXCLUDED.profile_completion_percent,
  last_active_at = EXCLUDED.last_active_at;
INSERT INTO public.profiles (id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, father_occupation, mother_occupation, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at)
VALUES ('00000000-0000-4000-a000-00000000014a', 'TM000330', 'Geetha Nathan', 'female', '2004-04-19', 168, 'divorced', 'Hindu', 'Vishwakarma', NULL, 'no', 'Ph.D', 'Ph.D Graduate', 'Architect', 'Architect Details', '₹7 Lakhs - ₹10 Lakhs', 'Self Employed', 'Tiruppur', 'Tiruppur', 'Hi, I am Geetha. I have completed my Ph.D and am currently working as a Architect at Self Employed in Tiruppur. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'joint', 'middle_class', 'Retired Employee', 'Homemaker', true, false, true, 100, NOW() - INTERVAL '6 days')
ON CONFLICT (id) DO UPDATE SET
  profile_id = EXCLUDED.profile_id,
  display_name = EXCLUDED.display_name,
  gender = EXCLUDED.gender,
  date_of_birth = EXCLUDED.date_of_birth,
  height_cm = EXCLUDED.height_cm,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  subcaste = EXCLUDED.subcaste,
  dosham = EXCLUDED.dosham,
  education = EXCLUDED.education,
  education_detail = EXCLUDED.education_detail,
  occupation = EXCLUDED.occupation,
  occupation_detail = EXCLUDED.occupation_detail,
  annual_income = EXCLUDED.annual_income,
  company_name = EXCLUDED.company_name,
  city = EXCLUDED.city,
  district = EXCLUDED.district,
  about_me = EXCLUDED.about_me,
  family_type = EXCLUDED.family_type,
  family_status = EXCLUDED.family_status,
  father_occupation = EXCLUDED.father_occupation,
  mother_occupation = EXCLUDED.mother_occupation,
  is_verified = EXCLUDED.is_verified,
  is_premium = EXCLUDED.is_premium,
  is_profile_complete = EXCLUDED.is_profile_complete,
  profile_completion_percent = EXCLUDED.profile_completion_percent,
  last_active_at = EXCLUDED.last_active_at;
INSERT INTO public.profiles (id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, father_occupation, mother_occupation, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at)
VALUES ('00000000-0000-4000-a000-00000000014b', 'TM000331', 'Vijay Shankar', 'male', '1988-03-26', 188, 'never_married', 'Hindu', 'Sengunthar', 'Sengunthar subcaste', 'no', 'B.Sc', 'B.Sc Graduate', 'College Professor', 'College Professor Details', '₹5 Lakhs - ₹7 Lakhs', 'Accenture', 'Coimbatore', 'Coimbatore', 'Hi, I am Vijay. I have completed my B.Sc and am currently working as a College Professor at Accenture in Coimbatore. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'middle_class', 'Retired Employee', 'Homemaker', true, false, true, 100, NOW() - INTERVAL '6 days')
ON CONFLICT (id) DO UPDATE SET
  profile_id = EXCLUDED.profile_id,
  display_name = EXCLUDED.display_name,
  gender = EXCLUDED.gender,
  date_of_birth = EXCLUDED.date_of_birth,
  height_cm = EXCLUDED.height_cm,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  subcaste = EXCLUDED.subcaste,
  dosham = EXCLUDED.dosham,
  education = EXCLUDED.education,
  education_detail = EXCLUDED.education_detail,
  occupation = EXCLUDED.occupation,
  occupation_detail = EXCLUDED.occupation_detail,
  annual_income = EXCLUDED.annual_income,
  company_name = EXCLUDED.company_name,
  city = EXCLUDED.city,
  district = EXCLUDED.district,
  about_me = EXCLUDED.about_me,
  family_type = EXCLUDED.family_type,
  family_status = EXCLUDED.family_status,
  father_occupation = EXCLUDED.father_occupation,
  mother_occupation = EXCLUDED.mother_occupation,
  is_verified = EXCLUDED.is_verified,
  is_premium = EXCLUDED.is_premium,
  is_profile_complete = EXCLUDED.is_profile_complete,
  profile_completion_percent = EXCLUDED.profile_completion_percent,
  last_active_at = EXCLUDED.last_active_at;
INSERT INTO public.profiles (id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, father_occupation, mother_occupation, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at)
VALUES ('00000000-0000-4000-a000-00000000014c', 'TM000332', 'Yazhini Raj', 'female', '1994-04-16', 160, 'never_married', 'Hindu', 'Gounder', 'Gounder subcaste', 'no', 'B.Sc', 'B.Sc Graduate', 'Auditor', 'Auditor Details', '₹5 Lakhs - ₹7 Lakhs', 'Accenture', 'Tiruchirappalli', 'Trichy', 'Hi, I am Yazhini. I have completed my B.Sc and am currently working as a Auditor at Accenture in Tiruchirappalli. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'joint', 'middle_class', 'Retired Employee', 'Homemaker', true, false, true, 100, NOW() - INTERVAL '5 days')
ON CONFLICT (id) DO UPDATE SET
  profile_id = EXCLUDED.profile_id,
  display_name = EXCLUDED.display_name,
  gender = EXCLUDED.gender,
  date_of_birth = EXCLUDED.date_of_birth,
  height_cm = EXCLUDED.height_cm,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  subcaste = EXCLUDED.subcaste,
  dosham = EXCLUDED.dosham,
  education = EXCLUDED.education,
  education_detail = EXCLUDED.education_detail,
  occupation = EXCLUDED.occupation,
  occupation_detail = EXCLUDED.occupation_detail,
  annual_income = EXCLUDED.annual_income,
  company_name = EXCLUDED.company_name,
  city = EXCLUDED.city,
  district = EXCLUDED.district,
  about_me = EXCLUDED.about_me,
  family_type = EXCLUDED.family_type,
  family_status = EXCLUDED.family_status,
  father_occupation = EXCLUDED.father_occupation,
  mother_occupation = EXCLUDED.mother_occupation,
  is_verified = EXCLUDED.is_verified,
  is_premium = EXCLUDED.is_premium,
  is_profile_complete = EXCLUDED.is_profile_complete,
  profile_completion_percent = EXCLUDED.profile_completion_percent,
  last_active_at = EXCLUDED.last_active_at;
INSERT INTO public.profiles (id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, father_occupation, mother_occupation, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at)
VALUES ('00000000-0000-4000-a000-00000000014d', 'TM000333', 'Ramakrishnan Nathan', 'male', '1988-08-03', 176, 'never_married', 'Hindu', 'Mudaliar', 'Mudaliar subcaste', 'no', 'Ph.D', 'Ph.D Graduate', 'School Teacher', 'School Teacher Details', '₹10 Lakhs - ₹15 Lakhs', 'Zoho', 'Coimbatore', 'Coimbatore', 'Hi, I am Ramakrishnan. I have completed my Ph.D and am currently working as a School Teacher at Zoho in Coimbatore. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'middle_class', 'Retired Employee', 'Homemaker', true, false, true, 100, NOW() - INTERVAL '0 days')
ON CONFLICT (id) DO UPDATE SET
  profile_id = EXCLUDED.profile_id,
  display_name = EXCLUDED.display_name,
  gender = EXCLUDED.gender,
  date_of_birth = EXCLUDED.date_of_birth,
  height_cm = EXCLUDED.height_cm,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  subcaste = EXCLUDED.subcaste,
  dosham = EXCLUDED.dosham,
  education = EXCLUDED.education,
  education_detail = EXCLUDED.education_detail,
  occupation = EXCLUDED.occupation,
  occupation_detail = EXCLUDED.occupation_detail,
  annual_income = EXCLUDED.annual_income,
  company_name = EXCLUDED.company_name,
  city = EXCLUDED.city,
  district = EXCLUDED.district,
  about_me = EXCLUDED.about_me,
  family_type = EXCLUDED.family_type,
  family_status = EXCLUDED.family_status,
  father_occupation = EXCLUDED.father_occupation,
  mother_occupation = EXCLUDED.mother_occupation,
  is_verified = EXCLUDED.is_verified,
  is_premium = EXCLUDED.is_premium,
  is_profile_complete = EXCLUDED.is_profile_complete,
  profile_completion_percent = EXCLUDED.profile_completion_percent,
  last_active_at = EXCLUDED.last_active_at;
INSERT INTO public.profiles (id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, father_occupation, mother_occupation, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at)
VALUES ('00000000-0000-4000-a000-00000000014e', 'TM000334', 'Malarvizhi Lingam', 'female', '1991-04-22', 157, 'never_married', 'Hindu', 'Vanniyar', NULL, 'no', 'M.A', 'M.A Graduate', 'Advocate', 'Advocate Details', '₹7 Lakhs - ₹10 Lakhs', 'Government Service', 'Chennai', 'Chennai', 'Hi, I am Malarvizhi. I have completed my M.A and am currently working as a Advocate at Government Service in Chennai. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'upper_middle_class', 'Retired Employee', 'Homemaker', true, false, true, 100, NOW() - INTERVAL '6 days')
ON CONFLICT (id) DO UPDATE SET
  profile_id = EXCLUDED.profile_id,
  display_name = EXCLUDED.display_name,
  gender = EXCLUDED.gender,
  date_of_birth = EXCLUDED.date_of_birth,
  height_cm = EXCLUDED.height_cm,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  subcaste = EXCLUDED.subcaste,
  dosham = EXCLUDED.dosham,
  education = EXCLUDED.education,
  education_detail = EXCLUDED.education_detail,
  occupation = EXCLUDED.occupation,
  occupation_detail = EXCLUDED.occupation_detail,
  annual_income = EXCLUDED.annual_income,
  company_name = EXCLUDED.company_name,
  city = EXCLUDED.city,
  district = EXCLUDED.district,
  about_me = EXCLUDED.about_me,
  family_type = EXCLUDED.family_type,
  family_status = EXCLUDED.family_status,
  father_occupation = EXCLUDED.father_occupation,
  mother_occupation = EXCLUDED.mother_occupation,
  is_verified = EXCLUDED.is_verified,
  is_premium = EXCLUDED.is_premium,
  is_profile_complete = EXCLUDED.is_profile_complete,
  profile_completion_percent = EXCLUDED.profile_completion_percent,
  last_active_at = EXCLUDED.last_active_at;
INSERT INTO public.profiles (id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, father_occupation, mother_occupation, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at)
VALUES ('00000000-0000-4000-a000-00000000014f', 'TM000335', 'Suresh Sundaram', 'male', '1996-05-05', 187, 'never_married', 'Hindu', 'Pillai', 'Pillai subcaste', 'no', 'Ph.D', 'Ph.D Graduate', 'Software Engineer', 'Software Engineer Details', '₹5 Lakhs - ₹7 Lakhs', 'Infosys', 'Vellore', 'Vellore', 'Hi, I am Suresh. I have completed my Ph.D and am currently working as a Software Engineer at Infosys in Vellore. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'middle_class', 'Retired Employee', 'Homemaker', false, false, true, 100, NOW() - INTERVAL '1 days')
ON CONFLICT (id) DO UPDATE SET
  profile_id = EXCLUDED.profile_id,
  display_name = EXCLUDED.display_name,
  gender = EXCLUDED.gender,
  date_of_birth = EXCLUDED.date_of_birth,
  height_cm = EXCLUDED.height_cm,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  subcaste = EXCLUDED.subcaste,
  dosham = EXCLUDED.dosham,
  education = EXCLUDED.education,
  education_detail = EXCLUDED.education_detail,
  occupation = EXCLUDED.occupation,
  occupation_detail = EXCLUDED.occupation_detail,
  annual_income = EXCLUDED.annual_income,
  company_name = EXCLUDED.company_name,
  city = EXCLUDED.city,
  district = EXCLUDED.district,
  about_me = EXCLUDED.about_me,
  family_type = EXCLUDED.family_type,
  family_status = EXCLUDED.family_status,
  father_occupation = EXCLUDED.father_occupation,
  mother_occupation = EXCLUDED.mother_occupation,
  is_verified = EXCLUDED.is_verified,
  is_premium = EXCLUDED.is_premium,
  is_profile_complete = EXCLUDED.is_profile_complete,
  profile_completion_percent = EXCLUDED.profile_completion_percent,
  last_active_at = EXCLUDED.last_active_at;
INSERT INTO public.profiles (id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, father_occupation, mother_occupation, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at)
VALUES ('00000000-0000-4000-a000-000000000150', 'TM000336', 'Priya Kumar', 'female', '1991-01-07', 151, 'never_married', 'Hindu', 'Kallar', NULL, 'no', 'B.Sc', 'B.Sc Graduate', 'Bank Manager', 'Bank Manager Details', '₹5 Lakhs - ₹7 Lakhs', 'Accenture', 'Tiruchirappalli', 'Trichy', 'Hi, I am Priya. I have completed my B.Sc and am currently working as a Bank Manager at Accenture in Tiruchirappalli. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'upper_middle_class', 'Retired Employee', 'Homemaker', true, false, true, 100, NOW() - INTERVAL '2 days')
ON CONFLICT (id) DO UPDATE SET
  profile_id = EXCLUDED.profile_id,
  display_name = EXCLUDED.display_name,
  gender = EXCLUDED.gender,
  date_of_birth = EXCLUDED.date_of_birth,
  height_cm = EXCLUDED.height_cm,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  subcaste = EXCLUDED.subcaste,
  dosham = EXCLUDED.dosham,
  education = EXCLUDED.education,
  education_detail = EXCLUDED.education_detail,
  occupation = EXCLUDED.occupation,
  occupation_detail = EXCLUDED.occupation_detail,
  annual_income = EXCLUDED.annual_income,
  company_name = EXCLUDED.company_name,
  city = EXCLUDED.city,
  district = EXCLUDED.district,
  about_me = EXCLUDED.about_me,
  family_type = EXCLUDED.family_type,
  family_status = EXCLUDED.family_status,
  father_occupation = EXCLUDED.father_occupation,
  mother_occupation = EXCLUDED.mother_occupation,
  is_verified = EXCLUDED.is_verified,
  is_premium = EXCLUDED.is_premium,
  is_profile_complete = EXCLUDED.is_profile_complete,
  profile_completion_percent = EXCLUDED.profile_completion_percent,
  last_active_at = EXCLUDED.last_active_at;
INSERT INTO public.profiles (id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, father_occupation, mother_occupation, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at)
VALUES ('00000000-0000-4000-a000-000000000151', 'TM000337', 'Karthik Lingam', 'male', '1999-03-03', 167, 'never_married', 'Hindu', 'Vanniyar', NULL, 'no', 'B.Ed', 'B.Ed Graduate', 'Business Owner', 'Business Owner Details', '₹3 Lakhs - ₹5 Lakhs', 'Zoho', 'Tirunelveli', 'Tirunelveli', 'Hi, I am Karthik. I have completed my B.Ed and am currently working as a Business Owner at Zoho in Tirunelveli. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'joint', 'upper_middle_class', 'Retired Employee', 'Homemaker', true, false, true, 100, NOW() - INTERVAL '4 days')
ON CONFLICT (id) DO UPDATE SET
  profile_id = EXCLUDED.profile_id,
  display_name = EXCLUDED.display_name,
  gender = EXCLUDED.gender,
  date_of_birth = EXCLUDED.date_of_birth,
  height_cm = EXCLUDED.height_cm,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  subcaste = EXCLUDED.subcaste,
  dosham = EXCLUDED.dosham,
  education = EXCLUDED.education,
  education_detail = EXCLUDED.education_detail,
  occupation = EXCLUDED.occupation,
  occupation_detail = EXCLUDED.occupation_detail,
  annual_income = EXCLUDED.annual_income,
  company_name = EXCLUDED.company_name,
  city = EXCLUDED.city,
  district = EXCLUDED.district,
  about_me = EXCLUDED.about_me,
  family_type = EXCLUDED.family_type,
  family_status = EXCLUDED.family_status,
  father_occupation = EXCLUDED.father_occupation,
  mother_occupation = EXCLUDED.mother_occupation,
  is_verified = EXCLUDED.is_verified,
  is_premium = EXCLUDED.is_premium,
  is_profile_complete = EXCLUDED.is_profile_complete,
  profile_completion_percent = EXCLUDED.profile_completion_percent,
  last_active_at = EXCLUDED.last_active_at;
INSERT INTO public.profiles (id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, father_occupation, mother_occupation, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at)
VALUES ('00000000-0000-4000-a000-000000000152', 'TM000338', 'Vijaya Lingam', 'female', '2003-05-11', 150, 'never_married', 'Hindu', 'Sengunthar', 'Sengunthar subcaste', 'yes', 'M.Com', 'M.Com Graduate', 'Doctor', 'Doctor Details', '₹20 Lakhs+', 'Accenture', 'Erode', 'Erode', 'Hi, I am Vijaya. I have completed my M.Com and am currently working as a Doctor at Accenture in Erode. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'middle_class', 'Retired Employee', 'Homemaker', false, true, true, 100, NOW() - INTERVAL '8 days')
ON CONFLICT (id) DO UPDATE SET
  profile_id = EXCLUDED.profile_id,
  display_name = EXCLUDED.display_name,
  gender = EXCLUDED.gender,
  date_of_birth = EXCLUDED.date_of_birth,
  height_cm = EXCLUDED.height_cm,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  subcaste = EXCLUDED.subcaste,
  dosham = EXCLUDED.dosham,
  education = EXCLUDED.education,
  education_detail = EXCLUDED.education_detail,
  occupation = EXCLUDED.occupation,
  occupation_detail = EXCLUDED.occupation_detail,
  annual_income = EXCLUDED.annual_income,
  company_name = EXCLUDED.company_name,
  city = EXCLUDED.city,
  district = EXCLUDED.district,
  about_me = EXCLUDED.about_me,
  family_type = EXCLUDED.family_type,
  family_status = EXCLUDED.family_status,
  father_occupation = EXCLUDED.father_occupation,
  mother_occupation = EXCLUDED.mother_occupation,
  is_verified = EXCLUDED.is_verified,
  is_premium = EXCLUDED.is_premium,
  is_profile_complete = EXCLUDED.is_profile_complete,
  profile_completion_percent = EXCLUDED.profile_completion_percent,
  last_active_at = EXCLUDED.last_active_at;
INSERT INTO public.profiles (id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, father_occupation, mother_occupation, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at)
VALUES ('00000000-0000-4000-a000-000000000153', 'TM000339', 'Senthil Shankar', 'male', '1988-05-14', 162, 'never_married', 'Hindu', 'Naicker', NULL, 'no', 'B.A', 'B.A Graduate', 'Government Officer', 'Government Officer Details', '₹15 Lakhs - ₹20 Lakhs', 'TCS', 'Thanjavur', 'Thanjavur', 'Hi, I am Senthil. I have completed my B.A and am currently working as a Government Officer at TCS in Thanjavur. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'joint', 'rich', 'Retired Employee', 'Homemaker', false, true, true, 100, NOW() - INTERVAL '9 days')
ON CONFLICT (id) DO UPDATE SET
  profile_id = EXCLUDED.profile_id,
  display_name = EXCLUDED.display_name,
  gender = EXCLUDED.gender,
  date_of_birth = EXCLUDED.date_of_birth,
  height_cm = EXCLUDED.height_cm,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  subcaste = EXCLUDED.subcaste,
  dosham = EXCLUDED.dosham,
  education = EXCLUDED.education,
  education_detail = EXCLUDED.education_detail,
  occupation = EXCLUDED.occupation,
  occupation_detail = EXCLUDED.occupation_detail,
  annual_income = EXCLUDED.annual_income,
  company_name = EXCLUDED.company_name,
  city = EXCLUDED.city,
  district = EXCLUDED.district,
  about_me = EXCLUDED.about_me,
  family_type = EXCLUDED.family_type,
  family_status = EXCLUDED.family_status,
  father_occupation = EXCLUDED.father_occupation,
  mother_occupation = EXCLUDED.mother_occupation,
  is_verified = EXCLUDED.is_verified,
  is_premium = EXCLUDED.is_premium,
  is_profile_complete = EXCLUDED.is_profile_complete,
  profile_completion_percent = EXCLUDED.profile_completion_percent,
  last_active_at = EXCLUDED.last_active_at;
INSERT INTO public.profiles (id, profile_id, display_name, gender, date_of_birth, height_cm, marital_status, religion, caste, subcaste, dosham, education, education_detail, occupation, occupation_detail, annual_income, company_name, city, district, about_me, family_type, family_status, father_occupation, mother_occupation, is_verified, is_premium, is_profile_complete, profile_completion_percent, last_active_at)
VALUES ('00000000-0000-4000-a000-000000000154', 'TM000340', 'Soundarya Shankar', 'female', '1990-07-24', 164, 'never_married', 'Hindu', 'Vellalar', 'Vellalar subcaste', 'yes', 'M.B.A', 'M.B.A Graduate', 'Dentist', 'Dentist Details', '₹7 Lakhs - ₹10 Lakhs', 'TCS', 'Erode', 'Erode', 'Hi, I am Soundarya. I have completed my M.B.A and am currently working as a Dentist at TCS in Erode. I value family traditions and seek a supportive partner to embark on life''s journey together.', 'nuclear', 'rich', 'Retired Employee', 'Homemaker', true, false, true, 100, NOW() - INTERVAL '6 days')
ON CONFLICT (id) DO UPDATE SET
  profile_id = EXCLUDED.profile_id,
  display_name = EXCLUDED.display_name,
  gender = EXCLUDED.gender,
  date_of_birth = EXCLUDED.date_of_birth,
  height_cm = EXCLUDED.height_cm,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  subcaste = EXCLUDED.subcaste,
  dosham = EXCLUDED.dosham,
  education = EXCLUDED.education,
  education_detail = EXCLUDED.education_detail,
  occupation = EXCLUDED.occupation,
  occupation_detail = EXCLUDED.occupation_detail,
  annual_income = EXCLUDED.annual_income,
  company_name = EXCLUDED.company_name,
  city = EXCLUDED.city,
  district = EXCLUDED.district,
  about_me = EXCLUDED.about_me,
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
VALUES ('00000000-0000-4000-a000-0000000000ab', 'Shravana', 'Simham', 'Rishabam', 'Harita', 'yes')
ON CONFLICT (user_id) DO UPDATE SET
  star = EXCLUDED.star,
  raasi = EXCLUDED.raasi,
  lagnam = EXCLUDED.lagnam,
  gothram = EXCLUDED.gothram,
  manglik = EXCLUDED.manglik;
INSERT INTO public.horoscope_details (user_id, star, raasi, lagnam, gothram, manglik)
VALUES ('00000000-0000-4000-a000-0000000000ac', 'Rohini', 'Thulaam', 'Rishabam', 'Atri', 'no')
ON CONFLICT (user_id) DO UPDATE SET
  star = EXCLUDED.star,
  raasi = EXCLUDED.raasi,
  lagnam = EXCLUDED.lagnam,
  gothram = EXCLUDED.gothram,
  manglik = EXCLUDED.manglik;
INSERT INTO public.horoscope_details (user_id, star, raasi, lagnam, gothram, manglik)
VALUES ('00000000-0000-4000-a000-0000000000ad', 'Poorvashadha', 'Viruchigam', 'Dhanusu', 'Harita', 'yes')
ON CONFLICT (user_id) DO UPDATE SET
  star = EXCLUDED.star,
  raasi = EXCLUDED.raasi,
  lagnam = EXCLUDED.lagnam,
  gothram = EXCLUDED.gothram,
  manglik = EXCLUDED.manglik;
INSERT INTO public.horoscope_details (user_id, star, raasi, lagnam, gothram, manglik)
VALUES ('00000000-0000-4000-a000-0000000000ae', 'Poorvashadha', 'Dhanusu', 'Viruchigam', 'Kasyapa', 'no')
ON CONFLICT (user_id) DO UPDATE SET
  star = EXCLUDED.star,
  raasi = EXCLUDED.raasi,
  lagnam = EXCLUDED.lagnam,
  gothram = EXCLUDED.gothram,
  manglik = EXCLUDED.manglik;
INSERT INTO public.horoscope_details (user_id, star, raasi, lagnam, gothram, manglik)
VALUES ('00000000-0000-4000-a000-0000000000af', 'Aslesha', 'Meenam', 'Thulaam', 'Vishnu', 'no')
ON CONFLICT (user_id) DO UPDATE SET
  star = EXCLUDED.star,
  raasi = EXCLUDED.raasi,
  lagnam = EXCLUDED.lagnam,
  gothram = EXCLUDED.gothram,
  manglik = EXCLUDED.manglik;
INSERT INTO public.horoscope_details (user_id, star, raasi, lagnam, gothram, manglik)
VALUES ('00000000-0000-4000-a000-0000000000b0', 'Poorvashadha', 'Kumbam', 'Mesham', 'Murugan', 'no')
ON CONFLICT (user_id) DO UPDATE SET
  star = EXCLUDED.star,
  raasi = EXCLUDED.raasi,
  lagnam = EXCLUDED.lagnam,
  gothram = EXCLUDED.gothram,
  manglik = EXCLUDED.manglik;
INSERT INTO public.horoscope_details (user_id, star, raasi, lagnam, gothram, manglik)
VALUES ('00000000-0000-4000-a000-0000000000b1', 'Poorvashadha', 'Kadagam', 'Kadagam', 'Vashishta', 'yes')
ON CONFLICT (user_id) DO UPDATE SET
  star = EXCLUDED.star,
  raasi = EXCLUDED.raasi,
  lagnam = EXCLUDED.lagnam,
  gothram = EXCLUDED.gothram,
  manglik = EXCLUDED.manglik;
INSERT INTO public.horoscope_details (user_id, star, raasi, lagnam, gothram, manglik)
VALUES ('00000000-0000-4000-a000-0000000000b2', 'Aslesha', 'Kumbam', 'Dhanusu', 'Agastya', 'no')
ON CONFLICT (user_id) DO UPDATE SET
  star = EXCLUDED.star,
  raasi = EXCLUDED.raasi,
  lagnam = EXCLUDED.lagnam,
  gothram = EXCLUDED.gothram,
  manglik = EXCLUDED.manglik;
INSERT INTO public.horoscope_details (user_id, star, raasi, lagnam, gothram, manglik)
VALUES ('00000000-0000-4000-a000-0000000000b3', 'Poorvabhadrapada', 'Rishabam', 'Kanni', 'Kasyapa', 'no')
ON CONFLICT (user_id) DO UPDATE SET
  star = EXCLUDED.star,
  raasi = EXCLUDED.raasi,
  lagnam = EXCLUDED.lagnam,
  gothram = EXCLUDED.gothram,
  manglik = EXCLUDED.manglik;
INSERT INTO public.horoscope_details (user_id, star, raasi, lagnam, gothram, manglik)
VALUES ('00000000-0000-4000-a000-0000000000b4', 'Hasta', 'Dhanusu', 'Rishabam', 'Harita', 'no')
ON CONFLICT (user_id) DO UPDATE SET
  star = EXCLUDED.star,
  raasi = EXCLUDED.raasi,
  lagnam = EXCLUDED.lagnam,
  gothram = EXCLUDED.gothram,
  manglik = EXCLUDED.manglik;
INSERT INTO public.horoscope_details (user_id, star, raasi, lagnam, gothram, manglik)
VALUES ('00000000-0000-4000-a000-0000000000b5', 'Vishakha', 'Thulaam', 'Thulaam', 'Kasyapa', 'no')
ON CONFLICT (user_id) DO UPDATE SET
  star = EXCLUDED.star,
  raasi = EXCLUDED.raasi,
  lagnam = EXCLUDED.lagnam,
  gothram = EXCLUDED.gothram,
  manglik = EXCLUDED.manglik;
INSERT INTO public.horoscope_details (user_id, star, raasi, lagnam, gothram, manglik)
VALUES ('00000000-0000-4000-a000-0000000000b6', 'Arudra', 'Meenam', 'Thulaam', 'Kasyapa', 'no')
ON CONFLICT (user_id) DO UPDATE SET
  star = EXCLUDED.star,
  raasi = EXCLUDED.raasi,
  lagnam = EXCLUDED.lagnam,
  gothram = EXCLUDED.gothram,
  manglik = EXCLUDED.manglik;
INSERT INTO public.horoscope_details (user_id, star, raasi, lagnam, gothram, manglik)
VALUES ('00000000-0000-4000-a000-0000000000b7', 'Magha', 'Mesham', 'Simham', 'Kasyapa', 'no')
ON CONFLICT (user_id) DO UPDATE SET
  star = EXCLUDED.star,
  raasi = EXCLUDED.raasi,
  lagnam = EXCLUDED.lagnam,
  gothram = EXCLUDED.gothram,
  manglik = EXCLUDED.manglik;
INSERT INTO public.horoscope_details (user_id, star, raasi, lagnam, gothram, manglik)
VALUES ('00000000-0000-4000-a000-0000000000b8', 'Krittika', 'Meenam', 'Mithunam', 'Vishnu', 'no')
ON CONFLICT (user_id) DO UPDATE SET
  star = EXCLUDED.star,
  raasi = EXCLUDED.raasi,
  lagnam = EXCLUDED.lagnam,
  gothram = EXCLUDED.gothram,
  manglik = EXCLUDED.manglik;
INSERT INTO public.horoscope_details (user_id, star, raasi, lagnam, gothram, manglik)
VALUES ('00000000-0000-4000-a000-0000000000b9', 'Jyeshta', 'Thulaam', 'Viruchigam', 'Kasyapa', 'yes')
ON CONFLICT (user_id) DO UPDATE SET
  star = EXCLUDED.star,
  raasi = EXCLUDED.raasi,
  lagnam = EXCLUDED.lagnam,
  gothram = EXCLUDED.gothram,
  manglik = EXCLUDED.manglik;
INSERT INTO public.horoscope_details (user_id, star, raasi, lagnam, gothram, manglik)
VALUES ('00000000-0000-4000-a000-0000000000ba', 'Krittika', 'Kumbam', 'Mithunam', 'Harita', 'no')
ON CONFLICT (user_id) DO UPDATE SET
  star = EXCLUDED.star,
  raasi = EXCLUDED.raasi,
  lagnam = EXCLUDED.lagnam,
  gothram = EXCLUDED.gothram,
  manglik = EXCLUDED.manglik;
INSERT INTO public.horoscope_details (user_id, star, raasi, lagnam, gothram, manglik)
VALUES ('00000000-0000-4000-a000-0000000000bb', 'Magha', 'Meenam', 'Kumbam', 'Murugan', 'yes')
ON CONFLICT (user_id) DO UPDATE SET
  star = EXCLUDED.star,
  raasi = EXCLUDED.raasi,
  lagnam = EXCLUDED.lagnam,
  gothram = EXCLUDED.gothram,
  manglik = EXCLUDED.manglik;
INSERT INTO public.horoscope_details (user_id, star, raasi, lagnam, gothram, manglik)
VALUES ('00000000-0000-4000-a000-0000000000bc', 'Rohini', 'Thulaam', 'Thulaam', 'Vashishta', 'no')
ON CONFLICT (user_id) DO UPDATE SET
  star = EXCLUDED.star,
  raasi = EXCLUDED.raasi,
  lagnam = EXCLUDED.lagnam,
  gothram = EXCLUDED.gothram,
  manglik = EXCLUDED.manglik;
INSERT INTO public.horoscope_details (user_id, star, raasi, lagnam, gothram, manglik)
VALUES ('00000000-0000-4000-a000-0000000000bd', 'Swati', 'Kadagam', 'Mithunam', 'Murugan', 'no')
ON CONFLICT (user_id) DO UPDATE SET
  star = EXCLUDED.star,
  raasi = EXCLUDED.raasi,
  lagnam = EXCLUDED.lagnam,
  gothram = EXCLUDED.gothram,
  manglik = EXCLUDED.manglik;
INSERT INTO public.horoscope_details (user_id, star, raasi, lagnam, gothram, manglik)
VALUES ('00000000-0000-4000-a000-0000000000be', 'Jyeshta', 'Dhanusu', 'Mithunam', 'Siva', 'no')
ON CONFLICT (user_id) DO UPDATE SET
  star = EXCLUDED.star,
  raasi = EXCLUDED.raasi,
  lagnam = EXCLUDED.lagnam,
  gothram = EXCLUDED.gothram,
  manglik = EXCLUDED.manglik;
INSERT INTO public.horoscope_details (user_id, star, raasi, lagnam, gothram, manglik)
VALUES ('00000000-0000-4000-a000-0000000000bf', 'Magha', 'Viruchigam', 'Kumbam', 'Murugan', 'no')
ON CONFLICT (user_id) DO UPDATE SET
  star = EXCLUDED.star,
  raasi = EXCLUDED.raasi,
  lagnam = EXCLUDED.lagnam,
  gothram = EXCLUDED.gothram,
  manglik = EXCLUDED.manglik;
INSERT INTO public.horoscope_details (user_id, star, raasi, lagnam, gothram, manglik)
VALUES ('00000000-0000-4000-a000-0000000000c0', 'Pushya', 'Magaram', 'Kumbam', 'Murugan', 'no')
ON CONFLICT (user_id) DO UPDATE SET
  star = EXCLUDED.star,
  raasi = EXCLUDED.raasi,
  lagnam = EXCLUDED.lagnam,
  gothram = EXCLUDED.gothram,
  manglik = EXCLUDED.manglik;
INSERT INTO public.horoscope_details (user_id, star, raasi, lagnam, gothram, manglik)
VALUES ('00000000-0000-4000-a000-0000000000c1', 'Pushya', 'Simham', 'Rishabam', 'Viswamitra', 'no')
ON CONFLICT (user_id) DO UPDATE SET
  star = EXCLUDED.star,
  raasi = EXCLUDED.raasi,
  lagnam = EXCLUDED.lagnam,
  gothram = EXCLUDED.gothram,
  manglik = EXCLUDED.manglik;
INSERT INTO public.horoscope_details (user_id, star, raasi, lagnam, gothram, manglik)
VALUES ('00000000-0000-4000-a000-0000000000c2', 'Moola', 'Kumbam', 'Kanni', 'Bharadwaj', 'no')
ON CONFLICT (user_id) DO UPDATE SET
  star = EXCLUDED.star,
  raasi = EXCLUDED.raasi,
  lagnam = EXCLUDED.lagnam,
  gothram = EXCLUDED.gothram,
  manglik = EXCLUDED.manglik;
INSERT INTO public.horoscope_details (user_id, star, raasi, lagnam, gothram, manglik)
VALUES ('00000000-0000-4000-a000-0000000000c3', 'Mirgashira', 'Mithunam', 'Simham', 'Murugan', 'no')
ON CONFLICT (user_id) DO UPDATE SET
  star = EXCLUDED.star,
  raasi = EXCLUDED.raasi,
  lagnam = EXCLUDED.lagnam,
  gothram = EXCLUDED.gothram,
  manglik = EXCLUDED.manglik;
INSERT INTO public.horoscope_details (user_id, star, raasi, lagnam, gothram, manglik)
VALUES ('00000000-0000-4000-a000-0000000000c4', 'Dhanishta', 'Kanni', 'Thulaam', 'Viswamitra', 'no')
ON CONFLICT (user_id) DO UPDATE SET
  star = EXCLUDED.star,
  raasi = EXCLUDED.raasi,
  lagnam = EXCLUDED.lagnam,
  gothram = EXCLUDED.gothram,
  manglik = EXCLUDED.manglik;
INSERT INTO public.horoscope_details (user_id, star, raasi, lagnam, gothram, manglik)
VALUES ('00000000-0000-4000-a000-0000000000c5', 'Poorvaphalguni', 'Mesham', 'Dhanusu', 'Viswamitra', 'no')
ON CONFLICT (user_id) DO UPDATE SET
  star = EXCLUDED.star,
  raasi = EXCLUDED.raasi,
  lagnam = EXCLUDED.lagnam,
  gothram = EXCLUDED.gothram,
  manglik = EXCLUDED.manglik;
INSERT INTO public.horoscope_details (user_id, star, raasi, lagnam, gothram, manglik)
VALUES ('00000000-0000-4000-a000-0000000000c6', 'Jyeshta', 'Kadagam', 'Kumbam', 'Angirasa', 'no')
ON CONFLICT (user_id) DO UPDATE SET
  star = EXCLUDED.star,
  raasi = EXCLUDED.raasi,
  lagnam = EXCLUDED.lagnam,
  gothram = EXCLUDED.gothram,
  manglik = EXCLUDED.manglik;
INSERT INTO public.horoscope_details (user_id, star, raasi, lagnam, gothram, manglik)
VALUES ('00000000-0000-4000-a000-0000000000c7', 'Magha', 'Dhanusu', 'Dhanusu', 'Murugan', 'no')
ON CONFLICT (user_id) DO UPDATE SET
  star = EXCLUDED.star,
  raasi = EXCLUDED.raasi,
  lagnam = EXCLUDED.lagnam,
  gothram = EXCLUDED.gothram,
  manglik = EXCLUDED.manglik;
INSERT INTO public.horoscope_details (user_id, star, raasi, lagnam, gothram, manglik)
VALUES ('00000000-0000-4000-a000-0000000000c8', 'Shatabhisha', 'Magaram', 'Viruchigam', 'Siva', 'no')
ON CONFLICT (user_id) DO UPDATE SET
  star = EXCLUDED.star,
  raasi = EXCLUDED.raasi,
  lagnam = EXCLUDED.lagnam,
  gothram = EXCLUDED.gothram,
  manglik = EXCLUDED.manglik;
INSERT INTO public.horoscope_details (user_id, star, raasi, lagnam, gothram, manglik)
VALUES ('00000000-0000-4000-a000-0000000000c9', 'Punarvasu', 'Viruchigam', 'Rishabam', 'Viswamitra', 'no')
ON CONFLICT (user_id) DO UPDATE SET
  star = EXCLUDED.star,
  raasi = EXCLUDED.raasi,
  lagnam = EXCLUDED.lagnam,
  gothram = EXCLUDED.gothram,
  manglik = EXCLUDED.manglik;
INSERT INTO public.horoscope_details (user_id, star, raasi, lagnam, gothram, manglik)
VALUES ('00000000-0000-4000-a000-0000000000ca', 'Pushya', 'Dhanusu', 'Magaram', 'Atri', 'yes')
ON CONFLICT (user_id) DO UPDATE SET
  star = EXCLUDED.star,
  raasi = EXCLUDED.raasi,
  lagnam = EXCLUDED.lagnam,
  gothram = EXCLUDED.gothram,
  manglik = EXCLUDED.manglik;
INSERT INTO public.horoscope_details (user_id, star, raasi, lagnam, gothram, manglik)
VALUES ('00000000-0000-4000-a000-0000000000cb', 'Uttarabhadrapada', 'Rishabam', 'Viruchigam', 'Bharadwaj', 'no')
ON CONFLICT (user_id) DO UPDATE SET
  star = EXCLUDED.star,
  raasi = EXCLUDED.raasi,
  lagnam = EXCLUDED.lagnam,
  gothram = EXCLUDED.gothram,
  manglik = EXCLUDED.manglik;
INSERT INTO public.horoscope_details (user_id, star, raasi, lagnam, gothram, manglik)
VALUES ('00000000-0000-4000-a000-0000000000cc', 'Mirgashira', 'Kanni', 'Viruchigam', 'Vishnu', 'no')
ON CONFLICT (user_id) DO UPDATE SET
  star = EXCLUDED.star,
  raasi = EXCLUDED.raasi,
  lagnam = EXCLUDED.lagnam,
  gothram = EXCLUDED.gothram,
  manglik = EXCLUDED.manglik;
INSERT INTO public.horoscope_details (user_id, star, raasi, lagnam, gothram, manglik)
VALUES ('00000000-0000-4000-a000-0000000000cd', 'Bharani', 'Kumbam', 'Viruchigam', 'Vishnu', 'no')
ON CONFLICT (user_id) DO UPDATE SET
  star = EXCLUDED.star,
  raasi = EXCLUDED.raasi,
  lagnam = EXCLUDED.lagnam,
  gothram = EXCLUDED.gothram,
  manglik = EXCLUDED.manglik;
INSERT INTO public.horoscope_details (user_id, star, raasi, lagnam, gothram, manglik)
VALUES ('00000000-0000-4000-a000-0000000000ce', 'Aslesha', 'Dhanusu', 'Magaram', 'Harita', 'no')
ON CONFLICT (user_id) DO UPDATE SET
  star = EXCLUDED.star,
  raasi = EXCLUDED.raasi,
  lagnam = EXCLUDED.lagnam,
  gothram = EXCLUDED.gothram,
  manglik = EXCLUDED.manglik;
INSERT INTO public.horoscope_details (user_id, star, raasi, lagnam, gothram, manglik)
VALUES ('00000000-0000-4000-a000-0000000000cf', 'Uttarachadha', 'Dhanusu', 'Thulaam', 'Harita', 'no')
ON CONFLICT (user_id) DO UPDATE SET
  star = EXCLUDED.star,
  raasi = EXCLUDED.raasi,
  lagnam = EXCLUDED.lagnam,
  gothram = EXCLUDED.gothram,
  manglik = EXCLUDED.manglik;
INSERT INTO public.horoscope_details (user_id, star, raasi, lagnam, gothram, manglik)
VALUES ('00000000-0000-4000-a000-0000000000d0', 'Pushya', 'Mesham', 'Dhanusu', 'Gautama', 'no')
ON CONFLICT (user_id) DO UPDATE SET
  star = EXCLUDED.star,
  raasi = EXCLUDED.raasi,
  lagnam = EXCLUDED.lagnam,
  gothram = EXCLUDED.gothram,
  manglik = EXCLUDED.manglik;
INSERT INTO public.horoscope_details (user_id, star, raasi, lagnam, gothram, manglik)
VALUES ('00000000-0000-4000-a000-0000000000d1', 'Hasta', 'Kanni', 'Kumbam', 'Angirasa', 'no')
ON CONFLICT (user_id) DO UPDATE SET
  star = EXCLUDED.star,
  raasi = EXCLUDED.raasi,
  lagnam = EXCLUDED.lagnam,
  gothram = EXCLUDED.gothram,
  manglik = EXCLUDED.manglik;
INSERT INTO public.horoscope_details (user_id, star, raasi, lagnam, gothram, manglik)
VALUES ('00000000-0000-4000-a000-0000000000d2', 'Krittika', 'Magaram', 'Kanni', 'Angirasa', 'no')
ON CONFLICT (user_id) DO UPDATE SET
  star = EXCLUDED.star,
  raasi = EXCLUDED.raasi,
  lagnam = EXCLUDED.lagnam,
  gothram = EXCLUDED.gothram,
  manglik = EXCLUDED.manglik;
INSERT INTO public.horoscope_details (user_id, star, raasi, lagnam, gothram, manglik)
VALUES ('00000000-0000-4000-a000-0000000000d3', 'Dhanishta', 'Dhanusu', 'Simham', 'Siva', 'no')
ON CONFLICT (user_id) DO UPDATE SET
  star = EXCLUDED.star,
  raasi = EXCLUDED.raasi,
  lagnam = EXCLUDED.lagnam,
  gothram = EXCLUDED.gothram,
  manglik = EXCLUDED.manglik;
INSERT INTO public.horoscope_details (user_id, star, raasi, lagnam, gothram, manglik)
VALUES ('00000000-0000-4000-a000-0000000000d4', 'Krittika', 'Simham', 'Kadagam', 'Bharadwaj', 'no')
ON CONFLICT (user_id) DO UPDATE SET
  star = EXCLUDED.star,
  raasi = EXCLUDED.raasi,
  lagnam = EXCLUDED.lagnam,
  gothram = EXCLUDED.gothram,
  manglik = EXCLUDED.manglik;
INSERT INTO public.horoscope_details (user_id, star, raasi, lagnam, gothram, manglik)
VALUES ('00000000-0000-4000-a000-0000000000d5', 'Uttarachadha', 'Kumbam', 'Kumbam', 'Bharadwaj', 'no')
ON CONFLICT (user_id) DO UPDATE SET
  star = EXCLUDED.star,
  raasi = EXCLUDED.raasi,
  lagnam = EXCLUDED.lagnam,
  gothram = EXCLUDED.gothram,
  manglik = EXCLUDED.manglik;
INSERT INTO public.horoscope_details (user_id, star, raasi, lagnam, gothram, manglik)
VALUES ('00000000-0000-4000-a000-0000000000d6', 'Pushya', 'Simham', 'Magaram', 'Atri', 'no')
ON CONFLICT (user_id) DO UPDATE SET
  star = EXCLUDED.star,
  raasi = EXCLUDED.raasi,
  lagnam = EXCLUDED.lagnam,
  gothram = EXCLUDED.gothram,
  manglik = EXCLUDED.manglik;
INSERT INTO public.horoscope_details (user_id, star, raasi, lagnam, gothram, manglik)
VALUES ('00000000-0000-4000-a000-0000000000d7', 'Krittika', 'Viruchigam', 'Mithunam', 'Bharadwaj', 'no')
ON CONFLICT (user_id) DO UPDATE SET
  star = EXCLUDED.star,
  raasi = EXCLUDED.raasi,
  lagnam = EXCLUDED.lagnam,
  gothram = EXCLUDED.gothram,
  manglik = EXCLUDED.manglik;
INSERT INTO public.horoscope_details (user_id, star, raasi, lagnam, gothram, manglik)
VALUES ('00000000-0000-4000-a000-0000000000d8', 'Poorvabhadrapada', 'Mesham', 'Kadagam', 'Atri', 'no')
ON CONFLICT (user_id) DO UPDATE SET
  star = EXCLUDED.star,
  raasi = EXCLUDED.raasi,
  lagnam = EXCLUDED.lagnam,
  gothram = EXCLUDED.gothram,
  manglik = EXCLUDED.manglik;
INSERT INTO public.horoscope_details (user_id, star, raasi, lagnam, gothram, manglik)
VALUES ('00000000-0000-4000-a000-0000000000d9', 'Aslesha', 'Viruchigam', 'Thulaam', 'Vishnu', 'no')
ON CONFLICT (user_id) DO UPDATE SET
  star = EXCLUDED.star,
  raasi = EXCLUDED.raasi,
  lagnam = EXCLUDED.lagnam,
  gothram = EXCLUDED.gothram,
  manglik = EXCLUDED.manglik;
INSERT INTO public.horoscope_details (user_id, star, raasi, lagnam, gothram, manglik)
VALUES ('00000000-0000-4000-a000-0000000000da', 'Shravana', 'Simham', 'Kumbam', 'Vashishta', 'no')
ON CONFLICT (user_id) DO UPDATE SET
  star = EXCLUDED.star,
  raasi = EXCLUDED.raasi,
  lagnam = EXCLUDED.lagnam,
  gothram = EXCLUDED.gothram,
  manglik = EXCLUDED.manglik;
INSERT INTO public.horoscope_details (user_id, star, raasi, lagnam, gothram, manglik)
VALUES ('00000000-0000-4000-a000-0000000000db', 'Anuradha', 'Viruchigam', 'Viruchigam', 'Kasyapa', 'no')
ON CONFLICT (user_id) DO UPDATE SET
  star = EXCLUDED.star,
  raasi = EXCLUDED.raasi,
  lagnam = EXCLUDED.lagnam,
  gothram = EXCLUDED.gothram,
  manglik = EXCLUDED.manglik;
INSERT INTO public.horoscope_details (user_id, star, raasi, lagnam, gothram, manglik)
VALUES ('00000000-0000-4000-a000-0000000000dc', 'Jyeshta', 'Meenam', 'Rishabam', 'Atri', 'no')
ON CONFLICT (user_id) DO UPDATE SET
  star = EXCLUDED.star,
  raasi = EXCLUDED.raasi,
  lagnam = EXCLUDED.lagnam,
  gothram = EXCLUDED.gothram,
  manglik = EXCLUDED.manglik;
INSERT INTO public.horoscope_details (user_id, star, raasi, lagnam, gothram, manglik)
VALUES ('00000000-0000-4000-a000-0000000000dd', 'Krittika', 'Kanni', 'Viruchigam', 'Siva', 'no')
ON CONFLICT (user_id) DO UPDATE SET
  star = EXCLUDED.star,
  raasi = EXCLUDED.raasi,
  lagnam = EXCLUDED.lagnam,
  gothram = EXCLUDED.gothram,
  manglik = EXCLUDED.manglik;
INSERT INTO public.horoscope_details (user_id, star, raasi, lagnam, gothram, manglik)
VALUES ('00000000-0000-4000-a000-0000000000de', 'Uttarabhadrapada', 'Mithunam', 'Mithunam', 'Agastya', 'no')
ON CONFLICT (user_id) DO UPDATE SET
  star = EXCLUDED.star,
  raasi = EXCLUDED.raasi,
  lagnam = EXCLUDED.lagnam,
  gothram = EXCLUDED.gothram,
  manglik = EXCLUDED.manglik;
INSERT INTO public.horoscope_details (user_id, star, raasi, lagnam, gothram, manglik)
VALUES ('00000000-0000-4000-a000-0000000000df', 'Swati', 'Kadagam', 'Mithunam', 'Bharadwaj', 'no')
ON CONFLICT (user_id) DO UPDATE SET
  star = EXCLUDED.star,
  raasi = EXCLUDED.raasi,
  lagnam = EXCLUDED.lagnam,
  gothram = EXCLUDED.gothram,
  manglik = EXCLUDED.manglik;
INSERT INTO public.horoscope_details (user_id, star, raasi, lagnam, gothram, manglik)
VALUES ('00000000-0000-4000-a000-0000000000e0', 'Hasta', 'Mesham', 'Kumbam', 'Viswamitra', 'yes')
ON CONFLICT (user_id) DO UPDATE SET
  star = EXCLUDED.star,
  raasi = EXCLUDED.raasi,
  lagnam = EXCLUDED.lagnam,
  gothram = EXCLUDED.gothram,
  manglik = EXCLUDED.manglik;
INSERT INTO public.horoscope_details (user_id, star, raasi, lagnam, gothram, manglik)
VALUES ('00000000-0000-4000-a000-0000000000e1', 'Shravana', 'Mithunam', 'Simham', 'Murugan', 'no')
ON CONFLICT (user_id) DO UPDATE SET
  star = EXCLUDED.star,
  raasi = EXCLUDED.raasi,
  lagnam = EXCLUDED.lagnam,
  gothram = EXCLUDED.gothram,
  manglik = EXCLUDED.manglik;
INSERT INTO public.horoscope_details (user_id, star, raasi, lagnam, gothram, manglik)
VALUES ('00000000-0000-4000-a000-0000000000e2', 'Chitra', 'Magaram', 'Thulaam', 'Murugan', 'no')
ON CONFLICT (user_id) DO UPDATE SET
  star = EXCLUDED.star,
  raasi = EXCLUDED.raasi,
  lagnam = EXCLUDED.lagnam,
  gothram = EXCLUDED.gothram,
  manglik = EXCLUDED.manglik;
INSERT INTO public.horoscope_details (user_id, star, raasi, lagnam, gothram, manglik)
VALUES ('00000000-0000-4000-a000-0000000000e3', 'Poorvashadha', 'Mithunam', 'Magaram', 'Kasyapa', 'no')
ON CONFLICT (user_id) DO UPDATE SET
  star = EXCLUDED.star,
  raasi = EXCLUDED.raasi,
  lagnam = EXCLUDED.lagnam,
  gothram = EXCLUDED.gothram,
  manglik = EXCLUDED.manglik;
INSERT INTO public.horoscope_details (user_id, star, raasi, lagnam, gothram, manglik)
VALUES ('00000000-0000-4000-a000-0000000000e4', 'Pushya', 'Dhanusu', 'Kumbam', 'Vashishta', 'yes')
ON CONFLICT (user_id) DO UPDATE SET
  star = EXCLUDED.star,
  raasi = EXCLUDED.raasi,
  lagnam = EXCLUDED.lagnam,
  gothram = EXCLUDED.gothram,
  manglik = EXCLUDED.manglik;
INSERT INTO public.horoscope_details (user_id, star, raasi, lagnam, gothram, manglik)
VALUES ('00000000-0000-4000-a000-0000000000e5', 'Pushya', 'Kadagam', 'Kanni', 'Viswamitra', 'no')
ON CONFLICT (user_id) DO UPDATE SET
  star = EXCLUDED.star,
  raasi = EXCLUDED.raasi,
  lagnam = EXCLUDED.lagnam,
  gothram = EXCLUDED.gothram,
  manglik = EXCLUDED.manglik;
INSERT INTO public.horoscope_details (user_id, star, raasi, lagnam, gothram, manglik)
VALUES ('00000000-0000-4000-a000-0000000000e6', 'Dhanishta', 'Mithunam', 'Simham', 'Kasyapa', 'no')
ON CONFLICT (user_id) DO UPDATE SET
  star = EXCLUDED.star,
  raasi = EXCLUDED.raasi,
  lagnam = EXCLUDED.lagnam,
  gothram = EXCLUDED.gothram,
  manglik = EXCLUDED.manglik;
INSERT INTO public.horoscope_details (user_id, star, raasi, lagnam, gothram, manglik)
VALUES ('00000000-0000-4000-a000-0000000000e7', 'Swati', 'Thulaam', 'Magaram', 'Gautama', 'no')
ON CONFLICT (user_id) DO UPDATE SET
  star = EXCLUDED.star,
  raasi = EXCLUDED.raasi,
  lagnam = EXCLUDED.lagnam,
  gothram = EXCLUDED.gothram,
  manglik = EXCLUDED.manglik;
INSERT INTO public.horoscope_details (user_id, star, raasi, lagnam, gothram, manglik)
VALUES ('00000000-0000-4000-a000-0000000000e8', 'Punarvasu', 'Magaram', 'Dhanusu', 'Viswamitra', 'no')
ON CONFLICT (user_id) DO UPDATE SET
  star = EXCLUDED.star,
  raasi = EXCLUDED.raasi,
  lagnam = EXCLUDED.lagnam,
  gothram = EXCLUDED.gothram,
  manglik = EXCLUDED.manglik;
INSERT INTO public.horoscope_details (user_id, star, raasi, lagnam, gothram, manglik)
VALUES ('00000000-0000-4000-a000-0000000000e9', 'Pushya', 'Mesham', 'Kadagam', 'Vashishta', 'no')
ON CONFLICT (user_id) DO UPDATE SET
  star = EXCLUDED.star,
  raasi = EXCLUDED.raasi,
  lagnam = EXCLUDED.lagnam,
  gothram = EXCLUDED.gothram,
  manglik = EXCLUDED.manglik;
INSERT INTO public.horoscope_details (user_id, star, raasi, lagnam, gothram, manglik)
VALUES ('00000000-0000-4000-a000-0000000000ea', 'Revati', 'Viruchigam', 'Kumbam', 'Kasyapa', 'no')
ON CONFLICT (user_id) DO UPDATE SET
  star = EXCLUDED.star,
  raasi = EXCLUDED.raasi,
  lagnam = EXCLUDED.lagnam,
  gothram = EXCLUDED.gothram,
  manglik = EXCLUDED.manglik;
INSERT INTO public.horoscope_details (user_id, star, raasi, lagnam, gothram, manglik)
VALUES ('00000000-0000-4000-a000-0000000000eb', 'Chitra', 'Mithunam', 'Rishabam', 'Agastya', 'no')
ON CONFLICT (user_id) DO UPDATE SET
  star = EXCLUDED.star,
  raasi = EXCLUDED.raasi,
  lagnam = EXCLUDED.lagnam,
  gothram = EXCLUDED.gothram,
  manglik = EXCLUDED.manglik;
INSERT INTO public.horoscope_details (user_id, star, raasi, lagnam, gothram, manglik)
VALUES ('00000000-0000-4000-a000-0000000000ec', 'Ashwini', 'Viruchigam', 'Mithunam', 'Harita', 'no')
ON CONFLICT (user_id) DO UPDATE SET
  star = EXCLUDED.star,
  raasi = EXCLUDED.raasi,
  lagnam = EXCLUDED.lagnam,
  gothram = EXCLUDED.gothram,
  manglik = EXCLUDED.manglik;
INSERT INTO public.horoscope_details (user_id, star, raasi, lagnam, gothram, manglik)
VALUES ('00000000-0000-4000-a000-0000000000ed', 'Swati', 'Magaram', 'Kanni', 'Vashishta', 'no')
ON CONFLICT (user_id) DO UPDATE SET
  star = EXCLUDED.star,
  raasi = EXCLUDED.raasi,
  lagnam = EXCLUDED.lagnam,
  gothram = EXCLUDED.gothram,
  manglik = EXCLUDED.manglik;
INSERT INTO public.horoscope_details (user_id, star, raasi, lagnam, gothram, manglik)
VALUES ('00000000-0000-4000-a000-0000000000ee', 'Shatabhisha', 'Thulaam', 'Rishabam', 'Agastya', 'no')
ON CONFLICT (user_id) DO UPDATE SET
  star = EXCLUDED.star,
  raasi = EXCLUDED.raasi,
  lagnam = EXCLUDED.lagnam,
  gothram = EXCLUDED.gothram,
  manglik = EXCLUDED.manglik;
INSERT INTO public.horoscope_details (user_id, star, raasi, lagnam, gothram, manglik)
VALUES ('00000000-0000-4000-a000-0000000000ef', 'Shatabhisha', 'Rishabam', 'Simham', 'Vishnu', 'no')
ON CONFLICT (user_id) DO UPDATE SET
  star = EXCLUDED.star,
  raasi = EXCLUDED.raasi,
  lagnam = EXCLUDED.lagnam,
  gothram = EXCLUDED.gothram,
  manglik = EXCLUDED.manglik;
INSERT INTO public.horoscope_details (user_id, star, raasi, lagnam, gothram, manglik)
VALUES ('00000000-0000-4000-a000-0000000000f0', 'Uttarabhadrapada', 'Meenam', 'Magaram', 'Harita', 'yes')
ON CONFLICT (user_id) DO UPDATE SET
  star = EXCLUDED.star,
  raasi = EXCLUDED.raasi,
  lagnam = EXCLUDED.lagnam,
  gothram = EXCLUDED.gothram,
  manglik = EXCLUDED.manglik;
INSERT INTO public.horoscope_details (user_id, star, raasi, lagnam, gothram, manglik)
VALUES ('00000000-0000-4000-a000-0000000000f1', 'Mirgashira', 'Thulaam', 'Thulaam', 'Atri', 'yes')
ON CONFLICT (user_id) DO UPDATE SET
  star = EXCLUDED.star,
  raasi = EXCLUDED.raasi,
  lagnam = EXCLUDED.lagnam,
  gothram = EXCLUDED.gothram,
  manglik = EXCLUDED.manglik;
INSERT INTO public.horoscope_details (user_id, star, raasi, lagnam, gothram, manglik)
VALUES ('00000000-0000-4000-a000-0000000000f2', 'Jyeshta', 'Mesham', 'Magaram', 'Murugan', 'no')
ON CONFLICT (user_id) DO UPDATE SET
  star = EXCLUDED.star,
  raasi = EXCLUDED.raasi,
  lagnam = EXCLUDED.lagnam,
  gothram = EXCLUDED.gothram,
  manglik = EXCLUDED.manglik;
INSERT INTO public.horoscope_details (user_id, star, raasi, lagnam, gothram, manglik)
VALUES ('00000000-0000-4000-a000-0000000000f3', 'Shatabhisha', 'Mithunam', 'Mesham', 'Angirasa', 'yes')
ON CONFLICT (user_id) DO UPDATE SET
  star = EXCLUDED.star,
  raasi = EXCLUDED.raasi,
  lagnam = EXCLUDED.lagnam,
  gothram = EXCLUDED.gothram,
  manglik = EXCLUDED.manglik;
INSERT INTO public.horoscope_details (user_id, star, raasi, lagnam, gothram, manglik)
VALUES ('00000000-0000-4000-a000-0000000000f4', 'Anuradha', 'Kanni', 'Kumbam', 'Vishnu', 'no')
ON CONFLICT (user_id) DO UPDATE SET
  star = EXCLUDED.star,
  raasi = EXCLUDED.raasi,
  lagnam = EXCLUDED.lagnam,
  gothram = EXCLUDED.gothram,
  manglik = EXCLUDED.manglik;
INSERT INTO public.horoscope_details (user_id, star, raasi, lagnam, gothram, manglik)
VALUES ('00000000-0000-4000-a000-0000000000f5', 'Swati', 'Kanni', 'Dhanusu', 'Bharadwaj', 'no')
ON CONFLICT (user_id) DO UPDATE SET
  star = EXCLUDED.star,
  raasi = EXCLUDED.raasi,
  lagnam = EXCLUDED.lagnam,
  gothram = EXCLUDED.gothram,
  manglik = EXCLUDED.manglik;
INSERT INTO public.horoscope_details (user_id, star, raasi, lagnam, gothram, manglik)
VALUES ('00000000-0000-4000-a000-0000000000f6', 'Poorvaphalguni', 'Rishabam', 'Mesham', 'Kasyapa', 'no')
ON CONFLICT (user_id) DO UPDATE SET
  star = EXCLUDED.star,
  raasi = EXCLUDED.raasi,
  lagnam = EXCLUDED.lagnam,
  gothram = EXCLUDED.gothram,
  manglik = EXCLUDED.manglik;
INSERT INTO public.horoscope_details (user_id, star, raasi, lagnam, gothram, manglik)
VALUES ('00000000-0000-4000-a000-0000000000f7', 'Vishakha', 'Simham', 'Kadagam', 'Viswamitra', 'no')
ON CONFLICT (user_id) DO UPDATE SET
  star = EXCLUDED.star,
  raasi = EXCLUDED.raasi,
  lagnam = EXCLUDED.lagnam,
  gothram = EXCLUDED.gothram,
  manglik = EXCLUDED.manglik;
INSERT INTO public.horoscope_details (user_id, star, raasi, lagnam, gothram, manglik)
VALUES ('00000000-0000-4000-a000-0000000000f8', 'Rohini', 'Kanni', 'Kumbam', 'Vashishta', 'no')
ON CONFLICT (user_id) DO UPDATE SET
  star = EXCLUDED.star,
  raasi = EXCLUDED.raasi,
  lagnam = EXCLUDED.lagnam,
  gothram = EXCLUDED.gothram,
  manglik = EXCLUDED.manglik;
INSERT INTO public.horoscope_details (user_id, star, raasi, lagnam, gothram, manglik)
VALUES ('00000000-0000-4000-a000-0000000000f9', 'Arudra', 'Simham', 'Mesham', 'Vishnu', 'no')
ON CONFLICT (user_id) DO UPDATE SET
  star = EXCLUDED.star,
  raasi = EXCLUDED.raasi,
  lagnam = EXCLUDED.lagnam,
  gothram = EXCLUDED.gothram,
  manglik = EXCLUDED.manglik;
INSERT INTO public.horoscope_details (user_id, star, raasi, lagnam, gothram, manglik)
VALUES ('00000000-0000-4000-a000-0000000000fa', 'Poorvabhadrapada', 'Simham', 'Dhanusu', 'Kasyapa', 'yes')
ON CONFLICT (user_id) DO UPDATE SET
  star = EXCLUDED.star,
  raasi = EXCLUDED.raasi,
  lagnam = EXCLUDED.lagnam,
  gothram = EXCLUDED.gothram,
  manglik = EXCLUDED.manglik;
INSERT INTO public.horoscope_details (user_id, star, raasi, lagnam, gothram, manglik)
VALUES ('00000000-0000-4000-a000-0000000000fb', 'Aslesha', 'Magaram', 'Simham', 'Murugan', 'no')
ON CONFLICT (user_id) DO UPDATE SET
  star = EXCLUDED.star,
  raasi = EXCLUDED.raasi,
  lagnam = EXCLUDED.lagnam,
  gothram = EXCLUDED.gothram,
  manglik = EXCLUDED.manglik;
INSERT INTO public.horoscope_details (user_id, star, raasi, lagnam, gothram, manglik)
VALUES ('00000000-0000-4000-a000-0000000000fc', 'Uttarabhadrapada', 'Simham', 'Thulaam', 'Angirasa', 'no')
ON CONFLICT (user_id) DO UPDATE SET
  star = EXCLUDED.star,
  raasi = EXCLUDED.raasi,
  lagnam = EXCLUDED.lagnam,
  gothram = EXCLUDED.gothram,
  manglik = EXCLUDED.manglik;
INSERT INTO public.horoscope_details (user_id, star, raasi, lagnam, gothram, manglik)
VALUES ('00000000-0000-4000-a000-0000000000fd', 'Swati', 'Kadagam', 'Meenam', 'Siva', 'yes')
ON CONFLICT (user_id) DO UPDATE SET
  star = EXCLUDED.star,
  raasi = EXCLUDED.raasi,
  lagnam = EXCLUDED.lagnam,
  gothram = EXCLUDED.gothram,
  manglik = EXCLUDED.manglik;
INSERT INTO public.horoscope_details (user_id, star, raasi, lagnam, gothram, manglik)
VALUES ('00000000-0000-4000-a000-0000000000fe', 'Moola', 'Meenam', 'Thulaam', 'Siva', 'no')
ON CONFLICT (user_id) DO UPDATE SET
  star = EXCLUDED.star,
  raasi = EXCLUDED.raasi,
  lagnam = EXCLUDED.lagnam,
  gothram = EXCLUDED.gothram,
  manglik = EXCLUDED.manglik;
INSERT INTO public.horoscope_details (user_id, star, raasi, lagnam, gothram, manglik)
VALUES ('00000000-0000-4000-a000-0000000000ff', 'Mirgashira', 'Mithunam', 'Thulaam', 'Kasyapa', 'no')
ON CONFLICT (user_id) DO UPDATE SET
  star = EXCLUDED.star,
  raasi = EXCLUDED.raasi,
  lagnam = EXCLUDED.lagnam,
  gothram = EXCLUDED.gothram,
  manglik = EXCLUDED.manglik;
INSERT INTO public.horoscope_details (user_id, star, raasi, lagnam, gothram, manglik)
VALUES ('00000000-0000-4000-a000-000000000100', 'Vishakha', 'Viruchigam', 'Kanni', 'Murugan', 'no')
ON CONFLICT (user_id) DO UPDATE SET
  star = EXCLUDED.star,
  raasi = EXCLUDED.raasi,
  lagnam = EXCLUDED.lagnam,
  gothram = EXCLUDED.gothram,
  manglik = EXCLUDED.manglik;
INSERT INTO public.horoscope_details (user_id, star, raasi, lagnam, gothram, manglik)
VALUES ('00000000-0000-4000-a000-000000000101', 'Swati', 'Magaram', 'Viruchigam', 'Harita', 'no')
ON CONFLICT (user_id) DO UPDATE SET
  star = EXCLUDED.star,
  raasi = EXCLUDED.raasi,
  lagnam = EXCLUDED.lagnam,
  gothram = EXCLUDED.gothram,
  manglik = EXCLUDED.manglik;
INSERT INTO public.horoscope_details (user_id, star, raasi, lagnam, gothram, manglik)
VALUES ('00000000-0000-4000-a000-000000000102', 'Magha', 'Kanni', 'Viruchigam', 'Kasyapa', 'no')
ON CONFLICT (user_id) DO UPDATE SET
  star = EXCLUDED.star,
  raasi = EXCLUDED.raasi,
  lagnam = EXCLUDED.lagnam,
  gothram = EXCLUDED.gothram,
  manglik = EXCLUDED.manglik;
INSERT INTO public.horoscope_details (user_id, star, raasi, lagnam, gothram, manglik)
VALUES ('00000000-0000-4000-a000-000000000103', 'Aslesha', 'Kanni', 'Dhanusu', 'Harita', 'yes')
ON CONFLICT (user_id) DO UPDATE SET
  star = EXCLUDED.star,
  raasi = EXCLUDED.raasi,
  lagnam = EXCLUDED.lagnam,
  gothram = EXCLUDED.gothram,
  manglik = EXCLUDED.manglik;
INSERT INTO public.horoscope_details (user_id, star, raasi, lagnam, gothram, manglik)
VALUES ('00000000-0000-4000-a000-000000000104', 'Swati', 'Kumbam', 'Kumbam', 'Harita', 'yes')
ON CONFLICT (user_id) DO UPDATE SET
  star = EXCLUDED.star,
  raasi = EXCLUDED.raasi,
  lagnam = EXCLUDED.lagnam,
  gothram = EXCLUDED.gothram,
  manglik = EXCLUDED.manglik;
INSERT INTO public.horoscope_details (user_id, star, raasi, lagnam, gothram, manglik)
VALUES ('00000000-0000-4000-a000-000000000105', 'Shatabhisha', 'Meenam', 'Magaram', 'Vishnu', 'no')
ON CONFLICT (user_id) DO UPDATE SET
  star = EXCLUDED.star,
  raasi = EXCLUDED.raasi,
  lagnam = EXCLUDED.lagnam,
  gothram = EXCLUDED.gothram,
  manglik = EXCLUDED.manglik;
INSERT INTO public.horoscope_details (user_id, star, raasi, lagnam, gothram, manglik)
VALUES ('00000000-0000-4000-a000-000000000106', 'Ashwini', 'Mithunam', 'Viruchigam', 'Viswamitra', 'no')
ON CONFLICT (user_id) DO UPDATE SET
  star = EXCLUDED.star,
  raasi = EXCLUDED.raasi,
  lagnam = EXCLUDED.lagnam,
  gothram = EXCLUDED.gothram,
  manglik = EXCLUDED.manglik;
INSERT INTO public.horoscope_details (user_id, star, raasi, lagnam, gothram, manglik)
VALUES ('00000000-0000-4000-a000-000000000107', 'Moola', 'Mithunam', 'Simham', 'Bharadwaj', 'no')
ON CONFLICT (user_id) DO UPDATE SET
  star = EXCLUDED.star,
  raasi = EXCLUDED.raasi,
  lagnam = EXCLUDED.lagnam,
  gothram = EXCLUDED.gothram,
  manglik = EXCLUDED.manglik;
INSERT INTO public.horoscope_details (user_id, star, raasi, lagnam, gothram, manglik)
VALUES ('00000000-0000-4000-a000-000000000108', 'Krittika', 'Meenam', 'Dhanusu', 'Siva', 'no')
ON CONFLICT (user_id) DO UPDATE SET
  star = EXCLUDED.star,
  raasi = EXCLUDED.raasi,
  lagnam = EXCLUDED.lagnam,
  gothram = EXCLUDED.gothram,
  manglik = EXCLUDED.manglik;
INSERT INTO public.horoscope_details (user_id, star, raasi, lagnam, gothram, manglik)
VALUES ('00000000-0000-4000-a000-000000000109', 'Pushya', 'Simham', 'Kanni', 'Viswamitra', 'yes')
ON CONFLICT (user_id) DO UPDATE SET
  star = EXCLUDED.star,
  raasi = EXCLUDED.raasi,
  lagnam = EXCLUDED.lagnam,
  gothram = EXCLUDED.gothram,
  manglik = EXCLUDED.manglik;
INSERT INTO public.horoscope_details (user_id, star, raasi, lagnam, gothram, manglik)
VALUES ('00000000-0000-4000-a000-00000000010a', 'Shravana', 'Rishabam', 'Kumbam', 'Viswamitra', 'no')
ON CONFLICT (user_id) DO UPDATE SET
  star = EXCLUDED.star,
  raasi = EXCLUDED.raasi,
  lagnam = EXCLUDED.lagnam,
  gothram = EXCLUDED.gothram,
  manglik = EXCLUDED.manglik;
INSERT INTO public.horoscope_details (user_id, star, raasi, lagnam, gothram, manglik)
VALUES ('00000000-0000-4000-a000-00000000010b', 'Mirgashira', 'Mesham', 'Mithunam', 'Vishnu', 'no')
ON CONFLICT (user_id) DO UPDATE SET
  star = EXCLUDED.star,
  raasi = EXCLUDED.raasi,
  lagnam = EXCLUDED.lagnam,
  gothram = EXCLUDED.gothram,
  manglik = EXCLUDED.manglik;
INSERT INTO public.horoscope_details (user_id, star, raasi, lagnam, gothram, manglik)
VALUES ('00000000-0000-4000-a000-00000000010c', 'Anuradha', 'Rishabam', 'Dhanusu', 'Agastya', 'no')
ON CONFLICT (user_id) DO UPDATE SET
  star = EXCLUDED.star,
  raasi = EXCLUDED.raasi,
  lagnam = EXCLUDED.lagnam,
  gothram = EXCLUDED.gothram,
  manglik = EXCLUDED.manglik;
INSERT INTO public.horoscope_details (user_id, star, raasi, lagnam, gothram, manglik)
VALUES ('00000000-0000-4000-a000-00000000010d', 'Krittika', 'Thulaam', 'Kanni', 'Atri', 'no')
ON CONFLICT (user_id) DO UPDATE SET
  star = EXCLUDED.star,
  raasi = EXCLUDED.raasi,
  lagnam = EXCLUDED.lagnam,
  gothram = EXCLUDED.gothram,
  manglik = EXCLUDED.manglik;
INSERT INTO public.horoscope_details (user_id, star, raasi, lagnam, gothram, manglik)
VALUES ('00000000-0000-4000-a000-00000000010e', 'Shatabhisha', 'Kanni', 'Kumbam', 'Gautama', 'no')
ON CONFLICT (user_id) DO UPDATE SET
  star = EXCLUDED.star,
  raasi = EXCLUDED.raasi,
  lagnam = EXCLUDED.lagnam,
  gothram = EXCLUDED.gothram,
  manglik = EXCLUDED.manglik;
INSERT INTO public.horoscope_details (user_id, star, raasi, lagnam, gothram, manglik)
VALUES ('00000000-0000-4000-a000-00000000010f', 'Rohini', 'Kadagam', 'Kanni', 'Harita', 'no')
ON CONFLICT (user_id) DO UPDATE SET
  star = EXCLUDED.star,
  raasi = EXCLUDED.raasi,
  lagnam = EXCLUDED.lagnam,
  gothram = EXCLUDED.gothram,
  manglik = EXCLUDED.manglik;
INSERT INTO public.horoscope_details (user_id, star, raasi, lagnam, gothram, manglik)
VALUES ('00000000-0000-4000-a000-000000000110', 'Bharani', 'Kadagam', 'Kanni', 'Murugan', 'no')
ON CONFLICT (user_id) DO UPDATE SET
  star = EXCLUDED.star,
  raasi = EXCLUDED.raasi,
  lagnam = EXCLUDED.lagnam,
  gothram = EXCLUDED.gothram,
  manglik = EXCLUDED.manglik;
INSERT INTO public.horoscope_details (user_id, star, raasi, lagnam, gothram, manglik)
VALUES ('00000000-0000-4000-a000-000000000111', 'Poorvashadha', 'Simham', 'Meenam', 'Gautama', 'no')
ON CONFLICT (user_id) DO UPDATE SET
  star = EXCLUDED.star,
  raasi = EXCLUDED.raasi,
  lagnam = EXCLUDED.lagnam,
  gothram = EXCLUDED.gothram,
  manglik = EXCLUDED.manglik;
INSERT INTO public.horoscope_details (user_id, star, raasi, lagnam, gothram, manglik)
VALUES ('00000000-0000-4000-a000-000000000112', 'Uttarachadha', 'Magaram', 'Kumbam', 'Vashishta', 'no')
ON CONFLICT (user_id) DO UPDATE SET
  star = EXCLUDED.star,
  raasi = EXCLUDED.raasi,
  lagnam = EXCLUDED.lagnam,
  gothram = EXCLUDED.gothram,
  manglik = EXCLUDED.manglik;
INSERT INTO public.horoscope_details (user_id, star, raasi, lagnam, gothram, manglik)
VALUES ('00000000-0000-4000-a000-000000000113', 'Punarvasu', 'Meenam', 'Rishabam', 'Atri', 'yes')
ON CONFLICT (user_id) DO UPDATE SET
  star = EXCLUDED.star,
  raasi = EXCLUDED.raasi,
  lagnam = EXCLUDED.lagnam,
  gothram = EXCLUDED.gothram,
  manglik = EXCLUDED.manglik;
INSERT INTO public.horoscope_details (user_id, star, raasi, lagnam, gothram, manglik)
VALUES ('00000000-0000-4000-a000-000000000114', 'Arudra', 'Viruchigam', 'Mesham', 'Angirasa', 'no')
ON CONFLICT (user_id) DO UPDATE SET
  star = EXCLUDED.star,
  raasi = EXCLUDED.raasi,
  lagnam = EXCLUDED.lagnam,
  gothram = EXCLUDED.gothram,
  manglik = EXCLUDED.manglik;
INSERT INTO public.horoscope_details (user_id, star, raasi, lagnam, gothram, manglik)
VALUES ('00000000-0000-4000-a000-000000000115', 'Jyeshta', 'Mithunam', 'Magaram', 'Bharadwaj', 'yes')
ON CONFLICT (user_id) DO UPDATE SET
  star = EXCLUDED.star,
  raasi = EXCLUDED.raasi,
  lagnam = EXCLUDED.lagnam,
  gothram = EXCLUDED.gothram,
  manglik = EXCLUDED.manglik;
INSERT INTO public.horoscope_details (user_id, star, raasi, lagnam, gothram, manglik)
VALUES ('00000000-0000-4000-a000-000000000116', 'Shravana', 'Mesham', 'Mithunam', 'Siva', 'no')
ON CONFLICT (user_id) DO UPDATE SET
  star = EXCLUDED.star,
  raasi = EXCLUDED.raasi,
  lagnam = EXCLUDED.lagnam,
  gothram = EXCLUDED.gothram,
  manglik = EXCLUDED.manglik;
INSERT INTO public.horoscope_details (user_id, star, raasi, lagnam, gothram, manglik)
VALUES ('00000000-0000-4000-a000-000000000117', 'Moola', 'Kanni', 'Rishabam', 'Vashishta', 'no')
ON CONFLICT (user_id) DO UPDATE SET
  star = EXCLUDED.star,
  raasi = EXCLUDED.raasi,
  lagnam = EXCLUDED.lagnam,
  gothram = EXCLUDED.gothram,
  manglik = EXCLUDED.manglik;
INSERT INTO public.horoscope_details (user_id, star, raasi, lagnam, gothram, manglik)
VALUES ('00000000-0000-4000-a000-000000000118', 'Poorvabhadrapada', 'Kumbam', 'Mesham', 'Gautama', 'no')
ON CONFLICT (user_id) DO UPDATE SET
  star = EXCLUDED.star,
  raasi = EXCLUDED.raasi,
  lagnam = EXCLUDED.lagnam,
  gothram = EXCLUDED.gothram,
  manglik = EXCLUDED.manglik;
INSERT INTO public.horoscope_details (user_id, star, raasi, lagnam, gothram, manglik)
VALUES ('00000000-0000-4000-a000-000000000119', 'Arudra', 'Mesham', 'Kanni', 'Vishnu', 'no')
ON CONFLICT (user_id) DO UPDATE SET
  star = EXCLUDED.star,
  raasi = EXCLUDED.raasi,
  lagnam = EXCLUDED.lagnam,
  gothram = EXCLUDED.gothram,
  manglik = EXCLUDED.manglik;
INSERT INTO public.horoscope_details (user_id, star, raasi, lagnam, gothram, manglik)
VALUES ('00000000-0000-4000-a000-00000000011a', 'Chitra', 'Meenam', 'Kadagam', 'Agastya', 'yes')
ON CONFLICT (user_id) DO UPDATE SET
  star = EXCLUDED.star,
  raasi = EXCLUDED.raasi,
  lagnam = EXCLUDED.lagnam,
  gothram = EXCLUDED.gothram,
  manglik = EXCLUDED.manglik;
INSERT INTO public.horoscope_details (user_id, star, raasi, lagnam, gothram, manglik)
VALUES ('00000000-0000-4000-a000-00000000011b', 'Uttarabhadrapada', 'Viruchigam', 'Meenam', 'Viswamitra', 'yes')
ON CONFLICT (user_id) DO UPDATE SET
  star = EXCLUDED.star,
  raasi = EXCLUDED.raasi,
  lagnam = EXCLUDED.lagnam,
  gothram = EXCLUDED.gothram,
  manglik = EXCLUDED.manglik;
INSERT INTO public.horoscope_details (user_id, star, raasi, lagnam, gothram, manglik)
VALUES ('00000000-0000-4000-a000-00000000011c', 'Poorvashadha', 'Kanni', 'Meenam', 'Kasyapa', 'yes')
ON CONFLICT (user_id) DO UPDATE SET
  star = EXCLUDED.star,
  raasi = EXCLUDED.raasi,
  lagnam = EXCLUDED.lagnam,
  gothram = EXCLUDED.gothram,
  manglik = EXCLUDED.manglik;
INSERT INTO public.horoscope_details (user_id, star, raasi, lagnam, gothram, manglik)
VALUES ('00000000-0000-4000-a000-00000000011d', 'Dhanishta', 'Simham', 'Kadagam', 'Murugan', 'yes')
ON CONFLICT (user_id) DO UPDATE SET
  star = EXCLUDED.star,
  raasi = EXCLUDED.raasi,
  lagnam = EXCLUDED.lagnam,
  gothram = EXCLUDED.gothram,
  manglik = EXCLUDED.manglik;
INSERT INTO public.horoscope_details (user_id, star, raasi, lagnam, gothram, manglik)
VALUES ('00000000-0000-4000-a000-00000000011e', 'Bharani', 'Meenam', 'Kadagam', 'Gautama', 'no')
ON CONFLICT (user_id) DO UPDATE SET
  star = EXCLUDED.star,
  raasi = EXCLUDED.raasi,
  lagnam = EXCLUDED.lagnam,
  gothram = EXCLUDED.gothram,
  manglik = EXCLUDED.manglik;
INSERT INTO public.horoscope_details (user_id, star, raasi, lagnam, gothram, manglik)
VALUES ('00000000-0000-4000-a000-00000000011f', 'Dhanishta', 'Kadagam', 'Viruchigam', 'Vashishta', 'no')
ON CONFLICT (user_id) DO UPDATE SET
  star = EXCLUDED.star,
  raasi = EXCLUDED.raasi,
  lagnam = EXCLUDED.lagnam,
  gothram = EXCLUDED.gothram,
  manglik = EXCLUDED.manglik;
INSERT INTO public.horoscope_details (user_id, star, raasi, lagnam, gothram, manglik)
VALUES ('00000000-0000-4000-a000-000000000120', 'Shravana', 'Rishabam', 'Kadagam', 'Bharadwaj', 'no')
ON CONFLICT (user_id) DO UPDATE SET
  star = EXCLUDED.star,
  raasi = EXCLUDED.raasi,
  lagnam = EXCLUDED.lagnam,
  gothram = EXCLUDED.gothram,
  manglik = EXCLUDED.manglik;
INSERT INTO public.horoscope_details (user_id, star, raasi, lagnam, gothram, manglik)
VALUES ('00000000-0000-4000-a000-000000000121', 'Uttarachadha', 'Kadagam', 'Mesham', 'Siva', 'no')
ON CONFLICT (user_id) DO UPDATE SET
  star = EXCLUDED.star,
  raasi = EXCLUDED.raasi,
  lagnam = EXCLUDED.lagnam,
  gothram = EXCLUDED.gothram,
  manglik = EXCLUDED.manglik;
INSERT INTO public.horoscope_details (user_id, star, raasi, lagnam, gothram, manglik)
VALUES ('00000000-0000-4000-a000-000000000122', 'Revati', 'Rishabam', 'Rishabam', 'Kasyapa', 'no')
ON CONFLICT (user_id) DO UPDATE SET
  star = EXCLUDED.star,
  raasi = EXCLUDED.raasi,
  lagnam = EXCLUDED.lagnam,
  gothram = EXCLUDED.gothram,
  manglik = EXCLUDED.manglik;
INSERT INTO public.horoscope_details (user_id, star, raasi, lagnam, gothram, manglik)
VALUES ('00000000-0000-4000-a000-000000000123', 'Revati', 'Magaram', 'Kanni', 'Vishnu', 'no')
ON CONFLICT (user_id) DO UPDATE SET
  star = EXCLUDED.star,
  raasi = EXCLUDED.raasi,
  lagnam = EXCLUDED.lagnam,
  gothram = EXCLUDED.gothram,
  manglik = EXCLUDED.manglik;
INSERT INTO public.horoscope_details (user_id, star, raasi, lagnam, gothram, manglik)
VALUES ('00000000-0000-4000-a000-000000000124', 'Moola', 'Magaram', 'Kadagam', 'Gautama', 'no')
ON CONFLICT (user_id) DO UPDATE SET
  star = EXCLUDED.star,
  raasi = EXCLUDED.raasi,
  lagnam = EXCLUDED.lagnam,
  gothram = EXCLUDED.gothram,
  manglik = EXCLUDED.manglik;
INSERT INTO public.horoscope_details (user_id, star, raasi, lagnam, gothram, manglik)
VALUES ('00000000-0000-4000-a000-000000000125', 'Magha', 'Viruchigam', 'Thulaam', 'Viswamitra', 'no')
ON CONFLICT (user_id) DO UPDATE SET
  star = EXCLUDED.star,
  raasi = EXCLUDED.raasi,
  lagnam = EXCLUDED.lagnam,
  gothram = EXCLUDED.gothram,
  manglik = EXCLUDED.manglik;
INSERT INTO public.horoscope_details (user_id, star, raasi, lagnam, gothram, manglik)
VALUES ('00000000-0000-4000-a000-000000000126', 'Uttarabhadrapada', 'Dhanusu', 'Dhanusu', 'Agastya', 'no')
ON CONFLICT (user_id) DO UPDATE SET
  star = EXCLUDED.star,
  raasi = EXCLUDED.raasi,
  lagnam = EXCLUDED.lagnam,
  gothram = EXCLUDED.gothram,
  manglik = EXCLUDED.manglik;
INSERT INTO public.horoscope_details (user_id, star, raasi, lagnam, gothram, manglik)
VALUES ('00000000-0000-4000-a000-000000000127', 'Magha', 'Thulaam', 'Mithunam', 'Atri', 'no')
ON CONFLICT (user_id) DO UPDATE SET
  star = EXCLUDED.star,
  raasi = EXCLUDED.raasi,
  lagnam = EXCLUDED.lagnam,
  gothram = EXCLUDED.gothram,
  manglik = EXCLUDED.manglik;
INSERT INTO public.horoscope_details (user_id, star, raasi, lagnam, gothram, manglik)
VALUES ('00000000-0000-4000-a000-000000000128', 'Poorvashadha', 'Dhanusu', 'Simham', 'Murugan', 'no')
ON CONFLICT (user_id) DO UPDATE SET
  star = EXCLUDED.star,
  raasi = EXCLUDED.raasi,
  lagnam = EXCLUDED.lagnam,
  gothram = EXCLUDED.gothram,
  manglik = EXCLUDED.manglik;
INSERT INTO public.horoscope_details (user_id, star, raasi, lagnam, gothram, manglik)
VALUES ('00000000-0000-4000-a000-000000000129', 'Poorvabhadrapada', 'Mithunam', 'Rishabam', 'Harita', 'no')
ON CONFLICT (user_id) DO UPDATE SET
  star = EXCLUDED.star,
  raasi = EXCLUDED.raasi,
  lagnam = EXCLUDED.lagnam,
  gothram = EXCLUDED.gothram,
  manglik = EXCLUDED.manglik;
INSERT INTO public.horoscope_details (user_id, star, raasi, lagnam, gothram, manglik)
VALUES ('00000000-0000-4000-a000-00000000012a', 'Anuradha', 'Dhanusu', 'Rishabam', 'Vashishta', 'no')
ON CONFLICT (user_id) DO UPDATE SET
  star = EXCLUDED.star,
  raasi = EXCLUDED.raasi,
  lagnam = EXCLUDED.lagnam,
  gothram = EXCLUDED.gothram,
  manglik = EXCLUDED.manglik;
INSERT INTO public.horoscope_details (user_id, star, raasi, lagnam, gothram, manglik)
VALUES ('00000000-0000-4000-a000-00000000012b', 'Dhanishta', 'Rishabam', 'Kumbam', 'Gautama', 'no')
ON CONFLICT (user_id) DO UPDATE SET
  star = EXCLUDED.star,
  raasi = EXCLUDED.raasi,
  lagnam = EXCLUDED.lagnam,
  gothram = EXCLUDED.gothram,
  manglik = EXCLUDED.manglik;
INSERT INTO public.horoscope_details (user_id, star, raasi, lagnam, gothram, manglik)
VALUES ('00000000-0000-4000-a000-00000000012c', 'Jyeshta', 'Kadagam', 'Kanni', 'Vashishta', 'no')
ON CONFLICT (user_id) DO UPDATE SET
  star = EXCLUDED.star,
  raasi = EXCLUDED.raasi,
  lagnam = EXCLUDED.lagnam,
  gothram = EXCLUDED.gothram,
  manglik = EXCLUDED.manglik;
INSERT INTO public.horoscope_details (user_id, star, raasi, lagnam, gothram, manglik)
VALUES ('00000000-0000-4000-a000-00000000012d', 'Magha', 'Dhanusu', 'Rishabam', 'Vashishta', 'no')
ON CONFLICT (user_id) DO UPDATE SET
  star = EXCLUDED.star,
  raasi = EXCLUDED.raasi,
  lagnam = EXCLUDED.lagnam,
  gothram = EXCLUDED.gothram,
  manglik = EXCLUDED.manglik;
INSERT INTO public.horoscope_details (user_id, star, raasi, lagnam, gothram, manglik)
VALUES ('00000000-0000-4000-a000-00000000012e', 'Revati', 'Mithunam', 'Rishabam', 'Harita', 'no')
ON CONFLICT (user_id) DO UPDATE SET
  star = EXCLUDED.star,
  raasi = EXCLUDED.raasi,
  lagnam = EXCLUDED.lagnam,
  gothram = EXCLUDED.gothram,
  manglik = EXCLUDED.manglik;
INSERT INTO public.horoscope_details (user_id, star, raasi, lagnam, gothram, manglik)
VALUES ('00000000-0000-4000-a000-00000000012f', 'Uttarabhadrapada', 'Rishabam', 'Kumbam', 'Siva', 'no')
ON CONFLICT (user_id) DO UPDATE SET
  star = EXCLUDED.star,
  raasi = EXCLUDED.raasi,
  lagnam = EXCLUDED.lagnam,
  gothram = EXCLUDED.gothram,
  manglik = EXCLUDED.manglik;
INSERT INTO public.horoscope_details (user_id, star, raasi, lagnam, gothram, manglik)
VALUES ('00000000-0000-4000-a000-000000000130', 'Bharani', 'Mesham', 'Magaram', 'Angirasa', 'no')
ON CONFLICT (user_id) DO UPDATE SET
  star = EXCLUDED.star,
  raasi = EXCLUDED.raasi,
  lagnam = EXCLUDED.lagnam,
  gothram = EXCLUDED.gothram,
  manglik = EXCLUDED.manglik;
INSERT INTO public.horoscope_details (user_id, star, raasi, lagnam, gothram, manglik)
VALUES ('00000000-0000-4000-a000-000000000131', 'Vishakha', 'Rishabam', 'Meenam', 'Siva', 'no')
ON CONFLICT (user_id) DO UPDATE SET
  star = EXCLUDED.star,
  raasi = EXCLUDED.raasi,
  lagnam = EXCLUDED.lagnam,
  gothram = EXCLUDED.gothram,
  manglik = EXCLUDED.manglik;
INSERT INTO public.horoscope_details (user_id, star, raasi, lagnam, gothram, manglik)
VALUES ('00000000-0000-4000-a000-000000000132', 'Uttarabhadrapada', 'Viruchigam', 'Kanni', 'Angirasa', 'no')
ON CONFLICT (user_id) DO UPDATE SET
  star = EXCLUDED.star,
  raasi = EXCLUDED.raasi,
  lagnam = EXCLUDED.lagnam,
  gothram = EXCLUDED.gothram,
  manglik = EXCLUDED.manglik;
INSERT INTO public.horoscope_details (user_id, star, raasi, lagnam, gothram, manglik)
VALUES ('00000000-0000-4000-a000-000000000133', 'Rohini', 'Kadagam', 'Kadagam', 'Murugan', 'yes')
ON CONFLICT (user_id) DO UPDATE SET
  star = EXCLUDED.star,
  raasi = EXCLUDED.raasi,
  lagnam = EXCLUDED.lagnam,
  gothram = EXCLUDED.gothram,
  manglik = EXCLUDED.manglik;
INSERT INTO public.horoscope_details (user_id, star, raasi, lagnam, gothram, manglik)
VALUES ('00000000-0000-4000-a000-000000000134', 'Chitra', 'Viruchigam', 'Mithunam', 'Harita', 'no')
ON CONFLICT (user_id) DO UPDATE SET
  star = EXCLUDED.star,
  raasi = EXCLUDED.raasi,
  lagnam = EXCLUDED.lagnam,
  gothram = EXCLUDED.gothram,
  manglik = EXCLUDED.manglik;
INSERT INTO public.horoscope_details (user_id, star, raasi, lagnam, gothram, manglik)
VALUES ('00000000-0000-4000-a000-000000000135', 'Pushya', 'Mesham', 'Dhanusu', 'Siva', 'yes')
ON CONFLICT (user_id) DO UPDATE SET
  star = EXCLUDED.star,
  raasi = EXCLUDED.raasi,
  lagnam = EXCLUDED.lagnam,
  gothram = EXCLUDED.gothram,
  manglik = EXCLUDED.manglik;
INSERT INTO public.horoscope_details (user_id, star, raasi, lagnam, gothram, manglik)
VALUES ('00000000-0000-4000-a000-000000000136', 'Vishakha', 'Mithunam', 'Mesham', 'Bharadwaj', 'no')
ON CONFLICT (user_id) DO UPDATE SET
  star = EXCLUDED.star,
  raasi = EXCLUDED.raasi,
  lagnam = EXCLUDED.lagnam,
  gothram = EXCLUDED.gothram,
  manglik = EXCLUDED.manglik;
INSERT INTO public.horoscope_details (user_id, star, raasi, lagnam, gothram, manglik)
VALUES ('00000000-0000-4000-a000-000000000137', 'Jyeshta', 'Rishabam', 'Dhanusu', 'Kasyapa', 'no')
ON CONFLICT (user_id) DO UPDATE SET
  star = EXCLUDED.star,
  raasi = EXCLUDED.raasi,
  lagnam = EXCLUDED.lagnam,
  gothram = EXCLUDED.gothram,
  manglik = EXCLUDED.manglik;
INSERT INTO public.horoscope_details (user_id, star, raasi, lagnam, gothram, manglik)
VALUES ('00000000-0000-4000-a000-000000000138', 'Rohini', 'Kumbam', 'Kadagam', 'Angirasa', 'no')
ON CONFLICT (user_id) DO UPDATE SET
  star = EXCLUDED.star,
  raasi = EXCLUDED.raasi,
  lagnam = EXCLUDED.lagnam,
  gothram = EXCLUDED.gothram,
  manglik = EXCLUDED.manglik;
INSERT INTO public.horoscope_details (user_id, star, raasi, lagnam, gothram, manglik)
VALUES ('00000000-0000-4000-a000-000000000139', 'Swati', 'Magaram', 'Dhanusu', 'Agastya', 'no')
ON CONFLICT (user_id) DO UPDATE SET
  star = EXCLUDED.star,
  raasi = EXCLUDED.raasi,
  lagnam = EXCLUDED.lagnam,
  gothram = EXCLUDED.gothram,
  manglik = EXCLUDED.manglik;
INSERT INTO public.horoscope_details (user_id, star, raasi, lagnam, gothram, manglik)
VALUES ('00000000-0000-4000-a000-00000000013a', 'Arudra', 'Rishabam', 'Magaram', 'Murugan', 'yes')
ON CONFLICT (user_id) DO UPDATE SET
  star = EXCLUDED.star,
  raasi = EXCLUDED.raasi,
  lagnam = EXCLUDED.lagnam,
  gothram = EXCLUDED.gothram,
  manglik = EXCLUDED.manglik;
INSERT INTO public.horoscope_details (user_id, star, raasi, lagnam, gothram, manglik)
VALUES ('00000000-0000-4000-a000-00000000013b', 'Swati', 'Kadagam', 'Kadagam', 'Viswamitra', 'yes')
ON CONFLICT (user_id) DO UPDATE SET
  star = EXCLUDED.star,
  raasi = EXCLUDED.raasi,
  lagnam = EXCLUDED.lagnam,
  gothram = EXCLUDED.gothram,
  manglik = EXCLUDED.manglik;
INSERT INTO public.horoscope_details (user_id, star, raasi, lagnam, gothram, manglik)
VALUES ('00000000-0000-4000-a000-00000000013c', 'Moola', 'Dhanusu', 'Mesham', 'Angirasa', 'no')
ON CONFLICT (user_id) DO UPDATE SET
  star = EXCLUDED.star,
  raasi = EXCLUDED.raasi,
  lagnam = EXCLUDED.lagnam,
  gothram = EXCLUDED.gothram,
  manglik = EXCLUDED.manglik;
INSERT INTO public.horoscope_details (user_id, star, raasi, lagnam, gothram, manglik)
VALUES ('00000000-0000-4000-a000-00000000013d', 'Shatabhisha', 'Mesham', 'Kadagam', 'Angirasa', 'no')
ON CONFLICT (user_id) DO UPDATE SET
  star = EXCLUDED.star,
  raasi = EXCLUDED.raasi,
  lagnam = EXCLUDED.lagnam,
  gothram = EXCLUDED.gothram,
  manglik = EXCLUDED.manglik;
INSERT INTO public.horoscope_details (user_id, star, raasi, lagnam, gothram, manglik)
VALUES ('00000000-0000-4000-a000-00000000013e', 'Rohini', 'Meenam', 'Simham', 'Vishnu', 'no')
ON CONFLICT (user_id) DO UPDATE SET
  star = EXCLUDED.star,
  raasi = EXCLUDED.raasi,
  lagnam = EXCLUDED.lagnam,
  gothram = EXCLUDED.gothram,
  manglik = EXCLUDED.manglik;
INSERT INTO public.horoscope_details (user_id, star, raasi, lagnam, gothram, manglik)
VALUES ('00000000-0000-4000-a000-00000000013f', 'Pushya', 'Dhanusu', 'Viruchigam', 'Harita', 'no')
ON CONFLICT (user_id) DO UPDATE SET
  star = EXCLUDED.star,
  raasi = EXCLUDED.raasi,
  lagnam = EXCLUDED.lagnam,
  gothram = EXCLUDED.gothram,
  manglik = EXCLUDED.manglik;
INSERT INTO public.horoscope_details (user_id, star, raasi, lagnam, gothram, manglik)
VALUES ('00000000-0000-4000-a000-000000000140', 'Arudra', 'Meenam', 'Viruchigam', 'Murugan', 'yes')
ON CONFLICT (user_id) DO UPDATE SET
  star = EXCLUDED.star,
  raasi = EXCLUDED.raasi,
  lagnam = EXCLUDED.lagnam,
  gothram = EXCLUDED.gothram,
  manglik = EXCLUDED.manglik;
INSERT INTO public.horoscope_details (user_id, star, raasi, lagnam, gothram, manglik)
VALUES ('00000000-0000-4000-a000-000000000141', 'Hasta', 'Kanni', 'Simham', 'Agastya', 'no')
ON CONFLICT (user_id) DO UPDATE SET
  star = EXCLUDED.star,
  raasi = EXCLUDED.raasi,
  lagnam = EXCLUDED.lagnam,
  gothram = EXCLUDED.gothram,
  manglik = EXCLUDED.manglik;
INSERT INTO public.horoscope_details (user_id, star, raasi, lagnam, gothram, manglik)
VALUES ('00000000-0000-4000-a000-000000000142', 'Chitra', 'Mesham', 'Thulaam', 'Vishnu', 'no')
ON CONFLICT (user_id) DO UPDATE SET
  star = EXCLUDED.star,
  raasi = EXCLUDED.raasi,
  lagnam = EXCLUDED.lagnam,
  gothram = EXCLUDED.gothram,
  manglik = EXCLUDED.manglik;
INSERT INTO public.horoscope_details (user_id, star, raasi, lagnam, gothram, manglik)
VALUES ('00000000-0000-4000-a000-000000000143', 'Poorvaphalguni', 'Kanni', 'Dhanusu', 'Kasyapa', 'no')
ON CONFLICT (user_id) DO UPDATE SET
  star = EXCLUDED.star,
  raasi = EXCLUDED.raasi,
  lagnam = EXCLUDED.lagnam,
  gothram = EXCLUDED.gothram,
  manglik = EXCLUDED.manglik;
INSERT INTO public.horoscope_details (user_id, star, raasi, lagnam, gothram, manglik)
VALUES ('00000000-0000-4000-a000-000000000144', 'Poorvabhadrapada', 'Kumbam', 'Kanni', 'Vashishta', 'no')
ON CONFLICT (user_id) DO UPDATE SET
  star = EXCLUDED.star,
  raasi = EXCLUDED.raasi,
  lagnam = EXCLUDED.lagnam,
  gothram = EXCLUDED.gothram,
  manglik = EXCLUDED.manglik;
INSERT INTO public.horoscope_details (user_id, star, raasi, lagnam, gothram, manglik)
VALUES ('00000000-0000-4000-a000-000000000145', 'Chitra', 'Kanni', 'Rishabam', 'Bharadwaj', 'yes')
ON CONFLICT (user_id) DO UPDATE SET
  star = EXCLUDED.star,
  raasi = EXCLUDED.raasi,
  lagnam = EXCLUDED.lagnam,
  gothram = EXCLUDED.gothram,
  manglik = EXCLUDED.manglik;
INSERT INTO public.horoscope_details (user_id, star, raasi, lagnam, gothram, manglik)
VALUES ('00000000-0000-4000-a000-000000000146', 'Anuradha', 'Dhanusu', 'Rishabam', 'Vashishta', 'no')
ON CONFLICT (user_id) DO UPDATE SET
  star = EXCLUDED.star,
  raasi = EXCLUDED.raasi,
  lagnam = EXCLUDED.lagnam,
  gothram = EXCLUDED.gothram,
  manglik = EXCLUDED.manglik;
INSERT INTO public.horoscope_details (user_id, star, raasi, lagnam, gothram, manglik)
VALUES ('00000000-0000-4000-a000-000000000147', 'Uttarachadha', 'Dhanusu', 'Simham', 'Gautama', 'no')
ON CONFLICT (user_id) DO UPDATE SET
  star = EXCLUDED.star,
  raasi = EXCLUDED.raasi,
  lagnam = EXCLUDED.lagnam,
  gothram = EXCLUDED.gothram,
  manglik = EXCLUDED.manglik;
INSERT INTO public.horoscope_details (user_id, star, raasi, lagnam, gothram, manglik)
VALUES ('00000000-0000-4000-a000-000000000148', 'Poorvaphalguni', 'Kumbam', 'Meenam', 'Gautama', 'no')
ON CONFLICT (user_id) DO UPDATE SET
  star = EXCLUDED.star,
  raasi = EXCLUDED.raasi,
  lagnam = EXCLUDED.lagnam,
  gothram = EXCLUDED.gothram,
  manglik = EXCLUDED.manglik;
INSERT INTO public.horoscope_details (user_id, star, raasi, lagnam, gothram, manglik)
VALUES ('00000000-0000-4000-a000-000000000149', 'Poorvabhadrapada', 'Simham', 'Kanni', 'Vashishta', 'no')
ON CONFLICT (user_id) DO UPDATE SET
  star = EXCLUDED.star,
  raasi = EXCLUDED.raasi,
  lagnam = EXCLUDED.lagnam,
  gothram = EXCLUDED.gothram,
  manglik = EXCLUDED.manglik;
INSERT INTO public.horoscope_details (user_id, star, raasi, lagnam, gothram, manglik)
VALUES ('00000000-0000-4000-a000-00000000014a', 'Uttarabhadrapada', 'Dhanusu', 'Rishabam', 'Siva', 'yes')
ON CONFLICT (user_id) DO UPDATE SET
  star = EXCLUDED.star,
  raasi = EXCLUDED.raasi,
  lagnam = EXCLUDED.lagnam,
  gothram = EXCLUDED.gothram,
  manglik = EXCLUDED.manglik;
INSERT INTO public.horoscope_details (user_id, star, raasi, lagnam, gothram, manglik)
VALUES ('00000000-0000-4000-a000-00000000014b', 'Jyeshta', 'Kadagam', 'Kanni', 'Kasyapa', 'no')
ON CONFLICT (user_id) DO UPDATE SET
  star = EXCLUDED.star,
  raasi = EXCLUDED.raasi,
  lagnam = EXCLUDED.lagnam,
  gothram = EXCLUDED.gothram,
  manglik = EXCLUDED.manglik;
INSERT INTO public.horoscope_details (user_id, star, raasi, lagnam, gothram, manglik)
VALUES ('00000000-0000-4000-a000-00000000014c', 'Dhanishta', 'Meenam', 'Magaram', 'Vishnu', 'no')
ON CONFLICT (user_id) DO UPDATE SET
  star = EXCLUDED.star,
  raasi = EXCLUDED.raasi,
  lagnam = EXCLUDED.lagnam,
  gothram = EXCLUDED.gothram,
  manglik = EXCLUDED.manglik;
INSERT INTO public.horoscope_details (user_id, star, raasi, lagnam, gothram, manglik)
VALUES ('00000000-0000-4000-a000-00000000014d', 'Magha', 'Kadagam', 'Simham', 'Gautama', 'no')
ON CONFLICT (user_id) DO UPDATE SET
  star = EXCLUDED.star,
  raasi = EXCLUDED.raasi,
  lagnam = EXCLUDED.lagnam,
  gothram = EXCLUDED.gothram,
  manglik = EXCLUDED.manglik;
INSERT INTO public.horoscope_details (user_id, star, raasi, lagnam, gothram, manglik)
VALUES ('00000000-0000-4000-a000-00000000014e', 'Aslesha', 'Kanni', 'Simham', 'Angirasa', 'no')
ON CONFLICT (user_id) DO UPDATE SET
  star = EXCLUDED.star,
  raasi = EXCLUDED.raasi,
  lagnam = EXCLUDED.lagnam,
  gothram = EXCLUDED.gothram,
  manglik = EXCLUDED.manglik;
INSERT INTO public.horoscope_details (user_id, star, raasi, lagnam, gothram, manglik)
VALUES ('00000000-0000-4000-a000-00000000014f', 'Revati', 'Viruchigam', 'Simham', 'Agastya', 'no')
ON CONFLICT (user_id) DO UPDATE SET
  star = EXCLUDED.star,
  raasi = EXCLUDED.raasi,
  lagnam = EXCLUDED.lagnam,
  gothram = EXCLUDED.gothram,
  manglik = EXCLUDED.manglik;
INSERT INTO public.horoscope_details (user_id, star, raasi, lagnam, gothram, manglik)
VALUES ('00000000-0000-4000-a000-000000000150', 'Ashwini', 'Kadagam', 'Kanni', 'Bharadwaj', 'no')
ON CONFLICT (user_id) DO UPDATE SET
  star = EXCLUDED.star,
  raasi = EXCLUDED.raasi,
  lagnam = EXCLUDED.lagnam,
  gothram = EXCLUDED.gothram,
  manglik = EXCLUDED.manglik;
INSERT INTO public.horoscope_details (user_id, star, raasi, lagnam, gothram, manglik)
VALUES ('00000000-0000-4000-a000-000000000151', 'Revati', 'Magaram', 'Mesham', 'Siva', 'yes')
ON CONFLICT (user_id) DO UPDATE SET
  star = EXCLUDED.star,
  raasi = EXCLUDED.raasi,
  lagnam = EXCLUDED.lagnam,
  gothram = EXCLUDED.gothram,
  manglik = EXCLUDED.manglik;
INSERT INTO public.horoscope_details (user_id, star, raasi, lagnam, gothram, manglik)
VALUES ('00000000-0000-4000-a000-000000000152', 'Anuradha', 'Simham', 'Kadagam', 'Agastya', 'no')
ON CONFLICT (user_id) DO UPDATE SET
  star = EXCLUDED.star,
  raasi = EXCLUDED.raasi,
  lagnam = EXCLUDED.lagnam,
  gothram = EXCLUDED.gothram,
  manglik = EXCLUDED.manglik;
INSERT INTO public.horoscope_details (user_id, star, raasi, lagnam, gothram, manglik)
VALUES ('00000000-0000-4000-a000-000000000153', 'Ashwini', 'Meenam', 'Dhanusu', 'Murugan', 'no')
ON CONFLICT (user_id) DO UPDATE SET
  star = EXCLUDED.star,
  raasi = EXCLUDED.raasi,
  lagnam = EXCLUDED.lagnam,
  gothram = EXCLUDED.gothram,
  manglik = EXCLUDED.manglik;
INSERT INTO public.horoscope_details (user_id, star, raasi, lagnam, gothram, manglik)
VALUES ('00000000-0000-4000-a000-000000000154', 'Aslesha', 'Meenam', 'Mesham', 'Atri', 'yes')
ON CONFLICT (user_id) DO UPDATE SET
  star = EXCLUDED.star,
  raasi = EXCLUDED.raasi,
  lagnam = EXCLUDED.lagnam,
  gothram = EXCLUDED.gothram,
  manglik = EXCLUDED.manglik;

-- 4. PARTNER PREFERENCES INSERTIONS
INSERT INTO public.partner_preferences (user_id, age_min, age_max, height_min, height_max, marital_status, religion, caste, education, occupation, food_habit)
VALUES ('00000000-0000-4000-a000-0000000000ab', 25, 31, 151, 166, ARRAY['never_married']::TEXT[], ARRAY['Hindu']::TEXT[], ARRAY['Arunthathiyar', 'Caste No Bar']::TEXT[], ARRAY['B.Com', 'No Education Bar']::TEXT[], ARRAY['Business Owner']::TEXT[], ARRAY['vegetarian','non_vegetarian']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  height_min = EXCLUDED.height_min,
  height_max = EXCLUDED.height_max,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  education = EXCLUDED.education,
  occupation = EXCLUDED.occupation,
  food_habit = EXCLUDED.food_habit;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, height_min, height_max, marital_status, religion, caste, education, occupation, food_habit)
VALUES ('00000000-0000-4000-a000-0000000000ac', 23, 35, 150, 165, ARRAY['never_married']::TEXT[], ARRAY['Hindu']::TEXT[], ARRAY['Naidu', 'Caste No Bar']::TEXT[], ARRAY['B.Ed', 'No Education Bar']::TEXT[], ARRAY['Civil Engineer']::TEXT[], ARRAY['vegetarian','non_vegetarian']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  height_min = EXCLUDED.height_min,
  height_max = EXCLUDED.height_max,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  education = EXCLUDED.education,
  occupation = EXCLUDED.occupation,
  food_habit = EXCLUDED.food_habit;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, height_min, height_max, marital_status, religion, caste, education, occupation, food_habit)
VALUES ('00000000-0000-4000-a000-0000000000ad', 25, 30, 154, 169, ARRAY['never_married']::TEXT[], ARRAY['Hindu']::TEXT[], ARRAY['Gounder', 'Caste No Bar']::TEXT[], ARRAY['Ph.D', 'No Education Bar']::TEXT[], ARRAY['Business Owner']::TEXT[], ARRAY['vegetarian','non_vegetarian']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  height_min = EXCLUDED.height_min,
  height_max = EXCLUDED.height_max,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  education = EXCLUDED.education,
  occupation = EXCLUDED.occupation,
  food_habit = EXCLUDED.food_habit;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, height_min, height_max, marital_status, religion, caste, education, occupation, food_habit)
VALUES ('00000000-0000-4000-a000-0000000000ae', 27, 40, 139, 154, ARRAY['never_married']::TEXT[], ARRAY['Hindu']::TEXT[], ARRAY['Sengunthar', 'Caste No Bar']::TEXT[], ARRAY['B.Ed', 'No Education Bar']::TEXT[], ARRAY['School Teacher']::TEXT[], ARRAY['vegetarian','non_vegetarian']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  height_min = EXCLUDED.height_min,
  height_max = EXCLUDED.height_max,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  education = EXCLUDED.education,
  occupation = EXCLUDED.occupation,
  food_habit = EXCLUDED.food_habit;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, height_min, height_max, marital_status, religion, caste, education, occupation, food_habit)
VALUES ('00000000-0000-4000-a000-0000000000af', 21, 44, 153, 168, ARRAY['never_married']::TEXT[], ARRAY['Hindu']::TEXT[], ARRAY['Mudaliar', 'Caste No Bar']::TEXT[], ARRAY['B.Com', 'No Education Bar']::TEXT[], ARRAY['Business Owner']::TEXT[], ARRAY['vegetarian','non_vegetarian']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  height_min = EXCLUDED.height_min,
  height_max = EXCLUDED.height_max,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  education = EXCLUDED.education,
  occupation = EXCLUDED.occupation,
  food_habit = EXCLUDED.food_habit;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, height_min, height_max, marital_status, religion, caste, education, occupation, food_habit)
VALUES ('00000000-0000-4000-a000-0000000000b0', 26, 39, 150, 165, ARRAY['never_married']::TEXT[], ARRAY['Hindu']::TEXT[], ARRAY['Arunthathiyar', 'Caste No Bar']::TEXT[], ARRAY['M.C.A', 'No Education Bar']::TEXT[], ARRAY['Business Owner']::TEXT[], ARRAY['vegetarian','non_vegetarian']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  height_min = EXCLUDED.height_min,
  height_max = EXCLUDED.height_max,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  education = EXCLUDED.education,
  occupation = EXCLUDED.occupation,
  food_habit = EXCLUDED.food_habit;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, height_min, height_max, marital_status, religion, caste, education, occupation, food_habit)
VALUES ('00000000-0000-4000-a000-0000000000b1', 24, 31, 160, 175, ARRAY['never_married']::TEXT[], ARRAY['Hindu']::TEXT[], ARRAY['Maravar', 'Caste No Bar']::TEXT[], ARRAY['M.Com', 'No Education Bar']::TEXT[], ARRAY['Bank Manager']::TEXT[], ARRAY['vegetarian','non_vegetarian']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  height_min = EXCLUDED.height_min,
  height_max = EXCLUDED.height_max,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  education = EXCLUDED.education,
  occupation = EXCLUDED.occupation,
  food_habit = EXCLUDED.food_habit;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, height_min, height_max, marital_status, religion, caste, education, occupation, food_habit)
VALUES ('00000000-0000-4000-a000-0000000000b2', 26, 35, 140, 155, ARRAY['never_married']::TEXT[], ARRAY['Muslim']::TEXT[], ARRAY['Shia Muslim', 'Caste No Bar']::TEXT[], ARRAY['Ph.D', 'No Education Bar']::TEXT[], ARRAY['Doctor']::TEXT[], ARRAY['vegetarian','non_vegetarian']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  height_min = EXCLUDED.height_min,
  height_max = EXCLUDED.height_max,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  education = EXCLUDED.education,
  occupation = EXCLUDED.occupation,
  food_habit = EXCLUDED.food_habit;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, height_min, height_max, marital_status, religion, caste, education, occupation, food_habit)
VALUES ('00000000-0000-4000-a000-0000000000b3', 21, 45, 168, 183, ARRAY['never_married']::TEXT[], ARRAY['Hindu']::TEXT[], ARRAY['Gounder', 'Caste No Bar']::TEXT[], ARRAY['M.Com', 'No Education Bar']::TEXT[], ARRAY['Police Officer']::TEXT[], ARRAY['vegetarian','non_vegetarian']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  height_min = EXCLUDED.height_min,
  height_max = EXCLUDED.height_max,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  education = EXCLUDED.education,
  occupation = EXCLUDED.occupation,
  food_habit = EXCLUDED.food_habit;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, height_min, height_max, marital_status, religion, caste, education, occupation, food_habit)
VALUES ('00000000-0000-4000-a000-0000000000b4', 23, 30, 158, 173, ARRAY['never_married']::TEXT[], ARRAY['Hindu']::TEXT[], ARRAY['Gounder', 'Caste No Bar']::TEXT[], ARRAY['M.Com', 'No Education Bar']::TEXT[], ARRAY['Architect']::TEXT[], ARRAY['vegetarian','non_vegetarian']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  height_min = EXCLUDED.height_min,
  height_max = EXCLUDED.height_max,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  education = EXCLUDED.education,
  occupation = EXCLUDED.occupation,
  food_habit = EXCLUDED.food_habit;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, height_min, height_max, marital_status, religion, caste, education, occupation, food_habit)
VALUES ('00000000-0000-4000-a000-0000000000b5', 27, 30, 159, 174, ARRAY['never_married']::TEXT[], ARRAY['Hindu']::TEXT[], ARRAY['Brahmin - Iyer', 'Caste No Bar']::TEXT[], ARRAY['B.Ed', 'No Education Bar']::TEXT[], ARRAY['Doctor']::TEXT[], ARRAY['vegetarian','non_vegetarian']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  height_min = EXCLUDED.height_min,
  height_max = EXCLUDED.height_max,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  education = EXCLUDED.education,
  occupation = EXCLUDED.occupation,
  food_habit = EXCLUDED.food_habit;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, height_min, height_max, marital_status, religion, caste, education, occupation, food_habit)
VALUES ('00000000-0000-4000-a000-0000000000b6', 25, 45, 138, 153, ARRAY['never_married']::TEXT[], ARRAY['Hindu']::TEXT[], ARRAY['Kallar', 'Caste No Bar']::TEXT[], ARRAY['M.A', 'No Education Bar']::TEXT[], ARRAY['Doctor']::TEXT[], ARRAY['vegetarian','non_vegetarian']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  height_min = EXCLUDED.height_min,
  height_max = EXCLUDED.height_max,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  education = EXCLUDED.education,
  occupation = EXCLUDED.occupation,
  food_habit = EXCLUDED.food_habit;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, height_min, height_max, marital_status, religion, caste, education, occupation, food_habit)
VALUES ('00000000-0000-4000-a000-0000000000b7', 28, 42, 173, 188, ARRAY['never_married']::TEXT[], ARRAY['Hindu']::TEXT[], ARRAY['Chettiar', 'Caste No Bar']::TEXT[], ARRAY['M.B.A', 'No Education Bar']::TEXT[], ARRAY['Architect']::TEXT[], ARRAY['vegetarian','non_vegetarian']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  height_min = EXCLUDED.height_min,
  height_max = EXCLUDED.height_max,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  education = EXCLUDED.education,
  occupation = EXCLUDED.occupation,
  food_habit = EXCLUDED.food_habit;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, height_min, height_max, marital_status, religion, caste, education, occupation, food_habit)
VALUES ('00000000-0000-4000-a000-0000000000b8', 28, 45, 149, 164, ARRAY['never_married']::TEXT[], ARRAY['Hindu']::TEXT[], ARRAY['Thevar', 'Caste No Bar']::TEXT[], ARRAY['M.C.A', 'No Education Bar']::TEXT[], ARRAY['Architect']::TEXT[], ARRAY['vegetarian','non_vegetarian']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  height_min = EXCLUDED.height_min,
  height_max = EXCLUDED.height_max,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  education = EXCLUDED.education,
  occupation = EXCLUDED.occupation,
  food_habit = EXCLUDED.food_habit;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, height_min, height_max, marital_status, religion, caste, education, occupation, food_habit)
VALUES ('00000000-0000-4000-a000-0000000000b9', 28, 32, 164, 179, ARRAY['never_married']::TEXT[], ARRAY['Hindu']::TEXT[], ARRAY['Kallar', 'Caste No Bar']::TEXT[], ARRAY['M.B.B.S', 'No Education Bar']::TEXT[], ARRAY['Bank Manager']::TEXT[], ARRAY['vegetarian','non_vegetarian']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  height_min = EXCLUDED.height_min,
  height_max = EXCLUDED.height_max,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  education = EXCLUDED.education,
  occupation = EXCLUDED.occupation,
  food_habit = EXCLUDED.food_habit;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, height_min, height_max, marital_status, religion, caste, education, occupation, food_habit)
VALUES ('00000000-0000-4000-a000-0000000000ba', 27, 30, 144, 159, ARRAY['never_married']::TEXT[], ARRAY['Hindu']::TEXT[], ARRAY['Naidu', 'Caste No Bar']::TEXT[], ARRAY['M.A', 'No Education Bar']::TEXT[], ARRAY['School Teacher']::TEXT[], ARRAY['vegetarian','non_vegetarian']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  height_min = EXCLUDED.height_min,
  height_max = EXCLUDED.height_max,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  education = EXCLUDED.education,
  occupation = EXCLUDED.occupation,
  food_habit = EXCLUDED.food_habit;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, height_min, height_max, marital_status, religion, caste, education, occupation, food_habit)
VALUES ('00000000-0000-4000-a000-0000000000bb', 26, 43, 161, 176, ARRAY['never_married']::TEXT[], ARRAY['Christian']::TEXT[], ARRAY['RC Christian', 'Caste No Bar']::TEXT[], ARRAY['M.A', 'No Education Bar']::TEXT[], ARRAY['Bank Manager']::TEXT[], ARRAY['vegetarian','non_vegetarian']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  height_min = EXCLUDED.height_min,
  height_max = EXCLUDED.height_max,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  education = EXCLUDED.education,
  occupation = EXCLUDED.occupation,
  food_habit = EXCLUDED.food_habit;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, height_min, height_max, marital_status, religion, caste, education, occupation, food_habit)
VALUES ('00000000-0000-4000-a000-0000000000bc', 27, 31, 156, 171, ARRAY['never_married']::TEXT[], ARRAY['Christian']::TEXT[], ARRAY['CSI Christian', 'Caste No Bar']::TEXT[], ARRAY['M.Com', 'No Education Bar']::TEXT[], ARRAY['Architect']::TEXT[], ARRAY['vegetarian','non_vegetarian']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  height_min = EXCLUDED.height_min,
  height_max = EXCLUDED.height_max,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  education = EXCLUDED.education,
  occupation = EXCLUDED.occupation,
  food_habit = EXCLUDED.food_habit;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, height_min, height_max, marital_status, religion, caste, education, occupation, food_habit)
VALUES ('00000000-0000-4000-a000-0000000000bd', 23, 40, 167, 182, ARRAY['never_married']::TEXT[], ARRAY['Hindu']::TEXT[], ARRAY['Thevar', 'Caste No Bar']::TEXT[], ARRAY['M.Sc', 'No Education Bar']::TEXT[], ARRAY['Civil Engineer']::TEXT[], ARRAY['vegetarian','non_vegetarian']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  height_min = EXCLUDED.height_min,
  height_max = EXCLUDED.height_max,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  education = EXCLUDED.education,
  occupation = EXCLUDED.occupation,
  food_habit = EXCLUDED.food_habit;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, height_min, height_max, marital_status, religion, caste, education, occupation, food_habit)
VALUES ('00000000-0000-4000-a000-0000000000be', 26, 38, 157, 172, ARRAY['never_married']::TEXT[], ARRAY['Hindu']::TEXT[], ARRAY['Vellalar', 'Caste No Bar']::TEXT[], ARRAY['B.E. / B.Tech', 'No Education Bar']::TEXT[], ARRAY['Architect']::TEXT[], ARRAY['vegetarian','non_vegetarian']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  height_min = EXCLUDED.height_min,
  height_max = EXCLUDED.height_max,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  education = EXCLUDED.education,
  occupation = EXCLUDED.occupation,
  food_habit = EXCLUDED.food_habit;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, height_min, height_max, marital_status, religion, caste, education, occupation, food_habit)
VALUES ('00000000-0000-4000-a000-0000000000bf', 27, 42, 157, 172, ARRAY['never_married']::TEXT[], ARRAY['Muslim']::TEXT[], ARRAY['Shia Muslim', 'Caste No Bar']::TEXT[], ARRAY['M.B.A', 'No Education Bar']::TEXT[], ARRAY['Pharmacist']::TEXT[], ARRAY['vegetarian','non_vegetarian']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  height_min = EXCLUDED.height_min,
  height_max = EXCLUDED.height_max,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  education = EXCLUDED.education,
  occupation = EXCLUDED.occupation,
  food_habit = EXCLUDED.food_habit;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, height_min, height_max, marital_status, religion, caste, education, occupation, food_habit)
VALUES ('00000000-0000-4000-a000-0000000000c0', 25, 31, 135, 150, ARRAY['never_married']::TEXT[], ARRAY['Hindu']::TEXT[], ARRAY['Brahmin - Iyer', 'Caste No Bar']::TEXT[], ARRAY['Ph.D', 'No Education Bar']::TEXT[], ARRAY['Doctor']::TEXT[], ARRAY['vegetarian','non_vegetarian']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  height_min = EXCLUDED.height_min,
  height_max = EXCLUDED.height_max,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  education = EXCLUDED.education,
  occupation = EXCLUDED.occupation,
  food_habit = EXCLUDED.food_habit;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, height_min, height_max, marital_status, religion, caste, education, occupation, food_habit)
VALUES ('00000000-0000-4000-a000-0000000000c1', 27, 32, 166, 181, ARRAY['never_married']::TEXT[], ARRAY['Muslim']::TEXT[], ARRAY['Labbai', 'Caste No Bar']::TEXT[], ARRAY['M.Com', 'No Education Bar']::TEXT[], ARRAY['Software Engineer']::TEXT[], ARRAY['vegetarian','non_vegetarian']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  height_min = EXCLUDED.height_min,
  height_max = EXCLUDED.height_max,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  education = EXCLUDED.education,
  occupation = EXCLUDED.occupation,
  food_habit = EXCLUDED.food_habit;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, height_min, height_max, marital_status, religion, caste, education, occupation, food_habit)
VALUES ('00000000-0000-4000-a000-0000000000c2', 26, 41, 160, 175, ARRAY['never_married']::TEXT[], ARRAY['Hindu']::TEXT[], ARRAY['Chettiar', 'Caste No Bar']::TEXT[], ARRAY['M.C.A', 'No Education Bar']::TEXT[], ARRAY['Police Officer']::TEXT[], ARRAY['vegetarian','non_vegetarian']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  height_min = EXCLUDED.height_min,
  height_max = EXCLUDED.height_max,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  education = EXCLUDED.education,
  occupation = EXCLUDED.occupation,
  food_habit = EXCLUDED.food_habit;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, height_min, height_max, marital_status, religion, caste, education, occupation, food_habit)
VALUES ('00000000-0000-4000-a000-0000000000c3', 26, 43, 167, 182, ARRAY['never_married']::TEXT[], ARRAY['Hindu']::TEXT[], ARRAY['Brahmin - Iyer', 'Caste No Bar']::TEXT[], ARRAY['B.Sc', 'No Education Bar']::TEXT[], ARRAY['Business Owner']::TEXT[], ARRAY['vegetarian','non_vegetarian']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  height_min = EXCLUDED.height_min,
  height_max = EXCLUDED.height_max,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  education = EXCLUDED.education,
  occupation = EXCLUDED.occupation,
  food_habit = EXCLUDED.food_habit;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, height_min, height_max, marital_status, religion, caste, education, occupation, food_habit)
VALUES ('00000000-0000-4000-a000-0000000000c4', 23, 45, 147, 162, ARRAY['never_married']::TEXT[], ARRAY['Hindu']::TEXT[], ARRAY['Chettiar', 'Caste No Bar']::TEXT[], ARRAY['M.Com', 'No Education Bar']::TEXT[], ARRAY['Bank Manager']::TEXT[], ARRAY['vegetarian','non_vegetarian']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  height_min = EXCLUDED.height_min,
  height_max = EXCLUDED.height_max,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  education = EXCLUDED.education,
  occupation = EXCLUDED.occupation,
  food_habit = EXCLUDED.food_habit;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, height_min, height_max, marital_status, religion, caste, education, occupation, food_habit)
VALUES ('00000000-0000-4000-a000-0000000000c5', 21, 39, 150, 165, ARRAY['never_married']::TEXT[], ARRAY['Christian']::TEXT[], ARRAY['Vellalar Christian', 'Caste No Bar']::TEXT[], ARRAY['M.C.A', 'No Education Bar']::TEXT[], ARRAY['Dentist']::TEXT[], ARRAY['vegetarian','non_vegetarian']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  height_min = EXCLUDED.height_min,
  height_max = EXCLUDED.height_max,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  education = EXCLUDED.education,
  occupation = EXCLUDED.occupation,
  food_habit = EXCLUDED.food_habit;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, height_min, height_max, marital_status, religion, caste, education, occupation, food_habit)
VALUES ('00000000-0000-4000-a000-0000000000c6', 21, 38, 141, 156, ARRAY['never_married']::TEXT[], ARRAY['Muslim']::TEXT[], ARRAY['Rawther', 'Caste No Bar']::TEXT[], ARRAY['B.Sc', 'No Education Bar']::TEXT[], ARRAY['Advocate']::TEXT[], ARRAY['vegetarian','non_vegetarian']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  height_min = EXCLUDED.height_min,
  height_max = EXCLUDED.height_max,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  education = EXCLUDED.education,
  occupation = EXCLUDED.occupation,
  food_habit = EXCLUDED.food_habit;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, height_min, height_max, marital_status, religion, caste, education, occupation, food_habit)
VALUES ('00000000-0000-4000-a000-0000000000c7', 27, 42, 169, 184, ARRAY['never_married']::TEXT[], ARRAY['Hindu']::TEXT[], ARRAY['Arunthathiyar', 'Caste No Bar']::TEXT[], ARRAY['Ph.D', 'No Education Bar']::TEXT[], ARRAY['Software Engineer']::TEXT[], ARRAY['vegetarian','non_vegetarian']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  height_min = EXCLUDED.height_min,
  height_max = EXCLUDED.height_max,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  education = EXCLUDED.education,
  occupation = EXCLUDED.occupation,
  food_habit = EXCLUDED.food_habit;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, height_min, height_max, marital_status, religion, caste, education, occupation, food_habit)
VALUES ('00000000-0000-4000-a000-0000000000c8', 27, 43, 158, 173, ARRAY['never_married']::TEXT[], ARRAY['Hindu']::TEXT[], ARRAY['Sengunthar', 'Caste No Bar']::TEXT[], ARRAY['M.B.B.S', 'No Education Bar']::TEXT[], ARRAY['Architect']::TEXT[], ARRAY['vegetarian','non_vegetarian']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  height_min = EXCLUDED.height_min,
  height_max = EXCLUDED.height_max,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  education = EXCLUDED.education,
  occupation = EXCLUDED.occupation,
  food_habit = EXCLUDED.food_habit;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, height_min, height_max, marital_status, religion, caste, education, occupation, food_habit)
VALUES ('00000000-0000-4000-a000-0000000000c9', 26, 45, 171, 186, ARRAY['never_married']::TEXT[], ARRAY['Hindu']::TEXT[], ARRAY['Devendra Kula Vellalar', 'Caste No Bar']::TEXT[], ARRAY['M.Sc', 'No Education Bar']::TEXT[], ARRAY['Advocate']::TEXT[], ARRAY['vegetarian','non_vegetarian']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  height_min = EXCLUDED.height_min,
  height_max = EXCLUDED.height_max,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  education = EXCLUDED.education,
  occupation = EXCLUDED.occupation,
  food_habit = EXCLUDED.food_habit;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, height_min, height_max, marital_status, religion, caste, education, occupation, food_habit)
VALUES ('00000000-0000-4000-a000-0000000000ca', 25, 37, 157, 172, ARRAY['never_married']::TEXT[], ARRAY['Hindu']::TEXT[], ARRAY['Gounder', 'Caste No Bar']::TEXT[], ARRAY['B.Ed', 'No Education Bar']::TEXT[], ARRAY['Software Engineer']::TEXT[], ARRAY['vegetarian','non_vegetarian']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  height_min = EXCLUDED.height_min,
  height_max = EXCLUDED.height_max,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  education = EXCLUDED.education,
  occupation = EXCLUDED.occupation,
  food_habit = EXCLUDED.food_habit;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, height_min, height_max, marital_status, religion, caste, education, occupation, food_habit)
VALUES ('00000000-0000-4000-a000-0000000000cb', 26, 38, 150, 165, ARRAY['never_married']::TEXT[], ARRAY['Christian']::TEXT[], ARRAY['Vellalar Christian', 'Caste No Bar']::TEXT[], ARRAY['Ph.D', 'No Education Bar']::TEXT[], ARRAY['Business Owner']::TEXT[], ARRAY['vegetarian','non_vegetarian']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  height_min = EXCLUDED.height_min,
  height_max = EXCLUDED.height_max,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  education = EXCLUDED.education,
  occupation = EXCLUDED.occupation,
  food_habit = EXCLUDED.food_habit;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, height_min, height_max, marital_status, religion, caste, education, occupation, food_habit)
VALUES ('00000000-0000-4000-a000-0000000000cc', 24, 41, 137, 152, ARRAY['never_married']::TEXT[], ARRAY['Hindu']::TEXT[], ARRAY['Vellalar', 'Caste No Bar']::TEXT[], ARRAY['M.C.A', 'No Education Bar']::TEXT[], ARRAY['Software Engineer']::TEXT[], ARRAY['vegetarian','non_vegetarian']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  height_min = EXCLUDED.height_min,
  height_max = EXCLUDED.height_max,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  education = EXCLUDED.education,
  occupation = EXCLUDED.occupation,
  food_habit = EXCLUDED.food_habit;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, height_min, height_max, marital_status, religion, caste, education, occupation, food_habit)
VALUES ('00000000-0000-4000-a000-0000000000cd', 28, 37, 156, 171, ARRAY['never_married']::TEXT[], ARRAY['Hindu']::TEXT[], ARRAY['Brahmin - Iyer', 'Caste No Bar']::TEXT[], ARRAY['M.Com', 'No Education Bar']::TEXT[], ARRAY['Police Officer']::TEXT[], ARRAY['vegetarian','non_vegetarian']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  height_min = EXCLUDED.height_min,
  height_max = EXCLUDED.height_max,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  education = EXCLUDED.education,
  occupation = EXCLUDED.occupation,
  food_habit = EXCLUDED.food_habit;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, height_min, height_max, marital_status, religion, caste, education, occupation, food_habit)
VALUES ('00000000-0000-4000-a000-0000000000ce', 21, 31, 151, 166, ARRAY['never_married']::TEXT[], ARRAY['Hindu']::TEXT[], ARRAY['Brahmin - Iyengar', 'Caste No Bar']::TEXT[], ARRAY['B.Ed', 'No Education Bar']::TEXT[], ARRAY['Government Officer']::TEXT[], ARRAY['vegetarian','non_vegetarian']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  height_min = EXCLUDED.height_min,
  height_max = EXCLUDED.height_max,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  education = EXCLUDED.education,
  occupation = EXCLUDED.occupation,
  food_habit = EXCLUDED.food_habit;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, height_min, height_max, marital_status, religion, caste, education, occupation, food_habit)
VALUES ('00000000-0000-4000-a000-0000000000cf', 24, 31, 163, 178, ARRAY['never_married']::TEXT[], ARRAY['Hindu']::TEXT[], ARRAY['Chettiar', 'Caste No Bar']::TEXT[], ARRAY['M.B.A', 'No Education Bar']::TEXT[], ARRAY['Government Officer']::TEXT[], ARRAY['vegetarian','non_vegetarian']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  height_min = EXCLUDED.height_min,
  height_max = EXCLUDED.height_max,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  education = EXCLUDED.education,
  occupation = EXCLUDED.occupation,
  food_habit = EXCLUDED.food_habit;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, height_min, height_max, marital_status, religion, caste, education, occupation, food_habit)
VALUES ('00000000-0000-4000-a000-0000000000d0', 21, 33, 157, 172, ARRAY['never_married']::TEXT[], ARRAY['Hindu']::TEXT[], ARRAY['Adi Dravida', 'Caste No Bar']::TEXT[], ARRAY['B.Ed', 'No Education Bar']::TEXT[], ARRAY['Civil Engineer']::TEXT[], ARRAY['vegetarian','non_vegetarian']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  height_min = EXCLUDED.height_min,
  height_max = EXCLUDED.height_max,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  education = EXCLUDED.education,
  occupation = EXCLUDED.occupation,
  food_habit = EXCLUDED.food_habit;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, height_min, height_max, marital_status, religion, caste, education, occupation, food_habit)
VALUES ('00000000-0000-4000-a000-0000000000d1', 24, 41, 173, 188, ARRAY['never_married']::TEXT[], ARRAY['Hindu']::TEXT[], ARRAY['Brahmin - Iyer', 'Caste No Bar']::TEXT[], ARRAY['M.C.A', 'No Education Bar']::TEXT[], ARRAY['Pharmacist']::TEXT[], ARRAY['vegetarian','non_vegetarian']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  height_min = EXCLUDED.height_min,
  height_max = EXCLUDED.height_max,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  education = EXCLUDED.education,
  occupation = EXCLUDED.occupation,
  food_habit = EXCLUDED.food_habit;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, height_min, height_max, marital_status, religion, caste, education, occupation, food_habit)
VALUES ('00000000-0000-4000-a000-0000000000d2', 21, 39, 148, 163, ARRAY['never_married']::TEXT[], ARRAY['Hindu']::TEXT[], ARRAY['Gounder', 'Caste No Bar']::TEXT[], ARRAY['B.Ed', 'No Education Bar']::TEXT[], ARRAY['School Teacher']::TEXT[], ARRAY['vegetarian','non_vegetarian']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  height_min = EXCLUDED.height_min,
  height_max = EXCLUDED.height_max,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  education = EXCLUDED.education,
  occupation = EXCLUDED.occupation,
  food_habit = EXCLUDED.food_habit;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, height_min, height_max, marital_status, religion, caste, education, occupation, food_habit)
VALUES ('00000000-0000-4000-a000-0000000000d3', 22, 36, 147, 162, ARRAY['never_married']::TEXT[], ARRAY['Hindu']::TEXT[], ARRAY['Adi Dravida', 'Caste No Bar']::TEXT[], ARRAY['M.Sc', 'No Education Bar']::TEXT[], ARRAY['Government Officer']::TEXT[], ARRAY['vegetarian','non_vegetarian']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  height_min = EXCLUDED.height_min,
  height_max = EXCLUDED.height_max,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  education = EXCLUDED.education,
  occupation = EXCLUDED.occupation,
  food_habit = EXCLUDED.food_habit;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, height_min, height_max, marital_status, religion, caste, education, occupation, food_habit)
VALUES ('00000000-0000-4000-a000-0000000000d4', 22, 31, 144, 159, ARRAY['never_married']::TEXT[], ARRAY['Hindu']::TEXT[], ARRAY['Nadar', 'Caste No Bar']::TEXT[], ARRAY['Ph.D', 'No Education Bar']::TEXT[], ARRAY['Government Officer']::TEXT[], ARRAY['vegetarian','non_vegetarian']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  height_min = EXCLUDED.height_min,
  height_max = EXCLUDED.height_max,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  education = EXCLUDED.education,
  occupation = EXCLUDED.occupation,
  food_habit = EXCLUDED.food_habit;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, height_min, height_max, marital_status, religion, caste, education, occupation, food_habit)
VALUES ('00000000-0000-4000-a000-0000000000d5', 27, 41, 168, 183, ARRAY['never_married']::TEXT[], ARRAY['Hindu']::TEXT[], ARRAY['Vanniyar', 'Caste No Bar']::TEXT[], ARRAY['B.Com', 'No Education Bar']::TEXT[], ARRAY['Bank Manager']::TEXT[], ARRAY['vegetarian','non_vegetarian']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  height_min = EXCLUDED.height_min,
  height_max = EXCLUDED.height_max,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  education = EXCLUDED.education,
  occupation = EXCLUDED.occupation,
  food_habit = EXCLUDED.food_habit;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, height_min, height_max, marital_status, religion, caste, education, occupation, food_habit)
VALUES ('00000000-0000-4000-a000-0000000000d6', 22, 35, 151, 166, ARRAY['never_married']::TEXT[], ARRAY['Hindu']::TEXT[], ARRAY['Vishwakarma', 'Caste No Bar']::TEXT[], ARRAY['M.C.A', 'No Education Bar']::TEXT[], ARRAY['Software Engineer']::TEXT[], ARRAY['vegetarian','non_vegetarian']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  height_min = EXCLUDED.height_min,
  height_max = EXCLUDED.height_max,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  education = EXCLUDED.education,
  occupation = EXCLUDED.occupation,
  food_habit = EXCLUDED.food_habit;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, height_min, height_max, marital_status, religion, caste, education, occupation, food_habit)
VALUES ('00000000-0000-4000-a000-0000000000d7', 21, 41, 173, 188, ARRAY['never_married']::TEXT[], ARRAY['Hindu']::TEXT[], ARRAY['Adi Dravida', 'Caste No Bar']::TEXT[], ARRAY['B.Com', 'No Education Bar']::TEXT[], ARRAY['Advocate']::TEXT[], ARRAY['vegetarian','non_vegetarian']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  height_min = EXCLUDED.height_min,
  height_max = EXCLUDED.height_max,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  education = EXCLUDED.education,
  occupation = EXCLUDED.occupation,
  food_habit = EXCLUDED.food_habit;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, height_min, height_max, marital_status, religion, caste, education, occupation, food_habit)
VALUES ('00000000-0000-4000-a000-0000000000d8', 26, 41, 149, 164, ARRAY['never_married']::TEXT[], ARRAY['Muslim']::TEXT[], ARRAY['Marakayar', 'Caste No Bar']::TEXT[], ARRAY['B.E. / B.Tech', 'No Education Bar']::TEXT[], ARRAY['Dentist']::TEXT[], ARRAY['vegetarian','non_vegetarian']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  height_min = EXCLUDED.height_min,
  height_max = EXCLUDED.height_max,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  education = EXCLUDED.education,
  occupation = EXCLUDED.occupation,
  food_habit = EXCLUDED.food_habit;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, height_min, height_max, marital_status, religion, caste, education, occupation, food_habit)
VALUES ('00000000-0000-4000-a000-0000000000d9', 24, 43, 168, 183, ARRAY['never_married']::TEXT[], ARRAY['Hindu']::TEXT[], ARRAY['Thevar', 'Caste No Bar']::TEXT[], ARRAY['M.Com', 'No Education Bar']::TEXT[], ARRAY['Bank Manager']::TEXT[], ARRAY['vegetarian','non_vegetarian']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  height_min = EXCLUDED.height_min,
  height_max = EXCLUDED.height_max,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  education = EXCLUDED.education,
  occupation = EXCLUDED.occupation,
  food_habit = EXCLUDED.food_habit;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, height_min, height_max, marital_status, religion, caste, education, occupation, food_habit)
VALUES ('00000000-0000-4000-a000-0000000000da', 22, 40, 152, 167, ARRAY['never_married']::TEXT[], ARRAY['Hindu']::TEXT[], ARRAY['Vellalar', 'Caste No Bar']::TEXT[], ARRAY['M.B.A', 'No Education Bar']::TEXT[], ARRAY['Civil Engineer']::TEXT[], ARRAY['vegetarian','non_vegetarian']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  height_min = EXCLUDED.height_min,
  height_max = EXCLUDED.height_max,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  education = EXCLUDED.education,
  occupation = EXCLUDED.occupation,
  food_habit = EXCLUDED.food_habit;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, height_min, height_max, marital_status, religion, caste, education, occupation, food_habit)
VALUES ('00000000-0000-4000-a000-0000000000db', 27, 38, 163, 178, ARRAY['never_married']::TEXT[], ARRAY['Hindu']::TEXT[], ARRAY['Vishwakarma', 'Caste No Bar']::TEXT[], ARRAY['B.E. / B.Tech', 'No Education Bar']::TEXT[], ARRAY['Dentist']::TEXT[], ARRAY['vegetarian','non_vegetarian']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  height_min = EXCLUDED.height_min,
  height_max = EXCLUDED.height_max,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  education = EXCLUDED.education,
  occupation = EXCLUDED.occupation,
  food_habit = EXCLUDED.food_habit;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, height_min, height_max, marital_status, religion, caste, education, occupation, food_habit)
VALUES ('00000000-0000-4000-a000-0000000000dc', 24, 40, 143, 158, ARRAY['never_married']::TEXT[], ARRAY['Hindu']::TEXT[], ARRAY['Gounder', 'Caste No Bar']::TEXT[], ARRAY['M.Sc', 'No Education Bar']::TEXT[], ARRAY['Civil Engineer']::TEXT[], ARRAY['vegetarian','non_vegetarian']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  height_min = EXCLUDED.height_min,
  height_max = EXCLUDED.height_max,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  education = EXCLUDED.education,
  occupation = EXCLUDED.occupation,
  food_habit = EXCLUDED.food_habit;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, height_min, height_max, marital_status, religion, caste, education, occupation, food_habit)
VALUES ('00000000-0000-4000-a000-0000000000dd', 25, 45, 156, 171, ARRAY['never_married']::TEXT[], ARRAY['Hindu']::TEXT[], ARRAY['Yadav', 'Caste No Bar']::TEXT[], ARRAY['M.Com', 'No Education Bar']::TEXT[], ARRAY['Bank Manager']::TEXT[], ARRAY['vegetarian','non_vegetarian']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  height_min = EXCLUDED.height_min,
  height_max = EXCLUDED.height_max,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  education = EXCLUDED.education,
  occupation = EXCLUDED.occupation,
  food_habit = EXCLUDED.food_habit;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, height_min, height_max, marital_status, religion, caste, education, occupation, food_habit)
VALUES ('00000000-0000-4000-a000-0000000000de', 27, 31, 151, 166, ARRAY['never_married']::TEXT[], ARRAY['Hindu']::TEXT[], ARRAY['Maravar', 'Caste No Bar']::TEXT[], ARRAY['B.E. / B.Tech', 'No Education Bar']::TEXT[], ARRAY['Pharmacist']::TEXT[], ARRAY['vegetarian','non_vegetarian']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  height_min = EXCLUDED.height_min,
  height_max = EXCLUDED.height_max,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  education = EXCLUDED.education,
  occupation = EXCLUDED.occupation,
  food_habit = EXCLUDED.food_habit;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, height_min, height_max, marital_status, religion, caste, education, occupation, food_habit)
VALUES ('00000000-0000-4000-a000-0000000000df', 25, 36, 171, 186, ARRAY['never_married']::TEXT[], ARRAY['Hindu']::TEXT[], ARRAY['Brahmin - Iyer', 'Caste No Bar']::TEXT[], ARRAY['M.Com', 'No Education Bar']::TEXT[], ARRAY['Auditor']::TEXT[], ARRAY['vegetarian','non_vegetarian']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  height_min = EXCLUDED.height_min,
  height_max = EXCLUDED.height_max,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  education = EXCLUDED.education,
  occupation = EXCLUDED.occupation,
  food_habit = EXCLUDED.food_habit;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, height_min, height_max, marital_status, religion, caste, education, occupation, food_habit)
VALUES ('00000000-0000-4000-a000-0000000000e0', 26, 38, 157, 172, ARRAY['never_married']::TEXT[], ARRAY['Hindu']::TEXT[], ARRAY['Maravar', 'Caste No Bar']::TEXT[], ARRAY['M.C.A', 'No Education Bar']::TEXT[], ARRAY['Civil Engineer']::TEXT[], ARRAY['vegetarian','non_vegetarian']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  height_min = EXCLUDED.height_min,
  height_max = EXCLUDED.height_max,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  education = EXCLUDED.education,
  occupation = EXCLUDED.occupation,
  food_habit = EXCLUDED.food_habit;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, height_min, height_max, marital_status, religion, caste, education, occupation, food_habit)
VALUES ('00000000-0000-4000-a000-0000000000e1', 22, 30, 153, 168, ARRAY['never_married']::TEXT[], ARRAY['Hindu']::TEXT[], ARRAY['Pillai', 'Caste No Bar']::TEXT[], ARRAY['B.Sc', 'No Education Bar']::TEXT[], ARRAY['Architect']::TEXT[], ARRAY['vegetarian','non_vegetarian']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  height_min = EXCLUDED.height_min,
  height_max = EXCLUDED.height_max,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  education = EXCLUDED.education,
  occupation = EXCLUDED.occupation,
  food_habit = EXCLUDED.food_habit;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, height_min, height_max, marital_status, religion, caste, education, occupation, food_habit)
VALUES ('00000000-0000-4000-a000-0000000000e2', 22, 43, 151, 166, ARRAY['never_married']::TEXT[], ARRAY['Hindu']::TEXT[], ARRAY['Sengunthar', 'Caste No Bar']::TEXT[], ARRAY['M.B.B.S', 'No Education Bar']::TEXT[], ARRAY['Advocate']::TEXT[], ARRAY['vegetarian','non_vegetarian']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  height_min = EXCLUDED.height_min,
  height_max = EXCLUDED.height_max,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  education = EXCLUDED.education,
  occupation = EXCLUDED.occupation,
  food_habit = EXCLUDED.food_habit;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, height_min, height_max, marital_status, religion, caste, education, occupation, food_habit)
VALUES ('00000000-0000-4000-a000-0000000000e3', 26, 33, 173, 188, ARRAY['never_married']::TEXT[], ARRAY['Muslim']::TEXT[], ARRAY['Rawther', 'Caste No Bar']::TEXT[], ARRAY['Ph.D', 'No Education Bar']::TEXT[], ARRAY['Mechanical Engineer']::TEXT[], ARRAY['vegetarian','non_vegetarian']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  height_min = EXCLUDED.height_min,
  height_max = EXCLUDED.height_max,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  education = EXCLUDED.education,
  occupation = EXCLUDED.occupation,
  food_habit = EXCLUDED.food_habit;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, height_min, height_max, marital_status, religion, caste, education, occupation, food_habit)
VALUES ('00000000-0000-4000-a000-0000000000e4', 21, 36, 154, 169, ARRAY['never_married']::TEXT[], ARRAY['Hindu']::TEXT[], ARRAY['Vishwakarma', 'Caste No Bar']::TEXT[], ARRAY['M.C.A', 'No Education Bar']::TEXT[], ARRAY['Government Officer']::TEXT[], ARRAY['vegetarian','non_vegetarian']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  height_min = EXCLUDED.height_min,
  height_max = EXCLUDED.height_max,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  education = EXCLUDED.education,
  occupation = EXCLUDED.occupation,
  food_habit = EXCLUDED.food_habit;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, height_min, height_max, marital_status, religion, caste, education, occupation, food_habit)
VALUES ('00000000-0000-4000-a000-0000000000e5', 21, 40, 159, 174, ARRAY['never_married']::TEXT[], ARRAY['Hindu']::TEXT[], ARRAY['Arunthathiyar', 'Caste No Bar']::TEXT[], ARRAY['M.Sc', 'No Education Bar']::TEXT[], ARRAY['Bank Manager']::TEXT[], ARRAY['vegetarian','non_vegetarian']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  height_min = EXCLUDED.height_min,
  height_max = EXCLUDED.height_max,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  education = EXCLUDED.education,
  occupation = EXCLUDED.occupation,
  food_habit = EXCLUDED.food_habit;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, height_min, height_max, marital_status, religion, caste, education, occupation, food_habit)
VALUES ('00000000-0000-4000-a000-0000000000e6', 23, 44, 145, 160, ARRAY['never_married']::TEXT[], ARRAY['Hindu']::TEXT[], ARRAY['Vishwakarma', 'Caste No Bar']::TEXT[], ARRAY['M.C.A', 'No Education Bar']::TEXT[], ARRAY['Software Engineer']::TEXT[], ARRAY['vegetarian','non_vegetarian']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  height_min = EXCLUDED.height_min,
  height_max = EXCLUDED.height_max,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  education = EXCLUDED.education,
  occupation = EXCLUDED.occupation,
  food_habit = EXCLUDED.food_habit;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, height_min, height_max, marital_status, religion, caste, education, occupation, food_habit)
VALUES ('00000000-0000-4000-a000-0000000000e7', 25, 41, 168, 183, ARRAY['never_married']::TEXT[], ARRAY['Muslim']::TEXT[], ARRAY['Labbai', 'Caste No Bar']::TEXT[], ARRAY['B.Ed', 'No Education Bar']::TEXT[], ARRAY['Advocate']::TEXT[], ARRAY['vegetarian','non_vegetarian']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  height_min = EXCLUDED.height_min,
  height_max = EXCLUDED.height_max,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  education = EXCLUDED.education,
  occupation = EXCLUDED.occupation,
  food_habit = EXCLUDED.food_habit;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, height_min, height_max, marital_status, religion, caste, education, occupation, food_habit)
VALUES ('00000000-0000-4000-a000-0000000000e8', 25, 35, 135, 150, ARRAY['never_married']::TEXT[], ARRAY['Hindu']::TEXT[], ARRAY['Vellalar', 'Caste No Bar']::TEXT[], ARRAY['B.E. / B.Tech', 'No Education Bar']::TEXT[], ARRAY['Civil Engineer']::TEXT[], ARRAY['vegetarian','non_vegetarian']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  height_min = EXCLUDED.height_min,
  height_max = EXCLUDED.height_max,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  education = EXCLUDED.education,
  occupation = EXCLUDED.occupation,
  food_habit = EXCLUDED.food_habit;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, height_min, height_max, marital_status, religion, caste, education, occupation, food_habit)
VALUES ('00000000-0000-4000-a000-0000000000e9', 21, 33, 168, 183, ARRAY['never_married']::TEXT[], ARRAY['Muslim']::TEXT[], ARRAY['Marakayar', 'Caste No Bar']::TEXT[], ARRAY['M.B.B.S', 'No Education Bar']::TEXT[], ARRAY['College Professor']::TEXT[], ARRAY['vegetarian','non_vegetarian']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  height_min = EXCLUDED.height_min,
  height_max = EXCLUDED.height_max,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  education = EXCLUDED.education,
  occupation = EXCLUDED.occupation,
  food_habit = EXCLUDED.food_habit;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, height_min, height_max, marital_status, religion, caste, education, occupation, food_habit)
VALUES ('00000000-0000-4000-a000-0000000000ea', 24, 33, 135, 150, ARRAY['never_married']::TEXT[], ARRAY['Hindu']::TEXT[], ARRAY['Arunthathiyar', 'Caste No Bar']::TEXT[], ARRAY['M.B.A', 'No Education Bar']::TEXT[], ARRAY['Civil Engineer']::TEXT[], ARRAY['vegetarian','non_vegetarian']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  height_min = EXCLUDED.height_min,
  height_max = EXCLUDED.height_max,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  education = EXCLUDED.education,
  occupation = EXCLUDED.occupation,
  food_habit = EXCLUDED.food_habit;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, height_min, height_max, marital_status, religion, caste, education, occupation, food_habit)
VALUES ('00000000-0000-4000-a000-0000000000eb', 26, 32, 171, 186, ARRAY['never_married']::TEXT[], ARRAY['Hindu']::TEXT[], ARRAY['Maravar', 'Caste No Bar']::TEXT[], ARRAY['M.B.B.S', 'No Education Bar']::TEXT[], ARRAY['Architect']::TEXT[], ARRAY['vegetarian','non_vegetarian']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  height_min = EXCLUDED.height_min,
  height_max = EXCLUDED.height_max,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  education = EXCLUDED.education,
  occupation = EXCLUDED.occupation,
  food_habit = EXCLUDED.food_habit;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, height_min, height_max, marital_status, religion, caste, education, occupation, food_habit)
VALUES ('00000000-0000-4000-a000-0000000000ec', 25, 40, 150, 165, ARRAY['never_married']::TEXT[], ARRAY['Hindu']::TEXT[], ARRAY['Nadar', 'Caste No Bar']::TEXT[], ARRAY['M.B.A', 'No Education Bar']::TEXT[], ARRAY['College Professor']::TEXT[], ARRAY['vegetarian','non_vegetarian']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  height_min = EXCLUDED.height_min,
  height_max = EXCLUDED.height_max,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  education = EXCLUDED.education,
  occupation = EXCLUDED.occupation,
  food_habit = EXCLUDED.food_habit;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, height_min, height_max, marital_status, religion, caste, education, occupation, food_habit)
VALUES ('00000000-0000-4000-a000-0000000000ed', 24, 44, 170, 185, ARRAY['never_married']::TEXT[], ARRAY['Hindu']::TEXT[], ARRAY['Yadav', 'Caste No Bar']::TEXT[], ARRAY['M.A', 'No Education Bar']::TEXT[], ARRAY['Doctor']::TEXT[], ARRAY['vegetarian','non_vegetarian']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  height_min = EXCLUDED.height_min,
  height_max = EXCLUDED.height_max,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  education = EXCLUDED.education,
  occupation = EXCLUDED.occupation,
  food_habit = EXCLUDED.food_habit;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, height_min, height_max, marital_status, religion, caste, education, occupation, food_habit)
VALUES ('00000000-0000-4000-a000-0000000000ee', 22, 30, 153, 168, ARRAY['never_married']::TEXT[], ARRAY['Hindu']::TEXT[], ARRAY['Vellalar', 'Caste No Bar']::TEXT[], ARRAY['Ph.D', 'No Education Bar']::TEXT[], ARRAY['Civil Engineer']::TEXT[], ARRAY['vegetarian','non_vegetarian']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  height_min = EXCLUDED.height_min,
  height_max = EXCLUDED.height_max,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  education = EXCLUDED.education,
  occupation = EXCLUDED.occupation,
  food_habit = EXCLUDED.food_habit;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, height_min, height_max, marital_status, religion, caste, education, occupation, food_habit)
VALUES ('00000000-0000-4000-a000-0000000000ef', 24, 40, 147, 162, ARRAY['never_married']::TEXT[], ARRAY['Hindu']::TEXT[], ARRAY['Maravar', 'Caste No Bar']::TEXT[], ARRAY['B.Com', 'No Education Bar']::TEXT[], ARRAY['Business Owner']::TEXT[], ARRAY['vegetarian','non_vegetarian']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  height_min = EXCLUDED.height_min,
  height_max = EXCLUDED.height_max,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  education = EXCLUDED.education,
  occupation = EXCLUDED.occupation,
  food_habit = EXCLUDED.food_habit;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, height_min, height_max, marital_status, religion, caste, education, occupation, food_habit)
VALUES ('00000000-0000-4000-a000-0000000000f0', 22, 38, 159, 174, ARRAY['never_married']::TEXT[], ARRAY['Hindu']::TEXT[], ARRAY['Maravar', 'Caste No Bar']::TEXT[], ARRAY['M.B.B.S', 'No Education Bar']::TEXT[], ARRAY['Doctor']::TEXT[], ARRAY['vegetarian','non_vegetarian']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  height_min = EXCLUDED.height_min,
  height_max = EXCLUDED.height_max,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  education = EXCLUDED.education,
  occupation = EXCLUDED.occupation,
  food_habit = EXCLUDED.food_habit;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, height_min, height_max, marital_status, religion, caste, education, occupation, food_habit)
VALUES ('00000000-0000-4000-a000-0000000000f1', 22, 38, 172, 187, ARRAY['never_married']::TEXT[], ARRAY['Hindu']::TEXT[], ARRAY['Vanniyar', 'Caste No Bar']::TEXT[], ARRAY['M.B.A', 'No Education Bar']::TEXT[], ARRAY['Mechanical Engineer']::TEXT[], ARRAY['vegetarian','non_vegetarian']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  height_min = EXCLUDED.height_min,
  height_max = EXCLUDED.height_max,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  education = EXCLUDED.education,
  occupation = EXCLUDED.occupation,
  food_habit = EXCLUDED.food_habit;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, height_min, height_max, marital_status, religion, caste, education, occupation, food_habit)
VALUES ('00000000-0000-4000-a000-0000000000f2', 24, 44, 155, 170, ARRAY['never_married']::TEXT[], ARRAY['Muslim']::TEXT[], ARRAY['Sunni Muslim', 'Caste No Bar']::TEXT[], ARRAY['B.Sc', 'No Education Bar']::TEXT[], ARRAY['Mechanical Engineer']::TEXT[], ARRAY['vegetarian','non_vegetarian']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  height_min = EXCLUDED.height_min,
  height_max = EXCLUDED.height_max,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  education = EXCLUDED.education,
  occupation = EXCLUDED.occupation,
  food_habit = EXCLUDED.food_habit;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, height_min, height_max, marital_status, religion, caste, education, occupation, food_habit)
VALUES ('00000000-0000-4000-a000-0000000000f3', 28, 44, 169, 184, ARRAY['never_married']::TEXT[], ARRAY['Hindu']::TEXT[], ARRAY['Yadav', 'Caste No Bar']::TEXT[], ARRAY['B.Com', 'No Education Bar']::TEXT[], ARRAY['Pharmacist']::TEXT[], ARRAY['vegetarian','non_vegetarian']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  height_min = EXCLUDED.height_min,
  height_max = EXCLUDED.height_max,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  education = EXCLUDED.education,
  occupation = EXCLUDED.occupation,
  food_habit = EXCLUDED.food_habit;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, height_min, height_max, marital_status, religion, caste, education, occupation, food_habit)
VALUES ('00000000-0000-4000-a000-0000000000f4', 25, 39, 159, 174, ARRAY['never_married']::TEXT[], ARRAY['Hindu']::TEXT[], ARRAY['Sengunthar', 'Caste No Bar']::TEXT[], ARRAY['M.Com', 'No Education Bar']::TEXT[], ARRAY['Advocate']::TEXT[], ARRAY['vegetarian','non_vegetarian']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  height_min = EXCLUDED.height_min,
  height_max = EXCLUDED.height_max,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  education = EXCLUDED.education,
  occupation = EXCLUDED.occupation,
  food_habit = EXCLUDED.food_habit;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, height_min, height_max, marital_status, religion, caste, education, occupation, food_habit)
VALUES ('00000000-0000-4000-a000-0000000000f5', 21, 38, 151, 166, ARRAY['never_married']::TEXT[], ARRAY['Hindu']::TEXT[], ARRAY['Sengunthar', 'Caste No Bar']::TEXT[], ARRAY['M.B.A', 'No Education Bar']::TEXT[], ARRAY['HR Specialist']::TEXT[], ARRAY['vegetarian','non_vegetarian']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  height_min = EXCLUDED.height_min,
  height_max = EXCLUDED.height_max,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  education = EXCLUDED.education,
  occupation = EXCLUDED.occupation,
  food_habit = EXCLUDED.food_habit;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, height_min, height_max, marital_status, religion, caste, education, occupation, food_habit)
VALUES ('00000000-0000-4000-a000-0000000000f6', 22, 44, 140, 155, ARRAY['never_married']::TEXT[], ARRAY['Hindu']::TEXT[], ARRAY['Naidu', 'Caste No Bar']::TEXT[], ARRAY['M.B.B.S', 'No Education Bar']::TEXT[], ARRAY['Police Officer']::TEXT[], ARRAY['vegetarian','non_vegetarian']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  height_min = EXCLUDED.height_min,
  height_max = EXCLUDED.height_max,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  education = EXCLUDED.education,
  occupation = EXCLUDED.occupation,
  food_habit = EXCLUDED.food_habit;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, height_min, height_max, marital_status, religion, caste, education, occupation, food_habit)
VALUES ('00000000-0000-4000-a000-0000000000f7', 21, 36, 151, 166, ARRAY['never_married']::TEXT[], ARRAY['Hindu']::TEXT[], ARRAY['Vellalar', 'Caste No Bar']::TEXT[], ARRAY['M.Com', 'No Education Bar']::TEXT[], ARRAY['HR Specialist']::TEXT[], ARRAY['vegetarian','non_vegetarian']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  height_min = EXCLUDED.height_min,
  height_max = EXCLUDED.height_max,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  education = EXCLUDED.education,
  occupation = EXCLUDED.occupation,
  food_habit = EXCLUDED.food_habit;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, height_min, height_max, marital_status, religion, caste, education, occupation, food_habit)
VALUES ('00000000-0000-4000-a000-0000000000f8', 26, 41, 142, 157, ARRAY['never_married']::TEXT[], ARRAY['Hindu']::TEXT[], ARRAY['Sengunthar', 'Caste No Bar']::TEXT[], ARRAY['M.C.A', 'No Education Bar']::TEXT[], ARRAY['Architect']::TEXT[], ARRAY['vegetarian','non_vegetarian']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  height_min = EXCLUDED.height_min,
  height_max = EXCLUDED.height_max,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  education = EXCLUDED.education,
  occupation = EXCLUDED.occupation,
  food_habit = EXCLUDED.food_habit;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, height_min, height_max, marital_status, religion, caste, education, occupation, food_habit)
VALUES ('00000000-0000-4000-a000-0000000000f9', 25, 44, 162, 177, ARRAY['never_married']::TEXT[], ARRAY['Hindu']::TEXT[], ARRAY['Devendra Kula Vellalar', 'Caste No Bar']::TEXT[], ARRAY['M.Com', 'No Education Bar']::TEXT[], ARRAY['Architect']::TEXT[], ARRAY['vegetarian','non_vegetarian']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  height_min = EXCLUDED.height_min,
  height_max = EXCLUDED.height_max,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  education = EXCLUDED.education,
  occupation = EXCLUDED.occupation,
  food_habit = EXCLUDED.food_habit;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, height_min, height_max, marital_status, religion, caste, education, occupation, food_habit)
VALUES ('00000000-0000-4000-a000-0000000000fa', 25, 45, 144, 159, ARRAY['never_married']::TEXT[], ARRAY['Hindu']::TEXT[], ARRAY['Naidu', 'Caste No Bar']::TEXT[], ARRAY['B.A', 'No Education Bar']::TEXT[], ARRAY['College Professor']::TEXT[], ARRAY['vegetarian','non_vegetarian']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  height_min = EXCLUDED.height_min,
  height_max = EXCLUDED.height_max,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  education = EXCLUDED.education,
  occupation = EXCLUDED.occupation,
  food_habit = EXCLUDED.food_habit;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, height_min, height_max, marital_status, religion, caste, education, occupation, food_habit)
VALUES ('00000000-0000-4000-a000-0000000000fb', 23, 40, 172, 187, ARRAY['never_married']::TEXT[], ARRAY['Hindu']::TEXT[], ARRAY['Brahmin - Iyengar', 'Caste No Bar']::TEXT[], ARRAY['M.A', 'No Education Bar']::TEXT[], ARRAY['Advocate']::TEXT[], ARRAY['vegetarian','non_vegetarian']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  height_min = EXCLUDED.height_min,
  height_max = EXCLUDED.height_max,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  education = EXCLUDED.education,
  occupation = EXCLUDED.occupation,
  food_habit = EXCLUDED.food_habit;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, height_min, height_max, marital_status, religion, caste, education, occupation, food_habit)
VALUES ('00000000-0000-4000-a000-0000000000fc', 24, 38, 142, 157, ARRAY['never_married']::TEXT[], ARRAY['Hindu']::TEXT[], ARRAY['Devendra Kula Vellalar', 'Caste No Bar']::TEXT[], ARRAY['M.A', 'No Education Bar']::TEXT[], ARRAY['Government Officer']::TEXT[], ARRAY['vegetarian','non_vegetarian']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  height_min = EXCLUDED.height_min,
  height_max = EXCLUDED.height_max,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  education = EXCLUDED.education,
  occupation = EXCLUDED.occupation,
  food_habit = EXCLUDED.food_habit;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, height_min, height_max, marital_status, religion, caste, education, occupation, food_habit)
VALUES ('00000000-0000-4000-a000-0000000000fd', 26, 30, 155, 170, ARRAY['never_married']::TEXT[], ARRAY['Hindu']::TEXT[], ARRAY['Vellalar', 'Caste No Bar']::TEXT[], ARRAY['M.Sc', 'No Education Bar']::TEXT[], ARRAY['HR Specialist']::TEXT[], ARRAY['vegetarian','non_vegetarian']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  height_min = EXCLUDED.height_min,
  height_max = EXCLUDED.height_max,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  education = EXCLUDED.education,
  occupation = EXCLUDED.occupation,
  food_habit = EXCLUDED.food_habit;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, height_min, height_max, marital_status, religion, caste, education, occupation, food_habit)
VALUES ('00000000-0000-4000-a000-0000000000fe', 25, 45, 150, 165, ARRAY['never_married']::TEXT[], ARRAY['Hindu']::TEXT[], ARRAY['Adi Dravida', 'Caste No Bar']::TEXT[], ARRAY['B.Com', 'No Education Bar']::TEXT[], ARRAY['Architect']::TEXT[], ARRAY['vegetarian','non_vegetarian']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  height_min = EXCLUDED.height_min,
  height_max = EXCLUDED.height_max,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  education = EXCLUDED.education,
  occupation = EXCLUDED.occupation,
  food_habit = EXCLUDED.food_habit;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, height_min, height_max, marital_status, religion, caste, education, occupation, food_habit)
VALUES ('00000000-0000-4000-a000-0000000000ff', 23, 37, 152, 167, ARRAY['never_married']::TEXT[], ARRAY['Hindu']::TEXT[], ARRAY['Brahmin - Iyengar', 'Caste No Bar']::TEXT[], ARRAY['M.C.A', 'No Education Bar']::TEXT[], ARRAY['HR Specialist']::TEXT[], ARRAY['vegetarian','non_vegetarian']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  height_min = EXCLUDED.height_min,
  height_max = EXCLUDED.height_max,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  education = EXCLUDED.education,
  occupation = EXCLUDED.occupation,
  food_habit = EXCLUDED.food_habit;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, height_min, height_max, marital_status, religion, caste, education, occupation, food_habit)
VALUES ('00000000-0000-4000-a000-000000000100', 24, 31, 135, 150, ARRAY['never_married']::TEXT[], ARRAY['Hindu']::TEXT[], ARRAY['Arunthathiyar', 'Caste No Bar']::TEXT[], ARRAY['M.B.B.S', 'No Education Bar']::TEXT[], ARRAY['Dentist']::TEXT[], ARRAY['vegetarian','non_vegetarian']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  height_min = EXCLUDED.height_min,
  height_max = EXCLUDED.height_max,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  education = EXCLUDED.education,
  occupation = EXCLUDED.occupation,
  food_habit = EXCLUDED.food_habit;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, height_min, height_max, marital_status, religion, caste, education, occupation, food_habit)
VALUES ('00000000-0000-4000-a000-000000000101', 26, 34, 153, 168, ARRAY['never_married']::TEXT[], ARRAY['Hindu']::TEXT[], ARRAY['Adi Dravida', 'Caste No Bar']::TEXT[], ARRAY['B.E. / B.Tech', 'No Education Bar']::TEXT[], ARRAY['Doctor']::TEXT[], ARRAY['vegetarian','non_vegetarian']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  height_min = EXCLUDED.height_min,
  height_max = EXCLUDED.height_max,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  education = EXCLUDED.education,
  occupation = EXCLUDED.occupation,
  food_habit = EXCLUDED.food_habit;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, height_min, height_max, marital_status, religion, caste, education, occupation, food_habit)
VALUES ('00000000-0000-4000-a000-000000000102', 28, 36, 149, 164, ARRAY['never_married']::TEXT[], ARRAY['Hindu']::TEXT[], ARRAY['Vanniyar', 'Caste No Bar']::TEXT[], ARRAY['B.Sc', 'No Education Bar']::TEXT[], ARRAY['Business Owner']::TEXT[], ARRAY['vegetarian','non_vegetarian']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  height_min = EXCLUDED.height_min,
  height_max = EXCLUDED.height_max,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  education = EXCLUDED.education,
  occupation = EXCLUDED.occupation,
  food_habit = EXCLUDED.food_habit;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, height_min, height_max, marital_status, religion, caste, education, occupation, food_habit)
VALUES ('00000000-0000-4000-a000-000000000103', 27, 45, 148, 163, ARRAY['never_married']::TEXT[], ARRAY['Hindu']::TEXT[], ARRAY['Chettiar', 'Caste No Bar']::TEXT[], ARRAY['M.A', 'No Education Bar']::TEXT[], ARRAY['Civil Engineer']::TEXT[], ARRAY['vegetarian','non_vegetarian']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  height_min = EXCLUDED.height_min,
  height_max = EXCLUDED.height_max,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  education = EXCLUDED.education,
  occupation = EXCLUDED.occupation,
  food_habit = EXCLUDED.food_habit;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, height_min, height_max, marital_status, religion, caste, education, occupation, food_habit)
VALUES ('00000000-0000-4000-a000-000000000104', 22, 31, 149, 164, ARRAY['never_married']::TEXT[], ARRAY['Christian']::TEXT[], ARRAY['Vellalar Christian', 'Caste No Bar']::TEXT[], ARRAY['M.B.A', 'No Education Bar']::TEXT[], ARRAY['College Professor']::TEXT[], ARRAY['vegetarian','non_vegetarian']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  height_min = EXCLUDED.height_min,
  height_max = EXCLUDED.height_max,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  education = EXCLUDED.education,
  occupation = EXCLUDED.occupation,
  food_habit = EXCLUDED.food_habit;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, height_min, height_max, marital_status, religion, caste, education, occupation, food_habit)
VALUES ('00000000-0000-4000-a000-000000000105', 26, 36, 162, 177, ARRAY['never_married']::TEXT[], ARRAY['Hindu']::TEXT[], ARRAY['Vanniyar', 'Caste No Bar']::TEXT[], ARRAY['M.C.A', 'No Education Bar']::TEXT[], ARRAY['Mechanical Engineer']::TEXT[], ARRAY['vegetarian','non_vegetarian']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  height_min = EXCLUDED.height_min,
  height_max = EXCLUDED.height_max,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  education = EXCLUDED.education,
  occupation = EXCLUDED.occupation,
  food_habit = EXCLUDED.food_habit;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, height_min, height_max, marital_status, religion, caste, education, occupation, food_habit)
VALUES ('00000000-0000-4000-a000-000000000106', 27, 44, 146, 161, ARRAY['never_married']::TEXT[], ARRAY['Hindu']::TEXT[], ARRAY['Kallar', 'Caste No Bar']::TEXT[], ARRAY['B.E. / B.Tech', 'No Education Bar']::TEXT[], ARRAY['Advocate']::TEXT[], ARRAY['vegetarian','non_vegetarian']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  height_min = EXCLUDED.height_min,
  height_max = EXCLUDED.height_max,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  education = EXCLUDED.education,
  occupation = EXCLUDED.occupation,
  food_habit = EXCLUDED.food_habit;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, height_min, height_max, marital_status, religion, caste, education, occupation, food_habit)
VALUES ('00000000-0000-4000-a000-000000000107', 21, 43, 159, 174, ARRAY['never_married']::TEXT[], ARRAY['Hindu']::TEXT[], ARRAY['Mudaliar', 'Caste No Bar']::TEXT[], ARRAY['M.B.A', 'No Education Bar']::TEXT[], ARRAY['Bank Manager']::TEXT[], ARRAY['vegetarian','non_vegetarian']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  height_min = EXCLUDED.height_min,
  height_max = EXCLUDED.height_max,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  education = EXCLUDED.education,
  occupation = EXCLUDED.occupation,
  food_habit = EXCLUDED.food_habit;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, height_min, height_max, marital_status, religion, caste, education, occupation, food_habit)
VALUES ('00000000-0000-4000-a000-000000000108', 23, 44, 152, 167, ARRAY['never_married']::TEXT[], ARRAY['Hindu']::TEXT[], ARRAY['Vanniyar', 'Caste No Bar']::TEXT[], ARRAY['M.B.A', 'No Education Bar']::TEXT[], ARRAY['Architect']::TEXT[], ARRAY['vegetarian','non_vegetarian']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  height_min = EXCLUDED.height_min,
  height_max = EXCLUDED.height_max,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  education = EXCLUDED.education,
  occupation = EXCLUDED.occupation,
  food_habit = EXCLUDED.food_habit;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, height_min, height_max, marital_status, religion, caste, education, occupation, food_habit)
VALUES ('00000000-0000-4000-a000-000000000109', 27, 34, 148, 163, ARRAY['never_married']::TEXT[], ARRAY['Hindu']::TEXT[], ARRAY['Naidu', 'Caste No Bar']::TEXT[], ARRAY['B.Ed', 'No Education Bar']::TEXT[], ARRAY['School Teacher']::TEXT[], ARRAY['vegetarian','non_vegetarian']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  height_min = EXCLUDED.height_min,
  height_max = EXCLUDED.height_max,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  education = EXCLUDED.education,
  occupation = EXCLUDED.occupation,
  food_habit = EXCLUDED.food_habit;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, height_min, height_max, marital_status, religion, caste, education, occupation, food_habit)
VALUES ('00000000-0000-4000-a000-00000000010a', 22, 35, 136, 151, ARRAY['never_married']::TEXT[], ARRAY['Hindu']::TEXT[], ARRAY['Yadav', 'Caste No Bar']::TEXT[], ARRAY['B.Com', 'No Education Bar']::TEXT[], ARRAY['Auditor']::TEXT[], ARRAY['vegetarian','non_vegetarian']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  height_min = EXCLUDED.height_min,
  height_max = EXCLUDED.height_max,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  education = EXCLUDED.education,
  occupation = EXCLUDED.occupation,
  food_habit = EXCLUDED.food_habit;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, height_min, height_max, marital_status, religion, caste, education, occupation, food_habit)
VALUES ('00000000-0000-4000-a000-00000000010b', 21, 30, 162, 177, ARRAY['never_married']::TEXT[], ARRAY['Hindu']::TEXT[], ARRAY['Adi Dravida', 'Caste No Bar']::TEXT[], ARRAY['B.Ed', 'No Education Bar']::TEXT[], ARRAY['Civil Engineer']::TEXT[], ARRAY['vegetarian','non_vegetarian']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  height_min = EXCLUDED.height_min,
  height_max = EXCLUDED.height_max,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  education = EXCLUDED.education,
  occupation = EXCLUDED.occupation,
  food_habit = EXCLUDED.food_habit;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, height_min, height_max, marital_status, religion, caste, education, occupation, food_habit)
VALUES ('00000000-0000-4000-a000-00000000010c', 25, 36, 154, 169, ARRAY['never_married']::TEXT[], ARRAY['Hindu']::TEXT[], ARRAY['Vellalar', 'Caste No Bar']::TEXT[], ARRAY['B.Com', 'No Education Bar']::TEXT[], ARRAY['Business Owner']::TEXT[], ARRAY['vegetarian','non_vegetarian']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  height_min = EXCLUDED.height_min,
  height_max = EXCLUDED.height_max,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  education = EXCLUDED.education,
  occupation = EXCLUDED.occupation,
  food_habit = EXCLUDED.food_habit;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, height_min, height_max, marital_status, religion, caste, education, occupation, food_habit)
VALUES ('00000000-0000-4000-a000-00000000010d', 24, 39, 166, 181, ARRAY['never_married']::TEXT[], ARRAY['Hindu']::TEXT[], ARRAY['Adi Dravida', 'Caste No Bar']::TEXT[], ARRAY['Ph.D', 'No Education Bar']::TEXT[], ARRAY['Architect']::TEXT[], ARRAY['vegetarian','non_vegetarian']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  height_min = EXCLUDED.height_min,
  height_max = EXCLUDED.height_max,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  education = EXCLUDED.education,
  occupation = EXCLUDED.occupation,
  food_habit = EXCLUDED.food_habit;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, height_min, height_max, marital_status, religion, caste, education, occupation, food_habit)
VALUES ('00000000-0000-4000-a000-00000000010e', 24, 39, 150, 165, ARRAY['never_married']::TEXT[], ARRAY['Hindu']::TEXT[], ARRAY['Kallar', 'Caste No Bar']::TEXT[], ARRAY['M.B.B.S', 'No Education Bar']::TEXT[], ARRAY['Doctor']::TEXT[], ARRAY['vegetarian','non_vegetarian']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  height_min = EXCLUDED.height_min,
  height_max = EXCLUDED.height_max,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  education = EXCLUDED.education,
  occupation = EXCLUDED.occupation,
  food_habit = EXCLUDED.food_habit;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, height_min, height_max, marital_status, religion, caste, education, occupation, food_habit)
VALUES ('00000000-0000-4000-a000-00000000010f', 22, 30, 170, 185, ARRAY['never_married']::TEXT[], ARRAY['Hindu']::TEXT[], ARRAY['Pillai', 'Caste No Bar']::TEXT[], ARRAY['M.C.A', 'No Education Bar']::TEXT[], ARRAY['Police Officer']::TEXT[], ARRAY['vegetarian','non_vegetarian']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  height_min = EXCLUDED.height_min,
  height_max = EXCLUDED.height_max,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  education = EXCLUDED.education,
  occupation = EXCLUDED.occupation,
  food_habit = EXCLUDED.food_habit;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, height_min, height_max, marital_status, religion, caste, education, occupation, food_habit)
VALUES ('00000000-0000-4000-a000-000000000110', 24, 37, 140, 155, ARRAY['never_married']::TEXT[], ARRAY['Hindu']::TEXT[], ARRAY['Chettiar', 'Caste No Bar']::TEXT[], ARRAY['B.Com', 'No Education Bar']::TEXT[], ARRAY['College Professor']::TEXT[], ARRAY['vegetarian','non_vegetarian']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  height_min = EXCLUDED.height_min,
  height_max = EXCLUDED.height_max,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  education = EXCLUDED.education,
  occupation = EXCLUDED.occupation,
  food_habit = EXCLUDED.food_habit;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, height_min, height_max, marital_status, religion, caste, education, occupation, food_habit)
VALUES ('00000000-0000-4000-a000-000000000111', 28, 45, 156, 171, ARRAY['never_married']::TEXT[], ARRAY['Hindu']::TEXT[], ARRAY['Chettiar', 'Caste No Bar']::TEXT[], ARRAY['M.A', 'No Education Bar']::TEXT[], ARRAY['Bank Manager']::TEXT[], ARRAY['vegetarian','non_vegetarian']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  height_min = EXCLUDED.height_min,
  height_max = EXCLUDED.height_max,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  education = EXCLUDED.education,
  occupation = EXCLUDED.occupation,
  food_habit = EXCLUDED.food_habit;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, height_min, height_max, marital_status, religion, caste, education, occupation, food_habit)
VALUES ('00000000-0000-4000-a000-000000000112', 21, 42, 152, 167, ARRAY['never_married']::TEXT[], ARRAY['Hindu']::TEXT[], ARRAY['Nadar', 'Caste No Bar']::TEXT[], ARRAY['M.C.A', 'No Education Bar']::TEXT[], ARRAY['Auditor']::TEXT[], ARRAY['vegetarian','non_vegetarian']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  height_min = EXCLUDED.height_min,
  height_max = EXCLUDED.height_max,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  education = EXCLUDED.education,
  occupation = EXCLUDED.occupation,
  food_habit = EXCLUDED.food_habit;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, height_min, height_max, marital_status, religion, caste, education, occupation, food_habit)
VALUES ('00000000-0000-4000-a000-000000000113', 25, 44, 149, 164, ARRAY['never_married']::TEXT[], ARRAY['Hindu']::TEXT[], ARRAY['Arunthathiyar', 'Caste No Bar']::TEXT[], ARRAY['B.Com', 'No Education Bar']::TEXT[], ARRAY['Architect']::TEXT[], ARRAY['vegetarian','non_vegetarian']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  height_min = EXCLUDED.height_min,
  height_max = EXCLUDED.height_max,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  education = EXCLUDED.education,
  occupation = EXCLUDED.occupation,
  food_habit = EXCLUDED.food_habit;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, height_min, height_max, marital_status, religion, caste, education, occupation, food_habit)
VALUES ('00000000-0000-4000-a000-000000000114', 23, 37, 150, 165, ARRAY['never_married']::TEXT[], ARRAY['Hindu']::TEXT[], ARRAY['Arunthathiyar', 'Caste No Bar']::TEXT[], ARRAY['M.B.A', 'No Education Bar']::TEXT[], ARRAY['College Professor']::TEXT[], ARRAY['vegetarian','non_vegetarian']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  height_min = EXCLUDED.height_min,
  height_max = EXCLUDED.height_max,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  education = EXCLUDED.education,
  occupation = EXCLUDED.occupation,
  food_habit = EXCLUDED.food_habit;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, height_min, height_max, marital_status, religion, caste, education, occupation, food_habit)
VALUES ('00000000-0000-4000-a000-000000000115', 27, 35, 171, 186, ARRAY['never_married']::TEXT[], ARRAY['Hindu']::TEXT[], ARRAY['Adi Dravida', 'Caste No Bar']::TEXT[], ARRAY['M.Sc', 'No Education Bar']::TEXT[], ARRAY['College Professor']::TEXT[], ARRAY['vegetarian','non_vegetarian']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  height_min = EXCLUDED.height_min,
  height_max = EXCLUDED.height_max,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  education = EXCLUDED.education,
  occupation = EXCLUDED.occupation,
  food_habit = EXCLUDED.food_habit;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, height_min, height_max, marital_status, religion, caste, education, occupation, food_habit)
VALUES ('00000000-0000-4000-a000-000000000116', 26, 36, 155, 170, ARRAY['never_married']::TEXT[], ARRAY['Christian']::TEXT[], ARRAY['RC Christian', 'Caste No Bar']::TEXT[], ARRAY['B.A', 'No Education Bar']::TEXT[], ARRAY['Bank Manager']::TEXT[], ARRAY['vegetarian','non_vegetarian']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  height_min = EXCLUDED.height_min,
  height_max = EXCLUDED.height_max,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  education = EXCLUDED.education,
  occupation = EXCLUDED.occupation,
  food_habit = EXCLUDED.food_habit;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, height_min, height_max, marital_status, religion, caste, education, occupation, food_habit)
VALUES ('00000000-0000-4000-a000-000000000117', 28, 31, 154, 169, ARRAY['never_married']::TEXT[], ARRAY['Hindu']::TEXT[], ARRAY['Sengunthar', 'Caste No Bar']::TEXT[], ARRAY['B.Ed', 'No Education Bar']::TEXT[], ARRAY['Government Officer']::TEXT[], ARRAY['vegetarian','non_vegetarian']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  height_min = EXCLUDED.height_min,
  height_max = EXCLUDED.height_max,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  education = EXCLUDED.education,
  occupation = EXCLUDED.occupation,
  food_habit = EXCLUDED.food_habit;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, height_min, height_max, marital_status, religion, caste, education, occupation, food_habit)
VALUES ('00000000-0000-4000-a000-000000000118', 26, 35, 153, 168, ARRAY['never_married']::TEXT[], ARRAY['Hindu']::TEXT[], ARRAY['Naicker', 'Caste No Bar']::TEXT[], ARRAY['B.E. / B.Tech', 'No Education Bar']::TEXT[], ARRAY['Mechanical Engineer']::TEXT[], ARRAY['vegetarian','non_vegetarian']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  height_min = EXCLUDED.height_min,
  height_max = EXCLUDED.height_max,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  education = EXCLUDED.education,
  occupation = EXCLUDED.occupation,
  food_habit = EXCLUDED.food_habit;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, height_min, height_max, marital_status, religion, caste, education, occupation, food_habit)
VALUES ('00000000-0000-4000-a000-000000000119', 24, 31, 163, 178, ARRAY['never_married']::TEXT[], ARRAY['Muslim']::TEXT[], ARRAY['Rawther', 'Caste No Bar']::TEXT[], ARRAY['M.C.A', 'No Education Bar']::TEXT[], ARRAY['Auditor']::TEXT[], ARRAY['vegetarian','non_vegetarian']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  height_min = EXCLUDED.height_min,
  height_max = EXCLUDED.height_max,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  education = EXCLUDED.education,
  occupation = EXCLUDED.occupation,
  food_habit = EXCLUDED.food_habit;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, height_min, height_max, marital_status, religion, caste, education, occupation, food_habit)
VALUES ('00000000-0000-4000-a000-00000000011a', 24, 39, 160, 175, ARRAY['never_married']::TEXT[], ARRAY['Hindu']::TEXT[], ARRAY['Naidu', 'Caste No Bar']::TEXT[], ARRAY['M.B.B.S', 'No Education Bar']::TEXT[], ARRAY['HR Specialist']::TEXT[], ARRAY['vegetarian','non_vegetarian']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  height_min = EXCLUDED.height_min,
  height_max = EXCLUDED.height_max,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  education = EXCLUDED.education,
  occupation = EXCLUDED.occupation,
  food_habit = EXCLUDED.food_habit;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, height_min, height_max, marital_status, religion, caste, education, occupation, food_habit)
VALUES ('00000000-0000-4000-a000-00000000011b', 25, 31, 163, 178, ARRAY['never_married']::TEXT[], ARRAY['Hindu']::TEXT[], ARRAY['Naidu', 'Caste No Bar']::TEXT[], ARRAY['B.Ed', 'No Education Bar']::TEXT[], ARRAY['Software Engineer']::TEXT[], ARRAY['vegetarian','non_vegetarian']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  height_min = EXCLUDED.height_min,
  height_max = EXCLUDED.height_max,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  education = EXCLUDED.education,
  occupation = EXCLUDED.occupation,
  food_habit = EXCLUDED.food_habit;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, height_min, height_max, marital_status, religion, caste, education, occupation, food_habit)
VALUES ('00000000-0000-4000-a000-00000000011c', 21, 38, 139, 154, ARRAY['never_married']::TEXT[], ARRAY['Hindu']::TEXT[], ARRAY['Sengunthar', 'Caste No Bar']::TEXT[], ARRAY['M.A', 'No Education Bar']::TEXT[], ARRAY['Police Officer']::TEXT[], ARRAY['vegetarian','non_vegetarian']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  height_min = EXCLUDED.height_min,
  height_max = EXCLUDED.height_max,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  education = EXCLUDED.education,
  occupation = EXCLUDED.occupation,
  food_habit = EXCLUDED.food_habit;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, height_min, height_max, marital_status, religion, caste, education, occupation, food_habit)
VALUES ('00000000-0000-4000-a000-00000000011d', 26, 41, 168, 183, ARRAY['never_married']::TEXT[], ARRAY['Hindu']::TEXT[], ARRAY['Naidu', 'Caste No Bar']::TEXT[], ARRAY['B.Com', 'No Education Bar']::TEXT[], ARRAY['Auditor']::TEXT[], ARRAY['vegetarian','non_vegetarian']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  height_min = EXCLUDED.height_min,
  height_max = EXCLUDED.height_max,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  education = EXCLUDED.education,
  occupation = EXCLUDED.occupation,
  food_habit = EXCLUDED.food_habit;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, height_min, height_max, marital_status, religion, caste, education, occupation, food_habit)
VALUES ('00000000-0000-4000-a000-00000000011e', 27, 39, 148, 163, ARRAY['never_married']::TEXT[], ARRAY['Hindu']::TEXT[], ARRAY['Agamudayar', 'Caste No Bar']::TEXT[], ARRAY['B.A', 'No Education Bar']::TEXT[], ARRAY['College Professor']::TEXT[], ARRAY['vegetarian','non_vegetarian']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  height_min = EXCLUDED.height_min,
  height_max = EXCLUDED.height_max,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  education = EXCLUDED.education,
  occupation = EXCLUDED.occupation,
  food_habit = EXCLUDED.food_habit;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, height_min, height_max, marital_status, religion, caste, education, occupation, food_habit)
VALUES ('00000000-0000-4000-a000-00000000011f', 23, 42, 170, 185, ARRAY['never_married']::TEXT[], ARRAY['Hindu']::TEXT[], ARRAY['Chettiar', 'Caste No Bar']::TEXT[], ARRAY['Ph.D', 'No Education Bar']::TEXT[], ARRAY['Police Officer']::TEXT[], ARRAY['vegetarian','non_vegetarian']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  height_min = EXCLUDED.height_min,
  height_max = EXCLUDED.height_max,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  education = EXCLUDED.education,
  occupation = EXCLUDED.occupation,
  food_habit = EXCLUDED.food_habit;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, height_min, height_max, marital_status, religion, caste, education, occupation, food_habit)
VALUES ('00000000-0000-4000-a000-000000000120', 28, 43, 140, 155, ARRAY['never_married']::TEXT[], ARRAY['Hindu']::TEXT[], ARRAY['Pillai', 'Caste No Bar']::TEXT[], ARRAY['M.C.A', 'No Education Bar']::TEXT[], ARRAY['Dentist']::TEXT[], ARRAY['vegetarian','non_vegetarian']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  height_min = EXCLUDED.height_min,
  height_max = EXCLUDED.height_max,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  education = EXCLUDED.education,
  occupation = EXCLUDED.occupation,
  food_habit = EXCLUDED.food_habit;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, height_min, height_max, marital_status, religion, caste, education, occupation, food_habit)
VALUES ('00000000-0000-4000-a000-000000000121', 24, 38, 150, 165, ARRAY['never_married']::TEXT[], ARRAY['Hindu']::TEXT[], ARRAY['Naidu', 'Caste No Bar']::TEXT[], ARRAY['M.B.B.S', 'No Education Bar']::TEXT[], ARRAY['Civil Engineer']::TEXT[], ARRAY['vegetarian','non_vegetarian']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  height_min = EXCLUDED.height_min,
  height_max = EXCLUDED.height_max,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  education = EXCLUDED.education,
  occupation = EXCLUDED.occupation,
  food_habit = EXCLUDED.food_habit;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, height_min, height_max, marital_status, religion, caste, education, occupation, food_habit)
VALUES ('00000000-0000-4000-a000-000000000122', 23, 31, 141, 156, ARRAY['never_married']::TEXT[], ARRAY['Hindu']::TEXT[], ARRAY['Yadav', 'Caste No Bar']::TEXT[], ARRAY['B.Com', 'No Education Bar']::TEXT[], ARRAY['Police Officer']::TEXT[], ARRAY['vegetarian','non_vegetarian']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  height_min = EXCLUDED.height_min,
  height_max = EXCLUDED.height_max,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  education = EXCLUDED.education,
  occupation = EXCLUDED.occupation,
  food_habit = EXCLUDED.food_habit;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, height_min, height_max, marital_status, religion, caste, education, occupation, food_habit)
VALUES ('00000000-0000-4000-a000-000000000123', 24, 38, 169, 184, ARRAY['never_married']::TEXT[], ARRAY['Hindu']::TEXT[], ARRAY['Adi Dravida', 'Caste No Bar']::TEXT[], ARRAY['M.Com', 'No Education Bar']::TEXT[], ARRAY['College Professor']::TEXT[], ARRAY['vegetarian','non_vegetarian']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  height_min = EXCLUDED.height_min,
  height_max = EXCLUDED.height_max,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  education = EXCLUDED.education,
  occupation = EXCLUDED.occupation,
  food_habit = EXCLUDED.food_habit;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, height_min, height_max, marital_status, religion, caste, education, occupation, food_habit)
VALUES ('00000000-0000-4000-a000-000000000124', 22, 36, 151, 166, ARRAY['never_married']::TEXT[], ARRAY['Hindu']::TEXT[], ARRAY['Agamudayar', 'Caste No Bar']::TEXT[], ARRAY['B.E. / B.Tech', 'No Education Bar']::TEXT[], ARRAY['Police Officer']::TEXT[], ARRAY['vegetarian','non_vegetarian']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  height_min = EXCLUDED.height_min,
  height_max = EXCLUDED.height_max,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  education = EXCLUDED.education,
  occupation = EXCLUDED.occupation,
  food_habit = EXCLUDED.food_habit;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, height_min, height_max, marital_status, religion, caste, education, occupation, food_habit)
VALUES ('00000000-0000-4000-a000-000000000125', 27, 31, 170, 185, ARRAY['never_married']::TEXT[], ARRAY['Muslim']::TEXT[], ARRAY['Marakayar', 'Caste No Bar']::TEXT[], ARRAY['B.Com', 'No Education Bar']::TEXT[], ARRAY['Government Officer']::TEXT[], ARRAY['vegetarian','non_vegetarian']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  height_min = EXCLUDED.height_min,
  height_max = EXCLUDED.height_max,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  education = EXCLUDED.education,
  occupation = EXCLUDED.occupation,
  food_habit = EXCLUDED.food_habit;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, height_min, height_max, marital_status, religion, caste, education, occupation, food_habit)
VALUES ('00000000-0000-4000-a000-000000000126', 26, 34, 139, 154, ARRAY['never_married']::TEXT[], ARRAY['Muslim']::TEXT[], ARRAY['Labbai', 'Caste No Bar']::TEXT[], ARRAY['B.Sc', 'No Education Bar']::TEXT[], ARRAY['Police Officer']::TEXT[], ARRAY['vegetarian','non_vegetarian']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  height_min = EXCLUDED.height_min,
  height_max = EXCLUDED.height_max,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  education = EXCLUDED.education,
  occupation = EXCLUDED.occupation,
  food_habit = EXCLUDED.food_habit;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, height_min, height_max, marital_status, religion, caste, education, occupation, food_habit)
VALUES ('00000000-0000-4000-a000-000000000127', 22, 30, 158, 173, ARRAY['never_married']::TEXT[], ARRAY['Hindu']::TEXT[], ARRAY['Arunthathiyar', 'Caste No Bar']::TEXT[], ARRAY['Ph.D', 'No Education Bar']::TEXT[], ARRAY['Doctor']::TEXT[], ARRAY['vegetarian','non_vegetarian']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  height_min = EXCLUDED.height_min,
  height_max = EXCLUDED.height_max,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  education = EXCLUDED.education,
  occupation = EXCLUDED.occupation,
  food_habit = EXCLUDED.food_habit;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, height_min, height_max, marital_status, religion, caste, education, occupation, food_habit)
VALUES ('00000000-0000-4000-a000-000000000128', 25, 45, 150, 165, ARRAY['never_married']::TEXT[], ARRAY['Christian']::TEXT[], ARRAY['CSI Christian', 'Caste No Bar']::TEXT[], ARRAY['B.Com', 'No Education Bar']::TEXT[], ARRAY['School Teacher']::TEXT[], ARRAY['vegetarian','non_vegetarian']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  height_min = EXCLUDED.height_min,
  height_max = EXCLUDED.height_max,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  education = EXCLUDED.education,
  occupation = EXCLUDED.occupation,
  food_habit = EXCLUDED.food_habit;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, height_min, height_max, marital_status, religion, caste, education, occupation, food_habit)
VALUES ('00000000-0000-4000-a000-000000000129', 27, 32, 151, 166, ARRAY['never_married']::TEXT[], ARRAY['Hindu']::TEXT[], ARRAY['Gounder', 'Caste No Bar']::TEXT[], ARRAY['B.Sc', 'No Education Bar']::TEXT[], ARRAY['College Professor']::TEXT[], ARRAY['vegetarian','non_vegetarian']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  height_min = EXCLUDED.height_min,
  height_max = EXCLUDED.height_max,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  education = EXCLUDED.education,
  occupation = EXCLUDED.occupation,
  food_habit = EXCLUDED.food_habit;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, height_min, height_max, marital_status, religion, caste, education, occupation, food_habit)
VALUES ('00000000-0000-4000-a000-00000000012a', 27, 33, 150, 165, ARRAY['never_married']::TEXT[], ARRAY['Hindu']::TEXT[], ARRAY['Nadar', 'Caste No Bar']::TEXT[], ARRAY['Ph.D', 'No Education Bar']::TEXT[], ARRAY['Software Engineer']::TEXT[], ARRAY['vegetarian','non_vegetarian']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  height_min = EXCLUDED.height_min,
  height_max = EXCLUDED.height_max,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  education = EXCLUDED.education,
  occupation = EXCLUDED.occupation,
  food_habit = EXCLUDED.food_habit;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, height_min, height_max, marital_status, religion, caste, education, occupation, food_habit)
VALUES ('00000000-0000-4000-a000-00000000012b', 21, 31, 163, 178, ARRAY['never_married']::TEXT[], ARRAY['Hindu']::TEXT[], ARRAY['Kallar', 'Caste No Bar']::TEXT[], ARRAY['M.A', 'No Education Bar']::TEXT[], ARRAY['Government Officer']::TEXT[], ARRAY['vegetarian','non_vegetarian']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  height_min = EXCLUDED.height_min,
  height_max = EXCLUDED.height_max,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  education = EXCLUDED.education,
  occupation = EXCLUDED.occupation,
  food_habit = EXCLUDED.food_habit;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, height_min, height_max, marital_status, religion, caste, education, occupation, food_habit)
VALUES ('00000000-0000-4000-a000-00000000012c', 28, 42, 137, 152, ARRAY['never_married']::TEXT[], ARRAY['Hindu']::TEXT[], ARRAY['Vishwakarma', 'Caste No Bar']::TEXT[], ARRAY['M.C.A', 'No Education Bar']::TEXT[], ARRAY['School Teacher']::TEXT[], ARRAY['vegetarian','non_vegetarian']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  height_min = EXCLUDED.height_min,
  height_max = EXCLUDED.height_max,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  education = EXCLUDED.education,
  occupation = EXCLUDED.occupation,
  food_habit = EXCLUDED.food_habit;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, height_min, height_max, marital_status, religion, caste, education, occupation, food_habit)
VALUES ('00000000-0000-4000-a000-00000000012d', 28, 34, 152, 167, ARRAY['never_married']::TEXT[], ARRAY['Hindu']::TEXT[], ARRAY['Kallar', 'Caste No Bar']::TEXT[], ARRAY['B.Ed', 'No Education Bar']::TEXT[], ARRAY['Architect']::TEXT[], ARRAY['vegetarian','non_vegetarian']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  height_min = EXCLUDED.height_min,
  height_max = EXCLUDED.height_max,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  education = EXCLUDED.education,
  occupation = EXCLUDED.occupation,
  food_habit = EXCLUDED.food_habit;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, height_min, height_max, marital_status, religion, caste, education, occupation, food_habit)
VALUES ('00000000-0000-4000-a000-00000000012e', 22, 44, 142, 157, ARRAY['never_married']::TEXT[], ARRAY['Hindu']::TEXT[], ARRAY['Mudaliar', 'Caste No Bar']::TEXT[], ARRAY['B.A', 'No Education Bar']::TEXT[], ARRAY['Architect']::TEXT[], ARRAY['vegetarian','non_vegetarian']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  height_min = EXCLUDED.height_min,
  height_max = EXCLUDED.height_max,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  education = EXCLUDED.education,
  occupation = EXCLUDED.occupation,
  food_habit = EXCLUDED.food_habit;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, height_min, height_max, marital_status, religion, caste, education, occupation, food_habit)
VALUES ('00000000-0000-4000-a000-00000000012f', 26, 41, 148, 163, ARRAY['never_married']::TEXT[], ARRAY['Hindu']::TEXT[], ARRAY['Nadar', 'Caste No Bar']::TEXT[], ARRAY['B.A', 'No Education Bar']::TEXT[], ARRAY['HR Specialist']::TEXT[], ARRAY['vegetarian','non_vegetarian']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  height_min = EXCLUDED.height_min,
  height_max = EXCLUDED.height_max,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  education = EXCLUDED.education,
  occupation = EXCLUDED.occupation,
  food_habit = EXCLUDED.food_habit;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, height_min, height_max, marital_status, religion, caste, education, occupation, food_habit)
VALUES ('00000000-0000-4000-a000-000000000130', 22, 33, 139, 154, ARRAY['never_married']::TEXT[], ARRAY['Hindu']::TEXT[], ARRAY['Gounder', 'Caste No Bar']::TEXT[], ARRAY['B.Com', 'No Education Bar']::TEXT[], ARRAY['Business Owner']::TEXT[], ARRAY['vegetarian','non_vegetarian']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  height_min = EXCLUDED.height_min,
  height_max = EXCLUDED.height_max,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  education = EXCLUDED.education,
  occupation = EXCLUDED.occupation,
  food_habit = EXCLUDED.food_habit;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, height_min, height_max, marital_status, religion, caste, education, occupation, food_habit)
VALUES ('00000000-0000-4000-a000-000000000131', 25, 42, 172, 187, ARRAY['never_married']::TEXT[], ARRAY['Muslim']::TEXT[], ARRAY['Rawther', 'Caste No Bar']::TEXT[], ARRAY['B.A', 'No Education Bar']::TEXT[], ARRAY['Civil Engineer']::TEXT[], ARRAY['vegetarian','non_vegetarian']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  height_min = EXCLUDED.height_min,
  height_max = EXCLUDED.height_max,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  education = EXCLUDED.education,
  occupation = EXCLUDED.occupation,
  food_habit = EXCLUDED.food_habit;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, height_min, height_max, marital_status, religion, caste, education, occupation, food_habit)
VALUES ('00000000-0000-4000-a000-000000000132', 27, 36, 140, 155, ARRAY['never_married']::TEXT[], ARRAY['Hindu']::TEXT[], ARRAY['Sengunthar', 'Caste No Bar']::TEXT[], ARRAY['M.Com', 'No Education Bar']::TEXT[], ARRAY['Government Officer']::TEXT[], ARRAY['vegetarian','non_vegetarian']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  height_min = EXCLUDED.height_min,
  height_max = EXCLUDED.height_max,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  education = EXCLUDED.education,
  occupation = EXCLUDED.occupation,
  food_habit = EXCLUDED.food_habit;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, height_min, height_max, marital_status, religion, caste, education, occupation, food_habit)
VALUES ('00000000-0000-4000-a000-000000000133', 23, 31, 160, 175, ARRAY['never_married']::TEXT[], ARRAY['Hindu']::TEXT[], ARRAY['Sengunthar', 'Caste No Bar']::TEXT[], ARRAY['M.B.A', 'No Education Bar']::TEXT[], ARRAY['Auditor']::TEXT[], ARRAY['vegetarian','non_vegetarian']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  height_min = EXCLUDED.height_min,
  height_max = EXCLUDED.height_max,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  education = EXCLUDED.education,
  occupation = EXCLUDED.occupation,
  food_habit = EXCLUDED.food_habit;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, height_min, height_max, marital_status, religion, caste, education, occupation, food_habit)
VALUES ('00000000-0000-4000-a000-000000000134', 25, 41, 151, 166, ARRAY['never_married']::TEXT[], ARRAY['Hindu']::TEXT[], ARRAY['Pillai', 'Caste No Bar']::TEXT[], ARRAY['Ph.D', 'No Education Bar']::TEXT[], ARRAY['School Teacher']::TEXT[], ARRAY['vegetarian','non_vegetarian']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  height_min = EXCLUDED.height_min,
  height_max = EXCLUDED.height_max,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  education = EXCLUDED.education,
  occupation = EXCLUDED.occupation,
  food_habit = EXCLUDED.food_habit;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, height_min, height_max, marital_status, religion, caste, education, occupation, food_habit)
VALUES ('00000000-0000-4000-a000-000000000135', 26, 39, 168, 183, ARRAY['never_married']::TEXT[], ARRAY['Hindu']::TEXT[], ARRAY['Adi Dravida', 'Caste No Bar']::TEXT[], ARRAY['M.Com', 'No Education Bar']::TEXT[], ARRAY['Police Officer']::TEXT[], ARRAY['vegetarian','non_vegetarian']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  height_min = EXCLUDED.height_min,
  height_max = EXCLUDED.height_max,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  education = EXCLUDED.education,
  occupation = EXCLUDED.occupation,
  food_habit = EXCLUDED.food_habit;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, height_min, height_max, marital_status, religion, caste, education, occupation, food_habit)
VALUES ('00000000-0000-4000-a000-000000000136', 28, 41, 159, 174, ARRAY['never_married']::TEXT[], ARRAY['Hindu']::TEXT[], ARRAY['Adi Dravida', 'Caste No Bar']::TEXT[], ARRAY['M.A', 'No Education Bar']::TEXT[], ARRAY['School Teacher']::TEXT[], ARRAY['vegetarian','non_vegetarian']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  height_min = EXCLUDED.height_min,
  height_max = EXCLUDED.height_max,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  education = EXCLUDED.education,
  occupation = EXCLUDED.occupation,
  food_habit = EXCLUDED.food_habit;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, height_min, height_max, marital_status, religion, caste, education, occupation, food_habit)
VALUES ('00000000-0000-4000-a000-000000000137', 23, 40, 170, 185, ARRAY['never_married']::TEXT[], ARRAY['Hindu']::TEXT[], ARRAY['Naicker', 'Caste No Bar']::TEXT[], ARRAY['M.C.A', 'No Education Bar']::TEXT[], ARRAY['Auditor']::TEXT[], ARRAY['vegetarian','non_vegetarian']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  height_min = EXCLUDED.height_min,
  height_max = EXCLUDED.height_max,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  education = EXCLUDED.education,
  occupation = EXCLUDED.occupation,
  food_habit = EXCLUDED.food_habit;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, height_min, height_max, marital_status, religion, caste, education, occupation, food_habit)
VALUES ('00000000-0000-4000-a000-000000000138', 24, 31, 143, 158, ARRAY['never_married']::TEXT[], ARRAY['Hindu']::TEXT[], ARRAY['Mudaliar', 'Caste No Bar']::TEXT[], ARRAY['B.Ed', 'No Education Bar']::TEXT[], ARRAY['Auditor']::TEXT[], ARRAY['vegetarian','non_vegetarian']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  height_min = EXCLUDED.height_min,
  height_max = EXCLUDED.height_max,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  education = EXCLUDED.education,
  occupation = EXCLUDED.occupation,
  food_habit = EXCLUDED.food_habit;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, height_min, height_max, marital_status, religion, caste, education, occupation, food_habit)
VALUES ('00000000-0000-4000-a000-000000000139', 28, 43, 169, 184, ARRAY['never_married']::TEXT[], ARRAY['Muslim']::TEXT[], ARRAY['Labbai', 'Caste No Bar']::TEXT[], ARRAY['M.C.A', 'No Education Bar']::TEXT[], ARRAY['Advocate']::TEXT[], ARRAY['vegetarian','non_vegetarian']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  height_min = EXCLUDED.height_min,
  height_max = EXCLUDED.height_max,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  education = EXCLUDED.education,
  occupation = EXCLUDED.occupation,
  food_habit = EXCLUDED.food_habit;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, height_min, height_max, marital_status, religion, caste, education, occupation, food_habit)
VALUES ('00000000-0000-4000-a000-00000000013a', 26, 45, 150, 165, ARRAY['never_married']::TEXT[], ARRAY['Hindu']::TEXT[], ARRAY['Thevar', 'Caste No Bar']::TEXT[], ARRAY['M.C.A', 'No Education Bar']::TEXT[], ARRAY['Software Engineer']::TEXT[], ARRAY['vegetarian','non_vegetarian']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  height_min = EXCLUDED.height_min,
  height_max = EXCLUDED.height_max,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  education = EXCLUDED.education,
  occupation = EXCLUDED.occupation,
  food_habit = EXCLUDED.food_habit;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, height_min, height_max, marital_status, religion, caste, education, occupation, food_habit)
VALUES ('00000000-0000-4000-a000-00000000013b', 23, 35, 149, 164, ARRAY['never_married']::TEXT[], ARRAY['Hindu']::TEXT[], ARRAY['Pillai', 'Caste No Bar']::TEXT[], ARRAY['B.Sc', 'No Education Bar']::TEXT[], ARRAY['Advocate']::TEXT[], ARRAY['vegetarian','non_vegetarian']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  height_min = EXCLUDED.height_min,
  height_max = EXCLUDED.height_max,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  education = EXCLUDED.education,
  occupation = EXCLUDED.occupation,
  food_habit = EXCLUDED.food_habit;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, height_min, height_max, marital_status, religion, caste, education, occupation, food_habit)
VALUES ('00000000-0000-4000-a000-00000000013c', 27, 43, 150, 165, ARRAY['never_married']::TEXT[], ARRAY['Hindu']::TEXT[], ARRAY['Naidu', 'Caste No Bar']::TEXT[], ARRAY['M.B.B.S', 'No Education Bar']::TEXT[], ARRAY['School Teacher']::TEXT[], ARRAY['vegetarian','non_vegetarian']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  height_min = EXCLUDED.height_min,
  height_max = EXCLUDED.height_max,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  education = EXCLUDED.education,
  occupation = EXCLUDED.occupation,
  food_habit = EXCLUDED.food_habit;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, height_min, height_max, marital_status, religion, caste, education, occupation, food_habit)
VALUES ('00000000-0000-4000-a000-00000000013d', 25, 45, 165, 180, ARRAY['never_married']::TEXT[], ARRAY['Christian']::TEXT[], ARRAY['RC Christian', 'Caste No Bar']::TEXT[], ARRAY['B.Com', 'No Education Bar']::TEXT[], ARRAY['Business Owner']::TEXT[], ARRAY['vegetarian','non_vegetarian']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  height_min = EXCLUDED.height_min,
  height_max = EXCLUDED.height_max,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  education = EXCLUDED.education,
  occupation = EXCLUDED.occupation,
  food_habit = EXCLUDED.food_habit;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, height_min, height_max, marital_status, religion, caste, education, occupation, food_habit)
VALUES ('00000000-0000-4000-a000-00000000013e', 26, 35, 142, 157, ARRAY['never_married']::TEXT[], ARRAY['Hindu']::TEXT[], ARRAY['Yadav', 'Caste No Bar']::TEXT[], ARRAY['B.A', 'No Education Bar']::TEXT[], ARRAY['Government Officer']::TEXT[], ARRAY['vegetarian','non_vegetarian']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  height_min = EXCLUDED.height_min,
  height_max = EXCLUDED.height_max,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  education = EXCLUDED.education,
  occupation = EXCLUDED.occupation,
  food_habit = EXCLUDED.food_habit;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, height_min, height_max, marital_status, religion, caste, education, occupation, food_habit)
VALUES ('00000000-0000-4000-a000-00000000013f', 22, 37, 148, 163, ARRAY['never_married']::TEXT[], ARRAY['Hindu']::TEXT[], ARRAY['Devendra Kula Vellalar', 'Caste No Bar']::TEXT[], ARRAY['B.Ed', 'No Education Bar']::TEXT[], ARRAY['Dentist']::TEXT[], ARRAY['vegetarian','non_vegetarian']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  height_min = EXCLUDED.height_min,
  height_max = EXCLUDED.height_max,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  education = EXCLUDED.education,
  occupation = EXCLUDED.occupation,
  food_habit = EXCLUDED.food_habit;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, height_min, height_max, marital_status, religion, caste, education, occupation, food_habit)
VALUES ('00000000-0000-4000-a000-000000000140', 25, 39, 147, 162, ARRAY['never_married']::TEXT[], ARRAY['Hindu']::TEXT[], ARRAY['Vishwakarma', 'Caste No Bar']::TEXT[], ARRAY['M.Com', 'No Education Bar']::TEXT[], ARRAY['Mechanical Engineer']::TEXT[], ARRAY['vegetarian','non_vegetarian']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  height_min = EXCLUDED.height_min,
  height_max = EXCLUDED.height_max,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  education = EXCLUDED.education,
  occupation = EXCLUDED.occupation,
  food_habit = EXCLUDED.food_habit;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, height_min, height_max, marital_status, religion, caste, education, occupation, food_habit)
VALUES ('00000000-0000-4000-a000-000000000141', 25, 31, 154, 169, ARRAY['never_married']::TEXT[], ARRAY['Christian']::TEXT[], ARRAY['RC Christian', 'Caste No Bar']::TEXT[], ARRAY['M.Com', 'No Education Bar']::TEXT[], ARRAY['Auditor']::TEXT[], ARRAY['vegetarian','non_vegetarian']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  height_min = EXCLUDED.height_min,
  height_max = EXCLUDED.height_max,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  education = EXCLUDED.education,
  occupation = EXCLUDED.occupation,
  food_habit = EXCLUDED.food_habit;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, height_min, height_max, marital_status, religion, caste, education, occupation, food_habit)
VALUES ('00000000-0000-4000-a000-000000000142', 26, 34, 158, 173, ARRAY['never_married']::TEXT[], ARRAY['Hindu']::TEXT[], ARRAY['Adi Dravida', 'Caste No Bar']::TEXT[], ARRAY['B.Ed', 'No Education Bar']::TEXT[], ARRAY['Government Officer']::TEXT[], ARRAY['vegetarian','non_vegetarian']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  height_min = EXCLUDED.height_min,
  height_max = EXCLUDED.height_max,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  education = EXCLUDED.education,
  occupation = EXCLUDED.occupation,
  food_habit = EXCLUDED.food_habit;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, height_min, height_max, marital_status, religion, caste, education, occupation, food_habit)
VALUES ('00000000-0000-4000-a000-000000000143', 26, 33, 167, 182, ARRAY['never_married']::TEXT[], ARRAY['Hindu']::TEXT[], ARRAY['Naidu', 'Caste No Bar']::TEXT[], ARRAY['M.B.A', 'No Education Bar']::TEXT[], ARRAY['Government Officer']::TEXT[], ARRAY['vegetarian','non_vegetarian']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  height_min = EXCLUDED.height_min,
  height_max = EXCLUDED.height_max,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  education = EXCLUDED.education,
  occupation = EXCLUDED.occupation,
  food_habit = EXCLUDED.food_habit;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, height_min, height_max, marital_status, religion, caste, education, occupation, food_habit)
VALUES ('00000000-0000-4000-a000-000000000144', 21, 45, 155, 170, ARRAY['never_married']::TEXT[], ARRAY['Hindu']::TEXT[], ARRAY['Brahmin - Iyer', 'Caste No Bar']::TEXT[], ARRAY['B.Com', 'No Education Bar']::TEXT[], ARRAY['Civil Engineer']::TEXT[], ARRAY['vegetarian','non_vegetarian']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  height_min = EXCLUDED.height_min,
  height_max = EXCLUDED.height_max,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  education = EXCLUDED.education,
  occupation = EXCLUDED.occupation,
  food_habit = EXCLUDED.food_habit;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, height_min, height_max, marital_status, religion, caste, education, occupation, food_habit)
VALUES ('00000000-0000-4000-a000-000000000145', 28, 32, 170, 185, ARRAY['never_married']::TEXT[], ARRAY['Hindu']::TEXT[], ARRAY['Maravar', 'Caste No Bar']::TEXT[], ARRAY['Ph.D', 'No Education Bar']::TEXT[], ARRAY['Civil Engineer']::TEXT[], ARRAY['vegetarian','non_vegetarian']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  height_min = EXCLUDED.height_min,
  height_max = EXCLUDED.height_max,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  education = EXCLUDED.education,
  occupation = EXCLUDED.occupation,
  food_habit = EXCLUDED.food_habit;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, height_min, height_max, marital_status, religion, caste, education, occupation, food_habit)
VALUES ('00000000-0000-4000-a000-000000000146', 24, 40, 145, 160, ARRAY['never_married']::TEXT[], ARRAY['Hindu']::TEXT[], ARRAY['Brahmin - Iyer', 'Caste No Bar']::TEXT[], ARRAY['B.Sc', 'No Education Bar']::TEXT[], ARRAY['Mechanical Engineer']::TEXT[], ARRAY['vegetarian','non_vegetarian']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  height_min = EXCLUDED.height_min,
  height_max = EXCLUDED.height_max,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  education = EXCLUDED.education,
  occupation = EXCLUDED.occupation,
  food_habit = EXCLUDED.food_habit;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, height_min, height_max, marital_status, religion, caste, education, occupation, food_habit)
VALUES ('00000000-0000-4000-a000-000000000147', 21, 39, 148, 163, ARRAY['never_married']::TEXT[], ARRAY['Hindu']::TEXT[], ARRAY['Mudaliar', 'Caste No Bar']::TEXT[], ARRAY['M.B.A', 'No Education Bar']::TEXT[], ARRAY['Advocate']::TEXT[], ARRAY['vegetarian','non_vegetarian']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  height_min = EXCLUDED.height_min,
  height_max = EXCLUDED.height_max,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  education = EXCLUDED.education,
  occupation = EXCLUDED.occupation,
  food_habit = EXCLUDED.food_habit;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, height_min, height_max, marital_status, religion, caste, education, occupation, food_habit)
VALUES ('00000000-0000-4000-a000-000000000148', 24, 35, 146, 161, ARRAY['never_married']::TEXT[], ARRAY['Hindu']::TEXT[], ARRAY['Brahmin - Iyengar', 'Caste No Bar']::TEXT[], ARRAY['B.E. / B.Tech', 'No Education Bar']::TEXT[], ARRAY['Police Officer']::TEXT[], ARRAY['vegetarian','non_vegetarian']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  height_min = EXCLUDED.height_min,
  height_max = EXCLUDED.height_max,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  education = EXCLUDED.education,
  occupation = EXCLUDED.occupation,
  food_habit = EXCLUDED.food_habit;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, height_min, height_max, marital_status, religion, caste, education, occupation, food_habit)
VALUES ('00000000-0000-4000-a000-000000000149', 24, 41, 157, 172, ARRAY['never_married']::TEXT[], ARRAY['Hindu']::TEXT[], ARRAY['Nadar', 'Caste No Bar']::TEXT[], ARRAY['Ph.D', 'No Education Bar']::TEXT[], ARRAY['Police Officer']::TEXT[], ARRAY['vegetarian','non_vegetarian']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  height_min = EXCLUDED.height_min,
  height_max = EXCLUDED.height_max,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  education = EXCLUDED.education,
  occupation = EXCLUDED.occupation,
  food_habit = EXCLUDED.food_habit;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, height_min, height_max, marital_status, religion, caste, education, occupation, food_habit)
VALUES ('00000000-0000-4000-a000-00000000014a', 21, 39, 153, 168, ARRAY['never_married']::TEXT[], ARRAY['Hindu']::TEXT[], ARRAY['Vishwakarma', 'Caste No Bar']::TEXT[], ARRAY['Ph.D', 'No Education Bar']::TEXT[], ARRAY['Architect']::TEXT[], ARRAY['vegetarian','non_vegetarian']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  height_min = EXCLUDED.height_min,
  height_max = EXCLUDED.height_max,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  education = EXCLUDED.education,
  occupation = EXCLUDED.occupation,
  food_habit = EXCLUDED.food_habit;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, height_min, height_max, marital_status, religion, caste, education, occupation, food_habit)
VALUES ('00000000-0000-4000-a000-00000000014b', 25, 45, 173, 188, ARRAY['never_married']::TEXT[], ARRAY['Hindu']::TEXT[], ARRAY['Sengunthar', 'Caste No Bar']::TEXT[], ARRAY['B.Sc', 'No Education Bar']::TEXT[], ARRAY['College Professor']::TEXT[], ARRAY['vegetarian','non_vegetarian']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  height_min = EXCLUDED.height_min,
  height_max = EXCLUDED.height_max,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  education = EXCLUDED.education,
  occupation = EXCLUDED.occupation,
  food_habit = EXCLUDED.food_habit;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, height_min, height_max, marital_status, religion, caste, education, occupation, food_habit)
VALUES ('00000000-0000-4000-a000-00000000014c', 24, 32, 145, 160, ARRAY['never_married']::TEXT[], ARRAY['Hindu']::TEXT[], ARRAY['Gounder', 'Caste No Bar']::TEXT[], ARRAY['B.Sc', 'No Education Bar']::TEXT[], ARRAY['Auditor']::TEXT[], ARRAY['vegetarian','non_vegetarian']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  height_min = EXCLUDED.height_min,
  height_max = EXCLUDED.height_max,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  education = EXCLUDED.education,
  occupation = EXCLUDED.occupation,
  food_habit = EXCLUDED.food_habit;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, height_min, height_max, marital_status, religion, caste, education, occupation, food_habit)
VALUES ('00000000-0000-4000-a000-00000000014d', 23, 36, 161, 176, ARRAY['never_married']::TEXT[], ARRAY['Hindu']::TEXT[], ARRAY['Mudaliar', 'Caste No Bar']::TEXT[], ARRAY['Ph.D', 'No Education Bar']::TEXT[], ARRAY['School Teacher']::TEXT[], ARRAY['vegetarian','non_vegetarian']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  height_min = EXCLUDED.height_min,
  height_max = EXCLUDED.height_max,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  education = EXCLUDED.education,
  occupation = EXCLUDED.occupation,
  food_habit = EXCLUDED.food_habit;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, height_min, height_max, marital_status, religion, caste, education, occupation, food_habit)
VALUES ('00000000-0000-4000-a000-00000000014e', 22, 42, 142, 157, ARRAY['never_married']::TEXT[], ARRAY['Hindu']::TEXT[], ARRAY['Vanniyar', 'Caste No Bar']::TEXT[], ARRAY['M.A', 'No Education Bar']::TEXT[], ARRAY['Advocate']::TEXT[], ARRAY['vegetarian','non_vegetarian']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  height_min = EXCLUDED.height_min,
  height_max = EXCLUDED.height_max,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  education = EXCLUDED.education,
  occupation = EXCLUDED.occupation,
  food_habit = EXCLUDED.food_habit;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, height_min, height_max, marital_status, religion, caste, education, occupation, food_habit)
VALUES ('00000000-0000-4000-a000-00000000014f', 27, 44, 172, 187, ARRAY['never_married']::TEXT[], ARRAY['Hindu']::TEXT[], ARRAY['Pillai', 'Caste No Bar']::TEXT[], ARRAY['Ph.D', 'No Education Bar']::TEXT[], ARRAY['Software Engineer']::TEXT[], ARRAY['vegetarian','non_vegetarian']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  height_min = EXCLUDED.height_min,
  height_max = EXCLUDED.height_max,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  education = EXCLUDED.education,
  occupation = EXCLUDED.occupation,
  food_habit = EXCLUDED.food_habit;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, height_min, height_max, marital_status, religion, caste, education, occupation, food_habit)
VALUES ('00000000-0000-4000-a000-000000000150', 27, 32, 136, 151, ARRAY['never_married']::TEXT[], ARRAY['Hindu']::TEXT[], ARRAY['Kallar', 'Caste No Bar']::TEXT[], ARRAY['B.Sc', 'No Education Bar']::TEXT[], ARRAY['Bank Manager']::TEXT[], ARRAY['vegetarian','non_vegetarian']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  height_min = EXCLUDED.height_min,
  height_max = EXCLUDED.height_max,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  education = EXCLUDED.education,
  occupation = EXCLUDED.occupation,
  food_habit = EXCLUDED.food_habit;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, height_min, height_max, marital_status, religion, caste, education, occupation, food_habit)
VALUES ('00000000-0000-4000-a000-000000000151', 24, 31, 152, 167, ARRAY['never_married']::TEXT[], ARRAY['Hindu']::TEXT[], ARRAY['Vanniyar', 'Caste No Bar']::TEXT[], ARRAY['B.Ed', 'No Education Bar']::TEXT[], ARRAY['Business Owner']::TEXT[], ARRAY['vegetarian','non_vegetarian']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  height_min = EXCLUDED.height_min,
  height_max = EXCLUDED.height_max,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  education = EXCLUDED.education,
  occupation = EXCLUDED.occupation,
  food_habit = EXCLUDED.food_habit;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, height_min, height_max, marital_status, religion, caste, education, occupation, food_habit)
VALUES ('00000000-0000-4000-a000-000000000152', 24, 40, 135, 150, ARRAY['never_married']::TEXT[], ARRAY['Hindu']::TEXT[], ARRAY['Sengunthar', 'Caste No Bar']::TEXT[], ARRAY['M.Com', 'No Education Bar']::TEXT[], ARRAY['Doctor']::TEXT[], ARRAY['vegetarian','non_vegetarian']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  height_min = EXCLUDED.height_min,
  height_max = EXCLUDED.height_max,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  education = EXCLUDED.education,
  occupation = EXCLUDED.occupation,
  food_habit = EXCLUDED.food_habit;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, height_min, height_max, marital_status, religion, caste, education, occupation, food_habit)
VALUES ('00000000-0000-4000-a000-000000000153', 27, 35, 147, 162, ARRAY['never_married']::TEXT[], ARRAY['Hindu']::TEXT[], ARRAY['Naicker', 'Caste No Bar']::TEXT[], ARRAY['B.A', 'No Education Bar']::TEXT[], ARRAY['Government Officer']::TEXT[], ARRAY['vegetarian','non_vegetarian']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
  age_max = EXCLUDED.age_max,
  height_min = EXCLUDED.height_min,
  height_max = EXCLUDED.height_max,
  marital_status = EXCLUDED.marital_status,
  religion = EXCLUDED.religion,
  caste = EXCLUDED.caste,
  education = EXCLUDED.education,
  occupation = EXCLUDED.occupation,
  food_habit = EXCLUDED.food_habit;
INSERT INTO public.partner_preferences (user_id, age_min, age_max, height_min, height_max, marital_status, religion, caste, education, occupation, food_habit)
VALUES ('00000000-0000-4000-a000-000000000154', 23, 37, 149, 164, ARRAY['never_married']::TEXT[], ARRAY['Hindu']::TEXT[], ARRAY['Vellalar', 'Caste No Bar']::TEXT[], ARRAY['M.B.A', 'No Education Bar']::TEXT[], ARRAY['Dentist']::TEXT[], ARRAY['vegetarian','non_vegetarian']::TEXT[])
ON CONFLICT (user_id) DO UPDATE SET
  age_min = EXCLUDED.age_min,
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
