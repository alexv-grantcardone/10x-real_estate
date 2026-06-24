---
sketch: 001
name: ticket-section
question: "How should the 3 tiers + reserve form read as section 2 of the RSVP opt-in page?"
winner: "C"
tags: [tickets, conversion, pricing]
---

# Sketch 001: Ticket Section

## Design Question
The ticket section sits directly below the hero (section 2) and is the page's core conversion unit: it must show all 3 tiers **with pricing** (transparent — no bait/switch) and capture the free seat reservation ("RSVP MY SEAT", no payment, held 72 hours). What layout makes the pricing legible AND keeps the reservation friction-low?

## How to View
open .planning/sketches/001-ticket-section/index.html

## Variants
- **A: Cards → Form** — three tier cards in a row (selectable), then a reserve panel with the form below. Most visual, pricing gets the most room. Selected tier flows into the form.
- **B: Tiers + Form** — compact stacked tier options on the left, sticky reserve form on the right. Lowest friction: choose and fill in one view, no scroll.
- **C: Comparison Table ★ (winner)** — feature-by-feature comparison across the 3 tiers with per-column Reserve, then one shared CTA. Best for buyers who want to weigh inclusions before committing. **Each tier column shows the real physical-ticket art** (`assets/ticket-virtual|executive|vip.png` — Virtual/Executive/VIP badge cards). In GHL, swap each `<img src>` for the matching `PASTE_*_TICKET_URL` gallery link. Default selected tier = Executive (most popular), synced across header / column / CTA on load.

## Open / Next
- Overall **color scheme & branding** to be reviewed next (the ticket art skews lighter blue/cyan than the current navy base — worth aligning the page palette to the tickets).

## What to Look For
- Does the pricing feel transparent and premium, or busy?
- How far is the eye/scroll from "see the tiers" to "fill the form"?
- Does the selected-tier state read clearly (which one am I reserving)?
- Mobile: resize to 375px (toolbar → Phone) — does it still hold up?
- Brand rules honored: no italics, no "FREE", navy/cyan, Bodoni accent upright.
