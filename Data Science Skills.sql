/*markdown
### Data Science Skills
Question Link: https://datalemur.com/questions/matching-skills
*/

SELECT candidate_id
FROM candidates
WHERE skill IN ('Python', 'Tableau', 'PostgreSQL')
GROUP BY candidate_id
HAVING COUNT(*) = 3;