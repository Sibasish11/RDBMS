# Replication Basics in RDBMS

Replication is the process of **copying and maintaining database objects (data and schema)** from one database (primary) to one or more other databases (replicas) to ensure availability, scalability, and fault tolerance.

---

## Why Replication is Used

- Improves **read performance**
- Provides **high availability**
- Enables **disaster recovery**
- Supports **scaling** across regions
- Reduces load on the primary database

---

## Basic Replication Architecture

- **Primary (Master):** Handles writes and updates
- **Replica (Slave):** Receives copied data from primary
- Data changes are streamed from primary to replicas

---

## Types of Replication

### 1. Master–Slave Replication
- One primary database
- One or more read-only replicas
- Writes go to primary, reads from replicas

### 2. Master–Master Replication
- Multiple databases accept writes
- Requires conflict resolution
- More complex to manage

---

## Replication Modes

### 1. Synchronous Replication
- Primary waits for replica confirmation
- Strong consistency
- Higher latency

### 2. Asynchronous Replication
- Primary does not wait for replica
- Faster performance
- Risk of data lag

---

## Replication Lag

Replication lag is the delay between data being written on the primary and appearing on replicas.

Causes:
- Network latency
- Heavy write load
- Slow replicas

---

## Common Replication Methods

- **Log-based replication** (redo/bin logs)
- **Statement-based replication**
- **Row-based replication**

---

## Benefits of Replication

- Fault tolerance
- Load balancing
- Better availability
- Read scalability

---

## Limitations of Replication

- Data inconsistency risk
- Replication lag
- Increased system complexity
- Write scalability remains limited

---

## Common Use Cases

- Read-heavy applications
- Geo-distributed systems
- Backup and disaster recovery
- Analytics on replicas

---

## Summary

Replication helps RDBMS systems achieve scalability and availability by maintaining multiple synchronized copies of data, but it requires careful configuration to handle consistency and lag effectively.
