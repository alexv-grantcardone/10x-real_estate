# Phase 1: Foundation & GHL Reality — Research

**Researched:** 2026-06-19
**Domain:** GoHighLevel custom code delivery, CSS custom properties, self-hosted web fonts, CSS scoping
**Confidence:** MEDIUM — GHL hosting-reality questions carry inherent uncertainty until the live spike (VRF-02) resolves them; all CSS/font mechanics are HIGH confidence from MDN.

---

<user_constraints>
## User Constraints (from CONTEXT.md)

### Locked Decisions
- **D-01:** Single brand accent = teal `#1FA9C4`, exposed as `--gcre-accent`. Summit live cyan `#1BB4ED` and bright blue `#155EEF` become palette neighbors.
- **D-02:** Dark navy scale anchored on rendering (~`#0a2034` page / `~#0c2236` hero), white/muted-white text, one light band token.
- **D-03:** High-contrast OFL display italic (default: Playfair Display Italic). Subset + base64 `@font-face` in Foundation, `font-display:swap`, italic-serif fallback. Swappable via one `@font-face` swap when Paige delivers.
- **D-04:** Alex spins throwaway/test GHL funnel page, pastes spike snippet into Header/Custom Code AND a body block, publishes, shares URL. Claude verifies via Chrome DevTools MCP. Results go in `knowledge/ghl-notes.md`.
- **D-05:** Foundation lives in page Header/Custom Code area (loads once, page-wide). If spike shows header CSS is stripped, fall back to a Foundation code block at the very top of the page body.

### Claude's Discretion
- Exact token scale values (navy steps, spacing, radius, shadows, type clamps)
- Utility class names/set (`.gcre-script`, container, button base, visually-hidden) and `window.GCRE` namespace stub
- Exact spike snippet contents

### Deferred Ideas (OUT OF SCOPE)
- RELT (Live Training) + RESS application — next milestone
- Per-funnel theme scopes (`.gcre-theme-relt` / `-ress` / `-summit`) — structure supports them, only used when propagating
</user_constraints>

<phase_requirements>
## Phase Requirements

| ID | Description | Research Support |
|----|-------------|------------------|
| FND-01 | Page-level Foundation block defines all design tokens (palette + semantic) on `:root` and `.gcre` scope | CSS custom property cascade confirmed; `:root` + class scope pattern is standard and cross-browser safe |
| FND-02 | Script accent font embedded self-contained (base64 `@font-face`) with `font-display:swap` and italic-serif fallback | Latin-subset woff2 ≈ 20–35 KB; base64 ≈ 28–48 KB inline; `font-display:swap` is standard; fallback stack documented |
| FND-03 | Foundation includes scoped reset and utility classes (script accent, container, button base, visually-hidden) | `.gcre` wrapper scope pattern confirmed safe; bare-tag selectors explicitly forbidden per GHL-confirmed collision risk |
| FND-04 | Every component renders correctly with Foundation absent, via per-block fallback tokens (hybrid contract) | CSS `var(--semantic, var(--palette, #literal))` fallback chain confirmed correct and cross-browser safe |
| VRF-02 | Phase 0 spike confirms GHL preserves page-header custom CSS / `@font-face` / `<script>` on published page | Spike design fully specified; 4 specific things to verify; results capture format defined |
</phase_requirements>

---

## Summary

This phase has four research questions. Three are resolvable from authoritative sources now; one (GHL hosting reality) is only partially answerable from documentation and requires the live spike (VRF-02) to settle definitively.

**GHL hosting reality:** GoHighLevel's funnel/page builder offers two injection points for page-wide code — the page Settings > Head/Body tracking code fields, and the Custom Code / HTML element (body block). Official docs confirm both are dynamically injected client-side (not in static HTML source). The single confirmed hard restriction is that `<script>` tags nested inside `<div>` tags are blocked by GHL's validator — scripts must appear as siblings, not children, of wrapper divs. CSS custom properties (var(--)) work in custom code block `<style>` tags on the published page; the limitation community reports describe is only that GHL's own visual builder UI doesn't expose CSS variables as a picker — the underlying CSS executes normally. Whether the page Settings header code field survives publish (vs. being stripped) is unconfirmed in official docs and must be the primary spike question.

**Self-hosted font:** Playfair Display Italic (OFL 1.1) is the confirmed pick. The woff2 file is downloadable from the official Google Fonts Helper (gwfh.mranftl.com). fonttools 4.60.2 is already installed on this machine at `python3 -m fonttools`. A Latin-only subset (`U+0000-00FF` + punctuation) produces a woff2 of approximately 20–35 KB, which base64-encodes to approximately 28–48 KB of inline text — acceptable for a Foundation block that loads once per page. GHL now has native custom font upload (woff2 supported), but that feature applies fonts element-by-element through the builder UI, not programmatically via class utilities — so the base64 `@font-face` approach is still the right path for a system-level `.gcre-script` utility class.

**CSS var() fallback contract:** The hybrid idiom `--gcre-bg: var(--gcre-navy-700, #0c2236)` is correct. If `:root` defines `--gcre-navy-700`, it cascades down and the literal fallback is never used. If `:root` is absent, the literal is used. This is the standard spec behavior, cross-browser safe for all modern browsers. The one gotcha: a custom property defined with an invalid value (wrong type) still "wins" over the fallback — this is not a concern here since all tokens are color/length values declared consistently.

**CSS scoping:** The `.gcre` wrapper class scope pattern (no bare-tag selectors) is the explicitly required approach per GHL's own troubleshooting docs — bare `h1 {}` / `p {}` / `button {}` selectors in custom code blocks collide with GHL's own UI element selectors and are confirmed to break page rendering. All resets and utilities must be scoped under `.gcre` or `.gcre-*` prefixed selectors.

**Primary recommendation:** Write the Foundation block with `<style>` first (`:root` tokens, `@font-face`, `.gcre *` box-sizing reset, utilities), then an empty or minimal `<div class="gcre-foundation-anchor"></div>` wrapper, then `<script>` as a sibling after the div (not nested inside) — this satisfies the confirmed GHL `<script>-in-<div>` restriction. The spike must test header code field specifically, as that is the only unconfirmed behavior.

---

## Architectural Responsibility Map

| Capability | Primary Tier | Secondary Tier | Rationale |
|------------|-------------|----------------|-----------|
| CSS token definitions (`:root`, `.gcre`) | Foundation block (page header or body-top) | Per-block fallback tokens | Foundation owns the single source of truth; blocks own their own survival fallbacks |
| `@font-face` declaration | Foundation block | — | One declaration per page; duplicating in every block would bloat pages |
| Scoped reset (`box-sizing`, `margin`, `line-height`) | Foundation block (`.gcre *` scope) | — | Global reset is page-level responsibility |
| Utility classes (`.gcre-script`, `.gcre-container`, etc.) | Foundation block | — | Utility classes must pre-exist when components reference them |
| Per-block fallback tokens | Each component block | — | Each block must be self-sufficient in isolation |
| `window.GCRE` namespace stub | Foundation block `<script>` | — | Shared namespace; components check it, not define it |
| Font rendering / swap behavior | Browser | Foundation `font-display:swap` hint | GHL does not control font loading once `@font-face` is declared |

