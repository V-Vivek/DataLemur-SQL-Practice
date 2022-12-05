/*markdown
### Second Day Confirmation
Question link: https://datalemur.com/questions/second-day-confirmation
*/

/*markdown
#### Solution #1
*/

SELECT e.user_id
FROM texts t JOIN emails e
ON 
    t.email_id = e.email_id 
    AND (EXTRACT (DAY FROM signup_date) - EXTRACT (DAY FROM action_date)) = -1 
    AND signup_action = 'Confirmed'
;

/*markdown
#### Solution #2
*/

SELECT e.user_id
FROM texts t JOIN emails e
ON 
    t.email_id = e.email_id 
    AND t.action_date = e.signup_date + INTERVAL '1 day'
    AND signup_action = 'Confirmed'
;