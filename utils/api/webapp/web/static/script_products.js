function getProducts() {
    fetch('/api/products')
        .then(response => response.json())
        .then(data => {
            // Handle data
            console.log(data);

            // Get table body
            var productListBody = document.querySelector('#product-list tbody');
            productListBody.innerHTML = ''; // Clear previous data

            // Loop through products and populate table rows
            data.forEach(product => {
                var row = document.createElement('tr');

                // Nombre
                var nombreCell = document.createElement('td');
                nombreCell.textContent = product.nombre;
                row.appendChild(nombreCell);

                // Descripción
                var descripcionCell = document.createElement('td');
                descripcionCell.textContent = product.descripcion;
                row.appendChild(descripcionCell);

                // Precio
                var precioCell = document.createElement('td');
                precioCell.textContent = product.precio;
                row.appendChild(precioCell);

                // Acciones
                var actionsCell = document.createElement('td');

                // Editar enlace
                var editLink = document.createElement('a');
                editLink.href = `/edit_producto/${product.id}`;
                editLink.textContent = 'Editar';
                editLink.className = 'btn btn-primary mr-2';
                actionsCell.appendChild(editLink);

                // Eliminar enlace
                var deleteLink = document.createElement('a');
                deleteLink.href = '#';
                deleteLink.textContent = 'Eliminar';
                deleteLink.className = 'btn btn-danger';
                deleteLink.addEventListener('click', function() {
                    deleteProduct(product.id);
                });
                actionsCell.appendChild(deleteLink);

                row.appendChild(actionsCell);

                productListBody.appendChild(row);
            });
        })
        .catch(error => console.error('Error:', error));
}

function createProduct() {
    var data = {
        nombre: document.getElementById('nombre').value,
        descripcion: document.getElementById('descripcion').value,
        precio: parseFloat(document.getElementById('precio').value)
    };

    fetch('/api/products', {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json',
        },
        body: JSON.stringify(data),
    })
    .then(response => {
        if (!response.ok) {
            throw new Error('Network response was not ok');
        }
        return response.json();
    })
    .then(data => {
        // Handle success
        console.log(data);
    })
    .catch(error => {
        // Handle error
        console.error('Error:', error);
    });
}

function updateProduct() {
    var productId = document.getElementById('product-id').value;
    var data = {
        nombre: document.getElementById('nombre').value,
        descripcion: document.getElementById('descripcion').value,
        precio: parseFloat(document.getElementById('precio').value)
    };

    fetch(`/api/products/${productId}`, {
        method: 'PUT',
        headers: {
            'Content-Type': 'application/json',
        },
        body: JSON.stringify(data),
    })
    .then(response => {
        if (!response.ok) {
            throw new Error('Network response was not ok');
        }
        return response.json();
    })
    .then(data => {
        // Handle success
        console.log(data);
        // Optionally, redirect to another page or show a success message
    })
    .catch(error => {
        // Handle error
        console.error('Error:', error);
    });
}

function deleteProduct(productId) {
    console.log('Eliminando producto con ID:', productId);
    if (confirm('¿Está seguro de que desea eliminar este producto?')) {
        fetch(`/api/products/${productId}`, {
            method: 'DELETE',
        })
        .then(response => {
            if (!response.ok) {
                throw new Error('Network response was not ok');
            }
            return response.json();
        })
        .then(data => {
            // Handle success
            console.log('Producto eliminado satisfactoriamente:', data);
            // Recargar la lista de productos
            getProducts();
        })
        .catch(error => {
            // Handle error
            console.error('Error:', error);
        });
    }
}
