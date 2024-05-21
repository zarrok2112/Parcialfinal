#!/bin/bash

# Actualizar los repositorios e instalar Nginx
sudo apt-get update
sudo apt-get install -y nginx

# Crear la configuración de Nginx para balancear la carga MySQL y manejar Flask
cat <<EOL | sudo tee /etc/nginx/nginx.conf
user www-data;
worker_processes auto;
pid /run/nginx.pid;
include /etc/nginx/modules-enabled/*.conf;

events {
    worker_connections 768;
}

http {
    include /etc/nginx/mime.types;
    default_type application/octet-stream;
    sendfile on;
    tcp_nopush on;
    tcp_nodelay on;
    keepalive_timeout 65;
    types_hash_max_size 2048;

    include /etc/nginx/conf.d/*.conf;
    include /etc/nginx/sites-enabled/*;

    
}

stream {
    upstream mysql_backend {
        server 192.168.60.4:3306 max_fails=3 fail_timeout=30s;
        server 192.168.60.5:3306 max_fails=3 fail_timeout=30s;
        server 192.168.60.6:3306 max_fails=3 fail_timeout=30s;
    }

    server {
        listen 3306;
        proxy_pass mysql_backend;
    }
}
EOL

# Crear la configuración de Nginx para la aplicación Flask
cat <<EOL | sudo tee /etc/nginx/sites-available/default
server {
    listen 80;
    server_name _;

    location / {
        proxy_pass http://127.0.0.1:5000;
        proxy_set_header Host \$host;
        proxy_set_header X-Real-IP \$remote_addr;
        proxy_set_header X-Forwarded-For \$proxy_add_x_forwarded_for;
        proxy_set_header X-Forwarded-Proto \$scheme;
    }
}
EOL

# Habilitar la configuración de Flask en Nginx
sudo ln -s /etc/nginx/sites-available/flask /etc/nginx/sites-enabled/

# Reiniciar Nginx para aplicar las configuraciones
sudo systemctl restart nginx
