// razorpay-create-order
// Called by the mobile app when a user taps "Buy" on a membership plan.
// Creates a Razorpay order and a matching `payments` row (status='pending').
// The actual plan activation happens later, in razorpay-webhook, once Razorpay
// confirms the payment server-to-server — never trust the client's "success" callback
// alone for activation.
//
// Required secrets (set via `supabase secrets set`):
//   RAZORPAY_KEY_ID, RAZORPAY_KEY_SECRET
//   SUPABASE_URL, SUPABASE_SERVICE_ROLE_KEY  (auto-provided by Supabase)

import { serve } from "https://deno.land/std@0.190.0/http/server.ts";
import { createClient } from "https://esm.sh/@supabase/supabase-js@2";
import { corsHeaders, withCors } from "../_shared/cors.ts";

const RAZORPAY_KEY_ID = Deno.env.get("RAZORPAY_KEY_ID")!;
const RAZORPAY_KEY_SECRET = Deno.env.get("RAZORPAY_KEY_SECRET")!;
const SUPABASE_URL = Deno.env.get("SUPABASE_URL")!;
const SERVICE_ROLE_KEY = Deno.env.get("SUPABASE_SERVICE_ROLE_KEY")!;

serve(async (req) => {
  if (req.method === "OPTIONS") {
    return new Response("ok", { headers: corsHeaders });
  }

  try {
    const authHeader = req.headers.get("Authorization") ?? "";

    // Client scoped to the caller's JWT -> lets us safely resolve `auth.uid()`
    const userClient = createClient(SUPABASE_URL, SERVICE_ROLE_KEY, {
      global: { headers: { Authorization: authHeader } },
    });
    const { data: userData, error: userErr } = await userClient.auth.getUser();
    if (userErr || !userData?.user) {
      return withCors({ error: "Not authenticated" }, 401);
    }
    const userId = userData.user.id;

    const { plan_id } = await req.json();
    if (!plan_id) {
      return withCors({ error: "plan_id is required" }, 400);
    }

    // Service-role client for privileged reads/writes
    const admin = createClient(SUPABASE_URL, SERVICE_ROLE_KEY);

    const { data: plan, error: planErr } = await admin
      .from("membership_plans")
      .select("id, tier, name, price, duration_days")
      .eq("id", plan_id)
      .eq("is_active", true)
      .single();

    if (planErr || !plan) {
      return withCors({ error: "Plan not found or inactive" }, 404);
    }
    if (plan.tier === "free") {
      return withCors({ error: "The Free plan does not require payment" }, 400);
    }

    const amountPaise = Math.round(Number(plan.price) * 100);
    const receipt = `wedring_${userId.slice(0, 8)}_${Date.now()}`;

    const rpRes = await fetch("https://api.razorpay.com/v1/orders", {
      method: "POST",
      headers: {
        "Content-Type": "application/json",
        Authorization: "Basic " + btoa(`${RAZORPAY_KEY_ID}:${RAZORPAY_KEY_SECRET}`),
      },
      body: JSON.stringify({
        amount: amountPaise,
        currency: "INR",
        receipt,
        notes: { user_id: userId, plan_id: plan.id, plan_tier: plan.tier },
      }),
    });

    const rpOrder = await rpRes.json();
    if (!rpRes.ok) {
      return withCors({ error: "Razorpay order creation failed", details: rpOrder }, 502);
    }

    const { data: paymentRow, error: payErr } = await admin
      .from("payments")
      .insert({
        user_id: userId,
        plan_id: plan.id,
        razorpay_order_id: rpOrder.id,
        amount_paise: amountPaise,
        currency: "INR",
        status: "pending",
      })
      .select("id")
      .single();

    if (payErr) {
      return withCors({ error: "Failed to record payment", details: payErr.message }, 500);
    }

    return withCors({
      order_id: rpOrder.id,
      amount: amountPaise,
      currency: "INR",
      key_id: RAZORPAY_KEY_ID,
      payment_row_id: paymentRow.id,
      plan: { id: plan.id, name: plan.name, tier: plan.tier },
    });
  } catch (e) {
    return withCors({ error: (e as Error).message }, 500);
  }
});
