/*markdown
### Pharmacy Analytics (Part 3)
Question link: https://datalemur.com/questions/total-drugs-sales
*/

/*markdown
#### Solution #1: Using CTE
*/

WITH sales_cte AS
(
SELECT manufacturer, ROUND(SUM(total_sales)/ 1000000) AS ttl_sales
FROM pharmacy_sales
GROUP BY manufacturer
ORDER BY 2 DESC
)

SELECT manufacturer, CONCAT('$', ttl_sales, ' million') AS sales
FROM sales_cte;

/*markdown
#### Solution #2: Using condition in ORDER BY
*/

SELECT manufacturer, CONCAT('$', ROUND(SUM(total_sales)/ 1000000), ' million') AS sales
FROM pharmacy_sales
GROUP BY manufacturer
ORDER BY SUM(total_sales) DESC;