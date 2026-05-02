-- CTE to ranking data based on top three salary in each department 
WITH salaries_rank AS
(
  SELECT
    department_name,
    name, 
    salary, 
    DENSE_RANK() OVER(PARTITION BY department_name ORDER BY salary DESC) ranking
  FROM employee AS E 
  JOIN department AS D 
  ON E.department_id = D.department_id
)

-- Display Just top-threee
SELECT  
  department_name, 
  name, 
  salary
FROM salaries_rank
WHERE ranking <=3
ORDER BY department_name, salary DESC ,name 