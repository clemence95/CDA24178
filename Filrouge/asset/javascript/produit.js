// assets/javascript/produit.js

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

const params = getQueryParams();
if (params.title && params.image && params.description) {
    displayProduct(params);
} else {
    document.getElementById('productTitle').textContent = 'Produit non trouvé';
    document.getElementById('productImage').style.display = 'none';
    document.getElementById('productDescription').textContent = '';
}



