/**
 * Wedring Matrimony — EditPreferencesScreen Component
 * Interface to edit partner matching preferences (ages, heights, religions, castes, etc.)
 */
import React, { useState, useEffect } from 'react';
import { View, Text, StyleSheet, ScrollView } from 'react-native';
import { SafeAreaView } from 'react-native-safe-area-context';
import ScreenHeader from '../../components/common/ScreenHeader';
import { colors } from '../../theme';
import Input from '../../components/common/Input';
import Button from '../../components/common/Button';
import OptionSelector from '../../components/registration/OptionSelector';
import SearchablePicker from '../../components/common/SearchablePicker';
import useProfileStore from '../../store/useProfileStore';
import useAuthStore from '../../store/useAuthStore';
import useToastStore from '../../store/useToastStore';
import { HEIGHT_OPTIONS } from '../../utils/constants';
import { getReligions, getCastes } from '../../api/masterData';

const EditPreferencesScreen = ({ navigation }) => {
  const user = useAuthStore((s) => s.user);
  const profile = useProfileStore((s) => s.profile);
  const preferences = useProfileStore((s) => s.partnerPreferences);
  const savePartnerPreferences = useProfileStore((s) => s.savePartnerPreferences);
  const showToast = useToastStore((state) => state.showToast);

  const [religions, setReligions] = useState([]);
  const [castes, setCastes] = useState([]);

  useEffect(() => {
    getReligions().then(data => setReligions(data.map(r => ({ label: r.name, value: r.id }))));
  }, []);

  const [ageMin, setAgeMin] = useState(() => {
    if (preferences?.min_age) return String(preferences.min_age);
    if (profile?.dob) {
      const birth = new Date(profile.dob);
      const today = new Date();
      let age = today.getFullYear() - birth.getFullYear();
      return String(Math.max(18, age - 3));
    }
    return '18';
  });

  const [ageMax, setAgeMax] = useState(() => {
    if (preferences?.max_age) return String(preferences.max_age);
    if (profile?.dob) {
      const birth = new Date(profile.dob);
      const today = new Date();
      let age = today.getFullYear() - birth.getFullYear();
      return String(age);
    }
    return '60';
  });

  const [religionId, setReligionId] = useState(preferences?.religion_id || '');
  const [casteId, setCasteId] = useState(preferences?.caste_id || '');

  useEffect(() => {
    if (religionId) {
      getCastes(religionId).then(data => setCastes(data.map(c => ({ label: c.name, value: c.id }))));
    } else {
      setCastes([]);
    }
  }, [religionId]);

  const [heightMin, setHeightMin] = useState(() => {
    if (preferences?.min_height_cm) return String(preferences.min_height_cm);
    if (profile?.height_cm) return String(Math.max(140, profile.height_cm - 15));
    return '140';
  });

  const [heightMax, setHeightMax] = useState(() => {
    if (preferences?.max_height_cm) return String(preferences.max_height_cm);
    if (profile?.height_cm) return String(profile.height_cm);
    return '210';
  });
  
  const [isSaving, setIsSaving] = useState(false);

  const handleSave = async () => {
    try {
      setIsSaving(true);
      await savePartnerPreferences({
        user_id: user.id,
        min_age: ageMin ? parseInt(ageMin, 10) : 18,
        max_age: ageMax ? parseInt(ageMax, 10) : 60,
        religion_id: religionId || null,
        caste_id: casteId || null,
        min_height_cm: heightMin ? parseInt(heightMin, 10) : null,
        max_height_cm: heightMax ? parseInt(heightMax, 10) : null,
      });
      setIsSaving(false);
      showToast('success', 'Success', 'Partner preferences updated successfully!');
      navigation.goBack();
    } catch (err) {
      setIsSaving(false);
      showToast('error', 'Error', err.message || 'Failed to save preferences');
    }
  };

  return (
    <SafeAreaView style={styles.container} edges={['top', 'left', 'right']}>
      <ScreenHeader title="Partner Preferences" onBack={() => navigation.goBack()} />

      <ScrollView showsVerticalScrollIndicator={false} contentContainerStyle={styles.scroll}>
        <View style={styles.row}>
          <View style={styles.flex1}>
            <Input
              label="Min Age"
              value={ageMin}
              onChangeText={setAgeMin}
              keyboardType="numeric"
              placeholder="18"
            />
          </View>
          <View style={styles.flex1}>
            <Input
              label="Max Age"
              value={ageMax}
              onChangeText={setAgeMax}
              keyboardType="numeric"
              placeholder="60"
            />
          </View>
        </View>

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

        <Text style={{ fontSize: 14, fontWeight: '500', color: colors.textPrimary, marginBottom: -6 }}>Height Range</Text>
        <View style={styles.row}>
          <View style={styles.flex1}>
            <SearchablePicker
              placeholder="Min height"
              searchPlaceholder="Search height..."
              options={HEIGHT_OPTIONS}
              value={heightMin ? parseInt(heightMin, 10) : ''}
              onChange={(val) => setHeightMin(val ? String(val) : '')}
            />
          </View>
          <View style={styles.flex1}>
            <SearchablePicker
              placeholder="Max height"
              searchPlaceholder="Search height..."
              options={HEIGHT_OPTIONS}
              value={heightMax ? parseInt(heightMax, 10) : ''}
              onChange={(val) => setHeightMax(val ? String(val) : '')}
            />
          </View>
        </View>

        <Button
          title="Save Preferences"
          onPress={handleSave}
          loading={isSaving}
          style={styles.saveBtn}
        />
      </ScrollView>
    </SafeAreaView>
  );
};

const styles = StyleSheet.create({
  container: {
    flex: 1,
    backgroundColor: colors.background,
  },

  scroll: {
    padding: 16,
    gap: 16,
  },
  row: {
    flexDirection: 'row',
    gap: 16,
  },
  flex1: {
    flex: 1,
  },
  saveBtn: {
    marginTop: 20,
  },
});

export default EditPreferencesScreen;
