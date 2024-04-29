## Dictionnaire de données 

**Personne** 
-per num: COUNTER (clé primaire) PK
-per_nom : VARCHAR(50) (NOT NULL)
-per_prenom VARCHAR(50) (NOT NULL)
-per_adresse VARCHAR(100) (NOT NULL)
-per_ville VACHAR(50) (NOT NULL)

**Appartient**
-per num : entier (clé étrangère) FK
-gro num : entier (clé étrangère) FK

**Groupe** 
gro num : COUNTER (clé primaire) PK
gro_libelle : VARCHAR(50) (NOT NULL)


-- Table Personne
CREATE TABLE Personne (
    per_num COUNTER PRIMARY KEY,
    per_nom VARCHAR(50) NOT NULL,
    per_prenom VARCHAR(50) NOT NULL,
    per_adresse VARCHAR(100) NOT NULL,
    per_ville VARCHAR(50) NOT NULL
);

-- Table Appartient
CREATE TABLE Appartient (
    per_num INT,
    gro_num INT,
    FOREIGN KEY (per_num) REFERENCES Personne(per_num),
    FOREIGN KEY (gro_num) REFERENCES Groupe(gro_num)
);

-- Table Groupe
CREATE TABLE Groupe (
    gro_num COUNTER PRIMARY KEY,
    gro_libelle VARCHAR(50) NOT NULL
);