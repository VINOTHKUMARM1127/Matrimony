/**
 * Wedring Matrimony — Matches Dashboard (Premium Redesign)
 * Full-screen photo cards with professional text-based action buttons,
 * progress indicator, and premium visual treatment.
 */
import React, { useState, useMemo, useCallback, useEffect } from 'react';
import { useFocusEffect } from '@react-navigation/native';
import {
  View,
  Text,
  StyleSheet,
  TouchableOpacity,
  Dimensions,
  FlatList,
  Alert,
  RefreshControl,
  ActivityIndicator,
  Platform,
} from 'react-native';
import { SafeAreaView } from 'react-native-safe-area-context';
import Animated, { FadeInDown, FadeOutUp, LinearTransition, Easing } from 'react-native-reanimated';
import { Ionicons } from '@expo/vector-icons';
import { Image } from 'expo-image';
import { LinearGradient } from 'expo-linear-gradient';
import { colors } from '../../theme';
import { borderRadius, layout } from '../../theme/spacing';
import shadows from '../../theme/shadows';
import Badge from '../../components/common/Badge';
import useMatches from '../../hooks/useMatches';
import EmptyState from '../../components/common/EmptyState';
import { ProfileCardSkeleton } from '../../components/common/SkeletonLoader';
import useProfileStore from '../../store/useProfileStore';
import useAuthStore from '../../store/useAuthStore';
import Button from '../../components/common/Button';
import { sendInterest, passProfile } from '../../api/interests';
import { useQueryClient, useQuery } from '@tanstack/react-query';
import usePremium from '../../hooks/usePremium';
import { fetchPremiumPlans, fetchUserDashboard } from '../../api/settingsApi';
import SuccessOverlay from '../../components/common/SuccessOverlay';
import supabase from '../../api/supabaseClient';

const { width: SCREEN_WIDTH } = Dimensions.get('window');

// Height reserved at the bottom of the card for the action-button overlay
// (button height + its own bottom padding). The info-text block's bottom
// padding is derived from this so the two never overlap.
const ACTION_BAR_HEIGHT = 64;
const ACTION_BAR_GAP = 16;

// Fixed, predictable timings for the card dismiss animation. Using a fixed
// duration (instead of spring physics) means the animation always settles at
// exactly this time, so the list can reliably reclaim the vacated space and
// slide the remaining cards up right when the fade visually finishes —
// instead of waiting on unpredictable spring "settle" time.
const EXIT_DURATION = 450;
const REFLOW_DURATION = 450;
const EXIT_EASING = Easing.out(Easing.cubic);

// ── Pure helpers (module scope — no per-render allocation) ──
const getPrimaryPhotoFor = (prof) => {
  if (prof?.photos?.length) {
    const primary = prof.photos.find((p) => p.is_primary);
    return (primary || prof.photos[0])?.storage_path;
  }
  if (prof?.profile_photos?.length) {
    const primary = prof.profile_photos.find((p) => p.is_primary);
    return (primary || prof.profile_photos[0])?.photo_url;
  }
  return null;
};

const calculateAge = (dob) => {
  if (!dob) return '';
  const birth = new Date(dob);
  const today = new Date();
  let age = today.getFullYear() - birth.getFullYear();
  const m = today.getMonth() - birth.getMonth();
  if (m < 0 || (m === 0 && today.getDate() < birth.getDate())) age--;
  return age;
};

// "New Profiles Added Today" divider — static, memoized.
const NewTodayDivider = React.memo(() => (
  <View style={styles.newTodayDivider}>
    <View style={styles.newTodayLine} />
    <Text style={styles.newTodayText}>✨ New Profiles Added Today</Text>
    <View style={styles.newTodayLine} />
  </View>
));

