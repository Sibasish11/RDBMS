-- window_functions_practice.sql
-- Practice examples for SQL Window Functions

---------------------------------------------------
-- Sample Table
---------------------------------------------------
CREATE TABLE employees (
    emp_id INT,
    name VARCHAR(100),
    department VARCHAR(50),
    salary INT,
    hire_date DATE
);

INSERT INTO employees VALUES
(1, 'Amit', 'IT', 80000, '2021-01-10'),
(2, 'Riya', 'IT', 60000, '2022-03-15'),
(3, 'Neha', 'HR', 50000, '2020-06-20'),
(4, 'Karan', 'HR', 55000, '2021-09-12'),
(5, 'Pooja', 'Finance', 70000, '2019-11-01'),
(6, 'Rohit', 'Finance', 65000, '2023-02-18');

---------------------------------------------------
-- 1. ROW_NUMBER()
---------------------------------------------------
SELECT
    emp_id,
    name,
    department,
    salary,
    ROW_NUMBER() OVER (ORDER BY salary DESC) AS row_num
FROM employees;

---------------------------------------------------
-- 2. RANK()
---------------------------------------------------
SELECT
    name,
    department,
    salary,
    RANK() OVER (ORDER BY salary DESC) AS salary_rank
FROM employees;

---------------------------------------------------
-- 3. DENSE_RANK()
---------------------------------------------------
SELECT
    name,
    department,
    salary,
    DENSE_RANK() OVER (ORDER BY salary DESC) AS dense_salary_rank
FROM employees;

---------------------------------------------------
-- 4. Ranking within partitions
---------------------------------------------------
SELECT
    name,
    department,
    salary,
    RANK() OVER (PARTITION BY department ORDER BY salary DESC) AS dept_rank
FROM employees;

---------------------------------------------------
-- 5. Running total (Cumulative sum)
---------------------------------------------------
SELECT
    name,
    hire_date,
    salary,
    SUM(salary) OVER (ORDER BY hire_date) AS running_salary_total
FROM employees;

---------------------------------------------------
-- 6. Moving average
---------------------------------------------------
SELECT
    name,
    hire_date,
    salary,
    AVG(salary) OVER (
        ORDER BY hire_date
        ROWS BETWEEN 1 PRECEDING AND 1 FOLLOWING
    ) AS moving_avg_salary
FROM employees;

---------------------------------------------------
-- 7. LEAD()
---------------------------------------------------
SELECT
    name,
    hire_date,
    salary,
    LEAD(salary) OVER (ORDER BY hire_date) AS next_salary
FROM employees;

---------------------------------------------------
-- 8. LAG()
---------------------------------------------------
SELECT
    name,
    hire_date,
    salary,
    LAG(salary) OVER (ORDER BY hire_date) AS prev_salary
FROM employees;

---------------------------------------------------
-- 9. Difference using LAG
---------------------------------------------------
SELECT
    name,
    salary,
    salary - LAG(salary) OVER (ORDER BY salary DESC) AS salary_diff
FROM employees;

---------------------------------------------------
-- 10. First and Last value
---------------------------------------------------
SELECT
    name,
    department,
    salary,
    FIRST_VALUE(salary) OVER (
        PARTITION BY department
        ORDER BY salary DESC
    ) AS highest_in_dept
FROM employees;

---------------------------------------------------
-- 11. Percent rank
---------------------------------------------------
SELECT
    name,
    salary,
    PERCENT_RANK() OVER (ORDER BY salary) AS percent_rank
FROM employees;

---------------------------------------------------
-- 12. NTILE()
---------------------------------------------------
SELECT
    name,
    salary,
    NTILE(3) OVER (ORDER BY salary DESC) AS salary_bucket
FROM employees;

---------------------------------------------------
-- 13. Window function in subquery
---------------------------------------------------
SELECT *
FROM (
    SELECT
        name,
        department,
        salary,
        RANK() OVER (PARTITION BY department ORDER BY salary DESC) AS rnk
    FROM employees
) t
WHERE rnk = 1;

---------------------------------------------------
-- 14. Window vs GROUP BY comparison
---------------------------------------------------
-- GROUP BY
SELECT department, AVG(salary)
FROM employees
GROUP BY department;

-- Window function
SELECT
    name,
    department,
    salary,
    AVG(salary) OVER (PARTITION BY department) AS dept_avg_salary
FROM employees;
