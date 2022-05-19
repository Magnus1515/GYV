-- create database entidadbancaria_Ejercicio15;

use entidadbancaria_Ejercicio15;

CREATE TABLE sucursal(
    nombre_sucursal CHAR(30) NOT NULL,
    ciudad_sucursal CHAR(30) NOT NULL,
    activos INT NOT NULL,
    PRIMARY KEY (nombre_sucursal)
    
);
CREATE TABLE cliente(
    nombre_cliente CHAR(20) NOT NULL,
    calle_cliente CHAR(30) NOT NULL,
    ciudad_cliente CHAR(30) NOT NULL,
    PRIMARY KEY (nombre_cliente)
    
);
CREATE TABLE prestamo(
    numero_prestamo BIGINT NOT NULL,
    nombre_sucursal CHAR(30) NOT NULL,
    importe INT NOT NULL,
    PRIMARY KEY (numero_prestamo),
    key foranea_prestamo1 (nombre_sucursal),
	constraint foranea_prestamo1 foreign key (nombre_sucursal)
		references sucursal(nombre_sucursal)
);
CREATE TABLE prestatario (
    nombre_cliente CHAR(20) NOT NULL,
    numero_prestamo BIGINT NOT NULL,
    primary key (nombre_cliente, numero_prestamo),
    key foranea_prestatario1 (nombre_cliente),
	constraint foranea_prestatario1 foreign key (nombre_cliente)
		references cliente(nombre_cliente),
    key foranea_prestatatario2 (numero_prestamo),
    constraint foranea_prestatatario2 foreign key (numero_prestamo)
		references prestamo(numero_prestamo)
);
CREATE TABLE cuenta (
    numero_cuenta INT NOT NULL,
    nombre_sucursal CHAR(20) NOT NULL,
    saldo INT NOT NULL,
    PRIMARY KEY (numero_cuenta),
    key foranea_cuenta1 (nombre_sucursal),
    constraint foranea_cuenta1 foreign key (nombre_sucursal)
		references sucursal(nombre_sucursal)
);
CREATE TABLE impositor (
    nombre_cliente CHAR(20) NOT NULL,
    numero_cuenta INT NOT NULL,
    PRIMARY KEY (nombre_cliente , numero_cuenta),
    key foranea_impositor1 (nombre_cliente),
    constraint foranea_impositor1 foreign key (nombre_cliente)
		references cliente(nombre_cliente),
    key foranea_impositor2 (numero_cuenta),
    constraint foranea_impositor2 foreign key(numero_cuenta)
		references cuenta(numero_cuenta)    
);

INSERT INTO sucursal(nombre_sucursal,ciudad_sucursal,activos) 
VALUES 
("Aguacaliente","Tijuana", 	5000000), 
("Las Palmas", 	"San diego", 	6000000),  
("El soler", "leon",70000000),
("Centro", "torreon",800000),
("Tacubaya","culiacan",900000),
('Florido',	'Houston' ,	500000),
("Los alamos" ,	"San francisco" ,	400000),
("Loma bonita" ,	"Monterrey" ,	600000),
("Campestre" ,	"San luis" ,	100000),
("Solecito" ,	"Ciudad obregon", 	6000000),
("Los tres rios" ,	"Hermosillo" ,	70000000),
("Carritos" ,	"Cdmx",	400000),
("Carrusel" ,	"Cdmx",	600000),
("Los lomos", 	"Cdmx",	6000000),
("Cubana","Cdmx",70000000);

