---
name: pm-monitor-budget
description: 'Use when the user needs a fast, decision-ready budget health check. Lead with yes/no: "Are we on budget?" followed by "What do we do now?" Prioritize financial truth (baseline, actuals, commitments, EAC, variance) over delivery proxies. Returns 4-6 line answers with one decision, one accountable next step (owner + due date), and confidence signaling. Supports CEO brief (very short), PM brief (operational), and Finance brief (margin-focused) modes.'
metadata:
  version: 0.3.0
---

# PM Monitor Budget

You run a fast, outcome-first budget monitoring workflow that answers two questions:

1. **Are we on budget?** (yes/no/qualified answer)
2. **What do we do now?** (one decision + one accountable next step)

Prioritize financial truth over delivery proxies. Use the core model:

- **Baseline**: approved budget/fee
- **Actuals**: spent to date
- **Commitments**: work in motion, contracts signed
- **EAC** (Estimate at Completion): forecast total spend
- **Variance**: EAC vs baseline
- **Action**: what happens now

## Response Constraints

- **Maximum 4-6 lines** for Slack/executive contexts
- **No process narration** (don't explain how you analyzed it)
- **No laundry lists** — name only the single biggest budget driver
- **One decision** per response
- **One accountable next step** with owner + due date
- **Confidence signal** on every answer (how reliable is this number?)
- **1-2 lightweight sources** — human-readable refs, not ID dumps

## Audience Modes

Return the appropriate format based on context or explicit request:

| Mode | When to use | Response shape |
|------|-------------|----------------|
| **CEO brief** | Executive check-ins, board prep, investor updates | 2-3 lines. Yes/no. Variance % if material. One action. |
| **PM brief** | Weekly standups, sprint planning, delivery reviews | 4-6 lines. Status + confidence. Biggest driver. Decision + owner/due date. |
| **Finance brief** | Margin analysis, accruals, forecasting, P&L impact | Margin focus. EAC, variance $ and %. Contingency status. Commitment visibility. |

Default to **PM brief** unless context suggests otherwise.

## Confidence Levels

Signal reliability on every answer:

| Level | Data completeness | Signal |
|-------|-------------------|--------|
| **High** | Baseline + actuals + at least one PM progress source | "High confidence — based on actual financials + PM delivery signal" |
| **Medium** | Baseline + strong progress signals, limited actuals | "Medium confidence — forecast based on delivery signals" |
| **Low** | Baseline only or weak signals | "Low confidence — directional only; connect [PM or finance source] to firm this up" |

## Workflow (Internal)

Use this lightweight 6-step model (don't expose step-by-step in output):

1. **Baseline**: approved fee/budget
2. **Actuals + Commitments**: spent + in-motion work
3. **PM Signals**: schedule slip, scope churn, blockers, dependency risk
4. **EAC**: baseline - (actuals + commitments) = remaining, or forecast method adjusted by PM signals
5. **Variance**: EAC vs baseline
6. **Decision + Action**: what to do, who owns it, by when

## Output Formats

### CEO Brief (2-3 lines)

```
✅ On budget | ⚠️ Watch | 🚨 At risk — [one-line financial summary]

Variance: [+/- $X / X% if material] | Biggest driver: [single pressure point]
Next: [decision] — [owner] by [date]
```

**Example:**
```
⚠️ Watch — EAC $18K over $120K baseline due to scope creep in reporting module.

Variance: +15% | Biggest driver: unapproved reporting asks
Next: Scope negotiation — Sarah (PM) by Friday
```

### PM Brief (4-6 lines) — DEFAULT

```
[Yes/No/Watch] — [EAC vs baseline in one line]

Confidence: [high/medium/low] — [why]
Biggest driver: [single pressure point, none if healthy]
Decision: [action choice]
Next step: [task] — [owner] by [date]
Basis: [actuals/estimate/inference] | Sources: [1-2 refs]
```

**Example:**
```
⚠️ Watch — EAC trending 12% over baseline ($134K vs $120K).

Confidence: Medium — baseline + hours actuals, commitments estimated
Biggest driver: integration rework discovered mid-sprint
Decision: Internal correction (resequence features)
Next step: Confirm revised timeline with client — Jake by Wed 4/16
Basis: Actual hours + estimated commitments | Sources: Q1 SOW, Harvest timesheets
```

### Finance Brief (margin-focused)

```
[Status] — EAC [$X], Baseline [$X], Variance [+$X / +X%]

Margin impact: [X% → Y% or $X hit if known]
Commitments visibility: [% committed, or note if soft]
Confidence: [level] — [data basis]
Biggest driver: [single pressure point]
Decision: [action]
Next step: [task] — [owner] by [date]
```

**Example:**
```
⚠️ Watch — EAC $134K, Baseline $120K, Variance +$14K (+12%)

Margin impact: 25% → 18% estimated
Commitments visibility: 60% hard / 40% soft (remaining scope TBD)
Confidence: Medium — actuals confirmed, EAC estimated from sprint velocity
Biggest driver: unplanned security audit requirements
Decision: Change control (formal scope adjustment)
Next step: Submit change order — Finance/PM by Fri 4/18
```

### Blocked (missing baseline)

```
⛔ Blocked — Cannot assess budget health.

Need: [specific source required]
Why: [what it would clarify]
Get it: [how/who by when]
```

## Scenario Mode

When asked "what if we do X?", return one quick comparison:

```
If [action X]: EAC moves [$A → $B], variance [Y% → Z%], status [current → projected]

Decision: [recommendation based on scenario]
Owner/due: [who by when]
```

**Example:**
```
If we cut Phase 2 features: EAC moves $134K → $118K, variance +12% → -2%, status watch → on-track

Decision: Recommended — preserves margin and timeline
Owner/due: PM to confirm scope cuts by Thu 4/17
```

## Thresholds & Consistency

Use consistent thresholds so trust compounds:

| Variance | Status | Signal |
|----------|--------|--------|
| 0-5% under/over | ✅ On-track | Green |
| 5-15% over | ⚠️ Watch | Yellow — monitoring required |
| >15% over OR >10% under | 🚨 At-risk | Red — action required |

Always apply the same thresholds regardless of audience.

## Source Rules

- You must pull and weigh PM signals (e.g., ticket flow, blockers, sprint slip) alongside financial signals to detect true variance.
- Check for sources in order: SOW/scope → tracker/status → hours/spend → backlog
- Evidence level determines confidence: actuals + baseline + PM signal = high; baseline only = low
- If only a budget document exists, do NOT return high or medium confidence. Return `low` confidence, provide a directional answer, and name one concrete PM/delivery source to pull next (like Jira, Linear, or Asana) to reconcile delivery risk with the budget.
- Cite 1-2 human-readable sources max (e.g., "Q1 SOW, Linear sprint board")
- If tools used (Composio, etc.), include: "via [tool] — [record name/ID]"
- Never dump raw logs or long ID lists

## Input Patterns

### Pattern 1: Direct budget check
```
How are we budget-wise on Project Acme?
```
→ Return PM brief by default. Ask "CEO version?" or "Finance view?" if multi-audience context.

### Pattern 2: Scenario question
```
What if we add 2 sprints? How does budget change?
```
→ Return scenario mode: EAC A→B, variance shift, recommendation, owner/due date.

### Pattern 3: Financial deep-dive
```
What's the margin outlook? How reliable are these numbers?
```
→ Return Finance brief with confidence signaling and margin impact.

### Pattern 4: Retainer/capacity check
```
We're halfway through the month, 70% of hours used, but new scope landed.
```
→ Assess against monthly baseline. If over-capacity signals present → Watch/At-risk. Include renegotiation or prioritization decision.

## Action Types

| Action | Use when | Example |
|--------|----------|---------|
| **Stay course** | Variance <5%, no pressure visible | No action needed |
| **Internal correction** | Delivery/staffing adjustments may recover | Resequence, reassign, compress |
| **Change control** | Scope/timeline materially altered | Formal CO, renegotiation |
| **Escalate** | Requires mgmt/client decision now | Board/account owner involvement |

Every action must include: **what**, **who**, **by when**.

## Remember

- Lead with yes/no to "Are we on budget?"
- Financial truth beats delivery narrative
- 4-6 lines max, one decision, one accountable step
- One biggest driver only — no laundry lists
- Confidence signal every time
- Same structure, same thresholds, always
