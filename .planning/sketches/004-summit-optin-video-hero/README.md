---
sketch: 004
name: summit-optin-video-hero
question: "How should the Summit opt-in hero stage the promo VIDEO (replacing the ticket badge), and how do 3 hero treatments compare with the tickets section pulled up under the proof band?"
winner: null
tags: [re-summit, optin, page1, video-hero, light-theme]
funnel: RE Summit (funnel 03) — opt-in / Page 1
---

# Sketch 004: RE Summit Opt-in — Video Hero (3 variants)

Iteration on sketch 003. Two structural changes from Alex/Cherlon:
1. **Hero video** replaces the ticket badge — Wistia embed (`fk5jjwzbor`, "Real Estate Summit Landing Page Video").
2. **Tickets (Compare & Reserve) moved UP** — directly under the proof band ($4B+ / 2 Days / 3 Tiers / Miami), ahead of the "what you'll learn" and "Meet Grant" sections.

## Shared page order (all variants)
Hero (video) → **Proof band** → **TICKETS (locked comparison table)** → What you'll learn → Meet Grant → Final CTA → Footer.

## Hero variants (the comparison)
- **A — Split** — copy left (headline, sub, meta, RSVP), video right. Balanced; closest to sketch 003.
- **B — Centered** — headline/sub/meta/RSVP centered, then a large full-width video below.
- **C — Video-led (cinematic)** — **dark-navy hero band**, centered white headline (light-blue Bodoni "Get Rich"), dominant wide video, RSVP under it. Most "press play," biggest contrast pop.

## How to View
`open .planning/sketches/004-summit-optin-video-hero/index.html` (top tabs switch A/B/C; resize for mobile).
Note: the Wistia video loads over the network in a real browser; in a CSP-restricted artifact preview it shows a navy poster + play glyph placeholder instead.

## Verified
Chrome DevTools, desktop 1280 + mobile 390: video loads (A + C confirmed), tickets render under the proof band, count-up fires, table → stacked cards on mobile, no orphans.

## Open items (carried from 003)
- Ticket prices $297/$497/$2,497 = placeholders to confirm (Virtual @ $297 collides with RESS).
- Grant portrait for Meet-Grant slot.
- CHECKOUT_URL for RSVP CTAs.
