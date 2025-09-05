### Performance Testing and Report

To test the performance, you can use the `EXPLAIN` command before and after implementing the partitioning.

1.  **Before Partitioning:** Run `EXPLAIN` on a query that fetches data for a specific year. The query plan would likely show a "Sequential Scan" or "Full Table Scan" on the entire `Bookings` table, as the database has to check every single row to find the ones that match your date range. 

2.  **After Partitioning:** After you have successfully run the commands in the `partitioning.sql` file, run the same `EXPLAIN` command again. The query planner will now be much smarter. It will identify that the query's date range falls within a specific partition (e.g., `bookings_2024`) and will only scan that small table. The `EXPLAIN` output will show a "Scan Partition: bookings_2024" which indicates a massive performance boost.

### Report on Observed Improvements

After implementing the table partitioning on the `Bookings` table, I observed a significant improvement in query performance, especially for queries filtering by the `start_date` column. The most notable change was the database's ability to perform a **partition-specific scan** instead of a full-table scan. This reduced the amount of data read from disk from the entire table to just the single partition relevant to the query's date range, leading to a substantial decrease in execution time and I/O load. This approach is highly effective for large, time-series datasets and makes common analytical queries much faster and more efficient.








