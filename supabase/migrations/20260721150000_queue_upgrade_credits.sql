-- =====================================================================================
-- SMART SUBSCRIPTION QUEUE - UPGRADE CREDITS ROLLOVER
-- Modifies fn_activate_or_queue_subscription to roll over leftover credits from the 
-- old plan into the new plan immediately upon upgrade.
-- Also includes a one-time data correction for any users caught in the frozen state.
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
      0, -- Zero out banked credits so they don't double grant when resumed
      0  -- Zero out banked credits so they don't double grant when resumed
    );

    -- Activate new plan immediately and absorb old plan's leftover credits
    update user_subscriptions us
    set plan_id = mp.id,
        contact_credits_remaining = mp.contact_credits + v_current.contact_credits_remaining,
        interest_credits_remaining = mp.interest_credits + v_current.interest_credits_remaining,
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


-- =====================================================================================
-- FIX QUEUE PROMOTION TO PRESERVE EXISTING CREDITS
-- =====================================================================================

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
      -- Promote from queue: update tier and duration, but leave credit balances untouched!
      update user_subscriptions us
      set plan_id = mp.id,
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
      -- Fall through to Free: reset credits to 0
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


-- =====================================================================================
-- ONE-TIME DATA CORRECTION
-- Fixes existing users (like "aarthi") who upgraded before this fix, meaning their 
-- leftover credits got trapped in the queue instead of rolling over.
-- =====================================================================================
do $$
declare
  r record;
begin
  for r in (
    select q.id as queue_id, us.id as sub_id, q.remaining_contact_credits, q.remaining_interest_credits
    from subscription_queue q
    join user_subscriptions us on us.user_id = q.user_id and us.is_active = true
    where q.remaining_contact_credits > 0 or q.remaining_interest_credits > 0
  )
  loop
    -- Add the trapped banked credits to their current active plan
    update user_subscriptions
    set contact_credits_remaining = contact_credits_remaining + r.remaining_contact_credits,
        interest_credits_remaining = interest_credits_remaining + r.remaining_interest_credits
    where id = r.sub_id;

    -- Zero out the banked credits on the queue row so they don't double grant later
    update subscription_queue
    set remaining_contact_credits = 0,
        remaining_interest_credits = 0
    where id = r.queue_id;
  end loop;
end;
$$;
