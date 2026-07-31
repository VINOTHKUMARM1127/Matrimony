-- Fix trg_fn_after_interest_accepted to include interest_id and handle conflicts
create or replace function public.trg_fn_after_interest_accepted()
returns trigger
language plpgsql
security definer
set search_path = public
as $$
declare
  v_p1 uuid;
  v_p2 uuid;
  v_receiver_name text;
begin
  if new.status = 'accepted' and (old.status is null or old.status <> 'accepted') then
    if new.sender_id < new.receiver_id then
      v_p1 := new.sender_id;
      v_p2 := new.receiver_id;
    else
      v_p1 := new.receiver_id;
      v_p2 := new.sender_id;
    end if;

    insert into public.chats (participant_1, participant_2, interest_id)
    values (v_p1, v_p2, new.id)
    on conflict (participant_1, participant_2)
    do update set interest_id = new.id, is_active = true;

    -- Push Notification to sender
    select full_name into v_receiver_name from profiles where id = new.receiver_id;
    perform fn_insert_notification(
      new.sender_id,
      'interest_accepted',
      'Interest Accepted',
      v_receiver_name || ' accepted your interest!',
      jsonb_build_object('screen', 'InterestTab')
    );
  end if;

  return new;
end;
$$;

-- Repair existing broken chats
update public.chats c
set interest_id = i.id, is_active = true
from public.interests i
where i.status = 'accepted'
  and least(i.sender_id, i.receiver_id) = c.participant_1
  and greatest(i.sender_id, i.receiver_id) = c.participant_2
  and c.interest_id is null;
