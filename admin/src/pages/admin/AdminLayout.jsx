import { useEffect, useState } from 'react';
import { Outlet, Navigate, NavLink, useNavigate } from 'react-router-dom';
import { LayoutDashboard, Users, UploadCloud, Settings, LogOut } from 'lucide-react';
import useAuthStore from '../../store/useAuthStore';
import * as adminApi from '../../api/adminApi';

const AdminLayout = () => {
  const { isAuthenticated, user, signOut } = useAuthStore();
  const navigate = useNavigate();
  const [isAdmin, setIsAdmin] = useState(null);

  useEffect(() => {
    const verifyAdmin = async () => {
      if (isAuthenticated && user?.email) {
        const adminStatus = await adminApi.checkIsAdmin(user.email);
        setIsAdmin(adminStatus);
      } else {
        setIsAdmin(false);
      }
    };
    verifyAdmin();
  }, [isAuthenticated, user]);

  const handleLogout = async () => {
    await signOut();
    navigate('/login');
  };

  if (isAdmin === null) {
    return <div className="min-h-screen bg-neutral-900 flex items-center justify-center text-white">Verifying access...</div>;
  }

  if (!isAdmin) {
    return <Navigate to="/login" replace />;
  }

  const navItems = [
    { to: '/dashboard', icon: LayoutDashboard, label: 'Dashboard' },
    { to: '/users', icon: Users, label: 'Manage Users' },
    { to: '/bulk-upload', icon: UploadCloud, label: 'Bulk Upload' },
    { to: '/settings', icon: Settings, label: 'Recommendations' },
  ];

  return (
    <div className="flex h-screen bg-neutral-100 font-sans">
      {/* Sidebar */}
      <aside className="w-64 bg-neutral-900 text-white flex flex-col">
        <div className="p-6 border-b border-neutral-800">
          <div className="flex items-center gap-2">
            <div className="w-8 h-8 bg-primary rounded flex items-center justify-center font-bold text-white">TM</div>
            <span className="font-bold text-lg tracking-wide">Admin Portal</span>
          </div>
          <p className="text-xs text-neutral-400 mt-2 truncate">{user?.email}</p>
        </div>

        <nav className="flex-1 p-4 space-y-1">
          {navItems.map((item) => (
            <NavLink
              key={item.to}
              to={item.to}
              className={({ isActive }) =>
                `flex items-center gap-3 px-3 py-3 rounded-lg transition-colors ${
                  isActive 
                    ? 'bg-primary-900/50 text-primary-400 border border-primary-500/30' 
                    : 'text-neutral-400 hover:bg-neutral-800 hover:text-white'
                }`
              }
            >
              <item.icon size={20} />
              <span className="font-medium">{item.label}</span>
            </NavLink>
          ))}
        </nav>

        <div className="p-4 border-t border-neutral-800">
          <button 
            onClick={handleLogout}
            className="flex items-center gap-3 px-3 py-3 w-full text-left rounded-lg text-neutral-400 hover:bg-error-900/30 hover:text-error-400 transition-colors"
          >
            <LogOut size={20} />
            <span className="font-medium">Sign Out</span>
          </button>
        </div>
      </aside>

      {/* Main Content */}
      <main className="flex-1 overflow-auto bg-neutral-50 p-8">
        <Outlet />
      </main>
    </div>
  );
};

export default AdminLayout;
