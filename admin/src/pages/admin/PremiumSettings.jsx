import { useEffect, useState } from 'react';
import * as adminApi from '../../api/adminApi';
import Card from '../../components/common/Card';
import Button from '../../components/common/Button';
import { Trash2, Plus, Crown, Star, SlidersHorizontal, Tag, Sparkles, Zap } from 'lucide-react';

const TIERS = [
  { id: 'non_premium', label: 'Free / Non-Premium', dot: 'bg-neutral-400' },
  { id: 'silver', label: 'Silver Plan', dot: 'bg-slate-400' },
  { id: 'gold', label: 'Gold Plan', dot: 'bg-gold-500' },
  { id: 'platinum', label: 'Platinum Plan', dot: 'bg-violet-500' },
];

const DEFAULT_SETTINGS = {
  non_premium: { plan_name: 'Free', price_inr: 0, duration_months: 0, contacts_limit: 0, interests_limit: 0, recommended: 5, nearby: 5, daily: 5, dynamic_daily_updates: false, color_code: '#AAAAAA', is_popular: false, features: [] },
  silver: { plan_name: 'Silver', price_inr: 499, duration_months: 1, contacts_limit: 30, interests_limit: 50, recommended: 20, nearby: 20, daily: 20, dynamic_daily_updates: true, color_code: '#8A8A8A', is_popular: false, features: ['View 30 contact numbers', 'Send up to 50 interests'] },
  gold: { plan_name: 'Gold', price_inr: 999, duration_months: 1, contacts_limit: 50, interests_limit: 100, recommended: 30, nearby: 30, daily: 30, dynamic_daily_updates: true, color_code: '#D4AF37', is_popular: true, features: ['View 50 contact numbers', 'Send up to 100 interests'] },
  platinum: { plan_name: 'Platinum', price_inr: 2499, duration_months: 3, contacts_limit: 100, interests_limit: 300, recommended: 50, nearby: 50, daily: 50, dynamic_daily_updates: true, color_code: '#E5E4E2', is_popular: false, features: ['View 100 contact numbers', 'Send up to 300 interests'] },
};

