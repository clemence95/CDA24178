## Dictionnaire de données

### Table Fournisseur
- `Id_Fournisseur` (INT) : Identifiant unique du fournisseur (clé primaire).
- `Nom` (VARCHAR(50)) : Nom du fournisseur.
- `Contact` (VARCHAR(50)) : Nom du contact chez le fournisseur.
- `Telephone` (VARCHAR(50)) : Numéro de téléphone du fournisseur.

### Table Produit
- `Id_Produit` (INT) : Identifiant unique du produit (clé primaire).
- `Libelle_court` (VARCHAR(100)) : Libellé court du produit.
- `Libelle_long` (TEXT) : Description détaillée du produit.
- `Prix_achat_HT` (DECIMAL(15,2)) : Prix d'achat hors taxes du produit.
- `Photo` (BLOB) : Image représentant le produit.
- `Stock` (DECIMAL(15,2)) : Quantité en stock du produit.
- `Id_Fournisseur` (INT) : Identifiant du fournisseur associé (clé étrangère vers la table Fournisseur).

### Table BonLivraison
- `Id_BonLivraison` (INT) : Identifiant unique du bon de livraison (clé primaire).
- `Date_livraison` (DATE) : Date de livraison du bon.
- `Statut` (VARCHAR(50)) : Statut du bon de livraison.
- `Suivi_commande` (VARCHAR(50)) : Informations de suivi de la commande associée.

### Table Souscategorie
- `Id_Souscategorie` (INT) : Identifiant unique de la sous-catégorie (clé primaire).
- `Libelle_court` (VARCHAR(50)) : Libellé court de la sous-catégorie.
- `Photo` (BLOB) : Image représentant la sous-catégorie.
- `Id_Produit` (INT) : Identifiant du produit associé (clé étrangère vers la table Produit).

### Table Commande
- `Id_Commande` (INT) : Identifiant unique de la commande (clé primaire).
- `Statut` (VARCHAR(50)) : Statut de la commande.
- `Mode_paiement` (VARCHAR(50)) : Mode de paiement de la commande.
- `Reduction_pro` (DECIMAL(15,2)) : Réduction appliquée à la commande pour les professionnels.
- `Total_HT` (DECIMAL(15,2)) : Montant total hors taxes de la commande.
- `Total_TTC` (DECIMAL(15,2)) : Montant total toutes taxes comprises de la commande.
- `Date_heure_commande` (DATETIME) : Date et heure de la commande.
- `Mode_differe` (VARCHAR(50)) : Mode de paiement différé utilisé.
- `Date_facturation` (DATE) : Date de facturation de la commande.
- `Id_BonLivraison` (INT) : Identifiant du bon de livraison associé (clé étrangère vers la table BonLivraison).

### Table Categorie
- `Id_Categorie` (INT) : Identifiant unique de la catégorie (clé primaire).
- `Libelle_court` (VARCHAR(50)) : Libellé court de la catégorie.
- `Photo` (BLOB) : Image représentant la catégorie.
- `Id_Souscategorie` (INT) : Identifiant de la sous-catégorie associée (clé étrangère vers la table Souscategorie).

### Table Client
- `Id_Client` (INT) : Identifiant unique du client (clé primaire).
- `Nom` (VARCHAR(50)) : Nom du client.
- `Type` (VARCHAR(50)) : Type de client (particulier ou professionnel).
- `Adresse_livraison` (VARCHAR(255)) : Adresse de livraison du client.
- `Adresse_facturation` (VARCHAR(255)) : Adresse de facturation du client.
- `Coefficient` (DECIMAL(15,2)) : Coefficient appliqué au prix d'achat en fonction de la catégorie du client.
- `Reduction` (DECIMAL(15,2)) : Réduction appliquée au total de la commande pour le client.
- `Reference` (VARCHAR(50)) : Référence unique attribuée au client.
- `Id_Commande` (INT) : Identifiant de la commande associée (clé étrangère vers la table Commande).

