import { useState } from 'react';
import Card from '../../components/common/Card';
import Button from '../../components/common/Button';
import { Download, FileText, Users, CreditCard, Heart, SlidersHorizontal, Loader2 } from 'lucide-react';
import supabase from '../../api/supabaseClient';
import { fetchAllUsers } from '../../api/adminApi';

const ReportsManager = () => {
  const [isExporting, setIsExporting] = useState(null);

  const downloadCSV = async (filename, data) => {
    if (!data || data.length === 0) {
      alert('No records found for export.');
      return;
    }
    const headers = Object.keys(data[0]);
    const esc = (v) => `"${String(v ?? '').replace(/"/g, '""')}"`;
    
    const CHUNK_SIZE = 5000;
    const blobParts = [headers.join(',') + '\n'];
    
    for (let i = 0; i < data.length; i += CHUNK_SIZE) {
      const chunk = data.slice(i, i + CHUNK_SIZE);
      const rowsStr = chunk.map(row => headers.map(h => esc(row[h])).join(',')).join('\n');
      blobParts.push(rowsStr + (i + CHUNK_SIZE < data.length ? '\n' : ''));
      
      // Yield to main thread to prevent UI freezing
      await new Promise(r => setTimeout(r, 0));
    }
    
    const blob = new Blob(blobParts, { type: 'text/csv;charset=utf-8;' });
    const url = URL.createObjectURL(blob);
    const a = document.createElement('a');
    a.href = url;
    a.download = `${filename}_${new Date().toISOString().slice(0, 10)}.csv`;
    a.click();
    URL.revokeObjectURL(url);
  };

  const exportTable = async (table, label) => {
    setIsExporting(table);
    try {
      const { data, error } = await supabase.from(table).select('*').limit(50000);
      if (error) throw error;
      await downloadCSV(table, data);
    } catch (err) {
      alert(`Failed to export ${label}: ` + (err.message || err));
    } finally {
      setIsExporting(null);
    }
  };

  const exportUsers = async () => {
    setIsExporting('users');
    try {
      const users = await fetchAllUsers();

      const flattened = users.map(u => ({
        id: u.id,
        email: u.email || '',
        phone: u.phone || '',
        created_at: u.created_at,
        name: u.full_name,
        gender: u.gender,
        dob: u.dob,
        is_active: u.is_active,
        profile_completion: u.profile_completion_percent
      }));
      await downloadCSV('users_detailed', flattened);
    } catch (err) {
      alert('Failed to export Users: ' + (err.message || err));
    } finally {
      setIsExporting(null);
    }
  };

  const exportPayments = async () => {
    setIsExporting('payments');
    try {
      const { data, error } = await supabase
        .from('payments')
        .select('*')
        .limit(50000)
        .order('created_at', { ascending: false });
        
      if (error) throw error;
      
      // Lookup profile names for each payment
      const userIds = [...new Set((data || []).map(p => p.user_id).filter(Boolean))];
      const profileLookup = {};
      if (userIds.length > 0) {
        const { data: profiles } = await supabase.from('profiles').select('id, full_name, phone').in('id', userIds);
        if (profiles) profiles.forEach(p => profileLookup[p.id] = p);
      }
      
      const flattened = (data || []).map(p => ({
        id: p.id,
        created_at: p.created_at,
        user_name: profileLookup[p.user_id]?.full_name || '',
        user_phone: profileLookup[p.user_id]?.phone || '',
        amount_paise: p.amount_paise,
        currency: p.currency,
        status: p.status,
        razorpay_order_id: p.razorpay_order_id || '',
        razorpay_payment_id: p.razorpay_payment_id || '',
        confirmed_at: p.confirmed_at || '',
      }));
      await downloadCSV('payments_detailed', flattened);
    } catch (err) {
      alert('Failed to export Payments: ' + (err.message || err));
    } finally {
      setIsExporting(null);
    }
  };

  const reports = [
    {
      id: 'users',
      title: 'Users & Profiles',
      desc: 'Export detailed user profile data, verification status, and demographics.',
      icon: Users,
      color: 'text-blue-600',
      bg: 'bg-blue-50',
      action: exportUsers
    },
    {
      id: 'payments',
      title: 'Payments & Revenue',
      desc: 'Export all transactions, statuses, tax details, and Razorpay references.',
      icon: CreditCard,
      color: 'text-emerald-600',
      bg: 'bg-emerald-50',
      action: exportPayments
    },
    {
      id: 'user_subscriptions',
      title: 'Active Memberships',
      desc: 'Export active, queued, and expired memberships for all users.',
      icon: FileText,
      color: 'text-violet-600',
      bg: 'bg-violet-50',
      action: () => exportTable('user_subscriptions', 'Memberships')
    },
    {
      id: 'distribution_logs',
      title: 'Distribution Logs',
      desc: 'Export logs of the daily and initial profile distribution engine runs.',
      icon: SlidersHorizontal,
      color: 'text-amber-600',
      bg: 'bg-amber-50',
      action: () => exportTable('distribution_logs', 'Distribution Logs')
    },
    {
      id: 'interests',
      title: 'Interests & Interactions',
      desc: 'Export logs of interests sent, accepted, rejected, and skipped.',
      icon: Heart,
      color: 'text-rose-600',
      bg: 'bg-rose-50',
      action: () => exportTable('interests', 'Interests')
    }
  ];

  return (
    <div className="pb-12">
      <div className="flex flex-wrap items-end justify-between gap-3 mb-7">
        <div>
          <p className="text-sm font-medium text-primary-600 flex items-center gap-1.5 mb-1">
            <Download size={15} /> Reports & Analytics
          </p>
          <h1 className="text-2xl sm:text-3xl font-extrabold text-neutral-900 tracking-tight">
            Data Exports
          </h1>
          <p className="text-neutral-500 mt-1 text-sm">
            Generate CSV exports of platform data for external reporting and analysis.
          </p>
        </div>
      </div>

      <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-5">
        {reports.map(report => (
          <Card key={report.id} hover className="p-5 flex flex-col h-full">
            <div className={`w-12 h-12 rounded-xl flex items-center justify-center mb-4 ${report.bg} ${report.color}`}>
              <report.icon size={24} />
            </div>
            <h3 className="text-lg font-bold text-neutral-900 mb-2">{report.title}</h3>
            <p className="text-sm text-neutral-500 mb-6 flex-grow">{report.desc}</p>
            <Button 
              onClick={report.action} 
              disabled={isExporting !== null}
              variant="outline" 
              className="w-full justify-center"
              icon={isExporting === report.id ? Loader2 : Download}
            >
              {isExporting === report.id ? 'Exporting...' : 'Export CSV'}
            </Button>
          </Card>
        ))}
      </div>
    </div>
  );
};

export default ReportsManager;
