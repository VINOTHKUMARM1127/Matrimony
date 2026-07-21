-- Fix check_user_exists to:
--   1. Drop and recreate because return type changes from boolean -> text
--      (Postgres won't allow CREATE OR REPLACE to change return type).
--   2. Check phone against profile_contact.mobile_number (the real source of truth),
--      NOT auth.users.phone (which is almost always empty).
--   3. Return 'email', 'phone', 'both', or 'none' instead of a boolean,
--      so the frontend can show field-specific error messages.

drop function if exists public.check_user_exists(text, text);

create or replace function public.check_user_exists(p_email text, p_phone text)
returns text
language plpgsql
security definer
stable
set search_path = public
as $$
declare
  v_email_taken boolean := false;
  v_phone_taken boolean := false;
begin
  -- Check email against auth.users (this column is reliably populated)
  if p_email <> '' then
    v_email_taken := exists (
      select 1 from auth.users where email = p_email
    );
  end if;

  -- Check phone against profile_contact.mobile_number (the real source of truth).
  -- Normalize: compare last 10 digits only, so +919876543210 matches 9876543210.
  if p_phone <> '' then
    v_phone_taken := exists (
      select 1 from profile_contact
      where right(regexp_replace(mobile_number, '[^0-9]', '', 'g'), 10)
          = right(regexp_replace(p_phone, '[^0-9]', '', 'g'), 10)
    );
  end if;

  if v_email_taken and v_phone_taken then
    return 'both';
  elsif v_email_taken then
    return 'email';
  elsif v_phone_taken then
    return 'phone';
  else
    return 'none';
  end if;
end;
$$;