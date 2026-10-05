---
name: Fluent Tamil Precision
colors:
  surface: '#faf8ff'
  surface-dim: '#d2d9f4'
  surface-bright: '#faf8ff'
  surface-container-lowest: '#ffffff'
  surface-container-low: '#f2f3ff'
  surface-container: '#eaedff'
  surface-container-high: '#e2e7ff'
  surface-container-highest: '#dae2fd'
  on-surface: '#131b2e'
  on-surface-variant: '#574141'
  inverse-surface: '#283044'
  inverse-on-surface: '#eef0ff'
  outline: '#8b7171'
  outline-variant: '#debfbf'
  surface-tint: '#a9343f'
  primary: '#6b0217'
  on-primary: '#ffffff'
  primary-container: '#8b1e2b'
  on-primary-container: '#ff9d9f'
  inverse-primary: '#ffb3b3'
  secondary: '#7d5700'
  on-secondary: '#ffffff'
  secondary-container: '#fdc662'
  on-secondary-container: '#755100'
  tertiary: '#63121c'
  on-tertiary: '#ffffff'
  tertiary-container: '#822930'
  on-tertiary-container: '#ff9c9e'
  error: '#ba1a1a'
  on-error: '#ffffff'
  error-container: '#ffdad6'
  on-error-container: '#93000a'
  primary-fixed: '#ffdad9'
  primary-fixed-dim: '#ffb3b3'
  on-primary-fixed: '#40000a'
  on-primary-fixed-variant: '#881c29'
  secondary-fixed: '#ffdeaa'
  secondary-fixed-dim: '#f4be5b'
  on-secondary-fixed: '#271900'
  on-secondary-fixed-variant: '#5f4100'
  tertiary-fixed: '#ffdad9'
  tertiary-fixed-dim: '#ffb3b3'
  on-tertiary-fixed: '#40000a'
  on-tertiary-fixed-variant: '#80272e'
  background: '#faf8ff'
  on-background: '#131b2e'
  surface-variant: '#dae2fd'
typography:
  display:
    fontFamily: Inter, 'Noto Sans Tamil', sans-serif
    fontSize: 2.25rem
    fontWeight: '600'
    lineHeight: 2.75rem
    letterSpacing: -0.02em
  headline-lg:
    fontFamily: Inter, 'Noto Sans Tamil', sans-serif
    fontSize: 1.75rem
    fontWeight: '600'
    lineHeight: 2.25rem
    letterSpacing: -0.015em
  headline-md:
    fontFamily: Inter, 'Noto Sans Tamil', sans-serif
    fontSize: 1.25rem
    fontWeight: '600'
    lineHeight: 1.75rem
    letterSpacing: -0.01em
  headline-sm:
    fontFamily: Inter, 'Noto Sans Tamil', sans-serif
    fontSize: 1rem
    fontWeight: '600'
    lineHeight: 1.5rem
    letterSpacing: 0em
  body-lg:
    fontFamily: Inter, 'Noto Sans Tamil', sans-serif
    fontSize: 1rem
    fontWeight: '400'
    lineHeight: 1.6rem
    letterSpacing: 0em
  body-md:
    fontFamily: Inter, 'Noto Sans Tamil', sans-serif
    fontSize: 0.875rem
    fontWeight: '400'
    lineHeight: 1.4rem
    letterSpacing: 0em
  body-sm:
    fontFamily: Inter, 'Noto Sans Tamil', sans-serif
    fontSize: 0.75rem
    fontWeight: '400'
    lineHeight: 1.125rem
    letterSpacing: 0.01em
  label-lg:
    fontFamily: Inter, 'Noto Sans Tamil', sans-serif
    fontSize: 0.875rem
    fontWeight: '500'
    lineHeight: 1.25rem
    letterSpacing: 0.01em
  label-md:
    fontFamily: Inter, 'Noto Sans Tamil', sans-serif
    fontSize: 0.75rem
    fontWeight: '500'
    lineHeight: 1rem
    letterSpacing: 0.02em
  label-sm:
    fontFamily: Inter, 'Noto Sans Tamil', sans-serif
    fontSize: 0.6875rem
    fontWeight: '600'
    lineHeight: 0.875rem
    letterSpacing: 0.04em
  candidate-key:
    fontFamily: Inter, 'Noto Sans Tamil', monospace
    fontSize: 1.125rem
    fontWeight: '500'
    lineHeight: 1.5rem
    letterSpacing: 0em
