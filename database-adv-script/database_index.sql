CREATE INDEX idx_bookings_user_id ON Bookings(user_id);


CREATE INDEX idx_bookings_property_id ON Bookings(property_id);


CREATE INDEX idx_reviews_property_id ON Reviews(property_id);


CREATE INDEX idx_users_user_id ON Users(user_id);


CREATE INDEX idx_properties_property_id ON Properties(property_id);
