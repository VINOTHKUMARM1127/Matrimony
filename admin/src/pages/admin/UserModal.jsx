import { useState, useEffect } from 'react';
import { X, Save, Trash2, Key, Shield, ImagePlus, Loader2 } from 'lucide-react';
import Button from '../../components/common/Button';
import * as adminApi from '../../api/adminApi';
import * as imageApi from '../../api/imageApi';

const UserModal = ({ user, onClose, onRefresh }) => {
  const [formData, setFormData] = useState({
    display_name: '',
    phone: '',
    gender: '',
    date_of_birth: '',
    religion: '',
    caste: '',
    city: '',
    education: '',
    occupation: ''
  });
  const [isLoading, setIsLoading] = useState(false);
  const [photoLoading, setPhotoLoading] = useState(false);
  const [photos, setPhotos] = useState(user?.photos || []);

  useEffect(() => {
    if (user) {
      setFormData({
        display_name: user.display_name || '',
        phone: user.phone || '',
        gender: user.gender || '',
        date_of_birth: user.date_of_birth || '',
        religion: user.religion || '',
        caste: user.caste || '',
        city: user.city || '',
        education: user.education || '',
        occupation: user.occupation || ''
      });
      setPhotos(user.photos || []);
    }
  }, [user]);

  if (!user) return null;

  const handleChange = (e) => {
    const { name, value } = e.target;
    setFormData(prev => ({ ...prev, [name]: value }));
  };

  const handleSave = async () => {
    setIsLoading(true);
    try {
      const payload = { ...formData };
      
      // Remove phone from payload as it belongs to auth.users, not profiles table
      delete payload.phone;

      // Postgres rejects empty strings for Date columns
      if (payload.date_of_birth === '') {
        payload.date_of_birth = null;
      }
      
      await adminApi.updateUser(user.id, payload);
      alert('User updated successfully');
      onRefresh();
      onClose();
    } catch (err) {
      alert('Failed to update user: ' + err.message);
    } finally {
      setIsLoading(false);
    }
  };

  const handleDelete = async () => {
    if (!window.confirm('Are you absolutely sure you want to delete this user completely? This cannot be undone.')) return;
    setIsLoading(true);
    try {
      await adminApi.deleteUser(user.id);
      alert('User deleted completely.');
      onRefresh();
      onClose();
    } catch (err) {
      alert('Failed to delete user: ' + err.message);
    } finally {
      setIsLoading(false);
    }
  };

  const handleResetPassword = async () => {
    const newPassword = prompt('Enter new password for ' + (user.email || user.display_name) + ' (min 6 characters):');
    if (!newPassword || newPassword.length < 6) {
      if (newPassword !== null) alert('Password must be at least 6 characters.');
      return;
    }
    setIsLoading(true);
    try {
      await adminApi.resetUserPassword(user.id, newPassword);
      alert('Password reset successfully!');
    } catch (err) {
      alert('Failed to reset password: ' + err.message);
    } finally {
      setIsLoading(false);
    }
  };

  const handleUpdatePlan = async (e) => {
    const planType = e.target.value;
    if (!planType) return;
    if (!window.confirm(`Update plan to ${planType}?`)) {
      e.target.value = '';
      return;
    }
    
    setIsLoading(true);
    try {
      await adminApi.updateUserPlan(user.id, planType);
      alert('Plan updated successfully!');
      onRefresh();
    } catch (err) {
      alert('Failed to update plan: ' + err.message);
    } finally {
      setIsLoading(false);
    }
  };

  const handlePhotoUpload = async (e) => {
    const file = e.target.files?.[0];
    if (!file) return;

    if (!window.confirm('Upload this photo as the new profile picture?')) return;

    setPhotoLoading(true);
    try {
      // 1. Upload to Cloudflare R2
      const r2Result = await imageApi.uploadPhotoToR2(user.id, file);

      // 2. Add to Supabase
      const newPhoto = await adminApi.addPhoto(user.id, r2Result.publicUrl);
      
      setPhotos(prev => [...prev, newPhoto]);
      alert('Photo uploaded successfully!');
      onRefresh();
    } catch (err) {
      console.error(err);
      alert('Failed to upload photo: ' + err.message);
    } finally {
      setPhotoLoading(false);
      // reset file input
      e.target.value = '';
    }
  };

  const handlePhotoDelete = async (photo) => {
    if (!window.confirm('Are you sure you want to delete this photo? It will be removed from cloud storage.')) return;

    setPhotoLoading(true);
    try {
      // 1. Delete from Supabase
      await adminApi.deletePhoto(photo.id);

      // 2. Delete from Cloudflare R2
      await imageApi.deletePhotoFromR2(photo.storage_path);

      setPhotos(prev => prev.filter(p => p.id !== photo.id));
      alert('Photo deleted successfully!');
      onRefresh();
    } catch (err) {
      console.error(err);
      alert('Failed to delete photo: ' + err.message);
    } finally {
      setPhotoLoading(false);
    }
  };

  return (
    <div className="fixed inset-0 bg-black/60 z-50 flex items-center justify-center p-4">
      <div className="bg-white rounded-2xl shadow-xl w-full max-w-2xl max-h-[90vh] overflow-hidden flex flex-col">
        <div className="px-6 py-4 border-b border-neutral-200 flex justify-between items-center bg-neutral-50">
          <h2 className="text-xl font-bold text-neutral-900">User Details</h2>
          <button onClick={onClose} className="text-neutral-400 hover:text-neutral-700">
            <X size={24} />
          </button>
        </div>

        <div className="p-6 overflow-y-auto flex-1 space-y-6">
          <div className="bg-neutral-50 p-4 rounded-xl border border-neutral-100 flex justify-between items-center">
            <div>
              <p className="text-sm text-neutral-500 mb-1">Account Email</p>
              <p className="font-semibold text-neutral-900">{user.email || 'No email found (User may have been deleted or created without auth)'}</p>
            </div>
            <div>
              <p className="text-sm text-neutral-500 mb-1">User ID</p>
              <p className="font-mono text-xs text-neutral-400">{user.id}</p>
            </div>
          </div>

          <div className="bg-white border border-neutral-200 rounded-xl p-6">
            <h3 className="font-semibold text-neutral-900 mb-4 flex items-center gap-2">
              <ImagePlus size={18} className="text-brand-500" />
              Profile Photos
            </h3>
            <div className="flex gap-4 overflow-x-auto pb-2">
              {photos && photos.length > 0 ? (
                photos.map(photo => (
                  <div key={photo.id} className="relative group shrink-0 w-32 h-32 rounded-xl overflow-hidden border border-neutral-200 shadow-sm">
                    <img 
                      src={photo.storage_path} 
                      alt="Profile" 
                      className="w-full h-full object-cover"
                    />
                    <div className="absolute inset-0 bg-black/50 opacity-0 group-hover:opacity-100 transition-opacity flex items-center justify-center">
                      <button 
                        onClick={() => handlePhotoDelete(photo)}
                        disabled={photoLoading}
                        className="bg-error-500 text-white p-2 rounded-full hover:bg-error-600 transition-colors disabled:opacity-50"
                        title="Delete Photo"
                      >
                        <Trash2 size={16} />
                      </button>
                    </div>
                  </div>
                ))
              ) : (
                <div className="w-32 h-32 rounded-xl border-2 border-dashed border-neutral-200 flex flex-col items-center justify-center text-neutral-400 bg-neutral-50">
                  <ImagePlus size={24} className="mb-2 text-neutral-300" />
                  <span className="text-xs">No Photos</span>
                </div>
              )}
              
              <label className="shrink-0 w-32 h-32 rounded-xl border-2 border-dashed border-brand-200 flex flex-col items-center justify-center text-brand-600 bg-brand-50 cursor-pointer hover:bg-brand-100 transition-colors">
                {photoLoading ? (
                  <Loader2 size={24} className="animate-spin mb-2" />
                ) : (
                  <>
                    <ImagePlus size={24} className="mb-2" />
                    <span className="text-xs font-medium">Upload New</span>
                  </>
                )}
                <input 
                  type="file" 
                  accept="image/jpeg, image/png, image/webp" 
                  className="hidden" 
                  onChange={handlePhotoUpload}
                  disabled={photoLoading}
                />
              </label>
            </div>
          </div>

          <div className="grid grid-cols-1 md:grid-cols-2 gap-4">
            <div>
              <label className="block text-sm font-medium text-neutral-700 mb-1">Display Name</label>
              <input type="text" name="display_name" value={formData.display_name} onChange={handleChange} className="w-full p-2 border border-neutral-300 rounded-lg" />
            </div>
            <div>
              <label className="block text-sm font-medium text-neutral-700 mb-1">Phone</label>
              <input type="text" name="phone" value={formData.phone} onChange={handleChange} className="w-full p-2 border border-neutral-300 rounded-lg" />
            </div>
            <div>
              <label className="block text-sm font-medium text-neutral-700 mb-1">Gender</label>
              <select name="gender" value={formData.gender} onChange={handleChange} className="w-full p-2 border border-neutral-300 rounded-lg">
                <option value="">Select</option>
                <option value="male">Male</option>
                <option value="female">Female</option>
              </select>
            </div>
            <div>
              <label className="block text-sm font-medium text-neutral-700 mb-1">Date of Birth</label>
              <input type="date" name="date_of_birth" value={formData.date_of_birth} onChange={handleChange} className="w-full p-2 border border-neutral-300 rounded-lg" />
            </div>
            <div>
              <label className="block text-sm font-medium text-neutral-700 mb-1">Religion</label>
              <input type="text" name="religion" value={formData.religion} onChange={handleChange} className="w-full p-2 border border-neutral-300 rounded-lg" />
            </div>
            <div>
              <label className="block text-sm font-medium text-neutral-700 mb-1">Caste</label>
              <input type="text" name="caste" value={formData.caste} onChange={handleChange} className="w-full p-2 border border-neutral-300 rounded-lg" />
            </div>
            <div>
              <label className="block text-sm font-medium text-neutral-700 mb-1">City</label>
              <input type="text" name="city" value={formData.city} onChange={handleChange} className="w-full p-2 border border-neutral-300 rounded-lg" />
            </div>
            <div>
              <label className="block text-sm font-medium text-neutral-700 mb-1">Education</label>
              <input type="text" name="education" value={formData.education} onChange={handleChange} className="w-full p-2 border border-neutral-300 rounded-lg" />
            </div>
            <div className="md:col-span-2">
              <label className="block text-sm font-medium text-neutral-700 mb-1">Occupation</label>
              <input type="text" name="occupation" value={formData.occupation} onChange={handleChange} className="w-full p-2 border border-neutral-300 rounded-lg" />
            </div>
          </div>

          <div className="border-t border-neutral-200 pt-6">
            <h3 className="font-semibold text-neutral-900 mb-4 flex items-center gap-2">
              <Shield size={18} className="text-gold-500" />
              Administrative Actions
            </h3>
            <div className="flex flex-wrap gap-4 items-center">
              <select 
                className="text-sm border border-neutral-300 rounded-lg p-2 bg-white"
                onChange={handleUpdatePlan}
                disabled={isLoading}
                defaultValue=""
              >
                <option value="" disabled>Change Premium Plan...</option>
                <option value="free">Free / Demote</option>
                <option value="silver">Silver</option>
                <option value="gold">Gold</option>
                <option value="platinum">Platinum</option>
              </select>

              <button 
                onClick={handleResetPassword}
                disabled={isLoading}
                className="flex items-center gap-2 px-4 py-2 bg-neutral-100 hover:bg-neutral-200 text-neutral-700 rounded-lg transition-colors font-medium text-sm"
              >
                <Key size={16} /> Reset Password
              </button>
            </div>
          </div>
        </div>

        <div className="px-6 py-4 border-t border-neutral-200 bg-neutral-50 flex justify-between items-center">
          <button 
            onClick={handleDelete}
            disabled={isLoading}
            className="flex items-center gap-2 text-error-600 hover:text-error-700 font-medium text-sm px-3 py-2 rounded-lg hover:bg-error-50 transition-colors"
          >
            <Trash2 size={18} /> Delete User
          </button>
          
          <div className="flex gap-3">
            <Button variant="outline" onClick={onClose} disabled={isLoading}>Cancel</Button>
            <Button onClick={handleSave} disabled={isLoading} className="flex items-center gap-2">
              <Save size={18} /> Save Changes
            </Button>
          </div>
        </div>
      </div>
    </div>
  );
};

export default UserModal;
