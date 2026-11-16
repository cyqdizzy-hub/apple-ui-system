param(
    [switch]$Force
)

$ErrorActionPreference = 'Stop'
$skillName = 'apple-ui-system'
$source = Join-Path $PSScriptRoot $skillName
$skillsRoot = Join-Path $env:USERPROFILE '.agents\skills'
$target = Join-Path $skillsRoot $skillName

if (-not (Test-Path -LiteralPath (Join-Path $source 'SKILL.md'))) {
    throw "Skill source not found: $(Join-Path $source 'SKILL.md'). Extract the complete package before running this script."
}

New-Item -ItemType Directory -Path $skillsRoot -Force | Out-Null

if (Test-Path -LiteralPath $target) {
    if (-not $Force) {
        throw "Target already exists: $target. Re-run with -Force to back it up and replace it. No files were changed."
    }
    $stamp = Get-Date -Format 'yyyyMMdd-HHmmss'
    $backup = "$target.backup-$stamp"
    Move-Item -LiteralPath $target -Destination $backup
    Write-Host "Existing Skill backed up to: $backup" -ForegroundColor Yellow
}

New-Item -ItemType Directory -Path $target -Force | Out-Null
Copy-Item -Path (Join-Path $source '*') -Destination $target -Recurse -Force

$installedSkill = Join-Path $target 'SKILL.md'
if (-not (Test-Path -LiteralPath $installedSkill)) {
    throw "Installation verification failed: $installedSkill"
}

Write-Host "Installed: $target" -ForegroundColor Green
Write-Host 'Restart Codex, then call $apple-ui-system.' -ForegroundColor Cyan
Write-Host "Verify with: Test-Path `"$installedSkill"""
