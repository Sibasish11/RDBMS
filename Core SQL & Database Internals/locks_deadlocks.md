# Locks and Deadlocks in RDBMS

Locks are mechanisms used by databases to control concurrent access to data and ensure consistency.  
Deadlocks are situations where transactions wait indefinitely due to circular lock dependencies.


## What is a Lock?

A lock is a control mechanism that restricts access to database resources such as rows, tables, or pages while a transaction is using them.


## Types of Locks

### Shared Lock (S)
- Allows read operations
- Multiple transactions can hold shared locks simultaneously
- Prevents write operations

### Exclusive Lock (X)
- Allows both read and write operations
- Only one transaction can hold an exclusive lock at a time


## Lock Granularity

- Row-level locking (high concurrency)
- Page-level locking
- Table-level locking (low overhead)
- Database-level locking

Smaller granularity improves concurrency but increases overhead.

---

## Locking Protocols

### Two-Phase Locking (2PL)
- Growing phase: locks are acquired
- Shrinking phase: locks are released
- Ensures serializability

---

## What is a Deadlock?

A deadlock occurs when two or more transactions are waiting for each other to release locks, creating a circular wait.

---

## Deadlock Example

- Transaction T1 locks Resource A and waits for Resource B
- Transaction T2 locks Resource B and waits for Resource A
- Neither can proceed

---

## Deadlock Conditions

Deadlocks occur when all four conditions hold:
1. Mutual exclusion
2. Hold and wait
3. No preemption
4. Circular wait

---

## Deadlock Handling Techniques

### Deadlock Detection
- Database periodically checks for cycles in wait-for graph
- One transaction is rolled back

### Deadlock Prevention
- Prevent one of the deadlock conditions
- Example: Acquire all locks at once

### Deadlock Avoidance
- Uses resource allocation algorithms
- Transactions are delayed if deadlock is possible

---

## Lock Timeout

Instead of waiting indefinitely, a transaction fails after a timeout and is rolled back.

---

## Reducing Deadlocks

- Access tables in a consistent order
- Keep transactions short
- Use appropriate isolation levels
- Avoid user interaction within transactions

---

## Locks vs Performance

- More locking reduces concurrency
- Fewer locks increase risk of anomalies
- Databases balance safety and speed

---

## Interview Tip

Common interview questions:
- Difference between shared and exclusive locks
- How deadlocks occur
- How databases detect deadlocks
- Strategies to avoid deadlocks
