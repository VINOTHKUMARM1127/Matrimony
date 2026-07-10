import { serve } from "https://deno.land/std@0.190.0/http/server.ts";
import { createClient } from "https://esm.sh/@supabase/supabase-js@2";
import { corsHeaders, withCors } from "../_shared/cors.ts";

const RAZORPAY_KEY_SECRET = Deno.env.get("RAZORPAY_KEY_SECRET")!;
const SUPABASE_URL = Deno.env.get("SUPABASE_URL")!;
const SERVICE_ROLE_KEY = Deno.env.get("SUPABASE_SERVICE_ROLE_KEY")!;

async function hmacSha256Hex(secret: string, message: string): Promise<string> {
  const key = await crypto.subtle.importKey(
    "raw",
    new TextEncoder().encode(secret),
    { name: "HMAC", hash: "SHA-256" },
    false,
    ["sign"],
  );
  const sig = await crypto.subtle.sign("HMAC", key, new TextEncoder().encode(message));
  return Array.from(new Uint8Array(sig))
    .map((b) => b.toString(16).padStart(2, "0"))
    .join("");
}

serve(async (req) => {
  if (req.method === "OPTIONS") {
    return new Response("ok", { headers: corsHeaders });
  }

  try {
    const authHeader = req.headers.get("Authorization") ?? "";
    const userClient = createClient(SUPABASE_URL, SERVICE_ROLE_KEY, {
      global: { headers: { Authorization: authHeader } },
    });
    
    const { data: userData, error: userErr } = await userClient.auth.getUser();
    if (userErr || !userData?.user) {
      return withCors({ error: "Not authenticated" }, 401);
    }

    const { razorpay_order_id, razorpay_payment_id, razorpay_signature } = await req.json();

    if (!razorpay_order_id || !razorpay_payment_id || !razorpay_signature) {
      return withCors({ error: "Missing parameters" }, 400);
    }

    const expectedSignature = await hmacSha256Hex(
      RAZORPAY_KEY_SECRET,
      `${razorpay_order_id}|${razorpay_payment_id}`
    );

    if (expectedSignature !== razorpay_signature) {
      return withCors({ error: "Invalid signature" }, 400);
    }

    const admin = createClient(SUPABASE_URL, SERVICE_ROLE_KEY);

    const { data: paymentRow, error: findErr } = await admin
      .from("payments")
      .select("id, user_id, plan_id, amount_paise, status")
      .eq("razorpay_order_id", razorpay_order_id)
      .single();

    if (findErr || !paymentRow) {
      return withCors({ error: "Order not found" }, 404);
    }

    if (paymentRow.status === "success") {
      return withCors({ ok: true, already_processed: true });
    }

    await admin
      .from("payments")
      .update({
        razorpay_payment_id: razorpay_payment_id,
        razorpay_signature: razorpay_signature,
        status: "success",
        confirmed_at: new Date().toISOString(),
      })
      .eq("id", paymentRow.id);

    const { data: result, error: rpcErr } = await admin.rpc(
      "fn_activate_or_queue_subscription",
      {
        p_user_id: paymentRow.user_id,
        p_plan_id: paymentRow.plan_id,
        p_payment_id: paymentRow.id,
        p_amount_paid: paymentRow.amount_paise / 100,
      }
    );

    if (rpcErr) {
      console.error("razorpay-verify: activation RPC failed", rpcErr);
      return withCors({ error: rpcErr.message }, 500);
    }

    return withCors({ ok: true, subscription: result });

  } catch (e) {
    console.error("razorpay-verify error", e);
    return withCors({ error: (e as Error).message }, 500);
  }
});
