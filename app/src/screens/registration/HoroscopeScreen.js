/**
 * Wedring Matrimony — Horoscope Registration (Step 5)
 */
import React, { useState, useCallback } from 'react';
import { View, Text, StyleSheet, ScrollView } from 'react-native';
import { colors } from '../../theme';
import Input from '../../components/common/Input';
import Button from '../../components/common/Button';
import OptionSelector from '../../components/registration/OptionSelector';
import StepIndicator from '../../components/registration/StepIndicator';
import { DOSHAM_OPTIONS } from '../../utils/constants';
import { getRasi, getNakshatra, getLagnam, getGothram } from '../../api/masterData';
import useProfileStore from '../../store/useProfileStore';
import useAuthStore from '../../store/useAuthStore';
const getTamil = (englishName) => {
  if (!englishName) return '';
  const key = englishName.trim();
  const map = {
    // Rasi
    'Mesha (Aries)': 'மேஷம் (Mesham)', 'Vrishabha (Taurus)': 'ரிஷபம் (Rishabam)', 'Mithuna (Gemini)': 'மிதுனம் (Mithunam)',
    'Karka (Cancer)': 'கடகம் (Kadagam)', 'Simha (Leo)': 'சிம்மம் (Simmam)', 'Kanya (Virgo)': 'கன்னி (Kanni)',
    'Tula (Libra)': 'துலாம் (Thulaam)', 'Vrischika (Scorpio)': 'விருச்சிகம் (Viruchigam)', 'Dhanu (Sagittarius)': 'தனுசு (Dhanusu)',
    'Makara (Capricorn)': 'மகரம் (Magaram)', 'Kumbha (Aquarius)': 'கும்பம் (Kumbam)', 'Meena (Pisces)': 'மீனம் (Meenam)',

    // Lagnam
    'Mesha Lagnam': 'மேஷ லக்னம் (Mesham)', 'Vrishabha Lagnam': 'ரிஷப லக்னம் (Rishabam)', 'Mithuna Lagnam': 'மிதுன லக்னம் (Mithunam)',
    'Karka Lagnam': 'கடக லக்னம் (Kadagam)', 'Simha Lagnam': 'சிம்ம லக்னம் (Simmam)', 'Kanya Lagnam': 'கன்னி லக்னம் (Kanni)',
    'Tula Lagnam': 'துலா லக்னம் (Thulaam)', 'Vrischika Lagnam': 'விருச்சிக லக்னம் (Viruchigam)', 'Dhanu Lagnam': 'தனுசு லக்னம் (Dhanusu)',
    'Makara Lagnam': 'மகர லக்னம் (Magaram)', 'Kumbha Lagnam': 'கும்ப லக்னம் (Kumbam)', 'Meena Lagnam': 'மீன லக்னம் (Meenam)',

    // Nakshatra
    'Ashwini': 'அஸ்வினி (Ashwini)', 'Bharani': 'பரணி (Bharani)', 'Krittika': 'கார்த்திகை (Krittika)', 'Rohini': 'ரோகிணி (Rohini)',
    'Mrigashira': 'மிருகசீரிடம் (Mrigashira)', 'Ardra': 'திருவாதிரை (Ardra)', 'Punarvasu': 'புனர்பூசம் (Punarvasu)', 'Pushya': 'பூசம் (Pushya)',
    'Ashlesha': 'ஆயில்யம் (Ashlesha)', 'Magha': 'மகம் (Magha)', 'Purva Phalguni': 'பூரம் (Purva Phalguni)', 'Uttara Phalguni': 'உத்திரம் (Uttara Phalguni)',
    'Hasta': 'அஸ்தம் (Hasta)', 'Chitra': 'சித்திரை (Chitra)', 'Swati': 'சுவாதி (Swati)', 'Vishakha': 'விசாகம் (Vishakha)',
    'Anuradha': 'அனுஷம் (Anuradha)', 'Jyeshtha': 'கேட்டை (Jyeshtha)', 'Mula': 'மூலம் (Mula)', 'Purva Ashadha': 'பூராடம் (Purva Ashadha)',
    'Uttara Ashadha': 'உத்திராடம் (Uttara Ashadha)', 'Shravana': 'திருவோணம் (Shravana)', 'Dhanishta': 'அவிட்டம் (Dhanishta)', 'Shatabhisha': 'சதயம் (Shatabhisha)',
    'Purva Bhadrapada': 'பூரட்டாதி (Purva Bhadrapada)', 'Uttara Bhadrapada': 'உத்திரட்டாதி (Uttara Bhadrapada)', 'Revati': 'ரேவதி (Revati)',

    // Gothram
    'Bharadwaja': 'பரத்வாஜ (Bharadwaja)', 'Kashyapa': 'கச்யப (Kashyapa)', 'Vashista': 'வசிஷ்ட (Vashista)', 'Vishwamitra': 'விஸ்வாமித்திர (Vishwamitra)',
    'Atri': 'அத்ரி (Atri)', 'Agastya': 'அகஸ்திய (Agastya)', 'Gautama': 'கௌதம (Gautama)', 'Jamadagni': 'ஜமதக்னி (Jamadagni)',
    'Kaundinya': 'கௌண்டின்ய (Kaundinya)', 'Shandilya': 'சாண்டில்ய (Shandilya)', 'Vatsa': 'வத்ஸ (Vatsa)', 'Kutsa': 'குத்ஸ (Kutsa)',
    'Harita': 'ஹரித (Harita)', 'Mudgala': 'முத்கல (Mudgala)', 'Parashara': 'பராசர (Parashara)', 'Bhrigu': 'பிருகு (Bhrigu)',
    'Angirasa': 'ஆங்கிரச (Angirasa)', 'Others': 'மற்றவை (Others)'
  };
  return map[key] || englishName;
};

