/**
 * Wedring Matrimony — Application Constants
 */

// App info
export const APP_NAME = 'Wedring Matrimony';
export const APP_VERSION = '1.0.0';
export const APP_BUNDLE_ID = 'com.wedringmatrimony.app';

// Supabase
export const SUPABASE_URL = process.env.EXPO_PUBLIC_SUPABASE_URL || '';
export const SUPABASE_ANON_KEY = process.env.EXPO_PUBLIC_SUPABASE_ANON_KEY || '';

// Razorpay
export const RAZORPAY_KEY_ID = process.env.EXPO_PUBLIC_RAZORPAY_KEY_ID || '';

// Fast2SMS (Mobile OTP)
export const STORAGE_BUCKETS = {
  PROFILE_PHOTOS: 'profile-photos',
  HOROSCOPE_IMAGES: 'horoscope-images',
  CHAT_IMAGES: 'chat-images',
};

// Pagination
export const PAGE_SIZE = 20;
export const SEARCH_DEBOUNCE_MS = 300;

// Image
export const IMAGE_CONFIG = {
  MAX_PHOTOS: 4,
  MAX_WIDTH: 1080,
  MAX_HEIGHT: 1080,
  THUMBNAIL_SIZE: 250,
  QUALITY: 0.8,
  THUMBNAIL_QUALITY: 0.6,
};

// Profile
export const PROFILE_ID_PREFIX = 'TM';


// Gender options
export const GENDERS = [
  { label: 'Male', value: 'male' },
  { label: 'Female', value: 'female' },
];

// Marital status
export const MARITAL_STATUS = [
  { label: 'Never Married', value: 'never_married' },
  { label: 'Divorced', value: 'divorced' },
  { label: 'Widowed', value: 'widowed' },
  { label: 'Awaiting Divorce', value: 'awaiting_divorce' },
];

// Religions
export const DOSHAM_OPTIONS = [
  { label: 'No', value: 'none' },
  { label: 'Yes', value: 'chevvai' },
];

// Education
export const INCOME_RANGES = [
  { label: 'Below ₹1 Lakh', value: 'below_1L' },
  { label: '₹1-2 Lakhs', value: '1L_2L' },
  { label: '₹2-3 Lakhs', value: '2L_3L' },
  { label: '₹3-5 Lakhs', value: '3L_5L' },
  { label: '₹5-7 Lakhs', value: '5L_7L' },
  { label: '₹7-10 Lakhs', value: '7L_10L' },
  { label: '₹10-15 Lakhs', value: '10L_15L' },
  { label: '₹15-20 Lakhs', value: '15L_20L' },
  { label: '₹20-30 Lakhs', value: '20L_30L' },
  { label: '₹30-50 Lakhs', value: '30L_50L' },
  { label: '₹50 Lakhs - 1 Crore', value: '50L_1Cr' },
  { label: 'Above ₹1 Crore', value: 'above_1Cr' },
];

// Height range (cm)
export const HEIGHT_OPTIONS = (() => {
  const heights = [];
  for (let cm = 140; cm <= 210; cm++) {
    const feet = Math.floor(cm / 30.48);
    const inches = Math.round((cm / 2.54) % 12);
    heights.push({
      label: `${feet}' ${inches}" (${cm} cm)`,
      value: cm,
    });
  }
  return heights;
})();

// Weight range (kg)
export const WEIGHT_OPTIONS = (() => {
  const weights = [];
  for (let kg = 40; kg <= 120; kg += 5) {
    weights.push({ label: `${kg} kg`, value: kg });
  }
  return weights;
})();

// Physical Status
export const PHYSICAL_STATUS = [
  { label: 'Normal', value: 'normal' },
  { label: 'Physically Challenged', value: 'physically_challenged' },
];

// Family Values
export const FAMILY_VALUES = [
  { label: 'Orthodox', value: 'orthodox' },
  { label: 'Traditional', value: 'traditional' },
  { label: 'Moderate', value: 'moderate' },
  { label: 'Liberal', value: 'liberal' },
];

// Food habits
export const FOOD_HABITS = [
  { label: 'Vegetarian', value: 'vegetarian' },
  { label: 'Non-Vegetarian', value: 'non_vegetarian' },
  { label: 'Eggetarian', value: 'eggetarian' },
];

// Smoking
export const SMOKING_OPTIONS = [
  { label: 'No', value: 'no' },
  { label: 'Yes', value: 'yes' },
  { label: 'Occasionally', value: 'occasionally' },
];

// Drinking
export const DRINKING_OPTIONS = [
  { label: 'No', value: 'no' },
  { label: 'Yes', value: 'yes' },
  { label: 'Occasionally', value: 'occasionally' },
];

// Family type
export const FAMILY_TYPES = [
  { label: 'Joint Family', value: 'joint' },
  { label: 'Nuclear Family', value: 'nuclear' },
];

