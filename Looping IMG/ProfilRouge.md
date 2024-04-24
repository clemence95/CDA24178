### Table : Fournisseur
- Id_Fournisseur : INT (Clé primaire)
- Nom : VARCHAR(50)
- Contact : VARCHAR(50)
- Telephone : VARCHAR(50)

### Table : Produit
- Id_Produit : INT (Clé primaire)
- Rubrique : VARCHAR(50)
- SousRubrique : VARCHAR(50)
- Libelle_court : VARCHAR(100)
- Libelle_long : TEXT
- Reference_fournisseur : VARCHAR(50)
- Prix_achat_HT : DECIMAL(15,2)
- Photo : VARCHAR(255)

### Table : Client
- Id_Client : INT (Clé primaire)
- Nom : VARCHAR(50)
- Type : ENUM('Particulier', 'Professionnel')
- Adresse_livraison : VARCHAR(255)
- Adresse_facturation : VARCHAR(255)
- Coefficient : DECIMAL(15,2)
- Reduction : DECIMAL(15,2)
- Reference : VARCHAR(50)

### Table : Commercial
- Id_Commercial : INT (Clé primaire)
- Nom : VARCHAR(50)

### Table : Commande
- Id_Commande : INT (Clé primaire)
- Id_Client : INT (Clé étrangère vers Client)
- Statut : VARCHAR(50)
- Mode_paiement : VARCHAR(50)
- Total_HT : DECIMAL(15,2)
- Total_TTC : DECIMAL(15,2)
- Date_heure_commande : DATETIME

### Table : BonLivraison
- Id_BonLivraison : INT (Clé primaire)
- Id_Commande : INT (Clé étrangère vers Commande)
- Date_livraison : DATE
- Statut : VARCHAR(50)

### Table : Facture
- Id_Facture : INT (Clé primaire)
- Id_Commande : INT (Clé étrangère vers Commande)
- Date_facturation : DATE
- Statut : VARCHAR(50)

### Table : Document
- Id_Document : INT (Clé primaire)
- Type : VARCHAR(50)
- Contenu : LONGBLOB
- Date_creation : DATETIME

### Table : Stock
- Id_Stock : INT (Clé primaire)
- Id_Produit : INT (Clé étrangère vers Produit)
- Quantite : INT
- Derniere_mise_a_jour : DATETIME

### Table : PrixClient
- Id_PrixClient : INT (Clé primaire)
- Id_Client : INT (Clé étrangère vers Client)
- Id_Produit : INT (Clé étrangère vers Produit)
- Coefficient : DECIMAL(15,2)
- Reduction : DECIMAL(15,2)

### Table : Catalogue
- Id_Catalogue : INT (Clé primaire)
- Id_Produit : INT (Clé étrangère vers Produit)
- Statut : VARCHAR(50)
- Date_ajout : DATE
- Date_desactivation : DATE

### Table : HistoriqueDocument
- Id_HistoriqueDocument : INT (Clé primaire)
- Id_Document : INT (Clé étrangère vers Document)
- Date_Historique : DATETIME
- Description : VARCHAR(255)

### Table : Approvisionne
- Id_Fournisseur : INT (Clé étrangère vers Fournisseur)
- Id_Produit : INT (Clé étrangère vers Produit)
- Id_Stock : INT (Clé étrangère vers Stock) (Clé primaire composite)

### Table : Occupe
- Id_Client : INT (Clé étrangère vers Client)
- Id_Commercial : INT (Clé étrangère vers Commercial) (Clé primaire composite)

### Table : Concerne
- Id_Client : INT (Clé étrangère vers Client)
- Id_Commande : INT (Clé étrangère vers Commande) (Clé primaire composite)

### Table : Associe
- Id_Commande : INT (Clé étrangère vers Commande)
- Id_BonLivraison : INT (Clé étrangère vers BonLivraison)
- Id_Facture : INT (Clé étrangère vers Facture)
- Id_Document : INT (Clé étrangère vers Document) (Clé primaire composite)

### Table : lie
- Id_Produit : INT (Clé étrangère vers Produit)
- Id_Client : INT (Clé étrangère vers Client)
- Id_PrixClient : INT (Clé étrangère vers PrixClient)
- Id_Catalogue : INT (Clé étrangère vers Catalogue) (Clé primaire composite)

