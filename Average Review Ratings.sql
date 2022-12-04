/*markdown
### Average Review Ratings
Question link: https://datalemur.com/questions/sql-avg-review-ratings
*/

SELECT EXTRACT(MONTH FROM submit_date) AS mth, product_id AS product, ROUND(AVG(stars), 2) AS avg_stars
FROM reviews
GROUP BY 1, 2
ORDER BY 1 ASC, 2 ASC
;