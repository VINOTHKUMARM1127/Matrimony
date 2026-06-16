/**
 * Tamil Matrimony — Photo Upload Registration (Step 7)
 */
import React, { useState, useCallback } from 'react';
import {
  View, Text, StyleSheet, ScrollView, TouchableOpacity,
  Alert, ActivityIndicator,
} from 'react-native';
import { Image } from 'expo-image';
import * as ImagePicker from 'expo-image-picker';
import * as ImageManipulator from 'expo-image-manipulator';
import { colors } from '../../theme';
import { borderRadius } from '../../theme/spacing';
import Button from '../../components/common/Button';
import StepIndicator from '../../components/registration/StepIndicator';
import { IMAGE_CONFIG, STORAGE_BUCKETS } from '../../utils/constants';
import useProfileStore from '../../store/useProfileStore';
import useAuthStore from '../../store/useAuthStore';
import supabase from '../../api/supabaseClient';

const uriToBlob = async (uri) => {
  return new Promise((resolve, reject) => {
    const xhr = new XMLHttpRequest();
    xhr.onload = function () {
      resolve(xhr.response);
    };
    xhr.onerror = function (e) {
      console.error('uriToBlob error:', e);
      reject(new TypeError('Local file read failed'));
    };
    xhr.responseType = 'blob';
    xhr.open('GET', uri, true);
    xhr.send(null);
  });
};

