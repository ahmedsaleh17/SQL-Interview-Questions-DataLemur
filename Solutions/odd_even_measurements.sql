-- CTE to rank measurements by time within each day
WITH RANK_measurements AS
(
  SELECT date_trunc('day', measurement_time) AS measurement_day,
  measurement_value, 
  ROW_NUMBER() OVER(PARTITION BY date_trunc('day', measurement_time) ORDER BY measurement_time) AS RN
  FROM measurements

)

-- Main query that groups measurements by day and separates odd/even row sums
SELECT 
  measurement_day ,
  -- Sum measurements at odd positions (1st, 3rd, 5th, etc.) within each day
  SUM(CASE WHEN RN % 2 != 0 THEN measurement_value END) odd_sum, 
  -- Sum measurements at even positions (2nd, 4th, 6th, etc.) within each day
  SUM(CASE WHEN RN % 2 = 0 THEN measurement_value END) even_sum
FROM RANK_measurements
GROUP BY measurement_day