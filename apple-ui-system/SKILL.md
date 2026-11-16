---
name: apple-ui-system
description: Use when designing, building, reviewing, or upgrading professional web application interfaces that should follow an Apple-inspired system of clear hierarchy, selective Liquid Glass, natural motion, responsive behavior, and accessibility. Especially useful for dashboards, enterprise tools, workflow software, and existing projects that need a controlled UI/UX pilot.
---

# Apple-inspired UI System

You are applying the user's accepted **Apple-inspired UI System v1.0.0**, based on the Flow Studio V1.1 design baseline. This is a reusable Web design standard, not an Apple product or an official Apple design-token package.

## Priority order

1. Preserve the product's business workflows, data, routes, APIs, and existing capabilities.
2. Make information hierarchy, readability, and accessibility clear.
3. Make components predictable and interactions responsive.
4. Use Liquid Glass selectively on functional surfaces.
5. Use restrained motion to explain state and spatial relationships.
6. Add visual polish only when it does not weaken the above.

## Required workflow

1. **Read the standard.** Read `references/DESIGN_STANDARD.md`. Read the relevant references for tokens, glass, motion, accessibility, and project adoption before implementing.
2. **Inspect the project.** Identify framework, CSS strategy, routing, component library, current design tokens, supported browsers, brand constraints, and test commands. Do not assume the project is vanilla HTML or React.
3. **Protect the baseline.** Check Git status and existing tests. For an existing project, create or confirm a dedicated branch/checkpoint before changing UI. Never overwrite unrelated work.
4. **Audit before styling.** Capture representative before screenshots. Inventory key pages, navigation, forms, tables, dialogs, responsive states, and existing interaction behavior.
5. **Map tokens.** Use the `--fs-*` templates as a reference, not a mandate to overwrite the project's namespace. Map semantic roles to the project's own tokens. Audit same-name variables and their value types before importing any CSS.
6. **Choose a small pilot.** Start with one representative page and shared shell/navigation. Preserve business logic, data, routes, API contracts, and permissions.
7. **Apply the system.** Use the content/function/transient layer model, selective glass, state-complete components, and purposeful motion. Keep main content surfaces readable and mostly opaque.
8. **Respect preferences.** Implement reduced motion, reduced transparency/opaque fallback, contrast and forced-colors behavior where supported, keyboard focus, dialog focus management, and responsive touch interaction.
9. **Test visibly.** Run existing regression tests plus browser checks at representative desktop/tablet/mobile sizes, light/dark themes, keyboard use, rapid repeated actions, and system accessibility preferences. Capture screenshots and a short interaction recording where feasible.
10. **Stop at the human gate.** Report changes, tests, screenshots, limitations, and remaining risks. For an existing product, do not roll the pilot across unrelated pages until the user explicitly approves `UI_MOTION_ACCEPTED` for that pilot.

## Three-layer visual model

- **Content layer:** data, cards, tables, forms, text, and primary work surfaces. Prefer stable, high-contrast, opaque surfaces.
- **Functional layer:** navigation, toolbars, segmented controls, floating controls, menus, and Popovers. Selective Liquid Glass may be used here.
- **Transient layer:** dialogs, inspectors, and temporary detail surfaces. Keep the dialog content itself readable and stable; a backdrop may use dimming or restrained blur.

## Motion rules

- Every interactive component should define applicable default, hover, pressed, focus-visible, disabled, loading, success, and error states.
- Prefer `transform` and `opacity` for frequent transitions. Avoid continuous animation of large blur/filter regions.
- Motion should be purposeful, interruptible, reversible, and short enough not to delay work.
- Preserve source-to-destination continuity for Popovers and card/detail transitions when it improves comprehension.
- Never make hover the only way to access an action. Provide keyboard and touch equivalents.
- If reduced motion is requested, remove nonessential movement in both CSS and JavaScript; do not merely shorten CSS durations while leaving JS animation running.

## Technology selection

- Use the project's existing stack first.
- Vanilla HTML/CSS/JS: CSS transitions and Web Animations API are sufficient for most interactions. Use View Transitions only with a tested fallback.
- React: consider Motion only when layout/presence/spring behavior materially benefits the project and dependency cost is justified.
- Do not introduce npm packages solely to imitate a visual effect. If package tooling is unavailable, prefer dependency-free implementation.
- Web CSS optical effects are approximations; never claim they are the native Apple Liquid Glass API or true optical ray tracing.

## Specialist responsibilities and upstream collaboration

This integrated Skill owns the overall workflow and conflict resolution. When the original three Skills are installed, use their expertise as follows:

- `apple`: overall UI/UX, information hierarchy, typography, layout, components, and accessibility review.
- `apple-liquid-glass`: material behavior, glass layering, edge highlights, optical-effect approximations, and fallback implementation.
- `apple-ui-motion`: interaction-state modeling, motion behavior, spatial continuity, and visual QA gates.

The integrated `apple-ui-system` standard takes precedence when their CSS variables, values, or recommendations conflict. Do not blindly concatenate their CSS.

If these user-level Skills exist, read their `SKILL.md` files for specialist detail:

- `~/.agents/skills/apple/SKILL.md`
- `~/.agents/skills/apple-liquid-glass/SKILL.md`
- `~/.agents/skills/apple-ui-motion/SKILL.md`

On Windows, resolve the equivalent under `$env:USERPROFILE\.agents\skills\`. This Skill is the integration authority for the user's accepted project rules. Do not blindly concatenate upstream CSS or let upstream defaults override project tokens. If an upstream Skill is missing, state that and continue using this self-contained standard.

## References

- `references/DESIGN_STANDARD.md` — normative project design standard and scope.
- `references/TOKENS_AND_COMPONENTS.md` — semantic tokens and component-state rules.
- `references/LIQUID_GLASS.md` — material usage, optical approximation, fallbacks, performance.
- `references/MOTION_SPEC.md` — motion timings, easing, state continuity, interruption.
- `references/ACCESSIBILITY_AND_COMPATIBILITY.md` — keyboard, contrast, preferences, responsive and QA.
- `references/PROJECT_ADOPTION.md` — existing-project and new-project workflow.
- `templates/tokens.css`, `templates/glass.css`, `templates/motion.css` — starter CSS; adapt to the actual project.

## Final reporting format

Report:

1. Baseline and branch/checkpoint.
2. Pages/components changed and intentionally untouched.
3. Token mapping and any conflicts resolved.
4. Glass and motion implementation choices.
5. Test commands, results, viewport/theme coverage, screenshots/recording.
6. Accessibility and compatibility limitations.
7. Remaining risks and the exact human decision required.

Never claim visual acceptance from automated tests alone. Never label a project Apple-certified or claim that community CSS values are Apple-mandated.