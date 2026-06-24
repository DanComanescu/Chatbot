# GitHub Project setup

GitHub Project field IDs are not portable. Run these once after creating a Project for this repo,
then copy the IDs into `_specs/config.md`.

## Prerequisites

- [GitHub CLI](https://cli.github.com/) installed and authenticated (`gh auth login`)
- A GitHub Project created for this repository
- `_specs/config.md` updated with `GH_OWNER` and `PROJECT_NUMBER`

## Discover IDs

```powershell
$owner = "DanComanescu"
$project = 1

gh project view $project --owner $owner --format json
gh project field-list $project --owner $owner --format json
gh project item-list $project --owner $owner --format json --limit 5
```

From `field-list`, find the **Status** field and note:

- `PROJECT_ID` — from `project view`
- `STATUS_FIELD_ID` — Status field id
- `BACKLOG_OPTION_ID` — option named `Backlog`
- `IN_REVIEW_OPTION_ID` — option named `In review`

## Manual item commands

Add an issue to the project:

```powershell
gh project item-add $project --owner $owner --url ISSUE_URL --format json
```

Set status to Backlog:

```powershell
gh project item-edit `
  --id PROJECT_ITEM_ID `
  --project-id PROJECT_ID `
  --field-id STATUS_FIELD_ID `
  --single-select-option-id BACKLOG_OPTION_ID `
  --format json
```

Set status to In review:

```powershell
gh project item-edit `
  --id PROJECT_ITEM_ID `
  --project-id PROJECT_ID `
  --field-id STATUS_FIELD_ID `
  --single-select-option-id IN_REVIEW_OPTION_ID `
  --format json
```
