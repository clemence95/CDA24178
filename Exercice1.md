## Dictionnaire de données 

**Personne** 
-per num: INT (clé primaire) PK
-per_nom : VARCHAR(50) (NOT NULL)
-per_prenom VARCHAR(50) (NOT NULL)
-per_adresse VARCHAR(100) (NOT NULL)
-per_ville VACHAR(50) (NOT NULL)

**Appartient**
-per num : entier (clé étrangère) FK
-gro num : entier (clé étrangère) FK

**Groupe** 
gro num : INT (clé primaire) PK
gro_libelle : VARCHAR(50) (NOT NULL)


-- Table Personne    1
CREATE TABLE Personne (
    per_num INT PRIMARY KEY,
    per_nom VARCHAR(50) NOT NULL,
    per_prenom VARCHAR(50) NOT NULL,
    per_adresse VARCHAR(100) NOT NULL,
    per_ville VARCHAR(50) NOT NULL
);

-- Table Appartient    3
CREATE TABLE Appartient (
    per_num INT,
    gro_num INT,
    FOREIGN KEY (per_num) REFERENCES Personne(per_num),
    FOREIGN KEY (gro_num) REFERENCES Groupe(gro_num)
);

-- Table Groupe   2
CREATE TABLE Groupe (
    gro_num INT PRIMARY KEY,
    gro_libelle VARCHAR(50) NOT NULL
);