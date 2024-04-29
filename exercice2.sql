-- Suppression de la base de données si elle existe déjà
DROP DATABASE IF EXISTS exercice2;

-- Création de la base de données
CREATE DATABASE exercice2;

-- Sélection de la base de données créée
USE exercice2;

-- Création de la table Station
CREATE TABLE Station (
    num_station INT AUTO_INCREMENT PRIMARY KEY,
    nom_station VARCHAR(50) NOT NULL,
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
    type_chambre VARCHAR(50),
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
