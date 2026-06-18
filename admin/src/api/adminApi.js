import supabase from './supabaseClient';
import supabaseAdmin from './supabaseAdminClient';
import {
  buildProfilePayload,
  buildHoroscopePayload,
  buildPreferencePayload,
  PREFERENCE_ARRAY_FIELDS,
  PREFERENCE_SCALAR_FIELDS,
} from './profileFields';

/**
 * Check if an email belongs to an admin
 */
export const checkIsAdmin = async (email) => {
  if (!email) return false;
  const { data, error } = await supabase
    .from('admin_users')
    .select('role')
    .eq('email', email)
    .maybeSingle();
  
  if (error || !data) return false;
  return true;
};

/**
 * Fetch all users with their subscriptions
 */
export const fetchAllUsers = async () => {
  const { data: profiles, error } = await supabase
    .from('profiles')
    .select(`
      *,
      photos(*),
      subscriptions(*)
    `)
    .order('created_at', { ascending: false });

  if (error) throw error;
  
  let mappedProfiles = profiles.map(p => ({ ...p, email: '' }));
  
  if (supabaseAdmin) {
    // Attempt to use the fast, direct RPC method if it exists
    const { data: rpcEmails, error: rpcError } = await supabase.rpc('get_all_user_emails');
    
    if (!rpcError && rpcEmails && rpcEmails.length > 0) {
      mappedProfiles = profiles.map(profile => {
        const authUser = rpcEmails.find(u => u.id === profile.id);
        return { ...profile, email: authUser?.email || '' };
      });
    } else {
      // Fallback to GoTrue listUsers if RPC hasn't been created yet
      try {
        const { data: authData, error: authError } = await supabaseAdmin.auth.admin.listUsers({
          page: 1,
          perPage: 1000
        });
        
        if (!authError && authData?.users) {
          mappedProfiles = profiles.map(profile => {
            const authUser = authData.users.find(u => u.id === profile.id);
            return { ...profile, email: authUser?.email || '' };
          });
        }
      } catch (err) {
        console.error('GoTrue listUsers failed:', err);
      }
    }
  }

  // Filter out admin users so they don't inflate the stats or show in the manager table
  try {
    const { data: adminUsers } = await supabase.from('admin_users').select('email');
    if (adminUsers && adminUsers.length > 0) {
      const adminEmails = adminUsers.map(a => a.email.toLowerCase());
      return mappedProfiles.filter(p => !p.email || !adminEmails.includes(p.email.toLowerCase()));
    }
  } catch (err) {
    console.error('Failed to filter admins:', err);
  }

  return mappedProfiles;
};

/**
 * Update user premium plan
 */
export const updateUserPlan = async (userId, planType) => {
  if (!supabaseAdmin) throw new Error('Service Role Key required for Admin updates');

  if (planType === 'free' || planType === 'non_premium') {
    // Use the atomic RPC so premium flags, queued/active subscriptions, and the
    // subscription_queue are all cleared together. (Distribution/wallet are left
    // intact here — use makeUserFree(userId, true) for a full re-test reset.)
    const { error } = await supabaseAdmin.rpc('admin_make_user_free', {
      p_user_id: userId,
      p_reset_distribution: false,
    });
    if (error) throw new Error(error.message || 'Failed to downgrade user to free');
    return;
  }

  // Map plans to specification rules
  // Premium activation. Duration, contacts, and interests are NOT hardcoded here —
  // purchase_subscription derives them live from tier_settings (single source of truth).
  const { error } = await supabaseAdmin.rpc('purchase_subscription', {
    p_user_id: userId,
    p_plan_type: planType,
    p_payment_id: null,
    p_amount: null
  });

  if (error) throw new Error(error.message || 'Failed to update user plan');
};

/**
 * Reset User Password
 */
