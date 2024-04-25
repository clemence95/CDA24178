## Dictionnaire de données

### Table `Fournisseur` :
- **Id_Fournisseur** : INT (Clé primaire)
- **Nom** : VARCHAR(50) - Nom du fournisseur
- **Contact** : VARCHAR(50) - Contact du fournisseur
- **telephone** : VARCHAR(50) - Numéro de téléphone du fournisseur

(Description: Stocke les informations sur les fournisseurs.)

### Table `Produit` :
- **Id_Produit** : INT (Clé primaire)
- **Rubrique** : VARCHAR(50) - Rubrique du produit
- **SousRubrique** : VARCHAR(50) - Sous-rubrique du produit
- **Libelle_court** : VARCHAR(100) - Libellé court du produit
- **Libelle_long** : TEXT - Libellé long du produit
- **Reference_fournisseur** : VARCHAR(50) - Référence du fournisseur pour le produit
- **Prix_achat_HT** : DECIMAL(15,2) - Prix d'achat hors taxes du produit
- **Photo** : BLOB - Image du produit

(Description: Stocke les informations sur les produits vendus.)

### Table `Client` :
- **Id_Client** : INT (Clé primaire)
- **Nom** : VARCHAR(50) - Nom du client
- **Type** : VARCHAR(50) - Type de client
- **Adresse_livraison** : VARCHAR(255) - Adresse de livraison du client
- **Adresse_facturation** : VARCHAR(255) - Adresse de facturation du client
- **Coefficient** : DECIMAL(15,2) - Coefficient du client
- **Reduction** : DECIMAL(15,2) - Réduction appliquée au client
- **Reference** : VARCHAR(50) - Référence du client

(Description: Stocke les informations sur les clients.)

### Table `Commercial` :
- **Id_Commercial** : INT (Clé primaire)
- **Nom** : VARCHAR(50) - Nom du commercial
- **Id_Client** : INT (Clé étrangère) - Identifiant du client lié au commercial

(Description: Stocke les informations sur les commerciaux.)

### Table `Commande` :
- **Id_Commande** : INT (Clé primaire)
- **Statut** : VARCHAR(50) - Statut de la commande
- **Mode_paiement** : VARCHAR(50) - Mode de paiement de la commande
- **Reduction_pro** : DECIMAL(15,2) - Réduction appliquée à la commande
- **Total_HT** : DECIMAL(15,2) - Total hors taxes de la commande
- **Total_TTC** : DECIMAL(15,2) - Total toutes taxes comprises de la commande
- **Date_heure_commande** : DATETIME - Date et heure de la commande
- **Mode_differe** : VARCHAR(50) - Mode de paiement différé de la commande

(Description: Stocke les informations sur les commandes.)

### Table `BonLivraison` :
- **Id_BonLivraison** : INT (Clé primaire)
- **Date_livraison** : DATE - Date de livraison du bon de livraison
- **Statut** : VARCHAR(50) - Statut du bon de livraison

(Description: Stocke les informations sur les bons de livraison.)

### Table `Facture` :
- **Id_Facture** : INT (Clé primaire)
- **Date_facturation** : DATE - Date de facturation de la facture
- **Statut** : VARCHAR(50) - Statut de la facture
- **Id_Commande** : INT (Clé étrangère) - Identifiant de la commande liée à la facture
- **Id_BonLivraison** : INT (Clé étrangère) - Identifiant du bon de livraison lié à la facture

(Description: Stocke les informations sur les factures.)

### Table `Document` :
- **Id_Document** : INT (Clé primaire)
- **Type** : VARCHAR(50) - Type de document
- **Contenu** : BLOB - Contenu du document
- **Date_creation** : DATETIME - Date de création du document
- **Id_Facture** : INT (Clé étrangère) - Identifiant de la facture liée au document

(Description: Stocke les informations sur les documents associés aux factures.)

### Table `Stock` :
- **Id_Stock** : INT (Clé primaire)
- **Quantite** : INT - Quantité en stock
- **Derniere_mise_a_jour** : DATETIME - Date de la dernière mise à jour du stock

(Description: Stocke les informations sur les stocks des produits.)

### Table `Catalogue` :
- **Id_Catalogue** : INT (Clé primaire)
- **Statut** : VARCHAR(50) - Statut du catalogue
- **Date_ajout** : DATE - Date d'ajout du catalogue
- **Date_desactivation** : DATE - Date de désactivation du catalogue

(Description: Stocke les informations sur les catalogues.)

### Table `HistoriqueDocument` :
- **Id_HistoriqueDocument** : INT (Clé primaire)
- **Date_Historique** : DATETIME - Date de l'historique du document
- **Description** : VARCHAR(255) - Description de l'historique du document

