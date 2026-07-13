-- Problem: Facebook Average Post Hiatus
-- Difficulty: Easy
-- Concepts: MAX/MIN date subtraction, EXTRACT, GROUP BY, HAVING COUNT
-- Date: Jul 11 2026
-- Mistake: Tried DATEDIFF — does not exist in PostgreSQL.
--          Use timestamp::date - timestamp::date for integer days instead.

SELECT
  user_id,
  (MAX(post_date)::date - MIN(post_date)::date) AS days_between
FROM posts
WHERE EXTRACT(YEAR FROM post_date) = 2021
GROUP BY user_id
HAVING COUNT(post_id) >= 2;