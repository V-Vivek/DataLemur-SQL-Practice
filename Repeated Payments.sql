/*markdown
### Repeated Payments
Question link: https://datalemur.com/questions/repeated-payments
*/

SELECT COUNT(*) AS payment_count
FROM transactions t1, transactions t2
WHERE t1.merchant_id = t2.merchant_id 
AND t1.credit_card_id = t2.credit_card_id
AND t1.amount = t2.amount
AND t1.transaction_id < t2.transaction_id 
AND DATE(t1.transaction_timestamp) = DATE(t2.transaction_timestamp) 
AND EXTRACT(MINUTE FROM (t2.transaction_timestamp - t1.transaction_timestamp)) < 11
AND EXTRACT(HOUR FROM (t2.transaction_timestamp - t1.transaction_timestamp)) = 0;