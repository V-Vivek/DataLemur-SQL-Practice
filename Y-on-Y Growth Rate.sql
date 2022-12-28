/*markdown
### Y-on-Y Growth Rate
Question link: https://datalemur.com/questions/yoy-growth-rate
*/

WITH T1 AS
(
  SELECT EXTRACT(YEAR FROM transaction_date) AS year,
  product_id, spend AS curr_year_spend,
  LAG(spend) OVER(PARTITION BY product_id ORDER BY transaction_date) AS prev_year_spend
  FROM user_transactions
)

SELECT *, 
ROUND(100.0 * (curr_year_spend - prev_year_spend) / prev_year_spend, 2) AS yoy_rate
FROM T1;