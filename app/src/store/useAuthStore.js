/**
 * Wedring Matrimony — Auth Store (Zustand)
 * Global authentication state management
 */
import { create } from 'zustand';
import * as authApi from '../api/auth';
import * as otpService from '../api/otpService';
import supabase from '../api/supabaseClient';

const useAuthStore = create((set, get) => ({
  // State
  user: null,
  session: null,
  isAuthenticated: false,
  isLoading: false,
  isInitializing: true,
  isOtpSent: false,
  error: null,
  pendingVerification: null,
  authListenerSubscription: null,

  // Actions
  setUser: (user) => set({ user, isAuthenticated: !!user }),
  setSession: (session) => set({ session }),
  setLoading: (isLoading) => set({ isLoading }),
  setError: (error) => set({ error }),
  clearError: () => set({ error: null }),
  clearPendingVerification: () => set({ pendingVerification: null }),

  /**
   * Initialize auth state - check for existing session
   */
  initialize: async () => {
    try {
      set({ isInitializing: true, error: null });

      // Listen for auth state changes if we don't have a listener yet
      if (!get().authListenerSubscription) {
        const { data: { subscription } } = supabase.auth.onAuthStateChange(async (event, session) => {
          // If the user is deliberately trapped in the OTP verification flow, ignore auto-login events!
          if (get().pendingVerification) {
            return;
          }

          set({ isInitializing: true });
          if (session) {
            try {
              const useProfileStore = require('./useProfileStore').default;
              await useProfileStore.getState().loadProfile(session.user.id);
            } catch (e) {
              console.warn('Profile load failed on auth state change:', e);
            }
            
            set({
              user: session.user,
              session,
              isAuthenticated: true,
              isInitializing: false,
            });
          } else {
            set({
              user: null,
              session: null,
              isAuthenticated: false,
              isInitializing: false,
            });
          }
        });

        set({ authListenerSubscription: subscription });
      }

      // Add a timeout to getSession just in case it hangs
      const sessionPromise = authApi.getSession();
      const timeoutPromise = new Promise((_, reject) => setTimeout(() => reject(new Error('getSession timeout')), 10000));
      const session = await Promise.race([sessionPromise, timeoutPromise]);
      
      if (session) {
        try {
          const useProfileStore = require('./useProfileStore').default;
          await useProfileStore.getState().loadProfile(session.user.id);
        } catch (e) {
          console.warn('Profile load failed on getSession() init:', e);
        }

        set({
          user: session.user,
          session,
          isAuthenticated: true,
          isInitializing: false,
        });
      } else {
        set({ isInitializing: false });
      }
    } catch (error) {
      console.error('Auth init error:', error);
      // If session retrieval fails (e.g. cache cleared, token invalid, or network error), 
      // safely fallback to unauthenticated state without polluting global error state.
      set({ 
        isInitializing: false,
        user: null,
        session: null,
        isAuthenticated: false
      });
    }
  },

  /**
   * Send OTP to phone number via Edge Function
   */
  sendOTP: async (phone) => {
    try {
      set({ isLoading: true, error: null, isOtpSent: false });
      await otpService.sendOTP(phone);
      set({ isLoading: false, isOtpSent: true });
      return true;
    } catch (error) {
      console.warn('[sendOTP] Error:', error.message);
      set({ isLoading: false, error: error.message });
      return false;
    }
  },

  /**
   * Send OTP to email address
   */
  sendEmailOTP: async (email) => {
    try {
      set({ isLoading: true, error: null, isOtpSent: false });
      await authApi.signInWithEmailOtp(email);
      set({ isLoading: false, isOtpSent: true });
      return true;
    } catch (error) {
      if (__DEV__ || process.env.EXPO_PUBLIC_APP_ENV === 'development') {
        console.warn('Email OTP Provider error, using development mock bypass:', error.message);
        set({ isLoading: false, isOtpSent: true, error: null });
        return true;
      }
      set({ isLoading: false, error: error.message });
      return false;
    }
  },

  /**
   * Resend OTP code for signup email confirmation
   */
  resendSignupOTP: async (email) => {
    try {
      set({ isLoading: true, error: null });
      const { error } = await supabase.auth.resend({
        type: 'signup',
        email,
      });
      if (error) throw error;
      set({ isLoading: false });
      return true;
    } catch (error) {
      if (__DEV__ || process.env.EXPO_PUBLIC_APP_ENV === 'development') {
        console.warn('Email Resend Provider error, using development mock bypass:', error.message);
        set({ isLoading: false, error: null });
        return true;
      }
      set({ isLoading: false, error: error.message });
      return false;
    }
  },

  /**
   * Verify OTP code for phone via Edge Function
   */
  verifyOTP: async (phone, otp) => {
    try {
      set({ isLoading: true, error: null });

      // Step 1: Verify OTP via Edge Function
      await otpService.verifyOTP(phone, otp);

      // Step 2: Create or sign-in Supabase user with this phone number
      let userData;
      try {
        const { data, error } = await supabase.auth.signInWithOtp({ phone });
        if (error) throw error;
        userData = data;
      } catch (supabaseError) {
        throw supabaseError;
      }

      // Pre-fetch profile prior to resolving auth state
      try {
        const useProfileStore = require('./useProfileStore').default;
        await useProfileStore.getState().loadProfile(userData.user.id);
      } catch (e) {
        console.warn('Profile load failed during OTP verification:', e);
      }

      set({
        user: userData.user,
        session: userData.session,
        isAuthenticated: true,
        isLoading: false,
        isOtpSent: false,
        pendingVerification: null,
      });
      return true;
    } catch (error) {
      set({ isLoading: false, error: error.message });
      return false;
    }
  },

  /**
   * Verify OTP code for email
   */
  verifyEmailOTP: async (email, otp) => {
    try {
      set({ isLoading: true, error: null });
      const data = await authApi.verifyEmailOTP(email, otp);

      // Pre-fetch profile prior to resolving auth state
      try {
        const useProfileStore = require('./useProfileStore').default;
        await useProfileStore.getState().loadProfile(data.user.id);
      } catch (e) {
        console.warn('Profile load failed during email OTP verification:', e);
      }

      set({
        user: data.user,
        session: data.session,
        isAuthenticated: true,
        isLoading: false,
        isOtpSent: false,
        pendingVerification: null,
      });
      return true;
    } catch (error) {
      set({ isLoading: false, error: error.message });
      return false;
    }
  },

  /**
   * Verify OTP code for signup email
   */
  verifySignupOTP: async (email, otp, phone) => {
    try {
      set({ isLoading: true, error: null });
      const data = await authApi.verifySignupOTP(email, otp);

      // Pre-fetch profile prior to resolving auth state
      try {
        const useProfileStore = require('./useProfileStore').default;
        await useProfileStore.getState().loadProfile(data.user.id);
      } catch (e) {
        console.warn('Profile load failed during signup OTP verification:', e);
      }

      if (phone) {
        try {
          const { upsertProfileContact } = require('../api/profiles');
          await upsertProfileContact({
            user_id: data.user.id,
            mobile_number: phone
          });
        } catch (phoneErr) {
          if (phoneErr.code === '23505' || (phoneErr.message && phoneErr.message.toLowerCase().includes('unique'))) {
            throw new Error('This phone number is already registered to another account.');
          }
          console.warn('Failed to save phone number during signup:', phoneErr);
        }
      }

      set({
        user: data.user,
        session: data.session,
        isAuthenticated: true,
        isLoading: false,
        isOtpSent: false,
        pendingVerification: null,
      });
      return true;
    } catch (error) {
      set({ isLoading: false, error: error.message });
      return false;
    }
  },

  /**
   * Sign up with identifier and password
   */
  signUpWithPassword: async (identifier, password, profileData) => {
    try {
      set({ isLoading: true, error: null, pendingVerification: identifier });
      const data = await authApi.signUpWithPassword(identifier, password, profileData);

      // Save initial profile data locally
      try {
        if (data.user && profileData) {
          const useProfileStore = require('./useProfileStore').default;
          await useProfileStore.getState().saveProfile({
            id: data.user.id,
            full_name: profileData.name,
            gender: 'male', // default required field
            dob: '2000-01-01', // default required field
          });
          // Save registration meta separately
          const { upsertRegistrationMeta } = require('../api/profiles');
          await upsertRegistrationMeta({
            user_id: data.user.id,
            creating_for: profileData.profileFor || 'self',
          });
        }
      } catch (e) {
        console.warn('Profile save failed during signup:', e);
      }

      // We force isAuthenticated to false here so the app NEVER jumps to the Basic Details page
      // before the OTP is entered. Even if Supabase returns a session, we trap them in the AuthStack.
      set({
        user: data.user,
        session: null, 
        isAuthenticated: false,
        isLoading: false,
      });
      return true;
    } catch (error) {
      set({ isLoading: false, error: error.message, pendingVerification: null });
      return false;
    }
  },

  /**
   * Sign in with identifier and password
   */
  signInWithPassword: async (identifier, password) => {
    try {
      set({ isLoading: true, error: null, pendingVerification: null });
      const data = await authApi.signInWithPassword(identifier, password);

      // Pre-fetch profile prior to resolving auth state
      try {
        const useProfileStore = require('./useProfileStore').default;
        await useProfileStore.getState().loadProfile(data.user.id);
      } catch (e) {
        console.warn('Profile load failed during password sign in:', e);
      }

      set({
        user: data.user,
        session: data.session,
        isAuthenticated: true,
        isLoading: false,
      });
      return true;
    } catch (error) {
      // Check if it's an unverified email error
      if (error.message && error.message.toLowerCase().includes('email not confirmed')) {
        set({ 
          isLoading: false, 
          error: 'Email not verified. Please verify your OTP to continue.',
          pendingVerification: identifier 
        });
        return false;
      }
      
      set({ isLoading: false, error: error.message });
      return false;
    }
  },

  /**
   * Sign out
   */
  signOut: async () => {
    try {
      set({ isLoading: true });
      await authApi.signOut();
      set({
        user: null,
        session: null,
        isAuthenticated: false,
        isLoading: false,
        isOtpSent: false,
        error: null,
      });
    } catch (error) {
      set({ isLoading: false, error: error.message });
    }
  },

  /**
   * Reset password
   */
  resetPassword: async (email) => {
    try {
      set({ isLoading: true, error: null });
      await authApi.resetPassword(email);
      set({ isLoading: false });
      return true;
    } catch (error) {
      set({ isLoading: false, error: error.message });
      return false;
    }
  },

  /**
   * Check if user exists by email or phone
   */
  checkUserExists: async (email, phone) => {
    try {
      set({ isLoading: true, error: null });
      const exists = await authApi.checkUserExists(email, phone);
      set({ isLoading: false });
      return exists;
    } catch (error) {
      console.warn('DB checkUserExists RPC failed:', error.message);
      set({ isLoading: false, error: error.message });
      return false;
    }
  },
}));

export default useAuthStore;
