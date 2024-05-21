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
   export FLASK_APP=/home/vagrant/webapp/app.py
   python3 -m flask run --host=0.0.0.0
   ```
4. Realizar pruebas mediante request a las rutas de la aplicación:
   
| Nombre | Método | Ruta |  Body |
|--------------|--------------|--------------|--------------|
| Get Products   |  GET   | http://192.168.60.3:5000/api/products    |  n/a  |
| Get Product by ID   |  GET   | http://192.168.60.3:5000/api/products/<product_id>   |  n/a  |
| Post Product   |  POST   | http://192.168.60.3:5000/api/products  |  { "nombre": "Producto nuevo", "descripcion": "Descripción del producto nuevo", "precio": 99.999} |
| Update Product by ID  |  PUT   | http://192.168.60.3:5000/api/products/<product_id>   |  {"nombre": "producto actualizado", "descripcion": "Descripción actualizada", "precio": 89.99}  |
| Delete Product by ID  |  DELETE  | http://192.168.60.3:5000/api/products/<product_id>   |  n/a  |



