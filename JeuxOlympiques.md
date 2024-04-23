### Table `Responsable`
| Colonne    | Type        | Description                            |
|------------|-------------|----------------------------------------|
| responsable | VARCHAR(50) | Identifiant du responsable             |
| Nom        | VARCHAR(50) | Nom du responsable                     |

### Table `Manche`
| Colonne      | Type          | Description                            |
|--------------|---------------|----------------------------------------|
| Numero_manche | COUNTER       | Identifiant de la manche               |
| temps        | DECIMAL(15,2) | Temps de la manche                     |
| Nb_point     | DECIMAL(15,2) | Nombre de points de la manche          |
| place        | VARCHAR(50)   | Place obtenue dans la manche           |
| medaille     | VARCHAR(50)   | Médaille obtenue dans la manche        |

### Table `Responsable_de_discipline`
| Colonne                     | Type          | Description                            |
|-----------------------------|---------------|----------------------------------------|
| Id_Responsable_de_discipline | COUNTER       | Identifiant du responsable de discipline |
| Nom                         | VARCHAR(50)   | Nom du responsable de discipline       |

### Table `Personne_de_base`
| Colonne           | Type          | Description                            |
|-------------------|---------------|----------------------------------------|
| Id_Personne_de_base | COUNTER       | Identifiant de la personne de base     |
| Nom               | VARCHAR(50)   | Nom de la personne de base             |

### Table `Epreuve`
| Colonne     | Type          | Description                            |
|-------------|---------------|----------------------------------------|
| Id_Epreuve  | COUNTER       | Identifiant de l'épreuve               |
| Nom         | VARCHAR(50)   | Nom de l'épreuve                       |
| Code_alphabétique | LOGICAL | Code alphabétique de l'épreuve      |
| H_F         | VARCHAR(1)    | Genre de l'épreuve (Homme/Femme)       |
| Numero_manche | INT          | Numéro de la manche associée à l'épreuve |

### Table `Station`
| Colonne    | Type          | Description                            |
|------------|---------------|----------------------------------------|
| Id_Station | COUNTER       | Identifiant de la station              |
| Nom        | VARCHAR(50)   | Nom de la station                      |
| Altitude   | VARCHAR(50)   | Altitude de la station                 |
| Id_Epreuve | INT           | Identifiant de l'épreuve associée à la station |

### Table `type_epreuve`
| Colonne       | Type          | Description                            |
|---------------|---------------|----------------------------------------|
| Id_type_epreuve | COUNTER     | Identifiant du type d'épreuve          |
| Nom           | VARCHAR(50)   | Nom du type d'épreuve                  |
| Id_Station    | INT           | Identifiant de la station associée au type d'épreuve |
| Id_Epreuve    | INT           | Identifiant de l'épreuve associée au type d'épreuve |

### Table `Discipline`
| Colonne       | Type          | Description                            |
|---------------|---------------|----------------------------------------|
| Id_Discipline | COUNTER       | Identifiant de la discipline           |
| Nom           | VARCHAR(50)   | Nom de la discipline                   |
| Id_Epreuve    | INT           | Identifiant de l'épreuve associée à la discipline |

### Table `Conccurent`
| Colonne            | Type          | Description                            |
|--------------------|---------------|----------------------------------------|
| numeros_inscription | VARCHAR(50)  | Numéro d'inscription du concurrent     |
| Nom                | VARCHAR(50)   | Nom du concurrent                      |
| H_F                | VARCHAR(1)    | Genre du concurrent (Homme/Femme)      |
| code_postal        | DECIMAL(15,2) | Code postal du concurrent              |
| adresse            | VARCHAR(50)   | Adresse du concurrent                  |
| telephone          | DECIMAL(15,2) | Numéro de téléphone du concurrent      |
| Id_Discipline      | INT           | Identifiant de la discipline associée au concurrent |

### Table `Pays`
| Colonne           | Type          | Description                            |
|-------------------|---------------|----------------------------------------|
| Id_Pays           | COUNTER       | Identifiant du pays                    |
| Nom_codifie      | VARCHAR(50)   | Nom codifié du pays                    |
| numeros_inscription | VARCHAR(50) | Numéro d'inscription du pays           |

