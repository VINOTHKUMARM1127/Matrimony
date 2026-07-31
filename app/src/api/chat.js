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

/**
 * Look up the other participant's profile for a given chat.
 * Used when ChatScreen is opened from a push notification tap,
 * where only chatId is available (no otherUser object in route params).
 */
export const getChatParticipant = async (chatId, currentUserId) => {
  // 1. Get the chat row to find the other participant
  const { data: chat, error: chatErr } = await supabase
    .from('chats')
    .select('participant_1, participant_2')
    .eq('id', chatId)
    .single();

  if (chatErr || !chat) throw chatErr || new Error('Chat not found');

  const otherUserId = chat.participant_1 === currentUserId
    ? chat.participant_2
    : chat.participant_1;

  // 2. Fetch their profile + photos
  const [
    { data: profile, error: profErr },
    { data: photos },
  ] = await Promise.all([
    supabase
      .from('profiles')
      .select('id, full_name, city')
      .eq('id', otherUserId)
      .single(),
    supabase
      .from('profile_photos')
      .select('id, user_id, r2_key, thumbnail_key, is_primary')
      .eq('user_id', otherUserId),
  ]);

  if (profErr || !profile) throw profErr || new Error('Profile not found');

  return {
    ...profile,
    profile_photos: (photos || []).map(p => ({
      ...p,
      photo_url: getR2PhotoUrl(p.r2_key),
      thumbnail_url: getR2PhotoUrl(p.thumbnail_key),
    })),
  };
};
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

