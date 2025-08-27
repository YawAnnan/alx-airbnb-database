-- USERS
INSERT INTO User (user_id, first_name, last_name, email, password_hash, phone_number, role)
VALUES
  ('uuid-001', 'Ama', 'Mensah', 'ama.mensah@example.com', 'hashed_pw_ama', '233201234567', 'host'),
  ('uuid-002', 'Kwame', 'Boateng', 'kwame.boateng@example.com', 'hashed_pw_kwame', '233209876543', 'guest'),
  ('uuid-003', 'Linda', 'Owusu', 'linda.owusu@example.com', 'hashed_pw_linda', NULL, 'guest');

-- PROPERTIES
INSERT INTO Property (property_id, host_id, name, description, location, pricepernight)
VALUES
  ('prop-001', 'uuid-001', 'Cozy Beachfront Chalet', 'A serene escape by the coast of Ada.', 'Ada, Ghana', 350.00),
  ('prop-002', 'uuid-001', 'Modern Accra Apartment', 'Stylish 2-bedroom flat near Osu.', 'Accra, Ghana', 500.00);

-- BOOKINGS
INSERT INTO Booking (booking_id, property_id, user_id, start_date, end_date, status)
VALUES
  ('book-001', 'prop-001', 'uuid-002', '2025-09-10', '2025-09-12', 'confirmed'),
  ('book-002', 'prop-002', 'uuid-003', '2025-09-15', '2025-09-18', 'pending');

-- PAYMENTS
INSERT INTO Payment (payment_id, booking_id, amount, payment_method)
VALUES
  ('pay-001', 'book-001', 700.00, 'credit_card'),
  ('pay-002', 'book-002', 1500.00, 'paypal');

-- REVIEWS
INSERT INTO Review (review_id, property_id, user_id, rating, comment)
VALUES
  ('rev-001', 'prop-001', 'uuid-002', 5, 'Absolutely loved the beachfront view!'),
  ('rev-002', 'prop-002', 'uuid-003', 4, 'Great location, but Wi-Fi was spotty.');

-- MESSAGES
INSERT INTO Message (message_id, sender_id, recipient_id, message_body)
VALUES
  ('msg-001', 'uuid-002', 'uuid-001', 'Hi Ama, is the beachfront chalet available next weekend?'),
  ('msg-002', 'uuid-001', 'uuid-002', 'Yes Kwame, it’s available. I’ll block the dates for you.');
