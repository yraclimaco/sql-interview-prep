-- Problem: Microsoft Teams Power Users
-- Difficulty: Easy
-- Concepts: COUNT, GROUP BY, WHERE BETWEEN, ORDER BY DESC, LIMIT
-- Date: Jul 11 2026
-- Note: Use COUNT(*) instead of COUNT(column) when counting rows —
--       COUNT(col) excludes NULLs which can cause undercounting.

SELECT 
  sender_id, 
  COUNT(*) AS message_count 
FROM messages
WHERE sent_date BETWEEN '08/01/2022 00:00:00' AND '08/31/2022 00:00:00'
GROUP BY sender_id
ORDER BY message_count DESC
LIMIT 2;