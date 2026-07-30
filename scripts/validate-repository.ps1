param(
    [string]$Path = "$HOME\Documents\enterprise-ai-agent-readiness"
)

$required = @(
    "README.md",
    "SECURITY.md",
    "01-business-case\use-case-intake-template.md",
    "02-architecture\reference-architecture.md",
    "03-security-governance\zero-trust-agent-controls.md",
    "04-use-cases\help-desk-agent-assist.md",
    "04-use-cases\contact-center-agent-assist.md",
    "05-measurement\pilot-success-criteria.md",
    "07-partnership-positioning\kore-ai-meeting-brief.md"
)

$missing = @()

foreach ($item in $required) {
    $full = Join-Path $Path $item
    if (-not (Test-Path $full)) {
        $missing += $item
    }
}

if ($missing.Count -gt 0) {
    Write-Host "Validation failed. Missing files:"
    $missing | ForEach-Object { Write-Host " - $_" }
    exit 1
}

Write-Host "Validation passed."