export const resetUserPassword = async (userId, newPassword) => {
  const serviceKey = import.meta.env.VITE_SUPABASE_SERVICE_ROLE_KEY;
  if (!serviceKey) throw new Error('Service Role Key required for Auth updates');
  
  const response = await fetch(`${import.meta.env.VITE_SUPABASE_URL}/auth/v1/admin/users/${userId}`, {
    method: 'PUT',
    headers: {
      'Content-Type': 'application/json',
      'apikey': serviceKey,
      'Authorization': `Bearer ${serviceKey}`
    },
    body: JSON.stringify({ password: newPassword })
  });

  if (!response.ok) {
    const errorData = await response.json().catch(() => ({}));
    throw new Error(errorData.message || 'Failed to reset password');
  }
  
  return await response.json();
};

import { deletePhotoFromR2 } from './imageApi';

/**
 * Delete a User
 */
export const deleteUser = async (userId) => {
  // 1. Clean up user photos from Cloudflare R2
  try {
    const { data: userPhotos } = await supabaseAdmin.from('photos').select('storage_path').eq('user_id', userId);
    if (userPhotos && userPhotos.length > 0) {
      for (const p of userPhotos) {
        if (p.storage_path) {
          await deletePhotoFromR2(p.storage_path).catch(err => console.warn('Failed to delete from R2:', err));
        }
      }
    }
  } catch (err) {
    console.warn('Error fetching photos for cleanup:', err);
  }

  // First try the secure RPC function to bypass GoTrue Auth API errors completely
  const { error: rpcError } = await supabase.rpc('delete_auth_user', { target_user_id: userId });
  
  // If the RPC isn't installed (400 Bad Request) or fails, fallback to the Service Role Key
  if (rpcError) {
    console.warn('RPC delete_auth_user failed or missing, falling back to Service Role API:', rpcError.message);
    
    if (!supabaseAdmin) throw new Error('Service Role Key required to delete user without RPC.');
    
    // Fallback: Use GoTrue Admin API
    const { error: adminError } = await supabaseAdmin.auth.admin.deleteUser(userId);
    
    if (adminError) {
      throw new Error(adminError.message || 'Failed to delete user via Admin API');
    }
    
    // Since we bypassed the DB-level trigger via API, explicitly delete the profile as well
    const { error: profileError } = await supabaseAdmin.from('profiles').delete().eq('id', userId);
    if (profileError) {
      console.warn('Profile deletion warning:', profileError.message);
    }
  }
  
  return true;
};

/**
 * Add Profile Photo
 */
export const addPhoto = async (userId, publicUrl) => {
  if (!supabaseAdmin) throw new Error('Service Role Key required');

  const { data, error } = await supabaseAdmin
    .from('photos')
    .insert({
      user_id: userId,
      storage_path: publicUrl,
      thumbnail_path: publicUrl,
      is_primary: true,
      display_order: 0,
    })
    .select()
    .single();

  if (error) throw error;
  return data;
};

/**
 * Delete Profile Photo DB Record
 */
export const deletePhoto = async (photoId) => {
  if (!supabaseAdmin) throw new Error('Service Role Key required');

  const { error } = await supabaseAdmin
    .from('photos')
    .delete()
    .eq('id', photoId);

  if (error) throw error;
  return true;
};

/**
 * Update User Profile
 */
export const updateUser = async (userId, profileData) => {
  if (!supabaseAdmin) throw new Error('Service Role Key required for Admin updates');

  const { data, error } = await supabaseAdmin
    .from('profiles')
    .update(profileData)
    .eq('id', userId)
    .select()
    .single();

  if (error) throw error;
  return data;
};

/**
 * Fetch a user's horoscope + partner preferences (for the full editor).
 */
export const fetchUserRelations = async (userId) => {
  const [horo, prefs] = await Promise.all([
    supabaseAdmin.from('horoscope_details').select('*').eq('user_id', userId).maybeSingle(),
    supabaseAdmin.from('partner_preferences').select('*').eq('user_id', userId).maybeSingle(),
  ]);
  return {
    horoscope: horo.data || null,
    preferences: prefs.data || null,
  };
};

