-- Admin Panel Setup Script
-- Run this in your Supabase SQL Editor

-- 1. Create Admin Users Table
CREATE TABLE IF NOT EXISTS public.admin_users (
  id uuid PRIMARY KEY DEFAULT uuid_generate_v4(),
  email text UNIQUE NOT NULL,
  role text DEFAULT 'admin' CHECK (role IN ('admin', 'superadmin')),
  created_at timestamp with time zone DEFAULT timezone('utc'::text, now()) NOT NULL
);

-- RLS for admin_users
ALTER TABLE public.admin_users ENABLE ROW LEVEL SECURITY;
GRANT SELECT ON public.admin_users TO anon, authenticated;

DROP POLICY IF EXISTS "Enable read access for all users" ON public.admin_users;
CREATE POLICY "Enable read access for all users" ON public.admin_users
    FOR SELECT USING (true);

-- Create initial admin user in our custom table
INSERT INTO public.admin_users (email, role)
VALUES ('vinomaddy2711@gmail.com', 'superadmin')
ON CONFLICT (email) DO NOTHING;

-- Create the authentication user so you can log in
CREATE EXTENSION IF NOT EXISTS pgcrypto;

DO $$
DECLARE
  new_user_id uuid;
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'vinomaddy2711@gmail.com') THEN
    new_user_id := gen_random_uuid();
    
    INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, aud, role, raw_app_meta_data, raw_user_meta_data)
    VALUES (
      new_user_id, 
      'vinomaddy2711@gmail.com', 
      crypt('Nasuvi151127', gen_salt('bf')), 
      now(), 
      'authenticated', 
      'authenticated', 
      '{"provider": "email", "providers": ["email"]}', 
      '{}'
    );
    
    INSERT INTO auth.identities (id, user_id, provider_id, identity_data, provider, last_sign_in_at, created_at, updated_at)
    VALUES (
      gen_random_uuid(), 
      new_user_id, 
      new_user_id::text, 
      format('{"sub":"%s","email":"%s"}', new_user_id::text, 'vinomaddy2711@gmail.com')::jsonb, 
      'email', 
      now(), 
      now(), 
      now()
    );
  END IF;
END $$;

-- 2. Create Admin Settings Table
CREATE TABLE IF NOT EXISTS public.admin_settings (
  id uuid PRIMARY KEY DEFAULT uuid_generate_v4(),
  setting_key text UNIQUE NOT NULL,
  setting_value jsonb NOT NULL,
  updated_at timestamp with time zone DEFAULT timezone('utc'::text, now()) NOT NULL
);

-- RLS for admin_settings
ALTER TABLE public.admin_settings ENABLE ROW LEVEL SECURITY;
GRANT SELECT ON public.admin_settings TO anon, authenticated;
GRANT UPDATE, INSERT ON public.admin_settings TO authenticated;

DROP POLICY IF EXISTS "Enable read access for all users" ON public.admin_settings;
CREATE POLICY "Enable read access for all users" ON public.admin_settings
    FOR SELECT USING (true);

-- Allow authenticated admins to update settings (optional, since we use service_role mostly, but good practice)
DROP POLICY IF EXISTS "Enable update for admin users" ON public.admin_settings;
CREATE POLICY "Enable update for admin users" ON public.admin_settings
    FOR UPDATE USING (
        auth.jwt() ->> 'email' IN (SELECT email FROM admin_users)
    );

DROP POLICY IF EXISTS "Enable insert for admin users" ON public.admin_settings;
CREATE POLICY "Enable insert for admin users" ON public.admin_settings
    FOR INSERT WITH CHECK (
        auth.jwt() ->> 'email' IN (SELECT email FROM admin_users)
    );

-- Insert initial matches limits
INSERT INTO public.admin_settings (setting_key, setting_value)
VALUES (
  'matches_limits',
  '{
    "non_premium": { "recommended": 5, "nearby": 5, "daily": 5, "dynamic_daily_updates": false },
    "bronze": { "recommended": 15, "nearby": 15, "daily": 15, "dynamic_daily_updates": true },
    "silver": { "recommended": 20, "nearby": 20, "daily": 20, "dynamic_daily_updates": true },
    "gold": { "recommended": 30, "nearby": 30, "daily": 30, "dynamic_daily_updates": true },
    "platinum": { "recommended": 50, "nearby": 50, "daily": 50, "dynamic_daily_updates": true }
  }'::jsonb
)
ON CONFLICT (setting_key) DO NOTHING;

-- Also ensure 'profiles' has a default RLS policy that allows inserts by service_role (it does by default)

-- Force PostgREST to reload its schema cache so the new tables appear in the API immediately
NOTIFY pgrst, 'reload schema';
