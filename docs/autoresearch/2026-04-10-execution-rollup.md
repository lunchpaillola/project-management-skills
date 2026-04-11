# Autoresearch execution rollup - 2026-04-10 (E1 + execute E2)

Lane-level rollup for executed E1 passes, plus execute-lane E2 recovery run.

| lane | baseline_pass_rate | post_pass_rate | delta | mutation_count | retained_changes | keep/discard |
|---|---|---|---|---:|---:|---|
| initiate | 81.25% (26/32) | 90.625% (29/32) | +9.375 pp | 1 | 1 | keep |
| plan | 96.88% (31/32) | 100.00% (32/32) | +3.12 pp | 1 | 1 | keep |
| execute | 92.50% (37/40) | 87.50% (35/40) | -5.00 pp | 1 | 0 | discard |
| monitor | 95.0% (38/40) | 97.5% (39/40) | +2.5 pp | 1 | 1 | keep |
| close | 93.75% (30/32) | 100.0% (32/32) | +6.25 pp | 1 | 1 | keep |

## Additional pass

| lane | baseline_pass_rate | post_pass_rate | delta | mutation_count | retained_changes | keep/discard |
|---|---|---|---|---:|---:|---|
| execute (E2) | 92.50% (37/40) | 95.00% (38/40) | +2.50 pp | 1 | 1 | keep |

Sources:

- `docs/autoresearch/2026-04-10-initiate-AR-E1.md`
- `docs/autoresearch/2026-04-10-plan-AR-E1.md`
- `docs/autoresearch/2026-04-10-execute-AR-E1.md`
- `docs/autoresearch/2026-04-10-monitor-AR-E1.md`
- `docs/autoresearch/2026-04-10-close-AR-E1.md`
- `docs/autoresearch/2026-04-10-execute-AR-E2.md`
