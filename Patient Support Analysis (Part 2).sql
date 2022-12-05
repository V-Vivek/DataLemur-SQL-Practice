/*markdown
### Patient Support Analysis (Part 2)
Question link: https://datalemur.com/questions/uncategorized-calls-percentage
*/

SELECT
ROUND 
  (100.0 * 
  (SELECT COUNT(*) FROM callers WHERE call_category IS NULL OR call_category = 'n/a')
  / 
  (SELECT COUNT(*) FROM callers)
  , 1) AS call_percentage;