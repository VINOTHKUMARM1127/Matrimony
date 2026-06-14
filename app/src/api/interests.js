/**
 * Tamil Matrimony — Interests API
 * Send, receive, accept/decline interest requests
 */
import supabase from './supabaseClient';

/**
 * Send interest to a user securely via backend RPC
 */
export const sendInterest = async (senderId, receiverId, message = '') => {
  const { data, error } = await supabase.rpc('send_interest_with_quota', {
    p_sender_id: senderId,
    p_receiver_id: receiverId,
    p_message: message || null
  });

  if (error) throw error;
  return data;
};

/**
 * Get received interests
 */
export const getReceivedInterests = async (userId, status = 'pending') => {
  const { data, error } = await supabase
    .from('interests')
    .select(`
      *,
      sender:profiles!interests_sender_id_fkey (
        id, display_name, date_of_birth, city, education, occupation,
        photos (id, storage_path, thumbnail_path, is_primary)
      )
    `)
    .eq('receiver_id', userId)
    .eq('status', status)
    .order('created_at', { ascending: false });

  if (error) throw error;
  return data || [];
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
        id, display_name, date_of_birth, city, education, occupation,
        photos (id, storage_path, thumbnail_path, is_primary)
      )
    `)
    .eq('sender_id', userId)
    .neq('status', 'declined')
    .order('created_at', { ascending: false });

  if (error) throw error;
  return data || [];
};

/**
 * Accept interest
 */
export const acceptInterest = async (interestId) => {
  const { data, error } = await supabase
    .from('interests')
    .update({ status: 'accepted', updated_at: new Date().toISOString() })
    .eq('id', interestId)
    .select()
    .single();

  if (error) throw error;
  return data;
};

/**
 * Decline interest
 */
export const declineInterest = async (interestId) => {
  const { data, error } = await supabase
    .from('interests')
    .update({ status: 'declined', updated_at: new Date().toISOString() })
    .eq('id', interestId)
    .select()
    .single();

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
  const { data, error } = await supabase.rpc('pass_profile', {
    p_sender_id: senderId,
    p_receiver_id: receiverId
  });

  if (error) {
    throw error;
  }
  return data;
};

/**
 * Get passed profiles (Not Interested)
 */
export const getPassedProfiles = async (userId) => {
  const { data, error } = await supabase
    .from('interests')
    .select(`
      *,
      receiver:profiles!interests_receiver_id_fkey (
        id, display_name, date_of_birth, city, education, occupation,
        photos (id, storage_path, thumbnail_path, is_primary)
      )
    `)
    .eq('sender_id', userId)
    .eq('status', 'declined')
    .order('created_at', { ascending: false });

  if (error) throw error;
  return data || [];
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
