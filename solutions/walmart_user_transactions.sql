-- Problem: Walmart User Transactions
-- Difficulty: Medium
-- Concepts: RANK, PARTITION BY, ORDER BY, GROUP BY, COUNT
-- Date: Jun 30 2026

WITH cte AS (
  SELECT
    user_id,
    transaction_date,
    RANK() OVER (PARTITION BY user_id ORDER BY transaction_date DESC) AS rank
  FROM user_transactions
)
SELECT
  transaction_date,
  user_id,
  COUNT(user_id) AS purchase_count
FROM cte
WHERE rank = 1
GROUP BY user_id, transaction_date
ORDER BY transaction_date;