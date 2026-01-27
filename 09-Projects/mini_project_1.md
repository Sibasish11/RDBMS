# Mini Project 1: Student Management System (RDBMS)

## Objective
Design and implement a relational database system to manage student records, courses, enrollments, and grades using SQL.

This project focuses on schema design, normalization, constraints, joins, and query optimization.

---

## Entities

### Students
- student_id (PK)
- name
- email
- phone
- date_of_birth

### Courses
- course_id (PK)
- course_name
- credits
- department

### Enrollments
- enrollment_id (PK)
- student_id (FK)
- course_id (FK)
- enrollment_date
- grade

---

## Relationships
- One student can enroll in multiple courses.
- One course can have multiple students.
- Enrollments connects Students and Courses (Many-to-Many).

---

## Database Design

### Normalization
- Tables are in 3NF.
- No redundant data.
- Foreign keys maintain relationships.

---

## Constraints

- Primary Keys on all tables.
- Foreign Keys for relationships.
- Unique constraint on student email.
- NOT NULL on required fields.
- Grade validation using CHECK.

---

## Schema Example

```sql
CREATE TABLE students (
    student_id INT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE,
    phone VARCHAR(15),
    date_of_birth DATE
);

CREATE TABLE courses (
    course_id INT PRIMARY KEY,
    course_name VARCHAR(100),
    credits INT,
    department VARCHAR(50)
);

CREATE TABLE enrollments (
    enrollment_id INT PRIMARY KEY,
    student_id INT,
    course_id INT,
    enrollment_date DATE,
    grade CHAR(2),
    FOREIGN KEY (student_id) REFERENCES students(student_id),
    FOREIGN KEY (course_id) REFERENCES courses(course_id)
);
```

---

## Sample Queries

1. List all students with their enrolled courses.
2. Find students enrolled in more than 3 courses.
3. Display average grade per course.
4. Find students who scored highest in each course.
5. List courses with no enrollments.

---

## Optimization

- Index foreign keys.
- Use EXPLAIN to analyze joins.
- Avoid SELECT * in production queries.

---

## Deliverables

- SQL schema file
- Sample insert scripts
- Query practice file
- README documentation

---

## Extensions

- Attendance tracking
- Faculty table
- Result analytics dashboard
- REST API integration
