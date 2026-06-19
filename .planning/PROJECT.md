# 10x Real Estate — GHL Design System

## What This Is

A shared **design system** for the Grant Cardone Real Estate funnel vertical, delivered as
**self-contained GoHighLevel paste-ready inline code blocks** (HTML + inline CSS + vanilla JS,
no build step, no framework). It gives all three RE funnels (Live Training / RELT, RESS, RE
Summit) one consistent, premium look — dark-navy base, teal/cyan accent, script-italic accent
font — built from a reusable component library at the repo root. First application: the **RE
Summit opt-in** page.

## Core Value

One governed, paste-ready component library that makes every RE funnel page look consistent and
convert — themed in one place, re-skinnable per funnel, working the instant it's pasted into GHL.

## Requirements

### Validated

(None yet — ship to validate)

### Active

- [ ] Shared **Foundation** (CSS-variable tokens + embedded script font + scoped reset + utilities) installable once per GHL page
- [ ] **Hybrid theming**: page-level Foundation + per-block fallback tokens; `gcre-` prefix; two-layer (palette + semantic) tokens
- [ ] Reusable **component library**: section-heading, button, hero, benefits-grid, stats-proof, testimonial, bio, pricing-tiers, faq-accordion, footer
- [ ] **RE Summit opt-in** composed from the system end-to-end (existing hero migrated `gcres-`→`gcre-`)
- [ ] **Render-verification** flow: Chrome DevTools MCP + gitignored `.preview/` harness (with-foundation AND bare), desktop + mobile
- [ ] **GHL reality confirmed**: page-header custom CSS / `@font-face` / `<script>` survive on the published page (Phase 0 spike), recorded in `knowledge/ghl-notes.md`

### Out of Scope

- **RELT (Live Training) + RESS application** — later milestone. This milestone is the system + RE Summit opt-in only.
- **Standalone websites / non-GHL hosting / databases for delivery** — `CLAUDE.md` §3 hard constraint.
- **Build step / framework / bundler** — every deliverable must be GHL paste-ready as-is.

## Context

- Existing repo of GHL funnels (`funnels/01-live-training`, `02-ress-offer`, `03-re-summit`) + `knowledge/` brain. Only one block built so far (`03-re-summit/.../01-hero.html`), which redeclares its own tokens with a Summit-specific `gcres-` prefix — the consistency problem this milestone solves.
- Design direction from **V2 RELT landing renderings** (`~/Downloads/RELT Landing Page_V2-0{1,2,3}.jpg`): dark navy, teal/cyan accent, script-italic accent words, stats bar, countdown, signup form, "what you leave with" checklist, testimonial, footer.
- Full design spec: `/Users/avelazquez/.claude/plans/were-a-bit-far-majestic-bonbon.md` (approved).
- Build quality gated by the `design-taste-frontend` / `artifact-design` skill ("premium, not templated").

## Constraints

- **Platform**: GoHighLevel only. Self-contained paste-ready blocks; no build/framework/bundler (`CLAUDE.md` §3).
- **Sharing**: hybrid — page-level Foundation + per-block fallback tokens (robust to GHL stripping header CSS, an unverified risk).
- **Brand**: navy + teal + script-italic accent, Gotham body (inherited). Token *values* proposed pending Paige; token *structure* final. Script font = license-clean OFL, embedded self-contained, swappable.
- **Verification**: Chrome DevTools MCP + `.preview/` harness, desktop + mobile, in foundation-present and bare states.

## Key Decisions

| Decision | Rationale | Outcome |
|----------|-----------|---------|
| Run this build through GSD | User chose the full structured workflow | — Pending |
| Apply the system to RE Summit opt-in FIRST (before RELT/RESS) | Fastest proof on an in-progress funnel; RELT/RESS propagate later | — Pending |
| Pick a license-clean OFL script accent font now, embed self-contained | Unblocks the V2 look without waiting on Paige; swappable later | — Pending |
| Hybrid sharing (Foundation + per-block fallback tokens) | DRY on the happy path, survives GHL stripping header CSS / isolated paste | — Pending |
| Rename `gcres-` → `gcre-` (vertical-wide prefix) | System spans all RE funnels, not just Summit; one block migrates | — Pending |

## Evolution

This document evolves at phase transitions and milestone boundaries.

**After each phase transition** (via `/gsd-transition`):
1. Requirements invalidated? → Move to Out of Scope with reason
2. Requirements validated? → Move to Validated with phase reference
3. New requirements emerged? → Add to Active
4. Decisions to log? → Add to Key Decisions
5. "What This Is" still accurate? → Update if drifted

**After each milestone** (via `/gsd-complete-milestone`):
1. Full review of all sections
2. Core Value check — still the right priority?
3. Audit Out of Scope — reasons still valid?
4. Update Context with current state

---
*Last updated: 2026-06-19 after initialization*
