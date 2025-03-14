/*1. Crea un usuario con tu nombre y busca la forma de que por defecto tu cuenta esté
inactiva.*/
create user angela identified by 'usuario123' account lock ;

/*2. */
alter user angela identified by 'usuario123' account unlock;

/*3. */
create database prueba_practica;
use prueba_practica;

create table cliente(
Id int primary key,
nombre varchar(50),
id_compra int,
constraint fk1 foreign key (id_compra) references producto(id)
);
create table producto(
id int primary key,
nombre varchar(50),
cod_producto char(9)
);

/*4. */
-- Insert data into producto table
insert into producto (id, nombre, cod_producto) values
(1, 'Laptop', '123456'),
(2, 'Smartphone', '234567'),
(3, 'Headphones', '345678');

-- Insert data into cliente table
insert into cliente (Id, nombre, id_compra) values
(1, 'Carlos Perez', 1),
(2, 'Ana Gomez', 2),
(3, 'Luis Martinez', 3);

/*5. Crea una vista que consulte información cruzada de ambas tablas, por ejemplo el
nombre del cliente y el producto que ha adquirido*/
create view ProductosdeClientes as select cliente.nombre, producto.cod_producto from cliente,producto;
select * from ProductosdeClientes;

/*6. */
create user becario identified by 'becario123';

grant select on ProductosdeClientes to becario;
show grants for becario;

/*7. */
drop user becario;