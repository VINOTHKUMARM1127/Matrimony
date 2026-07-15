
-- Update user_horoscope RLS to use the open visibility rule: owner, admin, distributed-to-you, or already-interacted-with
drop policy if exists user_horoscope_select on user_horoscope;
create policy user_horoscope_select on user_horoscope for select using (
    auth.uid() = user_id 
    or is_admin() 
    or exists (select 1 from distributed_profiles dp where dp.user_id = auth.uid() and dp.profile_id = user_horoscope.user_id)
    or exists (select 1 from interests i where (i.sender_id = auth.uid() and i.receiver_id = user_horoscope.user_id) or (i.receiver_id = auth.uid() and i.sender_id = user_horoscope.user_id))
);
