# 🧱 Database Constraints in RDBMS

## 📌 What Are Constraints?
Constraints are rules applied to table columns to maintain **data accuracy, consistency, and integrity** in a relational database.  
They prevent invalid data from being inserted, updated, or deleted.

> Example: Preventing duplicate IDs, ensuring values are not NULL, or enforcing valid relationships between tables.


## 🎯 Why Constraints Are Important
- Ensures data integrity  
- Avoids duplicate and invalid data  
- Maintains relationships between tables  
- Improves data reliability  
- Helps enforce business rules  


## 🔑 Types of Constraints

### 1️⃣ NOT NULL
Ensures that a column cannot have NULL values.

```sql
CREATE TABLE users (
    id INT NOT NULL,
    name VARCHAR(50) NOT NULL
);
```
2️⃣ UNIQUE

Ensures all values in a column are unique.
```sql
CREATE TABLE users (
    email VARCHAR(100) UNIQUE
);
```

✔️ Prevents duplicate entries
✔️ Multiple UNIQUE constraints allowed per table

## PRIMARY KEY

Uniquely identifies each record in a table.
Combination of NOT NULL + UNIQUE.

```sql
CREATE TABLE users (
    id INT PRIMARY KEY,
    name VARCHAR(50)
);
```

✔️ Only one primary key per table
✔️ Cannot contain NULL values

4️⃣ FOREIGN KEY

Creates a relationship between two tables.

```sql
CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    user_id INT,
    FOREIGN KEY (user_id) REFERENCES users(id)
);
```

✔️ Maintains referential integrity
✔️ Prevents orphan records

5️⃣ CHECK

Ensures values satisfy a condition.
```sql
CREATE TABLE students (
    age INT CHECK (age >= 18)
);
```
