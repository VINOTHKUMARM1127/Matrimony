const { createClient } = require('@supabase/supabase-js');
require('dotenv').config({ path: '.env' });

const supabase = createClient(
  process.env.EXPO_PUBLIC_SUPABASE_URL,
  process.env.EXPO_PUBLIC_SUPABASE_ANON_KEY
);

async function test() {
  const { data: passes } = await supabase
    .from('not_interested')
    .select('*')
    .limit(1);

  if (!passes || passes.length === 0) {
    console.log("No passes found");
    return;
  }
  
  const profileId = passes[0].target_user_id;
  console.log("Found passed profile ID:", profileId);

  const { data, error } = await supabase
    .from('profiles')
    .select(`
      *,
      cities ( name ),
      districts ( name ),
      education_levels ( name ),
      occupations ( name ),
      religions ( name ),
      castes ( name )
    `)
    .eq('id', profileId)
    .eq('is_active', true)
    .single();

  console.log("Error:", error);
  console.log("Data ID:", data ? data.id : null);
}

test();
