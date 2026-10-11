$ErrorActionPreference = 'Stop'
$repo = Split-Path -Parent $PSScriptRoot
$expectedCount = (Get-Content (Join-Path $repo 'repository-manifest.json') -Raw | ConvertFrom-Json).file_count
$testRoot = Join-Path ([IO.Path]::GetTempPath()) ('release-audit-' + [guid]::NewGuid())
New-Item -ItemType Directory -Path $testRoot | Out-Null
$script:checks = 0
function Assert($condition, $label) {
    if (-not $condition) { throw "FAIL: $label" }
    $script:checks++
    Write-Host "PASS: $label"
}
function ExpectFailure([scriptblock]$action, [string]$pattern, [string]$label) {
    $failed = $false
    try { & $action } catch {
        $failed = $true
        Assert ($_.Exception.Message -match $pattern) "$label (expected error)"
    }
    Assert $failed "$label (blocked)"
}
try {
    foreach ($scriptFile in Get-ChildItem "$repo/scripts/*.ps1") {
        $tokens = $null; $parseErrors = $null
        [System.Management.Automation.Language.Parser]::ParseFile($scriptFile.FullName, [ref]$tokens, [ref]$parseErrors) | Out-Null
        Assert ($parseErrors.Count -eq 0) "PowerShell parsing: $($scriptFile.Name)"
    }
    & "$repo/scripts/validate-repository.ps1"
    Assert $true 'Validator defaults to script repository root'
    $copy = Join-Path $testRoot 'copy'
    Set-Content -LiteralPath (Join-Path $repo 'unlisted-test-file.tmp') -Value 'synthetic test only'
    & "$repo/scripts/build-repository.ps1" -TargetPath $copy
    Remove-Item -LiteralPath (Join-Path $repo 'unlisted-test-file.tmp')
    Assert (Test-Path "$copy/.github/ISSUE_TEMPLATE/risk-review.md") 'Build preserves .github'
    Assert (Test-Path "$copy/.gitignore") 'Build preserves .gitignore'
    Assert (-not (Test-Path "$copy/.git")) 'Build excludes Git history'
    Assert (-not (Test-Path "$copy/unlisted-test-file.tmp")) 'Build excludes unlisted files'
    $copied = @(Get-ChildItem -LiteralPath $copy -File -Recurse -Force)
    Assert ($copied.Count -eq $expectedCount) 'Build copies exactly the manifest inventory'
    ExpectFailure { & "$repo/scripts/build-repository.ps1" -TargetPath $copy } 'exists' 'Build rejects overwrite'
    ExpectFailure { & "$repo/scripts/build-repository.ps1" -TargetPath "$repo/nested" } 'outside' 'Build rejects nested target'
    & "$repo/scripts/build-repository.ps1" -TargetPath $copy -Overwrite
    Assert $true 'Explicit overwrite succeeds'
    $init = Join-Path $testRoot 'initialized'
    & "$repo/scripts/build-repository.ps1" -TargetPath $init -InitializeGit
    Assert (Test-Path "$init/.git") 'Build initializes Git only when requested'
    Assert (@(git -C $init ls-files).Count -eq 0) 'Build does not stage files'

    Rename-Item "$copy/LICENSE" 'LICENSE.bak'
    ExpectFailure { & "$repo/scripts/validate-repository.ps1" -Path $copy } 'missing file' 'Validator rejects missing inventory file'
    Rename-Item "$copy/LICENSE.bak" 'LICENSE'
    New-Item -ItemType Directory "$copy/meeting-prep" | Out-Null
    ExpectFailure { & "$repo/scripts/validate-repository.ps1" -Path $copy } 'forbidden' 'Validator rejects private meeting path'
    Remove-Item "$copy/meeting-prep"
    Add-Content "$copy/README.md" '[Broken](missing-example.md)'
    ExpectFailure { & "$repo/scripts/validate-repository.ps1" -Path $copy } 'broken local link' 'Validator rejects broken local links'
    Copy-Item "$repo/README.md" "$copy/README.md" -Force
    $manifestText = Get-Content "$copy/repository-manifest.json" -Raw
    $manifest = $manifestText | ConvertFrom-Json
    $manifest.file_count = 43
    $manifest | ConvertTo-Json -Depth 5 | Set-Content "$copy/repository-manifest.json"
    ExpectFailure { & "$repo/scripts/validate-repository.ps1" -Path $copy } 'count' 'Validator rejects wrong count'
    Set-Content "$copy/repository-manifest.json" $manifestText

    # Every gh invocation below is intercepted. No authentication, network, or publication occurs.
    $global:auditGhCalls = [System.Collections.Generic.List[string]]::new()
    $global:auditFailGh = $false
    function global:gh {
        $global:auditGhCalls.Add(($args -join ' '))
        if ($global:auditFailGh) { $global:LASTEXITCODE = 1 } else { $global:LASTEXITCODE = 0 }
    }
    git -C $copy init -b main | Out-Null
    git -C $copy -c user.name='Synthetic Test' -c user.email='synthetic@example.invalid' add .
    git -C $copy -c user.name='Synthetic Test' -c user.email='synthetic@example.invalid' commit -m 'Synthetic script fixture' | Out-Null
    ExpectFailure { & "$repo/scripts/publish-to-github.ps1" -GitHubOrg synthetic-test -LocalPath $copy } 'Reviewed' 'Publish requires review acknowledgement'
    & "$repo/scripts/publish-to-github.ps1" -GitHubOrg synthetic-test -LocalPath $copy -Reviewed -WhatIf
    Assert (@($global:auditGhCalls | Where-Object { $_ -like 'repo create*' }).Count -eq 0) 'WhatIf never invokes repository creation'
    $global:auditGhCalls.Clear()
    & "$repo/scripts/publish-to-github.ps1" -GitHubOrg synthetic-test -LocalPath $copy -Reviewed -Confirm:$false
    Assert ($global:auditGhCalls[1] -match '--private') 'Publish defaults to private (mocked gh)'
    $global:auditGhCalls.Clear()
    & "$repo/scripts/publish-to-github.ps1" -GitHubOrg synthetic-test -LocalPath $copy -Reviewed -Public -Confirm:$false
    Assert ($global:auditGhCalls[1] -match '--public') 'Public publication requires explicit switch (mocked gh)'
    ExpectFailure { & "$repo/scripts/publish-to-github.ps1" -GitHubOrg synthetic-test -LocalPath $copy -Reviewed -Public -Private } 'not both' 'Conflicting visibility flags rejected'
    Set-Content "$copy/untracked.tmp" 'synthetic'
    ExpectFailure { & "$repo/scripts/publish-to-github.ps1" -GitHubOrg synthetic-test -LocalPath $copy -Reviewed } 'clean' 'Untracked content blocks publication'
    Remove-Item "$copy/untracked.tmp"
    Add-Content "$copy/README.md" 'synthetic modification'
    ExpectFailure { & "$repo/scripts/publish-to-github.ps1" -GitHubOrg synthetic-test -LocalPath $copy -Reviewed } 'clean' 'Modified content blocks publication'
    git -C $copy checkout -- README.md
    git -C $copy remote add origin https://example.invalid/synthetic.git
    ExpectFailure { & "$repo/scripts/publish-to-github.ps1" -GitHubOrg synthetic-test -LocalPath $copy -Reviewed } 'Existing remotes' 'Existing repository remote blocks creation'
    git -C $copy remote remove origin
    $global:auditFailGh = $true
    ExpectFailure { & "$repo/scripts/publish-to-github.ps1" -GitHubOrg synthetic-test -LocalPath $copy -Reviewed } 'authentication failed' 'Failed authentication blocks publication'
    $global:auditFailGh = $false
    $null = git -C $copy ls-files
    $beforeCount = @(git -C $copy ls-files).Count
    Set-Content "$copy/new-inventory.tmp" 'synthetic'
    git -C $copy add new-inventory.tmp
    ExpectFailure { & "$repo/scripts/validate-repository.ps1" -Path $copy } 'inventory differs' 'Validator rejects unlisted tracked files'
    Assert ($beforeCount -eq $expectedCount) 'Publishing tests preserve fixture inventory'
    Write-Host "TOTAL: $script:checks checks passed. All gh operations mocked; no repository published."
}
finally {
    if (Test-Path "$repo/unlisted-test-file.tmp") { Remove-Item "$repo/unlisted-test-file.tmp" }
    Remove-Item Function:\gh -ErrorAction SilentlyContinue
    Remove-Item -LiteralPath $testRoot -Recurse -Force
}
