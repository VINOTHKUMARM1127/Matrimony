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
  // 1. Fetch all accepted interests where the user is either sender or receiver
  const { data: interests, error: intError } = await supabase
    .from('interests')
    .select('id, sender_id, receiver_id, status, updated_at')
    .eq('status', 'accepted')
    .or(`sender_id.eq.${userId},receiver_id.eq.${userId}`);

  if (intError) throw intError;
  if (!interests || interests.length === 0) return [];

  // 2. Fetch chats for the user to get message history
  const { data: chats, error: chatError } = await supabase
    .from('chats')
    .select('id, interest_id, last_message_text, last_message_at, is_active')
    .or(`participant_1.eq.${userId},participant_2.eq.${userId}`);
    
  if (chatError) throw chatError;

  // 3. Gather other user IDs
  const otherUserIds = interests.map(i => i.sender_id === userId ? i.receiver_id : i.sender_id);
  
  if (otherUserIds.length === 0) return [];

  // 4. Fetch profiles, photos, and block status for these users manually
  const [
    { data: profilesData, error: profError },
    { data: photosData },
    { data: bRows }
  ] = await Promise.all([
    supabase
      .from('profiles')
      .select('id, full_name')
      .in('id', otherUserIds),
    supabase
      .from('profile_photos')
      .select('id, user_id, r2_key, thumbnail_key, is_primary')
      .in('user_id', otherUserIds),
    supabase
      .from('blocked_users')
      .select('blocker_id, blocked_id')
      .or(`blocker_id.eq.${userId},blocked_id.eq.${userId}`)
  ]);

  if (profError) throw profError;

  const blockedRows = bRows || [];

  // Map profiles and photos
  const profileMap = {};
  for (const prof of (profilesData || [])) {
    prof.profile_photos = (photosData || []).filter(p => p.user_id === prof.id);
    profileMap[prof.id] = prof;
  }

  // 5. Map and merge everything
  const result = interests.map(interest => {
    const isSender = interest.sender_id === userId;
    const otherUserId = isSender ? interest.receiver_id : interest.sender_id;
    const otherProfile = profileMap[otherUserId];
    
    // Find the corresponding chat
    const chat = (chats || []).find(c => c.interest_id === interest.id);

    const blockedByMe = blockedRows.some(r => r.blocker_id === userId && r.blocked_id === otherUserId);
    const blockedByOther = blockedRows.some(r => r.blocker_id === otherUserId && r.blocked_id === userId);

    return {
      id: chat?.id || null, // Might be null if chat not initiated yet
      interest_id: interest.id,
      last_message_text: chat?.last_message_text || null,
      last_message_at: chat?.last_message_at || interest.updated_at,
      is_active: chat ? chat.is_active : true,
      isBlocked: blockedByMe || blockedByOther,
      blockedByMe,
      blockedByOther,
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

  // Sort by last activity descending
  return result.sort((a, b) => new Date(b.last_message_at) - new Date(a.last_message_at));
};

/**
 * Get messages for a chat
 */
export const getMessages = async (chatId, limit = 25, before = null) => {
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
  const { data: rawChatId, error } = await supabase.rpc('fn_create_or_get_chat', {
    p_other_user_id: userId2,
  });

  if (error) throw error;

  // Defensively extract chatId in case it's returned as an object/array
  let chatId = rawChatId;
  if (Array.isArray(rawChatId)) chatId = rawChatId[0];
  if (typeof chatId === 'object' && chatId !== null) {
    chatId = chatId.fn_create_or_get_chat || chatId.id || Object.values(chatId)[0];
  }

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
 * Subscribe to new messages and deletions in a chat
 */
export const subscribeToMessages = (chatId, onInsert, onDelete) => {
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
      (payload) => onInsert && onInsert(payload.new)
    )
    .on(
      'postgres_changes',
      {
        event: 'DELETE',
        schema: 'public',
        table: 'messages',
        filter: `chat_id=eq.${chatId}`,
      },
      (payload) => onDelete && onDelete(payload.old)
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

/**
 * Subscribe to chat list and block updates (realtime)
 */
export const subscribeToChatListUpdates = (userId, onChange) => {
  const uniqueId = Math.random().toString(36).substring(7);
  return supabase
    .channel(`chatlist:${userId}:${uniqueId}`)
    .on('postgres_changes', { event: '*', schema: 'public', table: 'chats', filter: `participant_1=eq.${userId}` }, onChange)
    .on('postgres_changes', { event: '*', schema: 'public', table: 'chats', filter: `participant_2=eq.${userId}` }, onChange)
    .on('postgres_changes', { event: '*', schema: 'public', table: 'blocked_users', filter: `blocker_id=eq.${userId}` }, onChange)
    .on('postgres_changes', { event: '*', schema: 'public', table: 'blocked_users', filter: `blocked_id=eq.${userId}` }, onChange)
    .subscribe();
};

/**
 * Block a user
 */
export const blockUser = (targetId) => supabase.rpc('fn_block_user', { p_target_user_id: targetId });

/**
 * Unblock a user
 */
export const unblockUser = (targetId) => supabase.rpc('fn_unblock_user', { p_target_user_id: targetId });

/**
 * Get detailed block status between two users
 */
export const getBlockStatus = async (userId, targetId) => {
  const { data, error } = await supabase.rpc('fn_is_blocked', { p_user_a: userId, p_user_b: targetId });
  if (error) throw error;
  
  // Also determine direction for UI wording (who blocked whom) via a direct select
  const { data: rows } = await supabase
    .from('blocked_users')
    .select('blocker_id, blocked_id')
    .or(`and(blocker_id.eq.${userId},blocked_id.eq.${targetId}),and(blocker_id.eq.${targetId},blocked_id.eq.${userId})`);
    
  const blockedByMe = (rows || []).some(r => r.blocker_id === userId);
  const blockedByOther = (rows || []).some(r => r.blocker_id === targetId);
  
  return { isBlocked: !!data, blockedByMe, blockedByOther };
};
