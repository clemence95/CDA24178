-- Sélectionner la base de données exemple pour y effectuer les opérations suivantes
use hotel;
--  Compte le nombre d’hôtel par station
SELECT s.sta_nom AS nom_station, COUNT(*) AS nombre_hotels
FROM hotel h
JOIN station s ON h.hot_sta_id = s.sta_id
GROUP BY s.sta_nom;
