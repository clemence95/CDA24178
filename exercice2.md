## Dictionnaire de données

**Station**
-num station : INT AUTO_INCREMENT (clé primaire) PK
-nom_station : VARCHAR(50) (NOT NULL)

**Hotel**
-num hotel : INT AUTO_INCREMENT  (clé primaire) PK
-categorie_hotel : VACHAR(50)
-capacite_hotel : SMALLINT (NOT NULL)
-nom_hotel : VARCHAR(50) (NOT NULL)
-adresse_hotel : VARCHAR(100) (NOT NULL)
-num station : INT (clé étrangère) FK

**Chambre**
-num chambre : INT AUTO_INCREMENT (clé primaire) PK
-capacite_chambre : SMALLINT (NOT NULL)
-degre_confort : FLOAT 
-exposition : VARCHAR(100) 
-type_chambre : VARCHAR(50)
-num_hotel : INT (clé étrangère) FK

**Client** 
-num client : INT AUTO_INCREMENT (clé primaire) PK
-nom_client : VARCHAR(50) (NOT NULL)
-prenom_client : VARCHAR(50) (NOT NULL)
-adresse_client : VARCHAR(100) (NOT NULL)

**Reservation**
-num chambre : INT AUTO_INCREMENT (clé primaire) PK
-date_debut : DATE (NOT NULL)
-date_fin : DATE (NOT NULL)
-date_reservation : DATE (NOT NULL)
-montant_arrhes : DECIMAL (5,2) (NOT NULL)
-prix_total : DECIMAL(15,2)
num client : INT (clé étrangère) FK
