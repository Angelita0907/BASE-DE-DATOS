-- Crear la base de datos
CREATE DATABASE IF NOT EXISTS biblioteca;
USE biblioteca;
-- Crear la tabla de autores
CREATE TABLE IF NOT EXISTS autores (
 id_autor INT AUTO_INCREMENT PRIMARY KEY,
 nombre VARCHAR(100) NOT NULL,
 nacionalidad VARCHAR(50),
 fecha_nacimiento DATE
);
-- Crear la tabla de libros
CREATE TABLE IF NOT EXISTS libros (
 id_libro INT AUTO_INCREMENT PRIMARY KEY,
 titulo VARCHAR(150) NOT NULL,
 genero VARCHAR(50),
 id_autor INT,
 FOREIGN KEY (id_autor) REFERENCES autores(id_autor) ON DELETE CASCADE
);
-- Crear la tabla de usuarios
CREATE TABLE IF NOT EXISTS usuarios (
 id_usuario INT AUTO_INCREMENT PRIMARY KEY,
 nombre VARCHAR(100) NOT NULL,
 email VARCHAR(100) UNIQUE NOT NULL,
 telefono VARCHAR(15)
);
-- Crear la tabla de prestamos
CREATE TABLE IF NOT EXISTS prestamos (
 id_prestamo INT AUTO_INCREMENT PRIMARY KEY,
 id_usuario INT,
 id_libro INT,
 fecha_prestamo DATE DEFAULT (CURDATE()),
 fecha_devolucion DATE,
 FOREIGN KEY (id_usuario) REFERENCES usuarios(id_usuario) ON DELETE CASCADE,
 FOREIGN KEY (id_libro) REFERENCES libros(id_libro) ON DELETE CASCADE
);
-- Insertar datos en autores
INSERT INTO autores (nombre, nacionalidad, fecha_nacimiento) VALUES
('Gabriel García Márquez', 'Colombiana', '1927-03-06'),
('J.K. Rowling', 'Británica', '1965-07-31'),
('George Orwell', 'Británica', '1903-06-25'),
('Miguel de Cervantes', 'Española', '1547-09-29'),
('Isabel Allende', 'Chilena', '1942-08-02'),
('Julio Verne', 'Francesa', '1828-02-08'),
('Jane Austen', 'Británica', '1775-12-16'),
('Mark Twain', 'Estadounidense', '1835-11-30'),
('Stephen King', 'Estadounidense', '1947-09-21'),
('Edgar Allan Poe', 'Estadounidense', '1809-01-19');
-- Insertar datos en libros
INSERT INTO libros (titulo, genero, id_autor) VALUES
('Cien años de soledad', 'Realismo mágico', 1),
('Harry Potter y la piedra filosofal', 'Fantasía', 2),
('1984', 'Ciencia ficción', 3),
('Don Quijote de la Mancha', 'Novela', 4),
('La casa de los espíritus', 'Realismo mágico', 5),
('Viaje al centro de la Tierra', 'Ciencia ficción', 6),
('Orgullo y prejuicio', 'Romance', 7),
('Las aventuras de Tom Sawyer', 'Aventura', 8),
('El resplandor', 'Terror', 9),
('El cuervo', 'Terror', 10);
-- Insertar datos en usuarios
INSERT INTO usuarios (nombre, email, telefono) VALUES
('Juan Pérez', 'juan.perez@example.com', '5551234567'),
('Ana Gómez', 'ana.gomez@example.com', '5552345678'),
('Luis Ramírez', 'luis.ramirez@example.com', '5553456789'),
('María López', 'maria.lopez@example.com', '5554567890'),
('Carlos Torres', 'carlos.torres@example.com', '5555678901'),
('Fernanda Castro', 'fernanda.castro@example.com', '5556789012'),
('Roberto Sánchez', 'roberto.sanchez@example.com', '5557890123'),
('Laura Martínez', 'laura.martinez@example.com', '5558901234'),
('Pedro Díaz', 'pedro.diaz@example.com', '5559012345'),
('Elena Ríos', 'elena.rios@example.com', '5550123456');
-- Insertar datos en prestamos
INSERT INTO prestamos (id_usuario, id_libro, fecha_devolucion) VALUES
(1, 2, '2025-03-01'),
(2, 4, '2025-02-28'),
(3, 1, '2025-03-05'),
(4, 6, '2025-03-10'),
(5, 3, '2025-02-27'),
(6, 8, '2025-03-12'),
(7, 5, '2025-03-08'),
(8, 9, '2025-02-28'),
(9, 7, '2025-03-15'),
(10, 10, '2025-03-20');