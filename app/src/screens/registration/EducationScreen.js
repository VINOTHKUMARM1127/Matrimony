/**
 * Wedring Matrimony — Education & Career Registration (Step 3)
 */
import React, { useState, useCallback, useEffect } from 'react';
import { View, Text, StyleSheet, ScrollView } from 'react-native';
import { colors } from '../../theme';
import Input from '../../components/common/Input';
import Button from '../../components/common/Button';
import OptionSelector from '../../components/registration/OptionSelector';
import StepIndicator from '../../components/registration/StepIndicator';
import { INCOME_RANGES } from '../../utils/constants';
import { getEducationLevels, getOccupations } from '../../api/masterData';
import useProfileStore from '../../store/useProfileStore';
import useAuthStore from '../../store/useAuthStore';

const EducationScreen = ({ navigation }) => {
  const user = useAuthStore((s) => s.user);
  const profile = useProfileStore((s) => s.profile);
  const { saveProfile, isLoading } = useProfileStore();

  const [educationLevels, setEducationLevels] = useState([]);
  const [occupations, setOccupations] = useState([]);

  const [educationId, setEducationId] = useState(profile?.education_level_id || '');
  const [educationDetail, setEducationDetail] = useState('');
  const [occupationId, setOccupationId] = useState(profile?.occupation_id || '');
  const [occupationDetail, setOccupationDetail] = useState('');
  const [income, setIncome] = useState(profile?.annual_income || '');
  const [company, setCompany] = useState('');
  const [errors, setErrors] = useState({});

  useEffect(() => {
    getEducationLevels().then(data => {
      setEducationLevels(data.map(e => ({ label: e.name, value: e.id })));
    });
    getOccupations().then(data => {
      setOccupations(data.map(o => ({ label: o.name, value: o.id })));
    });
  }, []);

  const validate = useCallback(() => {
    const newErrors = {};
    if (!educationId) newErrors.educationId = 'Please select your education';
    if (!occupationId) newErrors.occupationId = 'Please select your occupation';
    
    const isNotWorking = occupations.find(o => o.value === occupationId)?.label === 'Not Working';
    if (!isNotWorking && !income) {
      newErrors.income = 'Please select your annual income';
    }
    setErrors(newErrors);
    return Object.keys(newErrors).length === 0;
  }, [educationId, occupationId, income, occupations]);

  const handleNext = useCallback(async () => {
    if (!validate()) return;
    try {
      const isNotWorking = occupations.find(o => o.value === occupationId)?.label === 'Not Working';
      await saveProfile({
        id: user.id,
        education_level_id: educationId,
        occupation_id: occupationId,
        annual_income: isNotWorking ? null : (income || null),
      });
      navigation.navigate('Family');
    } catch (error) {
      console.error('Save error:', error);
    }
  }, [validate, educationId, occupationId, income, occupations, user, saveProfile, navigation]);

  return (
    <View style={styles.container}>
      <StepIndicator currentStep={2} />
      <ScrollView
        style={styles.scroll}
        contentContainerStyle={styles.scrollContent}
        keyboardShouldPersistTaps="handled"
        showsVerticalScrollIndicator={false}
      >
        <Text style={styles.title}>Education & Career</Text>
        <Text style={styles.subtitle}>Share your professional details</Text>

        <OptionSelector
          label="Education"
          options={educationLevels}
          value={educationId}
          onChange={setEducationId}
          columns={3}
          required
          error={errors.educationId}
        />

        <Input
          label="Education Details (Optional)"
          value={educationDetail}
          onChangeText={setEducationDetail}
          placeholder="e.g., Anna University, 2020"
        />

        <OptionSelector
          label="Occupation"
          options={occupations}
          value={occupationId}
          onChange={(val) => {
            setOccupationId(val);
            const isNotWorking = occupations.find(o => o.value === val)?.label === 'Not Working';
            if (isNotWorking) {
              setOccupationDetail('');
              setCompany('');
              setIncome('');
            }
          }}
          columns={2}
          required
          error={errors.occupationId}
        />

        {occupations.find(o => o.value === occupationId)?.label !== 'Not Working' && occupationId !== '' && (
          <>
            <Input
              label="Job Details (Optional)"
              value={occupationDetail}
              onChangeText={setOccupationDetail}
              placeholder="e.g., Software Engineer at TCS"
            />

            <Input
              label="Company Name (Optional)"
              value={company}
              onChangeText={setCompany}
              placeholder="Enter company name"
            />

            <OptionSelector
              label="Annual Income"
              options={INCOME_RANGES}
              value={income}
              onChange={setIncome}
              columns={2}
              required
              error={errors.income}
            />
          </>
        )}

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
  buttonRow: { flexDirection: 'row', gap: 12, marginTop: 16 },
  backButton: { flex: 1 },
  nextButton: { flex: 2 },
});

export default EducationScreen;
