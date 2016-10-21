/* Creating database */
CREATE DATABASE TARJETA;

/* Using this database */
USE TARJETA;

/* Creating tables from entities */
CREATE TABLE IF NOT EXISTS client (
  dni VARCHAR(50) PRIMARY KEY,
  name VARCHAR(50) NOT NULL,
  surname VARCHAR(50) NOT NULL,
  tlf VARCHAR(25) NOT NULL,
  email VARCHAR(50) NOT NULL,
  address VARCHAR(100) NOT NULL
);

CREATE TABLE IF NOT EXISTS purchase (
  purchase_id VARCHAR(50) PRIMARY KEY,
  idStore VARCHAR(50) NOT NULL,
  buy_date DATE,
  total INT
);

CREATE TABLE IF NOT EXISTS card (
  id VARCHAR(50) PRIMARY KEY,
  points INT NOT NULL DEFAULT '0',
  status BOOLEAN NOT NULL DEFAULT 0,
  balance INT NOT NULL DEFAULT '0'
);

CREATE TABLE IF NOT EXISTS price (
  id VARCHAR(50) PRIMARY KEY,
  status BOOLEAN NOT NULL DEFAULT 0,
  requirement INT,
  lot INT,
  concept VARCHAR(254)
);

/* Creating table from relationship */
CREATE TABLE IF NOT EXISTS exchange (
  card_id VARCHAR(50),
  price_id VARCHAR(50),
  PRIMARY KEY (card_id, price_id),
  FOREIGN KEY (card_id) REFERENCES card(id) ON UPDATE CASCADE,
  FOREIGN KEY (price_id) REFERENCES price(id) ON UPDATE CASCADE
);
