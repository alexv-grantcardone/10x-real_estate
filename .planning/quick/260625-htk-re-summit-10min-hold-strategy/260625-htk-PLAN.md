---
quick_id: 260625-htk
slug: re-summit-10min-hold-strategy
description: "Update RE Summit RSVP funnel strategy: 72-hour reservation -> 10-minute Ticketmaster-style hold, across GSD planning artifacts + memory"
date: 2026-06-25
mode: quick
status: planned
---

# Quick Task 260625-htk — RE Summit: 72h reservation → 10-min Ticketmaster-style hold

## Goal

Propagate a strategy pivot across all GSD planning artifacts (and, separately, memory):
the RE Summit "RSVP MY SEAT" funnel no longer holds a seat for **72 hours**. It now holds
the seat for **10 minutes**, Ticketmaster-style, with a live 10-minute countdown on the
checkout page (Page 2) and a rewritten email strategy.

## Locked decisions (from Alex, 2026-06-25)

1. **Hold window:** 72 hours → **10 minutes** (Ticketmaster-style reservation hold).
2. **Page 2 (checkout):** live **10-minute countdown timer**. CONTINGENT on Rosa:
   - *If* an offer/value stack is used → items **visibly drop off the stack** as the 10 min
     counts down (a decaying stack the user can watch shrink).
   - *If* no stack lands → leave a **plain 10-minute countdown**, nothing else.
   - (The value stack is already "parked pending Rosa" — record BOTH branches, decide later.)
3. **Email strategy** (replaces the old "72h sequence spec"):
   - **T+0 immediate email:** reservation is **ACTIVE FOR 10 MINUTES** — "secure your seat
     now," **not guaranteed a seat** if not secured in time. Links straight to the Page 2
     checkout with the live timer.
   - **After the 10 min lapses** without checkout → seat released → a **recovery email
     SERIES** driving the lead to the **BOOKING PAGE** (talk to a specialist). The booking
     page already loops "just buy" back to the checkout.
4. The 10-min checkout timer is a **REAL reservation hold on Page 2** and does **NOT**
   conflict with ROADMAP.md:58 (which bans artificial / paid-ad-style countdowns on the
   **Page-1 opt-in**). Record the distinction; do **not** edit ROADMAP.md:58.

## Scope

- **In-repo (this executor):** `.planning/HANDOFF.json`, `.planning/sketches/.continue-here.md`,
  `.planning/sketches/MANIFEST.md`.
- **Out-of-repo (orchestrator handles separately, NOT this executor):** auto-memory files at
  `~/.claude/.../memory/` and the Supabase shared-memory `remember()` call.
- **Do NOT** build any GHL code blocks. Docs/strategy only. Sketches stay paused.
- **Do NOT** edit `ROADMAP.md`.

## Tasks

### Task 1 — Update `.planning/HANDOFF.json`
- **files:** `.planning/HANDOFF.json`
- **action:**
  - `remaining_tasks` id 8 (Page 2 sketch): change "countdown" → "live **10-minute**
    countdown"; note the contingent decaying value-stack (if stack lands) vs plain countdown.
  - `remaining_tasks` id 9: rewrite name from "Email/automation 72h sequence spec" to
    "Email/automation spec — T+0 immediate '10-minute hold' email → checkout; post-lapse
    recovery email SERIES → booking page".
  - Append a new entry to `decisions[]`:
    `{"decision": "Reservation hold = 10 minutes (Ticketmaster-style), not 72 hours; live
    10-min countdown on Page 2 checkout; value stack (if used per Rosa) visibly decays over
    the 10 min, else plain countdown", "rationale": "Alex 2026-06-25 — urgency/scarcity of a
    real short hold converts better than a multi-day window; mirrors Ticketmaster"}`.
  - Append a second `decisions[]` entry:
    `{"decision": "Email strategy: T+0 immediate '10-min hold active, secure your seat now,
    not guaranteed after' email linking to Page 2 checkout; after the 10 min lapses, a
    recovery email SERIES drives the lead to the booking page (specialist), which loops
    'just buy' back to checkout", "rationale": "Alex 2026-06-25 — replaces the 72h email
    sequence to match the 10-min hold"}`.
  - In `context_notes`, append: "STRATEGY PIVOT 2026-06-25: 72h reservation replaced by a
    10-minute Ticketmaster-style hold (live 10-min countdown on Page 2). The previously
    published funnel-flow artifact (72h model) is now OUTDATED — re-do when convenient
    (folds into task 11). The 10-min checkout timer is a REAL hold on Page 2 and does NOT
    violate ROADMAP.md:58 (which bans artificial countdowns on the Page-1 opt-in only)."
  - Bump top-level `timestamp` to `2026-06-25` (keep ISO format; use any time value — the
    date is what matters).
