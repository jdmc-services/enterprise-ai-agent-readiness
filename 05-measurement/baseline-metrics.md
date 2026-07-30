# Baseline Metrics

No baseline, no pilot. Value claims made against memory, estimates, or vendor benchmarks are unfalsifiable â€” and unfalsifiable claims do not survive executive review. The baseline is a **30-day measured window** captured before any agent capability is enabled, using the same reporting sources that will measure the pilot.

## Baseline Windows and Rules

- **Window:** 30 consecutive days minimum; avoid atypical periods (major incidents, holidays, go-lives) or annotate them
- **Source parity:** baseline and pilot metrics come from the same platform reports, same definitions, same filters
- **Segmentation:** capture per-queue and per-team, not just aggregate â€” pilots run on segments
- **Freeze definitions:** metric definitions are written down before the pilot and cannot change mid-flight

## Service Desk Baseline Set

| Metric | Definition Frozen As | Source |
|---|---|---|
| Average handle time | | ITSM / telephony reporting |
| First-contact resolution | | ITSM |
| Reassignment rate | Reassignments Ã· resolved tickets | ITSM |
| After-call work | | Telephony / WFM |
| Abandonment rate | | Telephony |
| Contact volume by channel | | Telephony / ITSM |
| Knowledge-base usage rate | Tickets with KB link Ã· resolved | ITSM |
| Overtime hours | | WFM / payroll |
| Analyst satisfaction | Pre-pilot survey instrument | Survey |

## Contact Center Baseline Set

| Metric | Definition Frozen As | Source |
|---|---|---|
| Average handle time | | CC platform |
| Transfer rate | | CC platform |
| First-contact resolution / repeat-call rate | | CC platform + analytics |
| Average hold time | | CC platform |
| Abandonment rate | | CC platform |
| After-call work | | CC platform / WFM |
| Quality scores | Existing QM rubric, unchanged | QM |
| Time to proficiency | Hire date â†’ target-metric attainment | WFM / training records |
| Agent satisfaction | Pre-pilot survey instrument | Survey |

## Publication

The baseline is published to stakeholders **before** the pilot starts. A baseline nobody saw until after the results is indistinguishable from a baseline fitted to the results.

