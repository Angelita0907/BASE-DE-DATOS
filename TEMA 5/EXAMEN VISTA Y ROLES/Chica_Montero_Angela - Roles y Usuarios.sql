-- Angela Chica Montero
-- Usuario y Roles
-- estoy usando mi usuario root
/*1. Crea usuario con tu nombre y busca la forma de que esté inactiva*/
create user 'AngelaChica'@'localhost' identified by 'usuario123' account lock;

/*2. Inicia sesion con tu nuevo usuario y cambia tu contraseña que contenga letras y numeros*/
-- Para poder iniciar sesion debemos activar la cuenta y se hace de la siguiente manera:
alter user 'AngelaChica'@'localhost' identified by 'usuario123' account unlock;

-- Ahora podemos cambiar la contraseña del usuario de nuevo como root
alter user 'AngelaChica'@'localhost' identified by 'Angelita123AA';

/*3. Crea una base de datos llamada prueba e introduce en ella 
dos tablas relacionadas por medio de una foreign key*/
-- Ya tengo una que se llama igual por eso cambio el nombre
create database pruebaExamen;
use pruebaExamen;

create table profesor(
id_prof char (9) primary key,
nombre varchar(50),
cod_postal int
);

-- relacionamos los profesores con las clases
create table clase(
id_clase char (9) primary key,
nombre varchar(20),
profesor char(9),
constraint fk1 foreign key (profesor) references profesor(id_prof)
);


/*4. inserta registros en cada una de ellas*/
insert into profesor(id_prof, nombre, cod_postal) 
values (01, 'Pedro', 41015), (02, 'Maria', 41220), (03, 'Andres', 41019),(04, 'Eva', 41011);

insert into clase(id_clase, nombre, profesor)
values('C1', 'Matemáticas', '1'), ('C2', 'Biologia', '2'), ('C3', 'Dibujo', '3'), ('C4', 'Tenconología', '4');

/*5. Crea una vista que consulte informacion cruzada de ambas tablas*/

/*la vista es el nombre de las dos tablas segun el codigo del profesor indicado*/
create view ClaseyProfesores as select profesor.nombre  as ProfesorNombre, clase.nombre as ClaseNombre from profesor, clase 
where clase.profesor= 2;
select * from ClaseyProfesores;

/*6. Crea un usuario llamado alumno_practica al cual dar permisos de consulta a la vista anterior*/
create user 'alumno_practica'@'localhost' identified by 'usuario123';
grant select on ClaseyProfesores to 'alumno_practica'@'localhost';
show grants for 'alumno_practica'@'localhost';

/*7. Elimina al usuario*/
drop user 'alumno_practica'@'localhost';