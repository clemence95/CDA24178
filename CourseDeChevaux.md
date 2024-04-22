# Dictionnaire des Données

## Champs_de_courses
- Id_Champs_de_courses (DECIMAL(6,0)): Identifiant du champ de courses.
- Distance (VARCHAR(50)): Distance du champ de courses.

## Reunion_de_courses
- Id_Date_heure_du_depart (DATETIME): Identifiant de la date et de l'heure du départ de la réunion de courses.

## Type_de_course
- Id_Type_de_course (VARCHAR(50)): Identifiant du type de course.

## Chevaux
- Nom_du_cheval (VARCHAR(50)): Nom du cheval.
- Id_Type_de_course (VARCHAR(50)): Identifiant du type de course du cheval.

## Proprietaire
- Nom_du_proprietaire (VARCHAR(50)): Nom du propriétaire.

## Joker_Driver
- Nom_Joker_Driver (VARCHAR(50)): Nom du joker/driver.

## Entraineur
- Nom_entraineur (VARCHAR(50)): Nom de l'entraîneur.

## Course
- Numero_de_la_course (VARCHAR(50)): Numéro de la course.
- Nb_participant (COUNTER): Nombre de participants à la course.
- nom_epreuve (VARCHAR(50)): Nom de l'épreuve.
- distance (VARCHAR(50)): Distance de la course.
- Prix_pour_le_gagant (DECIMAL(15,2)): Prix pour le gagnant.
- type_de_course (VARCHAR(50)): Type de course.
- Nom_du_cheval (VARCHAR(50)): Nom du cheval participant.
- Id_Champs_de_courses (DECIMAL(6,0)): Identifiant du champ de courses.
- Id_Date_heure_du_depart (DATETIME): Identifiant de la date et de l'heure du départ de la réunion de courses.

## Partant
- Numero_du_partant (COUNTER): Numéro du partant.
- nom_du_proprietaire (VARCHAR(50)): Nom du propriétaire du cheval.
- nom_entraineur (VARCHAR(50)): Nom de l'entraîneur du cheval.
- nom_joker_driver (VARCHAR(50)): Nom du joker/driver du cheval.
- place_a_la_corde (VARCHAR(50)): Place à la corde du cheval.
- handicap (VARCHAR(50)): Handicap du cheval.
- gains (DECIMAL(15,2)): Gains du cheval.
- Nom_pere_et_mere_du_cheval (VARCHAR(50)): Nom du père et de la mère du cheval.
- Nom_du_cheval (VARCHAR(50)): Nom du cheval participant.
- Numero_de_la_course (VARCHAR(50)): Numéro de la course à laquelle le partant participe.

## Epreuve
- Id_Epreuve (VARCHAR(50)): Identifiant de l'épreuve.
- nom_epreuve (VARCHAR(50)): Nom de l'épreuve.
- Nom_du_cheval (VARCHAR(50)): Nom du cheval participant.

## monte
- Id_Date_heure_du_depart (DATETIME): Identifiant de la date et de l'heure du départ de la réunion de courses.
- Nom_Joker_Driver (VARCHAR(50)): Nom du joker/driver participant.

## peu_possede
- Nom_du_cheval (VARCHAR(50)): Nom du cheval.
- Nom_du_proprietaire (VARCHAR(50)): Nom du propriétaire du cheval.
- Nom_entraineur (VARCHAR(50)): Nom de l'entraîneur du cheval.

CREATE TABLE Champs_de_courses(
   Id_Champs_de_courses DECIMAL(6,0),
   Distance VARCHAR(50),
   PRIMARY KEY(Id_Champs_de_courses)
);

CREATE TABLE Reunion_de_courses(
   Id_Date_heure_du_depart DATETIME,
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
   Nom_du_cheval VARCHAR(50),
   Id_Champs_de_courses DECIMAL(6,0),
   Id_Date_heure_du_depart DATETIME,
   PRIMARY KEY(Numero_de_la_course),
   UNIQUE(Nom_du_cheval),
   FOREIGN KEY(Nom_du_cheval) REFERENCES Chevaux(Nom_du_cheval),
   FOREIGN KEY(Id_Champs_de_courses) REFERENCES Champs_de_courses(Id_Champs_de_courses),
   FOREIGN KEY(Id_Date_heure_du_depart) REFERENCES Reunion_de_courses(Id_Date_heure_du_depart)
);

CREATE TABLE Partant(
   Numero_du_partant COUNTER,
   nom_du_proprietaire VARCHAR(50),
   nom_entraineur VARCHAR(50),
   nom_joker_driver VARCHAR(50),
   place_a_la_corde VARCHAR(50),
   handicap VARCHAR(50),
   gains DECIMAL(15,2),
   Nom_pere_et_mere_du_cheval VARCHAR(50),
   Nom_du_cheval VARCHAR(50),
   Numero_de_la_course VARCHAR(50),
   PRIMARY KEY(Numero_du_partant),
   FOREIGN KEY(Nom_du_cheval) REFERENCES Chevaux(Nom_du_cheval),
   FOREIGN KEY(Numero_de_la_course) REFERENCES Course(Numero_de_la_course)
);

CREATE TABLE Epreuve(
   Id_Epreuve VARCHAR(50),
   nom_epreuve VARCHAR(50),
   Nom_du_cheval VARCHAR(50),
   PRIMARY KEY(Id_Epreuve),
   FOREIGN KEY(Nom_du_cheval) REFERENCES Chevaux(Nom_du_cheval)
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