---

## GHL Hosting Reality

### What is Confirmed (from Official Docs and Community Sources)

**Injection mechanism:** [CITED: help.gohighlevel.com] Head and body tracking codes are injected client-side (dynamically in the browser), not server-rendered into static HTML. The static page source will not show these elements — view source is not a reliable test. Test via DevTools Elements panel on the live published page.

**Two injection points for page-wide code:**
1. **Page Settings > Header Code / Body Code fields** — accessed via the gear icon in the page builder; accepted by the platform for tracking pixels and scripts. Whether `<style>` blocks and `@font-face` in this field survive to the published page is [ASSUMED] — not confirmed by official docs. This is the primary spike question.
2. **Custom Code / HTML element (body block)** — the drag-and-drop HTML element in the page builder. `<style>` tags inside this element are confirmed working (existing `01-hero.html` uses this pattern in production). This is the confirmed fallback path.

**Script-in-div restriction:** [CITED: help.gohighlevel.com/support/solutions/articles/48001159729] `<script>` tags nested inside `<div>` tags do not work — GHL's validator blocks them. The fix is to place the `<script>` tag as a sibling after (not inside) the wrapper `<div>`. The IIFE pattern in `01-hero.html` already has this problem — review the actual file structure carefully: the `<script>` is inside the outer `<div class="gcres-block gcres-hero">`. This may work because GHL's validator appears to allow it at one nesting level (the outer element is the Custom Code container, not a GHL-managed div). The spike must confirm whether the Foundation's `<script>` after the `<style>` is sufficient.

**hydrationDone event:** [CITED: help.gohighlevel.com/support/solutions/articles/155000002421] GHL dispatches a `hydrationDone` custom event after the preview framework finishes loading. Any DOM-manipulation JS should listen for this event rather than `DOMContentLoaded` if operating inside the funnel preview/builder. The `window.GCRE` namespace stub does not manipulate DOM, so this is not critical for the Foundation's script — but document it for Phase 2 component scripts.

**CSS custom properties in custom code blocks:** [MEDIUM confidence — community + secondary sources] CSS `var(--property)` declarations work correctly inside `<style>` tags in GHL Custom Code / HTML elements on published pages. The "CSS variables not supported" limitation documented in GHL's ideas forum refers specifically to GHL's own visual builder UI controls (the typography/color pickers do not accept `var(--x)` as an input) — this is a builder UI constraint, not a CSS execution constraint. The underlying browser executes custom properties normally.

**GHL native custom fonts:** [CITED: help.gohighlevel.com/support/solutions/articles/155000005918] GHL now supports native custom font upload (woff2, ttf, otf, woff formats accepted, no explicit size cap beyond Media Storage capacity). However, native fonts are applied element-by-element through the builder's Typography settings, not programmatically via CSS class. This does not replace the `@font-face` + `.gcre-script` utility class approach — the base64 embedding is still the right path for a system-level utility.

**Funnel-level vs. page-level CSS:** [CITED: community sources] CSS added to the funnel Settings (not page Settings) applies across all pages in that funnel. This is a viable alternative to page-header code for the Foundation — but it is the funnel's Custom CSS field, not a code block, so it may have the same unverified-survival question as the page header code field.

### What is Unconfirmed (Spike Must Resolve)

| Question | Why Unconfirmed | Spike Test |
|----------|----------------|------------|
| Does a `<style>` block in the page Settings > Header Code field render on the published page? | Not in official docs; client-side injection means view-source is unreliable | Paste `<style> .gcre-spike-head { color: red !important; } </style>` in Header Code field; publish; check DevTools computed styles on an element with that class |
| Does `@font-face` in the page Settings > Header Code field load the font on published page? | Same as above | Include `@font-face { font-family:'GCRETest'; src:url(data:font/woff2;base64,<tiny-woff2>) format('woff2'); }` in spike header; verify via DevTools > Network tab (no 404) and computed style on a test element |
| Does `<script>` in the page Settings > Header Code field execute on published page? | Same as above | Include `<script>(function(){ window.__gcreSpike = true; })()</script>` in header; verify via DevTools Console: `window.__gcreSpike === true` |
| Does a `<style>` block in a body Custom Code element render correctly on the published page (not just preview)? | Assumed working from existing hero block, but never formally verified in this account post-publish | Include `.gcre-spike-body { outline: 3px solid lime; }` in a body block; check on published URL |

### Spike Snippet Specification

The spike is a single self-contained test. Alex pastes two things:

**Into page Settings > Header Code:**
```html
<style>
  :root { --gcre-spike-color: #1FA9C4; }
  .gcre-spike-head { color: var(--gcre-spike-color) !important; border: 2px solid var(--gcre-spike-color); padding: 4px 8px; }
</style>
<script>
  (function(){ window.__gcreSpike = { headerScript: true, ts: Date.now() }; })();
</script>
```

**Into a body Custom Code element (first element on page):**
```html
<div class="gcre-spike-body gcre-spike-head">
  GCRE Spike: if this text is teal and has a teal border, header CSS cascaded.
  If this box has a green outline, body block style worked.
</div>
<style>
  .gcre-spike-body { outline: 3px solid lime; font-family: 'GCREScriptTest', 'Georgia', serif; font-style: italic; font-size: 18px; }
  @font-face {
    font-family: 'GCREScriptTest';
    /* tiny woff2 base64 — use a real 1-glyph woff2 for the actual spike */
    src: url('data:font/woff2;base64,d09GMgABAAAAAAIsAA4AAAAABN') format('woff2');
  }
</style>
<script>
  (function(){
    if (!window.__gcreSpike) { window.__gcreSpike = {}; }
    window.__gcreSpike.bodyScript = true;
    window.__gcreSpike.bodyStyleApplied = getComputedStyle(document.currentScript.previousElementSibling).color;
    console.log('[gcre-spike]', JSON.stringify(window.__gcreSpike));
  })();
</script>
```

**DevTools verification checklist (on the published URL, not preview):**
1. Elements panel: `.gcre-spike-head` element — computed `color` should be `rgb(31, 169, 196)` (teal) → confirms header CSS + CSS variables cascaded
2. Elements panel: `.gcre-spike-body` element — computed `outline` should be `3px solid lime` → confirms body block `<style>` works
3. Console: `window.__gcreSpike.headerScript === true` → confirms header `<script>` ran
4. Console: `window.__gcreSpike.bodyScript === true` → confirms body block `<script>` ran (as sibling to div)
5. Console: `window.__gcreSpike.bodyStyleApplied` → should not be `rgb(0, 0, 0)` → confirms CSS var cascade to body element

