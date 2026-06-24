---
name: proj-deliver-request
description: >-
  Deliver one request end to end by creating a GitHub issue, creating a CHATBOT-###
  spec, implementing it, validating it, opening a ready PR, and coordinating review.
  Use when the human wants the full pipeline from intent to ready PR without merging.
---

# Deliver Request

Take one request from intent to ready PR:

```text
GitHub issue -> local CHATBOT-### spec -> implementation -> validation -> commit -> push -> ready PR -> review
```

Do not use Linear or Jira. Do not merge.

## Workflow

1. Read root `AGENTS.md`, `_specs/README.md`, `_specs/TEMPLATE.md`, and `_specs/config.md`.
2. Check `git status` and preserve unrelated changes.
3. Ask at most one clarifying question if the request cannot become verifiable acceptance criteria.
4. Create a GitHub issue using the `proj-create-issue` skill shape.
5. Add the issue to GitHub Project `To do` when Project IDs are configured.
6. Determine next available `CHATBOT-###` ID.
7. Create branch `chatbot-###-short-slug`.
8. Create `_specs/specs/CHATBOT-###-short-slug.md` with linked issue, scope, acceptance criteria, and `Open Questions: - [ ] None`.
9. Set spec `status: implementing`. Set Project status to `In progress` when IDs are configured.
10. Implement narrowly.
11. Add focused tests.
12. Run scoped validation.
13. Update Implementation Notes.
14. Set spec `status: review`.
15. Commit all request-related changes with `Implement CHATBOT-###`.
16. Push branch.
17. Open a ready PR when validation passes.
18. Keep or create draft PR only if validation is incomplete or work is intentionally unfinished.
19. Coordinate one review pass using `proj-review-spec` (prefer a read-only subagent; see `proj-execute-spec`).
20. If changes are required, fix, validate, push, and repeat review.
21. Keep Project status at `In progress` when a ready PR waits for manual merge and IDs are configured.
22. Report issue URL, spec path, branch, PR URL, Project status, validation, reviewer verdict, and risks.
