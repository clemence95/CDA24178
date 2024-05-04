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

