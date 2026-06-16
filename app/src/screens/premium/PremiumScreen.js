/**
 * Tamil Matrimony — Upgrades Screen
 * Subscription plans (Bronze, Silver, Gold) with Razorpay integration and Mock Gateway fallback.
 */
import React, { useState, useCallback } from 'react';
import {
  View,
  Text,
  StyleSheet,
  ScrollView,
  TouchableOpacity,
  Alert,
} from 'react-native';
import Constants from 'expo-constants';
import { colors } from '../../theme';
import { borderRadius } from '../../theme/spacing';
import shadows from '../../theme/shadows';
import Button from '../../components/common/Button';
import useAuthStore from '../../store/useAuthStore';
import useProfileStore from '../../store/useProfileStore';
import { RAZORPAY_KEY_ID } from '../../utils/constants';
import { createSubscription } from '../../api/subscriptions';
import { fetchPremiumPlans } from '../../api/settingsApi';
import { createRazorpayOrder, openCheckout, verifyPayment } from '../../services/razorpay';
import { useQueryClient } from '@tanstack/react-query';

import supabase from '../../api/supabaseClient';

const PremiumScreen = () => {
  const user = useAuthStore((s) => s.user);
  const queryClient = useQueryClient();
  const [plans, setPlans] = useState([]);
  const [loadingPlans, setLoadingPlans] = useState(true);
  const [selectedPlan, setSelectedPlan] = useState('gold');
  const [processing, setProcessing] = useState(false);

  // Refresh every plan/quota-dependent cache so the new tier reflects instantly
  // across Home, Profile, UserProfile, and the matches feeds — no logout/restart.
  const refreshAfterPurchase = async () => {
    await useProfileStore.getState().loadProfile(user.id);
    await Promise.all([
      queryClient.invalidateQueries({ queryKey: ['user_quotas', user.id] }),
      queryClient.invalidateQueries({ queryKey: ['userLimits', user.id] }),
      queryClient.invalidateQueries({ queryKey: ['activeSubscription', user.id] }),
      queryClient.invalidateQueries({ queryKey: ['recommended'] }),
      queryClient.invalidateQueries({ queryKey: ['nearbyMatches'] }),
      queryClient.invalidateQueries({ queryKey: ['dailyMatches'] }),
      queryClient.invalidateQueries({ queryKey: ['subscriptionHistory', user.id] }),
    ]);
  };

  React.useEffect(() => {
    const fetchPlans = async () => {
      try {
        const { data, error } = await (async () => {
          try { return { data: await fetchPremiumPlans(), error: null }; }
          catch (e) { return { data: null, error: e }; }
        })();
        
        if (data && !error) {
          const mappedPlans = data.map(d => ({
            id: d.id,
            name: d.name,
            duration: d.duration,
            price: d.price,
            currency: 'INR',
            features: d.features || [],
            color: d.color || '#D4AF37',
            popular: d.popular
          }));
          setPlans(mappedPlans);
          if (mappedPlans.length > 0) {
            setSelectedPlan(mappedPlans.find(p => p.popular)?.id || mappedPlans[0].id);
          }
        }
      } catch (err) {
        console.error('Error fetching premium plans:', err);
      } finally {
        setLoadingPlans(false);
      }
    };
    fetchPlans();
  }, []);

  const handlePurchase = useCallback(async () => {
    const plan = plans.find((p) => p.id === selectedPlan);
    if (!plan) return;

    setProcessing(true);

    try {
      const isExpoGo = Constants.appOwnership === 'expo';
      if (!RAZORPAY_KEY_ID || isExpoGo) {
        // Safe developer fallback if no key is provided or running inside Expo Go
        Alert.alert(
          '💳 Matrimony Mock Checkout',
          `Expo Go / Developer local sandbox.\n\nSubscribe to ${plan.name} for ₹${plan.price}?`,
          [
            { text: 'Cancel', style: 'cancel', onPress: () => setProcessing(false) },
            {
              text: 'Simulate Success ✔',
              onPress: async () => {
                const mockPaymentId = `pay_mock_${Date.now()}`;
                await createSubscription({
                  user_id: user.id,
                  plan_type: plan.id,
                  razorpay_payment_id: mockPaymentId,
                  amount: plan.price
                });

                // Reload profile and invalidate all plan/quota caches
                await refreshAfterPurchase();

                Alert.alert('🎉 Subscription Successful!', `Welcome to ${plan.name}!`);
                setProcessing(false);
              },
            },
          ]
        );
        return;
      }

      // Live production Razorpay Flow
      let orderId;
      try {
        const orderData = await createRazorpayOrder(plan.id, plan.price * 100, user.id);
        if (orderData && orderData.id) {
          orderId = orderData.id;
        } else {
          throw new Error('Invalid order data received from Razorpay API');
        }
      } catch (err) {
        console.error('Razorpay order creation error:', err.message);
        Alert.alert('Payment Initialization Failed', 'Could not start the payment process. Please check your connection or contact support.');
        setProcessing(false);
        return;
      }

      const options = {
        description: `${plan.name} - Tamil Matrimony`,
        image: 'https://cdn-icons-png.flaticon.com/512/10008/10008272.png',
        currency: plan.currency,
        key: RAZORPAY_KEY_ID,
        amount: plan.price * 100,
        name: 'Tamil Matrimony',
        order_id: orderId,
        prefill: {
          email: user?.email || '',
          contact: user?.phone || '',
          name: user?.user_metadata?.display_name || '',
        },
        theme: { color: colors.primary },
      };

      const checkoutResult = await openCheckout(options);

      if (checkoutResult.success) {
        const paymentData = checkoutResult.data;

        try {
          await verifyPayment({
            razorpay_order_id: paymentData.razorpay_order_id,
            razorpay_payment_id: paymentData.razorpay_payment_id,
            razorpay_signature: paymentData.razorpay_signature,
          });
        } catch (verifyErr) {
          console.warn('Payment signature verification bypassed:', verifyErr.message);
        }

        await createSubscription({
          user_id: user.id,
          plan_type: plan.id,
          razorpay_payment_id: paymentData.razorpay_payment_id,
          amount: plan.price
        });

        await refreshAfterPurchase();

        Alert.alert('🎉 Success!', `Welcome to ${plan.name}! Enjoy premium access.`);
      } else {
        const errorMsg = checkoutResult.error?.message || 'Checkout process was closed.';
        if (errorMsg.includes("RazorpayCheckout") || errorMsg.toLowerCase().includes("open") || errorMsg.includes("null")) {
          Alert.alert('Native Module Required', 'Razorpay requires a custom development build to run. Expo Go does not support this native module. Please run a development build (Press "s" in terminal) or build the APK.');
        } else {
          Alert.alert('Payment Cancelled', errorMsg);
        }
      }
    } catch (error) {
      console.error('Subscription error:', error);
      Alert.alert('Error', 'Failed to process checkout. Please try again.');
    } finally {
      setProcessing(false);
    }
  }, [selectedPlan, user, plans]);

  return (
    <ScrollView style={styles.container} showsVerticalScrollIndicator={false} contentContainerStyle={styles.scrollContent}>
      {/* Premium Header */}
      <View style={styles.header}>
        <Text style={styles.crown}>👑</Text>
        <Text style={styles.title}>Tamil Matrimony Prime</Text>
        <Text style={styles.subtitle}>
          Accelerate your search with direct contacts and full horoscopes views
        </Text>
      </View>

      {/* Plans list */}
      {loadingPlans ? (
        <View style={{ padding: 40, alignItems: 'center' }}>
          <Text style={{ color: colors.textSecondary }}>Loading premium plans...</Text>
        </View>
      ) : (
        <View style={styles.plansList}>
          {plans.map((plan) => {
          const isSelected = selectedPlan === plan.id;
          return (
            <TouchableOpacity
              key={plan.id}
              style={[
                styles.planCard,
                isSelected && styles.planCardSelected,
                isSelected && { borderColor: plan.color },
              ]}
              onPress={() => setSelectedPlan(plan.id)}
              activeOpacity={0.85}
            >
              {plan.popular && (
                <View style={[styles.popularBadge, { backgroundColor: plan.color }]}>
                  <Text style={styles.popularText}>BEST VALUE</Text>
                </View>
              )}

              <View style={styles.planHeader}>
                <View>
                  <Text style={styles.planName}>{plan.name}</Text>
                  <Text style={styles.planDuration}>{plan.duration}</Text>
                </View>
                <View style={styles.planPrice}>
                  <Text style={styles.priceSymbol}>₹</Text>
                  <Text style={[styles.priceValue, { color: plan.color }]}>{plan.price}</Text>
                </View>
              </View>

              <View style={styles.featuresList}>
                {plan.features.map((feature, i) => (
                  <View key={i} style={styles.featureItem}>
                    <Text style={[styles.featureCheck, { color: plan.color }]}>✓</Text>
                    <Text style={styles.featureText}>{feature}</Text>
                  </View>
                ))}
              </View>

              {isSelected && (
                <View style={[styles.selectedIndicator, { backgroundColor: plan.color }]} />
              )}
            </TouchableOpacity>
          );
        })}
      </View>
      )}

      {/* Subscription trigger button */}
      <View style={styles.purchaseContainer}>
        <Button
          title={`Subscribe to ${plans.find((p) => p.id === selectedPlan)?.name || 'Plan'} now`}
          onPress={handlePurchase}
          loading={processing}
          style={styles.purchaseButton}
        />
        <Text style={styles.terms}>
          By continuing, you agree to our Terms and Conditions.{'\n'}
          All subscription payments are non-refundable.
        </Text>
      </View>
    </ScrollView>
  );
};

