-- multi_table_join.sql
-- Demonstrates joining multiple tables with practical examples

-- Sample Tables
-- customers(customer_id, name, city)
-- orders(order_id, customer_id, order_date)
-- order_items(order_item_id, order_id, product_id, quantity)
-- products(product_id, product_name, price)

---------------------------------------------------
-- 1. Display order details with customer name and product name
---------------------------------------------------
SELECT
    o.order_id,
    c.name AS customer_name,
    p.product_name,
    oi.quantity,
    p.price,
    (oi.quantity * p.price) AS total_price
FROM orders o
INNER JOIN customers c
    ON o.customer_id = c.customer_id
INNER JOIN order_items oi
    ON o.order_id = oi.order_id
INNER JOIN products p
    ON oi.product_id = p.product_id;

---------------------------------------------------
-- 2. Find total amount per order
---------------------------------------------------
SELECT
    o.order_id,
    SUM(oi.quantity * p.price) AS order_total
FROM orders o
INNER JOIN order_items oi
    ON o.order_id = oi.order_id
INNER JOIN products p
    ON oi.product_id = p.product_id
GROUP BY o.order_id;

---------------------------------------------------
-- 3. Find total sales per customer
---------------------------------------------------
SELECT
    c.customer_id,
    c.name,
    SUM(oi.quantity * p.price) AS total_spent
FROM customers c
INNER JOIN orders o
    ON c.customer_id = o.customer_id
INNER JOIN order_items oi
    ON o.order_id = oi.order_id
INNER JOIN products p
    ON oi.product_id = p.product_id
GROUP BY c.customer_id, c.name;

---------------------------------------------------
-- 4. Find top selling products by revenue
---------------------------------------------------
SELECT
    p.product_id,
    p.product_name,
    SUM(oi.quantity * p.price) AS total_revenue
FROM products p
INNER JOIN order_items oi
    ON p.product_id = oi.product_id
GROUP BY p.product_id, p.product_name
ORDER BY total_revenue DESC;

---------------------------------------------------
-- 5. Find total quantity sold per product
---------------------------------------------------
SELECT
    p.product_name,
    SUM(oi.quantity) AS total_quantity
FROM products p
INNER JOIN order_items oi
    ON p.product_id = oi.product_id
GROUP BY p.product_name
ORDER BY total_quantity DESC;

---------------------------------------------------
-- 6. Monthly revenue
---------------------------------------------------
SELECT
    DATE_FORMAT(o.order_date, '%Y-%m') AS month,
    SUM(oi.quantity * p.price) AS monthly_revenue
FROM orders o
INNER JOIN order_items oi
    ON o.order_id = oi.order_id
INNER JOIN products p
    ON oi.product_id = p.product_id
GROUP BY month
ORDER BY month;

---------------------------------------------------
-- 7. Customers who bought more than 5 products in total
---------------------------------------------------
SELECT
    c.customer_id,
    c.name,
    SUM(oi.quantity) AS total_products
FROM customers c
INNER JOIN orders o
    ON c.customer_id = o.customer_id
INNER JOIN order_items oi
    ON o.order_id = oi.order_id
GROUP BY c.customer_id, c.name
HAVING SUM(oi.quantity) > 5;

---------------------------------------------------
-- 8. Highest value order
---------------------------------------------------
SELECT
    o.order_id,
    SUM(oi.quantity * p.price) AS order_value
FROM orders o
INNER JOIN order_items oi
    ON o.order_id = oi.order_id
INNER JOIN products p
    ON oi.product_id = p.product_id
GROUP BY o.order_id
ORDER BY order_value DESC
LIMIT 1;
