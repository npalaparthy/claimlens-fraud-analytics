# ClaimLens — Explainable Insurance Fraud Analytics

**Portfolio project | Public motor insurance fraud dataset | Educational demonstration**

Build an insurance fraud analytics workflow using BigQuery, Python, scikit-learn, XGBoost, explainability, and optional GCP deployment. This is **not** Definity data or a deployed production system.

## Architecture
`fraud_oracle.csv → BigQuery raw_claims → curated_claims → claim_features → Python training/evaluation → risk scoring → dashboard → optional deployment/monitoring`

## Current status
- Existing work on your Mac: initial EDA notebook, BigQuery raw/curated tables, and SQL 01/02. **Copy those existing files into this starter before publishing.**
- This ZIP contains templates and placeholders, not the previously completed files from your Mac.
- Feature table, training, explainability, dashboard, and deployment are **not yet completed**.

## Get started
1. Extract ZIP and open this folder in VS Code.
2. Put `fraud_oracle.csv` in `data/raw/` (never commit it).
3. Copy your already completed `01_claims_exploration.ipynb`, `sql/01_claims_fraud_analysis.sql`, `sql/02_curate_claims.sql`, and `src/inspect_data.py` from the original folder.
4. Run `git status` in your **existing** project before replacing any files. The safest approach is to copy the new starter files into the original folder, not replace its `.git` history.
5. BigQuery project: `claimlens-fraud-analytics`; dataset: `claimlens`; existing tables: `raw_claims`, `curated_claims`.
6. Start with `sql/03_claim_features.sql` and audit leakage before training.

## Model safety
The `FraudFound_P` label is an outcome, not a prediction-time feature. Some columns may represent post-claim information; audit timing before using them. Uninvestigated or unlabeled claims are not automatically proven legitimate. Use the public data for education only.

## Project stages
- [x] Raw and curated BigQuery tables (completed in original environment)
- [x] Initial pandas EDA (completed in original environment)
- [ ] Copy completed files into this starter
- [ ] Feature availability / leakage audit
- [ ] Model-ready feature table
- [ ] Logistic regression baseline and XGBoost comparison
- [ ] Precision, recall, PR-AUC, capacity-aware thresholds
- [ ] SHAP explainability
- [ ] Versioning, deployment and monitoring demonstration
- [ ] Streamlit dashboard and screenshots

See `docs/PROJECT_PLAN.md` for milestones and `docs/DATA_DICTIONARY.md` for audit instructions.
