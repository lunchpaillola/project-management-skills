---
title: "feat: Build phased 25-skill PM baseline with router architecture"
type: feat
date: 2026-04-10
---

# feat: Build phased 25-skill PM baseline with router architecture

## Overview

Create a framework-backed baseline of 25 project-management skills across lifecycle lanes (`initiate`, `plan`, `execute`, `monitor`, `close`) using progressive disclosure:

- 5 lane routers (one per lane)
- 20 focused subskills

This plan makes `workflows-skill-creator` (repository skill name: `skill-creator`) the default workflow for authoring and refining every new skill.

## Problem Statement / Motivation

The repository has a strong `monitor` foundation but incomplete lifecycle coverage. To become a reusable "base brain" for PM work, we need complete lane coverage, consistent routing patterns, and framework-backed core workflows.

Without this plan, skill growth risks fragmentation (inconsistent naming, uneven governance depth, and weak handoffs between lanes).

## Proposed Solution

Use a phased rollout to create and standardize a 25-skill catalog anchored in:

- PMI/PMBOK + Process Groups for lifecycle completeness
- PRINCE2 controls for governance (stage/tolerance/exception)
- Scrum + Kanban/EBM for iterative execution and monitoring cadence
- RAID/RACI/Decision-log controls for traceability
- UK Service Manual delivery guidance for problem-first and handover discipline

Use `skill-creator` for all authoring passes so each skill follows consistent trigger wording, workflow structure, output contract, and guardrails.

## Technical Approach

### Architecture

- Pattern: thin router + deep subskills per lane
- Router contract (based on `skills/pm-monitor/SKILL.md`):
  1. confirm objective
  2. check context/tools/data
  3. select primary mode
  4. run delegated subskill
  5. return structured summary + follow-ups
- Shared output minimum for subskills:
  - owner
  - next action
  - due/review date
  - status
  - evidence/source
  - unknowns as `TBD`

### Skill Catalog In Scope (25)

1. `pm-initiate` (router)
2. `pm-initiate-project-context`
3. `pm-initiate-problem-framing`
4. `pm-initiate-stakeholder-map`
5. `pm-initiate-charter-and-viability-gate`
6. `pm-plan` (router)
7. `pm-plan-requirements-brief`
8. `pm-plan-scope-schedule-baseline`
9. `pm-plan-roadmap-and-prioritization`
10. `pm-plan-raid-raci-decision-setup`
11. `pm-execute` (router)
12. `pm-execute-work-package-coordination`
13. `pm-execute-iteration-cycle`
14. `pm-execute-change-control`
15. `pm-execute-dependency-and-handoff`
16. `pm-monitor` (router)
17. `pm-monitor-ticket-triage`
18. `pm-monitor-status`
19. `pm-monitor-budget`
20. `pm-monitor-risk-escalation`
21. `pm-close` (router)
22. `pm-close-acceptance-signoff`
23. `pm-close-handover-transition`
24. `pm-close-lessons-learned`
25. `pm-close-benefits-review-and-archive`

### Implementation Phases

#### Phase 0: Plan contract and authoring workflow

Status: Complete (2026-04-10). See `docs/plans/2026-04-10-feat-phase-0-25-skills-contract-plan.md`.

- Confirm this 25-skill catalog as baseline scope.
- Declare `skill-creator` as mandatory authoring workflow for all new skills.
- Define canonical output schema and lane handoff gates.
- Success criteria:
  - catalog locked
  - quality rubric locked
  - `skill-creator` usage requirement documented

#### Phase 1: Router foundation

Status: Complete (2026-04-10).

Authoring note: Router skills in this phase were authored using the `skill-creator` workflow pattern and aligned to the locked Phase 0 contract.

- Build `pm-initiate`, `pm-plan`, `pm-execute`, `pm-close` using `pm-monitor` as canonical template.
- Keep `pm-monitor` behavior stable while aligning shared contract language.
- Success criteria:
  - [x] 5 routers available
  - [x] routing behavior consistent across lanes
  - [x] fallback/escalation behavior explicit

#### Phase 2: Initiate + plan controls

Status: Complete (2026-04-10).

Authoring note: Phase 2 subskills were authored using the `skill-creator` workflow pattern and aligned to the locked output schema and handoff gates.

- Build `pm-initiate-*` and `pm-plan-*` subskills.
- Establish context, charter, baseline, and RAID/RACI/decision setup early.
- Success criteria:
  - [x] upstream planning artifacts become reusable inputs for downstream lanes
  - [x] clear `initiate -> plan` handoff

#### Phase 3: Execute operations

