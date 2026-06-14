/**
 * Tamil Matrimony — Profile Store (Zustand)
 * User profile state management
 */
import { create } from 'zustand';
import * as profilesApi from '../api/profiles';

const useProfileStore = create((set, get) => ({
  // State
  profile: null,
  partnerPreferences: null,
  horoscope: null,
  photos: [],
  subscriptions: [],
  isProfileLoaded: false,
  isProfileComplete: false,
  registrationStep: 0,
  isLoading: false,
  error: null,

  // Actions
  setProfile: (profile) => set({
    profile,
    isProfileComplete: profile?.is_profile_complete || false,
    isProfileLoaded: true,
  }),

  setRegistrationStep: (step) => set({ registrationStep: step }),

  /**
   * Load current user's full profile
   */
  loadProfile: async (userId) => {
    try {
      set({ isLoading: true, error: null });
      const data = await profilesApi.getMyProfile(userId);
      set({
        profile: data,
        partnerPreferences: data?.partner_preferences,
        horoscope: data?.horoscope_details,
        photos: data?.photos || [],
        subscriptions: data?.subscriptions || [],
        isProfileComplete: data?.is_profile_complete || false,
        isProfileLoaded: true,
        isLoading: false,
      });
      return data;
    } catch (error) {
      console.warn('Profile load error:', error);
      
      // If we are in development mode, load a graceful mock profile to prevent blocking the UI
      if (__DEV__ || process.env.EXPO_PUBLIC_APP_ENV === 'development') {
        console.log('Generating graceful development mock profile for user:', userId);
        const mockProfile = {
          id: userId,
          display_name: 'New Matrimony User',
          gender: 'male',
          date_of_birth: '2000-01-01',
          religion: 'Hindu',
          caste: 'Gounder',
          is_profile_complete: false,
          profile_completion_percent: 10,
        };
        set({
          profile: mockProfile,
          partnerPreferences: { caste: ['Caste No Bar'] },
          horoscope: {},
          photos: [],
          subscriptions: [],
          isProfileComplete: false,
          isProfileLoaded: true,
          isLoading: false,
          error: null,
        });
        return mockProfile;
      }

      // Ensure we don't get stuck on the splash screen
      set({ 
        profile: null,
        isProfileComplete: false,
        isProfileLoaded: true,
        isLoading: false,
        error: error.message 
      });
      return null;
    }
  },

  /**
   * Save/update profile data
   */
  saveProfile: async (profileData) => {
    try {
      set({ isLoading: true, error: null });
      const currentProfile = get().profile || {};
      const mergedData = {
        ...currentProfile,
        ...profileData,
      };

      // Strip relational fields that aren't actual columns on the public.profiles table
      const {
        horoscope_details,
        partner_preferences,
        photos,
        profile_created_for,
        ...profileDbFields
      } = mergedData;

      let data;
      try {
        data = await profilesApi.upsertProfile(profileDbFields);
      } catch (dbError) {
        if (__DEV__ || process.env.EXPO_PUBLIC_APP_ENV === 'development') {
          console.warn('DB upsert failed, using development local state fallback:', dbError.message);
          data = profileDbFields;
        } else {
          throw dbError;
        }
      }

      set((state) => ({
        profile: { ...state.profile, ...mergedData, ...data },
        isProfileComplete: data?.is_profile_complete || false,
        isLoading: false,
      }));
      return data;
    } catch (error) {
      set({ isLoading: false, error: error.message });
      throw error;
    }
  },

  /**
   * Update specific profile fields
   */
  updateProfile: async (userId, updates) => {
    try {
      set({ isLoading: true, error: null });
      let data;
      try {
        data = await profilesApi.updateProfile(userId, updates);
      } catch (dbError) {
        if (__DEV__ || process.env.EXPO_PUBLIC_APP_ENV === 'development') {
          console.warn('DB update failed, using development local state fallback:', dbError.message);
          const currentProfile = get().profile || {};
          data = { ...currentProfile, ...updates };
        } else {
          throw dbError;
        }
      }
      set((state) => ({
        profile: { ...state.profile, ...data },
        isProfileComplete: data?.is_profile_complete || false,
        isLoading: false,
      }));
      return data;
    } catch (error) {
      set({ isLoading: false, error: error.message });
      throw error;
    }
  },

  /**
   * Save horoscope details
   */
  saveHoroscope: async (horoscopeData) => {
    try {
      set({ isLoading: true, error: null });
      let data;
      try {
        data = await profilesApi.upsertHoroscope(horoscopeData);
      } catch (dbError) {
        if (__DEV__ || process.env.EXPO_PUBLIC_APP_ENV === 'development') {
          console.warn('DB horoscope upsert failed, using development local state fallback:', dbError.message);
          data = horoscopeData;
        } else {
          throw dbError;
        }
      }
      set({ horoscope: data, isLoading: false });
      return data;
    } catch (error) {
      set({ isLoading: false, error: error.message });
      throw error;
    }
  },

  /**
   * Save partner preferences
   */
  savePartnerPreferences: async (prefData) => {
    try {
      set({ isLoading: true, error: null });
      let data;
      try {
        data = await profilesApi.upsertPartnerPreferences(prefData);
      } catch (dbError) {
        if (__DEV__ || process.env.EXPO_PUBLIC_APP_ENV === 'development') {
          console.warn('DB preferences upsert failed, using development local state fallback:', dbError.message);
          data = prefData;
        } else {
          throw dbError;
        }
      }
      set({ partnerPreferences: data, isLoading: false });
      return data;
    } catch (error) {
      set({ isLoading: false, error: error.message });
      throw error;
    }
  },

  /**
   * Add photo to local state
   */
  addPhoto: (photo) => set((state) => ({
    photos: [...state.photos, photo],
  })),

  /**
   * Replace or set primary photo
   */
  replacePrimaryPhoto: (newPhoto) => set((state) => {
    const existingIndex = state.photos.findIndex(p => p.id === newPhoto.id || p.is_primary);
    let newPhotos = [...state.photos];
    
    // Ensure all other photos are not primary
    newPhotos = newPhotos.map(p => ({ ...p, is_primary: false }));

    if (existingIndex >= 0) {
      newPhotos[existingIndex] = { ...newPhoto, is_primary: true };
    } else {
      newPhotos.push({ ...newPhoto, is_primary: true });
    }

    return { photos: newPhotos };
  }),

  /**
   * Remove photo from local state
   */
  removePhoto: (photoId) => set((state) => ({
    photos: state.photos.filter((p) => p.id !== photoId),
  })),

  /**
   * Set primary photo
   */
  setPrimaryPhoto: (photoId) => set((state) => ({
    photos: state.photos.map((p) => ({
      ...p,
      is_primary: p.id === photoId,
    })),
  })),

  /**
   * Reset store
   */
  reset: () => set({
    profile: null,
    partnerPreferences: null,
    horoscope: null,
    photos: [],
    subscriptions: [],
    isProfileLoaded: false,
    isProfileComplete: false,
    registrationStep: 0,
    isLoading: false,
    error: null,
  }),
}));

export default useProfileStore;
