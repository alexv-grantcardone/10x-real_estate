# Phase 1: Foundation & GHL Reality - Context

**Gathered:** 2026-06-19
**Status:** Ready for planning

<domain>
## Phase Boundary

Deliver the shared **Foundation** — a page-level GHL block defining the two-layer CSS-variable
token set (palette + semantic), an embedded (base64) script accent font, a scoped reset, and
utility classes — plus the **hybrid fallback contract** (components consume Foundation tokens but
carry per-block fallbacks). FIRST validate GHL's hosting reality via a throwaway **spike**: does
GHL preserve page-header custom CSS / `@font-face` / `<script>` on the *published* page.

This phase does NOT build components (Phase 2) or compose the Summit page (Phase 3).

</domain>

<decisions>
## Implementation Decisions

The user opted not to micro-decide these (deferred to Claude); recorded here as discretion calls,
all overridable before planning. Bases: the approved spec + the V2 rendering + the design-taste skill.

### Brand accent color
- **D-01:** Single brand accent = **teal `#1FA9C4`** (the V2 rendering's accent — the most intentional, newest direction), used on every CTA and every script-accent word. Exposed as semantic token `--gcre-accent` so the whole vertical re-skins from one variable. The live Summit page's `#1BB4ED` cyan and `#155EEF` bright blue become palette neighbors, not the primary.
- **D-02:** Base = **dark navy** scale anchored on the rendering (`~#0a2034` page / `~#0c2236` hero), white/ muted-white text, one light band token for stats strips.

### Script accent font
- **D-03:** Use a **high-contrast OFL display italic** (elegant, flowing — matches the rendering's "Cash Flowing" / "With Grant Cardone"). Default pick: **Playfair Display Italic**; finalized during the foundation build with the design-taste skill (alternatives to weigh: Cormorant Garamond Italic, Libre Caslon Display Italic). Subset + base64 `@font-face` in the Foundation, `font-display:swap`, italic-serif fallback stack. Swappable to Paige's official font via one `@font-face` swap.

### GHL spike logistics (execution dependency on Alex)
- **D-04:** Alex spins a **throwaway/test GHL funnel page**, pastes the spike snippet into the page **Header / Custom Code** area (and a small body block), **publishes** it, and shares the **published** URL. Claude verifies on the published page via the Chrome DevTools MCP: (a) header CSS cascades, (b) `@font-face` loads, (c) `<script>` runs. Results recorded in `knowledge/ghl-notes.md` (clear the ⚠️ unknowns).

### Foundation install location
- **D-05:** Foundation lives in the page **Header / Custom Code** area (loads once, applies page-wide). Per-block fallback tokens are the safety net. **If the spike shows header CSS is stripped**, fall back to a Foundation code block at the very top of the page body. Decision gated by D-04's result.

### Claude's Discretion
- Exact token scale values (navy steps, spacing, radius, shadows, type clamps) — per the spec's proposed set, refined during the build.
- Utility class names/set (`.gcre-script`, container, button base, visually-hidden) and the `window.GCRE` namespace stub.
- The exact spike snippet contents.

</decisions>

<canonical_refs>
## Canonical References

**Downstream agents MUST read these before planning or implementing.**

### Design spec & decisions
- `/Users/avelazquez/.claude/plans/were-a-bit-far-majestic-bonbon.md` — the approved design spec: hybrid sharing, two-layer tokens, `gcre-` prefix, script-font strategy, phasing. The source of truth.
- `.planning/PROJECT.md` — project context, constraints, key decisions
- `.planning/REQUIREMENTS.md` — FND-01..04, VRF-02 (this phase's requirements)

### Constraints & conventions
- `CLAUDE.md` §3 — hard constraints (GHL-only, self-contained paste-ready, no build/framework)
- `CLAUDE.md` §6 — brand direction (blues → navy+teal+script; CSS-variable theming; pending Paige)
- `funnels/03-re-summit/steps/01-optin/blocks/README.md` — the 7-principle block standard to re-prefix (`gcres-`→`gcre-`) and extend with the hybrid contract (principle #8)
- `funnels/03-re-summit/steps/01-optin/blocks/01-hero.html` — reference patterns (scoped CSS, CSS-var theming, IIFE guard, clamp fluid, reduced-motion)

### GHL specifics (the spike resolves the ⚠️ items)
- `knowledge/ghl-notes.md` — embed pattern + the unverified header-CSS / `<script>` / size questions VRF-02 settles
- `knowledge/brand.md` — brand status (pending Paige; token values proposed, structure final)

### Design direction (visual target)
- `~/Downloads/RELT Landing Page_V2-01.jpg` (and `-02`, `-03`) — the V2 rendering: dark navy, teal accent, script-italic emphasis, premium spacing

</canonical_refs>

<code_context>
## Existing Code Insights

### Reusable Assets
- `01-hero.html`: the proven block pattern to generalize — scoped `.gcres-*` (→`.gcre-*`) CSS, CSS-variable theming on the wrapper, IIFE + re-entry guard, `clamp()` fluid type, reduced-motion guard, self-contained Wistia `<iframe>` embed, real `<a>` CTA with `CHECKOUT_URL` config.
- `blocks/README.md`: the documented 7-principle standard — keep, re-prefix, add the hybrid contract.

### Established Patterns
- Filenames `NN-name.html`, one file per GHL element. BEM-ish prefixed classes. Mobile-first, `clamp()` fluid. CSS-variable theming. `.preview/` (gitignored) for render-verification harnesses.

### Integration Points
- The Foundation is pasted into the GHL page Header (D-05); components (Phase 2) consume its `:root`/`.gcre` tokens and the `.gcre-script` utility, with per-block fallbacks so they survive Foundation absence.

</code_context>

<specifics>
## Specific Ideas

- The V2 RELT rendering is the visual north star for the whole vertical: dark navy base, single teal accent, flowing script-italic emphasis words, generous premium spacing, soft (~6–12px) radii.
- Repo structure for the system (from spec): new root `design-system/` with `foundation/` (`00-foundation.html`, `tokens.reference.css`, `font-notes.md`), `components/`, `_component-template.html`, `README.md`, `CHANGELOG.md`.

</specifics>

<deferred>
## Deferred Ideas

- **RELT (Live Training) + RESS application** — next milestone (PROP-01, PROP-02). RELT adds `optin-form`, `countdown`, `checklist` components not needed for the Summit-first scope.
- **Per-funnel theme scopes** (`.gcre-theme-relt` / `-ress` / `-summit`) — structure supports them now; only used when we propagate.

None of the above is in Phase 1 scope.

</deferred>

---

*Phase: 1-Foundation & GHL Reality*
*Context gathered: 2026-06-19*
