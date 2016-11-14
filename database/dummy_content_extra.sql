INSERT INTO `tarjeta`.`CLIENT` (`dni`, `name`, `surname`, `tlf`, `email`, `address`)
    VALUES ('123456A', 'Daniel', 'Melero', '640-000-001', 'daniel.melero@me.com', 'Calle 1, Madrid');
INSERT INTO `tarjeta`.`CLIENT` (`dni`, `name`, `surname`, `tlf`, `email`, `address`)
    VALUES ('234567B', 'Miguel', 'Núñez', '640-000-002', 'miguel.nunez@me.com', 'Calle 2, Madrid');
INSERT INTO `tarjeta`.`CLIENT` (`dni`, `name`, `surname`, `tlf`, `email`, `address`)
    VALUES ('345678C', 'Javier', 'Ruiz', '640-000-003', 'javier.ruiz@me.com', 'Calle 3, Madrid');
INSERT INTO `tarjeta`.`CLIENT` (`dni`, `name`, `surname`, `tlf`, `email`, `address`)
    VALUES ('456789D', 'Irene', 'Sabina', '640-000-004', 'irene.sabina@me.com', 'Calle 4, Madrid');
INSERT INTO `tarjeta`.`CLIENT` (`dni`, `name`, `surname`, `tlf`, `email`, `address`)
    VALUES ('567890E', 'Carlos', 'Saito', '640-000-005', 'carlos.saito@me.com', 'Calle 5, Madrid');

INSERT INTO `tarjeta`.`CARD` (`dni_client`) VALUES ('123456A');
INSERT INTO `tarjeta`.`CARD` (`dni_client`) VALUES ('234567B');
INSERT INTO `tarjeta`.`CARD` (`dni_client`) VALUES ('345678C');
INSERT INTO `tarjeta`.`CARD` (`dni_client`) VALUES ('456789D');
INSERT INTO `tarjeta`.`CARD` (`dni_client`) VALUES ('567890E');

INSERT INTO `tarjeta`.`PRICE` (`status`, `requirement`, `lot`, `concept`)
    VALUES ('0', '300', '2', 'Tostadora');
INSERT INTO `tarjeta`.`PRICE` (`status`, `requirement`, `lot`, `concept`)
    VALUES ('0', '100', '5', 'Literna');
INSERT INTO `tarjeta`.`PRICE` (`status`, `requirement`, `lot`, `concept`)
    VALUES ('0', '350', '1', 'Cargador para el Automovil');
INSERT INTO `tarjeta`.`PRICE` (`status`, `requirement`, `lot`, `concept`)
    VALUES ('0', '25', '10', 'Posavasos');

# INSERT INTO `tarjeta`.`exchange` (`card_id`, `price_id`) VALUES ('?','?');

# INSERT INTO `tarjeta`.`PURCHASE` (`store_id`, `total`, `dni_client`) VALUES ('?','?','?');

# Tiendas:
# 1 -> Apple Store
# 2 -> Fnac
# 3 -> Amazon
# 4 -> El Corte Inglés

###############
# OPERACIÓN 01: Daniel realiza una compra en El Corte Inglés
###############

# Realizamos una compra para acumular los puntos en la tarjeta
INSERT INTO `tarjeta`.`PURCHASE` (`store_id`, `total`, `card_id`) VALUES ('4','1000','1');
    # Los puntos a introducir en la tarjeta es la mitad de la compra hecha 500 puntos
    # Obtenemos los puntos actuales de la tarjeta para incrementarlos
    # CONSULTA: Obtener puntos de una tarjeta y calcular los puntos nuevos
    # SELECT points FROM tarjeta.CARD WHERE id = 'id_elegido';
UPDATE `tarjeta`.`CARD` SET `points`='500' WHERE `id`='1';

###############
# OPERACIÓN 02: Daniel compra la oferta del cargador del movil
###############

# Seleccionamos el premio a canjear
INSERT INTO `tarjeta`.`exchange` (`card_id`, `price_id`) VALUES ('1','3');
    # CONSULTA: Obtener los puntos que cuesta el premio y los restamos a la tarjeta
    # SELECT requirement FROM tarjeta.PRICE WHERE id = '3';