INSERT INTO cliente(nombre_cliente,calle_cliente, ciudad_cliente) 
VALUES
("Julieta",	"las lomas" ,"Tijuana" ),
("Jacobo",	"las ferias" ,	"San diego" ),
("Anastasio", 	"coahuila", 	"leon" ),
("Max"	,"cuarta" ,	"torreon" ),
("Martin", 	"agua caliente" ,	"culiacan"),
("Omar" ,	"benito juarez",	"Houston") ,
("Leonardo", 	"durango" ,	"San francisco") ,
("Amador" ,	"mexico" 	,"Monterrey") ,
("Claudio" ,	"tres cabezas"	,"San luis") ,
("Jose" ,	"independencia" ,	"Ciudad obregon"), 
("Juan" ,	"ignacio larios" ,	"Hermosillo") ,
("Luis" ,	"creativo" ,	"Cdmx"),
("Frank" ,	"michoacana" ,	"Cdmx"),
("Loise" ,	"popular" ,	"Cdmx"),
("Rogelio", 	"cruz rojas",	"Cdmx");
INSERT INTO prestamo(numero_prestamo,nombre_sucursal, importe) 
VALUES
(92450,	"Aguacaliente"	,5000),
(3672,	"Las Palmas" ,	10000),
(84334, "El soler",	6000),
(88568,	"Centro",	40000),
(62279,	"Tacubaya",	40500),
(80791,	"Florido", 	50600),
(6800,	"Los alamos", 	60700),
(89421,	"Loma bonita" ,	70800),
(1758,	"Campestre" ,	80900),
(58101,	"Solecito", 	91000),
(88054,	"Los tres rios" ,	101100),
(57891,	"Carritos", 	111200),
(97675,	"Carrusel", 	121300),
(2027,	"Los lomos", 	131400),
(31715,	"Cubana",	141500);

INSERT INTO prestatario(nombre_cliente , numero_prestamo) 
VALUES
("Julieta",	92450),
("Jacobo",	3672),
("Anastasio" ,	84334),
("Max",	88568),
("Martin", 	62279),
("Omar", 	80791),
("Leonardo" ,	6800),
("Amador" ,	89421),
("Claudio" ,	1758),
("Jose",	58101),
("Juan", 	88054),
("Luis", 	57891),
("Frank" ,	97675),
("Luis", 	2027),
("Rogelio", 31715);

INSERT INTO cuenta(numero_cuenta , nombre_sucursal, saldo)
values
(18393, "Aguacaliente", 213124),
(25273, "Las Palmas", 312312),
(35647,	"El soler", 523423),
(18635,	"Centro", 312312),
(14940,	"Tacubaya", 321312),
(40387,	"Florido",545343 ),
(12040,	"Los alamos",312312),
(31062,	"Loma bonita",554343), 
(25572,	"Campestre",6542323), 
(47545,	"Solecito",5443523),
(42476,	"Los tres rios",543242), 
(44356,	"Carritos",312312), 
(15147,	"Carrusel",54324),
(39195,	"Los lomos",5445324), 
(39411,	"Cubana",43422);

INSERT INTO impositor(nombre_cliente, numero_cuenta)
values
("Julieta",	18393),
("Jacobo",25273),
("Anastasio", 	35647),
("Max"	,18635),
("Martin" ,	14940),
("Omar" 	,40387),
("Leonardo", 	12040),
("Amador",	31062),
("Claudio" ,	25572),
("Jose" 	,47545),
("Juan" 	,42476),
("Luis" 	,44356),
("Frank" 	,15147),
("Luis" 	,39195),
("Rogelio" ,39411);



# Generar 3 consultas haciendo uso de las clausula WHERE.

select ciudad_cliente
from cliente
where ciudad_cliente="Cdmx";

select ciudad_sucursal 
from sucursal
where ciudad_sucursal="Tijuana";

select nombre_cliente,numero_cuenta
from impositor
where nombre_cliente="Frank";

# Generar 3 consultas haciendo uso de la cláusula FROM involucrando de 2 tablas en adelante.
select impositor.numero_cuenta, cuenta.numero_cuenta
from impositor, cuenta
where impositor.numero_cuenta=18393 AND cuenta.numero_cuenta=18393;

select cuenta.nombre_sucursal, prestamo.nombre_sucursal
from prestamo, cuenta
where cuenta.nombre_sucursal="Campestre" AND cuenta.nombre_sucursal="Campestre";

select cuenta.nombre_sucursal, prestamo.nombre_sucursal
from cuenta,prestamo
where cuenta.nombre_sucursal - prestamo.nombre_sucursal;

# Generar 3 operaciones de renombramiento.
ALTER TABLE prestatario
RENAME TO prestamos_realizados; #cambiamos de prestatarios a prestamos_realizados

ALTER TABLE cliente 
RENAME TO catalogo_clientes; #cambiamos de clientes a catalogo_clientes

ALTER TABLE sucursal 
RENAME TO sucursales; # cambiamos de sucursal a sucursales

