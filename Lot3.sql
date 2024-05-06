-- Sélectionner la base de données exemple pour y effectuer les opérations suivantes
use hotel;
--  Compte le nombre d’hôtel par station
SELECT s.sta_nom AS nom_station, COUNT(*) AS nombre_hotels
FROM hotel h
JOIN station s ON h.hot_sta_id = s.sta_id
GROUP BY s.sta_nom;
-- Compte le nombre de chambre par station
SELECT s.sta_nom AS nom_station, COUNT(*) AS nombre_chambres
FROM chambre c
JOIN hotel h ON c.cha_hot_id = h.hot_id
JOIN station s ON h.hot_sta_id = s.sta_id
GROUP BY s.sta_nom;
-- Compte le nombre de chambre par station ayant une capacité > 1
SELECT s.sta_nom AS nom_station, COUNT(*) AS nombre_chambres
FROM chambre c
JOIN hotel h ON c.cha_hot_id = h.hot_id
JOIN station s ON h.hot_sta_id = s.sta_id
WHERE c.cha_capacite > 1
GROUP BY s.sta_nom;
-- Affiche la liste des hôtels pour lesquels Mr Squire a effectué une réservation
SELECT DISTINCT h.hot_nom AS nom_hotel
FROM reservation res
JOIN client cl ON res.res_cli_id = cl.cli_id
JOIN chambre cha ON res.res_cha_id = cha.cha_id
JOIN hotel h ON cha.cha_hot_id = h.hot_id
WHERE cl.cli_nom = 'Squire';

