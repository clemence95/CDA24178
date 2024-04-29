## Dictionnaire de données

1. **Fournisseur** :
   - Id_Fournisseur : INT (Clé primaire)
   - Nom : VARCHAR(50) (Non NULL)
   - Contact : VARCHAR(50) (Non NULL)
   - telephone : VARCHAR(50) (Non NULL)

2. **Client** :
   - Id_Client : INT (Clé primaire)
   - Nom : VARCHAR(50) (Non NULL)
   - prenom : VARCHAR(50) (Non NULL)
   - telephone : VARCHAR(50) (Non NULL)
   - Type : VARCHAR(50) (Non NULL)
   - Adresse_livraison : VARCHAR(255) (Non NULL)
   - Adresse_facturation : VARCHAR(255) (Non NULL)
   - Coefficient : DECIMAL(15,2) (Non NULL)
   - Reduction : DECIMAL(15,2)
   - Reference : VARCHAR(50) (Non NULL)
   - email : VARCHAR(50) (Non NULL)

3. **Commercial** :
   - Id_Commercial : INT (Clé primaire)
   - Nom : VARCHAR(50) (Non NULL)
   - prenom : VARCHAR(50) (Non NULL)
   - telephone : VARCHAR(50) (Non NULL)
   - email : VARCHAR(50) (Non NULL)
   - Id_Client : INT
     - Clé étrangère référençant Client(Id_Client)

4. **Commande** :
   - Id_Commande : INT (Clé primaire)
   - Statut : VARCHAR(50) (Non NULL)
   - Mode_paiement : VARCHAR(50) (Non NULL)
   - Reduction_pro : DECIMAL(15,2)
   - Total_HT : DECIMAL(15,2) (Non NULL)
   - Total_TTC : DECIMAL(15,2) (Non NULL)
   - Date_heure_commande : DATETIME (Non NULL)
   - Mode_differe : VARCHAR(50) (Non NULL)
   - Date_facturation : DATE (Non NULL)
   - Id_Client : INT (Non NULL)
     - Clé étrangère référençant Client(Id_Client)

5. **BonLivraison** :
   - Id_BonLivraison : INT (Clé primaire)
   - Date_livraison : DATE (Non NULL)
   - Statut : VARCHAR(50) (Non NULL)
   - Suivi_commande : VARCHAR(50) (Non NULL)
   - Id_Commande : INT (Non NULL)
     - Clé étrangère référençant Commande(Id_Commande)

6. **Categorie** :
   - Id_Catégorie : INT AUTO_INCREMENT (Clé primaire)
   - Libelle_court : VARCHAR(50) (Non NULL)
   - Photo : BLOB

7. **Souscategorie** :
   - Id_Souscategorie : INT AUTO_INCREMENT (Clé primaire)
   - Libelle_court : VARCHAR(50) (Non NULL)
   - Photo : BLOB
   - Id_Catégorie : INT (Non NULL)
     - Clé étrangère référençant Categorie(Id_Catégorie)

8. **Produit** :
   - Id_Produit : INT (Clé primaire)
   - Libelle_court : VARCHAR(100) (Non NULL)
   - Libelle_long : TEXT (Non NULL)
   - Prix_achat_HT : DECIMAL(15,2) (Non NULL)
   - Photo : BLOB
   - stock : DECIMAL(15,2)
   - Id_Souscategorie : INT (Non NULL)
     - Clé étrangère référençant Souscategorie(Id_Souscategorie)
   - Id_Fournisseur : INT (Non NULL)
     - Clé étrangère référençant Fournisseur(Id_Fournisseur)

9. **achete** :
   - Id_Produit : INT (Non NULL)
     - Clé étrangère référençant Produit(Id_Produit)
   - Id_Commande : INT (Non NULL)
     - Clé étrangère référençant Commande(Id_Commande)
   - quantite : INT (Clé primaire composée)

10. **livre** :
   - Id_Produit : INT (Non NULL)
     - Clé étrangère référençant Produit(Id_Produit)
   - Id_BonLivraison : INT (Non NULL)
     - Clé étrangère référençant BonLivraison(Id_BonLivraison)
   - quantite : INT (Non NULL)

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
   Id_Souscategorie INT NOT NULL,
   Id_Fournisseur INT NOT NULL,
   PRIMARY KEY(Id_Produit),
   FOREIGN KEY(Id_Souscategorie) REFERENCES Souscategorie(Id_Souscategorie),
   FOREIGN KEY(Id_Fournisseur) REFERENCES Fournisseur(Id_Fournisseur)
);

CREATE TABLE achete(
   Id_Produit INT,
   Id_Commande INT,
   quantite INT,
   PRIMARY KEY(Id_Produit, Id_Commande),
   FOREIGN KEY(Id_Produit) REFERENCES Produit(Id_Produit),
   FOREIGN KEY(Id_Commande) REFERENCES Commande(Id_Commande)
);

CREATE TABLE livre(
   Id_Produit INT,
   Id_BonLivraison INT,
   quantite INT,
   PRIMARY KEY(Id_Produit, Id_BonLivraison),
   FOREIGN KEY(Id_Produit) REFERENCES Produit(Id_Produit),
   FOREIGN KEY(Id_BonLivraison) REFERENCES BonLivraison(Id_BonLivraison)
);
