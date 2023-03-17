/*
SQL is case-insensitive.
But we usually use UPPERCASE for keywords
and lowercase for table names, column names, etc.
*/

USE store;
use store;

SHOW tables;

SELECT * 
FROM customers;

SELECT *
FROM customers
ORDER BY first_name;


SELECT *
FROM customers
ORDER BY first_name DESC;

-- How to comment a line?
-- How to see the data in the table?
-- How to order the data in the table - DESC?
-- How to run a single line
-- How to run the entire script
-- How to use SELECT query.

/*


*/

SELECT 1, 2;

SELECT 1+2;

SELECT 100 - 50 / 2;

/*
Order of arithmetic operations:
()
/
*
+
-
*/

SELECT 100 - 50 / 2 AS value;

SELECT 100 - 50 / 2 AS 'answer value';

USE store;

SELECT *
FROM customers;

SELECT first_name, last_name, points
FROM customers;

/*
Syntax of SELECT statement:
SELECT <column_1>, <column_2>, ... , <column_n>
FROM <table_name>;

SELECT * -- all columns of the table
FROM <table_name>;
*/

SELECT first_name, last_name, points 
FROM customers;

SELECT first_name, last_name, points, points + 10 AS 'new points'
FROM customers;

USE exercise_hr;

SELECT first_name AS 'First Name', last_name AS 'Last Name'
FROM employees;

SELECT first_name, last_name, salary, salary * 15 / 100 AS 'PF'
FROM employees;

SELECT DISTINCT department_id
FROM employees;

USE store;

SELECT *
FROM customers;

SELECT *
FROM customers
WHERE state = 'FL';


-- Comparison operators:
-- >
-- >=
-- <
-- <=
-- =
-- != or <>

SELECT *
FROM customers
WHERE points > 3000;


SELECT *
FROM customers
WHERE points > '3000';

SELECT *
FROM customers
WHERE birth_date > '1990-01-01';

SELECT *
FROM customers
WHERE state != 'FL';

SELECT *
FROM customers
WHERE points > 3000 AND  birth_date > '1990-01-01';

SELECT *
FROM customers
WHERE points > 3000 OR birth_date > '1990-01-01';


-- born after 1889 or points > 1000 AND live in Virginia (VA)
SELECT *
FROM customers
WHERE birth_date > '1889-01-01' OR (points > '1000' AND state = 'VA');


-- ORDER of logical operators:
-- 1. NOT
-- 2. AND
-- 3. OR

-- born after 1989 AND points > 1000 OR live in Virginia (VA)
SELECT *
 FROM customers
 WHERE (birth_date > '1989-01-01' AND points > '1000') OR state = 'VA';
 
SELECT *
FROM customers
WHERE NOT (state = 'FL'); 

SELECT *
FROM customers
WHERE state = 'FL' OR state = 'VA' OR state = 'GA';


SELECT *
FROM customers
WHERE state = 'FL' OR state = 'VA' OR state = 'GA';

SELECT *
FROM customers
WHERE state IN ('FL', 'VA', 'GA');

SELECT *
FROM products
WHERE quantity_in_stock IN (49, 38, 72);

SELECT *
FROM products
WHERE quantity_in_stock != 72;

SELECT *
FROM products
WHERE NOT quantity_in_stock = 72;

USE exercise_hr;

SELECT first_name, last_name, salary
FROM employees
WHERE NOT (salary >= 10000 AND salary <= 15000);

SELECT first_name, last_name, salary
FROM employees
WHERE NOT (salary BETWEEN 10000 AND 15000);


USE store;

-- points is in the range of 3000 to 10000
SELECT *
FROM customers
WHERE points BETWEEN 3000 AND 10000;

-- Return customers born between 1/1/1990 and 1/1/2000
SELECT *
FROM customers
WHERE birth_date BETWEEN '1990-01-01' AND '2000-01-01';

-- last_name ends in y
SELECT *
FROM customers
WHERE last_name LIKE '%y';


-- last name starts with Mac
SELECT *
FROM customers
WHERE last_name LIKE 'Mac%';

-- last name is MacCaffrey
SELECT *
FROM customers
WHERE last_name LIKE 'MacCaffrey';

-- first name contains ba
SELECT *
FROM customers
WHERE first_name LIKE '%ba%';

-- 3.1 addresses contain TRAIL or AVENUE
SELECT *
FROM customers
WHERE address LIKE '%TRAIL%' OR address LIKE '%AVENUE%';


