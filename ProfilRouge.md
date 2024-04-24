### Fournisseur
- **Id_Fournisseur** : INT (Identifiant unique du fournisseur - clé primaire)
- **Nom** : VARCHAR(50) (Nom du fournisseur)
- **Contact** : VARCHAR(50) (Nom du contact du fournisseur)
- **Telephone** : VARCHAR(50) (Numéro de téléphone du fournisseur)

### Produit
- **Id_Produit** : INT (Identifiant unique du produit - clé primaire)
- **Rubrique** : VARCHAR(50) (Rubrique à laquelle appartient le produit)
- **SousRubrique** : VARCHAR(50) (Sous-rubrique à laquelle appartient le produit)
- **Libelle_court** : VARCHAR(100) (Libellé court du produit)
- **Libelle_long** : TEXT (Description détaillée du produit)
- **Reference_fournisseur** : VARCHAR(50) (Référence du produit chez le fournisseur)
- **Prix_achat_HT** : DECIMAL(15,2) (Prix d'achat hors taxes du produit)
- **Photo** : VARCHAR(255) (Chemin de la photo du produit)

### Client
- **Id_Client** : INT (Identifiant unique du client - clé primaire)
- **Nom** : VARCHAR(50) (Nom du client)
- **Type** : VARCHAR(50) (Type de client - particulier ou professionnel)
- **Adresse_livraison** : VARCHAR(255) (Adresse de livraison du client)
- **Adresse_facturation** : VARCHAR(255) (Adresse de facturation du client)
- **Coefficient** : DECIMAL(15,2) (Coefficient de prix pour le client)
- **Reduction** : DECIMAL(15,2) (Réduction applicable au client)
- **Reference** : VARCHAR(50) (Référence du client)

### Commercial
- **Id_Commercial** : INT (Identifiant unique du commercial - clé primaire)
- **Nom** : VARCHAR(50) (Nom du commercial)

### Commande
- **Id_Commande** : INT (Identifiant unique de la commande - clé primaire)
- **Statut** : VARCHAR(50) (Statut de la commande)
- **Mode_paiement** : VARCHAR(50) (Mode de paiement de la commande)
- **Reduction_pro** : DECIMAL(15,2) (Réduction spécifique pour les clients professionnels)
- **Total_HT** : DECIMAL(15,2) (Total hors taxes de la commande)
- **Total_TTC** : DECIMAL(15,2) (Total toutes taxes comprises de la commande)
- **Date_heure_commande** : DATETIME (Date et heure de la commande)
- **Mode_paiement_pro** : VARCHAR(50) (Mode de paiement spécifique pour les clients professionnels)

### BonLivraison
- **Id_BonLivraison** : INT (Identifiant unique du bon de livraison - clé primaire)
- **Date_livraison** : DATE (Date de livraison du bon de livraison)
- **Statut** : VARCHAR(50) (Statut du bon de livraison)

### Facture
- **Id_Facture** : INT (Identifiant unique de la facture - clé primaire)
- **Date_facturation** : DATE (Date de facturation de la facture)
- **Statut** : VARCHAR(50) (Statut de la facture)

### Document
- **Id_Document** : INT (Identifiant unique du document - clé primaire)
- **Type** : VARCHAR(50) (Type de document)
- **Contenu** : LONGBINARY (Contenu du document)
- **Date_creation** : DATETIME (Date de création du document)

### Stock
- **Id_Stock** : INT (Identifiant unique du stock - clé primaire)
- **Quantite** : INT (Quantité en stock)
- **Derniere_mise_a_jour** : DATETIME (Date de la dernière mise à jour du stock)

### Catalogue
- **Id_Catalogue** : INT (Identifiant unique du catalogue - clé primaire)
- **Statut** : VARCHAR(50) (Statut du catalogue)
- **Date_ajout** : DATE (Date d'ajout du catalogue)
- **Date_desactivation** : DATE (Date de désactivation du catalogue)

### HistoriqueDocument
- **Id_HistoriqueDocument** : INT (Identifiant unique de l'historique du document - clé primaire)
- **Date_Historique** : DATETIME (Date de l'événement dans l'historique du document)
- **Description** : VARCHAR(255) (Description de l'événement dans l'historique du document)

### Approvisionne
- **Id_Fournisseur** : INT (Identifiant unique du fournisseur - clé étrangère)
- **Id_Produit** : INT (Identifiant unique du produit - clé étrangère)
- **Id_Stock** : INT (Identifiant unique du stock - clé étrangère)

### Occupe
- **Id_Client** : INT (Identifiant unique du client - clé étrangère)
- **Id_Commercial** : INT (Identifiant unique du commercial - clé étrangère)

### Concerne
- **Id_Client** : INT (Identifiant unique du client - clé étrangère)
- **Id_Commande** : INT (Identifiant unique de la commande - clé étrangère)

### Associe
- **Id_Commande** : INT (Identifiant unique de la commande - clé étrangère)
- **Id_BonLivraison** : INT (Identifiant unique du bon de livraison - clé étrangère)
- **Id_Facture** : INT (Identifiant unique de la facture - clé étrangère)
- **Id_Document** : INT (Identifiant unique du document - clé étrangère)

### lie
- **Id_Produit** : INT (Identifiant unique du produit - clé étrangère)
- **Id_Client** : INT (Identifiant unique du client - clé étrangère)
- **Id_Catalogue** : INT (Identifiant unique du catalogue - clé étrangère)

### Archivage
- **Id_Document** : INT (Identifiant unique du document - clé étrangère)
- **Id_HistoriqueDocument** : INT (Identifiant unique de l'historique du document - clé étrangère)


CREATE TABLE Fournisseur(
   Id_Fournisseur INT,
   Nom VARCHAR(50),
   Contact VARCHAR(50),
   telephone VARCHAR(50),
   PRIMARY KEY(Id_Fournisseur)
);

CREATE TABLE Produit(
   Id_Produit INT,
   Rubrique VARCHAR(50),
   SousRubrique VARCHAR(50),
   Libelle_court VARCHAR(100),
   Libelle_long TEXT,
   Reference_fournisseur VARCHAR(50),
   Prix_achat_HT DECIMAL(15,2),
   Photo VARCHAR(255),
   PRIMARY KEY(Id_Produit)
);

CREATE TABLE Client(
   Id_Client INT,
   Nom VARCHAR(50),
   Type VARCHAR(50),
   Adresse_livraison VARCHAR(255),
   Adresse_facturation VARCHAR(255),
   Coefficient DECIMAL(15,2),
   Reduction DECIMAL(15,2),
   Reference VARCHAR(50),
   PRIMARY KEY(Id_Client)
);

CREATE TABLE Commercial(
   Id_Commercial INT,
   Nom VARCHAR(50),
   PRIMARY KEY(Id_Commercial)
);

CREATE TABLE Commande(
   Id_Commande INT,
   Statut VARCHAR(50),
   Mode_paiement VARCHAR(50),
   Reduction_pro DECIMAL(15,2),
   Total_HT DECIMAL(15,2),
   Total_TTC DECIMAL(15,2),
   Date_heure_commande DATETIME,
   Mode_paiement_pro VARCHAR(50),
   PRIMARY KEY(Id_Commande)
);

CREATE TABLE BonLivraison(
   Id_BonLivraison INT,
   Date_livraison DATE,
   Statut VARCHAR(50),
   PRIMARY KEY(Id_BonLivraison)
);

CREATE TABLE Facture(
   Id_Facture INT,
   Date_facturation DATE,
   Statut VARCHAR(50),
   PRIMARY KEY(Id_Facture)
);

CREATE TABLE Document(
   Id_Document INT,
   Type VARCHAR(50),
   Contenu LONGBINARY,
   Date_creation DATETIME,
   PRIMARY KEY(Id_Document)
);

CREATE TABLE Stock(
   Id_Stock INT,
   Quantite INT,
   Derniere_mise_a_jour DATETIME,
   PRIMARY KEY(Id_Stock)
);

CREATE TABLE Catalogue(
   Id_Catalogue INT,
   Statut VARCHAR(50),
   Date_ajout DATE,
   Date_desactivation DATE,
   PRIMARY KEY(Id_Catalogue)
);

CREATE TABLE HistoriqueDocument(
   Id_HistoriqueDocument INT,
   Date_Historique DATETIME,
   Description VARCHAR(255),
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

CREATE TABLE Occupe(
   Id_Client INT,
   Id_Commercial INT,
   PRIMARY KEY(Id_Client, Id_Commercial),
   FOREIGN KEY(Id_Client) REFERENCES Client(Id_Client),
   FOREIGN KEY(Id_Commercial) REFERENCES Commercial(Id_Commercial)
);

CREATE TABLE Concerne(
   Id_Client INT,
   Id_Commande INT,
   PRIMARY KEY(Id_Client, Id_Commande),
   FOREIGN KEY(Id_Client) REFERENCES Client(Id_Client),
   FOREIGN KEY(Id_Commande) REFERENCES Commande(Id_Commande)
);

CREATE TABLE Associe(
   Id_Commande INT,
   Id_BonLivraison INT,
   Id_Facture INT,
   Id_Document INT,
   PRIMARY KEY(Id_Commande, Id_BonLivraison, Id_Facture, Id_Document),
   FOREIGN KEY(Id_Commande) REFERENCES Commande(Id_Commande),
   FOREIGN KEY(Id_BonLivraison) REFERENCES BonLivraison(Id_BonLivraison),
   FOREIGN KEY(Id_Facture) REFERENCES Facture(Id_Facture),
   FOREIGN KEY(Id_Document) REFERENCES Document(Id_Document)
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
