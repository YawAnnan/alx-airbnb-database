:Total Bookings Per User:total_bookings_per_user.sql
SELECT
  user_id,
  COUNT(*) AS total_bookings
FROM
  Bookings
GROUP BY
  user_id;


---

### Rank Properties by Bookings

```sql
:Rank Properties by Bookings:rank_properties_by_bookings.sql
WITH PropertyBookings AS (
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
  RANK() OVER (ORDER BY total_bookings DESC) AS booking_rank,
  DENSE_RANK() OVER (ORDER BY total_bookings DESC) AS dense_booking_rank
FROM
  PropertyBookings;