**Results to record in `knowledge/ghl-notes.md`:** Pass/fail for each of the 5 checks, plus any console errors, plus the published URL used for the test.

---

## Standard Stack

No external packages are installed into GHL pages (no npm, no bundler). The "stack" for this phase is:

### Core
| Tool | Version | Purpose | Why Standard |
|------|---------|---------|--------------|
| CSS Custom Properties | Native (all modern browsers) | Two-layer token system | The only viable theming mechanism in a no-build environment |
| `@font-face` + base64 woff2 | Native CSS | Self-contained script font embedding | No external URLs; works in GHL with no hosting dependency |
| fonttools / pyftsubset | 4.60.2 (installed, `python3 -m fonttools`) | Subset + convert font to woff2 | The standard Python tool; already available on this machine |
| BEM-ish prefixed classes | Convention | CSS scoping under `.gcre-*` | Established pattern from existing hero block; GHL docs confirm bare selectors break GHL UI |

### GHL Injection Points (in priority order per D-05)
| Location | How to Access | Confirmed Working | Scope |
|----------|--------------|-------------------|-------|
| Page Settings > Header Code | Gear icon in page builder > Header Code field | [ASSUMED — spike required] | Page-wide, injected client-side |
| Body Custom Code element (top of page) | Drag-and-drop HTML element, placed first | [HIGH] Existing hero uses this | Page-wide if placed first and CSS/JS use `document` scope |
| Funnel Settings > Custom CSS | Funnel-level settings panel | [MEDIUM] Documented in community sources | All pages in funnel |

### No External Packages
This phase installs nothing to GHL. All deliverables are inline HTML/CSS/JS. fonttools is a local development tool (subsetting only — the resulting base64 string is what ships).

---

## Package Legitimacy Audit

> No packages are installed into GHL pages in this phase. fonttools is a local development tool used only to subset and encode the font file offline; it does not ship to GHL.

| Package | Registry | Age | Downloads | Source Repo | slopcheck | Disposition |
|---------|----------|-----|-----------|-------------|-----------|-------------|
| fonttools | PyPI | 15+ yrs | Very high | github.com/fonttools/fonttools | N/A — not shipped to GHL | Approved (local dev tool only) |
| brotli | PyPI | 8+ yrs | Very high | github.com/google/brotli | N/A — not shipped to GHL | Approved (fonttools dependency) |

**Packages removed due to slopcheck:** none
**Packages flagged as suspicious:** none

---

## Architecture Patterns

### System Architecture Diagram

```
GHL Published Page
│
├── [HEAD injection] Page Settings > Header Code
│     └── Foundation block (00-foundation.html)
│           ├── <style> :root { --gcre-palette-* } </style>        ← palette layer
│           ├── <style> :root { --gcre-semantic-* } </style>        ← semantic layer
│           ├── <style> @font-face { 'GCREScript', base64 woff2 } </style>
│           ├── <style> .gcre * { box-sizing:border-box; } + resets </style>
│           ├── <style> .gcre-script { font-family:'GCREScript'... } + utilities </style>
│           └── <script>(function(){ window.GCRE = window.GCRE||{}; })()</script>
│
├── [BODY] Custom Code elements (top → bottom)
│     ├── Component block (hero.html)
│     │     ├── <div class="gcre-block gcre-hero">          ← consumes :root tokens
│     │     │     <!-- block markup + .gcre-script utility usage -->
│     │     ├── <style>
│     │     │     .gcre-hero {
│     │     │       --gcre-bg: var(--gcre-navy-700, #0c2236);  ← HYBRID: Foundation wins / literal fallback
│     │     │       --gcre-accent: var(--gcre-teal-500, #1FA9C4);
│     │     │     }
│     │     │     /* component styles consume only --gcre-semantic-* vars */
│     │     └── <script>(function(){ /* IIFE, re-entry guard, NO Foundation JS dependency */ })()</script>
│     │
│     └── [more component blocks...]
│
└── Browser renders: Foundation tokens cascade through all blocks;
    blocks degrade gracefully to literal fallbacks if Foundation absent.
```

**Key data flow:** Foundation `<style>` injects `:root` custom properties → component `<style>` reads them via `var()` → hybrid fallback chain means each component survives in isolation.

### Recommended Project Structure (new this phase)

```
design-system/
  README.md                      # how it works, paste order, hybrid contract
  CHANGELOG.md                   # version history
  foundation/
    00-foundation.html            # THE deliverable: paste into GHL page Header Code
    tokens.reference.css          # human-readable token list (not pasted into GHL)
    font-notes.md                 # font choice, license, subset method, base64 process
  _component-template.html        # supersedes funnels/03-re-summit/.../blocks/_template.html
```

### Pattern 1: Two-Layer Token Architecture

**What:** Palette layer defines raw color/scale values. Semantic layer maps palette to intent. Components consume only semantic layer.

```css
/* Source: approved design spec (were-a-bit-far-majestic-bonbon.md) */

/* Layer 1: Palette — raw values, never consumed directly by components */
:root {
  --gcre-navy-900: #06111f;
  --gcre-navy-800: #0a2034;  /* page background */
  --gcre-navy-700: #0c2236;  /* hero background */
  --gcre-navy-600: #0f2d47;
  --gcre-teal-500: #1FA9C4;  /* D-01: brand accent */
  --gcre-teal-400: #36c3f3;  /* hover state */
  --gcre-white:    #ffffff;
  --gcre-ink:      #04122e;  /* dark text on light CTA */
  /* ... spacing, radius, type scale tokens */
}

/* Layer 2: Semantic — intent-based aliases, the ONLY layer components import */
:root {
  --gcre-bg:         var(--gcre-navy-800);
  --gcre-surface:    var(--gcre-navy-700);
  --gcre-accent:     var(--gcre-teal-500);   /* every CTA, every script word */
  --gcre-accent-hover: var(--gcre-teal-400);
  --gcre-text:       var(--gcre-white);
  --gcre-text-muted: rgba(255,255,255,0.72);
  --gcre-cta-bg:     var(--gcre-teal-500);
  --gcre-cta-ink:    var(--gcre-ink);
}
```

**When to use:** Always. Components never reference palette tokens directly — only semantic tokens. This is what enables per-funnel re-skinning via `.gcre-theme-*` overrides later.

### Pattern 2: Hybrid Fallback Contract (FND-04)

**What:** Each component declares its own semantic tokens as `var(--semantic, var(--palette, #literal))`. Foundation wins when present; literal fires when Foundation is absent. No component may depend on Foundation JS.

```css
/* Source: approved design spec (were-a-bit-far-majestic-bonbon.md) */
/* Applied on the component's outer wrapper — not on :root */
.gcre-hero {
  /* Read semantic → palette → literal. Foundation presence determines which fires. */
  --gcre-bg:     var(--gcre-navy-800, #0a2034);
  --gcre-accent: var(--gcre-teal-500, #1FA9C4);
  --gcre-text:   var(--gcre-white,    #ffffff);
  /* Then consume own tokens internally */
  background: var(--gcre-bg);
  color: var(--gcre-text);
}
```

