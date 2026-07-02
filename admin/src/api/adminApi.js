import supabase from './supabaseClient';
import {
  buildProfilePayload,
  buildHoroscopePayload,
  buildPreferencePayload,
  buildFamilyPayload,
  buildLifestylePayload,
  PROFILE_INT_FIELDS,
  PREFERENCE_INT_FIELDS,
  LIFESTYLE_ARRAY_FIELDS,
  PREFERENCE_TEXT_FIELDS,
} from './profileFields';

/**
 * Check if the currently authenticated user is an admin.
 * Schema `admin_users` has NO email column. It maps by UUID (`id`).
 */
export const checkIsAdmin = async () => {
  const { data: { session } } = await supabase.auth.getSession();
  if (!session?.user) return false;

  const { data, error } = await supabase
    .from('admin_users')
    .select('role')
    .eq('id', session.user.id)
    .eq('is_active', true)
    .maybeSingle();
  
  if (error || !data) return false;
  return true;
};

/**
 * Fetch Admin Stats Overview
 */
export const fetchAdminStats = async () => {
  const { data, error } = await supabase
    .from('admin_stats_view')
    .select('*')
    .maybeSingle();
  if (error) throw error;
  return data;
};

/**
 * Fetch all users with their memberships and photos
 */
export const fetchAllUsers = async () => {
  const { data: profilesData, error } = await supabase
    .from('profiles')
    .select('*')
    .order('created_at', { ascending: false });

  if (error) throw error;
  
  let profiles = profilesData || [];
  
  if (profiles.length > 0) {
    const profileIds = profiles.map(p => p.id);
    
    // Fetch related data since there is no explicit FK from profiles to these tables
    const [{ data: photos }, { data: subs }] = await Promise.all([
      supabase.from('profile_photos').select('*').in('user_id', profileIds),
      supabase.from('user_subscriptions').select('*, membership_plans(*)').in('user_id', profileIds)
    ]);
    
    const photosByUserId = {};
    if (photos) {
      for (const photo of photos) {
        if (!photosByUserId[photo.user_id]) photosByUserId[photo.user_id] = [];
        photosByUserId[photo.user_id].push(photo);
      }
    }
    
    const subsByUserId = {};
    if (subs) {
      for (const sub of subs) {
        if (!subsByUserId[sub.user_id]) subsByUserId[sub.user_id] = [];
        subsByUserId[sub.user_id].push(sub);
      }
    }
    
    profiles = profiles.map(p => ({
      ...p,
      profile_photos: photosByUserId[p.id] || [],
      user_subscriptions: subsByUserId[p.id] || []
    }));
  }
  
  let mappedProfiles = profiles.map(p => ({ ...p, email: '' }));
  
  if (supabase) {
    try {
      // Get all auth users using Admin API
      const { data, error: authError } = await supabase.functions.invoke('admin-users', {
        body: { action: 'list_users', page: 1, perPage: 10000 }
      });
      const authData = data?.data;
      
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

  // Filter out admin users
  try {
    const { data: adminUsers } = await supabase.from('admin_users').select('id');
    if (adminUsers && adminUsers.length > 0) {
      const adminIds = adminUsers.map(a => a.id);
      return mappedProfiles.filter(p => !adminIds.includes(p.id));
    }
  } catch (err) {
    console.error('Failed to filter admins:', err);
  }

  return mappedProfiles;
};

/**
 * Update user premium plan (creates a subscription record)
 */
export const updateUserPlan = async (userId, planId) => {
  if (!supabase) throw new Error('Service Role Key required for Admin updates');

  if (!planId || planId === 'free' || planId === 'non_premium') {
    const { error } = await supabase.rpc('fn_admin_reset_user_to_free', {
      p_user_id: userId,
    });
    if (error) throw new Error(error.message || 'Failed to downgrade user to free');
    return;
  }

  const { error } = await supabase.rpc('fn_activate_or_queue_subscription', {
    p_user_id: userId,
    p_plan_id: planId,
    p_payment_id: null,
    p_amount_paid: 0,
  });

  if (error) throw new Error(error.message || 'Failed to update user plan');
};

/**
 * Reset User Password
 */
export const resetUserPassword = async (userId, newPassword) => {
  if (!supabase) throw new Error('Service Role Key required for Auth updates');
  
  const { data, error } = await supabase.functions.invoke('admin-users', {
    body: { action: 'update_user', id: userId, updates: { password: newPassword } }
  });

  if (error) throw new Error(error.message || 'Failed to reset password');
  return data;
};

import { deletePhotoFromR2 } from './imageApi';

/**
 * Delete a User
 */
export const deleteUser = async (userId) => {
  if (!supabase) throw new Error('Service Role Key required to delete user.');

  // 1. Clean up user photos from Cloudflare R2
  try {
    const { data: userPhotos } = await supabase.from('profile_photos').select('r2_key').eq('user_id', userId);
    if (userPhotos && userPhotos.length > 0) {
      for (const p of userPhotos) {
        if (p.r2_key) {
          await deletePhotoFromR2(p.r2_key).catch(err => console.warn('Failed to delete from R2:', err));
        }
      }
    }
  } catch (err) {
    console.warn('Error fetching photos for cleanup:', err);
  }
  
  // 2. Delete from Auth (GoTrue). Due to 'on delete cascade', this cleans up all tables!
  const { error: adminError } = await supabase.functions.invoke('admin-users', { body: { action: 'delete_user', id: userId } });
  
  if (adminError) {
    throw new Error(adminError.message || 'Failed to delete user via Admin API');
  }
  
  return true;
};

/**
 * Add Profile Photo
 */
export const addPhoto = async (userId, r2Key) => {
  if (!supabase) throw new Error('Service Role Key required');

  const { data, error } = await supabase
    .from('profile_photos')
    .insert({
      user_id: userId,
      r2_key: r2Key,
      is_primary: true,
      order_index: 0,
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
  if (!supabase) throw new Error('Service Role Key required');

  const { error } = await supabase
    .from('profile_photos')
    .delete()
    .eq('id', photoId);

  if (error) throw error;
  return true;
};

/**
 * Update User Profile
 */
export const updateUser = async (userId, profileData) => {
  if (!supabase) throw new Error('Service Role Key required for Admin updates');

  const { data, error } = await supabase
    .from('profiles')
    .update(profileData)
    .eq('id', userId)
    .select()
    .single();

  if (error) throw error;
  return data;
};

/**
 * Fetch a user's horoscope + partner preferences + family details (for the full editor).
 */
export const fetchUserRelations = async (userId) => {
  const [horo, prefs, family, lifestyle] = await Promise.all([
    supabase.from('user_horoscope').select('*').eq('user_id', userId).maybeSingle(),
    supabase.from('partner_preferences').select('*').eq('user_id', userId).maybeSingle(),
    supabase.from('user_family').select('*').eq('user_id', userId).maybeSingle(),
    supabase.from('user_lifestyle').select('*').eq('user_id', userId).maybeSingle(),
  ]);
  return {
    horoscope: horo.data || null,
    preferences: prefs.data || null,
    family: family.data || null,
    lifestyle: lifestyle.data || null,
  };
};

export const updateUserHoroscope = async (userId, horoscopeData) => {
  if (!supabase) throw new Error('Service Role Key required for Admin updates');
  const payload = buildHoroscopePayload(horoscopeData) || {};
  const { data, error } = await supabase
    .from('user_horoscope')
    .upsert({ user_id: userId, ...payload }, { onConflict: 'user_id' })
    .select()
    .single();
  if (error) throw error;
  return data;
};

export const updateUserPreferences = async (userId, preferenceData) => {
  if (!supabase) throw new Error('Service Role Key required for Admin updates');
  const payload = buildPreferencePayload(preferenceData) || {};
  const { data, error } = await supabase
    .from('partner_preferences')
    .upsert({ user_id: userId, ...payload }, { onConflict: 'user_id' })
    .select()
    .single();
  if (error) throw error;
  return data;
};

export const updateUserFamilyDetails = async (userId, familyData) => {
  if (!supabase) throw new Error('Service Role Key required for Admin updates');
  const payload = buildFamilyPayload(familyData) || {};
  const { data, error } = await supabase
    .from('user_family')
    .upsert({ user_id: userId, ...payload }, { onConflict: 'user_id' })
    .select()
    .single();
  if (error) throw error;
  return data;
};

export const updateUserLifestyle = async (userId, lifestyleData) => {
  if (!supabase) throw new Error('Service Role Key required for Admin updates');
  const payload = buildLifestylePayload(lifestyleData) || {};
  const { data, error } = await supabase
    .from('user_lifestyle')
    .upsert({ user_id: userId, ...payload }, { onConflict: 'user_id' })
    .select()
    .single();
  if (error) throw error;
  return data;
};

/**
 * Update membership quota balances directly (admin override).
 */
export const updateUserQuotas = async (userId, { contact_credits_remaining, interest_credits_remaining }) => {
  if (!supabase) throw new Error('Service Role Key required for Admin updates');
  
  const { error } = await supabase.rpc('fn_admin_reset_credits', {
    p_user_id: userId,
    p_contact_credits: parseInt(contact_credits_remaining, 10),
    p_interest_credits: parseInt(interest_credits_remaining, 10),
  });

  if (error) throw new Error(error.message || 'Failed to update quotas');
  return true;
};

export const bulkUploadUsers = async (usersList, stopRef, onProgress) => {
  if (!supabase) throw new Error('Service Role Key required for Auth updates');
  
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
      const { data, error: err } = await supabase.functions.invoke('admin-users', {
        body: {
          action: 'create_full_user',
          auth: { email: user.email, password: user.password, email_confirm: true },
          meta: { creating_for: user.creating_for || 'self', mother_tongue_id: user.mother_tongue_id || null },
          profile: buildProfilePayload(user),
          family: buildFamilyPayload(user),
          horoscope: buildHoroscopePayload(user),
          lifestyle: buildLifestylePayload(user),
          preferences: buildPreferencePayload(user),
          plan_id: user.plan_id && user.plan_id !== 'free' ? user.plan_id : null,
          photos: user.photos || []
        }
      });
      
      if (err) throw err;
      if (data?.error) throw new Error(data.error);

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
 * Fetch Admin Settings (Membership Plans + Distribution)
 */
export const fetchAdminSettings = async () => {
  const [{ data: plans, error: planErr }, { data: dist, error: distErr }] = await Promise.all([
    supabase.from('membership_plans').select('*').order('price', { ascending: true }),
    supabase.from('distribution_config').select('*'),
  ]);
    
  if (planErr) throw planErr;
  if (distErr) throw distErr;
  
  // Format as key-value map for backwards compatibility
  const matches_limits = {};
  (plans || []).forEach(plan => {
    const tierKey = plan.tier === 'free' ? 'non_premium' : plan.tier;
    const distRow = (dist || []).find(d => d.tier === plan.tier) || {};
    matches_limits[tierKey] = {
      plan_id: plan.id,
      plan_name: plan.name,
      tier: plan.tier,
      price: plan.price,
      validity_days: plan.duration_days,
      contacts_limit: plan.contact_credits,
      interests_limit: plan.interest_credits,
      initial_all_matches: distRow.all_matches_initial || 0,
      initial_new_profiles: distRow.daily_updates_initial || 0,
      daily_all_matches: distRow.all_matches_daily || 0,
      daily_new_profiles: distRow.daily_updates_daily || 0,
    };
  });
  
  return { matches_limits };
};

/**
 * Update Admin Setting
 */
export const updateAdminSetting = async (key, value) => {
  if (!supabase) throw new Error('Service Role Key required');
  
  if (key === 'matches_limits') {
    const promises = Object.entries(value).map(async ([tierKey, limits]) => {
      const tier = tierKey === 'non_premium' ? 'free' : tierKey;
      
      // Update membership_plans
      if (limits.plan_id) {
        await supabase
          .from('membership_plans')
          .update({
            name: limits.plan_name,
            price: limits.price,
            duration_days: limits.validity_days,
            contact_credits: limits.contacts_limit,
            interest_credits: limits.interests_limit,
          })
          .eq('id', limits.plan_id);
      }

      // Update distribution_config
      await supabase
        .from('distribution_config')
        .update({
          all_matches_initial: limits.initial_all_matches,
          all_matches_daily: limits.daily_all_matches,
          daily_updates_initial: limits.initial_new_profiles,
          daily_updates_daily: limits.daily_new_profiles,
        })
        .eq('tier', tier);
        
      return true;
    });
    
    await Promise.all(promises);
    return true;
  }
  return false;
};

/**
 * Bulk Delete Incomplete Users
 */
export const deleteIncompleteUsers = async () => {
  const allUsers = await fetchAllUsers();
  
  // Find all profiles where profile_completion_percent is 0 or full_name is null
  const incompleteProfiles = allUsers.filter(u => !u.full_name || u.profile_completion_percent === 0);

  if (!incompleteProfiles || incompleteProfiles.length === 0) return 0;

  let deletedCount = 0;
  
  for (const profile of incompleteProfiles) {
    try {
      if (supabase) {
        const { error: adminError } = await supabase.functions.invoke('admin-users', { body: { action: 'delete_user', id: profile.id } });
        if (!adminError) {
          deletedCount++;
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

export const fetchDistributionHistory = async (limit = 50) => {
  const { data, error } = await supabase
    .from('distribution_logs')
    .select('*')
    .order('triggered_at', { ascending: false })
    .limit(limit);

  if (error) throw error;
  return data || [];
};



export const manualPushToUsers = async (targetType, targetVal, allMatchesCount, dailyCount) => {
  // Push to all_matches
  const { data: d1, error: e1 } = await supabase.rpc('fn_admin_manual_push', {
    p_target_type: targetType,
    p_target_tier: targetType === 'tier' ? targetVal : null,
    p_target_user_id: targetType === 'user' ? targetVal : null,
    p_section: 'all_matches',
    p_count: allMatchesCount > 0 ? allMatchesCount : null
  });
  if (e1) throw new Error(e1.message || 'Failed to push manually');

  // Push to daily_updates
  const { data: d2, error: e2 } = await supabase.rpc('fn_admin_manual_push', {
    p_target_type: targetType,
    p_target_tier: targetType === 'tier' ? targetVal : null,
    p_target_user_id: targetType === 'user' ? targetVal : null,
    p_section: 'daily_updates',
    p_count: dailyCount > 0 ? dailyCount : null
  });
  if (e2) throw new Error(e2.message || 'Failed to push manually');

  return (d1 || 0) + (d2 || 0);
};



// ============================================================
// PAYMENT HISTORY & REVENUE
// ============================================================

export const fetchRevenueStats = async () => {
  const { data, error } = await supabase.from('revenue_summary').select('*').maybeSingle();
  if (error) throw error;
  
  // Format to match old RPC
  return {
    total_revenue: data?.total_revenue || 0,
    monthly_revenue: data?.monthly_revenue || 0,
    daily_revenue: data?.daily_revenue || 0,
  };
};

export const fetchPayments = async ({ page = 1, perPage = 25, status, planType, search, dateFrom, dateTo } = {}) => {
  let query = supabase
    .from('payments')
    .select(`
      *,
      profile:profiles!payments_user_id_fkey ( id, full_name ),
      membership_plans ( name, tier )
    `, { count: 'exact' })
    .order('created_at', { ascending: false });

  if (status && status !== 'all') {
    query = query.eq('status', status);
  }
  // No tier filter easily possible in PostgREST without advanced joins, so skipping for now
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

export const fetchAllPaymentsForExport = async ({ status, planType, dateFrom, dateTo } = {}) => {
  const { data, error } = await supabase
    .from('payments')
    .select(`
      *,
      profile:profiles!payments_user_id_fkey ( id, full_name ),
      membership_plans ( name, tier )
    `)
    .order('created_at', { ascending: false });
    
  if (error) throw error;
  return data || [];
};

export const deletePayments = async ({ status, planType, dateFrom, dateTo } = {}) => {
  if (!supabase) throw new Error('Service Role Key required to clear payment history');

  let query = supabase.from('payments').delete({ count: 'exact' });

  if (status && status !== 'all') query = query.eq('status', status);
  if (dateFrom) query = query.gte('created_at', dateFrom);
  if (dateTo) query = query.lte('created_at', dateTo + 'T23:59:59.999Z');

  if ((!status || status === 'all') && (!planType || planType === 'all') && !dateFrom && !dateTo) {
    query = query.not('id', 'is', null);
  }

  const { error, count } = await query;
  if (error) throw error;
  return count || 0;
};

export const markPaymentAsRefunded = async (paymentId) => {
  if (!supabase) throw new Error('Service Role Key required');
  const { error } = await supabase
    .from('payments')
    .update({ status: 'refunded' })
    .eq('id', paymentId);
  if (error) throw error;
  return true;
};

export const fetchUserSubscriptionHistory = async (userId) => {
  const { data, error } = await supabase
    .from('subscription_history')
    .select('*, membership_plans(*)')
    .eq('user_id', userId)
    .order('started_at', { ascending: false });

  if (error) throw error;
  return data || [];
};

export const fetchUserSubscriptionQueue = async (userId) => {
  const { data, error } = await supabase
    .from('subscription_queue')
    .select('*, membership_plans(*)')
    .eq('user_id', userId)
    .order('position', { ascending: true });

  if (error) throw error;
  return data || [];
};

export const makeUserFree = async (userId, resetDistribution = false) => {
  if (!supabase) throw new Error('Service Role Key required for Admin updates');
  const { data, error } = await supabase.rpc('fn_admin_reset_user_to_free', {
    p_user_id: userId,
  });
  if (error) throw new Error(error.message || 'Failed to reset user to free');
  return data;
};

export const fetchSubscriptionPlans = async () => {
  const { data: plans, error } = await supabase
    .from('membership_plans')
    .select('*')
    .order('price', { ascending: true });

  if (error) throw error;

  const { data: configs } = await supabase.from('distribution_config').select('*');

  return (plans || []).map(p => {
    const config = configs?.find(c => c.tier === p.tier) || {};
    return {
      ...p,
      name: p.tier,
      validity_days: p.duration_days || 0,
      contact_credits: p.contact_credits ?? 0,
      interest_credits: p.interest_credits ?? 0,
      price_inr: p.price,
      initial_recommended_profiles: config.all_matches_initial || 0,
      daily_recommended_increment: config.all_matches_daily || 0,
      initial_daily_profiles: config.daily_updates_initial || 0,
      daily_profiles_increment: config.daily_updates_daily || 0,
    };
  });
};

export const updateSubscriptionPlan = async (tierName, planData) => {
  if (!supabase) throw new Error('Service Role Key required for Admin updates');
  
  const { error } = await supabase
    .from('distribution_config')
    .upsert({
      tier: tierName,
      all_matches_initial: planData.initial_recommended_profiles,
      all_matches_daily: planData.daily_recommended_increment,
      daily_updates_initial: planData.initial_daily_profiles,
      daily_updates_daily: planData.daily_profiles_increment,
      updated_at: new Date().toISOString()
    });

  if (error) throw new Error(error.message || 'Failed to update distribution config');
  return true;
};

export const fetchUserDistributionState = async (userId) => {
  const { data, error } = await supabase
    .from('distributed_profiles')
    .select('*')
    .eq('user_id', userId)
    .order('distributed_at', { ascending: false });

  if (error) throw error;
  return data || [];
};

export const fetchUserWallet = async (userId) => {
  const { data: membership } = await supabase
    .from('user_subscriptions')
    .select('*')
    .eq('user_id', userId)
    .eq('is_active', true)
    .order('created_at', { ascending: false })
    .maybeSingle();

  const { data: contacts } = await supabase
    .from('contact_credit_transactions')
    .select('*')
    .eq('user_id', userId)
    .order('created_at', { ascending: false })
    .limit(25);

  const { data: interests } = await supabase
    .from('interest_credit_transactions')
    .select('*')
    .eq('user_id', userId)
    .order('created_at', { ascending: false })
    .limit(25);

  return {
    membership: membership || null,
    transactions: [...(contacts||[]), ...(interests||[])].sort((a,b) => new Date(b.created_at) - new Date(a.created_at)),
  };
};

export const triggerDailyDistribution = async () => {
  const { data, error } = await supabase.rpc('fn_run_daily_distribution');
  if (error) throw error;
  return data;
};
