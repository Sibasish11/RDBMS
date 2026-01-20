# What Is RDBMS?

## Definition
RDBMS stands for **Relational Database Management System**.  
It is a software system used to store, manage, and retrieve data in the form of **tables** consisting of rows and columns.

RDBMS follows the **relational model**, where data is organized into related tables and connected using keys.

Examples of RDBMS:
- MySQL  
- PostgreSQL  
- Oracle  
- SQL Server  
- SQLite  

---

## Key Components of RDBMS

### Table
A structured collection of data stored in rows and columns.

### Row
A single record in a table.

### Column
An attribute or field that defines the type of data stored.

### Primary Key
Uniquely identifies each record in a table.

### Foreign Key
Creates a relationship between two tables.

---

## How RDBMS Works
- Data is stored in tables.
- Each table represents one entity.
- Tables are linked using primary and foreign keys.
- SQL is used to query and manipulate data.
- Integrity rules ensure data consistency.

---

## Features of RDBMS
- Structured data storage  
- Data integrity and consistency  
- Support for relationships  
- ACID properties (Atomicity, Consistency, Isolation, Durability)  
- Security and access control  
- Backup and recovery support  
- Multi-user access  


## Advantages of RDBMS
- Easy data retrieval using SQL  
- Reduces data redundancy  
- Maintains data accuracy  
- Scalable and reliable  
- Supports complex queries  
- Strong security features  

## Limitations of RDBMS
- Rigid schema design  
- Not ideal for unstructured data  
- Can become complex for very large systems  
- Scaling horizontally is harder than NoSQL  


## Simple Example

Table: Students

```
student_id | name | age
-----------------------
101        | Alex | 20
102        | Sam  | 22
```

## SQL Example

Create table:
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


## Summary

| Concept | Description |
|---------|-------------|
| RDBMS | Database system based on relational model |
| Table | Stores data in rows and columns |
| SQL | Language used to interact with database |
| Keys | Used to relate tables |
| Integrity | Ensures accurate data |

