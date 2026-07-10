/**
 * Wedring Matrimony — Religion & Caste Registration (Step 2)
 */
import React, { useState, useCallback, useMemo, useEffect } from 'react';
import { View, Text, StyleSheet, ScrollView } from 'react-native';
import { colors } from '../../theme';
import Input from '../../components/common/Input';
import Button from '../../components/common/Button';
import OptionSelector from '../../components/registration/OptionSelector';
import StepIndicator from '../../components/registration/StepIndicator';
import SearchablePicker from '../../components/common/SearchablePicker';
import { getReligions, getCastes } from '../../api/masterData';
import useProfileStore from '../../store/useProfileStore';
import useAuthStore from '../../store/useAuthStore';

const ReligionCasteScreen = ({ navigation }) => {
  const user = useAuthStore((s) => s.user);
  const profile = useProfileStore((s) => s.profile);
  const { saveProfile, isLoading } = useProfileStore();

  const [religions, setReligions] = useState([]);
  const [castes, setCastes] = useState([]);
  
  const [religionId, setReligionId] = useState(profile?.religion_id || '');
  const [casteId, setCasteId] = useState(profile?.caste_id || '');
  const [subcasteText, setSubcasteText] = useState(profile?.sub_caste_text || '');
  const [errors, setErrors] = useState({});

  useEffect(() => {
    getReligions().then(data => {
      setReligions(data.map(r => ({ label: r.name, value: r.id })));
    });
  }, []);

  useEffect(() => {
    if (religionId) {
      getCastes(religionId).then(data => {
        setCastes(data.map(c => ({ label: c.name, value: c.id })));
      });
    } else {
      setCastes([]);
    }
  }, [religionId]);

  const validate = useCallback(() => {
    const newErrors = {};
    if (!religionId) newErrors.religionId = 'Please select your religion';
    if (!casteId && castes.length > 0) newErrors.casteId = 'Please select your caste';
    setErrors(newErrors);
    return Object.keys(newErrors).length === 0;
  }, [religionId, casteId, castes]);

  const handleNext = useCallback(async () => {
    if (!validate()) return;
    try {
      await saveProfile({
        id: user.id,
        religion_id: religionId,
        caste_id: casteId || null,
        sub_caste_text: subcasteText.trim() || null,

      });
      navigation.navigate('Education');
    } catch (error) {
      console.error('Save error:', error);
    }
  }, [validate, religion, caste, customCaste, subcaste, user, saveProfile, navigation]);

  return (
    <View style={styles.container}>
      <StepIndicator currentStep={1} />
      <ScrollView
        style={styles.scroll}
        contentContainerStyle={styles.scrollContent}
        keyboardShouldPersistTaps="handled"
        showsVerticalScrollIndicator={false}
      >
        <Text style={styles.title}>Religion & Community</Text>
        <Text style={styles.subtitle}>This helps us find compatible matches</Text>

        <OptionSelector
          label="Religion"
          options={religions}
          value={religionId}
          onChange={(val) => { setReligionId(val); setCasteId(''); }}
          columns={2}
          required
          error={errors.religionId}
        />

        {castes.length > 0 && (
          <SearchablePicker
            label="Caste"
            options={castes}
            value={casteId}
            onChange={(val) => { setCasteId(val); }}
            placeholder="Select your caste"
            searchPlaceholder="Search caste..."
          />
        )}

        <Input
          label="Sub-caste (Optional)"
          value={subcasteText}
          onChangeText={setSubcasteText}
          placeholder="Enter your sub-caste"
        />


        <View style={styles.buttonRow}>
          <Button
            title="← Back"
            onPress={() => navigation.goBack()}
            variant="outline"
            style={styles.backButton}
          />
          <Button
            title="Next →"
            onPress={handleNext}
            loading={isLoading}
            style={styles.nextButton}
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
  buttonRow: { flexDirection: 'row', gap: 12, marginTop: 16 },
  backButton: { flex: 1 },
  nextButton: { flex: 2 },
});

export default ReligionCasteScreen;
