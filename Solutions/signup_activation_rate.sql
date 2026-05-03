SELECT
  ROUND(SUM(CASE WHEN signup_action = 'Confirmed' THEN 1 END) * 1.0 / COUNT(E.*) ,2)
FROM emails E 
JOIN texts T
ON E.email_id = T.email_id