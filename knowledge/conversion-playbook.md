# Conversion Playbook

_A living document. Top = evergreen principles we believe in. Bottom = a dated log of what we actually tested and learned. **Append, don't overwrite.**_

---

## Evergreen principles (real-estate lead/sales funnels)

These are starting defaults, not gospel — override them when our own test log says otherwise.

1. **One job per page.** Each step has a single, obvious primary action. Remove every link/button that isn't that action.
2. **Mobile-first.** Most paid traffic is mobile. Design and test the mobile view first; code blocks must be responsive and fast.
3. **Speed converts.** Code blocks must be lightweight — inline CSS/JS, no heavy libraries. Slow pages bleed leads.
4. **Above-the-fold clarity.** In the first screen: who it's for, the outcome, and the CTA. Don't make them scroll to understand the offer.
5. **Lead with the Grant Cardone authority.** The brand is the biggest trust asset — use recognizable proof (results, credibility, social proof) early.
6. **Minimize form friction.** Ask for the fewest fields that still qualify the lead. Every extra field costs conversions.
7. **Specific lead magnets beat vague ones.** "Home study manual," "masterclass," "negotiation scripts" — concrete deliverables convert better than "learn more."
8. **Urgency/scarcity where it's real.** For events/masterclasses, real deadlines and seat limits lift registration. Don't fake it.
9. **VSL/long-form sales pages:** strong hook in the first 10–15s, a single CTA repeated at natural decision points, and an offer stack that makes the price feel small.
10. **Match the message.** Landing page headline should mirror the ad that brought them — message-match lifts conversion and Quality Score.

## Build-quality standards (always-on, every page & document)

- **No orphan words in headlines or copy — desktop AND mobile.** Never ship a headline with a single word stranded on its own line, in either viewport. This is a permanent craft standard (it protects the premium GC brand feel). Always verify both desktop and mobile before calling a headline done.
  - **Technique:** split the headline into spans and control wrapping per part. Put `text-wrap:balance` on the wrapping part so the last line never orphans. Force short kicker/accent phrases (e.g. a date) onto one line with `display:block; white-space:nowrap;` + a viewport-sized `clamp()` font that fits at every width. Honor any per-viewport line preference the client gives.
  - First applied: RE Live VIP upsell (`re-live-vip-upsell-checkout.html`), 2026-06-26 — desktop = script date line + tagline on one line (h1 capped at 52px); mobile = date line + tagline balanced to 2 lines.

## Measurement
- Define the conversion event per funnel (opt-in submit, registration, purchase) and track it in GHL (and pixel/GA if configured).
- When we run an A/B test, log the variant, the metric, sample size, and result below.

---

## Test & learnings log

_Append dated entries. Format:_
```
### YYYY-MM-DD — <funnel> — <what we changed>
- Hypothesis:
- Result (metric, before → after, sample size):
- Decision (keep / revert / iterate):
```

_(no entries yet — add the first one after our first test)_
