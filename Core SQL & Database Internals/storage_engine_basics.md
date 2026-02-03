# Storage Engine Basics in RDBMS

A storage engine is the underlying software component of a database that is responsible for how data is stored, retrieved, indexed, and managed on disk and in memory.


## What is a Storage Engine?

The storage engine handles:
- Data storage format
- Indexing mechanisms
- Transaction management
- Locking and concurrency
- Crash recovery

Different engines are optimized for different workloads.


## Why Storage Engines Matter

- Impact performance and scalability
- Determine support for transactions and foreign keys
- Affect crash recovery and durability
- Influence read/write efficiency

---

## Common Storage Engines (MySQL)

### InnoDB
- Default MySQL engine
- Supports ACID transactions
- Row-level locking
- Supports foreign keys
- Uses MVCC for concurrency

**Use case:** Transaction-heavy systems

---

### MyISAM
- Table-level locking
- No transaction support
- Faster for read-heavy workloads
- No foreign key enforcement

**Use case:** Read-only or analytics workloads

---

### Memory Engine
- Stores data in RAM
- Extremely fast access
- Data lost on restart

**Use case:** Temporary tables, caching

---

## Storage Engines in Other Databases

### PostgreSQL
- Uses a single powerful engine
- Relies heavily on MVCC
- No pluggable engines like MySQL

### Oracle
- Advanced storage architecture
- Strong transaction and recovery mechanisms

---

## Index Structures Used

- B-Tree indexes (most common)
- Hash indexes
- Full-text indexes
- Spatial indexes

---

## Data Storage Components

- Data pages
- Index pages
- Redo logs
- Undo logs
- Buffer pool / cache

---

## MVCC (Multi-Version Concurrency Control)

MVCC allows:
- Readers to not block writers
- Writers to not block readers

Each transaction sees a snapshot of the data.

---

## Choosing a Storage Engine

Consider:
- Read vs write workload
- Transaction requirements
- Concurrency level
- Durability needs

---

## Performance Implications

- Row-level locking improves concurrency
- Buffer pool size affects speed
- Indexing strategy matters

---

## Summary

Storage engines define how a database behaves internally.  
Understanding them helps with performance tuning, scaling, and debugging.

---

## Interview Tip

Be prepared to explain:
- InnoDB vs MyISAM
- MVCC concept
- Row-level vs table-level locking
- How crash recovery works
