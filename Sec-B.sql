
-- SQL is case-insensitive

/*
We will follow:
UPPERCASE: Keywords
lowercase: Non-keywords
*/

USE exercise_hr;

SHOW TABLES;

USE store;

SELECT *
FROM customers;

SELECT *
FROM customers
ORDER BY first_name ASC;

-- ORDER BY <column_name_1> ASC/DESC, <column_name_2> ASC/DESC, <column_name_3> ASC/DESC for descending order
SELECT *
FROM customers
ORDER BY last_name DESC, birth_date DESC;

SELECT 1, 2;

SELECT 1 + 2;

SELECT 5 * 100 - 100;

SELECT 100 - 50 / 2;

SELECT 100 - 50 / 2 AS value;


SELECT *
FROM customers;

SELECT first_name
FROM customers;


SELECT first_name, last_name, points
FROM customers;

/*
SELECT <column_1>, <column_2> ... <column_n>
FROM <table_name>;

SELECT *	-- For all columns.
FROM <table_name>;
*/

SELECT first_name, last_name, points, points * 1.1 AS 'discount_factor'
FROM customers;

SELECT birth_date
FROM customers;
/*
DATA types:
Strings, numbers, dates
*/

SELECT DATE_FORMAT(FROM_DAYS(DATEDIFF(NOW(), birth_date)), '%Y') + 0 AS age
FROM customers;

SELECT *
FROM customers;

SELECT state
FROM customers;

SELECT DISTINCT state
FROM customers;


USE store;

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
WHERE birth_date >= '1990-01-01';

SELECT *
FROM customers
WHERE state != 'FL';

SELECT *
FROM customers
WHERE birth_date >= '1990-01-01' AND state = 'FL';

SELECT *
FROM customers
WHERE points > '3000' AND birth_date >= '1990-01-01';

SELECT *
FROM customers
WHERE points > '3000' OR birth_date >= '1990-01-01';


-- born after 1989 or points > 3000 and living in Virginia (VA)
SELECT *
FROM customers
WHERE birth_date >= '1990-01-01' OR points > 3000 AND state = 'VA';

-- born after 1989 or points < 4000 and living in Virginia (VA)
SELECT *
FROM customers
WHERE birth_date >= '1990-01-01' OR points < 4000 AND state = 'VA';

-- points < 4000 or born after 1989 and living in Virginia (VA)
SELECT *
FROM customers
WHERE points < 4000 OR birth_date >= '1990-01-01' AND state = 'VA';

-- points < 4000 and born after 1989 or living in Virginia (VA)
SELECT *
FROM customers
WHERE (points < 4000 AND birth_date >= '1990-01-01') OR state = 'VA';

-- ORDER of the logical operators
-- 1. AND
-- 2. OR
-- 3. NOT



SELECT *
FROM customers
WHERE NOT (state = 'FL');

-- Write a query to display the name (first_name, last_name) and department ID of all
-- employees in departments 30 or 100 in ascending order.
USE exercise_hr;

SELECT first_name,  last_name, department_ID
FROM employees
WHERE department_ID = 30 OR department_ID = 100
ORDER BY department_ID ASC;

-- customer lives in FL or VA or GA
USE store;

SELECT *
FROM customers
WHERE state = 'FL' OR state = 'VA' OR state = 'GA';

SELECT *
FROM customers
WHERE state IN ('FL', 'VA', 'GA');

-- Exercise 1.1
SELECT *
FROM products
WHERE quantity_in_stock IN (49, 38, 72);

-- customers whose points are in the range of 3000 to 10000. 
-- (range: points start from 3000 and end in 10000)
SELECT *
FROM customers
WHERE points >= 3000 AND points <= 10000;

SELECT *
FROM customers
WHERE points BETWEEN 3000 AND 10000;

-- Return customers born
-- between 1/1/1990 and 1/1/2000
SELECT *
FROM customers
WHERE birth_date BETWEEN'1990-01-01' AND '2000-01-01';


-- Return customers born
-- not between 1/1/1990 and 1/1/2000
SELECT *
FROM customers
WHERE birth_date NOT BETWEEN'1990-01-01' AND '2000-01-01';


