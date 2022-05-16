
CREATE DATABASE IF NOT EXISTS PIA_VDAE;
USE PIA_VDAE;

--ENTIDADES
--#1
CREATE TABLE almacen
(
  Clave INT NOT NULL,
  Descripcion VARCHAR(50) NOT NULL,
  Direccion VARCHAR(50) NOT NULL,
  Encargado VARCHAR(50) NOT NULL,
  Estatus VARCHAR(50) NOT NULL,
  PRIMARY KEY (Clave)
);

--#2
CREATE TABLE linea_de_producto
(
  Clave_linea INT NOT NULL,
  Descripcion VARCHAR(50) NOT NULL,
  Estatus VARCHAR(50) NOT NULL,
  PRIMARY KEY (Clave_linea)
);

--#3
CREATE TABLE producto
(
  Clave_producto INT NOT NULL,
  Descripcion VARCHAR(50) NOT NULL,
  Unidad_medida VARCHAR(50) NOT NULL,
  Fecha_ult_compra DATE NOT NULL,
  Fecha_ult_venta DATE NOT NULL,  
  Costo SMALLINT NOT NULL,
  Precio SMALLINT NOT NULL,
  PRIMARY KEY (Clave_producto)
);

--#4
CREATE TABLE cliente
(
  Clave_cliente INT NOT NULL,
  Nombre_cliente VARCHAR(50) NOT NULL,
  Direccion VARCHAR(50) NOT NULL,
  Correo VARCHAR(50) NOT NULL,
  Telefono VARCHAR(12) NOT NULL,
  Estatus VARCHAR(50) NOT NULL,
  Limite_credito FLOAT NOT NULL,
  Saldo FLOAT NOT NULL,  
  PRIMARY KEY (Clave_cliente)
);

--#5
CREATE TABLE ticket
(
  Numero_ticket INT NOT NULL,
  Fecha DATE NOT NULL,
  Sucursal VARCHAR(50) NOT NULL,
  Importe SMALLINT NOT NULL, 
  PRIMARY KEY (Numero_ticket)
);

--#6
CREATE TABLE detalle_ticket
(
  Numero_ticket INT NOT NULL,
  Detalle VARCHAR(50) NOT NULL,
  Producto VARCHAR(50) NOT NULL,
  Cantidad SMALLINT NOT NULL,
  Importe SMALLINT NOT NULL
);

--#7
CREATE TABLE movimiento_almacen
(
  Clave_movimiento INT NOT NULL,
  Tipo VARCHAR(50) NOT NULL,
  PRIMARY KEY (Clave_movimiento)
);

--#8
CREATE TABLE usuarios_sistema
(
  Clave_usuario INT NOT NULL,
  Nickname VARCHAR(30) NOT NULL,
  Contraseña VARCHAR(20) NOT NULL,
  Nombre VARCHAR(30) NOT NULL,
  Tipo VARCHAR(30) NOT NmysqULL,
  Correo VARCHAR(50) NOT NULL,
  Telefono VARCHAR(12) NOT NULL,
  Estatus VARCHAR(50) NOT NULL, 
  PRIMARY KEY (Clave_usuario)
);

--Importacion de datos 
INSERT INTO usuarios_sistema(Clave_usuario,Nickname,Contraseña,Nombre,Tipo,Correo,Telefono,Estatus) 
VALUES 
('0001',
'Diego',
'contraseña1',
'Diego Avila',
'Administrador',
'Diego.Avila@hotmail.com',
'8116407906',
'Activo');
INSERT INTO usuarios_sistema(Clave_usuario,Nickname,Contraseña,Nombre,Tipo,Correo,Telefono,Estatus) 
VALUES 
('0002',
'Chema',
'contraseña2',
'Jose Almazan',
'Administrador',
'Jose.Almazan@hotmail.com',
'8122071954',
'Activo');

-- Vendedor
INSERT INTO usuarios_sistema(Clave_usuario,Nickname,Contraseña,Nombre,Tipo,Correo,Telefono,Estatus) 
VALUES 
('0003',
'Pablo',
'contraseña3',
'Pablo Perez',
'Vendedor', 
'Pablo.Perez@hotmail.com',
'8149862114',
'Activo'); 

-- Clientes
INSERT INTO cliente(Clave_cliente,Nombre_cliente,Direccion,Correo,Telefono,Estatus,Limite_credito,Saldo) 
VALUES 
('0001',
'Brayan Contreras',
'Colonia Privadas del canada, 66059, Escobedo, Nuevo León',
'Brayan.Contreras@hotmail.com',
'8184361592',
'Activo',
'2500',
'0'); 

-- Los 2 Almacenes
INSERT INTO almacen(Clave,Descripcion,Direccion,Encargado,Estatus) 
VALUES ('0001','Almacen1','Apodaca','Diego Avila','Activo');

INSERT INTO almacen(Clave,Descripcion,Direccion,Encargado,Estatus) 
VALUES ('0002','Almacen2','Escobedo','Jose Almazan','Activo'); 


-- Acciones
INSERT INTO movimiento_almacen(Clave_movimiento,Tipo)
VALUES 
('0001',
'Venta');

-- Productos
INSERT INTO producto(Clave_producto,Descripcion,Unidad_medida,Fecha_ult_compra,Fecha_ult_venta,Costo,Precio) 
VALUES ('0001','Chips','g','2022-05-01','2022-05-14','12','18'); 
INSERT INTO linea_de_producto(Clave_linea,Descripcion,Estatus) 
VALUES ('0001','Papas Fritas','Activo');



SELECT * FROM ticket WHERE Fecha = '2022-05-14';

SELECT dt.Producto, SUM(dt.Cantidad) AS total
FROM ticket as t inner join detalle_ticket as dt
WHERE Sucursal = "Apodaca" 
and t.Numero_ticket = dT.Numero_ticket
group by dt.Producto
order by SUM(dt.Cantidad) Desc;

-- 5 dias
SELECT FECHA, IMPORTE
FROM TICKET
WHERE Sucursal = "Apodaca"
order by FECHA ASC;

SELECT FECHA, sum(IMPORTE)
FROM TICKET
WHERE Sucursal = "Apodaca"
group by fecha
order by FECHA ASC;

SELECT FECHA, sum(IMPORTE)
FROM TICKET
WHERE Sucursal = "Apodaca"
group by fecha
order by FECHA ASC limit 5;

SELECT cast(FECHA as char), cast(sum(IMPORTE) as float)
FROM TICKET
WHERE Sucursal = "Apodaca"
group by fecha
order by FECHA ASC limit 5;

SELECT FECHA, IMPORTE
FROM TICKET
order by FECHA ASC


SELECT distinct(t.Importe), dt.Producto FROM ticket as t inner join detalle_ticket as dt WHERE Sucursal = "Apodaca" 
and t.Numero_ticket = dT.Numero_ticket ;



--
select * from almacen
select * from cliente
select * from detalle_ticket
select * from linea_de_producto
select * from movimiento_almacen
select * from producto
select * from ticket
select * from usuarios_sistema
--
SELECT Descripcion, Costo From Producto;
--
SELECT Importe FROM ticket WHERE Sucursal = "Apodaca";
--
SELECT Nombre FROM Usuarios_sistema WHERE Nickname='Jose';
--
SELECT Limite_credito FROM cliente WHERE Nombre_cliente='Brayan Contreras';
--
SELECT Saldo FROM cliente WHERE Nombre_cliente='Brayan Contreras';
--
SELECT Precio FROM producto WHERE Descripcion='Chips 55g';
