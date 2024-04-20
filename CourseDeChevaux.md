# Tables :

## Joker_Driver
| Colonne           | Type     | Contraintes                 |
|-------------------|----------|-----------------------------|
| Nom_Joker_Driver | COUNTER  | PRIMARY KEY                 |

## Reunion_de_courses
| Colonne               | Type     | Contraintes                 |
|-----------------------|----------|-----------------------------|
| date_heure_du_depart | DATETIME | PRIMARY KEY                 |

## Proprietaire
| Colonne            | Type        | Contraintes                 |
|--------------------|-------------|-----------------------------|
| Nom_du_proprietaire | VARCHAR(50) | PRIMARY KEY                 |

## Entraineur
| Colonne       | Type        | Contraintes                 |
|---------------|-------------|-----------------------------|
| Nom_entraineur | VARCHAR(50) | PRIMARY KEY                 |

## Type_de_courses
| Colonne          | Type        | Contraintes                 |
|------------------|-------------|-----------------------------|
| Type_de_courses  | VARCHAR(50) | PRIMARY KEY                 |

## Epreuve
| Colonne     | Type        | Contraintes                 |
|-------------|-------------|-----------------------------|
| Nom_epreuve | VARCHAR(50) | PRIMARY KEY                 |

## Champ_de_courses
| Colonne  | Type         | Contraintes                 |
|----------|--------------|-----------------------------|
| Distance | DECIMAL(15,2) | PRIMARY KEY                 |

## Chevaux
| Colonne        | Type         | Contraintes                      |
|----------------|--------------|----------------------------------|
| Nom_du_cheval  | VARCHAR(50)  | PRIMARY KEY                      |
| Type_de_courses| VARCHAR(50)  | FOREIGN KEY(Type_de_courses)     |

## Partant
| Colonne                   | Type         | Contraintes                                  |
|---------------------------|--------------|----------------------------------------------|
| Nombre_de_partant         | COUNTER      | PRIMARY KEY                                  |
| Couleur_du_proprietaire   | VARCHAR(50)  |                                              |
| Nom_du_pere_et_mere_du_cheval | VARCHAR(50)  |                                          |
| Place_a_la_corde          | VARCHAR(50)  |                                              |
| Handicap                  | VARCHAR(50)  |                                              |
| Gains                     | DECIMAL(15,2)|                                              |
| Nom_Joker_Driver          | INT          | FOREIGN KEY(Nom_Joker_Driver)                |
| Nom_entraineur            | VARCHAR(50)  | FOREIGN KEY(Nom_entraineur)                  |
| Nom_du_proprietaire       | VARCHAR(50)  | FOREIGN KEY(Nom_du_proprietaire)             |
| Nom_du_cheval             | VARCHAR(50)  | FOREIGN KEY(Nom_du_cheval)                   |

## Course
| Colonne               | Type         | Contraintes                                  |
|-----------------------|--------------|----------------------------------------------|
| Numero_de_la_course   | VARCHAR(50)  | PRIMARY KEY                                  |
| Prix_pour_le_gagnant  | DECIMAL(10,2)|                                              |
| Distance              | DECIMAL(15,2)| FOREIGN KEY(Distance)                        |
| Nom_epreuve           | VARCHAR(50)  | FOREIGN KEY(Nom_epreuve)                     |
| Type_de_courses       | VARCHAR(50)  | FOREIGN KEY(Type_de_courses)                 |
| Nombre_de_partant     | INT          | FOREIGN KEY(Nombre_de_partant)               |
| date_heure_du_depart  | DATETIME     | FOREIGN KEY(date_heure_du_depart)            |

## monte
| Colonne               | Type         | Contraintes                                  |
|-----------------------|--------------|----------------------------------------------|
| Nom_Joker_Driver      | INT          | PRIMARY KEY                                  |
| date_heure_du_depart  | DATETIME     | PRIMARY KEY                                  |


CREATE TABLE Joker_Driver(
   Nom_Joker_Driver COUNTER,
   PRIMARY KEY(Nom_Joker_Driver)
);

CREATE TABLE Reunion_de_courses(
   date_heure_du_depart DATETIME,
   PRIMARY KEY(date_heure_du_depart)
);

CREATE TABLE Proprietaire(
   Nom_du_proprietaire VARCHAR(50),
   PRIMARY KEY(Nom_du_proprietaire)
);

CREATE TABLE Entraineur(
   Nom_entraineur VARCHAR(50),
   PRIMARY KEY(Nom_entraineur)
);

CREATE TABLE Type_de_courses(
   Type_de_courses VARCHAR(50),
   PRIMARY KEY(Type_de_courses)
);

CREATE TABLE Epreuve(
   Nom_epreuve VARCHAR(50),
   PRIMARY KEY(Nom_epreuve)
);

CREATE TABLE Champ_de_courses(
   Distance DECIMAL(15,2),
   PRIMARY KEY(Distance)
);

CREATE TABLE Chevaux(
   Nom_du_cheval VARCHAR(50),
   Type_de_courses VARCHAR(50),
   PRIMARY KEY(Nom_du_cheval),
   FOREIGN KEY(Type_de_courses) REFERENCES Type_de_courses(Type_de_courses)
);

CREATE TABLE Partant(
   Nombre_de_partant COUNTER,
   Couleur_du_proprietaire VARCHAR(50),
   Nom_du_pere_et_mere_du_cheval VARCHAR(50),
   Place_a_la_corde VARCHAR(50),
   Handicap VARCHAR(50),
   Gains DECIMAL(15,2),
   Nom_Joker_Driver INT,
   Nom_entraineur VARCHAR(50),
   Nom_du_proprietaire VARCHAR(50),
   Nom_du_cheval VARCHAR(50),
   PRIMARY KEY(Nombre_de_partant),
   FOREIGN KEY(Nom_Joker_Driver) REFERENCES Joker_Driver(Nom_Joker_Driver),
   FOREIGN KEY(Nom_entraineur) REFERENCES Entraineur(Nom_entraineur),
   FOREIGN KEY(Nom_du_proprietaire) REFERENCES Proprietaire(Nom_du_proprietaire),
   FOREIGN KEY(Nom_du_cheval) REFERENCES Chevaux(Nom_du_cheval)
);

CREATE TABLE Course(
   Numero_de_la_course VARCHAR(50),
   Prix_pour_le_gagnant DECIMAL(10,2),
   Distance DECIMAL(15,2),
   Nom_epreuve VARCHAR(50),
   Type_de_courses VARCHAR(50),
   Nombre_de_partant INT,
   date_heure_du_depart DATETIME,
   PRIMARY KEY(Numero_de_la_course),
   FOREIGN KEY(Distance) REFERENCES Champ_de_courses(Distance),
   FOREIGN KEY(Nom_epreuve) REFERENCES Epreuve(Nom_epreuve),
   FOREIGN KEY(Type_de_courses) REFERENCES Type_de_courses(Type_de_courses),
   FOREIGN KEY(Nombre_de_partant) REFERENCES Partant(Nombre_de_partant),
   FOREIGN KEY(date_heure_du_depart) REFERENCES Reunion_de_courses(date_heure_du_depart)
);

CREATE TABLE monte(
   Nom_Joker_Driver INT,
   date_heure_du_depart DATETIME,
   PRIMARY KEY(Nom_Joker_Driver, date_heure_du_depart),
   FOREIGN KEY(Nom_Joker_Driver) REFERENCES Joker_Driver(Nom_Joker_Driver),
   FOREIGN KEY(date_heure_du_depart) REFERENCES Reunion_de_courses(date_heure_du_depart)
);
