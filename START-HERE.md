# Start Here

## What This Is

A vendor-neutral framework for taking enterprise AI agents from idea to governed, measured production in regulated environments. If you're reading this on GitHub, the [README](README.md) explains the structure; the fastest useful entry points are:

| You are… | Start with |
|---|---|
| Evaluating a first use case | [Use-Case Intake](01-business-case/use-case-intake-template.md) → [Risk Assessment](03-security-governance/ai-risk-assessment.md) |
| Preparing a security review | [Zero-Trust Agent Controls](03-security-governance/zero-trust-agent-controls.md) → [Reference Architecture](02-architecture/reference-architecture.md) |
| Building the business case | [ROI Model](05-measurement/roi-model.md) → [Baseline Metrics](05-measurement/baseline-metrics.md) |
| Designing a pilot | [Pilot Success Criteria](05-measurement/pilot-success-criteria.md) → [Adoption Checklist](06-workforce-enablement/adoption-checklist.md) |

## Local Setup (for maintainers)

1. Extract the package ZIP.
2. Open PowerShell in the extracted folder.
3. Run:

```powershell
Set-ExecutionPolicy -Scope Process Bypass
.\scripts\build-repository.ps1 -InitializeGit -OpenFolder
```

This builds the repository at `Documents\enterprise-ai-agent-readiness`.

## Publish to GitHub

Authenticate the GitHub CLI, confirming you are on the intended account:

```powershell
gh auth login
gh auth status
```

Then publish (private first is recommended — review on GitHub, then flip to public):

```powershell
.\scripts\publish-to-github.ps1 -GitHubOrg "<your-org-or-username>" -Private
```

## Validate

```powershell
.\scripts\validate-repository.ps1
```

## Recommended GitHub Description

> Vendor-neutral framework for enterprise AI agent readiness: Zero-Trust governance, healthcare administrative AI, IT service management and contact center agent assist, and baseline-driven value measurement.

## Recommended Topics

`enterprise-ai` `ai-agents` `ai-governance` `zero-trust` `healthcare-ai` `contact-center` `service-management` `cybersecurity` `responsible-ai` `workforce-development`

## Pre-Publish Checklist

- [ ] `gh auth status` shows the intended account/organization
- [ ] Repository created **private**; full read-through on GitHub before flipping public
- [ ] No employer names, internal architecture, internal metrics, or confidential information anywhere
- [ ] Mermaid diagrams render correctly on GitHub
- [ ] Repository description and topics set
