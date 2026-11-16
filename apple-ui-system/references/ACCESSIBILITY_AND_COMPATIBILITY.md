# Accessibility, Compatibility, and QA Standard

## 1. Keyboard and semantics

- All actions are reachable by keyboard.
- Focus is visible and not obscured by sticky/floating controls.
- Use native `button`, `a`, `input`, `select`, `textarea`, and dialog semantics when applicable.
- Dialogs move focus inside, manage modal focus, close by expected keys, and restore focus to the opener.
- Menus, tabs, segmented controls, and toggles expose state through correct semantics and ARIA only where needed.
- Avoid hover-only interactions.

## 2. Contrast and color

- Text and control boundaries must remain legible over all supported surfaces.
- Do not use color alone for status, selection, validation, or warnings.
- Treat WCAG 2.2 AA contrast as a target for applicable text and UI components; perform actual measurements rather than assuming the palette passes.
- Recheck glass surfaces over varied content because backdrop changes can alter effective contrast.

## 3. System preferences

Support where the target browser exposes the relevant feature:

- `prefers-reduced-motion: reduce`
- `prefers-reduced-transparency: reduce` (browser support varies)
- `prefers-contrast: more`
- `forced-colors: active`
- `color-scheme: light/dark`

Also provide a product-level “reduce transparency” option when translucent surfaces are central to the interface. It should switch to an opaque surface, not simply make text heavier.

## 4. Responsive and zoom

- Test representative desktop, tablet, and phone widths for the product.
- Recompose navigation and content at narrow widths; do not only scale down.
- Verify Chinese line wrapping, long labels, data tables, dialogs, and popovers.
- Test 200% zoom/reflow where required by the target platform and policy.
- Ensure touch users can access all controls without hover.

## 5. Browser and performance

- Check `backdrop-filter` and prefixed support; always provide an opaque fallback.
- Check masks, clipping, View Transitions, WAAPI, and other advanced effects separately.
- Use feature detection and progressive enhancement.
- Avoid external dependencies unless required and approved.
- Measure real device performance for blur-heavy interfaces and long scrolling sessions.

## 6. Minimum visual QA matrix

| Dimension | Minimum checks |
|---|---|
| Viewport | Desktop, tablet, phone; add narrowest supported width |
| Theme | Light and dark |
| Component state | Default, hover, pressed, focus, disabled, expanded/error as relevant |
| Input | Mouse, keyboard, touch |
| Motion | Normal and reduced motion; rapid repeated actions |
| Material | Normal and reduced transparency; unsupported blur fallback |
| Contrast | High contrast and forced colors where supported |
| Regression | Existing routes, APIs, business actions, and tests |

## 7. Evidence and reporting

Record browser and version, OS/device, viewport, theme, test method, and known limitations. Provide before/after screenshots and a short interaction recording when feasible. Automated checks do not replace human visual review or assistive-technology testing.
