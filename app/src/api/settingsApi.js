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
