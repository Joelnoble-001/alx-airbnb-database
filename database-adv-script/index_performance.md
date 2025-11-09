# Index Performance Optimization

## Objective
To improve database query performance by creating indexes on frequently used columns in the **Users**, **Bookings**, and **Properties** tables.

---

## 1. Identified High-Usage Columns

 Table        | Columns Indexed                        | Reason for Indexing         
--------------|----------------------------------------|------------------------------------               
 `users`      | `email`, `id`                          | Commonly used for user lookup and joins    
 `bookings`   | `user_id`, `property_id`, `start_date` | Frequently used in joins and date filtering 
 `properties` | `location`, `id`                       | Used for searches and property listing     

---

## 2. Index Creation
Indexes were created using the following SQL commands:

```sql
CREATE INDEX idx_users_email ON users(email);
CREATE INDEX idx_bookings_user_id ON bookings(user_id);
CREATE INDEX idx_properties_location ON properties(location);