**Cascade behavior confirmed [CITED: MDN developer.mozilla.org/en-US/docs/Web/CSS/Using_CSS_custom_properties]:** If `:root` defines `--gcre-navy-800`, that value is inherited by all descendants and wins — the `#0a2034` literal is never reached. If `:root` is absent (Foundation stripped), `var(--gcre-navy-800)` is invalid at computed-value time and the next fallback (`#0a2034`) is used. This is precisely the behavior required by FND-04.

**Important gotcha [CITED: MDN]:** An invalid value for a custom property (wrong type but property IS defined) still beats the fallback. Mitigation: all token values are simple colors or lengths — type conflicts are not possible with consistent declarations.

### Pattern 3: Script Tag Placement (GHL Restriction)

**What:** GHL validator blocks `<script>` nested inside `<div>`. The script must be a sibling.

```html
<!-- Source: [CITED: help.gohighlevel.com/support/solutions/articles/48001159729] -->

<!-- WRONG — GHL blocks this -->
<div class="gcre-foundation">
  <script>(function(){ /* ... */ })()</script>  <!-- nested: fails validation -->
</div>

<!-- CORRECT for body Custom Code element -->
<div class="gcre-foundation-anchor"></div>
<style>
  /* All Foundation CSS here — style tag is NOT subject to the script-in-div rule */
  :root { --gcre-accent: #1FA9C4; }
</style>
<script>
  (function(){
    if (window.GCRE) return;
    window.GCRE = { v: '1.0', ready: true };
  })();
</script>
```

**Note on existing hero block:** The existing `01-hero.html` places `<script>` inside the outer `<div class="gcres-block gcres-hero">`. This appears to work in the existing build. The GHL restriction may apply specifically to GHL-owned div elements vs. divs we declare — the spike will surface this. The Foundation block should use the sibling pattern to be safe.

**Note on Header Code field:** If `<script>` in the Header Code field is executed (spike to confirm), there is no div wrapper at all — the tags go directly into the field. The sibling restriction should not apply there.

### Pattern 4: Scoped Reset and Utilities

**What:** All reset and utility styles scoped under `.gcre` prefix — never bare tag selectors.

```css
/* Source: confirmed pattern from blocks/README.md + GHL collision docs */

/* WRONG — breaks GHL's own page styles */
* { box-sizing: border-box; }
h1 { margin: 0; }
button { appearance: none; }

/* CORRECT — scoped under .gcre, never leaks */
.gcre-block *, .gcre-block *::before, .gcre-block *::after {
  box-sizing: border-box;
}

/* Utility classes */
.gcre-script {
  font-family: 'GCREScript', 'Georgia', 'Cambria', 'Times New Roman', serif;
  font-style: italic;
  font-weight: 400;
  line-height: 1.1;
}
.gcre-container {
  max-width: 1140px;
  margin: 0 auto;
  padding: 0 clamp(16px, 4vw, 40px);
}
.gcre-visually-hidden {
  position: absolute; width: 1px; height: 1px;
  padding: 0; margin: -1px; overflow: hidden;
  clip: rect(0,0,0,0); white-space: nowrap; border: 0;
}
```

### Anti-Patterns to Avoid

- **Bare tag selectors in Foundation:** `h1 {}`, `p {}`, `div {}`, `button {}`, `a {}` — confirmed to collide with GHL's own element selectors and break page rendering. Scope everything under `.gcre-block *` or prefixed classes.
- **`<script>` nested inside `<div>` in a Custom Code body element:** GHL validator blocks this. Use sibling placement.
- **Components importing Foundation JS:** Each block must have its own IIFE with re-entry guard. The `window.GCRE` stub is for namespace check only.
- **Depending on CSS variables without a literal fallback:** If Foundation is absent and there is no literal fallback, the property resolves to its inherited value (often unexpected). Always include the literal: `var(--gcre-accent, #1FA9C4)`.
- **Pasting `<html>`, `<head>`, or `<body>` tags into a GHL code block:** These are stripped or cause nesting issues. GHL code blocks are fragment slots.
- **`@import` for Google Fonts in a code block:** Creates an external dependency. The base64 `@font-face` approach is the correct self-contained path per CLAUDE.md §3.

---

## Script Font — Self-Hosted Woff2

### Font Selection

| Font | License | Style | Verdict |
|------|---------|-------|---------|
| Playfair Display Italic | SIL OFL 1.1 [CITED: fonts.google.com] | High-contrast serif italic, elegant | **Default pick (D-03)** |
| Cormorant Garamond Italic | SIL OFL 1.1 [ASSUMED] | Extremely refined, lighter weight | Strong alternative — weigh during build |
| Libre Caslon Display Italic | SIL OFL 1.1 [ASSUMED] | Robust slab serif italic | Less flowing than Playfair/Cormorant |

**OFL 1.1 permits:** Embedding as base64 in CSS served from any origin. No web font license required. Modification and subsetting allowed. [CITED: scripts.sil.org/OFL]

### Obtaining the Font File

**Option A (recommended):** Download woff2 directly from Google Fonts Helper — a trusted redistributor of Google Fonts files in woff2 format: `https://gwfh.mranftl.com/fonts/playfair-display?subsets=latin` — download the italic variant woff2. [ASSUMED that this specific URL yields the italic variant — verify during task execution]

**Option B:** Download from the official GitHub repo: `https://github.com/fonts/Playfair-Display/tree/master/WOFF2` — confirm `PlayfairDisplay-Italic.woff2` is present. [CITED: github.com/fonts/Playfair-Display — repo exists]

**Option C:** Use `fonttools` to generate from the TTF/OTF source on Google Fonts directly (download the `.ttf` bundle from fonts.google.com and run pyftsubset).

### Subsetting Command

```bash
# Source: pyftsubset documentation; font subsetting community sources
# fonttools 4.60.2 is installed at python3 -m fonttools

python3 -m fonttools.subset PlayfairDisplay-Italic.ttf \
  --output-file=gcre-script-italic.woff2 \
  --flavor=woff2 \
  --unicodes="U+0020-007E,U+00A0-00FF,U+2013-2014,U+2018-201F,U+2026,U+20AC" \
  --layout-features="kern,liga,calt" \
  --no-hinting

# Or using the script directly (if added to PATH):
# pyftsubset PlayfairDisplay-Italic.ttf --output-file=... [same flags]
```

**Unicode range:** Basic Latin (printable ASCII) + Latin-1 Supplement (accented chars) + common punctuation (em/en dash, smart quotes, ellipsis, euro sign). Sufficient for all English marketing copy.

**Expected output size:** ~20–35 KB woff2 file based on community subsetting case studies. [MEDIUM confidence — varies by font; actual size determined at build time]

