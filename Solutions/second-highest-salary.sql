SELECT 
  salary as second_highest_salary
FROM 
(
  SELECT 
    *, 
    ROW_NUMBER() OVER(ORDER BY salary DESC) rn 
  FROM employee
) as t 
WHERE rn = 2