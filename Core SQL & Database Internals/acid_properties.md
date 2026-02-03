# ACID Properties in RDBMS

ACID properties ensure that database transactions are processed reliably and maintain data integrity even in the presence of failures, crashes, or concurrent access.

---

## Atomicity

Atomicity means a transaction is treated as a single unit of work.  
Either all operations in the transaction are completed successfully, or none of them are applied.

If a failure occurs in the middle of a transaction, the database rolls back all changes made by that transaction.

**Example:**  
Transferring money from one account to another must either debit and credit both accounts or perform neither.

---

## Consistency

Consistency ensures that a transaction takes the database from one valid state to another valid state.  
All integrity constraints, rules, and triggers must be satisfied before and after the transaction.

If a transaction violates a constraint, it is rolled back.

**Example:**  
A foreign key constraint must not be broken after inserting or updating data.

---

## Isolation

Isolation ensures that concurrent transactions do not interfere with each other.  
Each transaction behaves as if it is the only one executing in the system.

The level of isolation determines how visible intermediate changes are to other transactions.

**Common isolation levels:**
- Read Uncommitted
- Read Committed
- Repeatable Read
- Serializable

---

## Durability

Durability guarantees that once a transaction is committed, its changes are permanently stored.  
Even in case of power failure or system crash, committed data will not be lost.

Databases ensure durability using logs, checkpoints, and persistent storage.

---

## Why ACID Matters

- Prevents partial updates
- Protects data integrity
- Ensures reliable concurrent access
- Critical for financial and mission-critical systems

---

## ACID vs Performance

Stronger ACID guarantees can reduce performance due to locking and logging overhead.  
Some modern systems relax ACID properties for higher scalability (eventual consistency).

---

## Summary Table

| Property   | Purpose                                   |
|-----------|--------------------------------------------|
| Atomicity | All or nothing execution                   |
| Consistency | Maintains valid database states           |
| Isolation | Handles concurrent transactions safely    |
| Durability | Ensures committed data is permanent       |

---

## Interview Tip

ACID properties are enforced primarily by:
- Transaction manager
- Lock manager
- Write-ahead logging (WAL)
- Recovery mechanisms
