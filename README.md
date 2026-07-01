# SQL Interview Prep
Practicing DataLemur problems daily targeting product analytics internships (Summer 2027).

## Problem Log

| # | Problem | Difficulty | Concepts | Hints | Date |
|---|---------|-----------|----------|-------|------|
| 1 | Wayfair YoY Growth Rate | Hard | LAG, CTE, PARTITION BY, GROUP BY | 0 | Jun 26 |
| 2 | Snapchat Send vs Open Percentage | Medium | CASE WHEN + SUM pivot, LEFT JOIN, GROUP BY, ROUND | 0 | Jun 27 |
| 3 | Walmart User Transactions | Medium | RANK, PARTITION BY, GROUP BY, ORDER BY | 0 | Jun 30 |

## Mistake Patterns
- Trailing comma before FROM — scan SELECT list before running
- Can't reference window function alias in same SELECT — wrap in second CTE
- Chain multiple CTEs with comma under single WITH, not two WITH keywords
- RANK() vs ROW_NUMBER() on tie-breaking — if dates can duplicate per user, 
  RANK() returns multiple rank 1 rows. Mention edge case in interviews.

## Concepts Drilled
- Window functions: LAG, PARTITION BY, ORDER BY
- CTE chaining: comma-separate under single WITH
- CASE WHEN inside SUM for pivoting activity types
- Integer division fix: multiply by 100.0 not 100
