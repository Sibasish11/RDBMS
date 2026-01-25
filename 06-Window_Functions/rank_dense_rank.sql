-- rank_dense_rank.sql
-- Demonstrates RANK and DENSE_RANK window functions with practical examples

-- Sample Table
-- employees(emp_id, name, department, salary)

---------------------------------------------------
-- 1. Rank employees by salary (with gaps)
---------------------------------------------------
SELECT
    emp_id,
    name,
    department,
    salary,
    RANK() OVER (ORDER BY salary DESC) AS salary_rank
FROM employees;

---------------------------------------------------
-- 2. Dense rank employees by salary (no gaps)
---------------------------------------------------
SELECT
    emp_id,
    name,
    department,
    salary,
    DENSE_RANK() OVER (ORDER BY salary DESC) AS salary_dense_rank
FROM employees;

---------------------------------------------------
-- 3. Rank employees within each department
---------------------------------------------------
SELECT
    emp_id,
    name,
    department,
    salary,
    RANK() OVER (PARTITION BY department ORDER BY salary DESC) AS dept_rank
FROM employees;

---------------------------------------------------
-- 4. Dense rank employees within each department
---------------------------------------------------
SELECT
    emp_id,
    name,
    department,
    salary,
    DENSE_RANK() OVER (PARTITION BY department ORDER BY salary DESC) AS dept_dense_rank
FROM employees;

---------------------------------------------------
-- 5. Find top 3 highest paid employees using RANK
---------------------------------------------------
SELECT *
FROM
(
    SELECT
        emp_id,
        name,
        department,
        salary,
        RANK() OVER (ORDER BY salary DESC) AS salary_rank
    FROM employees
) ranked
WHERE salary_rank <= 3;

---------------------------------------------------
-- 6. Find top 3 highest paid employees using DENSE_RANK
---------------------------------------------------
SELECT *
FROM
(
    SELECT
        emp_id,
        name,
        department,
        salary,
        DENSE_RANK() OVER (ORDER BY salary DESC) AS salary_dense_rank
    FROM employees
) ranked
WHERE salary_dense_rank <= 3;

---------------------------------------------------
-- 7. Second highest salary using DENSE_RANK
---------------------------------------------------
SELECT *
FROM
(
    SELECT
        emp_id,
        name,
        department,
        salary,
        DENSE_RANK() OVER (ORDER BY salary DESC) AS salary_rank
    FROM employees
) ranked
WHERE salary_rank = 2;

---------------------------------------------------
-- 8. Compare RANK vs DENSE_RANK side by side
---------------------------------------------------
SELECT
    emp_id,
    name,
    salary,
    RANK() OVER (ORDER BY salary DESC) AS rank_value,
    DENSE_RANK() OVER (ORDER BY salary DESC) AS dense_rank_value
FROM employees;
