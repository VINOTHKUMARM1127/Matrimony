import { useState } from 'react';
import { useNavigate, Navigate } from 'react-router-dom';
import useAuthStore from '../../store/useAuthStore';
import * as adminApi from '../../api/adminApi';
import { Shield, Eye, EyeOff } from 'lucide-react';
import Button from '../../components/common/Button';

const AdminLogin = () => {
  const [email, setEmail] = useState('');
  const [password, setPassword] = useState('');
  const [showPassword, setShowPassword] = useState(false);
  const [error, setError] = useState('');
  const [isLoading, setIsLoading] = useState(false);
  const navigate = useNavigate();
  const { signIn, isAuthenticated, user } = useAuthStore();

  const handleLogin = async (e) => {
    e.preventDefault();
    setError('');
    setIsLoading(true);

    try {
      // Check if email is admin before even attempting auth to fail fast if not
      const isAdmin = await adminApi.checkIsAdmin(email);
      if (!isAdmin) {
        throw new Error('Access denied. Admin privileges required.');
      }

      await signIn(email, password);
      navigate('/dashboard');
    } catch (err) {
      setError(err.message || 'Login failed');
    } finally {
      setIsLoading(false);
    }
  };

  // Redirect if already logged in and is admin
  if (isAuthenticated && user) {
    return <Navigate to="/dashboard" replace />;
  }

  return (
    <div className="min-h-screen bg-neutral-900 flex items-center justify-center p-4">
      <div className="w-full max-w-md bg-neutral-800 rounded-2xl shadow-2xl p-8 border border-neutral-700">
        <div className="flex flex-col items-center mb-8">
          <div className="w-16 h-16 bg-primary-900/50 rounded-2xl flex items-center justify-center border border-primary-500 mb-4">
            <Shield className="text-primary-400" size={32} />
          </div>
          <h1 className="text-2xl font-bold text-white">Admin Portal</h1>
          <p className="text-neutral-400 mt-2">Sign in to manage the platform</p>
        </div>

        {error && (
          <div className="bg-error-900/50 border border-error-500 text-error-100 p-3 rounded-lg mb-6 text-sm">
            {error}
          </div>
        )}

        <form onSubmit={handleLogin} className="space-y-4">
          <div>
            <label className="block text-neutral-300 text-sm font-medium mb-1">Email</label>
            <input
              type="email"
              value={email}
              onChange={(e) => setEmail(e.target.value)}
              required
              className="w-full bg-neutral-900 border border-neutral-700 text-white rounded-lg p-3 focus:outline-none focus:border-primary-500 transition-colors"
              placeholder="admin@matrimony.com"
            />
          </div>
          
          <div>
            <label className="block text-neutral-300 text-sm font-medium mb-1">Password</label>
            <div className="relative">
              <input
                type={showPassword ? "text" : "password"}
                value={password}
                onChange={(e) => setPassword(e.target.value)}
                required
                className="w-full bg-neutral-900 border border-neutral-700 text-white rounded-lg p-3 pr-10 focus:outline-none focus:border-primary-500 transition-colors"
                placeholder="••••••••"
              />
              <button
                type="button"
                onClick={() => setShowPassword(!showPassword)}
                className="absolute right-3 top-1/2 -translate-y-1/2 text-neutral-400 hover:text-white transition-colors"
              >
                {showPassword ? <EyeOff size={20} /> : <Eye size={20} />}
              </button>
            </div>
          </div>

          <Button 
            type="submit" 
            fullWidth 
            isLoading={isLoading}
            className="mt-6 bg-primary-600 hover:bg-primary-500 text-white border-none"
          >
            Sign In as Admin
          </Button>
        </form>
      </div>
    </div>
  );
};

export default AdminLogin;
