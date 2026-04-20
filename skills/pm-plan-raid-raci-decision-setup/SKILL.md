---
name: pm-plan-raid-raci-decision-setup
description: "Use when the user needs plan-stage control setup for execution: establish RAID tracking, RACI ownership clarity, and a decision log with review cadence. Also use when governance and traceability are weak or undefined before execution begins."
metadata:
  version: 0.1.0
---

# PM Plan RAID RACI Decision Setup

You run a plan-stage governance setup workflow.

Primary goal: establish usable control artifacts (RAID, RACI, decision log) before execution starts.

Communication style contract: when returning user-facing updates, briefs, or summaries, apply `pm-communication-style`.

## Workflow

Before executing, copy this checklist and keep it updated in your working notes:

```text
RAID RACI Decision Setup Progress
- [ ] Step 1 complete: governance objective confirmed
- [ ] Step 2 complete: available tools and source quality checked
- [ ] Step 3 complete: RAID starter set built
- [ ] Step 4 complete: RACI ownership map built
- [ ] Step 5 complete: decision log and cadence defined
- [ ] Step 6 complete: governance setup output and handoff returned
```

## Step 1: Confirm objective

Confirm what needs to be operationalized now:

- risk/issue/dependency visibility
- ownership clarity
- decision traceability and review rhythm

If `.agents/project-context.md` exists, read it first.

## Step 2: Check tools and source quality

Use strongest available sources:

1. stakeholder map and roadmap outputs
2. scope/schedule baseline and assumptions
3. known risks, dependencies, and pending decisions

If data is incomplete, proceed and mark `TBD`.

## Step 3: Build RAID starter set

Capture a minimal operational RAID set:

- top risks
- active issues
- critical assumptions
- key dependencies

Each item needs owner, next action, and review date (or `TBD`).

## Step 4: Build RACI map

Create role-level RACI for major workstreams and control points.

Do not assign authority without source evidence.

## Step 5: Define decision log and cadence

Create an initial decision register with:

- decision statement
- options considered
- decision owner
- due/review date
- status and evidence

Set a practical review cadence.

## Step 6: Return governance setup output

Always return this structure:

```md
# RAID RACI Decision Setup - <project name or YYYY-MM-DD>

## Objective
- Governance objective:

## Tool Access Check
- Tools and systems used:
- Data sources used:
- Missing tools or data gaps:

## Current Signal
- Governance readiness level:
- Most urgent control gap:

## RAID Snapshot
| Item | Type (`risk`|`assumption`|`issue`|`dependency`) | Owner | Next action | Due/review date | Status |
|------|----------------------------------------------------|-------|-------------|-----------------|--------|
| | | | | | |

## RACI Snapshot
| Workstream/Decision Area | Responsible | Accountable | Consulted | Informed |
|--------------------------|-------------|-------------|-----------|----------|
| | | | | |

## Actions
| Item | Owner | Next action | Due/review date | Status | Evidence/source |
|------|-------|-------------|-----------------|--------|-----------------|
| | | | | | |

## Unknowns
- TBD:

## Follow-ups
- Control artifacts to finalize before execution:
- Recommended next skill: `pm-execute-work-package-coordination`
```

## Rules

- Keep governance lightweight but explicit.
- Never hide owner/date gaps.
- Keep unknowns explicit as `TBD`.
