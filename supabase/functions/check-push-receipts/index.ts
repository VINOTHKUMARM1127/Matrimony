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

    // 1. Fetch sent notifications older than 15 minutes that haven't been verified
    // Expo says receipts are usually available within 15 mins.
    const fifteenMinsAgo = new Date(Date.now() - 15 * 60 * 1000).toISOString();
    
    const { data: notifications, error: fetchErr } = await admin
      .from("notifications")
      .select("id, push_ticket_id, user_id, push_token_used")
      .eq("push_status", "sent")
      .lt("push_sent_at", fifteenMinsAgo)
      .not("push_ticket_id", "is", null)
      .limit(500);

    if (fetchErr) throw fetchErr;
    if (!notifications || notifications.length === 0) {
      return withCors({ ok: true, processed: 0, message: "No receipts to check" });
    }

    const ticketIds = notifications.map(n => n.push_ticket_id).filter(Boolean) as string[];
    
    if (ticketIds.length === 0) {
       return withCors({ ok: true, processed: 0 });
    }

    // 2. Fetch receipts from Expo
    const CHUNK_SIZE = 300; // Expo allows checking many at once
    const receipts: Record<string, any> = {};

    for (let i = 0; i < ticketIds.length; i += CHUNK_SIZE) {
      const chunk = ticketIds.slice(i, i + CHUNK_SIZE);
      
      const response = await fetch("https://exp.host/--/api/v2/push/getReceipts", {
        method: "POST",
        headers: {
          "Accept": "application/json",
          "Accept-encoding": "gzip, deflate",
          "Content-Type": "application/json",
        },
        body: JSON.stringify({ ids: chunk }),
      });

      const result = await response.json();
      if (result.data) {
         Object.assign(receipts, result.data);
      }
    }

    // 3. Process receipts
    const updates = [];
    const deactivatedTokens: string[] = [];

    for (const notif of notifications) {
      const ticketId = notif.push_ticket_id;
      if (!ticketId) continue;

      const receipt = receipts[ticketId];
      if (!receipt) continue; // Receipt not found or pending

      if (receipt.status === "ok") {
        updates.push(
          admin.from("notifications")
            .update({ push_status: "delivered" })
            .eq("id", notif.id)
        );
      } else if (receipt.status === "error") {
        const errorMsg = receipt.details?.error || receipt.message;
        
        updates.push(
          admin.from("notifications")
            .update({ push_status: "failed", push_error: errorMsg })
            .eq("id", notif.id)
        );

        // Deactivate only the specific token that was used for this notification,
        // not all devices belonging to the user.
        if (errorMsg === "DeviceNotRegistered" && notif.push_token_used) {
           deactivatedTokens.push(notif.push_token_used);
        }
      }
    }

    await Promise.all(updates);
    
    if (deactivatedTokens.length > 0) {
       // Deduplicate tokens before the update
       const uniqueTokens = [...new Set(deactivatedTokens)];
       await admin.from("user_devices")
        .update({ is_active: false })
        .in("expo_push_token", uniqueTokens);
    }

    return withCors({ ok: true, processed: Object.keys(receipts).length });

  } catch (e) {
    console.error("check-push-receipts error", e);
    return withCors({ error: (e as Error).message }, 500);
  }
});
