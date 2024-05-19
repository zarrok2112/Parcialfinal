-- Crear la base de datos si no existe y usarla
CREATE DATABASE IF NOT EXISTS knights;
USE knights;

-- Crear la tabla si no existe e insertar datos
CREATE TABLE IF NOT EXISTS favorite_colors (
  name VARCHAR(20),
  color VARCHAR(10)
);

-- Insertar datos solo si no existen
INSERT IGNORE INTO favorite_colors (name, color)
VALUES
  ('Lancelot', 'blue'),
  ('Galahad', 'yellow');

-- Crear el usuario de replicación y otorgar privilegios
CREATE USER IF NOT EXISTS 'repl'@'%' IDENTIFIED BY 'password';
GRANT REPLICATION SLAVE ON *.* TO 'repl'@'%';
FLUSH PRIVILEGES;

-- Bloquear las tablas y obtener el estado del binlog
FLUSH TABLES WITH READ LOCK;
SHOW MASTER STATUS;
-- Mantén esta sesión abierta mientras realizas la copia de seguridad
