-- Display customer_id 
SELECT
  customer_id
FROM customer_contracts C 
JOIN products p 
ON C.product_id = p.product_id 
GROUP BY customer_id
-- filter groups based on the number of unique categories
HAVING COUNT(product_category) = (

  -- Count the number of unique categories to filter
  -- scalar subquery
  SELECT 
    COUNT(DISTINCT product_category)
  FROM products
)
