DROP DATABASE `tarjeta`;

CREATE DATABASE `tarjeta`;

USE `tarjeta`;

CREATE TABLE IF NOT EXISTS CLIENT (
  dni VARCHAR(10) PRIMARY KEY,
  name VARCHAR(15) NOT NULL,
  surname VARCHAR(15) NOT NULL,
  tlf VARCHAR(12) NOT NULL,
  email VARCHAR(25) NOT NULL,
  address VARCHAR(50) NOT NULL
);

CREATE TABLE IF NOT EXISTS CARD (
  id INT PRIMARY KEY AUTO_INCREMENT,
  points INT NOT NULL DEFAULT '0',
  status BOOLEAN NOT NULL DEFAULT 0,
  balance INT NOT NULL DEFAULT '0',
  dni_client VARCHAR(10) NOT NULL,
  FOREIGN KEY (dni_client) REFERENCES CLIENT(dni) ON UPDATE CASCADE
);

CREATE TABLE IF NOT EXISTS PRICE (
  id INT PRIMARY KEY AUTO_INCREMENT,
  status BOOLEAN NOT NULL DEFAULT 0,
  requirement INT,
  lot INT,
  concept VARCHAR(254)
);

CREATE TABLE IF NOT EXISTS exchange (
  card_id INT,
  price_id INT,
  PRIMARY KEY (card_id, price_id),
  FOREIGN KEY (card_id) REFERENCES CARD(id) ON UPDATE CASCADE,
  FOREIGN KEY (price_id) REFERENCES PRICE(id) ON UPDATE CASCADE
);

CREATE TABLE IF NOT EXISTS PURCHASE (
  purchase_id INT PRIMARY KEY AUTO_INCREMENT,
  id_store INT NOT NULL,
  buy_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  total INT NOT NULL,
  dni_client VARCHAR(10) NOT NULL,
  FOREIGN KEY (dni_client) REFERENCES CLIENT(dni) ON UPDATE CASCADE
);

INSERT INTO `tarjeta`.`CLIENT` (`dni`, `name`, `surname`, `tlf`, `email`, `address`) VALUES ('123456A', 'Daniel', 'Melero', '640-000-001', 'daniel.melero@me.com', 'Calle 1, Madrid');
INSERT INTO `tarjeta`.`CLIENT` (`dni`, `name`, `surname`, `tlf`, `email`, `address`) VALUES ('234567B', 'Miguel', 'Núñez', '640-000-002', 'miguel.nunez@me.com', 'Calle 2, Madrid');
INSERT INTO `tarjeta`.`CLIENT` (`dni`, `name`, `surname`, `tlf`, `email`, `address`) VALUES ('345678C', 'Javier', 'Ruiz', '640-000-003', 'javier.ruiz@me.com', 'Calle 3, Madrid');
INSERT INTO `tarjeta`.`CLIENT` (`dni`, `name`, `surname`, `tlf`, `email`, `address`) VALUES ('456789D', 'Irene', 'Sabina', '640-000-004', 'irene.sabina@me.com', 'Calle 4, Madrid');
INSERT INTO `tarjeta`.`CLIENT` (`dni`, `name`, `surname`, `tlf`, `email`, `address`) VALUES ('567890E', 'Carlos', 'Saito', '640-000-005', 'carlos.saito@me.com', 'Calle 5, Madrid');

INSERT INTO `tarjeta`.`CARD` (`dni_client`) VALUES ('123456A');
INSERT INTO `tarjeta`.`CARD` (`dni_client`) VALUES ('234567B');
INSERT INTO `tarjeta`.`CARD` (`dni_client`) VALUES ('345678C');
INSERT INTO `tarjeta`.`CARD` (`dni_client`) VALUES ('456789D');
INSERT INTO `tarjeta`.`CARD` (`dni_client`) VALUES ('567890E');

INSERT INTO `tarjeta`.`PRICE` (`status`, `requirement`, `lot`, `concept`) VALUES ('0', '300', '2', 'Tostadora');
INSERT INTO `tarjeta`.`PRICE` (`status`, `requirement`, `lot`, `concept`) VALUES ('0', '100', '5', 'Literna');
INSERT INTO `tarjeta`.`PRICE` (`status`, `requirement`, `lot`, `concept`) VALUES ('0', '350', '1', 'Cargador para el Automovil');
INSERT INTO `tarjeta`.`PRICE` (`status`, `requirement`, `lot`, `concept`) VALUES ('0', '25', '10', 'Posavasos');

# INSERT INTO `tarjeta`.`exchange` (`card_id`, `price_id`) VALUES ('?','?');

# INSERT INTO `tarjeta`.`PURCHASE` (`id_store`, `total`, `dni_client`) VALUES ('?','?','?');