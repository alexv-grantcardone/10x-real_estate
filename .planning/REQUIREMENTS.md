# Requirements: 10x Real Estate — GHL Design System

**Defined:** 2026-06-19
**Core Value:** One governed, paste-ready component library that makes every RE funnel page look consistent and convert — themed in one place, working the instant it's pasted into GHL.

## v1 Requirements

Milestone scope = shared design system + its first application (RE Summit opt-in). Each maps to a roadmap phase.

### Foundation

- [ ] **FND-01**: A page-level Foundation block defines all design tokens (palette + semantic layers) on `:root` and a `.gcre` scope class
- [ ] **FND-02**: The script accent font is embedded self-contained (base64 `@font-face`) in the Foundation, with `font-display:swap` and an italic-serif fallback
- [ ] **FND-03**: The Foundation includes a scoped reset and utility classes (script accent, container, button base, visually-hidden)
- [ ] **FND-04**: Every component renders correctly with the Foundation absent, via minimal per-block fallback tokens (the hybrid contract)

### Components (reusable, `gcre-` prefixed, self-contained, mobile-first, contrast-safe)

- [ ] **COMP-01**: `section-heading` — headline pattern with a script-italic accent emphasis word
- [ ] **COMP-02**: `button` — real `<a>` CTA, WCAG-AA contrast, tactile states
- [ ] **COMP-03**: `hero` — announcement/date, headline with script word, media slot, primary CTA
- [ ] **COMP-04**: `benefits-grid` — icon cards, rhythmic (not 3-equal-card slop)
- [ ] **COMP-05**: `stats-proof` — animated count-up that actually fires (fixes the live page's `0K+ / $0B+` bug)
- [ ] **COMP-06**: `testimonial` — photo + quote (≤3 lines) with script accent
- [ ] **COMP-07**: `bio` — "Meet Grant" + real media-logo strip
- [ ] **COMP-08**: `pricing-tiers` — Virtual / Executive / VIP with a per-tier select CTA each
- [ ] **COMP-09**: `faq-accordion` — keyboard-accessible disclosure
- [ ] **COMP-10**: `footer` — logo, links, legal disclaimer

### RE Summit application

- [ ] **SUM-01**: The RE Summit opt-in is composed top-to-bottom from the components with Summit copy/config
- [ ] **SUM-02**: The existing hero is migrated `gcres-`→`gcre-` off the canonical `hero` component
- [ ] **SUM-03**: Every CTA is a real `<a>` to the checkout (CHECKOUT_URL config) — no dead-ends
- [ ] **SUM-04**: Summit CRO caveat honored — no paid-ad-style scarcity that cannibalizes the $297 RESS sale

### Verification & GHL reality

- [ ] **VRF-01**: Each block is render-verified desktop + mobile via Chrome DevTools + the `.preview/` harness, in BOTH foundation-present and bare states
- [ ] **VRF-02**: A Phase 0 spike confirms whether GHL preserves page-header custom CSS / `@font-face` / `<script>` on the published page; results recorded in `knowledge/ghl-notes.md`

## v2 Requirements

Deferred to a later milestone.

### Propagation

- **PROP-01**: Apply the system to the RELT / Live-Training opt-in (the V2 rendering); adds `optin-form`, `countdown`, `checklist` components
- **PROP-02**: Apply the system to the RESS $297 sales/checkout funnel

## Out of Scope

| Feature | Reason |
|---------|--------|
| RELT + RESS application | This milestone is the system + RE Summit only; propagation is the next milestone |
| Standalone websites / non-GHL hosting / delivery databases | `CLAUDE.md` §3 hard constraint — GHL is the only delivery platform |
| Build step / framework / bundler | Every deliverable must be GHL paste-ready as-is |
| Official brand sign-off | Paige owns final brand guidelines; token values are proposed-pending-Paige, structure is final |

## Traceability

Populated during roadmap creation.

| Requirement | Phase | Status |
|-------------|-------|--------|
| (filled by roadmapper) | — | Pending |

**Coverage:**
- v1 requirements: 18 total
- Mapped to phases: TBD (roadmapper)
- Unmapped: TBD

---
*Requirements defined: 2026-06-19*
*Last updated: 2026-06-19 after initialization*
