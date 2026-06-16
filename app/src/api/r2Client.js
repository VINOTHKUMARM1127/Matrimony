/**
 * Shared Cloudflare R2 (S3-compatible) client for React Native.
 *
 * Why this exists / why mobile uploads were failing with AccessDenied while the
 * admin (browser) worked with the SAME credentials:
 *
 *   1. forcePathStyle: the admin client sets `forcePathStyle: true`. Without it
 *      the SDK signs a virtual-hosted host (bucket.<acct>.r2.cloudflarestorage.com)
 *      whose SigV4 host header differs from the request R2 receives -> AccessDenied.
 *
 *   2. Request checksums: AWS SDK v3 (>= 3.729) adds a DEFAULT CRC32 request
 *      checksum. Computing/encoding it relies on web APIs (crypto.subtle / proper
 *      base64) that Hermes lacks, so the signed `x-amz-sdk-checksum` header does
 *      not match what R2 recomputes -> AccessDenied. Browsers have WebCrypto, so
 *      the admin never hit this. Forcing checksums to WHEN_REQUIRED falls back to
 *      the standard x-amz-content-sha256 path that @aws-crypto/sha256-js handles.
 *
 * This module is the single source of truth for the R2 client + bucket/url config.
 */
import { S3Client, PutObjectCommand, DeleteObjectCommand } from '@aws-sdk/client-s3';

let _client = null;

export const getR2Client = () => {
  if (_client) return _client;
  const accountId = process.env.EXPO_PUBLIC_R2_ACCOUNT_ID;
  _client = new S3Client({
    region: 'auto',
    endpoint: `https://${accountId}.r2.cloudflarestorage.com`,
    forcePathStyle: true, // match admin; correct SigV4 host for R2
    // Disable the v3 default request checksum (breaks under Hermes signing).
    requestChecksumCalculation: 'WHEN_REQUIRED',
    responseChecksumValidation: 'WHEN_REQUIRED',
    credentials: {
      accessKeyId: process.env.EXPO_PUBLIC_R2_ACCESS_KEY_ID || '',
      secretAccessKey: process.env.EXPO_PUBLIC_R2_SECRET_ACCESS_KEY || '',
    },
  });
  return _client;
};

export const R2_BUCKET = () => process.env.EXPO_PUBLIC_R2_BUCKET_NAME || 'matimony';
export const R2_PUBLIC_URL = () => process.env.EXPO_PUBLIC_R2_PUBLIC_URL || '';

export { PutObjectCommand, DeleteObjectCommand };
