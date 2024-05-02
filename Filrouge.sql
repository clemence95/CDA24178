-- Suppression de la base de données si elle existe déjà
DROP DATABASE IF EXISTS VillageGreen;

-- Création de la base de données
CREATE DATABASE VillageGreen;

-- Sélection de la base de données créée
USE VillageGreen;

CREATE TABLE Fournisseur(
   Id_Fournisseur INT,
   Nom VARCHAR(50)  NOT NULL,
   Contact VARCHAR(50)  NOT NULL,
   telephone VARCHAR(50)  NOT NULL,
   PRIMARY KEY(Id_Fournisseur)
);

CREATE TABLE Client(
   Id_Client INT,
   Nom VARCHAR(50)  NOT NULL,
   prenom VARCHAR(50)  NOT NULL,
   telephone VARCHAR(50)  NOT NULL,
   Type VARCHAR(50)  NOT NULL,
   Adresse_livraison VARCHAR(255)  NOT NULL,
   Adresse_facturation VARCHAR(255)  NOT NULL,
   Coefficient DECIMAL(15,2)   NOT NULL,
   Reduction DECIMAL(15,2)  ,
   Reference VARCHAR(50)  NOT NULL,
   email VARCHAR(50)  NOT NULL,
   PRIMARY KEY(Id_Client)
);

CREATE TABLE Commercial(
   Id_Commercial INT,
   Nom VARCHAR(50)  NOT NULL,
   prenom VARCHAR(50)  NOT NULL,
   telephone VARCHAR(50)  NOT NULL,
   email VARCHAR(50)  NOT NULL,
   Id_Client INT,
   PRIMARY KEY(Id_Commercial),
   FOREIGN KEY(Id_Client) REFERENCES Client(Id_Client)
);

CREATE TABLE Commande(
   Id_Commande INT,
   Statut VARCHAR(50)  NOT NULL,
   Mode_paiement VARCHAR(50)  NOT NULL,
   Reduction_pro DECIMAL(15,2)  ,
   Total_HT DECIMAL(15,2)   NOT NULL,
   Total_TTC DECIMAL(15,2)   NOT NULL,
   Date_heure_commande DATETIME NOT NULL,
   Mode_differe VARCHAR(50)  NOT NULL,
   Date_facturation DATE NOT NULL,
   Id_Client INT NOT NULL,
   PRIMARY KEY(Id_Commande),
   FOREIGN KEY(Id_Client) REFERENCES Client(Id_Client)
);

CREATE TABLE BonLivraison(
   Id_BonLivraison INT,
   Date_livraison DATE NOT NULL,
   Statut VARCHAR(50)  NOT NULL,
   Suivi_commande VARCHAR(50)  NOT NULL,
   Id_Commande INT NOT NULL,
   PRIMARY KEY(Id_BonLivraison),
   FOREIGN KEY(Id_Commande) REFERENCES Commande(Id_Commande)
);

CREATE TABLE Categorie(
   Id_Catégorie INT AUTO_INCREMENT,
   Libelle_court VARCHAR(50)  NOT NULL,
   Photo BLOB,
   PRIMARY KEY(Id_Catégorie)
);

CREATE TABLE Souscategorie(
   Id_Souscategorie INT AUTO_INCREMENT,
   Libelle_court VARCHAR(50)  NOT NULL,
   Photo BLOB,
   Id_Catégorie INT NOT NULL,
   PRIMARY KEY(Id_Souscategorie),
   FOREIGN KEY(Id_Catégorie) REFERENCES Categorie(Id_Catégorie)
);

CREATE TABLE Produit(
   Id_Produit INT,
   Libelle_court VARCHAR(100)  NOT NULL,
   Libelle_long TEXT NOT NULL,
   Prix_achat_HT DECIMAL(15,2)   NOT NULL,
   Photo BLOB,
   stock DECIMAL(15,2)  ,
   Actif VARCHAR(50)  NOT NULL,
   Id_Souscategorie INT NOT NULL,
   Id_Fournisseur INT NOT NULL,
   PRIMARY KEY(Id_Produit),
   FOREIGN KEY(Id_Souscategorie) REFERENCES Souscategorie(Id_Souscategorie),
   FOREIGN KEY(Id_Fournisseur) REFERENCES Fournisseur(Id_Fournisseur)
);

