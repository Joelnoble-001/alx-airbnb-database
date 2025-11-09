# Database Performance Monitoring and Refinement

## Objective
To continuously monitor and refine database performance by analyzing query execution plans and making schema or index adjustments.

---

## 1. Monitoring Queries

### Tools Used
- `EXPLAIN ANALYZE` (PostgreSQL)
- `SHOW PROFILE` (MySQL)

These tools were used to identify slow-performing queries in key database operations such as:
- Retrieving bookings by user
- Joining bookings with payments
- Filtering properties by location and rating

---

## 2. Example 1 — Query: Retrieve bookings by user

### Original Query
```sql
EXPLAIN ANALYZE
SELECT * FROM bookings WHERE user_id = 15;
