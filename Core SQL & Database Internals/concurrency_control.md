# Concurrency Control in RDBMS

Concurrency control ensures that multiple transactions can execute simultaneously without compromising data integrity or consistency.

---

## What is Concurrency?

Concurrency occurs when multiple users or transactions access the database at the same time.  
Without proper control, concurrent execution can lead to incorrect results.

---

## Problems Caused by Poor Concurrency Control

### Lost Update
One transaction overwrites changes made by another transaction.

### Dirty Read
A transaction reads data written by another transaction that has not yet been committed.

### Non-Repeatable Read
A transaction reads the same row twice and gets different values.

### Phantom Read
A transaction re-executes a query and sees new rows added by another transaction.

---

## Goals of Concurrency Control

- Maintain data consistency
- Support high transaction throughput
- Prevent anomalies
- Ensure isolation between transactions

---

## Concurrency Control Techniques

### Lock-Based Protocols
Transactions acquire locks before accessing data.

- Shared Lock (S): Read-only access
- Exclusive Lock (X): Read and write access

Locks are released after commit or rollback.

---

### Two-Phase Locking (2PL)

- **Growing Phase:** Locks are acquired
- **Shrinking Phase:** Locks are released

Ensures conflict-serializable schedules.

---

### Timestamp-Based Protocols

Each transaction gets a unique timestamp.  
Operations are ordered based on timestamps to avoid conflicts.

---

### Optimistic Concurrency Control

- Transactions execute without locking.
- Conflicts are checked at commit time.
- Best for low-contention systems.

---

## Isolation Levels and Concurrency

Different isolation levels control the visibility of data:
- Lower isolation → higher concurrency
- Higher isolation → stronger consistency

Serializable isolation provides the highest level of safety.

---

## Deadlocks

A deadlock occurs when two or more transactions wait indefinitely for each other’s locks.

**Handling deadlocks:**
- Deadlock detection
- Deadlock prevention
- Deadlock avoidance

---

## Concurrency vs Performance

- More locks → less concurrency
- Fewer locks → higher performance but risk of anomalies

Databases balance concurrency and consistency based on workload.

---

## Summary

Concurrency control is critical for:
- Multi-user databases
- Financial systems
- High-traffic applications

It ensures correctness while allowing parallel execution of transactions.

---

## Interview Tip

Expect questions on:
- Lock types
- Deadlocks
- Isolation levels
- Differences between optimistic and pessimistic locking
