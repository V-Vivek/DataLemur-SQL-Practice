/*markdown
### Mean, Median, Mode
Question link: https://datalemur.com/questions/mean-median-mode
*/

WITH mode1 AS
(
  SELECT email_count AS mode
  FROM inbox_stats
  GROUP BY email_count
  ORDER BY COUNT(*) DESC
  LIMIT 1
)

SELECT ROUND(AVG(email_count)) AS mean,
PERCENTILE_CONT(0.5) WITHIN GROUP(ORDER BY email_count) AS median,
mode1.mode
FROM inbox_stats JOIN mode1 ON 1=1
GROUP BY mode1.mode;

/*markdown
- PERCENTILE_CONT()
    - To get the percentile of the data
- WITHIN GROUP()
    - It created a group of the Table column so that it can be serialized in order specified, which is further used by PERCENTILE_CONT()

*/

/*markdown

*/