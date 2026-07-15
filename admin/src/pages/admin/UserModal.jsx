import { useState, useEffect } from 'react';
import { createPortal } from 'react-dom';
import { X, Save, Trash2, Key, Shield, ImagePlus, Loader2, Crown, Mail, Fingerprint, TrendingUp, History, ListOrdered } from 'lucide-react';
import Button from '../../components/common/Button';
import * as adminApi from '../../api/adminApi';
import * as imageApi from '../../api/imageApi';

// ── Field group definitions (data-driven render; keys match DB columns) ──
const GENDER_OPTS = [['', 'Select'], ['male', 'Male'], ['female', 'Female']];
const MARITAL_OPTS = [['', 'Select'], ['never_married', 'Never Married'], ['divorced', 'Divorced'], ['widowed', 'Widowed'], ['awaiting_divorce', 'Awaiting Divorce']];
const FAMILY_TYPE_OPTS = [['', 'Select'], ['joint', 'Joint'], ['nuclear', 'Nuclear']];
const FAMILY_STATUS_OPTS = [['', 'Select'], ['middle_class', 'Middle Class'], ['upper_middle_class', 'Upper Middle Class'], ['rich', 'Rich'], ['affluent', 'Affluent']];
const FOOD_OPTS = [['', 'Select'], ['vegetarian', 'Vegetarian'], ['non_vegetarian', 'Non-Vegetarian'], ['eggetarian', 'Eggetarian']];
const YESNO_OPTS = [['', 'Select'], ['no', 'No'], ['yes', 'Yes'], ['occasionally', 'Occasionally']];
const DOSHAM_OPTS = [['', 'Select'], ['yes', 'Yes'], ['no', 'No'], ['not_sure', 'Not Sure']];

const fieldClass = 'w-full px-3.5 py-2.5 border border-neutral-200 rounded-xl bg-neutral-50 text-sm text-neutral-900 focus:bg-white focus:outline-none focus:border-primary-400 focus:ring-4 focus:ring-primary-100 transition-all';
const labelClass = 'block text-xs font-semibold text-neutral-600 mb-1.5';

const Txt = ({ label, k, type = 'text', src, set, full, maxLength, onCustomChange }) => (
  <div className={full ? 'md:col-span-2' : ''}>
    <label className={labelClass}>{label}</label>
    <input 
      type={type} 
      value={src?.[k] ?? ''} 
      onChange={onCustomChange ? (e) => onCustomChange(e.target.value) : (e) => set(k, e.target.value)} 
      className={fieldClass} 
      maxLength={maxLength}
    />
  </div>
);

const Sel = ({ label, k, options, src, set, full }) => (
  <div className={full ? 'md:col-span-2' : ''}>
    <label className={labelClass}>{label}</label>
    <select value={src?.[k] ?? ''} onChange={(e) => set(k, e.target.value)} className={fieldClass}>
      {options.map(([v, l]) => <option key={v} value={v}>{l}</option>)}
    </select>
  </div>
);

const Arr = ({ label, k, src, set, full }) => (
  <div className={full ? 'md:col-span-2' : ''}>
    <label className={labelClass}>{label} <span className="text-neutral-400 font-normal">(comma-separated)</span></label>
    <input
      type="text"
      value={Array.isArray(src?.[k]) ? src[k].join(', ') : (src?.[k] ?? '')}
      onChange={(e) => set(k, e.target.value.split(',').map((s) => s.trim()).filter(Boolean))}
      className={fieldClass}
    />
  </div>
);

const TABS = ['Profile', 'Family', 'Horoscope', 'Lifestyle', 'Preferences', 'Account'];

