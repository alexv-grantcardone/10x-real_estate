---
gsd_quick_id: 260630-jmm
slug: create-relt-optin-scratch-split-test-var
date: 2026-06-30
status: complete
commit: ad5842e
---

# Summary: RELT Optin-Scratch split-test variation

**Status:** complete ✓
**Commit:** ad5842e

## What shipped

`funnels/01-live-training/steps/01-optin/blocks/01-hero--scratch.html` — variant
B of the RELT opt-in hero, for split testing against the control
(`01-hero.html`). Created by copying the control byte-for-byte and changing only
the hero headline + subheadline (plus a header comment labeling the variation).

`diff` against control = exactly 3 hunks: header comment, `<h1>`, `<p>`.

### Copy changes (desktop + mobile, single responsive markup)

| Element | Control | Variation B (Scratch) |
|---|---|---|
| Headline | "I'm Changing My Real Estate Strategy RIGHT NOW." | "How to Get Into Real Estate—Even If You're Starting From Scratch" |
| Subheadline | "On July 11th I'll be showing you how the Gov. is making it easier…" | "Join Grant Cardone live and discover the exact blueprint behind $5.5B in real estate assets—including how to find deals, fund them, and close your first investment without years of trial and error." |

### Design treatment
- `<strong>` bold-white on `Real Estate`, `<em>` cyan Bodoni-italic on `Starting From Scratch`.
- Subhead: `.a` cyan lead + `.b` body; `$5.5B` on one line.
- Orphan-safe: `&nbsp;` ties on key phrases, explicit `<br>`, `text-wrap:balance`/`pretty`.

## Flags / follow-ups
- ⚠️ **$5.5B vs $5.3B:** variation copy says $5.5B; control page stats + testimonial say $5.3B (control corrected $5.5B→$5.3B in task 260630-dxw). Used $5.5B verbatim as requested — figure is inconsistent with the rest of the page. Confirm with Alex/Cherlon before go-live.
- Live Chrome DevTools preview was blocked by an already-running browser instance; headline verified structurally, not visually rendered.
- **GHL wiring:** create the variant page in GHL as "RELT Optin-Scratch", paste this block, and set up the A/B split against the control page. Same native GHL Form requirement in-section as the control.

## Verification
- [x] Variation file present beside control
- [x] diff isolated to header comment + headline + subheadline
- [x] Copy matches request verbatim
- [x] Committed atomically (ad5842e)
