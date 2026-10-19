# retail_project

Retail Project - Martín Nicolás Panetta

Se generó una base de datos en PostgreSQL para gestionar clientes, productos y ventas en un entorno de un tipo de comercio retail. Incluye creación de tablas, claves foráneas, restricciones de integridad, carga de datos con transacciones y operaciones de mantenimiento.

--Estructura

Tablas

-clientes
 -cliente_id (PK)
 -nombre_cliente
 -edad
 -email

-productos
 -producto_id (PK)
 -nombre_producto
 -precio
 -stock
 -categoría_producto

-ventas
 -venta id (PK)
 -fecha
 -c_id (FK)
 -p_id (FK)
 -unidades

La tabla ventas se referencia a clientes y productos, asegurando ventas válidas. La carga de datos se llevó a cabo mediante sentencias:

BEGIN;
-- 5 inserts por tabla
COMMIT;

Cuenta con operaciones: UPDATE, para la actualización de precios de una categoría de productos y DELETE, para eliminar una venta en una fecha específica. También cuenta con 4 restricciones CHECK para asegurar la integridad de los datos.
