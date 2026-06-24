---
name: proj-review-spec
description: >-
  Review an open PR against its changed CHATBOT-### spec and leave a normal GitHub PR
  comment with Approved or Changes required. Use when reviewing a spec-backed PR;
  read-only, no file edits or merge.
---

# Review Spec

Review only. Do not modify files, commit, push, merge, close issues, or update Project state.

## Workflow

1. Resolve the PR from URL, number, or branch.
2. Read root `AGENTS.md` and `_specs/README.md`.
3. Refresh local `main`:

   ```bash
   git fetch origin
   git checkout main
   git pull --ff-only
   ```

4. Read PR metadata, changed files, and diff against latest main.
5. Resolve exactly one changed spec file under `_specs/specs/*.md`. Stop if zero or multiple specs are found.
6. Read the spec and extract intent, scope, acceptance criteria, open questions, and test notes.
7. Review for acceptance-criteria misses, bugs, regressions, missing tests, scope drift, unsafe data changes, and user-visible regressions.
8. Leave a normal GitHub PR comment with `Verdict: Approved` or `Verdict: Changes required`.
9. Report comment URL, verdict, and concise findings.

## Commands

```bash
gh pr view PR_NUMBER_OR_URL --json number,title,body,headRefName,baseRefName,url,files
gh pr diff PR_NUMBER_OR_URL
gh pr comment PR_NUMBER_OR_URL --body-file review-comment.md
```

On Windows, write the comment body to a temp file in the workspace instead of `/tmp/`.

## Comment Template

```markdown
### Spec
CHATBOT-### - spec title

### Implementation
One concise paragraph.

### Acceptance Criteria
- ✅ AC text - evidence
- ❌ AC text - gap

### Findings
None found.

### Reference
Spec path and linked issue/PR context.

### Verdict
Verdict: Approved
```

Use `Verdict: Changes required` when anything blocks merge-readiness.
