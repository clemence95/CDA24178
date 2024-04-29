## Dictionnaire de données

**Hotel**
-num hotel : INT (clé primaire) PK
-categorie_hotel : VACHAR(50)
-capacite_hotel : SMALLINT (NOT NULL)
-nom_hotel : VARCHAR(50) (NOT NULL)
-adresse_hotel : VARCHAR(100) (NOT NULL)
-num station : INT (clé étrangère) FK

**Chambre**
-num chambre : INT (clé primaire) PK
-capacite_chambre : SMALLINT (NOT NULL)
-degre_confort : FLOAT 
-exposition : VARCHAR(100) 