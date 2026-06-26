---
quick_id: 260626-fq3
slug: convert-locked-re-summit-opt-in-sketch-0
date: 2026-06-26
status: complete
commit: 7e2fa5b
---

# Quick Task 260626-fq3 — SUMMARY

## What shipped
The locked RE Summit opt-in design (sketch 005, winner **V2** inline 10-min hold) is now a
production, paste-ready GHL Custom Code block:

**`funnels/03-re-summit/steps/01-optin/blocks/01-optin.html`** — single self-contained full-page block.

## How it was built
Transformed `.planning/sketches/005-summit-optin-10min-hold/index.html` (V2 view) into a GHL block:
- Stripped sketch scaffolding (`<!doctype>/<html>/<head>/<body>`, variant tabs, toolbar, `#frame`, `setV()`).
- **V2 only:** removed the V1 "how it works" band and the V3 hero stepper; the `seathold` chips
  ("⏱ Held 10 min") and the `cta-reassure` card are now always-on (dropped the `data-v` conditionals).
- **Scoped** every rule under `#gcre-summit-optin` (collision-safe in GHL); no `<body>` styling.
- Kept Google Fonts (Inter + Bodoni upright), light/airy tokens, Wistia hero video, proof band
  (count-up), tickets comparison table, what-you'll-learn, Meet Grant, final CTA, footer.
- Script: IIFE + re-entry guard (`window.__gcreSummitOptin`); GHL host-wrapper escape;
  tier selection; smooth-scroll; count-up.
- **CTAs are real `<a>`:** hero + final RSVP + "see options" → in-page `#gcre-tickets`;
  the ticket-section RSVP → `CHECKOUT_URL` config constant, JS appends `?tier=<selected>`.
- **Image placeholders with graceful fallbacks:** `PASTE_TICKET_VIRTUAL_URL`,
  `PASTE_TICKET_EXECUTIVE_URL`, `PASTE_TICKET_VIP_URL` (→ labeled `.tkph` placeholder on error),
  `PASTE_GRANT_PHOTO_URL` (→ dark portrait placeholder).
- **No countdown on Page 1** (ROADMAP) — the 10-min hold is a stated mechanic; the live timer is Page 2.

## Verified
Chrome DevTools render of the block (placeholders substituted): **desktop 1280 + mobile 390**.
- V2-only layout confirmed (no band, no stepper); seat-hold chips + reassurance card render.
- Wistia video loads; proof-band count-up fires; tickets → stacked cards on mobile.
- Grant photo placeholder fallback renders when the URL is unset.

## Setup needed before go-live (placeholders intentionally left)
- `PASTE_CHECKOUT_URL` — the Page 2 checkout URL (ticket CTA target).
- Upload the 3 ticket badges + a Grant photo to GHL gallery; replace the 4 `PASTE_*_URL`s.
- Confirm real per-tier prices ($297/$497/$2,497 carried from sketch 001; Virtual @ $297 collides with the $297 RESS).

## Not done (intentional / out of scope)
- Page 2 (checkout, live 10-min countdown) and Page 3 (thank-you) — next tasks.
- Real prices / checkout URL / Grant photo (placeholders, backfilled later).
