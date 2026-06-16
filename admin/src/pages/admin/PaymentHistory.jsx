import { useEffect, useState, useMemo } from 'react';
import * as adminApi from '../../api/adminApi';
import Card from '../../components/common/Card';
import Button from '../../components/common/Button';
import {
  CreditCard, TrendingUp, IndianRupee, Calendar, Download, Filter,
  ChevronLeft, ChevronRight, Search, X, Clock, CheckCircle, XCircle, RotateCcw,
} from 'lucide-react';

const STATUS_COLORS = {
  pending: 'bg-amber-50 text-amber-700',
  success: 'bg-success-50 text-success-700',
  failed: 'bg-error-50 text-error-700',
  refunded: 'bg-blue-50 text-blue-700',
  cancelled: 'bg-neutral-100 text-neutral-600',
};

const STATUS_ICONS = {
  pending: Clock,
  success: CheckCircle,
  failed: XCircle,
  refunded: RotateCcw,
  cancelled: X,
};

const PaymentHistory = () => {
  const [stats, setStats] = useState(null);
  const [payments, setPayments] = useState([]);
  const [total, setTotal] = useState(0);
  const [page, setPage] = useState(1);
  const [isLoading, setIsLoading] = useState(true);
  const [isTableLoading, setIsTableLoading] = useState(false);

  const [filters, setFilters] = useState({
    status: 'all',
    planType: 'all',
    search: '',
    dateFrom: '',
    dateTo: '',
  });

  const perPage = 25;

  useEffect(() => {
    loadStats();
  }, []);

  useEffect(() => {
    loadPayments();
  }, [page, filters]);

  const loadStats = async () => {
    try {
      const data = await adminApi.fetchRevenueStats();
      setStats(data);
    } catch (err) {
      console.error('Failed to load revenue stats:', err);
    }
  };

  const loadPayments = async () => {
    setIsTableLoading(true);
    try {
      const result = await adminApi.fetchPayments({
        page,
        perPage,
        status: filters.status,
        planType: filters.planType,
        search: filters.search,
        dateFrom: filters.dateFrom,
        dateTo: filters.dateTo,
      });
      setPayments(result.payments);
      setTotal(result.total);
    } catch (err) {
      console.error('Failed to load payments:', err);
    } finally {
      setIsLoading(false);
      setIsTableLoading(false);
    }
  };

  const totalPages = Math.ceil(total / perPage);

  const formatCurrency = (amount) => {
    return `₹${(amount || 0).toLocaleString('en-IN')}`;
  };

  const formatDate = (dateStr) => {
    if (!dateStr) return '-';
    return new Date(dateStr).toLocaleString('en-IN', {
      day: 'numeric', month: 'short', year: 'numeric',
      hour: '2-digit', minute: '2-digit',
    });
  };

  const handleFilterChange = (field, value) => {
    setFilters((prev) => ({ ...prev, [field]: value }));
    setPage(1);
  };

  const clearFilters = () => {
    setFilters({ status: 'all', planType: 'all', search: '', dateFrom: '', dateTo: '' });
    setPage(1);
  };

  const exportCSV = () => {
    if (!payments.length) return;

    const headers = [
      'Transaction ID', 'Date', 'User', 'Phone', 'Plan', 'Amount', 'Tax',
      'Final Amount', 'Gateway', 'Gateway Txn ID', 'Status',
    ];

    const rows = payments.map((p) => [
      p.id,
      formatDate(p.created_at),
      p.profile?.display_name || '-',
      p.profile?.phone || '-',
      p.plan_type,
      p.amount,
      p.tax,
      p.final_amount,
      p.payment_gateway,
      p.gateway_transaction_id || '-',
      p.status,
    ]);

    const csv = [headers, ...rows].map((r) => r.map((c) => `"${c}"`).join(',')).join('\n');
    const blob = new Blob([csv], { type: 'text/csv' });
    const url = URL.createObjectURL(blob);
    const a = document.createElement('a');
    a.href = url;
    a.download = `payments_${new Date().toISOString().slice(0, 10)}.csv`;
    a.click();
    URL.revokeObjectURL(url);
  };

  const statCards = useMemo(() => {
    if (!stats) return [];
    return [
      { label: 'Total Revenue', value: formatCurrency(stats.total_revenue), icon: IndianRupee, iconBg: 'bg-success-100 text-success-600' },
      { label: "Today's Revenue", value: formatCurrency(stats.today_revenue), icon: TrendingUp, iconBg: 'bg-primary-100 text-primary-600' },
      { label: 'Monthly Revenue', value: formatCurrency(stats.monthly_revenue), icon: Calendar, iconBg: 'bg-blue-100 text-blue-600' },
      { label: 'Successful', value: stats.success_count?.toLocaleString() || '0', icon: CheckCircle, iconBg: 'bg-success-100 text-success-600', sub: 'payments' },
      { label: 'Failed', value: stats.failed_count?.toLocaleString() || '0', icon: XCircle, iconBg: 'bg-error-100 text-error-600', sub: 'payments' },
      { label: 'Refunds', value: stats.refund_count?.toLocaleString() || '0', icon: RotateCcw, iconBg: 'bg-blue-100 text-blue-600', sub: 'processed' },
    ];
  }, [stats]);

  if (isLoading) {
    return (
      <div className="space-y-6">
        <div className="h-9 w-48 bg-white rounded-xl animate-pulse" />
        <div className="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-3 gap-4">
          {[0, 1, 2, 3, 4, 5].map((i) => (
            <div key={i} className="h-24 bg-white rounded-2xl border border-neutral-200/70 animate-pulse" />
          ))}
        </div>
        <div className="h-96 bg-white rounded-2xl border border-neutral-200/70 animate-pulse" />
      </div>
    );
  }

  return (
    <div className="pb-12">
      {/* Header */}
      <div className="flex flex-wrap justify-between items-end gap-3 mb-7">
        <div>
          <p className="text-sm font-medium text-primary-600 flex items-center gap-1.5 mb-1">
            <CreditCard size={15} /> Revenue & Payments
          </p>
          <h1 className="text-2xl sm:text-3xl font-extrabold text-neutral-900 tracking-tight">
            Payment History
          </h1>
          <p className="text-neutral-500 mt-1 text-sm">
            Track all transactions, revenue metrics, and subscription payments.
          </p>
        </div>
        <Button onClick={exportCSV} variant="outline" icon={Download} disabled={!payments.length}>
          Export CSV
        </Button>
      </div>

      {/* Revenue Stats */}
      <div className="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-3 gap-4 mb-8">
        {statCards.map((s) => (
          <Card key={s.label} hover className="p-4">
            <div className="flex items-center gap-3">
              <div className={`w-11 h-11 rounded-xl ${s.iconBg} flex items-center justify-center`}>
                <s.icon size={20} />
              </div>
              <div>
                <p className="text-xs font-medium text-neutral-500">{s.label}</p>
                <p className="text-xl font-extrabold text-neutral-900">{s.value}</p>
                {s.sub && <p className="text-[10px] text-neutral-400">{s.sub}</p>}
              </div>
            </div>
          </Card>
        ))}
      </div>

      {/* Plan Revenue Breakdown */}
      {stats?.plan_revenue && stats.plan_revenue.length > 0 && (
        <Card className="p-5 mb-8">
          <h3 className="font-bold text-neutral-900 mb-3">Revenue by Plan</h3>
          <div className="grid grid-cols-1 sm:grid-cols-3 gap-3">
            {stats.plan_revenue.map((p) => (
              <div key={p.plan_type} className="bg-neutral-50 rounded-xl border border-neutral-100 p-4 text-center">
                <p className="text-xs font-semibold text-neutral-500 uppercase mb-1">{p.plan_type}</p>
                <p className="text-lg font-extrabold text-neutral-900">{formatCurrency(p.revenue)}</p>
                <p className="text-[11px] text-neutral-400">{p.count} transactions</p>
              </div>
            ))}
          </div>
        </Card>
      )}

      {/* Filters */}
      <Card className="p-4 mb-5">
        <div className="flex flex-wrap items-center gap-3">
          <Filter size={16} className="text-neutral-400" />

          <select
            value={filters.status}
            onChange={(e) => handleFilterChange('status', e.target.value)}
            className="px-3 py-2 border border-neutral-200 rounded-lg text-sm bg-white focus:outline-none focus:border-primary-400"
          >
            <option value="all">All Status</option>
            <option value="success">Success</option>
            <option value="failed">Failed</option>
            <option value="pending">Pending</option>
            <option value="refunded">Refunded</option>
            <option value="cancelled">Cancelled</option>
          </select>

          <select
            value={filters.planType}
            onChange={(e) => handleFilterChange('planType', e.target.value)}
            className="px-3 py-2 border border-neutral-200 rounded-lg text-sm bg-white focus:outline-none focus:border-primary-400"
          >
            <option value="all">All Plans</option>
            <option value="silver">Silver</option>
            <option value="gold">Gold</option>
            <option value="platinum">Platinum</option>
          </select>

          <input
            type="date"
            value={filters.dateFrom}
            onChange={(e) => handleFilterChange('dateFrom', e.target.value)}
            className="px-3 py-2 border border-neutral-200 rounded-lg text-sm bg-white focus:outline-none focus:border-primary-400"
            placeholder="From"
          />
          <input
            type="date"
            value={filters.dateTo}
            onChange={(e) => handleFilterChange('dateTo', e.target.value)}
            className="px-3 py-2 border border-neutral-200 rounded-lg text-sm bg-white focus:outline-none focus:border-primary-400"
            placeholder="To"
          />

          {(filters.status !== 'all' || filters.planType !== 'all' || filters.dateFrom || filters.dateTo) && (
            <button onClick={clearFilters} className="text-xs text-primary-600 hover:text-primary-700 font-semibold flex items-center gap-1">
              <X size={14} /> Clear
            </button>
          )}
        </div>
      </Card>

      {/* Payments Table */}
      <Card className="overflow-hidden">
        {isTableLoading ? (
          <div className="p-8 text-center">
            <div className="animate-spin w-8 h-8 border-2 border-primary-500 border-t-transparent rounded-full mx-auto" />
          </div>
        ) : payments.length === 0 ? (
          <div className="p-12 text-center text-neutral-400">
            <CreditCard size={36} className="mx-auto mb-3 opacity-40" />
            <p className="font-medium">No payments found</p>
            <p className="text-xs mt-1">Payments will appear here once users subscribe.</p>
          </div>
        ) : (
          <>
            <div className="overflow-x-auto">
              <table className="w-full text-sm">
                <thead>
                  <tr className="border-b border-neutral-100 bg-neutral-50/50">
                    <th className="px-4 py-3 text-left font-semibold text-neutral-600">Date</th>
                    <th className="px-4 py-3 text-left font-semibold text-neutral-600">User</th>
                    <th className="px-4 py-3 text-left font-semibold text-neutral-600">Plan</th>
                    <th className="px-4 py-3 text-right font-semibold text-neutral-600">Amount</th>
                    <th className="px-4 py-3 text-left font-semibold text-neutral-600">Gateway</th>
                    <th className="px-4 py-3 text-left font-semibold text-neutral-600">Txn ID</th>
                    <th className="px-4 py-3 text-center font-semibold text-neutral-600">Status</th>
                  </tr>
                </thead>
                <tbody>
                  {payments.map((p) => {
                    const StatusIcon = STATUS_ICONS[p.status] || Clock;
                    return (
                      <tr key={p.id} className="border-b border-neutral-50 hover:bg-neutral-50/50 transition-colors">
                        <td className="px-4 py-3 text-neutral-600 text-xs whitespace-nowrap">{formatDate(p.created_at)}</td>
                        <td className="px-4 py-3">
                          <div>
                            <p className="font-medium text-neutral-900 text-sm">{p.profile?.display_name || 'Unknown'}</p>
                            <p className="text-[11px] text-neutral-400">{p.profile?.phone || '-'}</p>
                          </div>
                        </td>
                        <td className="px-4 py-3">
                          <span className="capitalize font-semibold text-neutral-700">{p.plan_type}</span>
                        </td>
                        <td className="px-4 py-3 text-right font-bold text-neutral-900">{formatCurrency(p.final_amount)}</td>
                        <td className="px-4 py-3 text-neutral-500 capitalize text-xs">{p.payment_gateway}</td>
                        <td className="px-4 py-3 text-neutral-400 text-xs font-mono truncate max-w-[120px]">
                          {p.gateway_transaction_id || '-'}
                        </td>
                        <td className="px-4 py-3 text-center">
                          <span className={`inline-flex items-center gap-1 text-[11px] font-semibold px-2 py-1 rounded-full ${STATUS_COLORS[p.status] || STATUS_COLORS.pending}`}>
                            <StatusIcon size={11} />
                            {p.status}
                          </span>
                        </td>
                      </tr>
                    );
                  })}
                </tbody>
              </table>
            </div>

            {/* Pagination */}
            {totalPages > 1 && (
              <div className="flex items-center justify-between px-4 py-3 border-t border-neutral-100">
                <p className="text-xs text-neutral-500">
                  Showing {(page - 1) * perPage + 1}–{Math.min(page * perPage, total)} of {total}
                </p>
                <div className="flex items-center gap-1">
                  <button
                    onClick={() => setPage((p) => Math.max(1, p - 1))}
                    disabled={page === 1}
                    className="p-2 rounded-lg hover:bg-neutral-100 disabled:opacity-30 disabled:cursor-not-allowed transition-colors"
                  >
                    <ChevronLeft size={16} />
                  </button>
                  <span className="px-3 py-1 text-sm font-medium text-neutral-700">
                    {page} / {totalPages}
                  </span>
                  <button
                    onClick={() => setPage((p) => Math.min(totalPages, p + 1))}
                    disabled={page === totalPages}
                    className="p-2 rounded-lg hover:bg-neutral-100 disabled:opacity-30 disabled:cursor-not-allowed transition-colors"
                  >
                    <ChevronRight size={16} />
                  </button>
                </div>
              </div>
            )}
          </>
        )}
      </Card>
    </div>
  );
};

export default PaymentHistory;
