# Dictionnaire de Données

## Champs_de_courses
- **Id_Champs_de_courses**: DECIMAL(6,0) (Clé primaire)
- **Distance**: VARCHAR(50)

## Reunion_de_courses
- **Id_Date_heure_du_depart**: DATETIME (Clé primaire)
- **type**: VARCHAR(50)

## Type_de_course
- **Id_Type_de_course**: VARCHAR(50) (Clé primaire)

## Chevaux
- **Nom_du_cheval**: VARCHAR(50) (Clé primaire)
- **Id_Type_de_course**: VARCHAR(50) (Clé étrangère référencant Type_de_course(Id_Type_de_course))

## Proprietaire
- **Nom_du_proprietaire**: VARCHAR(50) (Clé primaire)

## Joker_Driver
- **Nom_Joker_Driver**: VARCHAR(50) (Clé primaire)

## Entraineur
- **Nom_entraineur**: VARCHAR(50) (Clé primaire)

## Course
- **Numero_de_la_course**: VARCHAR(50) (Clé primaire)
- **Nb_participant**: COUNTER
- **nom_epreuve**: VARCHAR(50)
- **distance**: VARCHAR(50)
- **Prix_pour_le_gagant**: DECIMAL(15,2)
- **type_de_course**: VARCHAR(50)
- **numero_du_partant**: VARCHAR(50)
- **Nom_du_cheval**: VARCHAR(50) (Clé étrangère référencant Chevaux(Nom_du_cheval))
- **Id_Champs_de_courses**: DECIMAL(6,0) (Clé étrangère référencant Champs_de_courses(Id_Champs_de_courses))
- **Id_Date_heure_du_depart**: DATETIME (Clé étrangère référencant Reunion_de_courses(Id_Date_heure_du_depart))

## Partant
- **nb_partant**: COUNTER (Clé primaire)
- **nom_du_proprietaire**: VARCHAR(50)
- **nom_entraineur**: VARCHAR(50)
- **nom_joker_driver**: VARCHAR(50)
- **place_a_la_corde**: VARCHAR(50)
- **handicap**: VARCHAR(50)
- **gains**: DECIMAL(15,2)
- **Nom_pere_et_mere_du_cheval**: VARCHAR(50)
- **Nom_du_cheval**: VARCHAR(50) (Clé étrangère référencant Chevaux(Nom_du_cheval))

## Epreuve
- **Id_Epreuve**: VARCHAR(50) (Clé primaire)
- **nom_epreuve**: VARCHAR(50)
- **Nom_du_cheval**: VARCHAR(50) (Clé étrangère référencant Chevaux(Nom_du_cheval))

## composee
- **Numero_de_la_course**: VARCHAR(50)
- **nb_partant**: INT
- **nb_de_partant_5_25**: LOGICAL
- (Clé primaire composée de Numero_de_la_course et nb_partant)
- (Clés étrangères référençant Course(Numero_de_la_course) et Partant(nb_partant))

## monte
- **Id_Date_heure_du_depart**: DATETIME
- **Nom_Joker_Driver**: VARCHAR(50)
- (Clé primaire composée de Id_Date_heure_du_depart et Nom_Joker_Driver)
- (Clés étrangères référençant Reunion_de_courses(Id_Date_heure_du_depart) et Joker_Driver(Nom_Joker_Driver))

## peu_possede
- **Nom_du_cheval**: VARCHAR(50)
- **Nom_du_proprietaire**: VARCHAR(50)
- **Nom_entraineur**: VARCHAR(50)
- (Clé primaire composée de Nom_du_cheval, Nom_du_proprietaire et Nom_entraineur)
- (Clés étrangères référençant Chevaux(Nom_du_cheval), Proprietaire(Nom_du_proprietaire) et Entraineur(Nom_entraineur))


CREATE TABLE Champs_de_courses(
   Id_Champs_de_courses DECIMAL(6,0),
   Distance VARCHAR(50),
   PRIMARY KEY(Id_Champs_de_courses)
);

CREATE TABLE Reunion_de_courses(
   Id_Date_heure_du_depart DATETIME,
   type VARCHAR(50),
   PRIMARY KEY(Id_Date_heure_du_depart)
);

CREATE TABLE Type_de_course(
   Id_Type_de_course VARCHAR(50),
   PRIMARY KEY(Id_Type_de_course)
);

