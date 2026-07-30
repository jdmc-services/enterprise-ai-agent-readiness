param(
    [string]$Path = "$HOME\Documents\enterprise-ai-agent-readiness"
)

$required = @(
    "README.md",
    "START-HERE.md",
    "SECURITY.md",
    "LICENSE",
    "01-business-case\use-case-intake-template.md",
    "01-business-case\value-hypothesis-template.md",
    "01-business-case\pilot-scorecard.md",
    "02-architecture\reference-architecture.md",
    "02-architecture\data-flow-template.md",
    "02-architecture\integration-inventory.md",
    "03-security-governance\zero-trust-agent-controls.md",
    "03-security-governance\ai-risk-assessment.md",
    "03-security-governance\ai-incident-response.md",
    "03-security-governance\human-approval-matrix.md",
    "04-use-cases\help-desk-agent-assist.md",
    "04-use-cases\contact-center-agent-assist.md",
    "04-use-cases\healthcare-administrative-agent.md",
    "04-use-cases\enterprise-knowledge-assistant.md",
    "05-measurement\baseline-metrics.md",
    "05-measurement\pilot-success-criteria.md",
    "05-measurement\roi-model.md",
    "06-workforce-enablement\training-plan.md",
    "06-workforce-enablement\adoption-checklist.md",
    "07-advisory-engagement\service-offerings.md",
    "07-advisory-engagement\advisory-approach.md",
    "07-advisory-engagement\engagement-ethics.md"
)

$missing = @()
foreach ($item in $required) {
    $full = Join-Path $Path $item
    if (-not (Test-Path $full)) { $missing += $item }
}

# Guard against private meeting-prep material leaking into the public repo
$forbidden = @("meeting-prep", "07-partnership-positioning")
$leaks = @()
foreach ($item in $forbidden) {
    if (Test-Path (Join-Path $Path $item)) { $leaks += $item }
}

if ($missing.Count -gt 0) {
    Write-Host "Validation failed. Missing files:"
    $missing | ForEach-Object { Write-Host " - $_" }
    exit 1
}
if ($leaks.Count -gt 0) {
    Write-Host "Validation failed. Private material must not be in the public repository:"
    $leaks | ForEach-Object { Write-Host " - $_" }
    exit 1
}

Write-Host "Validation passed: all required files present, no private material detected."