const PremiumSettings = () => {
  const [settings, setSettings] = useState(DEFAULT_SETTINGS);
  const [isLoading, setIsLoading] = useState(true);
  const [isSaving, setIsSaving] = useState(false);

  useEffect(() => {
    const loadSettings = async () => {
      try {
        const data = await adminApi.fetchAdminSettings();
        if (data && data.matches_limits) {
          const mergedSettings = {};
          TIERS.forEach((tier) => {
            mergedSettings[tier.id] = {
              ...DEFAULT_SETTINGS[tier.id],
              ...(data.matches_limits[tier.id] || {}),
            };
          });
          setSettings(mergedSettings);
        }
      } catch (err) {
        console.error('Failed to load settings:', err);
      } finally {
        setIsLoading(false);
      }
    };
    loadSettings();
  }, []);

  const handleChange = (tier, field, value) => {
    setSettings((prev) => ({ ...prev, [tier]: { ...prev[tier], [field]: value } }));
  };

  const handleFeatureChange = (tier, index, value) => {
    const newFeatures = [...settings[tier].features];
    newFeatures[index] = value;
    handleChange(tier, 'features', newFeatures);
  };

  const addFeature = (tier) => {
    handleChange(tier, 'features', [...settings[tier].features, 'New Feature']);
  };

  const removeFeature = (tier, index) => {
    handleChange(tier, 'features', settings[tier].features.filter((_, i) => i !== index));
  };

  const handleSave = async () => {
    setIsSaving(true);
    try {
      await adminApi.updateAdminSetting('matches_limits', settings);
      alert('Settings saved successfully!');
    } catch (err) {
      console.error(err);
      alert('Failed to save settings.');
    } finally {
      setIsSaving(false);
    }
  };

  if (isLoading) {
    return (
      <div className="space-y-6">
        <div className="h-9 w-64 bg-white rounded-xl animate-pulse" />
        {[0, 1].map((i) => (
          <div key={i} className="h-72 bg-white rounded-2xl border border-neutral-200/70 animate-pulse" />
        ))}
      </div>
    );
  }

  const fieldClass =
    'w-full px-3 py-2 border border-neutral-200 rounded-xl bg-neutral-50 text-sm text-neutral-900 focus:bg-white focus:outline-none focus:border-primary-400 focus:ring-4 focus:ring-primary-100 transition-all';
  const labelClass = 'block text-xs font-semibold text-neutral-600 mb-1.5';

  return (
    <div className="pb-12">
      {/* Sticky header */}
      <div className="flex flex-wrap justify-between items-end gap-3 mb-7">
        <div>
          <p className="text-sm font-medium text-primary-600 flex items-center gap-1.5 mb-1">
            <SlidersHorizontal size={15} /> Configuration
          </p>
          <h1 className="text-2xl sm:text-3xl font-extrabold text-neutral-900 tracking-tight">Premium Plans &amp; Limits</h1>
          <p className="text-neutral-500 mt-1 text-sm max-w-2xl">
            Configure pricing, features, and quotas for each tier. Changes reflect instantly in the app.
          </p>
        </div>
        <Button onClick={handleSave} isLoading={isSaving} size="lg" icon={Sparkles}>
          Save All Changes
        </Button>
      </div>

      <div className="space-y-6">
        {TIERS.map((tier) => {
          const s = settings[tier.id];
          const isFree = tier.id === 'non_premium';
          return (
            <Card key={tier.id} className="overflow-hidden">
              {/* Tier header bar */}
              <div className="flex items-center justify-between px-6 py-4 border-b border-neutral-100 bg-gradient-to-r from-neutral-50/80 to-transparent">
                <div className="flex items-center gap-3">
                  <span className={`w-3 h-3 rounded-full ${tier.dot} ring-4 ring-offset-0`} style={{ boxShadow: `0 0 0 4px ${s.color_code}22` }} />
                  <h2 className="text-lg font-bold text-neutral-900">{tier.label}</h2>
                  {s.is_popular && (
                    <span className="inline-flex items-center gap-1 text-[11px] font-bold bg-gold-100 text-gold-700 px-2 py-1 rounded-full">
                      <Star size={11} fill="currentColor" /> BEST VALUE
                    </span>
                  )}
                </div>
                {!isFree && (
                  <div className="flex items-center gap-1.5 text-sm font-bold text-neutral-700">
                    ₹{s.price_inr}
                    <span className="text-xs font-medium text-neutral-400">/ {s.duration_months}mo</span>
                  </div>
                )}
              </div>

              <div className="grid grid-cols-1 lg:grid-cols-2 gap-x-10 gap-y-6 p-6">
                {/* Left: Plan details */}
                <div className="space-y-5">
                  <div>
                    <h3 className="font-semibold text-neutral-800 text-sm flex items-center gap-2 mb-3">
                      <Tag size={15} className="text-primary-500" /> Plan Details
                    </h3>
                    <div className="grid grid-cols-2 gap-3">
                      <div>
                        <label className={labelClass}>Display Name</label>
                        <input type="text" value={s.plan_name} onChange={(e) => handleChange(tier.id, 'plan_name', e.target.value)} className={fieldClass} />
                      </div>
                      <div>
                        <label className={labelClass}>Price (₹)</label>
                        <input type="number" value={s.price_inr} onChange={(e) => handleChange(tier.id, 'price_inr', parseInt(e.target.value) || 0)} disabled={isFree} className={`${fieldClass} disabled:opacity-50`} />
                      </div>
                      <div>
                        <label className={labelClass}>Duration (Months)</label>
                        <input type="number" value={s.duration_months} onChange={(e) => handleChange(tier.id, 'duration_months', parseInt(e.target.value) || 0)} disabled={isFree} className={`${fieldClass} disabled:opacity-50`} />
                      </div>
                      <div>
                        <label className={labelClass}>Brand Color</label>
                        <div className="flex gap-2">
                          <input type="color" value={s.color_code} onChange={(e) => handleChange(tier.id, 'color_code', e.target.value)} className="h-[42px] w-12 p-1 border border-neutral-200 rounded-xl cursor-pointer bg-white" />
                          <input type="text" value={s.color_code} onChange={(e) => handleChange(tier.id, 'color_code', e.target.value)} className={`${fieldClass} font-mono uppercase`} />
                        </div>
                      </div>
                    </div>

                    {!isFree && (
                      <label className="flex items-center gap-2.5 mt-4 cursor-pointer select-none">
                        <input type="checkbox" checked={s.is_popular} onChange={(e) => handleChange(tier.id, 'is_popular', e.target.checked)} className="w-4 h-4 text-primary-600 rounded border-neutral-300 focus:ring-primary-500" />
                        <span className="text-sm font-medium text-neutral-700">Mark as "Popular / Best Value"</span>
                      </label>
                    )}
                  </div>

                  <div className="pt-4 border-t border-neutral-100">
                    <h3 className="font-semibold text-neutral-800 text-sm flex items-center gap-2 mb-3">
                      <Crown size={15} className="text-gold-500" /> Quotas Awarded on Purchase
                    </h3>
                    <div className="grid grid-cols-2 gap-3">
                      <div>
                        <label className={labelClass}>Contact Views</label>
                        <input type="number" value={s.contacts_limit} onChange={(e) => handleChange(tier.id, 'contacts_limit', parseInt(e.target.value) || 0)} disabled={isFree} className={`${fieldClass} disabled:opacity-50`} />
                      </div>
                      <div>
                        <label className={labelClass}>Send Interests</label>
                        <input type="number" value={s.interests_limit} onChange={(e) => handleChange(tier.id, 'interests_limit', parseInt(e.target.value) || 0)} disabled={isFree} className={`${fieldClass} disabled:opacity-50`} />
                      </div>
                    </div>
                  </div>
                </div>

                {/* Right: Features + pool limits */}
                <div className="space-y-5">
                  <div>
                    <div className="flex justify-between items-center mb-3">
                      <h3 className="font-semibold text-neutral-800 text-sm">Features (App UI)</h3>
                      <button onClick={() => addFeature(tier.id)} className="flex items-center gap-1 text-xs text-primary-600 hover:text-primary-700 font-semibold bg-primary-50 hover:bg-primary-100 px-2.5 py-1.5 rounded-lg transition-colors">
                        <Plus size={14} /> Add
                      </button>
                    </div>
                    {s.features.length === 0 ? (
                      <p className="text-sm text-neutral-400 italic py-2">No features listed.</p>
                    ) : (
                      <div className="space-y-2">
                        {s.features.map((feature, idx) => (
                          <div key={idx} className="flex items-center gap-2">
                            <input type="text" value={feature} onChange={(e) => handleFeatureChange(tier.id, idx, e.target.value)} className={`${fieldClass} flex-1`} />
                            <button onClick={() => removeFeature(tier.id, idx)} className="p-2.5 text-neutral-400 hover:text-error-500 hover:bg-error-50 rounded-xl transition-colors">
                              <Trash2 size={16} />
                            </button>
                          </div>
                        ))}
                      </div>
                    )}
                  </div>

                  <div className="pt-4 border-t border-neutral-100">
                    <h3 className="font-semibold text-neutral-800 text-sm mb-3">Profile Distribution Pool</h3>
                    <div className="grid grid-cols-3 gap-3 mb-4">
                      {[
                        { f: 'recommended', l: 'Recommended' },
                        { f: 'nearby', l: 'Nearby' },
                        { f: 'daily', l: 'Daily' },
                      ].map((m) => (
                        <div key={m.f} className="bg-neutral-50 rounded-xl border border-neutral-100 p-3 text-center">
                          <label className="block text-[11px] font-medium text-neutral-500 mb-1.5">{m.l}</label>
                          <input
                            type="number"
                            value={s[m.f]}
                            onChange={(e) => handleChange(tier.id, m.f, parseInt(e.target.value) || 0)}
                            className="w-full text-center text-lg font-bold text-neutral-900 bg-transparent border-0 focus:outline-none focus:ring-0 p-0"
                          />
                        </div>
                      ))}
                    </div>

                    <label className={`flex items-center gap-2.5 select-none ${isFree ? 'opacity-50' : 'cursor-pointer'}`}>
                      <input
                        type="checkbox"
                        checked={isFree ? false : s.dynamic_daily_updates}
                        onChange={(e) => handleChange(tier.id, 'dynamic_daily_updates', e.target.checked)}
                        disabled={isFree}
                        className="w-4 h-4 text-primary-600 rounded border-neutral-300 focus:ring-primary-500"
                      />
                      <span className="text-sm font-medium text-neutral-700 flex items-center gap-1.5">
                        <Zap size={14} className="text-success-500" /> Daily profiles rotate automatically
                      </span>
                    </label>
                  </div>
                </div>
              </div>
            </Card>
          );
        })}
      </div>

      {/* Footer save */}
      <div className="flex justify-end mt-8">
        <Button onClick={handleSave} isLoading={isSaving} size="lg" icon={Sparkles}>
          Save All Changes
        </Button>
      </div>
    </div>
  );
};

export default PremiumSettings;
