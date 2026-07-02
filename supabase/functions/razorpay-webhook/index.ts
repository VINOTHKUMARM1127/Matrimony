// razorpay-webhook
// Configure this URL in the Razorpay Dashboard -> Settings -> Webhooks, subscribed to
// at least: payment.captured, payment.failed
//
// This is the ONLY place a plan is ever activated — never trust the client's
// checkout-success callback for that, since it can be spoofed. Signature verification
// below is what makes this endpoint trustworthy.
//
// Required secrets:
//   RAZORPAY_WEBHOOK_SECRET  (the secret you set when creating the webhook in Razorpay)
//   SUPABASE_URL, SUPABASE_SERVICE_ROLE_KEY (auto-provided by Supabase)

import { serve } from "https://deno.land/std@0.190.0/http/server.ts";
import { createClient } from "https://esm.sh/@supabase/supabase-js@2";
import { corsHeaders } from "../_shared/cors.ts";

const RAZORPAY_WEBHOOK_SECRET = Deno.env.get("RAZORPAY_WEBHOOK_SECRET")!;
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

  const rawBody = await req.text();
  const receivedSignature = req.headers.get("x-razorpay-signature") ?? "";

  const expectedSignature = await hmacSha256Hex(RAZORPAY_WEBHOOK_SECRET, rawBody);
  if (expectedSignature !== receivedSignature) {
    // Do NOT reveal details — just reject.
    return new Response(JSON.stringify({ error: "Invalid signature" }), { status: 400 });
  }

  const admin = createClient(SUPABASE_URL, SERVICE_ROLE_KEY);
  const event = JSON.parse(rawBody);

  try {
    if (event.event === "payment.captured") {
      const entity = event.payload.payment.entity;
      const orderId: string = entity.order_id;
      const paymentId: string = entity.id;

      const { data: paymentRow, error: findErr } = await admin
        .from("payments")
        .select("id, user_id, plan_id, amount_paise, status")
        .eq("razorpay_order_id", orderId)
        .single();

      if (findErr || !paymentRow) {
        // Unknown order — acknowledge so Razorpay stops retrying, but log it.
        console.error("razorpay-webhook: unknown order_id", orderId);
        return new Response(JSON.stringify({ ok: true }), { status: 200 });
      }

      // Idempotency: Razorpay may deliver the same webhook more than once.
      if (paymentRow.status === "success") {
        return new Response(JSON.stringify({ ok: true, already_processed: true }), { status: 200 });
      }

      await admin
        .from("payments")
        .update({
          razorpay_payment_id: paymentId,
          razorpay_signature: receivedSignature,
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
        },
      );

      if (rpcErr) {
        console.error("razorpay-webhook: activation RPC failed", rpcErr);
        return new Response(JSON.stringify({ error: rpcErr.message }), { status: 500 });
      }

      return new Response(JSON.stringify({ ok: true, subscription: result }), { status: 200 });
    }

    if (event.event === "payment.failed") {
      const entity = event.payload.payment.entity;
      const orderId: string = entity.order_id;

      const { data: paymentRow } = await admin
        .from("payments")
        .select("id, user_id, plan_id")
        .eq("razorpay_order_id", orderId)
        .single();

      if (paymentRow) {
        await admin.from("payments").update({ status: "failed" }).eq("id", paymentRow.id);
        await admin.from("failed_payments").insert({
          user_id: paymentRow.user_id,
          plan_id: paymentRow.plan_id,
          razorpay_order_id: orderId,
          error_code: entity.error_code ?? null,
          error_description: entity.error_description ?? null,
        });
      }

      return new Response(JSON.stringify({ ok: true }), { status: 200 });
    }

    // Any other event type: acknowledge, no-op.
    return new Response(JSON.stringify({ ok: true, ignored: event.event }), { status: 200 });
  } catch (e) {
    console.error("razorpay-webhook error", e);
    return new Response(JSON.stringify({ error: (e as Error).message }), { status: 500 });
  }
});
