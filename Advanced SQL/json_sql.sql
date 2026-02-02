-- json_sql.sql
-- Working with JSON data in SQL (MySQL / PostgreSQL style)

---------------------------------------------------
-- Sample Table
---------------------------------------------------
CREATE TABLE users (
    user_id INT PRIMARY KEY,
    name VARCHAR(100),
    profile JSON
);

---------------------------------------------------
-- Sample JSON Data
---------------------------------------------------
INSERT INTO users VALUES
(1, 'Amit', '{"age": 25, "skills": ["Python", "SQL"], "city": "Delhi"}'),
(2, 'Riya', '{"age": 30, "skills": ["Java", "AWS"], "city": "Mumbai"}'),
(3, 'Neha', '{"age": 28, "skills": ["Python", "ML"], "city": "Bangalore"}');

---------------------------------------------------
-- 1. Extract JSON values
---------------------------------------------------
SELECT
    name,
    JSON_EXTRACT(profile, '$.age') AS age,
    JSON_EXTRACT(profile, '$.city') AS city
FROM users;

---------------------------------------------------
-- 2. Use shorthand operator (PostgreSQL)
---------------------------------------------------
-- profile->>'age' returns text value
SELECT
    name,
    profile->>'age' AS age,
    profile->>'city' AS city
FROM users;

---------------------------------------------------
-- 3. Filter using JSON value
---------------------------------------------------
SELECT *
FROM users
WHERE JSON_EXTRACT(profile, '$.city') = 'Delhi';

---------------------------------------------------
-- 4. Filter using PostgreSQL syntax
---------------------------------------------------
SELECT *
FROM users
WHERE profile->>'city' = 'Mumbai';

---------------------------------------------------
-- 5. Extract JSON array elements
---------------------------------------------------
SELECT
    name,
    JSON_EXTRACT(profile, '$.skills') AS skills
FROM users;

---------------------------------------------------
-- 6. Check if JSON array contains a value
---------------------------------------------------
-- MySQL
SELECT *
FROM users
WHERE JSON_CONTAINS(profile, '"Python"', '$.skills');

---------------------------------------------------
-- PostgreSQL
SELECT *
FROM users
WHERE profile->'skills' ? 'Python';

---------------------------------------------------
-- 7. Update JSON value
---------------------------------------------------
UPDATE users
SET profile = JSON_SET(profile, '$.city', 'Pune')
WHERE user_id = 1;

---------------------------------------------------
-- PostgreSQL alternative
---------------------------------------------------
UPDATE users
SET profile = jsonb_set(profile, '{city}', '"Pune"')
WHERE user_id = 1;

---------------------------------------------------
-- 8. Add new JSON field
---------------------------------------------------
UPDATE users
SET profile = JSON_SET(profile, '$.experience', 3)
WHERE user_id = 2;

---------------------------------------------------
-- 9. Remove JSON field
---------------------------------------------------
-- MySQL
UPDATE users
SET profile = JSON_REMOVE(profile, '$.age')
WHERE user_id = 3;

---------------------------------------------------
-- PostgreSQL
UPDATE users
SET profile = profile - 'age'
WHERE user_id = 3;

---------------------------------------------------
-- 10. Index JSON fields (PostgreSQL)
---------------------------------------------------
CREATE INDEX idx_users_city
ON users ((profile->>'city'));

---------------------------------------------------
-- 11. Aggregate using JSON values
---------------------------------------------------
SELECT
    profile->>'city' AS city,
    COUNT(*) AS user_count
FROM users
GROUP BY profile->>'city';

---------------------------------------------------
-- 12. Convert JSON to relational format
---------------------------------------------------
-- PostgreSQL
SELECT
    user_id,
    name,
    jsonb_array_elements_text(profile->'skills') AS skill
FROM users;
