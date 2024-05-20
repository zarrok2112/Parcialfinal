#!/bin/bash

echo "------------- configurando el maestro -------------"

# Crear el usuario de replicación solo si no existe
sudo mysql -u root -proot <<EOF
CREATE USER IF NOT EXISTS 'repl'@'%' IDENTIFIED BY 'password';
GRANT REPLICATION SLAVE ON *.* TO 'repl'@'%';
GRANT ALL PRIVILEGES ON myflaskapp.* TO 'repl'@'%';
FLUSH PRIVILEGES;
EOF

# Obtener el estado del binlog y guardarlo en un archivo
sudo mysql -u root -proot -e "SHOW MASTER STATUS\G" > /vagrant/master_status.txt

# Verificar el contenido del archivo
cat /vagrant/master_status.txt