const PhotoUploadScreen = ({ navigation }) => {
  const user = useAuthStore((s) => s.user);
  const { addPhoto, photos } = useProfileStore();
  const [uploading, setUploading] = useState(false);
  const [localPhotos, setLocalPhotos] = useState([]);

  const compressImage = useCallback(async (uri) => {
    const { getInfoAsync } = require('expo-file-system/legacy');
    let quality = 0.8;
    let width = IMAGE_CONFIG.MAX_WIDTH;
    let manipulated;
    let fileSize = Infinity;

    while (fileSize > 200 * 1024 && quality > 0.1) {
      manipulated = await ImageManipulator.manipulateAsync(
        uri,
        [{ resize: { width } }],
        { compress: quality, format: ImageManipulator.SaveFormat.WEBP }
      );
      const fileInfo = await getInfoAsync(manipulated.uri);
      fileSize = fileInfo.size;
      quality -= 0.15;
      width = Math.floor(width * 0.8);
    }
    return manipulated;
  }, []);

  const pickImage = useCallback(async () => {
    if (localPhotos.length >= IMAGE_CONFIG.MAX_PHOTOS) {
      Alert.alert('Limit Reached', `You can upload up to ${IMAGE_CONFIG.MAX_PHOTOS} photos`);
      return;
    }

    const { status } = await ImagePicker.requestMediaLibraryPermissionsAsync();
    if (status !== 'granted') {
      Alert.alert('Permission Needed', 'Please grant photo library access to upload photos');
      return;
    }

    const result = await ImagePicker.launchImageLibraryAsync({
      mediaTypes: ['images'],
      allowsEditing: true,
      aspect: [1, 1],
      quality: 0.8,
    });

    if (!result.canceled && result.assets) {
      setUploading(true);
      try {
        for (const asset of result.assets) {
          // Compress
          const compressed = await compressImage(asset.uri);

          // Generate filename
          const fileName = `${user.id}/${Date.now()}_${Math.random().toString(36).slice(2)}.webp`;

          // Check R2 credentials
          const r2AccountId = process.env.EXPO_PUBLIC_R2_ACCOUNT_ID;
          const r2AccessKeyId = process.env.EXPO_PUBLIC_R2_ACCESS_KEY_ID;
          const r2SecretAccessKey = process.env.EXPO_PUBLIC_R2_SECRET_ACCESS_KEY;
          const hasR2Creds = r2AccountId && r2AccessKeyId && r2SecretAccessKey;

          let publicUrl;
          if (!hasR2Creds && (__DEV__ || process.env.EXPO_PUBLIC_APP_ENV === 'development')) {
            console.warn('Cloudflare R2 credentials are not set. Using dev mock fallback.');
            const randomId = Math.floor(Math.random() * 1000);
            publicUrl = `https://picsum.photos/id/${randomId % 100}/400/400`;
          } else {
            // Upload to Cloudflare R2 via the shared, RN-correct client
            // (forcePathStyle + checksum-safe). See src/api/r2Client.js.
            const { decode } = require('base64-arraybuffer');
            const { getR2Client, PutObjectCommand, R2_BUCKET, R2_PUBLIC_URL } = require('../../api/r2Client');
            const fileInstance = new (require('expo-file-system').File)(compressed.uri);
            const base64 = await fileInstance.base64();
            const arrayBuffer = decode(base64);

            const command = new PutObjectCommand({
              Bucket: R2_BUCKET(),
              Key: fileName,
              Body: new Uint8Array(arrayBuffer),
              ContentType: 'image/webp',
            });

            await getR2Client().send(command);

            publicUrl = `${R2_PUBLIC_URL()}/${fileName}`;
          }

          // Save to DB
          const { data: photoData, error: dbError } = await supabase
            .from('photos')
            .insert({
              user_id: user.id,
              storage_path: publicUrl,
              is_primary: localPhotos.length === 0,
              display_order: localPhotos.length,
            })
            .select()
            .single();

          if (!dbError && photoData) {
            setLocalPhotos((prev) => [...prev, {
              ...photoData,
              localUri: compressed.uri,
            }]);
            addPhoto(photoData);
          }
        }
      } catch (error) {
        console.error('Photo upload error:', error);
        Alert.alert('Error', 'Failed to upload some photos. Please try again.');
      }
      setUploading(false);
    }
  }, [localPhotos, user, compressImage, addPhoto]);

  const removePhoto = useCallback((index) => {
    setLocalPhotos((prev) => prev.filter((_, i) => i !== index));
  }, []);

  const handleNext = useCallback(() => {
    navigation.navigate('PartnerPreference');
  }, [navigation]);

  return (
    <View style={styles.container}>
      <StepIndicator currentStep={6} />
      <ScrollView
        style={styles.scroll}
        contentContainerStyle={styles.scrollContent}
        showsVerticalScrollIndicator={false}
      >
        <Text style={styles.title}>Add Your Photos</Text>
        <Text style={styles.subtitle}>
          Profiles with photos get 10x more responses
        </Text>

        <View style={styles.photoGrid}>
          {localPhotos.map((photo, index) => (
            <View key={photo.id || index} style={styles.photoItem}>
              <Image
                source={{ uri: photo.localUri || photo.storage_path }}
                style={styles.photoImage}
                contentFit="cover"
                transition={200}
              />
              {index === 0 && (
                <View style={styles.primaryBadge}>
                  <Text style={styles.primaryText}>Primary</Text>
                </View>
              )}
              <TouchableOpacity
                style={styles.removeButton}
                onPress={() => removePhoto(index)}
              >
                <Text style={styles.removeIcon}>✕</Text>
              </TouchableOpacity>
            </View>
          ))}

          {localPhotos.length < IMAGE_CONFIG.MAX_PHOTOS && (
            <TouchableOpacity
              style={styles.addButton}
              onPress={pickImage}
              disabled={uploading}
              activeOpacity={0.7}
            >
              {uploading ? (
                <ActivityIndicator color={colors.primary} />
              ) : (
                <>
                  <Text style={styles.addIcon}>📷</Text>
                  <Text style={styles.addText}>Add Photo</Text>
                </>
              )}
            </TouchableOpacity>
          )}
        </View>

        <View style={styles.tips}>
          <Text style={styles.tipsTitle}>📌 Photo Tips</Text>
          <Text style={styles.tip}>• Use clear, recent photos</Text>
          <Text style={styles.tip}>• Face should be clearly visible</Text>
          <Text style={styles.tip}>• Avoid group photos as primary</Text>
          <Text style={styles.tip}>• Good lighting makes a difference</Text>
        </View>

        <Text style={styles.counter}>
          {localPhotos.length} / {IMAGE_CONFIG.MAX_PHOTOS} photos uploaded
        </Text>

        <View style={styles.buttonRow}>
          <Button title="← Back" onPress={() => navigation.goBack()} variant="outline" style={styles.backButton} />
          <Button title={localPhotos.length > 0 ? "Next →" : "Skip for now"} onPress={handleNext} variant={localPhotos.length > 0 ? 'primary' : 'ghost'} style={styles.nextButton} />
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
  photoGrid: { flexDirection: 'row', flexWrap: 'wrap', gap: 10, marginBottom: 20 },
  photoItem: {
    width: '31%', aspectRatio: 0.75, borderRadius: borderRadius.md,
    overflow: 'hidden', position: 'relative',
  },
  photoImage: { width: '100%', height: '100%' },
  primaryBadge: {
    position: 'absolute', bottom: 6, left: 6,
    backgroundColor: colors.primary, borderRadius: 8,
    paddingHorizontal: 8, paddingVertical: 2,
  },
  primaryText: { fontSize: 10, color: '#FFF', fontWeight: '600' },
  removeButton: {
    position: 'absolute', top: 4, right: 4,
    width: 22, height: 22, borderRadius: 11,
    backgroundColor: 'rgba(0,0,0,0.5)', alignItems: 'center', justifyContent: 'center',
  },
  removeIcon: { color: '#FFF', fontSize: 12, fontWeight: '700' },
  addButton: {
    width: '31%', aspectRatio: 0.75, borderRadius: borderRadius.md,
    borderWidth: 2, borderColor: colors.border, borderStyle: 'dashed',
    alignItems: 'center', justifyContent: 'center', backgroundColor: colors.surface,
  },
  addIcon: { fontSize: 28, marginBottom: 4 },
  addText: { fontSize: 11, color: colors.textMuted, fontWeight: '500' },
  tips: {
    backgroundColor: colors.secondarySurface, padding: 14,
    borderRadius: borderRadius.md, marginBottom: 16,
  },
  tipsTitle: { fontSize: 14, fontWeight: '600', color: colors.secondary, marginBottom: 6 },
  tip: { fontSize: 12, color: colors.textSecondary, lineHeight: 20 },
  counter: { fontSize: 13, color: colors.textMuted, textAlign: 'center', marginBottom: 16 },
  buttonRow: { flexDirection: 'row', gap: 12 },
  backButton: { flex: 1 },
  nextButton: { flex: 2 },
});

export default PhotoUploadScreen;
