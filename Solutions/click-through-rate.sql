-- /* preparing data 
-- create table to 
--   - calculate num of clicks per app_id
--   - calculate num of impressions per app_id
-- */

WITH impressions_clicks AS 
(
  SELECT 
    app_id, 
    SUM(CASE WHEN event_type = 'click' THEN 1 ELSE 0 END) clicks_num,
    SUM(CASE WHEN event_type = 'impression' THEN 1 ELSE 0 END) impression_num
  FROM events
  WHERE EXTRACT(YEAR FROM timestamp) = 2022
  GROUP BY app_id
)


SELECT 
  app_id, 
  ROUND((100.0 * clicks_num / impression_num), 2) AS ctr
FROM impressions_clicks