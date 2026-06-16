import { useEffect, useState } from 'react';
import * as adminApi from '../../api/adminApi';
import { Users, Crown, UserCircle, TrendingUp, Sparkles, Zap } from 'lucide-react';
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
          adminApi.fetchAdminSettings(),
        ]);

        const premiumCount = users.filter((u) => u.is_premium).length;

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

  const premiumRate =
    stats.totalUsers > 0 ? Math.round((stats.premiumUsers / stats.totalUsers) * 100) : 0;

  const statCards = [
    {
      label: 'Total Members',
      value: stats.totalUsers,
      icon: Users,
      iconBg: 'bg-primary-100 text-primary-600',
      accent: 'from-primary-500/10',
    },
    {
      label: 'Premium Members',
      value: stats.premiumUsers,
      icon: Crown,
      iconBg: 'bg-gold-100 text-gold-600',
      accent: 'from-gold-500/10',
      sub: `${premiumRate}% conversion`,
    },
    {
      label: 'Free Members',
      value: stats.freeUsers,
      icon: UserCircle,
      iconBg: 'bg-neutral-200 text-neutral-600',
      accent: 'from-neutral-400/10',
    },
  ];

  const tierMeta = {
    non_premium: { label: 'Free', dot: 'bg-neutral-400', ring: 'ring-neutral-200', text: 'text-neutral-600', chip: 'bg-neutral-100 text-neutral-600' },
    silver: { label: 'Silver', dot: 'bg-slate-400', ring: 'ring-slate-200', text: 'text-slate-600', chip: 'bg-slate-100 text-slate-700' },
    gold: { label: 'Gold', dot: 'bg-gold-500', ring: 'ring-gold-200', text: 'text-gold-700', chip: 'bg-gold-100 text-gold-700' },
    platinum: { label: 'Platinum', dot: 'bg-violet-500', ring: 'ring-violet-200', text: 'text-violet-700', chip: 'bg-violet-100 text-violet-700' },
  };

  const renderLimitCard = (tierKey, limitData) => {
    if (!limitData) return null;
    const meta = tierMeta[tierKey];
    return (
      <Card hover className="overflow-hidden">
        <div className={`px-5 py-4 flex items-center justify-between border-b border-neutral-100`}>
          <div className="flex items-center gap-2.5">
            <span className={`w-2.5 h-2.5 rounded-full ${meta.dot} ring-4 ${meta.ring}`} />
            <h3 className="font-bold text-neutral-900">{meta.label} Tier</h3>
          </div>
          {limitData.dynamic_daily_updates ? (
            <span className="inline-flex items-center gap-1 text-[11px] font-semibold px-2 py-1 rounded-full bg-success-50 text-success-700">
              <Zap size={11} /> Dynamic
            </span>
          ) : (
            <span className="text-[11px] font-semibold px-2 py-1 rounded-full bg-neutral-100 text-neutral-500">
              Static
            </span>
          )}
        </div>
        <div className="grid grid-cols-3 divide-x divide-neutral-100">
          {[
            { k: 'Recommended', v: limitData.recommended },
            { k: 'Nearby', v: limitData.nearby },
            { k: 'Daily', v: limitData.daily },
          ].map((m) => (
            <div key={m.k} className="px-2 py-4 text-center">
              <p className={`text-2xl font-extrabold ${meta.text}`}>{m.v ?? 0}</p>
              <p className="text-[11px] text-neutral-400 font-medium mt-0.5">{m.k}</p>
            </div>
          ))}
        </div>
      </Card>
    );
  };

  return (
    <div>
      {/* Page header */}
      <div className="flex flex-wrap items-end justify-between gap-3 mb-7">
        <div>
          <p className="text-sm font-medium text-primary-600 flex items-center gap-1.5 mb-1">
            <Sparkles size={15} /> Overview
          </p>
          <h1 className="text-2xl sm:text-3xl font-extrabold text-neutral-900 tracking-tight">
            Dashboard
          </h1>
          <p className="text-neutral-500 mt-1 text-sm">
            A snapshot of your platform's members and distribution settings.
          </p>
        </div>
      </div>

      {/* Stat cards */}
      <div className="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-3 gap-5 mb-9">
        {statCards.map((s, i) => (
          <Card key={s.label} hover className="relative overflow-hidden p-5">
            <div className={`absolute inset-0 bg-gradient-to-br ${s.accent} to-transparent pointer-events-none`} />
            <div className="relative flex items-center gap-4">
              <div className={`w-14 h-14 rounded-2xl ${s.iconBg} flex items-center justify-center shadow-sm`}>
                <s.icon size={26} />
              </div>
              <div className="min-w-0">
                <p className="text-sm font-medium text-neutral-500">{s.label}</p>
                {isLoading ? (
                  <div className="h-8 w-16 mt-1 rounded-lg bg-neutral-100 animate-pulse" />
                ) : (
                  <p className="text-3xl font-extrabold text-neutral-900 tracking-tight">
                    {s.value.toLocaleString()}
                  </p>
                )}
                {s.sub && !isLoading && (
                  <p className="text-xs font-medium text-success-600 flex items-center gap-1 mt-0.5">
                    <TrendingUp size={12} /> {s.sub}
                  </p>
                )}
              </div>
            </div>
          </Card>
        ))}
      </div>

      {/* Tier limits */}
      <div className="flex items-center gap-2 mb-4">
        <h2 className="text-lg font-bold text-neutral-900">Profile Distribution Limits</h2>
        <span className="text-xs text-neutral-400 font-medium">· live from tier settings</span>
      </div>

      {isLoading ? (
        <div className="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-4 gap-5">
          {[0, 1, 2, 3].map((i) => (
            <div key={i} className="h-36 rounded-2xl bg-white border border-neutral-200/70 animate-pulse" />
          ))}
        </div>
      ) : (
        <div className="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-4 gap-5">
          {limits && (
            <>
              {renderLimitCard('non_premium', limits.non_premium)}
              {renderLimitCard('silver', limits.silver)}
              {renderLimitCard('gold', limits.gold)}
              {renderLimitCard('platinum', limits.platinum)}
            </>
          )}
        </div>
      )}
    </div>
  );
};

export default AdminDashboard;
