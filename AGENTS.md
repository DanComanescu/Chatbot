# Repo Agent Context

## Context Map

Read this file first, then follow the context needed for the task:

- Durable docs: `docs/`
- SDD workflow and change records: `_specs/README.md`, `_specs/config.md`, and `_specs/specs/`
- Repo-local Cursor skills: `.cursor/skills/`

## SDD Workflow

Use local IDs in the form `CHATBOT-001` (see `_specs/config.md` for prefix).

Specs live under `_specs/specs/`.
Epics live under `_specs/epics/`.

Repo-local skills (invoke by name in Cursor Agent):

- `proj-create-issue` — creates a GitHub issue
- `proj-create-spec` — creates a local spec branch and draft PR
- `proj-execute-spec` — implements an existing local spec, opens a ready PR when validation passes, and coordinates one reviewer pass
- `proj-review-spec` — reviews an open PR against its changed spec and leaves a normal PR comment verdict
- `proj-deliver-request` — carries one request from GitHub issue through spec, implementation, validation, ready PR, and review

GitHub Projects track lightweight status when configured in `_specs/config.md`.
New workflow-created issues enter `Backlog`.
Ready PRs waiting for manual merge belong in `In review`.

No Linear or Jira workflow exists for this repo.

## Cursor usage

In Agent chat, name the skill explicitly:

```text
Use proj-create-spec. Create a CHATBOT spec for: ...
Use proj-execute-spec. Implement CHATBOT-001.
Use proj-deliver-request. Take this request from issue to ready PR, without merging: ...
Use proj-review-spec. Review PR #12 against its changed spec. Do not modify files.
```

For review isolation, `proj-execute-spec` and `proj-deliver-request` may launch a read-only subagent
that follows `proj-review-spec`.
