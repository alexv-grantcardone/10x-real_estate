---
sketch: 005
name: summit-optin-10min-hold
question: "On the chosen video-hero opt-in (Page 1), how should the 10-minute Ticketmaster-style hold be expressed in the design — 3 treatments?"
winner: null
tags: [re-summit, optin, page1, 10-min-hold, video-hero]
funnel: RE Summit (funnel 03) — opt-in / Page 1
---

# Sketch 005: RE Summit Opt-in — 10-minute hold treatments (3 versions)

Builds on the **video-hero opt-in** (sketch 004, Split base). Same page top-to-bottom
(split video hero → proof band → tickets → what-you'll-learn → Meet Grant → final CTA → footer).
The 3 versions differ ONLY in **how the 10-minute hold appears**.

## Rule honored
**No live ticking countdown on Page 1** (ROADMAP — would cannibalize the $297 RESS offer).
The real 10-min timer lives on Page 2 (checkout). Here the hold is stated as a real
mechanic ("held 10 minutes to check out"), never a running clock.

## The 3 versions
- **V1 · "How it works" band** — a 3-step strip between the proof band and tickets: RSVP your seat → we hold it 10 minutes (Ticketmaster-style) → check out. Calm, informational; sets expectations before Page 2's timer.
- **V2 · Inline reservation reassurance** — "⏱ Held 10 min" chips on each ticket + a reassurance card at the RSVP button ("one click, seat held 10 minutes to check out, Ticketmaster-style, no payment to reserve"). Woven into the existing flow, no extra band.
- **V3 · Hero reservation stepper** — a compact Pick → Reserve (held 10 min · no payment) → Check out stepper right under the hero RSVP CTA. Makes the mechanic the first impression.

All also carry a "no payment to reserve · seat held 10 minutes at checkout" line at the final CTA, and hold-aware RSVP microcopy throughout.

## How to View
`open .planning/sketches/005-summit-optin-10min-hold/index.html` (top tabs switch V1/V2/V3; resize for mobile).
Wistia video loads over the network in a real browser; CSP-restricted artifact previews show a navy poster + play glyph instead.

## Verified
Chrome DevTools, desktop 1280: all 3 treatments render correctly (band / chips+card / hero stepper), video loads, tickets under proof band, count-up fires. Mobile 390: hero + CTA clean.

## Open items (carried)
- Ticket prices $297/$497/$2,497 = placeholders to confirm (Virtual @ $297 collides with RESS).
- Grant portrait for Meet-Grant slot · CHECKOUT_URL for RSVP CTAs.
- Base hero is Split (per the file pointed at); trivially swappable to cinematic/centered.
