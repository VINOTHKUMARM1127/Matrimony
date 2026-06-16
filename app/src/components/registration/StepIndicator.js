/**
 * Wedring Matrimony — Registration StepIndicator Component
 * Animated progress stepper for registration flow
 */
import React from 'react';
import { View, Text, StyleSheet, Animated } from 'react-native';
import { colors } from '../../theme';

const STEPS = [
  { label: 'Basic', icon: '👤' },
  { label: 'Religion', icon: '🙏' },
  { label: 'Education', icon: '🎓' },
  { label: 'Family', icon: '👨‍👩‍👦' },
  { label: 'Horoscope', icon: '⭐' },
  { label: 'Lifestyle', icon: '🍽️' },
  { label: 'Photos', icon: '📷' },
  { label: 'Partner', icon: '💕' },
];

const StepIndicator = ({ currentStep = 0, totalSteps = 8 }) => {
  const progress = ((currentStep + 1) / totalSteps) * 100;

  return (
    <View style={styles.container}>
      {/* Progress bar */}
      <View style={styles.progressBar}>
        <View style={[styles.progressFill, { width: `${progress}%` }]} />
      </View>

      {/* Step info */}
      <View style={styles.stepInfo}>
        <View style={styles.stepLabel}>
          <Text style={styles.stepIcon}>{STEPS[currentStep]?.icon || '📝'}</Text>
          <Text style={styles.stepText}>{STEPS[currentStep]?.label || `Step ${currentStep + 1}`}</Text>
        </View>
        <Text style={styles.stepCount}>
          {currentStep + 1} of {totalSteps}
        </Text>
      </View>
    </View>
  );
};

const styles = StyleSheet.create({
  container: {
    paddingHorizontal: 16,
    paddingVertical: 12,
    backgroundColor: colors.background,
  },
  progressBar: {
    height: 4,
    backgroundColor: colors.surface,
    borderRadius: 2,
    overflow: 'hidden',
  },
  progressFill: {
    height: '100%',
    backgroundColor: colors.primary,
    borderRadius: 2,
  },
  stepInfo: {
    flexDirection: 'row',
    alignItems: 'center',
    justifyContent: 'space-between',
    marginTop: 10,
  },
  stepLabel: {
    flexDirection: 'row',
    alignItems: 'center',
  },
  stepIcon: {
    fontSize: 18,
    marginRight: 8,
  },
  stepText: {
    fontSize: 15,
    fontWeight: '600',
    color: colors.textPrimary,
  },
  stepCount: {
    fontSize: 13,
    color: colors.textMuted,
    fontWeight: '500',
  },
});

export default React.memo(StepIndicator);
