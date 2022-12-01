/*markdown
### Sending vs. Opening Snaps
Question link: https://datalemur.com/questions/time-spent-snaps
*/

WITH total_time AS
    (
    SELECT age_bucket, SUM(time_spent) AS total
    FROM activities a
    JOIN age_breakdown ab
    ON a.user_id = ab.user_id
    WHERE activity_type IN ('open', 'send')
    GROUP BY age_bucket
    ),

send_time AS
    (
    SELECT age_bucket, SUM(time_spent) AS send
    FROM activities a
    JOIN age_breakdown ab
    ON a.user_id = ab.user_id
    WHERE activity_type = 'send'
    GROUP BY age_bucket
    ),

open_time AS
    (
    SELECT age_bucket, SUM(time_spent) AS open
    FROM activities a
    JOIN age_breakdown ab
    ON a.user_id = ab.user_id
    WHERE activity_type = 'open'
    GROUP BY age_bucket
    )

SELECT t.age_bucket,
ROUND((s.send/t.total)*100.0, 2) AS send_perc,
ROUND((o.open/t.total)*100.0, 2) AS open_perc
FROM total_time t
JOIN send_time s
ON t.age_bucket = s.age_bucket
JOIN open_time o
ON o.age_bucket = s.age_bucket
;

/*markdown
Used multiple **CTEs** & multiple **JOINS**
*/