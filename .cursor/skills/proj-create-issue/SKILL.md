---
name: proj-create-issue
description: >-
  Create a GitHub issue for this repo. Use when the human asks to create, file,
  draft, or open an issue or ticket, or when proj-deliver-request needs issue intake.
---

# Create Issue

Create one GitHub issue. Do not use Linear or Jira.

## Workflow

1. Read root `AGENTS.md` and `_specs/config.md`.
2. Inspect labels with `gh label list --repo OWNER/REPO` when labels matter.
3. Ask at most one clarifying question only when the issue would be materially wrong without it.
4. Create the issue with `gh issue create --repo OWNER/REPO`.
5. If GitHub Project IDs are configured in `_specs/config.md`, add the issue to the Project and set Status to `Backlog`.
6. Return issue title, URL, labels, Project status, and open follow-up.

## Issue Shape

- Title: concise, action-oriented, specific.
- Body:
  - `## Intent`
  - `## Scope`
  - `## Acceptance Criteria`
  - `## Notes`
- Labels: use existing labels. Prefer `type:*`, `area:*`, `priority:*` if present.

## Project Intake Commands

See `_specs/github-project.md` for discovery. When IDs are in `_specs/config.md`:

```bash
gh project item-add PROJECT_NUMBER --owner OWNER --url ISSUE_URL --format json
gh project item-edit \
  --id PROJECT_ITEM_ID \
  --project-id PROJECT_ID \
  --field-id STATUS_FIELD_ID \
  --single-select-option-id BACKLOG_OPTION_ID \
  --format json
```

If `PROJECT_NUMBER` or field IDs are empty, skip Project steps and report that.
