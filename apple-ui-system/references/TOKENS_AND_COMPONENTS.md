# Tokens and Component Rules

## 1. Token architecture

Use semantic tokens, not raw values scattered across components. The provided CSS templates use the `--fs-*` namespace. In a production product, either adopt that namespace if unused or map the semantic values to the product's existing namespace. Never overwrite existing project tokens without an explicit mapping and regression check.

Recommended token groups:

- `--fs-color-*`: background, surface, text, muted, border, accent, status.
- `--fs-type-*`: typography ramp and line heights.
- `--fs-space-*`: spacing scale.
- `--fs-radius-*`: shape scale.
- `--fs-shadow-*`: elevation.
- `--fs-glass-*`: material color, blur radius, filter, rim, sheen, shadow.
- `--fs-motion-*`: durations, easing, distances, spring approximation.
- `--fs-layout-*`: sidebar width, content width, responsive breakpoints if needed.

## 2. Token conflict protocol

Before integrating any upstream CSS:

1. List custom properties in each source stylesheet.
2. Compare both variable name and semantic type (color, length, complete filter, shadow, timing, easing, etc.).
3. Record same-name variables with different meanings or units.
4. Map them to one canonical semantic token or rename them with a project namespace.
5. Check selector specificity and cascade order.
6. Test both light and dark themes and all fallback modes.

Do not assume a variable named `--glass-blur` has the same type in different libraries. One source may store a length while another stores a complete `backdrop-filter` expression.

## 3. Component rules

### Navigation and toolbar

- Keep primary destinations visible and labels unambiguous.
- Use glass selectively when the navigation floats over changing content.
- Active state must be apparent without relying only on translucency or color.
- Mobile navigation must remain reachable without hover.

### Buttons

- Distinguish primary, secondary, tertiary, and destructive actions.
- Provide pressed feedback that does not shift surrounding layout.
- Maintain visible focus and disabled states.
- Do not use motion to delay action completion.

### Segmented controls and tabs

- Use a single selection indicator that moves between options where suitable.
- Preserve keyboard arrow-key behavior and accessible selected state.
- If motion is reduced, update selection immediately or with a minimal fade.

### Cards and detail views

- Content cards use readable opaque surfaces by default.
- A card-to-detail transition may preserve a shared visual anchor (image, title, or container) when source and destination are clearly related.
- Cancel or reverse an in-flight transition when the user changes direction.

### Popovers and menus

- Open from the trigger's visual origin when practical.
- Place focus appropriately and return focus to the trigger on close.
- Close on Escape where expected; support outside click without trapping the user.
- Provide a stable opaque fallback if glass is unavailable or reduced.

### Dialogs

- Use semantic dialog behavior and accessible names.
- Move focus into the dialog, contain focus while modal, and restore focus to the opener.
- Support Escape where safe and appropriate.
- Keep dialog content readable; avoid excessive transparency.

### Forms and data tables

- Labels must remain visible and associated with controls.
- Errors should be textual and programmatically exposed.
- Tables should preserve column relationships at narrow widths through responsive alternatives, not simply compress every column.
- Never sacrifice essential data labels for a minimalist appearance.

## 4. Density modes

If the product needs compact and comfortable density, implement explicit density tokens or variants. Do not mix arbitrary padding values across screens. Ensure compact mode remains accessible and does not make touch targets unusable.

## 5. Theme mapping

Theme tokens must be semantic. Verify text, borders, status colors, glass tint, and shadows separately in light and dark themes. Do not infer dark colors by blindly inverting light values.
