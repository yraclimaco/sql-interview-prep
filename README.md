# SQL Interview Prep
Practicing DataLemur problems daily targeting product analytics internships (Summer 2027).

## Problem Log

| # | Problem | Difficulty | Concepts | Hints | Date |
|---|---------|-----------|----------|-------|------|
| 1 | Wayfair YoY Growth Rate | Hard | LAG, CTE, PARTITION BY, GROUP BY | 0 | Jun 26 |
| 2 | Snapchat Send vs Open Percentage | Medium | CASE WHEN + SUM pivot, LEFT JOIN, GROUP BY, ROUND | 0 | Jun 27 |
| 3 | Walmart User Transactions | Medium | RANK, PARTITION BY, GROUP BY, ORDER BY | 0 | Jun 30 |
| 4 | Amazon Average Star Rating | Easy | GROUP BY, EXTRACT, AVG, ROUND, ORDER BY | 0 | Jul 1 |
| 5 | Amazon Highest Grossing Items | Medium | RANK, PARTITION BY, SUM, GROUP BY, WHERE date filter | 2 | Jul 2 |
| 6 | Google Odd and Even Measurements | Medium | ROW_NUMBER, DATE_TRUNC, PARTITION BY, CASE WHEN + SUM pivot, GROUP BY | 0 | Jul 3 |

## Mistake Patterns
- Trailing comma before FROM — scan SELECT list before running
- Can't reference window function alias in same SELECT — wrap in second CTE
- Chain multiple CTEs with comma under single WITH, not two WITH keywords
- RANK() vs ROW_NUMBER() on tie-breaking — if dates can duplicate per user,
  RANK() returns multiple rank 1 rows. Mention edge case in interviews.
- Reached for window function when GROUP BY was enough — before using AVG() OVER(),
  ask: do I need individual rows or aggregated groups? If aggregated, GROUP BY wins.
- Missing column in GROUP BY — every column in SELECT that isn't aggregated
  must appear in GROUP BY. Scan SELECT list top to bottom before running
  and ask: is this aggregated? If not, it needs to be in GROUP BY.
- When totals don't match expected output but structure is correct — check for 
  a date filter. Problems are often scoped to a specific year/month.
- Always SUM before RANK when question asks for "top N by total" 

— rank individual rows only when data is already at the right granularity.

## Concepts Drilled
- Window functions: LAG, RANK, PARTITION BY, ORDER BY
- CTE chaining: comma-separate under single WITH
- CASE WHEN inside SUM for pivoting activity types
- Integer division fix: multiply by 100.0 not 100
- GROUP BY vs window functions: GROUP BY collapses rows, window functions keep them
- EXTRACT for date parts: month, year
- DATE_TRUNC('day', timestamp) — truncates timestamp to midnight, 
  use instead of EXTRACT(DAY) when you need full date grouping
- ROW_NUMBER to rank positions within a group, then % 2 to 
  separate odd/even positions


## Pre-Run Checklist
Before hitting run on any query:
1. Does every SELECT column appear in GROUP BY or have an aggregate function?
2. Is there a trailing comma before FROM?
3. Am I referencing a window function alias in the same SELECT? If so, wrap in CTE.