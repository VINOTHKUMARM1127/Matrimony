/**
 * Wedring Matrimony — Profiles API
 * Profile CRUD operations via Supabase
 *
 * SCHEMA NOTES (new Supabase schema):
 * - `profiles` — core profile table (full_name, dob, religion_id, caste_id, etc.)
 * - `user_horoscope` — horoscope details (rasi_id, nakshatra_id, lagnam_id, gothram_id)
 * - `user_family` — family details (father_name, brothers_count, sisters_count)
 * - `user_lifestyle` — lifestyle (food_habit, languages, hobbies, interests)
 * - `partner_preferences` — partner preferences (min_age, max_age, etc.)
 * - `profile_photos` — photos (r2_key, thumbnail_key, order_index, is_primary)
 * - `user_subscriptions` — active subscription
 * - `registration_meta` — creating_for, mother_tongue_id
 * - `profile_contact` — mobile_number (credit-gated)
 */
import supabase from './supabaseClient';
import { PAGE_SIZE } from '../utils/constants';
import { processAndUploadPhoto } from '../services/imageProcessor';

const R2_PUBLIC_URL = process.env.EXPO_PUBLIC_R2_PUBLIC_URL || '';

/**
 * Construct a displayable URL from an R2 key.
 * @param {string} r2Key — e.g. "photos/uuid/file.jpg"
 * @returns {string} — full public URL
 */
export const getR2PhotoUrl = (r2Key) => {
  if (!r2Key) return null;
  // If it's already a full URL (legacy data), return as-is
  if (r2Key.startsWith('http')) return r2Key;
  return `${R2_PUBLIC_URL}/${r2Key}`;
};

/**
 * Get primary photo URL from a profile object
 * @param {object} profile - Profile object containing profile_photos
 * @returns {string|null} - Primary photo URL or null
 */
export const getPrimaryPhotoUrl = (profile) => {
  const photos = profile?.profile_photos || [];
  const primary = photos.find(p => p.is_primary) || photos[0];
  return primary?.photo_url || primary?.thumbnail_url || null;
};

/**
 * Get current user's profile with all relations
 */
export const getMyProfile = async (userId) => {
  const { data, error } = await supabase
    .from('profiles')
    .select(`
      *,
      cities ( name ),
      districts ( name ),
      education_levels ( name ),
      occupations ( name ),
      religions ( name ),
      castes ( name )
    `)
    .eq('id', userId)
    .maybeSingle();

  if (error) throw error;
  if (!data) return null;
  
  // Fetch relations separately since they all reference auth.users(id), not profiles(id)
  const [
    { data: photos },
    { data: subscriptions },
    { data: preferences },
    { data: horoscope },
    { data: family },
    { data: lifestyle },
    { data: meta }
  ] = await Promise.all([
    supabase.from('profile_photos').select('*').eq('user_id', userId),
    supabase.from('user_subscriptions').select('*, membership_plans:plan_id (*)').eq('user_id', userId),
    supabase.from('partner_preferences').select('*').eq('user_id', userId).maybeSingle(),
    supabase.from('user_horoscope').select('*').eq('user_id', userId).maybeSingle(),
    supabase.from('user_family').select('*').eq('user_id', userId).maybeSingle(),
    supabase.from('user_lifestyle').select('*').eq('user_id', userId).maybeSingle(),
    supabase.from('registration_meta').select('*').eq('user_id', userId).maybeSingle(),
  ]);

  const profile = {
    ...data,
    city: data.cities?.name || '',
    district: data.districts?.name || '',
    highest_qualification: data.education_levels?.name || '',
    education: data.education_levels?.name || '',
    occupation: data.occupations?.name || '',
    religion: data.religions?.name || '',
    caste: data.castes?.name || '',
    profile_photos: photos || [],
    user_subscriptions: subscriptions || [],
    partner_preferences: preferences || null,
    user_horoscope: horoscope || null,
    user_family: family || null,
    user_lifestyle: lifestyle || null,
    registration_meta: meta || null,
  };
  
  if (profile.profile_photos) {
    profile.profile_photos = profile.profile_photos.map(p => ({
      ...p,
      photo_url: getR2PhotoUrl(p.r2_key)
    }));
  }
  
  return profile;
};