### Table `Dossart`
| Colonne           | Type          | Description                            |
|-------------------|---------------|----------------------------------------|
| numero_de_dossart | VARCHAR(50)   | Numéro du dossard                      |
| Id_Epreuve        | INT           | Identifiant de l'épreuve associée au dossard |
| Numero_manche     | INT           | Numéro de la manche associée au dossard |

### Table `responsable_general`
| Colonne                    | Type          | Description                            |
|----------------------------|---------------|----------------------------------------|
| Id_responsable_general     | COUNTER       | Identifiant du responsable général     |
| Nom                        | VARCHAR(50)   | Nom du responsable général             |
| Id_Responsable_de_discipline | INT         | Identifiant du responsable de discipline associé au responsable général |

### Table `Organise`
| Colonne                    | Type          | Description                            |
|----------------------------|---------------|----------------------------------------|
| Id_responsable_general     | INT           | Identifiant du responsable général     |
| numero_matricule           | VARCHAR(50)   | Numéro matricule de l'organisateur     |
| Nom_                       | VARCHAR(50)   | Nom de l'organisateur                  |
| role                       | VARCHAR(50)   | Rôle de l'organisateur                 |
| telephone                  | VARCHAR(50)   | Numéro de téléphone de l'organisateur  |
| reponsable                 | VARCHAR(50)   | Identifiant du responsable             |
| Id_Epreuve                 | INT           | Identifiant de l'épreuve               |
| Id_Responsable_de_discipline | INT         | Identifiant du responsable de discipline |
| Id_Personne_de_base        | INT           | Identifiant de la personne de base     |

### Table `Participe`
| Colonne             | Type          | Description                            |
|---------------------|---------------|----------------------------------------|
| Id_Epreuve          | INT           | Identifiant de l'épreuve               |
| numeros_inscription | VARCHAR(50)   | Numéro d'inscription du concurrent     |

### Table `supervise`
| Colonne                    | Type          | Description                            |
|----------------------------|---------------|----------------------------------------|
| reponsable                 | VARCHAR(50)   | Identifiant du responsable             |
| Id_Responsable_de_discipline | INT         | Identifiant du responsable de discipline |

### Table `affiliation`
| Colonne                    | Type          | Description                            |
|----------------------------|---------------|----------------------------------------|
| reponsable                 | VARCHAR(50)   | Identifiant du responsable             |
| Id_Personne_de_base        | INT           | Identifiant de la personne de base     |


CREATE TABLE Responsable(
   reponsable VARCHAR(50),
   Nom VARCHAR(50),
   PRIMARY KEY(reponsable)
);

CREATE TABLE Manche(
   Numero_manche COUNTER,
   temps DECIMAL(15,2),
   Nb_point DECIMAL(15,2),
   place VARCHAR(50),
   medaille VARCHAR(50),
   PRIMARY KEY(Numero_manche)
);

CREATE TABLE Responsable_de_discipline(
   Id_Responsable_de_discipline COUNTER,
   Nom VARCHAR(50),
   PRIMARY KEY(Id_Responsable_de_discipline)
);

CREATE TABLE Personne_de_base(
   Id_Personne_de_base COUNTER,
   Nom VARCHAR(50),
   PRIMARY KEY(Id_Personne_de_base)
);

CREATE TABLE Epreuve(
   Id_Epreuve COUNTER,
   Nom VARCHAR(50),
   Code_alphabétique LOGICAL,
   H_F VARCHAR(1),
   Numero_manche INT,
   PRIMARY KEY(Id_Epreuve),
   FOREIGN KEY(Numero_manche) REFERENCES Manche(Numero_manche)
);

CREATE TABLE Station(
   Id_Station COUNTER,
   Nom VARCHAR(50),
   Altitude VARCHAR(50),
   Id_Epreuve INT,
   PRIMARY KEY(Id_Station),
   FOREIGN KEY(Id_Epreuve) REFERENCES Epreuve(Id_Epreuve)
);

CREATE TABLE type_epreuve(
   Id_type_epreuve COUNTER,
   Nom VARCHAR(50),
   Id_Station INT,
   Id_Epreuve INT,
   PRIMARY KEY(Id_type_epreuve),
   UNIQUE(Id_Epreuve),
   FOREIGN KEY(Id_Station) REFERENCES Station(Id_Station),
   FOREIGN KEY(Id_Epreuve) REFERENCES Epreuve(Id_Epreuve)
);

