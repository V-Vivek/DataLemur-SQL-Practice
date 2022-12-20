/*markdown
### Odd and Even Measurements
Question link: https://datalemur.com/questions/odd-even-measurements
*/

WITH T1 AS
(
  SELECT DATE(measurement_time) AS measurement_day,measurement_value,
  ROW_NUMBER() OVER(PARTITION BY DATE(measurement_time) ORDER BY measurement_time) AS rw,
  measurement_time
  FROM measurements
)

SELECT measurement_day,
(SELECT 
    SUM(measurement_value) 
    FROM T1 AS T2 
    WHERE rw%2!=0 AND T1.measurement_day = T2.measurement_day 
    GROUP BY measurement_day
) AS odd_sum,
(SELECT 
    SUM(measurement_value) 
    FROM T1 AS T2 
    WHERE rw%2=0 AND T1.measurement_day = T2.measurement_day 
    GROUP BY measurement_day
) AS even_sum
FROM T1
GROUP BY 1
ORDER BY 1;

/*markdown
- Used sub-query in SELECT statement
*/