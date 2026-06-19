# Funnel 03 — Real Estate Summit

**Type:** Live event funnel. Tickets are **paid** (no free tickets).
**Ticket tiers:**
- Virtual ticket (paid, price point TBD)
- In-person — front-row seating (premium)
- In-person — general admission
**Opt-in URL:** https://grantcardonerealestate.com/selectyourresummit
**Goal:** Maximize ticket sales (and revenue mix across tiers).

## Canonical steps

| # | Step | Purpose | GHL channel variants present |
|---|---|---|---|
| 01 | [optin](steps/01-optin/) | Summit opt-in / ticket selection | META, MAIN, EMAIL, GOOGLE, X |
| 02 | [checkout](steps/02-checkout/) | 1-step checkout (ticket purchase) | — |
| 03 | [thank-you](steps/03-thank-you/) | Thank-you / order confirmation | — |

### AI Outbound sub-flow
A separate outbound-driven path (the divider in GHL separates it from the main flow):

| # | Step | Purpose |
|---|---|---|
| 01 | [ai-outbound/optin](steps/ai-outbound/01-optin/) | Opt-in for AI-outbound-sourced leads |
| 02 | [ai-outbound/bac](steps/ai-outbound/02-bac/) | "BAC" step — confirm meaning (Book A Call? Booked-Appt Confirmation?) |
| 03 | [ai-outbound/confirmation](steps/ai-outbound/03-confirmation/) | Confirmation |

## Notes / to confirm
- Exact ticket prices per tier.
- What "BAC" stands for in the AI Outbound flow.
- Whether the virtual ticket has its own checkout vs the in-person tickets.
