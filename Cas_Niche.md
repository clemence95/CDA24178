### Table : Proprietaire
- **Nom_du_proprietaire** : VARCHAR(30) - Nom du propriétaire du chien.
- **adresse** : VARCHAR(100) - Adresse du propriétaire.
- **PRIMARY KEY(Nom_du_proprietaire)** : Clé primaire de la table Proprietaire.

### Table : Chien
- **Numero_matricule** : VARCHAR(6) - Numéro de matricule unique du chien.
- **Date_deces_du_chien** : DATE - Date de décès du chien.
- **Date_naissance_du_chien** : DATE - Date de naissance du chien.
- **Nom** : VARCHAR(20) - Nom du chien.
- **Sexe_du_chien** : VARCHAR(1) - Sexe du chien.
- **Race** : VARCHAR(20) - Race du chien.
- **PRIMARY KEY(Numero_matricule)** : Clé primaire de la table Chien.

### Table : Concours
- **Id_Concours** : COUNTER - Identifiant unique du concours.
- **Type_de_concours** : VARCHAR(30) - Type de concours.
- **Date_de_concours** : DATE - Date du concours.
- **Ville_de_concours** : VARCHAR(30) - Ville où se déroule le concours.
- **PRIMARY KEY(Id_Concours)** : Clé primaire de la table Concours.

### Table : Participation
- **Numero_matricule** : VARCHAR(6) - Numéro de matricule du chien participant.
- **Id_Concours** : INT - Identifiant du concours auquel le chien participe.
- **Resultat_du_concours** : DECIMAL(2,0) - Résultat obtenu par le chien lors du concours.
- **PRIMARY KEY(Numero_matricule, Id_Concours)** : Clé primaire de la table Participation.
- **FOREIGN KEY(Numero_matricule) REFERENCES Chien(Numero_matricule)** : Clé étrangère faisant référence à la table Chien.
- **FOREIGN KEY(Id_Concours) REFERENCES Concours(Id_Concours)** : Clé étrangère faisant référence à la table Concours.

### Table : Appartient
- **Nom_du_proprietaire** : VARCHAR(30) - Nom du propriétaire du chien.
- **Numero_matricule** : VARCHAR(6) - Numéro de matricule du chien.
- **Date_d_achat** : DATE - Date à laquelle le chien a été acheté par le propriétaire.
- **PRIMARY KEY(Nom_du_proprietaire, Numero_matricule)** : Clé primaire de la table Appartient.
- **FOREIGN KEY(Nom_du_proprietaire) REFERENCES Proprietaire(Nom_du_proprietaire)** : Clé étrangère faisant référence à la table Proprietaire.
- **FOREIGN KEY(Numero_matricule) REFERENCES Chien(Numero_matricule)** : Clé étrangère faisant référence à la table Chien.


CREATE TABLE Proprietaire(
   Nom_du_proprietaire VARCHAR(30),
   adresse VARCHAR(100),
   PRIMARY KEY(Nom_du_proprietaire)
);

CREATE TABLE Chien(
   Numero_matricule VARCHAR(6),
   Date_deces_du_chien DATE,
   Date_naissance_du_chien DATE,
   Nom VARCHAR(20),
   Sexe_du_chien VARCHAR(1),
   Race VARCHAR(20),
   PRIMARY KEY(Numero_matricule)
);

CREATE TABLE Concours(
   Id_Concours COUNTER,
   Type_de_concours VARCHAR(30),
   Date_de_concours DATE,
   Ville_de_concours VARCHAR(30),
   PRIMARY KEY(Id_Concours)
);

CREATE TABLE Participation(
   Numero_matricule VARCHAR(6),
   Id_Concours INT,
   Resultat_du_concours DECIMAL(2,0),
   PRIMARY KEY(Numero_matricule, Id_Concours),
   FOREIGN KEY(Numero_matricule) REFERENCES Chien(Numero_matricule),
   FOREIGN KEY(Id_Concours) REFERENCES Concours(Id_Concours)
);

CREATE TABLE Appartient(
   Nom_du_proprietaire VARCHAR(30),
   Numero_matricule VARCHAR(6),
   Date_d_achat DATE,
   PRIMARY KEY(Nom_du_proprietaire, Numero_matricule),
   FOREIGN KEY(Nom_du_proprietaire) REFERENCES Proprietaire(Nom_du_proprietaire),
   FOREIGN KEY(Numero_matricule) REFERENCES Chien(Numero_matricule)
);

