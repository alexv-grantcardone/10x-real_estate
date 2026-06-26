---
sketch: 008
name: summit-confirmation
question: "How should the post-purchase 'You're in' confirmation read in the locked light/airy system, flowing from the opt-in (005) and checkout (007)?"
winner: "C"
tags: [re-summit, confirmation, page3, post-purchase, thank-you]
---

# Sketch 008: RE Summit Confirmation — "You're in"

Page 3 of the RE Summit funnel: the post-purchase confirmation / thank-you page.
Built on the locked light/airy system — same tokens, Inter + Bodoni-upright accent,
Cardone navy brand bar, ticket images, and footer as Page 1 (005) and Page 2 (007).
The page structure is fixed; the one open design question is **how to stage the
"You're in" moment**, explored as 3 hero treatments.

## How to View
open .planning/sketches/008-summit-confirmation/index.html

Toolbar (bottom-right): switch **Hero** A/B/C, toggle **Buyer** in-person/virtual,
preview viewports, and swap **Theme** (light / navy).

## Variants (the hero treatment)
- **A — Centered celebration** — animated success check, "You're in. See you in Miami.",
  then a horizontal order-summary card (ticket thumb · order# · amount · Paid). The
  conventional confirmation pattern; cleanest and most universal.
- **B — Split** — mirrors the checkout (007) split: receipt facts on the left, the large
  purchased ticket on the right. Strongest visual continuity from Page 2.
- **C — Ticket stub** — a tactile boarding-pass/ticket-stub card with a navy header strip,
  perforated divider, "ADMIT ONE", and the tier/price/order stub. Most delightful — gives
  a tangible "here's your ticket" payoff.

## Shared below the hero (all variants)
- **Event details** — When / Where / What-to-bring cards + functional **Add to calendar**
  (Google link + downloadable `.ics`).
- **What happens next** — 3 numbered steps (check email → plan trip / get set up → come ready;
  step 3 links to "talk to a specialist" per Alex's post-purchase strategy).
- **Support** strip + shared footer.

## Buyer toggle (in-person ↔ virtual)
Swaps the ticket art (Executive → Virtual), price ($497 → $297), "ADMIT ONE" → "STREAM ACCESS",
the "Where" card → "How to watch" (private stream link by email), and the "Plan your trip" step
→ "Get set up".

## What to Look For
- Which hero treatment best rewards the purchase while flowing from the checkout?
- Does the ticket image earn the hero (B/C) or work better as a summary chip (A)?
- Stub (C) on mobile: the perforation flips to a horizontal dashed divider.

## Open questions / TBD
- **Virtual headline copy:** the hero still reads "See you in Miami" for a virtual buyer —
  needs a virtual-specific line (e.g. "We'll see you online") before production.
- Real order #, attendee name, amount, email come from GHL merge fields at build time.
- Confirm the post-purchase next-step path (specialist/booking URL) with Alex.
- Calendar event times (doors/stream) are placeholders.
