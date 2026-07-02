/**
 * Wedring Matrimony — Partner Preference Registration (Step 8 - Final)
 */
import React, { useState, useCallback, useEffect, useMemo } from 'react';
import { View, Text, StyleSheet, ScrollView, Alert } from 'react-native';
import { colors } from '../../theme';
import Input from '../../components/common/Input';
import Button from '../../components/common/Button';
import OptionSelector from '../../components/registration/OptionSelector';
import StepIndicator from '../../components/registration/StepIndicator';
import {
  FOOD_HABITS,
  MARITAL_STATUS, HEIGHT_OPTIONS,
} from '../../utils/constants';
import { getReligions, getCastes, getEducationLevels, getOccupations } from '../../api/masterData';
import SearchablePicker from '../../components/common/SearchablePicker';
import useProfileStore from '../../store/useProfileStore';
import useAuthStore from '../../store/useAuthStore';
import computeCompleteness from '../../utils/profileCompleteness';

const PartnerPreferenceScreen = ({ navigation }) => {
  const user = useAuthStore((s) => s.user);
  const profile = useProfileStore((s) => s.profile);
  const { savePartnerPreferences, updateProfile, isLoading } = useProfileStore();

  const [religions, setReligions] = useState([]);
  const [castes, setCastes] = useState([]);
  const [educationLevels, setEducationLevels] = useState([]);
  const [occupations, setOccupations] = useState([]);

  useEffect(() => {
    getReligions().then(data => setReligions(data.map(r => ({ label: r.name, value: r.id }))));
    getEducationLevels().then(data => setEducationLevels(data.map(e => ({ label: e.name, value: e.id }))));
    getOccupations().then(data => setOccupations(data.map(o => ({ label: o.name, value: o.id }))));
  }, []);

  const [ageMin, setAgeMin] = useState(() => {
    if (profile?.dob) {
      const birth = new Date(profile.dob);
      const today = new Date();
      let age = today.getFullYear() - birth.getFullYear();
      return String(Math.max(18, age - 3));
    }
    return '21';
  });

  const [ageMax, setAgeMax] = useState(() => {
    if (profile?.dob) {
      const birth = new Date(profile.dob);
      const today = new Date();
      let age = today.getFullYear() - birth.getFullYear();
      return String(age);
    }
    return '35';
  });

  const [heightMin, setHeightMin] = useState(() => {
    if (profile?.height_cm) {
      return String(Math.max(140, profile.height_cm - 15));
    }
    return '140';
  });

  const [heightMax, setHeightMax] = useState(() => {
    if (profile?.height_cm) {
      return String(profile.height_cm);
    }
    return '210';
  });

  const [maritalStatus, setMaritalStatus] = useState('');
  const [religionId, setReligionId] = useState(profile?.religion_id || '');
  const [casteId, setCasteId] = useState('');
  
  useEffect(() => {
    if (religionId) {
      getCastes(religionId).then(data => setCastes(data.map(c => ({ label: c.name, value: c.id }))));
    } else {
      setCastes([]);
    }
  }, [religionId]);

  const [educationId, setEducationId] = useState('');
  const [occupationId, setOccupationId] = useState('');
  const [foodHabit, setFoodHabit] = useState('');

  const handleComplete = useCallback(async () => {
    try {
      const prefPayload = {
        user_id: user.id,
        min_age: parseInt(ageMin) || 18,
        max_age: parseInt(ageMax) || 60,
        min_height_cm: heightMin ? parseInt(heightMin) : null,
        max_height_cm: heightMax ? parseInt(heightMax) : null,
        marital_status: maritalStatus || null,
        religion_id: religionId || null,
        caste_id: casteId || null,
        education_level_id: educationId || null,
        occupation_id: occupationId || null,
        food_habit: foodHabit || null,
      };
      
      await savePartnerPreferences(prefPayload);

      const { profile, horoscope, photos } = useProfileStore.getState();
      const { percent } = computeCompleteness(profile || {}, {
        horoscope,
        preferences: prefPayload,
        photos,
      });

      await updateProfile(user.id, {
        profile_completion_percent: percent,
      });

      Alert.alert(
        '🎉 Profile Complete!',
        `Your profile is ${percent}% complete. Start exploring matches!`,
        [{ text: 'Let\'s Go!', onPress: () => {} }]
      );
    } catch (error) {
      console.error('Save error:', error);
      Alert.alert('Error', error.message || 'Failed to save preferences. Please try again.');
    }
  }, [ageMin, ageMax, heightMin, heightMax, maritalStatus, religionId, casteId, educationId, occupationId, foodHabit, user, savePartnerPreferences, updateProfile]);

  return (
    <View style={styles.container}>
      <StepIndicator currentStep={7} />
      <ScrollView
        style={styles.scroll}
        contentContainerStyle={styles.scrollContent}
        showsVerticalScrollIndicator={false}
      >
        <Text style={styles.title}>Partner Preferences</Text>
        <Text style={styles.subtitle}>What are you looking for in a partner?</Text>

        <Text style={styles.sectionTitle}>Age Range</Text>
        <View style={styles.rangeRow}>
          <Input
            label="Min Age"
            value={ageMin}
            onChangeText={setAgeMin}
            keyboardType="number-pad"
            maxLength={2}
            containerStyle={styles.rangeInput}
          />
          <Text style={styles.rangeDash}>to</Text>
          <Input
            label="Max Age"
            value={ageMax}
            onChangeText={setAgeMax}
            keyboardType="number-pad"
            maxLength={2}
            containerStyle={styles.rangeInput}
          />
        </View>

        <Text style={styles.sectionTitle}>Height Range</Text>
        <View style={styles.rangeRow}>
          <View style={{ flex: 1 }}>
            <SearchablePicker
              label="Min Height"
              placeholder="Min height"
              searchPlaceholder="Search height..."
              options={HEIGHT_OPTIONS}
              value={heightMin ? parseInt(heightMin, 10) : ''}
              onChange={(val) => setHeightMin(val ? String(val) : '')}
            />
          </View>
          <View style={{ flex: 1 }}>
            <SearchablePicker
              label="Max Height"
              placeholder="Max height"
              searchPlaceholder="Search height..."
              options={HEIGHT_OPTIONS}
              value={heightMax ? parseInt(heightMax, 10) : ''}
              onChange={(val) => setHeightMax(val ? String(val) : '')}
            />
          </View>
        </View>

        <OptionSelector
          label="Preferred Marital Status"
          options={MARITAL_STATUS}
          value={maritalStatus}
          onChange={setMaritalStatus}
          columns={2}
        />

        <OptionSelector
          label="Preferred Religion"
          options={religions}
          value={religionId}
          onChange={(val) => { setReligionId(val); setCasteId(''); }}
          columns={2}
        />

        {castes.length > 0 && (
          <SearchablePicker
            label="Preferred Caste"
            placeholder="Select preferred caste"
            searchPlaceholder="Search caste..."
            options={castes}
            value={casteId}
            onChange={setCasteId}
          />
        )}

        <OptionSelector
          label="Preferred Education"
          options={educationLevels.slice(0, 13)}
          value={educationId}
          onChange={setEducationId}
          columns={3}
        />

        <OptionSelector
          label="Preferred Occupation"
          options={occupations.slice(0, 10)}
          value={occupationId}
          onChange={setOccupationId}
          columns={2}
        />

        <OptionSelector
          label="Preferred Food Habit"
          options={FOOD_HABITS}
          value={foodHabit}
          onChange={setFoodHabit}
          columns={3}
        />

        <View style={styles.buttonRow}>
          <Button title="← Back" onPress={() => navigation.goBack()} variant="outline" style={styles.backButton} />
          <Button
            title="Complete Profile ✓"
            onPress={handleComplete}
            loading={isLoading}
            style={styles.completeButton}
          />
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
  sectionTitle: { fontSize: 16, fontWeight: '600', color: colors.textPrimary, marginBottom: 8 },
  rangeRow: { flexDirection: 'row', alignItems: 'center', gap: 12, marginBottom: 8 },
  rangeInput: { flex: 1, marginBottom: 0 },
  rangeDash: { fontSize: 14, color: colors.textMuted, marginTop: 20 },
  buttonRow: { flexDirection: 'row', gap: 12, marginTop: 24 },
  backButton: { flex: 1 },
  completeButton: { flex: 2 },
});

export default PartnerPreferenceScreen;
