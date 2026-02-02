-- case_when.sql
-- Demonstrates usage of CASE WHEN expressions in SQL

---------------------------------------------------
-- Sample Tables
-- employees(emp_id, name, department, salary)
-- students(student_id, name, marks)
-- orders(order_id, customer_id, amount, order_date)
---------------------------------------------------

---------------------------------------------------
-- 1. Basic CASE WHEN
---------------------------------------------------
SELECT
    name,
    salary,
    CASE
        WHEN salary >= 80000 THEN 'High'
        WHEN salary BETWEEN 50000 AND 79999 THEN 'Medium'
        ELSE 'Low'
    END AS salary_category
FROM employees;

---------------------------------------------------
-- 2. CASE WHEN with aggregation
---------------------------------------------------
SELECT
    department,
    COUNT(*) AS total_employees,
    SUM(
        CASE
            WHEN salary >= 60000 THEN 1
            ELSE 0
        END
    ) AS high_salary_count
FROM employees
GROUP BY department;

---------------------------------------------------
-- 3. CASE WHEN in ORDER BY
---------------------------------------------------
SELECT
    name,
    department,
    salary
FROM employees
ORDER BY
    CASE
        WHEN department = 'HR' THEN 1
        WHEN department = 'IT' THEN 2
        ELSE 3
    END;

---------------------------------------------------
-- 4. CASE WHEN for grading system
---------------------------------------------------
SELECT
    name,
    marks,
    CASE
        WHEN marks >= 90 THEN 'A'
        WHEN marks >= 75 THEN 'B'
        WHEN marks >= 60 THEN 'C'
        ELSE 'Fail'
    END AS grade
FROM students;

---------------------------------------------------
-- 5. CASE WHEN with date conditions
---------------------------------------------------
SELECT
    order_id,
    amount,
    CASE
        WHEN order_date >= CURRENT_DATE - INTERVAL 30 DAY THEN 'Recent'
        ELSE 'Old'
    END AS order_type
FROM orders;

---------------------------------------------------
-- 6. CASE WHEN for conditional sums
---------------------------------------------------
SELECT
    customer_id,
    SUM(
        CASE
            WHEN amount >= 1000 THEN amount
            ELSE 0
        END
    ) AS high_value_sales
FROM orders
GROUP BY customer_id;

---------------------------------------------------
-- 7. CASE WHEN to handle NULL values
---------------------------------------------------
SELECT
    name,
    CASE
        WHEN department IS NULL THEN 'Unassigned'
        ELSE department
    END AS department_status
FROM employees;

---------------------------------------------------
-- 8. Nested CASE WHEN
---------------------------------------------------
SELECT
    name,
    salary,
    CASE
        WHEN department = 'IT' THEN
            CASE
                WHEN salary >= 70000 THEN 'Senior IT'
                ELSE 'Junior IT'
            END
        ELSE 'Non-IT'
    END AS role_category
FROM employees;

---------------------------------------------------
-- 9. CASE WHEN in WHERE clause
---------------------------------------------------
SELECT *
FROM employees
WHERE
    CASE
        WHEN department = 'IT' THEN salary > 60000
        ELSE salary > 40000
    END;

---------------------------------------------------
-- 10. CASE WHEN with COUNT
---------------------------------------------------
SELECT
    COUNT(
        CASE
            WHEN salary > 50000 THEN 1
        END
    ) AS high_salary_employees
FROM employees;
