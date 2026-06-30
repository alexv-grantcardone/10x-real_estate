---
gsd_quick_id: 260630-jmm
slug: create-relt-optin-scratch-split-test-var
date: 2026-06-30
---

# Quick Task: RELT Opt-in "Scratch" split-test variation

## Description

Create a split-test variation page ("variant B") of the RELT (Live Training)
opt-in hero block to run against the current control. The test isolates the
**headline + subheadline** — nothing else changes — so any lift is attributable
to the copy.

Variation name (GHL page name): **RELT Optin-Scratch**

## Scope

- **Base / control:** `funnels/01-live-training/steps/01-optin/blocks/01-hero.html`
- **New file:** `funnels/01-live-training/steps/01-optin/blocks/01-hero--scratch.html`
- Byte-for-byte copy of the control with ONLY two copy blocks swapped + a header
  comment labeling it as the variation. Form-teleport logic, countdown, stats,
  marquee, testimonial, footer, and all CSS are untouched.

### New copy (applies to desktop AND mobile — single responsive markup)

- **Headline:** "How to Get Into Real Estate—Even If You're Starting From Scratch"
- **Subheadline:** "Join Grant Cardone live and discover the exact blueprint
  behind $5.5B in real estate assets—including how to find deals, fund them, and
  close your first investment without years of trial and error."

### Design-system treatment

- Headline: bold white accent on `Real Estate` (`<strong>`), cyan Bodoni-italic
  accent on `Starting From Scratch` (`<em>`), matching the control's
  strong+accent rhythm.
- Subheadline: cyan lead (`.a`) on "Join Grant Cardone live", light body (`.b`)
  on the remainder, `$5.5B` held on one line.
- No-orphan rule honored: `Real&nbsp;Estate` and `Starting&nbsp;From&nbsp;Scratch`
  kept intact, explicit `<br>`, `text-wrap:balance` on `<h1>` and `text-wrap:pretty`
  on `<p>` so neither desktop nor mobile drops a lone word.

## Notes / flags

- ⚠️ Copy says **$5.5B**, but the control page's stats bar + testimonial say
  **$5.3B** (the control deliberately corrected $5.5B → $5.3B, per task 260630-dxw).
  Used $5.5B exactly as requested; figure is inconsistent with the rest of the page.
- Live browser preview (Chrome DevTools) was blocked by an already-running browser
  instance; headline verified by structural analysis instead.

## Acceptance

- [x] New variation file exists alongside the control
- [x] `diff` shows ONLY the header comment + `<h1>` + `<p>` changed
- [x] Headline + subheadline match requested copy verbatim
- [x] Orphan-safe markup for desktop + mobile
