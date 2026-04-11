# Cross-Lane Handoff Baseline - E1 (2026-04-10)

Scope: `evals/cross-lane-handoffs/evals.json` (all five handoff cases).

Method: binary assertion judgments (`pass`/`fail`) against suite assertions using current lane router/subskill contracts in `skills/*/SKILL.md`.

## Case-level results (all five cases)

| Eval ID | Transition | Case pass | Passed assertions | Total assertions | Pass rate |
|---|---|---|---:|---:|---:|
| `handoff-initiate-to-plan-1` | initiate -> plan | fail | 8 | 11 | 72.73% |
| `handoff-plan-to-execute-1` | plan -> execute | fail | 6 | 11 | 54.55% |
| `handoff-execute-to-monitor-1` | execute -> monitor | fail | 9 | 10 | 90.00% |
| `handoff-monitor-to-close-1` | monitor -> close | fail | 6 | 10 | 60.00% |
| `handoff-close-to-archive-1` | close -> archive | fail | 9 | 11 | 81.82% |

Case pass rule: an eval object passes only if all required assertions pass.

## Transition table

| Handoff transition | Case pass | Assertion pass | Key misses |
|---|---:|---:|---|
| initiate -> plan | 0/1 | 8/11 | no explicit problem-framing and stakeholder-map completeness checks; missing `Objective` section in router summary |
| plan -> execute | 0/1 | 6/11 | no explicit 4-artifact gate audit (requirements, baseline, roadmap, RAID/RACI/decision); missing `Objective` section in router summary |
| execute -> monitor | 0/1 | 9/10 | missing-field behavior prefers `TBD` over explicit `blocked`+minimum additions |
| monitor -> close | 0/1 | 6/10 | no explicit acceptance-readiness + closure recommendation contract; missing `Objective` section in router summary |
| close -> archive | 0/1 | 9/11 | archive fallback does not explicitly require `blocked` with minimum final inputs when gate evidence is missing |

## Totals

- Case-level pass: `0/5` (`0.00%`)
- Assertion-level pass: `38/53` (`71.70%`)

## Top 3 common failure patterns

1. Router output shape mismatch with suite contract: lane routers (`pm-initiate`, `pm-plan`, `pm-monitor`) omit an explicit `Objective` section required by shared assertions.
2. Cross-artifact gate completeness checks are under-specified in router contracts: readiness prompts require explicit multi-artifact audits, but routers primarily select one mode and do not require validating every gate artifact.
3. Inconsistent `blocked` threshold semantics for partial evidence: several contracts prefer continuing with `TBD` rather than explicitly switching to `blocked` with minimum unblock inputs under missing required handoff fields.

## Notes

- This baseline is a contract-level benchmark (instruction audit), not a live generated-output grading run.
- Result remains public-safe and generic; no proprietary project context or integrations were used.
