-- Ahora estamos trabajando con el cajero
use banco;
/*2. */
create view Nombre_Apellidos as select cliente.nombre, cliente.apellidos, sucursal.direccion from cliente, cuenta, sucursal
where cliente.cod_cliente = cuenta.cod_cliente and sucursal.cod_sucursal = cuenta.cod_sucursal;
select * from Nombre_Apellidos;

/*3. */
create view Nombre_Apellidos_Sucursal4 as select cliente.nombre, cliente.apellidos, cuenta.cod_sucursal from cliente, cuenta
where cliente.cod_cliente = cuenta.cod_cliente and cuenta.cod_sucursal = 4;

select * from Nombre_Apellidos_Sucursal4;

/*4. */
create view Intereses7 as select cliente.nombre from cliente, cuenta
where cliente.cod_cliente = cuenta.cod_cliente and cuenta.interes > 0.07;
select * from Intereses7;

/*5. */
create view SaldoMenor5 as select cliente.* from cliente, cuenta
where cliente.cod_cliente = cuenta.cod_cliente and cuenta.saldo < 5000;
select * from SaldoMenor5;
