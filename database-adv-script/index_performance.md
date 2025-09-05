To measure the query performance before and after adding these indexes, you can use the `EXPLAIN` command (or `EXPLAIN ANALYZE` for a more detailed, execution-based analysis).


1.  **Run a Performance Test *Before* Indexes:**
    First, run `EXPLAIN` on one of your previous queries to see the original query plan. For example, using the `Rank Properties by Bookings` query:

    ```sql
    EXPLAIN WITH PropertyBookings AS (
      SELECT
        property_id,
        COUNT(*) AS total_bookings
      FROM
        Bookings
      GROUP BY
        property_id
    )
    SELECT
      property_id,
      total_bookings,
      ROW_NUMBER() OVER (ORDER BY total_bookings DESC) AS row_num,
      RANK() OVER (ORDER BY total_bookings DESC) AS booking_rank,
      DENSE_RANK() OVER (ORDER BY total_bookings DESC) AS dense_booking_rank
    FROM
      PropertyBookings;
    ```
    Pay close attention to the output. Look for terms like "Full Table Scan" or "Sequential Scan," which indicate that the database is reading every row of a table to find the data it needs.

2.  **Create the Indexes:**
    Now, run the commands from the `database_index.sql` file to create the new indexes on your database.

3.  **Run a Performance Test *After* Indexes:**
    Run the `EXPLAIN` command on the same query again. You should see a different query plan. The output should now indicate that the database is using an "Index Scan" or "Index Seek" on the indexed columns, which is a much more efficient operation. You can compare the new query plan with the old one to see how the indexes have improved performance.
