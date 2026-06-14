import { useEffect, useState } from 'react';
import * as adminApi from '../../api/adminApi';
import Card from '../../components/common/Card';
import Button from '../../components/common/Button';

const TIERS = [
  { id: 'non_premium', label: 'Free / Non-Premium' },
  { id: 'silver', label: 'Silver' },
  { id: 'gold', label: 'Gold' },
  { id: 'platinum', label: 'Platinum' }
];

const DEFAULT_SETTINGS = {
  non_premium: { recommended: 5, nearby: 5, daily: 5, dynamic_daily_updates: false },
  silver: { recommended: 20, nearby: 20, daily: 20, dynamic_daily_updates: true },
  gold: { recommended: 30, nearby: 30, daily: 30, dynamic_daily_updates: true },
  platinum: { recommended: 50, nearby: 50, daily: 50, dynamic_daily_updates: true }
};

const RecommendationSettings = () => {
  const [settings, setSettings] = useState(DEFAULT_SETTINGS);
  const [isLoading, setIsLoading] = useState(true);
  const [isSaving, setIsSaving] = useState(false);

  useEffect(() => {
    const loadSettings = async () => {
      try {
        const data = await adminApi.fetchAdminSettings();
        if (data && data.matches_limits) {
          const mergedSettings = {};
          TIERS.forEach(tier => {
            mergedSettings[tier.id] = {
              ...DEFAULT_SETTINGS[tier.id],
              ...(data.matches_limits[tier.id] || {})
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
    setSettings(prev => ({
      ...prev,
      [tier]: {
        ...prev[tier],
        [field]: value
      }
    }));
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

  if (isLoading) return <div className="p-8">Loading settings...</div>;

  return (
    <div className="max-w-5xl mx-auto pb-12">
      <div className="flex justify-between items-center mb-6">
        <div>
          <h1 className="text-2xl font-bold text-neutral-900">Recommendation Settings</h1>
          <p className="text-neutral-500 mt-1">Configure profile display limits for each membership tier.</p>
        </div>
        <Button onClick={handleSave} isLoading={isSaving}>Save Changes</Button>
      </div>

      <div className="space-y-6">
        {TIERS.map(tier => (
          <Card key={tier.id} className="p-6">
            <h2 className="text-lg font-bold text-neutral-900 mb-4 pb-2 border-b border-neutral-100">
              {tier.label} Tier Limits
            </h2>
            
            <div className="grid grid-cols-1 md:grid-cols-3 gap-8">
              {/* Recommended Limit */}
              <div>
                <label className="block text-sm font-medium text-neutral-700 mb-2">
                  Recommended Profiles Max
                </label>
                <div className="flex items-center gap-4">
                  <input 
                    type="range" 
                    min={tier.id === 'non_premium' ? 3 : 1} 
                    max={tier.id === 'non_premium' ? 5 : 100} 
                    value={settings[tier.id].recommended}
                    onChange={(e) => handleChange(tier.id, 'recommended', parseInt(e.target.value))}
                    className="flex-1"
                  />
                  <span className="w-12 text-center font-mono bg-neutral-100 py-1 rounded border border-neutral-200">
                    {settings[tier.id].recommended}
                  </span>
                </div>
              </div>

              {/* Nearby Limit */}
              <div>
                <label className="block text-sm font-medium text-neutral-700 mb-2">
                  Nearby Profiles Max
                </label>
                <div className="flex items-center gap-4">
                  <input 
                    type="range" 
                    min={tier.id === 'non_premium' ? 3 : 1} 
                    max={tier.id === 'non_premium' ? 5 : 100} 
                    value={settings[tier.id].nearby}
                    onChange={(e) => handleChange(tier.id, 'nearby', parseInt(e.target.value))}
                    className="flex-1"
                  />
                  <span className="w-12 text-center font-mono bg-neutral-100 py-1 rounded border border-neutral-200">
                    {settings[tier.id].nearby}
                  </span>
                </div>
              </div>

              {/* Daily Limit */}
              <div>
                <label className="block text-sm font-medium text-neutral-700 mb-2">
                  Daily Profiles Max
                </label>
                <div className="flex items-center gap-4">
                  <input 
                    type="range" 
                    min={tier.id === 'non_premium' ? 3 : 1} 
                    max={tier.id === 'non_premium' ? 5 : 100} 
                    value={settings[tier.id].daily}
                    onChange={(e) => handleChange(tier.id, 'daily', parseInt(e.target.value))}
                    className="flex-1"
                  />
                  <span className="w-12 text-center font-mono bg-neutral-100 py-1 rounded border border-neutral-200">
                    {settings[tier.id].daily}
                  </span>
                </div>
              </div>
            </div>

            <div className="mt-6 pt-4 border-t border-neutral-100">
              <label className={`flex items-center gap-3 ${tier.id === 'non_premium' ? 'opacity-50 cursor-not-allowed' : 'cursor-pointer'}`}>
                <input 
                  type="checkbox" 
                  checked={tier.id === 'non_premium' ? false : settings[tier.id].dynamic_daily_updates}
                  onChange={(e) => handleChange(tier.id, 'dynamic_daily_updates', e.target.checked)}
                  disabled={tier.id === 'non_premium'}
                  className="w-5 h-5 text-primary-600 rounded border-neutral-300 focus:ring-primary-500"
                />
                <div>
                  <span className="text-sm font-medium text-neutral-900 block">Enable Dynamic Daily Updates</span>
                  <span className="text-xs text-neutral-500">
                    {tier.id === 'non_premium' 
                      ? 'Disabled for free users — they always see the same static profiles to encourage upgrading.'
                      : 'Profiles rotate daily — users see a fresh set of matches every day from the full pool. Keeps users engaged and coming back.'
                    }
                  </span>
                </div>
              </label>
            </div>
          </Card>
        ))}
      </div>
    </div>
  );
};

export default RecommendationSettings;
