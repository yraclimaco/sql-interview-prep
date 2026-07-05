-- Problem: LinkedIn Top 3 Salary by Department
-- Difficulty: Medium
-- Concepts: DENSE_RANK, PARTITION BY, LEFT JOIN, ORDER BY
-- Date: Jul 4 2026
-- Note: Use DENSE_RANK not RANK when duplicates should not skip ranks.
--       RANK skips numbers after ties, DENSE_RANK does not.

WITH cte AS (
  SELECT 
    department_name,
    name,
    salary,
    DENSE_RANK() OVER(PARTITION BY department_name ORDER BY salary DESC) AS ranking
  FROM employee AS e
  LEFT JOIN department AS d ON d.department_id = e.department_id
)
SELECT department_name, name, salary 
FROM cte
WHERE ranking < 4
ORDER BY department_name, salary DESC, name;