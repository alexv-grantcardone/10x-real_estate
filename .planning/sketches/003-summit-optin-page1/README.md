---
sketch: 003
name: summit-optin-page1
question: "How does the full RE Summit opt-in (Page 1) read top-to-bottom, composed in the light/airy system around the locked ticket section?"
winner: "full-page (single composition)"
tags: [re-summit, optin, page1, light-theme, full-page]
funnel: RE Summit (funnel 03) — opt-in / Page 1
---

# Sketch 003: RE Summit Opt-in — Page 1 (full composition)

## Design Question
Compose the whole Summit opt-in page top-to-bottom in the locked **light/airy** palette,
built around the **locked ticket section** (sketch 001, comparison-table variant C).

## How to View
`open .planning/sketches/003-summit-optin-page1/index.html`
(Images reference `../001-ticket-section/assets/`. Resize the real browser for mobile.)

## Section flow (top → bottom)
1. **Hero** — Headline D ("Stop Watching Other People *Get Rich* In Real Estate"), VOC subcopy, event meta (Miami · Jul 27–28 2026), **RSVP MY SEAT** CTA, floating Executive ticket badge.
2. **Proof band** (navy) — $4B+ portfolio · 2 Days · 3 Tiers · Miami, count-up on scroll (no static-zero bug).
3. **What you'll learn** — 6 VOC benefit cards (find deals, raise capital with none of your own, underwrite, markets, partners, scale).
4. **Meet Grant** — short credibility quote + portrait slot.
5. **Tickets** — the LOCKED comparison table (variant C) with the 3 ticket badges, per-tier reserve, default Executive; → **RSVP MY SEAT**.
6. **Final CTA** — "Your seat is waiting." → RSVP.
7. **Footer** — GC nav + disclaimer.

## Decisions baked in
- **Light/airy** palette + Inter + **Bodoni upright** accent (no italics); no word "FREE".
- **No countdown / artificial scarcity on Page 1** (ROADMAP rule — the 10-min hold timer lives on Page 2 checkout).
- RSVP model: reserve now (no payment) → checkout (Page 2) confirms. CTAs are real `<a href="#checkout">` (set CHECKOUT_URL per-CTA when built as a GHL block).
- Verified desktop (1280) + mobile (390) in Chrome DevTools; headline balances, no orphans, table → stacked cards on mobile.

## Open items (confirm before build)
- **Ticket prices** $297 / $497 / $2,497 are placeholders carried from sketch 001 — confirm real per-tier prices (README says "to confirm"; note Virtual @ $297 collides with the RESS price).
- **Grant portrait** image for Meet-Grant section (slot is a placeholder).
- **CHECKOUT_URL** (Page 2) for the RSVP CTAs.
- Minor polish: hero "3 tiers" tag slightly overlaps the "EXECUTIVE" word on the badge.
- Section map was never formally locked — this is the proposed structure; sections can be added/reordered.
