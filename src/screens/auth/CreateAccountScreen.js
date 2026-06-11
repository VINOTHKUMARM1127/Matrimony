/**
 * Tamil Matrimony — Create Account Screen
 * New user registration with multi-step unified flow.
 */
import React, { useState, useCallback } from 'react';
import {
  View, Text, StyleSheet, TouchableOpacity, KeyboardAvoidingView, Platform, StatusBar, ScrollView, SafeAreaView, Alert
} from 'react-native';
import { SafeAreaView as SafeAreaContextView } from 'react-native-safe-area-context';
import { colors, borderRadius, shadows } from '../../theme';
import Input from '../../components/common/Input';
import Button from '../../components/common/Button';
import OptionSelector from '../../components/registration/OptionSelector';
import useAuthStore from '../../store/useAuthStore';

const PROFILE_FOR_OPTIONS = [
  { label: 'Myself', value: 'self' },
  { label: 'Son', value: 'son' },
  { label: 'Daughter', value: 'daughter' },
  { label: 'Brother', value: 'brother' },
  { label: 'Sister', value: 'sister' },
  { label: 'Friend', value: 'friend' },
  { label: 'Relative', value: 'relative' },
];

const MOTHER_TONGUE_OPTIONS = [
  { label: 'Tamil', value: 'tamil' },
  { label: 'English', value: 'english' },
  { label: 'Telugu', value: 'telugu' },
  { label: 'Malayalam', value: 'malayalam' },
  { label: 'Kannada', value: 'kannada' },
  { label: 'Hindi', value: 'hindi' },
];

const CreateAccountScreen = ({ navigation }) => {
  const [step, setStep] = useState(1);
  const [profileFor, setProfileFor] = useState('');
  const [motherTongue, setMotherTongue] = useState('');
  const [name, setName] = useState('');
  const [email, setEmail] = useState('');
  const [phone, setPhone] = useState('');
  const [password, setPassword] = useState('');
  const [errors, setErrors] = useState({});

  const { signUpWithPassword, checkUserExists, isLoading, clearError } = useAuthStore();

  const validateStep1 = () => {
    const newErrors = {};
    if (!profileFor) newErrors.profileFor = 'Please select who you are creating this profile for';
    if (!motherTongue) newErrors.motherTongue = 'Please select mother tongue';
    setErrors(newErrors);
    return Object.keys(newErrors).length === 0;
  };

  const validateStep2 = () => {
    const newErrors = {};
    if (!name.trim()) newErrors.name = 'Name is required';
    
    const isEmailValid = /^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(email.trim());
    if (!email.trim() || !isEmailValid) newErrors.email = 'Valid email is required';
    
    const cleanedPhone = phone.trim().replace(/[^0-9]/g, '');
    if (cleanedPhone.length < 10) newErrors.phone = 'Valid 10-digit phone number is required';

    if (!password) {
      newErrors.password = 'Password is required';
    } else if (password.length < 8) {
      newErrors.password = 'Password must be at least 8 characters';
    }

    setErrors(newErrors);
    return Object.keys(newErrors).length === 0;
  };

  const handleNextStep1 = () => {
    if (validateStep1()) {
      setStep(2);
    }
  };

  const handleSignUp = async () => {
    if (!validateStep2()) return;
    clearError();

    const enteredEmail = email.trim();
    const enteredPhone = phone.trim().replace(/[^0-9]/g, '');
    const formattedPhone = enteredPhone.startsWith('91') && enteredPhone.length > 10 
      ? `+${enteredPhone}` 
      : `+91${enteredPhone.slice(-10)}`;

    // Verify if the user already exists in the system
    const userAlreadyExists = await checkUserExists(enteredEmail, formattedPhone);
    
    if (userAlreadyExists) {
      Alert.alert(
        'Account Already Exists',
        'You already have an account. Please use a different email or phone number.',
        [
          { text: 'Use Different Details', style: 'cancel' },
          { text: 'Go to Login', onPress: () => navigation.navigate('Login') }
        ]
      );
      return;
    }

    // We will use email as the primary identifier for signup
    const success = await signUpWithPassword(enteredEmail, password, {
      profileFor,
      motherTongue,
      name,
      phone: formattedPhone
    });

    if (success) {
      // If auto-confirm is enabled, session is active and AppNavigator redirects to Registration.
      // If it requires email verification, we could alert the user:
      Alert.alert(
        'Account Created',
        'Your account has been created successfully. If you are not automatically logged in, please check your email to verify your account.',
        [{ text: 'OK', onPress: () => navigation.navigate('Login') }]
      );
    }
  };

  return (
    <SafeAreaContextView style={styles.safeArea}>
      <StatusBar barStyle="dark-content" backgroundColor={colors.background} />
      <KeyboardAvoidingView style={styles.container} behavior={Platform.OS === 'ios' ? 'padding' : undefined}>
        <ScrollView contentContainerStyle={styles.scrollContent} showsVerticalScrollIndicator={false} keyboardShouldPersistTaps="handled">
          
          <TouchableOpacity style={styles.backButton} onPress={() => step === 2 ? setStep(1) : navigation.goBack()}>
            <Text style={styles.backText}>← Back</Text>
          </TouchableOpacity>

          <View style={styles.header}>
            <View style={styles.logoBadge}>
              <Text style={styles.logoBadgeText}>✦</Text>
            </View>
            <Text style={styles.title}>Create Account</Text>
            <Text style={styles.subtitle}>Join Tamil Matrimony and find your perfect match</Text>
          </View>

          <View style={styles.form}>
            {step === 1 ? (
              <>
                <OptionSelector
                  label="Creating Profile For"
                  options={PROFILE_FOR_OPTIONS}
                  value={profileFor}
                  onChange={(val) => { setProfileFor(val); setErrors((prev) => ({ ...prev, profileFor: undefined })); }}
                  columns={2}
                  error={errors.profileFor}
                  required
                />
                
                <View style={{ marginTop: 16 }}>
                  <OptionSelector
                    label="Mother Tongue"
                    options={MOTHER_TONGUE_OPTIONS}
                    value={motherTongue}
                    onChange={(val) => { setMotherTongue(val); setErrors((prev) => ({ ...prev, motherTongue: undefined })); }}
                    columns={2}
                    error={errors.motherTongue}
                    required
                  />
                </View>

                <Button title="Next →" onPress={handleNextStep1} style={styles.submitBtn} />
              </>
            ) : (
              <>
                <Input
                  label="Full Name"
                  placeholder="Enter your full name"
                  value={name}
                  onChangeText={(text) => { setName(text); setErrors((prev) => ({ ...prev, name: undefined })); }}
                  error={errors.name}
                  required
                />
                <Input
                  label="Email ID"
                  placeholder="e.g., user@example.com"
                  value={email}
                  onChangeText={(text) => { setEmail(text); setErrors((prev) => ({ ...prev, email: undefined })); }}
                  keyboardType="email-address"
                  autoCapitalize="none"
                  error={errors.email}
                  required
                />
                <Input
                  label="Phone Number"
                  placeholder="e.g., 9876543210"
                  value={phone}
                  onChangeText={(text) => { setPhone(text); setErrors((prev) => ({ ...prev, phone: undefined })); }}
                  keyboardType="phone-pad"
                  error={errors.phone}
                  required
                />
                <Input
                  label="Password"
                  placeholder="Minimum 8 characters"
                  value={password}
                  onChangeText={(text) => { setPassword(text); setErrors((prev) => ({ ...prev, password: undefined })); }}
                  secureTextEntry
                  error={errors.password}
                  required
                />
                
                <Button 
                  title="Create Account" 
                  onPress={handleSignUp} 
                  loading={isLoading} 
                  style={{ marginTop: 16, marginBottom: 24 }} 
                />
              </>
            )}

            <View style={styles.signinRow}>
              <Text style={styles.signinText}>Already have an account? </Text>
              <TouchableOpacity onPress={() => navigation.navigate('Login')}>
                <Text style={styles.signinLink}>Sign In</Text>
              </TouchableOpacity>
            </View>
          </View>

        </ScrollView>
      </KeyboardAvoidingView>
    </SafeAreaContextView>
  );
};

