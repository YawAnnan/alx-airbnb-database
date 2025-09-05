-- This script sets up declarative table partitioning for the Bookings table.
-- Partitioning is based on the start_date, with each partition covering one year.
-- This will significantly improve query performance for date-range searches.

-- 1. Create the main partitioned table.
-- This table will not contain any data itself. It acts as a container
-- and defines the schema for all its partitions.
CREATE TABLE Bookings (
    booking_id INT PRIMARY KEY,
    user_id INT,
    property_id INT,
    start_date DATE,
    end_date DATE
) PARTITION BY RANGE (start_date);

-- 2. Create partitions for specific years.
-- Each partition is a standard table that stores a range of data.
-- Future partitions can be created as needed (e.g., for 2026, 2027, etc.).

-- Partition for the year 2023
CREATE TABLE bookings_2023 PARTITION OF Bookings
    FOR VALUES FROM ('2023-01-01') TO ('2024-01-01');

-- Partition for the year 2024
CREATE TABLE bookings_2024 PARTITION OF Bookings
    FOR VALUES FROM ('2024-01-01') TO ('2025-01-01');

-- Partition for the year 2025
CREATE TABLE bookings_2025 PARTITION OF Bookings
    FOR VALUES FROM ('2025-01-01') TO ('2026-01-01');


-- 3. Add an index to the date column on each partition.
-- This further optimizes queries by creating an index on the partitioning key
-- within each partition, which speeds up lookups.
CREATE INDEX idx_bookings_2023_start_date ON bookings_2023 (start_date);
CREATE INDEX idx_bookings_2024_start_date ON bookings_2024 (start_date);
CREATE INDEX idx_bookings_2025_start_date ON bookings_2025 (start_date);
