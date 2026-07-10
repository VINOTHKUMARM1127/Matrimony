/**
 * Wedring Matrimony — EditProfileScreen Component (Premium Redesign)
 * Tabbed editor for Personal, Family, and Lifestyle details.
 */
import React, { useState, useEffect } from 'react';
import {
  View,
  Text,
  StyleSheet,
  ScrollView,
  Alert,
  TouchableOpacity,
  KeyboardAvoidingView,
  Platform,
  Image,
  ActivityIndicator,
} from 'react-native';
import * as ImagePicker from 'expo-image-picker';
import { SafeAreaView } from 'react-native-safe-area-context';
import Animated, { FadeIn, FadeOut } from 'react-native-reanimated';
import { colors } from '../../theme';
import { borderRadius, layout } from '../../theme/spacing';
import shadows from '../../theme/shadows';
import Input from '../../components/common/Input';
import Button from '../../components/common/Button';
import SearchablePicker from '../../components/common/SearchablePicker';
import ScreenHeader from '../../components/common/ScreenHeader';
import useProfileStore from '../../store/useProfileStore';
import useAuthStore from '../../store/useAuthStore';
import useToastStore from '../../store/useToastStore';
import { uploadProfilePhoto, deleteProfilePhoto, setPrimaryProfilePhoto } from '../../api/profiles';
import { 
  HEIGHT_OPTIONS, WEIGHT_OPTIONS, FOOD_HABITS, MARITAL_STATUS, 
  DOSHAM_OPTIONS, INCOME_RANGES, SMOKING_OPTIONS, DRINKING_OPTIONS,
  FAMILY_TYPES, FAMILY_STATUS
} from '../../utils/constants';
import { 
  getCountries, getStates, getDistricts, getCities, 
  getOccupations, getNakshatra, getRasi, getLagnam, getGothram,
  getReligions, getCastes, getEducationLevels
} from '../../api/masterData';

const TABS = [
  { id: 'personal', label: 'Personal' },
  { id: 'family', label: 'Family' },
  { id: 'lifestyle', label: 'Lifestyle' },
  { id: 'horoscope', label: 'Horoscope' },
  { id: 'photos', label: 'Photos' },
];

