-- Problem: Amazon Average Star Rating
-- Difficulty: Easy
-- Concepts: GROUP BY, EXTRACT, AVG, ROUND, ORDER BY
-- Date: Jul 1 2026
-- Mistake: Initially reached for AVG() OVER() window function — not needed here.
--          Also forgot to include EXTRACT(MONTH) in GROUP BY clause.

SELECT 
  EXTRACT(MONTH FROM submit_date) AS mth,
  product_id AS product, 
  ROUND(AVG(stars), 2) AS avg_stars 
FROM reviews
GROUP BY EXTRACT(MONTH FROM submit_date), product_id
ORDER BY mth, product;