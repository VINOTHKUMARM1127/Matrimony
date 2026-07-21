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
 * Fetch Master Lookup Data
 */
export const fetchMasterData = async () => {
  if (!supabase) return {};
  const [
    { data: religions },
    { data: castes },
    { data: sub_castes },
    { data: education_levels },
    { data: occupations },
    { data: countries },
    { data: states },
    { data: districts },
    { data: cities },
    { data: mother_tongues },
    { data: rasi },
    { data: nakshatra },
    { data: lagnam },
    { data: gothram },
    { data: membership_plans }
  ] = await Promise.all([
    supabase.from('religions').select('id, name').order('name'),
    supabase.from('castes').select('id, name, religion_id').order('name'),
    supabase.from('sub_castes').select('id, name, caste_id').order('name'),
    supabase.from('education_levels').select('id, name').order('name'),
    supabase.from('occupations').select('id, name').order('name'),
    supabase.from('countries').select('id, name').order('name'),
    supabase.from('states').select('id, name, country_id').order('name'),
    supabase.from('districts').select('id, name, state_id').order('name'),
    supabase.from('cities').select('id, name, district_id').order('name'),
    supabase.from('mother_tongues').select('id, name').order('name'),
    supabase.from('rasi').select('id, name').order('name'),
    supabase.from('nakshatra').select('id, name').order('name'),
    supabase.from('lagnam').select('id, name').order('name'),
    supabase.from('gothram').select('id, name').order('name'),
    supabase.from('membership_plans').select('id, tier')
  ]);
  
  return {
    religions: religions || [],
    castes: castes || [],
    sub_castes: sub_castes || [],
    education_levels: education_levels || [],
    occupations: occupations || [],
    countries: countries || [],
    states: states || [],
    districts: districts || [],
    cities: cities || [],
    mother_tongues: mother_tongues || [],
    rasi: rasi || [],
    nakshatra: nakshatra || [],
    lagnam: lagnam || [],
    gothram: gothram || [],
    membership_plans: membership_plans || [],
  };
};

/**
 * Fetch a single page of users via the server-side fn_admin_list_users RPC.
 * Replaces the old fetchAllUsers() waterfall of 5+ queries.
 * Returns { users: [...], total: number }
 */
export const fetchUsersPage = async ({ page = 1, perPage = 20, search = '', gender = '', tier = '', status = '' } = {}) => {
  const { data, error } = await supabase.rpc('fn_admin_list_users', {
    p_page: page,
    p_per_page: perPage,
    p_search: search || null,
    p_gender: gender || null,
    p_tier: tier || null,
    p_status: status || null
  });

  if (error) throw error;

  return {
    users: data?.users || [],
    total: data?.total || 0
  };
};

/**
 * Lightweight fetch of all profiles for CSV export only.
 * Joins profile_contact for phone. Email comes from auth via edge function.
 */
export const fetchAllUsers = async () => {
  const [{ data: profiles, error }, { data: contacts }, { data: adminUsers }] = await Promise.all([
    supabase.from('profiles').select('*').order('created_at', { ascending: false }),
    supabase.from('profile_contact').select('user_id, mobile_number'),
    supabase.from('admin_users').select('id')
  ]);

  if (error) throw error;

  const adminIds = new Set((adminUsers || []).map(a => a.id));
  const phoneLookup = {};
  if (contacts) contacts.forEach(c => phoneLookup[c.user_id] = c.mobile_number);

  // Try to get emails from auth (best effort — export still works without them)
  let emailLookup = {};
  try {
    const { data } = await supabase.functions.invoke('admin-users', {
      body: { action: 'list_users', page: 1, perPage: 10000 }
    });
    if (data?.data?.users) {
      data.data.users.forEach(u => emailLookup[u.id] = u.email);
    }
  } catch (err) {
    console.warn('Could not fetch auth emails for export:', err);
  }

  return (profiles || [])
    .filter(p => !adminIds.has(p.id))
    .map(p => ({ ...p, email: emailLookup[p.id] || '', phone: phoneLookup[p.id] || '' }));
};

/**
 * Update user premium plan (creates a subscription record)
 */
