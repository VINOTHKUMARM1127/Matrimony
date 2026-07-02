// admin-users
// Handles Supabase Auth Admin API calls securely for authenticated admins.
import { serve } from "https://deno.land/std@0.190.0/http/server.ts";
import { createClient } from "https://esm.sh/@supabase/supabase-js@2";
import { corsHeaders } from "../_shared/cors.ts";

const SUPABASE_URL = Deno.env.get("SUPABASE_URL")!;
const SERVICE_ROLE_KEY = Deno.env.get("SUPABASE_SERVICE_ROLE_KEY")!;

serve(async (req) => {
  if (req.method === "OPTIONS") {
    return new Response("ok", { headers: corsHeaders });
  }

  try {
    const authHeader = req.headers.get("Authorization");
    if (!authHeader) {
      return new Response(JSON.stringify({ error: "Missing authorization header" }), { status: 401, headers: corsHeaders });
    }

    // 1. Verify caller is an active admin
    const anonClient = createClient(SUPABASE_URL, Deno.env.get("SUPABASE_ANON_KEY")!, {
      global: { headers: { Authorization: authHeader } }
    });

    const { data: { user }, error: authError } = await anonClient.auth.getUser();
    if (authError || !user) {
      return new Response(JSON.stringify({ error: "Unauthorized" }), { status: 401, headers: corsHeaders });
    }

    const { data: adminUser, error: adminError } = await anonClient
      .from('admin_users')
      .select('role')
      .eq('id', user.id)
      .eq('is_active', true)
      .maybeSingle();

    if (adminError || !adminUser) {
      return new Response(JSON.stringify({ error: "Forbidden: Not an admin" }), { status: 403, headers: corsHeaders });
    }

    // 2. Perform requested Admin action using Service Role
    const adminClient = createClient(SUPABASE_URL, SERVICE_ROLE_KEY);
    const body = await req.json();
    const { action, ...payload } = body;

    let result;

    switch (action) {
      case "list_users": {
        const { page = 1, perPage = 10000 } = payload;
        const { data, error } = await adminClient.auth.admin.listUsers({ page, perPage });
        if (error) throw error;
        // Only return id and email to minimize payload
        const users = data.users.map((u: any) => ({ id: u.id, email: u.email }));
        result = { users };
        break;
      }
      case "create_user": {
        const { email, password, email_confirm } = payload;
        const { data, error } = await adminClient.auth.admin.createUser({ email, password, email_confirm });
        if (error) throw error;
        result = { user: { id: data.user.id, email: data.user.email } };
        break;
      }
      case "create_full_user": {
        const { auth, meta, profile, family, horoscope, lifestyle, preferences, plan_id, photos } = payload;
        
        // 1. Create Auth User
        const { data: authData, error: authErr } = await adminClient.auth.admin.createUser(auth);
        if (authErr) throw authErr;
        const newUserId = authData.user.id;

        try {
          // 2. Meta
          if (meta) await adminClient.from('registration_meta').upsert({ user_id: newUserId, ...meta }, { onConflict: 'user_id' }).throwOnError();
          
          // 3. Profile
          if (profile) await adminClient.from('profiles').upsert({ id: newUserId, ...profile, profile_completion_percent: 100, is_active: true }, { onConflict: 'id' }).throwOnError();
          
          // 4. Family
          if (family) await adminClient.from('user_family').upsert({ user_id: newUserId, ...family }, { onConflict: 'user_id' }).throwOnError();
          
          // 5. Horoscope
          if (horoscope) await adminClient.from('user_horoscope').upsert({ user_id: newUserId, ...horoscope }, { onConflict: 'user_id' }).throwOnError();
          
          // 6. Lifestyle
          if (lifestyle) await adminClient.from('user_lifestyle').upsert({ user_id: newUserId, ...lifestyle }, { onConflict: 'user_id' }).throwOnError();
          
          // 7. Preferences
          if (preferences) await adminClient.from('partner_preferences').upsert({ user_id: newUserId, ...preferences }, { onConflict: 'user_id' }).throwOnError();
          
          // 8. Subscription
          if (plan_id) {
            await adminClient.rpc('fn_activate_or_queue_subscription', {
              p_user_id: newUserId, p_plan_id: plan_id, p_payment_id: null, p_amount_paid: 0
            }).throwOnError();
          }
          
          // 9. Photos
          if (photos && photos.length > 0) {
            const rows = photos.map((r2_key: string, i: number) => ({
              user_id: newUserId, r2_key: r2_key, is_primary: i === 0, order_index: i
            }));
            await adminClient.from('profile_photos').insert(rows).throwOnError();
          }

          result = { success: true, userId: newUserId };
        } catch (dbErr) {
          // Rollback auth user if DB insert fails
          await adminClient.auth.admin.deleteUser(newUserId);
          throw dbErr;
        }
        break;
      }
      case "update_user": {
        const { id, updates } = payload;
        const { data, error } = await adminClient.auth.admin.updateUserById(id, updates);
        if (error) throw error;
        result = { user: { id: data.user.id, email: data.user.email } };
        break;
      }
      case "delete_user": {
        const { id } = payload;
        const { data, error } = await adminClient.auth.admin.deleteUser(id);
        if (error) throw error;
        result = { success: true };
        break;
      }
      default:
        return new Response(JSON.stringify({ error: "Invalid action" }), { status: 400, headers: corsHeaders });
    }

    return new Response(JSON.stringify({ data: result }), { status: 200, headers: { ...corsHeaders, "Content-Type": "application/json" } });

  } catch (err: any) {
    console.error("admin-users error:", err);
    // Return 200 with error in body so frontend can read it instead of a generic non-2xx error from supabase-js
    return new Response(JSON.stringify({ error: err.message || JSON.stringify(err) }), { status: 200, headers: { ...corsHeaders, "Content-Type": "application/json" } });
  }
});
