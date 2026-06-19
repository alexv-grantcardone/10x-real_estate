# Phase 1: Foundation & GHL Reality - Discussion Log

> **Audit trail only.** Do not use as input to planning, research, or execution agents.
> Decisions are captured in CONTEXT.md — this log preserves the alternatives considered.

**Date:** 2026-06-19
**Phase:** 1-Foundation & GHL Reality
**Areas presented:** Script accent font, Brand accent color, GHL spike logistics, Foundation install location

---

Four gray areas were presented (multiSelect). The user **did not select any** — deferring all four
to Claude's discretion ("you decide, keep moving"). Recorded as discretion decisions in CONTEXT.md,
all overridable before planning. Alternatives considered below.

## Script accent font

| Option | Description | Selected |
|--------|-------------|----------|
| Refined display italic (Playfair-style) | High-contrast elegant italic — matches the V2 rendering | ✓ (Claude) |
| True cursive script (Great Vibes-style) | Loopy signature script | |
| Modern calligraphic (Caveat-style) | Casual handwritten | |

**Choice:** High-contrast OFL display italic; default **Playfair Display Italic**, finalized in the build (alts: Cormorant Garamond Italic, Libre Caslon Display Italic).

## Brand accent color

| Option | Description | Selected |
|--------|-------------|----------|
| Teal `#1FA9C4` | The V2 rendering's accent (newest, most intentional) | ✓ (Claude) |
| Cyan `#1BB4ED` | The live Summit page's accent | |
| Bright blue `#155EEF` | Live page secondary | |

**Choice:** Teal `#1FA9C4` as the single `--gcre-accent`; navy base from the rendering.

## GHL spike logistics

| Option | Description | Selected |
|--------|-------------|----------|
| Alex publishes a throwaway test page | Paste spike into header + body, publish, share URL; Claude verifies via DevTools | ✓ (Claude) |
| Reuse the existing preview page | Preview URL is not a *published* page — spike needs published | |
| Claude hands a snippet, Alex runs ad hoc | Less controlled | |

**Choice:** Alex publishes a throwaway test GHL page; Claude verifies the published page. Execution dependency on Alex.

## Foundation install location

| Option | Description | Selected |
|--------|-------------|----------|
| Page Header / Custom Code | Loads once, page-wide | ✓ (Claude) |
| Top-of-body code block | Fallback if header CSS is stripped | (conditional) |

**Choice:** Header / Custom Code, with the top-of-body block as the spike-gated fallback.

## Claude's Discretion

All four areas above, plus exact token scale values, utility class set, and the spike snippet contents.

## Deferred Ideas

- RELT + RESS application (next milestone); RELT-only components (optin-form, countdown, checklist).
- Per-funnel theme scopes (`.gcre-theme-*`) — supported now, used at propagation.
