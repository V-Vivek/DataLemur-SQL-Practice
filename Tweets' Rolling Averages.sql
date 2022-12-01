/*markdown
### Tweets' Rolling Averages
Question Link: https://datalemur.com/questions/rolling-average-tweets
*/

WITH tweet_count AS
    (
    SELECT user_id, tweet_date, COUNT(*) AS tweets
    FROM tweets
    GROUP BY user_id, tweet_date
    ORDER BY user_id, tweet_date
    )

SELECT user_id, tweet_date,
ROUND(AVG(tweets) OVER(PARTITION BY user_id ROWS BETWEEN 2 PRECEDING AND CURRENT ROW), 2) AS rolling_avg_3days
FROM tweet_count;

/*markdown
Used **Sliding Window** concepts to calculate running averages
*/