# 03-27 Skills Brainstorm

## Inputs / Signals

- (Waiting for your context)

## Candidate Skills

- **Name:** `pm-plan-scope-baseline`
  - **What it does:** Converts vague briefs into explicit scope baselines with deliverables, edge cases, exclusions, assumptions, and acceptance criteria.
  - **Stage:** `plan`
  - **Why this skill:** Repeated scope-creep evidence across agile/web-design/freelancer threads shows ambiguity at brief stage drives rework and margin loss.
  - **Workflow skill:** Yes
  - **Sub-skills/tools/integrations:** requirements decomposition checklist, acceptance-criteria rubric, exclusions template; Notion/Confluence/Google Docs/Jira.

- **Name:** `pm-plan-change-control`
  - **What it does:** Triage incoming requests as in-scope/out-of-scope/defer, assess effort/cost/timeline impact, and draft collaborative change requests.
  - **Stage:** `plan` (secondary: `execute`)
  - **Why this skill:** Direct response to "Agile welcomes change" vs uncontrolled scope creep and founder workflow evidence around change-request handling.
  - **Workflow skill:** Yes
  - **Sub-skills/tools/integrations:** change log, impact estimator, decision record, response drafting; Email/Slack/Jira/Linear.

- **Name:** `pm-initiate-decision-ownership`
  - **What it does:** Establishes DRI/decision-maker/approver and escalation path for key workstreams at kickoff.
  - **Stage:** `initiate`
  - **Why this skill:** Matches ownership-gap signal: discussions moving forward with no named decision-maker.
  - **Workflow skill:** Yes
  - **Sub-skills/tools/integrations:** RACI-lite mapper, stakeholder matrix, decision rights table; Docs + tracker systems.

- **Name:** `pm-execute-handoff-confirmation`
  - **What it does:** Standardizes handoff packages and requires explicit acceptance confirmation (not just acknowledgement).
  - **Stage:** `execute`
  - **Why this skill:** Directly addresses handoffs acknowledged but not confirmed, which causes dropped accountability.
  - **Workflow skill:** Yes
  - **Sub-skills/tools/integrations:** handoff checklist, acceptance gate, transfer timestamp/log; Jira/Asana/Trello + Slack.

- **Name:** `pm-monitor-deferred-review-loop`
  - **What it does:** Ensures deferred items always have owner, review date, and reopen trigger; surfaces them in cadence reviews.
  - **Stage:** `monitor`
  - **Why this skill:** Direct evidence from ownership thread: deferred items often lose review dates and disappear.
  - **Workflow skill:** Yes
  - **Sub-skills/tools/integrations:** defer register, reminder cadence, review agenda generator; Calendar + PM board.

- **Name:** `pm-monitor-assignment-followthrough`
  - **What it does:** Detects tasks that went quiet after first ping and initiates nudges/escalation with unblock prompts.
  - **Stage:** `monitor`
  - **Why this skill:** Directly mirrors "assignments went quiet" signal and strengthens project hygiene.
  - **Workflow skill:** Yes
  - **Sub-skills/tools/integrations:** inactivity detector, nudge templates, escalation matrix; Slack/Teams/Email + task timestamps.

- **Name:** `pm-plan-work-portfolio-view`
  - **What it does:** Creates a single lightweight cross-project view with standard statuses, owners, deadlines, and dependency flags.
  - **Stage:** `plan` (secondary: `monitor`)
  - **Why this skill:** Strong fit for small, growing teams needing one shared source of truth and less overlap/confusion.
  - **Workflow skill:** Yes
  - **Sub-skills/tools/integrations:** board schema setup, stage taxonomy (`Backlog/In Progress/Review/Done`), dependency mapping; Airtable/Notion/Sheets/Trello.

- **Name:** `pm-execute-capacity-coverage`
  - **What it does:** Produces absence/coverage handover packets so teammates can pick up work without context loss.
  - **Stage:** `execute`
  - **Why this skill:** Explicit pain signal: if someone is absent, others cannot tell what is done vs pending.
  - **Workflow skill:** Yes
  - **Sub-skills/tools/integrations:** backup-owner map, current-state snapshot, open-decisions list; Docs + PM board.

- **Name:** `pm-monitor-freelancer-overview`
  - **What it does:** Maintains a lightweight external-contributor assignment overview by client, deliverable count, due date, and review status.
  - **Stage:** `monitor`
  - **Why this skill:** Matches request for freelancer visibility without detailed micromanagement.
  - **Workflow skill:** Yes
  - **Sub-skills/tools/integrations:** assignment ledger template, review queue rollup, SLA check; Sheets/Airtable/ClickUp/Asana.

- **Name:** `pm-monitor-priority-rebalance`
  - **What it does:** Handles stop/start reprioritization via now/next/later framing, WIP limits, and explicit tradeoff logging.
  - **Stage:** `monitor` (secondary: `execute`)
  - **Why this skill:** Direct fit for frequent priority churn and fluctuating monthly deliverable volume.
  - **Workflow skill:** Yes
  - **Sub-skills/tools/integrations:** prioritization rubric, tradeoff log, interrupted-work carryover; backlog/sprint tools.

## Prioritization Notes

- Start with base layer skill: `pm-monitor-ticket-triage` (in progress; first draft created).
- Keep specialist triage variants as follow-on wrappers, not base skill dependencies.

## Next Actions

- Validate `pm-monitor-ticket-triage` in one real backlog cleanup run.
- Gather failure points and missing fields; update rubric and output contract to v0.1.1.
- Run starter eval prompts in `skills/pm-monitor-ticket-triage/evals/evals.json` and capture refinement notes.
- Validate new monitor entry point `skills/pm-monitor/SKILL.md` and confirm routing behavior feels intuitive.
- Add a `Gotchas` section to `pm-monitor` and `pm-monitor-ticket-triage` after first two live runs.
- Add a small setup checklist in `pm-initiate-project-context` output to persist MCP/tool purpose mapping.
