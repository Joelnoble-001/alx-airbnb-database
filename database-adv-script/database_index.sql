-- Measure query performance before adding indexes
EXPLAIN ANALYZE
SELECT 
    users.first_name, 
    users.last_name, 
    bookings.start_date, 
    bookings.end_date
FROM bookings
JOIN users ON bookings.user_id = users.id
WHERE users.country = 'France';


-- Create an index to improve performance
CREATE INDEX idx_users_country ON users(country);
CREATE INDEX idx_bookings_user_id ON bookings(user_id);


-- Measure query performance after adding indexes
EXPLAIN ANALYZE
SELECT 
    users.first_name, 
    users.last_name, 
    bookings.start_date, 
    bookings.end_date
FROM bookings
JOIN users ON bookings.user_id = users.id
WHERE users.country = 'France';
