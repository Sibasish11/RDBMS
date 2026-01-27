-- views.sql
-- Demonstrates creating, using, updating, and dropping SQL views

-- Sample Tables
-- customers(customer_id, name, city)
-- orders(order_id, customer_id, order_date, amount)

---------------------------------------------------
-- 1. Create a simple view
---------------------------------------------------
CREATE VIEW customer_list AS
SELECT
    customer_id,
    name,
    city
FROM customers;

---------------------------------------------------
-- 2. View data from the view
---------------------------------------------------
SELECT * FROM customer_list;

---------------------------------------------------
-- 3. Create a view with JOIN
---------------------------------------------------
CREATE VIEW customer_orders AS
SELECT
    c.customer_id,
    c.name,
    o.order_id,
    o.order_date,
    o.amount
FROM customers c
INNER JOIN orders o
    ON c.customer_id = o.customer_id;

---------------------------------------------------
-- 4. Query the JOIN view
---------------------------------------------------
SELECT *
FROM customer_orders
WHERE amount > 5000;

---------------------------------------------------
-- 5. Create a view with aggregation
---------------------------------------------------
CREATE VIEW customer_total_spend AS
SELECT
    c.customer_id,
    c.name,
    SUM(o.amount) AS total_spent
FROM customers c
INNER JOIN orders o
    ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.name;

---------------------------------------------------
-- 6. Query aggregated view
---------------------------------------------------
SELECT *
FROM customer_total_spend
ORDER BY total_spent DESC;

---------------------------------------------------
-- 7. Update data through a view (if allowed)
---------------------------------------------------
UPDATE customer_list
SET city = 'Bangalore'
WHERE customer_id = 1;

---------------------------------------------------
-- 8. Replace existing view
---------------------------------------------------
CREATE OR REPLACE VIEW customer_list AS
SELECT
    customer_id,
    name,
    UPPER(city) AS city
FROM customers;

---------------------------------------------------
-- 9. Drop a view
---------------------------------------------------
DROP VIEW customer_list;

---------------------------------------------------
-- 10. Check existing views (MySQL)
---------------------------------------------------
SHOW FULL TABLES WHERE table_type = 'VIEW';
