# Obtener todos los clientes
SELECT *
FROM tarjeta.CLIENT;

# Obtener todos las tarjetas
SELECT *
FROM tarjeta.CARD;

# Obtener todas las compras
SELECT *
FROM tarjeta.PURCHASE;

# Obtener todos los premios
SELECT *
FROM tarjeta.PRICE;

# INFORMES
# TODO: Terminar la query del informe final
# TODO: Realizar los informes para que sean mensuales

# Premios vigentes
SELECT *
FROM tarjeta.PRICE
WHERE lot != 0
OR status = 0;

# Movimientos clientes (COMPRAS)
SELECT pu.store_id, pu.buy_date, pu.total
FROM tarjeta.CARD ca, tarjeta.PURCHASE pu
WHERE pu.card_id = ca.id
AND ca.dni = '123456A'

# Movimientos clientes (CANJEOS)
SELECT pr.concept, ex.exchange_date
FROM tarjeta.CARD ca, tarjeta.exchange ex, tarjeta.PRICE pr
WHERE pr.id = ex.price_id
AND ex.card_id = ca.id
AND ca.dni = '123456A'

# Dirección de la empresa
# Datos: Por cada tarjeta, el cliente de quien es, dinero gastado al mes,
numero de puntos al mes, los canjeros realizados
SELECT ca.id, ca.dni_client,
FROM tarjeta.CARD ca, tarjeta.exchange ex, tarjeta.PRICE pr, tarjeta.PURCHASE pu
WHERE
