CREATE TABLE aerolineas (id_aerolinea NUMERIC, nombre_aerolinea VARCHAR) -- Se crea la tabla aerolineas
INSERT INTO aerolineas VALUES (1, 'Volaris'), (2,'Aeromar'), (3, 'Interjet'), (4,'Aeromexico') -- Se agregan los datos a la tabla

CREATE TABLE aeropuertos (id_aeropuerto NUMERIC, nombre_aerolinea VARCHAR) -- Se crea la tabla aeropuertos, observacion cambiar nombre_aerolinea por  nombre_aeropuerto 
INSERT INTO aeropuertos VALUES (1,'Benito Juarez'), (2,'Guanajuato'), (3,'La Paz'), (4,'Oaxaca') -- Se agregan los datos a aeropuertos

CREATE TABLE movimientos (id_movimiento NUMERIC, descripcion VARCHAR)
INSERT INTO movimientos VALUES (1,'Salida'), (2,'LLegada')

CREATE TABLE vuelos (id_aerolinea NUMERIC, id_aeropuerto NUMERIC, id_movimiento NUMERIC, dia z) 
INSERT INTO vuelos VALUES (1,1,1, CAST('2021-05-02' AS DATE)),
  						  (2,1,1, CAST('2021-05-02' AS DATE)),
						  (3,2,2, CAST('2021-05-02' AS DATE)),
						  (4,3,2, CAST('2021-05-02' AS DATE)),
						  (1,3,2, CAST('2021-05-02' AS DATE)),
						  (2,1,1, CAST('2021-05-02' AS DATE)),
						  (2,3,1, CAST('2021-05-04' AS DATE)),
						  (3,4,1, CAST('2021-05-04' AS DATE)),
						  (3,4,1, CAST('2021-05-04' AS DATE))


--------------------------RESPUESTA 1----------------------------				  

SELECT  COUNT(*) Numero_movimientos, aeropuertos.nombre_aerolinea 
FROM vuelos 
	LEFT JOIN aeropuertos 
	ON aeropuertos.id_aeropuerto = vuelos.id_aeropuerto
WHERE EXTRACT(YEAR FROM dia) = 2021
GROUP BY vuelos.id_aeropuerto, nombre_aerolinea 
ORDER BY numero_movimientos DESC 
LIMIT 1 

-- Benito Juarez tiene el mayot movimiento durante el año con 3

--------------------------RESPUESTA 2----------------------------	
SELECT  COUNT(*) Numero_movimientos, aerolineas.nombre_aerolinea 
FROM vuelos 
	LEFT JOIN aerolineas 
	ON aerolineas.id_aerolinea = vuelos.id_aerolinea
WHERE EXTRACT(YEAR FROM dia) = 2021
GROUP BY vuelos.id_aerolinea, nombre_aerolinea 
ORDER BY numero_movimientos DESC 
LIMIT 1

-- Aeromar tiene el mayor numero de vuelos en el año

--------------------------RESPUESTA 3----------------------------	
SELECT COUNT(*) numero_vuelos, dia
FROM vuelos   
GROUP BY vuelos.dia
ORDER BY numero_vuelos DESC
Limit 1

-- En el dia 02 se tuvo la mayor cantidad de vuelos

--------------------------RESPUESTA 4----------------------------	
SELECT dia,nombre_aerolinea, COUNT(*) numero_de_vuelos
FROM vuelos 
	LEFT JOIN aerolineas
	ON vuelos.id_aerolinea = aerolineas.id_aerolinea
GROUP BY aerolineas.nombre_aerolinea, dia
HAVING COUNT(*) > 2

-- Ninguna es mayor a 2 vuelos por dia 