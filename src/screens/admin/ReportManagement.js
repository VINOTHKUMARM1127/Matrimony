/**
 * Tamil Matrimony — ReportManagement Screen
 * Displays pending reports and facilitates profile reviews and warning dispatches
 */
import React from 'react';
import { View, Text, StyleSheet, FlatList, TouchableOpacity, Alert } from 'react-native';
import { useQuery, useMutation, useQueryClient } from '@tanstack/react-query';
import { colors } from '../../theme';
import { borderRadius } from '../../theme/spacing';
import supabase from '../../api/supabaseClient';
import Button from '../../components/common/Button';

const ReportManagement = ({ navigation }) => {
  const queryClient = useQueryClient();

  // Fetch reported profiles list
  const { data: reports, isLoading, refetch } = useQuery({
    queryKey: ['adminReports'],
    queryFn: async () => {
      const { data, error } = await supabase
        .from('reports')
        .select(`
          *,
          reporter:profiles!reports_reporter_id_fkey (display_name),
          reported:profiles!reports_reported_user_id_fkey (display_name, is_active)
        `)
        .eq('status', 'pending')
        .order('created_at', { ascending: false });
      if (error) throw error;
      return data || [];
    },
  });

  // Resolve Report Mutation
  const resolveMutation = useMutation({
    mutationFn: async ({ reportId, action }) => {
      let notes = `Resolved with action: ${action}`;
      const { error } = await supabase
        .from('reports')
        .update({
          status: 'resolved',
          admin_notes: notes,
          resolved_at: new Date().toISOString()
        })
        .eq('id', reportId);
      if (error) throw error;
    },
    onSuccess: () => {
      queryClient.invalidateQueries({ queryKey: ['adminReports'] });
      Alert.alert('Resolved', 'The report has been marked as resolved.');
    },
  });

  const handleAction = (report, actionType) => {
    Alert.alert(
      'Resolve Report',
      `Mark report against ${report.reported?.display_name} as resolved?`,
      [
        { text: 'Cancel', style: 'cancel' },
        { 
          text: 'Resolve', 
          onPress: () => resolveMutation.mutate({ reportId: report.id, action: actionType }) 
        }
      ]
    );
  };

  return (
    <View style={styles.container}>
      {/* Header */}
      <View style={styles.header}>
        <TouchableOpacity style={styles.backButton} onPress={() => navigation.goBack()}>
          <Text style={styles.backText}>←</Text>
        </TouchableOpacity>
        <Text style={styles.headerTitle}>User Reports</Text>
      </View>

      <FlatList
        data={reports || []}
        keyExtractor={(item) => item.id}
        renderItem={({ item }) => (
          <View style={styles.card}>
            <Text style={styles.title}>
              Reported: <Text style={styles.bold}>{item.reported?.display_name || 'N/A'}</Text>
            </Text>
            <Text style={styles.reporter}>
              By: {item.reporter?.display_name || 'N/A'}
            </Text>
            <Text style={styles.reason}>
              Reason: <Text style={styles.italic}>{item.reason}</Text>
            </Text>
            {item.description && (
              <Text style={styles.desc}>Details: {item.description}</Text>
            )}

            <View style={styles.actions}>
              <Button
                title="Dismiss"
                variant="outline"
                onPress={() => handleAction(item, 'dismissed')}
                style={styles.actionBtn}
              />
              <Button
                title="Resolve / Warn"
                variant="primary"
                onPress={() => handleAction(item, 'warned_user')}
                style={styles.actionBtn}
              />
            </View>
          </View>
        )}
        ListEmptyComponent={
          <View style={styles.empty}>
            <Text style={styles.emptyText}>No pending reports</Text>
          </View>
        }
        refreshing={isLoading}
        onRefresh={refetch}
        showsVerticalScrollIndicator={false}
      />
    </View>
  );
};

const styles = StyleSheet.create({
  container: {
    flex: 1,
    backgroundColor: colors.surface,
  },
  header: {
    flexDirection: 'row',
    alignItems: 'center',
    paddingHorizontal: 16,
    paddingTop: 16,
    paddingBottom: 12,
    backgroundColor: colors.background,
    borderBottomWidth: 1,
    borderBottomColor: colors.borderLight,
  },
  backButton: {
    paddingRight: 16,
  },
  backText: {
    fontSize: 20,
    color: colors.primary,
    fontWeight: '700',
  },
  headerTitle: {
    fontSize: 18,
    fontWeight: '700',
    color: colors.text,
  },
  card: {
    backgroundColor: colors.background,
    marginHorizontal: 16,
    marginTop: 16,
    padding: 16,
    borderRadius: borderRadius.lg,
    borderWidth: 1,
    borderColor: colors.borderLight,
  },
  title: {
    fontSize: 14,
    color: colors.text,
  },
  bold: {
    fontWeight: '700',
  },
  reporter: {
    fontSize: 12,
    color: colors.textSecondary,
    marginTop: 4,
  },
  reason: {
    fontSize: 13,
    color: colors.text,
    marginTop: 8,
  },
  italic: {
    fontStyle: 'italic',
    color: colors.error,
    fontWeight: '600',
  },
  desc: {
    fontSize: 12,
    color: colors.textSecondary,
    marginTop: 4,
    backgroundColor: colors.surface,
    padding: 8,
    borderRadius: borderRadius.sm,
  },
  actions: {
    flexDirection: 'row',
    gap: 12,
    marginTop: 16,
  },
  actionBtn: {
    flex: 1,
  },
  empty: {
    padding: 32,
    alignItems: 'center',
  },
  emptyText: {
    color: colors.textMuted,
  },
});

export default ReportManagement;
