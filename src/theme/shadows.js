/**
 * Tamil Matrimony — Shadow / Elevation System
 * Premium soft shadows for a luxury floating feel
 */
import { Platform } from 'react-native';

const createShadow = (elevation, color = '#000') => {
  if (Platform.OS === 'android') {
    return { elevation };
  }

  const shadowMap = {
    0: { shadowOffset: { width: 0, height: 0 }, shadowRadius: 0, shadowOpacity: 0 },
    1: { shadowOffset: { width: 0, height: 1 }, shadowRadius: 3, shadowOpacity: 0.04 },
    2: { shadowOffset: { width: 0, height: 2 }, shadowRadius: 6, shadowOpacity: 0.06 },
    3: { shadowOffset: { width: 0, height: 4 }, shadowRadius: 10, shadowOpacity: 0.08 },
    4: { shadowOffset: { width: 0, height: 6 }, shadowRadius: 14, shadowOpacity: 0.10 },
    5: { shadowOffset: { width: 0, height: 8 }, shadowRadius: 20, shadowOpacity: 0.12 },
    6: { shadowOffset: { width: 0, height: 12 }, shadowRadius: 28, shadowOpacity: 0.15 },
  };

  const level = Math.min(elevation, 6);
  return {
    shadowColor: color,
    ...shadowMap[level],
  };
};

const shadows = {
  none: createShadow(0),
  xs: createShadow(1),
  sm: createShadow(2),
  md: createShadow(3),
  lg: createShadow(4),
  xl: createShadow(5),
  '2xl': createShadow(6),

  // Premium use cases
  card: createShadow(2),           // Feed cards — very subtle
  cardSoft: {                       // Ultra-subtle for flat card feel
    ...Platform.select({
      ios: {
        shadowColor: '#000',
        shadowOffset: { width: 0, height: 2 },
        shadowRadius: 8,
        shadowOpacity: 0.04,
      },
      android: { elevation: 1 },
    }),
  },
  cardFloat: {                      // Elevated floating cards
    ...Platform.select({
      ios: {
        shadowColor: '#000',
        shadowOffset: { width: 0, height: 4 },
        shadowRadius: 16,
        shadowOpacity: 0.08,
      },
      android: { elevation: 4 },
    }),
  },
  cardHover: createShadow(4),
  bottomTab: {                      // Premium tab bar with strong top shadow
    ...Platform.select({
      ios: {
        shadowColor: '#000',
        shadowOffset: { width: 0, height: -4 },
        shadowRadius: 16,
        shadowOpacity: 0.06,
      },
      android: { elevation: 12 },
    }),
  },
  bottomNav: {                      // Alias for bottomTab
    ...Platform.select({
      ios: {
        shadowColor: '#000',
        shadowOffset: { width: 0, height: -4 },
        shadowRadius: 16,
        shadowOpacity: 0.06,
      },
      android: { elevation: 12 },
    }),
  },
  modal: createShadow(6),
  button: createShadow(2),
  buttonFloat: createShadow(4),
  header: createShadow(2),
  fab: createShadow(5),
};

export default shadows;
