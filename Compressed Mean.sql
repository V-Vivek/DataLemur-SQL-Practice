/*markdown
### Compressed Mean
Question link: https://datalemur.com/questions/alibaba-compressed-mean
*/

SELECT
ROUND(SUM(item_count * order_occurrences) * 1.0 / SUM(order_occurrences), 1) AS mean
FROM items_per_order
;

/*markdown
item_count	order_occurrences  
1	        500  
2	        1000  
3	        800  
4	        1000  

### Explanation
Let's calculate the arithmetic average:

Total items = (1*500) + (2*1000) + (3*800) + (4*1000) = 8900

Total orders = 500 + 1000 + 800 + 1000 = 3300

Mean = 8900 / 3300 = 2.7
*/