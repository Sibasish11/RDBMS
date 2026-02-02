-- pivot_unpivot.sql
-- Demonstrates PIVOT and UNPIVOT operations in SQL

---------------------------------------------------
-- Sample Table
---------------------------------------------------
CREATE TABLE sales (
    product VARCHAR(50),
    month VARCHAR(10),
    revenue INT
);

INSERT INTO sales VALUES
('Laptop', 'Jan', 50000),
('Laptop', 'Feb', 60000),
('Laptop', 'Mar', 55000),
('Phone',  'Jan', 30000),
('Phone',  'Feb', 35000),
('Phone',  'Mar', 40000);

---------------------------------------------------
-- 1. Pivot using conditional aggregation (ANSI SQL)
---------------------------------------------------
SELECT
    product,
    SUM(CASE WHEN month = 'Jan' THEN revenue ELSE 0 END) AS Jan,
    SUM(CASE WHEN month = 'Feb' THEN revenue ELSE 0 END) AS Feb,
    SUM(CASE WHEN month = 'Mar' THEN revenue ELSE 0 END) AS Mar
FROM sales
GROUP BY product;

---------------------------------------------------
-- 2. Pivot using PIVOT (Oracle / SQL Server)
---------------------------------------------------
/*
SELECT *
FROM sales
PIVOT (
    SUM(revenue)
    FOR month IN ('Jan' AS Jan, 'Feb' AS Feb, 'Mar' AS Mar)
);
*/

---------------------------------------------------
-- 3. Unpivot using UNION ALL (ANSI SQL)
---------------------------------------------------
SELECT product, 'Jan' AS month, Jan AS revenue
FROM (
    SELECT
        product,
        SUM(CASE WHEN month = 'Jan' THEN revenue END) AS Jan,
        SUM(CASE WHEN month = 'Feb' THEN revenue END) AS Feb,
        SUM(CASE WHEN month = 'Mar' THEN revenue END) AS Mar
    FROM sales
    GROUP BY product
) p
UNION ALL
SELECT product, 'Feb', Feb FROM (
    SELECT
        product,
        SUM(CASE WHEN month = 'Jan' THEN revenue END) AS Jan,
        SUM(CASE WHEN month = 'Feb' THEN revenue END) AS Feb,
        SUM(CASE WHEN month = 'Mar' THEN revenue END) AS Mar
    FROM sales
    GROUP BY product
) p
UNION ALL
SELECT product, 'Mar', Mar FROM (
    SELECT
        product,
        SUM(CASE WHEN month = 'Jan' THEN revenue END) AS Jan,
        SUM(CASE WHEN month = 'Feb' THEN revenue END) AS Feb,
        SUM(CASE WHEN month = 'Mar' THEN revenue END) AS Mar
    FROM sales
    GROUP BY product
) p;

---------------------------------------------------
-- 4. Unpivot using UNPIVOT (Oracle / SQL Server)
---------------------------------------------------
/*
SELECT product, month, revenue
FROM pivoted_sales
UNPIVOT (
    revenue FOR month IN (Jan, Feb, Mar)
);
*/

---------------------------------------------------
-- 5. Dynamic Pivot (conceptual example)
---------------------------------------------------
-- Dynamic pivot uses dynamic SQL to generate month columns
-- Used when pivot values are not known beforehand

---------------------------------------------------
-- 6. Pivot for analytics (Top categories per period)
---------------------------------------------------
SELECT
    month,
    SUM(CASE WHEN product = 'Laptop' THEN revenue ELSE 0 END) AS Laptop,
    SUM(CASE WHEN product = 'Phone' THEN revenue ELSE 0 END) AS Phone
FROM sales
GROUP BY month;
