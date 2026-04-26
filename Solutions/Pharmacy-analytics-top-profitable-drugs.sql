--mysql code 

-- CTE to compute total profit by drug 
WITH TotalProfits AS 
(

SELECT 
  drug, 
  SUM(total_sales - cogs) AS TotalProfit  
FROM pharmacy_sales
GROUP BY drug

)


-- top 3 most profitable drugs  
SELECT 
  *
FROM TotalProfits
ORDER BY TotalProfit DESC
LIMIT 3


