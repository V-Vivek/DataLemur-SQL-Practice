/*markdown
### Fill Missing Client Data
Question link: https://datalemur.com/questions/fill-missing-product
*/

WITH num AS
(
SELECT *, 
ROW_NUMBER() OVER(ORDER BY product_id ASC) AS row_num
FROM products
)

SELECT o.product_id,
CASE
WHEN o.category IS NULL THEN 
  (SELECT n.category 
  FROM num AS n 
  WHERE n.row_num < o.row_num AND n.category IS NOT NULL
  ORDER BY n.row_num DESC
  LIMIT 1)
ELSE o.category
END AS category, o.name
FROM num o
;