-- ============================================================================
-- Layer B — Shared Team Memory (the "team brain")
-- ============================================================================
-- Supabase project_ref: frfifrjwobobhcbuhbni  (see ../.mcp.json)
-- Accessed by Alex AND Cherlon through the Supabase MCP. NOT claude-mem.
-- claude-mem (Layer C) is per-machine/personal and does NOT sync here.
--
-- This file is the source-of-truth DDL (Layer A = git). It is already applied
-- to the live project via MCP migrations. Re-running it is safe-ish but review
-- first — the table create is not idempotent.
--
-- Usage from any session with the Supabase MCP connected:
--   save:   select * from remember('the fact', 'alex', array['ghl','optin'], 'session');
--   recall: select * from recall('ghl code block gotcha', 10);
-- ============================================================================

create extension if not exists vector;
create extension if not exists pg_trgm;

create table public.memories (
  id          uuid primary key default gen_random_uuid(),
  content     text not null,
  author      text not null default 'unknown',         -- 'alex' | 'cherlon' | etc.
  tags        text[] not null default '{}',            -- e.g. {ghl, conversion, optin}
  source      text,                                     -- funnel name / 'session' / 'manual'
  embedding   vector(1536),                             -- reserved for semantic upgrade (nullable)
  fts         tsvector generated always as (to_tsvector('english', content)) stored,
  created_at  timestamptz not null default now()
);

create index memories_fts_idx     on public.memories using gin (fts);
create index memories_trgm_idx    on public.memories using gin (content gin_trgm_ops);
create index memories_tags_idx    on public.memories using gin (tags);
create index memories_created_idx on public.memories (created_at desc);

-- Locked to the public REST API; the MCP connection (elevated) keeps full access.
alter table public.memories enable row level security;

-- ---------------------------------------------------------------------------
-- Helpers — identical simple interface for both teammates
-- ---------------------------------------------------------------------------
create or replace function public.remember(
  p_content text,
  p_author  text default 'unknown',
  p_tags    text[] default '{}',
  p_source  text default null
)
returns public.memories
language sql
security definer
set search_path = public
as $$
  insert into public.memories (content, author, tags, source)
  values (p_content, p_author, p_tags, p_source)
  returning *;
$$;

create or replace function public.recall(
  p_query text,
  p_limit int default 10
)
returns table (
  id uuid, content text, author text, tags text[],
  source text, created_at timestamptz, rank real
)
language sql
stable
security definer
set search_path = public
as $$
  select
    m.id, m.content, m.author, m.tags, m.source, m.created_at,
    (ts_rank(m.fts, websearch_to_tsquery('english', p_query))
     + similarity(m.content, p_query))::real as rank
  from public.memories m
  where m.fts @@ websearch_to_tsquery('english', p_query)
     or m.content % p_query
  order by rank desc, m.created_at desc
  limit p_limit;
$$;

-- Lock helpers to the MCP/elevated connection only (not the public REST API).
revoke execute on function public.remember(text, text, text[], text) from public, anon, authenticated;
revoke execute on function public.recall(text, int)                  from public, anon, authenticated;
