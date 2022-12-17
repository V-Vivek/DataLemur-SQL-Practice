/*markdown
### Pharmacy Analytics (Part 4)
Question link: https://datalemur.com/questions/top-drugs-sold
*/

WITH T1 AS
(
    SELECT 
    manufacturer,
    drug,units_sold,
    ROW_NUMBER() OVER(PARTITION BY manufacturer ORDER BY units_sold DESC ) AS ran
    FROM pharmacy_sales
)

SELECT manufacturer, drug
FROM T1
WHERE ran IN (1,2)
ORDER BY 1;