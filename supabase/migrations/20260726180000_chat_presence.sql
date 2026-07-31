-- Chat Presence + Server-Side Push Suppression
--
-- 1. chat_presence table — tracks which users are actively viewing which chats
-- 2. Updated fn_insert_notification — optional p_push_status parameter
-- 3. Updated trg_fn_after_message_insert — checks presence before pushing
--    (corrected to match the LIVE trigger's data keys: 'entity_id', not 'chat_id',
--     and preserves the 'message_id' field the live version already stores)

-- =====================================================================================
-- 1. chat_presence table
-- =====================================================================================

create table public.chat_presence (
  chat_id        uuid not null references chats(id) on delete cascade,
  user_id        uuid not null references profiles(id) on delete cascade,
  last_active_at timestamptz not null default now(),
  primary key (chat_id, user_id)
);

alter table public.chat_presence enable row level security;

create policy chat_presence_insert on public.chat_presence
  for insert with check (auth.uid() = user_id);

create policy chat_presence_update on public.chat_presence
  for update using (auth.uid() = user_id);

create policy chat_presence_delete on public.chat_presence
  for delete using (auth.uid() = user_id);

create policy chat_presence_service_role on public.chat_presence
  for all to service_role using (true) with check (true);


-- =====================================================================================
-- 2. Updated fn_insert_notification — optional p_push_status parameter
-- =====================================================================================

create or replace function public.fn_insert_notification(
  p_user_id uuid,
  p_type notification_type_enum,
  p_title text,
  p_body text,
  p_data jsonb default '{}',
  p_push_status text default 'pending'
) returns uuid
language plpgsql
security definer
set search_path = public
as $$
declare
  v_id uuid;
begin
  insert into notifications (user_id, type, title, body, data, push_status)
  values (p_user_id, p_type, p_title, p_body, p_data, p_push_status)
  returning id into v_id;
  return v_id;
end;
$$;


-- =====================================================================================
-- 3. Updated trg_fn_after_message_insert — presence check before pushing
--    (keys match live: 'entity_id' for dedup, 'message_id' preserved in payload)
-- =====================================================================================

create or replace function public.trg_fn_after_message_insert()
returns trigger
language plpgsql
security definer
set search_path = public
as $$
declare
  v_cap int;
  v_count int;
  v_other_user uuid;
  v_sender_name text;
  v_last_notif_time timestamptz;
  v_is_recipient_active boolean := false;
begin
  select value into v_cap from public.chat_config where key = 'message_cap';
  if v_cap is null then v_cap := 25; end if;

  update public.chats
  set message_count = message_count + 1, last_message_text = NEW.content, last_message_at = NEW.created_at
  where id = NEW.chat_id returning message_count into v_count;

  if v_count > v_cap then
    delete from public.messages
    where id in (
      select id from public.messages where chat_id = NEW.chat_id order by created_at asc limit (v_count - v_cap)
    );
    update public.chats set message_count = v_cap where id = NEW.chat_id;
  end if;

  -- Push Notification
  select case when participant_1 = NEW.sender_id then participant_2 else participant_1 end
  into v_other_user
  from public.chats where id = NEW.chat_id;

  select created_at into v_last_notif_time
  from notifications
  where user_id = v_other_user and type = 'new_message' and data->>'entity_id' = NEW.chat_id::text
  order by created_at desc limit 1;

  if v_last_notif_time is null or v_last_notif_time < now() - interval '5 minutes' then
    select full_name into v_sender_name from profiles where id = NEW.sender_id;

    -- Check if recipient is actively viewing this chat (presence row < 30s old)
    select exists(
      select 1 from public.chat_presence
      where chat_id = NEW.chat_id
        and user_id = v_other_user
        and last_active_at > now() - interval '30 seconds'
    ) into v_is_recipient_active;

    perform fn_insert_notification(
      v_other_user,
      'new_message',
      'New Message from ' || v_sender_name,
      NEW.content,
      jsonb_build_object('screen', 'Chat', 'entity_id', NEW.chat_id, 'message_id', NEW.id),
      case when v_is_recipient_active then 'skipped' else 'pending' end
    );
  end if;

  return NEW;
end;
$$;