export const sendMessage = async (chatId, senderId, content, messageType = 'text') => {
  // 1. Verify active session before attempting insert
  const { data: { session }, error: sessionError } = await supabase.auth.getSession();
  
  if (sessionError || !session?.user?.id) {
    throw new Error('Session expired. Please close the app and log in again.');
  }

  if (session.user.id !== senderId) {
    throw new Error('Auth mismatch. Local user does not match live session.');
  }

  // 2. Perform the insert
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

  // NOTE: No client-side chats.update() here — the DB trigger
  // trg_fn_after_message_insert already sets last_message_text and
  // last_message_at atomically using the server clock. A redundant
  // client write with new Date().toISOString() would use the device
  // clock, which can corrupt sort order if the phone's time is off.

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
 * Subscribe to new messages, updates, and deletions in a chat
 */
export const subscribeToMessages = (chatId, onInsert, onDelete, onUpdate) => {
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
        event: 'UPDATE',
        schema: 'public',
        table: 'messages',
        filter: `chat_id=eq.${chatId}`,
      },
      (payload) => onUpdate && onUpdate(payload.new)
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
 * Get unread message count per chat (for badge display on chat list).
 * Returns a map: { [chatId]: number }.
 * PostgREST can't do GROUP BY, so we fetch the chat_id of each unread
 * message and count client-side — the cap of 25 messages per chat keeps
 * the result set very small.
 */
export const getUnreadCountPerChat = async (userId) => {
  // Get all chat IDs where user is a participant
  const { data: chats } = await supabase
    .from('chats')
    .select('id')
    .or(`participant_1.eq.${userId},participant_2.eq.${userId}`);

  if (!chats || chats.length === 0) return {};

  const chatIds = chats.map(c => c.id);

  const { data, error } = await supabase
    .from('messages')
    .select('chat_id')
    .in('chat_id', chatIds)
    .neq('sender_id', userId)
    .eq('is_read', false);

  if (error || !data) return {};

  const counts = {};
  for (const row of data) {
    counts[row.chat_id] = (counts[row.chat_id] || 0) + 1;
  }
  return counts;
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

/**
 * Upsert presence row — signals that this user is actively viewing the chat.
 * Called on ChatScreen mount and every ~15s as a heartbeat.
 */
export const upsertChatPresence = async (chatId, userId) => {
  const { error } = await supabase
    .from('chat_presence')
    .upsert(
      {
        chat_id: chatId,
        user_id: userId,
        last_active_at: new Date().toISOString(),
      },
      { onConflict: 'chat_id,user_id' }
    );
  if (error) console.warn('upsertChatPresence error:', error);
};

/**
 * Delete presence row — signals that this user has left the chat screen.
 * Called on ChatScreen unmount and when app backgrounds.
 */
export const deleteChatPresence = async (chatId, userId) => {
  const { error } = await supabase
    .from('chat_presence')
    .delete()
    .eq('chat_id', chatId)
    .eq('user_id', userId);
  if (error) console.warn('deleteChatPresence error:', error);
};

/**
 * Get the other participant's presence row for a chat
 */
export const getChatPresence = async (chatId, excludeUserId) => {
  const { data, error } = await supabase
    .from('chat_presence')
    .select('*')
    .eq('chat_id', chatId)
    .neq('user_id', excludeUserId)
    .maybeSingle();
  if (error && error.code !== 'PGRST116') {
    console.warn('getChatPresence error:', error);
  }
  return data;
};

/**
 * Subscribe to realtime changes in chat presence for a specific chat
 */
export const subscribeToChatPresence = (chatId, onChange) => {
  return supabase
    .channel(`presence:${chatId}`)
    .on(
      'postgres_changes',
      {
        event: '*',
        schema: 'public',
        table: 'chat_presence',
        filter: `chat_id=eq.${chatId}`,
      },
      (payload) => onChange && onChange(payload)
    )
    .subscribe();
};

// ─── App-wide User Presence (drives grey double-tick for "online") ───

/**
 * Upsert the current user's app-wide presence row AND backfill delivered_at
 * for any messages received while offline.
 * Uses the fn_upsert_user_presence_and_backfill RPC which atomically:
 *   1. Upserts user_presence (same as before)
 *   2. Sets delivered_at = now() on any received messages where delivered_at IS NULL
 * Called from PresenceHeartbeat component every 15s while app is foregrounded.
 */
export const upsertUserPresence = async (userId) => {
  const { error } = await supabase.rpc('fn_upsert_user_presence_and_backfill', {
    p_user_id: userId,
  });
  if (error) console.warn('upsertUserPresence error:', error);
};

/**
 * Get another user's app-wide presence row (one-off check).
 */
export const getUserPresence = async (userId) => {
  const { data, error } = await supabase
    .from('user_presence')
    .select('*')
    .eq('user_id', userId)
    .maybeSingle();
  if (error && error.code !== 'PGRST116') {
    console.warn('getUserPresence error:', error);
  }
  return data;
};

/**
 * Subscribe to realtime changes in a specific user's app-wide presence.
 */
export const subscribeToUserPresence = (userId, onChange) => {
  return supabase
    .channel(`user-presence:${userId}`)
    .on(
      'postgres_changes',
      {
        event: '*',
        schema: 'public',
        table: 'user_presence',
        filter: `user_id=eq.${userId}`,
      },
      (payload) => onChange && onChange(payload)
    )
    .subscribe();
};

// ─── Batch presence helpers (for ChatListScreen) ───

/**
 * Fetch presence for multiple users in a single query.
 * Returns an array of { user_id, last_active_at } rows.
 * RLS on user_presence_select already restricts to chat partners.
 */
export const getBatchUserPresence = async (userIds) => {
  if (!userIds || userIds.length === 0) return [];
  const { data, error } = await supabase
    .from('user_presence')
    .select('user_id, last_active_at')
    .in('user_id', userIds);
  if (error) {
    console.warn('getBatchUserPresence error:', error);
    return [];
  }
  return data || [];
};

/**
 * Subscribe to ALL user_presence changes visible to the current user.
 * No per-user filter — RLS on user_presence_select already restricts
 * visible rows to users who share a chat with the caller. This is the
 * correct pattern for a list screen with many contacts.
 */
export const subscribeToAllUserPresence = (onChange) => {
  return supabase
    .channel(`user-presence-all:${Date.now()}`)
    .on(
      'postgres_changes',
      {
        event: '*',
        schema: 'public',
        table: 'user_presence',
      },
      (payload) => onChange && onChange(payload)
    )
    .subscribe();
};
