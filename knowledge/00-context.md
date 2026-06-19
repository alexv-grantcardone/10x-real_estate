# Context — Business, Team, Accounts

_Last updated: 2026-06-19_

## Business
- We run marketing funnels for **Grant Cardone** real estate.
- Goal: **increase conversions — leads and sales.**

## Team
- **Alex Velazquez** — Digital Marketing Manager. Owns the system, traffic, strategy, this repo.
- **Sherman** — Head of Conversion Funnels Specialist. Owns funnel build quality (look + conversion).
- **Paige** — Brand/Design. Owes us the brand guidelines (see `brand.md`).

## Platform
- **GoHighLevel (GHL)** is the only platform we build in. Funnels, pages, and traffic routing all live there.
- Our code from this repo is delivered by pasting **self-contained code blocks** into GHL custom-code elements.
- We do **not** build funnel/site delivery on Vercel, Supabase, or any standalone hosting/database — funnels ship through GHL only.
- **Exception (dev infra, not delivery):** Supabase may be used as a *backend for our shared memory system* (see `memory-system-decision` memory / §below). That's separate from the "no Supabase for funnels" rule.

## GoHighLevel account
- Location/sub-account: **Cardone Training Team — Aventura, Florida**.

## The three funnels (mirrored under `funnels/`)
| # | Funnel | What it is | Economics | Primary URL |
|---|---|---|---|---|
| 01 | **10X Real Estate Live Training** | Free virtual webinar, top of funnel | ~**$500k/month** ad spend; run ≥monthly | cardonefreetraining.com/free |
| 02 | **RESS Offer** (Real Estate Success System) | $297 digital course | Pitched at end of webinar; ~**15%** of live attendees convert | howtobuycashflow.com/relt-ress-checkout · vanity grantcardone.com/success |
| 03 | **Real Estate Summit** | Live event, paid tickets (virtual + 2 in-person tiers) | Ticket-revenue funnel | grantcardonerealestate.com/selectyourresummit |

- Acronyms: **RELT** = Real Estate Live Training. **RESS** = Real Estate Success System.
- Full step breakdowns live in each funnel's README under `funnels/`.

## Channel-split observation (Alex, 2026-06-19)
In GHL, each funnel step is duplicated per traffic channel (MAIN, META, HUBSPOT/EMAIL,
SOCIAL, GOOGLE, X, Retarget). Alex's view: **this per-channel split may not be necessary.**
The repo intentionally keeps **one canonical version per step** instead of mirroring the
split. Open question to revisit: can we consolidate the channel duplicates in GHL itself?

> Append new context here as confirmed (offers, audiences, GHL URLs, pixel/tracking IDs — but never secrets/tokens).
