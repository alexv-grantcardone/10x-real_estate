# RE Summit — Opt-in page blocks (GHL paste-ready)

Each `.html` file here is **one GoHighLevel Custom Code / HTML element**. Copy the
file's contents, paste into the matching GHL element, publish. No build step.

## The standard (why blocks "just work" in GHL)

1. **Self-contained snippet** — HTML + inline `<style>` + inline `<script>` only.
   No `<html>/<head>/<body>`, no JSX/SCSS/TS, no imports/bundler, no external build.
2. **Scope every CSS rule** under one prefixed wrapper (`.gcres-<block>`). Never style
   bare tags (`h1`, `button`, `.btn`) — they collide with the GHL page's own styles.
   Use prefixed classes everywhere (`gcres-…`).
3. **JS in an IIFE with a re-entry guard** (`if (window.__gcresX) return;`). Keeps our
   code from leaking into / colliding with GHL's scripts (jQuery is on the page).
4. **Theme via CSS variables** on the wrapper. Brand = blues (pulled from the live page):
   `--gcres-blue:#023681; --gcres-blue-bright:#155EEF; --gcres-cyan:#1BB4ED;`
   Re-theme later by changing variables, not rules.
5. **Inline everything.** SVGs as markup/data-URI. `font-family: inherit` to pick up the
   page's Gotham, with a sans-serif fallback.
6. **Mobile-first + fluid.** `width:100%`, `clamp()` type, media queries inside the block.
   The block's width = whatever GHL column it sits in; never assume full viewport.
7. **CTAs are real `<a href>`** pointing at the checkout — destination set as a config
   line at the top of the block so it can never dead-end.

## Conventions
- Filenames: `NN-name.html` (e.g. `01-hero.html`, `02-benefits.html`) — one file per GHL element, top-to-bottom page order.
- `_template.html` is the starting skeleton — copy it to start a new block.
- Each block opens with a comment header: what it is, which GHL element it goes in, and any config (e.g. `CHECKOUT_URL`).

## Not our job (funnel gates — Cherlon/team own these)
A block going live still passes the funnel gates: Sohail's tracking code in the page →
Eylin live-test → Funnel push. Our blocks must not break tracking or the checkout link.
