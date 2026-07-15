/**
 * Wedring Matrimony — Shared Profile Field Mapping
 * 
 * Maps flat input objects (e.g. from Bulk Upload or User Editor) into the exact
 * column names expected by the new Supabase schema.
 * 
 * SCHEMA:
 * - profiles
 * - user_family
 * - user_horoscope
 * - user_lifestyle
 * - partner_preferences
 */

// Scalar columns on public.profiles
export const PROFILE_SCALAR_FIELDS = [
  'full_name', 'gender', 'dob', 'height_cm', 'weight_kg', 
  'marital_status', 'physical_status', 'about_me',
  'religion_id', 'caste_id', 'sub_caste_id', 'sub_caste_text',
  'education_level_id', 'degree', 'college_name', 'occupation_id', 
  'is_working', 'annual_income',
  'country_id', 'state_id', 'district_id', 'city_id', 'city_text',
];

export const PROFILE_INT_FIELDS = [
  'height_cm', 'weight_kg', 'religion_id', 'caste_id', 'sub_caste_id',
  'education_level_id', 'occupation_id', 'country_id', 'state_id', 'district_id', 'city_id'
];

export const PROFILE_FLOAT_FIELDS = ['annual_income'];
export const PROFILE_BOOL_FIELDS = ['is_working'];

// user_lifestyle columns
export const LIFESTYLE_SCALAR_FIELDS = ['food_habit'];
export const LIFESTYLE_ARRAY_FIELDS = ['languages', 'interests', 'hobbies'];

// user_horoscope columns
export const HOROSCOPE_INT_FIELDS = ['rasi_id', 'nakshatra_id', 'lagnam_id', 'gothram_id'];
export const HOROSCOPE_TEXT_FIELDS = ['rasi_text', 'nakshatra_text', 'lagnam_text', 'gothram_text', 'dosham', 'notes'];

// partner_preferences columns
export const PREFERENCE_INT_FIELDS = ['min_age', 'max_age', 'min_height_cm', 'max_height_cm', 'religion_id', 'caste_id', 'education_level_id', 'occupation_id', 'location_city_id'];
export const PREFERENCE_TEXT_FIELDS = ['food_habit', 'marital_status'];

// user_family columns
export const FAMILY_TEXT_FIELDS = [
  'father_name', 'mother_name', 'family_type', 'family_status', 'family_values'
];
export const FAMILY_INT_FIELDS = ['brothers_count', 'sisters_count'];

const toInt = (v) => (v === '' || v === null || v === undefined ? null : (parseInt(v, 10) || 0));
const toFloat = (v) => (v === '' || v === null || v === undefined ? null : parseFloat(v));
const toBool = (v) => (v === '' || v === null || v === undefined ? null : Boolean(v));
const toArray = (v) => {
  if (v === null || v === undefined || v === '') return undefined;
  if (Array.isArray(v)) return v;
  return String(v).split(',').map((s) => s.trim()).filter(Boolean);
};

export const buildProfilePayload = (input, { includeUndefined = false } = {}) => {
  const out = {};
  for (const k of PROFILE_SCALAR_FIELDS) {
    if (k in input) {
      if (PROFILE_INT_FIELDS.includes(k)) out[k] = toInt(input[k]);
      else if (PROFILE_FLOAT_FIELDS.includes(k)) out[k] = toFloat(input[k]);
      else if (PROFILE_BOOL_FIELDS.includes(k)) out[k] = toBool(input[k]);
      else out[k] = input[k] === '' ? null : input[k];
    } else if (includeUndefined) {
      out[k] = null;
    }
  }
  return out;
};

export const buildLifestylePayload = (input) => {
  const out = {};
  for (const k of LIFESTYLE_SCALAR_FIELDS) {
    if (k in input && input[k] !== '' && input[k] !== null && input[k] !== undefined) out[k] = input[k];
  }
  for (const k of LIFESTYLE_ARRAY_FIELDS) {
    if (k in input) {
      const arr = toArray(input[k]);
      if (arr !== undefined) out[k] = arr;
    }
  }
  return Object.keys(out).length ? out : null;
};

export const buildHoroscopePayload = (input) => {
  const out = {};
  for (const k of HOROSCOPE_INT_FIELDS) {
    if (k in input && input[k] !== '' && input[k] !== null && input[k] !== undefined) out[k] = toInt(input[k]);
  }
  for (const k of HOROSCOPE_TEXT_FIELDS) {
    if (k in input && input[k] !== '' && input[k] !== null && input[k] !== undefined) out[k] = input[k];
  }
  return Object.keys(out).length ? out : null;
};

export const buildPreferencePayload = (input) => {
  const out = {};
  for (const k of PREFERENCE_INT_FIELDS) {
    if (k in input && input[k] !== '' && input[k] !== null && input[k] !== undefined) out[k] = toInt(input[k]);
  }
  for (const k of PREFERENCE_TEXT_FIELDS) {
    if (k in input && input[k] !== '' && input[k] !== null && input[k] !== undefined) out[k] = input[k];
  }
  return Object.keys(out).length ? out : null;
};

export const buildFamilyPayload = (input) => {
  const out = {};
  for (const k of FAMILY_INT_FIELDS) {
    if (k in input && input[k] !== '' && input[k] !== null && input[k] !== undefined) out[k] = toInt(input[k]);
  }
  for (const k of FAMILY_TEXT_FIELDS) {
    if (k in input && input[k] !== '' && input[k] !== null && input[k] !== undefined) out[k] = input[k];
  }
  return Object.keys(out).length ? out : null;
};
