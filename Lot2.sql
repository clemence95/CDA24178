-- Sélectionner la base de données exemple pour y effectuer les opérations suivantes
use hotel;
-- Affiche la liste des hôtels avec leur station 
-- Le résultat doit faire apparaître le nom de la station, le nom de l’hôtel, la catégorie, la ville)
SELECT s.sta_nom AS station,
       h.hot_nom AS hotel,
       h.hot_categorie AS categorie,
       h.hot_ville AS ville
FROM hotel h
JOIN station s ON h.hot_sta_id = s.sta_id;
