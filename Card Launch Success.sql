/*markdown
### Card Launch Success
Question link: https://datalemur.com/questions/card-launch-success
*/

WITH T1 AS
(
    SELECT 
    card_name, issued_amount, issue_month,issue_year,
    ROW_NUMBER() OVER(PARTITION BY card_name ORDER BY issue_year, issue_month) AS ran
    FROM monthly_cards_issued
)

SELECT
card_name, issued_amount
FROM T1
WHERE ran = 1
ORDER BY issued_amount DESC;