# GoHighLevel (GHL) Notes

_Last updated: 2026-06-19. Append GHL-specific gotchas and patterns as we discover them. Mark anything unverified with ⚠️ until confirmed in our actual GHL account._

## How we ship code to GHL
- GHL pages are built in the funnel/page builder. To run our own code, add a **Custom Code / HTML element** (or the page's custom CSS/JS settings) and paste a block from this repo.
- **Each block must be self-contained:** inline `<style>` and `<script>`, no external bundler, no `import`, no framework runtime. It has to work the instant it's pasted.
- **Scope your CSS** to avoid clashing with GHL's own styles — wrap markup in a unique class/ID (e.g. `.tx-optin-...`) and prefix all selectors. Avoid bare tag selectors like `div {}` or `h1 {}`.
- **Use CSS variables for color** so we can re-theme when Paige's brand guide lands (e.g. `--brand-blue: #...;`).
- Prefer vanilla JS. If you must wait for the DOM, guard with `DOMContentLoaded` since GHL injects content dynamically.

## Things to verify in our account (⚠️ unconfirmed)
- ⚠️ Exact custom-code element limits (size, whether `<script>` is sanitized/allowed on the plan we're on).
- ⚠️ How GHL merge tags / custom fields are referenced inside a code block, if we need dynamic values.
- ⚠️ Where tracking pixels (Meta/Google) are installed — page-level vs account-level — so our blocks don't double-fire events.
- ⚠️ Form submissions: whether we use GHL native forms (preferred for CRM capture) or a custom form posting to GHL.

## Testing
- Always preview the live GHL page (desktop **and** mobile) after pasting — the builder preview can differ from the published page.
- Keep the source of truth here in the repo; treat the GHL paste as a deployment of the repo block.

## Per-block convention
- File name describes the block: `hero.html`, `countdown-timer.html`, `optin-form.html`.
- Top of each file: a comment with what it is, which funnel/page/element it goes in, and the date.
