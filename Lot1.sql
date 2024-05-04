-- Sélectionner la base de données exemple pour y effectuer les opérations suivantes
use hotel;
-- Afficher la liste des hôtels avec le nom de l’hôtel et la ville :
SELECT hot_nom, hot_ville
FROM hotel;
-- Afficher la ville de résidence de Mr White avec son nom, prénom et adresse :
SELECT cli_nom, cli_prenom, cli_adresse
FROM client
WHERE cli_nom = 'White';
