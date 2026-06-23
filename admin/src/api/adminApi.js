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
 * Fetch all users with their memberships and photos
 */
export const fetchAllUsers = async () => {
  const { data: profiles, error } = await supabase
    .from('profiles')
    .select(`
      *,
      profile_photos(*),
      user_memberships(*)
    `)
    .order('updated_at', { ascending: false });

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
    const { error } = await supabaseAdmin.rpc('admin_make_user_free', {
      p_user_id: userId,
      p_reset_distribution: false,
    });
    if (error) throw new Error(error.message || 'Failed to downgrade user to free');
    return;
  }

  const { error } = await supabaseAdmin.rpc('purchase_subscription', {
    p_user_id: userId,
    p_plan_type: planType,
    p_payment_id: 'Admin_Upgrade',
    p_amount: 0,
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
    const { data: userPhotos } = await supabaseAdmin.from('profile_photos').select('photo_url').eq('user_id', userId);
    if (userPhotos && userPhotos.length > 0) {
      for (const p of userPhotos) {
        if (p.photo_url) {
          await deletePhotoFromR2(p.photo_url).catch(err => console.warn('Failed to delete from R2:', err));
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
    .from('profile_photos')
    .insert({
      user_id: userId,
      photo_url: publicUrl,
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
 * Fetch a user's horoscope + partner preferences + family details (for the full editor).
 */
export const fetchUserRelations = async (userId) => {
  const [horo, prefs, family] = await Promise.all([
    supabaseAdmin.from('horoscope_details').select('*').eq('user_id', userId).maybeSingle(),
    supabaseAdmin.from('partner_preferences').select('*').eq('user_id', userId).maybeSingle(),
    supabaseAdmin.from('family_details').select('*').eq('user_id', userId).maybeSingle(),
  ]);
  return {
    horoscope: horo.data || null,
    preferences: prefs.data || null,
    family: family.data || null,
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
 * Upsert a user's family details (admin editor).
 */
export const updateUserFamilyDetails = async (userId, familyData) => {
  if (!supabaseAdmin) throw new Error('Service Role Key required for Admin updates');
  const { data, error } = await supabaseAdmin
    .from('family_details')
    .upsert({ user_id: userId, ...familyData }, { onConflict: 'user_id' })
    .select()
    .single();
  if (error) throw error;
  return data;
};

/**
 * Update membership quota balances directly (admin override).
 */
export const updateUserQuotas = async (userId, { contact_credits_remaining, interest_credits_remaining, expiry_date }) => {
  if (!supabaseAdmin) throw new Error('Service Role Key required for Admin updates');
  
  // Find user's active membership
  const { data: activeMembership } = await supabaseAdmin
    .from('user_memberships')
    .select('id')
    .eq('user_id', userId)
    .eq('status', 'active')
    .order('created_at', { ascending: false })
    .maybeSingle();

  if (!activeMembership) throw new Error('No active membership found');

  const patch = {};
  if (contact_credits_remaining !== undefined) patch.contact_credits_remaining = parseInt(contact_credits_remaining, 10) || 0;
  if (interest_credits_remaining !== undefined) patch.interest_credits_remaining = parseInt(interest_credits_remaining, 10) || 0;
  if (expiry_date !== undefined) patch.expiry_date = expiry_date || null;

  const { data, error } = await supabaseAdmin
    .from('user_memberships')
    .update(patch)
    .eq('id', activeMembership.id)
    .select()
    .single();
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

      // 2. Create users table row
      const { error: usersError } = await supabaseAdmin
        .from('users')
        .upsert({
          id: newUserId,
          email: user.email,
          phone: user.phone || null,
          creating_for: user.creating_for || 'self',
          mother_tongue: user.mother_tongue || 'Tamil',
        }, { onConflict: 'id' });
      if (usersError) console.warn('Users table upsert warning:', usersError.message);

      // 3. Update Profile
      const profilePayload = buildProfilePayload(user);
      const { error: profileError } = await supabaseAdmin
        .from('profiles')
        .upsert({
          id: newUserId,
          ...profilePayload,
          profile_completion: 100,
          is_active: true,
        }, { onConflict: 'id' });

      if (profileError) {
        // Cleanup auth user if profile update fails
        await fetch(`${import.meta.env.VITE_SUPABASE_URL}/auth/v1/admin/users/${newUserId}`, {
          method: 'DELETE',
          headers: { 'apikey': serviceKey, 'Authorization': `Bearer ${serviceKey}` }
        });
        throw profileError;
      }

      // 4. Family Details (optional)
      if (user.father_name || user.mother_name || user.family_type) {
        const { error: famErr } = await supabaseAdmin
          .from('family_details')
          .upsert({
            user_id: newUserId,
            father_name: user.father_name || null,
            mother_name: user.mother_name || null,
            family_type: user.family_type || null,
            family_status: user.family_status || null,
            family_values: user.family_values || null,
            number_of_brothers: parseInt(user.number_of_brothers) || 0,
            number_of_sisters: parseInt(user.number_of_sisters) || 0,
          }, { onConflict: 'user_id' });
        if (famErr) results.errors.push(`Family warning for ${user.email}: ${famErr.message}`);
      }

      // 5. Horoscope (optional)
      const horoscope = buildHoroscopePayload(user.horoscope || user);
      if (horoscope) {
        const { error: hErr } = await supabaseAdmin
          .from('horoscope_details')
          .upsert({ user_id: newUserId, ...horoscope }, { onConflict: 'user_id' });
        if (hErr) results.errors.push(`Horoscope warning for ${user.email}: ${hErr.message}`);
      }

      // 6. Partner preferences (optional)
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

      // 7. Subscription (optional)
      if (user.plan_type && user.plan_type !== 'free') {
        const { error: sErr } = await supabaseAdmin.rpc('purchase_subscription', {
          p_user_id: newUserId, p_plan_type: user.plan_type, p_payment_id: 'bulk_import', p_amount: null
        });
        if (sErr) results.errors.push(`Plan warning for ${user.email}: ${sErr.message}`);
      }

      // 8. Photos (optional)
      if (Array.isArray(user.photos) && user.photos.length > 0) {
        const rows = user.photos.map((url, i) => ({
          user_id: newUserId,
          photo_url: typeof url === 'string' ? url : url.photo_url,
          is_primary: i === 0,
          display_order: i,
        }));
        const { error: phErr } = await supabaseAdmin.from('profile_photos').insert(rows);
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
 * Fetch Admin Settings (Membership Plans + Distribution)
 */
export const fetchAdminSettings = async () => {
  const [{ data: plans, error: planErr }, { data: dist, error: distErr }] = await Promise.all([
    supabase.from('membership_plans').select('*').order('price_inr', { ascending: true }),
    supabase.from('profile_distribution').select('*'),
  ]);
    
  if (planErr) throw planErr;
  if (distErr) throw distErr;
  
  // Format as key-value map for backwards compatibility
  const matches_limits = {};
  (plans || []).forEach(plan => {
    const tierKey = plan.name === 'free' ? 'non_premium' : plan.name;
    const distRow = (dist || []).find(d => d.tier === plan.name) || {};
    matches_limits[tierKey] = {
      plan_name: plan.name,
      price_inr: plan.price_inr,
      validity_days: plan.validity_days,
      contacts_limit: plan.contact_credits,
      interests_limit: plan.interest_credits,
      initial_all_matches: distRow.initial_all_matches || 0,
      initial_new_profiles: distRow.initial_new_profiles || 0,
      daily_all_matches: distRow.daily_all_matches || 0,
      daily_new_profiles: distRow.daily_new_profiles || 0,
    };
  });
  
  return { matches_limits };
};

/**
 * Update Admin Setting
 */
export const updateAdminSetting = async (key, value) => {
  if (key === 'matches_limits') {
    const promises = Object.entries(value).map(async ([tierKey, limits]) => {
      const tier = tierKey === 'non_premium' ? 'free' : tierKey;
      const { error: rpcError } = await supabase.rpc('update_subscription_plan', {
        p_tier: tier,
        p_plan_name: limits.plan_name ?? null,
        p_price_inr: limits.price_inr ?? null,
        p_duration_months: limits.duration_months ?? null,
        p_contacts_limit: limits.contacts_limit ?? null,
        p_interests_limit: limits.interests_limit ?? null,
        p_initial_recommended_profiles: limits.initial_all_matches ?? null,
        p_initial_nearby_profiles: limits.initial_new_profiles ?? null,
        p_daily_recommended_profiles: limits.daily_all_matches ?? null,
        p_daily_nearby_profiles: limits.daily_new_profiles ?? null,
        p_features: limits.features ?? null,
      });

      if (rpcError) {
        console.warn(`RPC update_subscription_plan failed for tier ${tier}:`, rpcError.message);
        
        if (!supabaseAdmin) throw new Error('Service Role Key required to update settings without RPC.');
        
        // Fallback: Update both tables directly
        await supabaseAdmin
          .from('membership_plans')
          .update({
            price_inr: limits.price_inr,
            validity_days: limits.validity_days,
            contact_credits: limits.contacts_limit,
            interest_credits: limits.interests_limit,
          })
          .eq('name', tier);

        await supabaseAdmin
          .from('profile_distribution')
          .update({
            initial_all_matches: limits.initial_all_matches,
            initial_new_profiles: limits.initial_new_profiles,
            daily_all_matches: limits.daily_all_matches,
            daily_new_profiles: limits.daily_new_profiles,
          })
          .eq('tier', tier);
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
 */
export const deleteIncompleteUsers = async () => {
  const allUsers = await fetchAllUsers();
  
  // Find all profiles where profile_completion is 0 or name is null
  const incompleteProfiles = allUsers.filter(u => !u.name || u.profile_completion === 0);

  if (!incompleteProfiles || incompleteProfiles.length === 0) return 0;

  let deletedCount = 0;
  
  for (const profile of incompleteProfiles) {
    try {
      const { error: deleteError } = await supabase.rpc('delete_auth_user', { target_user_id: profile.id });
      
      if (!deleteError) {
        deletedCount++;
      } else {
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
export const saveDistributionChange = async (tier, settings, pushMode, adminEmail) => {
  // Log to history
  const { error } = await supabase
    .from('distribution_settings_history')
    .insert({
      tier,
      settings,
      changed_by: adminEmail,
      push_mode: pushMode,
    });

  if (error) throw error;
  return true;
};

/**
 * Force push distribution for a specific tier
 */
export const forcePushDistribution = async (tier, adminEmail) => {
  // Get all active users of this tier and distribute
  const { data: memberships } = await supabase
    .from('user_memberships')
    .select('user_id')
    .eq('tier', tier)
    .eq('status', 'active');

  if (!memberships || memberships.length === 0) return { distributed: 0 };

  const { data: dist } = await supabase
    .from('profile_distribution')
    .select('*')
    .eq('tier', tier)
    .maybeSingle();

  if (!dist) return { distributed: 0 };

  let count = 0;
  for (const m of memberships) {
    await supabase.rpc('distribute_profiles_for_user', {
      p_user_id: m.user_id,
      p_total_count: dist.daily_all_matches,
      p_section: 'daily_updates',
    });
    count++;
  }

  // Log to history
  await saveDistributionChange(tier, dist, 'force_push', adminEmail);
  return { distributed: count };
};

/**
 * Force push distribution for all tiers
 */
export const forcePushAllDistribution = async (adminEmail) => {
  const tiers = ['free', 'silver', 'gold', 'platinum'];
  let totalDistributed = 0;
  
  for (const tier of tiers) {
    const result = await forcePushDistribution(tier, adminEmail);
    totalDistributed += result.distributed;
  }

  return { distributed: totalDistributed };
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
 * Fetch paginated purchase history with filters
 */
export const fetchPayments = async ({ page = 1, perPage = 25, status, planType, search, dateFrom, dateTo } = {}) => {
  let query = supabase
    .from('purchase_history')
    .select(`
      *,
      profile:profiles!purchase_history_user_id_fkey (
        id, name
      )
    `, { count: 'exact' })
    .order('purchased_at', { ascending: false });

  if (status && status !== 'all') {
    query = query.eq('payment_status', status);
  }
  if (planType && planType !== 'all') {
    query = query.eq('tier', planType);
  }
  if (dateFrom) {
    query = query.gte('purchased_at', dateFrom);
  }
  if (dateTo) {
    query = query.lte('purchased_at', dateTo + 'T23:59:59.999Z');
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
 */
export const fetchAllPaymentsForExport = async ({ status, planType, dateFrom, dateTo } = {}) => {
  const chunk = 1000;
  let from = 0;
  let all = [];
  // eslint-disable-next-line no-constant-condition
  while (true) {
    let query = supabase
      .from('purchase_history')
      .select(`
        *,
        profile:profiles!purchase_history_user_id_fkey ( id, name )
      `)
      .order('purchased_at', { ascending: false });

    if (status && status !== 'all') query = query.eq('payment_status', status);
    if (planType && planType !== 'all') query = query.eq('tier', planType);
    if (dateFrom) query = query.gte('purchased_at', dateFrom);
    if (dateTo) query = query.lte('purchased_at', dateTo + 'T23:59:59.999Z');

    const { data, error } = await query.range(from, from + chunk - 1);
    if (error) throw error;
    all = all.concat(data || []);
    if (!data || data.length < chunk) break;
    from += chunk;
  }
  return all;
};

/**
 * Delete purchase history matching the given filters (admin only).
 */
export const deletePayments = async ({ status, planType, dateFrom, dateTo } = {}) => {
  if (!supabaseAdmin) throw new Error('Service Role Key required to clear payment history');

  let query = supabaseAdmin.from('purchase_history').delete({ count: 'exact' });

  if (status && status !== 'all') query = query.eq('payment_status', status);
  if (planType && planType !== 'all') query = query.eq('tier', planType);
  if (dateFrom) query = query.gte('purchased_at', dateFrom);
  if (dateTo) query = query.lte('purchased_at', dateTo + 'T23:59:59.999Z');

  if ((!status || status === 'all') && (!planType || planType === 'all') && !dateFrom && !dateTo) {
    query = query.not('id', 'is', null);
  }

  const { error, count } = await query;
  if (error) throw error;
  return count || 0;
};

/**
 * Mark a successful payment as refunded
 */
export const markPaymentAsRefunded = async (paymentId) => {
  if (!supabaseAdmin) throw new Error('Service Role Key required');
  const { error } = await supabaseAdmin
    .from('purchase_history')
    .update({ payment_status: 'refunded' })
    .eq('id', paymentId);
  if (error) throw error;
  return true;
};

/**
 * Fetch subscription history for a specific user
 */
export const fetchUserSubscriptionHistory = async (userId) => {
  const { data, error } = await supabase
    .from('user_memberships')
    .select('*, membership_plans(*)')
    .eq('user_id', userId)
    .order('created_at', { ascending: false });

  if (error) throw error;
  return data || [];
};

/**
 * Fetch a user's queued plans
 */
export const fetchUserSubscriptionQueue = async (userId) => {
  const { data, error } = await supabase
    .from('user_memberships')
    .select('*, membership_plans(*)')
    .eq('user_id', userId)
    .eq('status', 'queued')
    .order('created_at', { ascending: true });

  if (error) throw error;
  return data || [];
};

/**
 * Make a user FREE again
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
 * Fetch all subscription plans.
 *
 * Reads the CANONICAL `subscription_plans` table — the exact same table the
 * mobile feed RPCs (get_user_quota / get_recommended_profiles / get_daily_matches)
 * read their per-tier limits from. Editing here therefore changes what users see.
 * Columns are aliased to the names PremiumSettings.jsx / DistributionManager.jsx expect.
 */
export const fetchSubscriptionPlans = async () => {
  const { data, error } = await supabase
    .from('subscription_plans')
    .select('*')
    .order('price_inr', { ascending: true });

  if (error) throw error;

  return (data || []).map(p => ({
    ...p,
    // PremiumSettings keys plans by `name` and matches TIERS ids (lowercase tier).
    name: p.tier,
    // UI works in days; the table stores duration in months.
    validity_days: (p.duration_months || 0) * 30,
    // Credit aliases for the UI.
    contact_credits: p.contacts_limit ?? 0,
    interest_credits: p.interests_limit ?? 0,
    // The remaining feed-limit columns already exist verbatim on subscription_plans:
    //   initial_recommended_profiles, initial_nearby_profiles, initial_daily_profiles,
    //   daily_recommended_increment, daily_nearby_increment, daily_profiles_increment,
    //   color_code, is_popular, features, price_inr, tier
  }));
};

/**
 * Update a subscription plan configuration.
 *
 * Routes through the SECURITY DEFINER `update_subscription_plan` RPC, which writes
 * the CANONICAL `subscription_plans` table the feeds read. NULL params are ignored
 * (COALESCE-preserved) by the RPC, so only provided fields change.
 */
export const updateSubscriptionPlan = async (tier, planData) => {
  const toInt = (v) =>
    v === '' || v === null || v === undefined || Number.isNaN(Number(v))
      ? null
      : parseInt(v, 10);

  // UI edits validity in days; the table stores months.
  const durationMonths =
    planData.validity_days != null && planData.validity_days !== ''
      ? Math.max(0, Math.round(Number(planData.validity_days) / 30))
      : (toInt(planData.duration_months));

  const { error } = await supabase.rpc('update_subscription_plan', {
    p_tier: tier.toLowerCase(),
    p_plan_name: planData.plan_name ?? null, // keep the pretty cased name (e.g. "Silver")
    p_price_inr: toInt(planData.price_inr ?? planData.price),
    p_duration_months: durationMonths,
    p_contacts_limit: toInt(planData.contact_credits ?? planData.contacts_limit),
    p_interests_limit: toInt(planData.interest_credits ?? planData.interests_limit),
    p_initial_recommended_profiles: toInt(planData.initial_recommended_profiles),
    p_initial_nearby_profiles: toInt(planData.initial_nearby_profiles),
    p_initial_daily_profiles: toInt(planData.initial_daily_profiles),
    p_daily_recommended_increment: toInt(planData.daily_recommended_increment),
    p_daily_nearby_increment: toInt(planData.daily_nearby_increment),
    p_daily_profiles_increment: toInt(planData.daily_profiles_increment),
    p_features: planData.features ?? null,
    p_color_code: planData.color_code ?? null,
    p_is_popular: typeof planData.is_popular === 'boolean' ? planData.is_popular : null,
  });

  if (error) throw error;
  return true;
};

/**
 * Fetch a user's distribution pool
 */
export const fetchUserDistributionState = async (userId) => {
  const { data, error } = await supabase
    .from('user_profile_pool')
    .select('*')
    .eq('user_id', userId)
    .order('added_at', { ascending: false });

  if (error) throw error;
  return data || [];
};

/**
 * Fetch a user's credit transactions
 */
export const fetchUserWallet = async (userId) => {
  const { data: membership } = await supabase
    .from('user_memberships')
    .select('*')
    .eq('user_id', userId)
    .eq('status', 'active')
    .order('created_at', { ascending: false })
    .maybeSingle();

  const { data: transactions } = await supabase
    .from('credit_transactions')
    .select('*')
    .eq('user_id', userId)
    .order('created_at', { ascending: false })
    .limit(50);

  return {
    membership: membership || null,
    transactions: transactions || [],
  };
};

/**
 * Manually trigger daily distribution (calls the RPC)
 */
export const triggerDailyDistribution = async () => {
  const { data, error } = await supabase.rpc('run_daily_distribution');
  if (error) throw error;
  return data;
};



export const manualPushToUsers = async (targetType, targetVal, allMatchesCount, dailyCount) => {
  const { data, error } = await supabase.rpc('manual_push_to_users', {
    p_target_type: targetType,
    p_target_val: targetVal,
    p_all_matches_count: allMatchesCount,
    p_daily_count: dailyCount
  });
  if (error) throw new Error(error.message || 'Failed to push manually');
  return data;
};