SELECT *
FROM customers
WHERE last_name LIKE 'MacCaffrey';

-- last name contains 'age'

SELECT *
FROM customers
WHERE last_name LIKE '%age%';

-- last name ending in y

SELECT *
FROM customers
WHERE last_name LIKE '%y';


-- last name starting with b
SELECT *
FROM customers
WHERE last_name LIKE 'b%';

USE store;

SELECT *
FROM customers
WHERE last_name LIKE '_y';

SELECT *
FROM customers
WHERE last_name LIKE '_____y';

/*
% - any number of characters
_ - single character
*/

-- all customers living in a state ending in A.
SELECT *
FROM customers
WHERE state LIKE '%A';

SELECT *
FROM customers
WHERE state LIKE '_A';

-- last name has 6 letters, starts with b and ends with y
SELECT *
FROM customers
WHERE last_name LIKE 'b____y';

SELECT *
FROM customers
WHERE last_name LIKE 'b%y';


SELECT *
FROM customers
WHERE last_name REGEXP 'field';


SELECT *
FROM customers
WHERE last_name REGEXP 'age';


SELECT *
FROM customers
WHERE last_name REGEXP '^Mac';

SELECT *
FROM customers
WHERE last_name REGEXP 'field$';


SELECT *
FROM customers
WHERE last_name REGEXP 'field$|^Mac';


SELECT *
FROM customers
WHERE last_name REGEXP 'field$|^Mac|rose';

USE store;

-- last name contains 'age'
SELECT *
FROM customers
WHERE last_name LIKE '%age%';

SELECT *
FROM customers
WHERE last_name REGEXP 'age';


/*
^ (caret) - starts with
$ - ends with
| (pipe) - logical OR 
[.] - set
*/

-- last name contains ae, be, ce, de, ee, fe, ge, he
SELECT *
FROM customers
WHERE last_name REGEXP 'ae|be|ce|de|ee|fe|ge|he';

SELECT *
FROM customers
WHERE last_name REGEXP '[abcdefgh]e';


SELECT *
FROM customers
WHERE last_name REGEXP '[a-h]e';


-- We want to have customers who have 'ge', 'ie' or 'me' in their 
-- last names
SELECT *
FROM customers
WHERE last_name REGEXP '[gim]e';

-- We want to find last_names with 6 characters
SELECT *
FROM customers
WHERE last_name REGEXP '^[a-z]{6}$';

SELECT *
FROM customers
WHERE last_name REGEXP '^.{6}$';

-- REGEXP equivalent to _ and % used in the LIKE query 
-- . - _ 
-- .* - %


-- 2. last names end with EY or ON

-- 3. last names start with MY or contains SE

-- 4. last names contains B followed by R or U
USE exercise_hr;

SELECT *
FROM employees
WHERE last_name LIKE '%b%r%' OR last_name LIKE '%b%u%';


SELECT *
FROM employees
WHERE last_name REGEXP 'b.*[ru]';

USE store;
-- NULL operator
-- Select customers where Phone is Null
SELECT *
FROM customers
-- WHERE phone = NULL; (NULL = NULL) is not correct for NULL
WHERE phone IS NULL;

-- Select customers where Phone is Not Null
SELECT *
FROM customers
WHERE phone IS NOT NULL;

-- Exercise: Get the orders that are not shipped

-- Multiple column sorting

USE exercise_hr;

-- Sort employees based according to their departments and by their first names within the departments.

-- Get top 3 customers
SELECT *
FROM customers
LIMIT 3;

-- Get top 3 loyal customers (order by points)
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
LIMIT 3,3;

-- thE LIMIT clause should always come at the end.
-- The order of the clauses matter. SELECT -> FROM -> optionally WHERE -> optionally ORDER BY -> LIMIT
-- Not following the order gives error.

USE store;

SELECT *
FROM customers;

EXPLAIN
SELECT *
FROM customers;

USE exercise_hr;

SELECT *
FROM employees;

SELECT *
FROM employees
WHERE first_name = 'Lex';

EXPLAIN
SELECT *
FROM employees
WHERE first_name = 'Lex';

SELECT *
FROM employees
WHERE employee_id = 102;

