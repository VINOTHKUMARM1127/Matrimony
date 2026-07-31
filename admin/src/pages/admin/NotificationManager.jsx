import { useEffect, useState, useCallback } from 'react';
import supabase from '../../api/supabaseClient';
import * as adminApi from '../../api/adminApi';
import Card from '../../components/common/Card';
import Button from '../../components/common/Button';
import {
  Bell, Send, CheckCircle2, XCircle, Clock, Users, Crown,
  Megaphone, Smartphone, Target, ChevronRight, Sparkles,
  RefreshCw, Filter, Search, ArrowRight, Zap, Radio,
  MessageSquare, AlertCircle, Eye, X
} from 'lucide-react';
import { format, formatDistanceToNow } from 'date-fns';

/* ── Inline Toast ──────────────────────────────────────── */
const Toast = ({ message, type, onClose }) => {
  useEffect(() => {
    const t = setTimeout(onClose, 4000);
    return () => clearTimeout(t);
  }, [onClose]);

  const colors = {
    success: 'bg-emerald-600 text-white',
    error: 'bg-red-600 text-white',
    info: 'bg-blue-600 text-white',
  };

  return (
    <div className="fixed top-6 right-6 z-50 animate-rise">
      <div className={`${colors[type] || colors.info} px-5 py-3 rounded-xl shadow-xl flex items-center gap-3 min-w-[280px]`}>
        {type === 'success' && <CheckCircle2 size={18} />}
        {type === 'error' && <XCircle size={18} />}
        {type === 'info' && <Bell size={18} />}
        <span className="text-sm font-medium flex-1">{message}</span>
        <button onClick={onClose} className="opacity-70 hover:opacity-100 transition-opacity">
          <X size={14} />
        </button>
      </div>
    </div>
  );
};

/* ── Stat Pill ─────────────────────────────────────────── */
const StatPill = ({ label, value, color, icon: Icon }) => (
  <div className="flex items-center gap-3 px-4 py-3 rounded-xl bg-white/60 backdrop-blur border border-neutral-200/60 transition-all duration-300 hover:shadow-md hover:-translate-y-0.5 group">
    <div className={`w-10 h-10 rounded-xl ${color} flex items-center justify-center transition-transform duration-300 group-hover:scale-110`}>
      <Icon size={18} />
    </div>
    <div>
      <p className="text-[11px] font-semibold uppercase tracking-wider text-neutral-400">{label}</p>
      <p className="text-xl font-bold text-neutral-900 leading-tight">{value}</p>
    </div>
  </div>
);

/* ── Status Badge ──────────────────────────────────────── */
const StatusBadge = ({ status, error }) => {
  const configs = {
    sent: {
      icon: CheckCircle2,
      label: 'Sent',
      class: 'text-emerald-700 bg-emerald-50 border-emerald-200/60',
    },
    delivered: {
      icon: CheckCircle2,
      label: 'Delivered',
      class: 'text-emerald-700 bg-emerald-50 border-emerald-200/60',
    },
    failed: {
      icon: XCircle,
      label: 'Failed',
      class: 'text-red-700 bg-red-50 border-red-200/60',
    },
    pending: {
      icon: Clock,
      label: 'Pending',
      class: 'text-amber-700 bg-amber-50 border-amber-200/60',
    },
    skipped: {
      icon: Eye,
      label: 'Skipped (Seen)',
      class: 'text-slate-600 bg-slate-100 border-slate-300',
    },
  };

  const c = configs[status] || configs.pending;
  const IconComp = c.icon;

  return (
    <span
      className={`inline-flex items-center gap-1.5 text-[11px] font-semibold px-2.5 py-1 rounded-lg border ${c.class}`}
      title={error || ''}
    >
      <IconComp size={13} />
      {c.label}
    </span>
  );
};

