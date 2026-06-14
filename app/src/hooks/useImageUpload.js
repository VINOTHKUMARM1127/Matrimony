/**
 * Tamil Matrimony — useImageUpload Hook
 * Coordinates image picking, camera shoots, compression, storage uploads, and database sync
 */
import { useState } from 'react';
import { useMutation, useQueryClient } from '@tanstack/react-query';
import * as imageService from '../services/imageProcessor';
import useAuthStore from '../store/useAuthStore';
import useProfileStore from '../store/useProfileStore';
import supabase from '../api/supabaseClient';

export const useImageUpload = () => {
  const queryClient = useQueryClient();
  const user = useAuthStore((s) => s.user);
  const profilePhotos = useProfileStore((s) => s.photos);
  const addPhotoState = useProfileStore((s) => s.addPhoto);
  const removePhotoState = useProfileStore((s) => s.removePhoto);
  const setPrimaryPhotoState = useProfileStore((s) => s.setPrimaryPhoto);

  const [isUploading, setIsUploading] = useState(false);
  const [error, setError] = useState(null);

  // Helper to insert photo record in DB
  const savePhotoToDb = async ({ storagePath, thumbnailPath }) => {
    // If it's the first photo, make it primary
    const isPrimary = profilePhotos.length === 0;

    const { data, error } = await supabase
      .from('photos')
      .insert({
        user_id: user.id,
        storage_path: storagePath,
        thumbnail_path: thumbnailPath,
        is_primary: isPrimary,
        display_order: profilePhotos.length,
        is_approved: true, // Auto approve for testing
      })
      .select()
      .single();

    if (error) throw error;
    return data;
  };

  // Upload Mutation
  const uploadMutation = useMutation({
    mutationFn: async (uri) => {
      setIsUploading(true);
      setError(null);
      
      // Upload to storage
      const uploadRes = await imageService.processAndUploadPhoto(uri, user.id);
      
      // Save to database
      const photoRecord = await savePhotoToDb({
        storagePath: uploadRes.storagePath,
        thumbnailPath: uploadRes.thumbnailPath,
      });

      return photoRecord;
    },
    onSuccess: (photoRecord) => {
      addPhotoState(photoRecord);
      setIsUploading(false);
      queryClient.invalidateQueries({ queryKey: ['profile', user?.id] });
    },
    onError: (err) => {
      setError(err.message);
      setIsUploading(false);
    },
  });

  // Delete Mutation
  const deleteMutation = useMutation({
    mutationFn: async (photo) => {
      setError(null);
      
      // Extract file path from URL (for storage removal)
      const mainPath = photo.storage_path.split('/storage/v1/object/public/profile-photos/')[1];
      const thumbPath = photo.thumbnail_path?.split('/storage/v1/object/public/profile-photos/')[1];

      // Delete from storage
      if (mainPath) {
        await imageService.deleteImage(mainPath);
      }
      if (thumbPath) {
        await imageService.deleteImage(thumbPath);
      }

      // Delete from database
      const { error } = await supabase
        .from('photos')
        .delete()
        .eq('id', photo.id);

      if (error) throw error;
      return photo.id;
    },
    onSuccess: (photoId) => {
      removePhotoState(photoId);
      queryClient.invalidateQueries({ queryKey: ['profile', user?.id] });
    },
    onError: (err) => {
      setError(err.message);
    },
  });

  // Set Primary Mutation
  const setPrimaryMutation = useMutation({
    mutationFn: async (photoId) => {
      setError(null);

      // Set all other photos primary status to false
      await supabase
        .from('photos')
        .update({ is_primary: false })
        .eq('user_id', user.id);

      // Set this photo primary status to true
      const { data, error } = await supabase
        .from('photos')
        .update({ is_primary: true })
        .eq('id', photoId)
        .select()
        .single();

      if (error) throw error;
      return photoId;
    },
    onSuccess: (photoId) => {
      setPrimaryPhotoState(photoId);
      queryClient.invalidateQueries({ queryKey: ['profile', user?.id] });
    },
    onError: (err) => {
      setError(err.message);
    },
  });

  const pickAndUpload = async () => {
    try {
      const assets = await imageService.pickImages(1);
      if (assets && assets.length > 0) {
        await uploadMutation.mutateAsync(assets[0].uri);
      }
    } catch (err) {
      setError(err.message);
    }
  };

  const takeAndUpload = async () => {
    try {
      const asset = await imageService.takePhoto();
      if (asset) {
        await uploadMutation.mutateAsync(asset.uri);
      }
    } catch (err) {
      setError(err.message);
    }
  };

  return {
    photos: profilePhotos,
    isUploading,
    error,
    pickAndUpload,
    takeAndUpload,
    deletePhoto: deleteMutation.mutateAsync,
    setPrimaryPhoto: setPrimaryMutation.mutateAsync,
  };
};

export default useImageUpload;