/**
 * Upsert a user's horoscope details (admin editor).
 */
export const updateUserHoroscope = async (userId, horoscopeData) => {
  if (!supabaseAdmin) throw new Error('Service Role Key required for Admin updates');
  const payload = buildHoroscopePayload(horoscopeData) || {};
  const { data, error } = await supabaseAdmin
    .from('horoscope_details')
    .upsert({ user_id: userId, ...payload }, { onConflict: 'user_id' })
    .select()
    .single();
  if (error) throw error;
  return data;
};

/**
 * Upsert a user's partner preferences (admin editor).
 */
export const updateUserPreferences = async (userId, preferenceData) => {
  if (!supabaseAdmin) throw new Error('Service Role Key required for Admin updates');
  const payload = buildPreferencePayload(preferenceData) || {};
  const { data, error } = await supabaseAdmin
    .from('partner_preferences')
    .upsert({ user_id: userId, ...payload }, { onConflict: 'user_id' })
    .select()
    .single();
  if (error) throw error;
  return data;
};

/**
 * Update subscription quota balances directly (admin override).
 */
export const updateUserQuotas = async (userId, { contacts_remaining, interests_remaining, premium_expires_at }) => {
  if (!supabaseAdmin) throw new Error('Service Role Key required for Admin updates');
  const patch = {};
  if (contacts_remaining !== undefined) patch.contacts_remaining = parseInt(contacts_remaining, 10) || 0;
  if (interests_remaining !== undefined) patch.interests_remaining = parseInt(interests_remaining, 10) || 0;
  if (premium_expires_at !== undefined) patch.premium_expires_at = premium_expires_at || null;
  const { data, error } = await supabaseAdmin.from('profiles').update(patch).eq('id', userId).select().single();
  if (error) throw error;
  return data;
};
export const bulkUploadUsers = async (usersList, stopRef, onProgress) => {
  if (!supabaseAdmin) throw new Error('Service Role Key required for Auth updates');
  
  const results = {
    success: 0,
    failed: 0,
    errors: []
  };

  let currentCount = 0;

  for (const user of usersList) {
    if (onProgress) onProgress(currentCount, usersList.length);

    if (stopRef && stopRef.current) {
      results.errors.push('Process stopped by admin.');
      break;
    }
    try {
      // 1. Create Auth User
      const serviceKey = import.meta.env.VITE_SUPABASE_SERVICE_ROLE_KEY;
      const response = await fetch(`${import.meta.env.VITE_SUPABASE_URL}/auth/v1/admin/users`, {
        method: 'POST',
        headers: {
          'Content-Type': 'application/json',
          'apikey': serviceKey,
          'Authorization': `Bearer ${serviceKey}`
        },
        body: JSON.stringify({
          email: user.email,
          password: user.password,
          email_confirm: true
        })
      });

      if (!response.ok) {
        const errorData = await response.json().catch(() => ({}));
        throw new Error(errorData.message || 'Failed to create user');
      }

      const authData = await response.json();
      const newUserId = authData.id;

      // 2. Update Profile (auto-created by the auth trigger) — ALL profile columns.
      const profilePayload = buildProfilePayload(user);
      const { error: profileError } = await supabaseAdmin
        .from('profiles')
        .update({
          ...profilePayload,
          is_profile_complete: true,
          profile_completion_percent: 100,
        })
        .eq('id', newUserId);

      if (profileError) {
        // Cleanup auth user if profile update fails
        await fetch(`${import.meta.env.VITE_SUPABASE_URL}/auth/v1/admin/users/${newUserId}`, {
          method: 'DELETE',
          headers: { 'apikey': serviceKey, 'Authorization': `Bearer ${serviceKey}` }
        });
        throw profileError;
      }

      // 3. Horoscope (optional) — accepts flat keys (star, raasi, …).
      const horoscope = buildHoroscopePayload(user.horoscope || user);
      if (horoscope) {
        const { error: hErr } = await supabaseAdmin
          .from('horoscope_details')
          .upsert({ user_id: newUserId, ...horoscope }, { onConflict: 'user_id' });
        if (hErr) results.errors.push(`Horoscope warning for ${user.email}: ${hErr.message}`);
      }

      // 4. Partner preferences (optional) — accepts a `preferences` object OR
      //    top-level `preferred_*` keys, normalised to the real column names.
      const prefSource = user.preferences || (() => {
        const p = {};
        for (const k of [...PREFERENCE_ARRAY_FIELDS, ...PREFERENCE_SCALAR_FIELDS]) {
          if (`preferred_${k}` in user) p[k] = user[`preferred_${k}`];
          else if (k in user && user.preferences === undefined && k !== 'religion' && k !== 'caste') p[k] = user[k];
        }
        return p;
      })();
      const preferences = buildPreferencePayload(prefSource);
      if (preferences) {
        const { error: pErr } = await supabaseAdmin
          .from('partner_preferences')
          .upsert({ user_id: newUserId, ...preferences }, { onConflict: 'user_id' });
        if (pErr) results.errors.push(`Preferences warning for ${user.email}: ${pErr.message}`);
      }

      // 5. Subscription (optional) — derives quotas/dates from tier_settings.
      if (user.plan_type && user.plan_type !== 'free') {
        const { error: sErr } = await supabaseAdmin.rpc('purchase_subscription', {
          p_user_id: newUserId, p_plan_type: user.plan_type, p_payment_id: 'bulk_import', p_amount: null
        });
        if (sErr) results.errors.push(`Plan warning for ${user.email}: ${sErr.message}`);
      }

      // 6. Photos (optional) — array of URLs; first is primary.
      if (Array.isArray(user.photos) && user.photos.length > 0) {
        const rows = user.photos.map((url, i) => ({
          user_id: newUserId,
          storage_path: typeof url === 'string' ? url : url.storage_path,
          thumbnail_path: typeof url === 'string' ? url : (url.thumbnail_path || url.storage_path),
          is_primary: i === 0,
          display_order: i,
        }));
        const { error: phErr } = await supabaseAdmin.from('photos').insert(rows);
        if (phErr) results.errors.push(`Photos warning for ${user.email}: ${phErr.message}`);
      }

      results.success++;
    } catch (err) {
      results.failed++;
      results.errors.push(`Failed for ${user.email}: ${err.message}`);
    }
    
    currentCount++;
  }

  if (onProgress) onProgress(currentCount, usersList.length);

  return results;
};

