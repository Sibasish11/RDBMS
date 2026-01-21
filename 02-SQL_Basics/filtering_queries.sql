-- filtering_queries.sql
-- Demonstrates filtering data using WHERE, AND, OR, IN, BETWEEN, LIKE, and NOT

-- Sample Table
CREATE TABLE employees (
    emp_id INT,
    name VARCHAR(50),
    department VARCHAR(50),
    salary INT,
    age INT,
    city VARCHAR(50)
);

INSERT INTO employees VALUES
(1, 'Alice', 'IT', 60000, 28, 'Mumbai'),
(2, 'Bob', 'HR', 45000, 35, 'Delhi'),
(3, 'Charlie', 'Finance', 70000, 32, 'Bangalore'),
(4, 'Diana', 'IT', 80000, 26, 'Pune'),
(5, 'Evan', 'Marketing', 50000, 40, 'Chennai');

--------------------------------------------------
-- Basic WHERE filtering
--------------------------------------------------

-- Employees with salary greater than 60000
SELECT * FROM employees
WHERE salary > 60000;

-- Employees from IT department
SELECT * FROM employees
WHERE department = 'IT';

--------------------------------------------------
-- Logical Operators: AND, OR, NOT
--------------------------------------------------

-- IT employees earning more than 65000
SELECT * FROM employees
WHERE department = 'IT' AND salary > 65000;

-- Employees from IT or Finance department
SELECT * FROM employees
WHERE department = 'IT' OR department = 'Finance';

-- Employees not from HR department
SELECT * FROM employees
WHERE NOT department = 'HR';

--------------------------------------------------
-- IN Operator
--------------------------------------------------

-- Employees from selected cities
SELECT * FROM employees
WHERE city IN ('Mumbai', 'Pune');

--------------------------------------------------
-- BETWEEN Operator
--------------------------------------------------

-- Employees with salary between 50000 and 75000
SELECT * FROM employees
WHERE salary BETWEEN 50000 AND 75000;

--------------------------------------------------
-- LIKE Operator (Pattern Matching)
--------------------------------------------------

-- Names starting with 'A'
SELECT * FROM employees
WHERE name LIKE 'A%';

-- Names ending with 'e'
SELECT * FROM employees
WHERE name LIKE '%e';

-- Names containing 'ar'
SELECT * FROM employees
WHERE name LIKE '%ar%';

--------------------------------------------------
-- NULL Handling
--------------------------------------------------

-- Example NULL check (if column allows NULL)
SELECT * FROM employees
WHERE city IS NULL;

SELECT * FROM employees
WHERE city IS NOT NULL;

--------------------------------------------------
-- Combined Filters Example
--------------------------------------------------

-- IT employees in Pune earning more than 70000
SELECT * FROM employees
WHERE department = 'IT'
  AND city = 'Pune'
  AND salary > 70000;

--------------------------------------------------
-- End of file
--------------------------------------------------

