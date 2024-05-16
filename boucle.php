<?php
// Charger les variables d'environnement depuis le fichier .env.local
require __DIR__ . '/vendor/autoload.php';
$dotenv = Dotenv\Dotenv::createImmutable(__DIR__, '.env.local');
$dotenv->load();

// Utiliser les variables d'environnement pour la connexion à la base de données
$db_host = $_ENV['DB_HOST'];
$db_name = $_ENV['DB_NAME'];
$db_username = $_ENV['DB_USERNAME'];
$db_password = $_ENV['DB_PASSWORD'];

try {
    // Connexion à la base de données avec PDO
    $pdo = new PDO("mysql:host=$db_host;dbname=$db_name", $db_username, $db_password);

    // Configuration de PDO pour qu'il génère des exceptions en cas d'erreur
    $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

    // Requête SQL avec LIMIT
    $sql = "SELECT * FROM Produit LIMIT 100";
    $stmt = $pdo->query($sql);

    // Parcourir les résultats de la requête
    while ($row = $stmt->fetch(PDO::FETCH_ASSOC)) {
        // Afficher ou utiliser les données de chaque ligne
        echo "ID: " . $row["Id_Produit"] . " - Nom court: " . $row["Libelle_court"] . " - Nom long: " . $row["Libelle_long"] . " - Prix HT: " . $row["Prix_achat_HT"] . "<br>";
    }    
} catch (PDOException $e) {
    // En cas d'erreur de connexion à la base de données
    die("Erreur de connexion à la base de données: " . $e->getMessage());
}