const EditProfileScreen = ({ route, navigation }) => {
  const user = useAuthStore((s) => s.user);
  const profile = useProfileStore((s) => s.profile);
  const horoscope = useProfileStore((s) => s.horoscope);
  const photos = useProfileStore((s) => s.photos);
  const updateProfile = useProfileStore((s) => s.updateProfile);
  const saveHoroscope = useProfileStore((s) => s.saveHoroscope);
  const addPhoto = useProfileStore((s) => s.addPhoto);
  const removePhoto = useProfileStore((s) => s.removePhoto);
  const setPrimaryPhoto = useProfileStore((s) => s.setPrimaryPhoto);
  const saveFamilyDetails = useProfileStore((s) => s.saveFamilyDetails);
  const saveLifestyle = useProfileStore((s) => s.saveLifestyle);

  const initialTab = route?.params?.initialTab || 'personal';
  const [activeTab, setActiveTab] = useState(initialTab);
  const [isSaving, setIsSaving] = useState(false);
  const [isUploading, setIsUploading] = useState(false);
  const showToast = useToastStore((state) => state.showToast);

  // Personal Fields
  const [displayName, setDisplayName] = useState(profile?.full_name || '');
  const [aboutMe, setAboutMe] = useState(profile?.about_me || '');
  const [countryId, setCountryId] = useState(profile?.country_id || '');
  const [stateId, setStateId] = useState(profile?.state_id || '');
  const [districtId, setDistrictId] = useState(profile?.district_id || '');
  const [cityId, setCityId] = useState(profile?.city_id || '');
  const [occupationId, setOccupationId] = useState(profile?.occupation_id || '');
  const [religionId, setReligionId] = useState(profile?.religion_id || '');
  const [casteId, setCasteId] = useState(profile?.caste_id || '');
  const [educationLevelId, setEducationLevelId] = useState(profile?.education_level_id || '');
  const [annualIncome, setAnnualIncome] = useState(profile?.annual_income || '');

  const [countries, setCountries] = useState([]);
  const [states, setStates] = useState([]);
  const [districts, setDistricts] = useState([]);
  const [cities, setCities] = useState([]);
  const [occupations, setOccupations] = useState([]);
  const [stars, setStars] = useState([]);
  const [raasis, setRaasis] = useState([]);
  const [lagnams, setLagnams] = useState([]);
  const [gothrams, setGothrams] = useState([]);
  const [religions, setReligions] = useState([]);
  const [castes, setCastes] = useState([]);
  const [educationLevels, setEducationLevels] = useState([]);

  useEffect(() => {
    getCountries().then(data => setCountries(data.map(d => ({ label: d.name, value: d.id }))));
    getOccupations().then(data => setOccupations(data.map(d => ({ label: d.name, value: d.id }))));
    getNakshatra().then(data => setStars(data.map(d => ({ label: d.name, value: d.id }))));
    getRasi().then(data => setRaasis(data.map(d => ({ label: d.name, value: d.id }))));
    getLagnam().then(data => setLagnams(data.map(d => ({ label: d.name, value: d.id }))));
    getGothram().then(data => setGothrams(data.map(d => ({ label: d.name, value: d.id }))));
    getReligions().then(data => setReligions(data.map(d => ({ label: d.name, value: d.id }))));
    getEducationLevels().then(data => setEducationLevels(data.map(d => ({ label: d.name, value: d.id }))));
  }, []);

  useEffect(() => {
    if (countryId) getStates(countryId).then(data => setStates(data.map(d => ({ label: d.name, value: d.id }))));
    else setStates([]);
  }, [countryId]);

  useEffect(() => {
    if (stateId) getDistricts(stateId).then(data => setDistricts(data.map(d => ({ label: d.name, value: d.id }))));
    else setDistricts([]);
  }, [stateId]);

  useEffect(() => {
    if (districtId) getCities(districtId).then(data => setCities(data.map(d => ({ label: d.name, value: d.id }))));
    else setCities([]);
  }, [districtId]);

  useEffect(() => {
    if (religionId) getCastes(religionId).then(data => setCastes(data.map(d => ({ label: d.name, value: d.id }))));
    else setCastes([]);
  }, [religionId]);

  const [heightCm, setHeightCm] = useState(profile?.height_cm ? String(profile.height_cm) : '');
  const [weightKg, setWeightKg] = useState(profile?.weight_kg ? String(profile.weight_kg) : '');
  const [maritalStatus, setMaritalStatus] = useState(profile?.marital_status || '');

  // Family Fields
  const [familyType, setFamilyType] = useState(profile?.user_family?.family_type || '');
  const [familyStatus, setFamilyStatus] = useState(profile?.user_family?.family_status || '');
  const [fatherOcc, setFatherOcc] = useState(profile?.user_family?.father_occupation || '');
  const [motherOcc, setMotherOcc] = useState(profile?.user_family?.mother_occupation || '');
  const [fatherName, setFatherName] = useState(profile?.user_family?.father_name || '');
  const [motherName, setMotherName] = useState(profile?.user_family?.mother_name || '');
  const [brothers, setBrothers] = useState(profile?.user_family?.brothers_count ? String(profile.user_family.brothers_count) : '');
  const [sisters, setSisters] = useState(profile?.user_family?.sisters_count ? String(profile.user_family.sisters_count) : '');

  // Lifestyle Fields
  const [foodHabit, setFoodHabit] = useState(profile?.user_lifestyle?.food_habit || '');
  const [smokingHabit, setSmokingHabit] = useState(profile?.user_lifestyle?.smoking_habit || '');
  const [drinkingHabit, setDrinkingHabit] = useState(profile?.user_lifestyle?.drinking_habit || '');
  const [languagesKnown, setLanguagesKnown] = useState(profile?.user_lifestyle?.languages_known || '');
  const [interests, setInterests] = useState(profile?.user_lifestyle?.interests || '');
  const [hobbies, setHobbies] = useState(profile?.user_lifestyle?.hobbies || '');

  // Horoscope Fields
  const [starId, setStarId] = useState(horoscope?.nakshatra_id || '');
  const [raasiId, setRaasiId] = useState(horoscope?.rasi_id || '');
  const [lagnamId, setLagnamId] = useState(horoscope?.lagnam_id || '');
  const [gothramId, setGothramId] = useState(horoscope?.gothram_id || '');
  const [gothramText, setGothramText] = useState(horoscope?.gothram_text || '');
  const [dosham, setDosham] = useState(horoscope?.dosham || '');
  const [dasaBalance, setDasaBalance] = useState(horoscope?.notes || '');

  // Synchronize local states with store data when loaded asynchronously
  useEffect(() => {
    if (profile) {
      setDisplayName(profile.full_name || '');
      setAboutMe(profile.about_me || '');
      setCountryId(profile.country_id || '');
      setStateId(profile.state_id || '');
      setDistrictId(profile.district_id || '');
      setCityId(profile.city_id || '');
      setReligionId(profile.religion_id || '');
      setCasteId(profile.caste_id || '');
      setEducationLevelId(profile.education_level_id || '');
      setAnnualIncome(profile.annual_income || '');
      setOccupationId(profile.occupation_id || '');
      setHeightCm(profile.height_cm ? String(profile.height_cm) : '');
      setWeightKg(profile.weight_kg ? String(profile.weight_kg) : '');
      setMaritalStatus(profile.marital_status || '');
      
      setFamilyType(profile.user_family?.family_type || '');
      setFamilyStatus(profile.user_family?.family_status || '');
      setFatherOcc(profile.user_family?.father_occupation || '');
      setMotherOcc(profile.user_family?.mother_occupation || '');
      setFatherName(profile.user_family?.father_name || '');
      setMotherName(profile.user_family?.mother_name || '');
      setBrothers(profile.user_family?.brothers_count ? String(profile.user_family.brothers_count) : '');
      setSisters(profile.user_family?.sisters_count ? String(profile.user_family.sisters_count) : '');
      
      setFoodHabit(profile.user_lifestyle?.food_habit || '');
      setSmokingHabit(profile.user_lifestyle?.smoking_habit || '');
      setDrinkingHabit(profile.user_lifestyle?.drinking_habit || '');
      setLanguagesKnown(profile.user_lifestyle?.languages_known || '');
      setInterests(profile.user_lifestyle?.interests || '');
      setHobbies(profile.user_lifestyle?.hobbies || '');
    }
  }, [profile]);

  useEffect(() => {
    if (horoscope) {
      setStarId(horoscope.nakshatra_id || '');
      setRaasiId(horoscope.rasi_id || '');
      setLagnamId(horoscope.lagnam_id || '');
      setGothramId(horoscope.gothram_id || '');
      setGothramText(horoscope.gothram_text || '');
      setDosham(horoscope.dosham || '');
      setDasaBalance(horoscope.notes || '');
    }
  }, [horoscope]);

  const handleSave = async () => {
    if (!displayName.trim()) {
      showToast('error', 'Required field', 'Please specify your display name');
      return;
    }

    try {
      setIsSaving(true);
      await updateProfile(user.id, {
        full_name: displayName,
        about_me: aboutMe,
        country_id: countryId || null,
        state_id: stateId || null,
        district_id: districtId || null,
        city_id: cityId || null,
        religion_id: religionId || null,
        caste_id: casteId || null,
        education_level_id: educationLevelId || null,
        annual_income: annualIncome || null,
        occupation_id: occupationId || null,
        height_cm: heightCm ? parseInt(heightCm, 10) : null,
        weight_kg: weightKg ? parseFloat(weightKg) : null,
        marital_status: maritalStatus,
      });

      await saveFamilyDetails({
        user_id: user.id,
        family_type: familyType || null,
        family_status: familyStatus || null,
        father_occupation: fatherOcc || null,
        mother_occupation: motherOcc || null,
        father_name: fatherName || null,
        mother_name: motherName || null,
        brothers_count: brothers ? parseInt(brothers, 10) : null,
        sisters_count: sisters ? parseInt(sisters, 10) : null,
      });

      await saveLifestyle({
        user_id: user.id,
        food_habit: foodHabit || null,
        smoking_habit: smokingHabit || null,
        drinking_habit: drinkingHabit || null,
        languages_known: languagesKnown || null,
        interests: interests || null,
        hobbies: hobbies || null,
      });

      await saveHoroscope({
        user_id: user.id,
        nakshatra_id: starId || null,
        rasi_id: raasiId || null,
        lagnam_id: lagnamId || null,
        gothram_id: gothramId || null,
        gothram_text: gothramText.trim() || null,
        dosham: dosham || null,
        notes: dasaBalance.trim() || null,
      });
      setIsSaving(false);
      showToast('success', 'Success', 'Profile updated successfully!');
      navigation.goBack();
    } catch (err) {
      setIsSaving(false);
      showToast('error', 'Error', err.message || 'Failed to update profile');
    }
  };

  const handleAddPhoto = async () => {
    if (photos.length >= 4) {
      showToast('warning', 'Limit Reached', 'You can only upload up to 4 photos.');
      return;
    }

    try {
      const permissionResult = await ImagePicker.requestMediaLibraryPermissionsAsync();
      if (!permissionResult.granted) {
        showToast('warning', 'Permission Required', 'Please allow access to your photos to upload a picture.');
        return;
      }

      const result = await ImagePicker.launchImageLibraryAsync({
        mediaTypes: ['images'],
        allowsEditing: true,
        aspect: [1, 1],
        quality: 0.8,
      });

      if (!result.canceled && result.assets?.length > 0) {
        const fileUri = result.assets[0].uri;
        setIsUploading(true);

        const isFirstPhoto = photos.length === 0;
        const newPhotoRecord = await uploadProfilePhoto(user.id, fileUri, {
          replacePrimary: false,
          isPrimary: isFirstPhoto
        });

        if (newPhotoRecord) {
          addPhoto(newPhotoRecord);
        }
        setIsUploading(false);
      }
    } catch (error) {
      setIsUploading(false);
      console.error('Error in handleAddPhoto:', error);
      showToast('error', 'Upload Failed', `Error: ${error.message || 'There was an issue uploading your photo. Please try again.'}`);
    }
  };

  const handleSetPrimary = async (photo) => {
    if (photo.is_primary) return;
    try {
      await setPrimaryProfilePhoto(user.id, photo.id);
      setPrimaryPhoto(photo.id);
      showToast('success', 'Photo Updated', 'Primary photo set successfully.');
    } catch (error) {
      showToast('error', 'Error', 'Failed to set primary photo.');
    }
  };

  const handleDeletePhoto = (photo) => {
    Alert.alert('Delete Photo', 'Are you sure you want to delete this photo?', [
      { text: 'Cancel', style: 'cancel' },
      {
        text: 'Delete',
        style: 'destructive',
        onPress: async () => {
          try {
            await deleteProfilePhoto(photo.id, photo.storage_path);
            removePhoto(photo.id);
            showToast('success', 'Deleted', 'Photo removed.');
          } catch (error) {
            showToast('error', 'Error', 'Failed to delete photo.');
          }
        }
      }
    ]);
  };

  const renderPersonalTab = () => (
    <Animated.View entering={FadeIn} exiting={FadeOut} style={styles.tabContent}>
      <Input
        label="Display Name"
        value={displayName}
        onChangeText={setDisplayName}
        placeholder="Enter your full name"
      />
      <Input
        label="About Me"
        value={aboutMe}
        onChangeText={setAboutMe}
        placeholder="Describe yourself, your interests and background..."
        multiline
        numberOfLines={4}
        style={styles.textArea}
      />
      <View style={styles.row}>
        <View style={styles.flex1}>
          <SearchablePicker
            label="Height"
            placeholder="Select Height"
            searchPlaceholder="Search height"
            options={HEIGHT_OPTIONS}
            value={heightCm ? parseInt(heightCm, 10) : ''}
            onChange={(val) => setHeightCm(val ? String(val) : '')}
          />
        </View>
        <View style={styles.flex1}>
          <SearchablePicker
            label="Weight"
            placeholder="Select Weight"
            searchPlaceholder="Search weight"
            options={WEIGHT_OPTIONS}
            value={weightKg ? parseFloat(weightKg) : ''}
            onChange={(val) => setWeightKg(val ? String(val) : '')}
          />
        </View>
      </View>
      <View style={styles.row}>
        <View style={styles.flex1}>
          <SearchablePicker
            label="Religion"
            options={religions}
            value={religionId}
            onChange={setReligionId}
            placeholder="Select Religion"
          />
        </View>
        <View style={styles.flex1}>
          <SearchablePicker
            label="Caste"
            options={castes}
            value={casteId}
            onChange={setCasteId}
            placeholder="Select Caste"
          />
        </View>
      </View>
      <SearchablePicker
        label="Qualification"
        options={educationLevels}
        value={educationLevelId}
        onChange={setEducationLevelId}
        placeholder="Select Qualification"
      />
      <View style={styles.row}>
        <View style={styles.flex1}>
          <SearchablePicker
            label="Occupation"
            options={occupations}
            value={occupationId}
            onChange={setOccupationId}
            placeholder="e.g. Software Engineer"
          />
        </View>
        <View style={styles.flex1}>
          <SearchablePicker
            label="Annual Income"
            options={INCOME_RANGES}
            value={annualIncome}
            onChange={setAnnualIncome}
            placeholder="Select Income"
            searchable={false}
          />
        </View>
      </View>

      <SearchablePicker
        label="Marital Status"
        placeholder="Select Marital Status"
        options={MARITAL_STATUS}
        value={maritalStatus}
        onChange={setMaritalStatus}
        searchable={false}
      />
    </Animated.View>
  );

  const renderFamilyTab = () => (
    <Animated.View entering={FadeIn} exiting={FadeOut} style={styles.tabContent}>
      <View style={styles.row}>
        <View style={styles.flex1}>
          <Input
            label="Father's Name"
            value={fatherName}
            onChangeText={setFatherName}
            placeholder="Name"
          />
        </View>
        <View style={styles.flex1}>
          <Input
            label="Mother's Name"
            value={motherName}
            onChangeText={setMotherName}
            placeholder="Name"
          />
        </View>
      </View>
      <View style={styles.row}>
        <View style={styles.flex1}>
          <Input
            label="Father's Occupation"
        value={fatherOcc}
        onChangeText={setFatherOcc}
        placeholder="e.g. Business, Retired, etc."
      />
          <Input
            label="Mother's Occupation"
            value={motherOcc}
            onChangeText={setMotherOcc}
            placeholder="e.g. Homemaker"
          />
        </View>
      </View>
      <View style={styles.row}>
        <View style={styles.flex1}>
          <Input
            label="Brothers"
            value={brothers}
            onChangeText={setBrothers}
            keyboardType="number-pad"
            placeholder="e.g. 1"
          />
        </View>
        <View style={styles.flex1}>
          <Input
            label="Sisters"
            value={sisters}
            onChangeText={setSisters}
            keyboardType="number-pad"
            placeholder="e.g. 1"
          />
        </View>
      </View>
      <View style={styles.row}>
        <View style={styles.flex1}>
          <SearchablePicker
            label="Family Type"
            placeholder="Select"
            searchable={false}
            options={FAMILY_TYPES}
            value={familyType}
            onChange={setFamilyType}
          />
        </View>
        <View style={styles.flex1}>
          <SearchablePicker
            label="Family Status"
            placeholder="Select"
            searchable={false}
            options={FAMILY_STATUS}
            value={familyStatus}
            onChange={setFamilyStatus}
          />
        </View>
      </View>
      <SearchablePicker
        label="Country"
        options={countries}
        value={countryId}
        onChange={setCountryId}
        placeholder="Select Country"
      />
      <View style={styles.row}>
        <View style={styles.flex1}>
          <SearchablePicker
            label="State"
            options={states}
            value={stateId}
            onChange={setStateId}
            placeholder="Select State"
          />
        </View>
        <View style={styles.flex1}>
          <SearchablePicker
            label="District"
            options={districts}
            value={districtId}
            onChange={setDistrictId}
            placeholder="Select District"
          />
        </View>
      </View>
      <SearchablePicker
        label="City"
        options={cities}
        value={cityId}
        onChange={setCityId}
        placeholder="Select City"
      />
    </Animated.View>
  );

  const renderLifestyleTab = () => (
    <Animated.View entering={FadeIn} exiting={FadeOut} style={styles.tabContent}>
      <View style={styles.row}>
        <View style={styles.flex1}>
          <SearchablePicker
            label="Smoking"
            options={SMOKING_OPTIONS}
            value={smokingHabit}
            onChange={setSmokingHabit}
            placeholder="Select"
            searchable={false}
          />
        </View>
        <View style={styles.flex1}>
          <SearchablePicker
            label="Drinking"
            options={DRINKING_OPTIONS}
            value={drinkingHabit}
            onChange={setDrinkingHabit}
            placeholder="Select"
            searchable={false}
          />
        </View>
      </View>
      <SearchablePicker
        label="Dietary Habit"
        placeholder="Select Food Habit"
        options={FOOD_HABITS}
        value={foodHabit}
        onChange={setFoodHabit}
        searchable={false}
      />
      <Input
        label="Languages Known"
        value={languagesKnown}
        onChangeText={setLanguagesKnown}
        placeholder="e.g. Tamil, English"
      />
      <Input
        label="Interests"
        value={interests}
        onChangeText={setInterests}
        placeholder="e.g. Reading, Traveling"
      />
      <Input
        label="Hobbies"
        value={hobbies}
        onChangeText={setHobbies}
        placeholder="e.g. Cooking, Painting"
      />
    </Animated.View>
  );

  const renderHoroscopeTab = () => (
    <Animated.View entering={FadeIn} exiting={FadeOut} style={styles.tabContent}>
      <SearchablePicker
        label="Star / Nakshatra"
        placeholder="Select Star"
        options={stars}
        value={starId}
        onChange={setStarId}
      />
      <SearchablePicker
        label="Raasi / Moon Sign"
        placeholder="Select Raasi"
        options={raasis}
        value={raasiId}
        onChange={setRaasiId}
      />
      <SearchablePicker
        label="Lagnam"
        placeholder="Select Lagnam"
        options={lagnams}
        value={lagnamId}
        onChange={setLagnamId}
      />
      <View style={styles.row}>
        <View style={styles.flex1}>
          <SearchablePicker
            label="Gothram"
            placeholder="Select Gothram"
            options={gothrams}
            value={gothramId}
            onChange={setGothramId}
          />
        </View>
        <View style={styles.flex1}>
          <SearchablePicker
            label="Dosham"
            placeholder="Select Dosham"
            options={DOSHAM_OPTIONS}
            value={dosham}
            onChange={setDosham}
            searchable={false}
          />
        </View>
      </View>
      {(!gothramId || gothrams.find(g => g.value === gothramId)?.label === 'Other') && (
        <Input
          label="Specify Gothram"
          value={gothramText}
          onChangeText={setGothramText}
          placeholder="Enter your gothram"
        />
      )}
      <Input
        label="Dasa Balance (Notes)"
        value={dasaBalance}
        onChangeText={setDasaBalance}
        placeholder="e.g. Rahu 2 years"
      />
    </Animated.View>
  );

  const renderPhotosTab = () => (
    <Animated.View entering={FadeIn} exiting={FadeOut} style={styles.tabContent}>
      <Text style={styles.sectionDesc}>
        Upload up to 4 photos. We recommend clear, front-facing portraits. Your first photo will be your primary profile picture.
      </Text>

      <View style={styles.photoGrid}>
        {photos?.map((photo) => (
          <View key={photo.id} style={styles.photoCard}>
            <Image source={{ uri: photo.photo_url || photo.storage_path }} style={styles.photoImage} />
            {photo.is_primary && (
              <View style={styles.primaryBadge}>
                <Text style={styles.primaryBadgeText}>Primary</Text>
              </View>
            )}
            <View style={styles.photoActions}>
              {!photo.is_primary && (
                <TouchableOpacity style={styles.photoActionBtn} onPress={() => handleSetPrimary(photo)}>
                  <Text style={styles.photoActionText}>★ Primary</Text>
                </TouchableOpacity>
              )}
              <TouchableOpacity style={styles.photoActionBtnDel} onPress={() => handleDeletePhoto(photo)}>
                <Text style={styles.photoActionTextDel}>🗑 Delete</Text>
              </TouchableOpacity>
            </View>
          </View>
        ))}

        {photos?.length < 4 && (
          <TouchableOpacity style={styles.addPhotoBtn} onPress={handleAddPhoto} disabled={isUploading}>
            {isUploading ? (
              <ActivityIndicator color={colors.primary} />
            ) : (
              <>
                <Text style={styles.addPhotoIcon}>+</Text>
                <Text style={styles.addPhotoText}>Add Photo</Text>
              </>
            )}
          </TouchableOpacity>
        )}
      </View>
    </Animated.View>
  );

  return (
    <SafeAreaView style={styles.safeContainer} edges={['top', 'bottom']}>
      <KeyboardAvoidingView 
        style={styles.keyboardAvoid}
        behavior={Platform.OS === 'ios' ? 'padding' : undefined}
      >
        <ScreenHeader title="Edit Profile" onBack={() => navigation.goBack()} />

        {/* Custom Tabs */}
        <View style={styles.tabContainer}>
          <ScrollView horizontal showsHorizontalScrollIndicator={false} contentContainerStyle={styles.tabScroll}>
            {TABS.map((tab) => {
              const isActive = activeTab === tab.id;
              return (
                <TouchableOpacity
                  key={tab.id}
                  style={[styles.tabButton, isActive && styles.tabButtonActive]}
                  onPress={() => setActiveTab(tab.id)}
                >
                  <Text style={[styles.tabLabel, isActive && styles.tabLabelActive]}>
                    {tab.label}
                  </Text>
                </TouchableOpacity>
              );
            })}
          </ScrollView>
        </View>

        <ScrollView showsVerticalScrollIndicator={false} contentContainerStyle={styles.scroll}>
          {activeTab === 'personal' && renderPersonalTab()}
          {activeTab === 'family' && renderFamilyTab()}
          {activeTab === 'lifestyle' && renderLifestyleTab()}
          {activeTab === 'horoscope' && renderHoroscopeTab()}
          {activeTab === 'photos' && renderPhotosTab()}
        </ScrollView>

        <View style={styles.footer}>
          <Button
            title="Save Changes"
            onPress={handleSave}
            loading={isSaving}
          />
        </View>
      </KeyboardAvoidingView>
    </SafeAreaView>
  );
};

