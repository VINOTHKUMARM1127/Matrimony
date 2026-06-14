import { useEffect, useState } from 'react';
import * as adminApi from '../../api/adminApi';
import Card from '../../components/common/Card';
import Button from '../../components/common/Button';
import { Search, Shield, ChevronRight, UserMinus } from 'lucide-react';
import UserModal from './UserModal';

const UsersManager = () => {
  const [users, setUsers] = useState([]);
  const [filteredUsers, setFilteredUsers] = useState([]);
  const [searchTerm, setSearchTerm] = useState('');
  const [filterGender, setFilterGender] = useState('');
  const [filterTier, setFilterTier] = useState('');
  const [filterStatus, setFilterStatus] = useState('');
  const [isLoading, setIsLoading] = useState(true);
  const [actionLoading, setActionLoading] = useState(false);
  const [selectedUser, setSelectedUser] = useState(null);

  useEffect(() => {
    loadUsers();
  }, []);

  const loadUsers = async () => {
    setIsLoading(true);
    try {
      const data = await adminApi.fetchAllUsers();
      setUsers(data);
      setFilteredUsers(data);
    } catch (err) {
      console.error('Error loading users:', err);
      alert('Failed to load users');
    } finally {
      setIsLoading(false);
    }
  };

  useEffect(() => {
    let result = users;

    if (searchTerm) {
      const lower = searchTerm.toLowerCase();
      result = result.filter(u => 
        u.display_name?.toLowerCase().includes(lower) || 
        u.email?.toLowerCase().includes(lower) ||
        u.phone?.includes(lower)
      );
    }

    if (filterGender) {
      result = result.filter(u => u.gender === filterGender);
    }

    if (filterTier) {
      if (filterTier === 'free') {
        result = result.filter(u => !u.is_premium || u.tier === 'free');
      } else {
        result = result.filter(u => u.tier === filterTier);
      }
    }

    if (filterStatus) {
      if (filterStatus === 'complete') {
        result = result.filter(u => u.is_profile_complete === true);
      } else if (filterStatus === 'incomplete') {
        result = result.filter(u => u.is_profile_complete === false || u.is_profile_complete === null);
      }
    }

    setFilteredUsers(result);
  }, [searchTerm, filterGender, filterTier, filterStatus, users]);

  const handleUpdatePlan = async (userId, planType) => {
    if (!window.confirm(`Update plan to ${planType} for this user?`)) return;
    setActionLoading(true);
    try {
      await adminApi.updateUserPlan(userId, planType);
      alert('Plan updated successfully!');
      loadUsers();
    } catch (err) {
      console.error(err);
      alert(err.message || 'Failed to update plan');
    } finally {
      setActionLoading(false);
    }
  };

  const handleResetPassword = async (userId) => {
    const newPassword = prompt('Enter new password (min 6 characters):');
    if (!newPassword) return;
    if (newPassword.length < 6) {
      alert('Password must be at least 6 characters.');
      return;
    }

    setActionLoading(true);
    try {
      await adminApi.resetUserPassword(userId, newPassword);
      alert('Password reset successfully!');
    } catch (err) {
      console.error(err);
      alert(err.message || 'Failed to reset password');
    } finally {
      setActionLoading(false);
    }
  };

  const handleCleanUpIncomplete = async () => {
    if (!window.confirm('Are you sure you want to delete ALL users who have not completed their profile setup? This cannot be undone.')) return;
    setActionLoading(true);
    try {
      const deletedCount = await adminApi.deleteIncompleteUsers();
      alert(`Successfully deleted ${deletedCount} incomplete account(s).`);
      loadUsers();
    } catch (err) {
      console.error(err);
      alert(err.message || 'Failed to clean up accounts');
    } finally {
      setActionLoading(false);
    }
  };

  return (
    <div className="flex flex-col h-full relative">
      {!import.meta.env.VITE_SUPABASE_SERVICE_ROLE_KEY && (
        <div className="bg-error-900 border border-error-500 text-error-50 p-4 rounded-xl mb-6 font-medium shadow-sm">
          <p className="flex items-center gap-2 mb-1 text-lg">
            <Shield className="text-error-400" size={20} />
            Missing Service Role Key
          </p>
          <p className="text-error-200 text-sm">
            You must add <code className="bg-error-950 px-1.5 py-0.5 rounded text-error-100">VITE_SUPABASE_SERVICE_ROLE_KEY</code> to your <code>admin/.env</code> file! 
            Without it, the Admin Panel cannot fetch user emails, reset passwords, or delete users. 
            You can find this key in your Supabase Dashboard under <b>Project Settings &gt; API</b>.
            Please restart the dev server after adding it.
          </p>
        </div>
      )}

      <div className="flex justify-between items-center mb-6">
        <h1 className="text-2xl font-bold text-neutral-900">Manage Users</h1>
        <div className="flex items-center gap-4">
          <Button 
            variant="outline" 
            onClick={handleCleanUpIncomplete} 
            disabled={actionLoading}
            className="flex items-center gap-2 text-error-600 hover:bg-error-50 border-error-200 hover:border-error-300"
          >
            <UserMinus size={18} />
            Clean Up Incomplete Accounts
          </Button>
        </div>
      </div>

      <div className="bg-white p-4 rounded-xl border border-neutral-200 mb-6 flex flex-wrap gap-4 items-center">
        <div className="relative w-64">
          <Search className="absolute left-3 top-1/2 -translate-y-1/2 text-neutral-400" size={18} />
          <input 
            type="text" 
            placeholder="Search users..." 
            value={searchTerm}
            onChange={(e) => setSearchTerm(e.target.value)}
            className="w-full pl-10 pr-4 py-2 rounded-lg border border-neutral-200 focus:outline-none focus:border-primary-500"
          />
        </div>

        <select 
          value={filterGender} 
          onChange={(e) => setFilterGender(e.target.value)}
          className="px-3 py-2 border border-neutral-200 rounded-lg focus:outline-none focus:border-primary-500 bg-white"
        >
          <option value="">All Genders</option>
          <option value="male">Male</option>
          <option value="female">Female</option>
        </select>

        <select 
          value={filterTier} 
          onChange={(e) => setFilterTier(e.target.value)}
          className="px-3 py-2 border border-neutral-200 rounded-lg focus:outline-none focus:border-primary-500 bg-white"
        >
          <option value="">All Plans</option>
          <option value="free">Free</option>
          <option value="silver">Silver</option>
          <option value="gold">Gold</option>
          <option value="platinum">Platinum</option>
        </select>

        <select 
          value={filterStatus} 
          onChange={(e) => setFilterStatus(e.target.value)}
          className="px-3 py-2 border border-neutral-200 rounded-lg focus:outline-none focus:border-primary-500 bg-white"
        >
          <option value="">All Profiles</option>
          <option value="complete">Completed</option>
          <option value="incomplete">Incomplete</option>
        </select>

        {(searchTerm || filterGender || filterTier || filterStatus) && (
          <button 
            onClick={() => {
              setSearchTerm('');
              setFilterGender('');
              setFilterTier('');
              setFilterStatus('');
            }}
            className="text-sm text-primary-600 hover:text-primary-700 font-medium"
          >
            Clear Filters
          </button>
        )}
      </div>

      <Card className="flex-1 overflow-hidden flex flex-col">
        {isLoading ? (
          <div className="p-8 text-center text-neutral-500">Loading users...</div>
        ) : (
          <div className="overflow-x-auto">
            <table className="w-full text-left border-collapse">
              <thead>
                <tr className="bg-neutral-50 border-b border-neutral-200 text-sm font-medium text-neutral-500">
                  <th className="px-6 py-4">User</th>
                  <th className="px-6 py-4">Gender</th>
                  <th className="px-6 py-4">Status</th>
                  <th className="px-6 py-4">Actions</th>
                </tr>
              </thead>
              <tbody className="divide-y divide-neutral-100">
                {filteredUsers.map(u => {
                  const activeSub = u.subscriptions?.find(s => s.status === 'active' && new Date(s.expires_at) > new Date());
                  
                  return (
                    <tr 
                      key={u.id} 
                      className="hover:bg-neutral-50 transition-colors cursor-pointer group"
                      onClick={() => setSelectedUser(u)}
                    >
                      <td className="px-6 py-4">
                        <p className="font-semibold text-neutral-900 group-hover:text-primary-600 transition-colors">{u.display_name || 'No Name'}</p>
                        <p className="text-xs text-neutral-500 font-medium">{u.email || u.display_name}</p>
                        <p className="text-xs text-neutral-400 mt-0.5">{u.phone}</p>
                      </td>
                      <td className="px-6 py-4 capitalize text-sm">{u.gender || '-'}</td>
                      <td className="px-6 py-4">
                        {u.is_premium ? (
                          <span className="inline-flex items-center gap-1 px-2.5 py-1 rounded-full text-xs font-medium bg-gold-100 text-gold-700 capitalize">
                            <Shield size={12} /> {u.tier || 'Premium'}
                          </span>
                        ) : (
                          <span className="inline-flex items-center px-2.5 py-1 rounded-full text-xs font-medium bg-neutral-100 text-neutral-600 capitalize">
                            {u.tier || 'Free'}
                          </span>
                        )}
                      </td>
                      <td className="px-6 py-4">
                        <div className="flex items-center gap-2">
                          <select 
                            className="text-sm border border-neutral-200 rounded p-1 bg-white"
                            onClick={(e) => e.stopPropagation()}
                            onChange={(e) => {
                              if(e.target.value) handleUpdatePlan(u.id, e.target.value);
                              e.target.value = '';
                            }}
                            disabled={actionLoading}
                            defaultValue=""
                          >
                            <option value="" disabled>Change Plan...</option>
                            <option value="free">Free / Demote</option>
                            <option value="silver">Silver</option>
                            <option value="gold">Gold</option>
                            <option value="platinum">Platinum</option>
                          </select>
                          
                          <ChevronRight className="text-neutral-300 group-hover:text-primary-500 transition-colors ml-4" size={20} />
                        </div>
                      </td>
                    </tr>
                  );
                })}
                {filteredUsers.length === 0 && (
                  <tr>
                    <td colSpan="4" className="px-6 py-8 text-center text-neutral-500">
                      No users found.
                    </td>
                  </tr>
                )}
              </tbody>
            </table>
          </div>
        )}
      </Card>
      
      {selectedUser && (
        <UserModal 
          user={selectedUser} 
          onClose={() => setSelectedUser(null)} 
          onRefresh={loadUsers} 
        />
      )}
    </div>
  );
};

export default UsersManager;
