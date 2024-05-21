sudo apt install python3-dev default-libmysqlclient-dev build-essential pkg-config mysql-client python3-pip -y
pip3 install Flask==2.3.3
pip3 install flask-cors
pip3 install Flask-MySQLdb
pip install Flask-SQLAlchemy

#Run application
#cd /home/vagrant/webapp
#export FLASK_APP=run.py
#/usr/local/bin/flask run --host=0.0.0.0