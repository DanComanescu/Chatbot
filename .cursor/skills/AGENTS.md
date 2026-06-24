# Repo-Local Skills

These skills are intentionally small and local-only. They do not integrate with Linear or Jira.

Read `_specs/config.md` for `GH_OWNER`, `GH_REPO`, `SDD_PREFIX`, and optional GitHub Project IDs.

Use `CHATBOT-###` IDs and specs in `_specs/specs/` (or the configured `SDD_PREFIX`).

Completed implementation workflows should use one reviewer pass before final merge-readiness reporting.
The reviewer leaves a normal GitHub PR comment with `Verdict: Approved` or `Verdict: Changes required`,
and does not modify files or merge.

In Cursor, invoke a skill by naming it in Agent chat (e.g. `Use proj-create-issue. ...`).
