-- logical_operators.sql
-- Demonstrates usage of AND, OR, NOT logical operators in SQL

-- Sample Table
CREATE TABLE students (
    student_id INT,
    name VARCHAR(50),
    course VARCHAR(50),
    marks INT,
    age INT,
    city VARCHAR(50)
);

INSERT INTO students VALUES
(1, 'Amit', 'CS', 85, 20, 'Delhi'),
(2, 'Neha', 'IT', 72, 21, 'Mumbai'),
(3, 'Rahul', 'CS', 90, 22, 'Pune'),
(4, 'Priya', 'ECE', 65, 19, 'Chennai'),
(5, 'Karan', 'IT', 78, 23, 'Bangalore');

--------------------------------------------------
-- AND Operator
--------------------------------------------------

-- Students from CS course with marks greater than 80
SELECT * FROM students
WHERE course = 'CS' AND marks > 80;

-- IT students older than 20 years
SELECT * FROM students
WHERE course = 'IT' AND age > 20;

--------------------------------------------------
-- OR Operator
--------------------------------------------------

-- Students from CS or IT course
SELECT * FROM students
WHERE course = 'CS' OR course = 'IT';

-- Students with marks above 85 or age below 20
SELECT * FROM students
WHERE marks > 85 OR age < 20;

--------------------------------------------------
-- NOT Operator
--------------------------------------------------

-- Students not from ECE course
SELECT * FROM students
WHERE NOT course = 'ECE';

-- Students not from Bangalore
SELECT * FROM students
WHERE NOT city = 'Bangalore';

--------------------------------------------------
-- Combining Logical Operators
--------------------------------------------------

-- CS students from Pune with marks above 85
SELECT * FROM students
WHERE course = 'CS'
  AND city = 'Pune'
  AND marks > 85;

-- Students from IT or CS but not from Mumbai
SELECT * FROM students
WHERE (course = 'IT' OR course = 'CS')
  AND NOT city = 'Mumbai';

--------------------------------------------------
-- End of file
--------------------------------------------------

