import supabase from './supabaseClient';

/**
 * Fetch Admin Settings (Read-only for mobile client)
 */
export const fetchAdminSettings = async () => {
  const { data, error } = await supabase
    .from('admin_settings')
    .select('*');

  if (error) throw error;

  const settings = {};
  data.forEach(item => {
    settings[item.setting_key] = item.setting_value;
  });

  return settings;
};

/**
 * Fetch user limits via the get_user_quota RPC.
 * Returns per-user distribution limits from user_distribution_state + user_wallet.
 */
export const fetchUserLimits = async (userId) => {
  if (!userId) return null;

  const { data, error } = await supabase.rpc('get_user_quota', { p_user_id: userId });

  if (error) {
    // Fallback to tier_settings if RPC not yet deployed
    const { data: profile } = await supabase
      .from('profiles')
      .select('tier')
      .eq('id', userId)
      .single();

    const tier = profile?.tier || 'free';

    const { data: tierData } = await supabase
      .from('tier_settings')
      .select('*')
      .eq('tier', tier)
      .single();

    return tierData;
  }

  return data;
};

/**
 * Fetch purchasable premium plans from subscription_plans.
 * Falls back to tier_settings if subscription_plans doesn't exist yet.
 */
export const fetchPremiumPlans = async () => {
  const { data, error } = await supabase
    .from('membership_plans')
    .select('id, name, price_inr, validity_days, contact_credits, interest_credits, is_active')
    .eq('is_active', true)
    .neq('name', 'Free') // Assuming we don't show Free in premium screen
    .order('price_inr', { ascending: true });

  if (error) throw error;

  return (data || []).map((d) => {
    // Generate UI attributes based on plan name
    const planName = d.name.toLowerCase();
    let color = '#D4AF37'; // Default Gold
    let popular = false;
    let features = [
      `${d.contact_credits} Contact Credits`,
      `${d.interest_credits} Interest Credits`,
      `Valid for ${d.validity_days} Days`,
    ];

    if (planName.includes('silver')) {
      color = '#C0C0C0';
    } else if (planName.includes('gold')) {
      color = '#D4AF37';
      popular = true;
      features.push('Priority Support');
    } else if (planName.includes('platinum') || planName.includes('diamond')) {
      color = '#E5E4E2';
      features.push('Priority Support', 'Dedicated Manager');
    }

    return {
      id: d.id,
      name: d.name,
      price: d.price_inr,
      durationMonths: Math.round(d.validity_days / 30),
      duration: `${d.validity_days} Days`,
      features,
      color,
      popular,
      contactsLimit: d.contact_credits,
      interestsLimit: d.interest_credits,
    };
  });
};
