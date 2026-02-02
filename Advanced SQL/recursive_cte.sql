-- recursive_cte.sql
-- Demonstrates Recursive Common Table Expressions (CTEs)

---------------------------------------------------
-- 1. Basic Recursive CTE (Generate numbers)
---------------------------------------------------
WITH RECURSIVE numbers AS (
    SELECT 1 AS num
    UNION ALL
    SELECT num + 1
    FROM numbers
    WHERE num < 10
)
SELECT * FROM numbers;

---------------------------------------------------
-- 2. Recursive CTE for date series
---------------------------------------------------
WITH RECURSIVE dates AS (
    SELECT DATE '2024-01-01' AS dt
    UNION ALL
    SELECT dt + INTERVAL 1 DAY
    FROM dates
    WHERE dt < DATE '2024-01-07'
)
SELECT * FROM dates;

---------------------------------------------------
-- Sample Table for hierarchy
---------------------------------------------------
CREATE TABLE employees_hierarchy (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(100),
    manager_id INT
);

INSERT INTO employees_hierarchy VALUES
(1, 'CEO', NULL),
(2, 'Manager A', 1),
(3, 'Manager B', 1),
(4, 'Engineer A1', 2),
(5, 'Engineer A2', 2),
(6, 'Engineer B1', 3);

---------------------------------------------------
-- 3. Hierarchical query (Employee -> Manager)
---------------------------------------------------
WITH RECURSIVE org_chart AS (
    SELECT
        emp_id,
        emp_name,
        manager_id,
        1 AS level
    FROM employees_hierarchy
    WHERE manager_id IS NULL

    UNION ALL

    SELECT
        e.emp_id,
        e.emp_name,
        e.manager_id,
        o.level + 1
    FROM employees_hierarchy e
    INNER JOIN org_chart o
        ON e.manager_id = o.emp_id
)
SELECT * FROM org_chart
ORDER BY level, emp_id;

---------------------------------------------------
-- 4. Find all subordinates of a manager
---------------------------------------------------
WITH RECURSIVE subordinates AS (
    SELECT emp_id, emp_name, manager_id
    FROM employees_hierarchy
    WHERE emp_id = 2

    UNION ALL

    SELECT e.emp_id, e.emp_name, e.manager_id
    FROM employees_hierarchy e
    INNER JOIN subordinates s
        ON e.manager_id = s.emp_id
)
SELECT * FROM subordinates;

---------------------------------------------------
-- 5. Calculate depth of hierarchy
---------------------------------------------------
WITH RECURSIVE hierarchy_depth AS (
    SELECT emp_id, emp_name, manager_id, 1 AS depth
    FROM employees_hierarchy
    WHERE manager_id IS NULL

    UNION ALL

    SELECT e.emp_id, e.emp_name, e.manager_id, h.depth + 1
    FROM employees_hierarchy e
    JOIN hierarchy_depth h
        ON e.manager_id = h.emp_id
)
SELECT emp_name, depth
FROM hierarchy_depth;

---------------------------------------------------
-- 6. Prevent infinite recursion (cycle handling)
---------------------------------------------------
WITH RECURSIVE safe_cte AS (
    SELECT emp_id, emp_name, manager_id, CAST(emp_id AS CHAR(100)) AS path
    FROM employees_hierarchy
    WHERE manager_id IS NULL

    UNION ALL

    SELECT
        e.emp_id,
        e.emp_name,
        e.manager_id,
        CONCAT(s.path, '->', e.emp_id)
    FROM employees_hierarchy e
    JOIN safe_cte s
        ON e.manager_id = s.emp_id
    WHERE s.path NOT LIKE CONCAT('%', e.emp_id, '%')
)
SELECT * FROM safe_cte;

---------------------------------------------------
-- 7. Tree traversal order (Preorder traversal)
---------------------------------------------------
WITH RECURSIVE preorder AS (
    SELECT emp_id, emp_name, manager_id, 1 AS level
    FROM employees_hierarchy
    WHERE manager_id IS NULL

    UNION ALL

    SELECT e.emp_id, e.emp_name, e.manager_id, p.level + 1
    FROM employees_hierarchy e
    JOIN preorder p
        ON e.manager_id = p.emp_id
)
SELECT *
FROM preorder
ORDER BY level, emp_id;
