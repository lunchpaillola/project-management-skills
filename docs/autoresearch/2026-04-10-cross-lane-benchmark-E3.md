# Cross-Lane Handoff Benchmark - E3 (2026-04-10)

Scope: `evals/cross-lane-handoffs/evals.json` (all five handoff cases).

Method: binary assertion judgments (`pass`/`fail`) against suite assertions using current lane router/subskill contracts in `skills/*/SKILL.md` after the close->archive contract tweak.

## Case-level results (all five cases)

| Eval ID | Transition | Case pass | Passed assertions | Total assertions | Pass rate |
|---|---|---|---:|---:|---:|
| `handoff-initiate-to-plan-1` | initiate -> plan | pass | 11 | 11 | 100.00% |
| `handoff-plan-to-execute-1` | plan -> execute | pass | 11 | 11 | 100.00% |
| `handoff-execute-to-monitor-1` | execute -> monitor | pass | 10 | 10 | 100.00% |
| `handoff-monitor-to-close-1` | monitor -> close | pass | 10 | 10 | 100.00% |
| `handoff-close-to-archive-1` | close -> archive | pass | 11 | 11 | 100.00% |

Case pass rule: an eval object passes only if all required assertions pass.

## Transition table

| Handoff transition | E1 case pass | E2 case pass | E3 case pass | E1 assertion pass | E2 assertion pass | E3 assertion pass | E2 -> E3 delta | Current state |
|---|---:|---:|---:|---:|---:|---:|---:|---|
| initiate -> plan | 0/1 | 1/1 | 1/1 | 8/11 | 11/11 | 11/11 | +0 | stable pass |
| plan -> execute | 0/1 | 1/1 | 1/1 | 6/11 | 11/11 | 11/11 | +0 | stable pass |
| execute -> monitor | 0/1 | 1/1 | 1/1 | 9/10 | 10/10 | 10/10 | +0 | stable pass |
| monitor -> close | 0/1 | 1/1 | 1/1 | 6/10 | 10/10 | 10/10 | +0 | stable pass |
| close -> archive | 0/1 | 0/1 | 1/1 | 9/11 | 10/11 | 11/11 | +1 | recovered |

## Totals

- Case-level pass: `5/5` (`100.00%`) (E2: `4/5`, +1 case)
- Assertion-level pass: `53/53` (`100.00%`) (E2: `52/53`, +1 assertion)

## Close -> archive status

- Status: recovered in E3.
- The contract now requires an explicit archive/benefits completion signal in output shape and enforces `blocked` with minimum final inputs when archive gate records are missing.

## Notes

- This is a contract-level benchmark (instruction audit), not a live generated-output grading run.
- Result remains public-safe and generic; no proprietary project context or integrations were used.
