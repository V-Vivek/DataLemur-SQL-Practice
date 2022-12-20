/*markdown
### Supercloud Customer
Question: https://datalemur.com/questions/supercloud-customer
*/

SELECT customer_id
FROM customer_contracts c JOIN products p
ON c.product_id = p.product_id
GROUP BY customer_id
HAVING COUNT(DISTINCT product_category) = 3;