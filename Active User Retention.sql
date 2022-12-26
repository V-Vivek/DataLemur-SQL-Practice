/*markdown
### Active User Retention
Question link: https://datalemur.com/questions/user-retention
*/

SELECT 7 AS month,
COUNT(DISTINCT user_id) AS monthly_active_users
FROM user_actions
WHERE EXTRACT(MONTH FROM event_date) = 6
AND user_id IN (SELECT DISTINCT user_id
                FROM user_actions
                WHERE EXTRACT(MONTH FROM event_date) = 7
                );