### Base64 Encoding

```bash
# macOS / Linux
base64 -i gcre-script-italic.woff2 | tr -d '\n' > gcre-script-italic.b64

# Then embed in CSS:
# src: url('data:font/woff2;base64,<PASTE_B64_CONTENT>') format('woff2');
```

**Estimated base64 size:** ~28–48 KB of inline CSS text (base64 adds ~33% overhead). This sits inside a `<style>` tag in the Foundation block. GHL does not document a character limit for the Header Code field or body Custom Code elements — empirically, no published limit has been found in community sources. [ASSUMED no hard character limit below 50 KB — spike will surface any issues]

### @font-face Declaration Template

```css
/* Source: MDN @font-face spec + font subsetting best practices */
@font-face {
  font-family: 'GCREScript';
  src: url('data:font/woff2;base64,<BASE64_DATA_HERE>') format('woff2');
  font-style: italic;
  font-weight: 400;
  font-display: swap;
  unicode-range: U+0020-007E, U+00A0-00FF, U+2013-2014, U+2018-201F, U+2026, U+20AC;
}
```

**`font-display: swap`:** [CITED: MDN] Browser shows fallback font immediately; swaps in GCREScript once loaded. This is the correct value for a display font used in marketing headlines — eliminates invisible text flash.

### Fallback Stack

```css
/* Usage on .gcre-script utility and any element that uses the script font */
font-family: 'GCREScript', 'Georgia', 'Cambria', 'Times New Roman', serif;
font-style: italic;
```

`Georgia Italic` renders at high quality on all platforms and is a strong fallback for a serif italic display font — closer to Playfair Display's character than a generic `serif`. `Cambria` serves Windows users with a similar contrast profile. `Times New Roman` as final named fallback before the generic `serif` bucket. [MEDIUM confidence — fallback aesthetic judgment, not a spec claim]

---

## CSS Custom Property Fallback Contract — Deep Dive

### The Mechanics (Confirmed)

[CITED: MDN developer.mozilla.org/en-US/docs/Web/CSS/Using_CSS_custom_properties]

```
var(--gcre-navy-800, #0a2034)
    └─ if --gcre-navy-800 is defined AND valid → use its computed value
    └─ if --gcre-navy-800 is NOT defined → use #0a2034 (literal fallback)
    └─ if --gcre-navy-800 IS defined but with INVALID value → use inherited value (NOT the literal!)
```

**For our case:** All tokens are colors (`#hex`) or lengths (`clamp(...)` / `px`). As long as palette tokens are declared consistently as the correct CSS type, invalid-value behavior never triggers. The risk is zero in practice.

### Cascade Shadowing (How Foundation Wins)

```
:root { --gcre-navy-800: #0a2034; }      ← Foundation declares palette token

.gcre-hero {                              ← Component wrapper (any element)
  --gcre-bg: var(--gcre-navy-800, #0a2034);  ← reads from :root — Foundation wins
  background: var(--gcre-bg);
}
```

When Foundation is absent:
```
/* :root has no --gcre-navy-800 */
.gcre-hero {
  --gcre-bg: var(--gcre-navy-800, #0a2034);  ← --gcre-navy-800 undefined → #0a2034 used
  background: var(--gcre-bg);               ← --gcre-bg is #0a2034 → correct
}
```

**Cross-browser safety:** CSS custom properties are supported by all browsers with >93% global usage as of the research date. IE11 is the only outlier; it does not support custom properties at all. The literal fallbacks do not help IE11 (it ignores the entire `var()` expression). IE11 is not a target for this project. [CITED: MDN]

### Scoping Options

Three valid scoping patterns — all equivalent in behavior for this project:

```css
/* Option A: Scope on :root (page-wide Foundation) */
:root { --gcre-accent: #1FA9C4; }

/* Option B: Scope on a class (per-funnel theme override later) */
.gcre { --gcre-accent: #1FA9C4; }

/* Option C: Both (recommended) — :root for defaults, .gcre for override hook */
:root { --gcre-accent: #1FA9C4; }
.gcre-theme-summit { --gcre-accent: #1BB4ED; }  /* future per-funnel override */
```

**Recommendation:** Declare all tokens on `:root` in the Foundation. The `.gcre` scope class on the body or a wrapper div enables per-funnel theme overrides later (the deferred `.gcre-theme-*` pattern) without any token re-declaration in Phase 1.

---

## Don't Hand-Roll

| Problem | Don't Build | Use Instead | Why |
|---------|-------------|-------------|-----|
| Font subsetting + woff2 encoding | Custom script or online converter | `python3 -m fonttools.subset` (fonttools 4.60.2, installed) | Handles Unicode ranges, OpenType features, binary accuracy |
| base64 encoding the font | Python/JS encode loop | `base64 -i file.woff2 \| tr -d '\n'` (macOS built-in) | One line; no errors |
| CSS token documentation | Prose comments in Foundation | `design-system/foundation/tokens.reference.css` (not pasted to GHL) | Separation of human-readable docs from the paste-ready deliverable |
| Cross-block CSS variable reset | Global `*` reset in each block | Scoped `.gcre-block *, .gcre-block *::before` reset once in Foundation | Prevents per-block duplication; survives Foundation-absent via blocks' own box-sizing |
| IIFE namespace isolation | Global variable in each block | `window.GCRE = window.GCRE \|\| {}` pattern established in Foundation | Consistent namespace; blocks check, not define |

**Key insight:** The no-build constraint means there is no tree-shaking, no deduplication, no bundler. The Foundation is the one place where shared infrastructure lives. Resist the urge to inline everything redundantly in each block — blocks declare only their own fallback tokens and their own IIFE guard.

---

## Common Pitfalls

### Pitfall 1: Testing CSS in Builder Preview vs. Published Page
**What goes wrong:** Styles and scripts work in the GHL page builder preview but fail on the published URL.
**Why it happens:** GHL's builder preview and the published page use different rendering contexts. Tracking codes and header code are injected client-side — they appear in DevTools on the live page but not in the static source. The builder preview may not execute all custom code.
**How to avoid:** ALWAYS test on the published page URL, not the builder preview. Use DevTools Elements and Console tabs, not view-source. This is what VRF-02 (the spike) is designed to address.
**Warning signs:** Code "works in preview" but produces visible errors or blank sections after publishing.

### Pitfall 2: Nesting `<script>` Inside `<div>` in a Body Code Element
**What goes wrong:** GHL's validator silently strips or blocks the `<script>` — the script never runs.
**Why it happens:** GHL explicitly documented this restriction: `<script>` tags inside `<div>` tags do not work in the funnel/website builder.
**How to avoid:** In any body Custom Code element, place `<script>` as a sibling AFTER the wrapper div, not nested inside it. The Foundation's small `<div class="gcre-foundation-anchor"></div>` placeholder + sibling `<script>` pattern follows this rule.
**Warning signs:** `console.warn` in the IIFE never fires; `window.GCRE` is undefined; no errors either — the script just never ran.

