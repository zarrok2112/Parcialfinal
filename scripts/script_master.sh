#!/bin/bash

echo "------------- configurando el maestro -------------"

# Ejecutar comandos MySQL para configurar el maestro
sudo mysql -u root -proot <<EOF
CREATE USER 'repl'@'%' IDENTIFIED BY 'password';
GRANT REPLICATION SLAVE ON *.* TO 'repl'@'%';
FLUSH PRIVILEGES;
CREATE DATABASE knights;
USE knights;
CREATE TABLE favorite_colors (
  name VARCHAR(20),
  color VARCHAR(10)
);
INSERT INTO favorite_colors (name, color) VALUES ('Lancelot', 'blue'), ('Galahad', 'yellow');
FLUSH TABLES WITH READ LOCK;
EOF

# Obtener el estado del binlog y guardarlo en un archivo
sudo mysql -u root -proot -e "SHOW MASTER STATUS\G" | tee /home/vagrant/master_status.txt

# Desbloquear las tablas
sudo mysql -u root -proot -e "UNLOCK TABLES;"