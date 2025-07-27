CREATE TABLE carriers (
  id SERIAL PRIMARY KEY,
  name VARCHAR(255) NOT NULL UNIQUE,
  code INT NOT NULL
);

INSERT INTO carriers (name, code) VALUES ('Vivo', 15);
INSERT INTO carriers (name, code) VALUES ('Tim', 41);
INSERT INTO carriers (name, code) VALUES ('Oi', 31);
INSERT INTO carriers (name, code) VALUES ('Claro', 21);

CREATE TABLE phones (
  id SERIAL PRIMARY KEY,
  number VARCHAR(11) NOT NULL UNIQUE,
  carrier_id INT NOT NULL REFERENCES carriers(id),
  name VARCHAR(255) NOT NULL,
  description TEXT,
  document VARCHAR(11) NOT NULL
);

CREATE TABLE recharges (
  id SERIAL PRIMARY KEY,
  phone_id INT NOT NULL REFERENCES phones(id),
  amount DECIMAL(10,2) NOT NULL CHECK (amount >= 10 AND amount <= 1000),
  timestamp TIMESTAMP DEFAULT NOW()
); 