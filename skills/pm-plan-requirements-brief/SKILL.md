---
name: pm-plan-requirements-brief
description: "Use when the user needs to turn initiate outputs into a planning-ready requirements brief: objectives, scope boundaries, acceptance criteria, dependencies, and open requirement decisions. Also use when requirements are scattered and need one decision-ready brief before baseline planning."
metadata:
  version: 0.1.0
---

# PM Plan Requirements Brief

You run a plan-stage requirements-brief workflow.

Primary goal: produce a concise, execution-usable requirements brief with clear acceptance boundaries.

## Workflow

Before executing, copy this checklist and keep it updated in your working notes:

```text
Requirements Brief Progress
- [ ] Step 1 complete: requirements objective confirmed
- [ ] Step 2 complete: available tools and source quality checked
- [ ] Step 3 complete: requirements normalized and grouped
- [ ] Step 4 complete: acceptance boundaries and constraints defined
- [ ] Step 5 complete: unresolved requirement decisions identified
- [ ] Step 6 complete: brief and handoff returned
```

## Step 1: Confirm objective

Identify what requirement outcome is needed now:

- concise brief for planning/execution
- acceptance boundaries
- unresolved requirement decisions

If `.agents/project-context.md` exists, read it first.

## Step 2: Check tools and source quality

Use the strongest available sources:

1. problem framing and charter outputs
2. stakeholder and approval notes
3. existing requirement docs, tickets, and briefs

Classify source quality as `high`, `medium`, or `low`.

## Step 3: Normalize and group requirements

Group into clear buckets:

- functional
- non-functional
- compliance/operational constraints
- dependencies/integration requirements

For each requirement, preserve source wording where possible.

## Step 4: Define acceptance boundaries

For each high-priority requirement, capture:

- acceptance criteria
- out-of-scope boundary
- key assumptions/constraints

Mark unclear criteria as `TBD`.

## Step 5: Identify unresolved decisions

Surface requirement decisions that must be resolved before execution baseline.

Include owner and due/review date when known, otherwise `TBD`.

## Step 6: Return the requirements brief

Always return this structure:

```md
# Requirements Brief - <project name or YYYY-MM-DD>

## Objective
- Requirements objective:

## Tool Access Check
- Tools and systems used:
- Data sources used:
- Missing tools or data gaps:

## Current Signal
- Requirement readiness level:
- What is clear now:
- What is still unresolved:

## Requirements Snapshot
| Requirement | Type | Priority | Acceptance criteria | Status |
|-------------|------|----------|---------------------|--------|
| | | | | |

## Actions
| Item | Owner | Next action | Due/review date | Status | Evidence/source |
|------|-------|-------------|-----------------|--------|-----------------|
| | | | | | |

## Unknowns
- TBD:

## Follow-ups
- Requirement decisions needed:
- Recommended next skill: `pm-plan-scope-schedule-baseline`
```

## Rules

- Keep it concise and planning-ready.
- Do not invent acceptance criteria.
- Keep unknowns explicit as `TBD`.
