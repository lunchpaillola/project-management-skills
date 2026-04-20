---
name: pm-plan-roadmap-and-prioritization
description: "Use when the user needs to sequence work and make plan-stage tradeoffs: what is now/next/later, what should be deprioritized, and why. Also use when teams need a transparent prioritization rationale tied to outcomes, dependencies, and constraints."
metadata:
  version: 0.1.0
---

# PM Plan Roadmap and Prioritization

You run a plan-stage roadmap and prioritization workflow.

Primary goal: produce a clear sequence and prioritization rationale that supports execution decisions.

Communication style contract: when returning user-facing updates, briefs, or summaries, apply `pm-communication-style`.

## Workflow

Before executing, copy this checklist and keep it updated in your working notes:

```text
Roadmap Prioritization Progress
- [ ] Step 1 complete: prioritization objective confirmed
- [ ] Step 2 complete: available tools and source quality checked
- [ ] Step 3 complete: candidate work items normalized
- [ ] Step 4 complete: prioritization method applied
- [ ] Step 5 complete: roadmap sequence and tradeoffs finalized
- [ ] Step 6 complete: roadmap output and handoff returned
```

## Step 1: Confirm objective

Identify what decision is needed:

- what to do now, next, later
- what to pause or remove
- what tradeoff is required

If `.agents/project-context.md` exists, read it first.

## Step 2: Check tools and source quality

Use strongest available sources:

1. requirements brief and scope baseline
2. dependency and risk signals
3. stakeholder priorities and constraints

If data is partial, continue with explicit assumptions.

## Step 3: Normalize candidate items

For each item capture:

- outcome/value signal
- effort or complexity signal
- dependency risk
- urgency and timing sensitivity

Do not fabricate point estimates.

## Step 4: Apply prioritization method

Default method order:

1. user-provided method
2. `Now/Next/Later` with rationale
3. `MoSCoW` if strict scope pressure exists

Keep method simple and auditable.

## Step 5: Finalize roadmap and tradeoffs

Return:

- recommended sequence
- major tradeoffs and what is deprioritized
- decision points that may force resequencing

## Step 6: Return roadmap output

Always return this structure:

```md
# Roadmap and Prioritization - <project name or YYYY-MM-DD>

## Objective
- Prioritization objective:

## Tool Access Check
- Tools and systems used:
- Data sources used:
- Missing tools or data gaps:

## Current Signal
- Prioritization confidence: `high` | `medium` | `low`
- What should happen first:
- Main tradeoff pressure:

## Roadmap Snapshot
| Item | Priority band (`now`|`next`|`later`) | Why | Owner | Target checkpoint | Status |
|------|--------------------------------------|-----|-------|-------------------|--------|
| | | | | | |

## Actions
| Item | Owner | Next action | Due/review date | Status | Evidence/source |
|------|-------|-------------|-----------------|--------|-----------------|
| | | | | | |

## Unknowns
- TBD:

## Follow-ups
- Decisions likely to force resequencing:
- Recommended next skill: `pm-plan-raid-raci-decision-setup`
```

## Rules

- Keep prioritization transparent and explainable.
- Separate source facts from ranking assumptions.
- Keep unknowns explicit as `TBD`.
