---
quick_id: 260630-dxw
title: Add RELT opt-in page (latest version) with $5.3B figure
status: complete
date: 2026-06-30
---

# Quick Task 260630-dxw: Add RELT opt-in page with $5.3B figure

## Description

Add the Real Estate Live Training (RELT) opt-in page — the latest version
supplied by Alex — as the GHL paste-ready code block for funnel 01, step 01
(optin). Apply the only content change vs. the supplied source: the
`$5.5B` figure becomes `$5.3B`.

## Task

1. **Create** `funnels/01-live-training/steps/01-optin/blocks/01-hero.html`
   with the supplied single-element GHL custom-code block (HERO → STATS →
   MARQUEE → SIGNUP → TESTIMONIAL → FOOTER + native-form skin/teleport script).
   - **files:** `funnels/01-live-training/steps/01-optin/blocks/01-hero.html`
   - **action:** write the full self-contained block, inlined CSS + JS, no build step
   - **verify:** `$5.5B` appears nowhere; `$5.3B` appears in the stats cell
     (`BUILT ON THIS SYSTEM`) and the testimonial (`it became $5.3B in assets`);
     the separate `$5.5M in 90 days` testimonial figure is unchanged; SVG
     checkmark path coords (`L5.5 11`) untouched.
   - **done:** file exists, GHL-paste-ready, figures correct.

## Notes

- Two `$5.5B` → `$5.3B` substitutions; `$5.5M` deliberately preserved.
- The optin `blocks/` folder previously held only `.gitkeep`; this is the
  first committed page for this step.
