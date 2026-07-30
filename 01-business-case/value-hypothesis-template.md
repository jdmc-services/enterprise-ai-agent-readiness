# Value Hypothesis Template

A value hypothesis is a falsifiable claim: specific metrics, specific deltas, a specific window, measured from a specific baseline. If the pilot cannot prove it false, it cannot prove it true either.

## The Hypothesis Statement

> If we deploy **[capability]** for **[population]**, then **[metric(s)]** will improve by **[quantified delta]** within **[window]**, measured against the 30-day baseline from **[source]**, without degrading **[protected metric â€” e.g., quality scores]**.

Every bracket must be filled. "Improve efficiency" is not a hypothesis; "reduce after-call work by 20% for the pilot queue in 60 days without quality degradation" is.

## Supporting Detail

| Field | Entry |
|---|---|
| Primary metric and current baseline value | |
| Secondary metrics | |
| Protected metrics (must not degrade) | |
| Benefit mechanism â€” *why* would the agent move this metric? | |
| Annualized value if the hypothesis holds (per [ROI model](../05-measurement/roi-model.md)) | |
| Confidence level and biggest assumption | |

## Falsification Conditions

State in advance what result would mean the hypothesis failed:

- Primary metric moves less than: ___
- Protected metric degrades by more than: ___
- Adoption below: ___

Writing these down before the pilot is what separates measurement from marketing.

