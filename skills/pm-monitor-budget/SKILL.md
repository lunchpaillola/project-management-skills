---
name: pm-monitor-budget
description: Use when the user needs a monitor-stage budget health check for an active project or client engagement. This skill follows a structured project cost tracking workflow: establish baseline, gather actuals and commitments, estimate remaining cost, forecast total outcome, compare variance, and recommend the next management action. Also use when the user asks how a project is doing budget-wise, whether burn looks healthy, whether a project is drifting, or what should be connected to answer budget questions reliably.
metadata:
  version: 0.2.0
---

# PM Monitor Budget

You run a lightweight project-financial monitoring workflow for active delivery work.

Primary goal: answer "how are we budget-wise?" from existing project sources using a clear cost-tracking workflow and a conservative, decision-ready budget-health signal.

Anchor the workflow on this model:

1. baseline
2. actuals and commitments
3. forecast remaining
4. forecast at completion
5. variance
6. action / change control

This is a monitor skill, not a finance system. Work from available project artifacts and connected tools, separate source facts from inferred signals, and avoid false precision.

## Workflow

Before executing, copy this checklist and keep it updated in your working notes:

```text
Budget Monitor Progress
- [ ] Step 1 complete: project and monitoring objective confirmed
- [ ] Step 2 complete: available sources and evidence level confirmed
- [ ] Step 3 complete: baseline established
- [ ] Step 4 complete: actuals and commitments gathered
- [ ] Step 5 complete: forecast remaining, forecast at completion, and variance assessed
- [ ] Step 6 complete: action, confidence level, and missing-source guidance assessed
- [ ] Step 7 complete: budget health output returned
```

Do not skip steps.

## Step 1: Confirm monitoring objective

Identify what the user wants to know now:

- current budget health
- whether current progress looks healthy against the project baseline
- whether visible drift suggests budget pressure
- what additional source needs to be connected for a stronger answer

If `.agents/project-context.md` exists, read it first.

Preserve the engagement's existing commercial language when available, including terms like `budget`, `hours`, `burn`, `margin`, `forecast`, `change order`, or `SOW`.

## Step 2: Confirm available sources and evidence level

Look for the best available inputs in this order:

1. commercial baseline source (`SOW`, scope doc, estimate doc, proposal, kickoff notes)
2. project management source (tracker, export, milestone plan, status report)
3. actual-hours or spend source if available
4. status updates, risk logs, meeting notes, or delivery summaries
5. backlog or remaining-scope summary

Typical usable sources:

- SOW or scope document
- estimate sheet
- proposal or kickoff notes
- PM tracker or tracker export
- status report or weekly update
- PM notes
- timesheet export
- resource tracker
- sprint or milestone tracker

Classify evidence level before analyzing:

- `high`: actual hours or spend are available alongside a usable commercial baseline
- `medium`: commercial baseline plus strong PM progress signals are available, but no trustworthy actuals
- `low`: mostly narrative signals; analysis must stay directional

If the commercial baseline is missing, the skill is not ready to judge budget health. Return `blocked` with the minimum baseline source needed.

If the PM/project-progress source is missing, continue only if the user provided enough delivery status context manually. Otherwise return the exact project-status source needed.

When the user names a project but does not provide the baseline inline, first try to find the project and its sources before returning `blocked`.

Default search order:

1. project context and linked source-of-truth docs
2. scope, SOW, estimate, or proposal docs for the named project
3. PM system records, exports, or notes for the named project

If those sources exist, use them and give the best available answer. Only return `blocked` after trying to locate them.

For source-seeking or source-aware prompts, make the source state visible in the final answer. Briefly name which baseline and PM sources were checked, assumed from the prompt, or unavailable in-session. Keep this to one short line or fold it into `Basis`; do not turn it into a long source log.

## Step 3: Establish the baseline

Start with the approved or working baseline. Capture what the project was supposed to cost and deliver.

Baseline fields to capture when possible:

- project / engagement name
- client price / project fee
- scoped labor hours
- planned start date
- target end date
- major milestones or workstreams
- contingency if explicitly defined

If the baseline only exists partially, use the strongest available version and say what is still missing.

## Step 4: Gather actuals and commitments

Next gather the strongest evidence for what has been consumed and what is likely already committed.

Capture when possible:

- actual spend to date
- actual hours used to date
- active staffing / role mix
- open work already in motion
- remaining milestone or task load
- known changes, blockers, or rework
- rate assumptions used if hours must be translated into cost

Treat `commitments` broadly for V1. If a formal commitments source does not exist, use the best available proxy such as:

- work already underway but not closed
- major remaining milestones already committed to the client
- dependency work the team clearly must absorb

Use these fallback rules:

