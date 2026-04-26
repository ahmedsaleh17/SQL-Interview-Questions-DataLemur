/* Retrieve all customers and 
sort results by the highest score
*/

USE [MyDatabase]; 


SELECT *
FROM customers
ORDER BY score DESC; 


/* Retrieve all customers and 
sort results by the highest score
*/

SELECT *
FROM customers
ORDER BY score ASC

-- Nesting sorting 
/* Retriee all customers and 
sort the results by the country 
and then by the highest score */

SELECT * 
FROM customers 
ORDER BY country ASC , score DESC


-- Find the total score for each country 

SELECT country, SUM(score) 'TOTAL SCORE'
FROM customers 
GROUP BY country; 


/* Find the total score and total number of customers 
for each country. */

SELECT country, SUM(score) AS TOTAL_SCORE, COUNT(*) AS TOTAL_CUSTOMERS
FROM customers 
GROUP BY country



/* Find the average score for each country
considering only customers with a score not equal to 0 
and return only those countries with an average score greater than 430
*/


SELECT country, AVG(score) 'AVG SCORE'
FROM customers
WHERE score != 0
GROUP BY country
HAVING AVG(score) > 430;




-- DISTINCT (USED TO REMOVE DUPLICATES)

SELECT DISTINCT country
FROM customers



-- TOP (LIMIT)

-- Retrieve top 3 customers with the highest score 
SELECT TOP 3 *
FROM customers
ORDER BY score DESC; 


-- Retrieve the lowest 2 customers based on the score 

SELECT TOP 2 *
FROM customers 
ORDER BY score 

-- GET THE TWO MOST RECENT ORDERS 
SELECT TOP 2 *
FROM orders 
ORDER BY order_date DESC


/* CREATE A NEW TABLE CALLED PERSONS 
WITH COLUMNS ID, PERSON_NAME, BIRTH_DATE AND PHONE 
*/


CREATE TABLE Persons(
    id INT, 
    person_name VARCHAR(25) NOT NULL,
    birht_date DATE, 
    Phone varchar(15) NOT NULL ,
    CONSTRAINT pk_persons PRIMARY KEY (id) 
)


SELECT *
FROM Persons; 


--ADD A NEW COLUMN 
ALTER TABLE Persons 
ADD EMAIL VARCHAR(40) NOT NULL ;



-- REMOVE THE COLUMN PHONE FROM THE PERSON TABLE 
ALTER TABLE Persons
DROP column phone; 


-- delete the person 
DROP TABLE Persons; 
--------------------------------------------------


-- DML 
INSERT INTO customers 
VALUES
(6, 'Anna', 'USA', NULL),
(7, 'Sam', NULL, 100)



-- CREATE A TABLE OF USA CUSTOMERS 

SELECT * INTO USA_CUSTOMERS
FROM customers
WHERE country = 'USA'


SELECT *
FROM USA_CUSTOMERS


-- INSERT BASED ON SELECT 
INSERT INTO Persons
SELECT 
id,
first_name, 
NULL, 
'UNKNOWN'
FROM customers;


SELECT * 
FROM Persons; 



-- update 
-- change the score of customer with id 6 to 0


UPDATE customers 
SET score = 0
WHERE ID = 6;



/* Change the score of customers with id 7 to 0
and update the country to 'UK'
*/ 


UPDATE customers 
SET score = 0,
    country = 'UK'
WHERE ID = 7



-- DELETE
DELETE FROM customers 
WHERE ID > 5  ; 



SELECT *
FROM customers ;



-- DELETE ALL DATA FROM PERSONS TABLE
SELECT *
FROM PERSONS 


DELETE FROM PERSONS;
TRUNCATE TABLE PERSONS; 