/**
 * Fetch Admin Settings (Tier Settings)
 */
export const fetchAdminSettings = async () => {
  const { data, error } = await supabase
    .from('subscription_plans')
    .select('*');
    
  if (error) throw error;
  
  // Format as key-value map for backwards compatibility
  const matches_limits = {};
  data.forEach(item => {
    const tierKey = item.tier === 'free' ? 'non_premium' : item.tier;
    matches_limits[tierKey] = {
      recommended: item.recommended_limit,
      nearby: item.nearby_limit,
      daily: item.daily_limit,
      dynamic_daily_updates: item.dynamic_daily_enabled,
      plan_name: item.plan_name,
      price_inr: item.price_inr,
      duration_months: item.duration_months,
      contacts_limit: item.contacts_limit,
      interests_limit: item.interests_limit,
      features: item.features || [],
      color_code: item.color_code,
      is_popular: item.is_popular
    };
  });
  
  return { matches_limits };
};

/**
 * Update Admin Setting
 */
export const updateAdminSetting = async (key, value) => {
  // If updating matches_limits, we must update tier_settings
  if (key === 'matches_limits') {
    const promises = Object.entries(value).map(async ([tierKey, limits]) => {
      const tier = tierKey === 'non_premium' ? 'free' : tierKey;
      // First try the secure RPC to completely bypass RLS and Service Key bugs!
      const { error: rpcError } = await supabase.rpc('update_tier_settings', {
        p_tier: tier,
        p_rec: limits.recommended,
        p_near: limits.nearby,
        p_daily: limits.daily,
        p_dyn: limits.dynamic_daily_updates,
        p_plan_name: limits.plan_name,
        p_price_inr: limits.price_inr,
        p_duration_months: limits.duration_months,
        p_contacts_limit: limits.contacts_limit,
        p_interests_limit: limits.interests_limit,
        p_features: limits.features,
        p_color_code: limits.color_code,
        p_is_popular: limits.is_popular
      });

      // If the RPC isn't installed (400 Bad Request) or fails, fallback to Service Role Key
      if (rpcError) {
        console.warn(`RPC update_tier_settings failed for tier ${tier}, falling back to Service Role API:`, rpcError.message);
        
        if (!supabaseAdmin) throw new Error('Service Role Key required to update settings without RPC.');
        
        const { error: adminError } = await supabaseAdmin
          .from('tier_settings')
          .update({
            recommended_limit: limits.recommended,
            nearby_limit: limits.nearby,
            daily_limit: limits.daily,
            dynamic_daily_enabled: limits.dynamic_daily_updates,
            plan_name: limits.plan_name,
            price_inr: limits.price_inr,
            duration_months: limits.duration_months,
            contacts_limit: limits.contacts_limit,
            interests_limit: limits.interests_limit,
            features: limits.features,
            color_code: limits.color_code,
            is_popular: limits.is_popular
          })
          .eq('tier', tier);
          
        if (adminError) {
          throw new Error(adminError.message || 'Failed to update tier settings via Admin API');
        }
      }
      return true;
    });
    
    await Promise.all(promises);
    return true;
  }
  return false;
};