1. If actual spend is known, use it as strongest burn evidence.
2. If only actual hours are known, estimate burn from hours using provided rates or one blended rate.
3. If both actual hours and an explicit rate are provided, calculate `estimated spend to date = actual hours * rate` and treat that as the strongest current burn signal.
4. If no actuals exist, do not claim actual burn. Use baseline plus PM progress to produce only a directional signal.

When estimating, mark assumptions explicitly. Example assumptions:

- blended rate assumed from current team mix
- spend-to-date inferred from hours used
- progress estimate inferred from task state, percent complete, and open risks

Keep source facts and inferred signals separate.

Source facts include:

- fee charged to client
- scoped labor hours
- actual hours used
- actual spend to date
- percent complete from PM tool
- milestone status

Inferred signals include:

- likely budget pressure
- directional burn concern
- confidence level
- likely need for tighter monitoring

## Step 5: Forecast remaining, forecast at completion, and variance

Follow this cost-tracking sequence explicitly:

1. estimate remaining cost or effort
2. estimate forecast at completion
3. compare forecast at completion to baseline
4. identify the main variance drivers

At minimum, assess:

- actuals vs baseline so far
- remaining scope vs remaining baseline capacity
- whether current commitments and blockers suggest additional cost pressure
- whether the likely finish position is inside or outside the baseline

If actuals are absent, use directional language only.

If hours and rate are both known, do the simple burn math rather than leaving it implicit:

- `estimated spend to date = actual hours * rate`
- if the fee is known, compare that estimate to the fee and briefly state remaining fee headroom
- if the user gives a rough remaining-work percentage or similar PM signal, compare that remaining work directionally against the remaining fee headroom

Use rounded, executive-safe estimates. Do not add fake precision just because the arithmetic is available.

Good questions:

- Do the scope doc and PM tool tell a consistent story?
- Does remaining work look proportionate to remaining budget capacity?
- Are blockers, rework, or new asks likely to push forecast at completion above baseline?
- Do we have enough evidence to calculate, or only enough to signal risk directionally?

Classify overall health as one of:

- `on-track`
- `watch`
- `at-risk`

## Step 6: Recommend action and confidence level

Recommend one primary management action:

- `stay-course`
- `internal-correction`
- `change-control`
- `escalate`

Action rules:

- Use `stay-course` when variance appears manageable within the current baseline.
- Use `internal-correction` when delivery or staffing adjustments may recover the project without formal commercial change.
- Use `change-control` when scope, assumptions, or client requests materially alter cost or timeline.
- Use `escalate` when the issue requires a management or client decision now.

Identify the most likely variance drivers. Common drivers include:

- scope growth or unapproved changes
- rework
- dependency delay
- client approval lag
- staffing change or role mix shift
- low throughput relative to timeline
- technical complexity discovered late

Then determine the confidence level:

- `high`: actuals plus baseline plus delivery context support the conclusion
- `medium`: baseline plus strong progress signals support a directional answer
- `low`: the signal is weak and should mainly guide what to connect next

If confidence is not `high`, explicitly list the minimum next source that would most improve reliability. Prefer one concrete missing source, not a long wishlist.

Recommended next-source priorities:

1. actual hours used to date
2. actual spend to date
3. milestone / percent-complete source
4. remaining scope summary

## Step 7: Return the budget review

Default to a short, conversational executive update. Write like this may be read inside a PM tool by a busy CEO, delivery lead, or account owner.

Lead with the answer in plain language. Only include the minimum supporting detail needed to justify the signal and make a next decision.

Use this default shape:

```md
# Budget Health - <project name or YYYY-MM-DD>

<One short sentence with the headline assessment.>

- Status: `on-track` | `watch` | `at-risk` | `blocked`
- Confidence: `high` | `medium` | `low`
- Why: <1-2 short bullets on the strongest evidence>
- Framework: `baseline -> actuals/commitments -> forecast remaining -> forecast at completion -> variance -> action`
- Biggest budget pressure: <top driver, or `none visible`>
- Recommended action: `stay-course` | `internal-correction` | `change-control` | `escalate`
- Best next step: <one concrete action or missing source>

If useful, add:
- Sources used: <one short line naming the baseline and PM/delivery source used, assumed, or not available>
- Basis: `actual financials` | `estimated from hours` | `delivery signal inference`
- Variance view: <brief baseline vs forecast statement>
- Assumptions: <only if they materially affect the answer>
```

Only expand beyond that format when the user explicitly asks for more detail, a fuller report, or a tabular breakdown.

If the skill is blocked, use the same response shape, but keep it minimal:

```md
# Budget Health - <project name>

I can't give a reliable budget signal yet.

- Status: `blocked`
- Missing source: <one concrete source>
- Why it matters: <what that source would clarify>
- Best next step: <how to get or connect it>
```

## Output rules

