import { create } from 'zustand';
import supabase from '../api/supabaseClient';

const useAuthStore = create((set) => ({
  user: null,
  isAuthenticated: false,
  isInitializing: true,

  initialize: async () => {
    try {
      const { data: { session } } = await supabase.auth.getSession();
      set({
        user: session?.user || null,
        isAuthenticated: !!session?.user,
        isInitializing: false,
      });

      supabase.auth.onAuthStateChange((_event, session) => {
        set({
          user: session?.user || null,
          isAuthenticated: !!session?.user,
        });
      });
    } catch (error) {
      console.error('Auth initialization failed', error);
      set({ isInitializing: false });
    }
  },

  signIn: async (email, password) => {
    const { data, error } = await supabase.auth.signInWithPassword({
      email,
      password,
    });
    if (error) throw error;
    set({ user: data.user, isAuthenticated: true });
    return data;
  },

  signOut: async () => {
    await supabase.auth.signOut();
    set({ user: null, isAuthenticated: false });
  },
}));

export default useAuthStore;