/**
 * Bulk Delete Incomplete Users
 * Deletes users who have not completed their profile setup
 */
export const deleteIncompleteUsers = async () => {
  // Use fetchAllUsers to get profiles. This reliably fetches emails and EXCLUDES admins!
  const allUsers = await fetchAllUsers();
  
  // Find all profiles where is_profile_complete is false or null
  const incompleteProfiles = allUsers.filter(u => u.is_profile_complete === false || u.is_profile_complete === null);

  if (!incompleteProfiles || incompleteProfiles.length === 0) return 0;

  let deletedCount = 0;
  
  // Use the secure RPC function to delete them via Postgres instead of GoTrue
  for (const profile of incompleteProfiles) {
    try {
      const { error: deleteError } = await supabase.rpc('delete_auth_user', { target_user_id: profile.id });
      
      if (!deleteError) {
        deletedCount++;
      } else {
        // Fallback if RPC is missing
        if (supabaseAdmin) {
          const { error: adminError } = await supabaseAdmin.auth.admin.deleteUser(profile.id);
          if (!adminError) {
            await supabaseAdmin.from('profiles').delete().eq('id', profile.id);
            deletedCount++;
          }
        }
      }
    } catch (err) {
      console.error(`Failed to delete user ${profile.id}:`, err);
    }
  }

  return deletedCount;
};

// ============================================================
// DISTRIBUTION MANAGEMENT
// ============================================================

/**
 * Fetch distribution settings change history
 */
export const fetchDistributionHistory = async (limit = 50) => {
  const { data, error } = await supabase
    .from('distribution_settings_history')
    .select('*')
    .order('created_at', { ascending: false })
    .limit(limit);

  if (error) throw error;
  return data || [];
};

/**
 * Save distribution change with push mode
 */
export const saveDistributionChange = async (tier, limits, pushMode, adminEmail) => {
  const { error } = await supabase.rpc('save_distribution_settings', {
    p_tier: tier,
    p_recommended: limits.recommended,
    p_nearby: limits.nearby,
    p_daily: limits.daily,
    p_push_mode: pushMode,
    p_admin_email: adminEmail
  });

  if (error) throw error;
  return true;
};

/**
 * Force push distribution for a specific tier
 */
