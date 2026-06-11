/**
 * Tamil Matrimony — SettingsScreen Component
 * Application preferences, profile management, and account settings index
 */
import React from 'react';
import { View, Text, StyleSheet, TouchableOpacity, ScrollView, Alert } from 'react-native';
import { colors } from '../../theme';
import { borderRadius } from '../../theme/spacing';
import useAuthStore from '../../store/useAuthStore';
import useProfileStore from '../../store/useProfileStore';
import { deactivateProfile } from '../../api/profiles';

const SettingsScreen = ({ navigation }) => {
  const signOut = useAuthStore((s) => s.signOut);
  const profile = useProfileStore((s) => s.profile);

  const handleLogout = () => {
    Alert.alert(
      'Logout',
      'Are you sure you want to sign out?',
      [
        { text: 'Cancel', style: 'cancel' },
        { 
          text: 'Logout', 
          style: 'destructive',
          onPress: async () => {
            await signOut();
          }
        }
      ]
    );
  };

  const handleDeactivate = () => {
    Alert.alert(
      'Got Married / Found a Match?',
      'Congratulations! If you deactivate your profile, it will no longer be visible to others in matches or search.',
      [
        { text: 'Cancel', style: 'cancel' },
        { 
          text: 'Deactivate', 
          style: 'destructive',
          onPress: async () => {
            try {
              if (profile?.id) {
                await deactivateProfile(profile.id);
                Alert.alert('Success', 'Your profile has been deactivated.');
                await signOut();
              }
            } catch (error) {
              Alert.alert('Error', 'Failed to deactivate profile.');
            }
          }
        }
      ]
    );
  };

  const menuItems = [
    { title: '✏️ Edit Profile', screen: 'EditProfile' },
    { title: '⚙️ Partner Preferences', screen: 'EditPreferences' },
    { title: '👑 Go Premium', screen: 'Premium' },
    { title: '🌐 Language / மொழி', screen: 'Language' },
    { title: '🔒 Privacy & Security', screen: 'Privacy' },
  ];

  return (
    <View style={styles.container}>
      <View style={styles.header}>
        <Text style={styles.headerTitle}>Settings</Text>
      </View>

      <ScrollView showsVerticalScrollIndicator={false}>
        {/* User Card */}
        {profile && (
          <View style={styles.profileCard}>
            <View style={styles.avatar}>
              <Text style={styles.avatarText}>👤</Text>
            </View>
            <View style={styles.profileText}>
              <Text style={styles.name}>{profile.display_name}</Text>
              <Text style={styles.status}>
                {profile.is_premium ? '👑 Premium Member' : 'Free Account'}
              </Text>
            </View>
          </View>
        )}

        {/* Menu list */}
        <View style={styles.menuContainer}>
          {menuItems.map((item, idx) => (
            <TouchableOpacity
              key={idx}
              style={styles.menuItem}
              onPress={() => navigation.navigate(item.screen)}
              activeOpacity={0.7}
            >
              <Text style={styles.menuItemText}>{item.title}</Text>
              <Text style={styles.chevron}>➔</Text>
            </TouchableOpacity>
          ))}
        </View>

        {/* Support items */}
        <View style={styles.menuContainer}>
          <TouchableOpacity style={styles.menuItem} onPress={() => {}} activeOpacity={0.7}>
            <Text style={styles.menuItemText}>📞 Help & Support</Text>
            <Text style={styles.chevron}>➔</Text>
          </TouchableOpacity>
          <TouchableOpacity style={styles.menuItem} onPress={() => {}} activeOpacity={0.7}>
            <Text style={styles.menuItemText}>📄 Terms of Service</Text>
            <Text style={styles.chevron}>➔</Text>
          </TouchableOpacity>
        </View>

        {/* Deactivate Profile */}
        <TouchableOpacity style={styles.deactivateButton} onPress={handleDeactivate} activeOpacity={0.8}>
          <Text style={styles.deactivateText}>💍 Got Married? Deactivate Profile</Text>
        </TouchableOpacity>

        {/* Logout */}
        <TouchableOpacity style={styles.logoutButton} onPress={handleLogout} activeOpacity={0.8}>
          <Text style={styles.logoutText}>Logout</Text>
        </TouchableOpacity>

        <Text style={styles.version}>Version 1.0.0 (Expo SDK 52)</Text>
      </ScrollView>
    </View>
  );
};

const styles = StyleSheet.create({
  container: {
    flex: 1,
    backgroundColor: colors.surface,
  },
  header: {
    paddingHorizontal: 16,
    paddingTop: 16,
    paddingBottom: 12,
    backgroundColor: colors.background,
    borderBottomWidth: 1,
    borderBottomColor: colors.borderLight,
  },
  headerTitle: {
    fontSize: 24,
    fontWeight: '700',
    color: colors.text,
  },
  profileCard: {
    flexDirection: 'row',
    alignItems: 'center',
    backgroundColor: colors.background,
    margin: 16,
    padding: 16,
    borderRadius: borderRadius.lg,
    borderWidth: 1,
    borderColor: colors.borderLight,
  },
  avatar: {
    width: 50,
    height: 50,
    borderRadius: 25,
    backgroundColor: colors.surface,
    justifyContent: 'center',
    alignItems: 'center',
  },
  avatarText: {
    fontSize: 24,
  },
  profileText: {
    marginLeft: 16,
  },
  name: {
    fontSize: 16,
    fontWeight: '700',
    color: colors.text,
  },
  status: {
    fontSize: 12,
    color: colors.textSecondary,
    marginTop: 2,
    fontWeight: '600',
  },
  menuContainer: {
    backgroundColor: colors.background,
    marginHorizontal: 16,
    marginBottom: 16,
    borderRadius: borderRadius.lg,
    borderWidth: 1,
    borderColor: colors.borderLight,
    overflow: 'hidden',
  },
  menuItem: {
    flexDirection: 'row',
    alignItems: 'center',
    justifyContent: 'space-between',
    paddingVertical: 14,
    paddingHorizontal: 16,
    borderBottomWidth: 1,
    borderBottomColor: colors.surface,
  },
  menuItemText: {
    fontSize: 14,
    fontWeight: '600',
    color: colors.text,
  },
  chevron: {
    fontSize: 12,
    color: colors.textMuted,
  },
  logoutButton: {
    marginHorizontal: 16,
    marginTop: 16,
    backgroundColor: 'rgba(239, 68, 68, 0.08)',
    borderColor: 'rgba(239, 68, 68, 0.2)',
    borderWidth: 1,
    paddingVertical: 14,
    borderRadius: borderRadius.lg,
    alignItems: 'center',
  },
  logoutText: {
    color: colors.error,
    fontWeight: '700',
    fontSize: 14,
  },
  deactivateButton: {
    marginHorizontal: 16,
    marginTop: 16,
    backgroundColor: colors.surfaceElevated,
    borderColor: colors.borderLight,
    borderWidth: 1,
    paddingVertical: 14,
    borderRadius: borderRadius.lg,
    alignItems: 'center',
  },
  deactivateText: {
    color: colors.textSecondary,
    fontWeight: '600',
    fontSize: 14,
  },
  version: {
    textAlign: 'center',
    fontSize: 11,
    color: colors.textMuted,
    marginTop: 32,
    marginBottom: 20,
  },
});

export default SettingsScreen;
