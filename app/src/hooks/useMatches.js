/**
 * Wedring Matrimony — useMatches Hook
 * Fetch recommended profiles, daily matches, and calculate compatibility scores
 */
import React from 'react';
import { useQuery, useInfiniteQuery } from '@tanstack/react-query';
import * as matchesApi from '../api/matches';
import useAuthStore from '../store/useAuthStore';
import useProfileStore from '../store/useProfileStore';
import * as subApi from '../api/subscriptions';
import { fetchUserLimits } from '../api/settingsApi';

const PAGE_SIZE = 10;

export const useMatches = () => {
  const user = useAuthStore((s) => s.user);
  const profile = useProfileStore((s) => s.profile);
  const userGender = profile?.gender;

  const { data: activeSub } = useQuery({
    queryKey: ['activeSubscription', user?.id],
    queryFn: () => subApi.getActiveSubscription(user?.id),
    enabled: !!user?.id,
  });

  const isPremium = profile?.is_premium || !!activeSub;

  // Fetch precise user limits directly from the backend RPC to account for Free clamping and Premium cumulative logic
  const { data: limits, refetch: refetchAdminSettings } = useQuery({
    queryKey: ['userLimits', user?.id],
    queryFn: () => fetchUserLimits(user?.id),
    enabled: !!user?.id,
    staleTime: 0, // Always fresh on reload
    gcTime: 5 * 60 * 1000,
  });

  const isDynamic = limits?.dynamic_daily_enabled || false;

  // Limits come straight from tier_settings (single source of truth).
  // The backend RPCs clamp each feed to these caps and handle day-by-day
  // rotation internally, so the client must NOT multiply by active days.
  const recLimit = limits?.recommended_limit || 0;
  const nearbyLimit = limits?.nearby_limit || 0;
  const dailyLimit = limits?.daily_limit || 0;

  // Recommendations query (Infinite)
  const {
    data: recommendedData,
    isLoading: loadingRecommended,
    fetchNextPage: fetchNextRecommended,
    hasNextPage: hasNextRecommended,
    isFetchingNextPage: fetchingNextRecommended,
    refetch: refetchRecommended,
  } = useInfiniteQuery({
    queryKey: ['recommended', user?.id, userGender, isDynamic, recLimit],
    queryFn: ({ pageParam = 0 }) => matchesApi.getRecommendedProfiles(user?.id, PAGE_SIZE, pageParam, userGender, isDynamic),
    getNextPageParam: (lastPage, allPages) => {
      const totalFetched = allPages.reduce((acc, page) => acc + page.length, 0);
      if (lastPage.length < PAGE_SIZE || totalFetched >= recLimit) return undefined;
      return totalFetched;
    },
    enabled: !!user?.id && !!userGender && recLimit > 0,
    initialPageParam: 0,
    staleTime: 5 * 60 * 1000,
  });

  // Nearby Matches query (Infinite)
  const {
    data: nearbyData,
    isLoading: loadingNearby,
    fetchNextPage: fetchNextNearby,
    hasNextPage: hasNextNearby,
    isFetchingNextPage: fetchingNextNearby,
    refetch: refetchNearby,
  } = useInfiniteQuery({
    queryKey: ['nearbyMatches', user?.id, userGender, isDynamic, nearbyLimit],
    queryFn: ({ pageParam = 0 }) => matchesApi.getNearbyProfiles(user?.id, PAGE_SIZE, pageParam, userGender, isDynamic),
    getNextPageParam: (lastPage, allPages) => {
      const totalFetched = allPages.reduce((acc, page) => acc + page.length, 0);
      if (lastPage.length < PAGE_SIZE || totalFetched >= nearbyLimit) return undefined;
      return totalFetched;
    },
    enabled: !!user?.id && !!userGender && nearbyLimit > 0,
    initialPageParam: 0,
    staleTime: 5 * 60 * 1000,
  });

  // Daily Matches query (Infinite)
  const {
    data: dailyData,
    isLoading: loadingDaily,
    fetchNextPage: fetchNextDaily,
    hasNextPage: hasNextDaily,
    isFetchingNextPage: fetchingNextDaily,
    refetch: refetchDaily,
  } = useInfiniteQuery({
    queryKey: ['dailyMatches', user?.id, userGender, isDynamic, dailyLimit],
    queryFn: ({ pageParam = 0 }) => matchesApi.getDailyMatches(user?.id, PAGE_SIZE, pageParam, userGender, isDynamic),
    getNextPageParam: (lastPage, allPages) => {
      const totalFetched = allPages.reduce((acc, page) => acc + page.length, 0);
      if (lastPage.length < PAGE_SIZE || totalFetched >= dailyLimit) return undefined;
      return totalFetched;
    },
    enabled: !!user?.id && !!userGender && dailyLimit > 0,
    initialPageParam: 0,
    staleTime: 5 * 60 * 1000,
  });

  return {
    recommended: recommendedData?.pages?.flat() || [],
    loadingRecommended,
    fetchNextRecommended,
    hasNextRecommended,
    fetchingNextRecommended,
    refetchRecommended,

    nearbyMatches: nearbyData?.pages?.flat() || [],
    loadingNearby,
    fetchNextNearby,
    hasNextNearby,
    fetchingNextNearby,
    refetchNearby,

    dailyMatches: dailyData?.pages?.flat() || [],
    loadingDaily,
    fetchNextDaily,
    hasNextDaily,
    fetchingNextDaily,
    refetchDaily,

    limits,
    refetchAdminSettings
  };
};

export default useMatches;
