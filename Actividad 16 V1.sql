-- create database entidadbancaria_Ejercicio16;

use entidadbancaria_ejercicio16;

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
#1 Demostrar si de la tabla prestatario el atributo nombre_clinte se encuentra el mismo atributo a otra tabla
select distinct nombre_cliente
from prestatario 
where nombre_cliente in (select nombre_cliente from impositor);
#2 Demostrar si de la tabla cliente el atributo nombre_cliente se encuentra el mismo atributo a otra tabla
select distinct nombre_cliente
from cliente
where nombre_cliente in (select nombre_cliente from prestatario);
#3 Demostrar si de la tabla prestamo el atributo numero_prestamo se encuentra el mismo atributo a otra tabla
select distinct numero_prestamo
from prestamo
where numero_prestamo in (select numero_prestamo from prestatario);
#4 Demostrar si de la tabla prestamo el atributo nombre_sucursal se encuentra el mismo atributo a otra tabla
select distinct nombre_sucursal
from prestamo
where nombre_sucursal in (select nombre_sucursal from cliente);
#5 Demostrar si de la tablacliente el atributo ciudad_clietne se encuentra el mismo atributo a otra tabla
select distinct ciudad_cliente
from cliente
where ciudad_cliente in (select ciudad_sucursal from sucursal);

#Demostrar 5 ejemplos que muestren la funcionalidad de la comparación de conjuntos.
#1 Mostrar si los valores son diferentes de la tabla es mayor al otro asi como si el nombre de la sucursal es Tijuana
select distinct T.nombre_sucursal
from sucursal as S, sucursal as T
where T.activos > S.activos AND S.ciudad_sucursal="Tijuana";
#2 
select distinct T.nombre_sucursal
from sucursal as S, sucursal as T
where T.activos > S.activos AND S.ciudad_sucursal="Las palmas" OR T.nombre_sucursal="Solecito";
#3 Mostrar si los valores son diferentes de la tabla es similar al otro asi como si el nombre de cliente es rogelio
select distinct P.numero_prestamo
from prestatario as P, prestatario as S
where P.numero_prestamo > S.numero_prestamo AND S.nombre_cliente="Rogelio";
#4 Mostrar si los valores son diferentes de la tabla es igual al otro asi como si el nombre de la sucursal es las palmas o solecito
select distinct T.nombre_sucursal
from sucursal as S, sucursal as T
where T.activos = S.activos AND S.ciudad_sucursal="Las palmas" OR T.nombre_sucursal="Solecito";
#5 Mostrar si los valores son diferentes de la tabla es menor que el otro asi como si el numero de cuenta es 31062
select distinct T.nombre_sucursal
from cuenta as C, cuenta as T
where C.nombre_sucursal < T.nombre_sucursal AND C.numero_cuenta="31062";

#Realizar 5 ejemplos que demuestren este tipo de comprobaciones.
#Comprobación de relaciones vacías: 
#1 Demostrar si de los atributos de la tabla 2 atributos de ela comparte similitud con otra tabla
Select nombre_cliente
from prestatario
where not exists(select * 
from impositor
where impositor.nombre_cliente= prestatario.nombre_cliente);

#2 Demostrar si de una tabla su atributo tiene similitud con otras 2 tablas, asi como en sus atributo sea de la sucursal tijuana
select distinct S.nombre_cliente
from impositor as S
where exists (
	select nombre_sucursal
    from sucursal 
    where ciudad_sucursal="Tijuana" AND Nombre_sucursal in(
		select R.nombre_sucursal 
		from impositor as T, cuenta as R
		WHERE T.numero_cuenta = R.numero_cuenta AND S.nombre_cliente=T.nombre_cliente
    ));
#3 Mostrar si de la tabla cuenta no existe una nombre_sucursal la cual contenga la misma cuenta en dos tablas junto al nombre de sucursal 
Select nombre_sucursal
from cuenta
where NOT exists(select * 
from sucursal
where sucursal.nombre_sucursal = cuenta.nombre_sucursal);

#4 Demostrar las ciudad_cliente que no sean de Cdmx de mi subconsulta de la 4 ciudad_cliente
SELECT ciudad_cliente
FROM cliente
WHERE EXISTS
(SELECT ciudad_cliente FROM cliente WHERE ciudad_cliente="Cdmx");

#5 Demostrar si en la tabla prestatario de nombre_cliente no existe un clinte registrado "Anastasio"
select nombre_cliente
from prestatario
where not exists 
(select *
from prestatario 
where nombre_cliente="Anastasio");

#Realizar 5 ejemplos que validen la ausencia de duplicidad de las tuplas.
#1 Mostrar los cliente que tengan el mismo numero de prestamo asi como que se encuentre esto en las tablas impositor, cuenta su numero de cuentas se igual a lo anterior.
select 
	distinct nombre_cliente #mostrar valores unicos de este atributo 
