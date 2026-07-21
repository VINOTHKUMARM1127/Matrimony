/**
 * Wedring Matrimony — UserProfileScreen Component (Premium Redesign)
 * Detailed profile view with collapsible sections, premium gated content,
 * compatibility progress bars, and professional footer actions.
 */
import React, { useMemo, useState } from 'react';
import {
  View,
  Text,
  StyleSheet,
  ScrollView,
  TouchableOpacity,
  Alert,
  RefreshControl,
  Linking,
  ActivityIndicator,
} from 'react-native';
import { useSafeAreaInsets } from 'react-native-safe-area-context';
import { useQuery, useMutation, useQueryClient } from '@tanstack/react-query';
import * as Clipboard from 'expo-clipboard';
import Animated, { useAnimatedStyle, withTiming, useSharedValue } from 'react-native-reanimated';
import { Ionicons } from '@expo/vector-icons';
import { colors } from '../../theme';
import { borderRadius, layout } from '../../theme/spacing';
import shadows from '../../theme/shadows';
import PhotoGallery from '../../components/profile/PhotoGallery';
import ProfileHeader from '../../components/profile/ProfileHeader';
import { ProfileDetailSkeleton } from '../../components/common/SkeletonLoader';
import SuccessOverlay from '../../components/common/SuccessOverlay';
import { useRoute, useNavigation, useFocusEffect } from '@react-navigation/native';
import useAuthStore from '../../store/useAuthStore';
import useProfileStore from '../../store/useProfileStore';
import useToastStore from '../../store/useToastStore';
import usePremium from '../../hooks/usePremium';
import * as profilesApi from '../../api/profiles';
import * as interestApi from '../../api/interests';
import { createChat } from '../../api/chat';
import { calculateCompatibility } from '../../utils/matchingEngine';
import supabase from '../../api/supabaseClient';
import { INCOME_RANGES, FAMILY_TYPES, FAMILY_STATUS, FAMILY_VALUES, FOOD_HABITS, DOSHAM_OPTIONS, NAKSHATRA_TAMIL, RASI_TAMIL, DOSHAM_TAMIL } from '../../utils/constants';

const getLabel = (options, value) => {
  if (!value) return 'N/A';
  const opt = options.find((o) => o.value === value);
  return opt ? opt.label : String(value).replace(/_/g, ' ');
};
const CollapsibleSection = ({ title, children, defaultExpanded = false }) => {
  const [expanded, setExpanded] = useState(defaultExpanded);
  const heightValue = useSharedValue(defaultExpanded ? 1 : 0);

  const toggle = () => {
    setExpanded(!expanded);
    heightValue.value = withTiming(expanded ? 0 : 1, { duration: 300 });
  };

  const animatedStyle = useAnimatedStyle(() => ({
    opacity: heightValue.value,
  }));

  return (
    <View style={styles.collapsibleCard}>
      <TouchableOpacity style={styles.collapsibleHeader} onPress={toggle} activeOpacity={0.7}>
        <Text style={styles.collapsibleTitle}>{title}</Text>
        <Text style={[styles.collapsibleIcon, expanded && styles.collapsibleIconRotated]}>
          ›
        </Text>
      </TouchableOpacity>
      {expanded && (
        <Animated.View style={[styles.collapsibleContent, animatedStyle]}>
          <View style={styles.divider} />
          {children}
        </Animated.View>
      )}
    </View>
  );
};

