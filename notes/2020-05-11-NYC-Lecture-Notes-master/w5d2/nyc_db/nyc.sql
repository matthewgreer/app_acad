DROP TABLE IF EXISTS services CASCADE;

CREATE TABLE services(
  id SERIAL PRIMARY KEY,
  service_bullets VARCHAR(255) NOT NULL,
  line_name VARCHAR(255),
  color_name VARCHAR(255),
  hexadecimal VARCHAR(255)
);

INSERT INTO
  services (service_bullets, line_name, color_name, hexadecimal)
VALUES
  ('1/2/3', 'IRT Broadway-Seventh Avenue Line', 'Tomato red', '#ee352e'),
  ('4/5/6', 'IRT Lexington Avenue Line', 'Apple green', '#00933c'),
  ('7', 'IRT Flushing Line', 'Raspberry', '#b933ad'),
  ('A/C/E', 'IND Eigth Avenue Line', 'Vivid blue', '#2850ad'),
  ('B/D/F/M', 'IND Sixth Avenue Line', 'Bright orange', '#ff6319'),
  ('N/Q/R/W', 'BMT Broadway Line', 'Sunflower yellow', '#fccc0a'),
  ('J/Z', 'BMT Nassau Street Line', 'Terra cotta brown', '#996633'),
  ('L', 'BMT Canarsie Line', 'Light slate gray', '#a7a9ac'),
  ('G', 'IND Crosstown Line', 'Lime green', '#6cbe45'),
  ('S', 'IRT 42nd Street Shuttle', 'Dark slate gray', '#808183'),
  ('S', 'BMT Franklin Avenue Line', 'Dark slate gray', '#808183'),
  ('S', 'Rockaway Park Shuttle', 'Dark slate gray', '#808183'),
  ('AA', 'App Academy Elevator Line', NULL, NULL);

-- BOROUGHS

DROP TABLE IF EXISTS boroughs CASCADE;
CREATE TABLE boroughs(
  id SERIAL PRIMARY KEY,
  name VARCHAR(255) NOT NULL,
  population INTEGER NOT NULL
);

INSERT INTO
  boroughs (name, population)
VALUES
  ('Bronx', 1446788),
  ('Brooklyn', 2648452),
  ('Manhattan', 1638281),
  ('Queens', 2330295),
  ('Staten Island', 487155);


-- NEIGHBORHOODS

DROP TABLE IF EXISTS neighborhoods CASCADE;
CREATE TABLE neighborhoods(
  id SERIAL PRIMARY KEY,
  name VARCHAR(255) NOT NULL,
  location_id INTEGER,

  FOREIGN KEY (location_id) REFERENCES boroughs(id)
);

INSERT INTO
  neighborhoods (name, location_id)
VALUES
  ('Belmont', (SELECT id FROM boroughs WHERE name = 'Bronx')),
  ('Parkchester', (SELECT id FROM boroughs WHERE name = 'Bronx')),
  ('Riverdale', (SELECT id FROM boroughs WHERE name = 'Bronx')),
  ('Bay Ridge', (SELECT id FROM boroughs WHERE name = 'Brooklyn')),
  ('Bedford-Stuyvesant', (SELECT id FROM boroughs WHERE name = 'Brooklyn')),
  ('Coney Island', (SELECT id FROM boroughs WHERE name = 'Brooklyn')),
  ('Flatbush', (SELECT id FROM boroughs WHERE name = 'Brooklyn')),
  ('Sheepshead Bay', (SELECT id FROM boroughs WHERE name = 'Brooklyn')),
  ('Williamsburg', (SELECT id FROM boroughs WHERE name = 'Brooklyn')),
  ('Chinatown', (SELECT id FROM boroughs WHERE name = 'Manhattan')),
  ('Harlem', (SELECT id FROM boroughs WHERE name = 'Manhattan')),
  ('Garment District', (SELECT id FROM boroughs WHERE name = 'Manhattan')),
  ('West Village', (SELECT id FROM boroughs WHERE name = 'Manhattan')),
  ('Corona', (SELECT id FROM boroughs WHERE name = 'Queens')),
  ('Flushing', (SELECT id FROM boroughs WHERE name = 'Queens')),
  ('Jackson Heights', (SELECT id FROM boroughs WHERE name = 'Queens')),
  ('Jamaica', (SELECT id FROM boroughs WHERE name = 'Queens')),
  ('Long Island City', (SELECT id FROM boroughs WHERE name = 'Queens'));



-- SERVICE CONNECTIONS

DROP TABLE IF EXISTS service_connections CASCADE;
-- this is joins table - handles many-to-many relationship
-- joining discrete entries from different tables
-- this table acts as a bridge
CREATE TABLE service_connections(
  id SERIAL PRIMARY KEY,
  service_id INTEGER NOT NULL,
  borough_id INTEGER NOT NULL,

  FOREIGN KEY (service_id) REFERENCES services(id),
  FOREIGN KEY (borough_id) REFERENCES boroughs(id)
);


INSERT INTO
  service_connections (service_id, borough_id)
VALUES
  (1, 1),
  (1, 2),
  (1, 3),
  (2, 1),
  (2, 2),
  (2, 3),
  (3, 3),
  (3, 4),
  (4, 2),
  (4, 3),
  (4, 4),
  (5, 1),
  (5, 2),
  (5, 3),
  (5, 4),
  (6, 2),
  (6, 3),
  (6, 4),
  (7, 2),
  (7, 3),
  (7, 4),
  (8, 2),
  (8, 3),
  (9, 2),
  (9, 4),
  (10, 3),
  (11, 2),
  (12, 4),
  (13, 3);
