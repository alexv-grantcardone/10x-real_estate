---
sketch: 007
name: summit-checkout-seatmap
question: "On the C split-layout checkout, how should the interactive arena seating map be placed — replacing the ticket image (C1) vs as its own animated band (C2)?"
winner: null
tags: [re-summit, checkout, page2, seating-map, interactive]
funnel: RE Summit (funnel 03) — checkout / Page 2
---

# Sketch 007: RE Summit Checkout — interactive seating map (C1 / C2)

Builds on sketch 006 **C (split layout)**. Adds the **interactive arena seating map** + the
locked elevation choices. Two map placements to compare.

## The arena map (placeholder — real art TBD)
SVG, top-down theater: **STAGE** at front → 3 fanned sections **VIP** (closest) → **EXECUTIVE**
(center) → **VIRTUAL** (back). The buyer's section is filled cyan + **pulsing**; the others are
muted and **clickable to switch tiers** (updates price, order summary, BUY). Reflects `?tier=` from Page 1.

> Flagged: "Virtual" as a *physical back section* is unusual (virtual usually = remote stream) —
> reconcile when the real map art arrives (literal back section vs. VIP/Exec-only map).

## The two placements
- **C1 · Map replaces the ticket image** — the arena map is the order-summary's visual anchor (compact, left of the order info).
- **C2 · Map as its own animated band** — a dedicated map card under the order summary: larger map, pulsing section, legend, and a "you're in {tier} — {seat blurb}" callout.

## Locked elements (this round)
- **Timer expiry** → at 0:00, **disable the BUY button** ("HOLD EXPIRED") + reveal recovery links ("Reserve again" / "Talk to a specialist"); resbar flips to expired. No auto-redirect.
- **Elevation:** guarantee badge (risk-free / refund — terms TBD), payment + security trust row (lock + card logos), and a "what happens next" 3-step block.
- Single primary **BUY** CTA + tiny "talk to a specialist" link. Live 10-min countdown (urgent red < 2:00).

## How to View
`open .planning/sketches/007-summit-checkout-seatmap/index.html` (tabs C1/C2).
Click sections on the map to switch tiers; toolbar **Jump to 0:20** to see expiry disable the BUY; `?tier=vip` to preset.

## Open / pending
- Real seating-map graphics/components (user supplying) — this SVG is a placeholder for layout + interaction.
- Reconcile "Virtual" section meaning. Value-stack bonuses (from 006-B) still parked pending Rosa.
- Real prices / checkout + booking URLs / guarantee terms.

## Verification note
Chrome render-check skipped (DevTools session profile-locked this round); the artifact runs the
live map interaction + countdown client-side. Re-verify in Chrome before promoting to a GHL block.
