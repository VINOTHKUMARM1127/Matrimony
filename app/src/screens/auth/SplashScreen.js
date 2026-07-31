/**
 * Wedring Matrimony — Splash Screen
 * Animated brand splash with auto-login check
 */
import React, { useEffect, useRef, useState } from 'react';
import { View, Text, StyleSheet, Animated, StatusBar, TouchableOpacity, Image } from 'react-native';
import { colors } from '../../theme';
import useAuthStore from '../../store/useAuthStore';
import useProfileStore from '../../store/useProfileStore';

const SplashScreen = ({ navigation }) => {
  const initialize = useAuthStore((s) => s.initialize);
  const isAuthenticated = useAuthStore((s) => s.isAuthenticated);
  const authError = useAuthStore((s) => s.error);
  
  const isProfileLoaded = useProfileStore((s) => s.isProfileLoaded);
  const profileError = useProfileStore((s) => s.error);
  const loadProfile = useProfileStore((s) => s.loadProfile);

  const logoScale = useRef(new Animated.Value(0.3)).current;
  const logoOpacity = useRef(new Animated.Value(0)).current;
  const taglineOpacity = useRef(new Animated.Value(0)).current;

  const showRetry = !!authError || !!profileError;

  useEffect(() => {
    // Animate logo
    Animated.sequence([
      Animated.parallel([
        Animated.spring(logoScale, {
          toValue: 1,
          tension: 50,
          friction: 7,
          useNativeDriver: true,
        }),
        Animated.timing(logoOpacity, {
          toValue: 1,
          duration: 600,
          useNativeDriver: true,
        }),
      ]),
      Animated.timing(taglineOpacity, {
        toValue: 1,
        duration: 400,
        useNativeDriver: true,
      }),
    ]).start();

    // Initialize auth (AppNavigator also does this, but it's idempotent)
    initialize();
  }, []);

  const handleRetry = () => {
    // Re-run initialization or profile load
    if (isAuthenticated && profileError) {
      const user = useAuthStore.getState().user;
      if (user?.id) {
        loadProfile(user.id);
      }
    } else {
      initialize();
    }
  };


  return (
    <View style={styles.container}>
      <StatusBar barStyle="light-content" backgroundColor={colors.primary} />

      <Animated.View
        style={[
          styles.logoContainer,
          {
            transform: [{ scale: logoScale }],
            opacity: logoOpacity,
          },
        ]}
      >
        <View style={styles.logoCircle}>
          <Image source={require('../../../assets/icon.png')} style={{ width: 100, height: 100, borderRadius: 50 }} />
        </View>
        <Text style={styles.appName}>Wedring Matrimony</Text>
      </Animated.View>

      <Animated.View style={[styles.taglineContainer, { opacity: taglineOpacity }]}>
        <Text style={styles.tagline}>Find Your Perfect Match</Text>
        <Text style={styles.taglineTamil}>உங்கள் சரியான வாழ்க்கைத் துணையை கண்டறியுங்கள்</Text>
      </Animated.View>

      <View style={styles.footer}>
        {showRetry ? (
          <TouchableOpacity style={styles.retryButton} onPress={handleRetry}>
            <Text style={styles.retryButtonText}>Connection slow. Tap to retry</Text>
          </TouchableOpacity>
        ) : (
          <View style={styles.loader}>
            <View style={styles.loaderDot} />
            <View style={[styles.loaderDot, styles.loaderDotDelay1]} />
            <View style={[styles.loaderDot, styles.loaderDotDelay2]} />
          </View>
        )}
      </View>
    </View>
  );
};

const styles = StyleSheet.create({
  container: {
    flex: 1,
    backgroundColor: colors.primary,
    alignItems: 'center',
    justifyContent: 'center',
  },
  logoContainer: {
    alignItems: 'center',
  },
  logoCircle: {
    width: 100,
    height: 100,
    borderRadius: 50,
    backgroundColor: 'rgba(255,255,255,0.2)',
    alignItems: 'center',
    justifyContent: 'center',
    marginBottom: 20,
  },
  logoIcon: {
    fontSize: 50,
  },
  appName: {
    fontSize: 32,
    fontWeight: '700',
    color: '#FFFFFF',
    letterSpacing: 1,
  },
  taglineContainer: {
    marginTop: 12,
    alignItems: 'center',
  },
  tagline: {
    fontSize: 16,
    color: 'rgba(255,255,255,0.9)',
    fontWeight: '500',
  },
  taglineTamil: {
    fontSize: 13,
    color: 'rgba(255,255,255,0.7)',
    marginTop: 4,
  },
  footer: {
    position: 'absolute',
    bottom: 60,
  },
  loader: {
    flexDirection: 'row',
    gap: 8,
  },
  loaderDot: {
    width: 8,
    height: 8,
    borderRadius: 4,
    backgroundColor: 'rgba(255,255,255,0.6)',
  },
  loaderDotDelay1: {
    opacity: 0.4,
  },
  loaderDotDelay2: {
    opacity: 0.2,
  },
  retryButton: {
    paddingVertical: 12,
    paddingHorizontal: 24,
    backgroundColor: 'rgba(255,255,255,0.2)',
    borderRadius: 24,
    borderWidth: 1,
    borderColor: 'rgba(255,255,255,0.3)',
  },
  retryButtonText: {
    color: '#FFFFFF',
    fontSize: 14,
    fontWeight: '600',
  },
});

export default SplashScreen;
