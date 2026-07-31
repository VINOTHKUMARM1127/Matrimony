-- Add push_token_used column to notifications table
-- Tracks exactly which Expo push token was used to send each notification,
-- so check-push-receipts can deactivate only the specific stale token
-- (not all devices belonging to that user).

alter table public.notifications
  add column if not exists push_token_used text;

-- Index for efficient lookup when processing receipts
create index if not exists idx_notifications_push_token_used
  on public.notifications(push_token_used)
  where push_token_used is not null;
