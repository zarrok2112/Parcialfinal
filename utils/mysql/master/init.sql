-- Crear la base de datos y usarla
CREATE DATABASE knights;
USE knights;

-- Crear la tabla e insertar datos
CREATE TABLE favorite_colors (
  name VARCHAR(20),
  color VARCHAR(10)
);

INSERT INTO favorite_colors (name, color)
VALUES
  ('Lancelot', 'blue'),
  ('Galahad', 'yellow');

-- Crear el usuario de replicación y otorgar privilegios
CREATE USER 'repl'@'%' IDENTIFIED BY 'password';
GRANT REPLICATION SLAVE ON *.* TO 'repl'@'%';
FLUSH PRIVILEGES;

-- Bloquear las tablas y obtener el estado del binlog
FLUSH TABLES WITH READ LOCK;
SHOW MASTER STATUS;
-- Mantén esta sesión abierta mientras realizas la copia de seguridad