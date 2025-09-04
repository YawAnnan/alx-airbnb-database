SELECT
  p.property_id,
  p.property_name,
  p.location,
  avg_ratings.average_rating
FROM
  Properties AS p
INNER JOIN
  (
    SELECT
      property_id,
      AVG(rating) AS average_rating
    FROM
      Reviews
    GROUP BY
      property_id
  ) AS avg_ratings ON p.property_id = avg_ratings.property_id
WHERE
  avg_ratings.average_rating > 4.0;



SELECT
  u.user_id,
  u.username,
  u.email
FROM
  Users AS u
WHERE
  (
    SELECT COUNT(*)
    FROM Bookings AS b
    WHERE b.user_id = u.user_id
  ) > 3;
