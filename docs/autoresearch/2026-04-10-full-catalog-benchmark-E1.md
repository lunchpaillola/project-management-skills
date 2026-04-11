# Full-Catalog Contract Benchmark - E1 (2026-04-10)

Scope:

- All skill eval suites: `skills/*/evals/evals.json` (`25` suites)
- Cross-lane suite: `evals/cross-lane-handoffs/evals.json` (`1` suite)

Method:

- Contract-level benchmark only (instruction audit), not live LLM generation.
- Binary assertion scoring (`pass`/`fail`) for every assertion in every eval case.
- Deterministic audit against skill contracts in `skills/*/SKILL.md` using explicit string-anchored checks for output sections, mode coverage, blocked/minimum-input guardrails, and lane handoff gate requirements.

## Totals

- Total eval suites: `26`
- Total eval cases: `169`
- Total assertions: `686`
- Overall assertion pass rate: `672/686` (`97.96%`)
- Overall case pass rate: `159/169` (`94.08%`)

## Lane Breakdown (skills/* only)

| Lane | Skills in lane | Assertion pass | Case pass |
|---|---:|---:|---:|
| initiate | 5 | 101/102 (99.02%) | 24/25 (96.00%) |
| plan | 5 | 81/84 (96.43%) | 18/21 (85.71%) |
| execute | 5 | 126/132 (95.45%) | 28/33 (84.85%) |
| monitor | 5 | 220/220 (100.00%) | 55/55 (100.00%) |
| close | 5 | 120/120 (100.00%) | 30/30 (100.00%) |

## Router vs Subskill Breakdown

| Group | Assertion pass | Case pass |
|---|---:|---:|
| Router skills (5) | 185/185 (100.00%) | 40/40 (100.00%) |
| Subskills (20) | 463/473 (97.89%) | 119/129 (92.25%) |

## Cross-Lane Breakdown

| Transition | Assertion pass | Case pass |
|---|---:|---:|
| initiate -> plan | 6/6 (100.00%) | 1/1 (100.00%) |
| plan -> execute | 6/6 (100.00%) | 1/1 (100.00%) |
| execute -> monitor | 5/5 (100.00%) | 1/1 (100.00%) |
| monitor -> close | 5/5 (100.00%) | 1/1 (100.00%) |
| close -> archive | 2/6 (33.33%) | 0/1 (0.00%) |

Cross-lane aggregate: assertion pass `24/28` (`85.71%`), case pass `4/5` (`80.00%`).

## Top 5 Residual Failure Patterns

1. Minimum-input unblock list under-specified (`5` assertion fails).
2. Close -> archive gate criteria not explicitly enumerated in router-level handoff audit (`4` assertion fails).
3. Blocked/minimum-input guard phrasing mismatch (`2` assertion fails).
4. Blocked trigger not explicitly constrained to no-usable-signal condition (`1` assertion fail).
5. Proceed-with-available-sources fallback not explicit enough (`1` assertion fail).

Reference single-failure outlier: zero-signal stakeholder-map blocked rule wording mismatch (`1` assertion fail).

## Repro Notes

- Benchmark date: `2026-04-10`
- Inputs are public-safe eval contracts and skill instructions only.
- No private data, proprietary orchestration, or live model output was used in scoring.
