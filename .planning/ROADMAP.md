# Roadmap: 10x Real Estate — GHL Design System

## Overview

Three phases build the design system and deploy it to its first funnel. Phase 1 validates
GHL's hosting constraints first (the linchpin spike) then lays the shared Foundation.
Phase 2 builds all 10 reusable components, each proven to work with and without the Foundation.
Phase 3 composes the RE Summit opt-in top-to-bottom from those components, migrating the
existing hero off its Summit-specific prefix and wiring every CTA to real checkout URLs.

## Phases

**Phase Numbering:**
- Integer phases (1, 2, 3): Planned milestone work
- Decimal phases (2.1, 2.2): Urgent insertions (marked with INSERTED)

Decimal phases appear between their surrounding integers in numeric order.

- [ ] **Phase 1: Foundation & GHL Reality** - Spike-first: confirm GHL preserves header CSS/@font-face/<script>, then build the page-level Foundation (tokens, embedded script font, scoped reset, utilities) with the hybrid fallback contract
- [ ] **Phase 2: Component Library** - Build and verify all 10 reusable gcre-prefixed, mobile-first components, each render-verified desktop + mobile in both foundation-present and bare states
- [ ] **Phase 3: RE Summit Opt-in** - Compose the Summit opt-in top-to-bottom from the components with Summit copy/config, migrate gcres-→gcre-, wire all CTAs to real checkout

## Phase Details

### Phase 1: Foundation & GHL Reality
**Goal**: The shared Foundation is confirmed working inside GHL and ready for components to depend on
**Depends on**: Nothing (first phase)
**Requirements**: FND-01, FND-02, FND-03, FND-04, VRF-02
**Success Criteria** (what must be TRUE):
  1. A throwaway page-header block pasted into a real GHL page delivers the script font and runs a `<script>` tag on the published (not preview) page — result recorded in `knowledge/ghl-notes.md`
  2. The Foundation block (`00-foundation.html`) pasted into a GHL page header renders the correct script accent font on any text using the `.gcre-script` utility class
  3. All design tokens (palette + semantic layers) resolve on `:root` and the `.gcre` scope class; a block that declares only per-block fallback tokens inherits Foundation values when Foundation is present
  4. Every component built in Phase 2 can use the per-block fallback idiom `var(--gcre-bg, #0c2236)` and render correctly with zero dependency on the Foundation being present
**Plans**: TBD
**UI hint**: yes

### Phase 2: Component Library
**Goal**: Ten reusable, self-contained, gcre-prefixed components exist, each verified at desktop and mobile widths in both foundation-present and bare harness states
**Depends on**: Phase 1
**Requirements**: COMP-01, COMP-02, COMP-03, COMP-04, COMP-05, COMP-06, COMP-07, COMP-08, COMP-09, COMP-10, VRF-01
**Success Criteria** (what must be TRUE):
  1. All 10 components (`section-heading`, `button`, `hero`, `benefits-grid`, `stats-proof`, `testimonial`, `bio`, `pricing-tiers`, `faq-accordion`, `footer`) exist as standalone files under `design-system/components/`
  2. Each component renders with no console errors in both the with-foundation harness and the bare harness (no Foundation present) at 375 px and 1280 px viewport widths
  3. The `stats-proof` count-up animation fires on scroll — the live page's `0K+ / $0B+` static-zero bug does not occur
  4. The `faq-accordion` opens and closes items via keyboard (Enter/Space) with correct `aria-expanded` states
  5. Each component's CTA uses a real `<a>` tag (no `<button>` dead-ends); WCAG-AA contrast passes on all text/background pairs
**Plans**: TBD
**UI hint**: yes

### Phase 3: RE Summit Opt-in
**Goal**: The RE Summit opt-in page is composed end-to-end from the design system components, with Summit copy/config, real checkout CTAs, and no cannibalizing scarcity tactics
**Depends on**: Phase 2
**Requirements**: SUM-01, SUM-02, SUM-03, SUM-04
**Success Criteria** (what must be TRUE):
  1. The Summit opt-in block sequence (`funnels/03-re-summit/steps/01-optin/blocks/`) covers the full page top-to-bottom using only gcre-prefixed components from the design system
  2. The existing `01-hero.html` is migrated off `gcres-` and derives from the canonical `hero` component — no Summit-specific prefix classes remain
  3. Every CTA on the page is a real `<a>` pointing to the correct checkout URL via the `CHECKOUT_URL` config constant — no dead-end or placeholder links
  4. The page contains no paid-ad-style countdown timers or artificial scarcity that would undercut the $297 RESS offer
**Plans**: TBD
**UI hint**: yes

## Progress

**Execution Order:**
Phases execute in numeric order: 1 → 2 → 3

| Phase | Plans Complete | Status | Completed |
|-------|----------------|--------|-----------|
| 1. Foundation & GHL Reality | 0/TBD | Not started | - |
| 2. Component Library | 0/TBD | Not started | - |
| 3. RE Summit Opt-in | 0/TBD | Not started | - |
