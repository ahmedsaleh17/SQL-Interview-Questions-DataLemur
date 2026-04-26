-- Calculate the average rating for each product by month
select 
  -- Extract the month from the submit_date timestamp
  EXTRACT(month from submit_date) as mth,
  product_id, 
  round(avg(stars),2) avg_stars
from reviews 
group by 
  EXTRACT(month from submit_date),
  product_id
-- Sort results by month first, then product ID for easy reading
ORDER BY 
  mth, product_id