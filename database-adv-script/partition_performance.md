# Partitioning Performance Report

## Objective
To optimize queries on a large `bookings` table by implementing **table partitioning** based on the `start_date` column.

---

## 1. Implementation
The original `bookings` table was refactored into a **partitioned table** using PostgreSQL’s `RANGE` partitioning feature.

### SQL Setup
```sql
CREATE TABLE bookings_partitioned (
    id SERIAL PRIMARY KEY,
    user_id INT,
    property_id INT,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    status VARCHAR(50)
) PARTITION BY RANGE (start_date);
