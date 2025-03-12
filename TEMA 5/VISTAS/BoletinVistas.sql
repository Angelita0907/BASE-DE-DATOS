use empresa;

/*1. Antes de comenzar crea el usuario practica_vistas y otorga los permisos
exclusivamente necesarios para poder trabajar con la base de datos empresa y
pueda crear y consultar vistas. Ten en cuenta que este usuario posteriormente
deberá otorgar dichos permisos a otros.*/

create user practica_vistas identified by 'Usuario123';
grant select, create, insert on banco.* to practica_vistas;
SHOW GRANTS FOR practica_vistas; 

/* 2. Realiza una vista que muestre el nombre y los apellidos de los empleados cuyo
código postal es 41510*/
create view NombreCompleto as select nombre, apellido1, apellido2 from empleado where cod_postal = 41510;
select * from NombreCompleto;

/*3. Realiza una vista que muestre aquellos trabajos cuyo salario máximo sea 10.000
euros.*/
create view SalarioEmpleado as select empleado.nombre, historial_salarial.salario from empleado, historial_salarial where salario > 1000;
select * from SalarioEmpleado;

/*4. Muestra los DNI de los Jefes de Departamento*/
create view JefeDepartamento as select nombre, dni_jefe from departamento;
select * from JefeDepartamento;

/*5. Muestra un listado con el nombre y los apellidos de los empleados junto al nombre
de la universidad donde estudiaron.*/
create view EmpleadoUni as select empleado.nombre, concat(empleado.apellido1,' ', empleado.apellido2) 
as Apellidos, informacion_uni.universidad from empleado, informacion_uni;
select * from EmpleadoUni;

/*6. Realiza un usuario llamado usuario_vistas que pueda exclusivamente consultar los
datos para las vistas anteriores y pruébalo.*/
create user usuario_vistas identified by 'usuario123';
grant select on NombreCompleto to usuario_vistas;
grant select on SalarioEmpleado to usuario_vistas;
grant select on JefeDepartamento to usuario_vistas;
grant select on EmpleadoUni to usuario_vistas;
