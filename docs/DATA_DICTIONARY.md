# Data dictionary and leakage audit

**Do not guess the schema.** Query BigQuery `INFORMATION_SCHEMA.COLUMNS` to enumerate actual fields, types, and nullability. For each field record:

| Column | Meaning | Available when claim is scored? | Keep / exclude / investigate | Reason |
|---|---|---|---|---|
| `FraudFound_P` | Historical outcome label | No | Label only | Outcome must never be an input |

Check whether investigation, settlement, payment, or claim lifecycle fields are known only after the prediction timestamp. If timestamps are missing, document the assumption and avoid claiming true point-in-time validation.
