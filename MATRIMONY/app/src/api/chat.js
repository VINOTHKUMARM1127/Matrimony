/**
 * Wedring Matrimony — Chat API
 * Messaging and realtime chat functions
 *
 * SCHEMA NOTES:
 * - `chats` table: participant_1 uuid, participant_2 uuid (canonical: p1 < p2)
 * - `messages` table: chat_id, sender_id, content, message_type, is_read
 * - `fn_create_or_get_chat(p_other_user_id)` RPC handles canonical ordering
 * - Realtime enabled on `messages` table
 */
import supabase from './supabaseClient';
import { getR2PhotoUrl } from './profiles';

/**
 * Get user's chat list
 */
export const getChatList = async (userId) => {
  const { data, error } = await supabase
    .from('chats')
    .select(`
      *,
      participant_1_profile:profiles!chats_participant_1_fkey (
        id, full_name,
        profile_photos (id, r2_key, thumbnail_key, is_primary)
      ),
      participant_2_profile:profiles!chats_participant_2_fkey (
        id, full_name,
        profile_photos (id, r2_key, thumbnail_key, is_primary)
      )
    `)
    .or(`participant_1.eq.${userId},participant_2.eq.${userId}`)
    .eq('is_active', true)
    .order('last_message_at', { ascending: false, nullsFirst: false });

  if (error) throw error;

  // Map to normalize the other participant + attach photo URLs
  return (data || []).map((chat) => {
    const isP1 = chat.participant_1 === userId;
    const otherProfile = isP1 ? chat.participant_2_profile : chat.participant_1_profile;

    return {
      ...chat,
      otherUser: otherProfile ? {
        ...otherProfile,
        profile_photos: (otherProfile.profile_photos || []).map(p => ({
          ...p,
          photo_url: getR2PhotoUrl(p.r2_key),
          thumbnail_url: getR2PhotoUrl(p.thumbnail_key),
        })),
      } : null,
    };
  });
};

/**
 * Get messages for a chat
 */
export const getMessages = async (chatId, limit = 50, before = null) => {
  let query = supabase
    .from('messages')
    .select('*')
    .eq('chat_id', chatId)
    .order('created_at', { ascending: false })
    .limit(limit);

  if (before) {
    query = query.lt('created_at', before);
  }

  const { data, error } = await query;
  if (error) throw error;
  return (data || []).reverse();
};

/**
 * Send a message
 */
export const sendMessage = async (chatId, senderId, content, messageType = 'text') => {
  const { data, error } = await supabase
    .from('messages')
    .insert({
      chat_id: chatId,
      sender_id: senderId,
      content,
      message_type: messageType,
    })
    .select()
    .single();

  if (error) throw error;

  // Update chat last message
  await supabase
    .from('chats')
    .update({
      last_message_text: content,
      last_message_at: new Date().toISOString(),
    })
    .eq('id', chatId);

  return data;
};

/**
 * Create or get existing chat between two users
 * Uses the fn_create_or_get_chat RPC which handles canonical ordering.
 */
export const createChat = async (userId1, userId2) => {
  // Use RPC for canonical ordering
  const { data: chatId, error } = await supabase.rpc('fn_create_or_get_chat', {
    p_other_user_id: userId2,
  });

  if (error) throw error;

  // Fetch the full chat record
  const { data: chat, error: fetchError } = await supabase
    .from('chats')
    .select('*')
    .eq('id', chatId)
    .single();

  if (fetchError) throw fetchError;
  return chat;
};

/**
 * Mark messages as read
 */
export const markMessagesRead = async (chatId, userId) => {
  const { error } = await supabase
    .from('messages')
    .update({ is_read: true })
    .eq('chat_id', chatId)
    .neq('sender_id', userId)
    .eq('is_read', false);

  if (error) console.warn('Mark read error:', error);
};

/**
 * Subscribe to new messages in a chat
 */
export const subscribeToMessages = (chatId, callback) => {
  return supabase
    .channel(`chat:${chatId}`)
    .on(
      'postgres_changes',
      {
        event: 'INSERT',
        schema: 'public',
        table: 'messages',
        filter: `chat_id=eq.${chatId}`,
      },
      (payload) => callback(payload.new)
    )
    .subscribe();
};

/**
 * Get unread message count
 */
export const getUnreadCount = async (userId) => {
  // Get all chat IDs where user is a participant
  const { data: chats } = await supabase
    .from('chats')
    .select('id')
    .or(`participant_1.eq.${userId},participant_2.eq.${userId}`);

  if (!chats || chats.length === 0) return 0;

  const chatIds = chats.map(c => c.id);

  const { count, error } = await supabase
    .from('messages')
    .select('id', { count: 'exact', head: true })
    .in('chat_id', chatIds)
    .neq('sender_id', userId)
    .eq('is_read', false);

  if (error) return 0;
  return count || 0;
};
