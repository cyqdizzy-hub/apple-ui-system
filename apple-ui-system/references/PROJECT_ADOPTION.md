# Project Adoption Workflow

## Existing project

1. Read this Skill and the applicable references.
2. Inspect the actual project structure, framework, component library, CSS architecture, design tokens, route map, API contracts, test commands, and supported browsers.
3. Check Git status. Preserve user changes. Create a dedicated branch or checkpoint.
4. Capture representative baseline screenshots and record existing behavior.
5. Audit the current design: hierarchy, typography, spacing, navigation, glass/material use, interaction states, accessibility, and responsive behavior.
6. Compare upstream Skill variables by name **and value type**. Do not blindly import their CSS. Map semantic roles into the project namespace.
7. Select one representative page and shared shell as a pilot. Preserve data, routes, APIs, permissions, and business workflows.
8. Implement tokens first, then shared components, then motion. Use the smallest change set that proves the design direction.
9. Run regression and browser QA. Include reduced-motion and opaque material fallback.
10. Stop and present screenshots, tests, limitations, and remaining risks. Wait for explicit human approval before expanding beyond the pilot.

## New project

1. Define product tasks, target users, density, accessibility needs, brand, and supported devices.
2. Start with the supplied token, glass, and motion templates; rename the namespace if the project already has one.
3. Define navigation, content, and transient layers before adding components.
4. Build a small component set: buttons, segmented controls, navigation, popover, dialog, card/detail, forms, and status feedback.
5. Add responsive and theme behavior from the start.
6. Validate with real browser screenshots and keyboard interaction before adding more pages.

## Brand and domain overrides

The product's approved brand identity, domain constraints, regulatory requirements, and established workflows take precedence over generic visual defaults. For example, care/health, finance, industrial, and operational software may need stronger status visibility and denser data than a consumer lifestyle interface.

## Rollout gate

Use `UI_MOTION_ACCEPTED` only when the user has reviewed the actual pilot. After approval, roll out shared components incrementally and monitor regressions. Do not treat approval of a design sample as approval to rewrite business logic or all screens.
