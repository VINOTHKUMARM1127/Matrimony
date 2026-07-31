-- =====================================================================================
-- MESSAGE DELIVERY STATUS — Persistent delivered_at for monotonic tick progression
--
-- Problem: tick status was derived from live user_presence at render time, causing
-- backward flips (double tick → single tick when the recipient backgrounds the app).
--
-- Solution: Persist delivered_at once, never unset it. Tick logic becomes:
--   NULL delivered_at, not is_read  → single tick  (sent)
--   delivered_at set, not is_read   → grey double tick (delivered)
--   is_read                         → blue double tick (read)
--
-- 1. Add delivered_at column to messages
-- 2. Extend trg_fn_after_message_insert to set delivered_at at insert time
--    if recipient has a fresh presence row
-- 3. Create fn_upsert_user_presence_and_backfill RPC that the heartbeat calls
--    instead of a raw upsert — backfills delivered_at for offline-received messages
-- 4. Partial index for cheap backfill queries
-- =====================================================================================

-- 1. Add delivered_at column (nullable — existing messages get NULL, shown as single tick)
alter table public.messages add column if not exists delivered_at timestamptz;

-- 2. Partial index for the backfill query (only undelivered messages matter)
create index if not exists idx_messages_undelivered
  on public.messages (chat_id, sender_id)
  where delivered_at is null;

-- 3. Extend the after-insert trigger to set delivered_at immediately when possible
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
  v_is_recipient_present boolean := false;
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

  -- Determine the other participant
  select case when participant_1 = NEW.sender_id then participant_2 else participant_1 end
  into v_other_user
  from public.chats where id = NEW.chat_id;

  -- ── Delivery status: check if recipient is online (app-wide or in this chat) ──
  -- Check chat_presence first (more specific: viewing this exact chat)
  select exists(
    select 1 from public.chat_presence
    where chat_id = NEW.chat_id
      and user_id = v_other_user
      and last_active_at > now() - interval '30 seconds'
  ) into v_is_recipient_active;

  -- Also check app-wide user_presence
  if not v_is_recipient_active then
    select exists(
      select 1 from public.user_presence
      where user_id = v_other_user
        and last_active_at > now() - interval '30 seconds'
    ) into v_is_recipient_present;
  end if;

  -- If recipient is online anywhere, mark as delivered immediately
  if v_is_recipient_active or v_is_recipient_present then
    update public.messages set delivered_at = now() where id = NEW.id;
  end if;

  -- ── Push Notification ──
  select created_at into v_last_notif_time
  from notifications
  where user_id = v_other_user and type = 'new_message' and data->>'entity_id' = NEW.chat_id::text
  order by created_at desc limit 1;

  if v_last_notif_time is null or v_last_notif_time < now() - interval '5 minutes' then
    select full_name into v_sender_name from profiles where id = NEW.sender_id;

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

-- 4. RPC that combines the heartbeat upsert with delivery backfill.
--    Called by the client's PresenceHeartbeat every 15s instead of a raw upsert.
--    The backfill is very cheap: partial index-backed, typically 0 rows affected.
create or replace function public.fn_upsert_user_presence_and_backfill(p_user_id uuid)
returns void
language plpgsql
security definer
set search_path = public
as $$
begin
  -- 1. Upsert presence (same as the raw table upsert the client used to do)
  insert into public.user_presence (user_id, last_active_at)
  values (p_user_id, now())
  on conflict (user_id)
  do update set last_active_at = now();

  -- 2. Backfill delivered_at for any messages received while this user was offline.
  --    Only touches rows where delivered_at IS NULL and sender is not this user,
  --    scoped to chats this user participates in. Uses the partial index
  --    idx_messages_undelivered for cheap lookups.
  update public.messages m
  set delivered_at = now()
  where m.delivered_at is null
    and m.sender_id <> p_user_id
    and m.chat_id in (
      select id from public.chats
      where participant_1 = p_user_id or participant_2 = p_user_id
    );
end;
$$;

grant execute on function public.fn_upsert_user_presence_and_backfill(uuid) to authenticated;
