/*markdown
### Average Post Hiatus (Part 1)
Question link: https://datalemur.com/questions/sql-average-post-hiatus-1
*/

SELECT user_id, (MAX(DATE(post_date)) - MIN(DATE(post_date))) AS days_between
FROM posts
WHERE EXTRACT(YEAR FROM post_date) = 2021
GROUP BY user_id
HAVING COUNT(post_id)>1
;

/*markdown
- Used DATE() function to extract ***date*** from timestamp
- Used EXTRACT() function to extract ***year*** from timestamp
*/