### Pitfall 3: CSS Variables in GHL's Visual Builder UI vs. in Custom Code
**What goes wrong:** Team member tries to reference `var(--gcre-accent)` in GHL's own color picker UI and it fails, leading to the conclusion that CSS variables "don't work in GHL."
**Why it happens:** GHL's typography/color picker controls do not accept `var(--x)` as input values — this is a UI limitation. The underlying CSS engine on the published page executes CSS custom properties correctly.
**How to avoid:** CSS variables work in custom code blocks — use them there. Never try to reference them via GHL's builder UI controls.
**Warning signs:** `var(--gcre-accent)` typed into a GHL color field is rejected or shows as literal text.

### Pitfall 4: base64 Font Breaking the Style Block
**What goes wrong:** A very long base64 string inside a `<style>` tag causes the GHL code editor or the block to behave unexpectedly (truncation, encoding artifacts).
**Why it happens:** No documented character limit, but extremely long strings (>100 KB) may hit undocumented limits in the GHL code editor's textarea or in the client-side injection pipeline.
**How to avoid:** Subset aggressively to Latin only. Target woff2 < 35 KB (base64 < 48 KB). Test the font block in the spike. Store the base64 string in `design-system/foundation/font-notes.md` with the generation command so it can be regenerated if needed.
**Warning signs:** Font does not load, `@font-face` is not in DevTools > Network > Fonts, or the style block appears truncated in DevTools Elements.

### Pitfall 5: Bare-Tag Selectors Leaking Into GHL UI
**What goes wrong:** A reset like `* { box-sizing: border-box; }` or `a { color: inherit; }` in the Foundation breaks GHL's own navigation elements, dropdowns, form labels, or error messages — often invisibly until a user submits a form or hovers a nav item.
**Why it happens:** GHL renders its own UI elements (forms, navigation, alerts) into the same DOM as the custom code. Bare tag selectors apply to GHL elements too.
**How to avoid:** All selectors in the Foundation must be prefixed: `.gcre-block *`, `.gcre-container`, etc. Never `*`, never bare `h1`, `p`, `a`, `button`, `input`.
**Warning signs:** GHL's own buttons look unstyled; form error messages disappear; page navigation breaks after adding the Foundation.

### Pitfall 6: Font Fallback Not Italic
**What goes wrong:** Fallback font renders in roman (upright) style instead of italic when the custom script font fails to load, ruining the layout.
**Why it happens:** `font-family` fallback chain specifies the family but not the style. The browser picks the closest match — which may be the roman weight if italic glyph is not available in the fallback.
**How to avoid:** Always pair `font-family: 'GCREScript', Georgia, serif;` with `font-style: italic;` on the same element. `font-display: swap` means the fallback is displayed immediately, so its style must be correct.
**Warning signs:** Script accent words appear upright instead of italic when the custom font is blocked.

---

## Code Examples

### Foundation Block Structure (Skeleton)

```html
<!-- 
  GCRE DESIGN SYSTEM — FOUNDATION v1.0
  Install once per page: paste into Page Settings > Header Code (preferred)
  or as the FIRST Custom Code element in the page body.
  This block defines: palette tokens, semantic tokens, @font-face (GCREScript),
  scoped reset, utility classes, window.GCRE namespace stub.
-->

<style>
  /* ─── Layer 1: Palette ─────────────────────────────────────────── */
  :root {
    --gcre-navy-900: #06111f;
    --gcre-navy-800: #0a2034;
    --gcre-navy-700: #0c2236;
    --gcre-navy-600: #0f2d47;
    --gcre-teal-500: #1FA9C4;
    --gcre-teal-400: #36c3f3;
    --gcre-white:    #ffffff;
    --gcre-ink:      #04122e;

    /* Spacing scale */
    --gcre-space-1: 4px;
    --gcre-space-2: 8px;
    --gcre-space-3: 16px;
    --gcre-space-4: 24px;
    --gcre-space-5: 40px;
    --gcre-space-6: 64px;

    /* Radius */
    --gcre-radius-sm: 6px;
    --gcre-radius-md: 12px;
    --gcre-radius-lg: 20px;
  }

  /* ─── Layer 2: Semantic ────────────────────────────────────────── */
  :root {
    --gcre-bg:           var(--gcre-navy-800);
    --gcre-surface:      var(--gcre-navy-700);
    --gcre-accent:       var(--gcre-teal-500);
    --gcre-accent-hover: var(--gcre-teal-400);
    --gcre-text:         var(--gcre-white);
    --gcre-text-muted:   rgba(255,255,255,0.72);
    --gcre-cta-bg:       var(--gcre-teal-500);
    --gcre-cta-ink:      var(--gcre-ink);
  }

  /* ─── Script Font ──────────────────────────────────────────────── */
  @font-face {
    font-family: 'GCREScript';
    src: url('data:font/woff2;base64,<BASE64_WOFF2_HERE>') format('woff2');
    font-style: italic;
    font-weight: 400;
    font-display: swap;
    unicode-range: U+0020-007E, U+00A0-00FF, U+2013-2014, U+2018-201F, U+2026, U+20AC;
  }

  /* ─── Scoped Reset ─────────────────────────────────────────────── */
  /* NOTE: .gcre-block is added to each component's outer wrapper */
  .gcre-block *, .gcre-block *::before, .gcre-block *::after {
    box-sizing: border-box;
  }
  .gcre-block img, .gcre-block video { max-width: 100%; display: block; }

  /* ─── Utilities ────────────────────────────────────────────────── */
  .gcre-script {
    font-family: 'GCREScript', 'Georgia', 'Cambria', 'Times New Roman', serif;
    font-style: italic;
    font-weight: 400;
    line-height: 1.1;
  }
  .gcre-container {
    width: 100%;
    max-width: 1140px;
    margin: 0 auto;
    padding: 0 clamp(16px, 4vw, 40px);
  }
  .gcre-sr-only {
    position: absolute; width: 1px; height: 1px;
    padding: 0; margin: -1px; overflow: hidden;
    clip: rect(0,0,0,0); white-space: nowrap; border: 0;
  }
</style>

<!-- Minimal anchor div (no content — Foundation is infrastructure only) -->
<div class="gcre-foundation" aria-hidden="true"></div>

<!-- Script is a SIBLING to the div, NOT nested inside it (GHL restriction) -->
<script>
  (function(){
    if (window.GCRE) return;
    window.GCRE = {
      v: '1.0',
      ready: true
    };
  })();
</script>
```

### Component Hybrid Fallback Token Pattern