export const forcePushDistribution = async (tier, adminEmail) => {
  const { data, error } = await supabase.rpc('force_push_distribution', {
    p_tier: tier,
    p_admin_email: adminEmail
  });

  if (error) throw error;
  return data;
};

/**
 * Force push distribution for all tiers
 */
export const forcePushAllDistribution = async (adminEmail) => {
  const { data, error } = await supabase.rpc('force_push_all_distribution', {
    p_admin_email: adminEmail
  });

  if (error) throw error;
  return data;
};

// ============================================================
// PAYMENT HISTORY & REVENUE
// ============================================================

/**
 * Fetch revenue statistics
 */
export const fetchRevenueStats = async () => {
  const { data, error } = await supabase.rpc('get_revenue_stats');
  if (error) throw error;
  return data;
};

/**
 * Fetch paginated payment history with filters
 */
export const fetchPayments = async ({ page = 1, perPage = 25, status, planType, search, dateFrom, dateTo } = {}) => {
  let query = supabase
    .from('payments')
    .select(`
      *,
      profile:profiles!payments_user_id_fkey (
        id, display_name, phone, tier
      )
    `, { count: 'exact' })
    .order('created_at', { ascending: false });

  if (status && status !== 'all') {
    query = query.eq('status', status);
  }
  if (planType && planType !== 'all') {
    query = query.eq('plan_type', planType);
  }
  if (dateFrom) {
    query = query.gte('created_at', dateFrom);
  }
  if (dateTo) {
    query = query.lte('created_at', dateTo + 'T23:59:59.999Z');
  }

  const from = (page - 1) * perPage;
  const to = from + perPage - 1;
  query = query.range(from, to);

  const { data, error, count } = await query;
  if (error) throw error;

  return { payments: data || [], total: count || 0 };
};

/**
 * Fetch ALL payments matching the given filters (no pagination) for CSV export.
 * Pages through results in chunks so large exports don't hit row caps.
 */
export const fetchAllPaymentsForExport = async ({ status, planType, dateFrom, dateTo } = {}) => {
  const chunk = 1000;
  let from = 0;
  let all = [];
  // eslint-disable-next-line no-constant-condition
  while (true) {
    let query = supabase
      .from('payments')
      .select(`
        *,
        profile:profiles!payments_user_id_fkey ( id, display_name, phone, tier )
      `)
      .order('created_at', { ascending: false });

    if (status && status !== 'all') query = query.eq('status', status);
    if (planType && planType !== 'all') query = query.eq('plan_type', planType);
    if (dateFrom) query = query.gte('created_at', dateFrom);
    if (dateTo) query = query.lte('created_at', dateTo + 'T23:59:59.999Z');

    const { data, error } = await query.range(from, from + chunk - 1);
    if (error) throw error;
    all = all.concat(data || []);
    if (!data || data.length < chunk) break;
    from += chunk;
  }
  return all;
};

/**
 * Delete payment history matching the given filters (admin only).
 * Requires the service-role client. Returns the number of rows deleted.
 * Guard: passing no filters deletes ALL payments (caller must confirm).
 */
export const deletePayments = async ({ status, planType, dateFrom, dateTo } = {}) => {
  if (!supabaseAdmin) throw new Error('Service Role Key required to clear payment history');

  let query = supabaseAdmin.from('payments').delete({ count: 'exact' });

  if (status && status !== 'all') query = query.eq('status', status);
  if (planType && planType !== 'all') query = query.eq('plan_type', planType);
  if (dateFrom) query = query.gte('created_at', dateFrom);
  if (dateTo) query = query.lte('created_at', dateTo + 'T23:59:59.999Z');

  // PostgREST requires a WHERE clause for DELETE; when no filters are set, use a
  // non-null id predicate so an unfiltered "clear all" is still expressed safely.
  if ((!status || status === 'all') && (!planType || planType === 'all') && !dateFrom && !dateTo) {
    query = query.not('id', 'is', null);
  }

  const { error, count } = await query;
  if (error) throw error;
  return count || 0;
};

