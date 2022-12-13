/*markdown
### Highest-Grossing Items
Question link: https://datalemur.com/questions/sql-highest-grossing
*/

WITH ttl AS
(
  SELECT DISTINCT category, product,
  SUM(spend) OVER(PARTITION BY product) AS total_spend
  FROM product_spend
  WHERE EXTRACT(YEAR FROM transaction_date) = 2022
),

ranked AS
(
  SELECT category, product, total_spend, 
  ROW_NUMBER() OVER(PARTITION BY category ORDER BY total_spend DESC) AS rnk
  FROM ttl
)

SELECT category, product, total_spend
FROM ranked
WHERE rnk < 3
ORDER BY category, total_spend DESC;

/*markdown
- Used multiple CTEs
- Used ROW_NUMBER() window function
*/

/*markdown

*/