const styles = StyleSheet.create({
  safeArea: { flex: 1, backgroundColor: colors.background },
  container: { flex: 1 },
  scrollContent: { flexGrow: 1, paddingHorizontal: 24, paddingBottom: 40, paddingTop: Platform.OS === 'ios' ? 10 : 40 },
  backButton: { paddingVertical: 8, marginBottom: 8 },
  backText: { fontSize: 16, color: colors.primary, fontWeight: '600' },
  header: { alignItems: 'center', marginBottom: 28 },
  logoBadge: { width: 56, height: 56, borderRadius: 28, backgroundColor: colors.secondarySurface, alignItems: 'center', justifyContent: 'center', marginBottom: 14, ...shadows.button },
  logoBadgeText: { fontSize: 26, color: colors.secondary },
  title: { fontSize: 28, fontWeight: '800', color: colors.primary, marginBottom: 6 },
  subtitle: { fontSize: 14, color: colors.textSecondary, textAlign: 'center', lineHeight: 20 },
  form: { flex: 1 },
  submitBtn: { marginTop: 24, marginBottom: 24 },
  verifyLabel: { fontSize: 14, fontWeight: '600', color: colors.textPrimary, marginTop: 16, marginBottom: 12 },
  verifyRow: { flexDirection: 'row', justifyContent: 'space-between', marginBottom: 24 },
  verifyBtn: { flex: 1 },
  signinRow: { flexDirection: 'row', justifyContent: 'center', alignItems: 'center', marginTop: 12 },
  signinText: { fontSize: 14, color: colors.textSecondary },
  signinLink: { fontSize: 14, color: colors.primary, fontWeight: '700' },
});

export default CreateAccountScreen;
