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
--  Affiche la liste des chambres et leur hôtel. Le résultat doit faire apparaître le nom de l’hôtel, la catégorie,
-- la ville, le numéro de la chambre)
SELECT h.hot_nom AS hotel,
       h.hot_categorie AS categorie,
       h.hot_ville AS ville,
       c.cha_numero AS numero_chambre
FROM chambre c
JOIN hotel h ON c.cha_hot_id = h.hot_id;
-- Affiche la liste des chambres de plus d'une place dans des hôtels situés sur la ville de Bretou.
-- Le résultat doit faire apparaître le nom de l’hôtel, la catégorie, la ville, le numéro de la chambre et sa capacité)
SELECT h.hot_nom AS hotel,
       h.hot_categorie AS categorie,
       h.hot_ville AS ville,
       c.cha_numero AS numero_chambre,
       c.cha_capacite AS capacite
FROM chambre c
JOIN hotel h ON c.cha_hot_id = h.hot_id
WHERE h.hot_ville = 'Bretou' AND c.cha_capacite > 1;
