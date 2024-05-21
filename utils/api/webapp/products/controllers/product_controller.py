from flask import Blueprint, request, jsonify
from users.models.db import db

from products.models.products_model import Product

product_controller = Blueprint('product_controller', __name__)

# Get all products
@product_controller.route('/api/products', methods=['GET'])
def get_products():
    print("Listado de productos")
    products = Product.query.all()
    result = [{'id': product.id, 'nombre': product.nombre, 'descripcion': product.descripcion, 'precio': float(product.precio)} for product in products]
    return jsonify(result)

# Get single product by id
@product_controller.route('/api/products/<int:product_id>', methods=['GET'])
def get_product(product_id):
    print("Obteniendo producto")
    product = Product.query.get_or_404(product_id)
    return jsonify({'id': product.id, 'nombre': product.nombre, 'descripcion': product.descripcion, 'precio': float(product.precio)})

# Create a new product
@product_controller.route('/api/products', methods=['POST'])
def create_product():
    print("Creando producto")
    data = request.json
    new_product = Product(nombre=data['nombre'], descripcion=data['descripcion'], precio=data['precio'])
    db.session.add(new_product)
    db.session.commit()
    return jsonify({'message': 'Producto creado satisfactoriamente'}), 201

# Update an existing product
@product_controller.route('/api/products/<int:product_id>', methods=['PUT'])
def update_product(product_id):
    print("Actualizando producto")
    product = Product.query.get_or_404(product_id)
    data = request.json
    product.nombre = data['nombre']
    product.descripcion = data['descripcion']
    product.precio = data['precio']
    db.session.commit()
    return jsonify({'message': 'Producto actualizado satisfactoriamente'})

# Delete an existing product
@product_controller.route('/api/products/<int:product_id>', methods=['DELETE'])
def delete_product(product_id):
    product = Product.query.get_or_404(product_id)
    db.session.delete(product)
    db.session.commit()
    return jsonify({'message': 'Producto eliminado satisfactoriamente'})