- Be concise, commercial, and conversational.
- Prefer a short decision-ready answer over a formal report.
- Write for an executive reader first: plain language, no unnecessary sections, no filler.
- In `Why`, prefer the strongest evidence in this order: actual spend or hours first, then schedule/progress mismatch, then scope-change or blocker drivers.
- For source-aware prompts, visibly show what sources were used or not available without expanding into a research narrative.
- Do not invent exact spend, margin, or completion percentages.
- If exact burn is unavailable, do not imply that it is known.
- If the user gave hours and rate, estimate current burn plainly and keep the estimate visibly separate from remaining-work assumptions.
- Keep unknowns visible.
- Keep source facts and inferred conclusions clearly distinct, but do it lightly rather than with heavy formatting.
- If the best answer is "not reliable enough yet," say that clearly and name the one best next source to connect.

## Cost-tracking interpretation notes

Use the framework practically, not dogmatically:

- `baseline` can come from fee, scoped hours, estimate, or SOW
- for retainers or monthly capacity models, treat the monthly fee plus expected monthly capacity as the working baseline
- for provisional takeover or rescue estimates, treat the baseline as real but less stable and say that inherited-code discovery can weaken forecast confidence
- for discovery-to-build handoffs, treat the discovery-backed MVP and the requested phase-1 scope as separate until they are commercially re-baselined
- `actuals` can come from spend or hours used
- `commitments` can be formal commitments or the strongest available proxy from in-flight work and remaining milestones
- `forecast remaining` can be quantitative when actuals exist, or directional when they do not
- `forecast at completion` should be conservative and clearly labeled when estimated
- `variance` is the gap between baseline and likely finish position
- `action` is the management response, not just a description of the problem

## Input patterns this skill should handle well

### Pattern 1: Conversational hours plus rate

```md
Rate is $75/hour. I spent 35 hours on this scope and charged $3,000. What burn am I at? We have about 1 month left and two revisions still in the project. I'd guess maybe 30% of the project is left.
```

### Pattern 2: Narrative PM status

```md
We are halfway through the planned schedule. Core product work is mostly complete, but the integration is behind and UAT has not started. Client added new reporting asks. Team has spent more time than expected on rework and dependency management.
```

Pattern 2 is the closest to what a PM will usually provide. Reduce precision, increase explicit assumptions, and focus on whether the current evidence is strong enough to answer.

If a baseline source is not present in the prompt or connected sources, return `blocked` and ask for the minimum baseline source needed rather than pretending a budget variance can be judged from PM narrative alone.

### Pattern 3: Find the project and inspect sources

```md
How are we budget-wise on the patient onboarding project? Try to find the scope and whatever is in Linear, ClickUp, or Asana first, then give me your best read.
```

For pattern 3:

- try to locate the named project before asking for more input
- inspect both the commercial baseline and PM progress sources if available
- answer from what you can actually find
- say briefly what you checked or what was unavailable in-session
- if confidence is still weak, name the one best additional source to connect

### Pattern 4: Retainer or monthly-capacity work

```md
We're on a $55k monthly retainer with about 180 hours of expected capacity. We've used 128 hours halfway through the month, but leadership added provider tools, security hardening, and new messaging work at the same time.
```

For pattern 4:

- treat the monthly fee plus expected monthly capacity as the working baseline
- do not call the work healthy just because spend is roughly on pace if backlog growth and context switching are pushing work beyond capacity
- recommend prioritization, internal correction, or change control when demand clearly exceeds the monthly baseline

### Pattern 5: Provisional takeover or rescue estimate

```md
We took over from a prior vendor at a fee of $140k and scoped 500 hours, but the estimate was provisional until we got into the codebase. We've already logged 170 hours in the first three weeks and found unstable authentication and a broken release pipeline.
```

For pattern 5:

- use the provisional baseline, but explicitly note that inherited-code discovery makes the forecast less stable
- weigh early actual hours and newly discovered technical complexity heavily
- prefer `internal-correction`, `change-control`, or `escalate` over a vague warning when stabilization work competes with the original roadmap

## Default behavior for connected-source questions

If the user asks a direct question like "How are we budget-wise for Project Acme?":

1. locate the named project and find the commercial baseline source first
2. locate the PM / delivery-progress source second
3. use actuals if they exist
4. answer with the smallest reliable budget-health signal based on what was actually found
5. if the answer is weak, ask to connect or provide the one best missing source

Good default response shape for this case:

```md
# Budget Health - Project Acme

This looks like a `watch` right now, but the answer is still directional rather than fully confirmed.

- Status: `watch`
- Confidence: `medium`
- Why: 65% of the timeline has elapsed, integration work is still open, and visible progress looks behind plan.
- Biggest budget pressure: delivery progress appears to be lagging the baseline.
- Best next step: pull actual hours used to date so we can confirm whether this is just schedule noise or real burn pressure.
- Sources used: scope doc + Asana progress; no actual hours source pulled
- Basis: scoped hours + client fee + PM progress; no actual hours pulled
```
