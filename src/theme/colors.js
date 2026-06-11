/**
 * Tamil Matrimony — Brand Color Palette
 * Premium warm orange + luxury gold + warm white design system
 */

export const palette = {
  // Primary — Warm Matrimonial Orange
  orange50: '#FFF5EE',
  orange100: '#FFE8D6',
  orange200: '#FFD0AD',
  orange300: '#FFB380',
  orange400: '#F49352',
  orange500: '#E8631A',
  orange600: '#C44D10',
  orange700: '#A33D0C',
  orange800: '#7D3010',

  // Secondary — Trustworthy Teal
  teal50: '#F0FAF8',
  teal100: '#D4F1EC',
  teal200: '#A8E4D8',
  teal300: '#6DCFBD',
  teal400: '#3AB8A3',
  teal500: '#1A8A76',
  teal600: '#14705F',
  teal700: '#0F5A4C',

  // Gold — Premium / Luxury
  gold50: '#FFFDF0',
  gold100: '#FFF8DC',
  gold200: '#FFEFB0',
  gold300: '#FFE082',
  gold400: '#F5CB5C',
  gold500: '#D4A857',
  gold600: '#B8922A',
  gold700: '#8B6F1E',

  // Neutrals — Warm undertone
  white: '#FFFFFF',
  gray50: '#FAFAF8',
  gray100: '#F5F4F1',
  gray200: '#ECEAE6',
  gray300: '#D6D3CD',
  gray400: '#A8A29E',
  gray500: '#78716C',
  gray600: '#57534E',
  gray700: '#44403C',
  gray800: '#292524',
  gray900: '#1C1917',
  black: '#000000',

  // Status
  red50: '#FEF2F2',
  red500: '#EF4444',
  red600: '#DC2626',
  green50: '#ECFDF5',
  green500: '#22C55E',
  green600: '#16A34A',
  yellow50: '#FFFBEB',
  yellow500: '#F59E0B',
  yellow600: '#D97706',
};

const colors = {
  // Brand
  primary: palette.orange500,
  primaryLight: palette.orange300,
  primaryDark: palette.orange700,
  primarySurface: palette.orange50,
  primaryMuted: palette.orange100,

  secondary: palette.teal500,
  secondaryLight: palette.teal300,
  secondaryDark: palette.teal700,
  secondarySurface: palette.teal50,

  // Backgrounds — Warm whites
  background: palette.white,
  surface: palette.gray50,
  surfaceElevated: palette.white,
  surfacePressed: palette.gray100,
  sectionBackground: '#FFF9F5',
  cardBackground: palette.white,

  // Text
  text: palette.gray900,
  textPrimary: palette.gray900,
  textSecondary: palette.gray500,
  textMuted: palette.gray400,
  textInverse: palette.white,
  textLink: palette.teal500,

  // Borders
  border: palette.gray200,
  borderLight: palette.gray100,
  borderFocused: palette.orange500,

  // Status
  success: palette.green500,
  successLight: palette.green50,
  warning: palette.yellow500,
  warningLight: palette.yellow50,
  error: palette.red500,
  errorLight: palette.red50,

  // Premium / Gold
  gold: palette.gold500,
  goldLight: palette.gold50,
  goldDark: palette.gold700,
  goldBorder: palette.gold400,
  goldSurface: palette.gold100,

  // Interest Interaction System
  interestActive: palette.orange500,
  interestOutline: palette.gray300,
  shortlistGold: palette.gold500,
  connectTeal: palette.teal500,
  declineRed: palette.red500,
  declineSurface: palette.red50,

  // Specific UI
  verified: palette.green500,
  online: palette.green500,
  offline: palette.gray400,
  skeleton: palette.gray200,
  shimmer: palette.gray100,
  overlay: 'rgba(0, 0, 0, 0.5)',
  overlayLight: 'rgba(0, 0, 0, 0.3)',
  shadow: 'rgba(0, 0, 0, 0.06)',
  shadowDark: 'rgba(0, 0, 0, 0.12)',

  // Gradients (used as array references)
  gradientPrimaryStart: palette.orange500,
  gradientPrimaryEnd: palette.orange600,
  gradientGoldStart: palette.gold400,
  gradientGoldEnd: palette.gold600,

  // Tab bar
  tabActive: palette.orange500,
  tabInactive: palette.gray400,

  // Chat
  chatBubbleSent: palette.orange500,
  chatBubbleReceived: palette.gray100,
  chatTextSent: palette.white,
  chatTextReceived: palette.gray900,
};

export default colors;
