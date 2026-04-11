-- Get losses drugs 
WITH LossesDrugs AS 
(
SELECT 
  manufacturer, 
  drug, 
  (total_sales - cogs) * -1 AS loss 
FROM pharmacy_sales
WHERE (total_sales - cogs) < 0 
)


--Calculate the total losses per manufacturer 
SELECT 
  manufacturer,
  COUNT(drug) drug_count, 
  SUM(loss) total_sales
FROM LossesDrugs
GROUP BY manufacturer
ORDER BY total_sales DESC 
