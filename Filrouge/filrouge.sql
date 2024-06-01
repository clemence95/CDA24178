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
   Reduction_pro DECIMAL(15,2),
   Total_HT DECIMAL(15,2)   NOT NULL,
   Total_TTC DECIMAL(15,2)   NOT NULL,
   Date_heure_commande DATETIME NOT NULL,
   Mode_differe VARCHAR(50),
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
   Id_Categorie INT AUTO_INCREMENT,
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
-- Index sur les clés primaires
CREATE INDEX idx_id_fournisseur ON Fournisseur (Id_Fournisseur);
CREATE INDEX idx_id_client ON Client (Id_Client);
CREATE INDEX idx_id_commercial ON Commercial (Id_Commercial);
CREATE INDEX idx_id_commande ON Commande (Id_Commande);
CREATE INDEX idx_id_bonlivraison ON BonLivraison (Id_BonLivraison);
CREATE INDEX idx_id_categorie ON Categorie (Id_Catégorie);
CREATE INDEX idx_id_souscategorie ON Souscategorie (Id_Souscategorie);
CREATE INDEX idx_id_produit ON Produit (Id_Produit);

-- Index sur les clés étrangères
CREATE INDEX idx_fk_id_client ON Commercial (Id_Client);
CREATE INDEX idx_fk_id_client_cmd ON Commande (Id_Client);
CREATE INDEX idx_fk_id_souscategorie ON Produit (Id_Souscategorie);
CREATE INDEX idx_fk_id_fournisseur ON Produit (Id_Fournisseur);
CREATE INDEX idx_fk_id_produit_achete ON achete (Id_Produit);
CREATE INDEX idx_fk_id_commande_achete ON achete (Id_Commande);
CREATE INDEX idx_fk_id_produit_livre ON livre (Id_Produit);
CREATE INDEX idx_fk_id_bonlivraison_livre ON livre (Id_BonLivraison);

