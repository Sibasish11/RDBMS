# Tables, Rows, and Columns in RDBMS

## What Is a Table?
A table is the basic structure in a relational database where data is stored in an organized format of rows and columns.

Each table represents an entity such as Students, Employees, Orders, or Products.

A table contains:
- Columns (attributes or fields)
- Rows (records or tuples)

Example:
```
Students
------------------------
student_id | name | age
------------------------
101        | Alex | 20
102        | Sam  | 22
```

---

## What Is a Column?
A column represents a specific attribute of an entity.  
Each column has a defined data type and meaning.

Examples:
- student_id – Integer
- name – Text
- age – Integer

Characteristics:
- Stores one type of data
- Has a fixed data type
- Has a column name
- Can have constraints (NOT NULL, UNIQUE, etc.)

Example:
```
Column: age
Data Type: INT
Description: Stores student age
```

---

## What Is a Row?
A row represents a single record in a table.  
Each row contains values for all columns.

Example:
```
Row:
101 | Alex | 20
```

This row represents one student record.

Characteristics:
- Each row is unique
- Identified using a primary key
- Represents one real-world entity

---

## Relationship Between Table, Row, and Column

- A table contains many rows.
- A row contains values for multiple columns.
- A column defines what type of data can be stored.

Simple view:
```
Table  → Collection of rows  
Row    → Single record  
Column → Attribute of record  
```

---

## Practical Example Using SQL

Create a table:
```sql
CREATE TABLE students (
    student_id INT PRIMARY KEY,
    name VARCHAR(50),
    age INT
);
```

Insert data:
```sql
INSERT INTO students VALUES (101, 'Alex', 20);
```

Retrieve data:
```sql
SELECT * FROM students;
```

---

## Why Tables, Rows, and Columns Matter
- Organizes data in a structured format
- Makes searching and filtering efficient
- Enables relationships between datasets
- Forms the foundation of all database operations

---

## Summary

| Term | Meaning |
|------|---------|
| Table | Collection of related data |
| Row | Single record |
| Column | Attribute or field |
| Cell | Intersection of row and column |
