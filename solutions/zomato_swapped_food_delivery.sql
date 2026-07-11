-- Problem: Zomato Swapped Food Delivery
-- Difficulty: Medium
-- Concepts: CASE WHEN, modulo odd/even, subquery MAX, edge case handling
-- Date: Jul 11 2026
-- Note: Always check for edge cases — last odd row must stay unchanged.
--       Use subquery MAX(order_id) to identify the last row dynamically.
--       Don't overcomplicate with JOINs when a single CTE SELECT works.

WITH food AS (
  SELECT 
    item,
    CASE 
      WHEN order_id % 2 = 1 AND order_id = (SELECT MAX(order_id) FROM orders) THEN order_id
      WHEN order_id % 2 = 1 THEN order_id + 1
      ELSE order_id - 1
    END AS corrected_order_id
  FROM orders
)
SELECT corrected_order_id, item
FROM food
ORDER BY corrected_order_id;