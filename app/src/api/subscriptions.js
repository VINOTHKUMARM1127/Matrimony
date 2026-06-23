/**
 * Wedring Matrimony — Subscriptions API
 * Premium membership management
 */
import supabase from './supabaseClient';

/**
 * Get user's active subscription
 */
export const getActiveSubscription = async (userId) => {
  const { data, error } = await supabase
    .from('user_memberships')
    .select('*, membership_plans(*)')
    .eq('user_id', userId)
    .eq('status', 'active')
    .gte('expiry_date', new Date().toISOString())
    .order('created_at', { ascending: false })
    .maybeSingle();

  if (error) return null;
  return data;
};

/**
 * Get subscription history
 */
export const getSubscriptionHistory = async (userId) => {
  const { data, error } = await supabase
    .from('user_memberships')
    .select('*, membership_plans(*)')
    .eq('user_id', userId)
    .order('created_at', { ascending: false });

  if (error) throw error;
  return data || [];
};

/**
 * Create subscription record after payment
 */
export const createSubscription = async (subscriptionData) => {
  const { data, error } = await supabase.rpc('purchase_subscription', {
    p_user_id: subscriptionData.user_id,
    p_plan_type: subscriptionData.plan_type,
    p_payment_id: subscriptionData.razorpay_payment_id || null,
    p_amount: subscriptionData.amount || 0
  });

  if (error) throw error;

  return data;
};

/**
 * Check if user has premium feature access.
 * Tiers map to the real plan types defined in tier_settings: silver < gold < platinum.
 */
export const checkPremiumAccess = async (userId, feature) => {
  const sub = await getActiveSubscription(userId);
  if (!sub) return false;

  const featureMap = {
    silver: ['view_contacts', 'limited_messages', 'profile_visitors'],
    gold: ['view_contacts', 'unlimited_messages', 'horoscope_unlock', 'priority_visibility', 'advanced_search', 'profile_visitors'],
    platinum: ['view_contacts', 'unlimited_messages', 'horoscope_unlock', 'priority_visibility', 'advanced_search', 'profile_visitors', 'boosted_profile', 'verified_access', 'relationship_manager'],
  };

  const planFeatures = featureMap[sub.tier] || [];
  return planFeatures.includes(feature);
};
