param(
    [Parameter(Mandatory = $true)]
    [string]$TargetPath,
    [switch]$Overwrite,
    [switch]$InitializeGit,
    [switch]$OpenFolder
)

$ErrorActionPreference = 'Stop'
$source = Split-Path -Parent $PSScriptRoot
& (Join-Path $PSScriptRoot 'validate-repository.ps1') -Path $source
$target = [IO.Path]::GetFullPath($TargetPath)
$sourceFull = [IO.Path]::GetFullPath($source)
$comparison = if ($IsWindows) { [StringComparison]::OrdinalIgnoreCase } else { [StringComparison]::Ordinal }
if ($target.Equals($sourceFull, $comparison) -or
    $target.StartsWith($sourceFull + [IO.Path]::DirectorySeparatorChar, $comparison)) {
    throw 'Build destination must be outside the source checkout.'
}
$manifest = Get-Content -LiteralPath (Join-Path $source 'repository-manifest.json') -Raw | ConvertFrom-Json
# Check every collision before copying anything. Never copy .git or unlisted content.
foreach ($item in $manifest.tracked_files) {
    if (-not $Overwrite -and (Test-Path -LiteralPath (Join-Path $target $item))) {
        throw "Destination file exists: $item. Use a new directory or review before supplying -Overwrite."
    }
}
if ($InitializeGit -and -not (Get-Command git -ErrorAction SilentlyContinue)) { throw 'Git is required for -InitializeGit.' }
foreach ($item in $manifest.tracked_files) {
    $destination = Join-Path $target $item
    New-Item -ItemType Directory -Path (Split-Path -Parent $destination) -Force | Out-Null
    Copy-Item -LiteralPath (Join-Path $source $item) -Destination $destination -Force
}
if ($InitializeGit) {
    git -C $target init -b main
    if ($LASTEXITCODE -ne 0) { throw 'Git initialization failed.' }
}
if ($OpenFolder) {
    if ($IsWindows) { Start-Process explorer.exe -ArgumentList $target }
    else { Write-Host "Open this directory in your file manager: $target" }
}
Write-Host "Repository files copied to $target. No files were staged, committed, or published."
