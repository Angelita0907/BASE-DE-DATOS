use instituto;
-- Alumnos --
insert into alumnos (NOMBRE, APELLIDO1, APELLIDO2, DNI, DIRECCIÓN, SEXO,Curso)
values ('Lucas','Manilva','López','23755174S', 'Alhamar', 'H','1');

insert into alumnos (NOMBRE, APELLIDO1, APELLIDO2, DNI, DIRECCIÓN, SEXO,Curso)
values ('Antonia','Santos','Alcantará','03818863N', 'Maniquí 21', 'M','2');

insert into alumnos (NOMBRE, APELLIDO1, APELLIDO2, DNI, DIRECCIÓN, SEXO,Curso)
values ('Manuel','Baños','Rioseco','33577501P', 'Jurel 2', 'H','2');

insert into alumnos (NOMBRE, APELLIDO1, APELLIDO2, DNI, DIRECCIÓN, SEXO,Curso)
values ('Jose','Llorente','Escueto','36107620N', 'Jarcha 5', 'H','1');

-- Profesores --
insert into profesores (NOMBRE, APELLIDO1, APELLIDO2, DNI, DIRECCIÓN, TÍTULO, GANA)
VALUES ('Juan','Arcos','López','76978084M','Puerta Negra 4','Ing. Informático',7500);

insert into profesores (NOMBRE, APELLIDO1, APELLIDO2, DNI, DIRECCIÓN, TÍTULO, GANA)
VALUES ('María','Oliva','Rubio','50427865C','Juan Alfonso 23','Lda. Fil. Inglesa',4900);

insert into profesores (NOMBRE, APELLIDO1, APELLIDO2, DNI, DIRECCIÓN, TÍTULO, GANA)
VALUES ('Sara','Lemes','Sancho','99857929W','Calle Viento 1','Magisterio',6100);

-- Cursos --
insert into cursos (NOMBRE_CURSO, COD_CURSO, DNI_PROFESOR, MAXIMO_ALUMNOS, FECHA_INICIO, FECHA_FIN, NUM_HORAS)
VALUES ('Inglés Básico','1','50427865C','15','23-01-01','23-10-01',120);

insert into cursos (NOMBRE_CURSO, COD_CURSO, DNI_PROFESOR, FECHA_INICIO, NUM_HORAS)
VALUES ('Adm. Linux','2','76978084M','23-02-03',120);