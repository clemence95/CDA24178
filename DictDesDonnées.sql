-- Création de la table Plage
CREATE TABLE Plage (
    nomPlage VARCHAR(255),
    longueurKm DECIMAL(10,2),
    natureTerrain VARCHAR(255),
    codePostalVille VARCHAR(10),
    PRIMARY KEY (nomPlage),
    FOREIGN KEY (codePostalVille) REFERENCES Ville(codePostal)
);

-- Création de la table Ville
CREATE TABLE Ville (
    codePostal VARCHAR(10),
    nbTouristesAnnuels INT,
    PRIMARY KEY (codePostal)
);

-- Création de la table Departement
CREATE TABLE Departement (
    nomDepartement VARCHAR(100),
    PRIMARY KEY (nomDepartement)
);

-- Création de la table Region
CREATE TABLE Region (
    nomResponsable VARCHAR(255),
    PRIMARY KEY (nomResponsable)
);

| Entité       | Attributs                              | Type MySQL                             | Contraintes                           | Associations            |
|--------------|----------------------------------------|----------------------------------------|---------------------------------------|-------------------------|
| Plage        | nomPlage, longueurKm, natureTerrain    | VARCHAR(255), DECIMAL(10,2), VARCHAR(255) | longueurKm >= 0                      | Appartient à une ville |
|              | codePostalVille                        | VARCHAR(10)                            |                                       |                         |
| Ville        | codePostal, nbTouristesAnnuels        | VARCHAR(10), INT                       | nbTouristesAnnuels >= 0               | Possède des plages     |
| Département  | nomDepartement                        | VARCHAR(100)                           |                                       | Contient des villes    |
| Région       | nomResponsable                        | VARCHAR(255)                           |                                       |                         |
