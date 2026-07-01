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
 */
export const fetchPremiumPlans = async () => {
  const { data, error } = await supabase
    .from('subscription_plans')
    .select(`
      tier,
      plan_name,
      price_inr,
      duration_months,
      contacts_limit,
      interests_limit,
      initial_recommended_profiles,
      daily_recommended_increment,
      features,
      color_code,
      is_popular
    `)
    .order('price_inr', { ascending: true });

  if (error) {
    console.error('Error fetching subscription_plans:', error);
    return [];
  }

  return (data || [])
    .filter(d => d.tier !== 'free') // Assuming we don't show Free in premium screen
    .map((d) => {
      // Generate UI attributes based on plan name
      const planName = (d.plan_name || d.tier).toLowerCase();
      
      const validityDays = (d.duration_months ?? 1) * 30;
      
      let color = d.color_code || '#D4AF37'; // Default Gold
      let popular = d.is_popular || false;
      let features = d.features || [
        `${d.contacts_limit} Contact Credits`,
        `${d.interests_limit} Interest Credits`,
        `Valid for ${validityDays} Days`,
        `See ${d.initial_recommended_profiles} profiles instantly`,
        `+ ${d.daily_recommended_increment} new profiles every day`
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
        id: d.tier,
        tier: d.tier,
        name: d.plan_name,
        price: d.price_inr,
        durationMonths: d.duration_months,
        duration: `${validityDays} Days`,
        validityDays,
        features,
        color,
        popular,
        contactsLimit: d.contacts_limit,
        interestsLimit: d.interests_limit,
        initial_recommended_profiles: d.initial_recommended_profiles,
        daily_recommended_increment: d.daily_recommended_increment,
        ...d
      };
    });
};
