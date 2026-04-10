---
name: pm-close-handover-transition
description: "Use when the user needs close-stage handover and transition operations: confirm operational ownership transfer, runbook/document readiness, support model clarity, and post-close accountability. Also use when closure is at risk because handoff artifacts are incomplete."
metadata:
  version: 0.1.0
---

# PM Close Handover Transition

You run a close-stage handover and transition workflow.

Primary goal: ensure operational continuity by making ownership transfer and handoff readiness explicit.

## Workflow

Before executing, copy this checklist and keep it updated in your working notes:

```text
Handover Transition Progress
- [ ] Step 1 complete: handover objective confirmed
- [ ] Step 2 complete: available tools and source quality checked
- [ ] Step 3 complete: handover artifacts and ownership map assessed
- [ ] Step 4 complete: transition readiness gaps identified
- [ ] Step 5 complete: transition actions and checkpoints defined
- [ ] Step 6 complete: handover/transition output returned
```

## Step 1: Confirm objective

Identify what transition outcome is needed:

- complete ownership transfer
- support readiness confirmation
- conditional handover with remaining actions

If `.agents/project-context.md` exists, read it first.

## Step 2: Check tools and source quality

Use strongest available sources:

1. handover plan, runbooks, and operational docs
2. owner assignments and support/escalation paths
3. acceptance/signoff output and open issues

Classify source quality as `high`, `medium`, or `low`.

## Step 3: Assess handover artifacts and ownership map

Confirm readiness of:

- documentation/runbook completeness
- access and tooling ownership
- support and escalation contacts
- transition timeline/checkpoints

Mark unknowns as `TBD`.

## Step 4: Identify transition readiness gaps

Surface gaps that block safe handover:

- missing docs or access
- unclear ownership boundaries
- unresolved support obligations
- untested escalation path

## Step 5: Define transition actions and checkpoints

Set:

- immediate actions to close gaps
- owner + date for each action
- first post-handover review checkpoint

## Step 6: Return handover/transition output

Always return this structure:

```md
# Handover and Transition - <project name or YYYY-MM-DD>

## Objective
- Handover objective:

## Tool Access Check
- Tools and systems used:
- Data sources used:
- Missing tools or data gaps:

## Current Signal
- Transition readiness: `ready` | `ready-with-conditions` | `not-ready` | `blocked`
- Highest continuity risk:

## Actions
| Item | Owner | Next action | Due/review date | Status | Evidence/source |
|------|-------|-------------|-----------------|--------|-----------------|
| | | | | | |

## Unknowns
- TBD:

## Follow-ups
- First post-handover checkpoint:
- Recommended next skill: `pm-close-lessons-learned`
```

## Rules

- Prioritize continuity and owner clarity.
- Never mark transition complete without evidence.
- Keep unknowns explicit as `TBD`.
