/*markdown
### App Click-through Rate (CTR)
Question link: https://datalemur.com/questions/click-through-rate
*/

/*markdown
### Solution #1
*/

SELECT e.app_id,
ROUND(
  (100.0 * 
  (SELECT COUNT(event_type) FROM events WHERE app_id = e.app_id AND event_type = 'click' AND EXTRACT(YEAR FROM timestamp) = 2022)
  /
  (SELECT COUNT(event_type) FROM events WHERE app_id = e.app_id AND event_type = 'impression' AND EXTRACT(YEAR FROM timestamp) = 2022))
  , 2) AS ctr
FROM events e
WHERE EXTRACT(YEAR FROM timestamp) = 2022
GROUP BY e.app_id
;

/*markdown
### Solution #2
*/

SELECT
  app_id,
  ROUND(100.0 *
    SUM(CASE WHEN event_type = 'click' THEN 1 ELSE 0 END) /
    SUM(CASE WHEN event_type = 'impression' THEN 1 ELSE 0 END), 2)  AS ctr_rate
FROM events
WHERE timestamp >= '2022-01-01' 
  AND timestamp < '2023-01-01'
GROUP BY app_id;