import supabase from './supabaseClient';

const R2_PUBLIC_URL = import.meta.env.VITE_R2_PUBLIC_URL || '';

export const getR2PublicUrl = (r2Key) => {
  if (!r2Key) return null;
  if (r2Key.startsWith('http')) return r2Key;
  return `${R2_PUBLIC_URL}/${r2Key}`;
};

export const getR2KeyFromUrl = (publicUrl) => {
  if (!publicUrl) return '';
  if (R2_PUBLIC_URL && publicUrl.startsWith(R2_PUBLIC_URL)) {
    return publicUrl.replace(`${R2_PUBLIC_URL}/`, '');
  }
  try {
    const url = new URL(publicUrl);
    const pathParts = url.pathname.split('/').filter(Boolean);
    if (pathParts.length >= 2) {
      return `${pathParts[pathParts.length - 2]}/${pathParts[pathParts.length - 1]}`;
    }
  } catch (e) {}
  return publicUrl;
};

/**
 * Upload an image File object to Cloudflare R2 using Edge Function
 */
export const uploadPhotoToR2 = async (userId, file) => {
  // 1. Get presigned upload URL from Edge Function
  const { data: presignedData, error: presignedError } = await supabase.functions.invoke(
    'r2-presigned-upload',
    { body: { content_type: file.type || 'image/jpeg', user_id_override: userId } }
  );

  if (presignedError) throw presignedError;
  if (!presignedData?.upload_url || !presignedData?.r2_key) {
    throw new Error('Failed to get presigned upload URL');
  }

  // 2. Upload binary directly to R2 via presigned URL
  const uploadResponse = await fetch(presignedData.upload_url, {
    method: 'PUT',
    headers: { 'Content-Type': file.type || 'image/jpeg' },
    body: file, // file is a Blob/File, fetch can handle it directly
  });

  if (!uploadResponse.ok) {
    throw new Error(`R2 upload failed: ${uploadResponse.status}`);
  }

  return {
    path: presignedData.r2_key,
    publicUrl: getR2PublicUrl(presignedData.r2_key),
  };
};

/**
 * Delete an image from Cloudflare R2 using its R2 key
 */
export const deletePhotoFromR2 = async (r2Key) => {
  if (!r2Key) return;
  
  // Try to extract key if a full URL was passed
  const key = getR2KeyFromUrl(r2Key);

  const { error } = await supabase.functions.invoke(
    'r2-delete-photo',
    { body: { r2_key: key } }
  );

  if (error) {
    console.warn('Failed to delete photo via Edge Function:', error.message);
    throw error;
  }
};
