# Spec-Driven Development

Specs are local git artifacts. GitHub Issues and Projects are used for lightweight tracking.
There is no Linear or Jira integration in this repo.

Repo configuration: `_specs/config.md`

## IDs

Use IDs in the form:

```text
CHATBOT-001
CHATBOT-002
CHATBOT-003
```

Spec filenames:

```text
_specs/specs/CHATBOT-001-short-slug.md
```

Epic folders:

```text
_specs/epics/CHATBOT-010-epic-slug/
  README.md
  CHATBOT-011-child-spec.md
```

## Pipeline

```text
Human describes intent
  ↓
proj-create-issue creates a GitHub issue when tracking is useful
  ↓
proj-create-spec creates a local spec branch and draft PR
  ↓
Human or agent resolves open questions
  ↓
proj-execute-spec implements the spec and opens or updates the PR
  ↓
proj-execute-spec coordinates one reviewer pass
  ↓
reviewer leaves a normal PR comment with Verdict: Approved or Changes required
  ↓
agent coordinates fixes if needed
  ↓
Human decides whether to merge
```

## Status Values

| Status | Meaning |
|--------|---------|
| `draft` | Spec exists but has not started implementation |
| `implementing` | Implementation is in progress |
| `review` | Implementation is ready for review |
| `done` | Implementation is complete and accepted |

## Rules

- Keep acceptance criteria independently verifiable.
- Use `- [ ] None` under Open Questions when nothing is blocking.
- Do not implement a spec with unresolved open questions.
- Keep specs focused. Split broad work.
- Update Implementation Notes as code changes.
- Keep spec-only PRs draft.
- Open ready PRs for completed implementation work when validation passes.
- Keep implementation PRs draft when validation is incomplete or intentionally unfinished.
- Reviewer output is a normal PR comment, not necessarily a formal GitHub approval.
