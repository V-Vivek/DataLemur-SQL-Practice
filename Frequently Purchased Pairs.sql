/*markdown
### Frequently Purchased Pairs
Question link: https://datalemur.com/questions/frequently-purchased-pairs
*/

SELECT (COUNT(*) /2) AS combo_num
FROM
(
  SELECT t1.user_id, t1.product_id, t2.product_id
  FROM transactions t1 CROSS JOIN transactions t2
  WHERE t1.transaction_id = t2.transaction_id AND t1.product_id != t2.product_id
) AS tab

/*markdown
- Used *CROSS JOIN* to get all possible product combinations  
- Divided the count by  to avoid duplicate combinations  
- e.g (apple, banana) and (banana, apple) are same combinations.
*/