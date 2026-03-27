---
name: pm-initiate-project-context
description: Use when the user wants to create or update a reusable project context document for onboarding and delivery alignment. Also use when the user mentions project context, kickoff context, stakeholder map, project brief, delivery style, risks, communication cadence, or asks to avoid repeating foundational project details across tasks.
metadata:
  version: 0.1.4
---

# PM Initiate Project Context

You help users create and maintain a project context document. This captures foundational delivery context so other project-management skills can reuse it without re-asking the same setup questions.

Document path: `.agents/project-context.md`

## Workflow

Before executing, copy this checklist and keep it updated in your working notes:

```text
Project Context Progress
- [ ] Step 1 complete: existing context checked
- [ ] Step 2 complete: required sections gathered (or marked TBD)
- [ ] Step 3 complete: document created/updated with full template
- [ ] Step 4 complete: adjustments confirmed and final save done
```

Do not skip steps. Do not save a partial final document.

### Step 1: Check for existing context

First, check if `.agents/project-context.md` already exists.

If context exists:
- read it and summarize what is already captured
- ask which sections need updates
- gather only missing or changed sections
- lock edits to only the user-requested sections unless the user explicitly expands scope
- preserve all untouched sections exactly as-is (including headings, order, and wording)

If no context exists, offer two options:

1. **Auto-draft from project artifacts** (recommended): read available repo context (README, docs, plans, tickets, notes) and draft a V1.
2. **Start from scratch**: walk through each section conversationally, one section at a time.

When information is missing, ask targeted questions using the question tool.

Before drafting, always confirm what this context is for:
- project or engagement name
- primary use of the context (onboarding, handoffs, status updates, risk tracking, client comms, all of the above)
- who will use it most (PM, delivery lead, builders, client stakeholders)

After presenting an auto-draft, ask: "What needs correcting? What's missing?"

### Step 2: Gather information

If auto-drafting:
1. Read available project artifacts (README, docs, plans, trackers, meeting notes).
2. Draft all sections with factual information only.
3. Mark unknowns as `TBD`.
4. For each section that is incomplete, ask targeted follow-up questions using the `question` tool.
5. Ask for corrections and missing details using the `question` tool.
6. Iterate until the user is satisfied.

If any required section cannot be drafted from repository artifacts, use the `question` tool to collect it before saving.

For section 11 (Tools and Source of Truth), always ask explicitly:
- which MCP servers are currently used in this project
- which non-MCP tools/systems are used
- what each tool is used for in delivery operations
- who owns access and whether access is ready or pending
- what fallback/source path to use if the tool is unavailable

If starting from scratch:
Walk through each section below conversationally, one at a time. Do not ask all questions at once.

Hard rule for conversational intake: ask about one section per turn. If the user provides multiple sections at once, acknowledge them but continue confirmation section-by-section before moving on.

For each section:
1. Briefly explain what is being captured.
2. Ask targeted questions using the question tool.
3. Confirm accuracy.
4. Move to the next section.

If any section remains incomplete after an answer, continue with targeted follow-up questions using the `question` tool until the section is complete or clearly marked `TBD`.

### Sections to capture

1. Project purpose and context intent
2. Project overview
3. Goals and success criteria
4. Stakeholders and decision roles
5. Scope, assumptions, and constraints
6. Delivery plan and current phase
7. Communication cadence and update formats
8. Risks, blockers, and mitigations
9. Team working context
10. Working style and quality standards
11. Tools, systems, and source-of-truth links
12. Open decisions and next actions

For section 11, capture not just tool names but also tool purpose and access readiness.

### Step 3: Create the document

After gathering information, create or update `.agents/project-context.md` using this structure:

```md
# Project Context

*Last updated: [date]*

## Project Purpose and Context Intent
**Engagement/project name:**
**Context used for:**
**Primary users of this context:**

## Project Overview
**Name:**
**One-liner:**
**Background:**

## Goals and Success Criteria
**Primary outcomes:**
-
**Success metrics:**
-

## Stakeholders and Decision Roles
| Role | Name | Responsibility | Decision authority |
|------|------|----------------|--------------------|
| | | | |

## Scope, Assumptions, Constraints
**In scope:**
-
**Out of scope:**
-
**Assumptions:**
-
**Constraints:**
-

## Delivery Plan and Phase
**Current phase:** Initiate / Plan / Execute / Monitor / Close
**Upcoming milestones:**
-

## Communication Cadence
**Audiences:**
-
**Cadence:**
-
**Formats:**
-

## Risks, Blockers, Mitigations
| Risk/Blocker | Impact | Owner | Mitigation | Status |
|--------------|--------|-------|------------|--------|
| | | | | |

## Team Working Context
**Communication preferences:**
-
**Decision style and approval expectations:**
-
**Review and feedback style:**
-
**Stakeholder preferences and working norms:**
-
**Escalation preferences:**
-

## Working Style and Quality Standards
**Preferred style:**
-
**Definition of done:**
-

## Tools and Source of Truth
**MCP servers in use:**
-

| Tool category | Tool/system | Primary use | Access status (`connected`|`partial`|`not-connected`) | Access owner | Backup/manual path |
|---------------|-------------|-------------|----------------------------------------------------------|--------------|--------------------|
| Tracker | | | | | |
| Docs | | | | | |
| Comms | | | | | |
| Design/Artifacts | | | | | |

**Canonical source-of-truth links:**
-

## Open Decisions and Next Actions
**Decisions needed:**
-
**Next actions:**
-
```

### Step 4: Confirm and save

- Show the completed document or a concise diff summary.
- Ask what needs adjustment using the question tool.
- Before final save, run a required-section presence check for all 12 sections listed in this skill. If any section is missing, use the `question` tool to fill it or mark it `TBD`.
- Save to `.agents/project-context.md`.
- Tell the user: "Other PM skills should now read this context first. Run `/pm-initiate-project-context` anytime to update it."

### Output contract

When creating a new context file, always include:
- the save path (`.agents/project-context.md`)
- whether this was auto-drafted or section-by-section intake
- a short list of sections that remain `TBD`

When updating an existing context file, always include:
- a concise update summary limited to requested sections
- a short "unchanged sections preserved" confirmation
- one targeted adjustment question using the `question` tool

## Rules

- Use factual language and avoid invented details.
- Keep sections concise and execution-oriented.
- Preserve exact stakeholder names, terms, and project language when provided.
- Prefer stable links and canonical sources over copied notes.
- Keep unknowns visible as `TBD`; do not hide uncertainty.
- For tools, always capture purpose + connection status + fallback path so downstream PM skills can run even without integrations.
