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
export const getReceivedInterests = async (userId, status = 'sent') => {
  const { data, error } = await supabase
    .from('interests')
    .select(`
      *,
      sender:profiles!interests_sender_id_fkey (
        id, full_name, dob, gender,
        profile_photos (id, r2_key, thumbnail_key, is_primary)
      )
    `)
    .eq('receiver_id', userId)
    .eq('status', status)
    .order('created_at', { ascending: false });

  if (error) throw error;

  // Attach photo URLs
  return (data || []).map(interest => ({
    ...interest,
    sender: interest.sender ? {
      ...interest.sender,
      profile_photos: (interest.sender.profile_photos || []).map(p => ({
        ...p,
        photo_url: getR2PhotoUrl(p.r2_key),
        thumbnail_url: getR2PhotoUrl(p.thumbnail_key),
      })),
    } : null,
  }));
};

/**
 * Get sent interests
 */
export const getSentInterests = async (userId) => {
  const { data, error } = await supabase
    .from('interests')
    .select(`
      *,
      receiver:profiles!interests_receiver_id_fkey (
        id, full_name, dob, gender,
        profile_photos (id, r2_key, thumbnail_key, is_primary)
      )
    `)
    .eq('sender_id', userId)
    .neq('status', 'rejected')
    .order('created_at', { ascending: false });

  if (error) throw error;

  return (data || []).map(interest => ({
    ...interest,
    receiver: interest.receiver ? {
      ...interest.receiver,
      profile_photos: (interest.receiver.profile_photos || []).map(p => ({
        ...p,
        photo_url: getR2PhotoUrl(p.r2_key),
        thumbnail_url: getR2PhotoUrl(p.thumbnail_key),
      })),
    } : null,
  }));
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
  const { data, error } = await supabase
    .from('not_interested')
    .select(`
      *,
      target:profiles!not_interested_target_user_id_fkey (
        id, full_name, dob, gender,
        profile_photos (id, r2_key, thumbnail_key, is_primary)
      )
    `)
    .eq('user_id', userId)
    .order('created_at', { ascending: false });

  if (error) throw error;

  return (data || []).map(item => ({
    ...item,
    target: item.target ? {
      ...item.target,
      profile_photos: (item.target.profile_photos || []).map(p => ({
        ...p,
        photo_url: getR2PhotoUrl(p.r2_key),
        thumbnail_url: getR2PhotoUrl(p.thumbnail_key),
      })),
    } : null,
  }));
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
  const { data, error } = await supabase
    .from('interests')
    .select('sender_id, receiver_id')
    .or(`sender_id.eq.${userId},receiver_id.eq.${userId}`);

  if (error) {
    console.warn('Failed to fetch user interactions:', error);
    return [];
  }

  const interactedIds = new Set();
  data.forEach(interaction => {
    if (interaction.sender_id !== userId) interactedIds.add(interaction.sender_id);
    if (interaction.receiver_id !== userId) interactedIds.add(interaction.receiver_id);
  });

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