rounded:
  sm: 0.25rem
  DEFAULT: 0.5rem
  md: 0.75rem
  lg: 1rem
  xl: 1.5rem
  full: 9999px
spacing:
  gutter: 0.75rem
  gutter-desktop: 1rem
  margin: 1rem
  margin-desktop: 1.5rem
  space-xs: 0.25rem
  space-sm: 0.5rem
  space-md: 0.75rem
  space-lg: 1rem
  space-xl: 1.5rem
  space-2xl: 2rem
---

## Brand & Style

This design system establishes an authoritative, high-efficiency desktop productivity environment tailored for Windows 11 Fluent architecture with a refined Tamil classical touch. The design style balances Corporate Modern with Fluent Mica/Acrylic principles: structural discipline, whisper-quiet framing, restrained utilitarian grids, and targeted cultural accents.

Targeted at professional typists, linguists, administrative operators, legal stenographers, and content creators working within enterprise Windows workflows, the emotional signature is anchored in quiet confidence, frictionless efficiency, and profound typographic clarity. Visual weight is strictly allocated to active input and candidate surfaces, preventing cognitive fatigue during prolonged production cycles.

## Colors

The palette grounds the application in the deep cultural gravitas of Tamil maroon while maintaining strict Windows 11 enterprise ergonomics:

- **Primary (`#8B1E2B`)**: Directs key interactions, active input indicator states, primary action triggers, and brand accents. Accompanied by `#64121C` for pressed/engaged states and `#A62436` for hover elevation.
- **Secondary (`#C99738`)**: Warm burnished gold used sparingly for glyph suggestions, IME modifier key indicators, phonetic accuracy badges, and premium tier features. Supported by `#E2B258` for subtle focus glows and active status pips.
- **Tertiary (`#64121C`)**: Deep wine shade used for high-contrast interactive surfaces, title badges, and active segment backgrounds.
- **Neutral (`#0F172A`)**: Deep charcoal foundational text color, guaranteeing WCAG AAA contrast across high-DPI desktop panels. Secondary text falls back to Muted Slate (`#64748B`), while inactive markers use `#94A3B8`.
- **Surfaces & Canvas**: Base canvas sits on `#F8FAFC` (Mica background simulation), structured panes rest on `#F1F5F9`, and foreground interactive cards utilize pure `#FFFFFF`.
- **Subtle Boundaries**: Structural borders maintain whisper-quiet definition via `#E2E8F0` and `#CBD5E1`.

## Typography

The typographic hierarchy couples the structural neutrality of `Inter` with regional script fallbacks (`Noto Sans Tamil`, `Mukta Malar`) to guarantee parity in baseline, x-height, and vertical metrics across bilingual Latin-Tamil document workflows.

- **Baseline Alignments**: Tamil script exhibits ascenders, descenders, and pulli markers that demand strict line-height expansion (minimum 1.4x for body copy) to avoid diacritic clipping.
- **Candidate Glyphs**: Key typography includes a specialized `candidate-key` token optimized for high-speed IME floating ribbon pickers, rendering complex conjuncts (e.g., க்ஷ, ஸ்ரீ) with surgical optical clarity.
- **Desktop Window Constraints**: Large display typography is reserved strictly for modal landing pages, initial onboarding overlays, and master analytics dashboards; active typing screens strictly employ `body-md` up to `headline-md` to preserve vertical screen density.

## Layout & Spacing

The system enforces a dense 4px/8px modular scale aligned to Windows 11 desktop spatial norms. Spacing avoids excessive whitespace in favor of operational density and clear tool-group segmentation.

- **Shell Architecture**: Built upon a top-level native Windows Chrome bar (height: 32px or 40px with tab integration), collapsible navigation rail (48px collapsed, 240px expanded), and a 12-column variable workboard.
- **Margins & Gutters**: Interior layout containers utilize `0.75rem` (`12px`) gutters on compact sidebars and dock windows, scaling to `1rem` (`16px`) in primary workspace viewports. Outer canvas margins sit uniformly at `1.5rem` (`24px`).
- **IME Ribbon & Overlay Spacing**: Floating candidates and autocorrect menus employ micro-padding (`space-xs` to `space-sm`) around layout grids to optimize cursor tracking distance and rapid thumb/eye coordination.

## Elevation & Depth

Depth is derived from Fluent physical layering rather than dramatic drop shadows. The system uses a disciplined combination of surface luminance, low-contrast ghost borders, and precision micro-shadows:

