USE academia;
/*Ejercicio 1*/
create user usuario_test identified by 'usuario' account lock;

/*Ejercicio 2*/
grant select on alumnos to usuario_test;

/*Ejercicio 3*/
-- primero desbloquemos el usuario anterior
alter user usuario_test identified by 'usuario2' account unlock;

/*Ejercicio 4*/
rename user usuario_test to usuario_test2;

/*Ejercicio 5*/
create view info_alumnos2 as select * from alumnos order by alumnos.nombre;
select * from info_alumnos2;

/*Ejercicio 6*/
-- creamos un usuario con el otro usuario con el siguiente comando, damos permisos al usuario de crear
grant all privileges on alumnos to usuario_test2;

drop user usuario_test;

/*Ejercicio 7*/
