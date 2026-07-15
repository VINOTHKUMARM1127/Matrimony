/**
 * Wedring Matrimony — Interests API
 * Send, receive, accept/decline interest requests
 *
 * SCHEMA NOTES:
 * - `interests` table: status enum is 'sent' | 'accepted' | 'rejected' (NOT 'pending'/'declined')
 * - Sending interests uses `fn_send_interest` RPC (deducts interest credit automatically)
 * - Accepting/rejecting uses `fn_respond_interest` RPC
 * - Passing uses `fn_mark_not_interested` RPC
 * - No `users` table — join directly to `profiles` and `profile_photos`
 */
import supabase from './supabaseClient';
import { getR2PhotoUrl } from './profiles';

/**
 * Send interest to a user securely via backend RPC
 * Deducts interest credit automatically.
 */
export const sendInterest = async (senderId, receiverId) => {
  const { data, error } = await supabase.rpc('fn_send_interest', {
    p_receiver_id: receiverId,
  });

  if (error) throw error;
  return data;
};

/**
 * Get received interests
 */
export const getReceivedInterests = async (userId, status = 'all') => {
  let query = supabase
    .from('interests')
    .select('*')
    .eq('receiver_id', userId)
    .order('created_at', { ascending: false });

  if (status && status !== 'all') {
    query = query.eq('status', status);
  }

  const { data: interests, error: intError } = await query;

  if (intError) throw intError;
  if (!interests || interests.length === 0) return [];

  const senderIds = interests.map(i => i.sender_id);

  const [{ data: profiles, error: profError }, { data: photosData }] = await Promise.all([
    supabase
      .from('profiles')
      .select(`
        id, full_name, dob, gender,
        occupation:occupations(name),
        education_level:education_levels(name),
        city:cities(name),
        religion:religions(name)
      `)
      .in('id', senderIds),
    supabase
      .from('profile_photos')
      .select('id, user_id, r2_key, thumbnail_key, is_primary')
      .in('user_id', senderIds)
  ]);

  if (profError) throw profError;

  const profileMap = {};
  for (const prof of (profiles || [])) {
    prof.profile_photos = (photosData || []).filter(p => p.user_id === prof.id);
    prof.occupation = prof.occupation?.name || null;
    prof.education = prof.education_level?.name || null;
    prof.city = prof.city?.name || null;
    prof.religion = prof.religion?.name || null;
    profileMap[prof.id] = prof;
  }

  return interests.map(interest => {
    const prof = profileMap[interest.sender_id];
    return {
      ...interest,
      sender: prof ? {
        ...prof,
        profile_photos: (prof.profile_photos || []).map(p => ({
          ...p,
          photo_url: getR2PhotoUrl(p.r2_key),
          thumbnail_url: getR2PhotoUrl(p.thumbnail_key),
        })),
      } : null,
    };
  });
};

/**
 * Get sent interests
 */
export const getSentInterests = async (userId) => {
  const { data: interests, error: intError } = await supabase
    .from('interests')
    .select('*')
    .eq('sender_id', userId)
    .order('created_at', { ascending: false });

  if (intError) throw intError;
  if (!interests || interests.length === 0) return [];

  const receiverIds = interests.map(i => i.receiver_id);

  const [{ data: profiles, error: profError }, { data: photosData }] = await Promise.all([
    supabase
      .from('profiles')
      .select(`
        id, full_name, dob, gender,
        occupation:occupations(name),
        education_level:education_levels(name),
        city:cities(name),
        religion:religions(name)
      `)
      .in('id', receiverIds),
    supabase
      .from('profile_photos')
      .select('id, user_id, r2_key, thumbnail_key, is_primary')
      .in('user_id', receiverIds)
  ]);

  if (profError) throw profError;

  const profileMap = {};
  for (const prof of (profiles || [])) {
    prof.profile_photos = (photosData || []).filter(p => p.user_id === prof.id);
    prof.occupation = prof.occupation?.name || null;
    prof.education = prof.education_level?.name || null;
    prof.city = prof.city?.name || null;
    prof.religion = prof.religion?.name || null;
    profileMap[prof.id] = prof;
  }

  return interests.map(interest => {
    const prof = profileMap[interest.receiver_id];
    return {
      ...interest,
      receiver: prof ? {
        ...prof,
        profile_photos: (prof.profile_photos || []).map(p => ({
          ...p,
          photo_url: getR2PhotoUrl(p.r2_key),
          thumbnail_url: getR2PhotoUrl(p.thumbnail_key),
        })),
      } : null,
    };
  });
};

/**
 * Accept interest via RPC
 */
export const acceptInterest = async (interestId) => {
  const { data, error } = await supabase.rpc('fn_respond_interest', {
    p_interest_id: interestId,
    p_response: 'accepted',
  });

  if (error) throw error;
  return data;
};

/**
 * Decline interest via RPC
 */
