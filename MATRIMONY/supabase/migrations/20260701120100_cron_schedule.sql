-- =====================================================================================
-- CRON SCHEDULE — nightly "Type 3" distribution
-- Requires the pg_cron extension (already created in the main migration).
-- Runs fn_run_daily_distribution() every night at 1:00 AM server time (UTC).
-- Adjust the schedule string to your preferred time — cron syntax is
-- 'minute hour day month weekday'.
-- =====================================================================================

select cron.schedule(
  'wedring-daily-distribution',   -- job name (unique — re-running this file updates it)
  '0 1 * * *',                    -- every day at 01:00 UTC
  $$ select public.fn_run_daily_distribution(); $$
);

-- Expire lapsed paid plans and promote the next queued plan (see
-- 20260701120150_subscription_lifecycle_functions.sql). Runs hourly since plans can
-- expire at any time of day, not just at midnight.
select cron.schedule(
  'wedring-subscription-expiry',
  '0 * * * *',                    -- every hour, on the hour
  $$ select public.fn_expire_and_advance_subscriptions(); $$
);

-- To inspect scheduled jobs:      select * from cron.job;
-- To see run history:             select * from cron.job_run_details order by start_time desc limit 20;
-- To remove a job:                select cron.unschedule('wedring-daily-distribution');
--                                 select cron.unschedule('wedring-subscription-expiry');
