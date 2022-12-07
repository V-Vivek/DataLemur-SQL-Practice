/*markdown
### Signup Activation Rate
Question link: https://datalemur.com/questions/signup-confirmation-rate
*/

SELECT
ROUND(1.0 * COUNT(t.email_id) / COUNT(e.email_id),2)
FROM emails e
LEFT JOIN texts t
ON e.email_id = t.email_id
AND t.signup_action='Confirmed'
;