-- aggregate_functions.sql
-- Demonstrates SQL aggregate functions: COUNT, SUM, AVG, MIN, MAX

-- Sample Table
CREATE TABLE sales (
    sale_id INT,
    product VARCHAR(50),
    category VARCHAR(50),
    quantity INT,
    price INT,
    region VARCHAR(50)
);

INSERT INTO sales VALUES
(1, 'Laptop', 'Electronics', 2, 60000, 'North'),
(2, 'Mobile', 'Electronics', 5, 30000, 'South'),
(3, 'Chair', 'Furniture', 4, 7000, 'East'),
(4, 'Table', 'Furniture', 1, 12000, 'West'),
(5, 'Headphones', 'Accessories', 6, 3000, 'North'),
(6, 'Monitor', 'Electronics', 3, 20000, 'East');

--------------------------------------------------
-- COUNT Function
--------------------------------------------------

-- Total number of sales records
SELECT COUNT(*) AS total_sales FROM sales;

-- Count products sold in Electronics category
SELECT COUNT(*) AS electronics_sales
FROM sales
WHERE category = 'Electronics';

--------------------------------------------------
-- SUM Function
--------------------------------------------------

-- Total quantity sold
SELECT SUM(quantity) AS total_quantity FROM sales;

-- Total revenue (quantity * price)
SELECT SUM(quantity * price) AS total_revenue FROM sales;

--------------------------------------------------
-- AVG Function
--------------------------------------------------

-- Average price of products
SELECT AVG(price) AS avg_price FROM sales;

-- Average quantity per sale
SELECT AVG(quantity) AS avg_quantity FROM sales;

--------------------------------------------------
-- MIN Function
--------------------------------------------------

-- Lowest product price
SELECT MIN(price) AS lowest_price FROM sales;

-- Minimum quantity sold in a sale
SELECT MIN(quantity) AS min_quantity FROM sales;

--------------------------------------------------
-- MAX Function
--------------------------------------------------

-- Highest product price
SELECT MAX(price) AS highest_price FROM sales;

-- Maximum quantity sold in a sale
SELECT MAX(quantity) AS max_quantity FROM sales;

--------------------------------------------------
-- Using Multiple Aggregates Together
--------------------------------------------------

SELECT 
    COUNT(*) AS total_records,
    SUM(quantity) AS total_units,
    AVG(price) AS avg_price,
    MIN(price) AS min_price,
    MAX(price) AS max_price
FROM sales;

--------------------------------------------------
-- End of file
--------------------------------------------------
