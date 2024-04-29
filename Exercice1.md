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