/**
 * Wedring Matrimony — Notifications Screen
 */
import React, { useCallback } from 'react';
import { View, Text, StyleSheet, FlatList, TouchableOpacity, RefreshControl } from 'react-native';
import { useQuery } from '@tanstack/react-query';
import { colors } from '../../theme';
import { borderRadius } from '../../theme/spacing';
import EmptyState from '../../components/common/EmptyState';
import useAuthStore from '../../store/useAuthStore';
import supabase from '../../api/supabaseClient';

const NotificationsScreen = ({ navigation }) => {
  const user = useAuthStore((s) => s.user);

  const { data: notifications, isLoading, refetch } = useQuery({
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
    staleTime: 60 * 1000,
  });

  const getIcon = useCallback((type) => {
    const icons = {
      new_interest: '💕', interest_accepted: '🎉',
      new_message: '💬', profile_view: '👀',
      daily_match: '⭐', premium_expiry: '👑',
      system: '📢',
    };
    return icons[type] || '🔔';
  }, []);

  const formatTime = useCallback((dateStr) => {
    const diff = Date.now() - new Date(dateStr).getTime();
    const min = Math.floor(diff / 60000);
    const hrs = Math.floor(diff / 3600000);
    const days = Math.floor(diff / 86400000);
    if (min < 60) return `${min}m ago`;
    if (hrs < 24) return `${hrs}h ago`;
    return `${days}d ago`;
  }, []);

  const renderItem = useCallback(({ item }) => (
    <TouchableOpacity
      style={[styles.item, !item.is_read && styles.itemUnread]}
      activeOpacity={0.7}
      onPress={async () => {
        await supabase.from('notifications').update({ is_read: true }).eq('id', item.id);
        refetch();
      }}
    >
      <Text style={styles.icon}>{getIcon(item.type)}</Text>
      <View style={styles.content}>
        <Text style={[styles.title, !item.is_read && styles.titleUnread]}>{item.title}</Text>
        <Text style={styles.body} numberOfLines={2}>{item.body}</Text>
        <Text style={styles.time}>{formatTime(item.created_at)}</Text>
      </View>
      {!item.is_read && <View style={styles.unreadDot} />}
    </TouchableOpacity>
  ), [getIcon, formatTime, refetch]);

  return (
    <View style={styles.container}>
      <View style={styles.header}>
        <Text style={styles.headerTitle}>Notifications</Text>
      </View>
      <FlatList
        data={notifications || []}
        keyExtractor={(item) => item.id}
        renderItem={renderItem}
        ListEmptyComponent={
          <EmptyState preset="noNotifications" />
        }
        refreshControl={<RefreshControl refreshing={false} onRefresh={refetch} colors={[colors.primary]} />}
        ItemSeparatorComponent={() => <View style={styles.separator} />}
        showsVerticalScrollIndicator={false}
      />
    </View>
  );
};

const styles = StyleSheet.create({
  container: { flex: 1, backgroundColor: colors.background },
  header: { paddingHorizontal: 16, paddingTop: 16, paddingBottom: 12, borderBottomWidth: 1, borderBottomColor: colors.borderLight },
  headerTitle: { fontSize: 24, fontWeight: '700', color: colors.textPrimary },
  item: { flexDirection: 'row', alignItems: 'flex-start', paddingHorizontal: 16, paddingVertical: 14 },
  itemUnread: { backgroundColor: colors.primarySurface },
  icon: { fontSize: 28, marginRight: 14, marginTop: 2 },
  content: { flex: 1 },
  title: { fontSize: 15, fontWeight: '500', color: colors.textPrimary },
  titleUnread: { fontWeight: '700' },
  body: { fontSize: 13, color: colors.textSecondary, marginTop: 2, lineHeight: 18 },
  time: { fontSize: 11, color: colors.textMuted, marginTop: 4 },
  unreadDot: { width: 8, height: 8, borderRadius: 4, backgroundColor: colors.primary, marginTop: 6 },
  separator: { height: 1, backgroundColor: colors.borderLight },
});

export default NotificationsScreen;
