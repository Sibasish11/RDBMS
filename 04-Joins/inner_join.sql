-- inner_join.sql
-- Demonstrates INNER JOIN with practical examples

-- Sample Tables
-- customers(customer_id, name, city)
-- orders(order_id, customer_id, order_date, amount)

---------------------------------------------------
-- 1. View all orders with customer details
---------------------------------------------------
SELECT
    c.customer_id,
    c.name,
    c.city,
    o.order_id,
    o.order_date,
    o.amount
FROM customers c
INNER JOIN orders o
    ON c.customer_id = o.customer_id;

---------------------------------------------------
-- 2. Find total order amount per customer
---------------------------------------------------
SELECT
    c.customer_id,
    c.name,
    SUM(o.amount) AS total_spent
FROM customers c
INNER JOIN orders o
    ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.name;

---------------------------------------------------
-- 3. Find customers who placed more than 3 orders
---------------------------------------------------
SELECT
    c.customer_id,
    c.name,
    COUNT(o.order_id) AS order_count
FROM customers c
INNER JOIN orders o
    ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.name
HAVING COUNT(o.order_id) > 3;

---------------------------------------------------
-- 4. Display recent orders with customer name
---------------------------------------------------
SELECT
    o.order_id,
    c.name,
    o.order_date,
    o.amount
FROM orders o
INNER JOIN customers c
    ON o.customer_id = c.customer_id
ORDER BY o.order_date DESC;

---------------------------------------------------
-- 5. Find customers from a specific city with orders
---------------------------------------------------
SELECT
    c.customer_id,
    c.name,
    c.city,
    o.order_id,
    o.amount
FROM customers c
INNER JOIN orders o
    ON c.customer_id = o.customer_id
WHERE c.city = 'Mumbai';

---------------------------------------------------
-- 6. Average order amount per customer
---------------------------------------------------
SELECT
    c.customer_id,
    c.name,
    AVG(o.amount) AS avg_order_amount
FROM customers c
INNER JOIN orders o
    ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.name;

---------------------------------------------------
-- 7. Highest spending customer
---------------------------------------------------
SELECT
    c.customer_id,
    c.name,
    SUM(o.amount) AS total_spent
FROM customers c
INNER JOIN orders o
    ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.name
ORDER BY total_spent DESC
LIMIT 1;
