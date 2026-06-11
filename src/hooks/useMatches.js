/**
 * Tamil Matrimony — useMatches Hook
 * Fetch recommended profiles, daily matches, and calculate compatibility scores
 */
import { useQuery } from '@tanstack/react-query';
import * as matchesApi from '../api/matches';
import * as interestsApi from '../api/interests';
import useAuthStore from '../store/useAuthStore';
import useProfileStore from '../store/useProfileStore';

export const useMatches = (limit = 20) => {
  const user = useAuthStore((s) => s.user);
  const profile = useProfileStore((s) => s.profile);
  const userGender = profile?.gender;

  // Recommendations query
  const {
    data: recommended,
    isLoading: loadingRecommended,
    error: recommendedError,
    refetch: refetchRecommended,
  } = useQuery({
    queryKey: ['recommended', user?.id, limit, userGender],
    queryFn: () => matchesApi.getRecommendedProfiles(user?.id, limit, userGender),
    enabled: !!user?.id && !!userGender,
    staleTime: 5 * 60 * 1000,
  });

  // Daily Matches query
  const {
    data: dailyMatches,
    isLoading: loadingDaily,
    refetch: refetchDaily,
  } = useQuery({
    queryKey: ['dailyMatches', user?.id, userGender],
    queryFn: () => matchesApi.getDailyMatches(user?.id, 5, userGender),
    enabled: !!user?.id && !!userGender,
    staleTime: 12 * 60 * 60 * 1000, // 12 hours cache
  });

  // Fetch interactions to filter out profiles the user has already seen
  const { data: interactedIds = [] } = useQuery({
    queryKey: ['userInteractions', user?.id],
    queryFn: () => interestsApi.getUserInteractions(user?.id),
    enabled: !!user?.id,
  });

  // Filter out interacted profiles
  const filteredRecommended = recommended
    ? recommended.filter((p) => !interactedIds.includes(p.id))
    : [];

  const filteredDailyMatches = dailyMatches
    ? dailyMatches.filter((p) => !interactedIds.includes(p.id))
    : [];

  return {
    recommended: filteredRecommended,
    loadingRecommended,
    recommendedError,
    refetchRecommended,
    dailyMatches: filteredDailyMatches,
    loadingDaily,
    refetchDaily,
  };
};

export default useMatches;
