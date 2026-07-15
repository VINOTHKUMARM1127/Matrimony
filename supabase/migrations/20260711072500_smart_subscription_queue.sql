-- =====================================================================================
-- SMART SUBSCRIPTION QUEUE (RENEWALS, UPGRADES, DOWNGRADES)
-- Adds remaining state to subscription_queue and updates lifecycle functions
-- =====================================================================================

begin;

-- 1. Add remaining state columns to subscription_queue so paused plans don't lose value
alter table public.subscription_queue 
  add column if not exists remaining_days int,
  add column if not exists remaining_contact_credits int,
  add column if not exists remaining_interest_credits int;

-- 2. Update fn_activate_or_queue_subscription to handle the 3 logic paths
create or replace function public.fn_activate_or_queue_subscription(
  p_user_id uuid,
  p_plan_id uuid,
  p_payment_id uuid default null,
  p_amount_paid numeric default null
) returns text  -- 'activated' | 'queued'
language plpgsql
security definer
set search_path = public
as $$
declare
  v_current user_subscriptions%rowtype;
  v_current_tier membership_tier_enum;
  v_new_tier membership_tier_enum;
  v_next_position int;
begin
  select * into v_current from user_subscriptions where user_id = p_user_id for update;
  select tier into v_new_tier from membership_plans where id = p_plan_id;

  if v_current.id is null then
    -- No previous subscription at all
    insert into user_subscriptions (user_id, plan_id, contact_credits_remaining, interest_credits_remaining, starts_at, expires_at, is_active)
    select p_user_id, mp.id, mp.contact_credits, mp.interest_credits, now(),
           case when mp.duration_days is null then null else now() + (mp.duration_days || ' days')::interval end,
           true
    from membership_plans mp where mp.id = p_plan_id;

    insert into subscription_history (user_id, plan_id, amount_paid, started_at, expired_at, reason)
    values (p_user_id, p_plan_id, p_amount_paid, now(), null, 'purchased');
    
    return 'activated';
  end if;

  select tier into v_current_tier from membership_plans where id = v_current.plan_id;

  if v_current_tier = 'free' or v_current.is_active = false or (v_current.expires_at is not null and v_current.expires_at <= now()) then
    -- Current plan is free or expired. Activate immediately.
    update user_subscriptions us
    set plan_id = mp.id,
        contact_credits_remaining = mp.contact_credits,
        interest_credits_remaining = mp.interest_credits,
        starts_at = now(),
        expires_at = case when mp.duration_days is null then null else now() + (mp.duration_days || ' days')::interval end,
        is_active = true,
        updated_at = now()
    from membership_plans mp
    where us.id = v_current.id and mp.id = p_plan_id;

    insert into subscription_history (user_id, plan_id, amount_paid, started_at, expired_at, reason)
    values (p_user_id, p_plan_id, p_amount_paid, now(), null, 'purchased');

    return 'activated';
  end if;

  -- User has an ACTIVE, NON-FREE plan. Let's compare tiers.
  if v_new_tier = v_current_tier then
    -- SCENARIO: Renewal (same tier)
    -- Extend expires_at and add credits immediately
    update user_subscriptions us
    set expires_at = case when mp.duration_days is null then null else coalesce(us.expires_at, now()) + (mp.duration_days || ' days')::interval end,
        contact_credits_remaining = us.contact_credits_remaining + mp.contact_credits,
        interest_credits_remaining = us.interest_credits_remaining + mp.interest_credits,
        updated_at = now()
    from membership_plans mp
    where us.id = v_current.id and mp.id = p_plan_id;

    insert into subscription_history (user_id, plan_id, amount_paid, started_at, expired_at, reason)
    values (p_user_id, p_plan_id, p_amount_paid, now(), null, 'renewal_extended');

    return 'activated';

  elsif v_new_tier > v_current_tier then
    -- SCENARIO: Upgrade (e.g. Silver to Gold)
    -- Pause current plan in queue
    select coalesce(max(position), 0) + 1 into v_next_position from subscription_queue where user_id = p_user_id;

    insert into subscription_queue (
      user_id, plan_id, payment_id, position, amount_paid, 
      remaining_days, remaining_contact_credits, remaining_interest_credits
    )
    values (
      p_user_id, v_current.plan_id, null, v_next_position, 0,
      case when v_current.expires_at is null then null else greatest(0, extract(epoch from (v_current.expires_at - now())) / 86400)::int end,
      v_current.contact_credits_remaining, 
      v_current.interest_credits_remaining
    );

    -- Activate new plan immediately
    update user_subscriptions us
    set plan_id = mp.id,
        contact_credits_remaining = mp.contact_credits,
        interest_credits_remaining = mp.interest_credits,
        starts_at = now(),
        expires_at = case when mp.duration_days is null then null else now() + (mp.duration_days || ' days')::interval end,
        is_active = true,
        updated_at = now()
    from membership_plans mp
    where us.id = v_current.id and mp.id = p_plan_id;

    insert into subscription_history (user_id, plan_id, amount_paid, started_at, expired_at, reason)
    values (p_user_id, p_plan_id, p_amount_paid, now(), null, 'upgraded');

    return 'activated';

  else
    -- SCENARIO: Downgrade (e.g. Gold to Silver)
    -- Queue new plan for later
    select coalesce(max(position), 0) + 1 into v_next_position from subscription_queue where user_id = p_user_id;

    insert into subscription_queue (user_id, plan_id, payment_id, position, amount_paid)
    values (p_user_id, p_plan_id, p_payment_id, v_next_position, p_amount_paid);

    return 'queued';
  end if;

