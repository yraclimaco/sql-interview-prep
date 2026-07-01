-- Problem: Snapchat Send vs Open Percentage
-- Difficulty: Medium
-- Concepts: CASE WHEN + SUM pivot, LEFT JOIN, GROUP BY, ROUND
-- Date: Jun 27 2026

WITH cte AS (
  SELECT
    age_bucket,
    SUM(CASE WHEN activity_type = 'send' THEN time_spent END) AS total_time_sent,
    SUM(CASE WHEN activity_type = 'open' THEN time_spent END) AS total_time_open,
    SUM(CASE WHEN activity_type IN ('send', 'open') THEN time_spent END) AS total
  FROM activities
  LEFT JOIN age_breakdown ON activities.user_id = age_breakdown.user_id
  GROUP BY age_bucket
)
SELECT
  age_bucket,
  ROUND((total_time_sent / total) * 100.0, 2) AS send_perc,
  ROUND((total_time_open / total) * 100.0, 2) AS open_perc
FROM cte;