import { useEffect, useState } from 'react';
import * as adminApi from '../../api/adminApi';
import Card from '../../components/common/Card';
import Button from '../../components/common/Button';
import { SlidersHorizontal, Play, Clock, Search, User, TrendingUp, Wallet, History, RefreshCw } from 'lucide-react';

const TIERS = [
  { id: 'free', label: 'Free', color: 'bg-neutral-100 text-neutral-700' },
  { id: 'silver', label: 'Silver', color: 'bg-slate-100 text-slate-700' },
  { id: 'gold', label: 'Gold', color: 'bg-amber-100 text-amber-700' },
  { id: 'platinum', label: 'Platinum', color: 'bg-violet-100 text-violet-700' },
];

const DistributionManager = () => {
  const [plans, setPlans] = useState([]);
  const [isLoading, setIsLoading] = useState(true);
  const [isRunning, setIsRunning] = useState(false);
  const [lastRunResult, setLastRunResult] = useState(null);

  // User lookup
  const [searchQuery, setSearchQuery] = useState('');
  const [searchResults, setSearchResults] = useState([]);
  const [isSearching, setIsSearching] = useState(false);
  const [selectedUser, setSelectedUser] = useState(null);
  const [userState, setUserState] = useState(null);
  const [userWallet, setUserWallet] = useState(null);

  useEffect(() => {
    loadPlans();
  }, []);

  const loadPlans = async () => {
    try {
      const data = await adminApi.fetchSubscriptionPlans();
      setPlans(data);
    } catch (err) {
      console.error('Failed to load plans:', err);
    } finally {
      setIsLoading(false);
    }
  };

  const handleRunDistribution = async () => {
    if (!confirm('This will run the daily distribution for all active premium users. Continue?')) return;
    setIsRunning(true);
    try {
      const result = await adminApi.triggerDailyDistribution();
      setLastRunResult(result);
      alert(`Distribution complete! ${result?.users_updated || 0} users updated.`);
    } catch (err) {
      alert('Failed: ' + (err.message || 'Unknown error'));
    } finally {
      setIsRunning(false);
    }
  };

  const handleSearch = async () => {
    if (!searchQuery.trim()) return;
    setIsSearching(true);
    setSelectedUser(null);
    setUserState(null);
    setUserWallet(null);
    try {
      const users = await adminApi.fetchAllUsers();
      const filtered = users.filter(
        (u) =>
          u.display_name?.toLowerCase().includes(searchQuery.toLowerCase()) ||
          u.phone?.includes(searchQuery) ||
          u.profile_id?.toLowerCase().includes(searchQuery.toLowerCase())
      );
      setSearchResults(filtered.slice(0, 10));
    } catch (err) {
      console.error('Search failed:', err);
    } finally {
      setIsSearching(false);
    }
  };

  const handleSelectUser = async (user) => {
    setSelectedUser(user);
    setSearchResults([]);
    try {
      const [state, wallet] = await Promise.all([
        adminApi.fetchUserDistributionState(user.id),
        adminApi.fetchUserWallet(user.id),
      ]);
      setUserState(state);
      setUserWallet(wallet);
    } catch (err) {
      console.error('Failed to load user data:', err);
    }
  };

  const formatDate = (d) => {
    if (!d) return 'Never';
    return new Date(d).toLocaleDateString('en-IN', { day: 'numeric', month: 'short', year: 'numeric' });
  };

  if (isLoading) {
    return (
      <div className="space-y-6">
        <div className="h-9 w-64 bg-white rounded-xl animate-pulse" />
        {[0, 1, 2].map((i) => (
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
            View distribution configuration and manually trigger the daily distribution cron.
            Per-user limits grow automatically over time.
          </p>
        </div>
        <Button onClick={handleRunDistribution} isLoading={isRunning} size="lg" icon={Play}>
          Run Daily Distribution Now
        </Button>
      </div>

      {/* Single source of truth notice */}
      <div className="mb-6 bg-blue-50 border border-blue-200 rounded-xl px-5 py-3 flex items-start gap-3">
        <SlidersHorizontal size={16} className="text-blue-600 mt-0.5 shrink-0" />
        <div>
          <p className="text-sm text-blue-900 font-semibold">Single source of truth: Subscription Plans</p>
          <p className="text-xs text-blue-700 mt-0.5">
            All tier limits and credits are configured in <strong>Premium Plans</strong>. This page is read-only —
            it shows the live configuration and lets you trigger / inspect distribution. The mobile feeds
            (Recommended, Nearby, Daily) all read these same values, so changes apply everywhere instantly.
          </p>
        </div>
      </div>

      {/* Last Run Result */}
      {lastRunResult && (
        <div className="mb-6 bg-success-50 border border-success-200 rounded-xl px-5 py-3 flex items-center gap-3">
          <RefreshCw size={16} className="text-success-600" />
          <span className="text-sm text-success-800 font-medium">
            Last run: {lastRunResult.users_updated} users updated on {lastRunResult.run_date}
          </span>
        </div>
      )}

      {/* Distribution Config Summary */}
      <Card className="mb-6 overflow-hidden">
        <div className="px-6 py-4 border-b border-neutral-100 bg-neutral-50/50">
          <h2 className="text-base font-bold text-neutral-900 flex items-center gap-2">
            <TrendingUp size={16} className="text-primary-500" />
            Current Distribution Configuration
          </h2>
          <p className="text-xs text-neutral-500 mt-1">
            Edit these values in Settings → Subscription Plans
          </p>
        </div>
        <div className="overflow-x-auto">
          <table className="w-full text-sm">
            <thead>
              <tr className="text-left bg-neutral-50/50">
                <th className="px-6 py-3 font-semibold text-neutral-600">Tier</th>
                <th className="px-4 py-3 font-semibold text-neutral-600 text-center" colSpan="3">Initial (One-time)</th>
                <th className="px-4 py-3 font-semibold text-neutral-600 text-center" colSpan="3">Daily Increment</th>
                <th className="px-4 py-3 font-semibold text-neutral-600 text-center" colSpan="2">Credits / Purchase</th>
              </tr>
              <tr className="text-left border-b border-neutral-100">
                <th className="px-6 py-2"></th>
                <th className="px-4 py-2 text-xs font-medium text-neutral-500">Rec</th>
                <th className="px-4 py-2 text-xs font-medium text-neutral-500">Near</th>
                <th className="px-4 py-2 text-xs font-medium text-neutral-500">Daily</th>
                <th className="px-4 py-2 text-xs font-medium text-neutral-500">+Rec</th>
                <th className="px-4 py-2 text-xs font-medium text-neutral-500">+Near</th>
                <th className="px-4 py-2 text-xs font-medium text-neutral-500">+Daily</th>
                <th className="px-4 py-2 text-xs font-medium text-neutral-500">Contacts</th>
                <th className="px-4 py-2 text-xs font-medium text-neutral-500">Interests</th>
              </tr>
            </thead>
            <tbody>
              {plans.map((plan) => {
                const tierMeta = TIERS.find((t) => t.id === plan.tier);
                return (
                  <tr key={plan.tier} className="border-b border-neutral-50 hover:bg-neutral-50/50">
                    <td className="px-6 py-3">
                      <span className={`inline-flex px-2.5 py-1 rounded-full text-xs font-bold ${tierMeta?.color || ''}`}>
                        {plan.plan_name || plan.tier}
                      </span>
                    </td>
                    <td className="px-4 py-3 text-center font-mono text-neutral-800">{plan.initial_recommended_profiles}</td>
                    <td className="px-4 py-3 text-center font-mono text-neutral-800">{plan.initial_nearby_profiles}</td>
                    <td className="px-4 py-3 text-center font-mono text-neutral-800">{plan.initial_daily_profiles}</td>
                    <td className="px-4 py-3 text-center font-mono text-violet-700">{plan.daily_recommended_increment > 0 ? `+${plan.daily_recommended_increment}` : '-'}</td>
                    <td className="px-4 py-3 text-center font-mono text-violet-700">{plan.daily_nearby_increment > 0 ? `+${plan.daily_nearby_increment}` : '-'}</td>
                    <td className="px-4 py-3 text-center font-mono text-violet-700">{plan.daily_profiles_increment > 0 ? `+${plan.daily_profiles_increment}` : '-'}</td>
                    <td className="px-4 py-3 text-center font-mono text-emerald-700">{plan.contacts_limit ?? plan.contact_credits ?? 0}</td>
                    <td className="px-4 py-3 text-center font-mono text-emerald-700">{plan.interests_limit ?? plan.interest_credits ?? 0}</td>
                  </tr>
                );
              })}
            </tbody>
          </table>
        </div>
      </Card>

      {/* User Distribution Lookup */}
      <Card className="overflow-hidden">
        <div className="px-6 py-4 border-b border-neutral-100 bg-neutral-50/50">
          <h2 className="text-base font-bold text-neutral-900 flex items-center gap-2">
            <User size={16} className="text-primary-500" />
            User Distribution State
          </h2>
          <p className="text-xs text-neutral-500 mt-1">
            Search for a user to view their profile distribution limits and wallet
          </p>
        </div>

        <div className="p-6">
          {/* Search */}
          <div className="flex gap-3 mb-5">
            <div className="relative flex-1">
              <Search size={16} className="absolute left-3 top-1/2 -translate-y-1/2 text-neutral-400" />
              <input
                type="text"
                placeholder="Search by name, phone, or profile ID..."
                value={searchQuery}
                onChange={(e) => setSearchQuery(e.target.value)}
                onKeyDown={(e) => e.key === 'Enter' && handleSearch()}
                className="w-full pl-9 pr-4 py-2.5 border border-neutral-200 rounded-xl bg-neutral-50 text-sm focus:bg-white focus:outline-none focus:border-primary-400 focus:ring-4 focus:ring-primary-100"
              />
            </div>
            <Button onClick={handleSearch} isLoading={isSearching} icon={Search}>
              Search
            </Button>
          </div>

          {/* Search Results */}
          {searchResults.length > 0 && (
            <div className="mb-5 border border-neutral-200 rounded-xl overflow-hidden">
              {searchResults.map((user) => (
                <button
                  key={user.id}
                  onClick={() => handleSelectUser(user)}
                  className="w-full flex items-center gap-3 px-4 py-3 hover:bg-neutral-50 border-b border-neutral-100 last:border-0 text-left transition-colors"
                >
                  <div className="w-8 h-8 rounded-full bg-primary-100 flex items-center justify-center text-primary-700 font-bold text-xs">
                    {(user.display_name || 'U').charAt(0)}
                  </div>
                  <div className="flex-1 min-w-0">
                    <p className="text-sm font-medium text-neutral-900 truncate">{user.display_name}</p>
                    <p className="text-xs text-neutral-500">{user.profile_id} • {user.phone}</p>
                  </div>
                  <span className={`px-2 py-0.5 rounded-full text-[11px] font-bold ${TIERS.find(t => t.id === (user.tier || 'free'))?.color || ''}`}>
                    {(user.tier || 'free').toUpperCase()}
                  </span>
                </button>
              ))}
            </div>
          )}

          {/* Selected User Detail */}
          {selectedUser && (
            <div className="space-y-4">
              <div className="flex items-center gap-3 py-3 px-4 bg-primary-50 rounded-xl border border-primary-100">
                <div className="w-10 h-10 rounded-full bg-primary-200 flex items-center justify-center text-primary-800 font-bold">
                  {(selectedUser.display_name || 'U').charAt(0)}
                </div>
                <div>
                  <p className="font-semibold text-neutral-900">{selectedUser.display_name}</p>
                  <p className="text-xs text-neutral-600">{selectedUser.profile_id} • {selectedUser.tier?.toUpperCase() || 'FREE'}</p>
                </div>
              </div>

              <div className="grid grid-cols-1 md:grid-cols-2 gap-4">
                {/* Distribution State */}
                <div className="bg-blue-50/50 rounded-xl border border-blue-100 p-4">
                  <h4 className="font-semibold text-sm text-neutral-800 flex items-center gap-2 mb-3">
                    <TrendingUp size={14} className="text-blue-600" /> Profile Limits
                  </h4>
                  {userState ? (
                    <div className="space-y-2 text-sm">
                      <div className="flex justify-between">
                        <span className="text-neutral-600">Recommended Limit:</span>
                        <span className="font-bold text-neutral-900">{userState.recommended_profiles_shown}</span>
                      </div>
                      <div className="flex justify-between">
                        <span className="text-neutral-600">Nearby Limit:</span>
                        <span className="font-bold text-neutral-900">{userState.nearby_profiles_shown}</span>
                      </div>
                      <div className="flex justify-between">
                        <span className="text-neutral-600">Daily Limit:</span>
                        <span className="font-bold text-neutral-900">{userState.daily_profiles_shown}</span>
                      </div>
                      <div className="border-t border-blue-100 my-2 pt-2">
                        <div className="flex justify-between">
                          <span className="text-neutral-600">Highest Tier:</span>
                          <span className="font-bold">{userState.highest_tier_ever_reached?.toUpperCase()}</span>
                        </div>
                        <div className="flex justify-between">
                          <span className="text-neutral-600">Tiers Granted:</span>
                          <span className="font-mono text-xs">{(userState.initial_distribution_granted_tiers || []).join(', ')}</span>
                        </div>
                        <div className="flex justify-between">
                          <span className="text-neutral-600">Last Distribution:</span>
                          <span>{formatDate(userState.last_distribution_date)}</span>
                        </div>
                      </div>
                    </div>
                  ) : (
                    <p className="text-sm text-neutral-400 italic">No distribution state found</p>
                  )}
                </div>

                {/* Wallet */}
                <div className="bg-emerald-50/50 rounded-xl border border-emerald-100 p-4">
                  <h4 className="font-semibold text-sm text-neutral-800 flex items-center gap-2 mb-3">
                    <Wallet size={14} className="text-emerald-600" /> Credit Wallet
                  </h4>
                  {userWallet ? (
                    <div className="space-y-2 text-sm">
                      <div className="flex justify-between">
                        <span className="text-neutral-600">Contact Credits:</span>
                        <span className="font-bold text-emerald-700 text-lg">{userWallet.contact_credits}</span>
                      </div>
                      <div className="flex justify-between">
                        <span className="text-neutral-600">Interest Credits:</span>
                        <span className="font-bold text-emerald-700 text-lg">{userWallet.interest_credits}</span>
                      </div>
                      <div className="border-t border-emerald-100 my-2 pt-2">
                        <div className="flex justify-between">
                          <span className="text-neutral-600">Last Updated:</span>
                          <span className="text-xs">{formatDate(userWallet.updated_at)}</span>
                        </div>
                      </div>
                    </div>
                  ) : (
                    <p className="text-sm text-neutral-400 italic">No wallet found</p>
                  )}
                </div>
              </div>
            </div>
          )}
        </div>
      </Card>
    </div>
  );
};

export default DistributionManager;
