CREATE DATABASE GastosPersonales;

CREATE TABLE IF NOT EXISTS GastosPersonales.Usuarios (
    ID_USUARIO VARCHAR(20) NOT NULL,
    Nombre VARCHAR(50) NOT NULL,
    Apellido VARCHAR(50) NOT NULL,
    Correo_Electronico VARCHAR(50) NOT NULL,
    Contrasena VARCHAR(16) NOT NULL,
    PRIMARY KEY (ID_USUARIO)
);

CREATE TABLE IF NOT EXISTS GastosPersonales.CategoriaGastos (
    ID_Categoria VARCHAR(20) NOT NULL,
    Categoria VARCHAR(30) NOT NULL,
    Descripcion VARCHAR(100) NOT NULL,
    PRIMARY KEY (ID_Categoria)
);

CREATE TABLE IF NOT EXISTS GastosPersonales.Gastos (
    ID_Gasto VARCHAR(20) NOT NULL,
    ID_USUARIO VARCHAR(20) NOT NULL,
    ID_Categoria VARCHAR(20) NOT NULL,
    Monto INT NOT NULL,
    Fecha CHAR(8) NOT NULL,
    Descripcion VARCHAR(100) NOT NULL,
    PRIMARY KEY (ID_Gasto)
    );
ALTER TABLE gastospersonales.gastos add foreign key (ID_USUARIO) references GastosPersonales.Usuarios(ID_USUARIO) ON update CASCADE ON delete CASCADE;
ALTER TABLE gastospersonales.gastos add foreign key (ID_Categoria) references GastosPersonales.CategoriadeGastos(ID_Categoria) ON update CASCADE ON delete CASCADE;

INSERT INTO GastosPersonales.Usuarios (ID_USUARIO, Nombre, Apellido, Correo_Electronico, Contrasena) 
VALUES 
('1', 'Juan', 'Pérez', 'juan@example.com', 'contraseña1'),
('2', 'María', 'López', 'maria@example.com', 'contraseña2'),
('3', 'Pedro', 'González', 'pedro@example.com', 'contraseña3'),
('4', 'Ana', 'Martínez', 'ana@example.com', 'contraseña4'),
('5', 'Luis', 'Rodríguez', 'luis@example.com', 'contraseña5'),
('6', 'Laura', 'Sánchez', 'laura@example.com', 'contraseña6'),
('7', 'Carlos', 'Fernández', 'carlos@example.com', 'contraseña7'),
('8', 'Sofía', 'Ramírez', 'sofia@example.com', 'contraseña8'),
('9', 'Jorge', 'Díaz', 'jorge@example.com', 'contraseña9'),
('10', 'Elena', 'Torres', 'elena@example.com', 'contraseña10');

INSERT INTO GastosPersonales.CategoriaGastos (ID_Categoria, Categoria, Descripcion) 
VALUES 
('1', 'Comida', 'Bebidas y alimentos.'),
('2', 'Transporte', 'Gastos en transporte.'),
('3', 'Entretenimiento', 'Gastos en entretenimiento, como Netflix.'),
('4', 'Salud', 'Gastos en medicamentos y consultas.'),
('5', 'Educación', 'Gastos en cursos y libros.'),
('6', 'Hogar', 'Gastos en servicios del hogar.'),
('7', 'Ropa', 'Gastos en ropa y accesorios.'),
('8', 'Viajes', 'Gastos en viajes y alojamiento.'),
('9', 'Regalos', 'Gastos en regalos y obsequios.'),
('10', 'Otros', 'Otros gastos diversos.');

INSERT INTO GastosPersonales.Gastos (ID_Gasto, ID_USUARIO, ID_Categoria, Monto, Fecha, Descripcion) 
VALUES 
('1', '1', '1', 50, '20220401', 'Almuerzo'),
('2', '2', '2', 20, '20220402', 'Taxi'),
('3', '3', '3', 30, '20220403', 'Cine'),
('4', '4', '4', 100, '20220404', 'Consulta médica'),
('5', '5', '5', 50, '20220405', 'Libros'),
('6', '6', '6', 200, '20220406', 'Compra'),
('7', '7', '7', 80, '20220407', 'Camisa'),
('8', '8', '8', 150, '20220408', 'Reserva'),
('9', '9', '9', 40, '20220409', 'Cumpleaños'),
('10', '10', '10', 25, '20220410', 'Otros gastos');

select *from GastosPersonales.Gastos;
select *from GastosPersonales.Usuarios;
select *from GastosPersonales.CategoriadeGastos;
/*consultas*/

select ID_gastos, Monto from GastosPersonales.Gastos;
SELECT * FROM GastosPersonales.Usuarios WHERE ID_USUARIO = '1';
SELECT * FROM GastosPersonales.Gastos ORDER BY Monto DESC;
SELECT * FROM GastosPersonales.Gastos ORDER BY Monto ASC;
select COUNT(*) from GastosPersonales.CategoriadeGastos;
SELECT SUM(Monto) FROM GastosPersonales.Gastos;
SELECT MAX(Monto), MIN(Monto) FROM GastosPersonales.Gastos;

SELECT g.ID_Gasto, g.Fecha, u.Nombre, u.Apellido
FROM GastosPersonales.Gastos AS g
INNER JOIN GastosPersonales.Usuarios AS u ON u.ID_USUARIO = g.ID_USUARIO;

SELECT u.Nombre AS empleado, c.ID_Categoria AS categoria_de_gastos
FROM GastosPersonales.Gastos AS g
JOIN GastosPersonales.Usuarios AS u ON g.ID_USUARIO = u.ID_USUARIO
JOIN GastosPersonales.CategoriadeGastos AS c ON g.ID_Categoria = c.ID_Categoria
WHERE g.Monto < 50000;

SELECT u.Nombre AS Usuario, g.Monto AS GastoPersonal
FROM GastosPersonales.Gastos AS g
JOIN GastosPersonales.Usuarios AS u ON g.ID_USUARIO = u.ID_USUARIO
WHERE g.Monto > (
    SELECT AVG(g2.Monto) FROM GastosPersonales.Gastos AS g2 WHERE g.ID_Categoria = g2.ID_Categoria
);

SELECT ID_Categoria, AVG(Monto) AS GastoPromedio
FROM GastosPersonales.Gastos
GROUP BY ID_Categoria;

SELECT Nombre, 'Usuario' AS Tipo
FROM GastosPersonales.Usuarios;

SELECT Nombre
FROM GastosPersonales.Usuarios
WHERE Nombre LIKE '%Pedro%';

SELECT u.Nombre AS Usuario, c.Categoria AS CategoriaDeGastos
FROM GastosPersonales.Gastos AS g
JOIN GastosPersonales.Usuarios AS u ON g.ID_USUARIO = u.ID_USUARIO
JOIN GastosPersonales.CategoriadeGastos AS c ON g.ID_Categoria = c.ID_Categoria
WHERE g.Monto > 50;

SELECT Nombre
FROM GastosPersonales.Usuarios
ORDER BY Nombre ASC
LIMIT 5;

