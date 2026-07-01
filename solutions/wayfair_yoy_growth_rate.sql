-- Problem: Wayfair Year-on-Year Growth Rate
-- Difficulty: Hard
-- Concepts: CTE, LAG, PARTITION BY, GROUP BY, ROUND
-- Date: Jun 26 2026

WITH cte AS (
  SELECT
    EXTRACT(YEAR FROM transaction_date) AS year,
    product_id,
    SUM(spend) AS curr_year_spend
  FROM user_transactions
  GROUP BY product_id, EXTRACT(YEAR FROM transaction_date)
),
cte2 AS (
  SELECT
    year,
    product_id,
    curr_year_spend,
    LAG(curr_year_spend) OVER (PARTITION BY product_id ORDER BY year) AS prev_year_spend
  FROM cte
)
SELECT
  year,
  product_id,
  curr_year_spend,
  prev_year_spend,
  ROUND(((curr_year_spend - prev_year_spend) / prev_year_spend) * 100.0, 2) AS yoy_rate
FROM cte2;