// Single profile card. Memoized so it only re-renders when its own item/flags
// change — list-level updates (pagination, footer, focus refetch) no longer
// re-render every mounted card, which is what triggered the VirtualizedList
// "slow to update" warning.
//
// FIX #1: The photo/info area and the action buttons are separate touch targets.
//         Buttons are no longer nested inside the card's TouchableOpacity, so
//         tapping a button no longer triggers the card's highlight flash.
// FIX #5: The info-text block reserves ACTION_BAR_HEIGHT + gap at the bottom
//         so the button overlay never covers the last line(s) of text.
//
// Exit/reflow animation: Reanimated's `exiting` and `layout` props do all the
// work here. When a card is removed from the FlatList's data array in one
// step, Reanimated automatically keeps its last rendered frame on screen,
// plays `exiting` on it, and only unmounts it for real once that finishes —
// no manual "snapshot and keep it in the array" bookkeeping needed, and none
// should be added back, since that's what caused the previous stuck/frozen
// dismiss bug.
const ProfileMatchCard = React.memo(({
  item, index, isPremium, onPress, onInterested, onDecline, onPremiumAlert, cardHeight,
}) => {
  const age = calculateAge(item.dob);
  const photoUri = getPrimaryPhotoFor(item);
  const score = item.compatibility_score
    || (65 + (parseInt(String(item.id).replace(/\D/g, '').slice(-2) || '0', 10) % 25));

  const enterDelay = (index % 10) * 60;

  return (
    <Animated.View
      layout={LinearTransition.duration(REFLOW_DURATION).easing(EXIT_EASING)}
      entering={FadeInDown.springify().damping(18).mass(0.9).delay(enterDelay)}
      exiting={FadeOutUp.duration(EXIT_DURATION).easing(EXIT_EASING)}
      style={[styles.cardWrapper, { height: cardHeight }]}
    >
      {/* FIX #1: Photo / info area — tappable to open profile */}
      <TouchableOpacity
        style={styles.cardTappableArea}
        activeOpacity={0.95}
        onPress={() => onPress(item)}
      >
        <View style={styles.cardInner}>
          <View style={styles.photoContainer}>
            {photoUri ? (
              <Image
                source={{ uri: photoUri }}
                style={styles.cardImage}
                contentFit="cover"
                transition={200}
                cachePolicy="memory-disk"
              />
            ) : (
              <View style={styles.noPhotoBackground}>
                <Text style={styles.noPhotoInitial}>
                  {item.full_name?.charAt(0) || '?'}
                </Text>
                <Text style={styles.noPhotoText}>No Photo</Text>
              </View>
            )}

            <View style={styles.compatBubble}>
              <Text style={styles.compatBubbleText}>{score}%</Text>
            </View>
          </View>

          <LinearGradient
            colors={['transparent', 'rgba(0,0,0,0.72)', 'rgba(0,0,0,0.92)']}
            locations={[0, 0.45, 1]}
            style={styles.infoContainer}
            pointerEvents="none"
          >
            <View style={styles.infoHeader}>
              <Text style={styles.nameText} numberOfLines={1}>
                {item.full_name || 'User'}
              </Text>
              {item.is_verified && (
                <Ionicons name="checkmark-circle" size={16} color="#4ade80" style={{ marginLeft: 4 }} />
              )}
            </View>

            <Text style={styles.basicInfoText} numberOfLines={1}>
              {age} yrs • {item.height_cm ? `${item.height_cm} cm` : 'Height N/A'}
            </Text>

            <View style={styles.detailsRow}>
              <Ionicons name="briefcase-outline" size={12} color="rgba(255,255,255,0.65)" />
              <Text style={styles.detailsText} numberOfLines={1}>
                {item.occupation || 'Professional'}
              </Text>
            </View>

            <View style={styles.detailsRow}>
              <Ionicons name="school-outline" size={12} color="rgba(255,255,255,0.65)" />
              <Text style={styles.detailsText} numberOfLines={1}>
                {item.highest_qualification || 'Graduate'}
              </Text>
            </View>

            <View style={styles.detailsRow}>
              <Ionicons name="location-outline" size={12} color="rgba(255,255,255,0.65)" />
              <Text style={styles.detailsText} numberOfLines={1}>
                {item.city}{item.district ? `, ${item.district}` : ''}
              </Text>
            </View>
          </LinearGradient>
        </View>
      </TouchableOpacity>

      {/* FIX #1: Action buttons — independent touch targets, NOT nested inside card's touchable.
          FIX #5: Sits in its own reserved strip, no longer overlapping the text above it. */}
      <View style={styles.actionsRowOverlay}>
        <TouchableOpacity
          style={styles.actionBtnSkip}
          activeOpacity={0.7}
          onPress={() => onDecline(item, index)}
          hitSlop={{ top: 10, bottom: 10, left: 10, right: 10 }}
        >
          <Ionicons name="close" size={18} color="rgba(255,255,255,0.9)" />
          <Text style={styles.actionBtnSkipText}>Not Interested</Text>
        </TouchableOpacity>

        <TouchableOpacity
          style={styles.actionBtnInterest}
          activeOpacity={0.7}
          onPress={() => onInterested(item, index)}
          hitSlop={{ top: 10, bottom: 10, left: 10, right: 10 }}
        >
          <Ionicons name="heart" size={18} color="#FFF" />
          <Text style={styles.actionBtnInterestText}>Send Interest</Text>
        </TouchableOpacity>
      </View>
    </Animated.View>
  );
}, (prev, next) => (
  prev.item.id === next.item.id &&
  prev.isPremium === next.isPremium &&
  prev.index === next.index
));

