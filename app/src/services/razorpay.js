/**
 * Wedring Matrimony — Razorpay Payment Service
 *
 * SECURITY: Order creation now happens via the `razorpay-create-order` Edge Function.
 * The Razorpay key secret is NEVER exposed to the client.
 * Payment verification happens server-side via the `razorpay-webhook` Edge Function.
 */
import { RAZORPAY_KEY_ID, APP_NAME } from '../utils/constants';
import supabase from '../api/supabaseClient';

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
 * Open Razorpay checkout
 * NOTE: Requires react-native-razorpay native module
 * Only works in development builds (not Expo Go)
 */
export const openCheckout = async (options) => {
  try {
    // Dynamic import to avoid crash if module not available
    const RazorpayCheckout = require('react-native-razorpay').default;

    const defaultOptions = {
      key: RAZORPAY_KEY_ID,
      name: APP_NAME,
      currency: 'INR',
      theme: { color: '#FF6B35' },
      ...options,
    };

    const data = await RazorpayCheckout.open(defaultOptions);
    return { success: true, data };
  } catch (error) {
    return { success: false, error };
  }
};

export default {
  createRazorpayOrder,
  openCheckout,
};
