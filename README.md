# alx-airbnb-database
   
    ---
    User {
        UUID user_id PK "Primary Key"
        VARCHAR first_name
        VARCHAR last_name
        VARCHAR email "Unique"
        VARCHAR password_hash
        VARCHAR phone_number
        ENUM role
        TIMESTAMP created_at
    }

    Property {
        UUID property_id PK "Primary Key"
        UUID host_id FK "Foreign Key"
        VARCHAR name
        TEXT description
        VARCHAR location
        DECIMAL pricepernight
        TIMESTAMP created_at
        TIMESTAMP updated_at
    }

    Booking {
        UUID booking_id PK "Primary Key"
        UUID property_id FK "Foreign Key"
        UUID user_id FK "Foreign Key"
        DATE start_date
        DATE end_date
        DECIMAL total_price
        ENUM status
        TIMESTAMP created_at
    }

    Payment {
        UUID payment_id PK "Primary Key"
        UUID booking_id FK "Foreign Key"
        DECIMAL amount
        TIMESTAMP payment_date
        ENUM payment_method
    }

    Review {
        UUID review_id PK "Primary Key"
        UUID property_id FK "Foreign Key"
        UUID user_id FK "Foreign Key"
        INTEGER rating "1-5"
        TEXT comment
        TIMESTAMP created_at
    }

    Message {
        UUID message_id PK "Primary Key"
        UUID sender_id FK "Foreign Key"
        UUID recipient_id FK "Foreign Key"
        TEXT message_body
        TIMESTAMP sent_at
    }
