/**
 * Wedring Matrimony — R2 URL Utility
 *
 * Constructs displayable URLs from R2 storage keys.
 * Direct R2 uploads/deletes are NO LONGER done from the client —
 * use the `r2-presigned-upload` and `r2-delete-photo` Edge Functions instead.
 */

const R2_PUBLIC_URL = process.env.EXPO_PUBLIC_R2_PUBLIC_URL || '';

/**
 * Construct a full public URL from an R2 key.
 * @param {string} r2Key — e.g. "photos/uuid/file.jpg"
 * @returns {string|null} — full public URL or null
 */
export const getR2PublicUrl = (r2Key) => {
  if (!r2Key) return null;
  // If it's already a full URL (legacy data), return as-is
  if (r2Key.startsWith('http')) return r2Key;
  return `${R2_PUBLIC_URL}/${r2Key}`;
};

/**
 * Extract an R2 key from a full URL.
 * @param {string} publicUrl — full URL
 * @returns {string} — the R2 key portion
 */
export const getR2KeyFromUrl = (publicUrl) => {
  if (!publicUrl) return '';
  if (R2_PUBLIC_URL && publicUrl.startsWith(R2_PUBLIC_URL)) {
    return publicUrl.replace(`${R2_PUBLIC_URL}/`, '');
  }
  // Fallback: try to extract 'userId/filename' from URL path
  try {
    const url = new URL(publicUrl);
    const pathParts = url.pathname.split('/').filter(Boolean);
    if (pathParts.length >= 2) {
      return `${pathParts[pathParts.length - 2]}/${pathParts[pathParts.length - 1]}`;
    }
  } catch (e) {
    // Not a valid URL
  }
  return publicUrl;
};

export const R2_BUCKET = () => process.env.EXPO_PUBLIC_R2_BUCKET_NAME || 'matimony';
export const R2_PUBLIC_URL_BASE = () => R2_PUBLIC_URL;
