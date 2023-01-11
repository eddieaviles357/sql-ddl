-- from the terminal run:
-- psql < music.sql

DROP DATABASE IF EXISTS music;

CREATE DATABASE music;

\c music

-- CREATE TABLE songs
-- (
--   id SERIAL PRIMARY KEY,
--   title TEXT NOT NULL,
--   duration_in_seconds INTEGER NOT NULL,
--   release_date DATE NOT NULL,
--   artists TEXT[] NOT NULL,
--   album TEXT NOT NULL,
--   producers TEXT[] NOT NULL
-- );

-- INSERT INTO songs
--   (title, duration_in_seconds, release_date, artists, album, producers)
-- VALUES
--   ('MMMBop', 238, '04-15-1997', '{"Hanson"}', 'Middle of Nowhere', '{"Dust Brothers", "Stephen Lironi"}'),
--   ('Bohemian Rhapsody', 355, '10-31-1975', '{"Queen"}', 'A Night at the Opera', '{"Roy Thomas Baker"}'),
--   ('One Sweet Day', 282, '11-14-1995', '{"Mariah Cary", "Boyz II Men"}', 'Daydream', '{"Walter Afanasieff"}'),
--   ('Shallow', 216, '09-27-2018', '{"Lady Gaga", "Bradley Cooper"}', 'A Star Is Born', '{"Benjamin Rice"}'),
--   ('How You Remind Me', 223, '08-21-2001', '{"Nickelback"}', 'Silver Side Up', '{"Rick Parashar"}'),
--   ('New York State of Mind', 276, '10-20-2009', '{"Jay Z", "Alicia Keys"}', 'The Blueprint 3', '{"Al Shux"}'),
--   ('Dark Horse', 215, '12-17-2013', '{"Katy Perry", "Juicy J"}', 'Prism', '{"Max Martin", "Cirkut"}'),
--   ('Moves Like Jagger', 201, '06-21-2011', '{"Maroon 5", "Christina Aguilera"}', 'Hands All Over', '{"Shellback", "Benny Blanco"}'),
--   ('Complicated', 244, '05-14-2002', '{"Avril Lavigne"}', 'Let Go', '{"The Matrix"}'),
--   ('Say My Name', 240, '11-07-1999', '{"Destiny''s Child"}', 'The Writing''s on the Wall', '{"Darkchild"}');

CREATE TABLE artists (
  id SERIAL PRIMARY KEY,
  artist_name TEXT NOT NULL
);

CREATE TABLE producers (
  id SERIAL PRIMARY KEY,
  producer_name TEXT NOT NULL
);

CREATE TABLE albums (
  id SERIAL PRIMARY KEY,
  album_name TEXT NOT NULL,
  release_date DATE NOT NULL
);

CREATE TABLE songs (
  id SERIAL PRIMARY KEY,
  song_name TEXT NOT NULL,
  duration_in_seconds INTEGER NOT NULL
);

CREATE TABLE albums_songs (
  id SERIAL PRIMARY KEY,
  album_id INTEGER NOT NULL REFERENCES albums ON DELETE CASCADE,
  song_id INTEGER NOT NULL REFERENCES songs ON DELETE CASCADE
);

CREATE TABLE songs_artists (
  id SERIAL PRIMARY KEY,
  song_id INTEGER NOT NULL REFERENCES songs ON DELETE CASCADE,
  artist_id INTEGER NOT NULL REFERENCES artists ON DELETE CASCADE
);

CREATE TABLE songs_producers (
  id SERIAL PRIMARY KEY,
  song_id INTEGER NOT NULL REFERENCES songs ON DELETE CASCADE,
  producer_id INTEGER NOT NULL REFERENCES producers ON DELETE CASCADE
);

INSERT INTO artists (artist_name)
VALUES
('Hanson'),
('Queen'),
('Mariah Cary'),
('Boyz II Men'),
('Lady Gaga'),
('Nickelback'),
('Bradley Cooper'),
('Jay Z'),
('Alicia Keys'),
('Katy Perry'),
('Juicy J'),
('Maroon 5'),
('Christina Aguilera'),
('Avril Lavigne'),
('Destiny''s Child');

INSERT INTO producers (producer_name)
VALUES
('Dust Brothers'), 
('Stephen Lironi'),
('Roy Thomas Baker'),
('Walter Afanasieff'),
('Rick Parashar'),
('Al Shux'),
('Cirkut'),
('Max Martin'),
('Benny Blanco'),
('Shellback'),
('The Matrix'),
('Darkchild');

INSERT INTO albums (album_name, release_date)
VALUES
('Middle of Nowhere', '04-15-1997'),
('A Night at the Opera', '10-31-1975'),
('Daydream', '11-14-1995'),
('A Star Is Born', '09-27-2018'),
('Silver Side Up', '08-21-2001'),
('The Blueprint 3', '10-20-2009'),
('Prism', '12-17-2013'),
('Hands All Over', '06-21-2011'),
('Let Go', '05-14-2002'),
('The Writing''s on the Wall', '11-07-1999');

INSERT INTO songs (song_name, duration_in_seconds)
VALUES
('MMMBop', 238),
('Bohemian Rhapsody', 355),
('One Sweet Day', 282),
('Shallow', 216),
('How You Remind Me', 223),
('New York State of Mind', 276),
('Dark Horse', 215),
('Moves Like Jagger', 201),
('Complicated', 244),
('Say My Name', 240);

INSERT INTO albums_songs (album_id, song_id)
VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(6, 6),
(7, 7),
(8, 8),
(9, 9),
(10, 10);

INSERT INTO songs_artists (song_id, artist_id)
VALUES
(1, 1),
(2, 2),
(3, 3),
(3, 4),
(4, 5),
(4, 7),
(5, 6),
(6, 8),
(6, 9),
(7, 8),
(7, 10),
(8, 12),
(8, 13),
(9, 14),
(10, 15);

INSERT INTO songs_producers (song_id, producer_id)
VALUES
(1, 1),
(1, 2),
(2, 3),
(3, 4),
(4, 4),
(5, 5),
(6, 6),
(7, 7),
(7, 8),
(8, 9),
(8, 10),
(9, 11),
(10, 12);