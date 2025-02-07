create database EXAMEN;
USE EXAMEN;

-- Ángela Chica Montero

/*EJERCICIO 1*/
create table Jugador(
Id int auto_increment,
Dni char(9) unique,
Nombre varchar(100) not null,
Apellidos varchar(100),
Telefono char(3),
Entrenador char(9),
constraint pk_dniJugador primary key (Id)
);

create table Pista(
Id int auto_increment,
-- char(1) para indicar o una letra o un solo número
Letra char(1),
Tipo char(10),
tipo_iluminacion char(10),
constraint pk_pista primary key(Id),
constraint iluminacion check (tipo_iluminacion = '500LM' || tipo_iluminacion = '1000LM')
);

create table Pareja(
Id int auto_increment,
Jugador1 int unique,
Jugador2 int unique,
Fecha_creacion date,
Nombre varchar(100) unique not null,
constraint fk_idJugador1 foreign key (Jugador1) references Jugador(id) on update cascade,
constraint fk_idJugador2 foreign key (Jugador2) references Jugador(id) on update cascade,
constraint pk_pareja primary key (Id)
);

create table Reserva(
Pista int,
Jugador int,
Fecha date,
Precio int,
Observaciones varchar(250),
constraint fk_pista1 foreign key (Pista) references Pista(Id) on update cascade,
constraint fk_idJugador3 foreign key (Jugador) references Jugador(Id) on update cascade,
constraint pk_reserva primary key (Pista,Jugador,Fecha),
constraint precio_reserva check (Precio < 100)
);

create table Estado_pista(
Id int auto_increment,
Operativa char(20) default 'no disponible',
Fecha_ult_revision date,
Pista int,
constraint fk_pista2 foreign key (Pista) references Pista(Id) on update cascade,
constraint pk_estado primary key(Id)
);

create table Partido(
Pareja1 int not null,
Pareja2 int not null,
Fecha date,
Puntos_pareja1 int,
Puntos_pareja2 int,
valoracion varchar(100),
constraint fk_pareja1 foreign key(Pareja1) references Pareja(id) on update cascade,
constraint fk_pareja2 foreign key (Pareja2) references Pareja(id) on update cascade,
constraint pk_partido primary key (Pareja1, Pareja2, Fecha),
constraint puntos check (Puntos_pareja1 and Puntos_pareja2 > 1)
);

/*EJERCICIO 2*/
-- Jugadores
insert into examen.jugador(Id, Dni, Nombre, Apellidos, Telefono)
value(001,'12345678A','Enrique','Perez', '1A1');
insert into examen.jugador(Dni, Nombre, Apellidos, Telefono)
values ('9876543B','Pablo', 'Mencez','B22'), ('45678923C','Estefanía', 'Ortíz', 'C33'), ('78912345D','Susana','Martínez', 'D44');

-- Parejas
insert into examen.pareja (Id,Jugador1,Jugador2,Fecha_creacion,Nombre)
value(01,1,2,'2025-01-10','Viso Team');
insert into examen.pareja (Jugador1,Jugador2,Fecha_creacion,Nombre)
value(3,4,'2025-01-12','Mairena Team');

-- Partido
insert into examen.partido(Pareja1,Pareja2,Fecha,Puntos_pareja1,Puntos_pareja2,valoracion)
value(1,2,'2025-01-14',3,5,'El ganador es la pareja Mairena Team');

/*EJERCICIO 3*/
-- Jugadora
insert into examen.jugador(Dni, Nombre, Apellidos, Telefono)
values ('45612379E','Gloria', 'Fuentes','E55');

-- Pista (necesitamos tener al menos una para poder reservarla)
insert into examen.pista(Id,Letra,Tipo, tipo_iluminacion)
value(1,'A','Cubierta', '500LM');

-- Reserva
insert into examen.reserva(Pista,Jugador,Fecha,Precio,Observaciones)
value(1, 5, '2025-01-17', 10, 'Pista cubierta de gran amplitud con lo esencial para practicar en ratos libres, baños limpios e instalaciones modernas');

/*EJERCICIO 4*/
alter table examen.estado_pista 
add column url_imagen_pista varchar(150) default 'www.url.com/pista_default';

-- Añadimos valor para comprobar su uso
insert into examen.estado_pista (Id, Pista)
value(1,1);

/*EJERCICIO 5*/
-- Nos saldrá un error en el que no podemos borrar un jugador que está siendo referenciado a menos que borremos esa relación primero o los datos en sus relaciones
delete from examen.jugador where Nombre = 'Enrique';

/*EJERCICIO 6*/
update examen.jugador
set Id = 2, Id = 6
where nombre = 'Pablo';

-- insertamos un nuevo jugador para comprobar
insert into examen.jugador(Dni,Nombre,Apellidos, Telefono)
value('67812349F','Alberto', 'Pintos', 'F77');
/*Cuando cambiamos el identificador de Pablo debe de ser el siguiente del último id ya que daría error por clave duplicada
  con ello el siguiente jugador que ingresemos tendrá el número siguiente al suyo, en este caso Pablo es 6 y Alberto se le asigna 7*/
