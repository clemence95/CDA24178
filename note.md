### Table : Eleve
- **Nom** : VARCHAR(20) - Nom de l'élève.
- **Prenom** : VARCHAR(20) - Prénom de l'élève.
- **PRIMARY KEY(Nom, Prenom)** : Clé primaire de la table Eleve.

### Table : Salle_de_cours
- **Numero_de_salle** : DECIMAL(2,2) - Numéro de la salle de cours.
- **PRIMARY KEY(Numero_de_salle)** : Clé primaire de la table Salle_de_cours.

### Table : Professeur
- **Id_Professeur** : COUNTER - Identifiant unique du professeur.
- **Nom** : VARCHAR(30) - Nom du professeur.
- **Numero_de_salle** : DECIMAL(2,2) - Numéro de la salle de cours attribuée au professeur.
- **PRIMARY KEY(Id_Professeur)** : Clé primaire de la table Professeur.
- **FOREIGN KEY(Numero_de_salle) REFERENCES Salle_de_cours(Numero_de_salle)** : Clé étrangère faisant référence à la table Salle_de_cours.

### Table : Matiere
- **Matiere_enseignee** : VARCHAR(30) - Matière enseignée.
- **nom** : VARCHAR(50) - Nom de la matière.
- **PRIMARY KEY(Matiere_enseignee)** : Clé primaire de la table Matiere.

### Table : Classe
- **Nom_de_la_classe** : VARCHAR(30) - Nom de la classe.
- **Numero_de_salle** : DECIMAL(2,2) - Numéro de la salle de cours attribuée à la classe.
- **PRIMARY KEY(Nom_de_la_classe)** : Clé primaire de la table Classe.
- **UNIQUE(Numero_de_salle)** : Contrainte d'unicité pour le numéro de salle.
- **FOREIGN KEY(Numero_de_salle) REFERENCES Salle_de_cours(Numero_de_salle)** : Clé étrangère faisant référence à la table Salle_de_cours.

### Table : assiste
- **Nom_de_la_classe** : VARCHAR(30) - Nom de la classe.
- **Nom** : VARCHAR(20) - Nom de l'élève.
- **Prenom** : VARCHAR(20) - Prénom de l'élève.
- **PRIMARY KEY(Nom_de_la_classe, Nom, Prenom)** : Clé primaire de la table assiste.
- **FOREIGN KEY(Nom_de_la_classe) REFERENCES Classe(Nom_de_la_classe)** : Clé étrangère faisant référence à la table Classe.
- **FOREIGN KEY(Nom, Prenom) REFERENCES Eleve(Nom, Prenom)** : Clé étrangère faisant référence à la table Eleve.

### Table : enseignement
- **Id_Professeur** : INT - Identifiant du professeur.
- **Matiere_enseignee** : VARCHAR(30) - Matière enseignée.
- **PRIMARY KEY(Id_Professeur, Matiere_enseignee)** : Clé primaire de la table enseignement.
- **FOREIGN KEY(Id_Professeur) REFERENCES Professeur(Id_Professeur)** : Clé étrangère faisant référence à la table Professeur.
- **FOREIGN KEY(Matiere_enseignee) REFERENCES Matiere(Matiere_enseignee)** : Clé étrangère faisant référence à la table Matiere.

### Table : reçoit
- **Nom_de_la_classe** : VARCHAR(30) - Nom de la classe.
- **Matiere_enseignee** : VARCHAR(30) - Matière enseignée.
- **Nb_d_heure** : DECIMAL(2,0) - Nombre d'heures attribuées à cette matière pour cette classe.
- **PRIMARY KEY(Nom_de_la_classe, Matiere_enseignee)** : Clé primaire de la table reçoit.
- **FOREIGN KEY(Nom_de_la_classe) REFERENCES Classe(Nom_de_la_classe)** : Clé étrangère faisant référence à la table Classe.
- **FOREIGN KEY(Matiere_enseignee) REFERENCES Matiere(Matiere_enseignee)** : Clé étrangère faisant référence à la table Matiere.

### Table : obtient
- **Nom** : VARCHAR(20) - Nom de l'élève.
- **Prenom** : VARCHAR(20) - Prénom de l'élève.
- **Matiere_enseignee** : VARCHAR(30) - Matière enseignée.
- **Note** : DECIMAL(2,2) - Note obtenue par l'élève pour cette matière.
- **PRIMARY KEY(Nom, Prenom, Matiere_enseignee)** : Clé primaire de la table obtient.
- **FOREIGN KEY(Nom, Prenom) REFERENCES Eleve(Nom, Prenom)** : Clé étrangère faisant référence à la table Eleve.
- **FOREIGN KEY(Matiere_enseignee) REFERENCES Matiere(Matiere_enseignee)** : Clé étrangère faisant référence à la table Matiere.




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
   nom VARCHAR(50),
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


