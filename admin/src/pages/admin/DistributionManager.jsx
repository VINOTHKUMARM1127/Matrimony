import { useEffect, useState } from 'react';
import supabase from '../../api/supabaseClient';
import * as adminApi from '../../api/adminApi';
import Card from '../../components/common/Card';
import Button from '../../components/common/Button';
import { SlidersHorizontal, Send } from 'lucide-react';

const TIERS = [
  { id: 'free', label: 'Free', color: 'bg-neutral-100 text-neutral-700' },
  { id: 'silver', label: 'Silver', color: 'bg-slate-100 text-slate-700' },
  { id: 'gold', label: 'Gold', color: 'bg-amber-100 text-amber-700' },
  { id: 'platinum', label: 'Platinum', color: 'bg-violet-100 text-violet-700' },
];

const DistributionManager = () => {
  const [isLoading, setIsLoading] = useState(true);

  // Manual Push state
  const [pushType, setPushType] = useState('all'); // 'all', 'tier', 'user'
  const [pushTier, setPushTier] = useState('silver');
  const [pushUserId, setPushUserId] = useState('');
  const [pushAllMatches, setPushAllMatches] = useState(0);
  const [pushDailyUpdates, setPushDailyUpdates] = useState(0);
  const [isPushing, setIsPushing] = useState(false);

  const [health, setHealth] = useState({ 
    active_users: 0, 
    total_unlocked: 0,
    tiers: { silver: 0, gold: 0, platinum: 0 }
  });


  useEffect(() => {
    loadHealth();
  }, []);

  const loadHealth = async () => {
    try {
      const { data: subs } = await supabase
        .from('user_subscriptions')
        .select('membership_plans(tier)')
        .eq('is_active', true);
        
      const { count: totalUnlocked } = await supabase
        .from('distributed_profiles')
        .select('*', { count: 'exact', head: true });
        
      const tiers = { silver: 0, gold: 0, platinum: 0 };
      let activeCount = 0;
      if (subs) {
        subs.forEach(sub => {
          const tier = sub.membership_plans?.tier;
          if (tier && tier !== 'free') {
            tiers[tier] = (tiers[tier] || 0) + 1;
            activeCount++;
          }
        });
      }
        
      setHealth({ 
        active_users: activeCount, 
        total_unlocked: totalUnlocked || 0,
        tiers
      });
    } catch (err) {
      console.error('Failed to load health stats:', err);
    } finally {
      setIsLoading(false);
    }
  };

  const handleManualPush = async () => {
    if (pushAllMatches === 0 && pushDailyUpdates === 0) {
      return window.alert('Please enter at least 1 profile to push.');
    }
    if (pushType === 'user' && !pushUserId.trim()) {
      return window.alert('Please enter a specific User ID.');
    }

    const targetVal = pushType === 'tier' ? pushTier : (pushType === 'user' ? pushUserId : null);
    
    if (!window.confirm(`Push ${pushAllMatches} All Matches and ${pushDailyUpdates} Daily Updates to ${pushType}?`)) return;

    setIsPushing(true);
    try {
      const result = await adminApi.manualPushToUsers(pushType, targetVal, pushAllMatches, pushDailyUpdates);
      window.alert(`Successfully pushed — ${result} profiles distributed.`);
      setPushAllMatches(0);
      setPushDailyUpdates(0);
    } catch (err) {
      window.alert('Push Failed: ' + (err.message || 'Unknown error'));
    } finally {
      setIsPushing(false);
    }
  };


  if (isLoading) {
    return (
      <div className="space-y-6 p-6">
        <div className="h-9 w-64 bg-white rounded-xl animate-pulse" />
        <div className="h-48 bg-white rounded-2xl animate-pulse" />
      </div>
    );
  }

  return (
    <div className="pb-12 max-w-6xl mx-auto px-4 sm:px-6 mt-6">
      {/* Header */}
      <div className="flex flex-wrap justify-between items-end gap-3 mb-7">
        <div>
          <p className="text-sm font-medium text-primary-600 flex items-center gap-1.5 mb-1">
            <SlidersHorizontal size={15} /> Distribution Control
          </p>
          <h1 className="text-2xl sm:text-3xl font-extrabold text-neutral-900 tracking-tight">
            Distribution Manager
          </h1>
          <p className="text-neutral-500 mt-1 text-sm max-w-2xl">
            Configure Initial & Daily distribution limits for premium plans, and manually push profiles instantly.
          </p>
        </div>
      </div>

      {/* Health Widgets */}
      <div className="grid grid-cols-1 md:grid-cols-3 gap-4 mb-8">
        <div className="p-5 bg-white rounded-xl shadow-sm border border-neutral-200">
          <h3 className="text-sm font-medium text-neutral-500 mb-1">Total Active Premium Users</h3>
          <p className="text-2xl font-bold text-neutral-900">{health.active_users}</p>
        </div>
        <div className="p-5 bg-white rounded-xl shadow-sm border border-neutral-200 col-span-1 md:col-span-2">
          <h3 className="text-sm font-medium text-neutral-500 mb-1">Premium Breakdown</h3>
          <div className="flex gap-6 mt-1">
            <div className="flex flex-col">
              <span className="text-[10px] uppercase font-bold text-slate-500">Silver</span>
              <span className="text-xl font-bold text-slate-700">{health.tiers?.silver || 0}</span>
            </div>
            <div className="flex flex-col">
              <span className="text-[10px] uppercase font-bold text-amber-500">Gold</span>
              <span className="text-xl font-bold text-amber-600">{health.tiers?.gold || 0}</span>
            </div>
            <div className="flex flex-col">
              <span className="text-[10px] uppercase font-bold text-violet-500">Platinum</span>
              <span className="text-xl font-bold text-violet-700">{health.tiers?.platinum || 0}</span>
            </div>
          </div>
        </div>
      </div>


      {/* Manual Push Configuration */}
      <Card className="overflow-hidden border border-neutral-200">
        <div className="px-6 py-4 border-b border-neutral-100 bg-neutral-50/80 flex items-center justify-between">
          <div>
            <h2 className="text-base font-bold text-neutral-900 flex items-center gap-2">
              <Send size={18} className="text-amber-500" />
              Manual Distribution Push
            </h2>
            <p className="text-xs text-neutral-500 mt-1">
              Instantly push additional profiles to users without waiting for the scheduled job.
            </p>
          </div>
        </div>
        <div className="p-6">
          <div className="grid grid-cols-1 md:grid-cols-2 gap-8">
            <div className="space-y-5">
              <div>
                <label className="block text-sm font-medium text-neutral-700 mb-1">Target Audience</label>
                <select 
                  value={pushType} 
                  onChange={(e) => setPushType(e.target.value)}
                  className="w-full px-4 py-2 border border-neutral-300 rounded-xl focus:ring-2 focus:ring-primary-200 focus:border-primary-400 outline-none"
                >
                  <option value="all">All Active Users</option>
                  <option value="tier">Specific Plan Tier</option>
                  <option value="user">Specific User ID</option>
                </select>
              </div>

              {pushType === 'tier' && (
                <div>
                  <label className="block text-sm font-medium text-neutral-700 mb-1">Select Tier</label>
                  <select 
                    value={pushTier} 
                    onChange={(e) => setPushTier(e.target.value)}
                    className="w-full px-4 py-2 border border-neutral-300 rounded-xl focus:ring-2 focus:ring-primary-200 focus:border-primary-400 outline-none"
                  >
                    <option value="silver">Silver</option>
                    <option value="gold">Gold</option>
                    <option value="platinum">Platinum</option>
                  </select>
                </div>
              )}

              {pushType === 'user' && (
                <div>
                  <label className="block text-sm font-medium text-neutral-700 mb-1">User ID</label>
                  <input 
                    type="text" 
                    value={pushUserId}
                    onChange={(e) => setPushUserId(e.target.value)}
                    placeholder="Enter Supabase UUID..."
                    className="w-full px-4 py-2 border border-neutral-300 rounded-xl focus:ring-2 focus:ring-primary-200 focus:border-primary-400 outline-none"
                  />
                </div>
              )}
            </div>

            <div className="space-y-5">
              <div className="grid grid-cols-2 gap-4">
                <div>
                  <label className="block text-sm font-medium text-neutral-700 mb-1">All Matches Profiles</label>
                  <input 
                    type="number" 
                    min="0"
                    value={pushAllMatches}
                    onChange={(e) => setPushAllMatches(parseInt(e.target.value) || 0)}
                    className="w-full px-4 py-2 border border-neutral-300 rounded-xl focus:ring-2 focus:ring-primary-200 focus:border-primary-400 outline-none font-mono"
                  />
                </div>
                <div>
                  <label className="block text-sm font-medium text-neutral-700 mb-1">Daily Updates Profiles</label>
                  <input 
                    type="number" 
                    min="0"
                    value={pushDailyUpdates}
                    onChange={(e) => setPushDailyUpdates(parseInt(e.target.value) || 0)}
                    className="w-full px-4 py-2 border border-neutral-300 rounded-xl focus:ring-2 focus:ring-primary-200 focus:border-primary-400 outline-none font-mono"
                  />
                </div>
              </div>
              
              <div className="pt-2">
                <Button 
                  onClick={handleManualPush} 
                  isLoading={isPushing} 
                  className="w-full justify-center" 
                  size="lg" 
                  icon={Send}
                >
                  Push Profiles Instantly
                </Button>
              </div>
            </div>
          </div>
        </div>
      </Card>

    </div>
  );
};

export default DistributionManager;
