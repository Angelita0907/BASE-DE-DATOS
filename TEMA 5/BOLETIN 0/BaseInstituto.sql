-- Creación de la base de datos
CREATE DATABASE Instituto;
USE Instituto;

-- Tabla de Alumnos
CREATE TABLE Alumnos (
    id_alumno INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50),
    apellido VARCHAR(50)
);

-- Tabla de Profesores
CREATE TABLE Profesores (
    id_profesor INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50),
    apellido VARCHAR(50)
);

-- Tabla de Asignaturas
CREATE TABLE Asignaturas (
    id_asignatura INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100),
    id_profesor INT,
    FOREIGN KEY (id_profesor) REFERENCES Profesores(id_profesor)
);

-- Tabla de Matrículas
CREATE TABLE Matriculas (
    id_matricula INT AUTO_INCREMENT PRIMARY KEY,
    id_alumno INT,
    id_asignatura INT,
    horas INT,
    FOREIGN KEY (id_alumno) REFERENCES Alumnos(id_alumno),
    FOREIGN KEY (id_asignatura) REFERENCES Asignaturas(id_asignatura)
);

-- Inserción de datos en Alumnos
INSERT INTO Alumnos (nombre, apellido) VALUES
('Juan', 'Pérez'),
('María', 'Gómez'),
('Carlos', 'López'),
('Ana', 'Martínez');

-- Inserción de datos en Profesores
INSERT INTO Profesores (nombre, apellido) VALUES
('Roberto', 'Fernández'),
('Laura', 'Sánchez'),
('Miguel', 'Díaz');

-- Inserción de datos en Asignaturas
INSERT INTO Asignaturas (nombre, id_profesor) VALUES
('Matemáticas', 1),
('Historia', 2),
('Física', 3);

-- Inserción de datos en Matrículas
INSERT INTO Matriculas (id_alumno, id_asignatura, horas) VALUES
(1, 1, 120),
(2, 2, 90),
(3, 3, 150),
(4, 1, 80),
(1, 3, 110);
