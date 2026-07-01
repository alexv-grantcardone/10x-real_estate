---
sketch: 009
name: relt-vip-confirmation
question: "How should the two next-steps + the VIP product lay out on the post-purchase confirmation page?"
winner: "C"
tags: [relt, live-training, confirmation, thank-you, layout]
---

# Sketch 009: RELT VIP Confirmation (Thank-You) Page

## Design Question
The live page (`cardonefreetraining.com/securedvipaccess`) is the post-VIP-purchase
"seat secured" thank-you page, currently in the old red/generic style. Reskin it in the
locked navy/teal system (opt-in hero + VIP checkout) — the open decision is **how the two
next-steps ("check email for VIP access", "add to calendar") and the VIP product image lay
out** on a deliberately short page.

Design system is fixed: navy `#0A2540` / deep `#06192c` / panel `#0B3C54`, teal `#13DDE2`,
Inter + Bodoni Moda italic (opsz 9) accents, boxed corners, teal ticks, pulse CTA, GC footer.
Shared across all variants: navy masthead with teal glow + "VIP Seat Secured" badge, live
countdown to Jul 11 2026 12:00 PM ET, VIP product image (Home Study Manual book stack),
CSS-built calendar visual (replaces the old stock clock photo), light GC footer.

## How to View
open .planning/sketches/009-relt-vip-confirmation/index.html
(Use the tab bar to switch A / B / C. Countdown is live in all three.)

## Variants
- **A: Editorial rows** — alternating full-width rows with big teal Bodoni step numerals
  (01 / 02). Product image left + copy right, then copy left + calendar card right. Most
  editorial / premium; most vertical height.
- **B: Boxed panels** — each step is a self-contained navy `#0B3C54` panel with a teal
  "STEP 1" chip, boxed. Tighter and more contained; reads clearly as a checklist of tasks.
- **C: Product hero + compact steps** — leads with a split product hero ("Your VIP Package"
  + what-you-get checklist) to reinforce the purchase, then a compact two-up numbered
  next-steps row. Shortest; strongest post-purchase reassurance.

## What to Look For
- Which framing fits a *confirmation* best: task-first (A/B) vs value-reinforcement-first (C)?
- Step numerals as teal serif (A/C) vs teal "STEP" chips (B)?
- Does the CSS calendar card (A/B) earn its place, or is C's compact CTA-only step enough?
- All three verified desktop (1280) + mobile (390); footer + product image load live.

## Recommendation
**C** — on a thank-you page, opening with the product they just bought (plus the VIP
inclusions checklist) reassures the buyer and reduces remorse before handing them the two
housekeeping steps. It's also the tightest, matching the "short page" goal.
