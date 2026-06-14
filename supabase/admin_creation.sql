-- ============================================================
-- ADMIN SYSTEM & SEEDING (Run this separately)
-- ============================================================

-- A) Admin Users Table
CREATE TABLE IF NOT EXISTS public.admin_users (
  id uuid PRIMARY KEY DEFAULT uuid_generate_v4(),
  email text UNIQUE NOT NULL,
  role text DEFAULT 'admin' CHECK (role IN ('admin', 'superadmin')),
  created_at timestamp with time zone DEFAULT timezone('utc'::text, now()) NOT NULL
);

ALTER TABLE public.admin_users ENABLE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "Enable read access for all users" ON public.admin_users;
CREATE POLICY "Enable read access for all users" ON public.admin_users FOR SELECT USING (true);

-- Create initial admin user
INSERT INTO public.admin_users (email, role)
VALUES ('vinomaddy2711@gmail.com', 'superadmin')
ON CONFLICT (email) DO NOTHING;

-- B) Create the SuperAdmin auth.users login
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
