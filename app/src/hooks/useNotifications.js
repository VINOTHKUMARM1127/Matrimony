/**
 * Wedring Matrimony — useNotifications Hook
 * Registers for push notifications, handles incoming payloads, and queries DB list
 */
import { useEffect } from 'react';
import { useQuery, useMutation, useQueryClient } from '@tanstack/react-query';
import * as notifService from '../services/notifications';
import useAuthStore from '../store/useAuthStore';
import supabase from '../api/supabaseClient';

export const useNotifications = () => {
  const queryClient = useQueryClient();
  const user = useAuthStore((s) => s.user);

  // Load notifications from DB
  const {
    data: notifications,
    isLoading,
    refetch,
  } = useQuery({
    queryKey: ['notifications', user?.id],
    queryFn: async () => {
      const { data, error } = await supabase
        .from('notifications')
        .select('*')
        .eq('user_id', user?.id)
        .order('created_at', { ascending: false })
        .limit(50);
      if (error) throw error;
      return data || [];
    },
    enabled: !!user?.id,
  });

  // Mark single notification read
  const markReadMutation = useMutation({
    mutationFn: async (notifId) => {
      const { error } = await supabase
        .from('notifications')
        .update({ is_read: true })
        .eq('id', notifId);
      if (error) throw error;
    },
    onSuccess: () => {
      queryClient.invalidateQueries({ queryKey: ['notifications', user?.id] });
    },
  });

  // Mark all read
  const markAllReadMutation = useMutation({
    mutationFn: async () => {
      const { error } = await supabase
        .from('notifications')
        .update({ is_read: true })
        .eq('user_id', user?.id)
        .eq('is_read', false);
      if (error) throw error;
    },
    onSuccess: () => {
      queryClient.invalidateQueries({ queryKey: ['notifications', user?.id] });
    },
  });

  // Setup push token on mount if authenticated
  useEffect(() => {
    if (!user?.id) return;

    const setupPush = async () => {
      const token = await notifService.registerForPushNotifications();
      if (token) {
        await notifService.savePushToken(user.id, token);
      }
    };

    setupPush();
  }, [user?.id]);

  // Foreground notification handler
  useEffect(() => {
    const recvListener = notifService.addNotificationReceivedListener((notification) => {
      // Invalidate query to update list in UI
      queryClient.invalidateQueries({ queryKey: ['notifications', user?.id] });
    });

    const respListener = notifService.addNotificationResponseListener((response) => {
      // Handle notification tap / routing
      const data = response.notification.request.content.data;
      console.log('Notification tapped data:', data);
    });

    return () => {
      recvListener.remove();
      respListener.remove();
    };
  }, [queryClient, user?.id]);

  return {
    notifications,
    isLoading,
    refetch,
    markAsRead: markReadMutation.mutateAsync,
    markAllRead: markAllReadMutation.mutateAsync,
    unreadCount: notifications?.filter((n) => !n.is_read).length || 0,
  };
};

export default useNotifications;
