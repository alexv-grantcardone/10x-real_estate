---
sketch: 007
name: summit-checkout-seatmap
question: "On the C split-layout checkout, how should the interactive arena seating map be placed — replacing the ticket image (C1) vs as its own animated band (C2)?"
winner: "C2"
tags: [re-summit, checkout, page2, seating-map, interactive]
funnel: RE Summit (funnel 03) — checkout / Page 2
---

# Sketch 007: RE Summit Checkout — interactive seating map (C1 / C2)

Builds on sketch 006 **C (split layout)**. Adds the **interactive arena seating map** + the
locked elevation choices. Two map placements to compare.

## Winner: C2 (map as animated band) — chosen by Cherlon 2026-06-26
Map re-done to emulate a **Ticketmaster-style arena bowl** (per Cherlon's inspiration screenshot,
Oakland Arena): top-down concentric **octagon bowl** — STAGE + FLOOR at center, then 3 tiers
distilled from the TM look: **VIP** (deep blue, inner/front) → **EXECUTIVE** (mid blue) →
**VIRTUAL** (light blue, outer/back). **Color = price** (pricier = deeper), tier labels + prices
stacked at the top, your section outlined cyan + **pulsing**, sections **clickable** to switch tiers.
Verified in Chrome (desktop). Map art is still a placeholder — real components from Cherlon drop in later.

## The arena map (earlier note)
Reflects `?tier=` from Page 1; click a section to compare/switch (updates price, order, BUY).

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

## Update 2026-06-26 (Cherlon revisions)
- Real **ticket images** wired in (virtual/executive/vip URLs); clicking a map section swaps the **image + price + inclusions + callout** in the order summary — full tier correlation before purchase.
- Map **re-angled**: kept the octagon, but tiers are now **stacked rows facing the stage** (STAGE on top → VIP front → Executive → Virtual back) instead of concentric rings.
- **Virtual "live" effect**: radar-pulse + play glyph appears on the Virtual band on hover/select (signals the live HD stream).
- Callout copy swaps per tier; **"What happens next" centered** + orphan removed.
- Dropped the C1 tab (C2 locked) — sketch is now the single C2 page. Verified in Chrome (image swap + virtual fx confirmed). Ticket art = the real provided badges; arena map art still placeholder.
