-- kpi_queries.sql
-- Key Performance Indicator (KPI) queries using SQL

---------------------------------------------------
-- Sample Tables
---------------------------------------------------
-- users(user_id, signup_date)
-- orders(order_id, user_id, order_date, amount)
-- products(product_id, category, price)
-- order_items(order_id, product_id, quantity)

---------------------------------------------------
-- 1. Total Revenue
---------------------------------------------------
SELECT
    SUM(amount) AS total_revenue
FROM orders;

---------------------------------------------------
-- 2. Monthly Revenue
---------------------------------------------------
SELECT
    DATE_FORMAT(order_date, '%Y-%m') AS month,
    SUM(amount) AS monthly_revenue
FROM orders
GROUP BY month
ORDER BY month;

---------------------------------------------------
-- 3. Average Order Value (AOV)
---------------------------------------------------
SELECT
    ROUND(AVG(amount), 2) AS average_order_value
FROM orders;

---------------------------------------------------
-- 4. Orders per User
---------------------------------------------------
SELECT
    COUNT(order_id) / COUNT(DISTINCT user_id) AS orders_per_user
FROM orders;

---------------------------------------------------
-- 5. Active Users
---------------------------------------------------
SELECT
    COUNT(DISTINCT user_id) AS active_users
FROM orders;

---------------------------------------------------
-- 6. New Users
---------------------------------------------------
SELECT
    COUNT(*) AS new_users
FROM users
WHERE signup_date >= CURRENT_DATE - INTERVAL 30 DAY;

---------------------------------------------------
-- 7. Customer Lifetime Value (CLV)
---------------------------------------------------
SELECT
    user_id,
    SUM(amount) AS lifetime_value
FROM orders
GROUP BY user_id
ORDER BY lifetime_value DESC;

---------------------------------------------------
-- 8. Revenue per User (ARPU)
---------------------------------------------------
SELECT
    ROUND(SUM(amount) / COUNT(DISTINCT user_id), 2) AS revenue_per_user
FROM orders;

---------------------------------------------------
-- 9. Repeat Customer Rate
---------------------------------------------------
SELECT
    ROUND(
        COUNT(DISTINCT CASE WHEN order_count > 1 THEN user_id END) /
        COUNT(DISTINCT user_id) * 100,
        2
    ) AS repeat_customer_rate
FROM (
    SELECT user_id, COUNT(order_id) AS order_count
    FROM orders
    GROUP BY user_id
) t;

---------------------------------------------------
-- 10. Churn Rate (conceptual)
---------------------------------------------------
-- Users with no orders in last 60 days
SELECT
    COUNT(*) AS churned_users
FROM users
WHERE user_id NOT IN (
    SELECT DISTINCT user_id
    FROM orders
    WHERE order_date >= CURRENT_DATE - INTERVAL 60 DAY
);

---------------------------------------------------
-- 11. Top Revenue Categories
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
-- 12. Conversion Rate (Signup → Purchase)
---------------------------------------------------
SELECT
    ROUND(
        COUNT(DISTINCT o.user_id) / COUNT(DISTINCT u.user_id) * 100,
        2
    ) AS conversion_rate
FROM users u
LEFT JOIN orders o
    ON u.user_id = o.user_id;

---------------------------------------------------
-- 13. Average Revenue per Paying User (ARPPU)
---------------------------------------------------
SELECT
    ROUND(SUM(amount) / COUNT(DISTINCT user_id), 2) AS arppu
FROM orders;

---------------------------------------------------
-- 14. Revenue Growth Rate
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
    ROUND(
        (revenue - LAG(revenue) OVER (ORDER BY month)) /
        LAG(revenue) OVER (ORDER BY month) * 100,
        2
    ) AS growth_rate
FROM monthly_revenue;
