/*
  This query retrieves all bookings along with the details
  of the user who made each booking.
*/
SELECT
  b.booking_id,           -- Select the booking ID from the Bookings table
  b.start_date,           -- Select the start date of the booking
  u.username,             -- Select the username from the Users table
  u.email                 -- Select the user's email address
FROM
  Bookings AS b           -- Alias the Bookings table as 'b' for brevity
INNER JOIN
  Users AS u              -- Join with the Users table
ON
  b.user_id = u.user_id;  -- The join condition: matching user_id in both tables

/*
  This query uses a LEFT JOIN to retrieve all properties and their reviews.
  It includes properties that do not have any reviews.
  The LEFT JOIN ensures that every row from the 'left' table (Properties) is returned,
  and any matching rows from the 'right' table (Reviews) are included.
  If a property has no matching review, the review-related columns (rating, comment)
  will show as NULL.
*/
SELECT
  p.property_name,    -- Selects the name of the property from the Properties table.
  r.rating,           -- Selects the rating of the review from the Reviews table.
  r.comment           -- Selects the comment text from the Reviews table.
FROM
  Properties AS p     -- Specifies the Properties table as the 'left' table, aliased as 'p'.
LEFT JOIN
  Reviews AS r ON p.property_id = r.property_id;  -- Joins with the Reviews table on the common property_id.
/*
  This query uses a FULL OUTER JOIN to retrieve all users and all bookings.
  It's useful for finding unmatched records in both tables.
  For example, it will show users who haven't made a booking (booking columns will be NULL)
  and bookings that aren't linked to a user (user columns will be NULL).

*/
SELECT
  u.user_id,        -- Selects the user ID from the Users table
  u.username,       -- Selects the username from the Users table
  b.booking_id,     -- Selects the booking ID from the Bookings table
  b.start_date,     -- Selects the start date of the booking
  b.end_date        -- Selects the end date of the booking
FROM
  Users AS u        -- Specifies the Users table as the 'left' table
FULL OUTER JOIN
  Bookings AS b ON u.user_id = b.user_id;  -- Joins with the Bookings table on the user ID
