-- Migration: Add simulate_payment RPC for development testing
-- This securely calls the service_role protected fn_activate_or_queue_subscription

create or replace function public.fn_simulate_payment(p_plan_id uuid)
returns text
language plpgsql
security definer
set search_path = public
as $$
declare
  v_result text;
  v_price numeric;
begin
  -- Get the price of the plan to mock the amount_paid
  select price into v_price from membership_plans where id = p_plan_id;

  -- Call the internal activation function
  v_result := fn_activate_or_queue_subscription(
    auth.uid(),
    p_plan_id,
    null, -- p_payment_id
    coalesce(v_price, 0)
  );
  
  return v_result;
end;
$$;

-- Grant execute to authenticated users so the mobile app can call it
revoke execute on function public.fn_simulate_payment(uuid) from public;
grant execute on function public.fn_simulate_payment(uuid) to authenticated;
