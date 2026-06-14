/**
 * Tamil Matrimony — Chat API
 * Messaging and realtime chat functions
 */
import supabase from './supabaseClient';

/**
 * Get user's chat list
 */
export const getChatList = async (userId) => {
  const { data, error } = await supabase
    .from('chats')
    .select(`
      *,
      participant_1_profile:profiles!chats_participant_1_fkey (
        id, display_name, city,
        photos (id, storage_path, thumbnail_path, is_primary)
      ),
      participant_2_profile:profiles!chats_participant_2_fkey (
        id, display_name, city,
        photos (id, storage_path, thumbnail_path, is_primary)
      )
    `)
    .or(`participant_1.eq.${userId},participant_2.eq.${userId}`)
    .eq('is_approved', true)
    .order('last_message_at', { ascending: false });

  if (error) throw error;

  // Map to normalize the other participant
  return (data || []).map((chat) => {
    const otherUser = chat.participant_1 === userId
      ? chat.participant_2_profile
      : chat.participant_1_profile;
    return { ...chat, otherUser };
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
 */
export const createChat = async (userId1, userId2) => {
  // Check if chat exists
  const { data: existing } = await supabase
    .from('chats')
    .select('*')
    .or(
      `and(participant_1.eq.${userId1},participant_2.eq.${userId2}),and(participant_1.eq.${userId2},participant_2.eq.${userId1})`
    )
    .maybeSingle();

  if (existing) return existing;

  // Create new chat
  const { data, error } = await supabase
    .from('chats')
    .insert({
      participant_1: userId1,
      participant_2: userId2,
      is_approved: true,
    })
    .select()
    .single();

  if (error) throw error;
  return data;
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
  const { count, error } = await supabase
    .from('messages')
    .select('id', { count: 'exact', head: true })
    .neq('sender_id', userId)
    .eq('is_read', false);

  if (error) return 0;
  return count || 0;
};
