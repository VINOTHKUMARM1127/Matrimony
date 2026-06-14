import supabase from './supabaseClient';
import supabaseAdmin from './supabaseAdminClient';

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
    // First mark all existing subscriptions as expired
    await supabaseAdmin
      .from('subscriptions')
      .update({ status: 'expired' })
      .eq('user_id', userId);

    // Reset premium flags and quotas on profile
    await supabaseAdmin
      .from('profiles')
      .update({ 
        tier: 'free',
        is_premium: false,
        contacts_remaining: 0,
        interests_remaining: 0,
        premium_expires_at: null
      })
      .eq('id', userId);
    return;
  }

  // Map plans to specification rules
  let duration = 28;
  let contacts = 0;
  let interests = 0;

  if (planType === 'silver') {
    contacts = 25; interests = 50; duration = 28;
  } else if (planType === 'gold') {
    contacts = 50; interests = 100; duration = 28;
  } else if (planType === 'platinum') {
    contacts = 100; interests = 300; duration = 168; // 6 months
  }

  // Call the secure backend RPC which handles stacking, dates, and quotas
  const { error } = await supabaseAdmin.rpc('purchase_subscription', {
    p_user_id: userId,
    p_plan_type: planType,
    p_duration_days: duration,
    p_contacts: contacts,
    p_interests: interests
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
 * Bulk upload users from JSON
 */
export const bulkUploadUsers = async (usersList) => {
  if (!supabaseAdmin) throw new Error('Service Role Key required for Auth updates');
  
  const results = {
    success: 0,
    failed: 0,
    errors: []
  };

  for (const user of usersList) {
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

      // 2. Insert Profile
      const { error: profileError } = await supabaseAdmin
        .from('profiles')
        .insert({
          id: newUserId,
          display_name: user.display_name || 'No Name',
          gender: user.gender || null,
          date_of_birth: user.date_of_birth || null,
          phone: user.phone || null,
          religion: user.religion || null,
          caste: user.caste || null,
          city: user.city || null,
          education: user.education || null,
          occupation: user.occupation || null,
          is_profile_complete: true,
          profile_completion_percent: 100
        });

      if (profileError) {
        // Cleanup auth user if profile insertion fails
        await fetch(`${import.meta.env.VITE_SUPABASE_URL}/auth/v1/admin/users/${newUserId}`, {
          method: 'DELETE',
          headers: {
            'apikey': serviceKey,
            'Authorization': `Bearer ${serviceKey}`
          }
        });
        throw profileError;
      }

      results.success++;
    } catch (err) {
      results.failed++;
      results.errors.push(`Failed for ${user.email}: ${err.message}`);
    }
  }

  return results;
};

/**
 * Fetch Admin Settings (Tier Settings)
 */
export const fetchAdminSettings = async () => {
  const { data, error } = await supabase
    .from('tier_settings')
    .select('*');
    
  if (error) throw error;
  
  // Format as key-value map for backwards compatibility
  const matches_limits = {};
  data.forEach(item => {
    // Note: React Admin uses 'non_premium' internally, but the DB uses 'free'
    const tierKey = item.tier === 'free' ? 'non_premium' : item.tier;
    matches_limits[tierKey] = {
      recommended: item.recommended_limit,
      nearby: item.nearby_limit,
      daily: item.daily_limit,
      dynamic_daily_updates: item.dynamic_daily_enabled
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
        p_dyn: limits.dynamic_daily_updates
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
            dynamic_daily_enabled: limits.dynamic_daily_updates
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
