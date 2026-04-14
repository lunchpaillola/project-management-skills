# Agent Notes

This repository stores reusable project management skills for AI agents.

## Expectations

- Keep skill names stable once published.
- Version skills in `SKILL.md` frontmatter under `metadata.version` and bump on every published behavior change.
- Versioning policy: do not bump `VERSIONS.md` or `metadata.version` during draft/branch work. Only bump versions when changes are being finalized for merge to `main` (published state).
- Prefer broadly reusable workflows over company-specific process details.
- Keep proprietary orchestration, customer context, and private integrations out of this repo.
- When adding a skill, create `skills/<skill-name>/SKILL.md` first and add supporting material only as needed.
- When adding or removing skills, update `README.md` to reflect the current repository state.
- Keep public eval artifacts generic; store client-specific eval prompts/data in `skills/<skill-name>/evals/private/` (gitignored).
- For connected-tool workflows, especially Composio-backed ones, prefer concise provenance in the skill contract: name the tools used and cite the specific record IDs, doc names, links, or references that materially support the answer.
