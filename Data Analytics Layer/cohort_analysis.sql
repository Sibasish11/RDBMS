-- cohort_analysis.sql
-- User cohort analysis using SQL

---------------------------------------------------
-- Sample Table
---------------------------------------------------
CREATE TABLE users (
    user_id INT,
    signup_date DATE
);

CREATE TABLE orders (
    order_id INT,
    user_id INT,
    order_date DATE,
    amount DECIMAL(10,2)
);

---------------------------------------------------
-- 1. Assign users to cohorts (by signup month)
---------------------------------------------------
WITH user_cohorts AS (
    SELECT
        user_id,
        DATE_FORMAT(signup_date, '%Y-%m') AS cohort_month
    FROM users
)

SELECT * FROM user_cohorts;

---------------------------------------------------
-- 2. Monthly activity per user
---------------------------------------------------
WITH user_activity AS (
    SELECT
        user_id,
        DATE_FORMAT(order_date, '%Y-%m') AS activity_month
    FROM orders
)

SELECT * FROM user_activity;

---------------------------------------------------
-- 3. Cohort retention analysis
---------------------------------------------------
WITH user_cohorts AS (
    SELECT
        user_id,
        DATE_FORMAT(signup_date, '%Y-%m') AS cohort_month
    FROM users
),
user_activity AS (
    SELECT
        user_id,
        DATE_FORMAT(order_date, '%Y-%m') AS activity_month
    FROM orders
),
cohort_data AS (
    SELECT
        c.cohort_month,
        a.activity_month,
        TIMESTAMPDIFF(
            MONTH,
            STR_TO_DATE(CONCAT(c.cohort_month, '-01'), '%Y-%m-%d'),
            STR_TO_DATE(CONCAT(a.activity_month, '-01'), '%Y-%m-%d')
        ) AS month_number,
        COUNT(DISTINCT c.user_id) AS active_users
    FROM user_cohorts c
    JOIN user_activity a
        ON c.user_id = a.user_id
    GROUP BY c.cohort_month, a.activity_month
)

SELECT *
FROM cohort_data
ORDER BY cohort_month, month_number;

---------------------------------------------------
-- 4. Cohort size (initial users)
---------------------------------------------------
WITH user_cohorts AS (
    SELECT
        user_id,
        DATE_FORMAT(signup_date, '%Y-%m') AS cohort_month
    FROM users
)

SELECT
    cohort_month,
    COUNT(*) AS cohort_size
FROM user_cohorts
GROUP BY cohort_month;

---------------------------------------------------
-- 5. Retention percentage
---------------------------------------------------
WITH user_cohorts AS (
    SELECT
        user_id,
        DATE_FORMAT(signup_date, '%Y-%m') AS cohort_month
    FROM users
),
user_activity AS (
    SELECT
        user_id,
        DATE_FORMAT(order_date, '%Y-%m') AS activity_month
    FROM orders
),
cohort_activity AS (
    SELECT
        c.cohort_month,
        a.activity_month,
        TIMESTAMPDIFF(
            MONTH,
            STR_TO_DATE(CONCAT(c.cohort_month, '-01'), '%Y-%m-%d'),
            STR_TO_DATE(CONCAT(a.activity_month, '-01'), '%Y-%m-%d')
        ) AS month_number,
        COUNT(DISTINCT c.user_id) AS active_users
    FROM user_cohorts c
    JOIN user_activity a
        ON c.user_id = a.user_id
    GROUP BY c.cohort_month, a.activity_month
),
cohort_size AS (
    SELECT
        DATE_FORMAT(signup_date, '%Y-%m') AS cohort_month,
        COUNT(*) AS size
    FROM users
    GROUP BY DATE_FORMAT(signup_date, '%Y-%m')
)

SELECT
    ca.cohort_month,
    ca.month_number,
    ca.active_users,
    ROUND((ca.active_users / cs.size) * 100, 2) AS retention_rate
FROM cohort_activity ca
JOIN cohort_size cs
    ON ca.cohort_month = cs.cohort_month
ORDER BY ca.cohort_month, ca.month_number;

---------------------------------------------------
-- 6. Revenue-based cohort analysis
---------------------------------------------------
WITH user_cohorts AS (
    SELECT
        user_id,
        DATE_FORMAT(signup_date, '%Y-%m') AS cohort_month
    FROM users
)

SELECT
    c.cohort_month,
    DATE_FORMAT(o.order_date, '%Y-%m') AS revenue_month,
    SUM(o.amount) AS total_revenue
FROM user_cohorts c
JOIN orders o
    ON c.user_id = o.user_id
GROUP BY c.cohort_month, revenue_month
ORDER BY c.cohort_month, revenue_month;
