# Actualizar los repositorios e instalar dependencias necesarias
sudo apt-get update
sudo apt-get install -y python3-dev default-libmysqlclient-dev build-essential pkg-config mysql-client python3-pip

# Instalar virtualenv
sudo pip3 install virtualenv

# Crear y activar el entorno virtual
cd /home/vagrant/webapp
virtualenv venv
source venv/bin/activate

# Instalar las dependencias de Flask en el entorno virtual
pip install Flask==2.3.3
pip install flask-cors
pip install Flask-MySQLdb
pip install Flask-SQLAlchemy

# Ejecutar la aplicación Flask
export FLASK_APP=app.py
flask run --host=0.0.0.0 &