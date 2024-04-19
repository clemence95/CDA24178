CREATE TABLE Cheval(
   Numero_d_enregistrement__identifiant_ COUNTER,
   Date_de_naissance DATE,
   ID_de_la_mere VARCHAR(50),
   Race VARCHAR(50),
   Couleur VARCHAR(50),
   Sexe VARCHAR(50),
   Lieu_de_naissance VARCHAR(50),
   PRIMARY KEY(Numero_d_enregistrement__identifiant_)
);

CREATE TABLE Proprietaire(
   Numéro_de_proprietaire__identifiant_ COUNTER,
   Nom VARCHAR(50),
   Prenom VARCHAR(50),
   adresse_1 VARCHAR(50),
   adresse_2_ VARCHAR(50),
   adresse_3_ VARCHAR(50),
   Telephone VARCHAR(50),
   PRIMARY KEY(Numéro_de_proprietaire__identifiant_)
);

CREATE TABLE Entraineur(
   Numero_d_entraineur__identifiant_ COUNTER,
   Nom VARCHAR(50),
   Prenom VARCHAR(50),
   Adresse_1 VARCHAR(50),
   Adresse_2 VARCHAR(50),
   Adresse_3_ VARCHAR(50),
   Telephone VARCHAR(50),
   PRIMARY KEY(Numero_d_entraineur__identifiant_)
);

CREATE TABLE Veterinaire(
   Numero_de_veterinaire__Idantifiant_ COUNTER,
   Nom VARCHAR(50),
   Prenom VARCHAR(50),
   Telephone VARCHAR(50),
   Adresse_1 VARCHAR(50),
   Adresse_2 VARCHAR(50),
   Adresse_3 VARCHAR(50),
   PRIMARY KEY(Numero_de_veterinaire__Idantifiant_)
);

CREATE TABLE Possede(
   Numero_d_enregistrement__identifiant_ INT,
   Numéro_de_proprietaire__identifiant_ INT,
   PRIMARY KEY(Numero_d_enregistrement__identifiant_, Numéro_de_proprietaire__identifiant_),
   FOREIGN KEY(Numero_d_enregistrement__identifiant_) REFERENCES Cheval(Numero_d_enregistrement__identifiant_),
   FOREIGN KEY(Numéro_de_proprietaire__identifiant_) REFERENCES Proprietaire(Numéro_de_proprietaire__identifiant_)
);

CREATE TABLE Entraine(
   Numero_d_enregistrement__identifiant_ INT,
   Numero_d_entraineur__identifiant_ INT,
   PRIMARY KEY(Numero_d_enregistrement__identifiant_, Numero_d_entraineur__identifiant_),
   FOREIGN KEY(Numero_d_enregistrement__identifiant_) REFERENCES Cheval(Numero_d_enregistrement__identifiant_),
   FOREIGN KEY(Numero_d_entraineur__identifiant_) REFERENCES Entraineur(Numero_d_entraineur__identifiant_)
);

CREATE TABLE Suit(
   Numero_d_enregistrement__identifiant_ INT,
   Numero_de_veterinaire__Idantifiant_ INT,
   PRIMARY KEY(Numero_d_enregistrement__identifiant_, Numero_de_veterinaire__Idantifiant_),
   FOREIGN KEY(Numero_d_enregistrement__identifiant_) REFERENCES Cheval(Numero_d_enregistrement__identifiant_),
   FOREIGN KEY(Numero_de_veterinaire__Idantifiant_) REFERENCES Veterinaire(Numero_de_veterinaire__Idantifiant_)
);

| Tables               | Attributs                                | Type de données    | Contraintes                           |
|----------------------|------------------------------------------|--------------------|---------------------------------------|
| Cheval               | Numero_d_enregistrement__identifiant_    | Auto-incrément INT | PRIMARY KEY                          |
|                      | Date_de_naissance                        | DATE               |                                     |
|                      | ID_de_la_mere                            | VARCHAR(50)        |                                     |
|                      | Race                                     | VARCHAR(50)        |                                     |
|                      | Couleur                                  | VARCHAR(50)        |                                     |
|                      | Sexe                                     | VARCHAR(50)        |                                     |
|                      | Lieu_de_naissance                        | VARCHAR(50)        |                                     |

| Proprietaire         | Numéro_de_proprietaire__identifiant_     | Auto-incrément INT | PRIMARY KEY                          |
|                      | Nom                                      | VARCHAR(50)        |                                     |
|                      | Prenom                                   | VARCHAR(50)        |                                     |
|                      | adresse_1                                | VARCHAR(50)        |                                     |
|                      | adresse_2_                               | VARCHAR(50)        |                                     |
|                      | adresse_3_                               | VARCHAR(50)        |                                     |
|                      | Telephone                                | VARCHAR(50)        |                                     |

| Entraineur           | Numero_d_entraineur__identifiant_        | Auto-incrément INT | PRIMARY KEY                          |
|                      | Nom                                      | VARCHAR(50)        |                                     |
|                      | Prenom                                   | VARCHAR(50)        |                                     |
|                      | Adresse_1                                | VARCHAR(50)        |                                     |
|                      | Adresse_2                                | VARCHAR(50)        |                                     |
|                      | Adresse_3_                               | VARCHAR(50)        |                                     |
|                      | Telephone                                | VARCHAR(50)        |                                     |

| Veterinaire          | Numero_de_veterinaire__Idantifiant_      | Auto-incrément INT | PRIMARY KEY                          |
|                      | Nom                                      | VARCHAR(50)        |                                     |
|                      | Prenom                                   | VARCHAR(50)        |                                     |
|                      | Telephone                                | VARCHAR(50)        |                                     |
|                      | Adresse_1                                | VARCHAR(50)        |                                     |
|                      | Adresse_2                                | VARCHAR(50)        |                                     |
|                      | Adresse_3                                | VARCHAR(50)        |                                     |

| Possede              | Numero_d_enregistrement__identifiant_    | INT                | PRIMARY KEY, FOREIGN KEY REFERENCES Cheval(Numero_d_enregistrement__identifiant_) |
|                      | Numéro_de_proprietaire__identifiant_     | INT                | PRIMARY KEY, FOREIGN KEY REFERENCES Proprietaire(Numéro_de_proprietaire__identifiant_) |

| Entraine             | Numero_d_enregistrement__identifiant_    | INT                | PRIMARY KEY, FOREIGN KEY REFERENCES Cheval(Numero_d_enregistrement__identifiant_) |
|                      | Numero_d_entraineur__identifiant_        | INT                | PRIMARY KEY, FOREIGN KEY REFERENCES Entraineur(Numero_d_entraineur__identifiant_) |

| Suit                 | Numero_d_enregistrement__identifiant_    | INT                | PRIMARY KEY, FOREIGN KEY REFERENCES Cheval(Numero_d_enregistrement__identifiant_) |
|                      | Numero_de_veterinaire__Idantifiant_      | INT                | PRIMARY KEY, FOREIGN KEY REFERENCES Veterinaire(Numero_de_veterinaire__Idantifiant_) |
