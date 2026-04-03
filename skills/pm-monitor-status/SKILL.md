---
name: pm-monitor-status
description: "Use when the user needs a monitor-stage status rollup for active delivery work: current project state, what changed, what is at risk, decisions needed, and who owns next follow-through. Also use when the user asks for a standup-ready update, leadership snapshot, or cross-functional status summary from PM tools, notes, and operating signals. This skill is RAG/RAID grounded and should be used whenever status needs to be decision-ready with explicit escalation signals."
metadata:
  version: 0.1.0
---

# PM Monitor Status

You run a monitor-stage status workflow that turns scattered delivery signals into a decision-ready status output.

Primary goal: answer "where do things stand right now, what needs attention, and what happens next?" with clear ownership and follow-through.

RAG/RAID operating rule:

- express delivery state as RAG (`green`, `amber`, `red`, `blocked`)
- maintain a concise RAID view (`risks`, `assumptions`, `issues`, `dependencies`)
- map each red/amber signal to an owner, next action, and escalation trigger

## Workflow

Before executing, copy this checklist and keep it updated in your working notes:

```text
Status Progress
- [ ] Step 1 complete: status objective and audience confirmed
- [ ] Step 2 complete: available sources and signal quality confirmed
- [ ] Step 3 complete: project state and RAG signal synthesized
- [ ] Step 4 complete: RAID items and owner gaps identified
- [ ] Step 5 complete: decisions and next milestones clarified
- [ ] Step 6 complete: status output returned
```

Do not skip steps.

## Step 1: Confirm status objective and audience

Identify what the user needs now:

- standup-ready team update
- stakeholder or leadership rollup
- project health snapshot before a meeting
- cross-functional follow-through check

If `.agents/project-context.md` exists, read it first.

Set audience tone and detail level:

- team-level: specific tasks and owner actions
- leadership-level: concise signal, major risks, and decision asks

## Step 2: Confirm sources and signal quality

Use the strongest available sources in this order:

1. PM system records (Jira, Linear, ClickUp, Asana, Trello)
2. latest status notes or meeting summaries
3. delivery artifacts (milestone plan, backlog views, release notes)
4. communication signals (Slack, comments, email threads)

Classify source quality:

- `high`: PM records plus recent status signal
- `medium`: PM records or status notes, but one side is weak
- `low`: narrative-only or partial context

If data is incomplete, continue with what exists and list the minimum missing input to improve reliability.

Return `blocked` only when no usable project-status signal exists.

## Step 3: Synthesize current project state and RAG signal

Build a concise status signal:

- current state: `green`, `amber`, `red`, or `blocked`
- what changed since the previous visible checkpoint
- what needs attention now

Use these default status heuristics unless a project-specific rubric is provided:

- `green`: no material blockers, plan variance appears recoverable within existing owners and timeline
- `amber`: one or more meaningful risks, delays, or owner gaps need active management this cycle
- `red`: delivery objective is at material risk without immediate intervention, replan, or escalation
- `blocked`: essential source signal is missing or critical dependency makes progress impossible now

Use source facts first, then inference. Keep them separate.

Source facts include:

- open vs completed work movement
- milestone or deliverable state
- newly opened high-priority items
- recorded blockers or dependency delays

Inferred signals include:

- likely schedule pressure
- coordination risk
- follow-through fragility

Do not invent owners, due dates, or completion percentages.

## Step 4: Identify RAID items and owner gaps

Surface the smallest set of issues that drive outcomes:

- **Risks**: probable future problems not yet realized
- **Assumptions**: conditions believed true that affect execution
- **Issues**: active blockers/problems happening now
- **Dependencies**: external prerequisites, approvals, or handoffs
- owner gaps (`TBD` when unknown)

Each flagged issue must include a next action and explicit next state.

Do not collapse risk and issue into one bucket. If an item is happening now, classify it as an issue.

## Step 5: Clarify decisions and next milestones

List:

- decisions needed now
- near-term milestones or checkpoints
- what each owner should do next

If a decision owner is unclear, mark `TBD` and suggest the responsible role.

## Step 6: Return the status output

Default to a concise, meeting-ready report:

```md
# Status - <project name or YYYY-MM-DD>

- Status: `green` | `amber` | `red` | `blocked`
- Confidence: `high` | `medium` | `low`
- Audience: <team | leadership | mixed>
- Sources used: <one short line>
- What changed: <1-3 bullets>
- What needs attention now: <1-3 bullets>

## RAID Snapshot
| Item | Why it matters | Owner | Next action | Due/review date | State |
|------|----------------|-------|-------------|-----------------|-------|
| | | | | | |

## Milestones and Decisions
| Item | Type | Owner | Next checkpoint | Decision needed |
|------|------|-------|-----------------|-----------------|
| | | | | |

## Follow-through
- Secondary monitor mode to run next:
- Minimum missing input to improve confidence:
```

Include RAID type in each row as `[R]`, `[A]`, `[I]`, or `[D]` prefix in `Item`.

If `blocked`, use the same shape with:

- Status: `blocked`
- Missing source: one concrete input
- Best next step: how to provide or connect it

## Rules

- Keep output operational and concise.
- Prefer decision-ready bullets and tables over narrative blocks.
- Keep unknowns explicit as `TBD`.
- Do not auto-close items.
- Preserve source IDs and references when provided.
- For `amber` or `red`, include one explicit escalation trigger.
