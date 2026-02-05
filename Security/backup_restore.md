-- reporting_views.sql
-- Creating database views for reporting and analytics

---------------------------------------------------
-- Sample Tables
---------------------------------------------------
-- users(user_id, name, city, signup_date)
-- orders(order_id, user_id, order_date, amount)
-- products(product_id, product_name, category, price)
-- order_items(order_id, product_id, quantity)

---------------------------------------------------
-- 1. View: Customer Order Summary
---------------------------------------------------
CREATE VIEW vw_customer_order_summary AS
SELECT
    u.user_id,
    u.name,
    u.city,
    COUNT(o.order_id) AS total_orders,
    COALESCE(SUM(o.amount), 0) AS total_spent
FROM users u
LEFT JOIN orders o
    ON u.user_id = o.user_id
GROUP BY u.user_id, u.name, u.city;

---------------------------------------------------
-- 2. View: Daily Sales Report
---------------------------------------------------
CREATE VIEW vw_daily_sales AS
SELECT
    order_date,
    COUNT(order_id) AS total_orders,
    SUM(amount) AS total_revenue
FROM orders
GROUP BY order_date;

---------------------------------------------------
-- 3. View: Monthly Revenue Report
---------------------------------------------------
CREATE VIEW vw_monthly_revenue AS
SELECT
    DATE_FORMAT(order_date, '%Y-%m') AS month,
    SUM(amount) AS monthly_revenue
FROM orders
GROUP BY month;

---------------------------------------------------
-- 4. View: Product Sales Performance
---------------------------------------------------
CREATE VIEW vw_product_sales AS
SELECT
    p.product_id,
    p.product_name,
    p.category,
    SUM(oi.quantity) AS units_sold,
    SUM(oi.quantity * p.price) AS revenue
FROM products p
JOIN order_items oi
    ON p.product_id = oi.product_id
GROUP BY p.product_id, p.product_name, p.category;

---------------------------------------------------
-- 5. View: Top Customers
---------------------------------------------------
CREATE VIEW vw_top_customers AS
SELECT
    u.user_id,
    u.name,
    SUM(o.amount) AS total_spent
FROM users u
JOIN orders o
    ON u.user_id = o.user_id
GROUP BY u.user_id, u.name
ORDER BY total_spent DESC;

---------------------------------------------------
-- 6. View: Repeat Customers
---------------------------------------------------
CREATE VIEW vw_repeat_customers AS
SELECT
    user_id,
    COUNT(order_id) AS order_count
FROM orders
GROUP BY user_id
HAVING COUNT(order_id) > 1;

---------------------------------------------------
-- 7. View: Category Revenue
---------------------------------------------------
CREATE VIEW vw_category_revenue AS
SELECT
    p.category,
    SUM(oi.quantity * p.price) AS category_revenue
FROM products p
JOIN order_items oi
    ON p.product_id = oi.product_id
GROUP BY p.category;

---------------------------------------------------
-- 8. Querying a view
---------------------------------------------------
SELECT *
FROM vw_monthly_revenue
ORDER BY month;

---------------------------------------------------
-- 9. Updating views (conceptual)
---------------------------------------------------
-- Views based on single tables may be updatable
-- Complex views with joins and aggregates are read-only

---------------------------------------------------
-- 10. Dropping a view
---------------------------------------------------
-- DROP VIEW vw_customer_order_summary;
