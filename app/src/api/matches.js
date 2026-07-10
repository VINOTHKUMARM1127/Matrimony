/**
 * Wedring Matrimony — Matches API
 * Profile matching and recommendation queries
 * 
 * STRICT BACKEND SECURITY ENFORCEMENT:
 * All feeds (All Matches, Daily Updates) are processed through secure Postgres RPCs
 * which internally enforce limits and static pool freezes based on distributed_profiles.
 */
import supabase from './supabaseClient';
import { getR2PhotoUrl } from './profiles';

let masterDataCache = null;
const getMasterData = async () => {
  if (masterDataCache) return masterDataCache;
  const [religions, occupations, educations, cities, castes] = await Promise.all([
    supabase.from('religions').select('id, name'),
    supabase.from('occupations').select('id, name'),
    supabase.from('education_levels').select('id, name'),
    supabase.from('cities').select('id, name'),
    supabase.from('castes').select('id, name'),
  ]);
  masterDataCache = {
    religions: Object.fromEntries(religions.data?.map(r => [r.id, r.name]) || []),
    occupations: Object.fromEntries(occupations.data?.map(o => [o.id, o.name]) || []),
    educations: Object.fromEntries(educations.data?.map(e => [e.id, e.name]) || []),
    cities: Object.fromEntries(cities.data?.map(c => [c.id, c.name]) || []),
    castes: Object.fromEntries(castes.data?.map(c => [c.id, c.name]) || []),
  };
  return masterDataCache;
};

const attachPhotos = async (data, userId) => {
  if (!data || data.length === 0) return [];
  const profileIds = data.map(p => p.id);
  
  // Fetch viewer's active subscription to determine if we should lock premium matches
  let isFreeUser = true;
  if (userId) {
    const { data: subscription } = await supabase
      .from('user_subscriptions')
      .select('plan_id, membership_plans!plan_id (tier)')
      .eq('user_id', userId)
      .eq('is_active', true)
      .order('created_at', { ascending: false })
      .maybeSingle();
    if (subscription?.membership_plans?.tier && subscription.membership_plans.tier !== 'free') {
      isFreeUser = false;
    }
  }
  try {
    const [{ data: photosData }, masterData] = await Promise.all([
      supabase
        .from('profile_photos')
        .select('user_id, id, r2_key, thumbnail_key, is_primary, order_index')
        .in('user_id', profileIds),
      getMasterData()
    ]);
      
    return data.map(p => ({
      ...p,
      display_name: p.full_name,
      religion: masterData.religions[p.religion_id],
      occupation: masterData.occupations[p.occupation_id],
      education: masterData.educations[p.education_level_id],
      city: masterData.cities[p.city_id],
      caste: masterData.castes[p.caste_id],
      profile_photos: photosData
        ? photosData
            .filter(photo => photo.user_id === p.id)
            .map(photo => ({
              ...photo,
              photo_url: getR2PhotoUrl(photo.r2_key),
              thumbnail_url: getR2PhotoUrl(photo.thumbnail_key),
            }))
        : [],
      compatibility_score: p.compatibility_score || 50,
      isLocked: isFreeUser
    }));
  } catch (photoErr) {
    console.warn('Failed to fetch photos for matches:', photoErr);
    const masterData = masterDataCache || {};
    return data.map(p => ({ 
      ...p, 
      display_name: p.full_name,
      religion: masterData.religions?.[p.religion_id],
      occupation: masterData.occupations?.[p.occupation_id],
      education: masterData.educations?.[p.education_level_id],
      city: masterData.cities?.[p.city_id],
      caste: masterData.castes?.[p.caste_id],
      profile_photos: [], 
      compatibility_score: p.compatibility_score || 50, 
      isLocked: isFreeUser 
    }));
  }
};

/**
 * Get all matches based on backend distribution pool
 */
export const getAllMatches = async (userId, limit = 20, offset = 0) => {
  const { data, error } = await supabase.rpc('get_profiles_from_pool', {
    p_user_id: userId,
    p_section: 'all_matches',
    p_limit: limit,
    p_offset: offset,
  });

  if (error) {
    console.warn('RPC Error fetching all matches:', error);
    return [];
  }

  return await attachPhotos(data, userId);
};

/**
 * Get daily match updates based on backend distribution pool
 */
export const getDailyUpdates = async (userId, dailyLimit = 5, offset = 0) => {
  const { data, error } = await supabase.rpc('get_profiles_from_pool', {
    p_user_id: userId,
    p_section: 'daily_updates',
    p_limit: dailyLimit,
    p_offset: offset,
  });

  if (error) {
    console.warn('RPC Error fetching daily updates:', error);
    return [];
  }

  return await attachPhotos(data, userId);
};

/**
 * Get nearby matches based on backend distribution pool
 * Note: This is a client-side approximation over the `all_matches` pool.
 * A proper server-side proximity RPC would be a better long-term fix.
 */
export const getNearbyProfiles = async (userId, limit = 20, offset = 0) => {
  // Fetch current user location for proximity filtering
  const { data: userProfile } = await supabase
    .from('profiles')
    .select('district_id, state_id')
    .eq('id', userId)
    .single();

  const userDistrict = userProfile?.district_id;
  const userState = userProfile?.state_id;

  const { data, error } = await supabase.rpc('get_profiles_from_pool', {
    p_user_id: userId,
    p_section: 'all_matches',
    p_limit: limit * 3,
    p_offset: offset,
  });

  if (error) {
    console.warn('RPC Error fetching nearby matches:', error);
    return [];
  }

  let filtered = [];
  if (data) {
    filtered = data.filter(p => p.district_id === userDistrict);
    if (filtered.length < limit && userState) {
      filtered = data.filter(p => p.state_id === userState);
    }
  }

  const limitedData = filtered.slice(0, limit);

  return await attachPhotos(limitedData, userId);
};

/**
 * Calculate compatibility between two profiles
 */
export const getCompatibilityScore = async (userId1, userId2) => {
  const { data, error } = await supabase.rpc('fn_calculate_compatibility', {
    p_user_id: userId1,
    p_target_id: userId2,
  });

  if (error) return 0;
  return data || 0;
};
