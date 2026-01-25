-- row_number.sql
-- Demonstrates ROW_NUMBER window function with practical examples

-- Sample Table
-- employees(emp_id, name, department, salary)
-- sales(order_id, customer_id, order_date, amount)

---------------------------------------------------
-- 1. Assign unique row number based on salary descending
---------------------------------------------------
SELECT
    emp_id,
    name,
    department,
    salary,
    ROW_NUMBER() OVER (ORDER BY salary DESC) AS row_num
FROM employees;

---------------------------------------------------
-- 2. Assign row number within each department
---------------------------------------------------
SELECT
    emp_id,
    name,
    department,
    salary,
    ROW_NUMBER() OVER (PARTITION BY department ORDER BY salary DESC) AS dept_row_num
FROM employees;

---------------------------------------------------
-- 3. Find highest paid employee using ROW_NUMBER
---------------------------------------------------
SELECT *
FROM
(
    SELECT
        emp_id,
        name,
        department,
        salary,
        ROW_NUMBER() OVER (ORDER BY salary DESC) AS row_num
    FROM employees
) ranked
WHERE row_num = 1;

---------------------------------------------------
-- 4. Find top 3 highest paid employees
---------------------------------------------------
SELECT *
FROM
(
    SELECT
        emp_id,
        name,
        department,
        salary,
        ROW_NUMBER() OVER (ORDER BY salary DESC) AS row_num
    FROM employees
) ranked
WHERE row_num <= 3;

---------------------------------------------------
-- 5. Remove duplicate records using ROW_NUMBER
---------------------------------------------------
-- Example: duplicates based on name and department
DELETE FROM employees
WHERE emp_id IN
(
    SELECT emp_id
    FROM
    (
        SELECT
            emp_id,
            ROW_NUMBER() OVER (PARTITION BY name, department ORDER BY emp_id) AS rn
        FROM employees
    ) temp
    WHERE rn > 1
);

---------------------------------------------------
-- 6. Assign row numbers to orders by date
---------------------------------------------------
SELECT
    order_id,
    customer_id,
    order_date,
    amount,
    ROW_NUMBER() OVER (ORDER BY order_date) AS order_sequence
FROM sales;

---------------------------------------------------
-- 7. Get latest order per customer
---------------------------------------------------
SELECT *
FROM
(
    SELECT
        order_id,
        customer_id,
        order_date,
        amount,
        ROW_NUMBER() OVER (PARTITION BY customer_id ORDER BY order_date DESC) AS rn
    FROM sales
) ranked
WHERE rn = 1;

---------------------------------------------------
-- 8. Pagination example (fetch rows 11 to 20)
---------------------------------------------------
SELECT *
FROM
(
    SELECT
        *,
        ROW_NUMBER() OVER (ORDER BY emp_id) AS rn
    FROM employees
) temp
WHERE rn BETWEEN 11 AND 20;
