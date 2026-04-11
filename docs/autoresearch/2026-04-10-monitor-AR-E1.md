# Monitor Lane Autoresearch - AR-MON-E1 (2026-04-10)

Scope: `pm-monitor`, `pm-monitor-status`, `pm-monitor-budget`, `pm-monitor-ticket-triage`, `pm-monitor-risk-escalation`

Method: lane-scoped benchmark sample using binary assertion checks against skill output contracts and routing/behavior requirements in each scoped `SKILL.md`.

## 1) Benchmark sample (10 eval cases)

Sample includes router + all monitor subskills.

| Skill | Eval IDs sampled | Assertions per eval | Total binary checks |
|---|---:|---:|---:|
| `pm-monitor` | 11, 12 | 4 | 8 |
| `pm-monitor-status` | 8, 15 | 4 | 8 |
| `pm-monitor-budget` | 3, 14 | 4 | 8 |
| `pm-monitor-ticket-triage` | 4, 6 | 4 | 8 |
| `pm-monitor-risk-escalation` | 4, 6 | 4 | 8 |
| **Total** | **10 cases** |  | **40 checks** |

## 2) Baseline score (binary assertions)

- `baseline_pass_rate`: **95.0%** (38/40)

Per-skill baseline:

| Skill | Passed | Total | Pass rate |
|---|---:|---:|---:|
| `pm-monitor` | 7 | 8 | 87.5% |
| `pm-monitor-status` | 8 | 8 | 100.0% |
| `pm-monitor-budget` | 8 | 8 | 100.0% |
| `pm-monitor-ticket-triage` | 8 | 8 | 100.0% |
| `pm-monitor-risk-escalation` | 7 | 8 | 87.5% |

## 3) Weakest skill selection

Weakest-by-rate tie: `pm-monitor` and `pm-monitor-risk-escalation` at **87.5%**.

Chosen for mutation: `pm-monitor-risk-escalation` (more direct opportunity to harden sparse-context confidence + missing-source behavior inside the subskill contract).

## 4) One targeted mutation

- `mutation_count`: **1**
- File mutated: `skills/pm-monitor-risk-escalation/SKILL.md`
- Mutation focus:
  - when source quality is `medium`/`low`, continue best-effort and request **exactly one** concrete missing source
  - make fallback explicit in returned actions
  - add explicit `Confidence` section in output shape
  - reinforce one-missing-source rule in output rules

## 5) Re-measure same sample

- `post_pass_rate`: **97.5%** (39/40)
- `delta`: **+2.5 pp** (+1 binary check)

Per-skill post:

| Skill | Passed | Total | Pass rate |
|---|---:|---:|---:|
| `pm-monitor` | 7 | 8 | 87.5% |
| `pm-monitor-status` | 8 | 8 | 100.0% |
| `pm-monitor-budget` | 8 | 8 | 100.0% |
| `pm-monitor-ticket-triage` | 8 | 8 | 100.0% |
| `pm-monitor-risk-escalation` | 8 | 8 | 100.0% |

## 6) Keep/discard decision

- `retained_changes`: **1**
- Decision: **keep** (positive delta on same benchmark sample)

## 7) Top failures (post)

1. `pm-monitor` eval 11, assertion 3: asks for one concrete minimum missing source; router contract currently allows listing multiple minimum missing inputs.

## Required metric block

- `baseline_pass_rate`: **95.0%**
- `mutation_count`: **1**
- `retained_changes`: **1**
- `post_pass_rate`: **97.5%**
- `delta`: **+2.5 pp**
- `top_failures`: **1 remaining check** (router missing-source singularity)
