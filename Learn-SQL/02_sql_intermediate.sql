-- Filtering Data 

USE MyDatabase; 
/* 
Operators 
|-- comparison operators 
|    ---- = , <>, > , <, >=
|-- Logical operators 
|    ---- AND, OR, NOT
|-- Range operator 
|    ---- BETWEEN 
|-- Membership Operator 
|    ---- IN, NOT IN
|-- Search operator 
|    ---- LIKE 

*/



/* Retrieve all customers who are from the USA
and have score greater than 500*/

SELECT *
FROM customers 
WHERE country = 'USA' AND score > 500


/* Retrieve all customers who are either from the USA
or have score greater than 500*/

SELECT *
FROM customers 
WHERE country = 'USA' OR score > 500



-- Retrieve all customers with a score not less than 500
SELECT *
FROM customers
WHERE score >= 500;


-- range operator 
/* Retrieve all customers whose score falls 
in the range between 100 and 500 */

SELECT *
FROM customers 
WHERE score BETWEEN 100 AND 500 


-- Membership Operator

-- retrieve all customers from either germany or usa 

SELECT *
FROM customers 
WHERE country IN ('Germany', 'USA')


-- LIKE OPERATOR 
-- SEARCH FOR A PATTERN IN A TEXT 


-- Find all customers whose first name starts with 'M'
SELECT first_name
FROM customers 
WHERE first_name LIKE 'M%'

-- Find all customers whose first name ends with 'n' 
SELECT first_name
FROM customers 
WHERE first_name LIKE '%N'

-- FIND ALL CUSTOMERS WHOSE FIRST NAME CONTAINS 'R'
SELECT first_name 
FROM customers 
WHERE first_name LIKE '%R%'


----------------------------------------------------------------
-- JOINS 

/* Get all customers along with their orders, 
but only for customers who have placed an order */


SELECT first_name, order_date, sales
FROM customers C
INNER JOIN orders O
on C.id = O.customer_id;


/* Get all customers along with their orders, 
including those without orders*/

SELECT *
FROM customers C
LEFT JOIN orders O
on C.id = O.customer_id;


/* Get all customers and all orders 
even if there's no match*/


SELECT *
FROM customers C
FULL JOIN orders O  
ON C.id = O.customer_id


-- Get all customers who haven't placed any order.


SELECT *
FROM customers c
LEFT JOIN orders o
ON c.id = o.customer_id
WHERE o.customer_id is NULL ; 



-- Get all orders without matching customers 

SELECT *
FROM orders o 
LEFT JOIN customers c
on o.customer_id = c.id
WHERE c.id IS NULL; 

/*Find customers without orders
and orders without customers    */


SELECT *
FROM customers c
FULL JOIN orders O
ON C.id = O.customer_id
WHERE C.id IS NULL 
OR O.order_id IS NULL; 



/* Gert all customers along with their orders 
but only for customers who have placed an orders
(without using inner join)*/

-- USING LEFT JOIN 


SELECT *
FROM customers C    
LEFT JOIN orders O   
ON C.id = O.customer_id 
WHERE O.order_id IS NOT NULL; 


-- USING FULL JOIN 
SELECT *
FROM customers C
FULL JOIN orders O  
ON C.id = O.customer_id 
WHERE C.id IS NOT NULL AND O.order_id IS NOT NULL; 




SELECT *
FROM customers C   
INNER JOIN orders O   
ON C.id = O.customer_id

-- Multi Join 
/* Using SalesDB, Retrieve a list of all orders, along with
the realted customers, product and employee details*/

USE SalesDB; 

SELECT 
    OrderID,
    c.FirstName CustomerFirstName,
    c.LastName CustomerLastName, 
    p.Product,
    o.Sales,
    p.Price,
    E.FirstName EmployeeFirstName,
    e.LastName EmployeeLastName
FROM Sales.Orders O  
LEFT JOIN Sales.Customers C  
ON O.CustomerID = C.CustomerID
LEFT JOIN Sales.Products P  
ON O.ProductID = P.ProductID
LEFT JOIN Sales.Employees E  
ON O.SalesPersonID = E.EmployeeID




/* Set Operators 
-- Combine the results of multiple query into a single result set
-- UNION      Return all distinct rows from both queries ,not including duplicates
-- UNION ALL  Return all rows from both queries ,including duplicates
-- EXCEPT     Return all distinct rows from the first query that are not found in the second query
-- INTERSECT  Return only the rows that exist in both queries
*/


USE SalesDB; 
/* Combine the data from employees and customers into one table,
not including duplicates */

--UNION

SELECT 
    FirstName,
    LastName
FROM Sales.Customers

UNION

SELECT 
    FirstName,
    LastName
FROM Sales.Employees


/* Combine the data from employees and customers into one table,
including duplicates */

-- UNION ALL 

SELECT 
    FirstName,
    LastName
FROM Sales.Customers

UNION ALL

SELECT 
    FirstName,
    LastName
FROM Sales.Employees


/* Find employees who are not customers at the same time */

-- Except 

SELECT 
    FirstName,
    LastName
FROM Sales.Employees

EXCEPT

SELECT 
    FirstName,
    LastName
FROM Sales.Customers


/* Find employees who are customers at the same time */

-- INTERSECT 

SELECT 
    FirstName,
    LastName
FROM Sales.Employees

INTERSECT

SELECT 
    FirstName,
    LastName
FROM Sales.Customers



--- SQL TASK 

/* Orders are stored in separate tables (Orders and OrdersArchive).
combine all orders into one report without duplicates */

-- BEST PRACTICES 
-- NEVER USE * TO COMBINE TABLES, LIST NEEDED COLUMNS INSTEAD

SELECT 
    [OrderID]
    ,[ProductID]
    ,[CustomerID]
    ,[SalesPersonID]
    ,[OrderDate]
    ,[ShipDate]
    ,[OrderStatus]
    ,[ShipAddress]
    ,[BillAddress]
    ,[Quantity]
    ,[Sales]
    ,[CreationTime]
FROM Sales.Orders
UNION 
SELECT 
    [OrderID]
    ,[ProductID]
    ,[CustomerID]
    ,[SalesPersonID]
    ,[OrderDate]
    ,[ShipDate]
    ,[OrderStatus]
    ,[ShipAddress]
    ,[BillAddress]
    ,[Quantity]
    ,[Sales]
    ,[CreationTime]
FROM Sales.OrdersArchive










