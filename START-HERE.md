# Start Here

## Fastest Method

1. Extract the ZIP file.
2. Open PowerShell.
3. Change to the extracted folder.
4. Run:

```powershell
Set-ExecutionPolicy -Scope Process Bypass
.\scripts\build-repository.ps1 -InitializeGit -OpenFolder
```

This creates:

```text
Documents\enterprise-ai-agent-readiness
```

## Publish to GitHub

Install and authenticate GitHub CLI first:

```powershell
gh auth login
```

Then run:

```powershell
.\scripts\publish-to-github.ps1 -GitHubOrg "jdmc-services"
```

## Validate

```powershell
.\scripts\validate-repository.ps1
```

## Recommended GitHub Description

> Vendor-neutral framework for enterprise AI agent readiness, Zero-Trust governance, healthcare operations, IT service management, contact centers, and measurable AI adoption.

## Recommended Topics

- enterprise-ai
- ai-agents
- ai-governance
- zero-trust
- healthcare-ai
- contact-center
- service-management
- cybersecurity
- responsible-ai
- workforce-development

## Recommended Visibility

Use **Public** only after confirming that no confidential or employer-specific information was added.
