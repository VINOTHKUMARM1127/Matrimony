/**
 * Wedring Matrimony — useNotifications Hook
 * Registers for push notifications, handles incoming payloads, and queries DB list
 */
import { useEffect } from 'react';
import * as notifService from '../services/notifications';
import useAuthStore from '../store/useAuthStore';
import { navigationRef } from '../navigation/AppNavigator';

export const useNotifications = () => {
  const user = useAuthStore((s) => s.user);

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
      // Push arrived in foreground
    });

    const respListener = notifService.addNotificationResponseListener((response) => {
      // Handle notification tap / routing
      const data = response.notification.request.content.data;
      console.log('Notification tapped data:', data);
      
      if (!data || !navigationRef.isReady()) return;

      if (data.screen) {
        if (data.screen === 'Chat' && data.entity_id) {
          navigationRef.navigate('Chat', { chatId: data.entity_id });
        } else {
          navigationRef.navigate(data.screen);
        }
      }
    });

    return () => {
      recvListener.remove();
      respListener.remove();
    };
  }, [user?.id]);

  return {};
};

export default useNotifications;
