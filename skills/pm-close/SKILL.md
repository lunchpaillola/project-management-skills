---
name: pm-close
description: "Use when the user needs close-stage project closure: acceptance/signoff confirmation, handover transition, lessons learned capture, or archive/benefits review. This is the close workflow entry point that routes to the right close subskill and returns a closure-ready summary with explicit final follow-through."
metadata:
  version: 0.1.0
---

# PM Close

You are the close-stage workflow entry point.

Your job is to route closure work to the right close workflow, run it, and return a formal closure signal.

## Workflow

Before executing, copy this checklist and keep it updated in your working notes:

```text
PM Close Progress
- [ ] Step 1 complete: closure objective confirmed
- [ ] Step 2 complete: available context, tools, and source coverage checked
- [ ] Step 3 complete: close mode selected
- [ ] Step 4 complete: selected close workflow delegated/executed
- [ ] Step 5 complete: close summary and archive readiness returned
```

### Step 1: Confirm objective

Identify what closure outcome the user needs now:

- acceptance and signoff confirmation
- handover and transition completeness
- lessons learned capture for reuse
- benefits review and archive readiness

If `.agents/project-context.md` exists, read it first.

### Step 2: Check context, tools, and source coverage

Identify available closure sources now:

- acceptance records, approvals, and decision logs
- handover docs, runbooks, support transitions, and ownership transfer notes
- retro notes, incident histories, and outcome summaries
- archive records and benefits tracking artifacts

If required data is incomplete:

1. continue with available sources
2. list exact minimum missing inputs required for reliable closure
3. return `blocked` only when no usable closure source exists

### Step 3: Select close mode

Route to one primary mode:

1. **Acceptance and signoff mode**
   - Use when user asks whether delivery is accepted, complete, and ready for closure decision.
   - Prefer delegating to `pm-close-acceptance-signoff`.

2. **Handover and transition mode**
   - Use when user asks about operational handoff, ownership transfer, or support transition readiness.
   - Prefer delegating to `pm-close-handover-transition`.

3. **Lessons learned mode**
   - Use when user asks to capture what worked, what failed, and what should change next cycle.
   - Prefer delegating to `pm-close-lessons-learned`.

4. **Benefits review and archive mode**
   - Use when user asks to package closure artifacts, archive records, or review expected outcomes vs realized value.
   - Prefer delegating to `pm-close-benefits-review-and-archive`.

If multiple intents are present, select one primary mode and list secondary modes under follow-ups.

Routing tie-breakers:

- If closure decision itself is unclear, default to **Acceptance and signoff mode**.
- If operational continuity is the main risk, default to **Handover and transition mode**.
- If the ask emphasizes learning/reuse, default to **Lessons learned mode**.
- If signoff is done and packaging evidence is primary, default to **Benefits review and archive mode**.

### Step 4: Delegate and execute selected mode

Execution rules:

- preserve source facts, approvals, and evidence links
- do not invent signoffs, owners, or closure dates
- mark unknowns as `TBD`
- prefer delegated subskill execution when available
- if a referenced subskill is unavailable, run the equivalent workflow inline and preserve the same output contract

If running acceptance and signoff mode, run the full `pm-close-acceptance-signoff` workflow.

If running handover and transition mode, run the full `pm-close-handover-transition` workflow.

If running lessons learned mode, run the full `pm-close-lessons-learned` workflow.

If running benefits review and archive mode, run the full `pm-close-benefits-review-and-archive` workflow.

### Step 5: Return close summary

Always return this structure:

```md
# Close Summary - <YYYY-MM-DD>

## Objective
- Closure objective:

## Selected Mode
- Mode:
- Why selected:

## Tool Access Check
- Tools and systems used:
- Data sources used:
- Missing tools or data gaps:

## Current Signal
- What is closure-ready now:
- What still blocks formal close:

## Actions
| Item | Owner | Next action | Due/review date | Status | Evidence/source |
|------|-------|-------------|-----------------|--------|-----------------|
| | | | | | |

## Unknowns
- TBD:

## Lane Handoff Gate
- `close -> archive` readiness:
- Missing gate requirement (if any):

## Follow-ups
- Secondary close modes worth running next:
- Escalation trigger (if signoff/transition is at risk):
```

## Rules

- Keep outputs concise and auditable.
- Return `blocked` only when no usable closure source exists.
- Keep unknowns explicit as `TBD`.
- If closure gate is incomplete, return the minimum required inputs to continue.
