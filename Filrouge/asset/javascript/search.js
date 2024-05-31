// assets/javascript/search.js

const products = [
    { title: 'Guitare Électrique', image: 'images/guitares.jpg', description: 'Une guitare électrique de haute qualité.', link: 'guitares.html' },
    { title: 'Piano à Queue', image: 'images/pianos.jpg', description: 'Un piano à queue parfait pour les concerts.', link: 'pianos.html' },
    { title: 'Batterie Acoustique', image: 'images/batteries.jpg', description: 'Une batterie acoustique pour les pros.', link: 'batteries.html' },
    { title: 'Clavier MIDI', image: 'images/claviers.jpg', description: 'Un clavier MIDI polyvalent pour la production musicale.', link: 'claviers.html' },
    { title: 'Saxophone', image: 'images/instruments-a-vent.jpg', description: 'Un saxophone avec un son riche et profond.', link: 'instruments-a-vent.html' },
    { title: 'Accessoires de Musique', image: 'images/accessoires.jpg', description: 'Tous les accessoires dont vous avez besoin.', link: 'accessoires.html' }
];

// Fonction pour afficher les produits par défaut
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
                    <h5 class="card-title"><a href="${item.link}" aria-label="${item.title}">${item.title}</a></h5>
                </div>
            </div>`;
        productList.appendChild(itemElement);
    });
}

// Afficher les produits par défaut au chargement de la page
document.addEventListener('DOMContentLoaded', () => {
    displayProducts(products);
});

document.getElementById('searchForm').addEventListener('submit', function (e) {
    e.preventDefault();
    const query = document.getElementById('searchInput').value.toLowerCase();
    const product = products.find(product => product.title.toLowerCase().includes(query));
    if (product) {
        const params = new URLSearchParams(product).toString();
        window.location.href = `produit.html?${params}`;
    } else {
        alert('Aucun résultat trouvé');
    }
});



