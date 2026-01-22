# SQL JOIN Practice Questions

## Instructions
- Create sample tables before solving.
- Write queries in separate `.sql` files.
- Focus on correctness first, then optimize.
- Try multiple approaches where possible.

---

## Sample Tables

```
customers(customer_id, name, city)
orders(order_id, customer_id, order_date, amount)
products(product_id, product_name, price)
order_items(order_item_id, order_id, product_id, quantity)
```

---

## INNER JOIN Exercises

1. Display all customers with their orders.
2. Show customer name, order date, and order amount.
3. Find total amount spent by each customer.
4. Display customers who placed more than 3 orders.
5. Show all orders placed by customers from a specific city.
6. Find the highest spending customer.
7. Display recent orders with customer names.
8. Calculate average order amount per customer.

---

## LEFT JOIN Exercises

9. Display all customers even if they have no orders.
10. Find customers who never placed an order.
11. Show number of orders per customer including zero orders.
12. Display all products even if not ordered.

---

## RIGHT JOIN Exercises

13. Display all orders even if customer details are missing.
14. Find orphan records in customer or order tables.

---

## FULL JOIN Exercises

15. Display all customers and orders including unmatched records.
16. Identify missing relationships between tables.

---

## MULTI-TABLE JOIN Exercises

17. Display order details with product names and quantity.
18. Find total sales per product.
19. Find total revenue per order.
20. Find top-selling products.
21. Calculate total quantity sold per product.

---

## ADVANCED JOIN Challenges

22. Find customers who bought more than 5 different products.
23. Find products that were never ordered.
24. Display monthly revenue using joins.
25. Find customers with highest average order value.
26. Detect duplicate records using joins.

---

## Notes
- Practice joins using real datasets if possible.
- Push solutions to GitHub with proper naming.
- Revisit after completing subqueries and window functions.