### Table : Archivage
- Id_Document : INT (Clé étrangère vers Document)
- Id_HistoriqueDocument : INT (Clé étrangère vers HistoriqueDocument) (Clé primaire composite)


CREATE TABLE Fournisseur(
   Id_Fournisseur INT,
   Nom VARCHAR(50),
   Contact VARCHAR(50),
   Telephone VARCHAR(50),
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
   Type ENUM('Particulier', 'Professionnel'),
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
   Id_Client INT,
   Statut VARCHAR(50),
   Mode_paiement VARCHAR(50),
   Total_HT DECIMAL(15,2),
   Total_TTC DECIMAL(15,2),
   Date_heure_commande DATETIME,
   PRIMARY KEY(Id_Commande),
   FOREIGN KEY(Id_Client) REFERENCES Client(Id_Client)
);

CREATE TABLE BonLivraison(
   Id_BonLivraison INT,
   Id_Commande INT,
   Date_livraison DATE,
   Statut VARCHAR(50),
   PRIMARY KEY(Id_BonLivraison),
   FOREIGN KEY(Id_Commande) REFERENCES Commande(Id_Commande)
);

CREATE TABLE Facture(
   Id_Facture INT,
   Id_Commande INT,
   Date_facturation DATE,
   Statut VARCHAR(50),
   PRIMARY KEY(Id_Facture),
   FOREIGN KEY(Id_Commande) REFERENCES Commande(Id_Commande)
);

CREATE TABLE Document(
   Id_Document INT,
   Type VARCHAR(50),
   Contenu LONGBLOB,
   Date_creation DATETIME,
   PRIMARY KEY(Id_Document)
);

CREATE TABLE Stock(
   Id_Stock INT,
   Id_Produit INT,
   Quantite INT,
   Derniere_mise_a_jour DATETIME,
   PRIMARY KEY(Id_Stock),
   FOREIGN KEY(Id_Produit) REFERENCES Produit(Id_Produit)
);

CREATE TABLE PrixClient(
   Id_PrixClient INT,
   Id_Client INT,
   Id_Produit INT,
   Coefficient DECIMAL(15,2),
   Reduction DECIMAL(15,2),
   PRIMARY KEY(Id_PrixClient),
   FOREIGN KEY(Id_Client) REFERENCES Client(Id_Client),
   FOREIGN KEY(Id_Produit) REFERENCES Produit(Id_Produit)
);

CREATE TABLE Catalogue(
   Id_Catalogue INT,
   Id_Produit INT,
   Statut VARCHAR(50),
   Date_ajout DATE,
   Date_desactivation DATE,
   PRIMARY KEY(Id_Catalogue),
   FOREIGN KEY(Id_Produit) REFERENCES Produit(Id_Produit)
);

CREATE TABLE HistoriqueDocument(
   Id_HistoriqueDocument INT,
   Id_Document INT,
   Date_Historique DATETIME,
   Description VARCHAR(255),
   PRIMARY KEY(Id_HistoriqueDocument),
   FOREIGN KEY(Id_Document) REFERENCES Document(Id_Document)
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
   Id_PrixClient INT,
   Id_Catalogue INT,
   PRIMARY KEY(Id_Produit, Id_Client, Id_PrixClient, Id_Catalogue),
   FOREIGN KEY(Id_Produit) REFERENCES Produit(Id_Produit),
   FOREIGN KEY(Id_Client) REFERENCES Client(Id_Client),
   FOREIGN KEY(Id_PrixClient) REFERENCES PrixClient(Id_PrixClient),
   FOREIGN KEY(Id_Catalogue) REFERENCES Catalogue(Id_Catalogue)
);

CREATE TABLE Archivage(
   Id_Document INT,
   Id_HistoriqueDocument INT,
   PRIMARY KEY(Id_Document, Id_HistoriqueDocument),
   FOREIGN KEY(Id_Document) REFERENCES Document(Id_Document),
   FOREIGN KEY(Id_HistoriqueDocument) REFERENCES HistoriqueDocument(Id_HistoriqueDocument)
);
