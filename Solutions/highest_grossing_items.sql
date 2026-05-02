SELECT 
  category, 
  product, 
  total_spend
FROM(
  SELECT 
    category, 
    product,
    SUM(spend) total_spend,
    ROW_NUMBER() OVER(PARTITION BY category ORDER BY SUM(spend) DESC) rn
  FROM product_spend
  WHERE DATE_PART('YEAR',transaction_date) = 2022
  GROUP BY category,product
)T
WHERE rn <=2