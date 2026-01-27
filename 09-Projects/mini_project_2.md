# Mini Project 2: Sales Analytics System (RDBMS)

## Objective
Build a relational database system to store and analyze sales data for a small business.  
The project focuses on transactional data modeling, aggregations, joins, indexing, and performance analysis.

---

## Entities

### Customers
- customer_id (PK)
- name
- email
- city
- signup_date

### Products
- product_id (PK)
- product_name
- category
- price

### Orders
- order_id (PK)
- customer_id (FK)
- order_date
- total_amount

### Order_Items
- order_item_id (PK)
- order_id (FK)
- product_id (FK)
- quantity
- unit_price

---

## Relationships
- A customer can place many orders.
- An order can contain multiple products.
- Each product can appear in many orders.
- Order_Items connects Orders and Products.

---

## Database Design

### Normalization
- Tables follow 3NF.
- Product and customer data are separated from transactional data.
- No duplicate storage of calculated values.

---

## Constraints

- Primary keys on all tables.
- Foreign keys to enforce referential integrity.
- NOT NULL on mandatory fields.
- Price and quantity validation using CHECK constraints.
- Unique email for customers.

---

## Schema Example

```sql
CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE,
    city VARCHAR(50),
    signup_date DATE
);

CREATE TABLE products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100),
    category VARCHAR(50),
    price DECIMAL(10,2) CHECK (price > 0)
);

CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    total_amount DECIMAL(10,2),
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

CREATE TABLE order_items (
    order_item_id INT PRIMARY KEY,
    order_id INT,
    product_id INT,
    quantity INT CHECK (quantity > 0),
    unit_price DECIMAL(10,2),
    FOREIGN KEY (order_id) REFERENCES orders(order_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);
```

---

## Sample Queries

1. Total sales per month.
2. Top 5 selling products by quantity.
3. Revenue by product category.
4. Customers with highest total purchases.
5. Orders with more than 5 items.
6. Products never sold.
7. Average order value per customer.

---

## Optimization

- Index foreign keys and frequently filtered columns.
- Use EXPLAIN PLAN to analyze joins.
- Partition orders table by date (optional).
- Avoid unnecessary subqueries.

---

## Deliverables

- Schema SQL file
- Sample data insert file
- Analytics queries file
- README documentation

---

## Extensions

- Discount and coupon system
- Inventory tracking
- Daily sales dashboard
- Data export to BI tools