const HoroscopeScreen = ({ navigation }) => {
  const user = useAuthStore((s) => s.user);
  const horoscope = useProfileStore((s) => s.horoscope);
  const { saveHoroscope, isLoading } = useProfileStore();

  const [stars, setStars] = useState([]);
  const [raasis, setRaasis] = useState([]);
  const [lagnams, setLagnams] = useState([]);
  const [gothrams, setGothrams] = useState([]);

  const [starId, setStarId] = useState(horoscope?.nakshatra_id || '');
  const [raasiId, setRaasiId] = useState(horoscope?.rasi_id || '');
  const [lagnamId, setLagnamId] = useState(horoscope?.lagnam_id || '');
  const [gothramId, setGothramId] = useState(horoscope?.gothram_id || '');
  const [gothramText, setGothramText] = useState(horoscope?.gothram_text || '');
  
  const parseDosham = (val) => {
    if (val === 'no') return 'none';
    if (val === 'yes') return 'chevvai';
    if (val === 'not_sure') return 'other';
    return val || 'none';
  };
  const [dosham, setDosham] = useState(parseDosham(horoscope?.dosham));
  const [dasaBalance, setDasaBalance] = useState(horoscope?.dasa_balance || '');

  React.useEffect(() => {
    getNakshatra().then(data => setStars(data.map(d => ({ label: getTamil(d.name), value: d.id }))));
    getRasi().then(data => setRaasis(data.map(d => ({ label: getTamil(d.name), value: d.id }))));
    getLagnam().then(data => setLagnams(data.map(d => ({ label: getTamil(d.name), value: d.id }))));
    getGothram().then(data => setGothrams(data.map(d => ({ label: getTamil(d.name), value: d.id }))));
  }, []);

  const handleNext = useCallback(async () => {
    if (!starId || !raasiId) {
      alert("Star and Raasi are mandatory fields.");
      return;
    }

    try {
      await saveHoroscope({
        user_id: user.id,
        nakshatra_id: starId,
        rasi_id: raasiId,
        lagnam_id: lagnamId || null,
        gothram_id: gothramId || null,
        gothram_text: gothramText.trim() || null,
        dosham: dosham || 'none',
        notes: dasaBalance.trim() || null, // renamed dasa_balance to notes in schema? Wait, schema has notes
      });
      navigation.navigate('Lifestyle');
    } catch (error) {
      console.error('Save error:', error);
    }
  }, [starId, raasiId, lagnamId, gothramId, gothramText, dosham, dasaBalance, user, saveHoroscope, navigation]);

  return (
    <View style={styles.container}>
      <StepIndicator currentStep={4} />
      <ScrollView
        style={styles.scroll}
        contentContainerStyle={styles.scrollContent}
        keyboardShouldPersistTaps="handled"
        showsVerticalScrollIndicator={false}
      >
        <Text style={styles.title}>Horoscope Details</Text>
        <Text style={styles.subtitle}>Help find astrologically compatible matches</Text>

        <View style={styles.infoBox}>
          <Text style={styles.infoIcon}>⭐</Text>
          <Text style={styles.infoText}>
            Horoscope details help us check star compatibility (10 Porutham) for matching profiles
          </Text>
        </View>

        <OptionSelector
          label="Star / Nakshatra (நட்சத்திரம்) *"
          options={stars}
          value={starId}
          onChange={setStarId}
          columns={3}
        />

        <OptionSelector
          label="Raasi / Moon Sign (ராசி) *"
          options={raasis}
          value={raasiId}
          onChange={setRaasiId}
          columns={3}
        />

        <OptionSelector
          label="Lagnam / Ascendant"
          options={lagnams}
          value={lagnamId}
          onChange={setLagnamId}
          columns={3}
        />

        <OptionSelector
          label="Gothram"
          options={gothrams}
          value={gothramId}
          onChange={setGothramId}
          columns={3}
        />

        {(!gothramId || gothrams.find(g => g.value === gothramId)?.label === 'Other') && (
          <Input
            label="Specify Gothram"
            value={gothramText}
            onChangeText={setGothramText}
            placeholder="Enter your gothram"
          />
        )}

        <OptionSelector
          label="Dosham"
          options={DOSHAM_OPTIONS}
          value={dosham}
          onChange={(val) => {
            setDosham(val);
            if (val === 'none') {
              setDasaBalance('');
            }
          }}
          columns={2}
        />

        {dosham !== 'none' && (
          <Input
            label="Dasa Balance (Notes)"
            value={dasaBalance}
            onChangeText={setDasaBalance}
            placeholder="e.g., Rahu 2 years"
          />
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
  subtitle: { fontSize: 14, color: colors.textSecondary, marginBottom: 16 },
  infoBox: {
    flexDirection: 'row', backgroundColor: colors.secondarySurface, padding: 14,
    borderRadius: 12, marginBottom: 24, alignItems: 'center',
  },
  infoIcon: { fontSize: 24, marginRight: 12 },
  infoText: { flex: 1, fontSize: 13, color: colors.secondary, lineHeight: 18 },
  buttonRow: { flexDirection: 'row', gap: 8, marginTop: 16 },
  backButton: { flex: 1 },
  skipButton: { flex: 0.8 },
  nextButton: { flex: 1.5 },
});

export default HoroscopeScreen;
