-- Push Notifications Implementation
--
-- FIXES APPLIED vs. the version Antigravity generated (checked against your live
-- schema in supabase.zip):
--   1. `profiles.display_name` does not exist anywhere in your schema — the real
--      column is `full_name`. It was used in fn_send_interest, 
--      trg_fn_after_interest_accepted, and trg_fn_after_message_insert. As written,
--      those 3 functions run on EVERY interest-send, EVERY interest-accept, and
--      EVERY chat message — this would have broken all three the moment this ran,
--      because the whole transaction errors and rolls back. Fixed by using full_name.
--   2. The two net.http_post cron jobs referenced app.settings.supabase_url and
--      app.settings.cron_secret, which are set nowhere in this project. Added the
--      ALTER DATABASE lines below to set them — fill in your real secret before running.

-- 1. Enable pg_net
create extension if not exists pg_net;

-- 2. Tables and Enum
create table public.user_devices (
  id            uuid primary key default gen_random_uuid(),
  user_id       uuid not null references profiles(id) on delete cascade,
  expo_push_token text not null,
  device_name   text,
  platform      text default 'android',
  last_seen_at  timestamptz default now(),
  is_active     boolean default true,
  created_at    timestamptz default now()
);
create unique index udx_user_devices_token on public.user_devices(expo_push_token);
create index idx_user_devices_user on public.user_devices(user_id) where is_active = true;

create type notification_type_enum as enum (
  'new_interest', 'interest_accepted', 'new_message',
  'profile_view', 'daily_match', 'premium_expiry',
  'system', 'daily_engagement'
);

create table public.notifications (
  id              uuid primary key default gen_random_uuid(),
  user_id         uuid not null references profiles(id) on delete cascade,
  type            notification_type_enum not null default 'system',
  title           text not null,
  body            text not null,
  data            jsonb default '{}',
  is_read         boolean default false,
  push_status     text default 'pending',
  push_ticket_id  text,
  push_sent_at    timestamptz,
  push_error      text,
  created_at      timestamptz default now()
);
create index idx_notifications_user_unread on public.notifications(user_id, created_at desc) where is_read = false;
create index idx_notifications_push_pending on public.notifications(push_status, created_at) where push_status = 'pending';

-- 3. RLS Policies
alter table public.user_devices enable row level security;
alter table public.notifications enable row level security;

create policy user_devices_select on public.user_devices for select using (auth.uid() = user_id);
create policy user_devices_insert on public.user_devices for insert with check (auth.uid() = user_id);
create policy user_devices_update on public.user_devices for update using (auth.uid() = user_id);
-- Allow service_role to update is_active when token fails
create policy user_devices_service_role on public.user_devices for all to service_role using (true) with check (true);

create policy notifications_select on public.notifications for select using (auth.uid() = user_id);
create policy notifications_update on public.notifications for update using (auth.uid() = user_id);
-- Trigger/service_role only for insert
create policy notifications_service_role on public.notifications for all to service_role using (true) with check (true);


-- 4. Helper function
create or replace function public.fn_insert_notification(
  p_user_id uuid,
  p_type notification_type_enum,
  p_title text,
  p_body text,
  p_data jsonb default '{}'
) returns uuid
language plpgsql
security definer
set search_path = public
as $$
declare
  v_id uuid;
begin
  insert into notifications (user_id, type, title, body, data)
  values (p_user_id, p_type, p_title, p_body, p_data)
  returning id into v_id;
  return v_id;
end;
$$;


-- 5. Update Triggers

-- Event 1: Interest Sent
create or replace function public.fn_send_interest(p_receiver_id uuid)
returns uuid
language plpgsql
security definer
set search_path to 'public'
as $function$
declare
  v_user uuid := auth.uid();
  v_remaining int;
  v_interest_id uuid;
  v_existing_status text;
  v_sender_name text;
