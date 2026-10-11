param(
    [string]$Path = (Split-Path -Parent $PSScriptRoot)
)

$ErrorActionPreference = 'Stop'
$root = (Resolve-Path -LiteralPath $Path).Path
$manifestPath = Join-Path $root 'repository-manifest.json'
if (-not (Test-Path -LiteralPath $manifestPath -PathType Leaf)) {
    throw 'Validation failed: repository-manifest.json is missing.'
}
$manifest = Get-Content -LiteralPath $manifestPath -Raw | ConvertFrom-Json
$files = @($manifest.tracked_files)
if ($files.Count -eq 0 -or $files.Count -ne $manifest.file_count -or
    @($files | Sort-Object -Unique).Count -ne $files.Count) {
    throw 'Validation failed: manifest count is incorrect or paths are empty/duplicated.'
}
foreach ($item in $files) {
    if ([IO.Path]::IsPathRooted($item) -or $item -match '(^|[\\/])\.\.([\\/]|$)') {
        throw "Validation failed: unsafe manifest path: $item"
    }
    if (-not (Test-Path -LiteralPath (Join-Path $root $item) -PathType Leaf)) {
        throw "Validation failed: missing file: $item"
    }
}
# Public partnership templates are intentional; private meeting notes are not.
foreach ($item in @('meeting-prep')) {
    if (Test-Path -LiteralPath (Join-Path $root $item)) {
        throw "Validation failed: forbidden private path: $item"
    }
}

if (Test-Path -LiteralPath (Join-Path $root '.git')) {
    $tracked = @(git -C $root ls-files)
    if ($LASTEXITCODE -ne 0) { throw 'git ls-files failed.' }
    $difference = @(Compare-Object ($files | Sort-Object) ($tracked | Sort-Object))
    if ($difference.Count) { throw "Validation failed: Git inventory differs from manifest: $($difference.InputObject -join ', ')" }
}

foreach ($item in $files | Where-Object { $_ -like '*.md' }) {
    $document = Join-Path $root $item
    $content = Get-Content -LiteralPath $document -Raw
    foreach ($match in [regex]::Matches($content, '\]\(([^)]+)\)')) {
        $target = $match.Groups[1].Value
        if ($target -match '^(https?://|mailto:|#)') { continue }
        $relative = ($target -split '#', 2)[0]
        if ($relative -and -not (Test-Path -LiteralPath (Join-Path (Split-Path -Parent $document) $relative))) {
            throw "Validation failed: broken local link in ${item}: $target"
        }
    }
}
Write-Host 'Structural validation passed: inventory, configured forbidden paths, and local Markdown file targets checked.'
Write-Host 'This check does not inspect sensitive content or Git history, validate external links, or test AI controls.'
