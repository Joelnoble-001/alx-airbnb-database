# Query Optimization Report

## Objective
To analyze and optimize a complex query retrieving all bookings with related user, property, and payment details.

---

## 1. Initial Query
The initial query joined four large tables: `bookings`, `users`, `properties`, and `payments`.  
It retrieved all columns, causing **unnecessary data load** and **full table scans**.

```sql
SELECT * 
FROM bookings
JOIN users ON bookings.user_id = users.id
JOIN properties ON bookings.property_id = properties.id
JOIN payments ON bookings.id = payments.booking_id;