/**
 * Fetch subscription history for a specific user
 */
export const fetchUserSubscriptionHistory = async (userId) => {
  const { data, error } = await supabase
    .from('subscriptions')
    .select('*')
    .eq('user_id', userId)
    .order('created_at', { ascending: false });

  if (error) throw error;
  return data || [];
};

/**
 * Fetch a user's queued / paused (previous) plans.
 */
export const fetchUserSubscriptionQueue = async (userId) => {
  const { data, error } = await supabase
    .from('subscription_queue')
    .select('*')
    .eq('user_id', userId)
    .in('status', ['paused', 'pending'])
    .order('created_at', { ascending: true });

  if (error) throw error;
  return data || [];
};

/**
 * Make a user FREE again (admin testing of the upgrade -> initial-distribution flow).
 * Strips premium, expires active/queued subscriptions, and clears the queue.
 * When resetDistribution = true, also resets distribution state + wallet so the
 * next upgrade re-shows the configured initial profiles from scratch.
 */
export const makeUserFree = async (userId, resetDistribution = false) => {
  if (!supabaseAdmin) throw new Error('Service Role Key required for Admin updates');
  const { data, error } = await supabaseAdmin.rpc('admin_make_user_free', {
    p_user_id: userId,
    p_reset_distribution: resetDistribution,
  });
  if (error) throw new Error(error.message || 'Failed to reset user to free');
  return data;
};

// ============================================================
// SUBSCRIPTION PLANS (Dynamic Distribution System)
// ============================================================

/**
 * Fetch all subscription plans from the new subscription_plans table
 */
export const fetchSubscriptionPlans = async () => {
  const { data, error } = await supabase
    .from('subscription_plans')
    .select('*')
    .order('price_inr', { ascending: true });

  if (error) throw error;
  return data || [];
};

/**
 * Update a subscription plan configuration
 */
export const updateSubscriptionPlan = async (tier, planData) => {
  const { error } = await supabase.rpc('update_subscription_plan', {
    p_tier: tier,
    p_plan_name: planData.plan_name ?? null,
    p_price_inr: planData.price ?? planData.price_inr ?? null,
    p_duration_months: planData.duration_months ?? null,
    p_contacts_limit: planData.contact_credits ?? planData.contacts_limit ?? null,
    p_interests_limit: planData.interest_credits ?? planData.interests_limit ?? null,
    p_initial_recommended_profiles: planData.initial_recommended_profiles ?? null,
    p_initial_nearby_profiles: planData.initial_nearby_profiles ?? null,
    p_initial_daily_profiles: planData.initial_daily_profiles ?? null,
    p_daily_recommended_increment: planData.daily_recommended_increment ?? null,
    p_daily_nearby_increment: planData.daily_nearby_increment ?? null,
    p_daily_profiles_increment: planData.daily_profiles_increment ?? null,
    p_features: planData.features ?? null,
    p_color_code: planData.color_code ?? null,
    p_is_popular: planData.is_popular ?? null,
  });

  if (error) throw error;
  return true;
};

/**
 * Fetch a user's distribution state — reads user_distribution_state, the table
 * the mobile feeds actually use (single source of truth). Falls back to the
 * legacy user_profile_distribution only if no row exists yet.
 */
export const fetchUserDistributionState = async (userId) => {
  const { data, error } = await supabase
    .from('user_distribution_state')
    .select('*')
    .eq('user_id', userId)
    .maybeSingle();

  if (error) throw error;
  return data;
};

/**
 * Fetch a user's wallet (credits)
 */
export const fetchUserWallet = async (userId) => {
  const { data, error } = await supabase
    .from('user_wallet')
    .select('*')
    .eq('user_id', userId)
    .maybeSingle();

  if (error) throw error;
  return data;
};

/**
 * Manually trigger daily distribution (calls the RPC)
 */
export const triggerDailyDistribution = async () => {
  const { data, error } = await supabase.rpc('run_daily_distribution');
  if (error) throw error;
  return data;
};
