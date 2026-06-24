# SDD Configuration

Update this file once when setting up the repo. Skills read these values.

| Variable | Value | Notes |
|----------|-------|-------|
| `GH_OWNER` | `DanComanescu` | GitHub user or org |
| `GH_REPO` | `Chatbot` | Repository name |
| `GH_FULL_REPO` | `DanComanescu/Chatbot` | `GH_OWNER/GH_REPO` |
| `SDD_PREFIX` | `CHATBOT` | Spec ID prefix (e.g. `CHATBOT-001`) |
| `PROJECT_NUMBER` | | Optional. Leave empty to skip GitHub Project automation |
| `DEFAULT_BRANCH` | `main` | Base branch for PRs |

## GitHub Project field IDs (optional)

After creating a GitHub Project, run the discovery commands in `_specs/github-project.md`
and fill in the IDs below for fully automated Project status updates.

| Field | ID |
|-------|-----|
| `PROJECT_ID` | |
| `STATUS_FIELD_ID` | |
| `BACKLOG_OPTION_ID` | |
| `IN_REVIEW_OPTION_ID` | |
