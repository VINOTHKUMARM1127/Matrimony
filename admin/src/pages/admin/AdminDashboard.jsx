import { useEffect, useState } from 'react';
import * as adminApi from '../../api/adminApi';
import { Users, Crown, Activity } from 'lucide-react';
import Card from '../../components/common/Card';

const AdminDashboard = () => {
  const [stats, setStats] = useState({
    totalUsers: 0,
    premiumUsers: 0,
    freeUsers: 0,
  });
  const [limits, setLimits] = useState(null);
  const [isLoading, setIsLoading] = useState(true);

  useEffect(() => {
    const loadStats = async () => {
      try {
        const [users, adminSettings] = await Promise.all([
          adminApi.fetchAllUsers(),
          adminApi.fetchAdminSettings()
        ]);
        
        const premiumCount = users.filter(u => u.is_premium).length;
        
        setStats({
          totalUsers: users.length,
          premiumUsers: premiumCount,
          freeUsers: users.length - premiumCount,
        });

        if (adminSettings && adminSettings.matches_limits) {
          setLimits(adminSettings.matches_limits);
        }
      } catch (err) {
        console.error('Failed to load stats:', err);
      } finally {
        setIsLoading(false);
      }
    };
    loadStats();
  }, []);

  if (isLoading) {
    return <div className="text-neutral-500">Loading dashboard...</div>;
  }

  const renderLimitCard = (title, limitData, badgeColor) => {
    if (!limitData) return null;
    return (
      <Card className="p-5 flex flex-col gap-3">
        <div className="flex items-center justify-between border-b border-neutral-100 pb-2">
          <h3 className="font-bold text-neutral-900">{title}</h3>
          <span className={`text-xs font-semibold px-2 py-1 rounded-full ${badgeColor}`}>Limits</span>
        </div>
        <div className="grid grid-cols-3 gap-2 text-center mt-2">
          <div className="bg-neutral-50 rounded p-2">
            <p className="text-xs text-neutral-500 mb-1">Recommended</p>
            <p className="text-lg font-bold text-primary">{limitData.recommended}</p>
          </div>
          <div className="bg-neutral-50 rounded p-2">
            <p className="text-xs text-neutral-500 mb-1">Nearby</p>
            <p className="text-lg font-bold text-primary">{limitData.nearby}</p>
          </div>
          <div className="bg-neutral-50 rounded p-2">
            <p className="text-xs text-neutral-500 mb-1">Daily</p>
            <p className="text-lg font-bold text-primary">{limitData.daily}</p>
          </div>
        </div>
        <div className="mt-1 pt-2 border-t border-neutral-100 flex items-center justify-between">
          <span className="text-xs font-medium text-neutral-500">Dynamic Daily Updates</span>
          {limitData.dynamic_daily_updates ? (
            <span className="text-xs font-bold text-green-600">Enabled</span>
          ) : (
            <span className="text-xs font-bold text-red-500">Disabled</span>
          )}
        </div>
      </Card>
    );
  };

  return (
    <div>
      <h1 className="text-2xl font-bold text-neutral-900 mb-6">Dashboard Overview</h1>
      
      <div className="grid grid-cols-1 md:grid-cols-3 gap-6 mb-8">
        <Card className="p-6 flex items-center gap-4">
          <div className="w-12 h-12 rounded-full bg-primary-100 text-primary flex items-center justify-center">
            <Users size={24} />
          </div>
          <div>
            <p className="text-sm font-medium text-neutral-500">Total Users</p>
            <p className="text-2xl font-bold text-neutral-900">{stats.totalUsers}</p>
          </div>
        </Card>
        
        <Card className="p-6 flex items-center gap-4">
          <div className="w-12 h-12 rounded-full bg-gold-100 text-gold-600 flex items-center justify-center">
            <Crown size={24} />
          </div>
          <div>
            <p className="text-sm font-medium text-neutral-500">Premium Members</p>
            <p className="text-2xl font-bold text-neutral-900">{stats.premiumUsers}</p>
          </div>
        </Card>
        
        <Card className="p-6 flex items-center gap-4">
          <div className="w-12 h-12 rounded-full bg-neutral-200 text-neutral-600 flex items-center justify-center">
            <Activity size={24} />
          </div>
          <div>
            <p className="text-sm font-medium text-neutral-500">Free Members</p>
            <p className="text-2xl font-bold text-neutral-900">{stats.freeUsers}</p>
          </div>
        </Card>
      </div>

      <h2 className="text-lg font-bold text-neutral-900 mb-4">Current Profile Limits</h2>
      <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-4 gap-6 mb-8">
        {limits && (
          <>
            {renderLimitCard('Free Tier', limits.non_premium, 'bg-neutral-100 text-neutral-600')}
            {renderLimitCard('Silver Tier', limits.silver, 'bg-slate-200 text-slate-700')}
            {renderLimitCard('Gold Tier', limits.gold, 'bg-gold-100 text-gold-700')}
            {renderLimitCard('Platinum Tier', limits.platinum, 'bg-purple-100 text-purple-700')}
          </>
        )}
      </div>
      
      <Card className="p-6">
        <h2 className="text-lg font-bold mb-4">Recent Activity</h2>
        <p className="text-neutral-500 text-sm">Dashboard metrics updated recently. Use the sidebar to manage users or adjust recommendation settings.</p>
      </Card>
    </div>
  );
};

export default AdminDashboard;
