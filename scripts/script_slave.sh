#!/bin/bash

echo "------------- configurando el esclavo -------------"

# Obtener los valores del archivo master_status.txt
MASTER_LOG_FILE=$(grep 'File:' /home/vagrant/master_status.txt | awk '{print $2}')
MASTER_LOG_POS=$(grep 'Position:' /home/vagrant/master_status.txt | awk '{print $2}')

echo "Master Log File: $MASTER_LOG_FILE"
echo "Master Log Position: $MASTER_LOG_POS"

# Configurar la replicación del esclavo
sudo mysql -u root -proot <<EOF
CHANGE MASTER TO
    MASTER_HOST='192.168.60.4',
    MASTER_USER='repl',
    MASTER_PASSWORD='password',
    MASTER_LOG_FILE='$MASTER_LOG_FILE',
    MASTER_LOG_POS=$MASTER_LOG_POS;
START SLAVE;
EOF

# Verificar el estado de la replicación
sudo mysql -u root -proot -e "SHOW SLAVE STATUS\G" > /home/vagrant/slave_status.txt
