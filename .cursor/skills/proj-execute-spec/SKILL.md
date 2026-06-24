---
name: proj-execute-spec
description: >-
  Implement an existing SDD spec, validate it, open a ready GitHub PR, and coordinate
  one reviewer pass. Use when the human asks to implement CHATBOT-### or execute a spec.
---

# Execute Spec

Implement one existing local spec. Do not merge unless the human explicitly asks.

## Workflow

1. Read root `AGENTS.md`, `_specs/README.md`, `_specs/config.md`, and the target spec.
2. Confirm Open Questions is `- [ ] None`. If not, stop and report the questions.
3. Check `git status` and preserve unrelated changes.
4. Use the spec frontmatter `branch` value.
5. Switch to that branch, creating it from `main` only when needed.
6. Set spec `status: implementing` and update `updated`.
7. Implement the task breakdown narrowly.
8. Add focused tests where infrastructure exists.
9. Run scoped validation.
10. Update Implementation Notes with files changed, test commands, and tradeoffs.
11. Set spec `status: review` unless review is intentionally skipped.
12. Commit with `Implement CHATBOT-###`.
13. Push the branch.
14. Ensure a PR exists against `main`; create one with `gh pr create` if needed.
15. If validation passed and PR is draft, mark ready with `gh pr ready`.
16. Coordinate exactly one reviewer pass (see Reviewer coordination below).
17. If reviewer says `Verdict: Changes required`, fix, validate, push, and request another pass.
18. If a ready PR waits for manual merge and Project IDs are configured, set Project status to `In review`.
19. Report changed files, tests, PR URL, readiness state, reviewer verdict, blockers, and remaining risk.

## Reviewer coordination

Launch a read-only subagent (Task tool, `readonly: true`) with this prompt:

```text
Follow the proj-review-spec skill for PR {PR_URL_OR_NUMBER}.
Read .cursor/skills/proj-review-spec/SKILL.md and execute it exactly.
Do not modify files, commit, push, or merge.
```

Alternatively, if the human invoked review separately, wait for their `proj-review-spec` result.

## PR Shape

- Title: `CHATBOT-###: Short descriptive title`
- Body includes:
  - spec path
  - implementation summary
  - validation commands and results
  - linked issue when one exists
  - remaining risks or follow-ups
