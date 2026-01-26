-- transactions.sql
-- Demonstrates SQL transactions, commit, rollback, and savepoints

-- Sample Table
-- accounts(account_id, name, balance)

---------------------------------------------------
-- 1. Basic Transaction with COMMIT
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

-- Something goes wrong
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

-- Rollback only second update
ROLLBACK TO sp1;

COMMIT;

---------------------------------------------------
-- 4. Auto Commit Example
---------------------------------------------------
SET autocommit = 0;

UPDATE accounts
SET balance = balance + 100
WHERE account_id = 1;

COMMIT;

SET autocommit = 1;

---------------------------------------------------
-- 5. Transaction with Conditional Rollback
---------------------------------------------------
START TRANSACTION;

UPDATE accounts
SET balance = balance - 1000
WHERE account_id = 1;

-- Check balance before committing
SELECT balance FROM accounts WHERE account_id = 1;

-- If balance < 0, then rollback manually
ROLLBACK;
-- Otherwise COMMIT;

---------------------------------------------------
-- 6. Locking behavior inside transaction
---------------------------------------------------
START TRANSACTION;

SELECT *
FROM accounts
WHERE account_id = 1
FOR UPDATE;

-- Perform safe update
UPDATE accounts
SET balance = balance - 100
WHERE account_id = 1;

COMMIT;

---------------------------------------------------
-- 7. Multiple statements atomicity test
---------------------------------------------------
START TRANSACTION;

INSERT INTO accounts(account_id, name, balance)
VALUES (10, 'TestUser', 500);

UPDATE accounts
SET balance = balance + 500
WHERE account_id = 2;

-- Simulate failure
ROLLBACK;
