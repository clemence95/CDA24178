| Table          | Attributs                                                | Type de données                                    |
|----------------|----------------------------------------------------------|----------------------------------------------------|
| Eleve          | Nom (PK), Prenom                                         | VARCHAR(20)                                        |
| Salle_de_cours | Numero_de_salle (PK)                                     | DECIMAL(2,2)                                       |
| Professeur     | Id_Professeur (PK), Nom, Prenom, Numero_de_salle (FK)    | COUNTER, VARCHAR(30), DECIMAL(2,2)                 |
| Matiere        | Matiere_enseignee (PK)                                   | VARCHAR(30)                                        |
| Classe         | Nom_de_la_classe (PK), Numero_de_salle (FK)              | VARCHAR(30), DECIMAL(2,2)                          |
| assiste        | Nom_de_la_classe (FK), Nom (FK), Prenom (FK)             | VARCHAR(30), VARCHAR(20), VARCHAR(20)              |
| enseignement   | Id_Professeur (FK), Matiere_enseignee (FK)               | INT, VARCHAR(30)                                   |
| reçoit         | Nom_de_la_classe (FK), Matiere_enseignee (FK), Nb_d_heure| VARCHAR(30), VARCHAR(30), DECIMAL(2,0)             |
| obtient        | Nom (FK), Prenom (FK), Matiere_enseignee (FK), Note      | VARCHAR(20), VARCHAR(20), VARCHAR(30), DECIMAL(2,2)|

CREATE TABLE Eleve(
   Nom VARCHAR(20),
   Prenom VARCHAR(20),
   PRIMARY KEY(Nom, Prenom)
);

CREATE TABLE Salle_de_cours(
   Numero_de_salle DECIMAL(2,2),
   PRIMARY KEY(Numero_de_salle)
);

CREATE TABLE Professeur(
   Id_Professeur COUNTER,
   Nom VARCHAR(30),
   Numero_de_salle DECIMAL(2,2) NOT NULL,
   PRIMARY KEY(Id_Professeur),
   FOREIGN KEY(Numero_de_salle) REFERENCES Salle_de_cours(Numero_de_salle)
);

CREATE TABLE Matiere(
   Matiere_enseignee VARCHAR(30),
   PRIMARY KEY(Matiere_enseignee)
);

CREATE TABLE Classe(
   Nom_de_la_classe VARCHAR(30),
   Numero_de_salle DECIMAL(2,2) NOT NULL,
   PRIMARY KEY(Nom_de_la_classe),
   UNIQUE(Numero_de_salle),
   FOREIGN KEY(Numero_de_salle) REFERENCES Salle_de_cours(Numero_de_salle)
);

CREATE TABLE assiste(
   Nom_de_la_classe VARCHAR(30),
   Nom VARCHAR(20),
   Prenom VARCHAR(20),
   PRIMARY KEY(Nom_de_la_classe, Nom, Prenom),
   FOREIGN KEY(Nom_de_la_classe) REFERENCES Classe(Nom_de_la_classe),
   FOREIGN KEY(Nom, Prenom) REFERENCES Eleve(Nom, Prenom)
);

CREATE TABLE enseignement(
   Id_Professeur INT,
   Matiere_enseignee VARCHAR(30),
   PRIMARY KEY(Id_Professeur, Matiere_enseignee),
   FOREIGN KEY(Id_Professeur) REFERENCES Professeur(Id_Professeur),
   FOREIGN KEY(Matiere_enseignee) REFERENCES Matiere(Matiere_enseignee)
);

CREATE TABLE reçoit(
   Nom_de_la_classe VARCHAR(30),
   Matiere_enseignee VARCHAR(30),
   Nb_d_heure DECIMAL(2,0),
   PRIMARY KEY(Nom_de_la_classe, Matiere_enseignee),
   FOREIGN KEY(Nom_de_la_classe) REFERENCES Classe(Nom_de_la_classe),
   FOREIGN KEY(Matiere_enseignee) REFERENCES Matiere(Matiere_enseignee)
);

CREATE TABLE obtient(
   Nom VARCHAR(20),
   Prenom VARCHAR(20),
   Matiere_enseignee VARCHAR(30),
   Note DECIMAL(2,2),
   PRIMARY KEY(Nom, Prenom, Matiere_enseignee),
   FOREIGN KEY(Nom, Prenom) REFERENCES Eleve(Nom, Prenom),
   FOREIGN KEY(Matiere_enseignee) REFERENCES Matiere(Matiere_enseignee)
);


