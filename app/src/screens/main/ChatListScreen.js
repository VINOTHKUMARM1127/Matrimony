/**
 * Wedring Matrimony — Chat List Screen
 */
import React, { useCallback, useEffect, useState } from 'react';
import { View, Text, StyleSheet, FlatList, TouchableOpacity, RefreshControl, ActivityIndicator, Modal, Image } from 'react-native';
import { SafeAreaView } from 'react-native-safe-area-context';
import { useQuery, useQueryClient } from '@tanstack/react-query';
import { colors } from '../../theme';
import { borderRadius, layout } from '../../theme/spacing';
import shadows from '../../theme/shadows';
import Avatar from '../../components/common/Avatar';
import ScreenHeader from '../../components/common/ScreenHeader';
import EmptyState from '../../components/common/EmptyState';
import Icon from '../../components/common/Icon';
import { ChatItemSkeleton } from '../../components/common/SkeletonLoader';
import useAuthStore from '../../store/useAuthStore';
import { getChatList, subscribeToChatListUpdates, createChat } from '../../api/chat';
import { getPrimaryPhotoUrl } from '../../api/profiles';

const ChatListScreen = ({ navigation }) => {
  const user = useAuthStore((s) => s.user);
  const queryClient = useQueryClient();
  const [creatingChatId, setCreatingChatId] = useState(null);
  const [selectedAvatar, setSelectedAvatar] = useState(null);

  const { data: chats, isLoading, refetch } = useQuery({
    queryKey: ['chatList', user?.id],
    queryFn: () => getChatList(user?.id),
    enabled: !!user?.id,
    staleTime: 60 * 1000,
  });

  // Realtime Sync Subscription
  useEffect(() => {
    if (!user?.id) return;

    const subscription = subscribeToChatListUpdates(user.id, () => {
      queryClient.invalidateQueries({ queryKey: ['chatList', user.id] });
    });

    return () => {
      subscription.unsubscribe();
    };
  }, [user?.id, queryClient]);

  const handleChatPress = useCallback(async (chat) => {
    let chatId = chat.id;

    // If a chat row doesn't exist yet, create it on-the-fly
    if (!chatId) {
      try {
        setCreatingChatId(chat.interest_id);
        const newChat = await createChat(user.id, chat.otherUser.id);
        chatId = newChat.id;
        // Invalidate so the new chat ID is saved in the list
        queryClient.invalidateQueries({ queryKey: ['chatList', user.id] });
      } catch (err) {
        console.warn('Failed to auto-create chat:', err);
        setCreatingChatId(null);
        return;
      } finally {
        setCreatingChatId(null);
      }
    }

    navigation.navigate('Chat', {
      chatId,
      otherUser: chat.otherUser,
    });
  }, [navigation, user, queryClient]);

  const formatTime = useCallback((dateStr) => {
    if (!dateStr) return '';
    const date = new Date(dateStr);
    const now = new Date();
    const diff = now - date;
    const minutes = Math.floor(diff / 60000);
    const hours = Math.floor(diff / 3600000);

    if (minutes < 1) return 'Just now';
    if (minutes < 60) return `${minutes}m`;
    if (hours < 24) return `${hours}h`;
    return date.toLocaleDateString('en-IN', { day: 'numeric', month: 'short' });
  }, []);

  const renderChatItem = useCallback(({ item }) => {
    const { otherUser } = item;
    const photo = getPrimaryPhotoUrl(otherUser);
    const isCreating = creatingChatId === item.interest_id;

    return (
      <TouchableOpacity
        style={styles.chatItem}
        onPress={() => handleChatPress(item)}
        activeOpacity={0.7}
        disabled={isCreating}
      >
        <TouchableOpacity onPress={() => setSelectedAvatar({ photo, otherUser: item.otherUser, item })}>
          <Avatar
            source={photo}
            name={otherUser?.full_name || ''}
            size="medium"
            showOnline
            isOnline={false}
          />
        </TouchableOpacity>
        <View style={styles.chatInfo}>
          <View style={styles.chatHeader}>
            <View style={{ flexDirection: 'row', alignItems: 'center', flex: 1 }}>
              <Text style={styles.chatName} numberOfLines={1}>
                {otherUser?.full_name || 'User'}
              </Text>
              {item.isBlocked && (
                <View style={styles.blockedBadge}>
                  <Text style={styles.blockedBadgeText}>Blocked</Text>
                </View>
              )}
            </View>
            <Text style={styles.chatTime}>{formatTime(item.last_message_at)}</Text>
          </View>
          <Text style={[styles.chatMessage, item.isBlocked && { color: colors.error }]} numberOfLines={1}>
            {item.isBlocked 
              ? (item.blockedByMe ? 'You have blocked this user.' : 'You have been blocked.')
              : (item.last_message_text || 'Start a conversation')}
          </Text>
        </View>
        {isCreating && (
          <ActivityIndicator size="small" color={colors.primary} style={{ marginLeft: 8 }} />
        )}
      </TouchableOpacity>
    );
  }, [handleChatPress, formatTime, creatingChatId]);

  return (
    <SafeAreaView style={styles.container} edges={['top', 'left', 'right']}>
      <ScreenHeader
        title="Messages"
        subtitle={chats?.length ? `${chats.length} conversation${chats.length > 1 ? 's' : ''}` : 'Your matches will appear here'}
      />

      <FlatList
        data={chats || []}
        keyExtractor={(item) => item.id}
        renderItem={renderChatItem}
        contentContainerStyle={styles.listContent}
        ListEmptyComponent={
          isLoading ? (
            <View>
              {[1, 2, 3, 4, 5].map((i) => <ChatItemSkeleton key={i} />)}
            </View>
          ) : (
            <EmptyState
              preset="noChats"
              actionLabel="Browse Profiles"
              onAction={() => navigation.navigate('HomeTab')}
            />
          )
        }
        refreshControl={
          <RefreshControl refreshing={false} onRefresh={refetch} tintColor={colors.primary} colors={[colors.primary]} />
        }
        ItemSeparatorComponent={() => <View style={styles.separator} />}
        showsVerticalScrollIndicator={false}
      />

      <Modal
        visible={!!selectedAvatar}
        transparent
        animationType="fade"
        onRequestClose={() => setSelectedAvatar(null)}
      >
        <TouchableOpacity style={styles.modalOverlay} activeOpacity={1} onPress={() => setSelectedAvatar(null)}>
          <TouchableOpacity style={styles.modalContent} activeOpacity={1}>
            {selectedAvatar?.photo ? (
               <Image source={{ uri: selectedAvatar.photo }} style={styles.modalImage} />
            ) : (
               <View style={styles.modalImagePlaceholder}>
                 <Text style={styles.modalImagePlaceholderText}>
                   {selectedAvatar?.otherUser?.full_name?.[0]?.toUpperCase() || 'U'}
                 </Text>
               </View>
            )}
            <View style={styles.modalActions}>
               <Text style={styles.modalName} numberOfLines={1}>{selectedAvatar?.otherUser?.full_name}</Text>
               <View style={styles.modalActionButtons}>
                 <TouchableOpacity style={styles.modalBtn} onPress={() => {
                   const item = selectedAvatar.item;
                   setSelectedAvatar(null);
                   if (item) handleChatPress(item);
                 }}>
                   <Icon name="chat" size={24} color={colors.primary} />
                 </TouchableOpacity>
                 <TouchableOpacity style={styles.modalBtn} onPress={() => {
                   const profileId = selectedAvatar.otherUser.id;
                   setSelectedAvatar(null);
                   navigation.navigate('UserProfile', { profileId });
                 }}>
                   <Icon name="info" size={24} color={colors.primary} />
                 </TouchableOpacity>
               </View>
            </View>
          </TouchableOpacity>
        </TouchableOpacity>
      </Modal>
    </SafeAreaView>
  );
};

