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
