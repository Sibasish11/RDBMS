# SQL Query Optimization Guide

## What is Query Optimization?
Query optimization is the process of improving SQL query performance by reducing execution time, memory usage, and disk I/O while maintaining correct results.

Optimized queries scale better, reduce server load, and improve application responsiveness.

---

## Why Optimization Matters
- Faster query execution
- Lower database load
- Better scalability
- Reduced infrastructure cost
- Improved user experience
- Production reliability

---

## Use EXPLAIN First
Always analyze queries using:

```sql
EXPLAIN SELECT * FROM orders WHERE customer_id = 101;
```

Look for:
- Full table scans (`type = ALL`)
- Missing index usage
- High estimated row count
- Inefficient joins

---

## Indexing Best Practices

### When to Create Index
- Columns frequently used in WHERE clause
- Join columns
- Columns used in ORDER BY and GROUP BY
- High-cardinality columns

### When to Avoid Index
- Small tables
- Low-cardinality columns
- Columns frequently updated

---

## Query Writing Tips

- Avoid `SELECT *`
- Filter rows early using WHERE
- Use proper JOIN instead of subqueries when possible
- Avoid functions on indexed columns
- Use LIMIT when possible
- Avoid unnecessary DISTINCT
- Prefer EXISTS over IN for large datasets

---

## Join Optimization

- Index foreign keys
- Join on indexed columns
- Avoid joining unnecessary tables
- Reduce result size early
- Use INNER JOIN when possible

---

## Subquery Optimization

- Convert correlated subqueries to JOINs when possible
- Cache subquery results if reused
- Avoid nested subqueries for large tables

---

## Aggregation Optimization

- Filter before GROUP BY
- Index grouping columns
- Avoid grouping unnecessary columns
- Use approximate counts if acceptable

---

## Pagination Optimization

Bad:
```sql
SELECT * FROM orders LIMIT 100000, 10;
```

Better:
```sql
SELECT * FROM orders
WHERE order_id > 100000
LIMIT 10;
```

---

## Common Performance Issues

| Issue | Solution |
|--------|-----------|
| Full table scan | Add index |
| Slow JOIN | Index join columns |
| Large result set | Add filters |
| Duplicate scans | Cache results |
| High memory usage | Reduce selected columns |

---

## Monitoring Tools

- EXPLAIN / EXPLAIN ANALYZE
- Query execution time
- Slow query logs
- Database monitoring dashboards

---

## Practice Exercises

1. Optimize a query using EXPLAIN.
2. Add index and compare performance.
3. Rewrite subquery as JOIN.
4. Reduce column selection.
5. Optimize GROUP BY query.

---

## Notes
- Optimization is iterative.
- Measure before and after changes.
- Avoid premature optimization.
