/**
 * Tamil Matrimony — Profiles API
 * Profile CRUD operations via Supabase
 */
import supabase from './supabaseClient';
import { PAGE_SIZE } from '../utils/constants';

/**
 * Get current user's profile
 */
export const getMyProfile = async (userId) => {
  const { data, error } = await supabase
    .from('profiles')
    .select(`
      *,
      photos (*),
      subscriptions (*)
    `)
    .eq('id', userId)
    .single();

  if (error) throw error;
  return data;
};

/**
 * Get a user's public profile
 */
export const getProfile = async (profileId) => {
  const { data, error } = await supabase
    .from('profiles')
    .select(`
      *,
      photos (id, storage_path, thumbnail_path, is_primary, is_private, display_order, is_approved)
    `)
    .eq('id', profileId)
    .eq('is_active', true)
    .single();

  if (error) throw error;
  return data;
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
    .from('horoscope_details')
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
 * Search/filter profiles with pagination
 */
export const searchProfiles = async (filters = {}, page = 0) => {
  let query = supabase
    .from('profiles')
    .select(`
      *,
      photos (id, storage_path, thumbnail_path, is_primary, display_order)
    `, { count: 'exact' })
    .eq('is_active', true)
    .neq('id', filters.excludeUserId);

  // Apply filters
  if (filters.gender) {
    query = query.eq('gender', filters.gender);
  }
  if (filters.religion) {
    query = query.eq('religion', filters.religion);
  }
  if (filters.caste) {
    query = query.eq('caste', filters.caste);
  }
  if (filters.city) {
    query = query.eq('city', filters.city);
  }
  if (filters.district) {
    query = query.eq('district', filters.district);
  }
  if (filters.state) {
    query = query.eq('state', filters.state);
  }
  if (filters.education) {
    query = query.eq('education', filters.education);
  }
  if (filters.occupation) {
    query = query.eq('occupation', filters.occupation);
  }
  if (filters.maritalStatus) {
    query = query.eq('marital_status', filters.maritalStatus);
  }
  if (filters.foodHabit) {
    query = query.eq('food_habit', filters.foodHabit);
  }
  if (filters.ageMin) {
    const maxDob = new Date();
    maxDob.setFullYear(maxDob.getFullYear() - filters.ageMin);
    query = query.lte('date_of_birth', maxDob.toISOString().split('T')[0]);
  }
  if (filters.ageMax) {
    const minDob = new Date();
    minDob.setFullYear(minDob.getFullYear() - filters.ageMax);
    query = query.gte('date_of_birth', minDob.toISOString().split('T')[0]);
  }
  if (filters.heightMin) {
    query = query.gte('height_cm', filters.heightMin);
  }
  if (filters.heightMax) {
    query = query.lte('height_cm', filters.heightMax);
  }
  if (filters.verifiedOnly) {
    query = query.eq('is_verified', true);
  }
  if (filters.premiumOnly) {
    query = query.eq('is_premium', true);
  }
  if (filters.withPhotoOnly) {
    query = query.not('photos', 'is', null);
  }

  // Sorting
  if (filters.sortBy === 'recent') {
    query = query.order('last_active_at', { ascending: false });
  } else if (filters.sortBy === 'newest') {
    query = query.order('created_at', { ascending: false });
  } else {
    query = query.order('last_active_at', { ascending: false });
  }

  // Pagination
  const from = page * PAGE_SIZE;
  const to = from + PAGE_SIZE - 1;
  query = query.range(from, to);

  const { data, error, count } = await query;

  if (error) throw error;
  return { profiles: data, total: count, page, hasMore: (page + 1) * PAGE_SIZE < count };
};

/**
 * Get recently active profiles
 */
export const getRecentProfiles = async (gender, limit = 10) => {
  const { data, error } = await supabase
    .from('profiles')
    .select(`
      *,
      photos (id, storage_path, thumbnail_path, is_primary, display_order)
    `)
    .eq('is_active', true)
    .eq('gender', gender === 'male' ? 'female' : 'male')
    .order('last_active_at', { ascending: false })
    .limit(limit);

  if (error) throw error;
  return data;
};

/**
 * Get premium profiles
 */
export const getPremiumProfiles = async (gender, limit = 10) => {
  const { data, error } = await supabase
    .from('profiles')
    .select(`
      *,
      photos (id, storage_path, thumbnail_path, is_primary, display_order)
    `)
    .eq('is_active', true)
    .eq('is_premium', true)
    .eq('gender', gender === 'male' ? 'female' : 'male')
    .order('last_active_at', { ascending: false })
    .limit(limit);

  if (error) throw error;
  return data;
};

/**
 * Get verified profiles
 */
export const getVerifiedProfiles = async (gender, limit = 10) => {
  const { data, error } = await supabase
    .from('profiles')
    .select(`
      *,
      photos (id, storage_path, thumbnail_path, is_primary, display_order)
    `)
    .eq('is_active', true)
    .eq('is_verified', true)
    .eq('gender', gender === 'male' ? 'female' : 'male')
    .order('last_active_at', { ascending: false })
    .limit(limit);

  if (error) throw error;
  return data;
};

/**
 * Update last active timestamp
 */
export const updateLastActive = async (userId) => {
  const { error } = await supabase
    .from('profiles')
    .update({ last_active_at: new Date().toISOString() })
    .eq('id', userId);

  if (error) console.warn('Failed to update last active:', error);
};

/**
 * Log profile view activity
 */
export const logProfileView = async (viewerId, viewedId) => {
  const { error } = await supabase
    .from('user_activity')
    .insert({
      user_id: viewerId,
      activity_type: 'profile_view',
      target_user_id: viewedId,
    });

  if (error) console.warn('Failed to log profile view:', error);
};

/**
 * Deactivate profile (e.g., got married)
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

/**
/**
 * Upload a profile photo with compression and update the database
 */
export const uploadProfilePhoto = async (userId, fileUri, options = { replacePrimary: true, isPrimary: true }) => {
  try {
    // 1. Compress image (target under 200KB)
    const { getInfoAsync } = require('expo-file-system/legacy');
    let quality = 0.8;
    let width = 1080;
    let manipResult;
    let fileSize = Infinity;

    while (fileSize > 200 * 1024 && quality > 0.1) {
      manipResult = await ImageManipulator.manipulateAsync(
        fileUri,
        [{ resize: { width } }],
        { compress: quality, format: ImageManipulator.SaveFormat.JPEG }
      );
      const fileInfo = await getInfoAsync(manipResult.uri);
      fileSize = fileInfo.size;
      quality -= 0.15;
      width = Math.floor(width * 0.8);
    }
    const compressedUri = manipResult.uri;

    // 2. Read compressed file as base64 and decode to array buffer
    const fileInstance = new File(compressedUri);
    const base64 = await fileInstance.base64();
    const arrayBuffer = decode(base64);

    // 3. Generate unique filename
    const fileName = `${userId}/${Date.now()}.jpg`;

    // 4. Upload to Cloudflare R2
    const bucketName = process.env.EXPO_PUBLIC_R2_BUCKET_NAME || 'profile-photos';
    const command = new PutObjectCommand({
      Bucket: bucketName,
      Key: fileName,
      Body: arrayBuffer,
      ContentType: 'image/jpeg',
    });

    await s3Client.send(command);

    // 5. Construct public URL using configured R2 domain
    const r2PublicDomain = process.env.EXPO_PUBLIC_R2_PUBLIC_URL || '';
    const publicUrl = `${r2PublicDomain}/${fileName}`;

    let photoRecord;

    if (options.replacePrimary) {
      // Check if user already has a primary photo
      const { data: existingPhotos } = await supabase
        .from('photos')
        .select('id')
        .eq('user_id', userId)
        .eq('is_primary', true);

      if (existingPhotos && existingPhotos.length > 0) {
        // Update existing primary photo
        const { data, error: updateError } = await supabase
          .from('photos')
          .update({ storage_path: publicUrl, thumbnail_path: publicUrl })
          .eq('id', existingPhotos[0].id)
          .select()
          .single();
          
        if (updateError) throw updateError;
        photoRecord = data;
      } else {
        // Insert new primary photo
        const { data, error: insertError } = await supabase
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
          
        if (insertError) throw insertError;
        photoRecord = data;
      }
    } else {
      // Append a new photo (non-replacing)
      // If it's the very first photo, maybe make it primary? The options.isPrimary handles that.
      const { data, error: insertError } = await supabase
        .from('photos')
        .insert({
          user_id: userId,
          storage_path: publicUrl,
          thumbnail_path: publicUrl,
          is_primary: options.isPrimary,
          display_order: 0, // In a robust app, we'd query the max display order and increment
        })
        .select()
        .single();
        
      if (insertError) throw insertError;
      photoRecord = data;
    }

    return photoRecord;
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
    // 1. Remove primary flag from all user's photos
    const { error: resetError } = await supabase
      .from('photos')
      .update({ is_primary: false })
      .eq('user_id', userId);

    if (resetError) throw resetError;

    // 2. Set the specific photo as primary
    const { data, error: updateError } = await supabase
      .from('photos')
      .update({ is_primary: true })
      .eq('id', photoId)
      .select()
      .single();

    if (updateError) throw updateError;
    return data;
  } catch (error) {
    console.error('Error setting primary photo:', error);
    throw error;
  }
};

/**
 * Delete a profile photo
 */
export const deleteProfilePhoto = async (photoId, storagePath) => {
  try {
    // Delete from Cloudflare R2
    if (storagePath) {
      // Assuming path looks like https://pub-xxxx.r2.dev/USER_ID/12345.jpg
      const urlParts = storagePath.split('/');
      if (urlParts.length >= 2) {
        // Extract "userId/filename.jpg"
        const fileName = `${urlParts[urlParts.length - 2]}/${urlParts[urlParts.length - 1]}`;
        const bucketName = process.env.EXPO_PUBLIC_R2_BUCKET_NAME || 'profile-photos';
        
        try {
          const command = new DeleteObjectCommand({
            Bucket: bucketName,
            Key: fileName,
          });
          await s3Client.send(command);
        } catch (r2Error) {
          console.warn('Failed to delete from R2:', r2Error);
        }
      }
    }

    // Delete from database
    const { data, error } = await supabase
      .from('photos')
      .delete()
      .eq('id', photoId)
      .select();

    if (error) throw error;
    if (!data || data.length === 0) {
      throw new Error('Photo not found or permission denied. Please check your Supabase RLS policies.');
    }
    return true;
  } catch (error) {
    console.error('Error deleting photo:', error);
    throw error;
  }
};
