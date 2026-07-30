# Use Case: Enterprise Knowledge Assistant

## Objective

Give authorized users fast, cited answers from trusted enterprise knowledge â€” without creating a side door around source-system permissions, and without teaching the organization to trust confident guesses.

## The Permission-Preservation Principle

The single most common enterprise knowledge-assistant failure is permission flattening: content is indexed under a privileged service identity, and the assistant returns information to users who could never have opened the source document. This is a data-exposure incident implemented as a feature.

The control is structural: **retrieval executes in the user's security context** (user-delegated access wherever the platform supports it), and the assistant can only surface what the requesting user is already authorized to read. Where delegated access is not possible, index-level security trimming must replicate source ACLs and be re-validated on every permission change cycle.

## Requirements

| Category | Requirement |
|---|---|
| Identity | Enterprise IdP integration (e.g., Entra ID); per-user context on every query; conditional access honored |
| Authorization | Source-level permission preservation; user-delegated retrieval preferred |
| Grounding | Citation on every supported answer; explicit "no supported answer" when evidence is insufficient |
| Input safety | Prompt-injection filtering on retrieved content â€” documents are data, never instructions |
| Content safety | Malicious-content and poisoning detection on ingested sources |
| Data lifecycle | Retention controls on conversations and logs aligned to records policy |
| Monitoring | Query, retrieval, and response telemetry to SIEM; anomalous-access alerting |

## Failure Conditions

The assistant must never:

- **Invent policy.** An answer without a citable source is not an answer.
- **Return restricted content** â€” regardless of how the query is phrased, chained, or roleplayed.
- **Treat unapproved sources as authoritative.** Source onboarding is a governance decision with an owner, not a crawl setting.
- **Execute transactions.** A knowledge assistant that starts taking actions is a different use case with a different risk score.
- **Conceal uncertainty.** "The knowledge base does not cover this" is a successful outcome; a fluent guess is a failure.

## Knowledge Lifecycle Dependency

Assistant quality is capped by source quality. The deployment plan must include knowledge-base ownership, freshness review cadence, and a feedback loop from unanswered queries into content development. The assistant's unanswered-question log is one of its most valuable outputs â€” it is a continuously updated map of the organization's knowledge gaps.

## Metrics

- Answer rate with citation vs. explicit no-answer rate
- User-validated answer accuracy (sampled review)
- Search-to-answer time vs. baseline (intranet search, asking colleagues, tickets filed)
- Deflection of knowledge-seeking tickets from the service desk
- Knowledge-gap closure rate from the unanswered-query feed
- **Permission integrity:** zero unauthorized-content returns in adversarial audit testing â€” gates continued operation

