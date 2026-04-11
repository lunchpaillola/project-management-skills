# Eval hardening benchmark summary (E1 + targeted E2 update)

This document captures lane-level baseline benchmark results from executed E1 lane autoresearch runs, plus same-sample post-pass comparison values and targeted E2 recovery updates.

## Lane-level baseline table

| Lane | Router + subskills in lane | Baseline contract pass rate | Baseline routing accuracy | Baseline sparse-prompt pass rate | Notes |
|---|---|---|---|---|---|
| initiate | 5 skills | 81.25% (26/32) | TBD | TBD | From `docs/autoresearch/2026-04-10-initiate-AR-E1.md` |
| plan | 5 skills | 96.88% (31/32) | TBD | TBD | From `docs/autoresearch/2026-04-10-plan-AR-E1.md` |
| execute | 5 skills | 92.50% (37/40) | TBD | TBD | From `docs/autoresearch/2026-04-10-execute-AR-E1.md` |
| monitor | 5 skills | 95.0% (38/40) | TBD | TBD | From `docs/autoresearch/2026-04-10-monitor-AR-E1.md` |
| close | 5 skills | 93.75% (30/32) | TBD | TBD | From `docs/autoresearch/2026-04-10-close-AR-E1.md` |

## E1 post-pass comparison (same sampled eval sets)

| Lane | Baseline pass rate | Post-pass rate | Delta | Mutation count | Retained changes | Decision |
|---|---|---|---|---:|---:|---|
| initiate | 81.25% (26/32) | 90.625% (29/32) | +9.375 pp | 1 | 1 | keep |
| plan | 96.88% (31/32) | 100.00% (32/32) | +3.12 pp | 1 | 1 | keep |
| execute | 92.50% (37/40) | 87.50% (35/40) | -5.00 pp | 1 | 0 | discard |
| monitor | 95.0% (38/40) | 97.5% (39/40) | +2.5 pp | 1 | 1 | keep |
| close | 93.75% (30/32) | 100.0% (32/32) | +6.25 pp | 1 | 1 | keep |

## E2 targeted update (execute lane)

| Lane | Baseline pass rate | Post-pass rate | Delta | Mutation count | Retained changes | Decision | Source |
|---|---|---|---|---:|---:|---|---|
| execute | 92.50% (37/40) | 95.00% (38/40) | +2.50 pp | 1 | 1 | keep | `docs/autoresearch/2026-04-10-execute-AR-E2.md` |

## Cross-lane handoff comparison (E1 vs E2 vs E3)

| Handoff | E1 assertion pass | E2 assertion pass | E3 assertion pass | E1 case pass | E2 case pass | E3 case pass | Current state |
|---|---|---|---|---:|---:|---:|---|
| initiate -> plan | 72.73% (8/11) | 100.00% (11/11) | 100.00% (11/11) | 0/1 | 1/1 | 1/1 | recovered and stable |
| plan -> execute | 54.55% (6/11) | 100.00% (11/11) | 100.00% (11/11) | 0/1 | 1/1 | 1/1 | recovered and stable |
| execute -> monitor | 90.00% (9/10) | 100.00% (10/10) | 100.00% (10/10) | 0/1 | 1/1 | 1/1 | recovered and stable |
| monitor -> close | 60.00% (6/10) | 100.00% (10/10) | 100.00% (10/10) | 0/1 | 1/1 | 1/1 | recovered and stable |
| close -> archive | 81.82% (9/11) | 90.91% (10/11) | 100.00% (11/11) | 0/1 | 0/1 | 1/1 | recovered in E3 (close->archive gate fully passing) |

Cross-lane aggregate snapshot:

- E1 case-level pass: `0/5` (`0.00%`)
- E2 case-level pass: `4/5` (`80.00%`)
- E3 case-level pass: `5/5` (`100.00%`)
- E1 assertion-level pass: `38/53` (`71.70%`)
- E2 assertion-level pass: `52/53` (`98.11%`)
- E3 assertion-level pass: `53/53` (`100.00%`)

Source references: `docs/autoresearch/2026-04-10-cross-lane-benchmark-E1.md`, `docs/autoresearch/2026-04-10-cross-lane-benchmark-E2.md`, `docs/autoresearch/2026-04-10-cross-lane-benchmark-E3.md`.

## Full-catalog benchmark snapshot

| Metric | Baseline value | Target | Delta to target |
|---|---|---|---|
| Skills with active eval suites | 25/25 | 25/25 | 0 |
| Routers with trigger eval sets | 5/5 | 5/5 | 0 |
| Overall contract assertion pass rate (E1 lane samples aggregate) | 92.05% (162/176) | TBD | TBD |
| Overall contract assertion pass rate (E1 lane samples post aggregate) | 94.89% (167/176) | TBD | TBD |
| Overall contract assertion pass rate (latest lane best, E2-adjusted) | 96.59% (170/176) | TBD | TBD |
| Full-catalog assertion pass rate (all skill suites + cross-lane E1) | 97.96% (672/686) | TBD | TBD |
| Full-catalog case pass rate (all skill suites + cross-lane E1) | 94.08% (159/169) | TBD | TBD |
| Router assertion pass rate (full-catalog E1) | 100.00% (185/185) | TBD | TBD |
| Subskill assertion pass rate (full-catalog E1) | 97.89% (463/473) | TBD | TBD |
| Cross-lane assertion pass rate (full-catalog E1) | 85.71% (24/28) | TBD | TBD |
| Sparse Slack-style prompt pass rate | TBD | TBD | TBD |

Lane snapshot from full-catalog E1:

- initiate: 99.02% assertions (101/102), 96.00% cases (24/25)
- plan: 96.43% assertions (81/84), 85.71% cases (18/21)
- execute: 95.45% assertions (126/132), 84.85% cases (28/33)
- monitor: 100.00% assertions (220/220), 100.00% cases (55/55)
- close: 100.00% assertions (120/120), 100.00% cases (30/30)

Reference: `docs/autoresearch/2026-04-10-full-catalog-benchmark-E1.md`.

## Residual risk register

| Risk | Impact | Likelihood | Mitigation owner | Mitigation plan |
|---|---|---|---|---|
| Overfitting to explicit eval prompts | Medium | Medium | TBD | Maintain held-out prompts and compare uplift parity |
| Routing tie-break regressions under sparse prompts | High | Medium | TBD | Expand ambiguity-focused router evals before release |
| Inconsistent `blocked` and `TBD` handling | Medium | Medium | TBD | Add contract checks to all lane suites and rerun gates |
| Uneven autoresearch gains by lane | Medium | Medium | TBD | Prioritize low-performing clusters for additional passes |

## Hardening backlog (post-baseline)

1. Fill all baseline metrics and deltas from first full-catalog run.
2. Convert highest-frequency failures into explicit binary assertions.
3. Add held-out sparse shorthand prompts for each lane to reduce overfitting risk.
4. Re-run autoresearch on lanes with weakest uplift and record retained mutations.
5. Gate publish readiness on cross-lane handoff pass parity.
