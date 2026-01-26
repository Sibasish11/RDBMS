# Transaction Isolation Levels

## What are Isolation Levels?
Isolation levels define how and when the changes made by one transaction become visible to other transactions.  
They control data consistency, concurrency, and performance in a database system.

Isolation levels prevent issues caused by multiple transactions running at the same time.

---

## Common Concurrency Problems

### Dirty Read
Reading uncommitted data from another transaction.

### Non-Repeatable Read
Reading the same row twice but getting different values.

### Phantom Read
New rows appear in repeated query results.

---

## SQL Isolation Levels (ANSI Standard)

1. READ UNCOMMITTED
2. READ COMMITTED
3. REPEATABLE READ
4. SERIALIZABLE

---

## READ UNCOMMITTED
- Allows dirty reads.
- Fastest but unsafe.
- Rarely supported in real systems.

Problems:
- Dirty Read
- Non-repeatable Read
- Phantom Read

---

## READ COMMITTED
- Only committed data is visible.
- Prevents dirty reads.
- Allows non-repeatable and phantom reads.

Used by:
- Oracle (default)
- PostgreSQL

---

## REPEATABLE READ
- Same row returns same value within a transaction.
- Prevents dirty and non-repeatable reads.
- Phantom reads may still occur (depends on DB).

Used by:
- MySQL (default InnoDB)

---

## SERIALIZABLE
- Highest isolation.
- Transactions behave as if executed one by one.
- Prevents all concurrency problems.
- Slowest performance.

---

## Comparison Table

| Isolation Level | Dirty Read | Non-Repeatable Read | Phantom Read |
|------------------|------------|----------------------|---------------|
| READ UNCOMMITTED | Yes | Yes | Yes |
| READ COMMITTED | No | Yes | Yes |
| REPEATABLE READ | No | No | Maybe |
| SERIALIZABLE | No | No | No |

---

## Setting Isolation Level

```sql
SET TRANSACTION ISOLATION LEVEL READ COMMITTED;
```

For a single transaction:

```sql
START TRANSACTION;
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;
```

---

## When to Use Which

- READ COMMITTED → General applications
- REPEATABLE READ → Financial consistency
- SERIALIZABLE → Critical systems
- READ UNCOMMITTED → Rarely used

---

## Practice Exercises

1. Simulate dirty read using two sessions.
2. Observe non-repeatable read behavior.
3. Test phantom reads using inserts.
4. Compare execution speed across levels.

---

## Notes
- Higher isolation = lower concurrency.
- Choose balance between consistency and performance.
- Behavior may vary by database engine.
