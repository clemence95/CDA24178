<?php
// Charger les variables d'environnement depuis le fichier .env.local
require __DIR__ . '/vendor/autoload.php';
$dotenv = Dotenv\Dotenv::createImmutable(__DIR__, '.env.local');
$dotenv->load();
$debut = hrtime(true);

echo "Insertion des données dans la base de données...\n";

try {
    // Connexion à la base de données avec PDO en utilisant les informations d'environnement
    $db_host = $_ENV['DB_HOST'];
    $db_name = $_ENV['DB_NAME'];
    $db_username = $_ENV['DB_USERNAME'];
    $db_password = $_ENV['DB_PASSWORD'];
    $dsn = "mysql:host=$db_host;dbname=$db_name";
    $db = new PDO($dsn, $db_username, $db_password);
    $db->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
    // Démarrer la transaction
    $db->beginTransaction();

    // Insérer les données dans la base de données...
// Insertion dans la table Fournisseur
$db->exec("
INSERT INTO Fournisseur (Id_Fournisseur, Nom, Contact, telephone)
VALUES 
    (1, 'Guitar World', 'Michael Johnson', '0123456789'),
    (2, 'Piano Universe', 'Sarah Lee', '0987654321'),
    (3, 'Music Emporium', 'David Wilson', '0123456789'),
    (4, 'Melody Instruments', 'Jessica Brown', '0987654321'),
    (5, 'Rhythm Warehouse', 'Michael Clark', '0123456789'),
    (6, 'Harmony Supplies', 'Emma Turner', '0987654321'),
    (7, 'Beat Studio', 'James Lee', '0123456789'),
    (8, 'Note Haven', 'Sophia Martinez', '0987654321'),
    (9, 'Song Mart', 'Daniel Thompson', '0123456789'),
    (10, 'Sound Waves', 'Olivia Harris', '0987654321')
");

// Insertion dans la table Client
$db->exec("
INSERT INTO Client (Id_Client, Nom, prenom, telephone, Type, Adresse_livraison, Adresse_facturation, Coefficient, Reduction, Reference, email)
VALUES 
    (1, 'Johnson', 'Thomas', '0234567890', 'Particulier', '25 rue des Mélodies', '25 rue des Factures', 1.0, NULL, 'ML001', 'thomas@johnson.com'),
    (2, 'Lee', 'Sophie', '0678901234', 'Entreprise', '10 avenue des Harmonies', '10 avenue des Factures', 1.5, 0.2, 'SC001', 'sophie@lee.com'),
    (3, 'Wilson', 'Christopher', '0234567890', 'Particulier', '40 rue des Mélodies', '40 rue des Factures', 1.0, NULL, 'MF001', 'christopher@wilson.com'),
    (4, 'Brown', 'Emma', '0678901234', 'Entreprise', '20 avenue des Harmonies', '20 avenue des Factures', 1.5, 0.2, 'HL001', 'emma@brown.com'),
    (5, 'Clark', 'Daniel', '0123456789', 'Particulier', '5 rue des Chansons', '5 rue des Factures', 1.0, NULL, 'SB001', 'daniel@clark.com'),
    (6, 'Johnson', 'Thomas', '0234567890', 'Particulier', '25 rue des Mélodies', '25 rue des Factures', 1.0, NULL, 'ML001', 'thomas@johnson.com'),
    (7, 'Lee', 'Sophie', '0678901234', 'Entreprise', '10 avenue des Harmonies', '10 avenue des Factures', 1.5, 0.2, 'SC001', 'sophie@lee.com'),
    (8, 'Wilson', 'Christopher', '0234567890', 'Particulier', '40 rue des Mélodies', '40 rue des Factures', 1.0, NULL, 'MF001', 'christopher@wilson.com'),
    (9, 'Brown', 'Emma', '0678901234', 'Entreprise', '20 avenue des Harmonies', '20 avenue des Factures', 1.5, 0.2, 'HL001', 'emma@brown.com'),
    (10, 'Clark', 'Daniel', '0123456789', 'Particulier', '5 rue des Chansons', '5 rue des Factures', 1.0, NULL, 'SB001', 'daniel@clark.com')
");

// Insertion dans la table Commercial
$db->exec("
INSERT INTO Commercial (Id_Commercial, Nom, prenom, telephone, email, Id_Client)
VALUES 
    (1, 'Alex Parker', 'Alex', '0456789012', 'alex@guitarworld.com', 1),
    (2, 'Emma White', 'Emma', '0890123456', 'emma@pianouniverse.com', 2),
    (3, 'Alex Parker', 'Alex', '0456789012', 'alex@guitarworld.com', 3),
    (4, 'Emma White', 'Emma', '0890123456', 'emma@pianouniverse.com', 4),
    (5, 'Alex Parker', 'Alex', '0456789012', 'alex@guitarworld.com', 5),
    (6, 'Emma White', 'Emma', '0890123456', 'emma@pianouniverse.com', 6),
    (7, 'Alex Parker', 'Alex', '0456789012', 'alex@guitarworld.com', 7),
    (8, 'Emma White', 'Emma', '0890123456', 'emma@pianouniverse.com', 8),
    (9, 'Alex Parker', 'Alex', '0456789012', 'alex@guitarworld.com', 9),
    (10, 'Emma White', 'Emma', '0890123456', 'emma@pianouniverse.com', 10)
");

// Insertion dans la table Commande
$db->exec("
INSERT INTO Commande (Id_Commande, Statut, Mode_paiement, Reduction_pro, Total_HT, Total_TTC, Date_heure_commande, Mode_differe, Date_facturation, Id_Client)
VALUES 
    (1, 'En cours', 'Chèque', NULL, 1500.00, 1575.00, '2024-05-02 10:00:00', NULL, '2024-05-03', 1),
    (2, 'En cours', 'Virement bancaire', 0.15, 3000.00, 3300.00, '2024-05-02 11:30:00', 'Différé', '2024-05-03', 2),
    (3, 'En cours', 'Chèque', NULL, 1500.00, 1575.00, '2024-05-02 10:00:00', NULL, '2024-05-03', 3),
    (4, 'En cours', 'Virement bancaire', 0.15, 3000.00, 3300.00, '2024-05-02 11:30:00', 'Différé', '2024-05-03', 4),
    (5, 'En cours', 'Chèque', NULL, 1500.00, 1575.00, '2024-05-02 10:00:00', NULL, '2024-05-03', 5),
    (6, 'En cours', 'Virement bancaire', 0.15, 3000.00, 3300.00, '2024-05-02 11:30:00', 'Différé', '2024-05-03', 6),
    (7, 'En cours', 'Chèque', NULL, 1500.00, 1575.00, '2024-05-02 10:00:00', NULL, '2024-05-03', 7),
    (8, 'En cours', 'Virement bancaire', 0.15, 3000.00, 3300.00, '2024-05-02 11:30:00', 'Différé', '2024-05-03', 8),
    (9, 'En cours de livraison', 'Chèque', NULL, 1500.00, 1575.00, '2024-05-02 10:00:00', NULL, '2024-05-03', 9),
    (10, 'En cours', 'Virement bancaire', 0.15, 3000.00, 3300.00, '2024-05-02 11:30:00', 'Différé', '2024-05-03', 10)
");

// Insertion dans la table BonLivraison
$db->exec("
INSERT INTO BonLivraison (Id_BonLivraison, Date_livraison, Statut, Suivi_commande, Id_Commande)
VALUES 
    (1, '2024-05-03', 'En cours de préparation', '9876543210', 1),
    (2, '2024-05-04', 'En cours de préparation', '', 2),
    (3, '2024-05-03', 'En cours de préparation', '9876543210', 3),
    (4, '2024-05-04', 'En cours de préparation', '', 4),
    (5, '2024-05-03', 'En cours de préparation', '9876543210', 5),
    (6, '2024-05-04', 'En cours de préparation', '', 6),
    (7, '2024-05-03', 'En cours de préparation', '9876543210', 7),
    (8, '2024-05-04', 'En cours de préparation', '', 8),
    (9, '2024-05-03', 'En cours de livraison', '9876543210', 9),
    (10, '2024-05-04', 'En cours de préparation', '', 10)
");

// Insertion dans la table Categorie
$db->exec("
INSERT INTO Categorie (Id_Catégorie, Libelle_court, Photo)
VALUES 
    (1, 'Percussions', 'images/percussions.jpg'),
    (2, 'Accessoires', 'images/accessoires.jpg'),
    (3, 'Cordes', 'images/cordes.jpg'),
    (4, 'Claviers', 'images/claviers.jpg'),
    (5, 'Vent', 'images/vent.jpg')
");

// Insertion dans la table Souscategorie
$db->exec("
INSERT INTO Souscategorie (Id_Souscategorie, Libelle_court, Photo, Id_Catégorie)
VALUES 
    (1, 'Batteries électroniques', 'images/batteries_electroniques.jpg', 1),
    (2, 'Accordeurs', 'images/accordeurs.jpg', 2),
    (3, 'Guitares acoustiques', 'images/guitares_acoustiques.jpg', 3),
    (4, 'Guitares électriques', 'images/guitares_electriques.jpg', 3),
    (5, 'Pianos numériques', 'images/pianos_numeriques.jpg', 4),
    (6, 'Synthétiseurs', 'images/synthetiseurs.jpg', 4),
    (7, 'Saxophones', 'images/saxophones.jpg', 5),
    (8, 'Flûtes', 'images/flutes.jpg', 5)
");

// Insertion dans la table Produit
$db->exec("
INSERT INTO Produit (Id_Produit, Libelle_court, Libelle_long, Prix_achat_HT, Photo, stock, Actif, Id_Souscategorie, Id_Fournisseur)
VALUES 
    (1, 'Batterie Roland', 'Batterie électronique avec pads sensibles', 1500.00, 'images/batterie_roland.jpg', 15.00, 'Oui', 1, 1),
    (2, 'Accordeur chromatique Korg', 'Accordeur polyvalent pour tous types d''instruments', 50.00, 'images/accordeur_korg.jpg', 50.00, 'Oui', 2, 2),
    (3, 'Piano Yamaha', 'Piano numérique avec toucher réaliste', 2000.00, 'images/piano_yamaha.jpg', 10.00, 'Oui', 5, 3),
    (4, 'Guitare Fender Stratocaster', 'Guitare électrique emblématique', 1200.00, 'images/guitare_fender.jpg', 20.00, 'Oui', 4, 4),
    (5, 'Microphone Shure SM58', 'Microphone dynamique pour la scène', 100.00, 'images/microphone_shure.jpg', 30.00, 'Oui', 2, 5),
    (6, 'Amplificateur Marshall', 'Ampli à lampes pour une distorsion chaude', 800.00, 'images/ampli_marshall.jpg', 5.00, 'Oui', 1, 6),
    (7, 'Synthétiseur Korg Minilogue', 'Synthé analogique avec séquenceur intégré', 600.00, 'images/synthetiseur_korg.jpg', 15.00, 'Oui', 6, 7),
    (8, 'Violoncelle Stradivarius', 'Violoncelle de haute qualité artisanale', 5000.00, 'images/violoncelle_stradivarius.jpg', 2.00, 'Oui', 3, 8),
    (9, 'Saxophone Yamaha YAS-280', 'Saxophone alto pour débutants et intermédiaires', 1500.00, 'images/saxophone_yamaha.jpg', 10.00, 'Oui', 7, 9),
    (10, 'Flûte traversière Yamaha YFL-222', 'Flûte traversière pour étudiants', 600.00, 'images/flute_yamaha.jpg', 20.00, 'Oui', 8, 10),
    (11, 'Guitare acoustique Yamaha', 'Guitare acoustique de haute qualité', 500.00, 'images/guitare_acoustique_yamaha.jpg', 25.00, 'Oui', 3, 11),
    (12, 'Guitare électrique Gibson', 'Guitare électrique de légende', 2500.00, 'images/guitare_electrique_gibson.jpg', 5.00, 'Oui', 3, 12),
    (13, 'Piano numérique Casio', 'Piano numérique avec fonctionnalités avancées', 1200.00, 'images/piano_casio.jpg', 10.00, 'Oui', 5, 13),
    (14, 'Synthétiseur Roland', 'Synthétiseur polyvalent avec sons riches', 800.00, 'images/synthetiseur_roland.jpg', 15.00, 'Oui', 6, 14)
");


// Insertion dans la table achete
$db->exec("
INSERT INTO achete (Id_Produit, Id_Commande, quantite)
VALUES 
    (1, 1, 1),
    (2, 2, 2),
    (3, 3, 1),
    (4, 4, 2),
    (5, 5, 1),
    (6, 6, 2),
    (7, 7, 1),
    (8, 8, 2),
    (9, 9, 1),
    (10, 10, 2)
");

// Insertion dans la table livre
$db->exec("
INSERT INTO livre (Id_Produit, Id_BonLivraison, quantite)
VALUES 
    (1, 1, 1),
    (2, 2, 2),
    (3, 3, 1),
    (4, 4, 2),
    (5, 5, 1),
    (6, 6, 2),
    (7, 7, 1),
    (8, 8, 2),
    (9, 9, 1),
    (10, 10, 2)
");

    // Valider la transaction
    $db->commit();

    echo "Les données ont été insérées avec succès.\n";
} catch (PDOException $e) {
    // En cas d'erreur, annuler la transaction si la connexion à la base de données a réussi
    if(isset($db)){
        $db->rollBack();
    }
    echo "Erreur : " . $e->getMessage() . "\n";
}

$fin = hrtime(true);
$temps_execution = ($fin - $debut) / 1e+9; // Convertir en secondes
echo "Temps d'exécution : $temps_execution secondes\n";
?>
