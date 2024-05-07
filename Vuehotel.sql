-- Sélectionner la base de données exemple pour y effectuer les opérations suivantes
USE hotel;
-- Afficher la liste des hôtels avec leur station :
CREATE VIEW Vue_Hotels_Station AS
SELECT h.hot_id, h.hot_nom, h.hot_adresse, h.hot_ville, s.sta_nom AS station_nom
FROM hotel h
INNER JOIN station s ON h.hot_sta_id = s.sta_id;
-- Afficher la liste des chambres et leur hôtel :
CREATE VIEW Vue_Chambres_Hotel AS
SELECT c.cha_id, c.cha_numero, c.cha_capacite, c.cha_type, h.hot_nom AS hotel_nom
FROM chambre c
INNER JOIN hotel h ON c.cha_hot_id = h.hot_id;
