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
| 7 | LinkedIn Top 3 Salary by Department | Medium | DENSE_RANK, PARTITION BY, LEFT JOIN, ORDER BY | 0 | Jul 4 |
| 8 | TikTok Signup Activation Rate | Medium | LEFT JOIN, SUM CASE WHEN, COUNT DISTINCT, integer division fix | 0 | Jul 4 |
| 9 | Amazon Best Selling Product | Medium | ROW_NUMBER, PARTITION BY, ORDER BY DESC, LEFT JOIN, tie-breaking | 1 | Jul 7 |
| 10 | Amazon User Shopping Sprees | Medium | LAG offset, DISTINCT dedup, date subtraction, consecutive days pattern | 1 | Jul 9 |
| 11 | Microsoft Supercloud Customer | Medium | COUNT DISTINCT, LEFT JOIN, GROUP BY, subquery in WHERE | 0 | Jul 9 |
| 12 | Zomato Swapped Food Delivery | Medium | CASE WHEN, modulo odd/even, subquery MAX, edge case handling | 1 | Jul 11 |
| 13 | Microsoft Teams Power Users | Easy | COUNT, GROUP BY, WHERE BETWEEN, ORDER BY DESC, LIMIT | 0 | Jul 11 |

## Mistake Patterns
- Trailing comma before FROM — scan SELECT list before running
- Can't reference window function alias in same SELECT — wrap in second CTE
- Chain multiple CTEs with comma under single WITH, not two WITH keywords
- RANK() vs ROW_NUMBER() on tie-breaking — if dates can duplicate per user, RANK() returns multiple rank 1 rows. Mention edge case in interviews.
- Reached for window function when GROUP BY was enough — before using AVG() OVER(), ask: do I need individual rows or aggregated groups? If aggregated, GROUP BY wins.
- Missing column in GROUP BY — every column in SELECT that isn't aggregated must appear in GROUP BY. Scan SELECT list top to bottom before running.
- When totals don't match expected output but structure is correct — check for a date filter. Problems are often scoped to a specific year/month.
- Always SUM before RANK when question asks for top N by total — rank individual rows only when data is already at the right granularity.
- Missing DESC on ORDER BY in window functions — always ask: do I want highest or lowest first? Default is ascending. For top N problems always add DESC.
- DATE_TRUNC not EXTRACT(DAY) for date grouping — EXTRACT pulls day number only, DATE_TRUNC truncates to midnight of full date.
- Integer division returns 0 for fractions — multiply by 1.0 or cast to decimal.
- Denominator in rate calculations must count distinct entities not total rows — duplicate rows from JOINs inflate the count.
- Edge case handling — always ask: what happens to the last row, first row, or NULL values? Handle boundary conditions with subquery MAX/MIN or COALESCE.
- Don't overcomplicate with JOINs when a single CTE SELECT works — if you already have the data in a CTE, SELECT from it directly.

## Concepts Drilled
- Window functions: LAG, RANK, DENSE_RANK, ROW_NUMBER, PARTITION BY, ORDER BY
- CTE chaining: comma-separate under single WITH
- CASE WHEN inside SUM for pivoting activity types
- Integer division fix: multiply by 1.0 not 100
- GROUP BY vs window functions: GROUP BY collapses rows, window functions keep them
- EXTRACT for date parts: month, year
- DATE_TRUNC for full date grouping
- DENSE_RANK vs RANK: DENSE_RANK does not skip ranks after ties
- COUNT DISTINCT for accurate denominators in rate calculations
- Tie-breaking in window functions: list metrics in priority order, all DESC
- LAG with offset: LAG(col, 2) looks back 2 rows — use for consecutive day patterns. Always deduplicate by day first.
- PostgreSQL date subtraction: date - date returns integer days directly, no DATEDIFF needed.
- Modulo for odd/even: order_id % 2 = 1 is odd, % 2 = 0 is even
- Subquery in WHERE clause: use to dynamically compare against an aggregate instead of hardcoding a value.
- Subquery MAX for edge cases: (SELECT MAX(col) FROM table) inside CASE WHEN handles boundary conditions dynamically.

## Consecutive Days Pattern
1. DISTINCT to deduplicate by user + day
2. LAG(date, N-1) to look back N-1 rows
3. WHERE current_date - lag_date = N-1

## Pre-Run Checklist
Before hitting run on any query:
1. Does every SELECT column appear in GROUP BY or have an aggregate function?
2. Is there a trailing comma before FROM?
3. Am I referencing a window function alias in the same SELECT? If so, wrap in CTE.
4. Is my denominator counting distinct entities or total rows?
5. Am I dividing two integers that produce a fraction? If so, multiply by 1.0.
6. Does my ORDER BY have DESC for top N problems?
7. Have I handled edge cases — last row, first row, NULLs?