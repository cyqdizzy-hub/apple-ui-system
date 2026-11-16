# Liquid Glass Usage and Web Implementation

## 1. Intended role

Use Liquid Glass-like material primarily on the functional layer:

- Floating navigation and toolbars
- Menus and Popovers
- Contextual floating controls
- Small transient control surfaces

Do not make every content card, table, chart, form, or dialog body translucent. Keep primary content surfaces stable and readable.

## 2. Visual characteristics

A considered Web approximation may combine:

- Background transmission/tint
- Backdrop blur and saturation
- Fine edge/rim highlight
- Subtle inner sheen
- Soft spatial shadow
- Controlled state changes on hover, press, focus, and scroll

These effects should be subtle and context-aware. The surface must remain visually subordinate to its content and action.

## 3. Web implementation boundary

CSS `backdrop-filter`, gradients, masks, borders, and shadows can approximate some visual characteristics. They do not provide Apple's native Liquid Glass material API and do not guarantee real-time physical refraction. Avoid claims of true optical refraction unless a separate implementation genuinely demonstrates it and is tested across target browsers.

The supplied `templates/glass.css` is a starter pattern, not a mandatory component library. Review performance and contrast in the actual app.

## 4. Fallback matrix

| Condition | Required behavior |
|---|---|
| `backdrop-filter` unsupported | Use opaque semantic surface and visible border/shadow |
| Reduced transparency preference | Disable or greatly reduce transparency and blur |
| High contrast preference | Strengthen boundaries and text contrast; avoid translucent surfaces |
| Forced colors | Respect system colors; remove decorative glass effects |
| Dark theme | Re-tune tint, rim, and shadow; do not reuse light values unchanged |
| Low-performance device | Reduce blur area/layers; prefer static surface |
| Reduced motion | Do not animate material continuously; state changes remain immediate |

## 5. Performance rules

- Avoid large, full-screen backdrop-filter regions.
- Avoid stacking multiple blur layers.
- Do not continuously animate blur radius or saturation.
- Prefer transform/opacity for motion.
- Do not run an always-on `requestAnimationFrame` loop for a static glass surface.
- Test scrolling, overlapping surfaces, and low-end target devices.

## 6. Review checklist

- Is the glass on a functional surface rather than the main content?
- Is the label readable over varied content behind it?
- Is the surface boundary visible in light and dark themes?
- Does it have an opaque fallback?
- Does reduced transparency disable the effect?
- Does high contrast/forced colors remain usable?
- Does scrolling or repeated interaction cause jank?
