# Dictionnaire de Données

## Responsable
- **reponsable**: VARCHAR(50) (Clé primaire)
- **Nom**: VARCHAR(50)

## Manche
- **Numero_manche**: COUNTER (Clé primaire)
- **temps**: DECIMAL(15,2)
- **Nb_point**: DECIMAL(15,2)
- **place**: VARCHAR(50)
- **medaille**: VARCHAR(50)

## Responsable_de_discipline
- **Id_Responsable_de_discipline**: COUNTER (Clé primaire)
- **Nom**: VARCHAR(50)

## Personne_de_base
- **Id_Personne_de_base**: COUNTER (Clé primaire)
- **Nom**: VARCHAR(50)

## Epreuve
- **Id_Epreuve**: COUNTER (Clé primaire)
- **Nom**: VARCHAR(50)
- **Code_alphabétique**: LOGICAL
- **H_F**: VARCHAR(1)
- **Numero_manche**: INT (Clé étrangère référençant Manche(Numero_manche))

## Station
- **Id_Station**: COUNTER (Clé primaire)
- **Nom**: VARCHAR(50)
- **Altitude**: VARCHAR(50)
- **Id_Epreuve**: INT (Unique) (Clé étrangère référençant Epreuve(Id_Epreuve))

## type_epreuve
- **Id_type_epreuve**: COUNTER (Clé primaire)
- **Nom**: VARCHAR(50)
- **Id_Station**: INT (Unique) (Clé étrangère référençant Station(Id_Station))
- **Id_Epreuve**: INT (Unique) (Clé étrangère référençant Epreuve(Id_Epreuve))

## Discipline
- **Id_Discipline**: COUNTER (Clé primaire)
- **Nom**: VARCHAR(50)
- **Id_Epreuve**: INT (Unique) (Clé étrangère référençant Epreuve(Id_Epreuve))

## Conccurent
- **numeros_inscription**: VARCHAR(50) (Clé primaire)
- **Nom**: VARCHAR(50)
- **H_F**: VARCHAR(1)
- **code_postal**: DECIMAL(15,2)
- **adresse**: VARCHAR(50)
- **telephone**: DECIMAL(15,2)
- **Id_Discipline**: INT (Clé étrangère référençant Discipline(Id_Discipline))

## Pays
- **Id_Pays**: COUNTER (Clé primaire)
- **Nom**: VARCHAR(50)
- **numeros_inscription**: VARCHAR(50) (Unique) (Clé étrangère référençant Conccurent(numeros_inscription))

## Dossart
- **numero_de_dossart**: VARCHAR(50) (Clé primaire)
- **Id_Epreuve**: INT (Unique)
- **Numero_manche**: INT
- (Clés étrangères: Id_Epreuve référençant Epreuve(Id_Epreuve), Numero_manche référençant Manche(Numero_manche))

## responsable_general
- **Id_responsable_general**: COUNTER (Clé primaire)
- **Nom**: VARCHAR(50)
- **Id_Responsable_de_discipline**: INT (Clé étrangère référençant Responsable_de_discipline(Id_Responsable_de_discipline))

## Organise
- **reponsable**: VARCHAR(50)
- **Id_Epreuve**: INT
- **Id_responsable_general**: INT
- **Id_Responsable_de_discipline**: INT
- **Id_Personne_de_base**: INT
- **numero_matricule**: VARCHAR(50) (Unique)
- **Nom_**: VARCHAR(50)
- **role**: VARCHAR(50)
- **telephone**: VARCHAR(50)
- (Clés primaires: responsable, Id_Epreuve, Id_responsable_general, Id_Responsable_de_discipline, Id_Personne_de_base)
- (Clés étrangères: 
  - responsable référençant Responsable(reponsable),
  - Id_Epreuve référençant Epreuve(Id_Epreuve),
  - Id_responsable_general référençant responsable_general(Id_responsable_general),
  - Id_Responsable_de_discipline référençant Responsable_de_discipline(Id_Responsable_de_discipline),
  - Id_Personne_de_base référençant Personne_de_base(Id_Personne_de_base))

## Participe
- **Id_Epreuve**: INT
- **numeros_inscription**: VARCHAR(50)
- (Clés primaires: Id_Epreuve, numeros_inscription)
- (Clés étrangères: Id_Epreuve référençant Epreuve(Id_Epreuve), numeros_inscription référençant Conccurent(numeros_inscription))

## supervise
- **reponsable**: VARCHAR(50)
- **Id_Responsable_de_discipline**: INT
- (Clé primaire: responsable, Id_Responsable_de_discipline)
- (Clés étrangères: 
  - responsable référençant Responsable(reponsable),
  - Id_Responsable_de_discipline référençant Responsable_de_discipline(Id_Responsable_de_discipline))

## affiliation
- **reponsable**: VARCHAR(50)
- **Id_Personne_de_base**: INT
- (Clé primaire: responsable, Id_Personne_de_base)
- (Clés étrangères: 
  - responsable référençant Responsable(reponsable),
  - Id_Personne_de_base référençant Personne_de_base(Id_Personne_de_base))


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
   UNIQUE(Id_Epreuve),
   FOREIGN KEY(Id_Epreuve) REFERENCES Epreuve(Id_Epreuve)
);

CREATE TABLE type_epreuve(
   Id_type_epreuve COUNTER,
   Nom VARCHAR(50),
   Id_Station INT,
   Id_Epreuve INT,
   PRIMARY KEY(Id_type_epreuve),
   UNIQUE(Id_Station),
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
