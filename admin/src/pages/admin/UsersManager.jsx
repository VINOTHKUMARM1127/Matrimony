import { useEffect, useState, useCallback } from 'react';
import * as adminApi from '../../api/adminApi';
import { getR2PublicUrl } from '../../api/imageApi';
import Card from '../../components/common/Card';
import Button from '../../components/common/Button';
import { Search, ChevronRight, ChevronLeft, UserMinus, Trash2, Users as UsersIcon, Crown, X, SlidersHorizontal, Clock, AlertTriangle, ShieldAlert } from 'lucide-react';
import UserModal from './UserModal';

const PER_PAGE = 20;

const UsersManager = () => {
  // ── Tab state ────────────────────────────────────────────────
  const [activeTab, setActiveTab] = useState('members'); // 'members' | 'pending'

  // ── Members tab state ────────────────────────────────────────
  const [users, setUsers] = useState([]);
  const [totalCount, setTotalCount] = useState(0);
  const [page, setPage] = useState(1);
  const [searchTerm, setSearchTerm] = useState('');
  const [debouncedSearch, setDebouncedSearch] = useState('');
  const [filterGender, setFilterGender] = useState('');
  const [filterTier, setFilterTier] = useState('');
  const [filterStatus, setFilterStatus] = useState('');
  const [isLoading, setIsLoading] = useState(true);
  const [actionLoading, setActionLoading] = useState(false);
  const [selectedUser, setSelectedUser] = useState(null);
  const [selectedUserIds, setSelectedUserIds] = useState(new Set());
  const [deleteProgress, setDeleteProgress] = useState(null);

  // ── Pending tab state ────────────────────────────────────────
  const [pendingUsers, setPendingUsers] = useState([]);
  const [pendingTotal, setPendingTotal] = useState(0);
  const [pendingPage, setPendingPage] = useState(1);
  const [pendingSearch, setPendingSearch] = useState('');
  const [debouncedPendingSearch, setDebouncedPendingSearch] = useState('');
  const [pendingLoading, setPendingLoading] = useState(false);
  const [pendingSelectedIds, setPendingSelectedIds] = useState(new Set());
  const [pendingDeleteProgress, setPendingDeleteProgress] = useState(null);
  const [cleanupLoading, setCleanupLoading] = useState(false);

  // Debounce search inputs (300ms)
  useEffect(() => {
    const timer = setTimeout(() => setDebouncedSearch(searchTerm), 300);
    return () => clearTimeout(timer);
  }, [searchTerm]);

  useEffect(() => {
    const timer = setTimeout(() => setDebouncedPendingSearch(pendingSearch), 300);
    return () => clearTimeout(timer);
  }, [pendingSearch]);

  // ── Members data loading ─────────────────────────────────────
  const loadUsers = useCallback(async () => {
    setIsLoading(true);
    try {
      const { users: data, total } = await adminApi.fetchUsersPage({
        page,
        perPage: PER_PAGE,
        search: debouncedSearch,
        gender: filterGender,
        tier: filterTier,
        status: filterStatus
      });
      setUsers(data);
      setTotalCount(total);
    } catch (err) {
      console.error('Error loading users:', err);
      alert('Failed to load users');
    } finally {
      setIsLoading(false);
    }
  }, [page, debouncedSearch, filterGender, filterTier, filterStatus]);

  useEffect(() => {
    if (activeTab === 'members') loadUsers();
  }, [loadUsers, activeTab]);

  // Reset to page 1 when search/filters change
  useEffect(() => {
    setPage(1);
    setSelectedUserIds(new Set());
  }, [debouncedSearch, filterGender, filterTier, filterStatus]);

  // ── Pending data loading ─────────────────────────────────────
  const loadPendingUsers = useCallback(async () => {
    setPendingLoading(true);
    try {
      const { users: data, total } = await adminApi.fetchPendingUsers({
        page: pendingPage,
        perPage: PER_PAGE,
        search: debouncedPendingSearch,
      });
      setPendingUsers(data);
      setPendingTotal(total);
    } catch (err) {
      console.error('Error loading pending users:', err);
      alert('Failed to load pending users');
    } finally {
      setPendingLoading(false);
    }
  }, [pendingPage, debouncedPendingSearch]);

  useEffect(() => {
    if (activeTab === 'pending') loadPendingUsers();
  }, [loadPendingUsers, activeTab]);

  useEffect(() => {
    setPendingPage(1);
    setPendingSelectedIds(new Set());
  }, [debouncedPendingSearch]);

  const totalPages = Math.ceil(totalCount / PER_PAGE);
  const pendingTotalPages = Math.ceil(pendingTotal / PER_PAGE);

  // ── Members handlers ─────────────────────────────────────────
  const handleUpdatePlan = async (userId, planType) => {
    if (!window.confirm(`Update plan to ${planType} for this user?`)) return;
    setActionLoading(true);
    try {
      await adminApi.updateUserPlan(userId, planType);
      alert('Plan updated successfully!');
      setUsers(prev => prev.map(u => {
        if (u.id !== userId) return u;
        return { ...u, tier: planType };
      }));
    } catch (err) {
      console.error(err);
      alert(err.message || 'Failed to update plan');
    } finally {
      setActionLoading(false);
    }
  };

  const handleSelectAll = (e) => {
    if (e.target.checked) {
      setSelectedUserIds(new Set(users.map((u) => u.id)));
    } else {
      setSelectedUserIds(new Set());
    }
  };

  const handleSelectUser = (id) => {
    const newSet = new Set(selectedUserIds);
    newSet.has(id) ? newSet.delete(id) : newSet.add(id);
    setSelectedUserIds(newSet);
  };

  const handleBulkDelete = async () => {
    if (selectedUserIds.size === 0) return;
    if (!window.confirm(`Are you sure you want to delete ${selectedUserIds.size} user(s)? This cannot be undone.`)) return;

    setActionLoading(true);
    setDeleteProgress({ current: 0, total: selectedUserIds.size });
    try {
      let deletedCount = 0;
      const userIdsArray = Array.from(selectedUserIds);
      const batchSize = 5;
      for (let i = 0; i < userIdsArray.length; i += batchSize) {
        const batch = userIdsArray.slice(i, i + batchSize);
        await Promise.all(batch.map(id => adminApi.deleteUser(id).catch(e => console.error(e))));
        deletedCount += batch.length;
        setDeleteProgress({ current: deletedCount, total: userIdsArray.length });
      }
      alert(`Successfully deleted ${deletedCount} user(s).`);
      setSelectedUserIds(new Set());
      loadUsers();
    } catch (err) {
      console.error(err);
      alert(err.message || 'Failed to delete some users');
    } finally {
      setActionLoading(false);
      setDeleteProgress(null);
    }
  };

  // ── Pending handlers ─────────────────────────────────────────
  const handlePendingSelectAll = (e) => {
    if (e.target.checked) {
      // Only select abandoned users (not in-progress ones)
      const abandonedIds = pendingUsers
        .filter(u => u.status === 'abandoned')
        .map(u => u.id);
      setPendingSelectedIds(new Set(abandonedIds));
    } else {
      setPendingSelectedIds(new Set());
    }
  };

  const handlePendingSelectUser = (id) => {
    const newSet = new Set(pendingSelectedIds);
    newSet.has(id) ? newSet.delete(id) : newSet.add(id);
    setPendingSelectedIds(newSet);
  };

  const handleDeletePendingUser = async (userId) => {
    if (!window.confirm('Delete this pending signup? This cannot be undone.')) return;
    setActionLoading(true);
    try {
      await adminApi.deleteUser(userId);
      setPendingUsers(prev => prev.filter(u => u.id !== userId));
      setPendingTotal(prev => prev - 1);
    } catch (err) {
      console.error(err);
      alert(err.message || 'Failed to delete user');
    } finally {
      setActionLoading(false);
    }
  };

  const handleBulkDeletePending = async () => {
    if (pendingSelectedIds.size === 0) return;
    if (!window.confirm(`Delete ${pendingSelectedIds.size} abandoned signup(s)? This cannot be undone.`)) return;

    setActionLoading(true);
    setPendingDeleteProgress({ current: 0, total: pendingSelectedIds.size });
    try {
      let deletedCount = 0;
      const idsArray = Array.from(pendingSelectedIds);
      const batchSize = 5;
      for (let i = 0; i < idsArray.length; i += batchSize) {
        const batch = idsArray.slice(i, i + batchSize);
        await Promise.all(batch.map(id => adminApi.deleteUser(id).catch(e => console.error(e))));
        deletedCount += batch.length;
        setPendingDeleteProgress({ current: deletedCount, total: idsArray.length });
      }
      alert(`Successfully deleted ${deletedCount} abandoned signup(s).`);
      setPendingSelectedIds(new Set());
      loadPendingUsers();
    } catch (err) {
      console.error(err);
      alert(err.message || 'Failed to delete some users');
    } finally {
      setActionLoading(false);
      setPendingDeleteProgress(null);
    }
  };

  const handleCleanUpAbandoned = async () => {
    if (!window.confirm(
      'Delete ALL abandoned signups (older than 15 minutes, no profile)?\n\n' +
      'This only removes ghost auth accounts that block re-registration.\n' +
      'It will NOT touch any verified users with profiles.\n\n' +
      'This cannot be undone.'
    )) return;
    setCleanupLoading(true);
    try {
      const deletedCount = await adminApi.deleteAbandonedUsers();
      alert(`Successfully deleted ${deletedCount} abandoned signup(s).`);
      loadPendingUsers();
    } catch (err) {
      console.error(err);
      alert(err.message || 'Failed to clean up abandoned signups');
    } finally {
      setCleanupLoading(false);
    }
  };

  // ── Shared helpers ───────────────────────────────────────────
  const hasFilters = searchTerm || filterGender || filterTier || filterStatus;
  const clearFilters = () => {
    setSearchTerm('');
    setFilterGender('');
    setFilterTier('');
    setFilterStatus('');
  };

  const handleUserModalRefresh = (action, data) => {
    if (action === 'ignore') return;
    
    if (action === 'delete') {
      setUsers(prev => prev.filter(u => u.id !== selectedUser.id));
      setTotalCount(prev => prev - 1);
      return;
    }

    setUsers(prev => prev.map(u => {
      if (u.id !== selectedUser.id) return u;
      
      if (action === 'updatePlan') {
        return { ...u, tier: data };
      }
      if (action === 'makeFree') {
        return { ...u, tier: 'free' };
      }
      if (action === 'update') {
        return { ...u, ...data };
      }
      
      return u;
    }));
  };

  // ── Render helpers ──────────────────────────────────────────────────────────

  const tierChip = (u) => {
    const tier = u.tier || 'free';
    if (tier !== 'free') {
      const map = {
        silver: 'bg-slate-100 text-slate-700 ring-slate-200',
        gold: 'bg-gold-100 text-gold-700 ring-gold-200',
        platinum: 'bg-violet-100 text-violet-700 ring-violet-200',
      };
      const cls = map[tier] || 'bg-gold-100 text-gold-700 ring-gold-200';
      return (
        <span className={`inline-flex items-center gap-1 px-2.5 py-1 rounded-full text-xs font-semibold capitalize ring-1 ${cls}`}>
          <Crown size={12} /> {tier}
        </span>
      );
    }
    return (
      <span className="inline-flex items-center px-2.5 py-1 rounded-full text-xs font-semibold bg-neutral-100 text-neutral-500 ring-1 ring-neutral-200 capitalize">
        Free
      </span>
    );
  };

  const avatarFor = (u) => {
    const r2Key = u.primary_photo_r2_key;
    if (r2Key) {
      const url = getR2PublicUrl(r2Key);
      if (url) return <img src={url} alt="" className="w-full h-full object-cover" />;
    }
    return (
      <span className="text-sm font-bold text-primary-600">
        {(u.full_name || u.email || '?').charAt(0).toUpperCase()}
      </span>
    );
  };

  const formatAge = (minutes) => {
    if (minutes < 1) return 'Just now';
    if (minutes < 60) return `${Math.round(minutes)}m ago`;
    const hours = minutes / 60;
    if (hours < 24) return `${Math.round(hours)}h ago`;
    const days = hours / 24;
    return `${Math.round(days)}d ago`;
  };

  const statusBadge = (status, ageMinutes) => {
    if (status === 'in_progress') {
      return (
        <span className="inline-flex items-center gap-1.5 px-2.5 py-1 rounded-full text-xs font-semibold bg-blue-50 text-blue-700 ring-1 ring-blue-200">
          <Clock size={12} /> In Progress
        </span>
      );
    }
    const ageHours = ageMinutes / 60;
    if (ageHours > 24) {
      return (
        <span className="inline-flex items-center gap-1.5 px-2.5 py-1 rounded-full text-xs font-semibold bg-red-50 text-red-700 ring-1 ring-red-200">
          <AlertTriangle size={12} /> Stuck ({formatAge(ageMinutes)})
        </span>
      );
    }
    return (
      <span className="inline-flex items-center gap-1.5 px-2.5 py-1 rounded-full text-xs font-semibold bg-amber-50 text-amber-700 ring-1 ring-amber-200">
        <AlertTriangle size={12} /> Abandoned ({formatAge(ageMinutes)})
      </span>
    );
  };

  const selectClass =
    'px-3 py-2.5 border border-neutral-200 rounded-xl text-sm bg-white text-neutral-700 focus:outline-none focus:border-primary-400 focus:ring-4 focus:ring-primary-100 transition-all cursor-pointer';

  const tabClass = (tab) =>
    `px-5 py-2.5 text-sm font-semibold rounded-xl transition-all cursor-pointer ${
      activeTab === tab
        ? 'bg-primary-600 text-white shadow-sm'
        : 'bg-neutral-100 text-neutral-600 hover:bg-neutral-200'
    }`;

  const abandonedCount = pendingUsers.filter(u => u.status === 'abandoned').length;

  return (
    <div className="flex flex-col">

      {/* Header */}
      <div className="flex flex-wrap items-end justify-between gap-3 mb-6">
        <div>
          <h1 className="text-2xl sm:text-3xl font-extrabold text-neutral-900 tracking-tight flex items-center gap-3">
            Manage Users
          </h1>
          <p className="text-neutral-500 mt-1 text-sm">View, edit, and manage every member account.</p>
        </div>
      </div>

      {/* Tabs */}
      <div className="flex items-center gap-2 mb-5">
        <button className={tabClass('members')} onClick={() => setActiveTab('members')}>
          <span className="flex items-center gap-2">
            <UsersIcon size={16} />
            Members
            {!isLoading && activeTab === 'members' && (
              <span className="text-xs bg-white/20 px-2 py-0.5 rounded-full">
                {totalCount.toLocaleString()}
              </span>
            )}
          </span>
        </button>
        <button className={tabClass('pending')} onClick={() => setActiveTab('pending')}>
          <span className="flex items-center gap-2">
            <ShieldAlert size={16} />
            Pending Verification
            {!pendingLoading && pendingTotal > 0 && (
              <span className={`text-xs px-2 py-0.5 rounded-full ${activeTab === 'pending' ? 'bg-white/20' : 'bg-red-100 text-red-700'}`}>
                {pendingTotal}
              </span>
            )}
          </span>
        </button>
      </div>

      {/* ═══════════════ MEMBERS TAB ═══════════════ */}
      {activeTab === 'members' && (
        <>
          {/* Filter bar */}
          <Card className="p-4 mb-5">
            <div className="flex flex-wrap gap-3 items-center">
              <div className="relative flex-1 min-w-[220px]">
                <Search className="absolute left-3.5 top-1/2 -translate-y-1/2 text-neutral-400" size={18} />
                <input
                  type="text"
                  placeholder="Search by name, email, or phone…"
                  value={searchTerm}
                  onChange={(e) => setSearchTerm(e.target.value)}
                  className="w-full pl-11 pr-4 py-2.5 rounded-xl border border-neutral-200 bg-neutral-50 focus:bg-white focus:outline-none focus:border-primary-400 focus:ring-4 focus:ring-primary-100 transition-all text-sm"
                />
              </div>

              <div className="hidden sm:flex items-center gap-1.5 text-neutral-400">
                <SlidersHorizontal size={16} />
              </div>

              <select value={filterGender} onChange={(e) => setFilterGender(e.target.value)} className={selectClass}>
                <option value="">All Genders</option>
                <option value="male">Male</option>
                <option value="female">Female</option>
              </select>

              <select value={filterTier} onChange={(e) => setFilterTier(e.target.value)} className={selectClass}>
                <option value="">All Plans</option>
                <option value="free">Free</option>
                <option value="silver">Silver</option>
                <option value="gold">Gold</option>
                <option value="platinum">Platinum</option>
              </select>

              <select value={filterStatus} onChange={(e) => setFilterStatus(e.target.value)} className={selectClass}>
                <option value="">All Profiles</option>
                <option value="complete">Completed</option>
                <option value="incomplete">Incomplete</option>
              </select>

              {hasFilters && (
                <button
                  onClick={clearFilters}
                  className="inline-flex items-center gap-1 text-sm text-neutral-500 hover:text-primary-600 font-medium px-2 transition-colors"
                >
                  <X size={15} /> Clear
                </button>
              )}
            </div>
          </Card>

          {/* Bulk action bar */}
          {selectedUserIds.size > 0 && (
            <div className="flex items-center justify-between gap-4 bg-primary-50 border border-primary-100 rounded-2xl px-5 py-3 mb-4 animate-fade-in">
              <p className="text-sm font-semibold text-primary-800">
                {selectedUserIds.size} user{selectedUserIds.size > 1 ? 's' : ''} selected
              </p>
              <div className="flex items-center gap-3">
                <button onClick={() => setSelectedUserIds(new Set())} className="text-sm font-medium text-neutral-500 hover:text-neutral-700">
                  Deselect all
                </button>
                <Button variant="danger" size="sm" onClick={handleBulkDelete} isLoading={!!deleteProgress} icon={Trash2}>
                  {deleteProgress ? `Deleting ${deleteProgress.current}/${deleteProgress.total}` : `Delete Selected`}
                </Button>
              </div>
            </div>
          )}

          {/* Table */}
          <Card className="overflow-hidden">
            {isLoading ? (
              <div className="divide-y divide-neutral-100">
                {[...Array(6)].map((_, i) => (
                  <div key={i} className="flex items-center gap-4 px-6 py-4">
                    <div className="w-11 h-11 rounded-full bg-neutral-100 animate-pulse" />
                    <div className="flex-1 space-y-2">
                      <div className="h-3.5 w-40 bg-neutral-100 rounded animate-pulse" />
                      <div className="h-3 w-28 bg-neutral-100 rounded animate-pulse" />
                    </div>
                    <div className="h-6 w-16 bg-neutral-100 rounded-full animate-pulse" />
                  </div>
                ))}
              </div>
            ) : (
              <div className="overflow-x-auto">
                <table className="w-full text-left border-collapse">
                  <thead>
                    <tr className="bg-neutral-50/80 border-b border-neutral-200 text-xs font-semibold text-neutral-500 uppercase tracking-wide">
                      <th className="px-6 py-3.5 w-12">
                        <input
                          type="checkbox"
                          checked={users.length > 0 && selectedUserIds.size === users.length}
                          onChange={handleSelectAll}
                          className="rounded border-neutral-300 text-primary-600 focus:ring-primary-500 cursor-pointer w-4 h-4"
                        />
                      </th>
                      <th className="px-6 py-3.5">Member</th>
                      <th className="px-6 py-3.5">Gender</th>
                      <th className="px-6 py-3.5">Plan</th>
                      <th className="px-6 py-3.5">Profile</th>
                      <th className="px-6 py-3.5 text-right">Actions</th>
                    </tr>
                  </thead>
                  <tbody className="divide-y divide-neutral-100">
                    {users.map((u) => (
                      <tr
                        key={u.id}
                        className={`group transition-colors cursor-pointer ${selectedUserIds.has(u.id) ? 'bg-primary-50/60' : 'hover:bg-neutral-50'}`}
                        onClick={() => setSelectedUser(u)}
                      >
                        <td className="px-6 py-4 w-12" onClick={(e) => e.stopPropagation()}>
                          <input
                            type="checkbox"
                            checked={selectedUserIds.has(u.id)}
                            onChange={() => handleSelectUser(u.id)}
                            className="rounded border-neutral-300 text-primary-600 focus:ring-primary-500 cursor-pointer w-4 h-4"
                          />
                        </td>
                        <td className="px-6 py-4">
                          <div className="flex items-center gap-3">
                            <div className="w-11 h-11 rounded-full overflow-hidden bg-primary-50 ring-1 ring-neutral-200 flex items-center justify-center shrink-0">
                              {avatarFor(u)}
                            </div>
                            <div className="min-w-0">
                              <p className="font-semibold text-neutral-900 group-hover:text-primary-600 transition-colors truncate">
                                {u.full_name || 'No Name'}
                              </p>
                              <p className="text-xs text-neutral-500 truncate">{u.email || '—'}</p>
                              {u.phone && <p className="text-xs text-neutral-400">{u.phone}</p>}
                            </div>
                          </div>
                        </td>
                        <td className="px-6 py-4 capitalize text-sm text-neutral-600">{u.gender || '—'}</td>
                        <td className="px-6 py-4">{tierChip(u)}</td>
                        <td className="px-6 py-4">
                          {u.profile_completion_percent > 50 ? (
                            <span className="inline-flex items-center gap-1.5 text-xs font-medium text-success-700">
                              <span className="w-1.5 h-1.5 rounded-full bg-success-500" /> {u.profile_completion_percent}%
                            </span>
                          ) : (
                            <span className="inline-flex items-center gap-1.5 text-xs font-medium text-neutral-400">
                              <span className="w-1.5 h-1.5 rounded-full bg-neutral-300" /> {u.profile_completion_percent || 0}%
                            </span>
                          )}
                        </td>
                        <td className="px-6 py-4">
                          <div className="flex items-center justify-end gap-2">
                            <select
                              className="text-xs border border-neutral-200 rounded-lg px-2 py-1.5 bg-white text-neutral-600 focus:outline-none focus:border-primary-400 cursor-pointer opacity-0 group-hover:opacity-100 transition-opacity"
                              onClick={(e) => e.stopPropagation()}
                              onChange={(e) => {
                                if (e.target.value) handleUpdatePlan(u.id, e.target.value);
                                e.target.value = '';
                              }}
                              disabled={actionLoading}
                              defaultValue=""
                            >
                              <option value="" disabled>
                                Change Plan…
                              </option>
                              <option value="free">Free / Demote</option>
                              <option value="silver">Silver</option>
                              <option value="gold">Gold</option>
                              <option value="platinum">Platinum</option>
                            </select>
                            <ChevronRight className="text-neutral-300 group-hover:text-primary-500 transition-colors" size={20} />
                          </div>
                        </td>
                      </tr>
                    ))}
                    {users.length === 0 && (
                      <tr>
                        <td colSpan="6" className="px-6 py-16 text-center">
                          <div className="flex flex-col items-center gap-3 text-neutral-400">
                            <div className="w-14 h-14 rounded-2xl bg-neutral-100 flex items-center justify-center">
                              <UsersIcon size={26} />
                            </div>
                            <p className="font-medium text-neutral-500">No users found</p>
                            {hasFilters && (
                              <button onClick={clearFilters} className="text-sm text-primary-600 font-medium hover:underline">
                                Clear filters
                              </button>
                            )}
                          </div>
                        </td>
                      </tr>
                    )}
                  </tbody>
                </table>
              </div>
            )}
            
            {/* Pagination controls */}
            {!isLoading && totalPages > 1 && (
              <div className="flex items-center justify-between px-6 py-3.5 border-t border-neutral-100 bg-neutral-50/50">
                <p className="text-sm text-neutral-500">
                  Showing {((page - 1) * PER_PAGE) + 1}–{Math.min(page * PER_PAGE, totalCount)} of {totalCount.toLocaleString()}
                </p>
                <div className="flex items-center gap-2">
                  <Button
                    variant="outline"
                    size="sm"
                    onClick={() => setPage(p => Math.max(1, p - 1))}
                    disabled={page === 1}
                    icon={ChevronLeft}
                  >
                    Prev
                  </Button>
                  <span className="text-sm font-medium text-neutral-700 px-2">
                    {page} / {totalPages}
                  </span>
                  <Button
                    variant="outline"
                    size="sm"
                    onClick={() => setPage(p => Math.min(totalPages, p + 1))}
                    disabled={page === totalPages}
                    icon={ChevronRight}
                  >
                    Next
                  </Button>
                </div>
              </div>
            )}
          </Card>
        </>
      )}

      {/* ═══════════════ PENDING VERIFICATION TAB ═══════════════ */}
      {activeTab === 'pending' && (
        <>
          {/* Info banner */}
          <div className="flex items-start gap-3 bg-amber-50 border border-amber-200 rounded-2xl px-5 py-4 mb-5">
            <AlertTriangle size={20} className="text-amber-600 shrink-0 mt-0.5" />
            <div>
              <p className="text-sm font-semibold text-amber-900">
                These are auth accounts that never completed profile setup.
              </p>
              <p className="text-xs text-amber-700 mt-1">
                They exist in the auth system but have no profile row. They block the email from being re-used.
                Accounts less than 15 minutes old may be actively signing up — avoid deleting those.
              </p>
            </div>
          </div>

          {/* Search + cleanup button */}
          <Card className="p-4 mb-5">
            <div className="flex flex-wrap gap-3 items-center">
              <div className="relative flex-1 min-w-[220px]">
                <Search className="absolute left-3.5 top-1/2 -translate-y-1/2 text-neutral-400" size={18} />
                <input
                  type="text"
                  placeholder="Search by email or phone…"
                  value={pendingSearch}
                  onChange={(e) => setPendingSearch(e.target.value)}
                  className="w-full pl-11 pr-4 py-2.5 rounded-xl border border-neutral-200 bg-neutral-50 focus:bg-white focus:outline-none focus:border-primary-400 focus:ring-4 focus:ring-primary-100 transition-all text-sm"
                />
              </div>
              <Button
                variant="outline"
                onClick={handleCleanUpAbandoned}
                isLoading={cleanupLoading}
                icon={UserMinus}
                className="text-error-600 hover:bg-error-50 border-error-200 hover:border-error-300"
              >
                Clean Up Abandoned Signups
              </Button>
            </div>
          </Card>

          {/* Bulk action bar for pending */}
          {pendingSelectedIds.size > 0 && (
            <div className="flex items-center justify-between gap-4 bg-red-50 border border-red-100 rounded-2xl px-5 py-3 mb-4 animate-fade-in">
              <p className="text-sm font-semibold text-red-800">
                {pendingSelectedIds.size} abandoned signup{pendingSelectedIds.size > 1 ? 's' : ''} selected
              </p>
              <div className="flex items-center gap-3">
                <button onClick={() => setPendingSelectedIds(new Set())} className="text-sm font-medium text-neutral-500 hover:text-neutral-700">
                  Deselect all
                </button>
                <Button variant="danger" size="sm" onClick={handleBulkDeletePending} isLoading={!!pendingDeleteProgress} icon={Trash2}>
                  {pendingDeleteProgress ? `Deleting ${pendingDeleteProgress.current}/${pendingDeleteProgress.total}` : `Delete Selected`}
                </Button>
              </div>
            </div>
          )}

          {/* Pending users table */}
          <Card className="overflow-hidden">
            {pendingLoading ? (
              <div className="divide-y divide-neutral-100">
                {[...Array(4)].map((_, i) => (
                  <div key={i} className="flex items-center gap-4 px-6 py-4">
                    <div className="w-11 h-11 rounded-full bg-neutral-100 animate-pulse" />
                    <div className="flex-1 space-y-2">
                      <div className="h-3.5 w-52 bg-neutral-100 rounded animate-pulse" />
                      <div className="h-3 w-28 bg-neutral-100 rounded animate-pulse" />
                    </div>
                    <div className="h-6 w-24 bg-neutral-100 rounded-full animate-pulse" />
                  </div>
                ))}
              </div>
            ) : (
              <div className="overflow-x-auto">
                <table className="w-full text-left border-collapse">
                  <thead>
                    <tr className="bg-neutral-50/80 border-b border-neutral-200 text-xs font-semibold text-neutral-500 uppercase tracking-wide">
                      <th className="px-6 py-3.5 w-12">
                        <input
                          type="checkbox"
                          checked={abandonedCount > 0 && pendingSelectedIds.size === abandonedCount}
                          onChange={handlePendingSelectAll}
                          className="rounded border-neutral-300 text-primary-600 focus:ring-primary-500 cursor-pointer w-4 h-4"
                          title="Select all abandoned signups"
                        />
                      </th>
                      <th className="px-6 py-3.5">Email / Phone</th>
                      <th className="px-6 py-3.5">Created</th>
                      <th className="px-6 py-3.5">OTP Verified</th>
                      <th className="px-6 py-3.5">Status</th>
                      <th className="px-6 py-3.5 text-right">Actions</th>
                    </tr>
                  </thead>
                  <tbody className="divide-y divide-neutral-100">
                    {pendingUsers.map((u) => (
                      <tr
                        key={u.id}
                        className={`group transition-colors ${
                          pendingSelectedIds.has(u.id) ? 'bg-red-50/60' : 'hover:bg-neutral-50'
                        } ${u.status === 'in_progress' ? 'opacity-60' : ''}`}
                      >
                        <td className="px-6 py-4 w-12">
                          <input
                            type="checkbox"
                            checked={pendingSelectedIds.has(u.id)}
                            onChange={() => handlePendingSelectUser(u.id)}
                            disabled={u.status === 'in_progress'}
                            className="rounded border-neutral-300 text-primary-600 focus:ring-primary-500 cursor-pointer w-4 h-4 disabled:opacity-30"
                            title={u.status === 'in_progress' ? 'Cannot select — user may be actively signing up' : ''}
                          />
                        </td>
                        <td className="px-6 py-4">
                          <div className="flex items-center gap-3">
                            <div className="w-11 h-11 rounded-full bg-neutral-100 ring-1 ring-neutral-200 flex items-center justify-center shrink-0">
                              <span className="text-sm font-bold text-neutral-400">
                                {(u.email || '?').charAt(0).toUpperCase()}
                              </span>
                            </div>
                            <div className="min-w-0">
                              <p className="font-semibold text-neutral-900 truncate">{u.email || '—'}</p>
                              {u.phone && <p className="text-xs text-neutral-400">{u.phone}</p>}
                            </div>
                          </div>
                        </td>
                        <td className="px-6 py-4 text-sm text-neutral-600">
                          {u.created_at ? new Date(u.created_at).toLocaleString('en-IN', { dateStyle: 'medium', timeStyle: 'short' }) : '—'}
                        </td>
                        <td className="px-6 py-4">
                          {u.email_confirmed_at ? (
                            <span className="inline-flex items-center gap-1.5 text-xs font-medium text-success-700">
                              <span className="w-1.5 h-1.5 rounded-full bg-success-500" /> Yes
                            </span>
                          ) : (
                            <span className="inline-flex items-center gap-1.5 text-xs font-medium text-neutral-400">
                              <span className="w-1.5 h-1.5 rounded-full bg-neutral-300" /> No
                            </span>
                          )}
                        </td>
                        <td className="px-6 py-4">
                          {statusBadge(u.status, u.age_minutes)}
                        </td>
                        <td className="px-6 py-4">
                          <div className="flex items-center justify-end">
                            {u.status === 'abandoned' ? (
                              <Button
                                variant="danger"
                                size="sm"
                                onClick={() => handleDeletePendingUser(u.id)}
                                disabled={actionLoading}
                                icon={Trash2}
                                className="opacity-0 group-hover:opacity-100 transition-opacity"
                              >
                                Delete
                              </Button>
                            ) : (
                              <span className="text-xs text-neutral-400 italic">Active signup</span>
                            )}
                          </div>
                        </td>
                      </tr>
                    ))}
                    {pendingUsers.length === 0 && (
                      <tr>
                        <td colSpan="6" className="px-6 py-16 text-center">
                          <div className="flex flex-col items-center gap-3 text-neutral-400">
                            <div className="w-14 h-14 rounded-2xl bg-green-50 flex items-center justify-center">
                              <UsersIcon size={26} className="text-green-500" />
                            </div>
                            <p className="font-medium text-neutral-500">No pending signups</p>
                            <p className="text-xs text-neutral-400">All auth users have completed their profile setup</p>
                          </div>
                        </td>
                      </tr>
                    )}
                  </tbody>
                </table>
              </div>
            )}

            {/* Pagination controls */}
            {!pendingLoading && pendingTotalPages > 1 && (
              <div className="flex items-center justify-between px-6 py-3.5 border-t border-neutral-100 bg-neutral-50/50">
                <p className="text-sm text-neutral-500">
                  Showing {((pendingPage - 1) * PER_PAGE) + 1}–{Math.min(pendingPage * PER_PAGE, pendingTotal)} of {pendingTotal.toLocaleString()}
                </p>
                <div className="flex items-center gap-2">
                  <Button
                    variant="outline"
                    size="sm"
                    onClick={() => setPendingPage(p => Math.max(1, p - 1))}
                    disabled={pendingPage === 1}
                    icon={ChevronLeft}
                  >
                    Prev
                  </Button>
                  <span className="text-sm font-medium text-neutral-700 px-2">
                    {pendingPage} / {pendingTotalPages}
                  </span>
                  <Button
                    variant="outline"
                    size="sm"
                    onClick={() => setPendingPage(p => Math.min(pendingTotalPages, p + 1))}
                    disabled={pendingPage === pendingTotalPages}
                    icon={ChevronRight}
                  >
                    Next
                  </Button>
                </div>
              </div>
            )}
          </Card>
        </>
      )}

      {selectedUser && <UserModal user={selectedUser} onClose={() => setSelectedUser(null)} onRefresh={handleUserModalRefresh} />}
    </div>
  );
};

export default UsersManager;