UPDATE `tarjeta`.`CARD` SET `points`='150' WHERE `id`='1';
    # CONSULTA: Obtener los lot de un premio para restarle 1
    # SELECT lot FROM tarjeta.PRICE WHERE id = 'id_elegido'
UPDATE `tarjeta`.`PRICE` SET `lot`='0' WHERE `id`='3';
    # Si el lot se queda a 0 modificar el status de ese premio
UPDATE `tarjeta`.`PRICE` SET `status`='1' WHERE `id`='3';

###############
# OPERACIÓN 03: Daniel compra la oferta del posavasos
###############

# Seleccionamos el premio a canjear
INSERT INTO `tarjeta`.`exchange` (`card_id`, `price_id`) VALUES ('1','4');
    # CONSULTA: Obtener los puntos que cuesta el premio y los restamos a la tarjeta
    # SELECT requirement FROM tarjeta.PRICE WHERE id = '3';
UPDATE `tarjeta`.`CARD` SET `points`='125' WHERE `id`='1';
    # CONSULTA: Obtener los lot de un premio para restarle 1
    # SELECT lot FROM tarjeta.PRICE WHERE id = 'id_elegido'
UPDATE `tarjeta`.`PRICE` SET `lot`='9' WHERE `id`='4';
    # Si el lot se queda a 0 modificar el status de ese premio
    # UPDATE `tarjeta`.`PRICE` SET `status`='1' WHERE `id`='3';

###############
# OPERACIÓN 04: Daniel devuelve el cargador del movil
###############

# Seleccionamos el premio ha devolver
DELETE FROM `tarjeta`.`exchange` WHERE `card_id` = '1' AND `price_id`= '3';
    # CONSULTA: Obtener los puntos que cuesta el premio y los sumamos a la tarjeta
    # SELECT requirement FROM tarjeta.PRICE WHERE id = '3';
UPDATE `tarjeta`.`CARD` SET `points`='475' WHERE `id`='1';
    # CONSULTA: Obtener los lot de un premio para sumarle 1
    # SELECT lot FROM tarjeta.PRICE WHERE id = 'id_elegido'
UPDATE `tarjeta`.`PRICE` SET `lot`='1' WHERE `id`='3';
    # Si el lot es mayor de 1 poner el status a 0
UPDATE `tarjeta`.`PRICE` SET `status`='0' WHERE `id`='3';

###############
# OPERACIÓN 05: Daniel devuelve el posavasos
###############

# Seleccionamos el premio ha devolver
DELETE FROM `tarjeta`.`exchange` WHERE `card_id` = '1' AND `price_id`= '4';
    # CONSULTA: Obtener los puntos que cuesta el premio y los sumamos a la tarjeta
    # SELECT requirement FROM tarjeta.PRICE WHERE id = '3';
UPDATE `tarjeta`.`CARD` SET `points`='500' WHERE `id`='1';
    # CONSULTA: Obtener los lot de un premio para sumarle 1
    # SELECT lot FROM tarjeta.PRICE WHERE id = 'id_elegido'
UPDATE `tarjeta`.`PRICE` SET `lot`='10' WHERE `id`='4';
    # Si el lot es mayor de 1 poner el status a 0
    # UPDATE `tarjeta`.`PRICE` SET `status`='0' WHERE `id`='4';

###############
# OPERACIÓN 06: Daniel realiza una compra en El Corte Inglés
###############

# Realizamos una compra para acumular los puntos en la tarjeta
INSERT INTO `tarjeta`.`PURCHASE` (`store_id`, `total`, `card_id`) VALUES ('4','1500','1');
    # Los puntos a introducir en la tarjeta es la mitad de la compra hecha 500 puntos
    # Obtenemos los puntos actuales de la tarjeta para incrementarlos
    # CONSULTA: Obtener puntos de una tarjeta y calcular los puntos nuevos
    # SELECT points FROM tarjeta.CARD WHERE id = 'id_elegido';
UPDATE `tarjeta`.`CARD` SET `points`='2000' WHERE `id`='1';