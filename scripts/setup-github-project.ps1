# Creates GitHub Project "Chatbot", links DanComanescu/Chatbot, prints field IDs for _specs/config.md
# Requires: gh auth refresh -h github.com -s project,read:project

$ErrorActionPreference = "Stop"

$gh = @(
  "$env:ProgramFiles\GitHub CLI\gh.exe",
  "$env:LocalAppData\Programs\GitHub CLI\gh.exe"
) | Where-Object { Test-Path $_ } | Select-Object -First 1

if (-not $gh) {
  $gh = (Get-Command gh -ErrorAction SilentlyContinue).Source
}

if (-not $gh) {
  Write-Host "ERROR: gh not found. Install GitHub CLI: winget install GitHub.cli"
  exit 1
}

Write-Host "Using gh: $gh"

$owner = "DanComanescu"
$repo = "Chatbot"
$title = "Chatbot"

Write-Host "Checking gh project access..."
& $gh project list --owner $owner --limit 1 | Out-Null
if ($LASTEXITCODE -ne 0) {
  Write-Host ""
  Write-Host "Missing project scope. Run first:"
  Write-Host "  gh auth refresh -h github.com -s project,read:project"
  exit 1
}

Write-Host "Creating project '$title'..."
$json = & $gh project create --owner $owner --title $title --format json
$created = $json | ConvertFrom-Json
$projectNumber = $created.number
$projectId = $created.id
Write-Host "Created project #$projectNumber"

Write-Host "Linking to $owner/$repo..."
& $gh project link $projectNumber --owner $owner --repo "$owner/$repo"
if ($LASTEXITCODE -ne 0) {
  Write-Host "WARN: link failed; link manually from repo Projects tab."
}

Write-Host "Fetching Status field options..."
$fields = & $gh project field-list $projectNumber --owner $owner --format json | ConvertFrom-Json
$statusField = $fields.fields | Where-Object { $_.name -eq "Status" } | Select-Object -First 1

if (-not $statusField) {
  Write-Host "Status field not found. Open project in browser and check columns."
  Write-Host "Project URL: https://github.com/users/$owner/projects/$projectNumber"
  exit 1
}

$todo = $statusField.options | Where-Object { $_.name -match "^(To do|Todo)$" } | Select-Object -First 1
$inProgress = $statusField.options | Where-Object { $_.name -match "^(In progress|In Progress)$" } | Select-Object -First 1
$done = $statusField.options | Where-Object { $_.name -match "^Done$" } | Select-Object -First 1

Write-Host ""
Write-Host "=== Paste into _specs/config.md ==="
Write-Host "PROJECT_NUMBER: $projectNumber"
Write-Host "PROJECT_ID:       $projectId"
Write-Host "STATUS_FIELD_ID:  $($statusField.id)"
Write-Host "TODO_OPTION_ID:   $($todo.id)  ($($todo.name))"
Write-Host "IN_PROGRESS_OPTION_ID: $($inProgress.id)  ($($inProgress.name))"
Write-Host "DONE_OPTION_ID:   $($done.id)  ($($done.name))"
Write-Host ""
Write-Host "Project URL: https://github.com/users/$owner/projects/$projectNumber"
Write-Host ""
Write-Host "In the board, keep only: To do | In progress | Done"
