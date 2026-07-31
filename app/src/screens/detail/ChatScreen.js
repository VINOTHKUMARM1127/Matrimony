/**
 * Wedring Matrimony — ChatScreen Component
 * Real-time chat screen featuring database-driven messaging, pagination, and clean design.
 */
import React, { useState, useEffect, useRef, useCallback } from 'react';
import {
  View,
  Text,
  StyleSheet,
  FlatList,
  TextInput,
  TouchableOpacity,
  KeyboardAvoidingView,
  Platform,
  SafeAreaView,
  ActivityIndicator,
  StatusBar,
  Alert,
  AppState,
} from 'react-native';
import { SafeAreaView as SafeAreaContextView } from 'react-native-safe-area-context';
import { useQuery, useMutation, useQueryClient } from '@tanstack/react-query';
import { colors } from '../../theme';
import { borderRadius } from '../../theme/spacing';
import Avatar from '../../components/common/Avatar';
import Icon from '../../components/common/Icon';
import useAuthStore from '../../store/useAuthStore';
import * as chatApi from '../../api/chat';
import { getPrimaryPhotoUrl } from '../../api/profiles';
import usePremium from '../../hooks/usePremium';
import * as Notifications from 'expo-notifications';

const ChatScreen = ({ route, navigation }) => {
  const { chatId, otherUser: otherUserParam } = route.params || {};
  const currentUser = useAuthStore((s) => s.user);
  const queryClient = useQueryClient();

  const [messageText, setMessageText] = useState('');
  const [isSubscribed, setIsSubscribed] = useState(false);
  const [otherUser, setOtherUser] = useState(otherUserParam || null);

  // Track which chatId the current otherUser actually belongs to,
  // so we can detect stale data when React Navigation merges params
  // for a different chat without remounting the screen.
  const otherUserChatIdRef = useRef(otherUserParam ? chatId : null);

  const flatListRef = useRef(null);

  // 0a. Reset otherUser when chatId changes (merged-params navigation).
  //     If the chatId no longer matches what we stored, clear the stale
  //     otherUser so the fetch effect below re-fires for the new chat.
  useEffect(() => {
    if (chatId !== otherUserChatIdRef.current) {
      setOtherUser(null);
      otherUserChatIdRef.current = null;
    }
  }, [chatId]);

  // 0b. If opened from a push notification (no otherUser in route params),
  //     look up the other participant from the chats table.
  useEffect(() => {
    if (otherUser || !chatId || !currentUser?.id) return;
    chatApi.getChatParticipant(chatId, currentUser.id)
      .then((result) => {
        setOtherUser(result);
        otherUserChatIdRef.current = chatId;
      })
      .catch((err) => console.warn('getChatParticipant error:', err));
  }, [chatId, currentUser?.id, otherUser]);

  // 1. Fetch messages
  const {
    data: messages = [],
    isLoading,
    isFetchingNextPage,
  } = useQuery({
    queryKey: ['chatMessages', chatId],
    queryFn: () => chatApi.getMessages(chatId),
    enabled: !!chatId,
    staleTime: 0, // Keep fresh to allow subscription updates
    gcTime: 0, // Prevent caching deleted messages
  });

  // 1b. Premium and Block Status
  const { isPremium } = usePremium();
  const { data: blockStatus, refetch: refetchBlockStatus } = useQuery({
    queryKey: ['blockStatus', currentUser?.id, otherUser?.id],
    queryFn: () => chatApi.getBlockStatus(currentUser?.id, otherUser?.id),
    enabled: !!currentUser?.id && !!otherUser?.id,
  });

  // 2. Mark messages as read
  useEffect(() => {
    if (chatId && currentUser?.id) {
      chatApi.markMessagesRead(chatId, currentUser.id);
    }
  }, [chatId, currentUser?.id, messages]);

  // 3. Realtime message subscription, Push Suppression & Presence Heartbeat
  useEffect(() => {
    if (!chatId || !currentUser?.id) return;

    // Suppress push notifications for this specific chat while screen is open
    Notifications.setNotificationHandler({
      handleNotification: async (notification) => {
        const data = notification.request.content.data;
        if (data?.type === 'new_message' && data?.entity_id === chatId) {
          return {
            shouldShowAlert: false,
            shouldPlaySound: false,
            shouldSetBadge: false,
          };
        }
        return {
          shouldShowAlert: true,
          shouldPlaySound: true,
          shouldSetBadge: true,
        };
      },
    });

    // --- Presence heartbeat (server-side push suppression) ---
    // Upsert immediately on mount
    chatApi.upsertChatPresence(chatId, currentUser.id);

    // Keep upserting every 15s while the screen stays mounted & app is active
    let heartbeatInterval = setInterval(() => {
      chatApi.upsertChatPresence(chatId, currentUser.id);
    }, 15000);

    // AppState listener: pause heartbeat + delete presence on background,
    // resume on active
    const appStateSubscription = AppState.addEventListener('change', (nextState) => {
      if (nextState === 'background' || nextState === 'inactive') {
        // App backgrounded — stop heartbeat and clear presence
        if (heartbeatInterval) {
          clearInterval(heartbeatInterval);
          heartbeatInterval = null;
        }
        chatApi.deleteChatPresence(chatId, currentUser.id);
      } else if (nextState === 'active') {
        // App foregrounded while still on this chat — re-upsert and restart
        chatApi.upsertChatPresence(chatId, currentUser.id);
        if (!heartbeatInterval) {
          heartbeatInterval = setInterval(() => {
            chatApi.upsertChatPresence(chatId, currentUser.id);
          }, 15000);
        }
      }
    });

    const subscription = chatApi.subscribeToMessages(
      chatId,
      (newMessage) => {
        // Append the new message to React Query's cached list
        queryClient.setQueryData(['chatMessages', chatId], (oldMessages = []) => {
          // Prevent duplicate messages in cache
          if (oldMessages.some((m) => m.id === newMessage.id)) {
            return oldMessages;
          }
          return [...oldMessages, newMessage];
        });

        // Mark as read if the current user is active and isn't the sender
        if (newMessage.sender_id !== currentUser?.id) {
          chatApi.markMessagesRead(chatId, currentUser?.id);
        }
      },
      (deletedMessage) => {
        // Remove pruned message from UI immediately
        queryClient.setQueryData(['chatMessages', chatId], (oldMessages = []) => {
          return oldMessages.filter((m) => m.id !== deletedMessage.id);
        });
      },
      (updatedMessage) => {
        // Merge updated fields (e.g. is_read) into cached message
        queryClient.setQueryData(['chatMessages', chatId], (oldMessages = []) => {
          return oldMessages.map((m) =>
            m.id === updatedMessage.id ? { ...m, ...updatedMessage } : m
          );
        });
      }
    );

    // Also subscribe to block updates (to catch when other user blocks/unblocks us)
    const blockSub = chatApi.subscribeToChatListUpdates(currentUser.id, () => {
      refetchBlockStatus();
    });

    setIsSubscribed(true);

    return () => {
      // Stop heartbeat and clean up presence
      if (heartbeatInterval) clearInterval(heartbeatInterval);
      appStateSubscription.remove();
      chatApi.deleteChatPresence(chatId, currentUser.id);

      if (subscription) subscription.unsubscribe();
      if (blockSub) blockSub.unsubscribe();
      
      // Restore default notification handler
      Notifications.setNotificationHandler({
        handleNotification: async () => ({
          shouldShowAlert: true,
          shouldPlaySound: true,
          shouldSetBadge: true,
        }),
      });
    };
  }, [chatId, queryClient, currentUser?.id]);

  // NOTE: Tick status (single/double/blue) is now driven by the persistent
  // delivered_at column on each message row, not by live user_presence.
  // delivered_at is set server-side (trigger at insert time + heartbeat backfill)
  // and flows through the existing getMessages() / realtime onUpdate handler.
  // No subscription needed here — the message UPDATE event already triggers
  // a re-render when delivered_at changes.

  // 4. Send Message Mutation
  const sendMessageMutation = useMutation({
    mutationFn: (text) => chatApi.sendMessage(chatId, currentUser.id, text),
    onMutate: async (text) => {
      await queryClient.cancelQueries({ queryKey: ['chatMessages', chatId] });
      const previousMessages = queryClient.getQueryData(['chatMessages', chatId]);

      // Optimistically append a temporary message
      const tempMessage = {
        id: `temp-${Date.now()}`,
        chat_id: chatId,
        sender_id: currentUser.id,
        content: text,
        created_at: new Date().toISOString(),
        is_read: false,
        status: 'sending',
      };

      queryClient.setQueryData(['chatMessages', chatId], (old = []) => [...old, tempMessage]);

      return { previousMessages, tempMessageId: tempMessage.id };
    },
    onSuccess: (newMessage, text, context) => {
      // Replace temp message with the real one
      queryClient.setQueryData(['chatMessages', chatId], (oldMessages = []) => {
        const filtered = oldMessages.filter((m) => m.id !== context?.tempMessageId);
        if (filtered.some((m) => m.id === newMessage.id)) {
          return filtered;
        }
        return [...filtered, newMessage];
      });
      // Invalidate the chat list so the last message text updates there
      queryClient.invalidateQueries({ queryKey: ['chatList', currentUser?.id] });
    },
    onError: (err, text, context) => {
      // Restore previous messages to remove the temp one
      if (context?.previousMessages) {
        queryClient.setQueryData(['chatMessages', chatId], context.previousMessages);
      }
      // Restore typed text so it's not lost
      setMessageText(text);
      Alert.alert('Cannot send message', err.message || 'Failed to send message.');
      // Re-check block/premium status in case it changed mid-session
      refetchBlockStatus();
      queryClient.invalidateQueries({ queryKey: ['user_dashboard_summary', currentUser?.id] });
    }
  });

  const handleBlockToggle = () => {
    if (!blockStatus) return;
    
    if (blockStatus.blockedByMe) {
      Alert.alert('Unblock User', 'Are you sure you want to unblock this user?', [
        { text: 'Cancel', style: 'cancel' },
        { 
          text: 'Unblock', 
          onPress: async () => {
            try {
              await chatApi.unblockUser(otherUser.id);
              refetchBlockStatus();
            } catch (err) {
              Alert.alert('Error', 'Failed to unblock user');
            }
          }
        }
      ]);
    } else {
      Alert.alert('Block User', 'Are you sure you want to block this user? They will not be able to message you anymore.', [
        { text: 'Cancel', style: 'cancel' },
        { 
          text: 'Block', 
          style: 'destructive',
          onPress: async () => {
            try {
              await chatApi.blockUser(otherUser.id);
              refetchBlockStatus();
            } catch (err) {
              Alert.alert('Error', 'Failed to block user');
            }
          }
        }
      ]);
    }
  };

  const handleMoreOptions = () => {
    Alert.alert(
      otherUser?.full_name || 'Options',
      null,
      [
        {
          text: 'View Profile',
          onPress: () => navigation.navigate('UserProfile', { profileId: otherUser.id })
        },
        {
          text: blockStatus?.blockedByMe ? 'Unblock User' : 'Block User',
          style: blockStatus?.blockedByMe ? 'default' : 'destructive',
          onPress: handleBlockToggle
        },
        { text: 'Cancel', style: 'cancel' }
      ]
    );
  };

  const handleSend = () => {
    const trimmed = messageText.trim();
    if (!trimmed) return;

    setMessageText('');
    sendMessageMutation.mutate(trimmed);

    // Smooth scroll to bottom
    setTimeout(() => {
      flatListRef.current?.scrollToEnd({ animated: true });
    }, 100);
  };

  const formatMessageTime = (dateStr) => {
    if (!dateStr) return '';
    const date = new Date(dateStr);
    return date.toLocaleTimeString('en-IN', {
      hour: '2-digit',
      minute: '2-digit',
      hour12: true,
    });
  };

  const renderMessageItem = useCallback(({ item }) => {
    const isMe = item.sender_id === currentUser?.id;

    return (
      <View
        style={[
          styles.messageRow,
          isMe ? styles.messageRowRight : styles.messageRowLeft,
        ]}
      >
        <View
          style={[
            styles.bubble,
            isMe ? styles.bubbleSent : styles.bubbleReceived,
            item.status === 'sending' && { opacity: 0.7 },
          ]}
        >
          <Text style={isMe ? styles.textSent : styles.textReceived}>
            {item.content}
          </Text>
          <View style={styles.bubbleFooter}>
            <Text style={[styles.timeText, isMe ? styles.timeTextSent : styles.timeTextReceived]}>
              {formatMessageTime(item.created_at)}
            </Text>
            {isMe && item.status === 'sending' ? (
              <ActivityIndicator size="small" color={colors.textInverse} style={{ marginLeft: 4, transform: [{ scale: 0.6 }] }} />
            ) : (
              isMe && (
                <Text style={[styles.statusIndicator, item.is_read && { color: '#53bdeb' }]}>
                   {item.is_read ? ' ✓✓' : item.delivered_at ? ' ✓✓' : ' ✓'}
                </Text>
              )
            )}
          </View>
        </View>
      </View>
    );
  }, [currentUser?.id]);

  // Scroll to bottom on initial load and when messages change
  const handleContentSizeChange = () => {
    flatListRef.current?.scrollToEnd({ animated: true });
  };

  return (
    <SafeAreaContextView style={styles.safeArea}>
      <StatusBar barStyle="dark-content" backgroundColor={colors.background} />
      
      {/* Header */}
      <View style={styles.header}>
        <TouchableOpacity
          style={styles.backButton}
          onPress={() => navigation.goBack()}
          hitSlop={{ top: 8, bottom: 8, left: 8, right: 8 }}
        >
          <Icon name="chevronLeft" size={24} color={colors.textPrimary} strokeWidth={2.2} />
        </TouchableOpacity>
        
        <TouchableOpacity 
          style={styles.headerInfo} 
          activeOpacity={0.7}
          onPress={() => navigation.navigate('UserProfile', { profileId: otherUser.id })}
        >
          <Avatar
            source={getPrimaryPhotoUrl(otherUser)}
            name={otherUser?.full_name || 'User'}
            size="small"
          />
          <View style={styles.headerTextContainer}>
            <Text style={styles.headerName} numberOfLines={1}>
              {otherUser?.full_name || 'Chat'}
            </Text>
            <Text style={styles.headerSubtitle}>
              {otherUser?.city || 'Verified Member'}
            </Text>
          </View>
        </TouchableOpacity>
        <TouchableOpacity
          style={styles.headerAction}
          onPress={handleMoreOptions}
          hitSlop={{ top: 8, bottom: 8, left: 8, right: 8 }}
        >
          <Icon name="more" size={24} color={colors.textSecondary} />
        </TouchableOpacity>
      </View>

      <View style={styles.bannerContainer}>
        <Icon name="lock" size={14} color={colors.textSecondary} />
        <Text style={styles.bannerText}>
          Messages are kept for 7 days (last 25 messages). Exchange contact details early!
        </Text>
      </View>

      {/* Message List */}
      <KeyboardAvoidingView
        style={styles.keyboardAvoidingView}
        behavior={Platform.OS === 'ios' ? 'padding' : undefined}
        keyboardVerticalOffset={Platform.OS === 'ios' ? 90 : 0}
      >
        {isLoading ? (
          <View style={styles.loadingContainer}>
            <ActivityIndicator size="large" color={colors.primary} />
          </View>
        ) : (
          <FlatList
            ref={flatListRef}
            data={messages}
            keyExtractor={(item) => item.id}
            renderItem={renderMessageItem}
            contentContainerStyle={styles.listContent}
            onContentSizeChange={handleContentSizeChange}
            onLayout={handleContentSizeChange}
            showsVerticalScrollIndicator={false}
          />
        )}

        {/* Input Bar */}
        {blockStatus?.isBlocked ? (
          <View style={styles.bannerContainerAlert}>
            <Icon name="slash" size={16} color={colors.error} />
            <Text style={styles.bannerTextAlert}>
              {blockStatus.blockedByMe 
                ? "You have blocked this user. Unblock them to continue messaging." 
                : "You have been blocked by this user. You cannot send messages."}
            </Text>
          </View>
        ) : !isPremium ? (
          <View style={styles.premiumGateContainer}>
            <Text style={styles.premiumGateText}>Upgrade to Premium to start messaging</Text>
            <TouchableOpacity 
              style={styles.premiumGateBtn}
              onPress={() => navigation.navigate('Premium')}
            >
              <Text style={styles.premiumGateBtnText}>Upgrade Now</Text>
            </TouchableOpacity>
          </View>
        ) : (
          <View style={styles.inputBar}>
            <TextInput
              style={styles.input}
              value={messageText}
              onChangeText={setMessageText}
              placeholder="Type a message..."
              placeholderTextColor={colors.textMuted}
              multiline
              maxLength={1000}
            />
            <TouchableOpacity
              style={[
                styles.sendButton,
                !messageText.trim() && styles.sendButtonDisabled,
              ]}
              onPress={handleSend}
              disabled={!messageText.trim()}
            >
              <Icon name="arrowRight" size={20} color="#FFFFFF" strokeWidth={2.4} />
            </TouchableOpacity>
          </View>
        )}
      </KeyboardAvoidingView>
    </SafeAreaContextView>
  );
};