const styles = StyleSheet.create({
  container: { flex: 1, backgroundColor: colors.background },
  listContent: { paddingTop: 4, flexGrow: 1 },
  chatItem: {
    flexDirection: 'row', alignItems: 'center',
    paddingHorizontal: layout.screenPaddingHorizontal, paddingVertical: 14,
  },
  chatInfo: { flex: 1, marginLeft: 14 },
  chatHeader: {
    flexDirection: 'row', justifyContent: 'space-between', alignItems: 'center',
  },
  chatName: { fontSize: 15.5, fontWeight: '700', color: colors.textPrimary, flexShrink: 1 },
  chatTime: { fontSize: 12, color: colors.textMuted, marginLeft: 8, fontWeight: '500' },
  chatMessage: { fontSize: 13.5, color: colors.textSecondary, marginTop: 3 },
  separator: { height: 1, backgroundColor: colors.borderLight, marginLeft: 78 },
  blockedBadge: {
    backgroundColor: colors.errorLight,
    paddingHorizontal: 6,
    paddingVertical: 2,
    borderRadius: 4,
    marginLeft: 8,
  },
  blockedBadgeText: {
    color: colors.error,
    fontSize: 10,
    fontWeight: '700',
    textTransform: 'uppercase',
  },
  modalOverlay: {
    flex: 1,
    backgroundColor: 'rgba(0,0,0,0.5)',
    justifyContent: 'center',
    alignItems: 'center',
  },
  modalContent: {
    width: 250,
    backgroundColor: colors.surface,
    borderRadius: 8,
    overflow: 'hidden',
    ...shadows.card,
  },
  modalImage: {
    width: 250,
    height: 250,
  },
  modalImagePlaceholder: {
    width: 250,
    height: 250,
    backgroundColor: colors.primaryLight,
    justifyContent: 'center',
    alignItems: 'center',
  },
  modalImagePlaceholderText: {
    fontSize: 80,
    fontWeight: '700',
    color: colors.primary,
  },
  modalActions: {
    flexDirection: 'row',
    alignItems: 'center',
    justifyContent: 'space-between',
    paddingHorizontal: 16,
    paddingVertical: 12,
  },
  modalName: {
    fontSize: 16,
    fontWeight: '700',
    color: colors.textPrimary,
    flex: 1,
  },
  modalActionButtons: {
    flexDirection: 'row',
    gap: 16,
  },
  modalBtn: {
    padding: 4,
  },
});

export default ChatListScreen;