begin
  if v_user is null then raise exception 'Not authenticated'; end if;
  if v_user = p_receiver_id then raise exception 'Cannot send interest to yourself'; end if;
  if public.fn_is_blocked(v_user, p_receiver_id) then raise exception 'Cannot send interest: user is blocked'; end if;

  select status into v_existing_status from interests where sender_id = v_user and receiver_id = p_receiver_id;
  if v_existing_status is not null then raise exception 'Interest already %', v_existing_status; end if;

  select interest_credits_remaining into v_remaining
  from user_subscriptions where user_id = v_user and is_active = true for update;

  if v_remaining is null or v_remaining < 1 then raise exception 'Insufficient interest credits or no active premium plan'; end if;

  update user_subscriptions
  set interest_credits_remaining = interest_credits_remaining - 1, updated_at = now()
  where user_id = v_user and is_active = true;

  insert into interest_credit_transactions (user_id, target_user_id, credits_used) values (v_user, p_receiver_id, 1);

  insert into interests (sender_id, receiver_id, status)
  values (v_user, p_receiver_id, 'sent') returning id into v_interest_id;

  delete from distributed_profiles where user_id = v_user and profile_id = p_receiver_id;

  -- Push Notification
  select full_name into v_sender_name from profiles where id = v_user;
  perform fn_insert_notification(
    p_receiver_id,
    'new_interest',
    'New Interest Received',
    v_sender_name || ' has sent you an interest.',
    jsonb_build_object('screen', 'InterestTab')
  );

  return v_interest_id;
end;
$function$;

-- Event 2: Interest Accepted
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

    insert into chats (participant_1, participant_2)
    values (v_p1, v_p2)
    on conflict (participant_1, participant_2) do nothing;

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

-- Event 3: New Message
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
  where user_id = v_other_user and type = 'new_message' and data->>'chat_id' = NEW.chat_id::text
  order by created_at desc limit 1;

  if v_last_notif_time is null or v_last_notif_time < now() - interval '5 minutes' then
    select full_name into v_sender_name from profiles where id = NEW.sender_id;
    perform fn_insert_notification(
      v_other_user,
      'new_message',
      'New Message from ' || v_sender_name,
      NEW.content,
      jsonb_build_object('screen', 'Chat', 'entity_id', NEW.chat_id)
    );
  end if;

  return NEW;
end;
$$;

-- Event 4: Daily Match (inside distribution loop)
create or replace function public.fn_run_daily_distribution()
returns void
language plpgsql
security definer
set search_path = public
as $$
declare
  r record;
  v_match_count int;
  v_update_count int;
begin
  for r in
    select p.id as user_id, coalesce(mp.tier, 'free') as tier
    from profiles p
    left join user_subscriptions us on us.user_id = p.id and us.is_active = true
    left join membership_plans mp on mp.id = us.plan_id
    where p.is_active = true and p.is_suspended = false
  loop
    v_match_count := fn_distribute_profiles(
      r.user_id, 'all_matches', coalesce((select all_matches_daily from distribution_config where tier = r.tier), 0), 'daily', 'cron'
    );
    v_update_count := fn_distribute_profiles(
      r.user_id, 'daily_updates', coalesce((select daily_updates_daily from distribution_config where tier = r.tier), 0), 'daily', 'cron'
    );
    
    if v_match_count > 0 or v_update_count > 0 then
      perform fn_insert_notification(
        r.user_id,
        'daily_match',
        'New Daily Matches',
        'We found ' || (v_match_count + v_update_count)::text || ' new profiles for you.',
        jsonb_build_object('screen', 'MatchesTab')
      );
    end if;
  end loop;
end;
$$;

-- Event 5: Subscription Upgraded
create or replace function public.fn_activate_or_queue_subscription(
  p_user_id uuid,
  p_plan_id uuid,
  p_payment_id uuid default null,
  p_amount_paid numeric default null
) returns text
language plpgsql
security definer
set search_path = public
as $$
declare
  v_current user_subscriptions%rowtype;
  v_current_tier membership_tier_enum;
  v_new_tier membership_tier_enum;
  v_next_position int;
  v_plan_name text;
