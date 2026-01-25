# EXPLAIN Plan in SQL

## What is EXPLAIN?
`EXPLAIN` shows how the database executes a query.  
It helps understand query performance, index usage, table scans, join strategy, and estimated cost.

Instead of running the query, the database analyzes the execution plan and displays internal steps.

---

## Why EXPLAIN is Important
- Detects slow queries.
- Shows whether indexes are used.
- Identifies full table scans.
- Helps optimize joins and filters.
- Improves query performance.
- Useful in production debugging.

---

## Basic Syntax

```sql
EXPLAIN SELECT * FROM employees WHERE salary > 50000;
```

Some databases support:

```sql
EXPLAIN ANALYZE SELECT * FROM employees WHERE salary > 50000;
```

`EXPLAIN ANALYZE` actually runs the query and shows real execution time.

---

## Common EXPLAIN Columns (MySQL)

| Column | Meaning |
|--------|---------|
| id | Query execution order |
| select_type | Type of SELECT query |
| table | Table being accessed |
| type | Join type (ALL, index, range, ref, eq_ref, const) |
| possible_keys | Indexes that could be used |
| key | Index actually used |
| key_len | Length of index used |
| rows | Estimated rows scanned |
| Extra | Additional info like Using where, Using index |

---

## Join Types Ranking (Best → Worst)

- const
- eq_ref
- ref
- range
- index
- ALL (full table scan)

Avoid `ALL` whenever possible.

---

## Example

```sql
EXPLAIN
SELECT name, salary
FROM employees
WHERE department = 'IT';
```

Possible Output Interpretation:
- If `type = ALL` → full table scan → add index on `department`.
- If `key = department_idx` → index is being used → good.

---

## How to Optimize Using EXPLAIN

1. Reduce full table scans.
2. Add indexes on frequently filtered columns.
3. Avoid SELECT * when unnecessary.
4. Use proper join conditions.
5. Filter early using WHERE clause.
6. Avoid functions on indexed columns.
7. Rewrite subqueries as joins when possible.

---

## EXPLAIN vs EXPLAIN ANALYZE

| Feature | EXPLAIN | EXPLAIN ANALYZE |
|---------|----------|------------------|
| Executes query | No | Yes |
| Shows actual timing | No | Yes |
| Best for | Planning | Performance tuning |

---

## Practice Exercises

1. Run EXPLAIN on a simple SELECT query.
2. Observe rows scanned before and after adding an index.
3. Compare EXPLAIN for JOIN vs subquery.
4. Analyze a slow query and optimize it.
5. Test EXPLAIN ANALYZE if supported.

---

## Notes
- Always test on sample data before production.
- Combine EXPLAIN with indexing strategy.
- Re-check EXPLAIN after schema changes.
