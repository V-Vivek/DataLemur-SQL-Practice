/*markdown
### Patient Support Analysis (Part 1)
Question link: https://datalemur.com/questions/frequent-callers
*/

WITH member AS
(
  SELECT COUNT(DISTINCT policy_holder_id) AS callers_id
  FROM callers
  GROUP BY policy_holder_id
  HAVING COUNT(policy_holder_id) > 2
)

SELECT SUM(callers_id) AS member_count
FROM member;