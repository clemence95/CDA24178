# Database Schema

## Tables

### Manche
- **Numero_manche**: Counter (Primary Key)
- **temps**: Decimal(15,2)
- **Nb_point**: Decimal(15,2)
- **place**: Varchar(50)
- **medaille**: Varchar(50)

### Pays
- **Id_Pays**: Counter (Primary Key)
- **Nom_codifie**: Varchar(50)

### Responsable
- **matricule**: Counter (Primary Key)
- **Nom**: Varchar(50)
- **role**: Varchar(50)
- **prenom**: Varchar(50)
- **email**: Varchar(50)
- **adresse**: Varchar(50)
- **telephone**: Decimal(15,2)
- **matricule_1**: Int (Foreign Key referencing Responsable(matricule))

### Epreuve
- **Id_Epreuve**: Counter (Primary Key)
- **Nom**: Varchar(50)
- **Code_alphabétique**: Varchar(1)
- **genre**: Varchar(1)
- **Numero_manche**: Int (Foreign Key referencing Manche(Numero_manche))

### Station
- **Id_Station**: Counter (Primary Key)
- **Nom**: Varchar(50)
- **Altitude**: Varchar(50)
- **Id_Epreuve**: Int (Foreign Key referencing Epreuve(Id_Epreuve))

### type_epreuve
- **Id_type_epreuve**: Counter (Primary Key)
- **Nom**: Varchar(50)
- **Id_Station**: Int (Foreign Key referencing Station(Id_Station))
- **Id_Epreuve**: Int (Unique, Foreign Key referencing Epreuve(Id_Epreuve))

### Discipline
- **Id_Discipline**: Counter (Primary Key)
- **Nom**: Varchar(50)
- **Id_Epreuve**: Int (Unique, Foreign Key referencing Epreuve(Id_Epreuve))

### Conccurent
- **numeros_inscription**: Varchar(50) (Primary Key)
- **Nom**: Varchar(50)
- **genre**: Varchar(1)
- **code_postal**: Decimal(15,2)
- **adresse**: Varchar(50)
- **telephone**: Decimal(15,2)
- **Id_Discipline**: Int (Foreign Key referencing Discipline(Id_Discipline))
- **Id_Pays**: Int (Unique, Foreign Key referencing Pays(Id_Pays))

### Dossart
- **numero_de_dossart**: Varchar(50) (Primary Key)
- **Id_Epreuve**: Int (Unique, Foreign Key referencing Epreuve(Id_Epreuve))
- **Numero_manche**: Int (Foreign Key referencing Manche(Numero_manche))

### Organise
- **Id_Epreuve**: Int
- **matricule**: Int
- Primary Key: (Id_Epreuve, matricule)
- Foreign Key: Id_Epreuve (references Epreuve(Id_Epreuve))
- Foreign Key: matricule (references Responsable(matricule))

### Participe
- **Id_Epreuve**: Int
- **numeros_inscription**: Varchar(50)
- Primary Key: (Id_Epreuve, numeros_inscription)
- Foreign Key: Id_Epreuve (references Epreuve(Id_Epreuve))
- Foreign Key: numeros_inscription (references Conccurent(numeros_inscription))

CREATE TABLE Manche(
   Numero_manche COUNTER,
   temps DECIMAL(15,2),
   Nb_point DECIMAL(15,2),
   place VARCHAR(50),
   medaille VARCHAR(50),
   PRIMARY KEY(Numero_manche)
);

CREATE TABLE Pays(
   Id_Pays COUNTER,
   Nom_codifie VARCHAR(50),
   PRIMARY KEY(Id_Pays)
);

CREATE TABLE Responsable(
   matricule COUNTER,
   Nom VARCHAR(50),
   role VARCHAR(50),
   prenom VARCHAR(50),
   email VARCHAR(50),
   adresse VARCHAR(50),
   telephone DECIMAL(15,2),
   matricule_1 INT,
   PRIMARY KEY(matricule),
   FOREIGN KEY(matricule_1) REFERENCES Responsable(matricule)
);

CREATE TABLE Epreuve(
   Id_Epreuve COUNTER,
   Nom VARCHAR(50),
   Code_alphabétique VARCHAR(1),
   genre VARCHAR(1),
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
   genre VARCHAR(1),
   code_postal DECIMAL(15,2),
   adresse VARCHAR(50),
   telephone DECIMAL(15,2),
   Id_Discipline INT,
   Id_Pays INT,
   PRIMARY KEY(numeros_inscription),
   UNIQUE(Id_Pays),
   FOREIGN KEY(Id_Discipline) REFERENCES Discipline(Id_Discipline),
   FOREIGN KEY(Id_Pays) REFERENCES Pays(Id_Pays)
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

CREATE TABLE Organise(
   Id_Epreuve INT,
   matricule INT,
   PRIMARY KEY(Id_Epreuve, matricule),
   FOREIGN KEY(Id_Epreuve) REFERENCES Epreuve(Id_Epreuve),
   FOREIGN KEY(matricule) REFERENCES Responsable(matricule)
);

CREATE TABLE Participe(
   Id_Epreuve INT,
   numeros_inscription VARCHAR(50),
   PRIMARY KEY(Id_Epreuve, numeros_inscription),
   FOREIGN KEY(Id_Epreuve) REFERENCES Epreuve(Id_Epreuve),
   FOREIGN KEY(numeros_inscription) REFERENCES Conccurent(numeros_inscription)
);



