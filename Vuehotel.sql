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
-- Afficher la liste des réservations avec le nom des clients :
CREATE VIEW Vue_Reservations_Clients AS
SELECT r.res_id, r.res_date, r.res_date_debut, r.res_date_fin, r.res_prix, r.res_arrhes,
       c.cli_nom, c.cli_prenom
FROM reservation r
INNER JOIN client c ON r.res_cli_id = c.cli_id;
-- Afficher la liste des chambres avec le nom de l’hôtel et le nom de la station :
CREATE VIEW Vue_Chambres_Hotel_Station AS
SELECT c.cha_id, c.cha_numero, c.cha_capacite, c.cha_type, h.hot_nom AS hotel_nom, s.sta_nom AS station_nom
FROM chambre c
INNER JOIN hotel h ON c.cha_hot_id = h.hot_id
INNER JOIN station s ON h.hot_sta_id = s.sta_id;
-- Afficher les réservations avec le nom du client et le nom de l’hôtel :
CREATE VIEW Vue_Reservations_Client_Hotel AS
SELECT r.res_id, r.res_date, r.res_date_debut, r.res_date_fin, r.res_prix, r.res_arrhes,
       c.cli_nom, c.cli_prenom, h.hot_nom AS hotel_nom
FROM reservation r
INNER JOIN client c ON r.res_cli_id = c.cli_id
INNER JOIN chambre ch ON r.res_cha_id = ch.cha_id
INNER JOIN hotel h ON ch.cha_hot_id = h.hot_id;
-- Afficher la liste des hôtels avec leur station
SELECT * FROM Vue_Hotels_Station;

-- Afficher la liste des chambres et leur hôtel
SELECT * FROM Vue_Chambres_Hotel;

-- Afficher la liste des réservations avec le nom des clients
SELECT * FROM Vue_Reservations_Clients;

-- Afficher la liste des chambres avec le nom de l’hôtel et le nom de la station
SELECT * FROM Vue_Chambres_Hotel_Station;

-- Afficher les réservations avec le nom du client et le nom de l’hôtel
SELECT * FROM Vue_Reservations_Client_Hotel;