/**
 * Get a user's public profile
 */
export const getProfile = async (profileId) => {
  const { data, error } = await supabase
    .from('profiles')
    .select(`
      id,
      full_name,
      dob,
      gender,
      height_cm,
      marital_status,
      about_me,
      annual_income,
      city_id,
      district_id,
      state_id,
      religion_id,
      caste_id,
      sub_caste_text,
      city_text,
      degree,
      education_level_id,
      occupation_id,
      is_active,
      is_verified,
      profile_completion,
      updated_at,
      cities ( name ),
      districts ( name ),
      education_levels ( name ),
      occupations ( name ),
      religions ( name ),
      castes ( name )
    `)
    .eq('id', profileId)
    .eq('is_active', true)
    .single();

  if (error) throw error;
  
  const [
    { data: photos },
    { data: family },
    { data: horoscope },
    { data: preferences },
    { data: lifestyle }
  ] = await Promise.all([
    supabase.from('profile_photos').select('*').eq('user_id', profileId),
    supabase.from('user_family').select('*').eq('user_id', profileId).maybeSingle(),
    supabase.from('user_horoscope').select('*, rasi(name), nakshatra(name), lagnam(name), gothram(name)').eq('user_id', profileId).maybeSingle(),
    supabase.from('partner_preferences').select('*').eq('user_id', profileId).maybeSingle(),
    supabase.from('user_lifestyle').select('*').eq('user_id', profileId).maybeSingle(),
  ]);

  if (horoscope) {
    horoscope.rasi_text = horoscope.rasi_text || horoscope.rasi?.name || '';
    horoscope.nakshatra_text = horoscope.nakshatra_text || horoscope.nakshatra?.name || '';
    horoscope.lagnam_text = horoscope.lagnam_text || horoscope.lagnam?.name || '';
    horoscope.gothram_text = horoscope.gothram_text || horoscope.gothram?.name || '';
  }

  const profile = {
    ...data,
    city: data.cities?.name || data.city_text || '',
    district: data.districts?.name || '',
    highest_qualification: data.education_levels?.name || data.degree || '',
    education: data.education_levels?.name || data.degree || '',
    occupation: data.occupations?.name || '',
    religion: data.religions?.name || '',
    caste: data.castes?.name || '',
    sub_caste: data.sub_caste_text || '',
    profile_photos: photos || [],
    user_family: family || null,
    user_horoscope: horoscope || null,
    partner_preferences: preferences || null,
    user_lifestyle: lifestyle || null,
  };
  
  if (profile.profile_photos) {
    profile.profile_photos = profile.profile_photos.map(p => ({
      ...p,
      photo_url: getR2PhotoUrl(p.r2_key)
    }));
  }
  
  return profile;
};

/**
 * Create or update profile
 */
export const upsertProfile = async (profileData) => {
  const { data, error } = await supabase
    .from('profiles')
    .upsert(profileData, { onConflict: 'id' })
    .select()
    .single();

  if (error) throw error;
  return data;
};

/**
 * Update profile fields
 */
export const updateProfile = async (userId, updates) => {
  const { data, error } = await supabase
    .from('profiles')
    .update({ ...updates, updated_at: new Date().toISOString() })
    .eq('id', userId)
    .select()
    .single();

  if (error) throw error;
  return data;
};

/**
 * Upsert horoscope details
 */
export const upsertHoroscope = async (horoscopeData) => {
  const { data, error } = await supabase
    .from('user_horoscope')
    .upsert(horoscopeData, { onConflict: 'user_id' })
    .select()
    .single();

  if (error) throw error;
  return data;
};

/**
 * Upsert partner preferences
 */
