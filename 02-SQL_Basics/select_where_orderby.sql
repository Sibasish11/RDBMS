-- select_where_orderby.sql
-- Demonstrates SELECT, WHERE, and ORDER BY clauses in SQL

-- Sample Table
CREATE TABLE products (
    product_id INT,
    name VARCHAR(50),
    category VARCHAR(50),
    price INT,
    rating DECIMAL(2,1)
);

INSERT INTO products VALUES
(1, 'Laptop', 'Electronics', 60000, 4.5),
(2, 'Mobile', 'Electronics', 30000, 4.2),
(3, 'Headphones', 'Accessories', 3000, 4.0),
(4, 'Chair', 'Furniture', 7000, 3.8),
(5, 'Table', 'Furniture', 12000, 4.1);

--------------------------------------------------
-- SELECT Clause
--------------------------------------------------

-- Select all columns
SELECT * FROM products;

-- Select specific columns
SELECT name, price FROM products;

--------------------------------------------------
-- WHERE Clause
--------------------------------------------------

-- Products with price greater than 10000
SELECT * FROM products
WHERE price > 10000;

-- Products from Electronics category
SELECT * FROM products
WHERE category = 'Electronics';

-- Products with rating greater than or equal to 4.0
SELECT * FROM products
WHERE rating >= 4.0;

--------------------------------------------------
-- ORDER BY Clause
--------------------------------------------------

-- Sort products by price ascending
SELECT * FROM products
ORDER BY price ASC;

-- Sort products by price descending
SELECT * FROM products
ORDER BY price DESC;

-- Sort products by rating descending
SELECT * FROM products
ORDER BY rating DESC;

--------------------------------------------------
-- WHERE + ORDER BY Combined
--------------------------------------------------

-- Electronics products sorted by price descending
SELECT * FROM products
WHERE category = 'Electronics'
ORDER BY price DESC;

-- Products with price above 5000 sorted by rating
SELECT name, price, rating FROM products
WHERE price > 5000
ORDER BY rating DESC;

--------------------------------------------------
-- LIMIT Clause (Optional)
--------------------------------------------------

-- Top 3 most expensive products
SELECT * FROM products
ORDER BY price DESC
LIMIT 3;

--------------------------------------------------
-- End of file
--------------------------------------------------
