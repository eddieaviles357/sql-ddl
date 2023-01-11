-- Soccer League

DROP DATABASE IF EXISTS soccer_league;

CREATE DATABASE soccer_league;

\c soccer_league

CREATE TABLE teams (
    id SERIAL PRIMARY KEY,
    team TEXT UNIQUE NOT NULL
);

CREATE TABLE players (
    id SERIAL PRIMARY KEY,
    player_name VARCHAR(30) NOT NULL,
    birth_date DATE NOT NULL,
    sex VARCHAR(1) NOT NULL,
    team_id INTEGER REFERENCES teams ON DELETE SET NULL
);

CREATE TABLE referees (
    id SERIAL PRIMARY KEY,
    referee_name VARCHAR(30) UNIQUE NOT NULL
);

CREATE TABLE seasons (
    id SERIAL PRIMARY KEY,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL
);

CREATE TABLE matches (
    id SERIAL PRIMARY KEY,
    home_team_id INTEGER NOT NULL REFERENCES teams ON DELETE CASCADE,
    away_team_id INTEGER NOT NULL REFERENCES teams ON DELETE CASCADE,
    season_id INTEGER NOT NULL REFERENCES seasons ON DELETE CASCADE,
    game_date DATE NOT NULL,
    referee_id INTEGER NOT NULL REFERENCES referees ON DELETE CASCADE
);

CREATE TABLE goals (
    id SERIAL PRIMARY KEY,
    player_id INTEGER NOT NULL REFERENCES players ON DELETE CASCADE,
    match_id INTEGER NOT NULL REFERENCES matches ON DELETE CASCADE
);

CREATE TABLE match_results (
    id SERIAL PRIMARY KEY,
    team_id INTEGER NOT NULL REFERENCES teams ON DELETE CASCADE,
    match_id INTEGER REFERENCES matches ON DELETE SET NULL,
    result VARCHAR(1) NOT NULL
);

CREATE TABLE line_up (
    id SERIAL PRIMARY KEY,
    player_id INTEGER NOT NULL REFERENCES players ON DELETE CASCADE,
    match_id INTEGER NOT NULL REFERENCES matches ON DELETE CASCADE,
    team_id INTEGER REFERENCES teams ON DELETE SET NULL
);

INSERT INTO teams (team)
VALUES
('Rockets'),
('Chivas'),
('Munich'),
('America'),
('Xolos'),
('Zoros');

INSERT INTO players (player_name, birth_date, sex, team_id)
VALUES
('Eddie', '1987-07-09', 'M', 1),
('Ed', '1987-07-09', 'M', 1),
('Edward', '1987-07-09', 'M', 1),
('Eduardo', '1987-07-09', 'M', 1),
('Edible', '1987-07-09', 'M', 1),
('Nancy', '1984-02-01', 'F', 2),
('Nanh', '1984-02-01', 'F', 2),
('Nani', '1984-02-01', 'F', 2),
('Nonsense', '1984-02-01', 'F', 2),
('Nanny', '1984-02-01', 'F', 2),
('Silva', '2000-12-04', 'M', 3),
('Selver', '2000-12-04', 'M', 3),
('Sevilla', '2000-12-04', 'M', 3),
('Saliva', '2000-12-04', 'M', 3),
('Simp', '2000-12-04', 'M', 3),
('Juan', '2001-03-20', 'M', 4),
('One', '2001-03-20', 'M', 4),
('Hoan', '2001-03-20', 'M', 4),
('Hanh', '2001-03-20', 'M', 4),
('Joe', '2001-03-20', 'M', 4),
('Hoannna', '1980-01-15', 'F', 5),
('Hoan', '1980-01-15', 'F', 5),
('Hoanh', '1980-01-15', 'F', 5),
('Hoani', '1980-01-15', 'F', 5),
('Hoa', '1980-01-15', 'F', 5);

INSERT INTO referees (referee_name)
VALUES
('Frank'),
('David'),
('Pele'),
('Jesus'),
('Joshua');

INSERT INTO seasons (start_date, end_date)
VALUES
('2023-01-01', '2023-06-01'),
('2023-06-02', '2023-12-01'),
('2024-01-01', '2024-06-01'),
('2024-06-02', '2024-12-01');

INSERT INTO matches (home_team_id, away_team_id, season_id, game_date, referee_id)
VALUES
(1, 2, 1, '2023-01-20', 1),
(1, 2, 1, '2023-02-20', 2);

INSERT INTO goals (player_id, match_id)
VALUES
(1, 1),
(2, 1),
(3, 1),
(1, 2);

INSERT INTO match_results (team_id, match_id, result)
VALUES
(1, 1, 'W'),
(2, 1, 'L'),
(1, 2, 'W'),
(2, 2, 'L');

INSERT INTO line_up (player_id, match_id, team_id)
VALUES
(1, 1, 1),
(2, 1, 1),
(3, 1, 1),
(4, 1, 1),
(5, 1, 1),
(6, 1, 2),
(7, 1, 2),
(8, 1, 2),
(9, 1, 2),
(10, 1, 2);