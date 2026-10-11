SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

DROP DATABASE IF EXISTS periodic_table;
CREATE DATABASE periodic_table;

\c periodic_table;

CREATE TABLE types (
    type_id SERIAL PRIMARY KEY,
    type VARCHAR(30) NOT NULL
);

INSERT INTO types (type) VALUES ('nonmetal'), ('metal'), ('metalloid');

CREATE TABLE elements (
    atomic_number INT PRIMARY KEY,
    symbol VARCHAR(2) UNIQUE NOT NULL,
    name VARCHAR(40) UNIQUE NOT NULL
);

INSERT INTO elements VALUES 
(1, 'H', 'Hydrogen'),
(2, 'He', 'Helium'),
(3, 'Li', 'Lithium'),
(4, 'Be', 'Beryllium'),
(5, 'B', 'Boron'),
(6, 'C', 'Carbon'),
(7, 'N', 'Nitrogen'),
(8, 'O', 'Oxygen'),
(9, 'F', 'Fluorine'),
(10, 'Ne', 'Neon');

CREATE TABLE properties (
    atomic_number INT UNIQUE NOT NULL REFERENCES elements(atomic_number),
    type_id INT NOT NULL REFERENCES types(type_id),
    atomic_mass DECIMAL(9, 3) NOT NULL,
    melting_point_celsius NUMERIC NOT NULL,
    boiling_point_celsius NUMERIC NOT NULL
);

INSERT INTO properties VALUES
(1, 1, 1.008, -259.1, -252.9),
(2, 1, 4.0026, -272.2, -268.9),
(3, 2, 6.94, 180.54, 1342),
(4, 2, 9.0122, 1287, 2470),
(5, 3, 10.81, 2075, 4000),
(6, 1, 12.011, 3550, 4827),
(7, 1, 14.007, -209.86, -195.8),
(8, 1, 15.999, -218.79, -182.96),
(9, 1, 18.998, -220, -188.1),
(10, 1, 20.18, -248.6, -246.1);
