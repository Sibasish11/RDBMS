# Database Normalization in RDBMS

## What Is Normalization?
Normalization is the process of organizing data in a database to reduce **redundancy**, avoid **data anomalies**, and improve **data integrity**.

It involves dividing large tables into smaller related tables and defining relationships between them.

> Goal: Store data efficiently without unnecessary duplication.


## Why Normalization Is Important
- Eliminates data redundancy  
- Prevents data inconsistency  
- Improves data integrity  
- Reduces storage waste  
- Makes database easier to maintain  


## Problems Without Normalization

### ❌ Data Redundancy
Same data stored multiple times.

### ❌ Update Anomaly
Updating data in one place but forgetting another.

### ❌ Insert Anomaly
Unable to insert data due to missing related data.

### ❌ Delete Anomaly
Deleting data accidentally removes important information.


## Normal Forms


### First Normal Form (1NF)
**Rules:**
- Each column contains atomic (indivisible) values.
- No repeating groups or multi-valued attributes.
- Each record is uniquely identifiable.

Example (1NF Violation):

| Student | Subjects        |
|---------|------------------|
| Alex    | Math, Physics    |

❌ Corrected:

| Student | Subject |
|---------|----------|
| Alex    | Math     |
| Alex    | Physics  |


### Second Normal Form (2NF)
**Rules:**
- Must be in 1NF.
- No partial dependency on a composite primary key.

✅ Example Problem:
StudentID + CourseID → Grade  
But StudentName depends only on StudentID.

❌ Solution:
Split into separate tables:
- Students(StudentID, StudentName)
- Enrollments(StudentID, CourseID, Grade)

### Third Normal Form (3NF)
**Rules:**
- Must be in 2NF.
- No transitive dependency (non-key depending on non-key).

✅ Example Problem:
StudentID → DeptID → DeptName

❌ Solution:
- Students(StudentID, DeptID)
- Departments(DeptID, DeptName)


### Boyce-Codd Normal Form (BCNF) (Advanced)
Stronger version of 3NF.
- Every determinant must be a candidate key.

Used when complex dependencies exist.


## When NOT to Normalize Fully
- High performance read systems
- Data warehouses
- Reporting systems

In such cases, **denormalization** is used for speed.


## 🧠 Best Practices
- Normalize till 3NF for most applications.
- Avoid over-normalization.
- Always analyze query performance.
- Use indexing for optimized access.

## Summary

| Normal Form | Purpose |
|--------------|---------|
| 1NF | Atomic values |
| 2NF | Remove partial dependency |
| 3NF | Remove transitive dependency |
| BCNF | Strong dependency rules |

