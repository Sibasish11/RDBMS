-- indexes.sql
-- Demonstrates creating, using, and managing indexes in SQL

-- Sample Tables
-- employees(emp_id, name, department, salary)
-- orders(order_id, customer_id, order_date, amount)

---------------------------------------------------
-- 1. Create a basic index on a column
---------------------------------------------------
CREATE INDEX idx_employee_department
ON employees(department);

---------------------------------------------------
-- 2. Create a unique index
---------------------------------------------------
CREATE UNIQUE INDEX idx_employee_email
ON employees(email);

---------------------------------------------------
-- 3. Create a composite index (multiple columns)
---------------------------------------------------
CREATE INDEX idx_orders_customer_date
ON orders(customer_id, order_date);

---------------------------------------------------
-- 4. Check indexes on a table (MySQL)
---------------------------------------------------
SHOW INDEX FROM employees;

---------------------------------------------------
-- 5. Use EXPLAIN to verify index usage
---------------------------------------------------
EXPLAIN
SELECT *
FROM employees
WHERE department = 'IT';

---------------------------------------------------
-- 6. Drop an index
---------------------------------------------------
DROP INDEX idx_employee_department ON employees;

---------------------------------------------------
-- 7. Index for sorting optimization
---------------------------------------------------
CREATE INDEX idx_orders_amount
ON orders(amount);

EXPLAIN
SELECT *
FROM orders
ORDER BY amount;

---------------------------------------------------
-- 8. Index for JOIN optimization
---------------------------------------------------
CREATE INDEX idx_orders_customer
ON orders(customer_id);

EXPLAIN
SELECT
    c.name,
    o.amount
FROM customers c
INNER JOIN orders o
    ON c.customer_id = o.customer_id;

---------------------------------------------------
-- 9. Avoid indexing low-cardinality columns
---------------------------------------------------
-- Example: gender column may not benefit much from index

---------------------------------------------------
-- 10. Index maintenance example
---------------------------------------------------
ANALYZE TABLE employees;
