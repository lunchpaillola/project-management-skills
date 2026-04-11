---
title: "feat: Evals and autoresearch hardening for 25 PM skills baseline"
type: feat
date: 2026-04-10
---

# feat: Evals and autoresearch hardening for 25 PM skills baseline

## Overview

Design and execute a phased hardening program for the 25-skill PM baseline so skills perform reliably for the primary usage pattern:

- a delivery manager sends short, word-heavy Slack prompts
- the AI routes to PM lane skills and returns decision-ready output

The program combines:

- deterministic eval coverage across all 25 skills
- trigger/routing evals for routers
- cross-lane handoff evals
- iterative quality improvement using the `autoresearch` skill

This program must use the `autoresearch` skill as the primary optimization method (not optional, not replaced by ad hoc prompt edits).

## User Story / Use Case

As a delivery manager operating from Slack,
I want to send short context prompts and still get reliable project-management outputs,
so that I can stay on top of client delivery without preparing perfect structured inputs.

## Problem Statement / Motivation

The 25-skill catalog is implemented, but quality hardening is incomplete:

- eval coverage exists for only a subset of skills
- router tie-breakers and lane handoffs are not benchmarked end-to-end
- no systematic autoresearch loop has been run across the new baseline

Without this hardening phase, short Slack-style inputs may produce inconsistent routing, weak action tables, or missed escalation signals.

## Proposed Solution

Run a five-phase quality program that starts with eval contracts, then expands to lane-by-lane and cross-lane reliability, and finally applies `autoresearch`-based iterative optimization where gaps persist.

Core principles:

- keep skill names stable
- preserve shared output contract (`Objective`, `Tool Access Check`, `Current Signal`, `Actions`, `Unknowns`, `Follow-ups`)
- optimize for sparse, conversational inputs first
- keep public evals generic; keep any client-sensitive examples private
- use subagents aggressively to keep per-run context clean and lane-scoped
- treat `autoresearch` as the default optimization engine for all low-performing skills

## Research Summary

### Local repository findings

- 25-skill baseline and lane architecture are documented in `README.md`.
- Contract and handoff gates are locked in `docs/plans/2026-04-10-feat-phase-0-25-skills-contract-plan.md`.
- Baseline implementation phases are tracked in `docs/plans/2026-04-10-feat-phased-25-pm-skills-baseline-plan.md`.
- Existing public evals currently cover 5 skills:
  - `skills/pm-initiate-project-context/evals/evals.json`
  - `skills/pm-monitor/evals/evals.json`
  - `skills/pm-monitor-status/evals/evals.json`
  - `skills/pm-monitor-budget/evals/evals.json`
  - `skills/pm-monitor-ticket-triage/evals/evals.json`
- Existing trigger eval set exists at `skills/pm-initiate-project-context/evals/trigger-eval-set.json`.

### Institutional learnings

- Practical quality learnings are captured in `tasks/03-27-lessons-from-building-skills.md`.
- No dedicated `docs/solutions/` directory currently exists; planning and lessons context is in `docs/plans/` and `tasks/`.

### External research decision

External research is not required for this plan phase because:

- the problem is primarily repository-internal quality hardening
- strong local conventions and contracts already exist
- risk profile is moderate (non-security, non-payments, non-regulatory)

## Technical Approach

### Architecture

- Unit under test: each `skills/<skill-name>/SKILL.md`
- Eval assets per skill:
  - `skills/<skill-name>/evals/evals.json`
  - optional `skills/<skill-name>/evals/trigger-eval-set.json` for routers
  - optional `skills/<skill-name>/evals/private/` for sensitive prompt sets (gitignored)
- Program-level rollups:
  - lane coverage matrix
  - pass/fail trends by skill and lane
  - routed-mode accuracy for routers

### Execution Model (Explicit)

- Use subagents for each scoped unit of work (repo research, eval drafting, eval grading, benchmark analysis, and lane-specific hardening) to avoid context bloat.
- Prefer parallel subagent runs whenever tasks are independent (for example, skill-by-skill eval creation inside one lane).
- Keep each subagent prompt narrow to one lane, one router, or one subskill cluster.
- Use the `autoresearch` skill specifically for prompt mutation + evaluation loops; do not substitute manual "vibe edits" as the primary optimization path.

### Eval Design Standards

All eval prompts should include a mix of:

1. Slack-style sparse asks (short, informal, context-light)
2. medium-context operational asks (1-3 constraints)
3. edge cases (missing owner/date/tool, stale updates, ambiguity)

Assertion design standards:

- binary assertions only
- observable outputs only
- no subjective wording (for example "good" or "clear")
- include output-contract assertions for all skills
- include routing/tie-breaker assertions for routers

### SpecFlow Analysis (Gap and edge-case pass)

Spec-level risks to explicitly validate in evals:

- ambiguous prompts that could route to multiple modes
- missing-source conditions that should produce `blocked` with minimum next input
- unknown owner/date handling (`TBD`) without hallucinated assignments
- lane handoff gate signaling between adjacent lanes
- Slack prompt shorthand (abbreviations, missing punctuation, partial project naming)

## Implementation Phases

### Phase 1: Eval contract baseline and inventory

- Build a canonical eval template and assertion rubric for all PM skills.
- Create a full 25-skill eval inventory with target counts by skill type:
  - routers: contract + routing evals
  - subskills: contract + operational behavior evals
- Add missing `evals/evals.json` files for uncovered skills.
- Execute creation work with lane-scoped subagents in parallel to keep contexts isolated.

