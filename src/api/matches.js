/**
 * Tamil Matrimony — Matches API
 * Profile matching and recommendation queries
 */
import supabase from './supabaseClient';

/**
 * Get recommended profiles based on partner preferences
 */
export const getRecommendedProfiles = async (userId, limit = 20, userGender = null) => {
  // Use RPC function for server-side matching
  let { data, error } = await supabase.rpc('get_recommended_profiles', {
    p_user_id: userId,
    p_limit: limit,
    p_offset: 0,
  });

  const hasSameGender = userGender && data && data.length > 0 && data.some(p => p.gender === userGender);
  const needsFallback = !error && (!data || data.length === 0 || hasSameGender);

  if (error || needsFallback) {
    console.warn(
      error 
        ? 'Matching RPC error, falling back:' 
        : hasSameGender 
        ? 'RPC returned same-gender profiles, forcing strictly opposite gender fallback...' 
        : 'No matches found, searching by location fallback...', 
      error || ''
    );
    
    try {
      // 1. Get current user's location and gender
      const { data: userProfile } = await supabase
        .from('profiles')
        .select('gender, city, district, state')
        .eq('id', userId)
        .single();

      const effectiveGender = userGender || userProfile?.gender || 'male';
      const oppositeGender = effectiveGender === 'male' ? 'female' : 'male';
      let fallbackProfiles = [];
      let fallbackLocation = '';

      // Helper function to query profiles and attach photos
      const queryFallback = async (locationField, locationValue) => {
        let query = supabase
          .from('profiles')
          .select('*, photos(id, storage_path, thumbnail_path, is_primary, display_order)')
          .eq('is_active', true)
          .eq('gender', oppositeGender)
          .neq('id', userId);

        if (locationField && locationValue) {
          query = query.eq(locationField, locationValue);
        }

        const { data: results } = await query
          .order('last_active_at', { ascending: false })
          .limit(limit);

        return results || [];
      };

      // 2. Try by City
      if (userProfile?.city) {
        fallbackProfiles = await queryFallback('city', userProfile.city);
        if (fallbackProfiles.length > 0) {
          fallbackLocation = userProfile.city;
        }
      }

      // 3. Try by District (if city failed or returned too few)
      if (fallbackProfiles.length < 3 && userProfile?.district) {
        const districtProfiles = await queryFallback('district', userProfile.district);
        const existingIds = new Set(fallbackProfiles.map(p => p.id));
        const filteredDistrict = districtProfiles.filter(p => !existingIds.has(p.id));
        fallbackProfiles = [...fallbackProfiles, ...filteredDistrict].slice(0, limit);
        if (fallbackProfiles.length > 0) {
          fallbackLocation = fallbackLocation || userProfile.district;
        }
      }

      // 4. Try by State (if still too few)
      if (fallbackProfiles.length < 3 && userProfile?.state) {
        const stateProfiles = await queryFallback('state', userProfile.state);
        const existingIds = new Set(fallbackProfiles.map(p => p.id));
        const filteredState = stateProfiles.filter(p => !existingIds.has(p.id));
        fallbackProfiles = [...fallbackProfiles, ...filteredState].slice(0, limit);
        if (fallbackProfiles.length > 0) {
          fallbackLocation = fallbackLocation || userProfile.state;
        }
      }

      // 5. Try general opposite gender (if still too few)
      if (fallbackProfiles.length < 3) {
        const generalProfiles = await queryFallback(null, null);
        const existingIds = new Set(fallbackProfiles.map(p => p.id));
        const filteredGeneral = generalProfiles.filter(p => !existingIds.has(p.id));
        fallbackProfiles = [...fallbackProfiles, ...filteredGeneral].slice(0, limit);
        if (fallbackProfiles.length > 0) {
          fallbackLocation = fallbackLocation || 'Tamil Nadu';
        }
      }

      // 6. Extreme fallback: any active profile (but strictly opposite gender)
      if (fallbackProfiles.length === 0) {
        const { data: anyProfiles } = await supabase
          .from('profiles')
          .select('*, photos(id, storage_path, thumbnail_path, is_primary, display_order)')
          .eq('is_active', true)
          .neq('id', userId)
          .eq('gender', oppositeGender)
          .limit(limit);
        fallbackProfiles = anyProfiles || [];
        fallbackLocation = 'any location';
      }

      // Tag the profiles so the UI knows they are location fallback matches
      return fallbackProfiles.map(profile => ({
        ...profile,
        photos: profile.photos || [],
        is_location_fallback: true,
        fallback_location: fallbackLocation,
        compatibility_score: profile.compatibility_score || 50, // default placeholder score
      }));

    } catch (fallbackError) {
      console.error('Fallback query failed:', fallbackError);
      return [];
    }
  }

  // Fetch photos for the RPC results since the RPC does not join photos
  if (data && data.length > 0) {
    const profileIds = data.map(p => p.id);
    try {
      const { data: photosData } = await supabase
        .from('photos')
        .select('user_id, id, storage_path, thumbnail_path, is_primary, display_order')
        .in('user_id', profileIds);
        
      data = data.map(p => ({
        ...p,
        photos: photosData ? photosData.filter(photo => photo.user_id === p.id) : []
      }));
    } catch (photoErr) {
      console.warn('Failed to fetch photos for matches:', photoErr);
      data = data.map(p => ({ ...p, photos: [] }));
    }
  } else {
    data = (data || []).map(p => ({ ...p, photos: [] }));
  }

  // Inject default compatibility score if missing
  return data.map(p => ({
    ...p,
    compatibility_score: p.compatibility_score || 0
  }));
};

/**
 * Get daily match recommendations
 */
export const getDailyMatches = async (userId, limit = 5, userGender = null) => {
  try {
    // Since get_daily_matches RPC might be missing, safely reuse the robust getRecommendedProfiles
    // We fetch a slightly larger pool and shuffle to create a randomized "Daily" selection
    const pool = await getRecommendedProfiles(userId, limit * 3, userGender);
    
    // Shuffle array (Fisher-Yates)
    const shuffled = [...pool];
    for (let i = shuffled.length - 1; i > 0; i--) {
      const j = Math.floor(Math.random() * (i + 1));
      [shuffled[i], shuffled[j]] = [shuffled[j], shuffled[i]];
    }
    
    return shuffled.slice(0, limit);
  } catch (error) {
    console.warn('Daily matches wrapper error:', error);
    return [];
  }
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
