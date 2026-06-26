---
sketch: 006
name: summit-checkout-countdown
question: "How should the RE Summit checkout (Page 2) present the live 10-minute Ticketmaster hold — and the decaying value stack vs plain countdown branches?"
winner: null
tags: [re-summit, checkout, page2, countdown, 10-min-hold]
funnel: RE Summit (funnel 03) — checkout / Page 2
---

# Sketch 006: RE Summit Checkout (Page 2) — live 10-minute countdown

The opt-in (Page 1) is locked. This is **Page 2**, where the **live 10-minute hold timer
actually lives** (allowed here; banned on Page 1 per ROADMAP). Seeded from the locked opt-in
look (light/airy Summit). Reflects the `?tier=` chosen on Page 1 (default Executive).

## The 3 variants (mapped to Alex's two strategy branches + a layout option)
- **A · Plain countdown** — navy reservation bar with a live **10:00 → 0:00** timer (turns urgent red under 2:00) → order summary → payment form → single **BUY** CTA + tiny "talk to a specialist" link. The branch for **no value stack** (if Rosa doesn't deliver one).
- **B · Decaying value stack** — same, plus a bonus stack where **items visibly drop off as the clock ticks** (strike-through + fade + "value still on the table" total counting down). The branch **if a stack lands**. Bonus content is placeholder (parked pending Rosa).
- **C · Split layout** — premium two-column: timer + order + value stack on the left, sticky payment form on the right. Works with either branch.

All three: real ticking countdown; **expired state** when it hits 0:00 (seat released → "Reserve again" / "Talk to a specialist" recovery → booking page).

## How to View
`open .planning/sketches/006-summit-checkout-countdown/index.html` (tabs switch A/B/C).
Toolbar (bottom-right): **Jump to 0:20** to watch the decay + expiry quickly; **Reset 10:00**.
Append `?tier=virtual|executive|vip` to preview each ticket.

## Key decisions reflected
- Single primary **BUY** CTA + tiny "talk to a specialist" link (booking is the later recovery).
- 10-minute hold is a **real reservation timer** on Page 2 (not the banned Page-1 scarcity).
- Post-lapse → recovery to the **booking page** (specialist).

## Open / pending
- **Value-stack content + decay cadence** — parked pending **Rosa** (B/C use labeled placeholders; layout reserves the space).
- Real prices ($297/$497/$2,497 placeholders), checkout/booking URLs, ticket images.
- Build target: a GHL block that skins + mounts the native One Step Order form (like the RELT VIP page) with the countdown wrapped around it.

## Verification note
Browser render-check was skipped this round (Chrome DevTools session was profile-locked); the
artifact runs the live countdown + decay client-side. Re-verify in Chrome before promoting to a GHL block.