```html
<!-- How every Phase 2+ component block declares its fallback tokens -->
<!-- Source: approved design spec (were-a-bit-far-majestic-bonbon.md) -->
<div class="gcre-block gcre-hero">
  <!-- markup -->
</div>
<style>
  /*
   * Hybrid fallback tokens — Foundation wins when present, literal fires when absent.
   * Per-component: only declare the tokens THIS component actually uses.
   */
  .gcre-hero {
    --gcre-bg:           var(--gcre-navy-800,  #0a2034);
    --gcre-surface:      var(--gcre-navy-700,  #0c2236);
    --gcre-accent:       var(--gcre-teal-500,  #1FA9C4);
    --gcre-accent-hover: var(--gcre-teal-400,  #36c3f3);
    --gcre-text:         var(--gcre-white,      #ffffff);
    --gcre-text-muted:   rgba(255,255,255,0.72);  /* no palette token needed */

    /* Now consume semantic tokens */
    background: var(--gcre-bg);
    color: var(--gcre-text);
  }
</style>
<script>
  (function(){
    /* Each block has its own re-entry guard — NEVER relies on window.GCRE being set */
    if (window.__gcreHero) return; window.__gcreHero = true;
    /* block-specific JS only */
  })();
</script>
```

---

## State of the Art

| Old Approach | Current Approach | When Changed | Impact |
|--------------|------------------|--------------|--------|
| External Google Fonts `<link>` in GHL custom code | Native GHL font upload (woff2) OR base64 `@font-face` | GHL native font support: rollout ~2024-2025 | External link approach works but creates external dependency; base64 eliminates it; native upload is element-by-element via builder UI |
| Global CSS reset in custom blocks | Scoped reset under prefixed wrapper classes | GHL confirmed bare-tag collision risk (ongoing) | Must never use bare tags; `.gcre-block *` is the only safe reset scope |
| `DOMContentLoaded` for GHL block JS | `hydrationDone` event for preview context | GHL introduced hydrationDone (doc updated ~2024) | Critical for DOM manipulation scripts; `window.GCRE` namespace stub does not manipulate DOM so this is Phase 2 concern |

**Deprecated/outdated in this project's context:**
- `@import url('https://fonts.googleapis.com/...')` — creates external dependency, violates self-contained constraint of CLAUDE.md §3
- `gcres-` prefix — being renamed to `gcre-` (vertical-wide) in this phase
- `_template.html` in `funnels/03-re-summit/.../blocks/` — superseded by `design-system/_component-template.html`

---

## Environment Availability

| Dependency | Required By | Available | Version | Fallback |
|------------|------------|-----------|---------|----------|
| Python 3 | fonttools subsetting | Yes | 3.9.6 | — |
| fonttools (pyftsubset) | FND-02 (subset woff2) | Yes (importable) | 4.60.2 | Online subsetter at everythingfonts.com/font-face |
| brotli (woff2 compression) | fonttools woff2 output | Yes (installed with fonttools) | — | — |
| base64 CLI | Encoding woff2 | Yes | macOS built-in | Python: `import base64; base64.b64encode(open('f.woff2','rb').read()).decode()` |
| Chrome DevTools MCP | VRF-02 spike verification | [ASSUMED available] | — | Manual DevTools inspection on published URL |
| GHL test funnel page | VRF-02 spike | Requires Alex to create | — | No fallback — spike is blocked until Alex creates the test page |

**pyftsubset invocation:** Not on PATH but importable; use `python3 -m fonttools.subset` instead of the `pyftsubset` binary.

**Missing dependencies with no fallback:**
- GHL test funnel page — Alex must create this before the spike task can execute. This is the one human-gated dependency for Phase 1.

---

## Open Questions

1. **Does the page Settings > Header Code field survive to published page?**
   - What we know: Client-side injection is confirmed; docs say tracking code goes there and fires
   - What's unclear: Whether a `<style>` block (not just `<script>`) in that field actually renders on the published page; whether GHL sanitizes anything in that field
   - Resolution: VRF-02 spike task — Alex must run it before D-05 can be confirmed

2. **Is there a character limit on GHL Header Code or Custom Code element?**
   - What we know: No explicit documented limit; GHL Media Storage has practical limits but that's for uploaded files
   - What's unclear: Whether the Header Code textarea or the body code element has a hidden limit that would truncate a ~48 KB base64 string
   - Resolution: The spike will surface this if the base64 font string fails to load

3. **Does the existing `01-hero.html` `<script>`-inside-`<div>` pattern actually work, or is it silently failing?**
   - What we know: GHL docs say `<script>` inside `<div>` does not work; the hero block does exactly this
   - What's unclear: Whether the outer `gcres-block` div is treated as the Custom Code container boundary (in which case GHL allows the script) or as a real nested div (in which case the script is blocked silently)
   - Resolution: Spike + Chrome DevTools Console — check if `window.__gcresHero` is set to `true` on a page that has the hero block pasted in

4. **Cormorant Garamond vs. Playfair Display for the script accent font — final pick**
   - What we know: Both are OFL 1.1; both are high-contrast serif italics; Playfair is the default (D-03)
   - What's unclear: Which reads better at the rendering's "Cash Flowing" / "With Grant Cardone" scale in the actual dark-navy context
   - Resolution: Claude's discretion during the Foundation build — render both in the `.preview/` harness and apply the design-taste skill

---

## Project Constraints (from CLAUDE.md)

The following CLAUDE.md directives constrain all planning and implementation decisions in this phase:

| Directive | Section | Impact on This Phase |
|-----------|---------|----------------------|
| Everything ships as self-contained GHL paste-ready blocks — inline CSS/JS, no build step, no framework, no bundler | §3 | Foundation is one HTML file; base64 font embed is mandatory; no `@import`, no external URLs |
| No Vercel, Supabase, Next.js, external hosting, databases | §3 | All font files and assets live in the repo; nothing is hosted externally |
| CSS variables for colors so re-theming works | §6 | Two-layer token system is directly aligned; all color values must use CSS vars |
| Keep code blocks easy to re-theme (pending Paige's guidelines) | §6 | Semantic token layer is the re-theming hook; token values are proposed-pending-Paige, structure is final |
| Commit and push `knowledge/` updates at end of meaningful sessions | §5 | Spike results must be recorded to `knowledge/ghl-notes.md` and committed |
| Never commit secrets | §7 | No secrets involved in this phase |

---

## Validation Architecture

> `workflow.nyquist_validation` key is absent from `.planning/config.json` (no config.json found) — treating as enabled per protocol.

### Test Framework

| Property | Value |
|----------|-------|
| Framework | Manual browser verification via Chrome DevTools MCP + `.preview/` local harness HTML files |
| Config file | None — no automated test runner; all validation is visual/manual per CLAUDE.md §3 constraints |
| Quick run command | Open `.preview/foundation-with-foundation.html` in browser; check DevTools |
| Full suite command | Open `.preview/foundation-bare.html` in browser; open `.preview/foundation-with-foundation.html`; publish spike; check DevTools on published URL |

> Note: No automated test framework (jest, vitest, pytest) applies to this phase. The "test" is manual GHL paste + DevTools verification. The `.preview/` harness provides a local pre-publish check.

### Phase Requirements to Test Map

| Req ID | Behavior | Test Type | Automated Command | File Exists? |
|--------|----------|-----------|-------------------|-------------|
| FND-01 | `:root` tokens defined; component reads `--gcre-accent` = teal | Manual / DevTools | Open harness, DevTools > Computed styles | Wave 0 gap |
| FND-02 | `@font-face` loads GCREScript; `.gcre-script` renders in italic serif | Manual / DevTools | DevTools > Network > Fonts tab; visual check | Wave 0 gap |
| FND-03 | `.gcre-container` + `.gcre-script` + `.gcre-sr-only` utilities present and scoped | Manual / DevTools | DevTools > Elements; check no GHL elements affected | Wave 0 gap |
| FND-04 | Component renders correctly with Foundation block removed from harness | Manual / DevTools | Open `foundation-bare.html`; check colors match literals | Wave 0 gap |
| VRF-02 | Spike: published GHL page shows header CSS cascaded + script ran | Manual / DevTools | Check `window.__gcreSpike` in Console; check computed styles | Wave 0 gap (requires Alex) |

### Wave 0 Gaps

- [ ] `.preview/foundation-with-foundation.html` — harness with Foundation block + a test component div; covers FND-01, FND-02, FND-03, FND-04 (with-foundation path)
- [ ] `.preview/foundation-bare.html` — same test component div WITHOUT Foundation block; covers FND-04 (bare fallback path)
- [ ] `design-system/foundation/00-foundation.html` — the deliverable itself (does not exist yet)
- [ ] `design-system/foundation/tokens.reference.css` — human-readable token reference (does not exist yet)
- [ ] `design-system/foundation/font-notes.md` — font choice, license, subset process (does not exist yet)

---

## Assumptions Log

| # | Claim | Section | Risk if Wrong |
|---|-------|---------|---------------|
| A1 | Page Settings > Header Code field preserves `<style>` and `<script>` on the published page | GHL Hosting Reality | Foundation must move to body Custom Code element (first block) — same deliverable, different GHL location |
| A2 | GHL has no character limit below 50 KB on Header Code or Custom Code element fields | Script Font | base64 font string (~28–48 KB) may be truncated; would require GHL native font upload as fallback |
| A3 | The existing `01-hero.html` `<script>`-inside-`<div>` pattern actually executes (window.__gcresHero is set) | GHL Hosting Reality | Hero block's JS guard is silently failing; need to migrate to sibling pattern |
| A4 | Cormorant Garamond Italic woff2 is available under OFL 1.1 for download | Standard Stack | Alternative picks (Libre Caslon Display) may be needed if license confirmation fails |
| A5 | Google Fonts Helper (gwfh.mranftl.com) serves the specific Playfair Display Italic variant woff2 | Standard Stack | Fall back to Option B (GitHub fonts/Playfair-Display repo) or Option C (subset from TTF directly) |
| A6 | Latin subset of Playfair Display Italic produces a woff2 of 20–35 KB | Script Font | If larger, reconsider subsetting strategy or switch to a lighter display font |
| A7 | Chrome DevTools MCP is available for spike verification | Validation Architecture | Manual DevTools inspection on published URL works as fallback |

---

## Sources

### Primary (HIGH confidence)
- [CITED: MDN — CSS Custom Properties](https://developer.mozilla.org/en-US/docs/Web/CSS/Using_CSS_custom_properties) — cascade/fallback mechanics, var() behavior, cross-browser support
- [CITED: MDN — var() function](https://developer.mozilla.org/en-US/docs/Web/CSS/var) — fallback chain syntax
- [CITED: GHL Support — Script not working / validation error](https://help.gohighlevel.com/support/solutions/articles/48001159729-script-not-working-custom-javascript-html-code-validation-error-troubleshooting) — `<script>` inside `<div>` restriction confirmed
- [CITED: GHL Support — hydrationDone event](https://help.gohighlevel.com/support/solutions/articles/155000002421-hydration-event-in-custom-code-in-funnels) — client-side injection timing; DOM manipulation guidance
- [CITED: GHL Support — Custom fonts in Funnels and Websites](https://help.gohighlevel.com/support/solutions/articles/155000005918-using-custom-font-in-funnels-and-websites) — native font upload; woff2 supported; element-by-element UI application
- [CITED: GHL Support — Tracking Scripts/Pixel Code](https://help.gohighlevel.com/support/solutions/articles/48000980311-tracking-scripts-pixel-code) — head/body code fields confirmed, client-side injection
- [CITED: SIL OFL 1.1](https://scripts.sil.org/OFL) — base64 embedding of OFL fonts confirmed permitted
- [CITED: github.com/fonts/Playfair-Display](https://github.com/fonts/Playfair-Display) — official Playfair Display woff2 source repository
- [CITED: GHL Ideas — Global CSS variables](https://ideas.gohighlevel.com/crm/p/support-global-css-custom-variables-across-funnel-pages) — confirms CSS variable limitation is a UI builder constraint, not a CSS execution constraint
- [CITED: nicoverbruggen.be — font subsetting](https://nicoverbruggen.be/blog/font-subsetting-on-the-web-made-easy) — pyftsubset command; 20 KB latin subset confirmed achievable
- [CITED: GHL Support — FAQs Funnels/Websites](https://help.gohighlevel.com/support/solutions/articles/155000004983-faqs-basic-troubleshooting-funnels-websites-webinars) — custom code in `c-custom-code` elements; head/footer tracking code as troubleshooting category

### Secondary (MEDIUM confidence)
- [theloadedlab.com — GHL native custom fonts rollout](https://theloadedlab.com/gohighlevel-rolls-out-native-custom-fonts-in-funnels-and-websites/) — native font feature detail; licensing note
- [sawankr.com — CSS in GHL](https://sawankr.com/courses/go-highlevel/how-to-make-gohighlevel-look-stunning-using-css) — page and funnel-level CSS injection points; `:root` custom property usage mentioned
- Community subsetting case studies — woff2 sizing; pyftsubset flag patterns

### Tertiary (LOW confidence — flagged [ASSUMED])
- Training knowledge on Cormorant Garamond and Libre Caslon Display OFL licensing
- Absence of a GHL character limit on code fields (no source found; not confirmed)

---

## Metadata

**Confidence breakdown:**
- Standard stack (CSS patterns, font mechanics): HIGH — from MDN and official GHL docs
- GHL header code field behavior: LOW — unconfirmed in official docs; spike-gated
- GHL body Custom Code element `<style>` behavior: MEDIUM — confirmed indirectly by existing working hero block
- Font subsetting workflow: HIGH — fonttools installed, command documented
- CSS var() fallback contract: HIGH — from MDN spec

**Research date:** 2026-06-19
**Valid until:** 2026-07-19 (GHL is actively updated; re-verify header code behavior if GHL releases a builder update)