SELECT *
FROM employees
WHERE last_name = 'De Haan';

EXPLAIN 
SELECT *
FROM employees
WHERE last_name = 'De Haan';

SELECT *
 FROM employees
 ORDER BY last_name;

SELECT COUNT(*) AS 'number of employees'
FROM employees;

CREATE DATABASE IF NOT EXISTS project;

USE project;

/* Syntax for creating table:
CREATE TABLE tablename (
column1 COLUMN1_DATATYPE(size) CONSTRAINTS,
column2 COLUMN2_DATATYPE(size) CONSTRAINTS,
);
*/

CREATE TABLE IF NOT EXISTS user (
`username` VARCHAR(50) PRIMARY KEY,
first_name VARCHAR(50),
last_name VARCHAR(50),
email VARCHAR(100),
password VARCHAR(50),
dob DATE,
phone VARCHAR(20)
);


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

DESCRIBE user;

ALTER TABLE user
ADD whatsapp_no INT;

DESCRIBE user;

ALTER TABLE user
MODIFY whatsapp_no VARCHAR(20);

DESCRIBE user;

ALTER TABLE user
DROP whatsapp_no;

DESCRIBE user;

/*
Add new column:
ALTER TABLE table_name
ADD column_name datatype(size);


Modify datatype of an existing column:
ALTER TABLE table_name
MODIFY column_name datatype(size);

Drop an existing column:
ALTER TABLE table_name
DROP column_name;

Rename column
ALTER TABLE table_name
RENAME COLUMN old_name TO new_name;
*/




ALTER TABLE user
RENAME COLUMN dob TO date_of_birth;

DESCRIBE user;

-- Delete table
-- DROP TABLE tablename;
DROP TABLE user;

DESCRIBE user;

CREATE TABLE IF NOT EXISTS user (
`username` VARCHAR(50),
first_name VARCHAR(50),
last_name VARCHAR(50),
email VARCHAR(100),
password VARCHAR(50),
dob DATE,
phone VARCHAR(20),
PRIMARY KEY(username)
);

-- Read the table
SELECT *
FROM user;

-- Delete all rows from table
DELETE FROM user;

SELECT *
FROM user;

-- Insert 10 users into the user table 
INSERT INTO user (username, password, date_of_birth, phone, email, first_name, last_name)
VALUES ('user2', 'user2_pw', '2005-01-01', '9876543210', 'user2@email.com', 'User2_fn', 'User2_ln'),
('user3', 'user_pw', '2005-01-01', '9876543210', 'user3@email.com', 'User3_fn', 'User3_ln');

INSERT INTO user (username, password, date_of_birth, phone, email, first_name, last_name)
VALUES ('user4', 'user4_pw', NULL, NULL, 'user4@email.com', 'User4_fn', 'User4_ln');

-- Update few values from the inserted rows in the user table
UPDATE user
SET first_name = 'User1_fn'
WHERE username = 'user1';

SELECT *
FROM user;

-- Delete 3 users from the user table
DELETE FROM user
WHERE username = 'user4';

SELECT *
FROM user;

USE exercise_hr;
-- Find the employees working in the department 'IT'.
SELECT department_id 
FROM departments
WHERE department_name = 'IT';

SELECT employee_id, first_name, department_id
FROM employees
WHERE department_id = 60;




SELECT *
FROM employees INNER JOIN departments
ON employees.department_id = departments.department_id;

SELECT first_name, last_name, e.department_id, department_name
FROM employees AS e INNER JOIN departments AS d
ON e.department_id = d.department_id;

-- find the count of employees in every department
SELECT department_id, COUNT(*) AS 'number of employees'
FROM employees 
GROUP BY department_id;

-- Write the join query to get the information of the manager of every employee
SELECT *
FROM employees AS e INNER JOIN employees AS m
ON e.manager_id = m.employee_id;

SELECT e.employee_id AS 'Employee ID',
CONCAT(e.first_name, e.last_name) AS 'Employee name', 
m.employee_id AS 'Manager ID', 
CONCAT(m.first_name, m.last_name) AS 'Manager name'
FROM employees AS e INNER JOIN employees AS m
ON e.manager_id = m.employee_id;



