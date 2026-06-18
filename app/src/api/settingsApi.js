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
  // Try new subscription_plans table first
  const { data, error } = await supabase
    .from('subscription_plans')
    .select('tier, plan_name, price_inr, duration_months, features, color_code, is_popular, contacts_limit, interests_limit')
    .neq('tier', 'free')
    .order('price_inr', { ascending: true });

  if (!error && data && data.length > 0) {
    return data.map((d) => ({
      id: d.tier,
      name: d.plan_name || d.tier,
      price: Number(d.price_inr),
      durationMonths: d.duration_months,
      duration: `${d.duration_months} Month${d.duration_months > 1 ? 's' : ''}`,
      features: d.features || [],
      color: d.color_code || '#D4AF37',
      popular: d.is_popular,
      contactsLimit: d.contacts_limit,
      interestsLimit: d.interests_limit,
    }));
  }

  // Fallback to tier_settings
  const { data: fallback, error: fbErr } = await supabase
    .from('tier_settings')
    .select('tier, plan_name, price_inr, duration_months, features, color_code, is_popular, contacts_limit, interests_limit')
    .neq('tier', 'free')
    .order('price_inr', { ascending: true });

  if (fbErr) throw fbErr;
  return (fallback || []).map((d) => ({
    id: d.tier,
    name: d.plan_name || d.tier,
    price: d.price_inr,
    durationMonths: d.duration_months,
    duration: `${d.duration_months} Month${d.duration_months > 1 ? 's' : ''}`,
    features: d.features || [],
    color: d.color_code || '#D4AF37',
    popular: d.is_popular,
    contactsLimit: d.contacts_limit,
    interestsLimit: d.interests_limit,
  }));
};