const MatchesScreen = ({ navigation }) => {
  const [activeTab, setActiveTab] = useState('all_matches');
  const [interestSent, setInterestSent] = useState(false);
  const [containerHeight, setContainerHeight] = useState(0);
  const queryClient = useQueryClient();

  const profile = useProfileStore((s) => s.profile);
  const myPhotos = useProfileStore((s) => s.photos);
  const user = useAuthStore((s) => s.user);

  const { isPremium } = usePremium();

  const { 
    recommended = [], 
    loadingRecommended, 
    fetchNextRecommended,
    hasNextRecommended,
    fetchingNextRecommended,
    refetchRecommended,

    dailyMatches = [], 
    loadingDaily,
    fetchNextDaily,
    hasNextDaily,
    fetchingNextDaily,
    refetchDaily,
  } = useMatches();


  // Whenever this screen gains focus (e.g. returning from a successful upgrade),
  // refresh the active tab to pull newly distributed profiles.
  useFocusEffect(
    useCallback(() => {
      if (activeTab === 'all_matches') refetchRecommended?.();
      else if (activeTab === 'daily') refetchDaily?.();
    }, [activeTab, refetchRecommended, refetchDaily])
  );

  // Auto-load the FULL per-user allocation for the active tab. The admin-configured
  // count is the per-user pool; the feed RPCs return it page-by-page.
  useEffect(() => {
    if (activeTab === 'all_matches' && hasNextRecommended && !fetchingNextRecommended) {
      fetchNextRecommended();
    } else if (activeTab === 'daily' && hasNextDaily && !fetchingNextDaily) {
      fetchNextDaily();
    }
  }, [
    activeTab,
    hasNextRecommended, fetchingNextRecommended, fetchNextRecommended,
    hasNextDaily, fetchingNextDaily, fetchNextDaily,
  ]);

  // Live plan pricing for the lock card (no hardcoded prices/names).
  const { data: lockPlans = [] } = useQuery({
    queryKey: ['premiumPlans'],
    queryFn: fetchPremiumPlans,
    staleTime: 5 * 60 * 1000,
  });

  // Prefetched once per screen visit, not awaited inside the tap handler —
  // so tapping "Send Interest" reacts instantly with no network wait,
  // even on the very first tap.
  const { data: hasSavedPhoto = false } = useQuery({
    queryKey: ['hasProfilePhoto', user?.id],
    queryFn: async () => {
      const { count } = await supabase
        .from('profile_photos')
        .select('id', { count: 'exact', head: true })
        .eq('user_id', user.id);
      return (count || 0) > 0;
    },
    enabled: !!user?.id,
    staleTime: 5 * 60 * 1000,
  });



  const rawData = activeTab === 'daily' ? (dailyMatches || [])
                : (recommended || []);
  const isLoading = activeTab === 'daily' ? loadingDaily
                  : loadingRecommended;

  // Inject a "New Profiles Added Today" divider.
  // New items are at the TOP (priority_score DESC). Find where the new block ends.
  const displayData = useMemo(() => {
    let list = rawData || [];
    
    const lastNewIdx = list.findLastIndex((p) => p?.is_new_today);
    if (lastNewIdx >= 0 && lastNewIdx < list.length - 1) {
      list = [
        ...list.slice(0, lastNewIdx + 1),
        { __divider: true, id: '__new_today_divider__' },
        ...list.slice(lastNewIdx + 1),
      ];
    }
    return list;
  }, [rawData]);

  const handleTabChange = (tab) => {
    setActiveTab(tab);
  };

  const showPremiumAlert = useCallback(() => {
    Alert.alert(
      'Premium Feature',
      'Upgrade to Premium to express interest or pass on profiles.',
      [
        { text: 'Cancel', style: 'cancel' },
        { text: 'Upgrade Now', onPress: () => navigation.navigate('UpgradesTab') }
      ]
    );
  }, [navigation]);

  // Remove the profile from caches. This one clean removal is all Reanimated
  // needs — it detects the item leaving the array, keeps its last frame on
  // screen, and plays the card's own `exiting` animation automatically, while
  // `layout` on the remaining cards slides them up to close the gap.
  const removeFromCaches = useCallback((targetProfile) => {
    const filterPage = (old) => {
      if (!old || !old.pages) return old;
      return {
        ...old,
        pages: old.pages.map(page => page.filter(p => p.id !== targetProfile.id))
      };
    };
    queryClient.setQueryData(['allMatches', user?.id], filterPage);
    queryClient.setQueryData(['dailyUpdates', user?.id], filterPage);
  }, [user?.id, queryClient]);

  const handleDecline = useCallback(async (targetProfile, index) => {
    if (!targetProfile || !user?.id) {
      Alert.alert('Error', 'Missing user profile data.');
      return;
    }

    // Snapshot previous caches (for rollback on error)
    const prevAllMatches = queryClient.getQueryData(['allMatches', user?.id]);
    const prevDailyUpdates = queryClient.getQueryData(['dailyUpdates', user?.id]);
    const prevPassed = queryClient.getQueryData(['passedInterests', user?.id]);

    removeFromCaches(targetProfile);

    // Optimistically add to passed interests
    queryClient.setQueryData(['passedInterests', user?.id], (old) => {
      const newItem = {
        id: `temp-${Date.now()}`,
        user_id: user.id,
        target_user_id: targetProfile.id,
        created_at: new Date().toISOString(),
        target: targetProfile,
      };
      return [newItem, ...(old || [])];
    });

    try {
      await passProfile(user.id, targetProfile.id);
      queryClient.invalidateQueries({ queryKey: ['passedInterests', user?.id] });
      queryClient.invalidateQueries({ queryKey: ['userInteractions', user?.id] });
    } catch (err) {
      // Revert: restoring the caches brings the card back and it
      // plays its entering animation naturally.
      queryClient.setQueryData(['allMatches', user?.id], prevAllMatches);
      queryClient.setQueryData(['dailyUpdates', user?.id], prevDailyUpdates);
      queryClient.setQueryData(['passedInterests', user?.id], prevPassed);
      console.warn('Failed to pass profile:', err);
      Alert.alert('Error', 'Failed to pass profile. Please try again.');
    }
  }, [user?.id, queryClient, removeFromCaches]);

  const handleInterested = useCallback(async (targetProfile, index) => {
    if (!targetProfile || !user?.id) {
      Alert.alert('Error', 'Missing user profile data.');
      return;
    }

    const hasPhoto = (profile?.photos?.length || 0) > 0 || (myPhotos?.length || 0) > 0 || hasSavedPhoto;

    if (!hasPhoto) {
      Alert.alert(
        'Photo Required',
        'Please upload at least one photo to your profile before sending interests.',
        [
          { text: 'Cancel', style: 'cancel' },
          { text: 'Add Photo', onPress: () => navigation.navigate('EditProfile') },
        ]
      );
      return;
    }

    // Snapshot previous caches
    const prevAllMatches = queryClient.getQueryData(['allMatches', user?.id]);
    const prevDailyUpdates = queryClient.getQueryData(['dailyUpdates', user?.id]);
    const prevSent = queryClient.getQueryData(['interestsSent', user?.id]);

    removeFromCaches(targetProfile);

    // Optimistically add to sent interests
    queryClient.setQueryData(['interestsSent', user?.id], (old) => {
      const newItem = {
        id: `temp-${Date.now()}`,
        sender_id: user.id,
        receiver_id: targetProfile.id,
        status: 'sent',
        created_at: new Date().toISOString(),
        receiver: targetProfile,
      };
      return [newItem, ...(old || [])];
    });

    try {
      await sendInterest(user.id, targetProfile.id);
      // Invalidate quotas and interactions so safety filters run immediately
      queryClient.invalidateQueries({ queryKey: ['user_dashboard_summary', user?.id] });
      queryClient.invalidateQueries({ queryKey: ['userInteractions', user?.id] });
      queryClient.invalidateQueries({ queryKey: ['interestsSent', user?.id] });
      queryClient.invalidateQueries({ queryKey: ['interestsReceived', user?.id] });
      setInterestSent(true);
    } catch (err) {
      console.warn('Failed to send interest:', err);
      // Revert: restoring the caches brings the card back and it
      // plays its entering animation naturally.

      if (err.message?.includes('QUOTA_EXCEEDED') || err.message?.includes('Insufficient interest credits')) {
        queryClient.setQueryData(['allMatches', user?.id], prevAllMatches);
        queryClient.setQueryData(['dailyUpdates', user?.id], prevDailyUpdates);
        queryClient.setQueryData(['interestsSent', user?.id], prevSent);
        Alert.alert(
          'Limit Exceeded',
          'You have used all your interest requests. Please recharge your plan to send more.',
          [
            { text: 'Cancel', style: 'cancel' },
            { text: 'Upgrade', onPress: () => navigation.navigate('Premium') },
          ]
        );
      } else if (
        err.message?.includes('Interest already') || 
        err.message?.includes('already received') || 
        err.message?.includes('duplicate key value')
      ) {
        // Already sent! Keep the optimistic UI (mark as sent) and skip error popup
      } else {
        queryClient.setQueryData(['allMatches', user?.id], prevAllMatches);
        queryClient.setQueryData(['dailyUpdates', user?.id], prevDailyUpdates);
        queryClient.setQueryData(['interestsSent', user?.id], prevSent);
        Alert.alert('Error', 'Failed to send interest. Please try again.');
      }
    }
  }, [profile?.photos, myPhotos, hasSavedPhoto, user?.id, queryClient, navigation, removeFromCaches]);

  const handleProfilePress = useCallback((prof) => {
    navigation.navigate('UserProfile', { profileId: prof.id });
  }, [navigation]);

  // A little taller than before (0.65 → 0.70), with a sensible floor, so
  // five lines of detail text plus the button row have comfortable room
  // instead of feeling cramped or overlapping.
  const itemCardHeight = Math.max(containerHeight * 0.70, 460);

  const renderListItem = useCallback(({ item, index }) => {
    if (item.__divider) {
      return <NewTodayDivider />;
    }
    return (
      <ProfileMatchCard
        item={item}
        index={index}
        isPremium={isPremium}
        onPress={handleProfilePress}
        onInterested={handleInterested}
        onDecline={handleDecline}
        onPremiumAlert={showPremiumAlert}
        cardHeight={itemCardHeight}
      />
    );
  }, [handleProfilePress, handleInterested, handleDecline, showPremiumAlert, isPremium, itemCardHeight]);


  return (
    <SafeAreaView style={styles.safeContainer} edges={['top', 'left', 'right']}>
      {/* Header */}
      <View style={styles.header}>
        <Text style={styles.headerTitle}>Your Matches</Text>
      </View>

      {/* Tabs */}
      <View style={styles.tabContainer}>
        <TouchableOpacity
          style={[styles.tab, activeTab === 'all_matches' && styles.tabActive]}
          onPress={() => handleTabChange('all_matches')}
        >
          <Text style={[styles.tabText, activeTab === 'all_matches' && styles.tabTextActive]}>
            All Matches
          </Text>
        </TouchableOpacity>
        <TouchableOpacity
          style={[styles.tab, activeTab === 'daily' && styles.tabActive]}
          onPress={() => handleTabChange('daily')}
        >
          <Text style={[styles.tabText, activeTab === 'daily' && styles.tabTextActive]}>
            Daily Updates
          </Text>
        </TouchableOpacity>
      </View>

      <View style={styles.countContainer}>
        <Text style={styles.countText}>
          Loaded Profiles: <Text style={styles.countValue}>{displayData.length}</Text>
        </Text>
      </View>

      {/* Card Arena */}
      <View 
        style={styles.contentBody}
        onLayout={(e) => setContainerHeight(e.nativeEvent.layout.height)}
      >
        {isLoading || containerHeight === 0 ? (
          <View style={styles.skeletonContainer}>
            <ProfileCardSkeleton />
            <View style={{ height: 20 }} />
            <ProfileCardSkeleton />
            <View style={{ height: 20 }} />
            <ProfileCardSkeleton />
          </View>
        ) : displayData.length > 0 ? (
            <FlatList
              data={displayData}
              keyExtractor={(item) => item.id.toString()}
              renderItem={renderListItem}
              initialNumToRender={3}
              maxToRenderPerBatch={5}
              windowSize={7}
              removeClippedSubviews={false}
              contentContainerStyle={styles.flatListContent}
              showsVerticalScrollIndicator={false}
              onEndReached={() => {
                if (activeTab === 'all_matches' && hasNextRecommended && !fetchingNextRecommended) {
                  fetchNextRecommended();
                } else if (activeTab === 'daily' && hasNextDaily && !fetchingNextDaily) {
                  fetchNextDaily();
                }
              }}
              onEndReachedThreshold={0.5}
              ListFooterComponent={() => {
                const isFetching = activeTab === 'all_matches' ? fetchingNextRecommended : fetchingNextDaily;
                if (!isFetching) return null;
                return (
                  <View style={{ paddingVertical: 20 }}>
                    <ActivityIndicator size="small" color={colors.primary} />
                  </View>
                );
              }}
              refreshControl={
                <RefreshControl
                  refreshing={activeTab === 'all_matches' ? loadingRecommended : loadingDaily}
                  onRefresh={() => {
                    if (activeTab === 'all_matches') refetchRecommended?.();
                    else refetchDaily?.();
                  }}
                  tintColor={colors.primary}
                />
              }
            />
        ) : (
          <View style={styles.emptyContainer}>
            <EmptyState
              preset={activeTab === 'daily' ? 'noDaily' : 'noMatches'}
            />
          </View>
        )}
      </View>

      <SuccessOverlay
        visible={interestSent}
        icon="heart"
        tint={colors.primary}
        title="Interest Sent!"
        subtitle="We'll notify you when they respond"
        onDone={() => setInterestSent(false)}
      />
    </SafeAreaView>
  );
};

