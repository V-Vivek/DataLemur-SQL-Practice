/*markdown
### Spotify Streaming History
Question link: https://datalemur.com/questions/spotify-streaming-history
*/

WITH weekly AS
(
  SELECT user_id, song_id, COUNT(song_id) AS song_plays
  FROM songs_weekly
  WHERE EXTRACT(DAY FROM listen_time) < 5
  GROUP BY song_id, user_id
),

united AS
(
  SELECT user_id, song_id, song_plays
  FROM songs_history
  UNION ALL
  SELECT user_id, song_id, song_plays
  FROM weekly
)

SELECT user_id, song_id, SUM(song_plays) AS song_plays
FROM united
GROUP BY user_id, song_id
ORDER BY 3 DESC;