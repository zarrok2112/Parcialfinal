#!/bin/bash
# Verificar si el archivo existe
if [ -f /home/vagrant/master_status.txt ]; then
    # Usar SCP para descargar el archivo al host
    scp -i /path/to/private/key -o StrictHostKeyChecking=no vagrant@192.168.60.4:/home/vagrant/master_status.txt /path/on/host/master_status.txt
else
    echo "Archivo no encontrado."
fi