const styles = StyleSheet.create({
  safeArea: {
    flex: 1,
    backgroundColor: colors.background,
  },
  header: {
    flexDirection: 'row',
    alignItems: 'center',
    paddingHorizontal: 16,
    paddingVertical: 12,
    borderBottomWidth: 1,
    borderBottomColor: colors.borderLight,
    backgroundColor: colors.background,
  },
  backButton: {
    paddingRight: 16,
    paddingVertical: 8,
  },
  backIcon: {
    fontSize: 24,
    color: colors.primary,
    fontWeight: '700',
  },
  headerInfo: {
    flex: 1,
    flexDirection: 'row',
    alignItems: 'center',
  },
  headerTextContainer: {
    marginLeft: 12,
    flex: 1,
  },
  headerName: {
    fontSize: 16,
    fontWeight: '700',
    color: colors.textPrimary,
  },
  headerSubtitle: {
    fontSize: 12,
    color: colors.textSecondary,
    marginTop: 1,
  },
  bannerContainer: {
    flexDirection: 'row',
    alignItems: 'center',
    justifyContent: 'center',
    backgroundColor: '#F3F4F6',
    paddingVertical: 8,
    paddingHorizontal: 16,
    borderBottomWidth: 1,
    borderBottomColor: colors.borderLight,
  },
  bannerText: {
    fontSize: 12,
    color: colors.textSecondary,
    marginLeft: 6,
    flexShrink: 1,
  },
  keyboardAvoidingView: {
    flex: 1,
  },
  loadingContainer: {
    flex: 1,
    justifyContent: 'center',
    alignItems: 'center',
  },
  listContent: {
    paddingHorizontal: 16,
    paddingVertical: 16,
    flexGrow: 1,
    justifyContent: 'flex-end',
  },
  messageRow: {
    flexDirection: 'row',
    marginVertical: 4,
    width: '100%',
  },
  messageRowLeft: {
    justifyContent: 'flex-start',
  },
  messageRowRight: {
    justifyContent: 'flex-end',
  },
  bubble: {
    maxWidth: '75%',
    paddingHorizontal: 12,
    paddingVertical: 8,
    borderRadius: borderRadius.lg,
  },
  bubbleSent: {
    backgroundColor: colors.chatBubbleSent,
    borderBottomRightRadius: 2,
  },
  bubbleReceived: {
    backgroundColor: colors.chatBubbleReceived,
    borderBottomLeftRadius: 2,
  },
  textSent: {
    color: colors.chatTextSent,
    fontSize: 15,
    lineHeight: 20,
  },
  textReceived: {
    color: colors.chatTextReceived,
    fontSize: 15,
    lineHeight: 20,
  },
  bubbleFooter: {
    flexDirection: 'row',
    alignItems: 'center',
    justifyContent: 'flex-end',
    marginTop: 4,
    alignSelf: 'flex-end',
  },
  timeText: {
    fontSize: 10,
  },
  timeTextSent: {
    color: 'rgba(255, 255, 255, 0.7)',
  },
  timeTextReceived: {
    color: colors.textSecondary,
  },
  statusIndicator: {
    fontSize: 10,
    color: 'rgba(255, 255, 255, 0.7)',
    fontWeight: '600',
  },
  inputBar: {
    flexDirection: 'row',
    alignItems: 'center',
    paddingHorizontal: 12,
    paddingVertical: 8,
    borderTopWidth: 1,
    borderTopColor: colors.borderLight,
    backgroundColor: colors.background,
  },
  input: {
    flex: 1,
    backgroundColor: colors.surface,
    borderRadius: borderRadius.full,
    paddingHorizontal: 16,
    paddingVertical: 8,
    maxHeight: 100,
    color: colors.textPrimary,
    fontSize: 15,
  },
  sendButton: {
    marginLeft: 8,
    backgroundColor: colors.primary,
    borderRadius: borderRadius.full,
    paddingHorizontal: 16,
    paddingVertical: 10,
    justifyContent: 'center',
    alignItems: 'center',
  },
  sendButtonDisabled: {
    backgroundColor: colors.border,
  },
  sendButtonText: {
    color: colors.textInverse,
    fontWeight: '600',
    fontSize: 14,
  },
  bannerContainerAlert: {
    flexDirection: 'row',
    alignItems: 'center',
    justifyContent: 'center',
    backgroundColor: colors.errorLight,
    paddingVertical: 12,
    paddingHorizontal: 16,
    borderTopWidth: 1,
    borderTopColor: colors.borderLight,
  },
  bannerTextAlert: {
    fontSize: 14,
    color: colors.error,
    marginLeft: 6,
    fontWeight: '500',
  },
  premiumGateContainer: {
    paddingVertical: 16,
    paddingHorizontal: 20,
    backgroundColor: colors.surface,
    borderTopWidth: 1,
    borderTopColor: colors.borderLight,
    alignItems: 'center',
    justifyContent: 'center',
  },
  premiumGateText: {
    fontSize: 14,
    color: colors.textPrimary,
    fontWeight: '500',
    marginBottom: 12,
    textAlign: 'center',
  },
  premiumGateBtn: {
    backgroundColor: colors.primary,
    paddingVertical: 10,
    paddingHorizontal: 24,
    borderRadius: borderRadius.full,
  },
  premiumGateBtnText: {
    color: colors.textInverse,
    fontWeight: '600',
    fontSize: 14,
  },
});

export default ChatScreen;
