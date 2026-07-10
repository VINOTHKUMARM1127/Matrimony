import { useQuery, useQueryClient } from '@tanstack/react-query';
import useAuthStore from '../store/useAuthStore';
import { fetchUserDashboard } from '../api/settingsApi';
import supabase from '../api/supabaseClient';

export const usePremium = () => {
  const user = useAuthStore((s) => s.user);
  const queryClient = useQueryClient();

  const { data, isLoading, error, refetch } = useQuery({
    queryKey: ['user_dashboard_summary', user?.id],
    queryFn: async () => {
      // 1. Fetch dashboard summary (handles tier, credits, expiry, match counts)
      const dashboard = await fetchUserDashboard(user.id);

      // 2. Fetch queue (to match HomeScreen legacy logic, but mainly for full dashboard payload)
      const { data: queue } = await supabase
        .from('subscription_queue')
        .select('*, membership_plans(name, duration_days)')
        .eq('user_id', user.id)
        .order('position', { ascending: true });

      const tier = dashboard?.tier || 'free';

      return {
        ...dashboard,
        tier: tier === 'free' ? 'FREE' : tier.toUpperCase(),
        is_premium: tier !== 'free',
        expires_at: dashboard?.plan_expires_at || dashboard?.expires_at,
        total_recommended_unlocked: dashboard?.all_matches_count || 0,
        total_nearby_unlocked: dashboard?.daily_updates_count || 0,
        other_plans: queue?.map(q => ({
          plan: q.membership_plans?.name,
          label: q.membership_plans?.name,
          status: 'paused',
          duration_months: Math.floor((q.membership_plans?.duration_days || 0) / 30),
          remaining_days: q.membership_plans?.duration_days
        })) || []
      };
    },
    enabled: !!user?.id,
  });

  return {
    data,
    isPremium: data?.is_premium || false,
    tier: data?.tier || 'FREE',
    contactCredits: data?.contact_credits_remaining || 0,
    interestCredits: data?.interest_credits_remaining || 0,
    expiresAt: data?.expires_at || null,
    isLoading,
    error,
    refresh: refetch,
    invalidate: () => queryClient.invalidateQueries({ queryKey: ['user_dashboard_summary', user?.id] })
  };
};

export default usePremium;
