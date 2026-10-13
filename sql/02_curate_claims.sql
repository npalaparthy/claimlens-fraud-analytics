
-- ======================================================
-- PROJECT: ClaimLens - Insurance Fraud Analytics
-- FILE: 02_curate_claims.sql
-- PLATFORM: Google BigQuery
-- PURPOSE: Data Validation and Curation
-- ======================================================


-- STEP 1: Check incoming data quality
-- Business Question:
-- Are there missing or invalid fraud labels?
-- Are accident area values missing?

SELECT
    COUNT(*) AS total_records,

    COUNTIF(
        FraudFound_P IS NULL
    ) AS missing_fraud_labels,

    COUNTIF(
        FraudFound_P IS NOT NULL
        AND (
            SAFE_CAST(FraudFound_P AS INT64) IS NULL
            OR SAFE_CAST(FraudFound_P AS INT64) NOT IN (0, 1)
        )
    ) AS invalid_fraud_labels,

    COUNTIF(
        AccidentArea IS NULL
        OR TRIM(CAST(AccidentArea AS STRING)) = ''
    ) AS missing_accident_area

FROM `claimlens-fraud-analytics.claimlens.raw_claims`;


-- STEP 2: Create Curated Claims Table
-- Business Requirement:
-- Standardize fraud labels and accident area.
-- Preserve all remaining raw columns.
-- Run only after reviewing validation results.

CREATE OR REPLACE TABLE
    `claimlens-fraud-analytics.claimlens.curated_claims`

AS

SELECT
    * EXCEPT(FraudFound_P, AccidentArea),

    SAFE_CAST(
        FraudFound_P AS INT64
    ) AS fraud_label,

    NULLIF(
        TRIM(CAST(AccidentArea AS STRING)),
        ''
    ) AS accident_area

FROM `claimlens-fraud-analytics.claimlens.raw_claims`;


-- STEP 3: Validate Curated Table
-- Business Requirement:
-- Verify totals after transformation.

SELECT
    COUNT(*) AS total_claims,

    COUNTIF(
        fraud_label = 1
    ) AS fraud_claims,

    COUNTIF(
        fraud_label = 0
    ) AS legitimate_claims,

    COUNTIF(
        fraud_label IS NULL
    ) AS missing_fraud_labels,

    COUNTIF(
        accident_area IS NULL
    ) AS missing_accident_area

FROM `claimlens-fraud-analytics.claimlens.curated_claims`;