export const upsertPartnerPreferences = async (prefData) => {
  const { data, error } = await supabase
    .from('partner_preferences')
    .upsert(prefData, { onConflict: 'user_id' })
    .select()
    .single();

  if (error) throw error;
  return data;
};

/**
 * Upsert family details
 */
export const upsertFamilyDetails = async (familyData) => {
  const { data, error } = await supabase
    .from('user_family')
    .upsert(familyData, { onConflict: 'user_id' })
    .select()
    .single();

  if (error) throw error;
  return data;
};

/**
 * Upsert user lifestyle
 */
export const upsertUserLifestyle = async (lifestyleData) => {
  const { data, error } = await supabase
    .from('user_lifestyle')
    .upsert(lifestyleData, { onConflict: 'user_id' })
    .select()
    .single();

  if (error) throw error;
  return data;
};

/**
 * Upsert registration meta (creating_for, mother_tongue_id)
 */
export const upsertRegistrationMeta = async (metaData) => {
  const { data, error } = await supabase
    .from('registration_meta')
    .upsert(metaData, { onConflict: 'user_id' })
    .select()
    .single();

  if (error) throw error;
  return data;
};

/**
 * Upsert profile contact (phone number, credit-gated)
 */
export const upsertProfileContact = async (contactData) => {
  const { data, error } = await supabase
    .from('profile_contact')
    .upsert(contactData, { onConflict: 'user_id' })
    .select()
    .single();

  if (error) throw error;
  return data;
};

/**
 * Search/filter profiles with pagination (Advanced Search)
 * All filter values are FK IDs (bigint) matching the new schema.
 */
export const searchProfiles = async (filters = {}, page = 0) => {
  let query = supabase
    .from('profiles')
    .select(`
      id,
      full_name,
      dob,
      gender,
      height_cm,
      marital_status,
      city_id,
      district_id,
      state_id,
      religion_id,
      caste_id,
      education_level_id,
      occupation_id,
      is_active,
      is_verified,
      profile_completion,
      updated_at
    `, { count: 'exact' })
    .eq('is_active', true)
    .neq('id', filters.excludeUserId);

  // Apply filters (FK IDs, not text)
  if (filters.gender) query = query.eq('gender', filters.gender);
  if (filters.religion_id) query = query.eq('religion_id', filters.religion_id);
  if (filters.caste_id) query = query.eq('caste_id', filters.caste_id);
  if (filters.city_id) query = query.eq('city_id', filters.city_id);
  if (filters.district_id) query = query.eq('district_id', filters.district_id);
  if (filters.state_id) query = query.eq('state_id', filters.state_id);
  if (filters.education_level_id) query = query.eq('education_level_id', filters.education_level_id);
  if (filters.occupation_id) query = query.eq('occupation_id', filters.occupation_id);
  if (filters.maritalStatus) query = query.eq('marital_status', filters.maritalStatus);

  if (filters.ageMin) {
    const maxDob = new Date();
    maxDob.setFullYear(maxDob.getFullYear() - filters.ageMin);
    query = query.lte('dob', maxDob.toISOString().split('T')[0]);
  }
  if (filters.ageMax) {
    const minDob = new Date();
    minDob.setFullYear(minDob.getFullYear() - filters.ageMax);
    query = query.gte('dob', minDob.toISOString().split('T')[0]);
  }
  if (filters.heightMin) query = query.gte('height_cm', filters.heightMin);
  if (filters.heightMax) query = query.lte('height_cm', filters.heightMax);

  // Sorting (no last_active_at column — use updated_at)
  query = query.order('updated_at', { ascending: false });

  // Pagination
  const from = page * PAGE_SIZE;
  const to = from + PAGE_SIZE - 1;
  query = query.range(from, to);

  const { data, error, count } = await query;

  if (error) throw error;
  
  const profiles = data || [];
  
  // Fetch photos for all profiles
  if (profiles.length > 0) {
    const profileIds = profiles.map(p => p.id);
    const { data: photos } = await supabase
      .from('profile_photos')
      .select('*')
      .in('user_id', profileIds);
      
    const photoMap = {};
    if (photos) {
      photos.forEach(photo => {
        if (!photoMap[photo.user_id]) photoMap[photo.user_id] = [];
        photoMap[photo.user_id].push({
          ...photo,
          photo_url: getR2PhotoUrl(photo.r2_key)
        });
      });
    }
    
    profiles.forEach(p => {
      p.profile_photos = photoMap[p.id] || [];
    });
  }
  
  return { profiles, total: count, page, hasMore: (page + 1) * PAGE_SIZE < count };
};