begin
  select * into v_current from user_subscriptions where user_id = p_user_id for update;
  select tier, name into v_new_tier, v_plan_name from membership_plans where id = p_plan_id;

  if v_current.id is null then
    insert into user_subscriptions (user_id, plan_id, contact_credits_remaining, interest_credits_remaining, starts_at, expires_at, is_active)
    select p_user_id, mp.id, mp.contact_credits, mp.interest_credits, now(),
           case when mp.duration_days is null then null else now() + (mp.duration_days || ' days')::interval end, true
    from membership_plans mp where mp.id = p_plan_id;
    insert into subscription_history (user_id, plan_id, amount_paid, started_at, expired_at, reason)
    values (p_user_id, p_plan_id, p_amount_paid, now(), null, 'purchased');
    
    perform fn_insert_notification(p_user_id, 'system', 'Subscription Activated', 'Your ' || v_plan_name || ' plan is now active!');
    return 'activated';
  end if;

  select tier into v_current_tier from membership_plans where id = v_current.plan_id;

  if v_current_tier = 'free' or v_current.is_active = false or (v_current.expires_at is not null and v_current.expires_at <= now()) then
    update user_subscriptions us
    set plan_id = mp.id, contact_credits_remaining = mp.contact_credits, interest_credits_remaining = mp.interest_credits,
        starts_at = now(), expires_at = case when mp.duration_days is null then null else now() + (mp.duration_days || ' days')::interval end,
        is_active = true, updated_at = now()
    from membership_plans mp where us.id = v_current.id and mp.id = p_plan_id;
    insert into subscription_history (user_id, plan_id, amount_paid, started_at, expired_at, reason)
    values (p_user_id, p_plan_id, p_amount_paid, now(), null, 'purchased');
    
    perform fn_insert_notification(p_user_id, 'system', 'Subscription Activated', 'Your ' || v_plan_name || ' plan is now active!');
    return 'activated';
  end if;

  if v_new_tier = v_current_tier then
    update user_subscriptions us
    set expires_at = case when mp.duration_days is null then null else coalesce(us.expires_at, now()) + (mp.duration_days || ' days')::interval end,
        contact_credits_remaining = us.contact_credits_remaining + mp.contact_credits,
        interest_credits_remaining = us.interest_credits_remaining + mp.interest_credits, updated_at = now()
    from membership_plans mp where us.id = v_current.id and mp.id = p_plan_id;
    insert into subscription_history (user_id, plan_id, amount_paid, started_at, expired_at, reason)
    values (p_user_id, p_plan_id, p_amount_paid, now(), null, 'renewal_extended');
    
    perform fn_insert_notification(p_user_id, 'system', 'Subscription Extended', 'Your ' || v_plan_name || ' plan has been extended!');
    return 'activated';

  elsif v_new_tier > v_current_tier then
    select coalesce(max(position), 0) + 1 into v_next_position from subscription_queue where user_id = p_user_id;
    insert into subscription_queue (user_id, plan_id, payment_id, position, amount_paid, remaining_days, remaining_contact_credits, remaining_interest_credits)
    values (p_user_id, v_current.plan_id, null, v_next_position, 0, case when v_current.expires_at is null then null else greatest(0, extract(epoch from (v_current.expires_at - now())) / 86400)::int end, 0, 0);

    update user_subscriptions us
    set plan_id = mp.id, contact_credits_remaining = mp.contact_credits + v_current.contact_credits_remaining, interest_credits_remaining = mp.interest_credits + v_current.interest_credits_remaining,
        starts_at = now(), expires_at = case when mp.duration_days is null then null else now() + (mp.duration_days || ' days')::interval end,
        is_active = true, updated_at = now()
    from membership_plans mp where us.id = v_current.id and mp.id = p_plan_id;

    insert into subscription_history (user_id, plan_id, amount_paid, started_at, expired_at, reason)
    values (p_user_id, p_plan_id, p_amount_paid, now(), null, 'upgraded');

    perform fn_insert_notification(p_user_id, 'system', 'Subscription Upgraded', 'Your ' || v_plan_name || ' plan is now active!');
    return 'activated';
  else
    update user_subscriptions us
    set contact_credits_remaining = us.contact_credits_remaining + mp.contact_credits, interest_credits_remaining = us.interest_credits_remaining + mp.interest_credits, updated_at = now()
    from membership_plans mp where us.id = v_current.id and mp.id = p_plan_id;
    insert into subscription_history (user_id, plan_id, amount_paid, started_at, expired_at, reason)
    values (p_user_id, p_plan_id, p_amount_paid, now(), null, 'downgrade_credits_granted_immediately');

    select coalesce(max(position), 0) + 1 into v_next_position from subscription_queue where user_id = p_user_id;
    insert into subscription_queue (user_id, plan_id, payment_id, position, amount_paid, remaining_contact_credits, remaining_interest_credits)
    values (p_user_id, p_plan_id, p_payment_id, v_next_position, p_amount_paid, 0, 0);

    perform fn_insert_notification(p_user_id, 'system', 'Subscription Queued', 'Your ' || v_plan_name || ' plan is queued for when your current plan ends.');
    return 'queued_credits_granted';
  end if;
