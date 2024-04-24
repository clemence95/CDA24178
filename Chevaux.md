### Table : Cheval
- **Numero_enregistrement** : Identifiant unique du cheval.
- **Date_de_naissance** : Date de naissance du cheval.
- **Identifiant_de_la_mere** : Identifiant de la mère du cheval.
- **Race** : Race du cheval.
- **Couleur** : Couleur du cheval.
- **Sexe** : Sexe du cheval.
- **lieu_de_naissance** : Lieu de naissance du cheval.
- **PRIMARY KEY(Numero_enregistrement)** : Clé primaire de la table Cheval.

### Table : Veterinaire
- **Id_Veterinaire** : Identifiant unique du vétérinaire.
- **PRIMARY KEY(Id_Veterinaire)** : Clé primaire de la table Veterinaire.

### Table : Proprietaire
- **Numero_du_proprietaire** : Numéro d'identification unique du propriétaire.
- **adresse** : Adresse du propriétaire.
- **code_postal** : Code postal du propriétaire.
- **Ville** : Ville du propriétaire.
- **Numero_du_proprietaire_1** : Numéro d'identification du propriétaire (référence à lui-même).
- **PRIMARY KEY(Numero_du_proprietaire)** : Clé primaire de la table Proprietaire.
- **FOREIGN KEY(Numero_du_proprietaire_1) REFERENCES Proprietaire(Numero_du_proprietaire)** : Clé étrangère faisant référence à elle-même.

### Table : Entraineur
- **Numero_entraineur_** : Numéro d'identification unique de l'entraîneur.
- **adresse** : Adresse de l'entraîneur.
- **code_postal** : Code postal de l'entraîneur.
- **ville** : Ville de l'entraîneur.
- **PRIMARY KEY(Numero_entraineur_)** : Clé primaire de la table Entraineur.

### Table : Suivi
- **Numero_enregistrement** : Identifiant du cheval suivi.
- **Id_Veterinaire** : Identifiant du vétérinaire impliqué dans le suivi.
- **Date_vaccination** : Date de la vaccination du cheval.
- **PRIMARY KEY(Numero_enregistrement, Id_Veterinaire)** : Clé primaire de la table Suivi.
- **FOREIGN KEY(Numero_enregistrement) REFERENCES Cheval(Numero_enregistrement)** : Clé étrangère faisant référence à la table Cheval.
- **FOREIGN KEY(Id_Veterinaire) REFERENCES Veterinaire(Id_Veterinaire)** : Clé étrangère faisant référence à la table Veterinaire.

### Table : Appartient
- **Numero_du_proprietaire** : Numéro d'identification du propriétaire.
- **Numero_enregistrement** : Identifiant du cheval.
- **PRIMARY KEY(Numero_du_proprietaire)** : Clé primaire de la table Appartient.
- **FOREIGN KEY(Numero_du_proprietaire) REFERENCES Proprietaire(Numero_du_proprietaire)** : Clé étrangère faisant référence à la table Proprietaire.
- **FOREIGN KEY(Numero_enregistrement) REFERENCES Cheval(Numero_enregistrement)** : Clé étrangère faisant référence à la table Cheval.



CREATE TABLE Cheval(
   Numero_enregistrement VARCHAR(9),
   Date_de_naissance DATE,
   Identifiant_de_la_mere VARCHAR(10),
   Race VARCHAR(50),
   Couleur VARCHAR(50),
   Sexe VARCHAR(1),
   lieu_de_naissance VARCHAR(50),
   PRIMARY KEY(Numero_enregistrement)
);

CREATE TABLE Veterinaire(
   Id_Veterinaire COUNTER,
   PRIMARY KEY(Id_Veterinaire)
);

CREATE TABLE Proprietaire(
   Numero_du_proprietaire VARCHAR(9),
   adresse VARCHAR(100),
   code_postal VARCHAR(50),
   Ville VARCHAR(50),
   Numero_du_proprietaire_1 VARCHAR(9),
   PRIMARY KEY(Numero_du_proprietaire),
   FOREIGN KEY(Numero_du_proprietaire_1) REFERENCES Proprietaire(Numero_du_proprietaire)
);

CREATE TABLE Entraineur(
   Numero_entraineur_ VARCHAR(9),
   adresse VARCHAR(50),
   code_postal VARCHAR(50),
   ville VARCHAR(50),
   PRIMARY KEY(Numero_entraineur_)
);

CREATE TABLE Suivi(
   Numero_enregistrement VARCHAR(9),
   Id_Veterinaire INT,
   Date_vaccination DATE,
   PRIMARY KEY(Numero_enregistrement, Id_Veterinaire),
   FOREIGN KEY(Numero_enregistrement) REFERENCES Cheval(Numero_enregistrement),
   FOREIGN KEY(Id_Veterinaire) REFERENCES Veterinaire(Id_Veterinaire)
);

CREATE TABLE Appartient(
   Numero_du_proprietaire VARCHAR(9),
   Numero_enregistrement VARCHAR(9) NOT NULL,
   PRIMARY KEY(Numero_du_proprietaire),
   FOREIGN KEY(Numero_du_proprietaire) REFERENCES Proprietaire(Numero_du_proprietaire),
   FOREIGN KEY(Numero_enregistrement) REFERENCES Cheval(Numero_enregistrement)
);

CREATE TABLE Entrainement(
   Numero_enregistrement VARCHAR(9),
   Numero_entraineur_ VARCHAR(9),
   Date_d_entrainement DATE,
   PRIMARY KEY(Numero_enregistrement, Numero_entraineur_),
   FOREIGN KEY(Numero_enregistrement) REFERENCES Cheval(Numero_enregistrement),
   FOREIGN KEY(Numero_entraineur_) REFERENCES Entraineur(Numero_entraineur_)
);

CREATE TABLE Peu_devenir(
   Numero_du_proprietaire VARCHAR(9),
   Date_donnee DATE,
   Numero_entraineur_ VARCHAR(9) NOT NULL,
   PRIMARY KEY(Numero_du_proprietaire),
   FOREIGN KEY(Numero_du_proprietaire) REFERENCES Proprietaire(Numero_du_proprietaire),
   FOREIGN KEY(Numero_entraineur_) REFERENCES Entraineur(Numero_entraineur_)
);


