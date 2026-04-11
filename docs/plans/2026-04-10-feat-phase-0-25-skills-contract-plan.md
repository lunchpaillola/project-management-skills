---
title: "feat: Phase 0 contract for 25 PM skills baseline"
type: feat
date: 2026-04-10
---

# feat: Phase 0 contract for 25 PM skills baseline

## Goal

Lock the implementation contract before skill build-out starts.

This phase is complete when:

1. Baseline 25-skill catalog is locked.
2. `skill-creator` is mandatory for authoring/refinement.
3. Shared output schema is locked.
4. Lane handoff gates are explicit.

## Phase 0 Decisions (Locked)

### A) Baseline catalog (25 total)

- Routers (5): `pm-initiate`, `pm-plan`, `pm-execute`, `pm-monitor`, `pm-close`
- Subskills (20):
  - `pm-initiate-project-context`
  - `pm-initiate-problem-framing`
  - `pm-initiate-stakeholder-map`
  - `pm-initiate-charter-and-viability-gate`
  - `pm-plan-requirements-brief`
  - `pm-plan-scope-schedule-baseline`
  - `pm-plan-roadmap-and-prioritization`
  - `pm-plan-raid-raci-decision-setup`
  - `pm-execute-work-package-coordination`
  - `pm-execute-iteration-cycle`
  - `pm-execute-change-control`
  - `pm-execute-dependency-and-handoff`
  - `pm-monitor-ticket-triage`
  - `pm-monitor-status`
  - `pm-monitor-budget`
  - `pm-monitor-risk-escalation`
  - `pm-close-acceptance-signoff`
  - `pm-close-handover-transition`
  - `pm-close-lessons-learned`
  - `pm-close-benefits-review-and-archive`

### B) Mandatory authoring workflow

- All new skill creation and major skill refactors must use `skill-creator` workflow.
- Exceptions: typo-only or small metadata-only edits can be done directly.
- For each newly created skill, include a brief "Authoring note" in PR/plan progress stating `skill-creator` was used.

### C) Canonical subskill output schema (minimum)

Every operational subskill output must include:

- `Objective`
- `Tool Access Check` (tools/sources used, gaps)
- `Current Signal` (what needs attention now)
- `Actions` table with columns:
  - `Item`
  - `Owner`
  - `Next action`
  - `Due/review date`
  - `Status`
  - `Evidence/source`
- `Unknowns` (explicit `TBD` entries)
- `Follow-ups`

Router outputs can stay lane-specific, but must preserve these minimum fields when delegating to subskills.

### D) Lane handoff gates

- `initiate -> plan`
  - Required: problem framing complete, stakeholder map complete, charter/viability decision captured.
- `plan -> execute`
  - Required: requirements brief, scope/schedule baseline, roadmap/prioritization, RAID/RACI/decision setup.
- `execute -> monitor`
  - Required: execution artifacts present with owner/action/date/status and evidence links.
- `monitor -> close`
  - Required: acceptance readiness signal, open risk disposition, closure recommendation.
- `close -> archive`
  - Required: signoff, handover artifacts, lessons learned, archive/benefits record.

If gate requirements are incomplete, the skill returns `blocked` with minimum required inputs to continue.

## Operating guardrails

- Keep published skill names stable.
- Follow `pm-<phase>-<noun-or-object>` naming convention.
- Keep content reusable and non-proprietary.
- Do not bump `metadata.version` or `VERSIONS.md` during draft branch work; bump only at merge-finalization to `main`.

## Phase 0 Completion Checklist

- [x] 25-skill baseline locked
- [x] `skill-creator` workflow declared mandatory
- [x] canonical output schema locked
- [x] lane handoff gates defined
- [x] guardrails aligned to `AGENTS.md` and `README.md`

## Next step

Start Phase 1 immediately: scaffold routers `pm-initiate`, `pm-plan`, `pm-execute`, `pm-close` from the `pm-monitor` routing pattern.
