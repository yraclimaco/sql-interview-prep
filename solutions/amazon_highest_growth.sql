-- Problem: Amazon Highest Grossing Items
-- Difficulty: Medium
-- Concepts: RANK, PARTITION BY, SUM, GROUP BY, WHERE date filter, CTE
-- Date: Jul 2 2026
-- Mistakes: 1) Forgot to SUM spend before ranking — ranked individual 
--              transactions instead of total spend per product.
--           2) Missing year filter — summing across all years inflated totals.

WITH cte AS (
  SELECT 
    category,
    product, 
    SUM(spend) AS total_spend,
    RANK() OVER (PARTITION BY category ORDER BY SUM(spend) DESC) AS ranking
  FROM product_spend
  WHERE EXTRACT(YEAR FROM transaction_date) = 2022
  GROUP BY category, product
)
SELECT category, product, total_spend 
FROM cte
WHERE ranking <= 2;