-- Run this script in your Supabase Dashboard SQL Editor.
-- It will automatically backfill a unique dummy phone number for any user who doesn't have one yet.

insert into profile_contact (user_id, mobile_number, updated_at)
select 
  p.id, 
  '+9198' || lpad(floor(random() * 99999999)::int::text, 8, '0'),
  now()
from profiles p
left join profile_contact pc on pc.user_id = p.id
where pc.user_id is null
on conflict (user_id) do nothing;
