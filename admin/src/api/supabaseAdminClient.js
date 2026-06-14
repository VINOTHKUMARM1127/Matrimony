import { createClient } from '@supabase/supabase-js';

const supabaseUrl = import.meta.env.VITE_SUPABASE_URL;
const supabaseAnonKey = import.meta.env.VITE_SUPABASE_ANON_KEY;
// WARNING: Service Role Key MUST be present in .env for admin tasks like Auth User Creation
const supabaseServiceKey = import.meta.env.VITE_SUPABASE_SERVICE_ROLE_KEY;

let supabaseAdmin = null;

if (supabaseUrl && supabaseServiceKey) {
  // We MUST use the service key as the primary argument so that supabase.auth.admin uses it.
  supabaseAdmin = createClient(supabaseUrl, supabaseServiceKey, {
    auth: {
      autoRefreshToken: false,
      persistSession: false,
    },
    global: {
      headers: {
        Authorization: `Bearer ${supabaseServiceKey}`,
        apikey: supabaseServiceKey
      }
    }
  });
} else {
  console.warn('VITE_SUPABASE_SERVICE_ROLE_KEY is missing. Admin operations like Bulk Upload and Password Reset will fail.');
}

export default supabaseAdmin;
