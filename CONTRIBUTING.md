# Contributing

Thanks for your interest in contributing to Project Management Skills.

## Adding a skill

1. Create a directory under `skills/` using lowercase kebab-case.
2. Add a `SKILL.md` file with YAML frontmatter.
3. Keep the `name` field identical to the directory name.
4. Write a `description` that clearly explains when the skill should be used.
5. Add optional `references/`, `scripts/`, or `assets/` only when useful.
6. For new skills, prefer lifecycle phase prefixes: `pm-initiate-`, `pm-plan-`, `pm-execute-`, `pm-monitor-`, or `pm-close-`.

Example:

```yaml
---
name: ticket-triage
description: Use when the user wants to triage tickets, classify work, identify missing context, or recommend next actions.
---

# Ticket Triage

Instructions for the agent go here.
```

## Skill structure

```text
skills/your-skill-name/
  SKILL.md
  references/
  scripts/
  assets/
```

## Guidelines

- Keep skills narrow, reusable, and outcome-oriented.
- Prefer practical workflows over theory-heavy notes.
- Avoid sensitive data, proprietary customer context, or private credentials.
- Keep public evals generic; put client-specific evals under `skills/<skill-name>/evals/private/`.
- Keep naming clear enough that agents can route to the skill reliably.
- Prefer `pm-<phase>-<noun-or-object>` naming for new skills.
- If a skill overlaps heavily with an existing one, improve the existing skill instead of adding a duplicate.

## Pull requests

When submitting a change:

- explain what workflow the skill supports
- include a clear usage description
- keep the scope focused
- update documentation if needed

## Questions

Open an issue if you want to propose a skill before writing it.