Status: Complete (2026-04-10).

Authoring note: Phase 3 subskills were authored using the `skill-creator` workflow pattern and aligned to the shared output schema and lane handoff gates.

- Build `pm-execute-*` subskills for work coordination, iteration cadence, change control, and handoffs.
- Ensure decisions and changes link back to baseline artifacts.
- Success criteria:
  - [x] clear `plan -> execute` handoff
  - [x] change control and dependency handling operational

#### Phase 4: Monitor completion

Status: Complete (2026-04-10).

Authoring note: Phase 4 subskill and router alignment were authored using the `skill-creator` workflow pattern and the shared output schema.

- Add `pm-monitor-risk-escalation` to complete monitor lane controls.
- Align monitor outputs with the shared output contract.
- Success criteria:
  - [x] all core monitoring modes covered
  - [x] tolerance breach/escalation path explicit

#### Phase 5: Close lane completion and publish readiness

Status: Complete (2026-04-10).

Authoring note: Phase 5 close subskills and catalog updates were authored using the `skill-creator` workflow pattern and aligned to the shared output schema and handoff expectations.

- Build `pm-close-*` subskills for signoff, handover, lessons, and archive/benefits review.
- Update README catalog/lane mapping.
- Defer version bumps to merge-finalization on `main` per repo policy.
- Success criteria:
  - [x] lifecycle complete at 25 skills
  - [x] closure artifacts standardized
  - [x] publish checklist ready

## Alternative Approaches Considered

- Build all 25 skills in one pass: rejected due to high consistency risk and weak quality control.
- Expand only monitor lane first: rejected because lifecycle coverage remains incomplete.
- Follow one framework only (PMI-only or Scrum-only): rejected because no single framework covers governance + flow + closure hygiene sufficiently for this repository's goals.

## Acceptance Criteria

### Functional Requirements

- [ ] Exactly 25 skills exist in the baseline catalog (5 routers + 20 subskills).
- [ ] Every new skill is authored/refined via `skill-creator` workflow.
- [ ] Router skills follow consistent objective->source->route->delegate->summary behavior.
- [ ] Subskills return structured outputs with owner/action/date/status/evidence/`TBD` fields.
- [ ] Lane handoff rules are explicit between all adjacent lanes.

### Non-Functional Requirements

- [ ] Naming convention `pm-<phase>-<noun-or-object>` is consistently applied.
- [ ] Published names remain stable.
- [ ] No proprietary/customer-specific process details included.
- [ ] Existing monitor behavior remains compatible and non-regressive.

### Quality Gates

- [ ] README updated to reflect added skills/lane coverage.
- [ ] Each new skill has a clear description trigger and reusable workflow.
- [ ] Versioning policy is respected (no publish version bumps during branch drafting).

## Success Metrics

- Lifecycle coverage reaches 5/5 lanes with active router entry points.
- Skill catalog completeness reaches 25/25 planned baseline skills.
- Router-to-subskill delegation clarity: each router has clear primary modes and tie-breakers.
- Rework rate on initial skill reviews trends down after Phase 2 (signal of pattern consistency).

## Dependencies and Risks

### Dependencies

- Existing canonical pattern in `skills/pm-monitor/SKILL.md`
- Framework synthesis in `docs/pm-framework-research-25-skills.md`
- Maintainer alignment on naming and scope lock for 25 baseline skills

### Risks

- Scope creep beyond baseline 25 during implementation.
- Inconsistent authoring quality across lanes.
- Overly rigid framework interpretation reducing reuse.

### Mitigation

- Enforce phase gates and no-scope-creep rule until baseline is complete.
- Require `skill-creator` workflow for all authoring.
- Keep router thin and method-agnostic while preserving control artifacts.

## Documentation Plan

- Update `README.md` skill inventory and lane mapping as skills are added.
- Keep `docs/pm-framework-research-25-skills.md` as the source rationale for framework traceability.
- Add per-phase progress notes in `docs/plans/` if scope or sequencing changes.

## References and Research

### Internal References

- `README.md`
- `AGENTS.md`
- `CONTRIBUTING.md`
- `skills/pm-monitor/SKILL.md`
- `docs/pm-framework-research-25-skills.md`
- `tasks/03-27-lessons-from-building-skills.md`

### External Framework References

- PMI: PMBOK 7, The Standard for Project Management, Process Groups Practice Guide
- PRINCE2 v7 (official method guidance)
- Scrum Guide 2020
- Kanban Guide for Scrum Teams
- Evidence-Based Management Guide
- GOV.UK Service Manual and GovS 002 Project Delivery
