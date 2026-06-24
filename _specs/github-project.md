# GitHub Project setup

Minimal board: **To do** → **In progress** → **Done**

## One-time setup (PowerShell)

From the repo root, in a terminal where `gh` works:

```powershell
# 1. Grant Projects scope (opens browser once)
gh auth refresh -h github.com -s project,read:project

# 2. Create project, link repo, print field IDs
.\scripts\setup-github-project.ps1
```

Copy the printed IDs into `_specs/config.md`.

## Manual setup (browser)

1. Open https://github.com/users/DanComanescu/projects/new
2. Name: **Chatbot**
3. Link repository: **DanComanescu/Chatbot**
4. Status columns: keep only **To do**, **In progress**, **Done** (delete extras)
5. Run discovery commands below and fill `_specs/config.md`

## Discover IDs

```powershell
$owner = "DanComanescu"
$project = 1   # your PROJECT_NUMBER

gh project view $project --owner $owner --format json
gh project field-list $project --owner $owner --format json
```

From `field-list`, find the **Status** field options named exactly:
- `To do`
- `In progress`
- `Done`

## Status commands

Add issue to project:

```powershell
gh project item-add $project --owner $owner --url ISSUE_URL --format json
```

Set **To do**:

```powershell
gh project item-edit `
  --id PROJECT_ITEM_ID `
  --project-id PROJECT_ID `
  --field-id STATUS_FIELD_ID `
  --single-select-option-id TODO_OPTION_ID `
  --format json
```

Set **In progress**:

```powershell
gh project item-edit `
  --id PROJECT_ITEM_ID `
  --project-id PROJECT_ID `
  --field-id STATUS_FIELD_ID `
  --single-select-option-id IN_PROGRESS_OPTION_ID `
  --format json
```

Set **Done**:

```powershell
gh project item-edit `
  --id PROJECT_ITEM_ID `
  --project-id PROJECT_ID `
  --field-id STATUS_FIELD_ID `
  --single-select-option-id DONE_OPTION_ID `
  --format json
```