CREATE TABLE Chevaux(
   Nom_du_cheval VARCHAR(50),
   Id_Type_de_course VARCHAR(50),
   PRIMARY KEY(Nom_du_cheval),
   UNIQUE(Id_Type_de_course),
   FOREIGN KEY(Id_Type_de_course) REFERENCES Type_de_course(Id_Type_de_course)
);

CREATE TABLE Proprietaire(
   Nom_du_proprietaire VARCHAR(50),
   PRIMARY KEY(Nom_du_proprietaire)
);

CREATE TABLE Joker_Driver(
   Nom_Joker_Driver VARCHAR(50),
   PRIMARY KEY(Nom_Joker_Driver)
);

CREATE TABLE Entraineur(
   Nom_entraineur VARCHAR(50),
   PRIMARY KEY(Nom_entraineur)
);

CREATE TABLE Course(
   Numero_de_la_course VARCHAR(50),
   Nb_participant COUNTER,
   nom_epreuve VARCHAR(50),
   distance VARCHAR(50),
   Prix_pour_le_gagant DECIMAL(15,2),
   type_de_course VARCHAR(50),
   numero_du_partant VARCHAR(50),
   Nom_du_cheval VARCHAR(50),
   Id_Champs_de_courses DECIMAL(6,0),
   Id_Date_heure_du_depart DATETIME,
   PRIMARY KEY(Numero_de_la_course),
   UNIQUE(Nom_du_cheval),
   UNIQUE(numero_du_partant),
   FOREIGN KEY(Nom_du_cheval) REFERENCES Chevaux(Nom_du_cheval),
   FOREIGN KEY(Id_Champs_de_courses) REFERENCES Champs_de_courses(Id_Champs_de_courses),
   FOREIGN KEY(Id_Date_heure_du_depart) REFERENCES Reunion_de_courses(Id_Date_heure_du_depart)
);

CREATE TABLE Partant(
   nb_partant COUNTER,
   nom_du_proprietaire VARCHAR(50),
   nom_entraineur VARCHAR(50),
   nom_joker_driver VARCHAR(50),
   place_a_la_corde VARCHAR(50),
   handicap VARCHAR(50),
   gains DECIMAL(15,2),
   Nom_pere_et_mere_du_cheval VARCHAR(50),
   Nom_du_cheval VARCHAR(50),
   PRIMARY KEY(nb_partant),
   FOREIGN KEY(Nom_du_cheval) REFERENCES Chevaux(Nom_du_cheval)
);

CREATE TABLE Epreuve(
   Id_Epreuve VARCHAR(50),
   nom_epreuve VARCHAR(50),
   Nom_du_cheval VARCHAR(50),
   PRIMARY KEY(Id_Epreuve),
   FOREIGN KEY(Nom_du_cheval) REFERENCES Chevaux(Nom_du_cheval)
);

CREATE TABLE composee(
   Numero_de_la_course VARCHAR(50),
   nb_partant INT,
   nb_de_partant_5_25 LOGICAL,
   PRIMARY KEY(Numero_de_la_course, nb_partant),
   FOREIGN KEY(Numero_de_la_course) REFERENCES Course(Numero_de_la_course),
   FOREIGN KEY(nb_partant) REFERENCES Partant(nb_partant)
);

CREATE TABLE monte(
   Id_Date_heure_du_depart DATETIME,
   Nom_Joker_Driver VARCHAR(50),
   PRIMARY KEY(Id_Date_heure_du_depart, Nom_Joker_Driver),
   FOREIGN KEY(Id_Date_heure_du_depart) REFERENCES Reunion_de_courses(Id_Date_heure_du_depart),
   FOREIGN KEY(Nom_Joker_Driver) REFERENCES Joker_Driver(Nom_Joker_Driver)
);

CREATE TABLE peu_possede(
   Nom_du_cheval VARCHAR(50),
   Nom_du_proprietaire VARCHAR(50),
   Nom_entraineur VARCHAR(50),
   PRIMARY KEY(Nom_du_cheval, Nom_du_proprietaire, Nom_entraineur),
   FOREIGN KEY(Nom_du_cheval) REFERENCES Chevaux(Nom_du_cheval),
   FOREIGN KEY(Nom_du_proprietaire) REFERENCES Proprietaire(Nom_du_proprietaire),
   FOREIGN KEY(Nom_entraineur) REFERENCES Entraineur(Nom_entraineur)
);
