# Research: Framework-backed 25-skill baseline for PM lifecycle lanes

Date: 2026-04-10
Branch: `feat/25-skills`

## Objective

Define a framework-backed "lowest common denominator" set of 25 reusable PM skills across the lifecycle lanes in `README.md`:

- `initiate`
- `plan`
- `execute`
- `monitor`
- `close`

Design constraint: each lane uses a router skill that routes to subskills (progressive disclosure), following the existing pattern in `skills/pm-monitor/SKILL.md`.

## Research method

Parallel deep research was run across 5 framework clusters, then synthesized into one catalog:

1. PMI/PMBOK + Process Groups
2. PRINCE2 controls
3. Scrum (+ Kanban for Scrum teams, EBM, Nexus where relevant)
4. RAID/RACI/Decision-log practice
5. UK Service Manual + UK delivery playbooks/standards

## Source set (official/widely accepted)

### PMI

- `A Guide to the PMBOK(R) Guide - Seventh Edition`
- `The Standard for Project Management`
- `Process Groups: A Practice Guide`

### PRINCE2

- `Managing Successful Projects with PRINCE2, 7th Edition`
- PRINCE2 Foundation/Practitioner v7 official syllabus and framework pages

### Scrum and flow

- `The 2020 Scrum Guide`
- `The Kanban Guide for Scrum Teams` (2021)
- `The Evidence-Based Management Guide` (2024)
- `The Nexus Guide` (2021) for scale/dependency context

### RAID/RACI/Decision management

- PMI-aligned project controls practices (risk/issue/dependency/responsibility)
- ISO project governance family references (ISO 21500 context)
- SEBoK decision management guidance
- ADR references from AWS/Azure/community conventions

### UK delivery playbooks

- GOV.UK `Service Manual`
- GOV.UK `Service Standard`
- GOV.UK guidance for discovery/alpha/beta/live/retire phases
- UK `Government Functional Standard GovS 002: Project Delivery`
- IPA assurance and benefits-management guidance (where applicable)

## Synthesis: what each framework contributes

- PMI supplies lifecycle completeness and baseline artifacts for each lane.
- PRINCE2 supplies governance controls (stage boundaries, tolerances, exceptions, delegated authority).
- Scrum supplies execution cadence and inspect/adapt loops.
- Kanban/EBM supply lightweight operational metrics and outcome-oriented monitoring.
- RAID/RACI/Decision practices supply cross-lane control artifacts and traceability.
- UK Service guidance supplies user-centered discovery/delivery discipline and closure/handover hygiene.

## Core cross-lane artifacts to standardize in skills

- Project context (`.agents/project-context.md`)
- Charter/readiness decision
- Scope-schedule baseline (and estimate assumptions)
- RAID log and review cadence
- RACI/owner model with explicit accountability
- Decision log (append-only, linked to changes)
- Status + budget + risk signals
- Handover + acceptance + closure record

## Proposed framework-backed 25-skill baseline

Pattern: 5 routers + 20 subskills.

### Initiate (5)

1. `pm-initiate` (router)
2. `pm-initiate-project-context` (existing)
3. `pm-initiate-problem-framing`
4. `pm-initiate-stakeholder-map`
5. `pm-initiate-charter-and-viability-gate`

### Plan (5)

6. `pm-plan` (router)
7. `pm-plan-requirements-brief`
8. `pm-plan-scope-schedule-baseline`
9. `pm-plan-roadmap-and-prioritization`
10. `pm-plan-raid-raci-decision-setup`

### Execute (5)

11. `pm-execute` (router)
12. `pm-execute-work-package-coordination`
13. `pm-execute-iteration-cycle`
14. `pm-execute-change-control`
15. `pm-execute-dependency-and-handoff`

### Monitor (5)

16. `pm-monitor` (existing router)
17. `pm-monitor-ticket-triage` (existing)
18. `pm-monitor-status` (existing)
19. `pm-monitor-budget` (existing)
20. `pm-monitor-risk-escalation`

### Close (5)

21. `pm-close` (router)
22. `pm-close-acceptance-signoff`
23. `pm-close-handover-transition`
24. `pm-close-lessons-learned`
25. `pm-close-benefits-review-and-archive`

## Traceability map: skills to framework anchors

### PMI anchors

- Initiate: context, problem framing, charter/viability
- Plan: requirements, baseline, roadmap
- Execute: coordination, handoffs, change execution
- Monitor: status/budget/risk monitoring
- Close: acceptance, handover, lessons, archive

### PRINCE2 anchors

- `pm-initiate-charter-and-viability-gate` (continued justification)
- `pm-plan-raid-raci-decision-setup` (roles, controls, thresholds)
- `pm-execute-change-control` (issue/change workflow)
- `pm-monitor-risk-escalation` (tolerance breaches -> exception actions)
- `pm-close-acceptance-signoff` (controlled closure)

### Scrum/Kanban/EBM anchors

- `pm-plan-roadmap-and-prioritization` (backlog and objective ordering)
- `pm-execute-iteration-cycle` (planning/daily/review/retro behavior)
- `pm-monitor-status` (progress toward goals)
- `pm-monitor-ticket-triage` (flow hygiene and intake control)
- `pm-close-lessons-learned` (inspect/adapt carry-forward)

### RAID/RACI/Decision anchors

- `pm-plan-raid-raci-decision-setup` (bootstrap artifacts)
- `pm-execute-change-control` (decision linkage and impact checks)
- `pm-monitor-risk-escalation` (RAID operating cadence)
- `pm-close-benefits-review-and-archive` (traceability, closure evidence)

### UK Service / delivery playbook anchors

- `pm-initiate-problem-framing` (user/problem-first initiation)
- `pm-plan-roadmap-and-prioritization` (outcome-oriented phased delivery)
- `pm-execute-iteration-cycle` (evidence-led iteration)
- `pm-monitor-status` and `pm-monitor-risk-escalation` (visible progress + control)
- `pm-close-handover-transition` and `pm-close-benefits-review-and-archive` (live/retire and transfer discipline)

## Why this is "lowest common denominator"

- Covers all lifecycle lanes with one router each.
- Includes mandatory control artifacts used across most PM methods.
- Avoids heavyweight method lock-in while preserving governance and traceability.
- Keeps existing published monitor skills intact and extends around them.

## Baseline vs advanced scope

### Baseline (recommended now)

- The 25 skills listed above.
- Minimal structured outputs in each skill (owner, next action, due/review date, status, evidence/source).
- Escalation rules for missing data, tolerance breach, and approval-required changes.

### Advanced (later expansion, not required for first 25)

- Quantitative risk models and richer forecasting analytics.
- Multi-team scaling variants (portfolio-level dependency orchestration).
- Full formal assurance packs and deep benefits realization tracking.

## Implementation notes for SKILL.md authoring

- Keep routers thin: objective detect -> source check -> mode select -> delegate -> summary.
- Keep subskills deep: perform one operational workflow with structured output.
- Add explicit handoff rules between lanes (for example initiate -> plan when viability gate passes).
- Require evidence links/IDs and explicit unknowns (`TBD`) to avoid invented certainty.

## Recommendation

Adopt this 25-skill set as the baseline catalog for v1 lifecycle coverage. Build routers first (`pm-initiate`, `pm-plan`, `pm-execute`, `pm-close`) using `pm-monitor` as the template, then implement subskills in this order:

1. `pm-initiate-*` and `pm-plan-*` baseline controls
2. `pm-execute-*` operational workflows
3. `pm-monitor-risk-escalation`
4. `pm-close-*` closure and reuse workflows

This sequencing preserves your current strengths while closing the biggest coverage gaps first.