export const updateUserPlan = async (userId, planName) => {
  if (!supabase) throw new Error('Service Role Key required for Admin updates');

  if (!planName || planName === 'free' || planName === 'non_premium') {
    const { error } = await supabase.rpc('fn_admin_reset_user_to_free', {
      p_user_id: userId,
    });
    if (error) throw new Error(error.message || 'Failed to downgrade user to free');
    return;
  }

  // Look up the actual plan ID from membership_plans
  const { data: plan, error: planError } = await supabase
    .from('membership_plans')
    .select('id')
    .eq('tier', planName)
    .single();

  if (planError || !plan) {
    throw new Error('Invalid plan type selected or plan not found');
  }

  const { error } = await supabase.rpc('fn_activate_or_queue_subscription', {
    p_user_id: userId,
    p_plan_id: plan.id,
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

/**
 * Update User Phone Number
 */
export const updateUserPhone = async (userId, newPhone) => {
  if (!supabase) throw new Error('Service Role Key required for Auth updates');
  
  let formattedPhone = newPhone;
  if (newPhone) {
    formattedPhone = newPhone.length === 10 ? `+91${newPhone}` : newPhone;
    
    const { data, error: authError } = await supabase.functions.invoke('admin-users', {
      body: { action: 'update_user', id: userId, updates: { phone: formattedPhone } }
    });
    if (authError) throw new Error(authError.message || 'Failed to update auth phone');
    if (data?.error) throw new Error(data.error);
  }

  const { error: contactError } = await supabase
    .from('profile_contact')
    .upsert({ user_id: userId, mobile_number: formattedPhone }, { onConflict: 'user_id' });
    
  if (contactError) throw new Error(contactError.message || 'Failed to update profile contact');
  return true;
};

import { deletePhotoFromR2 } from './imageApi';

/**
 * Delete a User
 */
export const deleteUser = async (userId) => {
  if (!supabase) throw new Error('Service Role Key required to delete user.');

  // 1. Clean up user photos from Cloudflare R2
  try {
    const { data: userPhotos } = await supabase.from('profile_photos').select('id, r2_key').eq('user_id', userId);
    if (userPhotos && userPhotos.length > 0) {
      const deletePromises = userPhotos
        .filter(p => p.r2_key)
        .map(p => deletePhotoFromR2(p.id).catch(err => console.warn('Failed to delete from R2:', err)));
      await Promise.all(deletePromises);
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
 * Fetch all Profile Photos for a User
 */
export const fetchUserPhotos = async (userId) => {
  if (!supabase) throw new Error('Service Role Key required');
  const { data, error } = await supabase
    .from('profile_photos')
    .select('id, user_id, r2_key, thumbnail_key, is_primary, order_index')
    .eq('user_id', userId)
    .order('order_index', { ascending: true });
    
  if (error) {
    console.warn('Failed to fetch user photos:', error);
    return [];
  }
  return data || [];
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
    supabase.from('user_horoscope').select('*, rasi(name), nakshatra(name), lagnam(name), gothram(name)').eq('user_id', userId).maybeSingle(),
    supabase.from('partner_preferences').select('*').eq('user_id', userId).maybeSingle(),
    supabase.from('user_family').select('*').eq('user_id', userId).maybeSingle(),
    supabase.from('user_lifestyle').select('*').eq('user_id', userId).maybeSingle(),
  ]);

  if (horo.data) {
    horo.data.rasi_text = horo.data.rasi_text || horo.data.rasi?.name || '';
    horo.data.nakshatra_text = horo.data.nakshatra_text || horo.data.nakshatra?.name || '';
    horo.data.lagnam_text = horo.data.lagnam_text || horo.data.lagnam?.name || '';
    horo.data.gothram_text = horo.data.gothram_text || horo.data.gothram?.name || '';
  }

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

  const master = await fetchMasterData();

  const mapUserWithMasterData = (user) => {
    const mapped = { ...user };
    
    const findId = (array, name) => {
      if (!name || !array) return null;
      const item = array.find(a => a.name.toLowerCase() === String(name).toLowerCase());
      return item ? item.id : null;
    };

    if (user.religion) mapped.religion_id = findId(master.religions, user.religion);
    if (user.caste) mapped.caste_id = findId(master.castes, user.caste);
    if (user.subcaste) mapped.sub_caste_id = findId(master.sub_castes, user.subcaste);
    if (user.highest_qualification) mapped.education_level_id = findId(master.education_levels, user.highest_qualification);
    if (user.occupation) mapped.occupation_id = findId(master.occupations, user.occupation);
    if (user.country) mapped.country_id = findId(master.countries, user.country);
    if (user.state) mapped.state_id = findId(master.states, user.state);
    if (user.district) mapped.district_id = findId(master.districts, user.district);
    if (user.city) mapped.city_id = findId(master.cities, user.city);
    if (user.mother_tongue) mapped.mother_tongue_id = findId(master.mother_tongues, user.mother_tongue);
    if (user.education_detail) mapped.degree = user.education_detail;
    if (user.languages_known) mapped.languages = user.languages_known;
    if (user.number_of_brothers !== undefined) mapped.brothers_count = user.number_of_brothers;
    if (user.number_of_sisters !== undefined) mapped.sisters_count = user.number_of_sisters;

    if (user.horoscope) {
      mapped.horoscope = { ...user.horoscope };
      if (user.horoscope.rasi) {
        mapped.horoscope.rasi_id = findId(master.rasi, user.horoscope.rasi);
        mapped.horoscope.rasi_text = user.horoscope.rasi;
      }
      if (user.horoscope.nakshatra) {
        mapped.horoscope.nakshatra_id = findId(master.nakshatra, user.horoscope.nakshatra);
        mapped.horoscope.nakshatra_text = user.horoscope.nakshatra;
      }
      if (user.horoscope.lagnam) {
        mapped.horoscope.lagnam_id = findId(master.lagnam, user.horoscope.lagnam);
        mapped.horoscope.lagnam_text = user.horoscope.lagnam;
      }
      if (user.horoscope.gothram) {
        mapped.horoscope.gothram_id = findId(master.gothram, user.horoscope.gothram);
        mapped.horoscope.gothram_text = user.horoscope.gothram;
      }
    }

    if (user.preferences) {
      mapped.preferences = { ...user.preferences };
      const p = user.preferences;
      if (p.pref_religion && p.pref_religion.length > 0) mapped.preferences.religion_id = findId(master.religions, p.pref_religion[0]);
      if (p.pref_caste && p.pref_caste.length > 0) mapped.preferences.caste_id = findId(master.castes, p.pref_caste[0]);
      if (p.pref_education && p.pref_education.length > 0) mapped.preferences.education_level_id = findId(master.education_levels, p.pref_education[0]);
      if (p.pref_occupation && p.pref_occupation.length > 0) mapped.preferences.occupation_id = findId(master.occupations, p.pref_occupation[0]);
      if (p.pref_location && p.pref_location.length > 0) mapped.preferences.location_city_id = findId(master.cities, p.pref_location[0]);
      if (p.pref_age_min) mapped.preferences.min_age = p.pref_age_min;
      if (p.pref_age_max) mapped.preferences.max_age = p.pref_age_max;
      if (p.pref_height_min) mapped.preferences.min_height_cm = p.pref_height_min;
      if (p.pref_height_max) mapped.preferences.max_height_cm = p.pref_height_max;
      if (p.pref_marital_status && p.pref_marital_status.length > 0) mapped.preferences.marital_status = p.pref_marital_status[0];
      if (p.pref_food_habit && p.pref_food_habit.length > 0) mapped.preferences.food_habit = p.pref_food_habit[0];
    }
    
    // tier to plan_id handling
    if (user.tier && user.tier.toLowerCase() !== 'free') {
      const plan = master.membership_plans?.find(p => p.tier.toLowerCase() === user.tier.toLowerCase());
      mapped.plan_id = plan ? plan.id : null;
    } else {
      mapped.plan_id = null;
    }
    mapped.photos = user.profile_photos || [];

    return mapped;
  };

  let currentCount = 0;
  const batchSize = 5;

  for (let i = 0; i < usersList.length; i += batchSize) {
    if (stopRef && stopRef.current) {
      results.errors.push('Process stopped by admin.');
      break;
    }

    if (onProgress) onProgress(currentCount, usersList.length);

    const batch = usersList.slice(i, i + batchSize);

    await Promise.all(batch.map(async (rawUser) => {
      try {
        const user = mapUserWithMasterData(rawUser);
        const { data, error: err } = await supabase.functions.invoke('admin-users', {
          body: {
            action: 'create_full_user',
            auth: { email: user.email, password: user.password, email_confirm: true },
            meta: { creating_for: user.creating_for || 'self', mother_tongue_id: user.mother_tongue_id || null },
            profile: buildProfilePayload(user),
            family: buildFamilyPayload(user),
            horoscope: buildHoroscopePayload(user.horoscope || {}),
            lifestyle: buildLifestylePayload(user),
            preferences: buildPreferencePayload(user.preferences || {}),
            plan_id: user.plan_id && user.plan_id !== 'free' ? user.plan_id : null,
            photos: user.photos || []
          }
        });
        
        if (err) throw err;
        if (data?.error) throw new Error(data.error);

        results.success++;
      } catch (err) {
        results.failed++;
        results.errors.push(`Failed for ${rawUser.email || 'Unknown'}: ${err.message}`);
      }
    }));
    
    currentCount += batch.length;
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
 * Fetch pending/stuck auth users who have NO profile row.
 * These are users who started signup but never completed it.
 * Returns { users: [...], total: number }
 */
export const fetchPendingUsers = async ({ page = 1, perPage = 20, search = '' } = {}) => {
  const { data, error } = await supabase.rpc('fn_admin_list_pending_users', {
    p_page: page,
    p_per_page: perPage,
    p_search: search || null,
  });

  if (error) throw error;

  return {
    users: data?.users || [],
    total: data?.total || 0,
  };
};

/**
 * Bulk Delete ONLY abandoned signups (auth users with no profile, older than 15 min).
 * This is the SAFE replacement for the old deleteIncompleteUsers.
 * Never touches verified users with profiles — they are just new, not broken.
 */
export const deleteAbandonedUsers = async () => {
  // 1. Get IDs of abandoned auth users from the RPC
  const { data, error } = await supabase.rpc('fn_admin_get_abandoned_user_ids', {
    p_min_age_minutes: 15,
  });

  if (error) throw error;

  const ids = data?.ids || [];
  const total = data?.count || 0;

  if (total === 0) return 0;

  // 2. Delete each one via the edge function (which uses auth.admin.deleteUser)
  let deletedCount = 0;
  const batchSize = 5;

  for (let i = 0; i < ids.length; i += batchSize) {
    const batch = ids.slice(i, i + batchSize);
    await Promise.all(batch.map(async (id) => {
      try {
        const { error: adminError } = await supabase.functions.invoke('admin-users', {
          body: { action: 'delete_user', id },
        });
        if (!adminError) {
          deletedCount++;
        }
      } catch (err) {
        console.error(`Failed to delete abandoned user ${id}:`, err);
      }
    }));
  }

  return deletedCount;
};

/**
 * @deprecated Use deleteAbandonedUsers() instead.
 * Kept as alias for backward compat — now safely only targets abandoned signups.
 */
export const deleteIncompleteUsers = deleteAbandonedUsers;

// ============================================================
// DISTRIBUTION MANAGEMENT
// ============================================================

export const fetchDistributionHistory = async (limit = 50) => {
  const { data, error } = await supabase
    .from('distribution_logs')
    .select('*')
    .order('created_at', { ascending: false })
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
  const [{ data: adminStats }, { data: dailyStats }] = await Promise.all([
    supabase.from('admin_stats_view').select('total_revenue_paise, revenue_this_month_paise').maybeSingle(),
    supabase.from('revenue_summary').select('revenue_paise').eq('day', new Date().toISOString().split('T')[0]).maybeSingle()
  ]);

  const [{ count: successCount }, { count: failedCount }, { count: refundCount }, { data: successPayments }] = await Promise.all([
    supabase.from('payments').select('*', { count: 'exact', head: true }).eq('status', 'success'),
    supabase.from('payments').select('*', { count: 'exact', head: true }).eq('status', 'failed'),
    supabase.from('payments').select('*', { count: 'exact', head: true }).eq('status', 'refunded'),
    supabase.from('payments').select('amount_paise, membership_plans(tier)').eq('status', 'success')
  ]);

  const planRevenueMap = {};
  (successPayments || []).forEach(p => {
    const tier = p.membership_plans?.tier || 'unknown';
    if (!planRevenueMap[tier]) planRevenueMap[tier] = { tier, revenue: 0, count: 0 };
    planRevenueMap[tier].revenue += (p.amount_paise / 100);
    planRevenueMap[tier].count += 1;
  });

  return {
    total_revenue: (adminStats?.total_revenue_paise || 0) / 100,
    monthly_revenue: (adminStats?.revenue_this_month_paise || 0) / 100,
    today_revenue: (dailyStats?.revenue_paise || 0) / 100,
    success_count: successCount || 0,
    failed_count: failedCount || 0,
    refund_count: refundCount || 0,
    plan_revenue: Object.values(planRevenueMap),
  };
};

export const fetchPayments = async ({ page = 1, perPage = 25, status, planType, search, dateFrom, dateTo } = {}) => {
  let query = supabase
    .from('payments')
    .select('*', { count: 'exact' })
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
  
  let payments = data || [];
  
  if (payments.length > 0) {
    const userIds = [...new Set(payments.map(p => p.user_id).filter(Boolean))];
    const planIds = [...new Set(payments.map(p => p.plan_id).filter(Boolean))];
    
    const [ { data: profilesData }, { data: plansData } ] = await Promise.all([
      userIds.length > 0 ? supabase.from('profiles').select('id, full_name').in('id', userIds) : { data: [] },
      planIds.length > 0 ? supabase.from('membership_plans').select('id, name, tier').in('id', planIds) : { data: [] }
    ]);
    
    const profileLookup = (profilesData || []).reduce((acc, p) => ({ ...acc, [p.id]: p }), {});
    const planLookup = (plansData || []).reduce((acc, p) => ({ ...acc, [p.id]: p }), {});
    
    payments = payments.map(p => ({
      ...p,
      profile: profileLookup[p.user_id] || null,
      membership_plans: planLookup[p.plan_id] || null
    }));
  }

  return { payments, total: count || 0 };
};

export const fetchAllPaymentsForExport = async ({ status, planType, dateFrom, dateTo } = {}) => {
  const { data, error } = await supabase
    .from('payments')
    .select('*')
    .order('created_at', { ascending: false });
    
  if (error) throw error;
  
  let payments = data || [];
  
  if (payments.length > 0) {
    const userIds = [...new Set(payments.map(p => p.user_id).filter(Boolean))];
    const planIds = [...new Set(payments.map(p => p.plan_id).filter(Boolean))];
    
    const profileLookup = {};
    const planLookup = {};
    
    const chunkSize = 200;
    for (let i = 0; i < userIds.length; i += chunkSize) {
      const chunk = userIds.slice(i, i + chunkSize);
      const { data: pData } = await supabase.from('profiles').select('id, full_name').in('id', chunk);
      if (pData) pData.forEach(p => profileLookup[p.id] = p);
    }
    
    if (planIds.length > 0) {
      const { data: plansData } = await supabase.from('membership_plans').select('id, name, tier').in('id', planIds);
      if (plansData) plansData.forEach(p => planLookup[p.id] = p);
    }
    
    payments = payments.map(p => ({
      ...p,
      profile: profileLookup[p.user_id] || null,
      membership_plans: planLookup[p.plan_id] || null
    }));
  }
  
  return payments;
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
  
  const { error: distError } = await supabase
    .from('distribution_config')
    .upsert({
      tier: tierName,
      all_matches_initial: planData.initial_recommended_profiles,
      all_matches_daily: planData.daily_recommended_increment,
      daily_updates_initial: planData.initial_daily_profiles,
      daily_updates_daily: planData.daily_profiles_increment,
      updated_at: new Date().toISOString()
    });

  if (distError) throw new Error(distError.message || 'Failed to update distribution config');

  const { error: planError } = await supabase
    .from('membership_plans')
    .update({
      price: planData.price_inr,
      duration_days: planData.validity_days,
      contact_credits: planData.contact_credits,
      interest_credits: planData.interest_credits
    })
    .eq('tier', tierName);

  if (planError) throw new Error(planError.message || 'Failed to update membership plans');

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
