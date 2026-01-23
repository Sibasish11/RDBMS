-- subqueries.sql
-- Demonstrates non-correlated subqueries with practical examples

-- Sample Tables
-- employees(emp_id, name, department, salary)
-- orders(order_id, customer_id, amount)
-- products(product_id, category, price)

---------------------------------------------------
-- 1. Find employees earning more than the company average salary
---------------------------------------------------
SELECT
    emp_id,
    name,
    department,
    salary
FROM employees
WHERE salary >
(
    SELECT AVG(salary)
    FROM employees
);

---------------------------------------------------
-- 2. Find products priced higher than the overall average price
---------------------------------------------------
SELECT
    product_id,
    category,
    price
FROM products
WHERE price >
(
    SELECT AVG(price)
    FROM products
);

---------------------------------------------------
-- 3. Find customers who placed at least one order above average order amount
---------------------------------------------------
SELECT DISTINCT customer_id
FROM orders
WHERE amount >
(
    SELECT AVG(amount)
    FROM orders
);

---------------------------------------------------
-- 4. Find the highest paid employee
---------------------------------------------------
SELECT *
FROM employees
WHERE salary =
(
    SELECT MAX(salary)
    FROM employees
);

---------------------------------------------------
-- 5. Find second highest salary
---------------------------------------------------
SELECT MAX(salary) AS second_highest_salary
FROM employees
WHERE salary <
(
    SELECT MAX(salary)
    FROM employees
);

---------------------------------------------------
-- 6. Find products belonging to the most expensive category
---------------------------------------------------
SELECT *
FROM products
WHERE category =
(
    SELECT category
    FROM products
    GROUP BY category
    ORDER BY AVG(price) DESC
    LIMIT 1
);

---------------------------------------------------
-- 7. Find customers who never placed an order
---------------------------------------------------
SELECT customer_id, name
FROM customers
WHERE customer_id NOT IN
(
    SELECT DISTINCT customer_id
    FROM orders
);

---------------------------------------------------
-- 8. Find orders greater than the maximum order amount
-- of a specific customer (example: customer_id = 101)
---------------------------------------------------
SELECT *
FROM orders
WHERE amount >
(
    SELECT MAX(amount)
    FROM orders
    WHERE customer_id = 101
);

---------------------------------------------------
-- 9. Find employees belonging to departments with average salary above 60000
---------------------------------------------------
SELECT *
FROM employees
WHERE department IN
(
    SELECT department
    FROM employees
    GROUP BY department
    HAVING AVG(salary) > 60000
);

---------------------------------------------------
-- 10. Find products cheaper than all products in a category
-- Example: category = 'Electronics'
---------------------------------------------------
SELECT *
FROM products
WHERE price <
ALL
(
    SELECT price
    FROM products
    WHERE category = 'Electronics'
);
