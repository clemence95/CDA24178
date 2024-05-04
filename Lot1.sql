-- Sélectionner la base de données exemple pour y effectuer les opérations suivantes
use hotel;
-- Afficher la liste des hôtels avec le nom de l’hôtel et la ville :
SELECT hot_nom, hot_ville
FROM hotel;
-- Afficher la ville de résidence de Mr White avec son nom, prénom et adresse :
SELECT cli_nom, cli_prenom, cli_adresse, cli_ville
FROM client
WHERE cli_nom = 'White';
-- Afficher la liste des stations dont l’altitude est inférieure à 1000, avec le nom de la station et son altitude : 
SELECT sta_nom, sta_altitude
FROM station
WHERE sta_altitude < 1000;
-- Affiche la liste des chambres ayant une capacité supérieure à 1, avec le numéro de la chambre et sa capacité 
SELECT DISTINCT cha_numero, cha_capacite
FROM chambre
WHERE cha_capacite > 1;
-- Afficher les clients n’habitants pas à Londres, avec le nom du client et sa ville
SELECT cli_nom, cli_ville
FROM client
WHERE cli_ville != 'Londre';
-- Afficher la liste des hôtels situés dans la ville de Bretou et ayant une catégorie supérieure à 3, avec le nom de l'hôtel, la ville et la catégorie :
SELECT hot_nom, hot_ville, hot_categorie
FROM hotel
WHERE hot_ville = 'Bretou' AND hot_categorie > 3;