// Family status
export const FAMILY_STATUS = [
  { label: 'Middle Class', value: 'middle_class' },
  { label: 'Upper Middle Class', value: 'upper_middle_class' },
  { label: 'Rich', value: 'rich' },
  { label: 'Affluent', value: 'affluent' },
];

// Tamil Stars (Nakshatras)
export const LANGUAGES = [
  'Tamil', 'English', 'Hindi', 'Telugu', 'Kannada',
  'Malayalam', 'Marathi', 'Urdu', 'Bengali', 'Gujarati',
  'Odia', 'Punjabi', 'French', 'German', 'Other',
];

// Interest/Hobby options
export const INTERESTS_OPTIONS = [
  'Reading', 'Travelling', 'Cooking', 'Music', 'Dancing',
  'Photography', 'Painting', 'Sports', 'Yoga', 'Meditation',
  'Movies', 'Gaming', 'Gardening', 'Volunteering', 'Writing',
  'Fitness', 'Shopping', 'Crafts', 'Technology', 'Nature',
];

// Notification types
export const NOTIFICATION_TYPES = {
  NEW_INTEREST: 'new_interest',
  INTEREST_ACCEPTED: 'interest_accepted',
  NEW_MESSAGE: 'new_message',
  PROFILE_VIEW: 'profile_view',
  DAILY_MATCH: 'daily_match',
  PREMIUM_EXPIRY: 'premium_expiry',
  SYSTEM: 'system',
};

// Activity types
export const ACTIVITY_TYPES = {
  PROFILE_VIEW: 'profile_view',
  INTEREST_SENT: 'interest_sent',
  INTEREST_RECEIVED: 'interest_received',
  MESSAGE_SENT: 'message_sent',
  PROFILE_UPDATED: 'profile_updated',
  PHOTO_UPLOADED: 'photo_uploaded',
  SUBSCRIPTION_PURCHASED: 'subscription_purchased',
};

// Tamil Translations for Horoscope
export const NAKSHATRA_TAMIL = {
  'Ashwini': 'அஸ்வினி (Ashwini)',
  'Bharani': 'பரணி (Bharani)',
  'Krittika': 'கார்த்திகை (Krittika)',
  'Rohini': 'ரோகிணி (Rohini)',
  'Mrigashira': 'மிருகசீரிஷம் (Mrigashira)',
  'Ardra': 'திருவாதிரை (Ardra)',
  'Punarvasu': 'புனர்பூசம் (Punarvasu)',
  'Pushya': 'பூசம் (Pushya)',
  'Ashlesha': 'ஆயில்யம் (Ashlesha)',
  'Magha': 'மகம் (Magha)',
  'Purva Phalguni': 'பூரம் (Purva Phalguni)',
  'Uttara Phalguni': 'உத்திரம் (Uttara Phalguni)',
  'Hasta': 'அஸ்தம் (Hasta)',
  'Chitra': 'சித்திரை (Chitra)',
  'Swati': 'சுவாதி (Swati)',
  'Vishakha': 'விசாகம் (Vishakha)',
  'Anuradha': 'அனுஷம் (Anuradha)',
  'Jyeshtha': 'கேட்டை (Jyeshtha)',
  'Mula': 'மூலம் (Mula)',
  'Purva Ashadha': 'பூராடம் (Purva Ashadha)',
  'Uttara Ashadha': 'உத்திராடம் (Uttara Ashadha)',
  'Shravana': 'திருவோணம் (Shravana)',
  'Dhanishta': 'அவிட்டம் (Dhanishta)',
  'Shatabhisha': 'சதயம் (Shatabhisha)',
  'Purva Bhadrapada': 'பூரட்டாதி (Purva Bhadrapada)',
  'Uttara Bhadrapada': 'உத்திரட்டாதி (Uttara Bhadrapada)',
  'Revati': 'ரேவதி (Revati)'
};

export const RASI_TAMIL = {
  'Mesha (Aries)': 'மேஷம் (Aries)',
  'Vrishabha (Taurus)': 'ரிஷபம் (Taurus)',
  'Mithuna (Gemini)': 'மிதுனம் (Gemini)',
  'Karka (Cancer)': 'கடகம் (Cancer)',
  'Simha (Leo)': 'சிம்மம் (Leo)',
  'Kanya (Virgo)': 'கன்னி (Virgo)',
  'Tula (Libra)': 'துலாம் (Libra)',
  'Vrischika (Scorpio)': 'விருச்சிகம் (Scorpio)',
  'Dhanu (Sagittarius)': 'தனுசு (Sagittarius)',
  'Makara (Capricorn)': 'மகரம் (Capricorn)',
  'Kumbha (Aquarius)': 'கும்பம் (Aquarius)',
  'Meena (Pisces)': 'மீனம் (Pisces)'
};

export const DOSHAM_TAMIL = {
  'none': 'இல்லை (No)',
  'chevvai': 'ஆம் (Chevvai)'
};

