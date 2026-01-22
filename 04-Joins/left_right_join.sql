-- left_right_join.sql
-- Demonstrates LEFT JOIN and RIGHT JOIN with practical examples

-- Sample Tables
-- customers(customer_id, name, city)
-- orders(order_id, customer_id, order_date, amount)

---------------------------------------------------
-- LEFT JOIN EXAMPLES
---------------------------------------------------

-- 1. Display all customers and their orders (including customers with no orders)
SELECT
    c.customer_id,
    c.name,
    c.city,
    o.order_id,
    o.order_date,
    o.amount
FROM customers c
LEFT JOIN orders o
    ON c.customer_id = o.customer_id;

---------------------------------------------------

-- 2. Find customers who have not placed any orders
SELECT
    c.customer_id,
    c.name,
    c.city
FROM customers c
LEFT JOIN orders o
    ON c.customer_id = o.customer_id
WHERE o.order_id IS NULL;

---------------------------------------------------

-- 3. Count number of orders per customer (including zero orders)
SELECT
    c.customer_id,
    c.name,
    COUNT(o.order_id) AS total_orders
FROM customers c
LEFT JOIN orders o
    ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.name;

---------------------------------------------------

-- 4. Display customers from a specific city with their orders
SELECT
    c.customer_id,
    c.name,
    c.city,
    o.order_id,
    o.amount
FROM customers c
LEFT JOIN orders o
    ON c.customer_id = o.customer_id
WHERE c.city = 'Delhi';

---------------------------------------------------
-- RIGHT JOIN EXAMPLES
---------------------------------------------------

-- 5. Display all orders and their customer details (including unmatched orders)
SELECT
    o.order_id,
    o.order_date,
    o.amount,
    c.customer_id,
    c.name,
    c.city
FROM customers c
RIGHT JOIN orders o
    ON c.customer_id = o.customer_id;

---------------------------------------------------

-- 6. Find orders that do not have matching customers
SELECT
    o.order_id,
    o.order_date,
    o.amount
FROM customers c
RIGHT JOIN orders o
    ON c.customer_id = o.customer_id
WHERE c.customer_id IS NULL;

---------------------------------------------------

-- 7. Total order amount per customer using RIGHT JOIN
SELECT
    c.customer_id,
    c.name,
    SUM(o.amount) AS total_spent
FROM customers c
RIGHT JOIN orders o
    ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.name;

---------------------------------------------------

-- 8. Compare LEFT JOIN and RIGHT JOIN result counts
SELECT COUNT(*) AS left_join_count
FROM customers c
LEFT JOIN orders o
    ON c.customer_id = o.customer_id;

SELECT COUNT(*) AS right_join_count
FROM customers c
RIGHT JOIN orders o
    ON c.customer_id = o.customer_id;