CREATE TABLE Discipline(
   Id_Discipline COUNTER,
   Nom VARCHAR(50),
   Id_Epreuve INT,
   PRIMARY KEY(Id_Discipline),
   UNIQUE(Id_Epreuve),
   FOREIGN KEY(Id_Epreuve) REFERENCES Epreuve(Id_Epreuve)
);

CREATE TABLE Conccurent(
   numeros_inscription VARCHAR(50),
   Nom VARCHAR(50),
   H_F VARCHAR(1),
   code_postal DECIMAL(15,2),
   adresse VARCHAR(50),
   telephone DECIMAL(15,2),
   Id_Discipline INT,
   PRIMARY KEY(numeros_inscription),
   FOREIGN KEY(Id_Discipline) REFERENCES Discipline(Id_Discipline)
);

CREATE TABLE Pays(
   Id_Pays COUNTER,
   Nom_codifie VARCHAR(50),
   numeros_inscription VARCHAR(50),
   PRIMARY KEY(Id_Pays),
   UNIQUE(numeros_inscription),
   FOREIGN KEY(numeros_inscription) REFERENCES Conccurent(numeros_inscription)
);

CREATE TABLE Dossart(
   numero_de_dossart VARCHAR(50),
   Id_Epreuve INT,
   Numero_manche INT,
   PRIMARY KEY(numero_de_dossart),
   UNIQUE(Id_Epreuve),
   FOREIGN KEY(Id_Epreuve) REFERENCES Epreuve(Id_Epreuve),
   FOREIGN KEY(Numero_manche) REFERENCES Manche(Numero_manche)
);

CREATE TABLE responsable_general(
   Id_responsable_general COUNTER,
   Nom VARCHAR(50),
   Id_Responsable_de_discipline INT,
   PRIMARY KEY(Id_responsable_general),
   FOREIGN KEY(Id_Responsable_de_discipline) REFERENCES Responsable_de_discipline(Id_Responsable_de_discipline)
);

CREATE TABLE Organise(
   Id_responsable_general INT,
   numero_matricule VARCHAR(50),
   Nom_ VARCHAR(50),
   role VARCHAR(50),
   telephone VARCHAR(50),
   reponsable VARCHAR(50) NOT NULL,
   Id_Epreuve INT NOT NULL,
   Id_Responsable_de_discipline INT NOT NULL,
   Id_Personne_de_base INT NOT NULL,
   PRIMARY KEY(Id_responsable_general),
   UNIQUE(numero_matricule),
   FOREIGN KEY(Id_responsable_general) REFERENCES responsable_general(Id_responsable_general),
   FOREIGN KEY(reponsable) REFERENCES Responsable(reponsable),
   FOREIGN KEY(Id_Epreuve) REFERENCES Epreuve(Id_Epreuve),
   FOREIGN KEY(Id_Responsable_de_discipline) REFERENCES Responsable_de_discipline(Id_Responsable_de_discipline),
   FOREIGN KEY(Id_Personne_de_base) REFERENCES Personne_de_base(Id_Personne_de_base)
);

CREATE TABLE Participe(
   Id_Epreuve INT,
   numeros_inscription VARCHAR(50),
   PRIMARY KEY(Id_Epreuve, numeros_inscription),
   FOREIGN KEY(Id_Epreuve) REFERENCES Epreuve(Id_Epreuve),
   FOREIGN KEY(numeros_inscription) REFERENCES Conccurent(numeros_inscription)
);

CREATE TABLE supervise(
   reponsable VARCHAR(50),
   Id_Responsable_de_discipline INT,
   PRIMARY KEY(reponsable, Id_Responsable_de_discipline),
   FOREIGN KEY(reponsable) REFERENCES Responsable(reponsable),
   FOREIGN KEY(Id_Responsable_de_discipline) REFERENCES Responsable_de_discipline(Id_Responsable_de_discipline)
);

CREATE TABLE affiliation(
   reponsable VARCHAR(50),
   Id_Personne_de_base INT,
   PRIMARY KEY(reponsable, Id_Personne_de_base),
   FOREIGN KEY(reponsable) REFERENCES Responsable(reponsable),
   FOREIGN KEY(Id_Personne_de_base) REFERENCES Personne_de_base(Id_Personne_de_base)
);
