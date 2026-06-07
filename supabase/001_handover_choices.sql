-- Supabase setup for house handover choices.
-- Run this in Supabase SQL Editor.

create extension if not exists pgcrypto;

create table if not exists public.handover_choices (
  id uuid primary key default gen_random_uuid(),
  handover_code text not null,
  item_id integer not null,
  decision text not null check (decision in ('leave', 'remove')),
  buyer_comment text not null default '',
  updated_at timestamptz not null default now(),
  unique (handover_code, item_id)
);

create index if not exists idx_handover_choices_code
  on public.handover_choices (handover_code);

create or replace function public.current_handover_code()
returns text
language sql
stable
as $$
  select coalesce(
    lower((current_setting('request.headers', true)::json ->> 'x-handover-code')),
    ''
  );
$$;

alter table public.handover_choices enable row level security;

-- Remove old policies if script is re-run.
drop policy if exists "handover_choices_select" on public.handover_choices;
drop policy if exists "handover_choices_insert" on public.handover_choices;
drop policy if exists "handover_choices_update" on public.handover_choices;

create policy "handover_choices_select"
on public.handover_choices
for select
using (
  handover_code = public.current_handover_code()
);

create policy "handover_choices_insert"
on public.handover_choices
for insert
with check (
  handover_code = public.current_handover_code()
);

create policy "handover_choices_update"
on public.handover_choices
for update
using (
  handover_code = public.current_handover_code()
)
with check (
  handover_code = public.current_handover_code()
);

-- Optional: remove rows for old handover rounds manually when done.
-- delete from public.handover_choices where handover_code = '<old-code>';
