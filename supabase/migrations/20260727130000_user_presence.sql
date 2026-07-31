-- App-wide user presence for "online" status / grey double-tick.
-- Separate from chat_presence, which is scoped to a specific chat
-- and drives auto-read + push-suppression only.

create table public.user_presence (
  user_id uuid primary key references profiles(id) on delete cascade,
  last_active_at timestamptz not null default now()
);

alter table public.user_presence enable row level security;

create policy user_presence_upsert on public.user_presence
  for insert with check (auth.uid() = user_id);

create policy user_presence_update on public.user_presence
  for update using (auth.uid() = user_id);

-- Only visible to people who share a chat with this user
-- (avoids leaking online status to strangers)
create policy user_presence_select on public.user_presence
  for select using (
    exists (
      select 1 from public.chats
      where (participant_1 = auth.uid() and participant_2 = user_presence.user_id)
         or (participant_2 = auth.uid() and participant_1 = user_presence.user_id)
    )
  );

alter publication supabase_realtime add table public.user_presence;
