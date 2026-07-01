# Live Training · Step 05 — VIP "Seat Secured" Confirmation (Thank-You)

**Live page:** `cardonefreetraining.com/securedvipaccess`
**Shows after:** the VIP / Home Study Manual checkout (step 02).

The post-purchase thank-you page. Reassures the buyer of the VIP value they just
bought, then hands them two housekeeping steps before the event.

## Block
- `blocks/01-confirmation.html` — full page as ONE GHL Custom HTML/JS element.
  Self-contained (inline CSS + vanilla JS), scoped under `#relt-conf`, no build step.

## Design
Matches the locked navy/teal system (opt-in hero + VIP checkout): navy `#0A2540` /
panel `#0B3C54` / teal `#13DDE2`, Inter + Bodoni Moda italic (opsz 9) accents, boxed
corners, teal ticks, pulse CTA, GC footer. Chosen layout = sketch **009 Variant C**
(product hero → VIP inclusions → compact 2-up next-steps). Verified desktop + mobile.

## Sections
1. Navy masthead + "VIP Seat Secured" badge + live countdown to Jul 11 2026, 12:00 PM ET.
2. Product hero — Home Study Manual image + "Your VIP Package" inclusions checklist.
3. Two next-steps: (01) check email for VIP access, (02) add to calendar (CTA).
4. GC footer (logo, nav, disclaimer).

## Wire-up before publishing
- **`PASTE_CALENDAR_LINK`** — set the Step 2 "Add to calendar" button `href` (currently `#`).
- Product image + footer logo are pre-filled with the live GHL gallery links used on the
  other pages (`PASTE_PRODUCT_IMAGE_URL` / `PASTE_LOGO_URL` markers) — swap only if changed.

## Reference
Design mockup + variants: `.planning/sketches/009-relt-vip-confirmation/`