-- Write a query to display the first_name of all employees who have both "b" and "c" in their first name.
USE exercise_hr;

SELECT first_name
FROM employees
WHERE first_name LIKE '%b%' AND first_name LIKE '%c%';


SELECT first_name
FROM employees
WHERE first_name LIKE '%b%c%';

-- Write a query to display the last name of employees whose names have exactly 6 characters.
SELECT *
FROM employees 
WHERE last_name LIKE '______';

USE store;

-- customers last_names ending with y and having 6 letters
SELECT *
FROM customers
WHERE last_name LIKE '_____y';


-- customers last_names starting with b, ending with y and have 6 letters.
SELECT *
FROM customers
WHERE last_name LIKE 'b____y';

/*
REGEXP:
^ (caret) - starts with
$ - ends with
| (pipe) - logical OR
[.] (set) - logical OR with sequence
*/

-- Write a query to find all customers having last_names that contain 'age'
SELECT *
FROM customers
WHERE last_name LIKE '%age%';

SELECT *
FROM customers
WHERE last_name REGEXP 'age';

-- last_name starts with Mac
SELECT *
FROM customers
WHERE last_name REGEXP '^Mac';

-- last_name ends with field
SELECT *
FROM customers
WHERE last_name REGEXP 'field$';

-- last names start with Mac or ends with field
SELECT *
FROM customers
WHERE last_name REGEXP '^Mac|field$';

-- last name contains ae/be/ce/de/ee/fe/ge/he
SELECT *
FROM customers
WHERE last_name REGEXP 'ae|be|ce|de|ee|fe|ge|he';

-- last name contains ae/be/ce/de/ee/fe/ge/he
SELECT *
FROM customers
WHERE last_name REGEXP '[a-h]e';

USE store;
-- We want to have customers who have 'ge', 'ie' or 'me' in their 
-- last names - immediate followers
SELECT *
FROM customers
WHERE last_name REGEXP 'ge|ie|me';

SELECT *
FROM customers
WHERE last_name REGEXP '[gim]e';

-- 2. last names end with EY or ON
SELECT *
FROM customers
WHERE last_name REGEXP 'EY$|ON$';

-- 3. last names start with MY or contains SE
SELECT *
FROM customers
WHERE last_name REGEXP '^MY|SE';


-- 4. last names contains B followed by R or U 
SELECT *
FROM customers
WHERE last_name REGEXP 'b[a-z]*[ru]';

USE exercise_hr;
SELECT *
FROM employees
WHERE last_name REGEXP 'b[a-z]*[ru]';

-- last names contains br or bu
SELECT *
FROM customers
WHERE last_name REGEXP 'br|bu';

SELECT *
FROM customers
WHERE last_name REGEXP 'b[ru]';

-- NULL operator

USE store;
-- Select customers where Phone is Null
SELECT *
FROM customers
WHERE phone IS NULL;


-- Select customers where Phone is Not Null
SELECT *
FROM customers
WHERE phone IS NOT NULL;

SHOW TABLES;

-- Exercise: Get the orders that are not shipped
SELECT *
FROM orders
WHERE shipped_date IS NULL;

SELECT *
FROM orders
WHERE shipper_id IS NULL;

-- Multiple column sorting

USE exercise_hr;

-- Sort employees based according to their departments and by their first 
-- names within the departments.
SELECT employee_id, first_name, department_id
FROM employees
ORDER BY department_id, first_name;

-- Sort employees based according to their departments and by their first 
-- names within the departments in descending order
SELECT employee_id, first_name, department_id
FROM employees
ORDER BY department_id, first_name DESC;

-- Sort employees based according to their departments in descending orderand by their first 
-- names within the departments 
SELECT employee_id, first_name, department_id
FROM employees
ORDER BY department_id DESC, first_name ;


-- Sort employees based according to their first_name and by their department_ids 
--  within the first_name in descending ordetodo_listr
SELECT employee_id, first_name, department_id
FROM employees
ORDER BY first_name, department_id DESC;


USE store;

-- Get top 3 customers
SELECT *
FROM customers
LIMIT 3;


-- Exercise: Get top 3 loyal customers
SELECT *
FROM customers
ORDER BY points DESC
LIMIT 3;

-- If the argument is greater than the number of customers, then we get all the customers.

-- Pagination 
-- page 1: 1-3
-- page 2: 4-6
-- page 3: 7-9

-- Get customers on Page 2
SELECT *
FROM customers
LIMIT 3, 3;