- **Canvas Tier (Level 0)**: Flat `#F8FAFC` base surface simulating Windows 11 Mica material.
- **Docked Surface / Cards (Level 1)**: Pure `#FFFFFF` resting on `#F8FAFC`. Defined by a 1px border of `#E2E8F0` and an ultra-subtle directional shadow: `0 1px 2px 0 rgba(15, 23, 42, 0.04)`.
- **Flyouts & IME Popups (Level 2)**: Candidate bars, dropdowns, and predictive text shelves utilize `#FFFFFF` with a 1px border of `#CBD5E1` and an elevated micro-shadow: `0 4px 12px 0 rgba(15, 23, 42, 0.08), 0 1px 3px 0 rgba(15, 23, 42, 0.04)`.
- **Modals & Dialogs (Level 3)**: Overlay settings, dictionary managers, and layout customizers. Framed with a 1px border of `#CBD5E1` and `0 12px 32px 0 rgba(15, 23, 42, 0.12), 0 2px 6px 0 rgba(15, 23, 42, 0.06)`.
- **Focus Rings**: Pure accessibility compliance via a dual-ring system: 2px offset in `#FFFFFF` wrapped by a crisp 2px stroke in Tamil Maroon (`#8B1E2B`).

## Shapes

The design uses roundedness level `2` (8px standard corner radius), directly matching native Windows 11 geometry:

- **Standard Controls (`rounded`: 0.5rem / 8px)**: Applied across input text fields, candidate suggestion cells, regular buttons, segmented control bars, and card containers.
- **Nested & Compact Elements (`rounded-sm`: 0.25rem / 4px)**: Applied to keyboard keycaps in the layout previewer, tooltips, tags, inline badges, and tiny table indicators.
- **Container Shells (`rounded-lg`: 1rem / 16px)**: Applied exclusively to major modal surfaces and floating detached typing companion widgets.
- **Selection Pills**: IME mode switches (e.g., `Tamil99`, `Anjal`, `Bamini`, `Inscript`) inside segmented toolbars maintain soft rectangular curvature (`4px` to `6px`) rather than complete pills to preserve desktop tool discipline.

## Components

### Buttons
- **Primary**: Solid Tamil Maroon (`#8B1E2B`) background with `#FFFFFF` text. Hover transitions to `#A62436`; active press state compresses to `#64121C`. Height: 32px (compact desktop) or 36px (standard). Border radius: 8px.
- **Secondary / Standard**: Pure `#FFFFFF` background with 1px border in `#E2E8F0` and neutral text (`#0F172A`). Hover adopts `#F1F5F9` with a tightened border in `#CBD5E1`.
- **Accent (Gold)**: Used for IME status conversions and premium shortcut triggers. Border in `#C99738` with an ultra-soft gold tint background (`#C99738` at 8% opacity).

### Input Fields & Candidate Strip
- **Input Fields**: Crisp `#FFFFFF` surface, 1px `#CBD5E1` border, 8px corner radius. Focused state applies an immediate border in `#8B1E2B` and an inner focus glow.
- **Candidate Ribbon (IME Bar)**: Floating dock horizontal panel with rounded 8px corners. Separates predictive Tamil word completions with 1px vertical borders (`#E2E8F0`). The active index is highlighted with `#8B1E2B` background and `#FFFFFF` text, with secondary shortcut numbers keyed in burnished gold (`#C99738`).

### Cards & Grouping
- **Setting Cards**: High-density cards with `#FFFFFF` fill, 8px radius, and `#E2E8F0` borders. Arranged with content grouped horizontally: label + subtitle on left, inline toggles or action buttons right-aligned.

### Checkboxes, Switches & Radio Controls
- **Toggle Switches**: Fluent-style 40px × 20px pill toggle. Unchecked state in `#CBD5E1` outline with a slate thumb. Checked state fills with `#8B1E2B` and slides a `#FFFFFF` thumb rightward.
- **Checkboxes**: 16px × 16px box with 4px corner radius. Selected state uses `#8B1E2B` fill with a sharp white checkmark.

### On-Screen Keyboard Map (Tamil99 Visualizer)
- **Keycaps**: Flat `#FFFFFF` blocks framed with a 1px `#E2E8F0` border and 4px radius. Displays primary Tamil uyir/mei characters in deep charcoal (`#0F172A`, 14px bold) with Latin reference characters anchored in the top-right corner in muted slate (`#64748B`, 10px). Modifier states (Grantha, Ayutha Ezhuthu) toggle background highlighting to burnished gold tinting.