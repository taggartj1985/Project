DROP TABLE IF EXISTS games;
DROP TABLE IF EXISTS publishers;

CREATE TABLE publishers(
  id SERIAL PRIMARY KEY,
  name VARCHAR(255)
);

CREATE TABLE games(
id SERIAL PRIMARY KEY,
name VARCHAR(255),
description VARCHAR(255),
stock INT,
rrp INT,
price INT,
publisher_id INT REFERENCES publishers(id) ON DELETE CASCADE,
theme VARCHAR(255));
