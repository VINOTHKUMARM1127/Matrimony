/**
 * Tamil Matrimony — Matches Dashboard (Premium Redesign)
 * Full-screen photo cards with professional text-based action buttons,
 * progress indicator, and premium visual treatment.
 */
import React, { useState, useMemo, useCallback } from 'react';
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
} from 'react-native';
import { SafeAreaView } from 'react-native-safe-area-context';
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
import { fetchPremiumPlans } from '../../api/settingsApi';
import SuccessOverlay from '../../components/common/SuccessOverlay';

const { width: SCREEN_WIDTH } = Dimensions.get('window');

const MatchesScreen = ({ navigation }) => {
  const [activeTab, setActiveTab] = useState('recommended');
  const [interestSent, setInterestSent] = useState(false);
  const queryClient = useQueryClient();

  const profile = useProfileStore((s) => s.profile);
  const isPremium = profile?.is_premium || false;

  const { 
    recommended: recommendedProfiles = [], 
    loadingRecommended, 
    fetchNextRecommended,
    hasNextRecommended,
    fetchingNextRecommended,
    refetchRecommended,

    nearbyMatches = [],
    loadingNearby,
    fetchNextNearby,
    hasNextNearby,
    fetchingNextNearby,
    refetchNearby,

    dailyMatches = [], 
    loadingDaily,
    fetchNextDaily,
    hasNextDaily,
    fetchingNextDaily,
    refetchDaily,

    refetchAdminSettings,
    limits
  } = useMatches();

  const user = useAuthStore((s) => s.user);

  // Live plan pricing for the lock card (no hardcoded prices/names).
  const { data: lockPlans = [] } = useQuery({
    queryKey: ['premiumPlans'],
    queryFn: fetchPremiumPlans,
    staleTime: 5 * 60 * 1000,
  });

  const rawData = activeTab === 'daily' ? (dailyMatches || []) 
                : activeTab === 'nearby' ? nearbyMatches 
                : (recommendedProfiles || []);
  const isLoading = activeTab === 'daily' ? loadingDaily 
                  : activeTab === 'nearby' ? loadingNearby
                  : loadingRecommended;

  const displayData = rawData;

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

  const handleDecline = useCallback(async (targetProfile) => {
    if (!isPremium) return showPremiumAlert();
    if (targetProfile && profile?.id) {
      try {
        await passProfile(profile.id, targetProfile.id);
        // Refetch all feeds so backend returns fresh profiles (excluding the passed one)
        queryClient.invalidateQueries({ queryKey: ['recommended'] });
        queryClient.invalidateQueries({ queryKey: ['nearbyMatches'] });
        queryClient.invalidateQueries({ queryKey: ['dailyMatches'] });
        queryClient.invalidateQueries({ queryKey: ['passedInterests'] });
      } catch (err) {
        console.warn('Failed to pass profile:', err);
        Alert.alert('Error', 'Failed to pass profile. Please try again.');
      }
    }
  }, [isPremium, profile?.id, queryClient, showPremiumAlert]);

  const handleInterested = useCallback(async (targetProfile) => {
    if (!isPremium) return showPremiumAlert();
    if (targetProfile && profile?.id) {
      try {
        await sendInterest(profile.id, targetProfile.id);
        // Refetch all feeds so backend returns fresh profiles (excluding the interested one)
        queryClient.invalidateQueries({ queryKey: ['user_quotas', user?.id] });
        queryClient.invalidateQueries({ queryKey: ['recommended'] });
        queryClient.invalidateQueries({ queryKey: ['nearbyMatches'] });
        queryClient.invalidateQueries({ queryKey: ['dailyMatches'] });
        queryClient.invalidateQueries({ queryKey: ['interestsSent'] });
        queryClient.invalidateQueries({ queryKey: ['interestsReceived'] });
        setInterestSent(true);
      } catch (err) {
        console.warn('Failed to send interest:', err);
        if (err.message?.includes('QUOTA_EXCEEDED')) {
          Alert.alert(
            'Limit Exceeded',
            'You have used all your interest requests. Please recharge your plan to send more.',
            [
              { text: 'Cancel', style: 'cancel' },
              { text: 'Upgrade', onPress: () => navigation.navigate('Premium') },
            ]
          );
        } else {
          Alert.alert('Error', 'Failed to send interest. They might have already received one from you.');
        }
      }
    }
  }, [isPremium, profile?.id, queryClient, navigation, showPremiumAlert]);

  const handleProfilePress = useCallback((prof) => {
    if (prof.isLocked) {
      return showPremiumAlert();
    }
    navigation.navigate('UserProfile', { profileId: prof.id });
  }, [navigation, showPremiumAlert]);

  const getPrimaryPhoto = (prof) => {
    if (!prof?.photos?.length) {
      return null;
    }
    const primary = prof.photos.find((p) => p.is_primary);
    const url = (primary || prof.photos[0])?.storage_path;
    return url;
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

  const renderItem = useCallback(({ item }) => {
    const age = calculateAge(item.date_of_birth);
    const photoUri = getPrimaryPhoto(item);
    // Stable score: prefer the backend compatibility_score; deterministic
    // fallback derived from the id so it never changes between renders.
    const score = item.compatibility_score
      || (65 + (parseInt(String(item.id).replace(/\D/g, '').slice(-2) || '0', 10) % 25));
    const photoCount = item.photos?.length || 0;

    return (
      <View style={styles.cardWrapper}>
        <TouchableOpacity
          style={styles.card}
          activeOpacity={0.95}
          onPress={() => handleProfilePress(item)}
        >
          {/* Full Image Background */}
          {photoUri ? (
            <Image
              source={{ uri: photoUri }}
              style={styles.cardImage}
              contentFit="cover"
              transition={200}
              cachePolicy="memory-disk"
              blurRadius={item.isLocked ? 15 : 0}
            />
          ) : (
            <View style={styles.noPhotoBackground}>
              {item.isLocked ? (
                <Ionicons name="lock-closed" size={32} color={colors.textMuted} style={styles.noPhotoInitial} />
              ) : (
                <Text style={styles.noPhotoInitial}>
                  {item.display_name?.charAt(0) || '?'}
                </Text>
              )}
              <Text style={styles.noPhotoText}>{item.isLocked ? 'Premium Match' : 'No Photo'}</Text>
            </View>
          )}

          {/* Top Floating Badges */}
          <View style={styles.floatingTopContainer}>
            <View style={styles.badgeRow}>
              {item.is_premium && (
                <View style={styles.premiumBadge}>
                  <Text style={styles.premiumBadgeText}>★ Premium</Text>
                </View>
              )}
              {item.is_verified && (
                <View style={styles.verifiedBadge}>
                  <Ionicons name="checkmark-circle" size={12} color="#FFF" />
                  <Text style={[styles.verifiedBadgeText, { marginLeft: 4 }]}>Verified</Text>
                </View>
              )}
            </View>
            <View style={styles.compatRing}>
              {isPremium ? (
                <>
                  <Text style={styles.compatRingPercent}>{score}%</Text>
                  <Text style={styles.compatRingLabel}>Match</Text>
                </>
              ) : (
                <>
                  <Ionicons name="lock-closed" size={16} color={colors.textMuted} style={styles.compatRingPercent} />
                  <Text style={styles.compatRingLabel}>Hidden</Text>
                </>
              )}
            </View>
          </View>

          {/* Photo Count */}
          {photoCount > 1 && (
            <View style={styles.photoCountBadge}>
              <Text style={styles.photoCountText}>1/{photoCount}</Text>
            </View>
          )}

          {/* Bottom Details + Actions — Integrated Inside Card */}
          <LinearGradient
            colors={['transparent', 'rgba(0,0,0,0.65)', 'rgba(0,0,0,0.85)']}
            locations={[0, 0.45, 1]}
            style={styles.detailsGradient}
          >
            <Text style={styles.nameText} numberOfLines={1}>
              {item.isLocked ? `${item.display_name?.charAt(0)}*****` : item.display_name}, {age}
            </Text>
            <Text style={styles.infoLine} numberOfLines={1}>
              {item.isLocked ? 'Location Hidden' : `${item.city}${item.district ? `, ${item.district}` : ''}`} · {item.isLocked ? 'Profession Hidden' : (item.occupation || 'Professional')}
            </Text>
            <Text style={styles.infoLine} numberOfLines={1}>
              {item.isLocked ? 'Education Hidden' : (item.education || 'Graduate')} · {item.religion || 'Hindu'} {!item.isLocked && item.caste ? item.caste : ''}
            </Text>

            {/* Action Buttons Inside Card */}
            <View style={styles.actionsToolbar}>
              {item.isLocked ? (
                <TouchableOpacity
                  style={[styles.actionBtn, { backgroundColor: colors.goldDark, borderWidth: 1, borderColor: colors.goldDark }]}
                  onPress={showPremiumAlert}
                  activeOpacity={0.7}
                >
                  <Ionicons name="lock-closed" size={14} color="#FFF" style={{ marginRight: 6 }} />
                  <Text style={[styles.interestedActionText, { color: '#FFF' }]}>Upgrade to View</Text>
                </TouchableOpacity>
              ) : (
                <>
                  <TouchableOpacity
                    style={[styles.actionBtn, styles.declineActionBtn]}
                    onPress={() => handleDecline(item)}
                    activeOpacity={0.7}
                  >
                    <Text style={styles.declineActionText}>✕  Skip</Text>
                  </TouchableOpacity>
                  <TouchableOpacity
                    style={[styles.actionBtn, styles.interestedActionBtn]}
                    onPress={() => handleInterested(item)}
                    activeOpacity={0.7}
                  >
                    <Text style={styles.interestedActionText}>♥  Interested</Text>
                  </TouchableOpacity>
                </>
              )}
            </View>
          </LinearGradient>
        </TouchableOpacity>
      </View>
    );
  }, [handleProfilePress, handleInterested, handleDecline, showPremiumAlert]);

  const renderFooter = () => {
    if (isPremium || displayData.length === 0) return null;
    
    const currentLimit = activeTab === 'daily' ? limits?.daily_limit 
                       : activeTab === 'nearby' ? limits?.nearby_limit 
                       : limits?.recommended_limit;

    return (
      <View style={styles.lockCard}>
        <Text style={styles.lockIcon}>⊘</Text>
        <Text style={styles.lockTitle}>Premium Matches Locked</Text>
        <Text style={styles.lockDescription}>
          {currentLimit
            ? `You've viewed your limit of ${currentLimit} profiles! Upgrade to instantly unlock all premium matches and daily updates.`
            : `Upgrade to instantly unlock all premium matches and daily updates.`}
        </Text>
        <View style={styles.lockTiers}>
          {lockPlans.map((tier) => (
            <View key={tier.id} style={[styles.lockTierItem, { borderColor: tier.color }]}>
              <Text style={[styles.lockTierName, { color: tier.color }]}>{tier.name}</Text>
              <Text style={styles.lockTierPrice}>₹{tier.price}/{tier.durationMonths}mo</Text>
            </View>
          ))}
        </View>
        <TouchableOpacity
          style={styles.lockCta}
          onPress={() => navigation.navigate('UpgradesTab')}
        >
          <Text style={styles.lockCtaText}>View All Plans</Text>
        </TouchableOpacity>
      </View>
    );
  };

  return (
    <SafeAreaView style={styles.safeContainer} edges={['top', 'left', 'right']}>
      {/* Header */}
      <View style={styles.header}>
        <Text style={styles.headerTitle}>Your Matches</Text>
      </View>

      {/* Tabs */}
      <View style={styles.tabContainer}>
        <TouchableOpacity
          style={[styles.tab, activeTab === 'recommended' && styles.tabActive]}
          onPress={() => handleTabChange('recommended')}
        >
          <Text style={[styles.tabText, activeTab === 'recommended' && styles.tabTextActive]}>
            Recommended
          </Text>
        </TouchableOpacity>
        <TouchableOpacity
          style={[styles.tab, activeTab === 'nearby' && styles.tabActive]}
          onPress={() => handleTabChange('nearby')}
        >
          <Text style={[styles.tabText, activeTab === 'nearby' && styles.tabTextActive]}>
            Nearby
          </Text>
        </TouchableOpacity>
        <TouchableOpacity
          style={[styles.tab, activeTab === 'daily' && styles.tabActive]}
          onPress={() => handleTabChange('daily')}
        >
          <Text style={[styles.tabText, activeTab === 'daily' && styles.tabTextActive]}>
            Daily
          </Text>
        </TouchableOpacity>
      </View>

      {/* Card Arena */}
      <View style={styles.contentBody}>
        {isLoading ? (
          <View style={styles.skeletonContainer}>
            <ProfileCardSkeleton />
            <View style={{ height: 20 }} />
            <ProfileCardSkeleton />
            <View style={{ height: 20 }} />
            <ProfileCardSkeleton />
          </View>
        ) : (
            <FlatList
              key={activeTab} // Force remount on tab change to reset scroll position
              data={displayData}
              keyExtractor={(item) => item.id}
              renderItem={renderItem}
              contentContainerStyle={styles.flatListContent}
              showsVerticalScrollIndicator={false}
              removeClippedSubviews
              initialNumToRender={4}
              maxToRenderPerBatch={6}
              windowSize={7}
              updateCellsBatchingPeriod={50}
              onEndReached={() => {
                if (activeTab === 'recommended' && hasNextRecommended && !fetchingNextRecommended) fetchNextRecommended();
                else if (activeTab === 'nearby' && hasNextNearby && !fetchingNextNearby) fetchNextNearby();
                else if (activeTab === 'daily' && hasNextDaily && !fetchingNextDaily) fetchNextDaily();
              }}
              onEndReachedThreshold={0.5}
              ListFooterComponent={() => (
                <>
                  {(fetchingNextRecommended || fetchingNextNearby || fetchingNextDaily) && (
                    <ActivityIndicator size="small" color={colors.primary} style={{ marginVertical: 20 }} />
                  )}
                  {renderFooter()}
                </>
              )}
              refreshControl={
                <RefreshControl 
                  refreshing={false}
                  onRefresh={() => {
                    refetchAdminSettings().then(() => {
                      if (activeTab === 'recommended') refetchRecommended();
                      else if (activeTab === 'nearby') refetchNearby();
                      else if (activeTab === 'daily') refetchDaily();
                    });
                  }}
                  tintColor={colors.primary}
                  colors={[colors.primary]}
                />
              }
              ListEmptyComponent={
              <View style={styles.emptyContainer}>
                <EmptyState
                  preset={activeTab === 'nearby' ? 'noNearby' : 'noMatches'}
                />
              </View>
            }
            ListFooterComponent={renderFooter}
          />
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
    padding: 16,
  },
  skeletonContainer: {
    flex: 1,
    paddingHorizontal: layout.screenPaddingHorizontal,
    paddingTop: 16,
    paddingBottom: 24,
  },

  // ── Card ──
  flatListContent: {
    paddingHorizontal: layout.screenPaddingHorizontal,
    paddingBottom: 24,
  },
  cardWrapper: {
    marginBottom: 24,
    borderRadius: borderRadius['2xl'],
    ...shadows.card,
  },
  card: {
    height: 480,
    backgroundColor: colors.surfaceElevated,
    position: 'relative',
    borderRadius: borderRadius['2xl'],
    overflow: 'hidden',
  },
  cardImage: {
    width: '100%',
    height: '100%',
  },
  noPhotoBackground: {
    width: '100%',
    height: '100%',
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

  // Top badges
  floatingTopContainer: {
    position: 'absolute',
    top: 16,
    left: 16,
    right: 16,
    flexDirection: 'row',
    justifyContent: 'space-between',
    alignItems: 'flex-start',
  },
  badgeRow: {
    flexDirection: 'row',
    gap: 6,
  },
  premiumBadge: {
    backgroundColor: colors.gold,
    paddingHorizontal: 10,
    paddingVertical: 4,
    borderRadius: borderRadius.full,
  },
  premiumBadgeText: {
    fontSize: 11,
    fontWeight: '700',
    color: '#1C1917',
  },
  verifiedBadge: {
    backgroundColor: 'rgba(255,255,255,0.9)',
    paddingHorizontal: 10,
    paddingVertical: 4,
    borderRadius: borderRadius.full,
  },
  verifiedBadgeText: {
    fontSize: 11,
    fontWeight: '700',
    color: colors.verified,
  },

  // Compatibility Ring
  compatRing: {
    width: 54,
    height: 54,
    borderRadius: 27,
    borderWidth: 3,
    borderColor: colors.primary,
    backgroundColor: 'rgba(0,0,0,0.5)',
    alignItems: 'center',
    justifyContent: 'center',
  },
  compatRingPercent: {
    fontSize: 15,
    fontWeight: '700',
    color: colors.textInverse,
  },
  compatRingLabel: {
    fontSize: 8,
    color: 'rgba(255,255,255,0.8)',
    fontWeight: '600',
  },

  // Photo count
  photoCountBadge: {
    position: 'absolute',
    top: 16,
    right: 80,
    backgroundColor: 'rgba(0,0,0,0.5)',
    paddingHorizontal: 8,
    paddingVertical: 3,
    borderRadius: borderRadius.sm,
  },
  photoCountText: {
    fontSize: 11,
    color: colors.textInverse,
    fontWeight: '600',
  },

  // Bottom gradient overlay
  detailsGradient: {
    position: 'absolute',
    bottom: 0,
    left: 0,
    right: 0,
    paddingHorizontal: 20,
    paddingBottom: 20,
    paddingTop: 100,
  },
  nameText: {
    fontSize: 24,
    fontWeight: '700',
    color: '#FFFFFF',
    marginBottom: 6,
  },
  infoLine: {
    fontSize: 14,
    color: 'rgba(255, 255, 255, 0.9)',
    fontWeight: '500',
    marginBottom: 2,
  },
  bioText: {
    fontSize: 13,
    color: 'rgba(255, 255, 255, 0.7)',
    lineHeight: 18,
    fontStyle: 'italic',
    marginTop: 8,
  },



  // ── Action Buttons (Inside Card, Premium Glassmorphism) ──
  actionsToolbar: {
    flexDirection: 'row',
    gap: 12,
    marginTop: 16,
  },
  actionBtn: {
    flex: 1,
    paddingVertical: 13,
    borderRadius: borderRadius.full,
    alignItems: 'center',
    justifyContent: 'center',
  },
  declineActionBtn: {
    backgroundColor: 'rgba(255, 255, 255, 0.15)',
    borderWidth: 1,
    borderColor: 'rgba(255, 255, 255, 0.3)',
  },
  declineActionText: {
    fontSize: 14,
    fontWeight: '700',
    color: 'rgba(255, 255, 255, 0.85)',
    letterSpacing: 0.3,
  },
  interestedActionBtn: {
    backgroundColor: colors.primary,
    borderWidth: 1,
    borderColor: colors.primary,
    ...shadows.button,
  },
  interestedActionText: {
    fontSize: 14,
    fontWeight: '700',
    color: '#FFFFFF',
    letterSpacing: 0.3,
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