- **verify:** `python3 -c "import json; json.load(open('.planning/HANDOFF.json'))"` exits 0
  (valid JSON), and `grep -c '72h\|72 hours\|72-hour' .planning/HANDOFF.json` returns 0.
- **done:** HANDOFF.json is valid JSON, contains the two new decisions, the rewritten task 9,
  the 10-minute task-8 wording, the context_notes pivot note, and no "72h/72 hours" remain.

### Task 2 — Update `.planning/sketches/.continue-here.md`
- **files:** `.planning/sketches/.continue-here.md`
- **action:**
  - `completed_work` funnel-flow line: change "RSVP model: no-payment reservation → 72h
    countdown squeeze → buy / book recovery" to "RSVP model: no-payment **10-minute** hold →
    checkout with a **live 10-min countdown** → buy / book recovery". Add: "(flow logic
    updated 2026-06-25; the published navy flow-diagram artifact still shows the old 72h
    model and needs re-doing)".
  - `remaining_work`: the "Page 2 sketch (reservation confirmed: countdown + ...)" line →
    "**live 10-min countdown**"; replace "Email/automation 72h sequence spec." with the new
    two-part email spec (T+0 immediate 10-min hold email → checkout; post-lapse recovery
    SERIES → booking page).
  - `decisions_made`: append a bullet recording the 72h→10-min pivot, the contingent decaying
    stack (pending Rosa), the new email strategy, and the ROADMAP.md:58 non-conflict note.
  - Update frontmatter `last_updated` to `2026-06-25`.
- **verify:** `grep -ci '72h\|72 hour' .planning/sketches/.continue-here.md` returns 0.
- **done:** funnel-flow line, remaining-work email + Page 2 lines, and a new decision bullet
  all reflect the 10-min model; no "72h/72 hour" references remain.

### Task 3 — Update `.planning/sketches/MANIFEST.md`
- **files:** `.planning/sketches/MANIFEST.md`
- **action:** On the copy-rules line (line 4), change the example
  `(use "no payment today" / "held 72 hours")` to
  `(use "no payment today" / "held 10 minutes")`.
- **verify:** `grep -c '72 hours' .planning/sketches/MANIFEST.md` returns 0.
- **done:** MANIFEST line 4 no longer references "72 hours".

## Out of scope for executor (orchestrator does these AFTER)
- Update auto-memory `~/.claude/.../memory/re-summit-rsvp-funnel.md` + MEMORY.md pointer.
- Supabase `remember()` the 10-min model (author = alex).
- These live outside the repo / require MCP — the executor must NOT attempt them.

## Must-haves
- truths: "Hold is 10 minutes, not 72 hours"; "Page 2 has a live 10-min countdown";
  "decaying value stack is contingent on Rosa"; "T+0 email → checkout, post-lapse series →
  booking page"; "10-min checkout timer ≠ banned Page-1 artificial countdown".
- artifacts: HANDOFF.json, .continue-here.md, MANIFEST.md all updated; ROADMAP.md untouched.
- key_links: `.planning/HANDOFF.json`, `.planning/sketches/.continue-here.md`,
  `.planning/sketches/MANIFEST.md`.