Success criteria:

- 25/25 skills have `evals/evals.json`
- all eval files follow assertion-first schema
- each skill has minimum contract assertions

### Phase 2: Router routing and trigger reliability

- Create/expand trigger eval sets for all 5 routers:
  - `pm-initiate`, `pm-plan`, `pm-execute`, `pm-monitor`, `pm-close`
- Validate mode tie-breakers, delegation preference, and fallback behavior.
- Include Slack-style ambiguous prompts to stress routing decisions.
- Run router eval generation and grading with one subagent per router.

Success criteria:

- router mode-selection accuracy is measurable per lane
- trigger eval sets exist for 5/5 routers
- fallback behavior is covered by explicit assertions

### Phase 3: Subskill lane hardening

- Add realistic operational evals for all 20 subskills.
- Prioritize sparse context and partially missing-source prompts.
- Confirm action table quality and evidence anchoring across lanes.
- Use one subagent per lane cluster to maintain clean, lane-bounded context.

Success criteria:

- 20/20 subskills have lane-appropriate eval coverage
- `Actions` output contract passes for all subskills
- `TBD` and `blocked` behaviors are consistently enforced

### Phase 4: Autoresearch optimization loop

- Use `autoresearch` skill (mandatory) to iteratively improve low-performing skills.
- Run loops lane-by-lane, starting with weakest pass-rate clusters.
- Track mutations, wins/losses, and retained improvements per skill.

Success criteria:

- each lane has at least one autoresearch pass
- low-performing skills show measurable pass-rate uplift
- retained prompt improvements are documented per skill

### Phase 5: Cross-lane integration and publish readiness

- Add cross-lane journey evals:
  - `initiate -> plan`
  - `plan -> execute`
  - `execute -> monitor`
  - `monitor -> close`
  - `close -> archive`
- Run full-catalog benchmark and summarize residual gaps.
- Prepare publish-readiness checklist and follow-up hardening backlog.

Success criteria:

- handoff-gate behavior is validated across all adjacent lanes
- full-catalog benchmark baseline is recorded
- publish-readiness checklist is complete

## Alternative Approaches Considered

- Hardening only monitor lane first: rejected because end-to-end lifecycle quality would remain uneven.
- Autoresearch before eval contracts: rejected because optimization without stable measurements risks prompt churn.
- One-shot eval generation for all 25 skills: rejected due to quality drift and weak review control.

## Acceptance Criteria

### Functional Requirements

- [ ] `evals/evals.json` exists for all 25 skills.
- [ ] Router trigger/routing eval sets exist for all 5 routers.
- [ ] Subskill evals include Slack-style sparse prompts and missing-data edge cases.
- [ ] Cross-lane handoff eval suite exists for all adjacent lane pairs.
- [ ] `autoresearch` loop is executed and documented for each lane.
- [ ] `autoresearch` is used as the explicit optimization method for underperforming skills (not manual-only edits).
- [ ] Subagent-based execution is used for lane-scoped work to keep context clean.

### Non-Functional Requirements

- [ ] Eval prompts are generic and reusable for public artifacts.
- [ ] Sensitive/customer examples (if any) are stored only in `evals/private/`.
- [ ] Eval assertions remain binary, specific, and non-overlapping.
- [ ] No version bumps are made during draft branch hardening.

### Quality Gates

- [ ] README remains accurate for skill inventory and lane mapping.
- [ ] Baseline benchmark summary is added to docs.
- [ ] Residual risk list and next hardening backlog are documented.

## Success Metrics

- Eval coverage: 25/25 skills with active eval suites.
- Router reliability: measurable mode-selection accuracy for 5/5 routers.
- Contract reliability: consistent pass on output-contract assertions across all skills.
- Slack robustness: pass-rate improvement on sparse-context prompt set after autoresearch.
- Rework reduction: fewer structural issues found in manual review cycles.

## Dependencies and Risks

### Dependencies

- Existing skill contracts in:
  - `docs/plans/2026-04-10-feat-phase-0-25-skills-contract-plan.md`
  - `docs/plans/2026-04-10-feat-phased-25-pm-skills-baseline-plan.md`
- Existing eval examples in current monitor/initiate coverage files
- `autoresearch` skill availability and operational run capacity

### Risks

- Overfitting skills to eval prompts rather than general use
- Uneven eval quality causing false confidence
- Excessive prompt rigidity from aggressive optimization

### Mitigation

- maintain held-out sparse-context eval sets
- require assertion review before accepting new evals
- keep autoresearch changes gated by benchmark deltas and manual review

## Documentation Plan

- Add a dedicated eval hardening progress note under `docs/plans/` for phase checkpoints.
- Add benchmark summary doc under `docs/` with lane-level results.
- Update README only if catalog structure changes (not required for eval-only updates).

## References and Research

### Internal References

- `README.md`
- `AGENTS.md`
- `docs/plans/2026-04-10-feat-phase-0-25-skills-contract-plan.md`
- `docs/plans/2026-04-10-feat-phased-25-pm-skills-baseline-plan.md`
- `tasks/03-27-lessons-from-building-skills.md`
- `skills/pm-initiate-project-context/evals/evals.json`
- `skills/pm-monitor/evals/evals.json`
- `skills/pm-monitor-status/evals/evals.json`
- `skills/pm-monitor-budget/evals/evals.json`
- `skills/pm-monitor-ticket-triage/evals/evals.json`

### Related Work

- Existing trigger eval set: `skills/pm-initiate-project-context/evals/trigger-eval-set.json`
