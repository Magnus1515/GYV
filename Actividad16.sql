-- reate database entidadbancaria_Ejercicio16;

use entidadbancaria_Ejercicio16;

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


#Pertenencia a conjunto: Demostrar 5 ejemplos para este tema.
#1
select distinct nombre_cliente
from prestatario 
where nombre_cliente in (select nombre_cliente from impositor);
#2
select distinct nombre_cliente
from cliente
where nombre_cliente in (select nombre_cliente from prestatario);
#3
select distinct numero_prestamo
from prestamo
where numero_prestamo in (select numero_prestamo from prestatario);
#4
select distinct nombre_sucursal
from prestamo
where nombre_sucursal in (select nombre_sucursal from cliente);
#5 
select distinct ciudad_cliente
from cliente
where ciudad_cliente in (select ciudad_sucursal from sucursal);

#Demostrar 5 ejemplos que muestren la funcionalidad de la comparación de conjuntos.
#1
select distinct T.nombre_sucursal
from sucursal as S, sucursal as T
where T.activos > S.activos AND S.ciudad_sucursal="Tijuana";
#2
select distinct T.nombre_sucursal
from sucursal as S, sucursal as T
where T.activos > S.activos AND S.ciudad_sucursal="Las palmas" OR T.nombre_sucursal="Solecito";
#3 
select distinct P.numero_prestamo
from prestatario as P, prestatario as S
where P.numero_prestamo > S.numero_prestamo AND S.nombre_cliente="Rogelio";
#4
select distinct T.nombre_sucursal
from sucursal as S, sucursal as T
where T.activos = S.activos AND S.ciudad_sucursal="Las palmas" OR T.nombre_sucursal="Solecito";
#5 
select distinct T.nombre_sucursal
from cuenta as C, cuenta as T
where C.nombre_sucursal < T.nombre_sucursal AND C.numero_cuenta="31062";

#Realizar 5 ejemplos que demuestren este tipo de comprobaciones.
#Comprobación de relaciones vacías:


