/**
 * Wedring Matrimony — Image Processor Service
 * Compression, thumbnails, and upload management
 */
import * as ImageManipulator from 'expo-image-manipulator';
import * as ImagePicker from 'expo-image-picker';
import supabase from '../api/supabaseClient';
import { IMAGE_CONFIG, STORAGE_BUCKETS } from '../utils/constants';

const uriToBlob = async (uri) => {
  return new Promise((resolve, reject) => {
    const xhr = new XMLHttpRequest();
    xhr.onload = function () {
      resolve(xhr.response);
    };
    xhr.onerror = function (e) {
      console.error('uriToBlob error:', e);
      reject(new TypeError('Local file read failed'));
    };
    xhr.responseType = 'blob';
    xhr.open('GET', uri, true);
    xhr.send(null);
  });
};

/**
 * Pick images from library
 */
export const pickImages = async (maxCount = 1) => {
  const { status } = await ImagePicker.requestMediaLibraryPermissionsAsync();
  if (status !== 'granted') {
    throw new Error('Photo library permission required');
  }

  const result = await ImagePicker.launchImageLibraryAsync({
    mediaTypes: ['images'],
    allowsMultipleSelection: maxCount > 1,
    selectionLimit: maxCount,
    quality: 0.8,
  });

  if (result.canceled) return [];
  return result.assets;
};

/**
 * Take a photo with camera
 */
export const takePhoto = async () => {
  const { status } = await ImagePicker.requestCameraPermissionsAsync();
  if (status !== 'granted') {
    throw new Error('Camera permission required');
  }

  const result = await ImagePicker.launchCameraAsync({
    quality: 0.8,
    allowsEditing: true,
    aspect: [3, 4],
  });

  if (result.canceled) return null;
  return result.assets[0];
};

/**
 * Compress image for upload
 */
export const compressImage = async (uri, options = {}) => {
  const { getInfoAsync } = require('expo-file-system/legacy');
  let maxWidth = options.maxWidth || IMAGE_CONFIG.MAX_WIDTH;
  let quality = options.quality || IMAGE_CONFIG.QUALITY;
  let manipulated;
  let fileSize = Infinity;

  while (fileSize > 200 * 1024 && quality > 0.1) {
    manipulated = await ImageManipulator.manipulateAsync(
      uri,
      [{ resize: { width: maxWidth } }],
      { compress: quality, format: ImageManipulator.SaveFormat.WEBP }
    );
    const fileInfo = await getInfoAsync(manipulated.uri);
    fileSize = fileInfo.size;
    quality -= 0.15;
    maxWidth = Math.floor(maxWidth * 0.8);
  }

  return manipulated;
};

/**
 * Generate thumbnail
 */
export const generateThumbnail = async (uri) => {
  const manipulated = await ImageManipulator.manipulateAsync(
    uri,
    [{ resize: { width: IMAGE_CONFIG.THUMBNAIL_SIZE } }],
    { compress: IMAGE_CONFIG.THUMBNAIL_QUALITY, format: ImageManipulator.SaveFormat.WEBP }
  );

  return manipulated;
};

import { getR2PublicUrl } from '../api/r2Client';
import { decode } from 'base64-arraybuffer';

/**
 * Upload image to Cloudflare R2 via Edge Function
 */
export const uploadImage = async (uri, userId, bucket = STORAGE_BUCKETS.PROFILE_PHOTOS) => {
  // 1. Get presigned URL
  const { data, error } = await supabase.functions.invoke('r2-presigned-upload', {
    body: { content_type: 'image/webp', thumbnail: uri.includes('thumb') }
  });

  if (error || !data?.upload_url) {
    throw new Error(error?.message || data?.error || 'Failed to get upload URL');
  }

  // 2. Read bytes and upload
  const blob = await uriToBlob(uri);

  const uploadRes = await fetch(data.upload_url, {
    method: 'PUT',
    headers: { 'Content-Type': 'image/webp' },
    body: blob
  });

  if (!uploadRes.ok) {
    throw new Error('Failed to upload image to storage');
  }

  return {
    path: data.r2_key,
    publicUrl: getR2PublicUrl(data.r2_key),
  };
};

/**
 * Delete image from storage
 */
export const deleteImage = async (photoId) => {
  const { data, error } = await supabase.functions.invoke('r2-delete-photo', {
    body: { photo_id: photoId }
  });

  if (error || data?.error) {
    throw new Error(error?.message || data?.error || 'Failed to delete photo');
  }
};

/**
 * Process and upload profile photo (compress + thumbnail + upload)
 */
export const processAndUploadPhoto = async (uri, userId) => {
  // Compress main image
  const compressed = await compressImage(uri);

  // Generate thumbnail
  const thumbnail = await generateThumbnail(uri);

  // Upload both
  const [mainUpload, thumbUpload] = await Promise.all([
    uploadImage(compressed.uri, userId),
    uploadImage(thumbnail.uri, userId),
  ]);

  return {
    storagePath: mainUpload.publicUrl,
    thumbnailPath: thumbUpload.publicUrl,
    mainPath: mainUpload.path,
    thumbPath: thumbUpload.path,
  };
};

export default {
  pickImages,
  takePhoto,
  compressImage,
  generateThumbnail,
  uploadImage,
  deleteImage,
  processAndUploadPhoto,
};
