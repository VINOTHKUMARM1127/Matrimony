/**
 * Tamil Matrimony — Matches API
 * Profile matching and recommendation queries
 * 
 * STRICT BACKEND SECURITY ENFORCEMENT:
 * The frontend no longer manually queries 'profiles' for matching feeds.
 * All feeds (Recommended, Nearby) are processed through secure Postgres RPCs
 * which internally enforce limits and static pool freezes based on admin_settings.
 */
import supabase from './supabaseClient';

const attachPhotos = async (data) => {
  if (!data || data.length === 0) return [];
  const profileIds = data.map(p => p.id);
  try {
    const { data: photosData } = await supabase
      .from('photos')
      .select('user_id, id, storage_path, thumbnail_path, is_primary, display_order')
      .in('user_id', profileIds);
      
    return data.map(p => ({
      ...p,
      photos: photosData ? photosData.filter(photo => photo.user_id === p.id) : [],
      compatibility_score: p.compatibility_score || 50
    }));
  } catch (photoErr) {
    console.warn('Failed to fetch photos for matches:', photoErr);
    return data.map(p => ({ ...p, photos: [], compatibility_score: p.compatibility_score || 50 }));
  }
};

/**
 * Get recommended profiles based on partner preferences (Secured by Backend RPC)
 */
export const getRecommendedProfiles = async (userId, limit = 20, offset = 0, userGender = null, isDynamic = false) => {
  const { data, error } = await supabase.rpc('get_recommended_profiles', {
    p_user_id: userId,
    p_limit: limit,
    p_offset: offset,
  });

  if (error) {
    console.warn('RPC Error fetching recommendations:', error);
    return [];
  }

  return await attachPhotos(data);
};

/**
 * Get daily match recommendations
 * Fully enforced by the backend RPC — reads daily limit LIVE from admin_settings.
 * No more frontend date-math or slicing. Admin changes reflect immediately on reload.
 */
export const getDailyMatches = async (userId, dailyLimit = 5, offset = 0, userGender = null, isDynamic = false) => {
  const { data, error } = await supabase.rpc('get_daily_matches', {
    p_user_id: userId,
    p_limit: dailyLimit,
    p_offset: offset,
  });

  if (error) {
    console.warn('RPC Error fetching daily matches:', error);
    return [];
  }

  // Log these views so they accumulate and aren't shown again
  if (data && data.length > 0) {
    const profileIds = data.map(p => p.id);
    supabase.rpc('log_daily_views', {
      p_user_id: userId,
      p_viewed_ids: profileIds
    }).catch(err => console.warn('Failed to log daily views', err));
  }

  return await attachPhotos(data);
};

/**
 * Get nearby profiles based on the user's location (Secured by Backend RPC)
 */
export const getNearbyProfiles = async (userId, limit = 20, offset = 0, userGender = null, isDynamic = false) => {
  const { data, error } = await supabase.rpc('get_nearby_profiles', {
    p_user_id: userId,
    p_limit: limit,
    p_offset: offset,
  });

  if (error) {
    console.warn('RPC Error fetching nearby profiles:', error);
    return [];
  }

  return await attachPhotos(data);
};

/**
 * Calculate compatibility between two profiles client-side
 */
export const getCompatibilityScore = async (userId1, userId2) => {
  const { data, error } = await supabase.rpc('calculate_compatibility', {
    p_user_id_1: userId1,
    p_user_id_2: userId2,
  });

  if (error) return 0;
  return data || 0;
};