const UserProfileScreen = ({ route, navigation }) => {
  const { profileId } = route.params;
  const queryClient = useQueryClient();
  const insets = useSafeAreaInsets();

  const currentUser = useAuthStore((s) => s.user);
  const myProfile = useProfileStore((s) => s.profile);
  const myPhotos = useProfileStore((s) => s.photos);
  const [revealingPhone, setRevealingPhone] = useState(false);
  const [showInterestSent, setShowInterestSent] = useState(false);
  const [showContactUnlocked, setShowContactUnlocked] = useState(false);
  const showToast = useToastStore((state) => state.showToast);

  // Success Overlay for Contact Unlock
  const [showContactSuccess, setShowContactSuccess] = useState(false);

  // 1. Fetch details of target user
  const { data: targetProfile, isLoading, error, refetch: refetchProfile } = useQuery({
    queryKey: ['profile', profileId],
    queryFn: () => profilesApi.getProfile(profileId),
    enabled: !!profileId,
  });

  // 2. Fetch interest status
  const { data: interestStatus, refetch: refetchInterest } = useQuery({
    queryKey: ['interestStatus', currentUser?.id, profileId],
    queryFn: async () => {
      const { data, error } = await supabase
        .from('interests')
        .select('*')
        .or(`and(sender_id.eq.${currentUser?.id},receiver_id.eq.${profileId}),and(sender_id.eq.${profileId},receiver_id.eq.${currentUser?.id})`)
        .maybeSingle();

      if (error) throw error;
      return data;
    },
    enabled: !!currentUser?.id && !!profileId,
  });

  // Fetch Tier and Quotas from dashboard summary (single source of truth)
  const { data: summary, refresh: refetchSummary, isPremium: isPremiumTier } = usePremium();

  // Check if already viewed this target's phone
  const { data: hasViewedPhone = false, refetch: refetchHasViewed } = useQuery({
    queryKey: ['hasViewedPhone', currentUser?.id, profileId],
    queryFn: async () => {
      const { data } = await supabase
        .from('contact_credit_transactions')
        .select('id')
        .eq('user_id', currentUser.id)
        .eq('viewed_user_id', profileId)
        .eq('type', 'phone')
        .maybeSingle();

      return !!data;
    },
    enabled: !!currentUser?.id && !!profileId,
  });

  // Fetch target user's real phone number if contact is unlocked
  const { data: targetPhone } = useQuery({
    queryKey: ['targetPhone', profileId],
    queryFn: async () => {
      const { data } = await supabase
        .from('profile_contact')
        .select('mobile_number')
        .eq('user_id', profileId)
        .maybeSingle();
      return data?.mobile_number || 'Not Provided';
    },
    enabled: !!profileId && hasViewedPhone,
  });

  // Calculate compatibility score client side
  const compatibilityResult = useMemo(() => {
    if (!myProfile || !targetProfile) return null;
    return calculateCompatibility(
      myProfile,
      myProfile.partner_preferences || null,
      targetProfile,
      myProfile.user_horoscope || null,
      targetProfile.user_horoscope || null
    );
  }, [myProfile, targetProfile]);

  const compatibilityScore = compatibilityResult?.totalScore || 0;
  const compatibilityBreakdown = compatibilityResult?.breakdown || {};

  // Privacy Locks / Gates
  const isHoroscopeUnlocked = isPremiumTier || (interestStatus && interestStatus.sender_id === profileId);

  // Contact unlock is gated on WALLET CREDITS, not tier
  const contactsRemaining = summary?.contact_credits_remaining ?? 0;
  const hasRemainingViews = contactsRemaining === -1 || contactsRemaining > 0;
  const isMobileUnlocked = hasRemainingViews;

  // Interest sending is likewise gated on wallet credits
  const interestsRemaining = summary?.interest_credits_remaining ?? 0;
  const hasInterestsLeft = interestsRemaining === -1 || interestsRemaining > 0;



  const handleRevealMobileNumber = async () => {
    if (hasViewedPhone) return;

    if (!hasRemainingViews) {
      Alert.alert(
        'No Contact Credits',
        'You have used all your contact credits. Please purchase a top-up or renew your plan to view more numbers.',
        [
          { text: 'Cancel', style: 'cancel' },
          { text: 'Get Credits', onPress: () => navigation.navigate('Premium') },
        ]
      );
      return;
    }

    try {
      setRevealingPhone(true);
      const { error: rpcError } = await supabase.rpc('fn_view_contact_credit', {
        p_viewed_user_id: profileId,
        p_type: 'phone'
      });
      
      if (rpcError) throw rpcError;

      refetchHasViewed();
      refetchSummary();
      setRevealingPhone(false);
      setShowContactUnlocked(true);
      setShowContactSuccess(true);
    } catch (err) {
      setRevealingPhone(false);
      if (err.message?.includes('QUOTA') || err.message?.includes('credits')) {
        Alert.alert('Limit Exceeded', 'You do not have enough contact views remaining. Please recharge.');
      } else {
        Alert.alert('Error', err.message || 'Failed to unlock contact details.');
      }
    }
  };

  // Send Interest Mutation with optimistic quota update
  const sendInterestMutation = useMutation({
    mutationFn: async () => {
      const { error } = await supabase.rpc('fn_send_interest', {
        p_receiver_id: profileId
      });
      if (error) throw error;
    },
    onMutate: async () => {
      await queryClient.cancelQueries({ queryKey: ['user_dashboard_summary', currentUser.id] });
      const previousSummary = queryClient.getQueryData(['user_dashboard_summary', currentUser.id]);
      if (previousSummary && previousSummary.interest_credits_remaining > 0) {
        queryClient.setQueryData(['user_dashboard_summary', currentUser.id], {
          ...previousSummary,
          interest_credits_remaining: previousSummary.interest_credits_remaining - 1,
        });
      }
      
      // Optimistically update Matches lists so it's instantly reflected if we go back
      const markPage = (old) => {
        if (!old || !old.pages) return old;
        return {
          ...old,
          pages: old.pages.map(page => page.map(p => p.id === profileId ? { ...p, interestSent: true } : p))
        };
      };
      queryClient.setQueryData(['allMatches', currentUser.id], markPage);
      queryClient.setQueryData(['dailyUpdates', currentUser.id], markPage);
      
      // Optimistically add to interestsSent
      queryClient.setQueryData(['interestsSent', currentUser.id], (old) => {
        const newItem = {
          id: `temp-${Date.now()}`,
          sender_id: currentUser.id,
          receiver_id: profileId,
          status: 'sent',
          created_at: new Date().toISOString(),
          receiver: targetProfile,
        };
        return [newItem, ...(old || [])];
      });

      return { previousSummary };
    },
    onSuccess: () => {
      refetchInterest();
      queryClient.invalidateQueries({ queryKey: ['user_dashboard_summary', currentUser.id] });
      queryClient.invalidateQueries({ queryKey: ['userInteractions', currentUser.id] });
      queryClient.invalidateQueries({ queryKey: ['interestsSent', currentUser.id] });
      queryClient.invalidateQueries({ queryKey: ['interestsReceived', currentUser.id] });
      setShowInterestSent(true);
    },
    onError: (err, _vars, context) => {
      if (context?.previousSummary) {
        queryClient.setQueryData(['user_dashboard_summary', currentUser.id], context.previousSummary);
      }
      if (err.message?.includes('QUOTA_EXCEEDED')) {
        Alert.alert(
          'Limit Exceeded',
          'You have exhausted your interest credits. Please purchase a top-up or renew your plan to send more interests.',
          [
            { text: 'Cancel', style: 'cancel' },
            { text: 'Get Credits', onPress: () => navigation.navigate('Premium') },
          ]
        );
      } else {
        showToast('error', 'Error', err.message || 'Failed to send interest request');
      }
    },
  });

  const [chattingLoading, setChattingLoading] = useState(false);

  const handleChatPress = async () => {
    if (!currentUser?.id || !targetProfile?.id) return;
    try {
      setChattingLoading(true);
      const chat = await createChat(currentUser.id, targetProfile.id);
      
      const primaryPhoto = targetProfile.profile_photos?.find((p) => p.is_primary) || targetProfile.profile_photos?.[0];
      
      navigation.navigate('Chat', {
        chatId: chat.id,
        otherUser: {
          id: targetProfile.id,
          full_name: targetProfile.full_name,
          city: targetProfile.city,
          photos: primaryPhoto ? [primaryPhoto] : [],
        },
      });
    } catch (err) {
      console.warn('Failed to open chat:', err);
    } finally {
      setChattingLoading(false);
    }
  };
  const handleSendInterest = async () => {
    if (!hasInterestsLeft) {
      Alert.alert(
        'Limit Exceeded',
        `You have used all your allowed interests. Please recharge to reset your quotas.`,
        [
          { text: 'Cancel', style: 'cancel' },
          { text: 'Upgrades', onPress: () => navigation.navigate('Premium') },
        ]
      );
      return;
    }

    // Verify the user has at least one photo. Check the live store slices first
    // (profile.photos OR the dedicated photos slice that newly-added photos go
    // into), then fall back to an authoritative COUNT on the photos table so a
    // stale store never blocks a user who genuinely has photos.
    let hasPhoto = (myProfile?.photos?.length || 0) > 0 || (myPhotos?.length || 0) > 0;
    if (!hasPhoto && currentUser?.id) {
      const { count } = await supabase
        .from('profile_photos')
        .select('id', { count: 'exact', head: true })
        .eq('user_id', currentUser.id);
      hasPhoto = (count || 0) > 0;
    }

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
    sendInterestMutation.mutate();
  };

  const acceptInterestMutation = useMutation({
    mutationFn: (interestId) => interestApi.acceptInterest(interestId),
    onSuccess: () => {
      refetchInterest();
      showToast('success', 'Success', 'Interest request accepted! You are now connected.');
    },
  });

  const declineInterestMutation = useMutation({
    mutationFn: (interestId) => interestApi.declineInterest(interestId),
    onSuccess: () => {
      refetchInterest();
      showToast('success', 'Success', 'Interest request declined.');
    },
  });

  const handleReportPress = () => {
    Alert.alert(
      'Report User',
      'Are you sure you want to report this profile for review?',
      [
        { text: 'Cancel', style: 'cancel' },
        { 
          text: 'Report', 
          style: 'destructive',
          onPress: async () => {
            showToast('info', 'Report Received', 'Thank you. Our team will review this profile within 24 hours.');
          }
        }
      ]
    );
  };

  if (isLoading) {
    return (
      <View style={styles.loadingContainer}>
        <ProfileDetailSkeleton />
      </View>
    );
  }

  if (error || !targetProfile) {
    return (
      <View style={styles.errorContainer}>
        <Text style={styles.errorText}>Failed to load profile details</Text>
        {error && <Text style={{color: 'red', marginTop: 10}}>{error.message || JSON.stringify(error)}</Text>}
        <TouchableOpacity style={styles.backButton} onPress={() => navigation.goBack()}>
          <Text style={styles.backButtonText}>Go Back</Text>
        </TouchableOpacity>
      </View>
    );
  }

  const renderProgressBar = (label, value, max) => {
    const percentage = Math.min((value / max) * 100, 100);
    return (
      <View style={styles.progressRow}>
        <View style={styles.progressLabelRow}>
          <Text style={styles.progressLabel}>{label}</Text>
          <Text style={styles.progressValue}>{value}/{max}</Text>
        </View>
        <View style={styles.progressTrack}>
          <View style={[styles.progressFill, { width: `${percentage}%` }]} />
        </View>
      </View>
    );
  };

  return (
    <View style={styles.container}>
      {/* Floating Back Button */}
      <TouchableOpacity 
        style={[styles.absoluteBackButton, { top: insets.top + 12 }]} 
        onPress={() => navigation.goBack()}
        hitSlop={{ top: 15, bottom: 15, left: 15, right: 15 }}
      >
        <View style={styles.backButtonCircle}>
          <Ionicons name="arrow-back" size={24} color={colors.textPrimary} />
        </View>
      </TouchableOpacity>

      <ScrollView 
        showsVerticalScrollIndicator={false} 
        contentContainerStyle={styles.scroll}
        refreshControl={
          <RefreshControl 
            refreshing={false} 
            onRefresh={() => {
              refetchProfile();
              refetchInterest();
              refetchSummary();
              refetchHasViewed();
            }}
            tintColor={colors.primary}
            colors={[colors.primary]}
          />
        }
      >
        {/* Photo Gallery */}
        <View style={styles.photoContainer}>
          <PhotoGallery 
            photos={targetProfile.profile_photos || []} 
            isPremiumUser={isPremiumTier} 
            onPhotoPress={(p) => {}}
          />
          {compatibilityScore > 0 && (
            <View style={styles.matchBadgeOverlay}>
              <Text style={styles.matchBadgeText}>{compatibilityScore}% Match</Text>
            </View>
          )}
        </View>

        {/* Profile Header */}
        <ProfileHeader profile={targetProfile} />

        {/* Contact Number View */}
        <View style={styles.section}>
          <View style={styles.contactCard}>
            <Text style={styles.contactTitle}>Contact Number</Text>
            {hasViewedPhone ? (
              <TouchableOpacity 
                style={styles.revealedRow}
                onPress={async () => {
                  if (targetPhone && targetPhone !== 'Loading...') {
                    await Clipboard.setStringAsync(targetPhone);
                    showToast('success', 'Copied!', 'Number copied to clipboard');
                    Linking.openURL(`tel:${targetPhone.replace(/\\s+/g, '')}`);
                  }
                }}
              >
                <Text style={styles.phoneValue}>{targetPhone || 'Loading...'}</Text>
                <Ionicons name="call" size={16} color={colors.primary} style={{ marginLeft: 8 }} />
              </TouchableOpacity>
            ) : (
              <View style={styles.maskedRow}>
                <Text style={styles.maskedText}>+91 9840* *****</Text>
                <TouchableOpacity
                  style={styles.revealButton}
                  onPress={isPremiumTier ? handleRevealMobileNumber : () => navigation.navigate('Premium')}
                  disabled={revealingPhone}
                >
                  <Ionicons name="lock-closed" size={14} color={colors.textInverse} style={{ marginRight: 4 }} />
                  <Text style={styles.revealBtnText}>
                    {revealingPhone ? 'Unlocking...' : isPremiumTier ? 'View Mobile Number' : 'Unlock Contact Number'}
                  </Text>
                </TouchableOpacity>
              </View>
            )}
            {!hasViewedPhone && isPremiumTier && isMobileUnlocked && (
              <Text style={styles.limitDisclaimer}>
                Remaining views: {contactsRemaining === -1 ? 'Unlimited' : contactsRemaining}
              </Text>
            )}
          </View>
        </View>

        {/* Details Sections */}
        <View style={styles.sectionList}>
          <CollapsibleSection title="About Me" defaultExpanded={true}>
            <Text style={styles.aboutText}>
              {targetProfile.about_me || 'No description provided.'}
            </Text>
          </CollapsibleSection>

          <CollapsibleSection title="Education & Career" defaultExpanded={true}>
            <View style={styles.infoRow}>
              <Text style={styles.infoLabel}>Highest Education</Text>
              <Text style={styles.infoValue}>{targetProfile.education || 'N/A'}</Text>
            </View>
            <View style={styles.infoRow}>
              <Text style={styles.infoLabel}>Occupation</Text>
              <Text style={styles.infoValue}>{targetProfile.occupation || 'N/A'}</Text>
            </View>
            <View style={styles.infoRow}>
              <Text style={styles.infoLabel}>Annual Income</Text>
              <Text style={styles.infoValue}>{getLabel(INCOME_RANGES, targetProfile.annual_income)}</Text>
            </View>
          </CollapsibleSection>

          <CollapsibleSection title="Family Background" defaultExpanded={true}>
            {isPremiumTier ? (
              <>
                <View style={styles.infoRow}>
                  <Text style={styles.infoLabel}>Family Type</Text>
                  <Text style={styles.infoValue}>{getLabel(FAMILY_TYPES, targetProfile.user_family?.family_type)}</Text>
                </View>
                <View style={styles.infoRow}>
                  <Text style={styles.infoLabel}>Family Status</Text>
                  <Text style={styles.infoValue}>{getLabel(FAMILY_STATUS, targetProfile.user_family?.family_status)}</Text>
                </View>
                <View style={styles.infoRow}>
                  <Text style={styles.infoLabel}>Family Values</Text>
                  <Text style={styles.infoValue}>{getLabel(FAMILY_VALUES, targetProfile.user_family?.family_values)}</Text>
                </View>
                <View style={styles.infoRow}>
                  <Text style={styles.infoLabel}>Brothers / Sisters</Text>
                  <Text style={styles.infoValue}>
                    {targetProfile.user_family?.brothers_count || 0} / {targetProfile.user_family?.sisters_count || 0}
                  </Text>
                </View>
                <View style={styles.infoRow}>
                  <Text style={styles.infoLabel}>Father's Occupation</Text>
                  <Text style={styles.infoValue}>{targetProfile.user_family?.father_occupation || 'N/A'}</Text>
                </View>
                <View style={styles.infoRow}>
                  <Text style={styles.infoLabel}>Mother's Occupation</Text>
                  <Text style={styles.infoValue}>{targetProfile.user_family?.mother_occupation || 'N/A'}</Text>
                </View>
              </>
            ) : (
              <View style={styles.lockHoroCard}>
                <Text style={styles.lockHoroTitle}>Family Details Locked</Text>
                <Text style={styles.lockHoroDesc}>
                  Upgrade to Premium to view complete profile details.
                </Text>
                <TouchableOpacity style={styles.unlockHoroBtn} onPress={() => navigation.navigate('Premium')}>
                  <Text style={styles.unlockHoroBtnText}>Upgrade Now</Text>
                </TouchableOpacity>
              </View>
            )}
          </CollapsibleSection>

          <CollapsibleSection title="Lifestyle" defaultExpanded={true}>
            {isPremiumTier ? (
              <>
                <View style={styles.infoRow}>
                  <Text style={styles.infoLabel}>Dietary Habit</Text>
                  <Text style={styles.infoValue}>{getLabel(FOOD_HABITS, targetProfile.user_lifestyle?.food_habit)}</Text>
                </View>
                <View style={styles.infoRow}>
                  <Text style={styles.infoLabel}>Languages Known</Text>
                  <Text style={styles.infoValue}>
                    {targetProfile.user_lifestyle?.languages_known?.length ? targetProfile.user_lifestyle.languages_known.join(', ') : 'N/A'}
                  </Text>
                </View>
                <View style={styles.infoRow}>
                  <Text style={styles.infoLabel}>Interests & Hobbies</Text>
                  <Text style={styles.infoValue}>
                    {targetProfile.user_lifestyle?.interests?.length ? targetProfile.user_lifestyle.interests.join(', ') : 'N/A'}
                  </Text>
                </View>
              </>
            ) : (
              <View style={styles.lockHoroCard}>
                <Text style={styles.lockHoroTitle}>Lifestyle Locked</Text>
                <Text style={styles.lockHoroDesc}>
                  Upgrade to Premium to view complete profile details.
                </Text>
                <TouchableOpacity style={styles.unlockHoroBtn} onPress={() => navigation.navigate('Premium')}>
                  <Text style={styles.unlockHoroBtnText}>Upgrade Now</Text>
                </TouchableOpacity>
              </View>
            )}
          </CollapsibleSection>

          <CollapsibleSection title="Horoscope" defaultExpanded={true}>
            <View style={styles.infoRow}>
              <Text style={styles.infoLabel}>Nakshatra (Star)</Text>
              <Text style={styles.infoValue}>{targetProfile.user_horoscope?.nakshatra_text ? (NAKSHATRA_TAMIL[targetProfile.user_horoscope.nakshatra_text] || targetProfile.user_horoscope.nakshatra_text) : 'N/A'}</Text>
            </View>
            <View style={styles.infoRow}>
              <Text style={styles.infoLabel}>Raasi (Moon Sign)</Text>
              <Text style={styles.infoValue}>{targetProfile.user_horoscope?.rasi_text ? (RASI_TAMIL[targetProfile.user_horoscope.rasi_text] || targetProfile.user_horoscope.rasi_text) : 'N/A'}</Text>
            </View>
            <View style={styles.infoRow}>
              <Text style={styles.infoLabel}>Lagnam</Text>
              <Text style={styles.infoValue}>{targetProfile.user_horoscope?.lagnam_text || 'N/A'}</Text>
            </View>
            <View style={styles.infoRow}>
              <Text style={styles.infoLabel}>Gothram</Text>
              <Text style={styles.infoValue}>{targetProfile.user_horoscope?.gothram_text || 'N/A'}</Text>
            </View>
            <View style={styles.infoRow}>
              <Text style={styles.infoLabel}>Dosham</Text>
              <Text style={styles.infoValue}>{targetProfile.user_horoscope?.dosham ? (DOSHAM_TAMIL[targetProfile.user_horoscope.dosham] || getLabel(DOSHAM_OPTIONS, targetProfile.user_horoscope.dosham)) : 'N/A'}</Text>
            </View>
          </CollapsibleSection>
        </View>

        <TouchableOpacity style={styles.reportButton} onPress={handleReportPress}>
          <Text style={styles.reportText}>Report or Block Profile</Text>
        </TouchableOpacity>
      </ScrollView>

      {/* Footer Action Bar */}
      <View style={styles.footer}>
        {interestStatus ? (
          interestStatus.status === 'sent' ? (
            interestStatus.sender_id === currentUser.id ? (
              <View style={styles.footerRow}>
                <TouchableOpacity style={styles.pendingBtn} disabled>
                  <Ionicons name="checkmark-circle" size={17} color={colors.textSecondary} />
                  <Text style={styles.pendingBtnText}>Interest Sent</Text>
                </TouchableOpacity>
              </View>
            ) : (
              <View style={styles.footerRow}>
                <TouchableOpacity 
                  style={styles.declineBtn} 
                  onPress={() => declineInterestMutation.mutate(interestStatus.id)}
                  disabled={declineInterestMutation.isPending || acceptInterestMutation.isPending}
                >
                  {declineInterestMutation.isPending ? (
                    <ActivityIndicator size="small" color={colors.textPrimary} />
                  ) : (
                    <Text style={styles.declineBtnText}>Decline</Text>
                  )}
                </TouchableOpacity>
                <TouchableOpacity
                  style={styles.acceptBtn}
                  onPress={() => acceptInterestMutation.mutate(interestStatus.id)}
                  disabled={acceptInterestMutation.isPending || declineInterestMutation.isPending}
                >
                  {acceptInterestMutation.isPending ? (
                    <ActivityIndicator size="small" color={colors.textInverse} />
                  ) : (
                    <>
                      <Ionicons name="checkmark-circle" size={17} color={colors.textInverse} />
                      <Text style={styles.acceptBtnText}>Accept Request</Text>
                    </>
                  )}
                </TouchableOpacity>
              </View>
            )
          ) : interestStatus.status === 'accepted' ? (
            <View style={styles.footerRow}>
              <TouchableOpacity 
                style={[styles.connectBtn, { backgroundColor: colors.chatBubbleSent }]} 
                onPress={handleChatPress}
                disabled={chattingLoading}
              >
                {chattingLoading ? (
                  <ActivityIndicator size="small" color={colors.textPrimary} />
                ) : (
                  <>
                    <Ionicons name="chatbubble-ellipses" size={17} color={colors.textPrimary} />
                    <Text style={[styles.connectBtnText, { color: colors.textPrimary }]}>Chat</Text>
                  </>
                )}
              </TouchableOpacity>
            </View>
          ) : (
            <View style={styles.footerRow}>
              <TouchableOpacity style={styles.declinedBtn} disabled>
                <Text style={styles.declinedBtnText}>Interest Declined</Text>
              </TouchableOpacity>
            </View>
          )
        ) : (
          <View style={styles.footerRow}>
            <TouchableOpacity
              style={styles.sendInterestBtn}
              onPress={handleSendInterest}
              disabled={sendInterestMutation.isPending}
            >
              {sendInterestMutation.isPending ? (
                <>
                  <ActivityIndicator size="small" color={colors.textInverse} style={{ marginRight: 8 }} />
                  <Text style={styles.sendInterestBtnText}>Sending...</Text>
                </>
              ) : (
                <>
                  <Ionicons name="heart" size={17} color={colors.textInverse} />
                  <Text style={styles.sendInterestBtnText}>Send Interest</Text>
                </>
              )}
            </TouchableOpacity>
          </View>
        )}
      </View>

      <SuccessOverlay
        visible={showInterestSent}
        icon="heart"
        tint={colors.primary}
        title="Interest Sent!"
        subtitle="We'll notify you when they respond"
        onDone={() => setShowInterestSent(false)}
      />

      <SuccessOverlay
        visible={showContactSuccess}
        icon="phone"
        tint={colors.primary}
        title="Contact Unlocked!"
        subtitle="1 Credit Deducted"
        onDone={() => setShowContactSuccess(false)}
      />
    </View>
  );
};

