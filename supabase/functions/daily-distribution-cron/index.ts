// daily-distribution-cron
// Optional HTTP entry point for the nightly jobs, for teams that prefer an external
// scheduler (GitHub Actions, cron-job.org, EasyCron, etc.) over Supabase's built-in
// pg_cron (already wired up in migrations/20260701120100_cron_schedule.sql). Safe to
// run both — fn_run_daily_distribution / fn_expire_and_advance_subscriptions are
// idempotent per period since they key off `distribution_logs` / `expires_at`.
//
// Call with:  POST /functions/v1/daily-distribution-cron
//             header  x-cron-secret: <CRON_SECRET>
//
// Required secrets:
//   CRON_SECRET  (any random string you choose — put the same value in your scheduler)
//   SUPABASE_URL, SUPABASE_SERVICE_ROLE_KEY (auto-provided by Supabase)

import { serve } from "https://deno.land/std@0.190.0/http/server.ts";
import { createClient } from "https://esm.sh/@supabase/supabase-js@2";
import { corsHeaders, withCors } from "../_shared/cors.ts";

const CRON_SECRET = Deno.env.get("CRON_SECRET")!;
const SUPABASE_URL = Deno.env.get("SUPABASE_URL")!;
const SERVICE_ROLE_KEY = Deno.env.get("SUPABASE_SERVICE_ROLE_KEY")!;

serve(async (req) => {
  if (req.method === "OPTIONS") {
    return new Response("ok", { headers: corsHeaders });
  }

  const provided = req.headers.get("x-cron-secret");
  if (!CRON_SECRET || provided !== CRON_SECRET) {
    return withCors({ error: "Unauthorized" }, 401);
  }

  try {
    const admin = createClient(SUPABASE_URL, SERVICE_ROLE_KEY);

    const { error: distErr } = await admin.rpc("fn_run_daily_distribution");
    if (distErr) throw distErr;

    const { data: expiredCount, error: expErr } = await admin.rpc(
      "fn_expire_and_advance_subscriptions",
    );
    if (expErr) throw expErr;

    return withCors({ ok: true, expired_subscriptions: expiredCount, ran_at: new Date().toISOString() });
  } catch (e) {
    console.error("daily-distribution-cron error", e);
    return withCors({ error: (e as Error).message }, 500);
  }
});
