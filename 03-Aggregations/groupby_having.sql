-- groupby_having.sql
-- Demonstrates GROUP BY and HAVING usage with examples

-- Sample Table
-- sales(order_id, customer_id, product, category, quantity, price)

---------------------------------------------------
-- 1. Total sales amount per category
---------------------------------------------------
SELECT 
    category,
    SUM(quantity * price) AS total_sales
FROM sales
GROUP BY category;

---------------------------------------------------
-- 2. Total quantity sold per product
---------------------------------------------------
SELECT
    product,
    SUM(quantity) AS total_quantity
FROM sales
GROUP BY product;

---------------------------------------------------
-- 3. Average price per category
---------------------------------------------------
SELECT
    category,
    AVG(price) AS avg_price
FROM sales
GROUP BY category;

---------------------------------------------------
-- 4. Number of orders per customer
---------------------------------------------------
SELECT
    customer_id,
    COUNT(order_id) AS total_orders
FROM sales
GROUP BY customer_id;

---------------------------------------------------
-- 5. Categories with total sales greater than 50000
---------------------------------------------------
SELECT
    category,
    SUM(quantity * price) AS total_sales
FROM sales
GROUP BY category
HAVING SUM(quantity * price) > 50000;

---------------------------------------------------
-- 6. Products with more than 100 units sold
---------------------------------------------------
SELECT
    product,
    SUM(quantity) AS total_quantity
FROM sales
GROUP BY product
HAVING SUM(quantity) > 100;

---------------------------------------------------
-- 7. Customers who placed more than 5 orders
---------------------------------------------------
SELECT
    customer_id,
    COUNT(order_id) AS order_count
FROM sales
GROUP BY customer_id
HAVING COUNT(order_id) > 5;

---------------------------------------------------
-- 8. Categories having average price above 1000
---------------------------------------------------
SELECT
    category,
    AVG(price) AS avg_price
FROM sales
GROUP BY category
HAVING AVG(price) > 1000;

---------------------------------------------------
-- 9. Find highest selling category
---------------------------------------------------
SELECT
    category,
    SUM(quantity * price) AS total_sales
FROM sales
GROUP BY category
ORDER BY total_sales DESC
LIMIT 1;

---------------------------------------------------
-- 10. Monthly total sales (if date column exists)
---------------------------------------------------
SELECT
    DATE_FORMAT(order_date, '%Y-%m') AS month,
    SUM(quantity * price) AS monthly_sales
FROM sales
GROUP BY month
ORDER BY month;
