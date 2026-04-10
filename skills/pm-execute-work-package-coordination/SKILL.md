---
name: pm-execute-work-package-coordination
description: "Use when the user needs execute-stage coordination of active work packages: clarify owner-by-owner follow-through, sequencing, and near-term commitments across in-flight work. Also use when delivery is moving but ownership drift, uneven updates, or hidden blockers are reducing throughput."
metadata:
  version: 0.1.0
---

# PM Execute Work Package Coordination

You run an execute-stage coordination workflow for in-flight work packages.

Primary goal: make execution ownership explicit and keep near-term work moving with clear next actions.

## Workflow

Before executing, copy this checklist and keep it updated in your working notes:

```text
Work Package Coordination Progress
- [ ] Step 1 complete: execution objective confirmed
- [ ] Step 2 complete: available tools and source quality checked
- [ ] Step 3 complete: active work packages normalized
- [ ] Step 4 complete: owner and sequencing gaps identified
- [ ] Step 5 complete: coordination actions and checkpoints set
- [ ] Step 6 complete: execution output returned
```

## Step 1: Confirm objective

Identify the coordination ask now:

- who owns what right now
- what needs sequencing or rebalancing
- what can move this cycle vs what is blocked

If `.agents/project-context.md` exists, read it first.

## Step 2: Check tools and source quality

Use strongest available sources:

1. tracker board/export and current status signals
2. latest standup notes, comments, and handoff records
3. scope/roadmap baseline for sequencing context

Classify source quality as `high`, `medium`, or `low`.
Return `blocked` only when no usable execution source exists.

## Step 3: Normalize active work packages

For each package capture:

- package item and current state
- owner
- next action
- due/review date
- dependencies
- evidence/source

If owner/date are missing, mark `TBD`.

## Step 4: Identify ownership and sequencing gaps

Surface execution risks:

- owner gaps
- stale/no-update items
- sequencing conflicts
- blocked dependencies

Do not auto-close items.

## Step 5: Set coordination actions and checkpoints

Define:

- top actions to unblock flow
- owner follow-through checkpoints
- escalation trigger for items likely to breach tolerance

## Step 6: Return coordination output

Always return this structure:

```md
# Work Package Coordination - <project name or YYYY-MM-DD>

## Objective
- Coordination objective:

## Tool Access Check
- Tools and systems used:
- Data sources used:
- Missing tools or data gaps:

## Current Signal
- Flow state:
- What is moving:
- What needs attention now:

## Actions
| Item | Owner | Next action | Due/review date | Status | Evidence/source |
|------|-------|-------------|-----------------|--------|-----------------|
| | | | | | |

## Unknowns
- TBD:

## Follow-ups
- Items needing reassignment or resequencing:
- Recommended next skill: `pm-monitor-status`
```

## Rules

- Keep output concise and execution-ready.
- Preserve source IDs and existing wording where possible.
- Keep unknowns explicit as `TBD`.
