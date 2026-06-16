import { useEffect, useState } from 'react';
import * as adminApi from '../../api/adminApi';
import Card from '../../components/common/Card';
import Button from '../../components/common/Button';
import useAuthStore from '../../store/useAuthStore';
import { SlidersHorizontal, RotateCcw, Zap, Clock, AlertTriangle, History, ChevronDown } from 'lucide-react';

const TIERS = [
  { id: 'free', label: 'Free', dot: 'bg-neutral-400', ring: 'ring-neutral-200' },
  { id: 'silver', label: 'Silver', dot: 'bg-slate-400', ring: 'ring-slate-200' },
  { id: 'gold', label: 'Gold', dot: 'bg-amber-500', ring: 'ring-amber-200' },
  { id: 'platinum', label: 'Platinum', dot: 'bg-violet-500', ring: 'ring-violet-200' },
];

const DistributionManager = () => {
  const { user } = useAuthStore();
  const [settings, setSettings] = useState({});
  const [history, setHistory] = useState([]);
  const [isLoading, setIsLoading] = useState(true);
  const [isSaving, setIsSaving] = useState(null);
  const [isPushing, setIsPushing] = useState(null);
  const [confirmModal, setConfirmModal] = useState(null);
  const [showHistory, setShowHistory] = useState(false);

  useEffect(() => {
    loadData();
  }, []);

  const loadData = async () => {
    try {
      const [adminSettings, historyData] = await Promise.all([
        adminApi.fetchAdminSettings(),
        adminApi.fetchDistributionHistory().catch(() => []),
      ]);

      if (adminSettings?.matches_limits) {
        const mapped = {};
        TIERS.forEach((tier) => {
          const key = tier.id === 'free' ? 'non_premium' : tier.id;
          const data = adminSettings.matches_limits[key] || {};
          mapped[tier.id] = {
            recommended: data.recommended || 0,
            nearby: data.nearby || 0,
            daily: data.daily || 0,
          };
        });
        setSettings(mapped);
      }
      setHistory(historyData);
    } catch (err) {
      console.error('Failed to load distribution data:', err);
    } finally {
      setIsLoading(false);
    }
  };

  const handleChange = (tier, field, value) => {
    setSettings((prev) => ({
      ...prev,
      [tier]: { ...prev[tier], [field]: parseInt(value) || 0 },
    }));
  };

  const handleSaveTomorrow = async (tierId) => {
    setIsSaving(tierId);
    try {
      await adminApi.saveDistributionChange(tierId, settings[tierId], 'tomorrow', user?.email);
      await loadData();
      alert(`${tierId.charAt(0).toUpperCase() + tierId.slice(1)} changes scheduled for tomorrow.`);
    } catch (err) {
      alert('Failed to save: ' + (err.message || 'Unknown error'));
    } finally {
      setIsSaving(null);
    }
  };

  const handlePushTier = (tierId) => {
    setConfirmModal({
      type: 'tier',
      tier: tierId,
      message: `This will regenerate profile allocations for all ${tierId.toUpperCase()} users and may replace today's frozen profile pools.`,
    });
  };

  const handlePushAll = () => {
    setConfirmModal({
      type: 'all',
      message: 'This will regenerate profile allocations for ALL users across ALL tiers and may replace today\'s frozen profile pools.',
    });
  };

  const confirmPush = async () => {
    const { type, tier } = confirmModal;
    setConfirmModal(null);
    setIsPushing(type === 'all' ? 'all' : tier);

    try {
      if (type === 'all') {
        // Save all tiers first
        for (const t of TIERS) {
          await adminApi.saveDistributionChange(t.id, settings[t.id], 'now_all', user?.email);
        }
        await adminApi.forcePushAllDistribution(user?.email);
        alert('Distribution pushed to all users successfully!');
      } else {
        await adminApi.saveDistributionChange(tier, settings[tier], 'now_tier', user?.email);
        await adminApi.forcePushDistribution(tier, user?.email);
        alert(`Distribution pushed to ${tier} users successfully!`);
      }
      await loadData();
    } catch (err) {
      alert('Push failed: ' + (err.message || 'Unknown error'));
    } finally {
      setIsPushing(null);
    }
  };

  const formatDate = (dateStr) => {
    if (!dateStr) return '-';
    return new Date(dateStr).toLocaleString('en-IN', {
      day: 'numeric', month: 'short', year: 'numeric',
      hour: '2-digit', minute: '2-digit',
    });
  };

  if (isLoading) {
    return (
      <div className="space-y-6">
        <div className="h-9 w-64 bg-white rounded-xl animate-pulse" />
        {[0, 1, 2, 3].map((i) => (
          <div key={i} className="h-48 bg-white rounded-2xl border border-neutral-200/70 animate-pulse" />
        ))}
      </div>
    );
  }

  return (
    <div className="pb-12">
      {/* Header */}
      <div className="flex flex-wrap justify-between items-end gap-3 mb-7">
        <div>
          <p className="text-sm font-medium text-primary-600 flex items-center gap-1.5 mb-1">
            <SlidersHorizontal size={15} /> Distribution Control
          </p>
          <h1 className="text-2xl sm:text-3xl font-extrabold text-neutral-900 tracking-tight">
            Profile Distribution Manager
          </h1>
          <p className="text-neutral-500 mt-1 text-sm max-w-2xl">
            Configure how many profiles each tier receives. Push changes immediately or schedule for tomorrow.
          </p>
        </div>
        <Button onClick={handlePushAll} variant="danger" size="lg" icon={Zap} isLoading={isPushing === 'all'}>
          Push To All Plans Now
        </Button>
      </div>

      {/* Tier Cards */}
      <div className="space-y-5">
        {TIERS.map((tier) => {
          const s = settings[tier.id] || { recommended: 0, nearby: 0, daily: 0 };
          return (
            <Card key={tier.id} className="overflow-hidden">
              <div className="flex items-center justify-between px-6 py-4 border-b border-neutral-100 bg-gradient-to-r from-neutral-50/80 to-transparent">
                <div className="flex items-center gap-3">
                  <span className={`w-3 h-3 rounded-full ${tier.dot} ring-4 ${tier.ring}`} />
                  <h2 className="text-lg font-bold text-neutral-900">{tier.label} Tier</h2>
                </div>
              </div>

              <div className="p-6">
                <div className="grid grid-cols-3 gap-4 mb-6">
                  {[
                    { f: 'recommended', l: 'Recommended Pool' },
                    { f: 'nearby', l: 'Nearby Pool' },
                    { f: 'daily', l: 'Daily Pool' },
                  ].map((m) => (
                    <div key={m.f} className="bg-neutral-50 rounded-xl border border-neutral-100 p-4 text-center">
                      <label className="block text-xs font-semibold text-neutral-500 mb-2">{m.l}</label>
                      <input
                        type="number"
                        value={s[m.f]}
                        onChange={(e) => handleChange(tier.id, m.f, e.target.value)}
                        className="w-full text-center text-2xl font-bold text-neutral-900 bg-white border border-neutral-200 rounded-lg px-2 py-2 focus:outline-none focus:border-primary-400 focus:ring-4 focus:ring-primary-100 transition-all"
                      />
                    </div>
                  ))}
                </div>

                <div className="flex flex-wrap gap-3">
                  <Button
                    onClick={() => handleSaveTomorrow(tier.id)}
                    variant="outline"
                    icon={Clock}
                    isLoading={isSaving === tier.id}
                  >
                    Apply Tomorrow
                  </Button>
                  <Button
                    onClick={() => handlePushTier(tier.id)}
                    variant="primary"
                    icon={Zap}
                    isLoading={isPushing === tier.id}
                  >
                    Push To {tier.label} Now
                  </Button>
                </div>
              </div>
            </Card>
          );
        })}
      </div>

      {/* Change History */}
      <div className="mt-10">
        <button
          onClick={() => setShowHistory(!showHistory)}
          className="flex items-center gap-2 text-lg font-bold text-neutral-900 mb-4 hover:text-primary-600 transition-colors"
        >
          <History size={20} />
          Change History
          <ChevronDown size={16} className={`transition-transform ${showHistory ? 'rotate-180' : ''}`} />
        </button>

        {showHistory && (
          <Card className="overflow-hidden">
            {history.length === 0 ? (
              <div className="p-8 text-center text-neutral-400">
                <History size={32} className="mx-auto mb-2 opacity-50" />
                <p className="text-sm">No distribution changes recorded yet.</p>
              </div>
            ) : (
              <div className="overflow-x-auto">
                <table className="w-full text-sm">
                  <thead>
                    <tr className="border-b border-neutral-100 bg-neutral-50/50">
                      <th className="px-4 py-3 text-left font-semibold text-neutral-600">Date</th>
                      <th className="px-4 py-3 text-left font-semibold text-neutral-600">Tier</th>
                      <th className="px-4 py-3 text-center font-semibold text-neutral-600">Recommended</th>
                      <th className="px-4 py-3 text-center font-semibold text-neutral-600">Nearby</th>
                      <th className="px-4 py-3 text-center font-semibold text-neutral-600">Daily</th>
                      <th className="px-4 py-3 text-left font-semibold text-neutral-600">Push Mode</th>
                      <th className="px-4 py-3 text-left font-semibold text-neutral-600">Admin</th>
                    </tr>
                  </thead>
                  <tbody>
                    {history.map((h) => (
                      <tr key={h.id} className="border-b border-neutral-50 hover:bg-neutral-50/50 transition-colors">
                        <td className="px-4 py-3 text-neutral-700">{formatDate(h.created_at)}</td>
                        <td className="px-4 py-3">
                          <span className="inline-flex items-center gap-1.5 px-2 py-1 rounded-full bg-neutral-100 text-xs font-semibold text-neutral-700 capitalize">
                            {h.tier}
                          </span>
                        </td>
                        <td className="px-4 py-3 text-center font-mono">
                          {h.previous_recommended != null ? (
                            <span className="text-neutral-400">{h.previous_recommended} → </span>
                          ) : null}
                          <span className="font-bold text-neutral-900">{h.recommended_limit}</span>
                        </td>
                        <td className="px-4 py-3 text-center font-mono">
                          {h.previous_nearby != null ? (
                            <span className="text-neutral-400">{h.previous_nearby} → </span>
                          ) : null}
                          <span className="font-bold text-neutral-900">{h.nearby_limit}</span>
                        </td>
                        <td className="px-4 py-3 text-center font-mono">
                          {h.previous_daily != null ? (
                            <span className="text-neutral-400">{h.previous_daily} → </span>
                          ) : null}
                          <span className="font-bold text-neutral-900">{h.daily_limit}</span>
                        </td>
                        <td className="px-4 py-3">
                          <span className={`text-xs font-semibold px-2 py-1 rounded-full ${
                            h.push_mode === 'tomorrow'
                              ? 'bg-blue-50 text-blue-700'
                              : h.push_mode === 'now_all'
                              ? 'bg-error-50 text-error-700'
                              : 'bg-success-50 text-success-700'
                          }`}>
                            {h.push_mode === 'tomorrow' ? '⏰ Tomorrow' : h.push_mode === 'now_all' ? '⚡ All Now' : '⚡ Tier Now'}
                          </span>
                        </td>
                        <td className="px-4 py-3 text-neutral-500 text-xs truncate max-w-[150px]">{h.created_by}</td>
                      </tr>
                    ))}
                  </tbody>
                </table>
              </div>
            )}
          </Card>
        )}
      </div>

      {/* Confirmation Modal */}
      {confirmModal && (
        <div className="fixed inset-0 z-50 flex items-center justify-center p-4">
          <div className="absolute inset-0 bg-neutral-950/50 backdrop-blur-sm" onClick={() => setConfirmModal(null)} />
          <div className="relative bg-white rounded-2xl shadow-2xl max-w-md w-full p-6 animate-rise">
            <div className="flex items-start gap-3 mb-4">
              <div className="w-10 h-10 rounded-full bg-error-100 flex items-center justify-center shrink-0">
                <AlertTriangle size={20} className="text-error-600" />
              </div>
              <div>
                <h3 className="text-lg font-bold text-neutral-900">Confirm Force Push</h3>
                <p className="text-sm text-neutral-500 mt-1">{confirmModal.message}</p>
              </div>
            </div>

            <div className="bg-amber-50 border border-amber-200 rounded-xl p-3 mb-5">
              <p className="text-xs text-amber-800 font-medium">
                ⚠️ This action cannot be undone. Users will receive new profile allocations immediately.
              </p>
            </div>

            <div className="flex gap-3 justify-end">
              <Button variant="outline" onClick={() => setConfirmModal(null)}>
                Cancel
              </Button>
              <Button variant="danger" onClick={confirmPush} icon={Zap}>
                Confirm Push
              </Button>
            </div>
          </div>
        </div>
      )}
    </div>
  );
};

export default DistributionManager;