# Generar 3 consulta involucrando variables tupla.
select C.nombre_sucursal, P.nombre_sucursal
from cuenta as C ,prestamo as P
where C.nombre_sucursal = P.nombre_sucursal;

select I.numero_cuenta, C.numero_cuenta
from impositor as I, cuenta as C
where I.numero_cuenta=18393 AND C.numero_cuenta=18393;

select I.nombre_cliente,C.nombre_cliente
from impositor as I, catalogo_clientes as C
where I.nombre_cliente = C.nombre_cliente;

#Generar 3 operaciones con distinto formato con cadena de caracteres 
#utilizando el operador LIKE además de los caracteres especiales tanto
#por ciento (%) y subrayado (_).

SELECT ciudad_cliente
FROM catalogo_clientes
WHERE ciudad_cliente like "C%";

select ciudad_cliente
from catalogo_clientes
where ciudad_cliente like "%c";

select ciudad_cliente
from catalogo_clientes
where ciudad_cliente like "_a%";


# 5 consultas aplicando la operación UNIÓN --JOIN 
select C.nombre_cliente, C.calle_cliente,C.ciudad_cliente
from catalogo_clientes as C 
JOIN impositor ON C.nombre_cliente = impositor.nombre_cliente;

select C.nombre_cliente, C.calle_cliente,C.ciudad_cliente
from catalogo_clientes as C 
JOIN prestamos_realizados on C.nombre_cliente = prestamos_realizados.nombre_cliente;

select P.numero_prestamo, P.nombre_sucursal 
from prestamo as P
JOIN sucursales on P.nombre_sucursal = sucursales.nombre_sucursal;

select P.numero_prestamo, P.nombre_sucursal, P.importe 
from prestamo as P
JOIN prestamos_realizados on P.numero_prestamo = prestamos_realizados.numero_prestamo;

select C.nombre_cliente, C.calle_cliente,C.ciudad_cliente
from catalogo_clientes as C 
JOIN prestamos_realizados on C.nombre_cliente = prestamos_realizados.nombre_cliente;

# 5 consultas aplicando la operación INTERSECCIÓN- INNER JOIN  
select C.nombre_cliente, C.calle_cliente,C.ciudad_cliente
from catalogo_clientes as C 
INNER JOIN impositor ON C.nombre_cliente = impositor.nombre_cliente;

select P.numero_prestamo, P.nombre_sucursal, P.importe 
from prestamo as P
INNER JOIN prestamos_realizados on P.numero_prestamo = prestamos_realizados.numero_prestamo;

select C.nombre_cliente, C.calle_cliente,C.ciudad_cliente
from catalogo_clientes as C 
INNER JOIN prestamos_realizados on C.nombre_cliente = prestamos_realizados.nombre_cliente;

select C.nombre_cliente, C.calle_cliente,C.ciudad_cliente
from catalogo_clientes as C 
INNER JOIN prestamos_realizados on C.nombre_cliente = prestamos_realizados.nombre_cliente;

# 5 consultas aplicando la operación EXCEPT- NOT IN- NOT EXIST 
SELECT numero_cuenta, nombre_sucursal, saldo 
FROM cuenta  
WHERE saldo
AND saldo NOT IN (40000,5000);

SELECT numero_cuenta, nombre_sucursal, saldo 
FROM cuenta  
WHERE saldo
AND saldo NOT IN (10000,400000);

SELECT nombre_cliente, numero_cuenta
FROM impositor  
WHERE numero_cuenta
AND numero_cuenta NOT IN (10000,400000);

SELECT nombre_cliente, numero_cuenta
FROM impositor  
WHERE numero_cuenta
AND numero_cuenta NOT IN (10000,100000);

SELECT nombre_cliente, numero_cuenta
FROM impositor  
WHERE numero_cuenta
AND numero_cuenta NOT IN (12000,15000);

#Generar 3 consultas de cada una de las funciones de agregación: AVG
SELECT * FROM cuenta
WHERE saldo > (SELECT AVG(saldo) FROM cuenta);
	
SELECT * FROM impositor
WHERE numero_cuenta > (SELECT AVG(numero_cuenta) FROM impositor);

SELECT AVG(importe) AS promedio_importe FROM prestamo;

#Generar 3 consultas de cada una de las funciones de agregación: MIN
SELECT MIN(importe) AS valor_minimo FROM prestamo;

