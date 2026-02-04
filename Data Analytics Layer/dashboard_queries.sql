-- dashboard_queries.sql
-- SQL queries commonly used in analytics dashboards

---------------------------------------------------
-- Sample Tables
---------------------------------------------------
-- users(user_id, signup_date, city)
-- orders(order_id, user_id, order_date, amount)
-- products(product_id, category, price)
-- order_items(order_id, product_id, quantity)

---------------------------------------------------
-- 1. Total revenue (KPI)
---------------------------------------------------
SELECT
    SUM(amount) AS total_revenue
FROM orders;

---------------------------------------------------
-- 2. Revenue by date
---------------------------------------------------
SELECT
    order_date,
    SUM(amount) AS daily_revenue
FROM orders
GROUP BY order_date
ORDER BY order_date;

---------------------------------------------------
-- 3. Monthly revenue trend
---------------------------------------------------
SELECT
    DATE_FORMAT(order_date, '%Y-%m') AS month,
    SUM(amount) AS monthly_revenue
FROM orders
GROUP BY month
ORDER BY month;

---------------------------------------------------
-- 4. Average order value (AOV)
---------------------------------------------------
SELECT
    ROUND(AVG(amount), 2) AS avg_order_value
FROM orders;

---------------------------------------------------
-- 5. Active users per month
---------------------------------------------------
SELECT
    DATE_FORMAT(order_date, '%Y-%m') AS month,
    COUNT(DISTINCT user_id) AS active_users
FROM orders
GROUP BY month
ORDER BY month;

---------------------------------------------------
-- 6. New users per month
---------------------------------------------------
SELECT
    DATE_FORMAT(signup_date, '%Y-%m') AS month,
    COUNT(*) AS new_users
FROM users
GROUP BY month
ORDER BY month;

---------------------------------------------------
-- 7. Revenue by city
---------------------------------------------------
SELECT
    u.city,
    SUM(o.amount) AS city_revenue
FROM orders o
JOIN users u
    ON o.user_id = u.user_id
GROUP BY u.city
ORDER BY city_revenue DESC;

---------------------------------------------------
-- 8. Top selling products
---------------------------------------------------
SELECT
    p.product_id,
    p.category,
    SUM(oi.quantity) AS total_quantity_sold
FROM order_items oi
JOIN products p
    ON oi.product_id = p.product_id
GROUP BY p.product_id, p.category
ORDER BY total_quantity_sold DESC
LIMIT 10;

---------------------------------------------------
-- 9. Revenue by product category
---------------------------------------------------
SELECT
    p.category,
    SUM(oi.quantity * p.price) AS category_revenue
FROM order_items oi
JOIN products p
    ON oi.product_id = p.product_id
GROUP BY p.category
ORDER BY category_revenue DESC;

---------------------------------------------------
-- 10. Customer lifetime value (CLV)
---------------------------------------------------
SELECT
    user_id,
    SUM(amount) AS lifetime_value
FROM orders
GROUP BY user_id
ORDER BY lifetime_value DESC;

---------------------------------------------------
-- 11. Conversion funnel (signup → purchase)
---------------------------------------------------
SELECT
    COUNT(DISTINCT u.user_id) AS total_signups,
    COUNT(DISTINCT o.user_id) AS purchasing_users
FROM users u
LEFT JOIN orders o
    ON u.user_id = o.user_id;

---------------------------------------------------
-- 12. Repeat customers
---------------------------------------------------
SELECT
    user_id,
    COUNT(order_id) AS total_orders
FROM orders
GROUP BY user_id
HAVING COUNT(order_id) > 1;

---------------------------------------------------
-- 13. Revenue last 7 days
---------------------------------------------------
SELECT
    SUM(amount) AS last_7_days_revenue
FROM orders
WHERE order_date >= CURRENT_DATE - INTERVAL 7 DAY;

---------------------------------------------------
-- 14. Month-over-month growth
---------------------------------------------------
WITH monthly_revenue AS (
    SELECT
        DATE_FORMAT(order_date, '%Y-%m') AS month,
        SUM(amount) AS revenue
    FROM orders
    GROUP BY month
)

SELECT
    month,
    revenue,
    revenue - LAG(revenue) OVER (ORDER BY month) AS revenue_change
FROM monthly_revenue;
