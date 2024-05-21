# Trabajo Final - Balanceo de cargas

## Maquinas usadas


| Nombre | ip |
|--------------|--------------|
| master  | 192.168.60.4    |
| slave1    | 192.168.60.5    |
| slave2   | 192.168.60.6   |
| webserver   | 192.168.60.3   |


## Instalacion y uso

1. Levantar y aprovisionar las maquinas virtuales
   ```sh
   vagrant up
   ```
2. Acceder a la maquina "webserver"
   ```sh
   vagrant ssh webserver
   ```
3. Correr el aplicativo web
   ```sh
   export FLASK_APP=/home/vagrant/webapp/run.py
   python3 -m flask run --host=0.0.0.0
   ```
4. Acceder a la página pegando la dirección en el navegador
   ```js
   http://192.168.60.3:5000/
   ```
