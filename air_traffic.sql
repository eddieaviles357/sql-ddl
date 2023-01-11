-- from the terminal run:
-- psql < air_traffic.sql

DROP DATABASE IF EXISTS air_traffic;

CREATE DATABASE air_traffic;

\c air_traffic

-- CREATE TABLE tickets
-- (
--   id SERIAL PRIMARY KEY,
--   first_name TEXT NOT NULL,
--   last_name TEXT NOT NULL,
--   seat TEXT NOT NULL,
--   departure TIMESTAMP NOT NULL,
--   arrival TIMESTAMP NOT NULL,
--   airline TEXT NOT NULL,
--   from_city TEXT NOT NULL,
--   from_country TEXT NOT NULL,
--   to_city TEXT NOT NULL,
--   to_country TEXT NOT NULL
-- );

-- INSERT INTO tickets
--   (first_name, last_name, seat, departure, arrival, airline, from_city, from_country, to_city, to_country)
-- VALUES
--   ('Jennifer', 'Finch', '33B', '2018-04-08 09:00:00', '2018-04-08 12:00:00', 'United', 'Washington DC', 'United States', 'Seattle', 'United States'),
--   ('Thadeus', 'Gathercoal', '8A', '2018-12-19 12:45:00', '2018-12-19 16:15:00', 'British Airways', 'Tokyo', 'Japan', 'London', 'United Kingdom'),
--   ('Sonja', 'Pauley', '12F', '2018-01-02 07:00:00', '2018-01-02 08:03:00', 'Delta', 'Los Angeles', 'United States', 'Las Vegas', 'United States'),
--   ('Jennifer', 'Finch', '20A', '2018-04-15 16:50:00', '2018-04-15 21:00:00', 'Delta', 'Seattle', 'United States', 'Mexico City', 'Mexico'),
--   ('Waneta', 'Skeleton', '23D', '2018-08-01 18:30:00', '2018-08-01 21:50:00', 'TUI Fly Belgium', 'Paris', 'France', 'Casablanca', 'Morocco'),
--   ('Thadeus', 'Gathercoal', '18C', '2018-10-31 01:15:00', '2018-10-31 12:55:00', 'Air China', 'Dubai', 'UAE', 'Beijing', 'China'),
--   ('Berkie', 'Wycliff', '9E', '2019-02-06 06:00:00', '2019-02-06 07:47:00', 'United', 'New York', 'United States', 'Charlotte', 'United States'),
--   ('Alvin', 'Leathes', '1A', '2018-12-22 14:42:00', '2018-12-22 15:56:00', 'American Airlines', 'Cedar Rapids', 'United States', 'Chicago', 'United States'),
--   ('Berkie', 'Wycliff', '32B', '2019-02-06 16:28:00', '2019-02-06 19:18:00', 'American Airlines', 'Charlotte', 'United States', 'New Orleans', 'United States'),
--   ('Cory', 'Squibbes', '10D', '2019-01-20 19:30:00', '2019-01-20 22:45:00', 'Avianca Brasil', 'Sao Paolo', 'Brazil', 'Santiago', 'Chile');

CREATE TABLE passengers (
  id SERIAL PRIMARY KEY,
  first_name TEXT NOT NULL,
  last_name TEXT NOT NULL
);


CREATE TABLE seats (
  id SERIAL PRIMARY KEY,
  seat VARCHAR(3) NOT NULL
);

CREATE TABLE countries (
  id SERIAL PRIMARY KEY,
  country_name TEXT NOT NULL
);

CREATE TABLE cities (
  id SERIAL PRIMARY KEY,
  city_name TEXT NOT NULL
);


CREATE TABLE airlines (
  id SERIAL PRIMARY KEY,
  airline TEXT NOT NULL
);

INSERT INTO passengers (first_name, last_name)
VALUES
('Jennifer', 'Finch'),
('Thadeus', 'Gathercoal'),
('Sonja', 'Pauley'),
('Waneta', 'Skeleton'),
('Berkie', 'Wycliff'),
('Alvin', 'Leathes'),
('Cory', 'Squibbes');

CREATE TABLE tickets (
  id SERIAL PRIMARY KEY,
  passenger_id INTEGER NOT NULL REFERENCES passengers ON DELETE CASCADE,
  seat_id INTEGER NOT NULL REFERENCES seats ON DELETE CASCADE,
  departure TIMESTAMP,
  arrival TIMESTAMP,
  airline_id INTEGER NOT NULL REFERENCES airlines ON DELETE CASCADE,
  from_city_id INTEGER NOT NULL REFERENCES cities ON DELETE CASCADE,
  from_country_id INTEGER NOT NULL REFERENCES countries ON DELETE CASCADE,
  to_city_id INTEGER NOT NULL REFERENCES cities ON DELETE CASCADE,
  to_country_id INTEGER NOT NULL REFERENCES countries ON DELETE CASCADE
);

INSERT INTO seats (seat)
VALUES
('1A'),
('8A'),
('20A'),
('32B'),
('33B'),
('18C'),
('10D'),
('23D'),
('9E'),
('12F');


INSERT INTO countries (country_name)
VALUES
('United States'),
('United Kingdom'),
('Japan'),
('Mexico'),
('Morocco'),
('China'),
('Chile'),
('France'),
('Brazil'),
('UAE');


INSERT INTO cities (city_name)
VALUES
('Washington DC'),
('Seattle'),
('London'),
('Tokyo'),
('Las Vegas'),
('Charlotte'),
('Los Angeles'),
('Mexico City'),
('Paris'),
('Casablanca'),
('Dubai'),
('Beijing'),
('Cedar Rapids'),
('Chicago'),
('New Orleans'),
('Sao Paolo'),
('Santiago'),
('New York');

INSERT INTO airlines (airline)
VALUES
('United'),
('British Airways'),
('Delta'),
('TUI Fly Belgium'),
('Air China'),
('American Airlines'),
('Avianca Brasil');

INSERT INTO tickets
  (passenger_id, seat_id, departure, arrival, airline_id, from_city_id, from_country_id, to_city_id, to_country_id)
VALUES
  (1, 5, '2018-04-08 09:00:00', '2018-04-08 12:00:00', 1, 1, 1, 2, 1),
  (2, 2, '2018-12-19 12:45:00', '2018-12-19 16:15:00', 2, 4, 3, 3, 2),
  (3, 10, '2018-01-02 07:00:00', '2018-01-02 08:03:00', 3, 7, 1, 5, 1),
  (1, 3, '2018-04-15 16:50:00', '2018-04-15 21:00:00', 3, 2, 1, 8, 4),
  (4, 8, '2018-08-01 18:30:00', '2018-08-01 21:50:00', 4, 9, 8, 10, 5),
  (2, 6, '2018-10-31 01:15:00', '2018-10-31 12:55:00', 5, 11, 10, 12, 6),
  (5, 9, '2019-02-06 06:00:00', '2019-02-06 07:47:00', 1, 18, 1, 6, 1),
  (6, 1, '2018-12-22 14:42:00', '2018-12-22 15:56:00', 6, 13, 1, 14, 1),
  (5, 4, '2019-02-06 16:28:00', '2019-02-06 19:18:00', 6, 6, 1, 15, 1),
  (7, 7, '2019-01-20 19:30:00', '2019-01-20 22:45:00', 7, 16, 9, 17, 7);