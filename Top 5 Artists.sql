/*markdown
### Top 5 Artists
Question Link: https://datalemur.com/questions/top-fans-rank
*/

WITH ranked_artists AS
    (
    SELECT a.artist_name,
    DENSE_RANK() OVER(ORDER BY COUNT(*) DESC) AS artist_rank
    FROM artists a JOIN songs s
    ON a.artist_id = s.artist_id
    JOIN global_song_rank g
    ON g.song_id = s.song_id AND g.rank < 11
    GROUP BY a.artist_name
    )

SELECT * 
FROM ranked_artists
WHERE artist_rank < 6;

/*markdown
Used ***DENSE_RANK()*** from window functions along with CTE
*/