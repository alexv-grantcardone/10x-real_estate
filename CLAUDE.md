# 10x Real Estate — Funnel System

This repository is the shared codebase and knowledge base for the marketing
funnels we run for **Grant Cardone** real estate. Every funnel lives here,
organized by folder. This file is the operating brain for anyone (human or
Claude) working in this repo — **read it first, every session.**

---

## 1. Who we are

| Person | Role | Responsibility |
|---|---|---|
| **Alex Velazquez** | Digital Marketing Manager | Owns the system, traffic, strategy, and this repo. |
| **Cherlon** | Head of Conversion Funnels Specialist | Owns funnel build quality — funnels must look incredible and convert. |
| **Paige** | Brand/Design | Will deliver the brand guidelines (not yet written down — see §6). |

This repo is shared primarily between **Alex and Cherlon**, possibly others later.

---

## 2. Mission

**Increase conversions — more leads and more sales — for Grant Cardone real estate funnels.**

Every decision in this repo is judged against that single metric. If a change
doesn't plausibly improve lead capture or sales conversion, it's not a priority.

---

## 3. Hard constraints (read carefully — this shapes everything)

- ✅ **We build inside GoHighLevel (GHL).** All funnels, pages, and traffic routing live in our GHL account. GHL is the platform of record.
- ✅ **Our leverage is GHL custom code blocks.** GHL lets us drop a **code block** into a page and paste in HTML/CSS/JS. That is how everything in this repo gets used: we write self-contained code snippets here, then paste them into the matching GHL element.
- 🚫 **We do NOT build standalone websites.** No Vercel, no Supabase, no Next.js apps, no external hosting, no databases. Even though those tools are available in this environment, **do not use them.** If a task seems to need them, stop and propose a GHL-native approach instead.
- 🧩 **Therefore every deliverable must be GHL-paste-ready:** a self-contained block with **inlined CSS and JS**, no external build step, no framework, no imports from a bundler. Assume it will be pasted into a GHL custom-code/HTML element and must work as-is.

---

## 4. Repository organization

**One folder per funnel.** Each funnel folder is self-contained.

Current folders (funnel stages / funnels — confirm grouping with Alex/Cherlon):
```
1. optin/                    opt-in / lead capture
2. vip - home study manual/  VIP home study manual offer
3. re masterclass/           real estate masterclass
4. neg and closing /         negotiation & closing   (note: trailing space in name — candidate to rename)
```

Recommended structure inside each funnel folder:
```
<funnel-name>/
  README.md          what this funnel does, the offer, target audience, where it lives in GHL
  blocks/            the GHL-paste-ready code snippets (one file per block)
  assets/            reference images / copy (not pasted into GHL directly)
  notes.md           funnel-specific learnings, test results, GHL page URLs
```

Naming: keep folder names lowercase, hyphenated, no trailing spaces (e.g. `optin`, `re-masterclass`, `neg-and-closing`).

---

## 5. The Memory System  ⭐ (this is how the repo gets smarter over time)

We run a **layered** memory system. Each layer has a clear job:

| Layer | Scope | Job | Status |
|---|---|---|---|
| **A. `/knowledge/` (git)** | Shared, versioned | Durable source of truth — curated facts, playbook, decisions. Syncs to everyone via `git pull`. | ✅ live |
| **B. Supabase shared memory** | Shared, live | Ever-growing team brain. Both Alex & Cherlon store + recall via the Supabase MCP — no git commits. Table `public.memories` + `remember()`/`recall()` helpers. | ✅ live |
| **C. claude-mem** | Per-machine, personal | Automatic session capture/compression on each person's own machine. **Does NOT sync between people via Supabase** — its only cross-machine sharing is a remote Chroma backend (`CLAUDE_MEM_CHROMA_*`), which we are *not* using. Treat it as a personal booster only. | ✅ installed (local) |

**Source of truth = Layer A (git).** If anything ever conflicts, the committed
`/knowledge/` files win. Layer B is for fast, live shared recall; Layer C is
each person's private autopilot.

> **How to use Layer B (the shared brain), via the Supabase MCP:**
>
> **Who am I? (author stamping).** The MCP connection is the same for everyone, so the
> DB can't tell Alex from Cherlon — identity is stamped by the session. Each machine has
> a **gitignored `.author` file** at the repo root (`alex` here, `cherlon` on Cherlon's
> machine). **At the start of a session, read `.author`** and use its value as the author
> on every `remember()` call. If `.author` is missing, ask the user once, then create it.
>
> - **Save:** `select * from remember('the fact', '<author from .author>', array['tag1','tag2'], 'source');`
> - **Recall everyone (default):** `select * from recall('what you''re looking for', 10);`
> - **Recall one teammate:** `select * from recall('...', 10, 'cherlon');`
> - **Who has logged what:** `select * from memory_counts;`
>
> Every recall result carries an `author` column, so sessions always see the **whole**
> team brain (Alex + Cherlon) but can sort/filter by person cleanly. Author is normalized
> to lowercase on write so `Alex`/`alex` never split.
>
> Backed by Postgres full-text + trigram search today (no embeddings needed). The
> `memories.embedding` column is reserved for a future semantic upgrade (would require
> an embedding provider — e.g. Voyage/OpenAI via an edge function; Anthropic has no
> embeddings API). The `remember()`/`recall()` functions are locked to the MCP
> connection only — not exposed on the public REST API.

