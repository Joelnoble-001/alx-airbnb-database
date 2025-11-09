-- Initial query to retrieve all bookings with user, property, and payment details
EXPLAIN ANALYZE
SELECT 
    b.id AS booking_id,
    u.first_name,
    u.last_name,
    p.name AS property_name,
    pay.amount,
    pay.status,
    b.start_date,
    b.end_date
FROM bookings b
JOIN users u ON b.user_id = u.id
JOIN properties p ON b.property_id = p.id
JOIN payments pay ON b.id = pay.booking_id
WHERE b.start_date >= '2024-01-01'
  AND pay.status = 'completed'
ORDER BY b.start_date DESC;
