#!/bin/bash

echo "------------- instalando mysql -------------"

debconf-set-selections <<< 'mysql-server mysql-server/root_password password root'
debconf-set-selections <<< 'mysql-server mysql-server/root_password_again password root'

sudo apt update
sudo apt install mysql-server -y
sudo systemctl start mysql.service

# Copiar la configuración personalizada de MySQL
sudo cp /home/vagrant/my.cnf /etc/mysql/my.cnf
sudo systemctl restart mysql.service

# Ejecutar el script de inicialización
sudo mysql -u root -proot < /home/vagrant/init.sql
