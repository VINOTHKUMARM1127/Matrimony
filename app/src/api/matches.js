/**
 * Wedring Matrimony — Matches API
 * Profile matching and recommendation queries
 * 
 * STRICT BACKEND SECURITY ENFORCEMENT:
 * The frontend no longer manually queries 'profiles' for matching feeds.
 * All feeds (Recommended, Daily) are processed through secure Postgres RPCs
 * which internally enforce limits and static pool freezes based on profile_distribution.
 */
import supabase from './supabaseClient';

const attachPhotos = async (data, userId) => {
  if (!data || data.length === 0) return [];
  const profileIds = data.map(p => p.id);
  
  // Fetch viewer's active tier to determine if we should lock premium matches
  let isFreeUser = true;
  if (userId) {
    const { data: membership } = await supabase
      .from('user_memberships')
      .select('tier')
      .eq('user_id', userId)
      .eq('status', 'active')
      .order('created_at', { ascending: false })
      .maybeSingle();
    if (membership && membership.tier !== 'free') {
      isFreeUser = false;
    }
  }
  try {
    const { data: photosData } = await supabase
      .from('profile_photos')
      .select('user_id, id, photo_url, is_primary, display_order')
      .in('user_id', profileIds);
      
    return data.map(p => ({
      ...p,
      profile_photos: photosData ? photosData.filter(photo => photo.user_id === p.id) : [],
      compatibility_score: p.compatibility_score || 50,
      isLocked: isFreeUser
    }));
  } catch (photoErr) {
    console.warn('Failed to fetch photos for matches:', photoErr);
    return data.map(p => ({ ...p, profile_photos: [], compatibility_score: p.compatibility_score || 50, isLocked: isFreeUser }));
  }
};

/**
 * Get all matches based on backend distribution pool
 */
export const getAllMatches = async (userId, limit = 20, offset = 0) => {
  const { data, error } = await supabase.rpc('get_all_matches', {
    p_user_id: userId,
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
  const { data, error } = await supabase.rpc('get_daily_updates', {
    p_user_id: userId,
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
 * Calculate compatibility between two profiles
 */
export const getCompatibilityScore = async (userId1, userId2) => {
  const { data, error } = await supabase.rpc('calculate_compatibility', {
    p_user_id_1: userId1,
    p_user_id_2: userId2,
  });

  if (error) return 0;
  return data || 0;
};