const styles = StyleSheet.create({
  safeContainer: {
    flex: 1,
    backgroundColor: colors.surface,
  },
  keyboardAvoid: {
    flex: 1,
  },
  // ── Tabs ──
  tabContainer: {
    backgroundColor: colors.background,
    borderBottomWidth: 1,
    borderBottomColor: colors.borderLight,
  },
  tabScroll: {
    paddingHorizontal: layout.screenPaddingHorizontal,
    gap: 24,
  },
  tabButton: {
    paddingVertical: 14,
    borderBottomWidth: 2,
    borderBottomColor: 'transparent',
  },
  tabButtonActive: {
    borderBottomColor: colors.primary,
  },
  tabLabel: {
    fontSize: 14,
    fontWeight: '600',
    color: colors.textSecondary,
  },
  tabLabelActive: {
    color: colors.primary,
  },

  scroll: {
    padding: layout.screenPaddingHorizontal,
    paddingBottom: 40,
  },
  tabContent: {
    gap: 16,
  },
  row: {
    flexDirection: 'row',
    gap: 12,
  },
  flex1: {
    flex: 1,
  },
  textArea: {
    height: 100,
    textAlignVertical: 'top',
    paddingTop: 12,
  },
  
  footer: {
    padding: layout.screenPaddingHorizontal,
    paddingVertical: 16,
    backgroundColor: colors.background,
    borderTopWidth: 1,
    borderTopColor: colors.borderLight,
    ...shadows.bottomNav,
  },
  sectionDesc: {
    fontSize: 14,
    color: colors.textSecondary,
    marginBottom: 20,
    lineHeight: 20,
  },
  photoGrid: {
    flexDirection: 'row',
    flexWrap: 'wrap',
    gap: 16,
  },
  photoCard: {
    width: '47%',
    aspectRatio: 0.8,
    backgroundColor: colors.surfaceElevated,
    borderRadius: borderRadius.md,
    overflow: 'hidden',
    position: 'relative',
    borderWidth: 1,
    borderColor: colors.borderLight,
  },
  photoImage: {
    width: '100%',
    height: '75%',
    backgroundColor: colors.background,
  },
  primaryBadge: {
    position: 'absolute',
    top: 8,
    left: 8,
    backgroundColor: colors.primary,
    paddingHorizontal: 8,
    paddingVertical: 4,
    borderRadius: borderRadius.sm,
  },
  primaryBadgeText: {
    color: colors.textInverse,
    fontSize: 10,
    fontWeight: '700',
  },
  photoActions: {
    flexDirection: 'row',
    height: '25%',
    borderTopWidth: 1,
    borderTopColor: colors.borderLight,
  },
  photoActionBtn: {
    flex: 1,
    justifyContent: 'center',
    alignItems: 'center',
    borderRightWidth: 1,
    borderRightColor: colors.borderLight,
  },
  photoActionText: {
    fontSize: 11,
    color: colors.primary,
    fontWeight: '600',
  },
  photoActionBtnDel: {
    flex: 1,
    justifyContent: 'center',
    alignItems: 'center',
  },
  photoActionTextDel: {
    fontSize: 11,
    color: colors.error,
    fontWeight: '600',
  },
  addPhotoBtn: {
    width: '47%',
    aspectRatio: 0.8,
    backgroundColor: colors.background,
    borderRadius: borderRadius.md,
    borderWidth: 2,
    borderColor: colors.borderLight,
    borderStyle: 'dashed',
    justifyContent: 'center',
    alignItems: 'center',
  },
  addPhotoIcon: {
    fontSize: 32,
    color: colors.textMuted,
    marginBottom: 8,
  },
  addPhotoText: {
    fontSize: 14,
    color: colors.textMuted,
    fontWeight: '600',
  },
});

export default EditProfileScreen;
