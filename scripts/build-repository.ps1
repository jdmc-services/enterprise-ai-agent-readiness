param(
    [string]$TargetPath = "$HOME\Documents\enterprise-ai-agent-readiness",
    [switch]$InitializeGit,
    [switch]$OpenFolder
)

$ErrorActionPreference = "Stop"

Write-Host "Building repository at $TargetPath"

$source = Split-Path -Parent $PSScriptRoot
if (Test-Path $TargetPath) {
    Write-Host "Target exists. Existing files will be updated."
} else {
    New-Item -ItemType Directory -Path $TargetPath -Force | Out-Null
}

Copy-Item -Path "$source\*" -Destination $TargetPath -Recurse -Force

if ($InitializeGit) {
    Push-Location $TargetPath
    try {
        if (-not (Test-Path ".git")) {
            git init
            git branch -M main
        }
        git add .
        git commit -m "Build enterprise AI agent readiness framework"
    }
    finally {
        Pop-Location
    }
}

if ($OpenFolder) {
    Start-Process explorer.exe $TargetPath
}

Write-Host ""
Write-Host "Repository build complete."
Write-Host "Path: $TargetPath"
Write-Host ""
Write-Host "Next steps:"
Write-Host "1. Review README.md"
Write-Host "2. Replace contact information if needed"
Write-Host "3. Run git status"
Write-Host "4. Create a GitHub repository named enterprise-ai-agent-readiness"
Write-Host "5. Add the remote and push"

