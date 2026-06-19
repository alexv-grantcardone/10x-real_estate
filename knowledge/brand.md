# Brand & Design Guidelines

_Last updated: 2026-06-19. **Status: PENDING.** Paige owns the official brand guidelines; they are not yet written down. Capture them here the moment they arrive, then update `CLAUDE.md` §6._

## What we know now
- **Primary palette: blues.** (Specific hex values TBD.)
- Nothing else is locked. Don't invent a full design language — keep it changeable.

## Build so it's easy to re-theme later
- Drive all colors from CSS variables at the top of each block, e.g.:
  ```css
  :root {
    --brand-blue: #1a4f8b;     /* placeholder — replace when Paige delivers */
    --brand-blue-dark: #0f3056;
    --brand-accent: #ffffff;
  }
  ```
- Reference `var(--brand-blue)` everywhere instead of hardcoding hex, so a single edit re-skins the block.

## To capture from Paige (checklist)
- [ ] Exact color hex values (primary blue, secondary, accent, neutrals)
- [ ] Typography (fonts, weights, sizes/scale)
- [ ] Logo usage / spacing
- [ ] Button styles, radius, shadows
- [ ] Imagery/photography direction
- [ ] Voice & tone for copy
