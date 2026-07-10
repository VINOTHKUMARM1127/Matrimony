// r2-delete-photo
// The client can already DELETE the `profile_photos` row directly via RLS
// (`photos_delete`: auth.uid() = user_id or is_admin()), but deleting the underlying
// R2 object requires the R2 credentials, which only exist server-side. This function
// does both in one call so orphaned files never pile up in the bucket.
//
// Required secrets:
//   R2_ACCOUNT_ID, R2_ACCESS_KEY_ID, R2_SECRET_ACCESS_KEY, R2_BUCKET_NAME
//   SUPABASE_URL, SUPABASE_SERVICE_ROLE_KEY (auto-provided by Supabase)

import { serve } from "https://deno.land/std@0.190.0/http/server.ts";
import { createClient } from "https://esm.sh/@supabase/supabase-js@2";
import { AwsClient } from "https://esm.sh/aws4fetch@1.0.17";
import { corsHeaders, withCors } from "../_shared/cors.ts";

const R2_ACCOUNT_ID = Deno.env.get("R2_ACCOUNT_ID")!;
const R2_ACCESS_KEY_ID = Deno.env.get("R2_ACCESS_KEY_ID")!;
const R2_SECRET_ACCESS_KEY = Deno.env.get("R2_SECRET_ACCESS_KEY")!;
const R2_BUCKET_NAME = Deno.env.get("R2_BUCKET_NAME")!;
const SUPABASE_URL = Deno.env.get("SUPABASE_URL")!;
const SERVICE_ROLE_KEY = Deno.env.get("SUPABASE_SERVICE_ROLE_KEY")!;

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
    const callerId = userData.user.id;

    const { photo_id } = await req.json();
    if (!photo_id) {
      return withCors({ error: "photo_id is required" }, 400);
    }

    const admin = createClient(SUPABASE_URL, SERVICE_ROLE_KEY);

    const { data: photo, error: findErr } = await admin
      .from("profile_photos")
      .select("id, user_id, r2_key, thumbnail_key")
      .eq("id", photo_id)
      .single();

    if (findErr || !photo) {
      return withCors({ error: "Photo not found" }, 404);
    }

    const { data: isAdminRow } = await admin
      .from("admin_users")
      .select("id")
      .eq("id", callerId)
      .eq("is_active", true)
      .maybeSingle();

    if (photo.user_id !== callerId && !isAdminRow) {
      return withCors({ error: "Not authorized to delete this photo" }, 403);
    }

    const client = new AwsClient({
      accessKeyId: R2_ACCESS_KEY_ID,
      secretAccessKey: R2_SECRET_ACCESS_KEY,
      region: "auto",
      service: "s3",
    });

    const keysToDelete = [photo.r2_key, photo.thumbnail_key].filter(Boolean) as string[];
    for (const key of keysToDelete) {
      const objectUrl = `https://${R2_ACCOUNT_ID}.r2.cloudflarestorage.com/${R2_BUCKET_NAME}/${key}`;
      const res = await client.fetch(objectUrl, { method: "DELETE" });
      if (!res.ok && res.status !== 404) {
        console.error("r2-delete-photo: failed to delete", key, res.status);
      }
    }

    const { error: delErr } = await admin.from("profile_photos").delete().eq("id", photo_id);
    if (delErr) {
      return withCors({ error: "Deleted from storage but failed to remove DB row", details: delErr.message }, 500);
    }

    return withCors({ ok: true });
  } catch (e) {
    return withCors({ error: (e as Error).message }, 500);
  }
});
