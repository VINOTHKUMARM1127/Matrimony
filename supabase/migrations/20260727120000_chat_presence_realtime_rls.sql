-- Add SELECT RLS policy for chat_presence so participants can view each other's presence
create policy chat_presence_select on public.chat_presence
  for select using (
    exists (
      select 1 from public.chats
      where id = chat_presence.chat_id
        and (participant_1 = auth.uid() or participant_2 = auth.uid())
    )
  );

-- Add chat_presence to supabase_realtime publication so presence updates push live to clients
alter publication supabase_realtime add table public.chat_presence;
