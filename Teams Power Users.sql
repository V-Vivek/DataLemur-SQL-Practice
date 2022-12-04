/*markdown
### Teams Power Users
Question link: https://datalemur.com/questions/teams-power-users
*/

SELECT sender_id, COUNT(*) AS message_count
FROM messages
WHERE EXTRACT(MONTH FROM sent_date) = 8 AND EXTRACT(YEAR FROM sent_date) = 2022
GROUP BY sender_id
ORDER BY 2 DESC
LIMIT 2;

/*markdown
- Used EXTRACT() to check the ***month*** and ***year***
*/