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

    // 1. Fetch pending notifications
    const { data: notifications, error: fetchErr } = await admin
      .from("notifications")
      .select("*")
      .eq("push_status", "pending")
      .order("created_at", { ascending: true })
      .limit(500);

    if (fetchErr) throw fetchErr;
    if (!notifications || notifications.length === 0) {
      return withCors({ ok: true, sent: 0, message: "No pending notifications" });
    }

    // 2. Fetch ALL active devices and match in memory. Do NOT filter this
    //    query with .in("user_id", userIds) — with a large backlog of
    //    notifications (hundreds of distinct users), that builds a URL with
    //    hundreds of UUIDs crammed into the query string, which breaks the
    //    HTTP/2 request to PostgREST entirely ("stream error / unspecific
    //    protocol error") before it ever reaches the database. The active
    //    devices table is small regardless of how large the notification
    //    backlog is, so fetching it unfiltered is both simpler and safe.
    const { data: devices, error: deviceErr } = await admin
      .from("user_devices")
      .select("user_id, expo_push_token")
      .eq("is_active", true);

    if (deviceErr) throw deviceErr;

    const tokensByUser = new Map<string, string[]>();
    for (const d of devices || []) {
      if (!tokensByUser.has(d.user_id)) tokensByUser.set(d.user_id, []);
      tokensByUser.get(d.user_id)!.push(d.expo_push_token);
    }

    // 3. Prepare Expo push messages, batching "no device" failures instead of
    //    updating them one row at a time (that loop caused earlier timeouts
    //    when there's a large backlog of notifications for users with no
    //    registered device).
    const pushMessages: any[] = [];
    const pushMessageToNotificationId = new Map<number, string>(); // index -> notification.id
    const noDeviceNotificationIds: string[] = [];

    for (const notif of notifications) {
      const tokens = tokensByUser.get(notif.user_id);
      if (!tokens || tokens.length === 0) {
        noDeviceNotificationIds.push(notif.id);
        continue;
      }

      for (const token of tokens) {
        pushMessages.push({
          to: token,
          sound: "default",
          title: notif.title,
          body: notif.body,
          data: { ...notif.data, type: notif.type },
        });
        pushMessageToNotificationId.set(pushMessages.length - 1, notif.id);
      }
    }

    // Single batched update for all "no active device" notifications, instead
    // of one awaited call per row.
    if (noDeviceNotificationIds.length > 0) {
      await admin
        .from("notifications")
        .update({ push_status: "failed", push_error: "No active device tokens found" })
        .in("id", noDeviceNotificationIds);
    }

    if (pushMessages.length === 0) {
       return withCors({ ok: true, sent: 0, failed: noDeviceNotificationIds.length, message: "No active tokens for pending notifications" });
    }

    // 4. Send to Expo Push API (chunked by 100 max)
    const CHUNK_SIZE = 100;
    const tickets: any[] = [];

    for (let i = 0; i < pushMessages.length; i += CHUNK_SIZE) {
      const chunk = pushMessages.slice(i, i + CHUNK_SIZE);

      const response = await fetch("https://exp.host/--/api/v2/push/send", {
        method: "POST",
        headers: {
          "Accept": "application/json",
          "Accept-encoding": "gzip, deflate",
          "Content-Type": "application/json",
        },
        body: JSON.stringify(chunk),
      });

      const result = await response.json();
      if (result.data) {
        tickets.push(...result.data);
      }
    }

    // 5. Process tickets and update database
    const updates = [];
    const deactivatedTokens = [];

    for (let i = 0; i < tickets.length; i++) {
      const ticket = tickets[i];
      const notifId = pushMessageToNotificationId.get(i);
      const token = pushMessages[i].to;

      if (!notifId) continue;

      if (ticket.status === "ok") {
        updates.push(
          admin.from("notifications")
            .update({ push_status: "sent", push_ticket_id: ticket.id, push_sent_at: new Date().toISOString(), push_token_used: token })
            .eq("id", notifId)
        );
      } else {
        const errorMsg = ticket.details?.error || ticket.message;

        updates.push(
          admin.from("notifications")
            .update({ push_status: "failed", push_error: errorMsg })
            .eq("id", notifId)
        );

        if (errorMsg === "DeviceNotRegistered") {
           deactivatedTokens.push(token);
        }
      }
    }

    await Promise.all(updates);

    if (deactivatedTokens.length > 0) {
      await admin.from("user_devices")
        .update({ is_active: false })
        .in("expo_push_token", deactivatedTokens);
    }

    return withCors({ ok: true, sent: tickets.length, failed_no_device: noDeviceNotificationIds.length });

  } catch (e) {
    console.error("send-push-notifications error", e);
    return withCors({ error: (e as Error).message }, 500);
  }
});