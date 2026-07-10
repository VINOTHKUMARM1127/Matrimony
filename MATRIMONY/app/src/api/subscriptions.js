/**
 * Wedring Matrimony — Subscriptions API
 * Premium membership management
 *
 * SCHEMA NOTES:
 * - `user_subscriptions` — active/queued subscriptions (NOT `user_memberships`)
 * - `membership_plans` — plan definitions (NOT `subscription_plans`)
 * - `subscription_history` — completed subscription records
 * - Subscription creation happens via webhook flow (razorpay-webhook Edge Fn)
 */
import supabase from './supabaseClient';

/**
 * Get user's active subscription
 */
export const getActiveSubscription = async (userId) => {
  const { data, error } = await supabase
    .from('user_subscriptions')
    .select('*, membership_plans:plan_id (*)')
    .eq('user_id', userId)
    .eq('is_active', true)
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
    .from('subscription_history')
    .select('*, membership_plans:plan_id (*)')
    .eq('user_id', userId)
    .order('started_at', { ascending: false });

  if (error) throw error;
  return data || [];
};

/**
 * Check if user has premium feature access.
 * Reads the active subscription's plan tier.
 */
export const checkPremiumAccess = async (userId, feature) => {
  const sub = await getActiveSubscription(userId);
  if (!sub || !sub.membership_plans) return false;

  const tier = sub.membership_plans.tier;
  if (!tier || tier === 'free') return false;

  const featureMap = {
    silver: ['view_contacts', 'limited_messages', 'profile_visitors'],
    gold: ['view_contacts', 'unlimited_messages', 'horoscope_unlock', 'priority_visibility', 'advanced_search', 'profile_visitors'],
    platinum: ['view_contacts', 'unlimited_messages', 'horoscope_unlock', 'priority_visibility', 'advanced_search', 'profile_visitors', 'boosted_profile', 'verified_access', 'relationship_manager'],
  };

  const planFeatures = featureMap[tier] || [];
  return planFeatures.includes(feature);
};

/**
 * Get the user's remaining credits
 */
export const getUserCredits = async (userId) => {
  const sub = await getActiveSubscription(userId);
  if (!sub) return { contact_credits: 0, interest_credits: 0, tier: 'free' };
  return {
    contact_credits: sub.contact_credits_remaining || 0,
    interest_credits: sub.interest_credits_remaining || 0,
    tier: sub.membership_plans?.tier || 'free',
    expires_at: sub.expires_at,
  };
};
