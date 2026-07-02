/**
 * Wedring Matrimony — Settings API
 * User limits, premium plans, and dashboard data
 *
 * SCHEMA NOTES:
 * - `user_dashboard_summary` view — per-user stats for home screen
 * - `membership_plans` table — plan definitions (NOT `subscription_plans`)
 * - `distribution_config` table — per-tier distribution limits
 */
import supabase from './supabaseClient';

/**
 * Fetch user dashboard summary (quotas, tier, credits, etc.)
 * Reads from the `user_dashboard_summary` view.
 */
export const fetchUserDashboard = async (userId) => {
  if (!userId) return null;

  const { data, error } = await supabase
    .from('user_dashboard_summary')
    .select('*')
    .eq('user_id', userId)
    .maybeSingle();

  if (error) {
    console.warn('Dashboard summary error, falling back to direct query:', error);
    // Fallback: query user_subscriptions directly
    const { data: sub } = await supabase
      .from('user_subscriptions')
      .select('*, membership_plans:plan_id (*)')
      .eq('user_id', userId)
      .eq('is_active', true)
      .order('created_at', { ascending: false })
      .maybeSingle();

    const tier = sub?.membership_plans?.tier || 'free';
    return {
      tier,
      contact_credits_remaining: sub?.contact_credits_remaining || 0,
      interest_credits_remaining: sub?.interest_credits_remaining || 0,
      expires_at: sub?.expires_at || null,
    };
  }

  return data;
};

/**
 * Fetch purchasable premium plans from membership_plans.
 */
export const fetchPremiumPlans = async () => {
  const { data, error } = await supabase
    .from('membership_plans')
    .select('*')
    .eq('is_active', true)
    .order('price', { ascending: true });

  if (error) {
    console.error('Error fetching membership_plans:', error);
    return [];
  }

  return (data || [])
    .filter(d => d.tier !== 'free')
    .map((d) => {
      const planName = (d.name || d.tier).toLowerCase();
      const validityDays = d.duration_days ?? 30;
      
      let color = d.color_code || '#D4AF37';
      let popular = d.is_popular || false;
      let features = d.features || [
        `${d.contact_credits} Contact Credits`,
        `${d.interest_credits} Interest Credits`,
        `Valid for ${validityDays} Days`,
      ];

      // Fallback colors if not in DB
      if (!d.color_code) {
        if (planName.includes('silver')) {
          color = '#C0C0C0';
        } else if (planName.includes('gold')) {
          color = '#D4AF37';
          popular = true;
        } else if (planName.includes('platinum') || planName.includes('diamond')) {
          color = '#E5E4E2';
        }
      }

      return {
        id: d.id,
        tier: d.tier,
        name: d.name,
        price: d.price,
        duration: `${validityDays} Days`,
        validityDays,
        features,
        color,
        popular,
        contactsLimit: d.contact_credits,
        interestsLimit: d.interest_credits,
        ...d,
      };
    });
};

/**
 * Fetch distribution config for a specific tier.
 */
export const fetchDistributionConfig = async (tier) => {
  const { data, error } = await supabase
    .from('distribution_config')
    .select('*')
    .eq('tier', tier)
    .maybeSingle();

  if (error) return null;
  return data;
};
