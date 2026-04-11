# Autoresearch execution log template (lane hardening)

Use this log to track mandatory Phase 4 autoresearch passes by lane. Keep entries generic/public-safe and store any sensitive prompts in lane-private eval directories.

## Field definitions

- `baseline_pass_rate`: pass rate before mutation loop starts for the scoped eval set.
- `mutation_count`: number of prompt mutations tested in the pass.
- `retained_changes`: count of mutations retained after benchmark + manual review.
- `delta_pass_rate`: `post_pass_rate - baseline_pass_rate`.

## Lane pass tracker

| Lane | Pass type | Pass ID | Status | Baseline pass rate | Mutation count | Retained changes | Delta pass rate | Notes |
|---|---|---|---|---|---|---|---|---|
| initiate | planned | AR-INIT-P1 | planned | TBD | TBD | TBD | TBD | Initial lane pass plan |
| initiate | executed | AR-INIT-E1 | executed | 81.25% (26/32) | 1 | 1 | +9.375 pp | Keep |
| plan | planned | AR-PLAN-P1 | planned | TBD | TBD | TBD | TBD | Initial lane pass plan |
| plan | executed | AR-PLAN-E1 | executed | 96.88% (31/32) | 1 | 1 | +3.12 pp | Keep |
| execute | planned | AR-EXEC-P1 | planned | TBD | TBD | TBD | TBD | Initial lane pass plan |
| execute | executed | AR-EXEC-E1 | executed | 92.50% (37/40) | 1 | 0 | -5.00 pp | Discard |
| execute | planned | AR-EXEC-P2 | planned | TBD | TBD | TBD | TBD | Recovery pass after E1 regression |
| execute | executed | AR-EXEC-E2 | executed | 92.50% (37/40) | 1 | 1 | +2.50 pp | Keep |
| monitor | planned | AR-MON-P1 | planned | TBD | TBD | TBD | TBD | Initial lane pass plan |
| monitor | executed | AR-MON-E1 | executed | 95.0% (38/40) | 1 | 1 | +2.5 pp | Keep |
| close | planned | AR-CLOSE-P1 | planned | TBD | TBD | TBD | TBD | Initial lane pass plan |
| close | executed | AR-CLOSE-E1 | executed | 93.75% (30/32) | 1 | 1 | +6.25 pp | Keep |

## Per-pass detail template

Copy this section for each executed pass.

### Pass ID: AR-<LANE>-E<NUMBER>

- Lane: `TBD`
- Scope (skills or router + subskills): `TBD`
- Eval set(s): `TBD`
- Baseline pass rate: `TBD`
- Mutation count: `TBD`
- Retained changes: `TBD`
- Delta pass rate: `TBD`
- Retained mutation summary (why retained):
  - `TBD`
- Rejected mutation summary (why rejected):
  - `TBD`
- Follow-up actions:
  - `TBD`
