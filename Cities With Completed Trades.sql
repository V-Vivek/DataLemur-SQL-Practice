/*markdown
### Cities With Completed Trades
Question link: https://datalemur.com/questions/completed-trades
*/

SELECT u.city, COUNT(*) AS total_orders
FROM trades t JOIN users u
ON t.user_id = u.user_id AND t.status = 'Completed'
GROUP BY 1
ORDER BY 2 DESC
LIMIT 3
;

/*markdown
- Checked the **Completed** status while joining the two tables
*/