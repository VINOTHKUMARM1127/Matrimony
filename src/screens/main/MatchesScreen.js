/**
 * Tamil Matrimony — Matches Dashboard (Premium Redesign)
 * Full-screen photo cards with professional text-based action buttons,
 * progress indicator, and premium visual treatment.
 */
import React, { useState, useMemo } from 'react';
import {
  View,
  Text,
  StyleSheet,
  TouchableOpacity,
  Dimensions,
  FlatList,
  Alert,
} from 'react-native';
import { SafeAreaView } from 'react-native-safe-area-context';
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
import Button from '../../components/common/Button';
import { sendInterest, passProfile } from '../../api/interests';
import { useQueryClient } from '@tanstack/react-query';

const { width: SCREEN_WIDTH } = Dimensions.get('window');

const MatchesScreen = ({ navigation }) => {
  const [activeTab, setActiveTab] = useState('recommended');
  const queryClient = useQueryClient();

  const profile = useProfileStore((s) => s.profile);
  const isPremium = profile?.is_premium || false;

  const {
    recommended,
    dailyMatches,
    loadingRecommended,
    loadingDaily,
  } = useMatches(100);

  const nearbyMatches = useMemo(() => {
    if (!recommended || !profile) return [];
    return recommended.filter(
      (p) =>
        (profile.city && p.city === profile.city) ||
        (profile.district && p.district === profile.district)
    );
  }, [recommended, profile]);

  const rawData = activeTab === 'daily' ? (dailyMatches || []) 
                : activeTab === 'nearby' ? nearbyMatches 
                : (recommended || []);
  const isLoading = activeTab === 'daily' ? loadingDaily : loadingRecommended;

  const displayData = isPremium ? rawData : rawData.slice(0, 10);

  const handleTabChange = (tab) => {
    setActiveTab(tab);
  };

  const showPremiumAlert = () => {
    Alert.alert(
      'Premium Feature',
      'Upgrade to Premium to express interest or pass on profiles.',
      [
        { text: 'Cancel', style: 'cancel' },
        { text: 'Upgrade Now', onPress: () => navigation.navigate('UpgradesTab') }
      ]
    );
  };

  const handleDecline = async (targetProfile) => {
    if (!isPremium) return showPremiumAlert();
    if (targetProfile && profile?.id) {
      try {
        // Optimistic UI update: remove from feed immediately
        queryClient.setQueryData(['userInteractions', profile.id], (old = []) => [...old, targetProfile.id]);

        await passProfile(profile.id, targetProfile.id);
        queryClient.invalidateQueries({ queryKey: ['passedInterests'] });
        queryClient.invalidateQueries({ queryKey: ['userInteractions'] });
      } catch (err) {
        console.warn('Failed to pass profile:', err);
        Alert.alert('Error', 'Failed to pass profile. Please try again.');
        queryClient.invalidateQueries({ queryKey: ['userInteractions'] });
      }
    }
  };

  const handleInterested = async (targetProfile) => {
    if (!isPremium) return showPremiumAlert();
    if (targetProfile && profile?.id) {
      try {
        // Optimistic UI update: remove from feed immediately
        queryClient.setQueryData(['userInteractions', profile.id], (old = []) => [...old, targetProfile.id]);

        await sendInterest(profile.id, targetProfile.id);
        queryClient.invalidateQueries({ queryKey: ['interestsSent'] });
        queryClient.invalidateQueries({ queryKey: ['interestsReceived'] });
        queryClient.invalidateQueries({ queryKey: ['userInteractions'] });
        Alert.alert('Success', 'Interest sent successfully!');
      } catch (err) {
        console.warn('Failed to send interest:', err);
        Alert.alert('Error', 'Failed to send interest. They might have already received one from you.');
        queryClient.invalidateQueries({ queryKey: ['userInteractions'] });
      }
    }
  };

  const handleProfilePress = (prof) => {
    navigation.navigate('UserProfile', { profileId: prof.id });
  };

  const getPrimaryPhoto = (prof) => {
    if (!prof?.photos?.length) {
      console.log(`[DEBUG] No photos for profile ${prof.display_name}`);
      return null;
    }
    const primary = prof.photos.find((p) => p.is_primary);
    const url = (primary || prof.photos[0])?.storage_path;
    console.log(`[DEBUG] Profile ${prof.display_name} has photoUri:`, url);
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

  const renderItem = ({ item }) => {
    const age = calculateAge(item.date_of_birth);
    const photoUri = getPrimaryPhoto(item);
    const score = item.compatibility_score || Math.floor(Math.random() * 25) + 65;
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
              transition={300}
            />
          ) : (
            <View style={styles.noPhotoBackground}>
              <Text style={styles.noPhotoInitial}>
                {item.display_name?.charAt(0) || '?'}
              </Text>
              <Text style={styles.noPhotoText}>No Photo</Text>
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
                  <Text style={styles.verifiedBadgeText}>✓ Verified</Text>
                </View>
              )}
            </View>
            <View style={styles.compatRing}>
              <Text style={styles.compatRingPercent}>{score}%</Text>
              <Text style={styles.compatRingLabel}>Match</Text>
            </View>
          </View>

          {/* Photo Count */}
          {photoCount > 1 && (
            <View style={styles.photoCountBadge}>
              <Text style={styles.photoCountText}>1/{photoCount}</Text>
            </View>
          )}

          {/* Bottom Details Gradient Overlay */}
          <LinearGradient
            colors={['transparent', 'rgba(0,0,0,0.7)']}
            style={styles.detailsGradient}
          >
            <Text style={styles.nameText} numberOfLines={1}>
              {item.display_name}, {age}
            </Text>
            <Text style={styles.infoLine} numberOfLines={1}>
              {item.city}{item.district ? `, ${item.district}` : ''} · {item.occupation || 'Professional'}
            </Text>
            <Text style={styles.infoLine} numberOfLines={1}>
              {item.education || 'Graduate'} · {item.religion || 'Hindu'} {item.caste || ''}
            </Text>
            {item.about_me ? (
              <Text style={styles.bioText} numberOfLines={2}>
                "{item.about_me}"
              </Text>
            ) : null}
          </LinearGradient>
        </TouchableOpacity>

        {/* Professional Action Buttons */}
        <View style={styles.actionsToolbar}>
          <TouchableOpacity
            style={[styles.actionBtn, styles.declineActionBtn]}
            onPress={() => handleDecline(item)}
            activeOpacity={0.8}
          >
            <Text style={styles.declineActionText}>Not Interested</Text>
          </TouchableOpacity>
          <TouchableOpacity
            style={[styles.actionBtn, styles.interestedActionBtn]}
            onPress={() => handleInterested(item)}
            activeOpacity={0.8}
          >
            <Text style={styles.interestedActionText}>Interested</Text>
          </TouchableOpacity>
        </View>
      </View>
    );
  };

  const renderFooter = () => {
    if (isPremium || displayData.length === 0) return null;
    return (
      <View style={styles.lockCard}>
        <Text style={styles.lockIcon}>⊘</Text>
        <Text style={styles.lockTitle}>Premium Matches Locked</Text>
        <Text style={styles.lockDescription}>
          You've viewed your daily limit of 10 profiles! Upgrade to instantly unlock all premium matches.
        </Text>
        <View style={styles.lockTiers}>
          {[
            { name: 'Bronze', price: '₹499/mo', color: '#CD7F32' },
            { name: 'Silver', price: '₹999/mo', color: '#8A8A8A' },
            { name: 'Gold', price: '₹2499/6mo', color: '#D4A857' },
          ].map((tier) => (
            <View key={tier.name} style={[styles.lockTierItem, { borderColor: tier.color }]}>
              <Text style={[styles.lockTierName, { color: tier.color }]}>{tier.name}</Text>
              <Text style={styles.lockTierPrice}>{tier.price}</Text>
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
            Recommended ({recommended?.length || 0})
          </Text>
        </TouchableOpacity>
        <TouchableOpacity
          style={[styles.tab, activeTab === 'nearby' && styles.tabActive]}
          onPress={() => handleTabChange('nearby')}
        >
          <Text style={[styles.tabText, activeTab === 'nearby' && styles.tabTextActive]}>
            Nearby ({nearbyMatches?.length || 0})
          </Text>
        </TouchableOpacity>
        <TouchableOpacity
          style={[styles.tab, activeTab === 'daily' && styles.tabActive]}
          onPress={() => handleTabChange('daily')}
        >
          <Text style={[styles.tabText, activeTab === 'daily' && styles.tabTextActive]}>
            Daily ({dailyMatches?.length || 0})
          </Text>
        </TouchableOpacity>
      </View>

      {/* Card Arena */}
      <View style={styles.contentBody}>
        {isLoading ? (
          <View style={styles.skeletonContainer}>
            <ProfileCardSkeleton />
          </View>
        ) : (
          <FlatList
            data={displayData}
            keyExtractor={(item) => item.id}
            renderItem={renderItem}
            contentContainerStyle={styles.flatListContent}
            showsVerticalScrollIndicator={false}
            ListEmptyComponent={
              <View style={styles.emptyContainer}>
                <EmptyState
                  icon="✦"
                  title="No matches found!"
                  description="Adjust your search filters or check back later for fresh recommendations."
                />
              </View>
            }
            ListFooterComponent={renderFooter}
          />
        )}
      </View>
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
  },

  // ── Card ──
  flatListContent: {
    paddingHorizontal: layout.screenPaddingHorizontal,
    paddingBottom: 24,
  },
  cardWrapper: {
    marginBottom: 20,
    ...shadows.cardFloat,
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
    paddingTop: 80,
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



  // ── Action Buttons (Text-based, Professional) ──
  actionsToolbar: {
    flexDirection: 'row',
    gap: 10,
    marginTop: 12,
  },
  actionBtn: {
    flex: 1,
    paddingVertical: 13,
    borderRadius: borderRadius.md,
    alignItems: 'center',
    justifyContent: 'center',
  },
  declineActionBtn: {
    backgroundColor: 'transparent',
    borderWidth: 1.5,
    borderColor: colors.interestOutline,
  },
  declineActionText: {
    fontSize: 13,
    fontWeight: '600',
    color: colors.textSecondary,
  },
  shortlistActionBtn: {
    backgroundColor: 'transparent',
    borderWidth: 1.5,
    borderColor: colors.shortlistGold,
  },
  shortlistActionText: {
    fontSize: 13,
    fontWeight: '600',
    color: colors.shortlistGold,
  },
  interestedActionBtn: {
    backgroundColor: colors.primary,
    ...shadows.button,
  },
  interestedActionText: {
    fontSize: 13,
    fontWeight: '600',
    color: colors.textInverse,
  },

  // ── Lock Card ──
  lockCard: {
    margin: layout.screenPaddingHorizontal,
    marginTop: 24,
    backgroundColor: colors.sectionBackground,
    borderWidth: 1.5,
    borderColor: colors.primaryMuted,
    borderRadius: borderRadius.xl,
    padding: 28,
    alignItems: 'center',
    gap: 14,
    ...shadows.cardFloat,
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
