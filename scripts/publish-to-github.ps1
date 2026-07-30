param(
    [Parameter(Mandatory=$true)]
    [string]$GitHubOrg,

    [string]$RepoName = "enterprise-ai-agent-readiness",

    [string]$LocalPath = "$HOME\Documents\enterprise-ai-agent-readiness",

    [switch]$Private
)

$ErrorActionPreference = "Stop"

if (-not (Test-Path $LocalPath)) {
    throw "Local repository not found: $LocalPath"
}

Push-Location $LocalPath
try {
    if (-not (Test-Path ".git")) {
        git init
        git branch -M main
    }

    git add .
    $changes = git status --porcelain
    if ($changes) {
        git commit -m "Publish enterprise AI agent readiness framework"
    }

    $visibility = if ($Private) { "--private" } else { "--public" }

    gh repo create "$GitHubOrg/$RepoName" $visibility --source . --remote origin --push
    Write-Host "Published: https://github.com/$GitHubOrg/$RepoName"
}
finally {
    Pop-Location
}
