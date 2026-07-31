/**
 * Wedring Matrimony — Razorpay Payment Service
 *
 * SECURITY: Order creation now happens via the `razorpay-create-order` Edge Function.
 * The Razorpay key secret is NEVER exposed to the client.
 * Payment verification happens server-side via the `razorpay-webhook` Edge Function.
 */
import { RAZORPAY_KEY_ID, APP_NAME } from '../utils/constants';
import supabase from '../api/supabaseClient';
import { Platform } from 'react-native';

// Guard: a live key must never run outside production.
const isLiveKey = RAZORPAY_KEY_ID.startsWith('rzp_live_');
const isProduction = process.env.EXPO_PUBLIC_APP_ENV === 'production';
if (isLiveKey && !isProduction) {
  throw new Error(
    `Refusing to start: a LIVE Razorpay key is configured under APP_ENV="${process.env.EXPO_PUBLIC_APP_ENV}". ` +
    `Use a rzp_test_ key for development/preview builds.`
  );
}

/**
 * Create Razorpay order via Supabase Edge Function
 * @param {string} planId — UUID of the membership_plans row
 */
export const createRazorpayOrder = async (planId) => {
  const { data, error } = await supabase.functions.invoke(
    'razorpay-create-order',
    { body: { plan_id: planId } }
  );

  if (error) throw error;
  if (!data?.order_id) throw new Error('Failed to create Razorpay order');

  return data; // { order_id, amount, currency, key_id, payment_row_id, plan }
};

/**
 * Verify Razorpay payment synchronously via Supabase Edge Function
 * This allows immediate activation without waiting for webhooks.
 * @param {object} paymentData — The success payload from Razorpay
 */
export const verifyRazorpayPayment = async (paymentData) => {
  const { data, error } = await supabase.functions.invoke(
    'razorpay-verify',
    { body: paymentData }
  );

  if (error) throw error;
  if (!data?.ok) throw new Error(data?.error || 'Failed to verify payment');

  return data;
};

/**
 * Open Razorpay checkout
 * NOTE: Requires react-native-razorpay native module
 * Only works in development builds (not Expo Go)
 */
export const openCheckout = async (options) => {
  try {
    const defaultOptions = {
      key: RAZORPAY_KEY_ID,
      name: APP_NAME,
      currency: 'INR',
      theme: { color: '#FF6B35' },
      ...options,
    };

    if (Platform.OS === 'web') {
      return new Promise((resolve) => {
        const loadRazorpayScript = () => {
          return new Promise((resolveScript) => {
            if (window.Razorpay) {
              resolveScript(true);
              return;
            }
            const script = document.createElement('script');
            script.src = 'https://checkout.razorpay.com/v1/checkout.js';
            script.onload = () => resolveScript(true);
            script.onerror = () => resolveScript(false);
            document.body.appendChild(script);
          });
        };

        loadRazorpayScript().then((loaded) => {
          if (!loaded) {
            resolve({ success: false, error: new Error('Failed to load Razorpay SDK') });
            return;
          }

          const rzpOptions = {
            ...defaultOptions,
            handler: function (response) {
              resolve({ success: true, data: response });
            },
            modal: {
              ondismiss: function () {
                resolve({ success: false, error: new Error('Payment Cancelled') });
              }
            }
          };

          const rzp = new window.Razorpay(rzpOptions);
          rzp.on('payment.failed', function (response) {
            resolve({ success: false, error: new Error(response.error.description || 'Payment failed') });
          });
          rzp.open();
        });
      });
    }

    // Dynamic import to avoid crash if module not available
    const RazorpayCheckout = require('react-native-razorpay').default;
    const data = await RazorpayCheckout.open(defaultOptions);
    return { success: true, data };
  } catch (error) {
    return { success: false, error };
  }
};

export default {
  createRazorpayOrder,
  verifyRazorpayPayment,
  openCheckout,
};
