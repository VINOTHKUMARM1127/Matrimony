// r2-presigned-upload
// Called by the app before uploading a profile photo. Returns a short-lived presigned
// PUT URL for Cloudflare R2 (S3-compatible). The app PUTs the raw image bytes straight
// to that URL, then inserts the row into `profile_photos` itself using its own
// Supabase session — RLS (`photos_insert`) already restricts that to auth.uid() = user_id,
// and the `trg_photo_count` / `trg_photo_primary` triggers enforce the 5-photo cap and
// single-primary-photo rule server-side, so nothing privileged happens here besides
// signing the URL.
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

const ALLOWED_CONTENT_TYPES = ["image/jpeg", "image/jpg", "image/png", "image/webp"];

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
    const userId = userData.user.id;

    const { content_type, thumbnail, user_id_override } = await req.json();
    if (!content_type || !ALLOWED_CONTENT_TYPES.includes(content_type)) {
      return withCors({ error: "content_type must be one of: " + ALLOWED_CONTENT_TYPES.join(", ") }, 400);
    }

    let targetUserId = userId;
    const admin = createClient(SUPABASE_URL, SERVICE_ROLE_KEY);

    if (user_id_override && user_id_override !== userId) {
      const { data: isAdminRow } = await admin
        .from("admin_users")
        .select("id")
        .eq("id", userId)
        .eq("is_active", true)
        .maybeSingle();

      if (!isAdminRow) {
        return withCors({ error: "Not authorized to upload for another user" }, 403);
      }
      targetUserId = user_id_override;
    }

    // Soft pre-check (DB trigger is the real enforcement point on insert)
    const { count } = await admin
      .from("profile_photos")
      .select("id", { count: "exact", head: true })
      .eq("user_id", targetUserId);
    if ((count ?? 0) >= 5) {
      return withCors({ error: "Maximum 5 photos allowed per user" }, 400);
    }

    const ext = content_type.split("/")[1].replace("jpeg", "jpg");
    const folder = thumbnail ? "thumbnails" : "photos";
    const key = `${folder}/${targetUserId}/${crypto.randomUUID()}.${ext}`;

    const client = new AwsClient({
      accessKeyId: R2_ACCESS_KEY_ID,
      secretAccessKey: R2_SECRET_ACCESS_KEY,
      region: "auto",
      service: "s3",
    });

    const objectUrl = new URL(
      `https://${R2_ACCOUNT_ID}.r2.cloudflarestorage.com/${R2_BUCKET_NAME}/${key}`,
    );
    objectUrl.searchParams.set("X-Amz-Expires", "300"); // 5 minutes to complete the upload

    const signedRequest = await client.sign(
      new Request(objectUrl, { method: "PUT", headers: { "Content-Type": content_type } }),
      { aws: { signQuery: true } },
    );

    return withCors({
      upload_url: signedRequest.url,
      r2_key: key,
      expires_in: 300,
      method: "PUT",
      headers: { "Content-Type": content_type },
    });
  } catch (e) {
    return withCors({ error: (e as Error).message }, 500);
  }
});
