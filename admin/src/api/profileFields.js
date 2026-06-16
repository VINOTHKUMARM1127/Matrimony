/**
 * Shared profile field mapping — the single source of truth for which columns
 * live on which table. Used by Bulk Upload AND the Manage-User editor so the two
 * never drift apart. Every key here matches the live DB schema (verified) and the
 * 8-step mobile registration flow.
 */

// Scalar columns on public.profiles
export const PROFILE_SCALAR_FIELDS = [
  'display_name', 'phone', 'gender', 'date_of_birth', 'height_cm', 'marital_status',
  'religion', 'caste', 'subcaste', 'dosham', 'mother_tongue', 'profile_created_for',
  'education', 'education_detail', 'occupation', 'occupation_detail', 'company_name', 'annual_income',
  'family_type', 'family_status', 'father_occupation', 'mother_occupation',
  'brothers_count', 'sisters_count', 'brothers_married', 'sisters_married',
  'city', 'district', 'state', 'country', 'pincode', 'about_me',
  'food_habit', 'smoking', 'drinking',
];

// Array columns on public.profiles
export const PROFILE_ARRAY_FIELDS = ['languages_known', 'interests', 'hobbies'];

// Integer columns on public.profiles (coerced)
export const PROFILE_INT_FIELDS = ['height_cm', 'brothers_count', 'sisters_count', 'brothers_married', 'sisters_married'];

// horoscope_details columns
export const HOROSCOPE_FIELDS = ['star', 'raasi', 'lagnam', 'gothram', 'dasa_balance', 'manglik'];

// partner_preferences columns
export const PREFERENCE_SCALAR_FIELDS = ['age_min', 'age_max', 'height_min', 'height_max'];
export const PREFERENCE_ARRAY_FIELDS = ['religion', 'caste', 'education', 'occupation', 'marital_status', 'food_habit', 'star'];

const toInt = (v) => (v === '' || v === null || v === undefined ? null : (parseInt(v, 10) || 0));
const toArray = (v) => {
  if (v === null || v === undefined || v === '') return undefined;
  if (Array.isArray(v)) return v;
  // Allow comma-separated strings in bulk JSON for convenience.
  return String(v).split(',').map((s) => s.trim()).filter(Boolean);
};

/**
 * Build the public.profiles update/insert payload from a flat input object.
 * Only includes keys actually present on the input (so partial edits are safe).
 */
export const buildProfilePayload = (input, { includeUndefined = false } = {}) => {
  const out = {};
  for (const k of PROFILE_SCALAR_FIELDS) {
    if (k in input) {
      out[k] = PROFILE_INT_FIELDS.includes(k) ? toInt(input[k]) : (input[k] === '' ? null : input[k]);
    } else if (includeUndefined) {
      out[k] = null;
    }
  }
  for (const k of PROFILE_ARRAY_FIELDS) {
    if (k in input) {
      const arr = toArray(input[k]);
      if (arr !== undefined) out[k] = arr;
    }
  }
  return out;
};

/** Build horoscope_details payload; returns null if no horoscope keys present. */
export const buildHoroscopePayload = (input) => {
  const out = {};
  for (const k of HOROSCOPE_FIELDS) {
    if (k in input && input[k] !== '' && input[k] !== null && input[k] !== undefined) out[k] = input[k];
  }
  return Object.keys(out).length ? out : null;
};

/** Build partner_preferences payload; returns null if no preference keys present. */
export const buildPreferencePayload = (input) => {
  const out = {};
  for (const k of PREFERENCE_SCALAR_FIELDS) {
    if (k in input && input[k] !== '' && input[k] !== null && input[k] !== undefined) out[k] = toInt(input[k]);
  }
  for (const k of PREFERENCE_ARRAY_FIELDS) {
    // Preference keys may be prefixed in bulk JSON (e.g. preferred_religion) — caller normalizes.
    if (k in input) {
      const arr = toArray(input[k]);
      if (arr !== undefined) out[k] = arr;
    }
  }
  return Object.keys(out).length ? out : null;
};
