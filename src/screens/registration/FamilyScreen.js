/**
 * Tamil Matrimony — Family Details Registration (Step 4)
 */
import React, { useState, useCallback } from 'react';
import { View, Text, StyleSheet, ScrollView } from 'react-native';
import { colors } from '../../theme';
import Input from '../../components/common/Input';
import Button from '../../components/common/Button';
import OptionSelector from '../../components/registration/OptionSelector';
import StepIndicator from '../../components/registration/StepIndicator';
import { FAMILY_TYPES, FAMILY_STATUS, TN_DISTRICTS } from '../../utils/constants';
import useProfileStore from '../../store/useProfileStore';
import useAuthStore from '../../store/useAuthStore';

const FamilyScreen = ({ navigation }) => {
  const user = useAuthStore((s) => s.user);
  const profile = useProfileStore((s) => s.profile);
  const { saveProfile, isLoading } = useProfileStore();

  const [familyType, setFamilyType] = useState(profile?.family_type || '');
  const [familyStatus, setFamilyStatus] = useState(profile?.family_status || '');
  const [fatherOccupation, setFatherOccupation] = useState(profile?.father_occupation || '');
  const [motherOccupation, setMotherOccupation] = useState(profile?.mother_occupation || '');
  const [brothers, setBrothers] = useState(profile?.brothers_count?.toString() || '0');
  const [sisters, setSisters] = useState(profile?.sisters_count?.toString() || '0');
  const [brothersMarried, setBrothersMarried] = useState(profile?.brothers_married?.toString() || '0');
  const [sistersMarried, setSistersMarried] = useState(profile?.sisters_married?.toString() || '0');
  const [city, setCity] = useState(profile?.city || '');
  const [district, setDistrict] = useState(profile?.district || '');
  const [aboutMe, setAboutMe] = useState(profile?.about_me || '');

  const handleNext = useCallback(async () => {
    try {
      await saveProfile({
        id: user.id,
        family_type: familyType || null,
        family_status: familyStatus || null,
        father_occupation: fatherOccupation.trim() || null,
        mother_occupation: motherOccupation.trim() || null,
        brothers_count: parseInt(brothers) || 0,
        sisters_count: parseInt(sisters) || 0,
        brothers_married: parseInt(brothersMarried) || 0,
        sisters_married: parseInt(sistersMarried) || 0,
        city: city.trim() || null,
        district: district || null,
        about_me: aboutMe.trim() || null,
      });
      navigation.navigate('Horoscope');
    } catch (error) {
      console.error('Save error:', error);
    }
  }, [familyType, familyStatus, fatherOccupation, motherOccupation, brothers, sisters, brothersMarried, sistersMarried, city, district, aboutMe, user, saveProfile, navigation]);

  const districtOptions = TN_DISTRICTS.map((d) => ({ label: d, value: d }));

  return (
    <View style={styles.container}>
      <StepIndicator currentStep={3} />
      <ScrollView
        style={styles.scroll}
        contentContainerStyle={styles.scrollContent}
        keyboardShouldPersistTaps="handled"
        showsVerticalScrollIndicator={false}
      >
        <Text style={styles.title}>Family & Location</Text>
        <Text style={styles.subtitle}>Help matches know about your family</Text>

        <OptionSelector
          label="Family Type"
          options={FAMILY_TYPES}
          value={familyType}
          onChange={setFamilyType}
          columns={2}
        />

        <OptionSelector
          label="Family Status"
          options={FAMILY_STATUS}
          value={familyStatus}
          onChange={setFamilyStatus}
          columns={2}
        />

        <Input
          label="Father's Occupation"
          value={fatherOccupation}
          onChangeText={setFatherOccupation}
          placeholder="e.g., Government Employee"
        />

        <Input
          label="Mother's Occupation"
          value={motherOccupation}
          onChangeText={setMotherOccupation}
          placeholder="e.g., Homemaker"
        />

        <View style={styles.siblingRow}>
          <Input
            label="Brothers"
            value={brothers}
            onChangeText={setBrothers}
            keyboardType="number-pad"
            maxLength={2}
            containerStyle={styles.siblingInput}
          />
          <Input
            label="Married"
            value={brothersMarried}
            onChangeText={setBrothersMarried}
            keyboardType="number-pad"
            maxLength={2}
            containerStyle={styles.siblingInput}
          />
          <Input
            label="Sisters"
            value={sisters}
            onChangeText={setSisters}
            keyboardType="number-pad"
            maxLength={2}
            containerStyle={styles.siblingInput}
          />
          <Input
            label="Married"
            value={sistersMarried}
            onChangeText={setSistersMarried}
            keyboardType="number-pad"
            maxLength={2}
            containerStyle={styles.siblingInput}
          />
        </View>

        <Text style={styles.sectionTitle}>📍 Location</Text>

        <Input
          label="City"
          value={city}
          onChangeText={setCity}
          placeholder="Enter your city"
        />

        <OptionSelector
          label="District"
          options={districtOptions}
          value={district}
          onChange={setDistrict}
          columns={3}
        />

        <Input
          label="About Me"
          value={aboutMe}
          onChangeText={setAboutMe}
          placeholder="Write a brief about yourself..."
          multiline
          numberOfLines={4}
          maxLength={500}
        />

        <View style={styles.buttonRow}>
          <Button title="← Back" onPress={() => navigation.goBack()} variant="outline" style={styles.backButton} />
          <Button title="Next →" onPress={handleNext} loading={isLoading} style={styles.nextButton} />
        </View>
      </ScrollView>
    </View>
  );
};

const styles = StyleSheet.create({
  container: { flex: 1, backgroundColor: colors.background },
  scroll: { flex: 1 },
  scrollContent: { padding: 16, paddingBottom: 40 },
  title: { fontSize: 24, fontWeight: '700', color: colors.textPrimary, marginBottom: 4 },
  subtitle: { fontSize: 14, color: colors.textSecondary, marginBottom: 24 },
  sectionTitle: { fontSize: 18, fontWeight: '600', color: colors.textPrimary, marginTop: 8, marginBottom: 16 },
  siblingRow: { flexDirection: 'row', gap: 8 },
  siblingInput: { flex: 1 },
  buttonRow: { flexDirection: 'row', gap: 12, marginTop: 16 },
  backButton: { flex: 1 },
  nextButton: { flex: 2 },
});

export default FamilyScreen;
