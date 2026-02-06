# SQL Injection Prevention

SQL Injection is a security vulnerability where an attacker manipulates SQL queries by injecting malicious input, potentially gaining unauthorized access to data or executing harmful operations.

---

## Why SQL Injection is Dangerous

- Unauthorized data access
- Data modification or deletion
- Authentication bypass
- Full database compromise
- Loss of user trust

---

## Common SQL Injection Example

```sql
SELECT * FROM users WHERE username = 'admin' AND password = 'password';
