/*markdown
### International Call Percentage
Question link: https://datalemur.com/questions/international-call-percentage
*/

WITH T1 AS
(
  SELECT c.caller_id, c.receiver_id,
  i.country_id AS c_country,
  pin.country_id AS r_country
  FROM phone_calls c JOIN phone_info i
  ON c.caller_id = i.caller_id
  JOIN phone_info pin
  ON c.receiver_id = pin.caller_id
)

SELECT ROUND
          (
            100.0 * 
            (SELECT COUNT(*) FROM T1 WHERE c_country != r_country)
            /
            (SELECT COUNT(*) FROM T1),1
          ) AS international_calls_pct;
