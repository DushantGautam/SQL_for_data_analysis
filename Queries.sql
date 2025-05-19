🛒 Ecommerce\_SQL\_Database
(Tables: customers, products, orders)

a. SELECT, WHERE, ORDER BY, GROUP BY

\-- 1. Select all customers from USA, ordered by name
SELECT name, email, country
FROM customers
WHERE country = 'USA'
ORDER BY name ASC;

\-- 2. Total amount ordered by each customer
SELECT customer\_id, SUM(amount) AS total\_spent
FROM orders
GROUP BY customer\_id;

\-- 3. Average order amount by country (using GROUP BY and JOIN)
SELECT c.country, AVG(o.amount) AS avg\_order
FROM customers c
JOIN orders o ON c.customer\_id = o.customer\_id
GROUP BY c.country;

b. JOINS (INNER, LEFT, RIGHT)

\-- 4. INNER JOIN: Get customer names with their order amounts
SELECT c.name, o.amount, o.order\_date
FROM customers c
INNER JOIN orders o ON c.customer\_id = o.customer\_id;

\-- 5. LEFT JOIN: Get all customers and their orders (if any)
SELECT c.name, o.order\_id, o.amount
FROM customers c
LEFT JOIN orders o ON c.customer\_id = o.customer\_id;

\-- 6. RIGHT JOIN simulation in SQLite using LEFT JOIN with swapped tables (SQLite doesn't support RIGHT JOIN directly)
SELECT o.order\_id, o.amount, c.name
FROM orders o
LEFT JOIN customers c ON o.customer\_id = c.customer\_id;

c. Subqueries

\-- 7. Products more expensive than average
SELECT name, price
FROM products
WHERE price > (
SELECT AVG(price) FROM products
);

\-- 8. Customers who placed more than one order
SELECT name
FROM customers
WHERE customer\_id IN (
SELECT customer\_id
FROM orders
GROUP BY customer\_id
HAVING COUNT(order\_id) > 1
);

d. Aggregate functions (SUM, AVG)

\-- 9. Total revenue from all orders
SELECT SUM(amount) AS total\_revenue
FROM orders;

\-- 10. Average price of products
SELECT AVG(price) AS average\_product\_price
FROM products;

e. Create Views

\-- 11. View showing customer spending summary
CREATE VIEW customer\_summary AS
SELECT c.name, c.country, SUM(o.amount) AS total\_spent
FROM customers c
JOIN orders o ON c.customer\_id = o.customer\_id
GROUP BY c.customer\_id;

\-- Query the view
SELECT \* FROM customer\_summary;

f. Index for Optimization

\-- 12. Create an index on orders.customer\_id to speed up joins
CREATE INDEX idx\_orders\_customer\_id ON orders(customer\_id);

\-- 13. Create an index on orders.order\_date to speed up date filtering
CREATE INDEX idx\_order\_date ON orders(order\_date);
