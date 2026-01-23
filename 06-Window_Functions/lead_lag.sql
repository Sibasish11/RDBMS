-- lead_lag.sql
-- Demonstrates LEAD and LAG window functions with practical examples

-- Sample Table
-- sales(order_id, order_date, customer_id, amount)

---------------------------------------------------
-- 1. Show previous order amount using LAG
---------------------------------------------------
SELECT
    order_id,
    order_date,
    customer_id,
    amount,
    LAG(amount) OVER (ORDER BY order_date) AS previous_amount
FROM sales;

---------------------------------------------------
-- 2. Show next order amount using LEAD
---------------------------------------------------
SELECT
    order_id,
    order_date,
    customer_id,
    amount,
    LEAD(amount) OVER (ORDER BY order_date) AS next_amount
FROM sales;

---------------------------------------------------
-- 3. Difference between current and previous order amount
---------------------------------------------------
SELECT
    order_id,
    order_date,
    amount,
    amount - LAG(amount) OVER (ORDER BY order_date) AS amount_difference
FROM sales;

---------------------------------------------------
-- 4. Compare order amount within each customer
---------------------------------------------------
SELECT
    order_id,
    customer_id,
    order_date,
    amount,
    LAG(amount) OVER (PARTITION BY customer_id ORDER BY order_date) AS previous_customer_amount
FROM sales;

---------------------------------------------------
-- 5. Find increase or decrease in order amount
---------------------------------------------------
SELECT
    order_id,
    order_date,
    amount,
    CASE
        WHEN amount > LAG(amount) OVER (ORDER BY order_date) THEN 'Increase'
        WHEN amount < LAG(amount) OVER (ORDER BY order_date) THEN 'Decrease'
        ELSE 'No Change'
    END AS trend
FROM sales;

---------------------------------------------------
-- 6. Days difference between consecutive orders
---------------------------------------------------
SELECT
    order_id,
    order_date,
    LAG(order_date) OVER (ORDER BY order_date) AS previous_order_date,
    DATEDIFF(order_date, LAG(order_date) OVER (ORDER BY order_date)) AS days_difference
FROM sales;

---------------------------------------------------
-- 7. Compare each order with next order
---------------------------------------------------
SELECT
    order_id,
    order_date,
    amount,
    LEAD(amount) OVER (ORDER BY order_date) AS next_amount,
    LEAD(amount) OVER (ORDER BY order_date) - amount AS next_difference
FROM sales;

---------------------------------------------------
-- 8. Running comparison per customer
---------------------------------------------------
SELECT
    customer_id,
    order_id,
    order_date,
    amount,
    amount - LAG(amount) OVER (PARTITION BY customer_id ORDER BY order_date) AS customer_diff
FROM sales;