/**
 * Upload a profile photo via the r2-presigned-upload Edge Function
 */
export const uploadProfilePhoto = async (userId, fileUri, options = { replacePrimary: true, isPrimary: true }) => {
  try {
    const uploadPaths = await processAndUploadPhoto(fileUri, userId);

    // 3. Insert/update profile_photos record
    let photoRecord;

    if (options.replacePrimary) {
      const { data: existingPhotos } = await supabase
        .from('profile_photos')
        .select('id')
        .eq('user_id', userId)
        .eq('is_primary', true);

      if (existingPhotos && existingPhotos.length > 0) {
        const { data, error: updateError } = await supabase
          .from('profile_photos')
          .update({ 
            r2_key: uploadPaths.mainPath,
            thumbnail_key: uploadPaths.thumbPath
          })
          .eq('id', existingPhotos[0].id)
          .select()
          .single();
          
        if (updateError) throw updateError;
        photoRecord = data;
      } else {
        const { data, error: insertError } = await supabase
          .from('profile_photos')
          .insert({
            user_id: userId,
            r2_key: uploadPaths.mainPath,
            thumbnail_key: uploadPaths.thumbPath,
            is_primary: true,
            order_index: 0,
          })
          .select()
          .single();
          
        if (insertError) throw insertError;
        photoRecord = data;
      }
    } else {
      const { data, error: insertError } = await supabase
        .from('profile_photos')
        .insert({
          user_id: userId,
          r2_key: uploadPaths.mainPath,
          thumbnail_key: uploadPaths.thumbPath,
          is_primary: options.isPrimary,
          order_index: 0, 
        })
        .select()
        .single();
        
      if (insertError) throw insertError;
      photoRecord = data;
    }

    return {
      ...photoRecord,
      photo_url: getR2PhotoUrl(photoRecord.r2_key)
    };
  } catch (error) {
    console.error('Error uploading photo:', error);
    throw error;
  }
};

/**
 * Set a specific photo as primary
 */
export const setPrimaryProfilePhoto = async (userId, photoId) => {
  try {
    const { error: resetError } = await supabase
      .from('profile_photos')
      .update({ is_primary: false })
      .eq('user_id', userId);

    if (resetError) throw resetError;

    const { data, error: updateError } = await supabase
      .from('profile_photos')
      .update({ is_primary: true })
      .eq('id', photoId)
      .select()
      .single();

    if (updateError) throw updateError;
    return {
      ...data,
      photo_url: getR2PhotoUrl(data.r2_key)
    };
  } catch (error) {
    console.error('Error setting primary photo:', error);
    throw error;
  }
};

/**
 * Delete a profile photo via the r2-delete-photo Edge Function
 */
export const deleteProfilePhoto = async (photoId) => {
  try {
    // Use the Edge Function which handles both R2 deletion and DB record removal
    const { data, error } = await supabase.functions.invoke(
      'r2-delete-photo',
      { body: { photo_id: photoId } }
    );

    if (error) throw error;
    return true;
  } catch (error) {
    console.error('Error deleting photo:', error);
    throw error;
  }
};

/**
 * Deactivate profile
 */
export const deactivateProfile = async (userId) => {
  const { data, error } = await supabase
    .from('profiles')
    .update({ is_active: false, updated_at: new Date().toISOString() })
    .eq('id', userId)
    .select()
    .single();

  if (error) throw error;
  return data;
};
