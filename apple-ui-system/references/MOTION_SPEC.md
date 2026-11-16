# Motion Specification

## 1. Purpose

Motion communicates state change, hierarchy, cause-and-effect, and spatial relationships. It is not decoration and must never delay the user's task.

## 2. Starter timing scale

These are Flow Studio project defaults for Web implementations, not Apple-mandated values. Tune them to the component, platform, and task complexity.

| Interaction | Starter duration | Pattern |
|---|---:|---|
| Press/hover feedback | 100–160ms | Small transform, color, or sheen change |
| Selection/tab indicator | 180–280ms | Continuous position/shape transition |
| Popover/menu | 180–300ms | Origin-aware opacity and scale/position |
| Sidebar/layout shift | 250–380ms | Coordinated shell and content movement |
| Modal/card detail | 280–450ms | Source-to-destination continuity |
| Page/state transition | 250–400ms | Subtle shared anchors, avoid large travel |

The V1.1 CSS token baseline uses `140ms`, `260ms`, and `380ms` for fast, normal, and slow tiers. Keep these as defaults only; do not mechanically apply one duration to every animation.

## 3. Easing

- Use a restrained ease-out curve for entrance and direct feedback.
- Use a smooth ease-in/ease-out for reversible transitions.
- A CSS cubic-bezier curve called “spring” is only a spring-like approximation, not physical spring simulation.
- Use a spring-capable library only if the existing stack and interaction complexity justify it.

## 4. Spatial continuity

- Popovers should appear to originate from their triggering control when practical.
- Card-to-detail transitions should preserve a recognizable visual anchor.
- Sidebar and content area should move as a coordinated layout.
- Modal close should feel like the reverse of opening where appropriate.
- Avoid unrelated elements moving together without a clear relationship.

## 5. Interruptibility and reversal

- A repeated click must not leave stale overlay elements or duplicate state.
- Cancel, finish, or reverse an in-flight animation when the user changes direction.
- Do not disable core controls for the duration of an animation.
- Restore focus and semantic state after transitions.
- Handle navigation away while an animation is active.

## 6. Performance

- Prefer `transform` and `opacity` for frequent motion.
- Avoid animating large `filter`, `backdrop-filter`, `width`, `height`, or layout properties unless justified and measured.
- Avoid perpetual decorative motion.
- Clean up temporary DOM and animation handles.

## 7. Reduced motion

Honor `prefers-reduced-motion: reduce` and any in-app preference. CSS and JavaScript must agree: disable nonessential motion in both. Preserve immediate state feedback and all functionality. Do not leave WAAPI or library animations running after the CSS transition is shortened.

## 8. QA scenarios

- Rapid open/close and repeated selection
- Reverse direction mid-transition
- Escape close and focus restoration
- Keyboard-only operation
- Reduced motion on initial load and toggled during runtime
- Mobile/touch interaction without hover
- Layout shift and text wrapping at narrow widths
