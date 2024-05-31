// frontend/asset/javascript/search.js

// Fonction pour afficher les produits
function displayProducts(products) {
    const productList = document.getElementById('productList');
    productList.innerHTML = '';
    products.forEach(item => {
        const itemElement = document.createElement('div');
        itemElement.classList.add('col-md-4');
        itemElement.innerHTML = `
            <div class="card mb-4 shadow-sm">
                <img src="${item.image}" class="card-img-top category-image" alt="${item.title}">
                <div class="card-body">
                    <h5 class="card-title"><a href="produit.html?id=${item.id}" aria-label="${item.title}">${item.title}</a></h5>
                </div>
            </div>`;
        productList.appendChild(itemElement);
    });
}

// Fonction pour récupérer les produits depuis l'API PHP
function fetchProducts() {
    fetch('backend/api.php')
        .then(response => response.json())
        .then(data => displayProducts(data))
        .catch(error => console.error('Erreur lors de la récupération des produits:', error));
}

// Afficher les produits au chargement de la page
document.addEventListener('DOMContentLoaded', fetchProducts);

document.getElementById('searchForm').addEventListener('submit', function (e) {
    e.preventDefault();
    const query = document.getElementById('searchInput').value.toLowerCase();
    fetch('backend/api.php')
        .then(response => response.json())
        .then(products => {
            const product = products.find(product => product.title.toLowerCase().includes(query));
            if (product) {
                window.location.href = `produit.html?id=${product.id}`;
            } else {
                alert('Aucun résultat trouvé');
            }
        })
        .catch(error => console.error('Erreur lors de la recherche des produits:', error));
});
