# Demostrar 5 ejemplos de Vistas.
use entidadbancaria_Ejercicio16;

#1 Estamos creando un vista de nombre total_prestamos con 2 atributos nombre_sucursal y la suma de importe
create view total_prestamos(nombre_sucursal, total_prestamos)as 
select nombre_sucursal, sum(importe)
from prestamo
group by nombre_sucursal;

#2 En esta tabla buscamos crear un vista de nombre_sucursal y ordenandolos
create view total_sucursales(nombre_sucursal)as 
select nombre_sucursal
from prestamo
group by nombre_sucursal;

#3 
create view cliente_navacerra as 
select total_prestamos
from total_prestamos
group by total_prestamos;

#4 
create view total_de_clientes as 
(select nombre_sucursal, nombre_cliente
from impositor, cuenta
where impositor.numero_cuenta=cuenta.numero_cuenta) 
union
(select nombre_sucursal, nombre_cliente
from prestamo, prestatario
where prestatario.numero_prestamo = prestamo.numero_prestamo);

#5
create view prestamos_totales_mes(numero_prestamo,importe) as
select numero_prestamo, importe
from prestamo
group by numero_prestamo;



