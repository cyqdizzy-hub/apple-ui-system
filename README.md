# Apple-inspired UI System · Codex Skill

**Version:** `1.0.0`  
**Skill name:** `apple-ui-system`  
**Purpose:** A reusable Apple-inspired UI/UX, selective Liquid Glass, and natural Motion design system for professional web apps.

> Community-authored Web guidelines; **not** an official Apple product, HIG reproduction, or native Liquid Glass API. Apple HIG informs general design principles. All CSS tokens and animation timings are engineering defaults.

## Repository structure

- [`apple-ui-system/SKILL.md`](apple-ui-system/SKILL.md) — Codex Agent Skill entrypoint.
- [`apple-ui-system/references/`](apple-ui-system/references/) — design standard, tokens and components, Liquid Glass, Motion, accessibility, and adoption guidance.
- [`apple-ui-system/templates/`](apple-ui-system/templates/) — CSS starter tokens, glass, motion, and a project-task template.
- [`install-skill.ps1`](install-skill.ps1) — Windows PowerShell installer with backup-on-force.
- [`CHANGELOG.md`](CHANGELOG.md) — version history.

## Install on Windows

Clone this repository, open PowerShell in its root, then run:

```powershell
git clone https://github.com/cyqdizzy-hub/apple-ui-system.git
cd apple-ui-system
powershell -NoProfile -ExecutionPolicy Bypass -File .\install-skill.ps1
```

If you have a previous version and intentionally want to replace it, append `-Force`; the installer first backs up your existing `~/.agents/skills/apple-ui-system` directory.

Restart Codex. Verify installation:

```powershell
Test-Path "$env:USERPROFILE\.agents\skills\apple-ui-system\SKILL.md"
```

Invoke with `$apple-ui-system` in a project, or ask Codex to use this Skill for an isolated UI/UX pilot.

## Design priorities

1. Protect project business logic, data, routes, and permissions.
2. Establish hierarchy, typography, spacing, contrast, and responsive readability before effects.
3. Apply Liquid Glass selectively on toolbars, navigation, menus, and other functional overlays; keep primary content stable.
4. Use reversible, interruptible Motion to communicate state changes and spatial continuity.
5. Provide reduced-motion, reduced-transparency, high-contrast, and unsupported-filter fallbacks.
6. Verify in actual target browsers and devices; do not mistake passing automation for visual approval.
7. For existing applications, start with an isolated pilot and stop at human acceptance before rollout.

### Upstream composition

This project can complement `apple` and `apple-liquid-glass` Skills if installed. Review their licenses and map conflicting tokens rather than importing both CSS stylesheets unchanged. Their repositories are independent and are **not vendored** here.

## Scope

This repository contains the reusable Skill and starter files, not internal project code, personal acceptance logs, screenshots, or proprietary CareOS materials. The Flow Studio V1.1 baseline informed its design approach, but is maintained separately.

## Versioning

- Skill / standard / templates: `1.0.0`
- SemVer: patch = documentation fixes, minor = additive guidance, major = breaking token or workflow changes.
