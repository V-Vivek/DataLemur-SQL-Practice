/*markdown
### Compressed Mode
Question link: https://datalemur.com/questions/alibaba-compressed-mode
*/

SELECT item_count mode
FROM items_per_order
WHERE order_occurrences =(SELECT MAX(order_occurrences)
FROM items_per_order);