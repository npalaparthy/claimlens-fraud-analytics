
-- ======================================================
-- PROJECT: ClaimLens - Insurance Fraud Analytics
-- FILE: 01_claims_fraud_analysis.sql
-- PLATFORM: Google BigQuery
-- PURPOSE: Exploratory Data Analysis (EDA)
-- ======================================================


-- QUERY 1: Overall Insurance Fraud Distribution
-- Business Question:
-- How many claims do we have?
-- How many are fraudulent versus legitimate?
-- What is the overall fraud rate?

SELECT
    COUNT(*) AS total_claims,

    COUNTIF(
        SAFE_CAST(FraudFound_P AS INT64) = 1
    ) AS fraud_claims,

    COUNTIF(
        SAFE_CAST(FraudFound_P AS INT64) = 0
    ) AS legitimate_claims,

    ROUND(
        100 * SAFE_DIVIDE(
            COUNTIF(SAFE_CAST(FraudFound_P AS INT64) = 1),
            COUNT(*)
        ),
        2
    ) AS fraud_rate

FROM `claimlens-fraud-analytics.claimlens.raw_claims`;


-- QUERY 2: Fraud Distribution by Accident Area
-- Business Question:
-- Are fraud rates different between urban and rural claims?

SELECT
    AccidentArea AS accident_area,

    COUNT(*) AS total_claims,

    COUNTIF(
        SAFE_CAST(FraudFound_P AS INT64) = 1
    ) AS fraud_claims,

    ROUND(
        100 * SAFE_DIVIDE(
            COUNTIF(SAFE_CAST(FraudFound_P AS INT64) = 1),
            COUNT(*)
        ),
        2
    ) AS fraud_rate

FROM `claimlens-fraud-analytics.claimlens.raw_claims`

GROUP BY AccidentArea

ORDER BY fraud_rate DESC;
