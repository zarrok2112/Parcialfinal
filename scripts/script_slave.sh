#!/bin/bash

echo "------------- configurando el esclavo -------------"

# Verificar si el archivo master_status.txt existe y tiene contenido
if [ -f /vagrant/master_status.txt ]; then
    MASTER_LOG_FILE=$(grep 'File:' /vagrant/master_status.txt | awk '{print $2}')
    MASTER_LOG_POS=$(grep 'Position:' /vagrant/master_status.txt | awk '{print $2}')

    echo "Master Log File: $MASTER_LOG_FILE"
    echo "Master Log Position: $MASTER_LOG_POS"

    if [ -n "$MASTER_LOG_FILE" ] && [ -n "$MASTER_LOG_POS" ]; then
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
    else
        echo "Error: No se encontraron valores en master_status.txt"
    fi
else
    echo "Error: No se encontró el archivo master_status.txt"
fi
