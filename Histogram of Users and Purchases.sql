/*markdown
### Histogram of Users and Purchases
Question link: https://datalemur.com/questions/histogram-users-purchases
*/

WITH T1 AS
(
  SELECT user_id, MAX(DATE(transaction_date)) AS max_date
  FROM user_transactions
  GROUP BY 1
)


SELECT u.transaction_date, u.user_id, COUNT(*)
FROM user_transactions u JOIN T1
ON DATE(u.transaction_date) = T1.max_date AND u.user_id = T1.user_id
GROUP BY 1, 2
;