const styles = StyleSheet.create({
  container: {
    flex: 1,
    backgroundColor: colors.surface,
  },
  absoluteBackButton: {
    position: 'absolute',
    left: 16,
    zIndex: 100,
  },
  backButtonCircle: {
    width: 40,
    height: 40,
    borderRadius: 20,
    backgroundColor: 'rgba(255, 255, 255, 0.9)',
    justifyContent: 'center',
    alignItems: 'center',
    ...shadows.cardSoft,
  },
  scroll: {
    paddingBottom: 100,
  },
  loadingContainer: {
    flex: 1,
    backgroundColor: colors.background,
  },
  errorContainer: {
    flex: 1,
    justifyContent: 'center',
    alignItems: 'center',
    padding: 24,
    backgroundColor: colors.background,
  },
  errorText: {
    fontSize: 16,
    color: colors.error,
    marginBottom: 16,
    fontWeight: '600',
  },
  backButton: {
    paddingHorizontal: 20,
    paddingVertical: 10,
    backgroundColor: colors.primary,
    borderRadius: borderRadius.md,
  },
  backButtonText: {
    color: colors.textInverse,
    fontWeight: '600',
  },
  photoContainer: {
    position: 'relative',
    width: '100%',
  },
  matchBadgeOverlay: {
    position: 'absolute',
    top: 16,
    right: 16,
    backgroundColor: 'rgba(255, 115, 0, 0.95)',
    paddingHorizontal: 12,
    paddingVertical: 6,
    borderRadius: 20,
    borderWidth: 1.5,
    borderColor: '#FFFFFF',
    shadowColor: '#000',
    shadowOffset: { width: 0, height: 2 },
    shadowOpacity: 0.3,
    shadowRadius: 3,
    elevation: 5,
  },
  matchBadgeText: {
    color: '#FFFFFF',
    fontWeight: '800',
    fontSize: 14,
    letterSpacing: 0.5,
  },

  section: {
    marginTop: 16,
    paddingHorizontal: layout.screenPaddingHorizontal,
  },
  sectionList: {
    marginTop: 16,
    paddingHorizontal: layout.screenPaddingHorizontal,
    gap: 12,
  },

  // ── Collapsible Card ──
  collapsibleCard: {
    backgroundColor: colors.cardBackground,
    borderRadius: borderRadius.xl,
    overflow: 'hidden',
    borderWidth: 1,
    borderColor: colors.borderLight,
    ...shadows.cardSoft,
  },
  collapsibleHeader: {
    flexDirection: 'row',
    justifyContent: 'space-between',
    alignItems: 'center',
    padding: 16,
    backgroundColor: colors.cardBackground,
  },
  collapsibleTitle: {
    fontSize: 15,
    fontWeight: '700',
    color: colors.textPrimary,
  },
  collapsibleIcon: {
    fontSize: 24,
    color: colors.textMuted,
    lineHeight: 24,
    transform: [{ rotate: '90deg' }],
  },
  collapsibleIconRotated: {
    transform: [{ rotate: '-90deg' }],
  },
  collapsibleContent: {
    paddingHorizontal: 16,
    paddingBottom: 16,
  },
  divider: {
    height: 1,
    backgroundColor: colors.borderLight,
    marginBottom: 16,
  },

  // ── Info Row ──
  infoRow: {
    flexDirection: 'row',
    justifyContent: 'space-between',
    marginBottom: 12,
  },
  infoLabel: {
    fontSize: 13,
    color: colors.textSecondary,
    fontWeight: '500',
  },
  infoValue: {
    fontSize: 13,
    color: colors.textPrimary,
    fontWeight: '600',
    flex: 1,
    textAlign: 'right',
  },
  aboutText: {
    fontSize: 14,
    lineHeight: 22,
    color: colors.textSecondary,
  },

  // ── Compat Matrix ──
  compatCardContainer: {
    backgroundColor: colors.cardBackground,
    borderRadius: borderRadius.xl,
    padding: 16,
    borderWidth: 1,
    borderColor: colors.borderLight,
    ...shadows.cardSoft,
  },
  compatCardHeader: {
    flexDirection: 'row',
    alignItems: 'center',
    gap: 12,
    marginBottom: 16,
  },
  compatRing: {
    width: 48,
    height: 48,
    borderRadius: 24,
    borderWidth: 3,
    borderColor: colors.primary,
    alignItems: 'center',
    justifyContent: 'center',
  },
  compatRingValue: {
    fontSize: 14,
    fontWeight: '700',
    color: colors.primary,
  },
  compatHeaderTexts: {
    flex: 1,
  },
  compatTitle: {
    fontSize: 16,
    fontWeight: '700',
    color: colors.textPrimary,
  },
  compatSubtitle: {
    fontSize: 12,
    color: colors.textSecondary,
  },
  breakdownList: {
    gap: 12,
  },
  progressRow: {
    gap: 4,
  },
  progressLabelRow: {
    flexDirection: 'row',
    justifyContent: 'space-between',
  },
  progressLabel: {
    fontSize: 12,
    color: colors.textSecondary,
    fontWeight: '500',
  },
  progressValue: {
    fontSize: 12,
    color: colors.textPrimary,
    fontWeight: '600',
  },
  progressTrack: {
    height: 4,
    backgroundColor: colors.borderLight,
    borderRadius: 2,
    overflow: 'hidden',
  },
  progressFill: {
    height: '100%',
    backgroundColor: colors.primary,
    borderRadius: 2,
  },

  lockedMatrixContainer: {
    gap: 8,
  },
  lockedRow: {
    flexDirection: 'row',
    alignItems: 'center',
    paddingVertical: 4,
    gap: 6,
  },
  lockedRowText: {
    fontSize: 13,
    color: colors.textMuted,
    fontWeight: '500',
  },
  lockTeaserBanner: {
    backgroundColor: colors.primarySurface,
    borderRadius: borderRadius.md,
    padding: 14,
    marginTop: 8,
    alignItems: 'center',
    gap: 10,
  },
  lockTeaserText: {
    fontSize: 12,
    color: colors.primaryDark,
    textAlign: 'center',
    lineHeight: 18,
    fontWeight: '500',
  },
  unlockMatrixBtn: {
    backgroundColor: colors.primary,
    borderRadius: borderRadius.sm,
    paddingVertical: 8,
    paddingHorizontal: 16,
  },
  unlockMatrixBtnText: {
    color: colors.textInverse,
    fontSize: 12,
    fontWeight: '600',
  },

  // ── Contact Card ──
  contactCard: {
    backgroundColor: colors.cardBackground,
    borderRadius: borderRadius.xl,
    padding: 16,
    borderWidth: 1,
    borderColor: colors.borderLight,
    ...shadows.cardSoft,
  },
  contactTitle: {
    fontSize: 15,
    fontWeight: '700',
    color: colors.textPrimary,
    marginBottom: 12,
  },
  revealedRow: {
    paddingVertical: 4,
    flexDirection: 'row',
    alignItems: 'center',
    justifyContent: 'flex-start',
  },
  phoneValue: {
    fontSize: 18,
    fontWeight: '700',
    color: colors.textPrimary,
    letterSpacing: 1,
  },
  maskedRow: {
    flexDirection: 'row',
    justifyContent: 'space-between',
    alignItems: 'center',
  },
  maskedText: {
    fontSize: 16,
    fontWeight: '700',
    color: colors.textMuted,
    letterSpacing: 2,
  },
  revealButton: {
    flexDirection: 'row',
    alignItems: 'center',
    backgroundColor: colors.primary,
    paddingHorizontal: 16,
    paddingVertical: 10,
    borderRadius: borderRadius.md,
    ...shadows.buttonSmall,
  },
  revealBtnText: {
    color: colors.textInverse,
    fontSize: 12,
    fontWeight: '600',
  },
  limitDisclaimer: {
    fontSize: 11,
    color: colors.textMuted,
    marginTop: 8,
  },

  // ── Lock Horo ──
  lockHoroCard: {
    backgroundColor: colors.goldSurface,
    borderRadius: borderRadius.md,
    padding: 16,
    alignItems: 'center',
    gap: 8,
  },
  lockHoroTitle: {
    fontSize: 14,
    fontWeight: '700',
    color: colors.goldDark,
  },
  lockHoroDesc: {
    fontSize: 12,
    color: colors.textSecondary,
    textAlign: 'center',
  },
  unlockHoroBtn: {
    marginTop: 4,
    backgroundColor: colors.gold,
    paddingHorizontal: 16,
    paddingVertical: 8,
    borderRadius: borderRadius.sm,
  },
  unlockHoroBtnText: {
    fontSize: 12,
    fontWeight: '600',
    color: colors.textPrimary,
  },

  reportButton: {
    alignSelf: 'center',
    marginTop: 32,
    marginBottom: 16,
    padding: 10,
  },
  reportText: {
    fontSize: 13,
    color: colors.textMuted,
    fontWeight: '500',
    textDecorationLine: 'underline',
  },

  // ── Footer Action Bar ──
  footer: {
    position: 'absolute',
    bottom: 0,
    left: 0,
    right: 0,
    backgroundColor: colors.cardBackground,
    paddingHorizontal: layout.screenPaddingHorizontal,
    paddingTop: 12,
    paddingBottom: 22,
    borderTopWidth: 1,
    borderTopColor: colors.borderLight,
    ...shadows.bottomNav,
  },
  footerRow: {
    flexDirection: 'row',
    gap: 12,
  },

  sendInterestBtn: {
    flex: 1,
    flexDirection: 'row',
    gap: 7,
    paddingVertical: 15,
    borderRadius: borderRadius.full,
    backgroundColor: colors.primary,
    alignItems: 'center',
    justifyContent: 'center',
    ...shadows.buttonFloat,
  },
  sendInterestBtnText: {
    fontSize: 15,
    fontWeight: '700',
    color: colors.textInverse,
    letterSpacing: 0.3,
  },
  pendingBtn: {
    flex: 1,
    flexDirection: 'row',
    gap: 7,
    paddingVertical: 15,
    borderRadius: borderRadius.full,
    backgroundColor: colors.surfacePressed,
    borderWidth: 1,
    borderColor: colors.borderLight,
    alignItems: 'center',
    justifyContent: 'center',
  },
  pendingBtnText: {
    fontSize: 15,
    fontWeight: '700',
    color: colors.textSecondary,
  },
  declineBtn: {
    flex: 1,
    paddingVertical: 15,
    borderRadius: borderRadius.full,
    borderWidth: 1.5,
    borderColor: colors.interestOutline,
    alignItems: 'center',
    justifyContent: 'center',
  },
  declineBtnText: {
    fontSize: 15,
    fontWeight: '700',
    color: colors.textSecondary,
  },
  acceptBtn: {
    flex: 1.6,
    flexDirection: 'row',
    gap: 7,
    paddingVertical: 15,
    borderRadius: borderRadius.full,
    backgroundColor: colors.primary,
    alignItems: 'center',
    justifyContent: 'center',
    ...shadows.buttonFloat,
  },
  acceptBtnText: {
    fontSize: 15,
    fontWeight: '700',
    color: colors.textInverse,
    letterSpacing: 0.3,
  },
  connectBtn: {
    flex: 1,
    flexDirection: 'row',
    gap: 7,
    paddingVertical: 15,
    borderRadius: borderRadius.full,
    backgroundColor: colors.connectTeal,
    alignItems: 'center',
    justifyContent: 'center',
    ...shadows.buttonFloat,
  },
  connectBtnText: {
    fontSize: 15,
    fontWeight: '700',
    color: colors.textInverse,
    letterSpacing: 0.3,
  },
  declinedBtn: {
    flex: 1,
    paddingVertical: 15,
    borderRadius: borderRadius.full,
    backgroundColor: colors.declineSurface,
    alignItems: 'center',
    justifyContent: 'center',
  },
  declinedBtnText: {
    fontSize: 15,
    fontWeight: '700',
    color: colors.declineRed,
  },
});

export default UserProfileScreen;
