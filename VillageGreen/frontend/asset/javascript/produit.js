// frontend/asset/javascript/produit.js

function getQueryParams() {
    const params = {};
    const queryString = window.location.search.substring(1);
    const regex = /([^&=]+)=([^&]*)/g;
    let m;
    while (m = regex.exec(queryString)) {
        params[decodeURIComponent(m[1])] = decodeURIComponent(m[2]);
    }
    return params;
}

function displayProduct(product) {
    document.getElementById('productTitle').textContent = product.title;
    document.getElementById('productImage').src = product.image;
    document.getElementById('productImage').alt = product.title;
    document.getElementById('productDescription').textContent = product.description;
}

// Récupérer les paramètres d'URL
const params = getQueryParams();
const productId = params.id;

if (productId) {
    fetch(`backend/api.php?id=${productId}`)
        .then(response => response.json())
        .then(data => {
            if (data) {
                displayProduct(data);
            } else {
                document.getElementById('productTitle').textContent = 'Produit non trouvé';
                document.getElementById('productImage').style.display = 'none';
                document.getElementById('productDescription').textContent = '';
            }
        })
        .catch(error => console.error('Erreur lors de la récupération du produit:', error));
} else {
    document.getElementById('productTitle').textContent = 'Aucun produit spécifié';
    document.getElementById('productImage').style.display = 'none';
    document.getElementById('productDescription').textContent = '';
}
