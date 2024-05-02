-- Suppression de la base de données si elle existe déjà
DROP DATABASE IF EXISTS exercice2;

-- Création de la base de données
CREATE DATABASE exercice2;

-- Sélection de la base de données créée
USE exercice2;

-- Création de la table Station
CREATE TABLE Station (
    num_station INT AUTO_INCREMENT PRIMARY KEY,
    nom_station VARCHAR(50) NOT NULL
);

-- Création de la table Hotel
CREATE TABLE Hotel (
    num_hotel INT AUTO_INCREMENT PRIMARY KEY,
    categorie_hotel VARCHAR(50),
    capacite_hotel INT NOT NULL,
    nom_hotel VARCHAR(50) NOT NULL,
    adresse_hotel VARCHAR(100) NOT NULL,
    num_station INT NOT NULL,
    FOREIGN KEY (num_station) REFERENCES Station(num_station)
);

-- Création de la table Chambre
CREATE TABLE Chambre (
    num_chambre INT AUTO_INCREMENT PRIMARY KEY,
    capacite_chambre SMALLINT NOT NULL,
    degre_confort DECIMAL(5,2),
    exposition VARCHAR(100),
    type_chambre VARCHAR(50) NOT NULL,
    num_hotel INT NOT NULL,
    FOREIGN KEY (num_hotel) REFERENCES Hotel(num_hotel)
);

-- Création de la table Client
CREATE TABLE Client (
    num_client INT AUTO_INCREMENT PRIMARY KEY,
    nom_client VARCHAR(50) NOT NULL,
    prenom_client VARCHAR(50) NOT NULL,
    adresse_client VARCHAR(100) NOT NULL
);

-- Création de la table Reservation
CREATE TABLE Reservation (
    num_reservation INT AUTO_INCREMENT PRIMARY KEY,
    date_debut DATE NOT NULL,
    date_fin DATE NOT NULL,
    date_reservation DATE NOT NULL,
    montant_arrhes DECIMAL(5,2) NOT NULL,
    prix_total DECIMAL(15,2),
    num_chambre INT NOT NULL,
    num_client INT NOT NULL,
    FOREIGN KEY (num_chambre) REFERENCES Chambre(num_chambre),
    FOREIGN KEY (num_client) REFERENCES Client(num_client)
);

-- Insérer des stations
INSERT INTO Station (nom_station) VALUES 
('Station A'),
('Station B'),
('Station C');

-- Insérer des hôtels pour chaque station
-- Station A
INSERT INTO Hotel (categorie_hotel, capacite_hotel, nom_hotel, adresse_hotel, num_station) VALUES 
('3 étoiles', 50, 'Hôtel A1', 'Adresse A1, Station A', 1),
('4 étoiles', 80, 'Hôtel A2', 'Adresse A2, Station A', 1),
('2 étoiles', 30, 'Hôtel A3', 'Adresse A3, Station A', 1);

-- Station B
INSERT INTO Hotel (categorie_hotel, capacite_hotel, nom_hotel, adresse_hotel, num_station) VALUES 
('5 étoiles', 100, 'Hôtel B1', 'Adresse B1, Station B', 2),
('3 étoiles', 60, 'Hôtel B2', 'Adresse B2, Station B', 2),
('4 étoiles', 40, 'Hôtel B3', 'Adresse B3, Station B', 2);

-- Station C
INSERT INTO Hotel (categorie_hotel, capacite_hotel, nom_hotel, adresse_hotel, num_station) VALUES 
('3 étoiles', 70, 'Hôtel C1', 'Adresse C1, Station C', 3),
('4 étoiles', 90, 'Hôtel C2', 'Adresse C2, Station C', 3),
('2 étoiles', 50, 'Hôtel C3', 'Adresse C3, Station C', 3);

-- Insérer des chambres pour chaque hôtel
-- Hôtel A1
INSERT INTO Chambre (capacite_chambre, degre_confort, exposition, type_chambre, num_hotel) VALUES 
(2, 8.5, 'Vue sur la mer', 'Double', 1),
(1, 7.8, 'Vue sur la ville', 'Simple', 1),
(3, 9.2, 'Vue sur la montagne', 'Triple', 1);

-- Hôtel A2
INSERT INTO Chambre (capacite_chambre, degre_confort, exposition, type_chambre, num_hotel) VALUES 
(2, 9.0, 'Vue sur la mer', 'Double', 2),
(1, 8.2, 'Vue sur la ville', 'Simple', 2),
(3, 9.5, 'Vue sur la montagne', 'Triple', 2);

-- Hôtel A3
INSERT INTO Chambre (capacite_chambre, degre_confort, exposition, type_chambre, num_hotel) VALUES 
(2, 7.5, 'Vue sur la mer', 'Double', 3),
(1, 6.8, 'Vue sur la ville', 'Simple', 3),
(3, 8.2, 'Vue sur la montagne', 'Triple', 3);

-- Répéter le même processus pour les autres hôtels et chambres