### Protocol — follow this every session

1. **At the start** of any work: read this `CLAUDE.md` and skim **everything in `/knowledge/`** so you have current context.
2. **While working:** apply what's in `/knowledge/conversion-playbook.md` and `/knowledge/ghl-notes.md`.
3. **At the end** of any session where you learned something that should persist — a test result, a winning variant, a GHL gotcha, a new funnel, a client/offer detail — **append it to the right file in `/knowledge/`**, add a dated entry, then **commit and push.** That is what makes the memory "ever-building."
4. Keep entries short, dated (`YYYY-MM-DD`), and factual. Prefer appending over rewriting so history is preserved.

> If you're Claude: treat updating `/knowledge/` at the end of meaningful work as a
> required step, not optional. Commit it so the next person/machine inherits it.

### Knowledge files
- `knowledge/00-context.md` — business, team, offers, accounts (the "who/what")
- `knowledge/conversion-playbook.md` — CRO principles + a running log of what worked/failed
- `knowledge/ghl-notes.md` — GoHighLevel specifics & the code-block embed pattern
- `knowledge/brand.md` — brand/design guidelines (currently: blues; full guide pending from Paige)

---

## 6. Brand direction

- Until Paige delivers the official guidelines, the only firm rule is: **lean on blues** as the primary palette.
- Don't hardcode a full design language yet. Keep code blocks easy to re-theme (use CSS variables for colors) so we can drop in the real palette later without rewrites.
- When Paige's guidelines arrive, capture them in `knowledge/brand.md` and update this section.

---

## 7. Working conventions

- **Branch** off `main` for non-trivial changes and open a PR; small content edits can go straight to `main` while it's just the two of us.
- Every funnel folder gets a `README.md` describing the offer and its GHL location.
- Never commit secrets. Tokens live only in each person's shell env (see `SETUP.md`).
- Keep code blocks self-contained and GHL-paste-ready (§3).

---

## 8. Setup / onboarding

New machine or new teammate? See **`SETUP.md`** for cloning and GitHub authentication.

---

## 9. GSD (getshitdone) — active build workflow

This repo runs an active GSD project (`.planning/`). The sections below are **GSD-managed**
(updated in place via the `<!-- GSD:* -->` markers) — edit project facts above, not inside the markers.

<!-- GSD:project-start source:PROJECT.md -->

### Project

**10x Real Estate — GHL Design System**

A shared **design system** for the Grant Cardone Real Estate funnel vertical, delivered as
**self-contained GoHighLevel paste-ready inline code blocks** (HTML + inline CSS + vanilla JS,
no build step, no framework). It gives all three RE funnels (Live Training / RELT, RESS, RE
Summit) one consistent, premium look — dark-navy base, teal/cyan accent, script-italic accent
font — built from a reusable component library at the repo root. First application: the **RE
Summit opt-in** page.

**Core Value:** One governed, paste-ready component library that makes every RE funnel page look consistent and
convert — themed in one place, re-skinnable per funnel, working the instant it's pasted into GHL.

#### Constraints

- **Platform**: GoHighLevel only. Self-contained paste-ready blocks; no build/framework/bundler (`CLAUDE.md` §3).
- **Sharing**: hybrid — page-level Foundation + per-block fallback tokens (robust to GHL stripping header CSS, an unverified risk).
- **Brand**: navy + teal + script-italic accent, Gotham body (inherited). Token *values* proposed pending Paige; token *structure* final. Script font = license-clean OFL, embedded self-contained, swappable.
- **Verification**: Chrome DevTools MCP + `.preview/` harness, desktop + mobile, in foundation-present and bare states.

<!-- GSD:project-end -->

<!-- GSD:workflow-start source:GSD defaults -->

### GSD Workflow Enforcement

Before using Edit, Write, or other file-changing tools, start work through a GSD command so planning artifacts and execution context stay in sync.

Use these entry points:

- `/gsd-quick` for small fixes, doc updates, and ad-hoc tasks
- `/gsd-debug` for investigation and bug fixing
- `/gsd-execute-phase` for planned phase work

Do not make direct repo edits outside a GSD workflow unless the user explicitly asks to bypass it.
<!-- GSD:workflow-end -->
