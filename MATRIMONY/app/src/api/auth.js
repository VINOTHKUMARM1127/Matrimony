/**
 * Wedring Matrimony — Auth API
 * Authentication functions using Supabase Auth
 */
import supabase from './supabaseClient';

/**
 * Sign up with email/phone and password
 * @param {string} identifier - Email or phone
 * @param {string} password - Password
 * @param {object} metadata - User metadata
 */
export const signUpWithPassword = async (identifier, password, metadata = {}) => {
  const isEmail = /^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(identifier);
  const credentials = {
    password,
    options: { data: metadata }
  };
  
  if (isEmail) {
    credentials.email = identifier;
  } else {
    credentials.phone = identifier;
  }
  
  const { data, error } = await supabase.auth.signUp(credentials);
  if (error) throw error;
  return data;
};

/**
 * Sign in with email/phone and password
 * @param {string} identifier - Email or phone
 * @param {string} password - Password
 */
export const signInWithPassword = async (identifier, password) => {
  const isEmail = /^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(identifier);
  const credentials = { password };
  
  if (isEmail) {
    credentials.email = identifier;
  } else {
    credentials.phone = identifier;
  }
  
  const { data, error } = await supabase.auth.signInWithPassword(credentials);
  if (error) throw error;
  return data;
};
/**
 * Sign in with phone number (sends OTP)
 * @param {string} phone - Phone number with country code
 */
export const signInWithPhone = async (phone) => {
  const { data, error } = await supabase.auth.signInWithOtp({
    phone,
  });
  if (error) throw error;
  return data;
};

/**
 * Sign in with email address (sends OTP)
 * @param {string} email - Email address
 */
export const signInWithEmailOtp = async (email) => {
  const { data, error } = await supabase.auth.signInWithOtp({
    email,
  });
  if (error) throw error;
  return data;
};

/**
 * Verify OTP code for phone
 * @param {string} phone - Phone number with country code
 * @param {string} token - OTP code
 */
export const verifyOTP = async (phone, token) => {
  const { data, error } = await supabase.auth.verifyOtp({
    phone,
    token,
    type: 'sms',
  });
  if (error) throw error;
  return data;
};

/**
 * Verify OTP code for email
 * @param {string} email - Email address
 * @param {string} token - OTP code
 */
export const verifyEmailOTP = async (email, token) => {
  const { data, error } = await supabase.auth.verifyOtp({
    email,
    token,
    type: 'email',
  });
  if (error) throw error;
  return data;
};

/**
 * Verify OTP code for email signup confirmation
 * @param {string} email - Email address
 * @param {string} token - OTP code
 */
export const verifySignupOTP = async (email, token) => {
  const { data, error } = await supabase.auth.verifyOtp({
    email,
    token,
    type: 'signup',
  });
  if (error) throw error;
  return data;
};


/**
 * Sign out current user
 */
export const signOut = async () => {
  const { error } = await supabase.auth.signOut();
  if (error) throw error;
};

/**
 * Get current session
 */
export const getSession = async () => {
  const { data: { session }, error } = await supabase.auth.getSession();
  if (error) throw error;
  return session;
};

/**
 * Get current user
 */
export const getCurrentUser = async () => {
  const { data: { user }, error } = await supabase.auth.getUser();
  if (error) throw error;
  return user;
};

/**
 * Reset password via email
 */
export const resetPassword = async (email) => {
  const { data, error } = await supabase.auth.resetPasswordForEmail(email);
  if (error) throw error;
  return data;
};

/**
 * Update user metadata
 */
export const updateUserMetadata = async (metadata) => {
  const { data, error } = await supabase.auth.updateUser({
    data: metadata,
  });
  if (error) throw error;
  return data;
};

/**
 * Listen to auth state changes
 */
export const onAuthStateChange = (callback) => {
  return supabase.auth.onAuthStateChange(callback);
};

/**
 * Check if a user exists in auth.users by email or phone
 * @param {string} email
 * @param {string} phone
 */
export const checkUserExists = async (email, phone) => {
  const { data, error } = await supabase.rpc('check_user_exists', {
    p_email: email || '',
    p_phone: phone || '',
  });
  if (error) throw error;
  return !!data;
};

