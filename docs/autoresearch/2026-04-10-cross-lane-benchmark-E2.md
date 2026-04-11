# Cross-Lane Handoff Benchmark - E2 (2026-04-10)

Scope: `evals/cross-lane-handoffs/evals.json` (all five handoff cases).

Method: binary assertion judgments (`pass`/`fail`) against suite assertions using current lane router/subskill contracts in `skills/*/SKILL.md` after router/contract hardening updates.

## Case-level results (all five cases)

| Eval ID | Transition | Case pass | Passed assertions | Total assertions | Pass rate |
|---|---|---|---:|---:|---:|
| `handoff-initiate-to-plan-1` | initiate -> plan | pass | 11 | 11 | 100.00% |
| `handoff-plan-to-execute-1` | plan -> execute | pass | 11 | 11 | 100.00% |
| `handoff-execute-to-monitor-1` | execute -> monitor | pass | 10 | 10 | 100.00% |
| `handoff-monitor-to-close-1` | monitor -> close | pass | 10 | 10 | 100.00% |
| `handoff-close-to-archive-1` | close -> archive | fail | 10 | 11 | 90.91% |

Case pass rule: an eval object passes only if all required assertions pass.

## Transition table

| Handoff transition | E1 case pass | E2 case pass | E1 assertion pass | E2 assertion pass | Delta (assertions) | Remaining miss |
|---|---:|---:|---:|---:|---:|---|
| initiate -> plan | 0/1 | 1/1 | 8/11 | 11/11 | +3 | none |
| plan -> execute | 0/1 | 1/1 | 6/11 | 11/11 | +5 | none |
| execute -> monitor | 0/1 | 1/1 | 9/10 | 10/10 | +1 | none |
| monitor -> close | 0/1 | 1/1 | 6/10 | 10/10 | +4 | none |
| close -> archive | 0/1 | 0/1 | 9/11 | 10/11 | +1 | archive/benefits completion check is not required as an explicit, named completion signal in output structure |

## Totals

- Case-level pass: `4/5` (`80.00%`) (E1: `0/5`, +4 cases)
- Assertion-level pass: `52/53` (`98.11%`) (E1: `38/53`, +14 assertions)

## Top remaining failures

1. `close -> archive` still misses one explicit output-contract signal: archive/benefits record completion is validated in workflow logic but not required as a clearly labeled completion field in the final output structure.

## Notes

- This is a contract-level benchmark (instruction audit), not a live generated-output grading run.
- Result remains public-safe and generic; no proprietary project context or integrations were used.