/* ── Confirm Dialog ────────────────────────────────────── */
const ConfirmDialog = ({ open, title, message, onConfirm, onCancel }) => {
  if (!open) return null;
  return (
    <div className="fixed inset-0 z-50 flex items-center justify-center bg-black/30 backdrop-blur-sm animate-fade-in">
      <div className="bg-white rounded-2xl shadow-2xl max-w-md w-full mx-4 p-6 animate-rise">
        <div className="flex items-center gap-3 mb-3">
          <div className="w-10 h-10 rounded-xl bg-primary-100 text-primary-600 flex items-center justify-center">
            <Send size={18} />
          </div>
          <h3 className="text-lg font-bold text-neutral-900">{title}</h3>
        </div>
        <p className="text-sm text-neutral-600 mb-6 leading-relaxed">{message}</p>
        <div className="flex gap-3 justify-end">
          <Button variant="outline" size="sm" onClick={onCancel}>Cancel</Button>
          <Button size="sm" icon={Send} onClick={onConfirm}>Send Now</Button>
        </div>
      </div>
    </div>
  );
};



/* ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ */
/*  MAIN COMPONENT                                          */
/* ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ */
const NotificationManager = () => {
  const [isLoading, setIsLoading] = useState(true);

  // Form state
  const [pushType, setPushType] = useState('all');
  const [pushTier, setPushTier] = useState('silver');
  const [pushUserId, setPushUserId] = useState('');
  const [pushTitle, setPushTitle] = useState('');
  const [pushBody, setPushBody] = useState('');
  const [pushMsgType, setPushMsgType] = useState('daily_engagement');
  const [pushScreen, setPushScreen] = useState('');

  const [isPushing, setIsPushing] = useState(false);
  const [logs, setLogs] = useState([]);
  const [logFilter, setLogFilter] = useState('all');
  const [logSearch, setLogSearch] = useState('');
  const [isRefreshing, setIsRefreshing] = useState(false);

  // Confirm dialog
  const [confirmOpen, setConfirmOpen] = useState(false);

  // Toast
  const [toast, setToast] = useState(null);

  const [health, setHealth] = useState({
    active_users: 0,
    tiers: { silver: 0, gold: 0, platinum: 0 },
  });

  const showToast = useCallback((message, type = 'info') => {
    setToast({ message, type });
  }, []);

  useEffect(() => {
    loadHealthAndLogs();
  }, []);

  const loadHealthAndLogs = async () => {
    try {
      const { data: subs } = await supabase
        .from('user_subscriptions')
        .select('membership_plans(tier)')
        .eq('is_active', true);

      const tiers = { silver: 0, gold: 0, platinum: 0 };
      let activeCount = 0;
      if (subs) {
        subs.forEach((sub) => {
          const tier = sub.membership_plans?.tier;
          if (tier && tier !== 'free') {
            tiers[tier] = (tiers[tier] || 0) + 1;
            activeCount++;
          }
        });
      }

      setHealth({ active_users: activeCount, tiers });

      const recentLogs = await adminApi.fetchAdminNotificationLogs(50);
      setLogs(recentLogs);
    } catch (err) {
      console.error('Failed to load health stats:', err);
    } finally {
      setIsLoading(false);
    }
  };

  const refreshLogs = async () => {
    setIsRefreshing(true);
    try {
      const recentLogs = await adminApi.fetchAdminNotificationLogs(50);
      setLogs(recentLogs);
      showToast('Logs refreshed', 'success');
    } catch (err) {
      showToast('Failed to refresh logs', 'error');
    } finally {
      setIsRefreshing(false);
    }
  };

  const handleManualPush = async () => {
    if (!pushTitle.trim() || !pushBody.trim()) {
      showToast('Please enter both a title and message body.', 'error');
      return;
    }
    if (pushType === 'user' && !pushUserId.trim()) {
      showToast('Please enter a specific User ID.', 'error');
      return;
    }
    setConfirmOpen(true);
  };

  const executeManualPush = async () => {
    setConfirmOpen(false);
    const targetVal = pushType === 'tier' ? pushTier : pushType === 'user' ? pushUserId : null;

    setIsPushing(true);
    try {
      const result = await adminApi.adminSendNotification(
        pushType, targetVal, pushUserId, pushTitle, pushBody, pushMsgType, pushScreen
      );
      showToast(`✓ ${result} notification(s) queued — delivery within ~2 min.`, 'success');
      setPushTitle('');
      setPushBody('');
      setPushUserId('');

      const recentLogs = await adminApi.fetchAdminNotificationLogs(50);
      setLogs(recentLogs);
    } catch (err) {
      showToast('Push failed: ' + (err.message || 'Unknown error'), 'error');
    } finally {
      setIsPushing(false);
    }
  };

  const getAudienceLabel = () => {
    if (pushType === 'all') return `all ${health.active_users} active users`;
    if (pushType === 'tier') return `all ${pushTier} tier members`;
    return `user ${pushUserId.slice(0, 8)}...`;
  };

  // Filter logs
  const filteredLogs = logs.filter((log) => {
    const statusMatch =
      logFilter === 'all' ||
      (logFilter === 'delivered' && (log.push_status === 'sent' || log.push_status === 'delivered')) ||
      log.push_status === logFilter;
    const searchMatch =
      !logSearch ||
      log.title?.toLowerCase().includes(logSearch.toLowerCase()) ||
      log.body?.toLowerCase().includes(logSearch.toLowerCase()) ||
      log.user_id?.includes(logSearch);
    return statusMatch && searchMatch;
  });

  // Stats from logs
  const sentCount = logs.filter((l) => l.push_status === 'sent' || l.push_status === 'delivered').length;
  const pendingCount = logs.filter((l) => l.push_status === 'pending').length;
  const failedCount = logs.filter((l) => l.push_status === 'failed').length;
  const skippedCount = logs.filter((l) => l.push_status === 'skipped').length;

  /* ── Loading Skeleton ──────────────────────────────────── */
  if (isLoading) {
    return (
      <div className="pb-12 max-w-7xl mx-auto px-4 sm:px-6 mt-6 space-y-6 animate-fade-in">
        <div className="h-10 w-72 bg-white rounded-xl animate-pulse" />
        <div className="grid grid-cols-2 md:grid-cols-4 gap-4">
          {[1, 2, 3, 4].map((i) => (
            <div key={i} className="h-20 bg-white rounded-xl animate-pulse" />
          ))}
        </div>
        <div className="h-80 bg-white rounded-2xl animate-pulse" />
        <div className="h-64 bg-white rounded-2xl animate-pulse" />
      </div>
    );
  }

  return (
    <div className="pb-12 max-w-7xl mx-auto px-4 sm:px-6 mt-6 animate-fade-in">
      {/* Toast */}
      {toast && <Toast message={toast.message} type={toast.type} onClose={() => setToast(null)} />}
      {/* Confirm Dialog */}
      <ConfirmDialog
        open={confirmOpen}
        title="Confirm Notification"
        message={`This will queue a push notification to ${getAudienceLabel()}. Notifications are delivered within ~2 minutes.`}
        onConfirm={executeManualPush}
        onCancel={() => setConfirmOpen(false)}
      />

      {/* ── Header ──────────────────────────────────────── */}
      <div className="flex flex-wrap justify-between items-end gap-4 mb-8">
        <div>
          <div className="flex items-center gap-2 mb-1.5">
            <div className="w-8 h-8 rounded-lg bg-gradient-to-br from-primary-500 to-primary-600 flex items-center justify-center shadow-sm">
              <Bell size={16} className="text-white" />
            </div>
            <p className="text-sm font-semibold text-primary-600 tracking-wide">Engagement</p>
          </div>
          <h1 className="text-2xl sm:text-3xl font-extrabold text-neutral-900 tracking-tight">
            Notification Manager
          </h1>
          <p className="text-neutral-500 mt-1 text-sm max-w-xl leading-relaxed">
            Send targeted push notifications to your users. Messages are queued and delivered in batches.
          </p>
        </div>
        <Button variant="outline" size="sm" icon={RefreshCw} onClick={refreshLogs} isLoading={isRefreshing}>
          Refresh
        </Button>
      </div>

      {/* ── Stat Cards ──────────────────────────────────── */}
      <div className="grid grid-cols-2 lg:grid-cols-5 gap-3 mb-8">
        <StatPill
          label="Active Users"
          value={health.active_users}
          color="bg-primary-100 text-primary-600"
          icon={Users}
        />
        <StatPill
          label="Silver"
          value={health.tiers?.silver || 0}
          color="bg-slate-100 text-slate-600"
          icon={Crown}
        />
        <StatPill
          label="Gold"
          value={health.tiers?.gold || 0}
          color="bg-amber-100 text-amber-600"
          icon={Crown}
        />
        <StatPill
          label="Platinum"
          value={health.tiers?.platinum || 0}
          color="bg-violet-100 text-violet-600"
          icon={Sparkles}
        />
        <StatPill
          label="Sent Today"
          value={sentCount}
          color="bg-emerald-100 text-emerald-600"
          icon={Send}
        />
      </div>

      {/* ── Compose + Preview ───────────────────────────── */}
      <Card className="overflow-hidden border border-neutral-200/70 mb-8">
        {/* Card Header */}
        <div className="px-6 py-4 border-b border-neutral-100 bg-gradient-to-r from-neutral-50/90 to-white flex items-center gap-3">
          <div className="w-9 h-9 rounded-xl bg-gradient-to-br from-primary-500 to-primary-600 flex items-center justify-center shadow-sm">
            <Megaphone size={16} className="text-white" />
          </div>
          <div>
            <h2 className="text-base font-bold text-neutral-900">Compose Notification</h2>
            <p className="text-xs text-neutral-500">
              Select audience and compose your message before sending.
            </p>
          </div>
        </div>

        <div className="p-6">
          <div className="space-y-5">
              <div className="grid grid-cols-1 md:grid-cols-2 gap-5">
                {/* Target Audience */}
                <div>
                  <label className="flex items-center gap-1.5 text-sm font-semibold text-neutral-700 mb-2">
                    <Target size={14} className="text-primary-500" />
                    Target Audience
                  </label>
                  <div className="grid grid-cols-3 gap-2">
                    {[
                      { val: 'all', label: 'All Users', icon: Users },
                      { val: 'tier', label: 'By Tier', icon: Crown },
                      { val: 'user', label: 'Specific', icon: Smartphone },
                    ].map((opt) => (
                      <button
                        key={opt.val}
                        type="button"
                        onClick={() => setPushType(opt.val)}
                        className={`flex flex-col items-center gap-1 px-3 py-3 rounded-xl border-2 text-xs font-semibold transition-all duration-200 ${
                          pushType === opt.val
                            ? 'border-primary-500 bg-primary-50 text-primary-700 shadow-sm'
                            : 'border-neutral-200 bg-white text-neutral-500 hover:border-neutral-300 hover:bg-neutral-50'
                        }`}
                      >
                        <opt.icon size={16} />
                        {opt.label}
                      </button>
                    ))}
                  </div>
                </div>

                {/* Conditional: Tier or User ID */}
                <div>
                  {pushType === 'tier' && (
                    <>
                      <label className="flex items-center gap-1.5 text-sm font-semibold text-neutral-700 mb-2">
                        <Crown size={14} className="text-amber-500" />
                        Select Tier
                      </label>
                      <div className="grid grid-cols-3 gap-2">
                        {[
                          { val: 'silver', label: 'Silver', color: 'text-slate-600 border-slate-200 bg-slate-50' },
                          { val: 'gold', label: 'Gold', color: 'text-amber-600 border-amber-200 bg-amber-50' },
                          { val: 'platinum', label: 'Platinum', color: 'text-violet-600 border-violet-200 bg-violet-50' },
                        ].map((t) => (
                          <button
                            key={t.val}
                            type="button"
                            onClick={() => setPushTier(t.val)}
                            className={`px-3 py-2.5 rounded-xl border-2 text-xs font-bold transition-all duration-200 ${
                              pushTier === t.val
                                ? `${t.color} shadow-sm border-2 ring-1 ring-offset-1 ring-current/20`
                                : 'border-neutral-200 bg-white text-neutral-400 hover:border-neutral-300'
                            }`}
                          >
                            {t.label}
                          </button>
                        ))}
                      </div>
                    </>
                  )}

                  {pushType === 'user' && (
                    <>
                      <label className="flex items-center gap-1.5 text-sm font-semibold text-neutral-700 mb-2">
                        <Smartphone size={14} className="text-blue-500" />
                        User ID
                      </label>
                      <input
                        type="text"
                        value={pushUserId}
                        onChange={(e) => setPushUserId(e.target.value)}
                        placeholder="Paste Supabase UUID..."
                        className="w-full px-4 py-2.5 border border-neutral-300 rounded-xl focus:ring-2 focus:ring-primary-200 focus:border-primary-400 outline-none font-mono text-sm bg-white transition-all"
                      />
                    </>
                  )}

                  {pushType === 'all' && (
                    <div className="flex items-center gap-3 mt-7 p-3 bg-primary-50/50 rounded-xl border border-primary-100">
                      <Radio size={16} className="text-primary-500 animate-pulse" />
                      <p className="text-xs text-primary-700 font-medium">
                        Broadcasting to <strong>{health.active_users}</strong> active premium users
                      </p>
                    </div>
                  )}
                </div>
              </div>

              {/* Options row */}
              <div className="grid grid-cols-1 md:grid-cols-2 gap-5">
                <div>
                  <label className="flex items-center gap-1.5 text-sm font-semibold text-neutral-700 mb-2">
                    <Zap size={14} className="text-amber-500" />
                    Notification Type
                  </label>
                  <select
                    value={pushMsgType}
                    onChange={(e) => setPushMsgType(e.target.value)}
                    className="w-full px-4 py-2.5 border border-neutral-300 rounded-xl focus:ring-2 focus:ring-primary-200 focus:border-primary-400 outline-none text-sm bg-white transition-all appearance-none cursor-pointer"
                  >
                    <option value="daily_engagement">📢 Promotional / Announcement</option>
                    <option value="system">⚙️ System Alert</option>
                  </select>
                </div>

                <div>
                  <label className="flex items-center gap-1.5 text-sm font-semibold text-neutral-700 mb-2">
                    <ArrowRight size={14} className="text-blue-500" />
                    Deep Link Screen
                  </label>
                  <select
                    value={pushScreen}
                    onChange={(e) => setPushScreen(e.target.value)}
                    className="w-full px-4 py-2.5 border border-neutral-300 rounded-xl focus:ring-2 focus:ring-primary-200 focus:border-primary-400 outline-none text-sm bg-white transition-all appearance-none cursor-pointer"
                  >
                    <option value="">None (Opens App Home)</option>
                    <option value="Premium">💎 Premium Plans</option>
                    <option value="MatchesTab">💕 Matches Tab</option>
                    <option value="InterestTab">💌 Interests Tab</option>
                    <option value="ChatTab">💬 Chat Inbox</option>
                  </select>
                </div>
              </div>

              {/* Title + Body */}
              <div className="space-y-4 pt-1">
                <div>
                  <label className="flex items-center gap-1.5 text-sm font-semibold text-neutral-700 mb-2">
                    <MessageSquare size={14} className="text-neutral-500" />
                    Title
                  </label>
                  <input
                    type="text"
                    value={pushTitle}
                    onChange={(e) => setPushTitle(e.target.value)}
                    placeholder="E.g., Weekend Special Offer! 🎉"
                    maxLength={100}
                    className="w-full px-4 py-2.5 border border-neutral-300 rounded-xl focus:ring-2 focus:ring-primary-200 focus:border-primary-400 outline-none text-sm bg-white transition-all"
                  />
                  <p className="text-right text-[10px] text-neutral-400 mt-1">{pushTitle.length}/100</p>
                </div>

                <div>
                  <label className="flex items-center gap-1.5 text-sm font-semibold text-neutral-700 mb-2">
                    <MessageSquare size={14} className="text-neutral-500" />
                    Message Body
                  </label>
                  <textarea
                    value={pushBody}
                    onChange={(e) => setPushBody(e.target.value)}
                    placeholder="Write a compelling message that engages your users..."
                    rows={3}
                    maxLength={500}
                    className="w-full px-4 py-2.5 border border-neutral-300 rounded-xl focus:ring-2 focus:ring-primary-200 focus:border-primary-400 outline-none resize-none text-sm bg-white transition-all"
                  />
                  <p className="text-right text-[10px] text-neutral-400 mt-1">{pushBody.length}/500</p>
                </div>
              </div>

              {/* Send Button */}
              <div className="pt-2">
                <Button
                  onClick={handleManualPush}
                  isLoading={isPushing}
                  className="w-full justify-center"
                  size="lg"
                  icon={Send}
                >
                  {isPushing ? 'Sending...' : 'Queue Notification'}
                </Button>
                <div className="flex items-center justify-center gap-2 mt-3">
                  <Clock size={12} className="text-neutral-400" />
                  <p className="text-[11px] text-neutral-400">
                    Queued notifications are delivered by the background system within ~2 minutes.
                  </p>
                </div>
            </div>
          </div>
        </div>
      </Card>

      {/* ── Notification Log ────────────────────────────── */}
      <Card className="overflow-hidden border border-neutral-200/70">
        {/* Log Header */}
        <div className="px-6 py-4 border-b border-neutral-100 bg-gradient-to-r from-neutral-50/90 to-white">
          <div className="flex flex-col sm:flex-row sm:items-center sm:justify-between gap-4">
            <div className="flex items-center gap-3">
              <div className="w-9 h-9 rounded-xl bg-gradient-to-br from-neutral-700 to-neutral-800 flex items-center justify-center shadow-sm">
                <Bell size={16} className="text-white" />
              </div>
              <div>
                <h2 className="text-base font-bold text-neutral-900">Recent Notifications</h2>
                <p className="text-xs text-neutral-500">{logs.length} total notifications</p>
              </div>
            </div>

            {/* Search */}
            <div className="relative">
              <Search size={14} className="absolute left-3 top-1/2 -translate-y-1/2 text-neutral-400" />
              <input
                type="text"
                value={logSearch}
                onChange={(e) => setLogSearch(e.target.value)}
                placeholder="Search notifications..."
                className="pl-9 pr-4 py-2 text-xs border border-neutral-200 rounded-lg bg-white focus:ring-2 focus:ring-primary-200 focus:border-primary-400 outline-none w-64 transition-all"
              />
            </div>
          </div>

          {/* Filter Tabs */}
          <div className="flex gap-1.5 mt-4">
            {[
              { key: 'all', label: 'All', count: logs.length },
              { key: 'delivered', label: 'Delivered', count: sentCount },
              { key: 'pending', label: 'Pending', count: pendingCount },
              { key: 'failed', label: 'Failed', count: failedCount },
              { key: 'skipped', label: 'Skipped', count: skippedCount },
            ].map((tab) => (
              <button
                key={tab.key}
                onClick={() => setLogFilter(tab.key)}
                className={`px-3 py-1.5 text-xs font-semibold rounded-lg transition-all duration-200 ${
                  logFilter === tab.key
                    ? 'bg-neutral-900 text-white shadow-sm'
                    : 'text-neutral-500 hover:bg-neutral-100'
                }`}
              >
                {tab.label}
                {tab.count > 0 && (
                  <span className={`ml-1.5 px-1.5 py-0.5 rounded text-[10px] ${
                    logFilter === tab.key ? 'bg-white/20' : 'bg-neutral-100'
                  }`}>
                    {tab.count}
                  </span>
                )}
              </button>
            ))}
          </div>
        </div>

        {/* Table */}
        <div className="overflow-x-auto">
          <table className="w-full text-sm text-left">
            <thead className="bg-neutral-50/60 text-[11px] text-neutral-500 font-semibold uppercase tracking-wider">
              <tr>
                <th className="px-6 py-3.5">Sent</th>
                <th className="px-6 py-3.5">Message</th>
                <th className="px-6 py-3.5">Recipient</th>
                <th className="px-6 py-3.5">Status</th>
              </tr>
            </thead>
            <tbody className="divide-y divide-neutral-100/80">
              {filteredLogs.length === 0 ? (
                <tr>
                  <td colSpan="4" className="px-6 py-16 text-center">
                    <div className="flex flex-col items-center">
                      <div className="w-16 h-16 rounded-2xl bg-neutral-100 flex items-center justify-center mb-4">
                        <Bell size={28} className="text-neutral-300" />
                      </div>
                      <p className="text-sm font-semibold text-neutral-500 mb-1">
                        {logFilter !== 'all' ? `No ${logFilter} notifications` : 'No notifications sent yet'}
                      </p>
                      <p className="text-xs text-neutral-400">
                        {logFilter !== 'all'
                          ? 'Try adjusting the filter above.'
                          : 'Compose your first notification above to get started.'}
                      </p>
                    </div>
                  </td>
                </tr>
              ) : (
                filteredLogs.map((log, idx) => (
                  <tr
                    key={log.id}
                    className="hover:bg-neutral-50/80 transition-colors duration-150"
                    style={{ animationDelay: `${idx * 30}ms` }}
                  >
                    <td className="px-6 py-4 whitespace-nowrap">
                      <div>
                        <p className="text-xs font-medium text-neutral-700">
                          {format(new Date(log.created_at), 'MMM d, yyyy')}
                        </p>
                        <p className="text-[11px] text-neutral-400">
                          {format(new Date(log.created_at), 'h:mm a')}
                        </p>
                      </div>
                    </td>
                    <td className="px-6 py-4 min-w-[220px]">
                      <p className="font-semibold text-neutral-900 text-sm">{log.title}</p>
                      <p className="text-xs text-neutral-500 line-clamp-1 mt-0.5">{log.body}</p>
                      {log.data?.screen && (
                        <span className="inline-flex items-center gap-1 mt-1.5 text-[10px] bg-blue-50 text-blue-700 px-2 py-0.5 rounded-md font-semibold border border-blue-100">
                          <ArrowRight size={10} />
                          {log.data.screen}
                        </span>
                      )}
                    </td>
                    <td className="px-6 py-4 whitespace-nowrap">
                      <span className="text-xs font-mono bg-neutral-100 px-2.5 py-1 rounded-lg text-neutral-600 border border-neutral-200/60">
                        {log.user_id?.slice(0, 8)}…
                      </span>
                    </td>
                    <td className="px-6 py-4 whitespace-nowrap">
                      <StatusBadge status={log.push_status} error={log.push_error} />
                    </td>
                  </tr>
                ))
              )}
            </tbody>
          </table>
        </div>

        {/* Footer */}
        {filteredLogs.length > 0 && (
          <div className="px-6 py-3 border-t border-neutral-100 bg-neutral-50/50 flex items-center justify-between">
            <p className="text-xs text-neutral-400">
              Showing {filteredLogs.length} of {logs.length} notifications
            </p>
            <button
              onClick={refreshLogs}
              className="text-xs text-primary-600 hover:text-primary-700 font-semibold flex items-center gap-1 transition-colors"
            >
              <RefreshCw size={12} className={isRefreshing ? 'animate-spin' : ''} />
              Refresh
            </button>
          </div>
        )}
      </Card>
    </div>
  );
};

export default NotificationManager;
