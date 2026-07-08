-- Problem: TikTok Signup Activation Rate
-- Difficulty: Easy
-- Concepts: LEFT JOIN, SUM CASE WHEN, COUNT DISTINCT, integer division fix
-- Date: Jul 6 2026
-- Mistake: Integer division returns 0 for fractions — multiply by 1.0.
--          Denominator must count distinct emails not total rows.

WITH cte AS (
  SELECT 
    SUM(CASE WHEN signup_action = 'Confirmed' THEN 1 END) AS confirm_total,
    COUNT(DISTINCT e.email_id) AS total
  FROM emails AS e
  LEFT JOIN texts AS t ON e.email_id = t.email_id
)
SELECT ROUND(confirm_total * 1.0 / total, 2) AS confirm_rate
FROM cte;