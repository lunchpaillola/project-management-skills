# Project Management Skills for AI Agents

A collection of reusable AI agent skills for project delivery work: project context setup, scoping, status communication, delivery execution, and project hygiene.

This repository is designed for AI coding agents and assistant workflows that support project delivery, implementation, and operational execution. It is intended to work with tools that support the [Agent Skills spec](https://agentskills.io), including OpenCode, Claude Code, and compatible agent environments.

Built by [Lola](https://www.linkedin.com/in/lolaojabowale) at [Lunch Pail Labs](https://lunchpaillabs.com).

Want a managed setup for these workflows in real client delivery environments? See [PailFlow](https://pailflow.com).

Contributions are welcome. 

## What are skills?

Skills are directory-based instruction packs that help AI agents recognize and execute specialized workflows. Each skill lives in its own folder and includes a `SKILL.md` file with instructions, usage triggers, and optional references, scripts, or assets.

## State of the repository

- Current maturity: early and intentionally focused
- Core pattern: establish reusable project context first, then layer additional PM skills
- Published skills today: `pm-initiate-project-context`, `pm-monitor`, `pm-monitor-ticket-triage`
- Planned growth path: lifecycle lanes (`initiate`, `plan`, `execute`, `monitor`, `close`)

## Repository focus

This repo is meant to cover project-management-adjacent work such as:

- ticket triage
- scoping and estimation
- project status updates
- retrospectives
- stakeholder communication
- delivery planning
- handoffs and launch readiness
- project hygiene and follow-through

Over time, these skills should map to the kinds of real operational work project managers, delivery managers, implementation teams, and professional services teams do every week.

## Project lifecycle lanes

To keep the collection easy to navigate, skills are organized by standard project lifecycle lanes:

- `initiate` - define intent, clarify problem statements, and establish delivery readiness
- `plan` - shape requirements, scope work, and prepare implementation artifacts
- `execute` - run work through agreed stages and handoffs
- `monitor` - track status, risks, blockers, and control points
- `close` - complete handoff, capture learnings, and formalize closure

### Naming convention for new skills

For new skills, prefer:

`pm-<phase>-<noun-or-object>`

Examples:

- `pm-initiate-project-context`
- `pm-plan-scope-outline`
- `pm-execute-stage-gate-workflow`
- `pm-monitor-status-risks`
- `pm-close-lessons-learned`

Published skill names should remain stable once released. Existing skills can be mapped to lanes in docs without renaming.

## Planned structure

```text
skills/
  skill-name/
    SKILL.md
    references/
    scripts/
    assets/
docs/
examples/
```

## How skills work together

This repository follows a context-first model similar to the best multi-skill collections.

- `pm-initiate-project-context` is the foundation skill
- Other PM skills should read `.agents/project-context.md` first
- This keeps delivery context consistent across handoffs, updates, and execution tasks

As new skills are added, they should reference project context before generating plans, updates, or action items.

## Available skills

| Skill | Description |
|-------|-------------|
| [pm-initiate-project-context](skills/pm-initiate-project-context/) | Creates or updates `.agents/project-context.md` so agents can reuse stakeholder context, delivery expectations, tools/access, risks, and source-of-truth links across project work. |
| [pm-monitor](skills/pm-monitor/) | Monitor-stage workflow entry point for intake triage, status snapshots, and risk/follow-through operations with clear next actions. |
| [pm-monitor-ticket-triage](skills/pm-monitor-ticket-triage/) | Runs intake triage + response operations for tickets/comments/feedback with classification, priority/severity, response drafts, task routing, owner gaps, and closure signals. |

## Installation

### Option 1: CLI Install (Recommended)

Use `npx skills`:

```bash
# Install all skills
npx skills add <owner>/project-management-skills

# Install a specific skill
npx skills add <owner>/project-management-skills --skill pm-initiate-project-context

# List available skills
npx skills add <owner>/project-management-skills --list
```

### Option 2: Clone and Copy

```bash
git clone https://github.com/<owner>/project-management-skills.git
cp -r project-management-skills/skills/* .agents/skills/
```

### Option 3: Fork and Customize

1. Fork this repository
2. Customize skills for your delivery context
3. Keep names stable once published

## Current skills

- `pm-initiate-project-context`
- `pm-monitor`
- `pm-monitor-ticket-triage`

### Current skills by lane

- `initiate`: `pm-initiate-project-context`
- `monitor`: `pm-monitor`, `pm-monitor-ticket-triage`

## Contributing

Found a way to improve a skill or have a new one to propose? Open a PR.

See [CONTRIBUTING.md](CONTRIBUTING.md) for guidelines on adding or updating skills.

## License

[MIT](LICENSE)
