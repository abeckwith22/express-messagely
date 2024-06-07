\c messagely

-- Drop tables if they exist
DROP TABLE IF EXISTS messages;
DROP TABLE IF EXISTS users;

-- Create the users table
CREATE TABLE users (
    username TEXT PRIMARY KEY,
    password TEXT NOT NULL,
    first_name TEXT NOT NULL,
    last_name TEXT NOT NULL,
    phone TEXT NOT NULL, 
    join_at TIMESTAMP WITH TIME ZONE NOT NULL,
    last_login_at TIMESTAMP WITH TIME ZONE
);

-- Create the messages table
CREATE TABLE messages (
    id SERIAL PRIMARY KEY,
    from_username TEXT NOT NULL REFERENCES users(username),
    to_username TEXT NOT NULL REFERENCES users(username),
    body TEXT NOT NULL,
    sent_at TIMESTAMP WITH TIME ZONE NOT NULL,
    read_at TIMESTAMP WITH TIME ZONE
);

-- Insert data into users table
INSERT INTO users (username, password, first_name, last_name, phone, join_at, last_login_at)
VALUES 
    ('chicken_bacon123', 'password', 'Ash', 'Ketchum', '+1112223333', NOW(), NOW()),
    ('your_mom', 'password', 'Donald', 'Duck', '+1112223333', NOW(), NOW()),
    ('the_one_and_only', 'password', 'Mickey', 'Mouse', '+1112223333', NOW(), NOW()),
    ('the_main_man', 'password', 'Goofy', 'Goofster', '+1112223333', NOW(), NOW()),
    ('sora_luvs_video_games', 'password', 'Sora', 'Sora', '+1112223333', NOW(), NOW()),
    ('rust_is_best', 'password', 'Sora', 'Sora', '+1112223333', NOW(), NOW())
;

-- Insert data into messages table
INSERT INTO messages (from_username, to_username, body, sent_at, read_at)
VALUES 
    ('your_mom', 'the_one_and_only', 'Hello!', NOW(), NULL),
    ('the_main_man', 'rust_is_best', 'I dont like javascript! (-_-;)', NOW(), NULL),
    ('sora_luvs_video_games', 'the_main_man', 'Me too, thats why I use rust!', NOW(), NULL),
    ('rust_is_best', 'chicken_bacon123', 'I love your username!', NOW(), NULL),
    ('chicken_bacon123', 'rust_is_best', 'Thanks!', NOW(), NULL)
;
