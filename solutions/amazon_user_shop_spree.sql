-- Problem: Amazon User Shopping Sprees
-- Difficulty: Medium
-- Concepts: LAG with offset, DISTINCT dedup, date subtraction, consecutive days
-- Date: Jul 9 2026
-- Note: Deduplicate to one row per user per day before applying LAG.
--       In PostgreSQL subtract dates directly — no DATEDIFF function.
--       LAG(col, 2) looks back 2 rows, useful for 3-consecutive-day checks.

WITH cte1 AS (
  SELECT DISTINCT
    user_id,
    transaction_date::date AS purchase_date
  FROM transactions
),
cte2 AS (
  SELECT 
    user_id,
    purchase_date,
    LAG(purchase_date, 1) OVER (PARTITION BY user_id ORDER BY purchase_date) AS prev_date,
    LAG(purchase_date, 2) OVER (PARTITION BY user_id ORDER BY purchase_date) AS prev_date_2
  FROM cte1
)
SELECT DISTINCT user_id
FROM cte2
WHERE purchase_date - prev_date = 1 
  AND purchase_date - prev_date_2 = 2
ORDER BY user_id;