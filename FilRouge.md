### Fournisseur
- **Id_Fournisseur** (INT) : Identifiant unique du fournisseur (clé primaire).
- **Nom** (VARCHAR(50)) : Nom du fournisseur.
- **Contact** (VARCHAR(50)) : Nom du contact chez le fournisseur.
- **telephone** (VARCHAR(50)) : Numéro de téléphone du fournisseur.

### Produit
- **Id_Produit** (INT) : Identifiant unique du produit (clé primaire).
- **Rubrique** (VARCHAR(50)) : Catégorie principale du produit.
- **SousRubrique** (VARCHAR(50)) : Sous-catégorie du produit.
- **Libelle_court** (VARCHAR(100)) : Nom court ou libellé du produit.
- **Libelle_long** (TEXT) : Description détaillée ou longue du produit.
- **Reference_fournisseur** (VARCHAR(50)) : Référence du produit chez le fournisseur.
- **Prix_achat_HT** (DECIMAL(15,2)) : Prix d'achat hors taxes du produit.
- **Photo** (BLOB) : Image du produit.

### Client
- **Id_Client** (INT) : Identifiant unique du client (clé primaire).
- **Nom** (VARCHAR(50)) : Nom du client.
- **Type** (VARCHAR(50)) : Type de client (particulier, professionnel, etc.).
- **Adresse_livraison** (VARCHAR(255)) : Adresse de livraison du client.
- **Adresse_facturation** (VARCHAR(255)) : Adresse de facturation du client.
- **Coefficient** (DECIMAL(15,2)) : Coefficient de prix du client.
- **Reduction** (DECIMAL(15,2)) : Réduction accordée au client.
- **Reference** (VARCHAR(50)) : Référence du client.

### Commercial
- **Id_Commercial** (INT) : Identifiant unique du commercial (clé primaire).
- **Nom** (VARCHAR(50)) : Nom du commercial.
- **Id_Client** (INT) : Identifiant du client associé (clé étrangère vers la table Client).

### Commande
- **Id_Commande** (INT) : Identifiant unique de la commande (clé primaire).
- **Statut** (VARCHAR(50)) : Statut de la commande.
- **Mode_paiement** (VARCHAR(50)) : Mode de paiement de la commande.
- **Reduction_pro** (DECIMAL(15,2)) : Réduction appliquée à la commande.
- **Total_HT** (DECIMAL(15,2)) : Total hors taxes de la commande.
- **Total_TTC** (DECIMAL(15,2)) : Total toutes taxes comprises de la commande.
- **Date_heure_commande** (DATETIME) : Date et heure de la commande.
- **Mode_differe** (VARCHAR(50)) : Mode de paiement différé de la commande.

### BonLivraison
- **Id_BonLivraison** (INT) : Identifiant unique du bon de livraison (clé primaire).
- **Date_livraison** (DATE) : Date de livraison du bon de livraison.
- **Statut** (VARCHAR(50)) : Statut du bon de livraison.

### Facture
- **Id_Facture** (INT) : Identifiant unique de la facture (clé primaire).
- **Date_facturation** (DATE) : Date de facturation de la facture.
- **Statut** (VARCHAR(50)) : Statut de la facture.
- **Id_Commande** (INT) : Identifiant de la commande associée (clé étrangère vers la table Commande).
- **Id_BonLivraison** (INT) : Identifiant du bon de livraison associé (clé étrangère vers la table BonLivraison).

### Document
- **Id_Document** (INT) : Identifiant unique du document (clé primaire).
- **Type** (VARCHAR(50)) : Type de document.
- **Contenu** (BLOB) : Contenu du document.
- **Date_creation** (DATETIME) : Date de création du document.
- **Id_Facture** (INT) : Identifiant de la facture associée (clé étrangère vers la table Facture).

### Stock
- **Id_Stock** (INT) : Identifiant unique du stock (clé primaire).
- **Quantite** (INT) : Quantité de produits en stock.
- **Derniere_mise_a_jour** (DATETIME) : Date et heure de la dernière mise à jour du stock.

### Catalogue
- **Id_Catalogue** (INT) : Identifiant unique du catalogue (clé primaire).
- **Statut** (VARCHAR(50)) : Statut du catalogue.
- **Date_ajout** (DATE) : Date d'ajout du catalogue.
- **Date_desactivation** (DATE) : Date de désactivation du catalogue.

### HistoriqueDocument
- **Id_HistoriqueDocument** (INT) : Identifiant unique de l'historique du document (clé primaire).
- **Date_Historique** (DATETIME) : Date et heure de l'historique du document.
- **Description** (VARCHAR(255)) : Description de l'historique du document.

### Approvisionne
- **Id_Fournisseur** (INT) : Identifiant du fournisseur (clé étrangère vers la table Fournisseur).
- **Id_Produit** (INT) : Identifiant du produit (clé étrangère vers la table Produit).
- **Id_Stock** (INT) : Identifiant du stock (clé étrangère vers la table Stock).

### Concerne
- **Id_Client** (INT) : Identifiant du client (clé étrangère vers la table Client).
- **Id_Commande** (INT) : Identifiant de la commande (clé étrangère vers la table Commande).

### lie
- **Id_Produit** (INT) : Identifiant du produit (clé étrangère vers la table Produit).
- **Id_Client** (INT) : Identifiant du client (clé étrangère vers la table Client).
- **Id_Catalogue** (INT) : Identifiant du catalogue (clé étrangère vers la table Catalogue).

### Archivage
- **Id_Document** (INT) : Identifiant du document (clé étrangère vers la table Document).
- **Id_HistoriqueDocument** (INT) : Identifiant de l'historique du document (clé étrangère vers la table HistoriqueDocument).


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