CREATE TABLE achete(
   Id_Produit INT,
   Id_Commande INT,
   quantite INT NOT NULL,
   PRIMARY KEY(Id_Produit, Id_Commande),
   FOREIGN KEY(Id_Produit) REFERENCES Produit(Id_Produit),
   FOREIGN KEY(Id_Commande) REFERENCES Commande(Id_Commande)
);

CREATE TABLE livre(
   Id_Produit INT,
   Id_BonLivraison INT,
   quantite INT NOT NULL,
   PRIMARY KEY(Id_Produit, Id_BonLivraison),
   FOREIGN KEY(Id_Produit) REFERENCES Produit(Id_Produit),
   FOREIGN KEY(Id_BonLivraison) REFERENCES BonLivraison(Id_BonLivraison)
);

-- Insertion des données dans la table Fournisseur
INSERT INTO Fournisseur (Id_Fournisseur, Nom, Contact, telephone)
VALUES 
    (3, 'Guitar World', 'Michael Johnson', '0123456789'),
    (4, 'Piano Universe', 'Sarah Lee', '0987654321');

-- Insertion des données dans la table Client
INSERT INTO Client (Id_Client, Nom, prenom, telephone, Type, Adresse_livraison, Adresse_facturation, Coefficient, Reduction, Reference, email)
VALUES 
    (3, 'MusicAddict', 'Thomas', '0234567890', 'Particulier', '25 rue des Mélodies', '25 rue des Factures', 1.0, NULL, 'MA001', 'thomas@musicaddict.com'),
    (4, 'Symphony Corp.', 'Sophie', '0678901234', 'Entreprise', '10 avenue des Harmonies', '10 avenue des Factures', 1.5, 0.2, 'SC001', 'sophie@symphony.com');

-- Insertion des données dans la table Commercial
INSERT INTO Commercial (Id_Commercial, Nom, prenom, telephone, email, Id_Client)
VALUES 
    (3, 'Alex Parker', 'Alex', '0456789012', 'alex@guitarworld.com', 3),
    (4, 'Emma White', 'Emma', '0890123456', 'emma@pianouniverse.com', 4);

-- Insertion des données dans la table Commande
INSERT INTO Commande (Id_Commande, Statut, Mode_paiement, Reduction_pro, Total_HT, Total_TTC, Date_heure_commande, Mode_differe, Date_facturation, Id_Client)
VALUES 
    (3, 'En cours', 'Chèque', NULL, 1500.00, 1575.00, '2024-05-02 10:00:00', 'Différé', '2024-05-03', 3),
    (4, 'En cours', 'Virement bancaire', 0.15, 3000.00, 3300.00, '2024-05-02 11:30:00', 'Différé', '2024-05-03', 4);

-- Insertion des données dans la table BonLivraison en utilisant une chaîne vide pour Suivi_commande
INSERT INTO BonLivraison (Id_BonLivraison, Date_livraison, Statut, Suivi_commande, Id_Commande)
VALUES 
    (3, '2024-05-03', 'En cours de préparation', '9876543210', 3),
    (4, '2024-05-04', 'En cours de préparation', '', 4);

-- Insertion des données dans la table Categorie
INSERT INTO Categorie (Libelle_court, Photo)
VALUES 
    ('Batteries', NULL),
    ('Accessoires', NULL);

-- Insertion des données dans la table Souscategorie
INSERT INTO Souscategorie (Libelle_court, Photo, Id_Catégorie)
VALUES 
    ('Batteries électroniques', NULL, 1),
    ('Accordeurs', NULL, 2);

-- Insertion des données dans la table Produit
INSERT INTO Produit (Id_Produit, Libelle_court, Libelle_long, Prix_achat_HT, Photo, stock, Actif, Id_Souscategorie, Id_Fournisseur)
VALUES 
    (3, 'Batterie Roland', 'Batterie électronique avec pads sensibles', 1500.00, '', 15.00, 'Oui', 1, 3),
    (4, 'Accordeur chromatique Korg', 'Accordeur polyvalent pour tous types d''instruments', 50.00, '', 50.00, 'Oui', 2, 4);


-- Insertion des données dans la table achete
INSERT INTO achete (Id_Produit, Id_Commande, quantite)
VALUES 
    (3, 3, 1),
    (4, 4, 2);

-- Insertion des données dans la table livre
INSERT INTO livre (Id_Produit, Id_BonLivraison, quantite)
VALUES 
    (3, 3, 1),
    (4, 4, 2);