### Table Commercial
- `Id_Commercial` (INT) : Identifiant unique du commercial (clé primaire).
- `Nom` (VARCHAR(50)) : Nom du commercial.
- `Id_Client` (INT) : Identifiant du client associé (clé étrangère vers la table Client).

### Table achete
- `Id_Produit` (INT) : Identifiant du produit acheté (clé étrangère vers la table Produit).
- `Id_Commande` (INT) : Identifiant de la commande associée (clé étrangère vers la table Commande).
- `Quantite` (VARCHAR(50)) : Quantité du produit acheté.


CREATE TABLE Fournisseur(
   Id_Fournisseur INT,
   Nom VARCHAR(50) ,
   Contact VARCHAR(50) ,
   telephone VARCHAR(50) ,
   PRIMARY KEY(Id_Fournisseur)
);

CREATE TABLE Produit(
   Id_Produit INT,
   Libelle_court VARCHAR(100) ,
   Libelle_long TEXT,
   Prix_achat_HT DECIMAL(15,2)  ,
   Photo BLOB,
   stock DECIMAL(15,2)  ,
   Id_Fournisseur INT,
   PRIMARY KEY(Id_Produit),
   FOREIGN KEY(Id_Fournisseur) REFERENCES Fournisseur(Id_Fournisseur)
);

CREATE TABLE BonLivraison(
   Id_BonLivraison INT,
   Date_livraison DATE,
   Statut VARCHAR(50) ,
   Suivi_commande VARCHAR(50) ,
   PRIMARY KEY(Id_BonLivraison)
);

CREATE TABLE Souscategorie(
   Id_Souscategorie INT AUTO_INCREMENT,
   Libelle_court VARCHAR(50) ,
   Photo BLOB,
   Id_Produit INT,
   PRIMARY KEY(Id_Souscategorie),
   FOREIGN KEY(Id_Produit) REFERENCES Produit(Id_Produit)
);

CREATE TABLE Commande(
   Id_Commande INT,
   Statut VARCHAR(50) ,
   Mode_paiement VARCHAR(50) ,
   Reduction_pro DECIMAL(15,2)  ,
   Total_HT DECIMAL(15,2)  ,
   Total_TTC DECIMAL(15,2)  ,
   Date_heure_commande DATETIME,
   Mode_differe VARCHAR(50) ,
   Date_facturation DATE,
   Id_BonLivraison INT,
   PRIMARY KEY(Id_Commande),
   FOREIGN KEY(Id_BonLivraison) REFERENCES BonLivraison(Id_BonLivraison)
);

CREATE TABLE Categorie(
   Id_Catégorie INT AUTO_INCREMENT,
   Libelle_court VARCHAR(50) ,
   Photo BLOB,
   Id_Souscategorie INT,
   PRIMARY KEY(Id_Catégorie),
   FOREIGN KEY(Id_Souscategorie) REFERENCES Souscategorie(Id_Souscategorie)
);

CREATE TABLE Client(
   Id_Client INT,
   Nom VARCHAR(50) ,
   Type VARCHAR(50) ,
   Adresse_livraison VARCHAR(255) ,
   Adresse_facturation VARCHAR(255) ,
   Coefficient DECIMAL(15,2)  ,
   Reduction DECIMAL(15,2)  ,
   Reference VARCHAR(50) ,
   Id_Commande INT,
   PRIMARY KEY(Id_Client),
   FOREIGN KEY(Id_Commande) REFERENCES Commande(Id_Commande)
);

CREATE TABLE Commercial(
   Id_Commercial INT,
   Nom VARCHAR(50) ,
   Id_Client INT,
   PRIMARY KEY(Id_Commercial),
   FOREIGN KEY(Id_Client) REFERENCES Client(Id_Client)
);

CREATE TABLE achete(
   Id_Produit INT,
   Id_Commande INT,
   quantite VARCHAR(50) ,
   PRIMARY KEY(Id_Produit, Id_Commande),
   FOREIGN KEY(Id_Produit) REFERENCES Produit(Id_Produit),
   FOREIGN KEY(Id_Commande) REFERENCES Commande(Id_Commande)
);


