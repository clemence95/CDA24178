CREATE TABLE Champ_de_courses(
   Nom_du_champ__identifiant_ COUNTER,
   Localisation VARCHAR(50),
   PRIMARY KEY(Nom_du_champ__identifiant_)
);

CREATE TABLE Course(
   Numero_de_course__identifiant_ COUNTER,
   Nombre_de_partants DECIMAL(25,0),
   Prix_pour_le_gagnant VARCHAR(50),
   Distance VARCHAR(50),
   Heure_de_départ TIME,
   Type_de_course__trot__galop__obstacle_ VARCHAR(50),
   Nom_du_champ_de_courses VARCHAR(50),
   Nom_de_l_epreuve VARCHAR(50),
   PRIMARY KEY(Numero_de_course__identifiant_)
);

CREATE TABLE Chevaux(
   Numero_du_cheval__identifiant_ COUNTER,
   Nom_du_cheval VARCHAR(50),
   Nom_du_pere VARCHAR(50),
   Nom_de_la_mere VARCHAR(50),
   Gains_du_cheval VARCHAR(50),
   Nom_du_proprietaire VARCHAR(50),
   Nom_de_l_entraineur VARCHAR(50),
   Nom_du_jockey_Driver VARCHAR(50),
   handicap VARCHAR(50),
   place_à_la_corde DECIMAL(25,0),
   PRIMARY KEY(Numero_du_cheval__identifiant_)
);

CREATE TABLE possede(
   Nom_du_champ__identifiant_ INT,
   Numero_de_course__identifiant_ INT,
   PRIMARY KEY(Nom_du_champ__identifiant_, Numero_de_course__identifiant_),
   FOREIGN KEY(Nom_du_champ__identifiant_) REFERENCES Champ_de_courses(Nom_du_champ__identifiant_),
   FOREIGN KEY(Numero_de_course__identifiant_) REFERENCES Course(Numero_de_course__identifiant_)
);

CREATE TABLE participe(
   Numero_de_course__identifiant_ INT,
   Numero_du_cheval__identifiant_ INT,
   PRIMARY KEY(Numero_de_course__identifiant_, Numero_du_cheval__identifiant_),
   FOREIGN KEY(Numero_de_course__identifiant_) REFERENCES Course(Numero_de_course__identifiant_),
   FOREIGN KEY(Numero_du_cheval__identifiant_) REFERENCES Chevaux(Numero_du_cheval__identifiant_)
);

| Tables               | Attributs                       | Type de données    | Contraintes                           |
|----------------------|---------------------------------|--------------------|---------------------------------------|
| Champ_de_courses     | Nom_du_champ__identifiant_      | Auto-incrément INT | PRIMARY KEY                          |
|                      | Localisation                    | VARCHAR(50)        |                                     |

| Course               | Numero_de_course__identifiant_  | Auto-incrément INT | PRIMARY KEY                          |
|                      | Nombre_de_partants              | DECIMAL(25,0)      |                                     |
|                      | Prix_pour_le_gagnant           | VARCHAR(50)        |                                     |
|                      | Distance                        | VARCHAR(50)        |                                     |
|                      | Heure_de_départ                 | TIME               |                                     |
|                      | Type_de_course__trot__galop__obstacle_ | VARCHAR(50) |                                     |
|                      | Nom_du_champ_de_courses        | VARCHAR(50)        | FOREIGN KEY (Nom_du_champ_de_courses) REFERENCES Champ_de_courses(Nom_du_champ__identifiant_) |
|                      | Nom_de_l_epreuve               | VARCHAR(50)        |                                     |

| Chevaux              | Numero_du_cheval__identifiant_ | Auto-incrément INT | PRIMARY KEY                          |
|                      | Nom_du_cheval                   | VARCHAR(50)       |                                     |
|                      | Nom_du_pere                     | VARCHAR(50)       |                                     |
|                      | Nom_de_la_mere                  | VARCHAR(50)       |                                     |
|                      | Gains_du_cheval                 | VARCHAR(50)       |                                     |
|                      | Nom_du_proprietaire             | VARCHAR(50)       |                                     |
|                      | Nom_de_l_entraineur             | VARCHAR(50)       |                                     |
|                      | Nom_du_jockey_Driver            | VARCHAR(50)       |                                     |
|                      | handicap                        | VARCHAR(50)       |                                     |
|                      | place_à_la_corde                | DECIMAL(25,0)     |                                     |

| possede              | Nom_du_champ__identifiant_     | INT                | PRIMARY KEY, FOREIGN KEY REFERENCES Champ_de_courses(Nom_du_champ__identifiant_) |
|                      | Numero_de_course__identifiant_ | INT                | PRIMARY KEY, FOREIGN KEY REFERENCES Course(Numero_de_course__identifiant_) |

| participe            | Numero_de_course__identifiant_ | INT                | PRIMARY KEY, FOREIGN KEY REFERENCES Course(Numero_de_course__identifiant_) |
|                      | Numero_du_cheval__identifiant_ | INT                | PRIMARY KEY, FOREIGN KEY REFERENCES Chevaux(Numero_du_cheval__identifiant_) |
