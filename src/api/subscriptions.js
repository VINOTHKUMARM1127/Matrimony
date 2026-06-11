/**
 * Tamil Matrimony — Subscriptions API
 * Premium membership management
 */
import supabase from './supabaseClient';

/**
 * Get user's active subscription
 */
export const getActiveSubscription = async (userId) => {
  const { data, error } = await supabase
    .from('subscriptions')
    .select('*')
    .eq('user_id', userId)
    .eq('status', 'active')
    .gte('expires_at', new Date().toISOString())
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
    .from('subscriptions')
    .select('*')
    .eq('user_id', userId)
    .order('created_at', { ascending: false });

  if (error) throw error;
  return data || [];
};

/**
 * Create subscription record after payment
 */
export const createSubscription = async (subscriptionData) => {
  const { data, error } = await supabase
    .from('subscriptions')
    .insert(subscriptionData)
    .select()
    .single();

  if (error) throw error;

  // Update user premium status
  await supabase
    .from('profiles')
    .update({ is_premium: true })
    .eq('id', subscriptionData.user_id);

  return data;
};

/**
 * Check if user has premium feature access
 */
export const checkPremiumAccess = async (userId, feature) => {
  const sub = await getActiveSubscription(userId);
  if (!sub) return false;

  const featureMap = {
    gold: ['view_contacts', 'limited_messages', 'profile_visitors'],
    prime_gold: ['view_contacts', 'unlimited_messages', 'horoscope_unlock', 'priority_visibility', 'advanced_search', 'profile_visitors'],
    till_u_marry: ['view_contacts', 'unlimited_messages', 'horoscope_unlock', 'priority_visibility', 'advanced_search', 'profile_visitors', 'boosted_profile', 'verified_access', 'relationship_manager'],
  };

  const planFeatures = featureMap[sub.plan_type] || [];
  return planFeatures.includes(feature);
};
