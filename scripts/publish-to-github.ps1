[CmdletBinding(SupportsShouldProcess = $true, ConfirmImpact = 'High')]
param(
    [Parameter(Mandatory = $true)]
    [ValidatePattern('^[A-Za-z0-9][A-Za-z0-9-]*$')]
    [string]$GitHubOrg,
    [ValidatePattern('^[A-Za-z0-9][A-Za-z0-9._-]*$')]
    [string]$RepoName = 'enterprise-ai-agent-readiness',
    [string]$LocalPath = (Split-Path -Parent $PSScriptRoot),
    [switch]$Public,
    [switch]$Private,
    [switch]$Reviewed
)

$ErrorActionPreference = 'Stop'
if ($Public -and $Private) { throw 'Choose either Public or Private, not both.' }
if (-not $Reviewed) { throw 'Inspect tracked files, ignored files, and commit history first; then supply -Reviewed.' }
foreach ($command in @('git', 'gh')) {
    if (-not (Get-Command $command -ErrorAction SilentlyContinue)) { throw "Required command not found: $command" }
}
$root = (Resolve-Path -LiteralPath $LocalPath).Path
if (-not (Test-Path -LiteralPath (Join-Path $root '.git'))) {
    throw 'A committed Git checkout is required. This utility does not initialize, stage, or commit files.'
}
Push-Location $root
try {
    git rev-parse --verify HEAD | Out-Null
    if ($LASTEXITCODE -ne 0) { throw 'No valid commit found.' }
    $changes = @(git status --porcelain --untracked-files=all)
    if ($LASTEXITCODE -ne 0) { throw 'git status failed.' }
    if ($changes.Count) { throw 'Checkout must be clean, including untracked files. Review and commit approved files separately.' }
    $remotes = @(git remote)
    if ($LASTEXITCODE -ne 0) { throw 'git remote failed.' }
    if ($remotes.Count) { throw 'Existing remotes detected. Use branches and pull requests for an existing repository.' }
    & (Join-Path $PSScriptRoot 'validate-repository.ps1') -Path $root
    gh auth status
    if ($LASTEXITCODE -ne 0) { throw 'GitHub CLI authentication failed.' }
    $visibility = if ($Public) { '--public' } else { '--private' }
    $destination = "$GitHubOrg/$RepoName"
    if ($PSCmdlet.ShouldProcess($destination, "Create new repository $visibility and push the reviewed commit history")) {
        gh repo create $destination $visibility --source . --remote origin --push
        if ($LASTEXITCODE -ne 0) { throw 'GitHub repository creation or push failed; inspect the destination and local remotes before retrying.' }
        Write-Host "Published: https://github.com/$destination"
    }
}
finally { Pop-Location }
