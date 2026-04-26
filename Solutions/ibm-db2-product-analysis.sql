-- CTE: Count distinct Q3 queries per employee (includes employees with 0 queries)
WITH employee_queries AS 
(
  SELECT 
    e.employee_id, 
    COALESCE(COUNT(DISTINCT query_id), 0) AS unique_queries
  FROM employees e 
  LEFT JOIN queries q 
    ON e.employee_id = q.employee_id
    AND EXTRACT(QUARTER FROM query_starttime) = 3
  GROUP BY e.employee_id
)

-- Group employees by query count and show distribution
SELECT 
  unique_queries,
  COUNT(employee_id) AS employee_count
FROM employee_queries
GROUP BY unique_queries
ORDER BY unique_queries
