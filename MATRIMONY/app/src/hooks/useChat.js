/**
 * Wedring Matrimony — useChat Hook
 * Subscribes to realtime chat updates, manages active chats, and tracks messages
 */
import { useEffect, useState, useCallback } from 'react';
import { useQuery, useMutation, useQueryClient } from '@tanstack/react-query';
import * as chatApi from '../api/chat';
import useAuthStore from '../store/useAuthStore';
import supabase from '../api/supabaseClient';

export const useChat = (chatId) => {
  const queryClient = useQueryClient();
  const user = useAuthStore((s) => s.user);
  const [realtimeMessages, setRealtimeMessages] = useState([]);
  const [isTyping, setIsTyping] = useState(false);

  // Chat List Query
  const {
    data: chatList,
    isLoading: loadingChatList,
    refetch: refetchChatList,
  } = useQuery({
    queryKey: ['chatList', user?.id],
    queryFn: () => chatApi.getChatList(user?.id),
    enabled: !!user?.id,
    staleTime: 1000 * 30, // 30 seconds stale
  });

  // Messages Query
  const {
    data: initialMessages,
    isLoading: loadingMessages,
    refetch: refetchMessages,
  } = useQuery({
    queryKey: ['messages', chatId],
    queryFn: () => chatApi.getMessages(chatId),
    enabled: !!chatId,
  });

  // Reset realtime messages when chatId changes
  useEffect(() => {
    setRealtimeMessages([]);
  }, [chatId]);

  // Combine query messages with realtime additions
  const messages = [
    ...(initialMessages || []),
    ...realtimeMessages.filter(
      (rm) => !(initialMessages || []).some((im) => im.id === rm.id)
    ),
  ];

  // Subscribe to realtime changes
  useEffect(() => {
    if (!chatId) return;

    const channel = supabase
      .channel(`chat:${chatId}`)
      .on(
        'postgres_changes',
        {
          event: 'INSERT',
          schema: 'public',
          table: 'messages',
          filter: `chat_id=eq.${chatId}`,
        },
        (payload) => {
          const newMsg = payload.new;
          setRealtimeMessages((prev) => {
            if (prev.some((m) => m.id === newMsg.id)) return prev;
            return [...prev, newMsg];
          });
          // Invalidate queries to refresh chat list preview
          queryClient.invalidateQueries({ queryKey: ['chatList', user?.id] });
          
          // If we received a message in the active chat and it's not from us, mark it read
          if (newMsg.sender_id !== user?.id) {
            chatApi.markMessagesRead(chatId, user?.id);
          }
        }
      )
      .on(
        'postgres_changes',
        {
          event: 'UPDATE',
          schema: 'public',
          table: 'messages',
          filter: `chat_id=eq.${chatId}`,
        },
        (payload) => {
          const updatedMsg = payload.new;
          setRealtimeMessages((prev) =>
            prev.map((m) => (m.id === updatedMsg.id ? updatedMsg : m))
          );
          queryClient.setQueryData(['messages', chatId], (old) => {
            if (!old) return old;
            return old.map((m) => (m.id === updatedMsg.id ? updatedMsg : m));
          });
        }
      );

    channel.subscribe();

    // Mark messages read on open
    chatApi.markMessagesRead(chatId, user?.id);

    return () => {
      supabase.removeChannel(channel);
    };
  }, [chatId, queryClient, user?.id]);

  // Send Message Mutation
  const sendMutation = useMutation({
    mutationFn: ({ content, messageType }) =>
      chatApi.sendMessage(chatId, user?.id, content, messageType),
    onSuccess: (newMsg) => {
      setRealtimeMessages((prev) => {
        if (prev.some((m) => m.id === newMsg.id)) return prev;
        return [...prev, newMsg];
      });
      queryClient.invalidateQueries({ queryKey: ['chatList', user?.id] });
    },
  });

  // Track Presence & Typing status
  const broadcastTyping = useCallback((typingState) => {
    if (!chatId) return;
    const channel = supabase.channel(`typing:${chatId}`);
    channel.subscribe((status) => {
      if (status === 'SUBSCRIBED') {
        channel.send({
          type: 'broadcast',
          event: 'typing',
          payload: { userId: user?.id, isTyping: typingState },
        });
      }
    });
  }, [chatId, user?.id]);

  // Listen for active chat typing indicator
  useEffect(() => {
    if (!chatId) return;

    const channel = supabase.channel(`typing:${chatId}`);

    channel
      .on('broadcast', { event: 'typing' }, (payload) => {
        if (payload.payload.userId !== user?.id) {
          setIsTyping(payload.payload.isTyping);
        }
      })
      .subscribe();

    return () => {
      supabase.removeChannel(channel);
    };
  }, [chatId, user?.id]);

  return {
    chatList,
    loadingChatList,
    refetchChatList,
    messages,
    loadingMessages,
    refetchMessages,
    sendMessage: sendMutation.mutateAsync,
    isSending: sendMutation.isPending,
    broadcastTyping,
    partnerIsTyping: isTyping,
  };
};

export default useChat;