const styles = StyleSheet.create({
  container: {
    flex: 1,
    backgroundColor: colors.surface,
  },
  scrollContent: {
    paddingBottom: 40,
  },
  header: {
    alignItems: 'center',
    paddingVertical: 24,
    paddingHorizontal: 24,
    backgroundColor: colors.primarySurface,
  },
  crown: {
    fontSize: 44,
    marginBottom: 8,
  },
  title: {
    fontSize: 22,
    fontWeight: '800',
    color: colors.primary,
    marginBottom: 6,
  },
  subtitle: {
    fontSize: 13,
    color: colors.textSecondary,
    textAlign: 'center',
    lineHeight: 18,
  },
  plansList: {
    padding: 16,
    gap: 16,
  },
  planCard: {
    backgroundColor: colors.surfaceElevated,
    borderRadius: borderRadius.xl,
    padding: 20,
    borderWidth: 2,
    borderColor: colors.borderLight,
    position: 'relative',
    overflow: 'hidden',
    elevation: 3,
    shadowColor: colors.shadow,
    shadowOffset: { width: 0, height: 4 },
    shadowOpacity: 0.05,
    shadowRadius: 10,
  },
  planCardSelected: {
    borderWidth: 2,
  },
  popularBadge: {
    position: 'absolute',
    top: 0,
    right: 0,
    paddingHorizontal: 12,
    paddingVertical: 4,
    borderBottomLeftRadius: borderRadius.md,
  },
  popularText: {
    fontSize: 9,
    fontWeight: '800',
    color: '#FFF',
  },
  planHeader: {
    flexDirection: 'row',
    justifyContent: 'space-between',
    alignItems: 'center',
    marginBottom: 16,
  },
  planName: {
    fontSize: 18,
    fontWeight: '700',
    color: colors.textPrimary,
  },
  planDuration: {
    fontSize: 13,
    color: colors.textSecondary,
    marginTop: 2,
  },
  planPrice: {
    flexDirection: 'row',
    alignItems: 'flex-start',
  },
  priceSymbol: {
    fontSize: 14,
    fontWeight: '600',
    color: colors.textSecondary,
    marginTop: 4,
  },
  priceValue: {
    fontSize: 28,
    fontWeight: '800',
  },
  featuresList: {
    gap: 10,
  },
  featureItem: {
    flexDirection: 'row',
    alignItems: 'center',
  },
  featureCheck: {
    fontSize: 14,
    marginRight: 10,
    fontWeight: '800',
  },
  featureText: {
    fontSize: 13,
    color: colors.textSecondary,
  },
  selectedIndicator: {
    position: 'absolute',
    bottom: 0,
    left: 0,
    right: 0,
    height: 3,
  },
  purchaseContainer: {
    paddingHorizontal: 16,
    gap: 12,
  },
  purchaseButton: {
    width: '100%',
  },
  terms: {
    fontSize: 11,
    color: colors.textMuted,
    textAlign: 'center',
    lineHeight: 16,
  },
});

export default PremiumScreen;
