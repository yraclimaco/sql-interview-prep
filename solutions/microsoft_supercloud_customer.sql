-- Problem: Microsoft Supercloud Customer
-- Difficulty: Medium
-- Concepts: COUNT DISTINCT, LEFT JOIN, GROUP BY, subquery in WHERE
-- Date: Jul 9 2026
-- Note: Use subquery in WHERE to compare against total category count
--       instead of hardcoding the number. ORDER BY inside CTE is redundant.

WITH cte AS (
  SELECT 
    customer_id, 
    COUNT(DISTINCT product_category) AS p_count
  FROM customer_contracts AS c
  LEFT JOIN products AS p ON c.product_id = p.product_id
  GROUP BY customer_id
)
SELECT customer_id 
FROM cte
WHERE p_count = (SELECT COUNT(DISTINCT product_category) FROM products);