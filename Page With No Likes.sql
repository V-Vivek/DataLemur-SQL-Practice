/*markdown
### Page With No Likes
Question Link: https://datalemur.com/questions/sql-page-with-no-likes
*/

SELECT page_id
FROM pages
WHERE page_id NOT IN (SELECT DISTINCT page_id FROM page_likes)
ORDER BY page_id ASC;

/*markdown
Used subquery in WHERE clause
*/