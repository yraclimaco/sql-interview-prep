-- Problem: Amazon Best Selling Product
-- Difficulty: Medium
-- Concepts: ROW_NUMBER, PARTITION BY, ORDER BY DESC, LEFT JOIN, tie-breaking
-- Date: Jul 7 2026
-- Mistake: Missing DESC on ORDER BY — without it SQL ranks lowest first.
--          Tie-breaking: order by primary metric first, secondary second, both DESC.

WITH cte AS (
  SELECT 
    category_name, 
    product_name, 
    ROW_NUMBER() OVER(
      PARTITION BY category_name 
      ORDER BY sales_quantity DESC, rating DESC
    ) AS ranking
  FROM products
  LEFT JOIN product_sales ON product_sales.product_id = products.product_id
)
SELECT category_name, product_name
FROM cte
WHERE ranking = 1;