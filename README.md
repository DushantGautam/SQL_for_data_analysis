# SQL Data Analysis Internship Task

## Task 3: SQL for Data Analysis

This project is a part of my Data Analyst Internship. The goal was to use SQL to analyze and extract insights from structured data using basic and advanced SQL queries.

### Dataset Description

I used a sample **Ecommerce-style database** with the following tables:

- **customers**: Stores customer details
- **orders**: Stores order transactions
- **products**: Stores product information

### Tools Used

- SQL Mobile App: [Name of the App, e.g., SQLite Editor or SQL Playground]
- SQL Engine: SQLite
- Device: Android Mobile

---

### Table Structures

#### customers
| Column       | Type    |
|--------------|---------|
| customer_id  | INTEGER |
| name         | TEXT    |
| email        | TEXT    |
| country      | TEXT    |

#### orders
| Column       | Type    |
|--------------|---------|
| order_id     | INTEGER |
| customer_id  | INTEGER |
| product_id   | INTEGER |
| amount       | INTEGER |
| order_date   | TEXT    |

#### products
| Column       | Type    |
|--------------|---------|
| product_id   | INTEGER |
| name         | TEXT    |
| price        | INTEGER |

---

### SQL Tasks Completed

1. **Basic SELECT and WHERE**
   ```sql
   SELECT * FROM customers WHERE country = 'USA';
