-- Open Time: run this once in Supabase → SQL Editor → New query → Run.
-- It creates one private row per account and locks it so only that account can read or change it.

create table if not exists public.open_time_state (
  user_id    uuid primary key references auth.users (id) on delete cascade,
  data       jsonb not null,
  updated_at timestamptz not null default now()
);

alter table public.open_time_state enable row level security;

-- Only signed-in accounts can reach this table (signed-out visitors get nothing),
-- and the rules below narrow that to each account's own row.
revoke all on public.open_time_state from anon;
grant select, insert, update on public.open_time_state to authenticated;

drop policy if exists "read own"   on public.open_time_state;
drop policy if exists "insert own" on public.open_time_state;
drop policy if exists "update own" on public.open_time_state;

create policy "read own"   on public.open_time_state for select using (auth.uid() = user_id);
create policy "insert own" on public.open_time_state for insert with check (auth.uid() = user_id);
create policy "update own" on public.open_time_state for update using (auth.uid() = user_id) with check (auth.uid() = user_id);
