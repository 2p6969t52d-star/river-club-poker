create table if not exists public.river_poker_rooms (
  id uuid primary key default gen_random_uuid(),
  room_code text not null unique check (room_code ~ '^[A-Z0-9]{6}$'),
  state jsonb not null default '{}'::jsonb,
  version bigint not null default 0,
  player1_token_hash text,
  player2_token_hash text,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now(),
  expires_at timestamptz not null default now() + interval '24 hours'
);
create index if not exists river_poker_rooms_expires_idx on public.river_poker_rooms (expires_at);
alter table public.river_poker_rooms enable row level security;
revoke all on table public.river_poker_rooms from anon, authenticated;
