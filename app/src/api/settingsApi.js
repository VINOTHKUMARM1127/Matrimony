import supabase from './supabaseClient';

/**
 * Fetch Admin Settings (Read-only for mobile client)
 */
export const fetchAdminSettings = async () => {
  const { data, error } = await supabase
    .from('admin_settings')
    .select('*');
    
  if (error) throw error;
  
  // Format as key-value map
  const settings = {};
  data.forEach(item => {
    settings[item.setting_key] = item.setting_value;
  });
  
  return settings;
};
/**
 * Fetch specific limits for the given user, correctly evaluated by the backend RPC
 * This ensures clamping (Free tier minimums) and cumulative limits (Premium days active) match perfectly.
 */
export const fetchUserLimits = async (userId) => {
  if (!userId) return null;
  // Get user's current tier
  const { data: profile } = await supabase
    .from('profiles')
    .select('tier')
    .eq('id', userId)
    .single();

  const tier = profile?.tier || 'free';

  // Fetch from tier_settings
  const { data, error } = await supabase
    .from('tier_settings')
    .select('*')
    .eq('tier', tier)
    .single();

  if (error) throw error;
  return data;
};

/**
 * Fetch purchasable premium plans (everything but free), priced live from tier_settings.
 * Single source of truth — used by the Premium screen and the Matches lock card.
 */
export const fetchPremiumPlans = async () => {
  const { data, error } = await supabase
    .from('tier_settings')
    .select('tier, plan_name, price_inr, duration_months, features, color_code, is_popular, contacts_limit, interests_limit')
    .neq('tier', 'free')
    .order('price_inr', { ascending: true });

  if (error) throw error;
  return (data || []).map((d) => ({
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
