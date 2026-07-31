/**
 * Wedring Matrimony — PresenceHeartbeat
 * Always-mounted component that upserts the current user's app-wide
 * presence row every 15 seconds while the app is foregrounded.
 *
 * Mounted once inside AppNavigator's NavigationContainer so it runs
 * regardless of which screen is focused — not scoped to ChatScreen.
 *
 * No row deletion on background — the 30-second freshness check on
 * the reader side handles staleness if the app is killed ungracefully.
 */
import { useEffect, useRef } from 'react';
import { AppState } from 'react-native';
import useAuthStore from '../store/useAuthStore';
import { upsertUserPresence } from '../api/chat';

const HEARTBEAT_INTERVAL_MS = 15000;

const PresenceHeartbeat = () => {
  const user = useAuthStore((s) => s.user);
  const intervalRef = useRef(null);

  useEffect(() => {
    if (!user?.id) return;

    const startHeartbeat = () => {
      // Upsert immediately
      upsertUserPresence(user.id);
      // Then every 15s
      if (!intervalRef.current) {
        intervalRef.current = setInterval(() => {
          upsertUserPresence(user.id);
        }, HEARTBEAT_INTERVAL_MS);
      }
    };

    const stopHeartbeat = () => {
      if (intervalRef.current) {
        clearInterval(intervalRef.current);
        intervalRef.current = null;
      }
    };

    // Start immediately
    startHeartbeat();

    // Pause on background, resume on foreground
    const subscription = AppState.addEventListener('change', (nextState) => {
      if (nextState === 'active') {
        startHeartbeat();
      } else {
        stopHeartbeat();
      }
    });

    return () => {
      stopHeartbeat();
      subscription.remove();
    };
  }, [user?.id]);

  return null; // Renders nothing — purely side-effect component
};

export default PresenceHeartbeat;