end;
$$;

-- 3. Update fn_expire_and_advance_subscriptions to restore preserved state from queue
create or replace function public.fn_expire_and_advance_subscriptions()
returns int
language plpgsql
security definer
set search_path = public
as $$
declare
  r record;
  v_next subscription_queue%rowtype;
  v_free_plan_id uuid;
  v_expired_count int := 0;
begin
  select id into v_free_plan_id from membership_plans where tier = 'free' and is_active = true limit 1;

  for r in
    select * from user_subscriptions
    where is_active = true and expires_at is not null and expires_at <= now()
  loop
    insert into subscription_history (user_id, plan_id, amount_paid, started_at, expired_at, reason)
    values (r.user_id, r.plan_id, null, r.starts_at, now(), 'expired');

    v_expired_count := v_expired_count + 1;

    select * into v_next from subscription_queue
    where user_id = r.user_id
    order by position asc
    limit 1;

    if v_next.id is not null then
      update user_subscriptions us
      set plan_id = mp.id,
          contact_credits_remaining = coalesce(v_next.remaining_contact_credits, mp.contact_credits),
          interest_credits_remaining = coalesce(v_next.remaining_interest_credits, mp.interest_credits),
          starts_at = now(),
          expires_at = case 
            when v_next.remaining_days is not null then now() + (v_next.remaining_days || ' days')::interval
            when mp.duration_days is null then null 
            else now() + (mp.duration_days || ' days')::interval 
          end,
          is_active = true,
          updated_at = now()
      from membership_plans mp
      where us.id = r.id and mp.id = v_next.plan_id;

      insert into subscription_history (user_id, plan_id, amount_paid, started_at, expired_at, reason)
      values (v_next.user_id, v_next.plan_id, v_next.amount_paid, now(), null, 'activated_from_queue');

      delete from subscription_queue where id = v_next.id;

      update subscription_queue
      set position = position - 1
      where user_id = r.user_id and position > v_next.position;

    elsif v_free_plan_id is not null then
      update user_subscriptions
      set plan_id = v_free_plan_id,
          contact_credits_remaining = 0,
          interest_credits_remaining = 0,
          starts_at = now(),
          expires_at = null,
          is_active = true,
          updated_at = now()
      where id = r.id;
    else
      update user_subscriptions set is_active = false, updated_at = now() where id = r.id;
    end if;
  end loop;

  return v_expired_count;
end;
$$;

commit;