export const declineInterest = async (interestId) => {
  const { data, error } = await supabase.rpc('fn_respond_interest', {
    p_interest_id: interestId,
    p_response: 'rejected',
  });

  if (error) throw error;
  return data;
};

/**
 * Check if interest already sent
 */
export const checkInterestStatus = async (senderId, receiverId) => {
  const { data, error } = await supabase
    .from('interests')
    .select('id, status')
    .or(`and(sender_id.eq.${senderId},receiver_id.eq.${receiverId}),and(sender_id.eq.${receiverId},receiver_id.eq.${senderId})`)
    .maybeSingle();

  if (error) return null;
  return data;
};

/**
 * Pass on a profile (Not Interested)
 */
export const passProfile = async (senderId, receiverId) => {
  const { data, error } = await supabase.rpc('fn_mark_not_interested', {
    p_target_user_id: receiverId,
  });

  if (error) throw error;
  return data;
};

/**
 * Get passed profiles (Not Interested)
 */
export const getPassedProfiles = async (userId) => {
  // 1. Fetch passed records
  const { data: passes, error: passError } = await supabase
    .from('not_interested')
    .select('*')
    .eq('user_id', userId)
    .order('created_at', { ascending: false });

  if (passError) throw passError;
  if (!passes || passes.length === 0) return [];

  const targetIds = passes.map(p => p.target_user_id);

  // 2. Fetch profiles
  const [{ data: profiles, error: profError }, { data: photosData }] = await Promise.all([
    supabase
      .from('profiles')
      .select(`
        id, full_name, dob, gender,
        occupation:occupations(name),
        education_level:education_levels(name),
        city:cities(name),
        religion:religions(name)
      `)
      .in('id', targetIds),
    supabase
      .from('profile_photos')
      .select('id, user_id, r2_key, thumbnail_key, is_primary')
      .in('user_id', targetIds)
  ]);

  if (profError) throw profError;

  // 3. Map together
  const profileMap = {};
  for (const prof of (profiles || [])) {
    prof.profile_photos = (photosData || []).filter(p => p.user_id === prof.id);
    prof.occupation = prof.occupation?.name || null;
    prof.education = prof.education_level?.name || null;
    prof.city = prof.city?.name || null;
    prof.religion = prof.religion?.name || null;
    profileMap[prof.id] = prof;
  }

  return passes.map(item => {
    const prof = profileMap[item.target_user_id];
    return {
      ...item,
      target: prof ? {
        ...prof,
        profile_photos: (prof.profile_photos || []).map(p => ({
          ...p,
          photo_url: getR2PhotoUrl(p.r2_key),
          thumbnail_url: getR2PhotoUrl(p.thumbnail_key),
        })),
      } : null,
    };
  });
};

/**
 * Restore a passed profile
 */
export const restorePassedProfile = async (targetUserId) => {
  const { data, error } = await supabase.rpc('fn_undo_not_interested', {
    p_target_user_id: targetUserId,
  });

  if (error) throw error;
  return data;
};

/**
 * Get all profile IDs the user has interacted with (sent, received, passed)
 */
export const getUserInteractions = async (userId) => {
  const [
    { data: interests, error: intError },
    { data: passed, error: passError }
  ] = await Promise.all([
    supabase
      .from('interests')
      .select('sender_id, receiver_id')
      .or(`sender_id.eq.${userId},receiver_id.eq.${userId}`),
    supabase
      .from('not_interested')
      .select('target_user_id')
      .eq('user_id', userId)
  ]);

  if (intError) console.warn('Failed to fetch user interests:', intError);
  if (passError) console.warn('Failed to fetch user passes:', passError);

  const interactedIds = new Set();
  
  if (interests) {
    interests.forEach(interaction => {
      if (interaction.sender_id !== userId) interactedIds.add(interaction.sender_id);
      if (interaction.receiver_id !== userId) interactedIds.add(interaction.receiver_id);
    });
  }

  if (passed) {
    passed.forEach(p => interactedIds.add(p.target_user_id));
  }

  return Array.from(interactedIds);
};

/**
 * View contact details with credit deduction
 * @param {string} viewerId
 * @param {string} targetId
 * @param {string} type - 'phone' | 'horoscope'
 */
export const viewContact = async (viewerId, targetId, type = 'phone') => {
  const { data, error } = await supabase.rpc('fn_view_contact_credit', {
    p_viewed_user_id: targetId,
    p_type: type,
  });

  if (error) throw error;
  return data;
};

/**
 * Subscribe to interest changes (realtime)
 */
export const subscribeToInterestChanges = (userId, onChange) => {
  const uniqueId = Math.random().toString(36).substring(7);
  return supabase
    .channel(`interests:${userId}:${uniqueId}`)
    .on('postgres_changes', { event: '*', schema: 'public', table: 'interests', filter: `sender_id=eq.${userId}` }, onChange)
    .on('postgres_changes', { event: '*', schema: 'public', table: 'interests', filter: `receiver_id=eq.${userId}` }, onChange)
    .subscribe();
};