const UserModal = ({ user, onClose, onRefresh }) => {
  const [tab, setTab] = useState('Profile');
  const [form, setForm] = useState({});
  const [horoscope, setHoroscope] = useState({});
  const [prefs, setPrefs] = useState({});
  const [isLoading, setIsLoading] = useState(false);
  const [loadingRel, setLoadingRel] = useState(true);
  const [distState, setDistState] = useState(null);
  const [userPlan, setUserPlan] = useState(null);
  const [photoLoading, setPhotoLoading] = useState(false);
  const [photos, setPhotos] = useState(user?.profile_photos || []);
  const [family, setFamily] = useState({});
  const [lifestyle, setLifestyle] = useState({});
  const [subHistory, setSubHistory] = useState([]);
  const [subQueue, setSubQueue] = useState([]);
  const [master, setMaster] = useState({});

  useEffect(() => {
    if (!user) return;
    // Seed all known profile columns from the row.
    setForm({ ...user });
    setPhotos(user.profile_photos || []);
    // Load horoscope + preferences.
    (async () => {
      setLoadingRel(true);
      try {
        const [rel, masterData] = await Promise.all([
          adminApi.fetchUserRelations(user.id),
          adminApi.fetchMasterData()
        ]);
        setMaster(masterData || {});
        setHoroscope(rel.horoscope || {});
        setPrefs(rel.preferences || {});
        setFamily(rel.family || {});
        setLifestyle(rel.lifestyle || {});
        const dist = await adminApi.fetchUserDistributionState(user.id);
        setDistState(dist || null);
        
        const plans = await adminApi.fetchSubscriptionPlans();
        const activeMembership = (user.user_subscriptions || []).find(m => m.is_active);
        const currentPlan = plans.find(p => p.name === (activeMembership?.membership_plans?.tier || 'free')) || null;
        setUserPlan(currentPlan);

        setForm(prev => ({
          ...prev,
          contact_credits_remaining: activeMembership?.contact_credits_remaining ?? 0,
          interest_credits_remaining: activeMembership?.interest_credits_remaining ?? 0
        }));

        // Subscription history (all packs) + currently queued/paused packs.
        try {
          const [history, queue] = await Promise.all([
            adminApi.fetchUserSubscriptionHistory(user.id),
            adminApi.fetchUserSubscriptionQueue(user.id),
          ]);
          setSubHistory(history || []);
          setSubQueue(queue || []);
        } catch (e) {
          console.warn('Failed to load subscription history/queue', e);
        }
      } catch (e) {
        console.warn('Failed to load relations', e);
      } finally {
        setLoadingRel(false);
      }
    })();
  }, [user]);

  if (!user) return null;

  const activeMembership = (user.user_subscriptions || []).find(m => m.is_active);
  const isPremium = activeMembership && activeMembership.membership_plans?.tier !== 'free';

  const mapOpts = (arr) => [['', 'Select'], ...(arr || []).map(x => [x.id, x.name])];
  const RELIGION_OPTS = mapOpts(master.religions);
  const CASTE_OPTS = mapOpts(master.castes);
  const EDU_OPTS = mapOpts(master.education_levels);
  const OCC_OPTS = mapOpts(master.occupations);
  const COUNTRY_OPTS = mapOpts(master.countries);
  const STATE_OPTS = mapOpts(master.states);
  const DIST_OPTS = mapOpts(master.districts);
  const CITY_OPTS = mapOpts(master.cities);

  const setF = (k, v) => setForm((p) => ({ ...p, [k]: v }));
  const setH = (k, v) => setHoroscope((p) => ({ ...p, [k]: v }));
  const setP = (k, v) => setPrefs((p) => ({ ...p, [k]: v }));
  const setFam = (k, v) => setFamily((p) => ({ ...p, [k]: v }));
  const setLife = (k, v) => setLifestyle((p) => ({ ...p, [k]: v }));

  const handleSave = async () => {
    setIsLoading(true);
    try {
      // 1. Profile scalar/array columns (exclude auth, nested, and quota fields).
      const { 
        phone, 
        email,
        db_phone,
        contact_credits_remaining, 
        interest_credits_remaining, 
        profile_photos, 
        user_subscriptions, 
        ...profilePayload 
      } = form;
      if (profilePayload.dob === '') profilePayload.dob = null;
      await adminApi.updateUser(user.id, profilePayload);

      // 1b. Update Phone Number (Auth + profile_contact)
      if (phone !== undefined && phone !== user.phone) {
        await adminApi.updateUserPhone(user.id, phone);
      }

      // 2. Horoscope (only if any field set).
      if (Object.values(horoscope).some((v) => v !== '' && v != null)) {
        await adminApi.updateUserHoroscope(user.id, horoscope);
      }

      // 3. Partner preferences (only if any field set).
      if (Object.values(prefs).some((v) => v !== '' && v != null && (!Array.isArray(v) || v.length))) {
        await adminApi.updateUserPreferences(user.id, prefs);
      }

      // 4. Family details.
      if (Object.values(family).some((v) => v !== '' && v != null)) {
        await adminApi.updateUserFamilyDetails(user.id, family);
      }

      // 5. Lifestyle details.
      if (Object.values(lifestyle).some((v) => v !== '' && v != null && (!Array.isArray(v) || v.length))) {
        await adminApi.updateUserLifestyle(user.id, { ...lifestyle, hobbies: lifestyle.interests });
      }

      // 6. Quota overrides if edited.
      if (form.contact_credits_remaining !== undefined || form.interest_credits_remaining !== undefined) {
        await adminApi.updateUserQuotas(user.id, {
          contact_credits_remaining: form.contact_credits_remaining,
          interest_credits_remaining: form.interest_credits_remaining,
        });
      }

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
    if (!window.confirm('Delete this user completely? This cannot be undone.')) return;
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
    const pw = prompt('Enter new password for ' + (user.email || user.full_name) + ' (min 6 chars):');
    if (!pw || pw.length < 6) {
      if (pw !== null) alert('Password must be at least 6 characters.');
      return;
    }
    setIsLoading(true);
    try {
      await adminApi.resetUserPassword(user.id, pw);
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
    if (!window.confirm(`Update plan to ${planType}?`)) { e.target.value = ''; return; }
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

  // Strip premium so the upgrade -> initial-distribution flow can be re-tested.
  // resetDistribution = true also clears granted-tiers, pools and wallet so the
  // next upgrade re-shows the configured initial profiles from scratch.
  const handleMakeFree = async (resetDistribution) => {
    const msg = resetDistribution
      ? 'Make this user FREE and FULLY RESET distribution + wallet?\n\nThe next upgrade will show initial profiles from scratch. This clears their credits and any queued plans.'
      : 'Make this user FREE?\n\nThis strips premium and clears queued plans. Credits and distribution history are kept.';
    if (!window.confirm(msg)) return;
    setIsLoading(true);
    try {
      await adminApi.makeUserFree(user.id, resetDistribution);
      alert(resetDistribution ? 'User reset to Free (full reset).' : 'User downgraded to Free.');
      onRefresh();
      onClose();
    } catch (err) {
      alert('Failed to make user free: ' + err.message);
    } finally {
      setIsLoading(false);
    }
  };

  const handlePhotoUpload = async (e) => {
    const file = e.target.files?.[0];
    if (!file) return;
    if (!window.confirm('Upload this photo?')) return;
    setPhotoLoading(true);
    try {
      const r2Result = await imageApi.uploadPhotoToR2(user.id, file);
      const newPhoto = await adminApi.addPhoto(user.id, r2Result.publicUrl);
      setPhotos((prev) => [...prev, newPhoto]);
      alert('Photo uploaded successfully!');
      onRefresh();
    } catch (err) {
      alert('Failed to upload photo: ' + err.message);
    } finally {
      setPhotoLoading(false);
      e.target.value = '';
    }
  };

  const handlePhotoDelete = async (photo) => {
    if (!window.confirm('Delete this photo?')) return;
    setPhotoLoading(true);
    try {
      await adminApi.deletePhoto(photo.id);
      await imageApi.deletePhotoFromR2(imageApi.getR2PublicUrl(photo.r2_key));
      setPhotos((prev) => prev.filter((p) => p.id !== photo.id));
      onRefresh();
    } catch (err) {
      alert('Failed to delete photo: ' + err.message);
    } finally {
      setPhotoLoading(false);
    }
  };



  const allMatchesCount = Array.isArray(distState) ? distState.filter(d => d.section === 'all_matches').length : 0;
  const dailyUpdatesCount = Array.isArray(distState) ? distState.filter(d => d.section === 'daily_updates').length : 0;

  return createPortal(
    <div className="fixed inset-0 z-[9999] flex items-center justify-center p-4 animate-fade-in" style={{ isolation: 'isolate' }}>
      <div className="absolute inset-0 bg-neutral-950/60 backdrop-blur-sm" onClick={onClose} />
      <div className="relative bg-white rounded-3xl shadow-[var(--shadow-pop)] w-full max-w-3xl max-h-[92vh] overflow-hidden flex flex-col animate-rise">
        {/* Header */}
        <div className="shrink-0 px-6 py-5 border-b border-neutral-100 flex justify-between items-center bg-gradient-to-r from-primary-50/60 to-transparent">
          <div className="flex items-center gap-3">
            <div className="w-11 h-11 rounded-2xl bg-primary-100 text-primary-600 flex items-center justify-center font-bold text-lg">
              {(form.full_name || '?').charAt(0).toUpperCase()}
            </div>
            <div>
              <h2 className="text-lg font-bold text-neutral-900 leading-tight">{form.full_name || 'User Details'}</h2>
              <p className="text-xs text-neutral-500">Full profile editor</p>
            </div>
          </div>
          <button onClick={onClose} className="p-2 rounded-xl text-neutral-400 hover:text-neutral-700 hover:bg-neutral-100 transition-colors">
            <X size={22} />
          </button>
        </div>

        {/* Tabs */}
        <div className="shrink-0 flex gap-2 px-6 py-3 border-b border-neutral-100 overflow-x-auto bg-neutral-50/50">
          {TABS.map((t) => (
            <button
              key={t}
              onClick={() => setTab(t)}
              className={`px-4 py-2 text-sm font-bold rounded-xl whitespace-nowrap transition-all ${
                tab === t 
                  ? 'bg-primary-500 text-white shadow-md shadow-primary-500/25' 
                  : 'text-neutral-500 bg-white hover:text-neutral-900 hover:bg-neutral-100 border border-neutral-200'
              }`}
            >
              {t}
            </button>
          ))}
        </div>

        <div className="p-6 overflow-y-auto flex-1 min-h-0">
          {loadingRel && (tab === 'Horoscope' || tab === 'Preferences') ? (
            <div className="flex items-center justify-center py-12 text-neutral-400 gap-2">
              <Loader2 className="animate-spin" size={18} /> Loading…
            </div>
          ) : (
            <>
              {tab === 'Profile' && (
                <div className="grid grid-cols-1 md:grid-cols-2 gap-4">
                  <Txt label="Name" k="full_name" src={form} set={setF} />
                  <Sel label="Gender" k="gender" options={GENDER_OPTS} src={form} set={setF} />
                  <Txt label="Date of Birth" k="dob" type="date" src={form} set={setF} />
                  <Txt label="Height (cm)" k="height_cm" type="number" src={form} set={setF} />
                  <Txt label="Weight (kg)" k="weight_kg" type="number" src={form} set={setF} />
                  <Sel label="Marital Status" k="marital_status" options={MARITAL_OPTS} src={form} set={setF} />
                  <Sel label="Religion" k="religion_id" options={RELIGION_OPTS} src={form} set={setF} />
                  <Sel label="Caste" k="caste_id" options={CASTE_OPTS} src={form} set={setF} />
                  <Sel label="Qualification" k="education_level_id" options={EDU_OPTS} src={form} set={setF} />
                  <Sel label="Occupation" k="occupation_id" options={OCC_OPTS} src={form} set={setF} />
                  <Txt label="Annual Income" k="annual_income" src={form} set={setF} />
                  <Txt label="About Me" k="about_me" full src={form} set={setF} />
                </div>
              )}

              {tab === 'Family' && (
                <div className="grid grid-cols-1 md:grid-cols-2 gap-4">
                  <Txt label="Father's Name" k="father_name" src={family} set={setFam} />
                  <Txt label="Mother's Name" k="mother_name" src={family} set={setFam} />
                  <Sel label="Family Type" k="family_type" options={FAMILY_TYPE_OPTS} src={family} set={setFam} />
                  <Sel label="Family Status" k="family_status" options={FAMILY_STATUS_OPTS} src={family} set={setFam} />
                  <Txt label="Brothers" k="brothers_count" type="number" src={family} set={setFam} />
                  <Txt label="Sisters" k="sisters_count" type="number" src={family} set={setFam} />
                  <Txt label="City" k="city_text" src={form} set={setF} />
                  <Sel label="District" k="district_id" options={DIST_OPTS} src={form} set={setF} />
                  <Sel label="State" k="state_id" options={STATE_OPTS} src={form} set={setF} />
                  <Sel label="Country" k="country_id" options={COUNTRY_OPTS} src={form} set={setF} />
                </div>
              )}

              {tab === 'Horoscope' && (
                <div className="grid grid-cols-1 md:grid-cols-2 gap-4">
                  <Txt label="Nakshatra" k="nakshatra_text" src={horoscope} set={setH} />
                  <Txt label="Rasi" k="rasi_text" src={horoscope} set={setH} />
                  <Txt label="Lagnam" k="lagnam_text" src={horoscope} set={setH} />
                  <Txt label="Gothram" k="gothram_text" src={horoscope} set={setH} />
                  <Sel label="Dosham" k="dosham" options={DOSHAM_OPTS} src={horoscope} set={setH} />
                </div>
              )}

              {tab === 'Lifestyle' && (
                <div className="grid grid-cols-1 md:grid-cols-2 gap-4">
                  <Sel label="Food Habit" k="food_habit" options={FOOD_OPTS} src={lifestyle} set={setLife} />
                  <Arr label="Languages Known" k="languages" src={lifestyle} set={setLife} />
                  <Arr label="Interests & Hobbies" k="interests" src={lifestyle} set={setLife} />
                </div>
              )}

              {tab === 'Preferences' && (
                <div className="grid grid-cols-1 md:grid-cols-2 gap-4">
                  <Txt label="Min Age" k="min_age" type="number" src={prefs} set={setP} />
                  <Txt label="Max Age" k="max_age" type="number" src={prefs} set={setP} />
                  <Txt label="Min Height (cm)" k="min_height_cm" type="number" src={prefs} set={setP} />
                  <Txt label="Max Height (cm)" k="max_height_cm" type="number" src={prefs} set={setP} />
                  <Sel label="Preferred Religion" k="religion_id" options={RELIGION_OPTS} src={prefs} set={setP} />
                  <Sel label="Preferred Caste" k="caste_id" options={CASTE_OPTS} src={prefs} set={setP} />
                  <Sel label="Preferred Education" k="education_level_id" options={EDU_OPTS} src={prefs} set={setP} />
                  <Sel label="Preferred Occupation" k="occupation_id" options={OCC_OPTS} src={prefs} set={setP} />
                  <Sel label="Preferred Marital Status" k="marital_status" options={MARITAL_OPTS} src={prefs} set={setP} />
                  <Sel label="Preferred City" k="location_city_id" options={CITY_OPTS} src={prefs} set={setP} full />
                </div>
              )}

              {tab === 'Account' && (
                <div className="space-y-6">
                  <div className="grid grid-cols-1 sm:grid-cols-2 gap-3">
                    <div className="bg-neutral-50 rounded-2xl border border-neutral-100 p-4">
                      <p className="text-xs text-neutral-500 mb-1 flex items-center gap-1.5"><Mail size={13} /> Email</p>
                      <p className="font-semibold text-neutral-900 text-sm break-all">{user.email || 'No email'}</p>
                    </div>
                    <div className="bg-neutral-50 rounded-2xl border border-neutral-100 p-4">
                      <p className="text-xs text-neutral-500 mb-1 flex items-center gap-1.5"><Fingerprint size={13} /> User ID</p>
                      <p className="font-mono text-xs text-neutral-400 break-all">{user.id}</p>
                    </div>
                  </div>

                  <div className="grid grid-cols-1 md:grid-cols-2 gap-4">
                    <Txt 
                      label="Phone" 
                      k="phone" 
                      type="tel"
                      maxLength={15}
                      src={form} set={setF}
                      onCustomChange={(val) => setF('phone', val.replace(/[^\d+]/g, ''))}
                    />
                    <div>
                      <label className={labelClass}>Verified</label>
                      <select value={form.is_verified ? 'yes' : 'no'} onChange={(e) => setF('is_verified', e.target.value === 'yes')} className={fieldClass}>
                        <option value="no">Not Verified</option>
                        <option value="yes">Verified</option>
                      </select>
                    </div>
                    <div>
                      <label className={labelClass}>Active Status</label>
                      <select value={form.is_active === false ? 'no' : 'yes'} onChange={(e) => setF('is_active', e.target.value === 'yes')} className={fieldClass}>
                        <option value="yes">Active</option>
                        <option value="no">Inactive</option>
                      </select>
                    </div>
                  </div>

                  {/* Subscription */}
                  <div className="border-t border-neutral-100 pt-5">
                    <h3 className="font-semibold text-neutral-900 mb-4 flex items-center gap-2 text-sm">
                      <Crown size={17} className="text-gold-500" /> Current Plan & Quotas
                    </h3>

                    {/* Current Plan Summary Card */}
                    <div className="bg-gradient-to-r from-neutral-50 to-neutral-100 border border-neutral-200 rounded-xl p-4 mb-6 shadow-sm">
                      <div className="flex flex-col md:flex-row justify-between md:items-center gap-4">
                        <div>
                          <p className="text-[10px] text-neutral-500 font-bold uppercase tracking-wider mb-1.5">Membership Status</p>
                          <div className="flex items-center gap-2.5">
                            <span className={`px-2 py-0.5 rounded text-[11px] font-bold ${isPremium ? 'bg-amber-100 text-amber-700' : 'bg-neutral-200 text-neutral-600'}`}>
                              {isPremium ? 'PREMIUM' : 'FREE'}
                            </span>
                            <span className="text-lg font-black text-neutral-800 capitalize">
                              {activeMembership?.membership_plans?.tier || 'Free'} Plan
                            </span>
                          </div>
                          {isPremium && activeMembership?.expired_at && (
                            <p className="text-xs text-neutral-500 mt-2 font-medium">
                              Expires: <span className="font-bold text-neutral-700">{new Date(activeMembership.expired_at).toLocaleDateString('en-IN', { day: 'numeric', month: 'short', year: 'numeric' })}</span>
                            </p>
                          )}
                        </div>
                        
                        <div className="flex gap-3">
                          <div className="bg-white px-4 py-2.5 rounded-lg border border-neutral-200 shadow-sm text-center min-w-[100px]">
                            <p className="text-[10px] text-neutral-500 font-bold uppercase mb-0.5">Contacts Left</p>
                            <p className="text-2xl font-black text-neutral-800">{form.contact_credits_remaining ?? 0}</p>
                          </div>
                          <div className="bg-white px-4 py-2.5 rounded-lg border border-neutral-200 shadow-sm text-center min-w-[100px]">
                            <p className="text-[10px] text-neutral-500 font-bold uppercase mb-0.5">Interests Left</p>
                            <p className="text-2xl font-black text-neutral-800">{form.interest_credits_remaining ?? 0}</p>
                          </div>
                        </div>
                      </div>
                    </div>

                    <div className="grid grid-cols-1 md:grid-cols-2 gap-4 bg-white p-4 rounded-xl border border-neutral-100">
                      <div>
                        <label className={labelClass}>Manual Plan Override</label>
                        <select className={fieldClass} onChange={handleUpdatePlan} disabled={isLoading} defaultValue="">
                          <option value="" disabled>Change Plan…</option>
                          <option value="free">Free / Demote</option>
                          <option value="silver">Silver</option>
                          <option value="gold">Gold</option>
                          <option value="platinum">Platinum</option>
                        </select>
                      </div>
                      <Txt label="Contact Credits" k="contact_credits_remaining" type="number" src={form} set={setF} />
                      <Txt label="Interest Credits" k="interest_credits_remaining" type="number" src={form} set={setF} />
                    </div>

                    {/* Make Free / Reset for testing the upgrade flow */}
                    <div className="mt-3 flex flex-wrap gap-2">
                      <button
                        onClick={() => handleMakeFree(false)}
                        disabled={isLoading}
                        className="text-xs font-semibold text-neutral-700 bg-neutral-100 hover:bg-neutral-200 px-3 py-2 rounded-lg transition-colors disabled:opacity-50"
                      >
                        Make Free
                      </button>
                      <button
                        onClick={() => handleMakeFree(true)}
                        disabled={isLoading}
                        className="text-xs font-semibold text-error-600 bg-error-50 hover:bg-error-100 px-3 py-2 rounded-lg transition-colors disabled:opacity-50"
                      >
                        Make Free + Reset Distribution
                      </button>
                    </div>
                    <p className="text-[11px] text-neutral-400 mt-1.5">
                      "Reset Distribution" wipes credits + initial-profile grants so the next upgrade re-shows the configured initial distribution (for testing).
                    </p>
                  </div>

                  {/* Queued / Previous Plans */}
                  {subQueue.length > 0 && (
                    <div className="border-t border-neutral-100 pt-5">
                      <h3 className="font-semibold text-neutral-900 mb-3 flex items-center gap-2 text-sm">
                        <ListOrdered size={17} className="text-amber-500" /> Queued / Paused Plans
                      </h3>
                      <div className="space-y-2">
                        {subQueue.map((q) => (
                          <div key={q.id} className="flex justify-between items-center bg-amber-50 border border-amber-100 rounded-xl px-4 py-2.5">
                            <div className="flex items-center gap-2">
                              <span className="font-semibold text-neutral-800 text-sm">{q.membership_plans?.tier?.toUpperCase()}</span>
                              <span className={`text-[10px] font-bold px-2 py-0.5 rounded-full ${q.status === 'paused' ? 'bg-blue-100 text-blue-700' : 'bg-neutral-200 text-neutral-600'}`}>
                                {q.status === 'paused' ? 'PAUSED' : 'PENDING'}
                              </span>
                            </div>
                            <span className="text-xs text-neutral-500">
                              {q.status === 'paused'
                                ? `${q.remaining_days ?? 0} days banked`
                                : `${q.duration_months ?? 0} mo when activated`}
                            </span>
                          </div>
                        ))}
                      </div>
                      <p className="text-[11px] text-neutral-400 mt-1.5">
                        Paused plans resume automatically when the active plan expires (highest tier first).
                      </p>
                    </div>
                  )}

                  {/* Full Subscription History */}
                  <div className="border-t border-neutral-100 pt-5">
                    <h3 className="font-semibold text-neutral-900 mb-3 flex items-center gap-2 text-sm">
                      <History size={17} className="text-neutral-500" /> Subscription History
                    </h3>
                    {subHistory.length === 0 ? (
                      <p className="text-sm text-neutral-400 italic">No purchase history.</p>
                    ) : (
                      <div className="space-y-2 max-h-52 overflow-y-auto">
                        {subHistory.map((h) => (
                          <div key={h.id} className="flex justify-between items-center bg-neutral-50 border border-neutral-100 rounded-xl px-4 py-2.5">
                            <div>
                              <span className="font-semibold text-neutral-800 text-sm">{h.membership_plans?.tier?.toUpperCase()}</span>
                              <span className="ml-2 text-[10px] font-bold px-2 py-0.5 rounded-full bg-neutral-200 text-neutral-500">
                                COMPLETED
                              </span>
                            </div>
                            <div className="text-right">
                              <p className="text-xs text-neutral-600">Plan Quota: {h.membership_plans?.contact_credits ?? 0}c / {h.membership_plans?.interest_credits ?? 0}i</p>
                              <p className="text-[11px] text-neutral-400">
                                {h.started_at ? new Date(h.started_at).toLocaleDateString('en-IN', { day: 'numeric', month: 'short', year: '2-digit' }) : '—'}
                                {' → '}
                                {h.expired_at ? new Date(h.expired_at).toLocaleDateString('en-IN', { day: 'numeric', month: 'short', year: '2-digit' }) : '—'}
                              </p>
                            </div>
                          </div>
                        ))}
                      </div>
                    )}
                  </div>

                  {/* Profile Distribution Limits */}
                  <div className="border-t border-neutral-100 pt-5">
                    <div className="flex justify-between items-center mb-3">
                      <h3 className="font-semibold text-neutral-900 flex items-center gap-2 text-sm">
                        <TrendingUp size={17} className="text-violet-500" /> Profile Distribution Limits
                      </h3>
                      <Button
                        size="sm"
                        variant="outline"
                        onClick={async () => {
                          if (!window.confirm('Force push daily distribution to this user?')) return;
                          setIsLoading(true);
                          try {
                            await adminApi.manualPushToUsers('user', user.id, userPlan?.daily_recommended_increment || 0, 0);
                            alert('Pushed successfully!');
                            onRefresh();
                          } catch (err) {
                            alert('Failed to push: ' + err.message);
                          } finally {
                            setIsLoading(false);
                          }
                        }}
                        disabled={isLoading || !userPlan}
                      >
                        Push Daily Allocation
                      </Button>
                    </div>
                    <div className="grid grid-cols-1 sm:grid-cols-2 gap-3">
                      <div className="bg-violet-50 rounded-2xl p-4 border border-violet-100">
                        <p className="text-xs text-violet-600 mb-2 font-semibold uppercase tracking-wider">All Matches Pool</p>
                        <div className="space-y-1">
                          <div className="flex justify-between items-center text-xs">
                            <span className="text-violet-500">Initial Allocation:</span>
                            <span className="font-medium text-violet-700">{userPlan?.initial_recommended_profiles || 0}</span>
                          </div>
                          <div className="flex justify-between items-center text-xs">
                            <span className="text-violet-500">Daily Increment:</span>
                            <span className="font-medium text-violet-700">+{userPlan?.daily_recommended_increment || 0}</span>
                          </div>
                          <div className="pt-2 mt-2 border-t border-violet-100/50 flex justify-between items-center">
                            <span className="text-[11px] font-semibold text-violet-600 uppercase">Total Unlocked:</span>
                            <span className="font-extrabold text-violet-900 text-lg">{allMatchesCount}</span>
                          </div>
                        </div>
                      </div>

                      <div className="bg-blue-50 rounded-2xl p-4 border border-blue-100">
                        <p className="text-xs text-blue-600 mb-2 font-semibold uppercase tracking-wider">Daily Updates Pool</p>
                        <div className="space-y-1">
                          <div className="flex justify-between items-center text-xs">
                            <span className="text-blue-500">Initial Allocation:</span>
                            <span className="font-medium text-blue-700">{userPlan?.initial_daily_profiles || 0}</span>
                          </div>
                          <div className="flex justify-between items-center text-xs">
                            <span className="text-blue-500">Daily Increment:</span>
                            <span className="font-medium text-blue-700">+{userPlan?.daily_profiles_increment || 0}</span>
                          </div>
                          <div className="pt-2 mt-2 border-t border-blue-100/50 flex justify-between items-center">
                            <span className="text-[11px] font-semibold text-blue-600 uppercase">Total Unlocked:</span>
                            <span className="font-extrabold text-blue-900 text-lg">{dailyUpdatesCount}</span>
                          </div>
                        </div>
                      </div>
                    </div>
                  </div>

                  {/* Photos */}
                  <div className="border-t border-neutral-100 pt-5">
                    <h3 className="font-semibold text-neutral-900 mb-3 flex items-center gap-2 text-sm">
                      <ImagePlus size={17} className="text-primary-500" /> Profile Photos
                    </h3>
                    <div className="flex gap-3 overflow-x-auto pb-2">
                      {photos && photos.length > 0 ? photos.map((photo) => (
                        <div key={photo.id} className="relative group shrink-0 w-24 h-24 rounded-2xl overflow-hidden border border-neutral-200 shadow-sm">
                          <img src={imageApi.getR2PublicUrl(photo.r2_key)} alt="" className="w-full h-full object-cover" />
                          <div className="absolute inset-0 bg-neutral-950/50 opacity-0 group-hover:opacity-100 transition-opacity flex items-center justify-center">
                            <button onClick={() => handlePhotoDelete(photo)} disabled={photoLoading} className="bg-error-500 text-white p-2 rounded-full hover:bg-error-600 disabled:opacity-50">
                              <Trash2 size={15} />
                            </button>
                          </div>
                        </div>
                      )) : (
                        <div className="w-24 h-24 rounded-2xl border-2 border-dashed border-neutral-200 flex flex-col items-center justify-center text-neutral-400 bg-neutral-50">
                          <ImagePlus size={20} className="mb-1 text-neutral-300" />
                          <span className="text-[11px]">No Photos</span>
                        </div>
                      )}
                      <label className="shrink-0 w-24 h-24 rounded-2xl border-2 border-dashed border-primary-200 flex flex-col items-center justify-center text-primary-600 bg-primary-50 cursor-pointer hover:bg-primary-100">
                        {photoLoading ? <Loader2 size={20} className="animate-spin mb-1" /> : <><ImagePlus size={20} className="mb-1" /><span className="text-[11px] font-medium">Upload</span></>}
                        <input type="file" accept="image/jpeg, image/png, image/webp" className="hidden" onChange={handlePhotoUpload} disabled={photoLoading} />
                      </label>
                    </div>
                  </div>

                  <div className="border-t border-neutral-100 pt-5 flex items-center gap-3">
                    <Button variant="outline" size="md" onClick={handleResetPassword} disabled={isLoading} icon={Key}>Reset Password</Button>
                    <Button 
                      variant={form.is_active === false ? "primary" : "outline"} 
                      size="md" 
                      onClick={() => setF('is_active', form.is_active === false ? true : false)} 
                      disabled={isLoading}
                      className={form.is_active !== false ? 'text-error-600 border-error-200 hover:bg-error-50' : ''}
                    >
                      {form.is_active === false ? "Activate Account" : "Suspend Account"}
                    </Button>
                    {form.is_active === false && <span className="text-sm font-bold text-error-600 ml-2">Currently Suspended</span>}
                  </div>
                </div>
              )}
            </>
          )}
        </div>

        {/* Footer */}
        <div className="shrink-0 px-6 py-4 border-t border-neutral-100 bg-neutral-50 flex justify-between items-center">
          <button onClick={handleDelete} disabled={isLoading} className="flex items-center gap-2 text-error-600 hover:text-error-700 font-medium text-sm px-3 py-2 rounded-xl hover:bg-error-50 transition-colors">
            <Trash2 size={17} /> Delete User
          </button>
          <div className="flex gap-3">
            <Button variant="outline" onClick={onClose} disabled={isLoading}>Cancel</Button>
            <Button onClick={handleSave} isLoading={isLoading} icon={Save}>Save All Changes</Button>
          </div>
        </div>
      </div>
    </div>,
    document.body
  );
};

export default UserModal;
