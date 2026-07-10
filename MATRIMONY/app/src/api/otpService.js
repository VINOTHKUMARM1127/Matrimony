/**
 * Wedring Matrimony — OTP Service
 * Server-side OTP generation and verification via the fast2sms-otp Edge Function.
 * Replaces the insecure client-side fast2sms.js module.
 */
import supabase from './supabaseClient';

/**
 * Send an OTP to the given mobile number.
 * @param {string} phone — Indian mobile number (any format)
 * @returns {Promise<{ success: boolean, message: string }>}
 */
export const sendOTP = async (phone) => {
  const { data, error } = await supabase.functions.invoke('fast2sms-otp', {
    body: { phone, action: 'send' },
  });

  if (error) throw new Error(error.message || 'Failed to send OTP');
  if (!data?.success) throw new Error(data?.error || 'Failed to send OTP');
  
  return data;
};

/**
 * Verify the user-entered OTP.
 * @param {string} phone — Indian mobile number (any format)
 * @param {string} otp — 6-digit code entered by user
 * @returns {Promise<{ success: boolean, message: string }>}
 */
export const verifyOTP = async (phone, otp) => {
  const { data, error } = await supabase.functions.invoke('fast2sms-otp', {
    body: { phone, action: 'verify', otp },
  });

  if (error) throw new Error(error.message || 'Failed to verify OTP');
  if (!data?.success) throw new Error(data?.error || 'Verification failed');

  return data;
};

/**
 * Clear stored OTP for a number (no-op since server manages state,
 * but kept for API compatibility with screens that call clearOTP on unmount).
 */
export const clearOTP = (phone) => {
  // Server manages OTP state; this is a no-op on the client.
};

export default { sendOTP, verifyOTP, clearOTP };
