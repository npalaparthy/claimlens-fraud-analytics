-- ClaimLens | Step 3: inspect schema BEFORE defining predictive features.
-- Run in Google BigQuery SQL editor.
-- Replace/extend the feature selection only after auditing availability at prediction time.

SELECT column_name, data_type, is_nullable
FROM `claimlens-fraud-analytics.claimlens.INFORMATION_SCHEMA.COLUMNS`
WHERE table_name = 'curated_claims'
ORDER BY ordinal_position;

-- Review class balance and missing labels in curated data.
SELECT
  COUNT(*) AS total_claims,
  COUNTIF(fraud_label = 1) AS fraud_claims,
  COUNTIF(fraud_label = 0) AS non_fraud_claims,
  COUNTIF(fraud_label IS NULL) AS missing_labels,
  ROUND(100 * SAFE_DIVIDE(COUNTIF(fraud_label = 1), COUNT(*)), 2) AS fraud_pct
FROM `claimlens-fraud-analytics.claimlens.curated_claims`;

-- TODO after audit: CREATE OR REPLACE TABLE `claimlens-fraud-analytics.claimlens.claim_features` AS ...
-- Important: do not include fraud_label among model predictors.