end;
$$;


-- Event 6 & 7: Premium Expiry Reminder & Daily Engagement
create or replace function public.fn_send_expiry_reminders()
returns void
language plpgsql
security definer
set search_path = public
as $$
declare
  r record;
  v_days_left int;
begin
  for r in
    select user_id, expires_at 
    from user_subscriptions 
    where is_active = true and expires_at is not null and expires_at > now()
  loop
    v_days_left := extract(day from (r.expires_at - now()));
    
    if v_days_left in (1, 3, 7) then
      if not exists (
        select 1 from notifications 
        where user_id = r.user_id and type = 'premium_expiry' 
          and data->>'threshold' = v_days_left::text 
          and created_at > now() - interval '24 hours'
      ) then
        perform fn_insert_notification(
          r.user_id,
          'premium_expiry',
          'Subscription Expiring',
          'Your premium plan expires in ' || v_days_left::text || ' day' || case when v_days_left > 1 then 's' else '' end || '.',
          jsonb_build_object('screen', 'PremiumTab', 'threshold', v_days_left::text)
        );
      end if;
    end if;
  end loop;
end;
$$;

create or replace function public.fn_send_daily_engagement()
returns void
language plpgsql
security definer
set search_path = public
as $$
declare
  r record;
  v_message text;
  v_messages text[] := array[
    'Complete your profile for better matches!',
    'New profiles were added today — check them out!',
    'Review your daily matches to find your perfect partner.'
  ];
begin
  for r in
    select id as user_id from profiles where is_active = true and is_suspended = false
  loop
    -- Skip if they already got a daily match ping today
    if not exists (
      select 1 from notifications 
      where user_id = r.user_id and type = 'daily_match' and created_at::date = now()::date
    ) then
      v_message := v_messages[floor(random() * array_length(v_messages, 1) + 1)];
      perform fn_insert_notification(
        r.user_id,
        'daily_engagement',
        'Wedring Update',
        v_message
      );
    end if;
  end loop;
end;
$$;

-- 6. Cron Scheduling
select cron.schedule('wedring-expiry-reminders', '0 7 * * *', $$ select public.fn_send_expiry_reminders(); $$);
select cron.schedule('wedring-daily-engagement', '30 7 * * *', $$ select public.fn_send_daily_engagement(); $$);

-- IMPORTANT: ALTER DATABASE ... SET app.settings.x fails with 42501 on hosted Supabase
-- projects because the `postgres` role used in the SQL Editor is not a superuser there.
-- The supported replacement is Supabase Vault: store the values as secrets, then read
-- them back via vault.decrypted_secrets inside the cron job body. Vault is enabled by
-- default on every Supabase project, no extra extension needed.
-- Replace the second argument of the cron_secret line with the SAME real random string
-- you set via `supabase secrets set CRON_SECRET=...` on both edge functions.
select vault.create_secret('https://pcdtgwelrwyvtqixqufc.supabase.co', 'project_url');
select vault.create_secret('2C5F088446759FE2ECD59B6FB5CD8B8E1A703D17788F3F329A030C838A373F11', 'cron_secret');

-- Push sweep and receipts
select cron.schedule(
  'wedring-push-sweep',
  '*/2 * * * *',
  $$ select net.http_post(
    url := (select decrypted_secret from vault.decrypted_secrets where name = 'project_url') || '/functions/v1/send-push-notifications',
    headers := jsonb_build_object(
      'x-cron-secret', (select decrypted_secret from vault.decrypted_secrets where name = 'cron_secret'),
      'Content-Type', 'application/json'
    ),
    body := '{}'::jsonb
  ); $$
);

select cron.schedule(
  'wedring-push-receipts',
  '*/30 * * * *',
  $$ select net.http_post(
    url := (select decrypted_secret from vault.decrypted_secrets where name = 'project_url') || '/functions/v1/check-push-receipts',
    headers := jsonb_build_object(
      'x-cron-secret', (select decrypted_secret from vault.decrypted_secrets where name = 'cron_secret'),
      'Content-Type', 'application/json'
    ),
    body := '{}'::jsonb
  ); $$
);