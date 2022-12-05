/*markdown
### Pharmacy Analytics (Part 2)
Question link: https://datalemur.com/questions/non-profitable-drugs
*/

SELECT manufacturer, COUNT(*) AS drug_count, (SUM(cogs) - SUM(total_sales)) AS total_loss
FROM pharmacy_sales
WHERE cogs > total_sales
GROUP BY manufacturer
ORDER BY 3 DESC;