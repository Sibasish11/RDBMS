-- transactions_practice.sql
-- Demonstrates SQL transactions, COMMIT, ROLLBACK, and SAVEPOINT

---------------------------------------------------
-- Sample Table
---------------------------------------------------
CREATE TABLE accounts (
    account_id INT PRIMARY KEY,
    account_holder VARCHAR(100),
    balance DECIMAL(10,2)
);

INSERT INTO accounts VALUES
(1, 'Amit', 5000),
(2, 'Riya', 3000),
(3, 'Neha', 7000);

---------------------------------------------------
-- 1. Basic transaction with COMMIT
---------------------------------------------------
START TRANSACTION;

UPDATE accounts
SET balance = balance - 1000
WHERE account_id = 1;

UPDATE accounts
SET balance = balance + 1000
WHERE account_id = 2;

COMMIT;

---------------------------------------------------
-- 2. Transaction with ROLLBACK
---------------------------------------------------
START TRANSACTION;

UPDATE accounts
SET balance = balance - 500
WHERE account_id = 1;

-- Simulate error
ROLLBACK;

---------------------------------------------------
-- 3. Transaction with SAVEPOINT
---------------------------------------------------
START TRANSACTION;

UPDATE accounts
SET balance = balance - 200
WHERE account_id = 1;

SAVEPOINT sp1;

UPDATE accounts
SET balance = balance - 300
WHERE account_id = 1;

-- Rollback to savepoint
ROLLBACK TO sp1;

COMMIT;

---------------------------------------------------
-- 4. Atomic money transfer example
---------------------------------------------------
START TRANSACTION;

UPDATE accounts
SET balance = balance - 1500
WHERE account_id = 3;

UPDATE accounts
SET balance = balance + 1500
WHERE account_id = 2;

COMMIT;

---------------------------------------------------
-- 5. Checking isolation behavior (conceptual)
---------------------------------------------------
-- Session 1
START TRANSACTION;
UPDATE accounts SET balance = 9000 WHERE account_id = 1;

-- Session 2 (will see old value depending on isolation level)
SELECT * FROM accounts WHERE account_id = 1;

-- Session 1
COMMIT;

---------------------------------------------------
-- 6. Transaction with constraint violation
---------------------------------------------------
START TRANSACTION;

UPDATE accounts
SET balance = -100
WHERE account_id = 2;

-- If CHECK constraint exists, this will fail
ROLLBACK;

---------------------------------------------------
-- 7. Autocommit OFF example
---------------------------------------------------
SET autocommit = 0;

UPDATE accounts
SET balance = balance + 500
WHERE account_id = 1;

ROLLBACK;

SET autocommit = 1;

---------------------------------------------------
-- 8. Read consistency example
---------------------------------------------------
START TRANSACTION;

SELECT SUM(balance) AS total_balance
FROM accounts;

COMMIT;
