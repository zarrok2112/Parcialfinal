# config.py
class Config:
    MYSQL_HOST = '192.168.60.3' 
    MYSQL_USER = 'repl'
    MYSQL_PASSWORD = 'password'
    MYSQL_DB = 'myflaskapp'
    SQLALCHEMY_DATABASE_URI = f'mysql://{MYSQL_USER}:{MYSQL_PASSWORD}@{MYSQL_HOST}/{MYSQL_DB}'
    SQLALCHEMY_TRACK_MODIFICATIONS = False
