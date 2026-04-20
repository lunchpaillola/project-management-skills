---
name: pm-monitor-risk-escalation
description: "Use when the user needs monitor-stage risk escalation operations: identify active blocker/risk concentration, assess tolerance breach likelihood, and route explicit escalation actions with owners and review checkpoints. Also use when work is stuck, updates are stale, or decisions are delayed and escalation clarity is needed."
metadata:
  version: 0.1.0
---

# PM Monitor Risk Escalation

You run a monitor-stage risk escalation workflow.

Primary goal: convert risk and blocker signals into explicit escalation decisions and follow-through.

Communication style contract: when returning user-facing updates, briefs, or summaries, apply `pm-communication-style`.

## Workflow

Before executing, copy this checklist and keep it updated in your working notes:

```text
Risk Escalation Progress
- [ ] Step 1 complete: escalation objective confirmed
- [ ] Step 2 complete: available tools and source quality checked
- [ ] Step 3 complete: risks, issues, and tolerance signals synthesized
- [ ] Step 4 complete: escalation candidates and decision paths identified
- [ ] Step 5 complete: owner actions and review checkpoints set
- [ ] Step 6 complete: risk-escalation output returned
```

## Step 1: Confirm escalation objective

Identify what escalation question needs answering now:

- what is stuck and why
- what is likely to breach tolerance
- who must decide next and by when

If `.agents/project-context.md` exists, read it first.

## Step 2: Check tools and source quality

Use strongest available sources:

1. status updates, RAID logs, and dependency records
2. tracker states, stale items, and blocker comments
3. decision logs, approval queues, and handoff notes

Classify source quality as `high`, `medium`, or `low`.

If sources are partial, continue with explicit assumptions.
Return `blocked` only when no usable risk or blocker signal exists.

When source quality is `medium` or `low` (but not `blocked`), continue with a best-effort escalation view and request exactly one concrete missing source that would most improve confidence.

## Step 3: Synthesize risk, issue, and tolerance signals

Separate:

- active issues (happening now)
- forward risks (likely to happen)
- dependency and ownership fragility

For each critical item, assess tolerance pressure as:

- `within-tolerance`
- `approaching-breach`
- `breach-likely`

Do not invent owners or deadlines.

## Step 4: Identify escalation candidates and decision paths

Escalate items when one or more apply:

- no owner follow-through
- unresolved blocker beyond expected review point
- dependency delay threatens milestone integrity
- decision needed is outside current team's authority

For each candidate, define escalation target and decision needed.

## Step 5: Set owner actions and checkpoints

Define:

- immediate mitigation action
- escalation action and owner
- decision deadline/review checkpoint
- fallback if decision is delayed

For each escalated item, make the fallback explicit in the returned actions (not only in working notes).

Mark unknowns as `TBD`.

## Step 6: Return risk escalation output

Always return this structure:

```md
# Risk Escalation - <project name or YYYY-MM-DD>

## Objective
- Escalation objective:

## Tool Access Check
- Tools and systems used:
- Data sources used:
- Missing tools or data gaps:

## Current Signal
- Overall escalation signal: `stable` | `watch` | `escalate-now` | `blocked`
- Top tolerance pressure:
- What needs attention now:

## Confidence
- Source quality: `high` | `medium` | `low`
- One best missing source to improve confidence (if not `high`):

## Actions
| Item | Owner | Next action | Due/review date | Status | Evidence/source |
|------|-------|-------------|-----------------|--------|-----------------|
| | | | | | |

## Unknowns
- TBD:

## Follow-ups
- Escalations that must happen next:
- Recommended next skill: `pm-close-acceptance-signoff` (when risk disposition is complete)
```

## Rules

- Keep output concise, operational, and decision-ready.
- Never collapse active issues into generic risk language.
- Keep unknowns explicit as `TBD`.
- If confidence is below `high`, ask for one concrete missing source only.
