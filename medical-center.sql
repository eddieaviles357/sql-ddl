-- Medical databse

DROP DATABASE IF EXISTS medical;

CREATE DATABASE medical;

\c medical

CREATE TABLE medical_center (
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL UNIQUE,
    phone_number VARCHAR(13) NOT NULL UNIQUE
);


CREATE TABLE diseases (
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL UNIQUE,
    curable BOOLEAN NOT NULL
);


CREATE TABLE doctors (
    id SERIAL PRIMARY KEY,
    first_name VARCHAR(15) NOT NULL,
    last_name VARCHAR(15) NOT NULL,
    medical_center_id INTEGER REFERENCES medical_center ON DELETE SET NULL
);



CREATE TABLE patients (
    id SERIAL PRIMARY KEY,
    first_name VARCHAR(15) NOT NULL,
    last_name VARCHAR(15) NOT NULL,
    birth_date DATE NOT NULL,
    sex VARCHAR(1) NOT NULL,
    diseases_id INTEGER REFERENCES diseases ON DELETE SET NULL
);


CREATE TABLE doctors_patients (
    id SERIAL PRIMARY KEY,
    doctors_id INTEGER NOT NULL REFERENCES doctors ON DELETE CASCADE,
    patients_id INTEGER NOT NULL REFERENCES patients ON DELETE CASCADE
);

INSERT INTO doctors_patients (doctors_id, patients_id)
VALUES
(2, 1),
(1, 1),
(3, 1),
(1, 1),
(1, 2),
(1, 3),
(1, 4),
(1, 5),
(2, 5);


INSERT INTO medical_center (name, phone_number)
VALUES 
('Best Urgent Care', '(949)888-1111'),
('Kids Care', '(949)305-1111'),
('Genki Care', '(714)935-2222');

INSERT INTO diseases (name, curable)
VALUES
('Parkinsons', FALSE),
('HIV', FALSE),
('Herpes', FALSE),
('Cold', TRUE),
('Flu', TRUE),
('Covid', TRUE),
('Alzheimers', TRUE);

INSERT INTO doctors (first_name, last_name, medical_center_id)
VALUES
('Jhon', 'Parkinson', 1),
('Jose', 'Araiza', 2),
('Wasim', 'Raja', 3);

INSERT INTO patients (first_name, last_name, birth_date, sex, diseases_id)
VALUES
('Eddie', 'Aviles', '1987-07-09', 'M', 4),
('Josh', 'Acorn', '2000-01-09', 'M', 4),
('Mayra', 'Whale', '1980-09-15', 'F', 1),
('Nancy', 'Santos', '1949-12-23', 'F', 5),
('Jesse', 'Palma', '1990-12-23', 'F', NULL);