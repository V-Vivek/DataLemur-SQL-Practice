/*markdown
### User's Third Transaction
Question Link: https://datalemur.com/questions/sql-third-transaction
*/

SELECT user_id, spend, transaction_date
FROM
    (SELECT *,
    ROW_NUMBER() OVER(PARTITION BY user_id ORDER BY transaction_date ASC) AS RN
    FROM transactions
    )AS TAB
WHERE RN = 3;

/*markdown
Used *ROW_NUMBER()* window function to identify the 3rd transaction
*/