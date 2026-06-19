# RE Summit funnel — working notes

## 2026-06-19 — kicking off conversion work
- Goal this round: **improve the RE Summit funnel**, starting with a **CRO pass on the live GHL pages** (opt-in → checkout → thank-you).
- Method for getting the live pages to Claude: TBD — deciding between Chrome DevTools (pull real HTML/CSS), pasting the GHL code blocks into the repo, saved page source, or screenshots. (Will note the choice here once set.)

### ⚠️ Reconcile before building (two sources disagree)
- Repo README says: **paid tickets, no free tickets** (virtual + 2 in-person tiers).
- Alex's DMM hat doc says: Summit is **organic promo (not paid-ad)** and is **free fulfillment for $297 RE Success System (RESS) buyers** — *"don't promote it as paid, it cannibalizes the $297 sale."*
- Likely both true: paid tickets for cold/organic buyers **+** a comped path for $297 RESS buyers, promoted organically rather than through Alex's paid Meta ads.
- **Impact on CRO:** avoid paid-ad-style scarcity that undercuts the $297 sale; confirm whether the funnel needs a separate comped-ticket path for RESS buyers.

### Open questions (from README)
- Exact ticket prices per tier.
- What "BAC" stands for in the AI-Outbound sub-flow (Book A Call? Booked-Appt Confirmation?).
- Whether the virtual ticket has its own checkout vs. the in-person tickets.

## 2026-06-19 — live opt-in capture (Chrome DevTools)
Pulled live page `grantcardonerealestate.com/selectyourresummit-2` (real source, not screenshots).
- **Event:** Miami, FL · July 27–28, 2026. ~8,770px sales page.
- **Ticket tiers (CORRECTION to README):** live tiers are **Virtual / Executive / VIP** — not "front-row + general admission." VIP = front-row + private Q&A lunch; Executive = in-person + exec reception; Virtual = remote.
- **Brand confirmed = blues + Gotham.** Palette: `#023681` deep blue, `#155EEF` bright blue, `#1BB4ED` cyan. Font: Gotham (loaded by GHL under hashed names → use `font-family:inherit`).
- **CRO flags to verify in full audit:**
  - CTAs are `<button>`s with **no href/onclick** — need to confirm they actually route to checkout (top funnel-leak risk).
  - **No prices** on page; 3 tiers described but **no per-tier select CTA** (one generic CTA for all).
  - Stat counters render `0K+ / $0B+` — likely scroll-animated; verify they fire (literal zeros = credibility hit).
- **Open:** is `selectyourresummit-2` the canonical/live opt-in, or a split-test variant? (README had no `-2`.)

### Code convention (set 2026-06-19)
All opt-in code lands in `steps/01-optin/blocks/` as GHL-paste-ready Custom Code/HTML blocks
(self-contained, scoped CSS, IIFE JS, blue CSS variables, fluid/mobile, real `<a>` CTAs).
See `steps/01-optin/blocks/README.md` for the standard and `_template.html` for the skeleton.
