# Escalation alert (red)

```md
Hi all,

Orion Migration is at risk because the current backfill path can corrupt historical records.
**Need:** CTO + Data lead go/no-go decision by today 4:00 PM.

## Status
- Red - We should not proceed on the current path.

## What matters now
- Root cause is confirmed.
- Rollback script has passed staging.
- Rollback-first plan adds 3 days but protects data integrity.

## Active risks
- Data corruption on production backfill - Owner: Devin | Trigger: any run before patch approval | Mitigation: freeze + rollback-first execution

## Sources to drill down
- Incident doc ORION-214
- DB audit diff report
- Rollback runbook v3
```
