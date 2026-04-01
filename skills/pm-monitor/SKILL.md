---
name: pm-monitor
description: "Use when the user needs project monitoring operations: intake triage, status updates, blocker/risk follow-through, owner check-ins, or a clear \"what needs attention now\" view. This is the monitor-stage workflow entry point that routes to the right monitor sub-workflow (for example ticket triage) and returns an execution-ready monitoring output."
metadata:
  version: 0.2.0
---

# PM Monitor

You are the monitor-stage workflow entry point.

Your job is to choose the right monitor workflow, run it, and return clear next actions.

## Workflow

Before executing, copy this checklist and keep it updated in your working notes:

```text
PM Monitor Progress
- [ ] Step 1 complete: monitoring objective confirmed
- [ ] Step 2 complete: available tools and sources identified
- [ ] Step 3 complete: monitor mode selected
- [ ] Step 4 complete: selected monitor workflow executed
- [ ] Step 5 complete: monitoring summary and next actions returned
```

### Step 1: Confirm monitoring objective

Identify what the user is trying to monitor right now:

- intake quality and response flow
- current project status snapshot
- budget/burn/forecast health for an active project
- risks/blockers and follow-through
- ownership drift (items with no owner or stale updates)

If `.agents/project-context.md` exists, read it first.

### Step 2: Identify available tools and sources

Before running a mode, identify what the workflow can use now:

- tracker and issue tools (for example Jira/Linear/ClickUp)
- communication tools (for example Slack/Email)
- docs/context sources (for example Notion/Confluence/files)

If project context already lists tools, use that. If not, infer from artifacts and state assumptions.

If required data is unavailable:

1. continue with available sources
2. list exact minimum missing inputs needed to proceed (for example ticket export, comment thread)
3. return `blocked` only when no usable source data exists

### Step 3: Select monitor mode

Route to one primary mode:

1. **Intake triage mode**
   - Use when user asks about incoming tickets/comments/feedback, what needs response, or backlog cleanup.
   - Prefer using `pm-monitor-ticket-triage`.

2. **Budget review mode**
   - Use when user asks about burn rate, budget drift, forecast to complete, project financial health, margin risk, or whether change control / escalation is needed.
   - Prefer using `pm-monitor-budget`.

3. **Status update mode**
   - Use when user asks for status rollup, stakeholder update, or progress snapshot.
   - Return: current status, at-risk items, decisions needed, and next milestones.

4. **Risk and follow-through mode**
   - Use when user asks what is stuck, what went quiet, or what needs escalation.
   - Return: blocker list, owner gaps, overdue reviews, and escalation actions.

If multiple intents are present, pick one primary mode and list secondary modes under follow-ups.

Routing tie-breakers:

- If the user asks what is new, what needs attention first, what needs response, or how to sort incoming work, default to **Intake triage mode** even if tool access is broken or stale-work language is present.
- If the user asks for a project or portfolio snapshot, current status, milestones, or an exec update, default to **Status update mode** and list budget or risk checks as secondary follow-ups if mentioned.
- If the user explicitly asks about budget, burn, forecast, margin, or change control, default to **Budget review mode**.
- Use **Risk and follow-through mode** only when blockers, owner gaps, silence/staleness, or escalation are the primary ask rather than a secondary concern.

### Step 4: Execute selected mode

Execution rules:

- preserve source facts and IDs
- do not invent owners or deadlines
- mark unknowns as `TBD`
- produce decision-ready outputs, not narrative-only summaries
- stay inside the source boundary the user implied; do not mine unrelated local repo state or git activity as a substitute for PM/tool data unless the user explicitly asked you to inspect the repo as the monitor source

If running intake triage mode, run the full `pm-monitor-ticket-triage` workflow.

If running budget review mode, run the full `pm-monitor-budget` workflow.

### Step 5: Return monitor summary

Always return this structure:

```md
# Monitor Summary - <YYYY-MM-DD>

## Selected Mode
- Mode:
- Why selected:

## Tool Access Check
- Tools and systems used:
- Data sources used:
- Missing tools or data gaps:

## Current Signal
- What needs attention now:
- Top 3 risks or priorities:

## Actions
| Item | Owner | Next action | Due/review date | Status |
|------|-------|-------------|-----------------|--------|
| | | | | |

## Follow-ups
- Secondary monitor modes worth running next:
- Missing context to resolve:
```

## Rules

- Keep outputs concise and operational.
- Never close items implicitly; always state next state.
- If blocked by missing input, return the minimum required inputs to continue.
- If tool context is incomplete, surface the gap explicitly before recommendations.
- If tool access is broken but the user still wants a monitor pass, keep the originally selected mode when the request makes it clear, continue with request-text context only, and ask for the minimum substitute source needed.