(Description: Stocke les informations sur l'historique des documents.)

### Table `Approvisionne` :
- **Id_Fournisseur** : INT (Clé étrangère) - Identifiant du fournisseur
- **Id_Produit** : INT (Clé étrangère) - Identifiant du produit
- **Id_Stock** : INT (Clé étrangère) - Identifiant du stock
- **PRIMARY KEY** : (Id_Fournisseur, Id_Produit, Id_Stock)

(Description: Stocke les informations sur les produits approvisionnés.)

### Table `Concerne` :
- **Id_Client** : INT (Clé étrangère) - Identifiant du client
- **Id_Commande** : INT (Clé étrangère) - Identifiant de la commande
- **PRIMARY KEY** : (Id_Client, Id_Commande)

(Description: Stocke les informations sur les commandes concernant les clients.)

### Table `lie` :
- **Id_Produit** : INT (Clé étrangère) - Identifiant du produit
- **Id_Client** : INT (Clé étrangère) - Identifiant du client
- **Id_Catalogue** : INT (Clé étrangère) - Identifiant du catalogue
- **PRIMARY KEY** : (Id_Produit, Id_Client, Id_Catalogue)

(Description: Stocke les informations sur les liaisons entre produits, clients et catalogues.)

### Table `Archivage` :
- **Id_Document** : INT (Clé étrangère) - Identifiant du document
- **Id_HistoriqueDocument** : INT (Clé étrangère) - Identifiant de l'historique du document
- **PRIMARY KEY** : (Id_Document, Id_HistoriqueDocument)

(Description: Stocke les informations sur l'archivage des documents.)

CREATE TABLE Fournisseur(
   Id_Fournisseur INT,
   Nom VARCHAR(50) ,
   Contact VARCHAR(50) ,
   telephone VARCHAR(50) ,
   PRIMARY KEY(Id_Fournisseur)
);

CREATE TABLE Produit(
   Id_Produit INT,
   Rubrique VARCHAR(50) ,
   SousRubrique VARCHAR(50) ,
   Libelle_court VARCHAR(100) ,
   Libelle_long TEXT,
   Reference_fournisseur VARCHAR(50) ,
   Prix_achat_HT DECIMAL(15,2)  ,
   Photo BLOB,
   PRIMARY KEY(Id_Produit)
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
   PRIMARY KEY(Id_Client)
);

CREATE TABLE Commercial(
   Id_Commercial INT,
   Nom VARCHAR(50) ,
   Id_Client INT,
   PRIMARY KEY(Id_Commercial),
   UNIQUE(Id_Client),
   FOREIGN KEY(Id_Client) REFERENCES Client(Id_Client)
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
   PRIMARY KEY(Id_Commande)
);

CREATE TABLE BonLivraison(
   Id_BonLivraison INT,
   Date_livraison DATE,
   Statut VARCHAR(50) ,
   PRIMARY KEY(Id_BonLivraison)
);

CREATE TABLE Facture(
   Id_Facture INT,
   Date_facturation DATE,
   Statut VARCHAR(50) ,
   Id_Commande INT,
   Id_BonLivraison INT,
   PRIMARY KEY(Id_Facture),
   FOREIGN KEY(Id_Commande) REFERENCES Commande(Id_Commande),
   FOREIGN KEY(Id_BonLivraison) REFERENCES BonLivraison(Id_BonLivraison)
);

CREATE TABLE Document(
   Id_Document INT,
   Type VARCHAR(50) ,
   Contenu BLOB,
   Date_creation DATETIME,
   Id_Facture INT,
   PRIMARY KEY(Id_Document),
   FOREIGN KEY(Id_Facture) REFERENCES Facture(Id_Facture)
);

CREATE TABLE Stock(
   Id_Stock INT,
   Quantite INT,
   Derniere_mise_a_jour DATETIME,
   PRIMARY KEY(Id_Stock)
);

CREATE TABLE Catalogue(
   Id_Catalogue INT,
   Statut VARCHAR(50) ,
   Date_ajout DATE,
   Date_desactivation DATE,
   PRIMARY KEY(Id_Catalogue)
);

CREATE TABLE HistoriqueDocument(
   Id_HistoriqueDocument INT,
   Date_Historique DATETIME,
   Description VARCHAR(255) ,
   PRIMARY KEY(Id_HistoriqueDocument)
);

CREATE TABLE Approvisionne(
   Id_Fournisseur INT,
   Id_Produit INT,
   Id_Stock INT,
   PRIMARY KEY(Id_Fournisseur, Id_Produit, Id_Stock),
   FOREIGN KEY(Id_Fournisseur) REFERENCES Fournisseur(Id_Fournisseur),
   FOREIGN KEY(Id_Produit) REFERENCES Produit(Id_Produit),
   FOREIGN KEY(Id_Stock) REFERENCES Stock(Id_Stock)
);

CREATE TABLE Concerne(
   Id_Client INT,
   Id_Commande INT,
   PRIMARY KEY(Id_Client, Id_Commande),
   FOREIGN KEY(Id_Client) REFERENCES Client(Id_Client),
   FOREIGN KEY(Id_Commande) REFERENCES Commande(Id_Commande)
);

CREATE TABLE lie(
   Id_Produit INT,
   Id_Client INT,
   Id_Catalogue INT,
   PRIMARY KEY(Id_Produit, Id_Client, Id_Catalogue),
   FOREIGN KEY(Id_Produit) REFERENCES Produit(Id_Produit),
   FOREIGN KEY(Id_Client) REFERENCES Client(Id_Client),
   FOREIGN KEY(Id_Catalogue) REFERENCES Catalogue(Id_Catalogue)
);

CREATE TABLE Archivage(
   Id_Document INT,
   Id_HistoriqueDocument INT,
   PRIMARY KEY(Id_Document, Id_HistoriqueDocument),
   FOREIGN KEY(Id_Document) REFERENCES Document(Id_Document),
   FOREIGN KEY(Id_HistoriqueDocument) REFERENCES HistoriqueDocument(Id_HistoriqueDocument)
);


