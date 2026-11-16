# Apple-inspired UI Design Standard v1.0.0

## 1. Status and authority

This is the accepted project standard derived from Flow Studio V1.1. It is intended for professional Web software and Codex-assisted development. It is **Apple-inspired**, not an Apple-issued standard, certification, native component library, or official set of design tokens.

Separate requirements into three classes:

- **Apple HIG principles:** use official Apple Human Interface Guidelines as a source of design principles for materials, motion, interaction, and accessibility. HIG guidance is authoritative only where Apple documents it.
- **Community implementation references:** the `apple`, `apple-liquid-glass`, and `apple-ui-motion` Skills are useful implementation references, not official Apple standards.
- **Project defaults:** token values, CSS effects, breakpoints, and animation durations in this standard are Flow Studio engineering choices. They may be mapped to a product's brand and density needs.

Official reference entry points:

- https://developer.apple.com/design/human-interface-guidelines/
- https://developer.apple.com/design/human-interface-guidelines/materials
- https://developer.apple.com/design/human-interface-guidelines/motion

## 2. Design intent

The interface should feel calm, precise, responsive, legible, and spatially coherent. It should borrow the quality of macOS/iPadOS productivity interfaces without copying Apple screens or forcing Apple visual language onto unsuitable workflows.

The system prioritizes:

1. Business workflow and task completion.
2. Information hierarchy and legibility.
3. Accessibility and predictable interaction.
4. Consistent component behavior.
5. Selective material expression.
6. Restrained motion and polish.

For enterprise and care-related software, operational clarity and data density take precedence over decorative minimalism. Preserve meaningful labels, statuses, tables, and workflows.

## 3. Three visual layers

### 3.1 Content layer

Includes dashboards, work areas, cards, forms, tables, charts, long-form text, and primary data. Use stable surfaces and clear contrast. Avoid applying blur/transparency to every content card. Content should remain readable when a user reduces transparency or enables high contrast.

### 3.2 Functional layer

Includes navigation bars, sidebars, toolbars, segmented controls, floating action surfaces, menus, and Popovers. This is the primary place for selective Liquid Glass-like materials. A glass surface must still expose clear text, boundaries, focus, and hit targets.

### 3.3 Transient layer

Includes dialogs, inspectors, temporary detail panels, and contextual overlays. Use a clear surface for dialog content. A restrained dim or blur may be applied to the background, but avoid stacking multiple translucent surfaces that reduce readability.

## 4. Layout and hierarchy

- Establish a clear global shell: navigation, primary work area, contextual tools, and transient overlays.
- Keep page titles, section titles, body text, metadata, and status labels visually distinct.
- Use consistent alignment and spacing scales; do not solve hierarchy by randomly changing font sizes.
- Prefer stable content geometry. When a sidebar changes width, coordinate the main area rather than allowing abrupt jumps.
- Dense operational screens may use compact density, but controls and important text must remain legible and operable.
- Responsive layouts should recompose information rather than merely shrink a desktop canvas.
- Preserve the product's established brand palette and semantics. This standard supplies a neutral starting point, not a mandate to replace brand colors.

## 5. Typography

Use the platform system font stack where possible. A suitable Web fallback stack is:

`-apple-system, BlinkMacSystemFont, "Segoe UI", "PingFang SC", "Microsoft YaHei UI", "Microsoft YaHei", sans-serif`

Project starting scale:

| Role | Starting value | Use |
|---|---:|---|
| Auxiliary | 12px | Noncritical metadata only |
| Small | 13px | Secondary labels |
| Body | 15px | Default dense application text |
| Large body | 18px | Emphasized sections |
| Heading | 22px | Module headings |
| Display | clamp(32px, 4vw, 44px) | Sparse page-level emphasis |

These are project defaults, not Apple requirements. For older users, care settings, high-density data, or accessibility needs, increase body and control text. Do not use color alone to convey status. Ensure Chinese punctuation, line wrapping, and mixed Chinese/Latin labels are tested.

## 6. Color and surfaces

Use semantic tokens such as `text`, `muted`, `background`, `surface`, `surface-alt`, `border`, `accent`, `success`, `warning`, and `danger`. Avoid hardcoding one-off colors throughout components.

Light and dark themes must preserve semantic meaning. Dark mode should not be a simple inversion: review surface separation, border visibility, text contrast, and glass tint independently.

Use shadows and borders sparingly to establish elevation. Do not rely only on shadows to distinguish interactive controls.

## 7. Shape, spacing, and density

Use a consistent spacing scale based on 4px increments. Starter values: 4, 8, 12, 16, 20, 24, 32px. Starter radii: 10, 14, 19, 24px. These are project choices. Use fewer radii and spacing values consistently rather than adding arbitrary values for each component.

Controls should have consistent heights and clear hit areas. On touch layouts, ensure targets are comfortably usable and spaced to avoid accidental activation. Follow applicable WCAG guidance and platform conventions for the target environment.

## 8. Component state model

Every interactive control defines all relevant states:

- Default
- Hover (when hover exists)
- Pressed/active
- Focus-visible
- Selected/expanded
- Disabled
- Loading
- Success/error/validation where applicable

Use semantic HTML and ARIA only where needed. Keep `aria-expanded`, `aria-pressed`, `aria-selected`, `aria-invalid`, and live status announcements synchronized with actual state. Do not use clickable generic `div` elements when a button or link is appropriate.

## 9. Motion and spatial continuity

Motion explains cause, state, and relationship. It should be purposeful, interruptible, reversible, and nonblocking. Use source-aware transitions for contextual menus and detail views when this helps users understand where content came from. Avoid large decorative page entrances, constant ambient motion, and excessive bounce.

See `MOTION_SPEC.md` for the project's starter values and implementation guidance.

## 10. Accessibility and resilience

Support keyboard use, visible focus, reduced motion, reduced transparency or opaque fallback, high contrast, forced colors where available, zoom/reflow, and responsive layouts. A glass surface must never be the only way to communicate grouping or affordance. Test with actual browser rendering and assistive technology where required.

See `ACCESSIBILITY_AND_COMPATIBILITY.md`.

## 11. Performance and maintainability

- Prefer animating `transform` and `opacity` for frequent transitions.
- Limit large areas of backdrop blur and layered filters.
- Avoid continuous `requestAnimationFrame` loops unless essential and justified.
- Cancel or reverse active animations when the user changes state quickly.
- Keep tokens centralized and namespaced.
- Do not concatenate upstream CSS without reviewing variable names, value types, selectors, and cascade order.

## 12. Acceptance

A page is not accepted solely because automated tests pass. The handoff must include representative screenshots, interaction checks, responsive checks, accessibility preference checks, regression results, and known limitations. Existing product rollouts require explicit human approval before expanding beyond the pilot.
