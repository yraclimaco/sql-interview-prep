-- Problem: Google Odd and Even Measurements
-- Difficulty: Medium
-- Concepts: ROW_NUMBER, DATE_TRUNC, PARTITION BY, CASE WHEN + SUM pivot, GROUP BY
-- Date: Jul 3 2026
-- Note: Use DATE_TRUNC not EXTRACT(DAY) for date grouping.
--       Alias row_number as row_num — row_number is a reserved word.

WITH cte AS (
  SELECT 
    measurement_value, 
    DATE_TRUNC('day', measurement_time) AS measurement_day,
    ROW_NUMBER() OVER(
      PARTITION BY DATE_TRUNC('day', measurement_time) 
      ORDER BY measurement_time
    ) AS row_num
  FROM measurements
)
SELECT 
  measurement_day, 
  SUM(CASE WHEN row_num % 2 = 1 THEN measurement_value END) AS odd_sum,
  SUM(CASE WHEN row_num % 2 = 0 THEN measurement_value END) AS even_sum
FROM cte
GROUP BY measurement_day;