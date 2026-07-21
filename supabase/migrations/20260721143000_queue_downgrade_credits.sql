-- =====================================================================================
-- SMART SUBSCRIPTION QUEUE - DOWNGRADE CREDITS
-- Modifies fn_activate_or_queue_subscription to grant credits immediately when a
-- user on a higher tier queues a lower tier (downgrade).
-- =====================================================================================

create or replace function public.fn_activate_or_queue_subscription(
  p_user_id uuid,
  p_plan_id uuid,
  p_payment_id uuid default null,
  p_amount_paid numeric default null
) returns text  -- 'activated' | 'queued' | 'queued_credits_granted'
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
    
    -- 1. Add credits to current active plan immediately
    update user_subscriptions us
    set contact_credits_remaining = us.contact_credits_remaining + mp.contact_credits,
        interest_credits_remaining = us.interest_credits_remaining + mp.interest_credits,
        updated_at = now()
    from membership_plans mp
    where us.id = v_current.id and mp.id = p_plan_id;

    -- 2. Insert one extra subscription_history row logging the immediate grant
    insert into subscription_history (user_id, plan_id, amount_paid, started_at, expired_at, reason)
    values (p_user_id, p_plan_id, p_amount_paid, now(), null, 'downgrade_credits_granted_immediately');

    -- 3. Queue new plan for later (explicitly setting credits to 0 so they aren't double granted)
    select coalesce(max(position), 0) + 1 into v_next_position from subscription_queue where user_id = p_user_id;

    insert into subscription_queue (
      user_id, plan_id, payment_id, position, amount_paid,
      remaining_contact_credits, remaining_interest_credits
    )
    values (
      p_user_id, p_plan_id, p_payment_id, v_next_position, p_amount_paid,
      0, 0
    );

    -- 4. Change return value to distinguish this branch
    return 'queued_credits_granted';
  end if;

end;
$$;
