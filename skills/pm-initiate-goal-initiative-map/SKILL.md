---
name: pm-initiate-goal-initiative-map
description: Use when the user wants to turn broad plans into a focused hierarchy for this quarter. Runs an interactive intake that maps 1-2 goals into initiatives, projects, and execution cadence.
metadata:
  version: 0.1.0
---

# PM Initiate Goal Initiative Map

You help the user convert high-level ambition into a focused execution map:

Goal -> Initiatives -> Projects -> Activities

This skill belongs to the initiate lane and is intentionally interactive.

Document path: `.agents/goal-initiative-map.md`

## Workflow

Before executing, copy this checklist and keep it updated in your working notes:

```text
Goal Initiative Map Progress
- [ ] Step 1 complete: existing map checked
- [ ] Step 2 complete: goals captured (1-2)
- [ ] Step 3 complete: initiatives, projects, and activities mapped
- [ ] Step 4 complete: focus check and final save
```

Do not skip steps. Do not save a partial final document.

### Step 1: Check for existing map

First, check whether `.agents/goal-initiative-map.md` exists.

If it exists:
- read and summarize current goals, initiatives, and project coverage
- ask what changed and what to update
- edit only requested sections unless the user expands scope
- preserve unchanged sections exactly

If it does not exist:
- start an interactive intake using the `question` tool
- explain that the outcome will be a focused quarterly execution map

### Step 2: Capture goals (interactive)

Use the `question` tool and ask one section per turn.

Required intake order:

1. Ask for quarterly goals:
   - "What are your top 1-2 goals this quarter?"
2. For each goal, ask for a measurable outcome and timeframe.
3. Ask for priority order if multiple goals are provided.

Hard rule: keep goals outcome-oriented and measurable. If a goal is vague, ask a targeted follow-up until it is specific.

### Step 3: Build the hierarchy (interactive)

For each goal, collect the following using the `question` tool:

1. Initiatives (2-4): strategic action lanes that support the goal
2. Projects: concrete items under each initiative
3. Activities/cadence: recurring daily or weekly actions that move each project forward

Use these definitions consistently:
- Goal = target outcome
- Initiative = strategic action lane that supports the goal
- Project = concrete deliverable or work item
- Activity = recurring execution behavior (daily/weekly)

If items are mis-leveled, normalize them and confirm the revised structure with the user.

### Step 4: Focus check and save

Before final save, run a focus check:
- no more than 2 goals
- each goal has 2-4 initiatives
- each initiative has at least 1 project
- each project has at least 1 activity or next action
- any missing details marked `TBD`

Then save `.agents/goal-initiative-map.md`.

After saving, tell the user:
- this map is now part of the initiate phase context
- downstream PM skills should reference this map before planning or monitoring work

## Output template

Use this structure:

```md
# Goal Initiative Project Map

*Last updated: [date]*

## Planning Horizon
**Period:**
**Owner:**

## Goals (Top 1-2)

### Goal 1
**Outcome:**
**Metric + target:**
**Deadline:**

#### Initiatives
- Initiative:
  - Why this supports Goal 1:

#### Projects by Initiative
| Initiative | Project | Type (`build`|`process`|`content`|`ops`) | Owner | Due/Window | Status (`idea`|`active`|`blocked`|`done`) |
|------------|---------|---------------------------------------------------|-------|------------|--------------------------------------------|
| | | | | | |

#### Activities and Cadence
| Project | Activity | Cadence (`daily`|`weekly`|`biweekly`) | Channel/Surface | Success signal |
|---------|----------|-----------------------------------------|-----------------|----------------|
| | | | | |

### Goal 2 (optional)
**Outcome:**
**Metric + target:**
**Deadline:**

#### Initiatives
- Initiative:
  - Why this supports Goal 2:

#### Projects by Initiative
| Initiative | Project | Type (`build`|`process`|`content`|`ops`) | Owner | Due/Window | Status (`idea`|`active`|`blocked`|`done`) |
|------------|---------|---------------------------------------------------|-------|------------|--------------------------------------------|
| | | | | | |

#### Activities and Cadence
| Project | Activity | Cadence (`daily`|`weekly`|`biweekly`) | Channel/Surface | Success signal |
|---------|----------|-----------------------------------------|-----------------|----------------|
| | | | | |

## Prioritization and Focus Rules
- Active initiatives this month:
- Deferred initiatives:
- Not doing list:

## Next 14 Days
- [ ]
- [ ]
- [ ]
```

## Interaction rules

- Always use the `question` tool for intake and refinement.
- Ask one focused question at a time; do not ask the full questionnaire in one turn.
- If user gives broad intent, translate into the hierarchy and ask for confirmation.
- Keep language concrete and action-oriented.
- Keep unknowns visible as `TBD`.
- Do not invent projects, owners, or metrics.

## Trigger hints

Use this skill when the user says things like:
- "I need to focus my projects this quarter"
- "Help me structure goals, initiatives, and projects"
- "Turn this into a practical execution map"
- "What are my goals and what activities support them?"
