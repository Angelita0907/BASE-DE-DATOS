create database SIMULACRO;
use SIMULACRO;

/*EJERCICIO 1*/
create table PROVEEDOR(
ID int auto_increment,
CIF char (9) unique,
Nombre varchar(50) not null,
Pais varchar(50),
Url varchar(100) default 'www.default.es',
constraint pk_Id primary key (ID)
);

create table AGENTE(
Cod_Agente char(9),
Nombre varchar(50) not null,
Apellidos varchar(50),
Teléfono char(9),
tipo char(1) constraint comisiones check(tipo = 'C' || tipo = 'N'),
constraint pk_Cod primary key (COD_AGENTE)
);

create table BOOKING(
Localizador char(6) not null,
Fecha_Chekin date,
Precio_Coste decimal(6,2),
Precio_Venta decimal(6,2),
Id_Proveedor int,
Cod_Agente char(9),
constraint precioMax check (Precio_Coste <=1000),
constraint precioVenta check (Precio_Venta > Precio_Coste),
constraint fk_Id foreign key (Id_Proveedor) references PROVEEDOR(ID),
constraint fk_Cod foreign key (Cod_Agente) references AGENTE(Cod_Agente)
);

/*EJERCICIO 2*/

-- Proveedor
insert into simulacro.proveedor (ID, CIF, Nombre, Pais)
values (1,'R5502108C', 'Jet2Travel', 'España');
insert into simulacro.proveedor (CIF, Nombre, Pais)
values ('D76506849', 'Corendon', 'Turquía');

-- Agente
insert into simulacro.agente (Cod_Agente, Nombre, Apellidos, Teléfono, tipo)
values(1,'Eduardo', 'Ruiz Salvador', '953639337','C');
insert into simulacro.agente (Cod_Agente, Nombre, Apellidos, Teléfono, tipo)
values(2,'Elisa', 'Cáceres Pulido', '971408799','N');

-- Booking
insert into simulacro.booking(Localizador, Fecha_Chekin, Precio_Coste, Precio_Venta,Id_Proveedor, Cod_Agente)
values('ZN5DSC','22-10-19',150.12,299.9,1,1);
insert into simulacro.booking(Localizador, Fecha_Chekin, Precio_Coste, Precio_Venta,Id_Proveedor, Cod_Agente)
values('SF3XSR','22-12-30',194.64,275,1,2);
insert into simulacro.booking(Localizador, Fecha_Chekin, Precio_Coste, Precio_Venta,Id_Proveedor, Cod_Agente)
values('XL14LH','23-04-06',701,881.50,2,1);

/*EJERCICIO 3*/
/*Para poder borrar a este proveedor primero debemos eliminar las reservas asociadas al mismo 
ya que mantiene relacion con la tabla de reservas y no puede ser eliminado antes, se debe seguir un orden*/

-- Eliminamos datos reservas del proveedor 
DELETE FROM BOOKING WHERE Id_Proveedor = 2;

-- Paso 2: Eliminar el proveedor 'Corendon'
DELETE FROM PROVEEDOR WHERE CIF = 'D76506849';

/*EJERCICIO 4*/
-- debemos eliminar la relacion de la tabla booking con agente y volverla a crear con esta condicion
ALTER TABLE BOOKING
DROP FOREIGN KEY fk_Cod;

-- volveremos a crear la relacion luego de haber cambiado el codigo del agente
ALTER TABLE BOOKING
ADD CONSTRAINT fk_Cod FOREIGN KEY (Cod_Agente) REFERENCES AGENTE(Cod_Agente);

-- Para el cambio del numero del proveedor debemos usar UPDATE (actualizar valor)
update agente
SET Cod_Agente = 2, Cod_Agente = 7
where Nombre = 'Elisa';

/*EJERCICIO 5*/
INSERT INTO AGENTE (Cod_Agente, Nombre, Apellidos,tipo)
VALUES(3, 'ST', 'Perez Benito', 'C');

/*EJERCICIO 6*/
drop table AGENTE, BOOKING, PROVEEDOR;