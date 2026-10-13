# Project stages

1. **Data foundation**: reconcile local CSV with BigQuery `raw_claims` and `curated_claims`.
2. **Feature audit**: inspect actual schema; document identifiers, label, safe-at-prediction features, and possible post-outcome leakage.
3. **Feature layer**: create `claim_features` in BigQuery with documented transformations and checks.
4. **Baseline**: use Python/scikit-learn Logistic Regression; evaluate with stratified splits if temporal data is inadequate. Explain limitations.
5. **Challenger**: compare XGBoost; document reproducible feature pipeline.
6. **Fraud decisions**: PR-AUC, precision/recall, workload at different thresholds; investigate label bias.
7. **Explanations**: SHAP on held-out claims; do not equate explanations with proof.
8. **Deployment**: first demonstrate local batch scoring; optionally register and deploy via Vertex AI with cost controls.
9. **Operations**: dashboard, monitoring simulations, reproducibility, architecture diagram.

At every stage: business question → implementation → validation → screenshots → Git commit.
