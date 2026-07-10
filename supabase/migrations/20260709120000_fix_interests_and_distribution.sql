-- =====================================================================================
-- Fix Interests & Distribution Bugs
-- 1. Prevent multiple interests to the same user (stops credit draining)
-- 2. Remove profiles from distributed_profiles on interest / pass (hides from Matches)
-- =====================================================================================

-- ---- send interest ------------------------------------------------------------------
create or replace function public.fn_send_interest(p_receiver_id uuid)
returns uuid
language plpgsql
security definer
set search_path = public
as $$
declare
  v_user uuid := auth.uid();
  v_remaining int;
  v_interest_id uuid;
  v_existing_status text;
begin
  if v_user is null then
    raise exception 'Not authenticated';
  end if;
  if v_user = p_receiver_id then
    raise exception 'Cannot send interest to yourself';
  end if;

  -- 1. Check for existing interest BEFORE deducting credits to prevent duplicate drain
  select status into v_existing_status from interests where sender_id = v_user and receiver_id = p_receiver_id;
  if v_existing_status is not null then
    raise exception 'Interest already %', v_existing_status;
  end if;

  -- 2. Deduct credits
  select interest_credits_remaining into v_remaining
  from user_subscriptions where user_id = v_user and is_active = true
  for update;

  if v_remaining is null or v_remaining < 1 then
    raise exception 'Insufficient interest credits or no active premium plan';
  end if;

  update user_subscriptions
  set interest_credits_remaining = interest_credits_remaining - 1, updated_at = now()
  where user_id = v_user and is_active = true;

  insert into interest_credit_transactions (user_id, target_user_id, credits_used)
  values (v_user, p_receiver_id, 1);

  -- 3. Record interest
  insert into interests (sender_id, receiver_id, status)
  values (v_user, p_receiver_id, 'sent')
  returning id into v_interest_id;

  -- 4. CRITICAL FIX: Remove from distributed profiles so they don't reappear in Matches
  delete from distributed_profiles where user_id = v_user and profile_id = p_receiver_id;

  return v_interest_id;
end;
$$;


-- ---- mark not interested ------------------------------------------------------------
create or replace function public.fn_mark_not_interested(p_target_user_id uuid)
returns void
language plpgsql
security definer
set search_path = public
as $$
declare
  v_user uuid := auth.uid();
begin
  -- 1. Record pass
  insert into not_interested (user_id, target_user_id)
  values (v_user, p_target_user_id)
  on conflict (user_id, target_user_id) do nothing;

  -- 2. CRITICAL FIX: Remove from distributed profiles so they don't reappear in Matches
  delete from distributed_profiles where user_id = v_user and profile_id = p_target_user_id;
end;
$$;