-- thE LIMIT clause should always come at the end.
-- The order of the clauses matter. SELECT -> FROM -> optionally WHERE -> optionally ORDER BY -> LIMIT
-- Not following the order gives error.

USE exercise_hr;

SELECT *
FROM employees;

EXPLAIN 
SELECT *
FROM employees;

SELECT *
FROM employees
WHERE first_name = "Lex";

EXPLAIN SELECT *
FROM employees
WHERE first_name = "Lex";

SELECT *
FROM employees
WHERE employee_id = 102;

EXPLAIN SELECT *
FROM employees
WHERE employee_id = 102;

SELECT *
FROM employees
WHERE last_name = 'De Haan';

EXPLAIN SELECT *
FROM employees
WHERE last_name = 'De Haan';

SELECT *
FROM employees 
ORDER BY last_name DESC;

SELECT *
FROM employees
WHERE last_name = "Taylor";

SELECT *
FROM employees
ORDER BY last_name;


CREATE DATABASE IF NOT EXISTS project;

USE project;

/*
CREATE TABLE tablename (
column1 COLUMN1_DATATYPE(size) CONSTRAINTS,
column2 COLUMN2_DATATYPE(size) CONSTRAINTS,
);
*/

CREATE TABLE IF NOT EXISTS user (
username VARCHAR(50) PRIMARY KEY,
password VARCHAR(50),
dob DATE,
phone VARCHAR(20),
email VARCHAR(100),
first_name VARCHAR(50),
last_name VARCHAR(50)
);

DESCRIBE user;

/*
Numbers : INT, BIGINT
Decimal numbers (eg. 3.14) : DOUBLE
Strings: 
		-- if fixed length: CHAR(2)
        -- if variable length: VARCHAR(255)
Date: DATE
Datetime: DATETIME
Boolean: TINYINT
*/

DROP TABLE user;

DESCRIBE user;

-- Add a new column 'whatsapp_no' with datatype int 
ALTER TABLE user
ADD whatsapp_no INT;
DESCRIBE user;

-- Update the 'whatsapp_no' column datatype from int to varchar(20)
ALTER TABLE user
MODIFY COLUMN whatsapp_no VARCHAR(20);
DESCRIBE user;


-- Delete the 'whatsapp_no' column
ALTER TABLE user
DROP whatsapp_no;
DESCRIBE user;

-- rename the 'dob' column to 'date_of_birth'
ALTER TABLE user
RENAME COLUMN dob TO date_of_birth;
DESCRIBE user;

DROP TABLE user;

CREATE TABLE IF NOT EXISTS user (
username VARCHAR(50) PRIMARY KEY,
password VARCHAR(50),
dob DATE,
phone VARCHAR(20),
email VARCHAR(100) NOT NULL,
first_name VARCHAR(50) NOT NULL,
last_name VARCHAR(50) NOT NULL
);

-- Insert 10 rows into your user table.
INSERT INTO user (username, password, date_of_birth, phone, email, first_name, last_name)
VALUES ('settu_krishna', '12345678', '2005-06-17', '9551555231', 'gsathyamoorthy@fssa.freshworks.com', 'Gowtham', 'Sathyamoorthy'),
('periyasamy', 'kutty012', '2005-04-25', '9150415595', 'bperiyasamy@fssa.freshworks.com', 'Bhirahatees', 'Periyasamy');

SELECT *
FROM user;

INSERT INTO user (username, password, email, first_name, last_name)
VALUES ('user3', 'user3_password', 'user@gmail.com', 'User3', 'User3_ln');

-- Update few values in the inserted values.
UPDATE user
SET first_name = 'User3_fn'
WHERE username = 'user3';


-- Delete 3 rows from the inserted values.
DELETE FROM user
WHERE username = 'user3';

SELECT *
FROM user;

INSERT INTO user (username, password, date_of_birth, phone, email, first_name, last_name)
VALUES ('logesh', '12345678', NULL, NULL, 'lvenkatesh@fssa.freshworks.com', 'Logesh', 'Venkatesh');

USE exercise_hr;
-- INNER JOIN
SELECT *
FROM employees INNER JOIN departments
ON employees.department_id = departments.department_id;

SELECT employee_id, first_name, last_name, e.department_id, department_name
FROM employees AS e INNER JOIN departments AS d
ON e.department_id = d.department_id;

-- find all the employees working in the 'IT' department
SELECT employee_id, first_name, last_name, e.department_id, department_name
FROM employees AS e INNER JOIN departments AS d
ON e.department_id = d.department_id
WHERE department_name = "IT";












