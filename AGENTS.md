# Agent Notes

This repository stores reusable project management skills for AI agents.

## Expectations

- Keep skill names stable once published.
- Version skills in `SKILL.md` frontmatter under `metadata.version` and bump on every published behavior change.
- Prefer broadly reusable workflows over company-specific process details.
- Keep proprietary orchestration, customer context, and private integrations out of this repo.
- When adding a skill, create `skills/<skill-name>/SKILL.md` first and add supporting material only as needed.
- When adding or removing skills, update `README.md` to reflect the current repository state.
- Keep public eval artifacts generic; store client-specific eval prompts/data in `skills/<skill-name>/evals/private/` (gitignored).