SELECT MIN(numero_cuenta) AS numcuenta_menor FROM impositor;

SELECT MIN(activos) AS numactivos_menor FROM sucursales;

#Generar 3 consultas de cada una de las funciones de agregación: Max

SELECT max(importe) AS valor_maximo FROM prestamo;

SELECT max(numero_cuenta) AS numcuenta_maximo FROM impositor;

SELECT max(activos) AS numactivos_maximo FROM sucursales;

#Generar 3 consultas de cada una de las funciones de agregación: Sum

SELECT sum(importe) AS valor_suma FROM prestamo;

SELECT sum(numero_cuenta) AS numcuenta_suma FROM impositor;

SELECT sum(activos) AS numactivos_suma FROM sucursales;

#Generar 3 consultas de cada una de las funciones de agregación: count 
SELECT COUNT(numero_cuenta) FROM cuenta;

SELECT COUNT(numero_prestamo) FROM prestamo;
 
SELECT COUNT(nombre_cliente) FROM prestamos_realizados;


#Generar 3 consultas de cada una de las funciones de agrupacion: group by 
SELECT nombre_cliente, numero_prestamo
FROM prestamos_realizados
GROUP BY numero_prestamo;

SELECT nombre_cliente, numero_prestamo
FROM prestamos_realizados
GROUP BY nombre_cliente;

SELECT nombre_cliente, numero_cuenta
FROM impositor
group by numero_cuenta;

#Generar 3 consultas de cada una de las funciones de agrupacion: having 

SELECT nombre_cliente,numero_cuenta
FROM impositor
GROUP BY numero_cuenta
HAVING MIN(numero_cuenta>20000);

SELECT nombre_cliente,numero_cuenta
FROM impositor
GROUP BY numero_cuenta
HAVING MIN(numero_cuenta>15000);

SELECT nombre_cliente,numero_cuenta
FROM impositor
GROUP BY numero_cuenta
HAVING MAX(numero_cuenta>40000);

#Generar 3 consultas de cada una de las funciones de agrupacion: ASC

SELECT * FROM impositor
ORDER BY numero_cuenta ASC;

SELECT * FROM prestamos_realizados
ORDER BY numero_prestamo ASC;

SELECT * FROM catalogo_clientes
ORDER BY numero_prestamo ASC;

#Generar 3 consultas de cada una de las funciones de agrupacion: DESC

SELECT * FROM prestamos_realizados
ORDER BY numero_prestamo DESC;

SELECT * FROM catalogo_clientes
ORDER BY nombre_cliente DESC;

SELECT * FROM impositor
ORDER BY numero_cuenta DESC;

#Generar 3 consultas de cada una de las funciones de agrupacion: Distinct 

SELECT DISTINCT numero_cuenta FROM impositor;

SELECT DISTINCT nombre_cliente FROM catalogo_clientes;

SELECT distinct ciudad_sucursal FROM sucursales;

#Generar 2 consultas por operador booleano: Null
SELECT nombre_cliente
FROM catalogo_clientes
WHERE nombre_cliente IS NULL;

SELECT ciudad_sucursal
FROM sucursales
WHERE ciudad_sucursal IS NULL;

#Generar 2 consultas por operador booleano: AND
select impositor.numero_cuenta, cuenta.numero_cuenta
from impositor, cuenta
where impositor.numero_cuenta=18393 AND cuenta.numero_cuenta=18393;

select cuenta.nombre_sucursal, prestamo.nombre_sucursal
from prestamo, cuenta
where cuenta.nombre_sucursal="Campestre" AND cuenta.nombre_sucursal="Campestre";

#Generar 2 consultas por operador booleano: OR
select impositor.numero_cuenta, cuenta.numero_cuenta
from impositor, cuenta
where impositor.numero_cuenta OR cuenta.numero_cuenta;

select cuenta.nombre_sucursal, prestamo.nombre_sucursal
from prestamo, cuenta
where cuenta.nombre_sucursal="Campestre" OR cuenta.nombre_sucursal="Aguacaliente";

#Generar 2 consultas por operador booleano: not 
select *
from cuenta
where NOT cuenta.numero_cuenta="40387";

select *
from prestamo, cuenta
where NOT cuenta.nombre_sucursal="Campestre" AND NOT cuenta.nombre_sucursal="Aguacaliente";

