/*markdown
### Duplicate Job Listings
Question link: https://datalemur.com/questions/duplicate-job-listings
*/

SELECT COUNT(*)
FROM
(
  SELECT COUNT(*)
  FROM job_listings
  GROUP BY company_id, title, description
  HAVING COUNT(*) > 1
) AS T1;