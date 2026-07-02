-- =====================================================================================
-- SUBSCRIPTION LIFECYCLE — closes the loop on subscription_queue / subscription_history,
-- which the original schema created but nothing ever populated or advanced.
-- Called from the razorpay-webhook Edge Function (service role only) and from a nightly
-- cron job respectively.
-- =====================================================================================

-- ---- called by razorpay-webhook right after a payment is marked 'success' -----------
-- If the user has no active paid plan (still on Free, or their last plan expired),
-- the purchase activates immediately. If they already have a live paid plan, the new
-- one is queued and will kick in automatically when the current one expires.
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
  v_should_activate boolean := false;
  v_next_position int;
begin
  select * into v_current from user_subscriptions where user_id = p_user_id for update;

  if v_current.id is null then
    v_should_activate := true;
  else
    select tier into v_current_tier from membership_plans where id = v_current.plan_id;
    if v_current_tier = 'free'
       or v_current.is_active = false
       or (v_current.expires_at is not null and v_current.expires_at <= now())
    then
      v_should_activate := true;
    end if;
  end if;

  if v_should_activate then
    if v_current.id is null then
      insert into user_subscriptions (user_id, plan_id, contact_credits_remaining, interest_credits_remaining, starts_at, expires_at, is_active)
      select p_user_id, mp.id, mp.contact_credits, mp.interest_credits, now(),
             case when mp.duration_days is null then null else now() + (mp.duration_days || ' days')::interval end,
             true
      from membership_plans mp where mp.id = p_plan_id;
    else
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
    end if;

    insert into subscription_history (user_id, plan_id, amount_paid, started_at, expired_at, reason)
    values (p_user_id, p_plan_id, p_amount_paid, now(), null, 'purchased');

    return 'activated';
  else
    select coalesce(max(position), 0) + 1 into v_next_position
    from subscription_queue where user_id = p_user_id;

    insert into subscription_queue (user_id, plan_id, payment_id, position, amount_paid)
    values (p_user_id, p_plan_id, p_payment_id, v_next_position, p_amount_paid);

    return 'queued';
  end if;
end;
$$;

revoke execute on function public.fn_activate_or_queue_subscription(uuid, uuid, uuid, numeric) from public;
grant execute on function public.fn_activate_or_queue_subscription(uuid, uuid, uuid, numeric) to service_role;

-- ---- nightly sweep: expire lapsed plans and promote the next queued plan, if any ----
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
          contact_credits_remaining = mp.contact_credits,
          interest_credits_remaining = mp.interest_credits,
          starts_at = now(),
          expires_at = case when mp.duration_days is null then null else now() + (mp.duration_days || ' days')::interval end,
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

revoke execute on function public.fn_expire_and_advance_subscriptions() from public;
grant execute on function public.fn_expire_and_advance_subscriptions() to service_role;
