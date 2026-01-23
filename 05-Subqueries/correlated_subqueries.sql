-- correlated_subqueries.sql
-- Demonstrates correlated subqueries with practical examples

-- Sample Tables
-- employees(emp_id, name, department, salary)
-- orders(order_id, customer_id, amount)
-- products(product_id, category, price)

---------------------------------------------------
-- 1. Find employees earning more than the average salary of their department
---------------------------------------------------
SELECT
    e.emp_id,
    e.name,
    e.department,
    e.salary
FROM employees e
WHERE e.salary >
(
    SELECT AVG(e2.salary)
    FROM employees e2
    WHERE e2.department = e.department
);

---------------------------------------------------
-- 2. Find customers whose order amount is greater than their own average order amount
---------------------------------------------------
SELECT
    o.order_id,
    o.customer_id,
    o.amount
FROM orders o
WHERE o.amount >
(
    SELECT AVG(o2.amount)
    FROM orders o2
    WHERE o2.customer_id = o.customer_id
);

---------------------------------------------------
-- 3. Find products priced higher than the average price of their category
---------------------------------------------------
SELECT
    p.product_id,
    p.category,
    p.price
FROM products p
WHERE p.price >
(
    SELECT AVG(p2.price)
    FROM products p2
    WHERE p2.category = p.category
);

---------------------------------------------------
-- 4. Find employees who earn the highest salary in their department
---------------------------------------------------
SELECT
    e.emp_id,
    e.name,
    e.department,
    e.salary
FROM employees e
WHERE e.salary =
(
    SELECT MAX(e2.salary)
    FROM employees e2
    WHERE e2.department = e.department
);

---------------------------------------------------
-- 5. Find customers who placed more orders than the average number of orders
---------------------------------------------------
SELECT DISTINCT o.customer_id
FROM orders o
WHERE
(
    SELECT COUNT(*)
    FROM orders o2
    WHERE o2.customer_id = o.customer_id
)
>
(
    SELECT AVG(order_count)
    FROM
    (
        SELECT COUNT(*) AS order_count
        FROM orders
        GROUP BY customer_id
    ) AS customer_orders
);

---------------------------------------------------
-- 6. Find products that are the most expensive in their category
---------------------------------------------------
SELECT
    p.product_id,
    p.category,
    p.price
FROM products p
WHERE p.price =
(
    SELECT MAX(p2.price)
    FROM products p2
    WHERE p2.category = p.category
);

---------------------------------------------------
-- 7. Find orders that are higher than the customer's maximum previous order
---------------------------------------------------
SELECT
    o.order_id,
    o.customer_id,
    o.amount
FROM orders o
WHERE o.amount >
(
    SELECT MAX(o2.amount)
    FROM orders o2
    WHERE o2.customer_id = o.customer_id
      AND o2.order_id < o.order_id
);

---------------------------------------------------
-- 8. Find employees whose salary is above company average but below department maximum
---------------------------------------------------
SELECT
    e.emp_id,
    e.name,
    e.department,
    e.salary
FROM employees e
WHERE e.salary >
(
    SELECT AVG(salary) FROM employees
)
AND e.salary <
(
    SELECT MAX(e2.salary)
    FROM employees e2
    WHERE e2.department = e.department
);
