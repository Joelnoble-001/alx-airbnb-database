-- 1. Create a new partitioned version of the bookings table based on start_date
-- This example assumes PostgreSQL syntax for RANGE partitioning.

-- Step 1: Create the parent table
CREATE TABLE bookings_partitioned (
    id SERIAL PRIMARY KEY,
    user_id INT NOT NULL,
    property_id INT NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    status VARCHAR(50),
    CONSTRAINT fk_user FOREIGN KEY (user_id) REFERENCES users(id),
    CONSTRAINT fk_property FOREIGN KEY (property_id) REFERENCES properties(id)
) PARTITION BY RANGE (start_date);


-- Step 2: Create partitions for specific date ranges
CREATE TABLE bookings_2023 PARTITION OF bookings_partitioned
FOR VALUES FROM ('2023-01-01') TO ('2024-01-01');

CREATE TABLE bookings_2024 PARTITION OF bookings_partitioned
FOR VALUES FROM ('2024-01-01') TO ('2025-01-01');

CREATE TABLE bookings_2025 PARTITION OF bookings_partitioned
FOR VALUES FROM ('2025-01-01') TO ('2026-01-01');

-- Step 3: Example query to test partition performance
-- Fetch bookings within a date range (should hit only relevant partition)
EXPLAIN ANALYZE
SELECT * FROM bookings_partitioned
WHERE start_date BETWEEN '2024-03-01' AND '2024-03-31';
