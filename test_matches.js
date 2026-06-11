const { createClient } = require('@supabase/supabase-js');
require('dotenv').config();

const supabase = createClient(
  process.env.EXPO_PUBLIC_SUPABASE_URL,
  process.env.EXPO_PUBLIC_SUPABASE_ANON_KEY
);



async function test() {
  // 1. Find a male user and a female user from seeded data
  const { data: males } = await supabase.from('profiles').select('id, gender, display_name').eq('gender', 'male').limit(1);
  const { data: females } = await supabase.from('profiles').select('id, gender, display_name').eq('gender', 'female').limit(1);
  
  if (!males?.length || !females?.length) {
    console.log('Error: Could not find seeded male/female profiles');
    return;
  }

  const maleUser = males[0];
  const femaleUser = females[0];

  console.log('\n--- TESTING MALE USER ---');
  await testUserMatches(maleUser);

  console.log('\n--- TESTING FEMALE USER ---');
  await testUserMatches(femaleUser);
  
  console.log('\n--- TESTING FALLBACK DIRECTLY ---');
  await testFallbackDirectly(maleUser.id, 'female');
}

async function testUserMatches(user) {
  console.log(`User: ${user.display_name} (${user.gender}) ID: ${user.id}`);
  
  let { data, error } = await supabase.rpc('get_recommended_profiles', {
    p_user_id: user.id,
    p_limit: 3,
    p_offset: 0,
  });
  
  if (error) {
    console.error('RPC Error:', error);
    return;
  }
  
  console.log('RPC returned count:', data?.length);
  
  if (data && data.length > 0) {
    const profileIds = data.map(p => p.id);
    const { data: photosData, error: photoErr } = await supabase
      .from('photos')
      .select('user_id, id, storage_path, thumbnail_path, is_primary, display_order')
      .in('user_id', profileIds);
      
    if (photoErr) console.error('Photo Error:', photoErr);
    console.log('Photos fetched count:', photosData?.length);
    
    if (photosData) {
      data = data.map(p => ({
        ...p,
        photos: photosData.filter(photo => photo.user_id === p.id)
      }));
    }
    
    console.log('First match details:');
    console.log(`Name: ${data[0].display_name}, Gender: ${data[0].gender}`);
    console.log(`Photos Array:`, JSON.stringify(data[0].photos, null, 2));
  }
}

async function testFallbackDirectly(userId, oppositeGender) {
  const { data: fallbackProfiles, error } = await supabase
    .from('profiles')
    .select('*, photos(id, storage_path, thumbnail_path, is_primary, display_order)')
    .eq('is_active', true)
    .eq('gender', oppositeGender)
    .neq('id', userId)
    .limit(3);

  if (error) {
    console.error('Fallback select error:', error);
    return;
  }

  console.log('Fallback direct query count:', fallbackProfiles?.length);
  if (fallbackProfiles?.length > 0) {
    console.log('Fallback first match details:');
    console.log(`Name: ${fallbackProfiles[0].display_name}, Gender: ${fallbackProfiles[0].gender}`);
    console.log(`Photos Array:`, JSON.stringify(fallbackProfiles[0].photos, null, 2));
  }
}

test();
