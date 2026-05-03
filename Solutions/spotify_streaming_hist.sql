-- CTE that combines song play history from two different sources
WITH all_history AS
(
  -- Get pre-aggregated historical song plays from the songs_history table
  SELECT 
    user_id, 
    song_id, 
    song_plays 
  FROM songs_history
  
  -- Combine with recent weekly data up to August 4, 2022
  UNION ALL
  
  -- Count plays from the weekly streaming logs and aggregate by user and song
  SELECT
    user_id, 
    song_id, 
    count(song_id) song_plays
  FROM songs_weekly
  WHERE DATE(listen_time) <= '2022-08-04'
  GROUP BY user_id, song_id
)

-- Aggregate total plays across both data sources and sort by play count
SELECT 
  user_id, 
  song_id, 
  SUM(song_plays) AS song_plays
FROM all_history
GROUP BY user_id, song_id
ORDER BY song_plays DESC