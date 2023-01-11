-- Craigslist

DROP DATABASE IF EXISTS craigslist;

CREATE DATABASE craigslist;

\c craigslist

CREATE TABLE regions (
    id SERIAL PRIMARY KEY,
    region TEXT NOT NULL
);


CREATE TABLE users (
    id SERIAL PRIMARY KEY,
    username VARCHAR(20) UNIQUE NOT NULL,
    password VARCHAR(20) NOT NULL,
    preferred_region_id INTEGER REFERENCES regions ON DELETE SET NULL
);


CREATE TABLE categories (
    id SERIAL PRIMARY KEY,
    category VARCHAR(20) UNIQUE NOT NULL
);

CREATE TABLE posts (
    id SERIAL PRIMARY KEY,
    title TEXT NOT NULL,
    content TEXT NOT NULL,
    location VARCHAR(20),
    user_id INTEGER REFERENCES users ON DELETE CASCADE,
    region_id INTEGER NOT NULL REFERENCES regions ON DELETE CASCADE,
    category_id INTEGER REFERENCES categories ON DELETE SET NULL
);


INSERT INTO regions (region)
VALUES 
('US'), 
('Canada'), 
('Europe'), 
('Asia'),
('Pacific'), 
('Oceania'), 
('Latin America'), 
('Africa'),
('Middle East');

INSERT INTO users (username, password, preferred_region_id)
VALUES
('Ed','12345', 1),
('Nancy','12345', 4),
('Noah','12345', 2),
('Eric','12345', 1);

INSERT INTO categories (category)
VALUES
('Food'),
('Sports'),
('Hobbies'),
('Education'),
('Housing');

INSERT INTO posts (title, content, location, user_id, region_id, category_id)
VALUES
('How to fly?', 'How do I fly an Airplane without a licence?', 'Santa Ana', 1, 1, 2),
('How to mow?', 'How do I mow grass without a killing it?', 'Oakland', 1, 1, 4),
('Buying a house?', 'Need to know mortgage and taxes.', 'Victorville', 1, 1, 5);