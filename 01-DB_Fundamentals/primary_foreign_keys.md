# Primary Key and Foreign Key in RDBMS

## What Is a Primary Key?
A Primary Key is a column (or set of columns) that uniquely identifies each record in a table.

It ensures that:
- Each row is uniquely identifiable.
- No duplicate values exist.
- NULL values are not allowed.

Every table should have a primary key.


## Characteristics of Primary Key
- Must be unique  
- Cannot be NULL  
- Only one primary key per table  
- Can be single-column or composite  


## Example – Primary Key

```sql
CREATE TABLE students (
    student_id INT PRIMARY KEY,
    name VARCHAR(50),
    email VARCHAR(100)
);
```
## What Is a Foreign Key?

A Foreign Key is a column in one table that refers to the primary key of another table.

It creates a relationship between tables and enforces referential integrity.

## Characteristics of Foreign Key

Can contain duplicate values

Can contain NULL values (unless restricted)

References a primary key or unique key

Prevents invalid data entry

Example – Foreign Key
```sql
CREATE TABLE enrollments (
    enrollment_id INT PRIMARY KEY,
    student_id INT,
    FOREIGN KEY (student_id) REFERENCES students(student_id)
);
```
