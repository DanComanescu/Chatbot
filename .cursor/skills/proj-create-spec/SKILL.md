---
name: proj-create-spec
description: >-
  Create a local SDD spec with a CHATBOT-### id, commit it on a spec branch, push it,
  and open a draft GitHub PR. Use when the human asks to spec, plan, or draft a
  ticket without implementing yet.
---

# Create Spec

Create a local spec file, commit it on a spec branch, push it, and open a draft PR.
Do not implement product code unless the human explicitly asks for execution too.

## Workflow

1. Read root `AGENTS.md`, `_specs/README.md`, `_specs/TEMPLATE.md`, and `_specs/config.md`.
2. Determine the next available ID by scanning `_specs/specs/` and `_specs/epics/` for `SDD_PREFIX-###` files.
3. Ask at most one clarifying question if intent or acceptance criteria are too ambiguous.
4. Create a branch named `{prefix-lowercase}-###-short-slug` (e.g. `chatbot-001-short-slug`).
5. Create `_specs/specs/CHATBOT-###-short-slug.md` from the template.
6. Keep `status: draft` unless execution starts immediately.
7. Put unresolved ambiguity under Open Questions. Use `- [ ] None` when clear.
8. Commit only the spec file with `Add CHATBOT-### spec`.
9. Push the branch.
10. Open a draft PR against `main` with `gh pr create --draft`.
11. Report spec path, branch, PR URL, and open questions.

## Next ID (PowerShell)

```powershell
Get-ChildItem -Recurse _specs/specs, _specs/epics -Filter 'CHATBOT-*.md' -ErrorAction SilentlyContinue |
  ForEach-Object { if ($_.Name -match 'CHATBOT-(\d+)') { [int]$Matches[1] } } |
  Sort-Object | Select-Object -Last 1
```

Increment the result by 1, or start at `001`.

## PR Shape

- Title: `CHATBOT-###: Short descriptive title`
- Body includes:
  - spec path
  - summary of intent and scope
  - open questions or `None`
  - linked GitHub issue when one exists
