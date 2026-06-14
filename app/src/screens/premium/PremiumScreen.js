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
import { createRazorpayOrder, openCheckout, verifyPayment } from '../../services/razorpay';

// Prime Tiers Definition
const PREMIUM_PLANS = [
  {
    id: 'silver',
    name: 'Silver',
    duration: '1 Month',
    price: 499,
    currency: 'INR',
    features: [
      'View 30 contact numbers',
      'Send up to 50 interests',
      'Premium verified badge',
      'Priority customer support',
    ],
    color: '#8A8A8A',
  },
  {
    id: 'gold',
    name: 'Gold',
    duration: '1 Month',
    price: 999,
    currency: 'INR',
    features: [
      'View 50 contact numbers',
      'Send up to 100 interests',
      'Premium verified badge',
      'Priority customer support',
    ],
    color: '#D4AF37',
    popular: true,
  },
  {
    id: 'platinum',
    name: 'Platinum',
    duration: '3 Months',
    price: 2499,
    currency: 'INR',
    features: [
      'View 100 contact numbers',
      'Send up to 300 interests',
      'Premium verified badge',
      'Priority customer support',
    ],
    color: '#E5E4E2',
  },
];

const PremiumScreen = () => {
  const user = useAuthStore((s) => s.user);
  const [selectedPlan, setSelectedPlan] = useState('gold');
  const [processing, setProcessing] = useState(false);

  const calculateExpiry = (planType) => {
    const now = new Date();
    switch (planType) {
      case 'silver':
        now.setMonth(now.getMonth() + 1); // Silver = 1 Month
        break;
      case 'gold':
        now.setMonth(now.getMonth() + 1); // Gold = 1 Month
        break;
      case 'platinum':
        now.setMonth(now.getMonth() + 3); // Platinum = 3 Months
        break;
      default:
        now.setMonth(now.getMonth() + 1);
    }
    return now.toISOString();
  };

  const handlePurchase = useCallback(async () => {
    const plan = PREMIUM_PLANS.find((p) => p.id === selectedPlan);
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
                  amount: plan.price,
                  starts_at: new Date().toISOString(),
                  expires_at: calculateExpiry(plan.id),
                });

                // Reload user profile and refresh local state
                await useProfileStore.getState().loadProfile(user.id);

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
          amount: plan.price,
          starts_at: new Date().toISOString(),
          expires_at: calculateExpiry(plan.id),
        });

        await useProfileStore.getState().loadProfile(user.id);

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
  }, [selectedPlan, user]);

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
      <View style={styles.plansList}>
        {PREMIUM_PLANS.map((plan) => {
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

      {/* Subscription trigger button */}
      <View style={styles.purchaseContainer}>
        <Button
          title={`Subscribe to ${PREMIUM_PLANS.find((p) => p.id === selectedPlan)?.name} now`}
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
