# app.py
from flask import Flask
from flask_sqlalchemy import SQLAlchemy

app = Flask(__name__)
app.config.from_object('config.Config')
db = SQLAlchemy(app)

# Importar y registrar el blueprint de productos
from product_controller import product_controller
app.register_blueprint(product_controller)

if __name__ == '__main__':
    app.run(debug=True, host='0.0.0.0')