const styles = StyleSheet.create({
  safeContainer: {
    flex: 1,
    backgroundColor: colors.background,
  },
  header: {
    paddingHorizontal: layout.screenPaddingHorizontal,
    paddingTop: 12,
    paddingBottom: 8,
    backgroundColor: colors.background,
  },
  headerTitle: {
    fontSize: 24,
    fontWeight: '700',
    color: colors.textPrimary,
    letterSpacing: -0.3,
  },
  tabContainer: {
    flexDirection: 'row',
    backgroundColor: colors.background,
    borderBottomWidth: 1,
    borderBottomColor: colors.borderLight,
    paddingHorizontal: layout.screenPaddingHorizontal,
  },
  tab: {
    flex: 1,
    paddingVertical: 12,
    alignItems: 'center',
    borderBottomWidth: 2.5,
    borderBottomColor: 'transparent',
  },
  tabActive: {
    borderBottomColor: colors.primary,
  },
  tabText: {
    fontSize: 14,
    color: colors.textSecondary,
    fontWeight: '600',
  },
  tabTextActive: {
    color: colors.primary,
  },

  contentBody: {
    flex: 1,
    backgroundColor: colors.surface,
  },
  emptyContainer: {
    flex: 1,
    justifyContent: 'center',
    alignItems: 'center',
    marginTop: 40,
  },
  countContainer: {
    paddingHorizontal: layout.screenPaddingHorizontal,
    paddingVertical: 8,
    alignItems: 'flex-end',
  },
  countText: {
    fontSize: 12,
    color: colors.textSecondary,
    fontWeight: '500',
  },
  countValue: {
    color: colors.primary,
    fontWeight: '700',
  },
  skeletonContainer: {
    flex: 1,
  },

  // ── Card ──
  flatListContent: {
    paddingBottom: 24,
    paddingTop: 12,
  },
  cardWrapper: {
    justifyContent: 'center',
    alignItems: 'center',
    backgroundColor: colors.surface,
    marginVertical: 10,
    marginHorizontal: layout.screenPaddingHorizontal,
    borderRadius: borderRadius['2xl'],
    ...shadows.card,
  },
  // FIX #1: The card-level touchable only covers the photo/info area.
  // Action buttons are rendered as siblings, not children, of this touchable.
  cardTappableArea: {
    width: '100%',
    flex: 1,
    backgroundColor: colors.surfaceElevated,
    position: 'relative',
    overflow: 'hidden',
    borderRadius: borderRadius['2xl'],
  },
  cardInner: {
    flex: 1,
  },
  photoContainer: {
    ...StyleSheet.absoluteFillObject,
    backgroundColor: colors.primarySurface,
  },
  cardImage: {
    width: '100%',
    height: '100%',
  },
  noPhotoBackground: {
    flex: 1,
    alignItems: 'center',
    justifyContent: 'center',
    backgroundColor: colors.primarySurface,
  },
  noPhotoInitial: {
    fontSize: 64,
    fontWeight: '700',
    color: colors.primary,
    opacity: 0.2,
  },
  noPhotoText: {
    fontSize: 15,
    color: colors.textMuted,
    marginTop: 8,
    fontWeight: '500',
  },
  compatBubble: {
    position: 'absolute',
    top: 16,
    left: 16,
    backgroundColor: 'rgba(0,0,0,0.6)',
    paddingHorizontal: 10,
    paddingVertical: 4,
    borderRadius: borderRadius.sm,
    alignItems: 'center',
    justifyContent: 'center',
  },
  compatBubbleText: {
    color: '#FFF',
    fontSize: 12,
    fontWeight: '700',
  },
  // FIX #5: paddingBottom now reserves ACTION_BAR_HEIGHT + a visual gap for
  // the action-bar overlay, so the gradient/text never sits underneath
  // the buttons.
  infoContainer: {
    position: 'absolute',
    bottom: 0,
    left: 0,
    right: 0,
    paddingHorizontal: 20,
    paddingTop: 80,
    paddingBottom: ACTION_BAR_HEIGHT + ACTION_BAR_GAP,
  },
  infoHeader: {
    flexDirection: 'row',
    alignItems: 'center',
  },
  nameText: {
    fontSize: 24,
    fontWeight: '700',
    color: '#FFF',
    flexShrink: 1,
  },
  basicInfoText: {
    fontSize: 14,
    color: 'rgba(255, 255, 255, 0.9)',
    marginTop: 4,
    fontWeight: '600',
  },
  detailsRow: {
    flexDirection: 'row',
    alignItems: 'center',
    gap: 6,
    marginTop: 6,
  },
  detailsText: {
    fontSize: 13,
    color: 'rgba(255, 255, 255, 0.78)',
    flexShrink: 1,
  },
  // FIX #1 / FIX #5: Action buttons sit in their own fixed-height strip at
  // the very bottom, as a SIBLING of the tappable card area (not nested
  // inside it), and with a height that matches what infoContainer reserves.
  actionsRowOverlay: {
    position: 'absolute',
    bottom: 0,
    left: 0,
    right: 0,
    height: ACTION_BAR_HEIGHT,
    flexDirection: 'row',
    alignItems: 'center',
    gap: 12,
    paddingHorizontal: 20,
    paddingBottom: 16,
  },
  actionBtnSkip: {
    flex: 1,
    flexDirection: 'row',
    alignItems: 'center',
    justifyContent: 'center',
    paddingVertical: 12,
    borderRadius: borderRadius.full,
    backgroundColor: 'rgba(255, 255, 255, 0.16)',
    borderWidth: 1,
    borderColor: 'rgba(255, 255, 255, 0.35)',
    gap: 6,
  },
  actionBtnSkipText: {
    fontSize: 14,
    fontWeight: '700',
    color: 'rgba(255, 255, 255, 0.9)',
  },
  actionBtnInterest: {
    flex: 1,
    flexDirection: 'row',
    alignItems: 'center',
    justifyContent: 'center',
    paddingVertical: 12,
    borderRadius: borderRadius.full,
    backgroundColor: colors.primary,
    borderWidth: 1,
    borderColor: colors.primary,
    gap: 6,
    ...shadows.button,
  },
  actionBtnInterestText: {
    fontSize: 14,
    fontWeight: '700',
    color: '#FFF',
  },

  // ── New Profiles Today Divider ──
  newTodayDivider: {
    flexDirection: 'row',
    alignItems: 'center',
    gap: 12,
    marginVertical: 8,
    paddingHorizontal: 4,
  },
  newTodayLine: {
    flex: 1,
    height: 1,
    backgroundColor: colors.borderLight,
  },
  newTodayText: {
    fontSize: 13,
    fontWeight: '700',
    color: colors.primary,
    textAlign: 'center',
  },

  // ── Load more / end of list ──
  loadingMore: {
    flexDirection: 'row',
    alignItems: 'center',
    justifyContent: 'center',
    gap: 10,
    paddingVertical: 24,
  },
  loadingMoreText: {
    fontSize: 14,
    fontWeight: '600',
    color: colors.textSecondary,
  },
  endOfList: {
    alignItems: 'center',
    paddingVertical: 28,
    paddingHorizontal: 24,
    gap: 6,
  },
  endOfListLine: {
    width: 40,
    height: 3,
    borderRadius: 2,
    backgroundColor: colors.borderLight,
    marginBottom: 10,
  },
  endOfListText: {
    fontSize: 14,
    fontWeight: '700',
    color: colors.textPrimary,
    textAlign: 'center',
  },
  endOfListSubtext: {
    fontSize: 13,
    color: colors.textMuted,
    textAlign: 'center',
  },

  // ── Lock Card ──
  lockCard: {
    margin: layout.screenPaddingHorizontal,
    marginTop: 24,
    backgroundColor: colors.cardBackground,
    borderWidth: 1,
    borderColor: colors.borderLight,
    borderRadius: borderRadius.xl,
    padding: 28,
    alignItems: 'center',
    gap: 14,
    ...shadows.card,
  },
  lockIcon: {
    fontSize: 40,
    color: colors.textMuted,
  },
  lockTitle: {
    fontSize: 20,
    fontWeight: '700',
    color: colors.primaryDark,
    textAlign: 'center',
  },
  lockDescription: {
    fontSize: 14,
    color: colors.textSecondary,
    textAlign: 'center',
    lineHeight: 21,
    fontWeight: '500',
  },
  lockTiers: {
    flexDirection: 'row',
    gap: 10,
    width: '100%',
    marginTop: 8,
  },
  lockTierItem: {
    flex: 1,
    borderWidth: 1.5,
    borderRadius: borderRadius.lg,
    padding: 12,
    alignItems: 'center',
    backgroundColor: colors.cardBackground,
    gap: 4,
  },
  lockTierName: {
    fontSize: 13,
    fontWeight: '700',
  },
  lockTierPrice: {
    fontSize: 11,
    color: colors.textSecondary,
    fontWeight: '600',
  },
  lockCta: {
    backgroundColor: colors.primary,
    borderRadius: borderRadius.md,
    paddingVertical: 13,
    paddingHorizontal: 32,
    alignItems: 'center',
    marginTop: 8,
    ...shadows.button,
  },
  lockCtaText: {
    fontSize: 14,
    fontWeight: '700',
    color: colors.textInverse,
  },
});

export default MatchesScreen;