from 
	prestatario,
    prestamo
where
	prestatario.numero_prestamo = prestamo.numero_prestamo
    AND nombre_sucursal = "Aguacaliente"
    AND (nombre_sucursal, nombre_cliente) in (
    select 
		nombre_sucursal,
        nombre_cliente
	from 
		impositor,
        cuenta
	where 
		impositor.numero_cuenta = cuenta.numero_cuenta);
        
        
        
#2 Demostrar los cliente que tengan el mismo numero de prestamo asi como que se encuentre esto en las tablas impositor, cuenta su numero de cuentas se igual a lo anterior.
SELECT DISTINCT
    T.nombre_cliente
FROM
    impositor AS T
WHERE
    EXISTS( SELECT 
            R.nombre_cliente
        FROM
            cuenta,
            impositor AS R
        WHERE
            T.nombre_cliente = R.nombre_cliente
                AND R.numero_cuenta = cuenta.numero_cuenta
                AND cuenta.nombre_sucursal = 'Aguacaliente');

#3 obtener del nombre cliente existente en 2 tablas el cuald su numero de presstamo sea equivalente en ambas tablas asi como que contenga una cuenta en la sucursla cubana 
SELECT DISTINCT
	P.nombre_cliente
FROM
    prestatario AS P
WHERE
    EXISTS( SELECT 
            A.nombre_cliente
        FROM
            prestamo,
            prestatario AS A
        WHERE
            P.nombre_cliente = A.nombre_cliente
                AND A.numero_prestamo = prestamo.numero_prestamo
                AND prestamo.nombre_sucursal = 'Cubana');


#4 Obtener el nombre de sucursal donde el importe de prestamo sea menor o igual asi como que perteneza a tres rios
SELECT 
	distinct P.nombre_sucursal
FROM 
	prestamo as P, 
    prestamo as S
WHERE 
	S.importe <= P.importe
    and P.nombre_sucursal = "Los tres rios";
#5 Obtener el nombre de la sucursal la cual sea distinta entre el saldo.P y saldo.C, tambien pertenezca a los alamsos sucursal
SELECT 
	distinct C.nombre_sucursal
FROM 
	cuenta as C, 
    cuenta as P
WHERE 
	P.saldo >= C.saldo
    and C.nombre_sucursal = "Los alamos";
    

# Realizar 3 ejemplos donde se demuestre las relaciones derivadas.
#1 Mostrar las sucursales junto a su saldo promedio(declarado y cambiandolo por el atributo nuevo) donde el promedio obtenido sea mayor a 3,000,000  
select nombre_sucursal, saldo_promedio
from (select nombre_sucursal, avg(saldo)
	from 
		cuenta 
    group by 
		nombre_sucursal
    ) as media_sucursal (nombre_sucursal, saldo_promedio)
where saldo_promedio > 3000000;
#2 Mostrar las ciudades junto a su saldo promedio(declarado y cambiandolo por el atributo nuevo) donde el promedio sacado sea mayor a 250,000 
select 
	numero_cuenta, 
	saldo_promedio
from 
	(select numero_cuenta, avg(saldo)
	from 
		cuenta 
    group by 
		numero_cuenta) as promedio_sucursal (numero_cuenta, saldo_promedio)
where saldo_promedio > 15000;
    
#3 Mostrar las ciudades junto  a los activos promedio donde el promedio sacado sea mayor a 250,000 
select 
	ciudad_sucursal, 
	activos_promedio
from 
	(select ciudad_sucursal, avg(activos)
	from 
		sucursal
    group by 
		ciudad_sucursal) as promedio_activos (ciudad_sucursal, activos_promedio)
where activos_promedio > 250000;

#Realizar 3 ejemplos donde se demuestre la utilización del with.
#1 Mostrar le valor que sea mayor a saldo donde sea igual de cuenta.saldo = saldoMayor.valor de la tabla

with saldoMayor(valor) as 
(
	select max(saldo)
	from cuenta
)
select numero_cuenta
from cuenta, saldoMayor
where cuenta.saldo = saldoMayor.valor;


#2 Mostrar de la tabla cuenta de la sucursal Aguacalient, de su importe sea menor a 10000, junto con todos sus atributos con with   
With CTE_cuenta AS
(
Select numero_cuenta,
nombre_sucursal,
saldo

from cuenta where UPPER(nombre_sucursal) like '%Aguacaliente%'
)
Select * from CTE_cuenta where saldo> 10000;
    
#3 Mostrar de la tabla prestamo de la sucursal cubana, de su importe sea menor a 15000, junto con todos sus atributos con el uso de with
With CTE_cliente AS
(
Select numero_prestamo,
nombre_sucursal,
importe

from prestamo where lower(nombre_sucursal) like '%Cubana%'
)
Select * from CTE_cliente where importe> 15000;




