CREATE DATABASE retail_project

DROP TABLE IF EXISTS clientes;
CREATE TABLE clientes(
cliente_id SERIAL PRIMARY KEY,
nombre_cliente VARCHAR(50),
edad INT CHECK (edad>=18),
email VARCHAR(50) NOT NULL UNIQUE
);

DROP TABLE IF EXISTS productos;
CREATE TABLE productos(
producto_id SERIAL PRIMARY KEY,
nombre_producto VARCHAR(50),
precio DECIMAL(10,2) CHECK (precio>0),
stock INT CHECK (stock>=0)
);

DROP TABLE IF EXISTS ventas;
CREATE TABLE ventas(
venta_id SERIAL PRIMARY KEY,
fecha DATE,
c_id INT NOT NULL,
p_id INT NOT NULL,
unidades INT CHECK (unidades>0),
CONSTRAINT fk_clientes_id
FOREIGN KEY (c_id) REFERENCES clientes(cliente_id),
CONSTRAINT fk_proudctos_id
FOREIGN KEY (p_id) REFERENCES productos(producto_id)
);

ALTER TABLE productos
ADD COLUMN categoria_producto VARCHAR(30);

BEGIN;
INSERT INTO clientes (nombre_cliente,edad,email) VALUES
('Martin','24','martin23@gmail.com'),
('Agustin','26','agustnt@gmail.com'),
('Lara','33','laris@gmail.com'),
('Silvia','52','silviam@hotmail.com'),
('Jorge','60','jorgito@hotmail.com'); 
COMMIT;

BEGIN;
INSERT INTO productos (nombre_producto,precio,stock,categoria_producto) VALUES
('Tablet Lenovo','600000','5','Tecno'),
('Cacerola Hudson','50000','10','Bazar'),
('Tupper Magic','20000','10','Bazar'),
('Auriculares Aiwa','80000','20','Tecno'),
('Bolso Head','40000','35','Accesorios Deportivos');
COMMIT;

BEGIN;
INSERT INTO ventas (fecha,c_id,p_id,unidades) VALUES
('2026-05-09','1','1','3'),
('2026-05-09','1','2','3'),
('2026-04-21','4','2','1'),
('2026-07-21','3','1','1'),
('2026-08-24','3','1','5');
COMMIT;

UPDATE productos
SET 
precio='25000'
WHERE categoria_producto='Accesorios Deportivos';

DELETE FROM ventas
WHERE fecha='2026-08-24';
