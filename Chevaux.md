| Table        | Attribut               | Type de données | Description                                      |
|--------------|------------------------|-----------------|--------------------------------------------------|
| Cheval       | Numero_enregistrement  | VARCHAR(9) (PK) | Numéro d'enregistrement du cheval                |
|              | Date_de_naissance      | DATE            | Date de naissance du cheval                      |
|              | Identifiant_de_la_mere | VARCHAR(10)     | Identifiant de la mère du cheval                 |
|              | Race                   | VARCHAR(50)     | Race du cheval                                   |
|              | Couleur                | VARCHAR(50)     | Couleur du cheval                                |
|              | Sexe                   | VARCHAR(1)      | Sexe du cheval                                   |
|              | lieu_de_naissance      | VARCHAR(50)     | Lieu de naissance du cheval                      |
| Veterinaire  | Id_Veterinaire         | COUNTER (PK)    | Identifiant du vétérinaire                       |
| Proprietaire | Numero_du_proprietaire | VARCHAR(9) (PK) | Numéro du propriétaire                           |
|              | adresse                | VARCHAR(100)    | Adresse du propriétaire                          |
|              | code_postal            | VARCHAR(50)     | Code postal du propriétaire                      |
|              | Ville                  | VARCHAR(50)     | Ville du propriétaire                            |
| Entraineur   | Numero_entraineur_     | VARCHAR(9) (PK) | Numéro d'identification de l'entraîneur          |
|              | adresse                | VARCHAR(50)     | Adresse de l'entraîneur                          |
|              | code_postal            | VARCHAR(50)     | Code postal de l'entraîneur                      |
|              | ville                  | VARCHAR(50)     | Ville de l'entraîneur                            |
| Suivi        | Numero_enregistrement  | VARCHAR(9) (FK) | Numéro d'enregistrement du cheval (FK)           |
|              | Id_Veterinaire         | INT (FK)        | Identifiant du vétérinaire (FK)                  |
|              | Date_vaccination       | DATE            | Date de vaccination du cheval                    |
| Appartient   | Numero_du_proprietaire | VARCHAR(9) (FK) | Numéro du propriétaire (FK)                      |
|              | Numero_enregistrement  | VARCHAR(9) (FK) | Numéro d'enregistrement du cheval (FK)           |
| Entrainement | Numero_enregistrement  | VARCHAR(9) (FK) | Numéro d'enregistrement du cheval (FK)           |
|              | Numero_entraineur_     | VARCHAR(9) (FK) | Numéro d'identification de l'entraîneur (FK)     |
|              | Date_d_entrainement    | DATE            | Date d'entraînement du cheval                    |
| Peu_devenir  | Numero_du_proprietaire | VARCHAR(9) (FK) | Numéro du propriétaire (FK)                      |
|              | Numero_entraineur_     | VARCHAR(9) (FK) | Numéro d'identification de l'entraîneur (FK)     |
|              | Date_donnee            | DATE            | Date de devenir propriétaire de l'entraîneur     |

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
   PRIMARY KEY(Numero_du_proprietaire)
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
   Numero_entraineur_ VARCHAR(9),
   Date_donnee DATE,
   PRIMARY KEY(Numero_du_proprietaire, Numero_entraineur_),
   FOREIGN KEY(Numero_du_proprietaire) REFERENCES Proprietaire(Numero_du_proprietaire),
   FOREIGN KEY(Numero_entraineur_) REFERENCES Entraineur(Numero_entraineur_)
);

