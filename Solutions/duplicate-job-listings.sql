
SELECT 
COUNT(*) duplicate_companies
FROM
(
SELECT 
  company_id, 
  title, 
  COUNT(*) jobs_cnt
FROM job_listings
GROUP BY company_id, title
HAVING COUNT(*) = 2 
)T