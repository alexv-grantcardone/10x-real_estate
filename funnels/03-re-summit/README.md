# Funnel 03 — Real Estate Summit

**Type:** Live event funnel. Tickets are **paid**.
**Event:** Miami, FL · July 27–28, 2026.
**Ticket tiers (per live page):**
- **Virtual** — live-stream access from anywhere
- **Executive** — full in-person access + exec networking reception
- **VIP** — front-row seating + private Q&A lunch with Grant + VIP reception
**Opt-in URL:** https://grantcardonerealestate.com/selectyourresummit
**Goal:** Maximize ticket sales (and revenue mix across tiers).

## Steps (one folder each — 3 total)

| # | Step | Purpose |
|---|---|---|
| 01 | [optin](steps/01-optin/) | Summit sales/opt-in page → ticket selection |
| 02 | [checkout](steps/02-checkout/) | Checkout (ticket purchase) |
| 03 | [thank-you](steps/03-thank-you/) | Thank-you / order confirmation |

> **Why only 3 steps:** in GHL each step is duplicated per traffic channel (META, MAIN,
> EMAIL, GOOGLE, X, retargeting), but **the code does not differ by channel** — so this
> repo keeps **one canonical version per step**. Paste the same block into each channel's
> duplicate in GHL.

## ✅ Paste-ready GHL blocks (the actual page code)

All three pages are built and committed as self-contained blocks — paste each into **one**
GHL Custom Code / HTML element on the matching page. Shared light/airy design system (navy +
cyan, Inter + Bodoni-upright accent), Cardone brand bar, and the real ticket art + Grant portrait.

| Page | Block file | Scope ID | Highlights |
|---|---|---|---|
| **1 · Opt-in** | [`steps/01-optin/blocks/01-optin.html`](steps/01-optin/blocks/01-optin.html) | `#gcre-summit-optin` | Video hero, 3 ticket tiers w/ real art, 10-min hold stated (no live clock here) |
| **2 · Checkout** | [`steps/02-checkout/blocks/02-checkout.html`](steps/02-checkout/blocks/02-checkout.html) | `#gcre-summit-checkout` | Live 10-min hold countdown, interactive arena seat map, re-startable on expiry |
| **3 · Confirmation** | [`steps/03-thank-you/blocks/03-thank-you.html`](steps/03-thank-you/blocks/03-thank-you.html) | `#gcre-summit-confirm` | Ticket-stub "You're in", add-to-calendar; reads `?tier=` for in-person vs. virtual |

**Funnel flow:** opt-in CTA → checkout (`?tier=virtual\|executive\|vip` appended) → thank-you (same `?tier`).

### Before go-live — fill these placeholders
- **Page 1:** `PASTE_CHECKOUT_URL` (the CTAs that send to the checkout page).
- **Page 2:** `PASTE_ORDER_URL` **or** mount GHL's native One-Step Order form at the marked
  `GHL ORDER FORM MOUNT`; `PASTE_SPECIALIST_URL`. Tune `START_SECONDS` (default 600 = 10 min).
- **Page 3:** `PASTE_SPECIALIST_URL`; swap the name / email / order-# placeholders for GHL merge tags.
- **All:** ticket art + Grant portrait point at the GHL media library — re-upload + swap URLs if the account changes.

*(Design exploration behind these lives in `.planning/sketches/` — sketches 005 opt-in, 007 checkout, 008 confirmation.)*

## Notes / to confirm
- Checkout URL the opt-in CTAs should point to (CTAs on the live page currently have no link).
- Exact ticket prices per tier.
- Whether the virtual ticket has its own checkout vs. the in-person tickets.
